--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Debian 12.9-1.pgdg110+1)
-- Dumped by pg_dump version 12.9 (Debian 12.9-1.pgdg110+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: basket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basket (
    id integer NOT NULL,
    quantity integer NOT NULL,
    price_one integer NOT NULL,
    price_total integer NOT NULL,
    product_id_id integer
);


ALTER TABLE public.basket OWNER TO postgres;

--
-- Name: basket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.basket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.basket_id_seq OWNER TO postgres;

--
-- Name: doctrine_migration_versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctrine_migration_versions (
    version character varying(191) NOT NULL,
    executed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    execution_time integer
);


ALTER TABLE public.doctrine_migration_versions OWNER TO postgres;

--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(1000) DEFAULT NULL::character varying,
    is_show boolean NOT NULL,
    price integer,
    basket_id integer,
    image character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    role_name character varying(255) NOT NULL,
    status boolean NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    email character varying(180) NOT NULL,
    roles json NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Name: user_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_role (
    user_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.user_role OWNER TO postgres;

--
-- Data for Name: basket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.basket (id, quantity, price_one, price_total, product_id_id) FROM stdin;
\.


--
-- Data for Name: doctrine_migration_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
DoctrineMigrations\\Version20211219152814	2021-12-19 15:28:48	85
DoctrineMigrations\\Version20211219210920	2021-12-19 21:09:40	73
DoctrineMigrations\\Version20211221104634	2021-12-21 10:59:55	58
DoctrineMigrations\\Version20211221110133	2021-12-21 11:01:41	36
DoctrineMigrations\\Version20211222122412	2022-01-02 18:17:05	140
DoctrineMigrations\\Version20220102181653	2022-01-02 18:17:05	9
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, name, description, is_show, price, basket_id, image) FROM stdin;
6	Кузьмич	32 см, Томат, зелень, два вида колбасы, маринованные огурцы, сыр, пышное тесто, чесночночный соус	t	269	\N	img/pizza_3.jpg
5	Деревенская	32 см, Пикантный томатный соус, копченая куриная грудинка, ветчина, томаты, маринованные огурчики, зелень, сыр, пышное тесто	t	350	\N	img/pizza_2.jpg
7	Моцарелла	32 см, Пикантный томатный соус, сыр, салями, колбаски охотничьи, огурцы маринованные, лук репчатый, сушеный базилик	t	404	\N	img/pizza_4.jpg
9	С мятой	32 см, Томат, зелень, два вида колбасы, маринованные огурцы, сыр, пышное тесто, чесночночный соус	t	330	\N	img/pizza_5.jpg
8	Ассорти	32 см, Томат, зелень, два вида колбасы, маринованные огурцы, сыр, пышное тесто, чесночночный соус.	t	590	\N	img/pizza_6.jpg
4	Ягодица	32 см, Пикантный томатный соус, сыр, салями, колбаски охотничьи, огурцы маринованные, лук репчатый, сушеный базилик	t	520	\N	img/pizza_1.jpg
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, name, role_name, status) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, email, roles, password) FROM stdin;
22	user@user.ru	[]	$2y$13$cc/23EHghF/R1Awsb7ZEMOOLqgkEeDrgBxWDSNwYWiNW/6LR7VLE.
23	admin@admin.ru	["ROLE_USER","ROLE_ADMIN"]	$2y$13$I2IaO0.UOPYSiUVrfdm62OKzLhOPrXEI4cby/y8VaSpRwXG1UeDVC
\.


--
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_role (user_id, role_id) FROM stdin;
\.


--
-- Name: basket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.basket_id_seq', 3, true);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 9, true);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 23, true);


--
-- Name: basket basket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket
    ADD CONSTRAINT basket_pkey PRIMARY KEY (id);


--
-- Name: doctrine_migration_versions doctrine_migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: idx_2246507bde18e50b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_2246507bde18e50b ON public.basket USING btree (product_id_id);


--
-- Name: idx_2de8c6a3a76ed395; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_2de8c6a3a76ed395 ON public.user_role USING btree (user_id);


--
-- Name: idx_2de8c6a3d60322ac; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_2de8c6a3d60322ac ON public.user_role USING btree (role_id);


--
-- Name: idx_d34a04ad1be1fb52; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_d34a04ad1be1fb52 ON public.product USING btree (basket_id);


--
-- Name: uniq_8d93d649e7927c74; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_8d93d649e7927c74 ON public."user" USING btree (email);


--
-- Name: basket fk_2246507bde18e50b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket
    ADD CONSTRAINT fk_2246507bde18e50b FOREIGN KEY (product_id_id) REFERENCES public.product(id);


--
-- Name: user_role fk_2de8c6a3a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fk_2de8c6a3a76ed395 FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- Name: user_role fk_2de8c6a3d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fk_2de8c6a3d60322ac FOREIGN KEY (role_id) REFERENCES public.role(id) ON DELETE CASCADE;


--
-- Name: product fk_d34a04ad1be1fb52; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk_d34a04ad1be1fb52 FOREIGN KEY (basket_id) REFERENCES public.basket(id);


--
-- PostgreSQL database dump complete
--

