--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: scammers; Type: TABLE; Schema: public; Owner: rogon; Tablespace: 
--

CREATE TABLE scammers (
    id integer NOT NULL,
    name text,
    email text,
    phone text,
    bank_name text,
    bank_account_no text,
    country text,
    comment text,
    reported_on timestamp without time zone,
    submitted_by_ip text,
    ref_website text
);


ALTER TABLE public.scammers OWNER TO rogon;

--
-- Name: scammers_id_seq; Type: SEQUENCE; Schema: public; Owner: rogon
--

CREATE SEQUENCE scammers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scammers_id_seq OWNER TO rogon;

--
-- Name: scammers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rogon
--

ALTER SEQUENCE scammers_id_seq OWNED BY scammers.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rogon
--

ALTER TABLE ONLY scammers ALTER COLUMN id SET DEFAULT nextval('scammers_id_seq'::regclass);


--
-- Data for Name: scammers; Type: TABLE DATA; Schema: public; Owner: rogon
--

COPY scammers (id, name, email, phone, bank_name, bank_account_no, country, comment, reported_on, submitted_by_ip, ref_website) FROM stdin;
1	saqib hussain cheema b saim	saimmj81@gmail.com	+60172964533	Standard Chartered Bank	312194916977	MY	selling macbook on mudah.my claim to be a good muslim from india with 8 months pregnant wife	2016-11-11 22:02:15.565692	\N	mudah.my
\.


--
-- Name: scammers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rogon
--

SELECT pg_catalog.setval('scammers_id_seq', 1, true);


--
-- Name: scammers_pkey; Type: CONSTRAINT; Schema: public; Owner: rogon; Tablespace: 
--

ALTER TABLE ONLY scammers
    ADD CONSTRAINT scammers_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

