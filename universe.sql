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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxytype character varying(20),
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    diameter integer,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxyid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxyid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxyid_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxyid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxyid_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter integer,
    description text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: persons; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.persons (
    persons_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer
);


ALTER TABLE public.persons OWNER TO freecodecamp;

--
-- Name: persons_persons_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.persons_persons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persons_persons_id_seq OWNER TO freecodecamp;

--
-- Name: persons_persons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.persons_persons_id_seq OWNED BY public.persons.persons_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    diameter_in_miles integer,
    orbit_in_earth_days numeric(6,2),
    day_in_earth_days numeric(5,2),
    number_of_moons integer NOT NULL,
    planet_id integer NOT NULL,
    star_id integer,
    has_life boolean,
    is_spherical boolean,
    name character varying(30)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer,
    diameter integer,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxyid_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: persons persons_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.persons ALTER COLUMN persons_id SET DEFAULT nextval('public.persons_persons_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Elliptical', 'M87', 1, NULL, 'descrip');
INSERT INTO public.galaxy VALUES ('Spiral', 'Milky Way', 2, NULL, 'descrip');
INSERT INTO public.galaxy VALUES ('Spiral', 'NGC 3370', 3, NULL, 'descrip');
INSERT INTO public.galaxy VALUES ('Spiral', 'NGC 123', 4, NULL, 'descrip');
INSERT INTO public.galaxy VALUES ('Lenticular', 'M85', 5, NULL, 'descrip');
INSERT INTO public.galaxy VALUES ('irregular', 'Supernova 1987A', 6, NULL, 'descrip');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon1', 4312, NULL, 4);
INSERT INTO public.moon VALUES (3, 'moon2', 4312, NULL, 4);
INSERT INTO public.moon VALUES (4, 'moon3', 4312, NULL, 5);
INSERT INTO public.moon VALUES (5, 'moon4', 4312, NULL, 5);
INSERT INTO public.moon VALUES (6, 'moon5', 4312, NULL, 5);
INSERT INTO public.moon VALUES (7, 'moon6', 4312, NULL, 5);
INSERT INTO public.moon VALUES (8, 'moon7', 4312, NULL, 5);
INSERT INTO public.moon VALUES (9, 'moon8', 4312, NULL, 5);
INSERT INTO public.moon VALUES (10, 'moon9', 4312, NULL, 5);
INSERT INTO public.moon VALUES (11, 'moon10', 4312, NULL, 5);
INSERT INTO public.moon VALUES (12, 'moon11', 4312, NULL, 5);
INSERT INTO public.moon VALUES (13, 'moon12', 4312, NULL, 5);
INSERT INTO public.moon VALUES (14, 'moon13', 4312, NULL, 5);
INSERT INTO public.moon VALUES (15, 'moon14', 4312, NULL, 5);
INSERT INTO public.moon VALUES (16, 'moon15', 4312, NULL, 5);
INSERT INTO public.moon VALUES (17, 'moon16', 4312, NULL, 5);
INSERT INTO public.moon VALUES (18, 'moon17', 4312, NULL, 5);
INSERT INTO public.moon VALUES (19, 'moon18', 4312, NULL, 5);
INSERT INTO public.moon VALUES (20, 'moon19', 4312, NULL, 5);
INSERT INTO public.moon VALUES (21, 'moon20', 4312, NULL, 5);
INSERT INTO public.moon VALUES (22, 'moon21', 4312, NULL, 5);


--
-- Data for Name: persons; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.persons VALUES (1, 'A', 3);
INSERT INTO public.persons VALUES (2, '3', 3);
INSERT INTO public.persons VALUES (3, 'B', 3);
INSERT INTO public.persons VALUES (4, 'C', 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3031, 88.00, 58.60, 0, 1, 1, false, false, NULL);
INSERT INTO public.planet VALUES (7521, 255.00, 241.00, 0, 2, 1, false, false, NULL);
INSERT INTO public.planet VALUES (7926, 365.24, 1.00, 1, 3, 1, true, true, NULL);
INSERT INTO public.planet VALUES (4217, 450.00, 1.00, 2, 4, 1, false, false, NULL);
INSERT INTO public.planet VALUES (86881, 1111.00, 2.80, 79, 5, 1, false, false, NULL);
INSERT INTO public.planet VALUES (74900, 2222.00, 4.80, 82, 6, 1, false, false, NULL);
INSERT INTO public.planet VALUES (31763, 3333.00, 0.80, 27, 7, 1, false, false, NULL);
INSERT INTO public.planet VALUES (30775, 4444.00, 0.81, 14, 8, 1, false, false, NULL);
INSERT INTO public.planet VALUES (1430, 5555.00, 0.25, 5, 9, 1, false, false, NULL);
INSERT INTO public.planet VALUES (143034, 5546.70, 42.00, 0, 10, 3, false, true, NULL);
INSERT INTO public.planet VALUES (8034, 446.70, 142.00, 24, 11, 2, false, true, NULL);
INSERT INTO public.planet VALUES (944, 47.00, 2.21, 0, 12, 2, false, true, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('sun', 1, 2, NULL, 'descrip');
INSERT INTO public.star VALUES ('Tabby Star', 2, 2, NULL, 'descrip');
INSERT INTO public.star VALUES ('Mira', 3, 2, NULL, 'descrip');
INSERT INTO public.star VALUES ('Vega', 4, 2, NULL, 'descrip');
INSERT INTO public.star VALUES ('HD101065', 5, 2, NULL, 'descrip');
INSERT INTO public.star VALUES ('HD140283', 6, 2, NULL, 'descrip');


--
-- Name: galaxy_galaxyid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxyid_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: persons_persons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.persons_persons_id_seq', 4, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: persons persons_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_name_key UNIQUE (name);


--
-- Name: persons persons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_pkey PRIMARY KEY (persons_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: planet planet_solar_sys_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_solar_sys_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

