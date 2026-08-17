import os, psycopg2
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

def get_db():
    return psycopg2.connect(
        host=os.getenv("DB_HOST", "postgres-service"),
        database=os.getenv("DB_NAME", "aurora_db"),
        user=os.getenv("DB_USER", "postgres"),
        password=os.getenv("DB_PASS", "AuroraPass123")
    )

class ProductCreate(BaseModel):
    name: str
    price: float
    stock: int
    description: str

@app.get("/healthz")
def healthz():
    return {"status": "ok"}

@app.get("/api/catalog")
def get_products():
    conn = get_db()
    cur = conn.cursor()
    cur.execute("SELECT id, name, price, stock, description FROM products;")
    rows = cur.fetchall()
    cur.close()
    conn.close()
    return [{"id": r[0], "name": r[1], "price": float(r[2]), "stock": r[3], "description": r[4]} for r in rows]

@app.post("/api/catalog")
def add_product(p: ProductCreate):
    conn = get_db()
    cur = conn.cursor()
    cur.execute("INSERT INTO products (name, price, stock, description) VALUES (%s, %s, %s, %s) RETURNING id;", (p.name, p.price, p.stock, p.description))
    new_id = cur.fetchone()[0]
    conn.commit()
    cur.close()
    conn.close()
    return {"id": new_id, **p.dict()}
