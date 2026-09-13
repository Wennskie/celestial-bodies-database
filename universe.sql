--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    visible_in_night_sky boolean NOT NULL,
    number_of_main_stars integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    galaxy_types character varying(30),
    age_in_millions_of_years integer
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
    name character varying(30) NOT NULL,
    is_spherical boolean NOT NULL,
    radius_in_km integer,
    description text
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
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean,
    planet_types character varying(30),
    distance_from_earth numeric(10,2)
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
    name character varying(30) NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2),
    galaxy_id integer NOT NULL
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 1, 'Orion', true, 7);
INSERT INTO public.constellation VALUES (2, 1, 'Ursa Major', true, 7);
INSERT INTO public.constellation VALUES (3, 1, 'Scorpius', true, 18);
INSERT INTO public.constellation VALUES (4, 1, 'Cassiopeia', true, 5);
INSERT INTO public.constellation VALUES (5, 1, 'Taurus', true, 5);
INSERT INTO public.constellation VALUES (6, 1, 'Aquarius', true, 4);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred spiral galaxy containing the Solar System', true, 'Barred Spiral', 13600);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Large spiral galaxy and the nearest major galaxy to the Milky Way', false, 'Spiral', 10000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral galaxy and one of the major galaxies in the Local Group', false, 'Spiral', 12000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral galaxy with a prominent central bulge and dust lane', false, 'Spiral', 13000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Grand-design spiral galaxy interacting with a smaller companion galaxy', false, 'Spiral', 13000);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular satellite galaxy of the Milky Way', false, 'Irregular', 13000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', true, 1737, 'Earth''s natural satellite.');
INSERT INTO public.moon VALUES (2, 4, 'Phobos', false, 11, 'The larger and closer moon of Mars.');
INSERT INTO public.moon VALUES (3, 4, 'Deimos', false, 6, 'The smaller and more distant moon of Mars.');
INSERT INTO public.moon VALUES (4, 5, 'Io', true, 1821, 'Volcanically active moon of Jupiter.');
INSERT INTO public.moon VALUES (5, 5, 'Europa', true, 1561, 'Icy moon of Jupiter with a subsurface ocean.');
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', true, 2631, 'Largest moon in the Solar System.');
INSERT INTO public.moon VALUES (7, 5, 'Callisto', true, 2410, 'Heavily cratered moon of Jupiter.');
INSERT INTO public.moon VALUES (8, 6, 'Mimas', true, 198, 'Small icy moon of Saturn.');
INSERT INTO public.moon VALUES (9, 6, 'Enceladus', true, 252, 'Icy Saturnian moon with a subsurface ocean.');
INSERT INTO public.moon VALUES (10, 6, 'Tethys', true, 531, 'Icy moon of Saturn.');
INSERT INTO public.moon VALUES (11, 6, 'Dione', true, 561, 'Icy moon of Saturn.');
INSERT INTO public.moon VALUES (12, 6, 'Rhea', true, 764, 'Second-largest moon of Saturn.');
INSERT INTO public.moon VALUES (13, 6, 'Titan', true, 2575, 'Saturn''s largest moon with a thick atmosphere.');
INSERT INTO public.moon VALUES (14, 6, 'Iapetus', true, 734, 'Saturnian moon with a distinctive two-tone surface.');
INSERT INTO public.moon VALUES (15, 7, 'Miranda', true, 236, 'Small moon of Uranus with a complex surface.');
INSERT INTO public.moon VALUES (16, 7, 'Ariel', true, 579, 'One of Uranus''s major moons.');
INSERT INTO public.moon VALUES (17, 7, 'Umbriel', true, 585, 'Dark major moon of Uranus.');
INSERT INTO public.moon VALUES (18, 7, 'Titania', true, 789, 'Largest moon of Uranus.');
INSERT INTO public.moon VALUES (19, 7, 'Oberon', true, 761, 'Outer major moon of Uranus.');
INSERT INTO public.moon VALUES (20, 8, 'Triton', true, 1353, 'Largest moon of Neptune.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', false, true, 'Terrestrial', 0.00);
INSERT INTO public.planet VALUES (2, 1, 'Venus', false, true, 'Terrestrial', 0.00);
INSERT INTO public.planet VALUES (3, 1, 'Earth', true, true, 'Terrestrial', 0.00);
INSERT INTO public.planet VALUES (4, 1, 'Mars', false, true, 'Terrestrial', 0.00);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', false, true, 'Gas Giant', 0.00);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', false, true, 'Gas Giant', 0.00);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', false, true, 'Ice Giant', 0.00);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', false, true, 'Ice Giant', 0.00);
INSERT INTO public.planet VALUES (9, 2, 'Proxima Centauri b', false, true, 'Terrestrial', 4.25);
INSERT INTO public.planet VALUES (10, 3, 'TRAPPIST-1 b', false, true, 'Terrestrial', 40.00);
INSERT INTO public.planet VALUES (11, 3, 'TRAPPIST-1 c', false, true, 'Terrestrial', 40.00);
INSERT INTO public.planet VALUES (12, 4, '55 Cancri e', false, true, 'Super-Earth', 41.00);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', true, 4600, 0.00, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', true, 4850, 4.25, 1);
INSERT INTO public.star VALUES (3, 'TRAPPIST-1', true, 5400, 40.00, 1);
INSERT INTO public.star VALUES (4, '55 Cancri', true, 5000, 41.00, 1);
INSERT INTO public.star VALUES (5, 'Kepler-90', true, 2000, 2800.00, 1);
INSERT INTO public.star VALUES (6, 'WASP-12', true, 3050, 1400.00, 1);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: constellation constellation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

