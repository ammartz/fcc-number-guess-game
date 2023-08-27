--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    tries integer,
    user_id integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    name character varying(25),
    user_id integer NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (17, 46);
INSERT INTO public.games VALUES (338, 47);
INSERT INTO public.games VALUES (945, 48);
INSERT INTO public.games VALUES (677, 47);
INSERT INTO public.games VALUES (37, 47);
INSERT INTO public.games VALUES (697, 47);
INSERT INTO public.games VALUES (451, 49);
INSERT INTO public.games VALUES (921, 50);
INSERT INTO public.games VALUES (736, 49);
INSERT INTO public.games VALUES (486, 49);
INSERT INTO public.games VALUES (583, 49);
INSERT INTO public.games VALUES (130, 51);
INSERT INTO public.games VALUES (393, 52);
INSERT INTO public.games VALUES (975, 51);
INSERT INTO public.games VALUES (260, 51);
INSERT INTO public.games VALUES (115, 51);
INSERT INTO public.games VALUES (944, 53);
INSERT INTO public.games VALUES (803, 54);
INSERT INTO public.games VALUES (159, 53);
INSERT INTO public.games VALUES (140, 53);
INSERT INTO public.games VALUES (425, 53);
INSERT INTO public.games VALUES (810, 55);
INSERT INTO public.games VALUES (770, 56);
INSERT INTO public.games VALUES (361, 55);
INSERT INTO public.games VALUES (52, 55);
INSERT INTO public.games VALUES (806, 55);
INSERT INTO public.games VALUES (34, 58);
INSERT INTO public.games VALUES (730, 58);
INSERT INTO public.games VALUES (739, 59);
INSERT INTO public.games VALUES (88, 59);
INSERT INTO public.games VALUES (212, 58);
INSERT INTO public.games VALUES (771, 58);
INSERT INTO public.games VALUES (157, 58);
INSERT INTO public.games VALUES (898, 60);
INSERT INTO public.games VALUES (942, 60);
INSERT INTO public.games VALUES (697, 61);
INSERT INTO public.games VALUES (853, 61);
INSERT INTO public.games VALUES (457, 60);
INSERT INTO public.games VALUES (88, 60);
INSERT INTO public.games VALUES (814, 60);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('ammar', 46);
INSERT INTO public.users VALUES ('user_1693115142878', 47);
INSERT INTO public.users VALUES ('user_1693115142877', 48);
INSERT INTO public.users VALUES ('user_1693115388835', 49);
INSERT INTO public.users VALUES ('user_1693115388834', 50);
INSERT INTO public.users VALUES ('user_1693115402225', 51);
INSERT INTO public.users VALUES ('user_1693115402224', 52);
INSERT INTO public.users VALUES ('user_1693115700088', 53);
INSERT INTO public.users VALUES ('user_1693115700087', 54);
INSERT INTO public.users VALUES ('user_1693115712311', 55);
INSERT INTO public.users VALUES ('user_1693115712310', 56);
INSERT INTO public.users VALUES ('ammr', 57);
INSERT INTO public.users VALUES ('user_1693115842749', 58);
INSERT INTO public.users VALUES ('user_1693115842748', 59);
INSERT INTO public.users VALUES ('user_1693115887008', 60);
INSERT INTO public.users VALUES ('user_1693115887007', 61);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 61, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (name);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

