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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    distance_from_earth numeric,
    age_in_millions_of_years integer,
    is_dangerous_for_earth boolean,
    black_hole_type text,
    is_supermassive boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(50) NOT NULL,
    galaxy_type text,
    galaxy_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.galaxy ALTER COLUMN galaxy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(50) NOT NULL,
    moon_id integer NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_years integer,
    is_spherical boolean,
    distance_from_earth numeric,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_years integer,
    is_spherical boolean,
    planet_types text,
    distance_from_earth numeric,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer,
    is_spherical boolean,
    distance_from_earth numeric,
    is_dying boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.star ALTER COLUMN star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sagittarius A*', 'Black hole in the Milky Way.', 26700, 13500, false, 'Supermassive (~4.3M solar masses).', true, 1);
INSERT INTO public.black_hole VALUES (2, 'Cygnus X-1', 'Black hole in the Milky Way.', 7200, 5, false, 'Stellar-Mass (~21 solar masses).', false, 1);
INSERT INTO public.black_hole VALUES (3, 'M31*', 'Black hole in the Andromeda Galaxy.', 2500000, 10000, false, 'Supermassive (~140M solar masses).', true, 2);
INSERT INTO public.black_hole VALUES (4, 'M87* (Powehi)', 'Black hole in the Messier 87 Galaxy.', 53500000, 13000, false, 'Supermassive (~6.6B solar masses).', true, 6);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES ('Milky Way', 'Barred Spiral', 1, 'Our home galaxy.', 13600, 0, true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES ('Andromeda Galaxy', 'Barred Spiral', 2, 'Closest major galaxy to the Milky Way.', 10000, 2.5, false);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES ('Large Magellanic Cloud', 'Irregular/Dwarf Spiral', 3, 'A satellite galaxy orbiting the Milky Way.', 13000, 0.163, false);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES ('Triangulum Galaxy', 'Spiral', 4, 'The third-largest galaxy in the Local Group', 11500, 2.8, false);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES ('Sombrero Galaxy', 'Unbarred Spiral/Lenticular', 5, 'Named for its bright central bulge and thick, dark dust lane that give it the appearance of a wide-brimmed hat.', 11500, 30, false);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES ('Messier 87', 'Supergiant Elliptical', 6, 'A massive, nearly spherical galaxy famous for hosting the first black hole ever directly imaged by the Event Horizon Telescope.', 13000, 54, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES ('Moon (Luna)', 1, 'Our moon.', false, 4510, true, 0.00000004, 3);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES ('Deimos', 3, 'Mars moon.', false, 4500, false, 0.0000083, 4);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES ('Phobos', 2, 'Mars moon.', false, 4500, false, 0.0000083, 4);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES ('Io', 4, 'Jupiter  moon.', false, 4500, true, 0.000066, 5);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES ('Europa', 5, 'Jupiter moon.', false, 4500, true, 0.000066, 5);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES ('Ganymede', 6, 'Jupiter moon.', false, 4500, true, 0.000066, 5);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES ('Callisto', 7, 'Jupiter moon.', false, 4500, true, 0.000066, 5);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES ('Amalthea', 8, 'Jupiter moon.', false, 4500, false, 0.000066, 5);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES ('Enceladus', 10, 'Saturn moon.', false, 4500, true, 0.000136, 6);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES ('Rhea', 11, 'Saturn moon.', false, 4500, true, 0.000136, 6);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES ('Iapetus', 12, 'Saturn moon.', false, 4500, true, 0.000136, 6);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES ('Dione', 13, 'Saturn moon.', false, 4500, true, 0.000136, 6);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES ('Tethys', 14, 'Saturn moon.', false, 4500, true, 0.000136, 6);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES ('Mimas', 15, 'Saturn moon.', false, 4500, true, 0.000136, 6);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES ('Hyperion', 16, 'Saturn moon.', false, 4500, false, 0.000136, 6);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES ('Titania', 17, 'Uranus moon.', false, 4500, true, 0.000288, 7);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES ('Oberon', 18, 'Uranus moon.', false, 4500, true, 0.000288, 7);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES ('Umbriel', 19, 'Uranus moon.', false, 4500, true, 0.000288, 7);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES ('Ariel', 20, 'Uranus moon.', false, 4500, true, 0.000288, 7);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES ('Miranda', 21, 'Uranus moon.', false, 4500, true, 0.000288, 7);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES ('Triton', 22, 'Neptune moon.', false, 4500, true, 0.000459, 8);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES ('Titan', 9, 'Saturn moon.', false, 4500, true, 0.000136, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES ('Mercury', 1, 'First planet in our solar system.', false, 4503, true, 'Terrestrial', 0.000016, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES ('Venus', 2, 'Second planet in our solar system.', false, 4503, true, 'Terrestrial', 0.000016, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES ('Earth', 3, 'Third planet in our solar system on which we''re living on.', true, 4543, true, 'Terrestrial', 0, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES ('Mars', 4, 'Fourth planet in our solar system. Also named red planet.', false, 4603, true, 'Terrestrial', 0.000016, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES ('Jupiter', 5, 'Fifth planet of our solar system.', false, 4603, true, 'Gas Giant', 0.000016, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES ('Saturn', 6, 'Sixth planet in our solar system. has large rings surrounding it.', false, 4503, true, 'Gas Giant', 0.000016, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES ('Uranus', 7, 'Seventh planet in our solar system.', false, 4503, true, 'Ice Giant', 0.000016, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES ('Neptune', 8, 'Eighth planet in our solar system.', false, 4503, true, 'Ice Giant', 0.000016, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES ('Ceres', 9, 'A dwarf planet in our solar system between Jupiter and Mars.', false, 4573, true, 'Dwarf Planet', 0.000016, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES ('Proxima Centauri c (candidate)', 10, 'Some planet in Proxima Centauri.', false, 4850, true, 'Super-Earth/Mini-Neptune', 4.24, 8);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES ('Proxima Centauri d', 11, 'Some planet in Proxima Centauri.', false, 4850, true, 'Sub-Earth', 4.24, 8);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES ('Proxima Centauri b', 12, 'Some planet in Proxima Centauri.', false, 4850, true, 'Super-Earth', 4.24, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES ('Betegeuse', 2, 'A red supergiant stellar type in its final stages.', 10, true, 0.0006, true, 1);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES ('SN 2003cg (progenitor)', 6, 'A White Dwarf stellar type which is already dead.', 5000, true, 29, true, 5);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES ('Sun', 1, 'Our star.', 4603, true, 0, false, 1);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES ('M31-V1', 3, 'A Classical Cepheid Variable stellar type which exhausted its core hydrogen.', 40, true, 2.5, true, 2);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES ('R136a1', 4, 'A Wolf-Rayet stellar type which is a very young star.', 1, true, 0.163, false, 3);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES ('M33 X-7', 5, 'A Blue Supergiant stellar type which is still in its burning phase, though could be pulled apart by a nearby black hole.', 4, true, 2.8, false, 4);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES ('SN1919A (progenitor)', 7, 'A Massive Star/ White Dwarf stellar type which died in 1919.', 20, true, 54, true, 6);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES ('Proxima Centauri', 8, 'A Red Dwarf stellar type which has confirmed planets orbiting it.', 4850, true, 4, false, 1);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 4, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 22, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 8, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

