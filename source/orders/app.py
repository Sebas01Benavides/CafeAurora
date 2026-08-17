import os, psycopg2
from fastapi import FastAPI
from pydantic import BaseModel
from typing import List

app = FastAPI()

def get_db():
    return psycopg2.connect(
        host=os.getenv("DB_HOST", "postgres-service"),
        database=os.getenv("DB_NAME", "aurora_db"),
        user=os.getenv("DB_USER", "postgres"),
        password=os.getenv("DB_PASS", "AuroraPass123")
    )

class OrderItem(BaseModel):
    id_catalog: int
    quantity: int

class OrderCreate(BaseModel):
    items: List[OrderItem]

@app.get("/healthz")
def healthz():
    return {"status": "ok"}

@app.post("/api/orders")
def create_order(order: OrderCreate):
    conn = get_db()
    cur = conn.cursor()
    total = 0.0
    for item in order.items:
        cur.execute("SELECT price FROM products WHERE id = %s;", (item.id_catalog,))
        res = cur.fetchone()
        price = float(res[0]) if res else 1000.0
        total += price * item.quantity
    
    cur.execute("INSERT INTO orders (total) VALUES (%s) RETURNING id;", (total,))
    order_id = cur.fetchone()[0]
    conn.commit()
    cur.close()
    conn.close()
    return {"order_id": order_id, "total": total, "status": "created"}
