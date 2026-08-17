--
-- PostgreSQL database dump
--

\restrict 7OpPsAsHaSCaltmn1Eqbz3M2obxrVysEZepA2UEXbVvVVBjdcdbHUAV190djbfT

-- Dumped from database version 15.19
-- Dumped by pg_dump version 15.19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.products DROP CONSTRAINT IF EXISTS products_pkey;
ALTER TABLE IF EXISTS ONLY public.orders DROP CONSTRAINT IF EXISTS orders_pkey;
ALTER TABLE IF EXISTS ONLY public.customers DROP CONSTRAINT IF EXISTS customers_pkey;
ALTER TABLE IF EXISTS public.products ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.orders ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.customers ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.products_id_seq;
DROP TABLE IF EXISTS public.products;
DROP SEQUENCE IF EXISTS public.orders_id_seq;
DROP TABLE IF EXISTS public.orders;
DROP SEQUENCE IF EXISTS public.customers_id_seq;
DROP TABLE IF EXISTS public.customers;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    name character varying(100),
    email character varying(100),
    identity_encrypted text
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    total numeric(10,2),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(100),
    price numeric(10,2),
    stock integer,
    description text
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, name, email, identity_encrypted) FROM stdin;
1	Cliente 1	cliente1@aurora.cr	gAAAAABnxABC123_MOCK_ENCRYPTED_DATA_SEED_1
2	Cliente 2	cliente2@aurora.cr	gAAAAABnxABC123_MOCK_ENCRYPTED_DATA_SEED_2
3	Cliente 3	cliente3@aurora.cr	gAAAAABnxABC123_MOCK_ENCRYPTED_DATA_SEED_3
4	Cliente 4	cliente4@aurora.cr	gAAAAABnxABC123_MOCK_ENCRYPTED_DATA_SEED_4
5	Cliente 5	cliente5@aurora.cr	gAAAAABnxABC123_MOCK_ENCRYPTED_DATA_SEED_5
6	Cliente 6	cliente6@aurora.cr	gAAAAABnxABC123_MOCK_ENCRYPTED_DATA_SEED_6
7	Cliente 7	cliente7@aurora.cr	gAAAAABnxABC123_MOCK_ENCRYPTED_DATA_SEED_7
8	Cliente 8	cliente8@aurora.cr	gAAAAABnxABC123_MOCK_ENCRYPTED_DATA_SEED_8
9	Cliente 9	cliente9@aurora.cr	gAAAAABnxABC123_MOCK_ENCRYPTED_DATA_SEED_9
10	Cliente 10	cliente10@aurora.cr	gAAAAABnxABC123_MOCK_ENCRYPTED_DATA_SEED_10
11	Cliente 11	cliente11@aurora.cr	gAAAAABnxABC123_MOCK_ENCRYPTED_DATA_SEED_11
12	Cliente 12	cliente12@aurora.cr	gAAAAABnxABC123_MOCK_ENCRYPTED_DATA_SEED_12
13	Cliente 13	cliente13@aurora.cr	gAAAAABnxABC123_MOCK_ENCRYPTED_DATA_SEED_13
14	Cliente 14	cliente14@aurora.cr	gAAAAABnxABC123_MOCK_ENCRYPTED_DATA_SEED_14
15	Cliente 15	cliente15@aurora.cr	gAAAAABnxABC123_MOCK_ENCRYPTED_DATA_SEED_15
16	Carlos Ruiz	cruiz@test.cr	gAAAAABqg39p-WmKXtMIonkqPH2IxTZMKbzNohGh_RiQcVe3q0MDpEhgaHnuv4LtNIsEFlssOVZwq6B-UxXLngySOGm2KEXK0A==
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, total, created_at) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, price, stock, description) FROM stdin;
1	Producto Cafe 1	250.00	16	Descripcion de Cafe Aurora lote 1
2	Producto Cafe 2	500.00	17	Descripcion de Cafe Aurora lote 2
3	Producto Cafe 3	750.00	18	Descripcion de Cafe Aurora lote 3
4	Producto Cafe 4	1000.00	19	Descripcion de Cafe Aurora lote 4
5	Producto Cafe 5	1250.00	20	Descripcion de Cafe Aurora lote 5
6	Producto Cafe 6	1500.00	21	Descripcion de Cafe Aurora lote 6
7	Producto Cafe 7	1750.00	22	Descripcion de Cafe Aurora lote 7
8	Producto Cafe 8	2000.00	23	Descripcion de Cafe Aurora lote 8
9	Producto Cafe 9	2250.00	24	Descripcion de Cafe Aurora lote 9
10	Producto Cafe 10	2500.00	25	Descripcion de Cafe Aurora lote 10
11	Producto Cafe 11	2750.00	26	Descripcion de Cafe Aurora lote 11
12	Producto Cafe 12	3000.00	27	Descripcion de Cafe Aurora lote 12
13	Producto Cafe 13	3250.00	28	Descripcion de Cafe Aurora lote 13
14	Producto Cafe 14	3500.00	29	Descripcion de Cafe Aurora lote 14
15	Producto Cafe 15	3750.00	30	Descripcion de Cafe Aurora lote 15
16	Producto Cafe 16	4000.00	31	Descripcion de Cafe Aurora lote 16
17	Producto Cafe 17	4250.00	32	Descripcion de Cafe Aurora lote 17
18	Producto Cafe 18	4500.00	33	Descripcion de Cafe Aurora lote 18
19	Producto Cafe 19	4750.00	34	Descripcion de Cafe Aurora lote 19
20	Producto Cafe 20	5000.00	35	Descripcion de Cafe Aurora lote 20
21	Producto Cafe 21	5250.00	36	Descripcion de Cafe Aurora lote 21
22	Producto Cafe 22	5500.00	37	Descripcion de Cafe Aurora lote 22
23	Producto Cafe 23	5750.00	38	Descripcion de Cafe Aurora lote 23
24	Producto Cafe 24	6000.00	39	Descripcion de Cafe Aurora lote 24
25	Producto Cafe 25	6250.00	40	Descripcion de Cafe Aurora lote 25
26	Producto Cafe 26	6500.00	41	Descripcion de Cafe Aurora lote 26
27	Producto Cafe 27	6750.00	42	Descripcion de Cafe Aurora lote 27
28	Producto Cafe 28	7000.00	43	Descripcion de Cafe Aurora lote 28
29	Producto Cafe 29	7250.00	44	Descripcion de Cafe Aurora lote 29
30	Producto Cafe 30	7500.00	45	Descripcion de Cafe Aurora lote 30
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 16, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 30, true);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict 7OpPsAsHaSCaltmn1Eqbz3M2obxrVysEZepA2UEXbVvVVBjdcdbHUAV190djbfT

