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

class OrderCreate(BaseModel):
    customer_id: int
    product_id: int
    quantity: int

@app.get("/healthz")
@app.get("/api/orders/healthz")
def healthz():
    return {"status": "ok"}

@app.post("/api/orders")
def create_order(o: OrderCreate):
    conn = get_db()
    cur = conn.cursor()
    cur.execute(
        "INSERT INTO orders (customer_id, product_id, quantity, status) VALUES (%s, %s, %s, 'CREATED') RETURNING id;",
        (o.customer_id, o.product_id, o.quantity)
    )
    new_id = cur.fetchone()[0]
    conn.commit()
    cur.close()
    conn.close()
    return {"id": new_id, "customer_id": o.customer_id, "product_id": o.product_id, "quantity": o.quantity, "status": "CREATED"}

@app.get("/api/orders")
def list_orders():
    conn = get_db()
    cur = conn.cursor()
    cur.execute("SELECT id, customer_id, product_id, quantity, status FROM orders;")
    rows = cur.fetchall()
    cur.close()
    conn.close()
    return [
        {
            "id": r[0],
            "customer_id": r[1],
            "product_id": r[2],
            "quantity": r[3],
            "status": r[4] if r[4] else "CREATED"
        }
        for r in rows
    ]
