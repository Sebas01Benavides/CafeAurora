import os, psycopg2
from fastapi import FastAPI

app = FastAPI()

def get_db():
    return psycopg2.connect(
        host=os.getenv("DB_HOST", "postgres-service"),
        database=os.getenv("DB_NAME", "aurora_db"),
        user=os.getenv("DB_USER", "postgres"),
        password=os.getenv("DB_PASS", "AuroraPass123")
    )

@app.get("/healthz")
@app.get("/api/catalog/healthz")
def healthz():
    return {"status": "ok"}

@app.get("/api/catalog")
def list_products():
    conn = get_db()
    cur = conn.cursor()
    cur.execute("SELECT id, name, price, stock, description FROM products;")
    rows = cur.fetchall()
    cur.close()
    conn.close()
    return [{"id": r[0], "name": r[1], "price": float(r[2]), "stock": r[3], "description": r[4]} for r in rows]
