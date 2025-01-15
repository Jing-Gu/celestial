--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    type character varying(20),
    age_in_billion_years numeric(5,2),
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    material character varying(50),
    diameter_km integer,
    is_habitable boolean
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    type character varying(20),
    material character varying(50),
    diameter_km integer,
    distance_from_sun_au integer,
    distance_from_sun_km bigint,
    has_rings boolean
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
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    type character varying(20),
    distance_from_earth_in_light_years integer
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
-- Name: summary; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.summary (
    summary_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    source text
);


ALTER TABLE public.summary OWNER TO freecodecamp;

--
-- Name: summary_summary_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.summary_summary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.summary_summary_id_seq OWNER TO freecodecamp;

--
-- Name: summary_summary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.summary_summary_id_seq OWNED BY public.summary.summary_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: summary summary_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.summary ALTER COLUMN summary_id SET DEFAULT nextval('public.summary_summary_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13.80, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10.00, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3.00, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 10.00, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 13.00, false);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 8.00, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', 'Rocky', 3474, false);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 'Rocky', 22, false);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 'Rocky', 12, false);
INSERT INTO public.moon VALUES (4, 5, 'Io', 'Volcanic', 3643, false);
INSERT INTO public.moon VALUES (5, 5, 'Europa', 'Icy', 3121, true);
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', 'Icy', 5262, true);
INSERT INTO public.moon VALUES (7, 5, 'Callisto', 'Icy', 4821, false);
INSERT INTO public.moon VALUES (8, 5, 'Leda', 'Rocky', 20, false);
INSERT INTO public.moon VALUES (9, 5, 'Himalia', 'Rocky', 170, false);
INSERT INTO public.moon VALUES (10, 5, 'Elara', 'Rocky', 86, false);
INSERT INTO public.moon VALUES (11, 6, 'Iapetus', 'Icy', 1469, false);
INSERT INTO public.moon VALUES (12, 6, 'Titan', 'Gaseous', 5150, true);
INSERT INTO public.moon VALUES (13, 6, 'Enceladus', 'Icy', 504, true);
INSERT INTO public.moon VALUES (14, 6, 'Rhea', 'Icy', 1528, false);
INSERT INTO public.moon VALUES (15, 6, 'Mimas', 'Icy', 396, false);
INSERT INTO public.moon VALUES (16, 7, 'Miranda', 'Rocky', 472, false);
INSERT INTO public.moon VALUES (17, 7, 'Oberon', 'Rocky', 1522, false);
INSERT INTO public.moon VALUES (18, 7, 'Titania', 'Rocky', 1578, false);
INSERT INTO public.moon VALUES (19, 8, 'Triton', 'Icy', 2706, false);
INSERT INTO public.moon VALUES (20, 7, 'Umbriel', 'Rocky', 1170, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (12, 6, 'HD 209458 b', 'Hot Jupiter', 'Gaseous', 139000, 0, 7000000, true);
INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'Terrestrial', 'Rocky', 4879, 0, 57900000, false);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 'Terrestrial', 'Rocky', 12104, 1, 108200000, false);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 'Terrestrial', 'Rocky', 12742, 1, 149600000, false);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 'Terrestrial', 'Rocky', 6779, 2, 227900000, false);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 'Gas Giant', 'Gaseous', 139820, 5, 778500000, true);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 'Gas Giant', 'Gaseous', 116460, 10, 1433500000, true);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 'Ice Giant', 'Icy', 50724, 19, 2872500000, true);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 'Ice Giant', 'Icy', 49244, 30, 4495100000, true);
INSERT INTO public.planet VALUES (9, 2, 'Alpha Centauri Bb', 'Exoplanet', 'Rocky', 12000, 1, 180000000, false);
INSERT INTO public.planet VALUES (10, 2, 'Proxima Centauri b', 'Exoplanet', 'Rocky', 11000, 1, 75000000, false);
INSERT INTO public.planet VALUES (11, 3, 'Kepler-22b', 'Exoplanet', 'Rocky', 18000, 1, 150000000, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'Main Sequence', 0);
INSERT INTO public.star VALUES (2, 2, 'Alpheratz', 'Blue Giant', 2537000);
INSERT INTO public.star VALUES (3, 3, 'Triangulum', 'White Dwarf', 3000000);
INSERT INTO public.star VALUES (4, 4, 'Whirlpool A', 'Spiral', 23100000);
INSERT INTO public.star VALUES (5, 5, 'Sombrero A', 'Elliptical', 28000000);
INSERT INTO public.star VALUES (6, 6, 'Pinwheel A', 'Irregular', 21000000);


--
-- Data for Name: summary; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.summary VALUES (1, 'galaxy', 'Galaxies consist of stars, planets, and vast clouds of gas and dust, all bound together by gravity.', 'nasa');
INSERT INTO public.summary VALUES (2, 'star', 'Stars are giant balls of hot gas – mostly hydrogen, with some helium and small amounts of other elements.', 'nasa');
INSERT INTO public.summary VALUES (3, 'planet', 'A plant is a celestial body that orbits a star. Planets are typically much smaller than stars and do not generate their own light. Instead, they reflect the light from their parent star.', 'chatgpt');
INSERT INTO public.summary VALUES (4, 'moon', 'A moon (also known as a satellite) is a natural celestial body that orbits a planet or a dwarf planet.', 'chatgpt');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: summary_summary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.summary_summary_id_seq', 4, true);


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
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


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
-- Name: summary summary_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.summary
    ADD CONSTRAINT summary_name_key UNIQUE (name);


--
-- Name: summary summary_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.summary
    ADD CONSTRAINT summary_pkey PRIMARY KEY (summary_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

