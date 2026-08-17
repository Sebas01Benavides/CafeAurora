import os, psycopg2
from fastapi import FastAPI
from pydantic import BaseModel
from cryptography.fernet import Fernet

app = FastAPI()
KEY = os.getenv("ENCRYPTION_KEY", "vMY9ZJ1l4E_uE5V3L7y4L6gU8ZJ1l4E_uE5V3L7y4L4=")
cipher = Fernet(KEY.encode())

def get_db():
    return psycopg2.connect(
        host=os.getenv("DB_HOST", "postgres-service"),
        database=os.getenv("DB_NAME", "aurora_db"),
        user=os.getenv("DB_USER", "postgres"),
        password=os.getenv("DB_PASS", "AuroraPass123")
    )

class CustomerCreate(BaseModel):
    name: str
    email: str
    identity_number: str

@app.get("/healthz")
@app.get("/api/customers/healthz")
def healthz():
    return {"status": "ok"}

@app.post("/api/customers")
def create_customer(c: CustomerCreate):
    enc_id = cipher.encrypt(c.identity_number.encode()).decode()
    conn = get_db()
    cur = conn.cursor()
    cur.execute("INSERT INTO customers (name, email, identity_encrypted) VALUES (%s, %s, %s) RETURNING id;", (c.name, c.email, enc_id))
    new_id = cur.fetchone()[0]
    conn.commit()
    cur.close()
    conn.close()
    return {"id": new_id, "name": c.name, "email": c.email, "identity_number": c.identity_number}

@app.get("/api/customers")
def list_customers():
    conn = get_db()
    cur = conn.cursor()
    cur.execute("SELECT id, name, email, identity_encrypted FROM customers;")
    rows = cur.fetchall()
    cur.close()
    conn.close()
    res = []
    for r in rows:
        try:
            dec_id = cipher.decrypt(r[3].encode()).decode() if r[3] else ""
        except Exception:
            dec_id = r[3]
        res.append({"id": r[0], "name": r[1], "email": r[2], "identity_number": dec_id})
    return res
