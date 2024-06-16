--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg110+1)
-- Dumped by pg_dump version 16.0

-- Started on 2024-06-16 14:25:39

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
-- TOC entry 214 (class 1259 OID 16389)
-- Name: doctrine_migration_versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctrine_migration_versions (
    version character varying(191) NOT NULL,
    executed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    execution_time integer
);


ALTER TABLE public.doctrine_migration_versions OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16396)
-- Name: post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    type character varying(255) NOT NULL,
    date timestamp(0) without time zone NOT NULL,
    image_path character varying(255) NOT NULL
);


ALTER TABLE public.post OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16395)
-- Name: post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_id_seq OWNER TO postgres;

--
-- TOC entry 3327 (class 0 OID 16389)
-- Dependencies: 214
-- Data for Name: doctrine_migration_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
DoctrineMigrations\\Version20240615201519	2024-06-16 11:11:37	20
DoctrineMigrations\\Version20240616085318	2024-06-16 11:11:37	3
\.


--
-- TOC entry 3329 (class 0 OID 16396)
-- Dependencies: 216
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post (id, title, description, type, date, image_path) FROM stdin;
1	Изготовленный Зурабом Церетели памятник Тихону Хренникову открыли в Ельце	Новая достопримечательность появилась в Ельце. Здесь открыли памятник композитору Тихону Хренникову. В этом году исполняется 110 лет со дня его рождения. Двухтонная скульптура полностью из бронзы. Её создал народный художник СССР и России, президент Российской академии художеств Зураб Церетели. Это первая его работа, установленная в Липецкой области.	Общество	2024-02-03 21:00:00	img1.png
2	Липецк признан беговой столицей России 2023 года	Липецк признан беговой столицей России 2023 года по итогам полумарафона «Забег.рф». В Липецке было 4000 участников забега, которые показали лучший результат в России, набрав 29,34 итоговых зачетных балла. Данный показатель высчитывался исходя из следующих показателей: средней дистанции, преодоленной всеми участниками субъекта, соотношению участников «Забега.рф» к его населению, а также по средней скорости бега. На втором месте оказался Магадан, он набрал 27,45 балла, на третьем — Санкт-Петербург, у него 21,55 балла	Спорт	2024-05-05 21:00:00	img2.png
4	Игорь Артамонов посетил белгородцев в липецком пункте временного размещения	Губернатор Липецкой области Игорь Артамонов, как и обещал ранее, посетил пункт временного размещения, в котором сейчас находятся жители Шебекинского района Белгородской области. В основном это семьи с детьми. Им предоставлены номера гостиничного типа.	Общество	2024-06-16 13:00:00	img4.png
3	Электрокар EVOLUTE из Липецкой области признан электромобильным брендом № 1 в России	Электрокар под маркой EVOLUTE вновь подтвердил звание «Электромобиля № 1» в России по результатам мая 2023 года. На регистрационный учёт в минувшем месяце встало 167 таких электрокаров, что превысило 21% всех регистраций в сегменте электрического транспорта.	Экономика	2024-06-06 14:00:00	img3.png
\.


--
-- TOC entry 3335 (class 0 OID 0)
-- Dependencies: 215
-- Name: post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_id_seq', 1, false);


--
-- TOC entry 3182 (class 2606 OID 16394)
-- Name: doctrine_migration_versions doctrine_migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);


--
-- TOC entry 3184 (class 2606 OID 16402)
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);


-- Completed on 2024-06-16 14:25:40

--
-- PostgreSQL database dump complete
--

