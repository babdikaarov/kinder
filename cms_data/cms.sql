--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Postgres.app)
-- Dumped by pg_dump version 16.3 (Postgres.app)

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
-- Name: abouts; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--
CREATE ROLE beksultanabdikaarov WITH LOGIN PASSWORD 'kinder1A';


CREATE TABLE public.abouts (
    id integer NOT NULL,
    description text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    "order" integer
);


ALTER TABLE public.abouts OWNER TO beksultanabdikaarov;

--
-- Name: abouts_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.abouts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.abouts_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: abouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.abouts_id_seq OWNED BY public.abouts.id;


--
-- Name: abouts_localizations_links; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.abouts_localizations_links (
    id integer NOT NULL,
    about_id integer,
    inv_about_id integer,
    about_order double precision
);


ALTER TABLE public.abouts_localizations_links OWNER TO beksultanabdikaarov;

--
-- Name: abouts_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.abouts_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.abouts_localizations_links_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: abouts_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.abouts_localizations_links_id_seq OWNED BY public.abouts_localizations_links.id;


--
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    action character varying(255),
    action_parameters jsonb,
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_permissions OWNER TO beksultanabdikaarov;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_permissions_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- Name: admin_permissions_role_links; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.admin_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_order double precision
);


ALTER TABLE public.admin_permissions_role_links OWNER TO beksultanabdikaarov;

--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.admin_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_permissions_role_links_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.admin_permissions_role_links_id_seq OWNED BY public.admin_permissions_role_links.id;


--
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_roles OWNER TO beksultanabdikaarov;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_roles_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_users OWNER TO beksultanabdikaarov;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_users_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: admin_users_roles_links; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.admin_users_roles_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    role_order double precision,
    user_order double precision
);


ALTER TABLE public.admin_users_roles_links OWNER TO beksultanabdikaarov;

--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.admin_users_roles_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_users_roles_links_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.admin_users_roles_links_id_seq OWNED BY public.admin_users_roles_links.id;


--
-- Name: blogs; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.blogs (
    id integer NOT NULL,
    title character varying(255),
    post jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.blogs OWNER TO beksultanabdikaarov;

--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.blogs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.blogs_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.blogs_id_seq OWNED BY public.blogs.id;


--
-- Name: blogs_localizations_links; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.blogs_localizations_links (
    id integer NOT NULL,
    blog_id integer,
    inv_blog_id integer,
    blog_order double precision
);


ALTER TABLE public.blogs_localizations_links OWNER TO beksultanabdikaarov;

--
-- Name: blogs_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.blogs_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.blogs_localizations_links_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: blogs_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.blogs_localizations_links_id_seq OWNED BY public.blogs_localizations_links.id;


--
-- Name: calendars; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.calendars (
    id integer NOT NULL,
    calendat_id character varying(255),
    public_key character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    category character varying(255)
);


ALTER TABLE public.calendars OWNER TO beksultanabdikaarov;

--
-- Name: calendars_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.calendars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.calendars_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: calendars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.calendars_id_seq OWNED BY public.calendars.id;


--
-- Name: details; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.details (
    id integer NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    tel_1 character varying(255),
    tel_2 character varying(255),
    weekday character varying(255),
    weekend character varying(255),
    org_name character varying(255),
    address character varying(255)
);


ALTER TABLE public.details OWNER TO beksultanabdikaarov;

--
-- Name: details_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.details_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.details_id_seq OWNED BY public.details.id;


--
-- Name: details_localizations_links; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.details_localizations_links (
    id integer NOT NULL,
    detail_id integer,
    inv_detail_id integer,
    detail_order double precision
);


ALTER TABLE public.details_localizations_links OWNER TO beksultanabdikaarov;

--
-- Name: details_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.details_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.details_localizations_links_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: details_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.details_localizations_links_id_seq OWNED BY public.details_localizations_links.id;


--
-- Name: docs_lists; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.docs_lists (
    id integer NOT NULL,
    doc_type jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.docs_lists OWNER TO beksultanabdikaarov;

--
-- Name: docs_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.docs_lists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.docs_lists_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: docs_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.docs_lists_id_seq OWNED BY public.docs_lists.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.files (
    id integer NOT NULL,
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    folder_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.files OWNER TO beksultanabdikaarov;

--
-- Name: files_folder_links; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.files_folder_links (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_order double precision
);


ALTER TABLE public.files_folder_links OWNER TO beksultanabdikaarov;

--
-- Name: files_folder_links_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.files_folder_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_folder_links_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: files_folder_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.files_folder_links_id_seq OWNED BY public.files_folder_links.id;


--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: files_related_morphs; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.files_related_morphs (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.files_related_morphs OWNER TO beksultanabdikaarov;

--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.files_related_morphs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_related_morphs_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.files_related_morphs_id_seq OWNED BY public.files_related_morphs.id;


--
-- Name: form_errors; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.form_errors (
    id integer NOT NULL,
    errors jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.form_errors OWNER TO beksultanabdikaarov;

--
-- Name: form_errors_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.form_errors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.form_errors_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: form_errors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.form_errors_id_seq OWNED BY public.form_errors.id;


--
-- Name: form_types; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.form_types (
    id integer NOT NULL,
    two_parents jsonb,
    one_parent jsonb,
    divorced jsonb,
    guardian jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.form_types OWNER TO beksultanabdikaarov;

--
-- Name: form_types_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.form_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.form_types_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: form_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.form_types_id_seq OWNED BY public.form_types.id;


--
-- Name: galleries; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.galleries (
    id integer NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.galleries OWNER TO beksultanabdikaarov;

--
-- Name: galleries_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.galleries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.galleries_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: galleries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.galleries_id_seq OWNED BY public.galleries.id;


--
-- Name: group_categories; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.group_categories (
    id integer NOT NULL,
    category character varying(255),
    age character varying(255),
    language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    "order" integer
);


ALTER TABLE public.group_categories OWNER TO beksultanabdikaarov;

--
-- Name: group_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.group_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.group_categories_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: group_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.group_categories_id_seq OWNED BY public.group_categories.id;


--
-- Name: group_categories_localizations_links; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.group_categories_localizations_links (
    id integer NOT NULL,
    group_category_id integer,
    inv_group_category_id integer,
    group_category_order double precision
);


ALTER TABLE public.group_categories_localizations_links OWNER TO beksultanabdikaarov;

--
-- Name: group_categories_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.group_categories_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.group_categories_localizations_links_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: group_categories_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.group_categories_localizations_links_id_seq OWNED BY public.group_categories_localizations_links.id;


--
-- Name: heroes; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.heroes (
    id integer NOT NULL,
    title character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.heroes OWNER TO beksultanabdikaarov;

--
-- Name: heroes_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.heroes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.heroes_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: heroes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.heroes_id_seq OWNED BY public.heroes.id;


--
-- Name: heroes_localizations_links; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.heroes_localizations_links (
    id integer NOT NULL,
    hero_id integer,
    inv_hero_id integer,
    hero_order double precision
);


ALTER TABLE public.heroes_localizations_links OWNER TO beksultanabdikaarov;

--
-- Name: heroes_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.heroes_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.heroes_localizations_links_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: heroes_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.heroes_localizations_links_id_seq OWNED BY public.heroes_localizations_links.id;


--
-- Name: home_gallery_infos; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.home_gallery_infos (
    id integer NOT NULL,
    description text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.home_gallery_infos OWNER TO beksultanabdikaarov;

--
-- Name: home_gallery_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.home_gallery_infos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.home_gallery_infos_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: home_gallery_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.home_gallery_infos_id_seq OWNED BY public.home_gallery_infos.id;


--
-- Name: home_gallery_infos_localizations_links; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.home_gallery_infos_localizations_links (
    id integer NOT NULL,
    home_gallery_info_id integer,
    inv_home_gallery_info_id integer,
    home_gallery_info_order double precision
);


ALTER TABLE public.home_gallery_infos_localizations_links OWNER TO beksultanabdikaarov;

--
-- Name: home_gallery_infos_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.home_gallery_infos_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.home_gallery_infos_localizations_links_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: home_gallery_infos_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.home_gallery_infos_localizations_links_id_seq OWNED BY public.home_gallery_infos_localizations_links.id;


--
-- Name: home_program_items; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.home_program_items (
    id integer NOT NULL,
    title character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.home_program_items OWNER TO beksultanabdikaarov;

--
-- Name: home_program_items_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.home_program_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.home_program_items_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: home_program_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.home_program_items_id_seq OWNED BY public.home_program_items.id;


--
-- Name: home_program_items_localizations_links; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.home_program_items_localizations_links (
    id integer NOT NULL,
    home_program_item_id integer,
    inv_home_program_item_id integer,
    home_program_item_order double precision
);


ALTER TABLE public.home_program_items_localizations_links OWNER TO beksultanabdikaarov;

--
-- Name: home_program_items_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.home_program_items_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.home_program_items_localizations_links_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: home_program_items_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.home_program_items_localizations_links_id_seq OWNED BY public.home_program_items_localizations_links.id;


--
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.i18n_locale OWNER TO beksultanabdikaarov;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.i18n_locale_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- Name: instructions; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.instructions (
    id integer NOT NULL,
    content text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.instructions OWNER TO beksultanabdikaarov;

--
-- Name: instructions_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.instructions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instructions_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: instructions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.instructions_id_seq OWNED BY public.instructions.id;


--
-- Name: instructions_localizations_links; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.instructions_localizations_links (
    id integer NOT NULL,
    instruction_id integer,
    inv_instruction_id integer,
    instruction_order double precision
);


ALTER TABLE public.instructions_localizations_links OWNER TO beksultanabdikaarov;

--
-- Name: instructions_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.instructions_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instructions_localizations_links_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: instructions_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.instructions_localizations_links_id_seq OWNED BY public.instructions_localizations_links.id;


--
-- Name: langs; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.langs (
    id integer NOT NULL,
    ru jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    ky jsonb
);


ALTER TABLE public.langs OWNER TO beksultanabdikaarov;

--
-- Name: langs_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.langs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.langs_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: langs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.langs_id_seq OWNED BY public.langs.id;


--
-- Name: logos; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.logos (
    id integer NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.logos OWNER TO beksultanabdikaarov;

--
-- Name: logos_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.logos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.logos_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: logos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.logos_id_seq OWNED BY public.logos.id;


--
-- Name: strapi_api_token_permissions; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_token_permissions OWNER TO beksultanabdikaarov;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;


--
-- Name: strapi_api_token_permissions_token_links; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.strapi_api_token_permissions_token_links (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_order double precision
);


ALTER TABLE public.strapi_api_token_permissions_token_links OWNER TO beksultanabdikaarov;

--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.strapi_api_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_token_permissions_token_links_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.strapi_api_token_permissions_token_links_id_seq OWNED BY public.strapi_api_token_permissions_token_links.id;


--
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_tokens OWNER TO beksultanabdikaarov;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.strapi_core_store_settings OWNER TO beksultanabdikaarov;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


ALTER TABLE public.strapi_database_schema OWNER TO beksultanabdikaarov;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_database_schema_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations OWNER TO beksultanabdikaarov;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_migrations_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- Name: strapi_release_actions; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.strapi_release_actions (
    id integer NOT NULL,
    type character varying(255),
    target_id integer,
    target_type character varying(255),
    content_type character varying(255),
    locale character varying(255),
    is_entry_valid boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_release_actions OWNER TO beksultanabdikaarov;

--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.strapi_release_actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_release_actions_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.strapi_release_actions_id_seq OWNED BY public.strapi_release_actions.id;


--
-- Name: strapi_release_actions_release_links; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.strapi_release_actions_release_links (
    id integer NOT NULL,
    release_action_id integer,
    release_id integer,
    release_action_order double precision
);


ALTER TABLE public.strapi_release_actions_release_links OWNER TO beksultanabdikaarov;

--
-- Name: strapi_release_actions_release_links_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.strapi_release_actions_release_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_release_actions_release_links_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: strapi_release_actions_release_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.strapi_release_actions_release_links_id_seq OWNED BY public.strapi_release_actions_release_links.id;


--
-- Name: strapi_releases; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.strapi_releases (
    id integer NOT NULL,
    name character varying(255),
    released_at timestamp(6) without time zone,
    scheduled_at timestamp(6) without time zone,
    timezone character varying(255),
    status character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_releases OWNER TO beksultanabdikaarov;

--
-- Name: strapi_releases_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.strapi_releases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_releases_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: strapi_releases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.strapi_releases_id_seq OWNED BY public.strapi_releases.id;


--
-- Name: strapi_transfer_token_permissions; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.strapi_transfer_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_transfer_token_permissions OWNER TO beksultanabdikaarov;

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNED BY public.strapi_transfer_token_permissions.id;


--
-- Name: strapi_transfer_token_permissions_token_links; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.strapi_transfer_token_permissions_token_links (
    id integer NOT NULL,
    transfer_token_permission_id integer,
    transfer_token_id integer,
    transfer_token_permission_order double precision
);


ALTER TABLE public.strapi_transfer_token_permissions_token_links OWNER TO beksultanabdikaarov;

--
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq OWNED BY public.strapi_transfer_token_permissions_token_links.id;


--
-- Name: strapi_transfer_tokens; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.strapi_transfer_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_transfer_tokens OWNER TO beksultanabdikaarov;

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.strapi_transfer_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNED BY public.strapi_transfer_tokens.id;


--
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE public.strapi_webhooks OWNER TO beksultanabdikaarov;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_webhooks_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- Name: submit_docs; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.submit_docs (
    id integer NOT NULL,
    form_variant jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.submit_docs OWNER TO beksultanabdikaarov;

--
-- Name: submit_docs_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.submit_docs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.submit_docs_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: submit_docs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.submit_docs_id_seq OWNED BY public.submit_docs.id;


--
-- Name: submit_docs_localizations_links; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.submit_docs_localizations_links (
    id integer NOT NULL,
    submit_doc_id integer,
    inv_submit_doc_id integer,
    submit_doc_order double precision
);


ALTER TABLE public.submit_docs_localizations_links OWNER TO beksultanabdikaarov;

--
-- Name: submit_docs_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.submit_docs_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.submit_docs_localizations_links_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: submit_docs_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.submit_docs_localizations_links_id_seq OWNED BY public.submit_docs_localizations_links.id;


--
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_permissions OWNER TO beksultanabdikaarov;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_permissions_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- Name: up_permissions_role_links; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.up_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_order double precision
);


ALTER TABLE public.up_permissions_role_links OWNER TO beksultanabdikaarov;

--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.up_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_permissions_role_links_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.up_permissions_role_links_id_seq OWNED BY public.up_permissions_role_links.id;


--
-- Name: up_roles; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_roles OWNER TO beksultanabdikaarov;

--
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_roles_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- Name: up_users; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_users OWNER TO beksultanabdikaarov;

--
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_users_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- Name: up_users_role_links; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.up_users_role_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    user_order double precision
);


ALTER TABLE public.up_users_role_links OWNER TO beksultanabdikaarov;

--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.up_users_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_users_role_links_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.up_users_role_links_id_seq OWNED BY public.up_users_role_links.id;


--
-- Name: upload_folders; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.upload_folders OWNER TO beksultanabdikaarov;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.upload_folders_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;


--
-- Name: upload_folders_parent_links; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.upload_folders_parent_links (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_order double precision
);


ALTER TABLE public.upload_folders_parent_links OWNER TO beksultanabdikaarov;

--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.upload_folders_parent_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.upload_folders_parent_links_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.upload_folders_parent_links_id_seq OWNED BY public.upload_folders_parent_links.id;


--
-- Name: why_uses; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.why_uses (
    id integer NOT NULL,
    title character varying(255),
    "order" integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.why_uses OWNER TO beksultanabdikaarov;

--
-- Name: why_uses_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.why_uses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.why_uses_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: why_uses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.why_uses_id_seq OWNED BY public.why_uses.id;


--
-- Name: why_uses_localizations_links; Type: TABLE; Schema: public; Owner: beksultanabdikaarov
--

CREATE TABLE public.why_uses_localizations_links (
    id integer NOT NULL,
    why_us_id integer,
    inv_why_us_id integer,
    why_us_order double precision
);


ALTER TABLE public.why_uses_localizations_links OWNER TO beksultanabdikaarov;

--
-- Name: why_uses_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: beksultanabdikaarov
--

CREATE SEQUENCE public.why_uses_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.why_uses_localizations_links_id_seq OWNER TO beksultanabdikaarov;

--
-- Name: why_uses_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beksultanabdikaarov
--

ALTER SEQUENCE public.why_uses_localizations_links_id_seq OWNED BY public.why_uses_localizations_links.id;


--
-- Name: abouts id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.abouts ALTER COLUMN id SET DEFAULT nextval('public.abouts_id_seq'::regclass);


--
-- Name: abouts_localizations_links id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.abouts_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.abouts_localizations_links_id_seq'::regclass);


--
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- Name: admin_permissions_role_links id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.admin_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_links_id_seq'::regclass);


--
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: admin_users_roles_links id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.admin_users_roles_links ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_links_id_seq'::regclass);


--
-- Name: blogs id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.blogs ALTER COLUMN id SET DEFAULT nextval('public.blogs_id_seq'::regclass);


--
-- Name: blogs_localizations_links id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.blogs_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.blogs_localizations_links_id_seq'::regclass);


--
-- Name: calendars id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.calendars ALTER COLUMN id SET DEFAULT nextval('public.calendars_id_seq'::regclass);


--
-- Name: details id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.details ALTER COLUMN id SET DEFAULT nextval('public.details_id_seq'::regclass);


--
-- Name: details_localizations_links id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.details_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.details_localizations_links_id_seq'::regclass);


--
-- Name: docs_lists id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.docs_lists ALTER COLUMN id SET DEFAULT nextval('public.docs_lists_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: files_folder_links id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.files_folder_links ALTER COLUMN id SET DEFAULT nextval('public.files_folder_links_id_seq'::regclass);


--
-- Name: files_related_morphs id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.files_related_morphs ALTER COLUMN id SET DEFAULT nextval('public.files_related_morphs_id_seq'::regclass);


--
-- Name: form_errors id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.form_errors ALTER COLUMN id SET DEFAULT nextval('public.form_errors_id_seq'::regclass);


--
-- Name: form_types id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.form_types ALTER COLUMN id SET DEFAULT nextval('public.form_types_id_seq'::regclass);


--
-- Name: galleries id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.galleries ALTER COLUMN id SET DEFAULT nextval('public.galleries_id_seq'::regclass);


--
-- Name: group_categories id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.group_categories ALTER COLUMN id SET DEFAULT nextval('public.group_categories_id_seq'::regclass);


--
-- Name: group_categories_localizations_links id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.group_categories_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.group_categories_localizations_links_id_seq'::regclass);


--
-- Name: heroes id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.heroes ALTER COLUMN id SET DEFAULT nextval('public.heroes_id_seq'::regclass);


--
-- Name: heroes_localizations_links id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.heroes_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.heroes_localizations_links_id_seq'::regclass);


--
-- Name: home_gallery_infos id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.home_gallery_infos ALTER COLUMN id SET DEFAULT nextval('public.home_gallery_infos_id_seq'::regclass);


--
-- Name: home_gallery_infos_localizations_links id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.home_gallery_infos_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.home_gallery_infos_localizations_links_id_seq'::regclass);


--
-- Name: home_program_items id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.home_program_items ALTER COLUMN id SET DEFAULT nextval('public.home_program_items_id_seq'::regclass);


--
-- Name: home_program_items_localizations_links id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.home_program_items_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.home_program_items_localizations_links_id_seq'::regclass);


--
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- Name: instructions id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.instructions ALTER COLUMN id SET DEFAULT nextval('public.instructions_id_seq'::regclass);


--
-- Name: instructions_localizations_links id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.instructions_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.instructions_localizations_links_id_seq'::regclass);


--
-- Name: langs id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.langs ALTER COLUMN id SET DEFAULT nextval('public.langs_id_seq'::regclass);


--
-- Name: logos id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.logos ALTER COLUMN id SET DEFAULT nextval('public.logos_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions_token_links id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_links_id_seq'::regclass);


--
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- Name: strapi_release_actions id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_release_actions ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_id_seq'::regclass);


--
-- Name: strapi_release_actions_release_links id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_release_actions_release_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_release_links_id_seq'::regclass);


--
-- Name: strapi_releases id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_releases ALTER COLUMN id SET DEFAULT nextval('public.strapi_releases_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions_token_links id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_token_links_id_seq'::regclass);


--
-- Name: strapi_transfer_tokens id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_transfer_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_tokens_id_seq'::regclass);


--
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- Name: submit_docs id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.submit_docs ALTER COLUMN id SET DEFAULT nextval('public.submit_docs_id_seq'::regclass);


--
-- Name: submit_docs_localizations_links id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.submit_docs_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.submit_docs_localizations_links_id_seq'::regclass);


--
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- Name: up_permissions_role_links id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.up_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_links_id_seq'::regclass);


--
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- Name: up_users_role_links id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.up_users_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_links_id_seq'::regclass);


--
-- Name: upload_folders id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);


--
-- Name: upload_folders_parent_links id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.upload_folders_parent_links ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_links_id_seq'::regclass);


--
-- Name: why_uses id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.why_uses ALTER COLUMN id SET DEFAULT nextval('public.why_uses_id_seq'::regclass);


--
-- Name: why_uses_localizations_links id; Type: DEFAULT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.why_uses_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.why_uses_localizations_links_id_seq'::regclass);


--
-- Data for Name: abouts; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.abouts (id, description, created_at, updated_at, created_by_id, updated_by_id, locale, "order") FROM stdin;
1	kyrgz4a По мере того, как наши дети, которые являются живыми цветами нашего сада, получают всестороннее образование и воспитание, наши живые цветы открываются с радостью для глаз и в изобилии приобретают приятный аромат. 	2024-04-09 04:56:09.648	2024-04-12 16:09:15.941	1	1	ky	1
2	По мере того, как наши дети, которые являются живыми цветами нашего сада, получают всестороннее образование и воспитание, наши живые цветы открываются с радостью для глаз и в изобилии приобретают приятный аромат. 	2024-04-09 04:56:18.976	2024-04-12 16:09:15.966	1	1	ru	1
3	Вместе с образованием они воспитывают гражданственность, патриотизм, уважение прав и свобод человека и его обязанностей, воспитывают нравственные чувства и сознательность, трудолюбие , личностные ценности, здоровье и здоровый образ жизни, охрану природы, эстетическое воспитание.	2024-04-09 04:57:48.592	2024-04-11 04:44:40.136	1	1	ky	2
4	Вместе с образованием они воспитывают гражданственность, патриотизм, уважение прав и свобод человека и его обязанностей, воспитывают нравственные чувства и сознательность, трудолюбие , личностные ценности, здоровье и здоровый образ жизни, охрану природы, эстетическое воспитание.	2024-04-09 04:57:59.007	2024-04-11 04:44:40.153	1	1	ru	2
\.


--
-- Data for Name: abouts_localizations_links; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.abouts_localizations_links (id, about_id, inv_about_id, about_order) FROM stdin;
1	2	1	1
2	1	2	1
3	4	3	1
4	3	4	1
\.


--
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.admin_permissions (id, action, action_parameters, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	plugin::upload.read	{}	\N	{}	[]	2024-04-05 06:03:13.438	2024-04-05 06:03:13.438	\N	\N
2	plugin::upload.configure-view	{}	\N	{}	[]	2024-04-05 06:03:13.442	2024-04-05 06:03:13.442	\N	\N
3	plugin::upload.assets.create	{}	\N	{}	[]	2024-04-05 06:03:13.444	2024-04-05 06:03:13.444	\N	\N
4	plugin::upload.assets.update	{}	\N	{}	[]	2024-04-05 06:03:13.445	2024-04-05 06:03:13.445	\N	\N
5	plugin::upload.assets.download	{}	\N	{}	[]	2024-04-05 06:03:13.447	2024-04-05 06:03:13.447	\N	\N
6	plugin::upload.assets.copy-link	{}	\N	{}	[]	2024-04-05 06:03:13.448	2024-04-05 06:03:13.448	\N	\N
7	plugin::upload.read	{}	\N	{}	["admin::is-creator"]	2024-04-05 06:03:13.45	2024-04-05 06:03:13.45	\N	\N
8	plugin::upload.configure-view	{}	\N	{}	[]	2024-04-05 06:03:13.452	2024-04-05 06:03:13.452	\N	\N
9	plugin::upload.assets.create	{}	\N	{}	[]	2024-04-05 06:03:13.454	2024-04-05 06:03:13.454	\N	\N
10	plugin::upload.assets.update	{}	\N	{}	["admin::is-creator"]	2024-04-05 06:03:13.456	2024-04-05 06:03:13.456	\N	\N
11	plugin::upload.assets.download	{}	\N	{}	[]	2024-04-05 06:03:13.458	2024-04-05 06:03:13.458	\N	\N
12	plugin::upload.assets.copy-link	{}	\N	{}	[]	2024-04-05 06:03:13.46	2024-04-05 06:03:13.46	\N	\N
13	plugin::content-manager.explorer.create	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2024-04-05 06:03:13.469	2024-04-05 06:03:13.469	\N	\N
14	plugin::content-manager.explorer.read	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2024-04-05 06:03:13.471	2024-04-05 06:03:13.471	\N	\N
15	plugin::content-manager.explorer.update	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2024-04-05 06:03:13.473	2024-04-05 06:03:13.473	\N	\N
16	plugin::content-manager.explorer.delete	{}	plugin::users-permissions.user	{}	[]	2024-04-05 06:03:13.475	2024-04-05 06:03:13.475	\N	\N
17	plugin::content-manager.single-types.configure-view	{}	\N	{}	[]	2024-04-05 06:03:13.477	2024-04-05 06:03:13.477	\N	\N
18	plugin::content-manager.collection-types.configure-view	{}	\N	{}	[]	2024-04-05 06:03:13.478	2024-04-05 06:03:13.478	\N	\N
19	plugin::content-manager.components.configure-layout	{}	\N	{}	[]	2024-04-05 06:03:13.48	2024-04-05 06:03:13.48	\N	\N
20	plugin::content-type-builder.read	{}	\N	{}	[]	2024-04-05 06:03:13.481	2024-04-05 06:03:13.481	\N	\N
21	plugin::email.settings.read	{}	\N	{}	[]	2024-04-05 06:03:13.483	2024-04-05 06:03:13.483	\N	\N
22	plugin::upload.read	{}	\N	{}	[]	2024-04-05 06:03:13.484	2024-04-05 06:03:13.484	\N	\N
23	plugin::upload.assets.create	{}	\N	{}	[]	2024-04-05 06:03:13.485	2024-04-05 06:03:13.485	\N	\N
24	plugin::upload.assets.update	{}	\N	{}	[]	2024-04-05 06:03:13.486	2024-04-05 06:03:13.486	\N	\N
25	plugin::upload.assets.download	{}	\N	{}	[]	2024-04-05 06:03:13.487	2024-04-05 06:03:13.487	\N	\N
26	plugin::upload.assets.copy-link	{}	\N	{}	[]	2024-04-05 06:03:13.488	2024-04-05 06:03:13.488	\N	\N
27	plugin::upload.configure-view	{}	\N	{}	[]	2024-04-05 06:03:13.489	2024-04-05 06:03:13.489	\N	\N
28	plugin::upload.settings.read	{}	\N	{}	[]	2024-04-05 06:03:13.491	2024-04-05 06:03:13.491	\N	\N
29	plugin::users-permissions.roles.create	{}	\N	{}	[]	2024-04-05 06:03:13.492	2024-04-05 06:03:13.492	\N	\N
30	plugin::users-permissions.roles.read	{}	\N	{}	[]	2024-04-05 06:03:13.494	2024-04-05 06:03:13.494	\N	\N
31	plugin::users-permissions.roles.update	{}	\N	{}	[]	2024-04-05 06:03:13.495	2024-04-05 06:03:13.495	\N	\N
32	plugin::users-permissions.roles.delete	{}	\N	{}	[]	2024-04-05 06:03:13.496	2024-04-05 06:03:13.496	\N	\N
33	plugin::users-permissions.providers.read	{}	\N	{}	[]	2024-04-05 06:03:13.498	2024-04-05 06:03:13.498	\N	\N
34	plugin::users-permissions.providers.update	{}	\N	{}	[]	2024-04-05 06:03:13.499	2024-04-05 06:03:13.499	\N	\N
35	plugin::users-permissions.email-templates.read	{}	\N	{}	[]	2024-04-05 06:03:13.5	2024-04-05 06:03:13.5	\N	\N
36	plugin::users-permissions.email-templates.update	{}	\N	{}	[]	2024-04-05 06:03:13.501	2024-04-05 06:03:13.501	\N	\N
37	plugin::users-permissions.advanced-settings.read	{}	\N	{}	[]	2024-04-05 06:03:13.502	2024-04-05 06:03:13.502	\N	\N
38	plugin::users-permissions.advanced-settings.update	{}	\N	{}	[]	2024-04-05 06:03:13.504	2024-04-05 06:03:13.504	\N	\N
39	plugin::i18n.locale.create	{}	\N	{}	[]	2024-04-05 06:03:13.505	2024-04-05 06:03:13.505	\N	\N
40	plugin::i18n.locale.read	{}	\N	{}	[]	2024-04-05 06:03:13.507	2024-04-05 06:03:13.507	\N	\N
41	plugin::i18n.locale.update	{}	\N	{}	[]	2024-04-05 06:03:13.508	2024-04-05 06:03:13.508	\N	\N
42	plugin::i18n.locale.delete	{}	\N	{}	[]	2024-04-05 06:03:13.509	2024-04-05 06:03:13.509	\N	\N
43	admin::marketplace.read	{}	\N	{}	[]	2024-04-05 06:03:13.51	2024-04-05 06:03:13.51	\N	\N
44	admin::webhooks.create	{}	\N	{}	[]	2024-04-05 06:03:13.512	2024-04-05 06:03:13.512	\N	\N
45	admin::webhooks.read	{}	\N	{}	[]	2024-04-05 06:03:13.513	2024-04-05 06:03:13.513	\N	\N
46	admin::webhooks.update	{}	\N	{}	[]	2024-04-05 06:03:13.514	2024-04-05 06:03:13.514	\N	\N
47	admin::webhooks.delete	{}	\N	{}	[]	2024-04-05 06:03:13.515	2024-04-05 06:03:13.515	\N	\N
48	admin::users.create	{}	\N	{}	[]	2024-04-05 06:03:13.516	2024-04-05 06:03:13.516	\N	\N
49	admin::users.read	{}	\N	{}	[]	2024-04-05 06:03:13.517	2024-04-05 06:03:13.517	\N	\N
50	admin::users.update	{}	\N	{}	[]	2024-04-05 06:03:13.518	2024-04-05 06:03:13.518	\N	\N
51	admin::users.delete	{}	\N	{}	[]	2024-04-05 06:03:13.519	2024-04-05 06:03:13.519	\N	\N
52	admin::roles.create	{}	\N	{}	[]	2024-04-05 06:03:13.52	2024-04-05 06:03:13.52	\N	\N
53	admin::roles.read	{}	\N	{}	[]	2024-04-05 06:03:13.522	2024-04-05 06:03:13.522	\N	\N
54	admin::roles.update	{}	\N	{}	[]	2024-04-05 06:03:13.523	2024-04-05 06:03:13.523	\N	\N
55	admin::roles.delete	{}	\N	{}	[]	2024-04-05 06:03:13.525	2024-04-05 06:03:13.525	\N	\N
56	admin::api-tokens.access	{}	\N	{}	[]	2024-04-05 06:03:13.526	2024-04-05 06:03:13.526	\N	\N
57	admin::api-tokens.create	{}	\N	{}	[]	2024-04-05 06:03:13.527	2024-04-05 06:03:13.527	\N	\N
58	admin::api-tokens.read	{}	\N	{}	[]	2024-04-05 06:03:13.53	2024-04-05 06:03:13.53	\N	\N
59	admin::api-tokens.update	{}	\N	{}	[]	2024-04-05 06:03:13.531	2024-04-05 06:03:13.531	\N	\N
60	admin::api-tokens.regenerate	{}	\N	{}	[]	2024-04-05 06:03:13.533	2024-04-05 06:03:13.533	\N	\N
61	admin::api-tokens.delete	{}	\N	{}	[]	2024-04-05 06:03:13.534	2024-04-05 06:03:13.534	\N	\N
62	admin::project-settings.update	{}	\N	{}	[]	2024-04-05 06:03:13.535	2024-04-05 06:03:13.535	\N	\N
63	admin::project-settings.read	{}	\N	{}	[]	2024-04-05 06:03:13.536	2024-04-05 06:03:13.536	\N	\N
64	admin::transfer.tokens.access	{}	\N	{}	[]	2024-04-05 06:03:13.537	2024-04-05 06:03:13.537	\N	\N
65	admin::transfer.tokens.create	{}	\N	{}	[]	2024-04-05 06:03:13.538	2024-04-05 06:03:13.538	\N	\N
66	admin::transfer.tokens.read	{}	\N	{}	[]	2024-04-05 06:03:13.539	2024-04-05 06:03:13.539	\N	\N
67	admin::transfer.tokens.update	{}	\N	{}	[]	2024-04-05 06:03:13.539	2024-04-05 06:03:13.539	\N	\N
68	admin::transfer.tokens.regenerate	{}	\N	{}	[]	2024-04-05 06:03:13.54	2024-04-05 06:03:13.54	\N	\N
69	admin::transfer.tokens.delete	{}	\N	{}	[]	2024-04-05 06:03:13.541	2024-04-05 06:03:13.541	\N	\N
73	plugin::content-manager.explorer.delete	{}	api::lang.lang	{}	[]	2024-04-05 06:04:41.206	2024-04-05 06:04:41.206	\N	\N
74	plugin::content-manager.explorer.publish	{}	api::lang.lang	{}	[]	2024-04-05 06:04:41.208	2024-04-05 06:04:41.208	\N	\N
119	plugin::content-manager.explorer.create	{}	api::hero.hero	{"fields": ["title", "description", "image"], "locales": ["ru", "ky"]}	[]	2024-04-09 02:24:01.826	2024-04-09 02:24:01.826	\N	\N
120	plugin::content-manager.explorer.read	{}	api::hero.hero	{"fields": ["title", "description", "image"], "locales": ["ru", "ky"]}	[]	2024-04-09 02:24:01.829	2024-04-09 02:24:01.829	\N	\N
121	plugin::content-manager.explorer.update	{}	api::hero.hero	{"fields": ["title", "description", "image"], "locales": ["ru", "ky"]}	[]	2024-04-09 02:24:01.831	2024-04-09 02:24:01.831	\N	\N
122	plugin::content-manager.explorer.delete	{}	api::hero.hero	{"locales": ["ru", "ky"]}	[]	2024-04-09 02:24:01.833	2024-04-09 02:24:01.833	\N	\N
123	plugin::content-manager.explorer.create	{}	api::lang.lang	{"fields": ["ky", "ru"]}	[]	2024-04-09 02:39:44.14	2024-04-09 02:39:44.14	\N	\N
124	plugin::content-manager.explorer.read	{}	api::lang.lang	{"fields": ["ky", "ru"]}	[]	2024-04-09 02:39:44.144	2024-04-09 02:39:44.144	\N	\N
125	plugin::content-manager.explorer.update	{}	api::lang.lang	{"fields": ["ky", "ru"]}	[]	2024-04-09 02:39:44.146	2024-04-09 02:39:44.146	\N	\N
129	plugin::content-manager.explorer.delete	{}	api::group-category.group-category	{"locales": ["ru", "ky"]}	[]	2024-04-09 03:36:34.03	2024-04-09 03:36:34.03	\N	\N
130	plugin::content-manager.explorer.create	{}	api::group-category.group-category	{"fields": ["category", "age", "language", "image", "order"], "locales": ["ru", "ky"]}	[]	2024-04-09 04:28:50.054	2024-04-09 04:28:50.054	\N	\N
131	plugin::content-manager.explorer.read	{}	api::group-category.group-category	{"fields": ["category", "age", "language", "image", "order"], "locales": ["ru", "ky"]}	[]	2024-04-09 04:28:50.058	2024-04-09 04:28:50.058	\N	\N
132	plugin::content-manager.explorer.update	{}	api::group-category.group-category	{"fields": ["category", "age", "language", "image", "order"], "locales": ["ru", "ky"]}	[]	2024-04-09 04:28:50.061	2024-04-09 04:28:50.061	\N	\N
136	plugin::content-manager.explorer.delete	{}	api::about.about	{"locales": ["ru", "ky"]}	[]	2024-04-09 04:55:11.006	2024-04-09 04:55:11.006	\N	\N
143	plugin::content-manager.explorer.create	{}	api::why-us.why-us	{"fields": ["title", "order", "image"], "locales": ["ru", "ky"]}	[]	2024-04-09 05:18:57.858	2024-04-09 05:18:57.858	\N	\N
144	plugin::content-manager.explorer.read	{}	api::why-us.why-us	{"fields": ["title", "order", "image"], "locales": ["ru", "ky"]}	[]	2024-04-09 05:18:57.865	2024-04-09 05:18:57.865	\N	\N
145	plugin::content-manager.explorer.update	{}	api::why-us.why-us	{"fields": ["title", "order", "image"], "locales": ["ru", "ky"]}	[]	2024-04-09 05:18:57.867	2024-04-09 05:18:57.867	\N	\N
146	plugin::content-manager.explorer.delete	{}	api::why-us.why-us	{"locales": ["ru", "ky"]}	[]	2024-04-09 05:18:57.869	2024-04-09 05:18:57.869	\N	\N
151	plugin::content-manager.explorer.create	{}	api::home-program-item.home-program-item	{"fields": ["title", "image"], "locales": ["ru", "ky"]}	[]	2024-04-09 06:16:15.227	2024-04-09 06:16:15.227	\N	\N
152	plugin::content-manager.explorer.read	{}	api::home-program-item.home-program-item	{"fields": ["title", "image"], "locales": ["ru", "ky"]}	[]	2024-04-09 06:16:15.23	2024-04-09 06:16:15.23	\N	\N
153	plugin::content-manager.explorer.update	{}	api::home-program-item.home-program-item	{"fields": ["title", "image"], "locales": ["ru", "ky"]}	[]	2024-04-09 06:16:15.231	2024-04-09 06:16:15.231	\N	\N
154	plugin::content-manager.explorer.delete	{}	api::home-program-item.home-program-item	{"locales": ["ru", "ky"]}	[]	2024-04-09 06:16:15.233	2024-04-09 06:16:15.233	\N	\N
155	plugin::content-manager.explorer.create	{}	api::home-gallery-info.home-gallery-info	{"fields": ["description", "image"], "locales": ["ru", "ky"]}	[]	2024-04-09 06:57:48.202	2024-04-09 06:57:48.202	\N	\N
156	plugin::content-manager.explorer.read	{}	api::home-gallery-info.home-gallery-info	{"fields": ["description", "image"], "locales": ["ru", "ky"]}	[]	2024-04-09 06:57:48.207	2024-04-09 06:57:48.207	\N	\N
157	plugin::content-manager.explorer.update	{}	api::home-gallery-info.home-gallery-info	{"fields": ["description", "image"], "locales": ["ru", "ky"]}	[]	2024-04-09 06:57:48.208	2024-04-09 06:57:48.208	\N	\N
158	plugin::content-manager.explorer.delete	{}	api::home-gallery-info.home-gallery-info	{"locales": ["ru", "ky"]}	[]	2024-04-09 06:57:48.21	2024-04-09 06:57:48.21	\N	\N
162	plugin::content-manager.explorer.delete	{}	api::detail.detail	{"locales": ["ru", "ky"]}	[]	2024-04-09 07:48:03.58	2024-04-09 07:48:03.58	\N	\N
166	plugin::content-manager.explorer.create	{}	api::blog.blog	{"fields": ["image", "title", "post"], "locales": ["ru", "ky"]}	[]	2024-04-09 10:52:57.763	2024-04-09 10:52:57.763	\N	\N
167	plugin::content-manager.explorer.read	{}	api::blog.blog	{"fields": ["image", "title", "post"], "locales": ["ru", "ky"]}	[]	2024-04-09 10:52:57.767	2024-04-09 10:52:57.767	\N	\N
168	plugin::content-manager.explorer.update	{}	api::blog.blog	{"fields": ["image", "title", "post"], "locales": ["ru", "ky"]}	[]	2024-04-09 10:52:57.769	2024-04-09 10:52:57.769	\N	\N
169	plugin::content-manager.explorer.delete	{}	api::blog.blog	{"locales": ["ru", "ky"]}	[]	2024-04-09 10:52:57.771	2024-04-09 10:52:57.771	\N	\N
170	plugin::content-manager.explorer.create	{}	api::gallery.gallery	{"fields": ["album"]}	[]	2024-04-10 01:19:20.851	2024-04-10 01:19:20.851	\N	\N
171	plugin::content-manager.explorer.read	{}	api::gallery.gallery	{"fields": ["album"]}	[]	2024-04-10 01:19:20.856	2024-04-10 01:19:20.856	\N	\N
172	plugin::content-manager.explorer.update	{}	api::gallery.gallery	{"fields": ["album"]}	[]	2024-04-10 01:19:20.859	2024-04-10 01:19:20.859	\N	\N
173	plugin::content-manager.explorer.delete	{}	api::gallery.gallery	{}	[]	2024-04-10 01:19:20.861	2024-04-10 01:19:20.861	\N	\N
177	plugin::content-manager.explorer.create	{}	api::detail.detail	{"fields": ["tel1", "tel2", "weekday", "weekend", "orgName", "address"], "locales": ["ru", "ky"]}	[]	2024-04-11 19:32:28.814	2024-04-11 19:32:28.814	\N	\N
178	plugin::content-manager.explorer.read	{}	api::detail.detail	{"fields": ["tel1", "tel2", "weekday", "weekend", "orgName", "address"], "locales": ["ru", "ky"]}	[]	2024-04-11 19:32:28.822	2024-04-11 19:32:28.822	\N	\N
179	plugin::content-manager.explorer.update	{}	api::detail.detail	{"fields": ["tel1", "tel2", "weekday", "weekend", "orgName", "address"], "locales": ["ru", "ky"]}	[]	2024-04-11 19:32:28.824	2024-04-11 19:32:28.824	\N	\N
180	plugin::content-manager.explorer.create	{}	api::instruction.instruction	{"fields": ["content"], "locales": ["ru", "ky"]}	[]	2024-04-11 21:53:41.81	2024-04-11 21:53:41.81	\N	\N
181	plugin::content-manager.explorer.read	{}	api::instruction.instruction	{"fields": ["content"], "locales": ["ru", "ky"]}	[]	2024-04-11 21:53:41.814	2024-04-11 21:53:41.814	\N	\N
182	plugin::content-manager.explorer.update	{}	api::instruction.instruction	{"fields": ["content"], "locales": ["ru", "ky"]}	[]	2024-04-11 21:53:41.817	2024-04-11 21:53:41.817	\N	\N
183	plugin::content-manager.explorer.delete	{}	api::instruction.instruction	{"locales": ["ru", "ky"]}	[]	2024-04-11 21:53:41.821	2024-04-11 21:53:41.821	\N	\N
192	plugin::content-manager.explorer.delete	{}	api::calendar.calendar	{}	[]	2024-04-14 05:58:29.666	2024-04-14 05:58:29.666	\N	\N
196	plugin::content-manager.explorer.create	{}	api::calendar.calendar	{"fields": ["calendatID", "publicKey", "category"]}	[]	2024-04-14 06:03:16.33	2024-04-14 06:03:16.33	\N	\N
197	plugin::content-manager.explorer.read	{}	api::calendar.calendar	{"fields": ["calendatID", "publicKey", "category"]}	[]	2024-04-14 06:03:16.333	2024-04-14 06:03:16.333	\N	\N
198	plugin::content-manager.explorer.update	{}	api::calendar.calendar	{"fields": ["calendatID", "publicKey", "category"]}	[]	2024-04-14 06:03:16.335	2024-04-14 06:03:16.335	\N	\N
199	plugin::content-manager.explorer.create	{}	api::about.about	{"fields": ["description", "image", "order"], "locales": ["ru", "ky"]}	[]	2024-04-19 16:01:45.609	2024-04-19 16:01:45.609	\N	\N
200	plugin::content-manager.explorer.read	{}	api::about.about	{"fields": ["description", "image", "order"], "locales": ["ru", "ky"]}	[]	2024-04-19 16:01:45.614	2024-04-19 16:01:45.614	\N	\N
201	plugin::content-manager.explorer.update	{}	api::about.about	{"fields": ["description", "image", "order"], "locales": ["ru", "ky"]}	[]	2024-04-19 16:01:45.616	2024-04-19 16:01:45.616	\N	\N
202	plugin::content-manager.explorer.create	{}	api::logo.logo	{"fields": ["logo"]}	[]	2024-04-29 13:32:51.897	2024-04-29 13:32:51.897	\N	\N
203	plugin::content-manager.explorer.read	{}	api::logo.logo	{"fields": ["logo"]}	[]	2024-04-29 13:32:51.903	2024-04-29 13:32:51.903	\N	\N
204	plugin::content-manager.explorer.update	{}	api::logo.logo	{"fields": ["logo"]}	[]	2024-04-29 13:32:51.905	2024-04-29 13:32:51.905	\N	\N
205	plugin::content-manager.explorer.delete	{}	api::logo.logo	{}	[]	2024-04-29 13:32:51.907	2024-04-29 13:32:51.907	\N	\N
207	plugin::content-manager.explorer.create	{}	api::submit-doc.submit-doc	{"fields": ["formVariant"], "locales": ["ru", "ky"]}	[]	2024-05-06 23:33:09.702	2024-05-06 23:33:09.702	\N	\N
208	plugin::content-manager.explorer.read	{}	api::submit-doc.submit-doc	{"fields": ["formVariant"], "locales": ["ru", "ky"]}	[]	2024-05-06 23:33:09.709	2024-05-06 23:33:09.709	\N	\N
209	plugin::content-manager.explorer.update	{}	api::submit-doc.submit-doc	{"fields": ["formVariant"], "locales": ["ru", "ky"]}	[]	2024-05-06 23:33:09.711	2024-05-06 23:33:09.711	\N	\N
210	plugin::content-manager.explorer.delete	{}	api::submit-doc.submit-doc	{"locales": ["ru", "ky"]}	[]	2024-05-06 23:33:09.713	2024-05-06 23:33:09.713	\N	\N
221	plugin::content-manager.explorer.create	{}	api::form-type.form-type	{"fields": ["twoParents", "oneParent", "divorced", "guardian"]}	[]	2024-05-07 00:05:29.016	2024-05-07 00:05:29.016	\N	\N
222	plugin::content-manager.explorer.read	{}	api::form-type.form-type	{"fields": ["twoParents", "oneParent", "divorced", "guardian"]}	[]	2024-05-07 00:05:29.022	2024-05-07 00:05:29.022	\N	\N
223	plugin::content-manager.explorer.update	{}	api::form-type.form-type	{"fields": ["twoParents", "oneParent", "divorced", "guardian"]}	[]	2024-05-07 00:05:29.025	2024-05-07 00:05:29.025	\N	\N
224	plugin::content-manager.explorer.delete	{}	api::form-type.form-type	{}	[]	2024-05-07 00:05:29.027	2024-05-07 00:05:29.027	\N	\N
225	plugin::content-manager.explorer.create	{}	api::docs-list.docs-list	{"fields": ["docType"]}	[]	2024-05-07 00:10:34.045	2024-05-07 00:10:34.045	\N	\N
226	plugin::content-manager.explorer.read	{}	api::docs-list.docs-list	{"fields": ["docType"]}	[]	2024-05-07 00:10:34.051	2024-05-07 00:10:34.051	\N	\N
227	plugin::content-manager.explorer.update	{}	api::docs-list.docs-list	{"fields": ["docType"]}	[]	2024-05-07 00:10:34.057	2024-05-07 00:10:34.057	\N	\N
228	plugin::content-manager.explorer.delete	{}	api::docs-list.docs-list	{}	[]	2024-05-07 00:10:34.059	2024-05-07 00:10:34.059	\N	\N
229	plugin::content-manager.explorer.create	{}	api::form-error.form-error	{"fields": ["errors"]}	[]	2024-05-07 03:50:09.709	2024-05-07 03:50:09.709	\N	\N
230	plugin::content-manager.explorer.read	{}	api::form-error.form-error	{"fields": ["errors"]}	[]	2024-05-07 03:50:09.715	2024-05-07 03:50:09.715	\N	\N
231	plugin::content-manager.explorer.update	{}	api::form-error.form-error	{"fields": ["errors"]}	[]	2024-05-07 03:50:09.718	2024-05-07 03:50:09.718	\N	\N
232	plugin::content-manager.explorer.delete	{}	api::form-error.form-error	{}	[]	2024-05-07 03:50:09.72	2024-05-07 03:50:09.72	\N	\N
\.


--
-- Data for Name: admin_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.admin_permissions_role_links (id, permission_id, role_id, permission_order) FROM stdin;
1	1	2	1
2	2	2	2
3	3	2	3
4	4	2	4
5	5	2	5
6	6	2	6
7	7	3	1
8	8	3	2
9	9	3	3
10	10	3	4
11	11	3	5
12	12	3	6
13	13	1	1
14	14	1	2
15	15	1	3
16	16	1	4
17	17	1	5
18	18	1	6
19	19	1	7
20	20	1	8
21	21	1	9
22	22	1	10
23	23	1	11
24	24	1	12
25	25	1	13
26	26	1	14
27	27	1	15
28	28	1	16
29	29	1	17
30	30	1	18
31	31	1	19
32	32	1	20
33	33	1	21
34	34	1	22
35	35	1	23
36	36	1	24
37	37	1	25
38	38	1	26
39	39	1	27
40	40	1	28
41	41	1	29
42	42	1	30
43	43	1	31
44	44	1	32
45	45	1	33
46	46	1	34
47	47	1	35
48	48	1	36
49	49	1	37
50	50	1	38
51	51	1	39
52	52	1	40
53	53	1	41
54	54	1	42
55	55	1	43
56	56	1	44
57	57	1	45
58	58	1	46
59	59	1	47
60	60	1	48
61	61	1	49
62	62	1	50
63	63	1	51
64	64	1	52
65	65	1	53
66	66	1	54
67	67	1	55
68	68	1	56
69	69	1	57
73	73	1	61
74	74	1	62
119	119	1	71
120	120	1	72
121	121	1	73
122	122	1	74
123	123	1	75
124	124	1	76
125	125	1	77
129	129	1	81
130	130	1	82
131	131	1	83
132	132	1	84
136	136	1	88
143	143	1	92
144	144	1	93
145	145	1	94
146	146	1	95
151	151	1	100
152	152	1	101
153	153	1	102
154	154	1	103
155	155	1	104
156	156	1	105
157	157	1	106
158	158	1	107
162	162	1	111
166	166	1	115
167	167	1	116
168	168	1	117
169	169	1	118
170	170	1	119
171	171	1	120
172	172	1	121
173	173	1	122
177	177	1	123
178	178	1	124
179	179	1	125
180	180	1	126
181	181	1	127
182	182	1	128
183	183	1	129
192	192	1	133
196	196	1	134
197	197	1	135
198	198	1	136
199	199	1	137
200	200	1	138
201	201	1	139
202	202	1	140
203	203	1	141
204	204	1	142
205	205	1	143
207	207	1	144
208	208	1	145
209	209	1	146
210	210	1	147
221	221	1	148
222	222	1	149
223	223	1	150
224	224	1	151
225	225	1	152
226	226	1	153
227	227	1	154
228	228	1	155
229	229	1	156
230	230	1	157
231	231	1	158
232	232	1	159
\.


--
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.admin_roles (id, name, code, description, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Super Admin	strapi-super-admin	Super Admins can access and manage all features and settings.	2024-04-05 06:03:13.431	2024-04-05 06:03:13.431	\N	\N
2	Editor	strapi-editor	Editors can manage and publish contents including those of other users.	2024-04-05 06:03:13.435	2024-04-05 06:03:13.435	\N	\N
3	Author	strapi-author	Authors can manage the content they have created.	2024-04-05 06:03:13.437	2024-04-05 06:03:13.437	\N	\N
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.admin_users (id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	kinder	kinder1A	\N	babdikaarov@gmail.com	$2a$10$6oXRcfC9hjBc/wjDnoJIeuXSVhpaj2n/Y0BhB0lyE4G69VYsStxve	\N	\N	t	f	en	2024-04-05 06:03:33.656	2024-04-14 06:08:03.854	\N	\N
\.


--
-- Data for Name: admin_users_roles_links; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.admin_users_roles_links (id, user_id, role_id, role_order, user_order) FROM stdin;
1	1	1	1	1
\.


--
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.blogs (id, title, post, created_at, updated_at, created_by_id, updated_by_id, locale) FROM stdin;
2	Ресурсы для родителей	[{"type": "paragraph", "children": [{"text": "Быть родителем – это нелегкая, но важная роль, требующая постоянного обучения и самосовершенствования. Онлайн-ресурсы становятся все более популярным источником информации и поддержки для родителей. Они предлагают широкий спектр материалов, от советов по воспитанию детей до информации о развитии ребенка. В этой статье мы рассмотрим несколько лучших ресурсов, которые могут быть полезными для всех, кто заботится о воспитании детей.", "type": "text"}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"text": "What to Expect: Этот сайт предлагает информацию о беременности, родах и развитии ребенка. Он также имеет форум, где родители могут делиться опытом и советами.", "type": "text"}]}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"text": "Parenting.com: Здесь вы найдете статьи и советы по воспитанию детей всех возрастов, от младенцев до подростков. Статьи охватывают такие темы, как здоровье, образование и взаимоотношения в семье.", "type": "text"}]}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"text": "PBS Parents: Этот ресурс предлагает образовательные игры, видео и статьи о воспитании детей. Он также имеет секцию для родителей, где можно найти советы и рекомендации по воспитанию детей.", "type": "text"}]}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"text": "Parent Toolkit: Этот ресурс предлагает информацию и советы по воспитанию детей, а также инструменты для обучения родителей, как помочь своим детям успешно учиться.", "type": "text"}]}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"text": "Zero to Three: Этот ресурс сосредоточен на развитии детей от рождения до трех лет. Он предлагает информацию о том, как помочь малышам развиваться и расти здоровыми.", "type": "text"}]}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"text": "Common Sense Media: Этот сайт предлагает обзоры и рекомендации о контенте для детей, таком как фильмы, книги и приложения. Он также имеет советы о том, как помочь детям использовать технологии безопасно и ответственно.", "type": "text"}]}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"text": "The Bump: Этот ресурс предлагает информацию о беременности, развитии младенцев и воспитании детей. Он также имеет форум, где родители могут обсуждать свои вопросы и проблемы.", "type": "text"}]}]}, {"type": "paragraph", "children": [{"text": "Эти ресурсы могут быть полезными для родителей, ищущих поддержку и информацию о воспитании своих детей. Они предлагают широкий спектр материалов, которые могут помочь родителям в их нелегком, но благородном деле.", "type": "text"}]}]	2024-04-09 10:55:00.805	2024-04-09 10:55:00.805	1	1	ru
4	asdsadas	[{"type": "paragraph", "children": [{"text": "Быть родителем – это нелегкая, но важная роль, требующая постоянного обучения и самосовершенствования. Онлайн-ресурсы становятся все более популярным источником информации и поддержки для родителей. Они предлагают широкий спектр материалов, от советов по воспитанию детей до информации о развитии ребенка. В этой статье мы рассмотрим несколько лучших ресурсов, которые могут быть полезными для всех, кто заботится о воспитании детей.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "What to Expect: Этот сайт предлагает информацию о беременности, родах и развитии ребенка. Он также имеет форум, где родители могут делиться опытом и советами.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Parenting.com: Здесь вы найдете статьи и советы по воспитанию детей всех возрастов, от младенцев до подростков. Статьи охватывают такие темы, как здоровье, образование и взаимоотношения в семье.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "PBS Parents: Этот ресурс предлагает образовательные игры, видео и статьи о воспитании детей. Он также имеет секцию для родителей, где можно найти советы и рекомендации по воспитанию детей.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Parent Toolkit: Этот ресурс предлагает информацию и советы по воспитанию детей, а также инструменты для обучения родителей, как помочь своим детям успешно учиться.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Zero to Three: Этот ресурс сосредоточен на развитии детей от рождения до трех лет. Он предлагает информацию о том, как помочь малышам развиваться и расти здоровыми.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Common Sense Media: Этот сайт предлагает обзоры и рекомендации о контенте для детей, таком как фильмы, книги и приложения. Он также имеет советы о том, как помочь детям использовать технологии безопасно и ответственно.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "The Bump: Этот ресурс предлагает информацию о беременности, развитии младенцев и воспитании детей. Он также имеет форум, где родители могут обсуждать свои вопросы и проблемы.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Эти ресурсы могут быть полезными для родителей, ищущих поддержку и информацию о воспитании своих детей. Они предлагают широкий спектр материалов, которые могут помочь родителям в их нелегком, но благородном деле.", "type": "text"}]}]	2024-04-09 10:57:24.504	2024-04-22 00:02:55.818	1	1	ru
6	asdffva	[{"type": "paragraph", "children": [{"text": "Быть родителем – это нелегкая, но важная роль, требующая постоянного обучения и самосовершенствования. Онлайн-ресурсы становятся все более популярным источником информации и поддержки для родителей. Они предлагают широкий спектр материалов, от советов по воспитанию детей до информации о развитии ребенка. В этой статье мы рассмотрим несколько лучших ресурсов, которые могут быть полезными для всех, кто заботится о воспитании детей.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "What to Expect: Этот сайт предлагает информацию о беременности, родах и развитии ребенка. Он также имеет форум, где родители могут делиться опытом и советами.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Parenting.com: Здесь вы найдете статьи и советы по воспитанию детей всех возрастов, от младенцев до подростков. Статьи охватывают такие темы, как здоровье, образование и взаимоотношения в семье.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "PBS Parents: Этот ресурс предлагает образовательные игры, видео и статьи о воспитании детей. Он также имеет секцию для родителей, где можно найти советы и рекомендации по воспитанию детей.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Parent Toolkit: Этот ресурс предлагает информацию и советы по воспитанию детей, а также инструменты для обучения родителей, как помочь своим детям успешно учиться.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Zero to Three: Этот ресурс сосредоточен на развитии детей от рождения до трех лет. Он предлагает информацию о том, как помочь малышам развиваться и расти здоровыми.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Common Sense Media: Этот сайт предлагает обзоры и рекомендации о контенте для детей, таком как фильмы, книги и приложения. Он также имеет советы о том, как помочь детям использовать технологии безопасно и ответственно.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "The Bump: Этот ресурс предлагает информацию о беременности, развитии младенцев и воспитании детей. Он также имеет форум, где родители могут обсуждать свои вопросы и проблемы.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Эти ресурсы могут быть полезными для родителей, ищущих поддержку и информацию о воспитании своих детей. Они предлагают широкий спектр материалов, которые могут помочь родителям в их нелегком, но благородном деле.", "type": "text"}]}]	2024-04-09 10:57:44.087	2024-04-09 10:57:44.087	1	1	ru
8	опсрпос	\N	2024-04-12 06:08:24.237	2024-04-12 06:08:24.237	1	1	ru
15	trstrs	[{"type": "paragraph", "children": [{"text": "gfxgfxgf", "type": "text"}]}]	2024-04-22 00:02:55.777	2024-04-22 00:02:55.777	1	1	ky
16	ru	[{"type": "paragraph", "children": [{"text": "ru", "type": "text"}]}]	2024-04-22 00:03:45.661	2024-04-22 00:03:45.661	1	1	ru
14	руччки	[{"type": "paragraph", "children": [{"text": "русский", "type": "text"}]}]	2024-04-19 20:36:28.527	2024-04-19 20:36:28.527	1	1	ru
10	TEST	[{"type": "heading", "level": 1, "children": [{"bold": true, "text": "                                                   bold text ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "asdasdsa tes tcaCHE", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "my ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "name ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "is ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "beksultan", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "cursive", "type": "text", "italic": true}]}, {"type": "paragraph", "children": [{"text": "underscore", "type": "text", "underline": true}]}, {"type": "paragraph", "children": [{"text": "strikethorih", "type": "text", "strikethrough": true}]}, {"type": "paragraph", "children": [{"code": true, "text": "<div>code element</div>", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}, {"url": "https://github.com/schedule-x/schedule-x/pulls", "type": "link", "children": [{"text": "google.com", "type": "text"}]}, {"text": " link", "type": "text"}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"text": "unrodered list", "type": "text"}]}, {"type": "list-item", "children": [{"text": "list", "type": "text"}]}, {"type": "list-item", "children": [{"text": "list", "type": "text"}]}, {"type": "list-item", "children": [{"text": "list", "type": "text"}]}]}, {"type": "list", "format": "ordered", "children": [{"type": "list-item", "children": [{"text": "ordered ", "type": "text"}]}, {"type": "list-item", "children": [{"text": "list1", "type": "text"}]}, {"type": "list-item", "children": [{"text": "list2", "type": "text"}]}, {"type": "list-item", "children": [{"text": "list3", "type": "text"}]}]}, {"type": "heading", "level": 1, "children": [{"text": "h1", "type": "text"}]}, {"type": "heading", "level": 2, "children": [{"text": "h2", "type": "text"}]}, {"type": "heading", "level": 3, "children": [{"text": "h3", "type": "text"}]}, {"type": "heading", "level": 4, "children": [{"text": "h4", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "h5", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "h6", "type": "text"}]}, {"type": "image", "image": {"ext": ".png", "url": "http://localhost:1337/uploads/image_2024_03_25_05_14_19_8358e8f2a7.png", "hash": "image_2024_03_25_05_14_19_8358e8f2a7", "mime": "image/png", "name": "image_2024-03-25_05-14-19.png", "size": 610.57, "width": 2560, "height": 1440, "caption": null, "formats": {"large": {"ext": ".png", "url": "/uploads/large_image_2024_03_25_05_14_19_8358e8f2a7.png", "hash": "large_image_2024_03_25_05_14_19_8358e8f2a7", "mime": "image/png", "name": "large_image_2024-03-25_05-14-19.png", "path": null, "size": 473.44, "width": 1000, "height": 563, "sizeInBytes": 473440}, "small": {"ext": ".png", "url": "/uploads/small_image_2024_03_25_05_14_19_8358e8f2a7.png", "hash": "small_image_2024_03_25_05_14_19_8358e8f2a7", "mime": "image/png", "name": "small_image_2024-03-25_05-14-19.png", "path": null, "size": 143.57, "width": 500, "height": 281, "sizeInBytes": 143574}, "medium": {"ext": ".png", "url": "/uploads/medium_image_2024_03_25_05_14_19_8358e8f2a7.png", "hash": "medium_image_2024_03_25_05_14_19_8358e8f2a7", "mime": "image/png", "name": "medium_image_2024-03-25_05-14-19.png", "path": null, "size": 284.01, "width": 750, "height": 422, "sizeInBytes": 284013}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_image_2024_03_25_05_14_19_8358e8f2a7.png", "hash": "thumbnail_image_2024_03_25_05_14_19_8358e8f2a7", "mime": "image/png", "name": "thumbnail_image_2024-03-25_05-14-19.png", "path": null, "size": 45.12, "width": 245, "height": 138, "sizeInBytes": 45117}}, "provider": "local", "createdAt": "2024-04-12T13:16:01.824Z", "updatedAt": "2024-04-12T13:16:01.824Z", "previewUrl": null, "alternativeText": "image_2024-03-25_05-14-19.png", "provider_metadata": null}, "children": [{"text": "", "type": "text"}]}, {"type": "quote", "children": [{"text": "ttestysyts", "type": "text"}]}]	2024-04-12 16:29:50.318	2024-05-03 22:01:16.09	1	1	ky
13	Ешеду	[{"type": "paragraph", "children": [{"text": "зукмфшнф дштшнф лфоыивлоывиал лывоаи лоывиа ылвоалыовиало ылвоаилоывиалоыи ылвоаилыовиалоывиа ылвоаилыовиалоыви ылвоиал оыивалоиылвоаилоывиалоывиалоыивалоиыволаиыовлаилоывиа", "type": "text"}]}, {"type": "heading", "level": 2, "children": [{"text": "ываываыва", "type": "text"}]}]	2024-04-19 20:36:16.325	2024-04-19 20:36:28.55	1	1	ky
12	safasfs	[{"type": "paragraph", "children": [{"text": "adsfsdfsdvsdvasdvsdfsdf", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "asdas", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "test", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}]	2024-04-17 23:27:24.423	2024-05-03 22:01:16.101	1	1	ru
\.


--
-- Data for Name: blogs_localizations_links; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.blogs_localizations_links (id, blog_id, inv_blog_id, blog_order) FROM stdin;
9	12	10	1
10	10	12	1
11	14	13	1
12	13	14	1
13	15	4	1
14	4	15	1
\.


--
-- Data for Name: calendars; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.calendars (id, calendat_id, public_key, created_at, updated_at, created_by_id, updated_by_id, category) FROM stdin;
10	353df9ec784eea223b78fc80a2132962bdd05190226c56ed0b3757b40bd99072@group.calendar.google.com	AIzaSyA1X4L1f7zGsApcefY7z3Zfpkd_RDOi8WQ	2024-04-26 19:29:44.874	2024-04-26 19:29:44.874	1	1	test
11	1c39a430bc420eec047991ef8919dcae21e1e031081d05cb878f96201f700296@group.calendar.google.com	AIzaSyA1X4L1f7zGsApcefY7z3Zfpkd_RDOi8WQ	2024-04-26 19:31:11.688	2024-04-26 19:31:11.688	1	1	junior
\.


--
-- Data for Name: details; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.details (id, created_at, updated_at, created_by_id, updated_by_id, locale, tel_1, tel_2, weekday, weekend, org_name, address) FROM stdin;
2	2024-04-09 07:52:03.442	2024-04-11 19:32:48.043	1	1	ru	+996 702 88 88 79	+996 702 88 88 79	Пн/Пт  9.00-17.00	Сб/Вс  Выходной	Дошкольное образовательное учреждение "Кашкалдак" им. Азима Нарматова	ул.Жантошева 78
1	2024-04-09 07:51:54.148	2024-04-11 19:32:48.055	1	1	ky	+996 702 88 88 79	+996 702 88 88 79	Пн/Пт  rabo4iy	Сб/Вс  vyhodnoi	Дошкольное образовательное учреждение "Кашкалдак" им. Азима Нарматова	ул.Жантошева 78
\.


--
-- Data for Name: details_localizations_links; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.details_localizations_links (id, detail_id, inv_detail_id, detail_order) FROM stdin;
1	2	1	1
2	1	2	1
\.


--
-- Data for Name: docs_lists; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.docs_lists (id, doc_type, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
2	{"text": {"ky": "kyrgyz4a #63", "ru": "orus4a #63"}, "option": "#63", "multiple": false}	2024-05-07 00:17:10.48	2024-05-07 00:17:10.48	1	1
3	{"text": {"ky": "kyrgyz4a SES", "ru": "orus4a SES"}, "option": "SES", "multiple": false}	2024-05-07 00:17:28.795	2024-05-07 00:17:28.795	1	1
4	{"text": {"ky": "kyrgyz4a Father Passport", "ru": "orus4a Father Passport"}, "option": "Father Passport", "multiple": false}	2024-05-07 00:17:39.322	2024-05-07 00:17:39.322	1	1
5	{"text": {"ky": "kyrgyz4a Mother Passport", "ru": "orus4a Mother Passport"}, "option": "Mother Passport", "multiple": false}	2024-05-07 00:17:49.327	2024-05-07 00:17:49.327	1	1
6	{"text": {"ky": "kyrgyz4a Family cert", "ru": "orus4a Family cert"}, "option": "Family cert", "multiple": false}	2024-05-07 00:17:57.733	2024-05-07 00:17:57.733	1	1
8	{"text": {"ky": "kyrgyz4a Gurdian cert", "ru": "orus4a Gurdian cert"}, "option": "Gurdian cert", "multiple": false}	2024-05-07 00:18:15.801	2024-05-07 00:18:15.801	1	1
1	{"text": {"ky": "kyrgyz4a Death Cert", "ru": "orus4a Death Cert"}, "option": "Death Cert", "multiple": false}	2024-05-07 00:16:51.235	2024-05-08 07:00:04.968	1	1
7	{"text": {"ky": "kyrgyz4a Divorce cert", "ru": "orus4a Divorce cert"}, "option": "Divorce cert", "multiple": true}	2024-05-07 00:18:06.337	2024-05-08 07:00:52.014	1	1
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
45	juniorGroup.png	Младшая группа иконка	Младшая группа	456	456	{"thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_junior_Group_470d349132.png", "hash": "thumbnail_junior_Group_470d349132", "mime": "image/png", "name": "thumbnail_juniorGroup.png", "path": null, "size": 29.73, "width": 156, "height": 156, "sizeInBytes": 29730}}	junior_Group_470d349132	.png	image/png	41.85	/uploads/junior_Group_470d349132.png	\N	local	\N	/	2024-04-09 03:38:08.93	2024-04-09 03:39:28.026	1	1
46	MiddleGroup.png	\N	\N	456	456	{"thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Middle_Group_32a3c1a9e1.png", "hash": "thumbnail_Middle_Group_32a3c1a9e1", "mime": "image/png", "name": "thumbnail_MiddleGroup.png", "path": null, "size": 29.08, "width": 156, "height": 156, "sizeInBytes": 29078}}	Middle_Group_32a3c1a9e1	.png	image/png	39.12	/uploads/Middle_Group_32a3c1a9e1.png	\N	local	\N	/	2024-04-09 03:41:36.439	2024-04-09 03:41:36.439	1	1
47	leadGroup.png	\N	\N	456	456	{"thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_lead_Group_05b68601af.png", "hash": "thumbnail_lead_Group_05b68601af", "mime": "image/png", "name": "thumbnail_leadGroup.png", "path": null, "size": 32.08, "width": 156, "height": 156, "sizeInBytes": 32080}}	lead_Group_05b68601af	.png	image/png	58.13	/uploads/lead_Group_05b68601af.png	\N	local	\N	/	2024-04-09 03:42:49.301	2024-04-09 03:42:49.301	1	1
48	hero.jpeg	\N	\N	4096	2731	{"large": {"ext": ".jpeg", "url": "/uploads/large_hero_4b417fb498.jpeg", "hash": "large_hero_4b417fb498", "mime": "image/jpeg", "name": "large_hero.jpeg", "path": null, "size": 134.75, "width": 1000, "height": 667, "sizeInBytes": 134746}, "small": {"ext": ".jpeg", "url": "/uploads/small_hero_4b417fb498.jpeg", "hash": "small_hero_4b417fb498", "mime": "image/jpeg", "name": "small_hero.jpeg", "path": null, "size": 38.95, "width": 500, "height": 333, "sizeInBytes": 38953}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_hero_4b417fb498.jpeg", "hash": "medium_hero_4b417fb498", "mime": "image/jpeg", "name": "medium_hero.jpeg", "path": null, "size": 78.58, "width": 750, "height": 500, "sizeInBytes": 78575}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_hero_4b417fb498.jpeg", "hash": "thumbnail_hero_4b417fb498", "mime": "image/jpeg", "name": "thumbnail_hero.jpeg", "path": null, "size": 11.15, "width": 234, "height": 156, "sizeInBytes": 11148}}	hero_4b417fb498	.jpeg	image/jpeg	1986.00	/uploads/hero_4b417fb498.jpeg	\N	local	\N	/	2024-04-09 03:52:23.567	2024-04-09 03:52:23.567	1	1
49	about1.png	\N	\N	2606	1718	{"large": {"ext": ".png", "url": "/uploads/large_about1_8be5a5db02.png", "hash": "large_about1_8be5a5db02", "mime": "image/png", "name": "large_about1.png", "path": null, "size": 792.68, "width": 1000, "height": 659, "sizeInBytes": 792683}, "small": {"ext": ".png", "url": "/uploads/small_about1_8be5a5db02.png", "hash": "small_about1_8be5a5db02", "mime": "image/png", "name": "small_about1.png", "path": null, "size": 224.23, "width": 500, "height": 330, "sizeInBytes": 224230}, "medium": {"ext": ".png", "url": "/uploads/medium_about1_8be5a5db02.png", "hash": "medium_about1_8be5a5db02", "mime": "image/png", "name": "medium_about1.png", "path": null, "size": 467.05, "width": 750, "height": 494, "sizeInBytes": 467046}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_about1_8be5a5db02.png", "hash": "thumbnail_about1_8be5a5db02", "mime": "image/png", "name": "thumbnail_about1.png", "path": null, "size": 60.58, "width": 237, "height": 156, "sizeInBytes": 60581}}	about1_8be5a5db02	.png	image/png	696.65	/uploads/about1_8be5a5db02.png	\N	local	\N	/	2024-04-09 04:55:59.66	2024-04-09 04:55:59.66	1	1
50	about2.png	\N	\N	2400	1568	{"large": {"ext": ".png", "url": "/uploads/large_about2_f6d6f31fcd.png", "hash": "large_about2_f6d6f31fcd", "mime": "image/png", "name": "large_about2.png", "path": null, "size": 1106.55, "width": 1000, "height": 653, "sizeInBytes": 1106554}, "small": {"ext": ".png", "url": "/uploads/small_about2_f6d6f31fcd.png", "hash": "small_about2_f6d6f31fcd", "mime": "image/png", "name": "small_about2.png", "path": null, "size": 310.9, "width": 500, "height": 327, "sizeInBytes": 310903}, "medium": {"ext": ".png", "url": "/uploads/medium_about2_f6d6f31fcd.png", "hash": "medium_about2_f6d6f31fcd", "mime": "image/png", "name": "medium_about2.png", "path": null, "size": 648.5, "width": 750, "height": 490, "sizeInBytes": 648504}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_about2_f6d6f31fcd.png", "hash": "thumbnail_about2_f6d6f31fcd", "mime": "image/png", "name": "thumbnail_about2.png", "path": null, "size": 80.94, "width": 239, "height": 156, "sizeInBytes": 80942}}	about2_f6d6f31fcd	.png	image/png	769.27	/uploads/about2_f6d6f31fcd.png	\N	local	\N	/	2024-04-09 04:57:44.509	2024-04-09 04:57:44.509	1	1
51	whyus1.png	\N	\N	456	456	{"thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_whyus1_7c6a2e6eec.png", "hash": "thumbnail_whyus1_7c6a2e6eec", "mime": "image/png", "name": "thumbnail_whyus1.png", "path": null, "size": 28.52, "width": 156, "height": 156, "sizeInBytes": 28517}}	whyus1_7c6a2e6eec	.png	image/png	47.96	/uploads/whyus1_7c6a2e6eec.png	\N	local	\N	/	2024-04-09 05:21:27.581	2024-04-09 05:21:27.581	1	1
52	whyus2.png	\N	\N	456	456	{"thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_whyus2_eb6441dd67.png", "hash": "thumbnail_whyus2_eb6441dd67", "mime": "image/png", "name": "thumbnail_whyus2.png", "path": null, "size": 31.12, "width": 156, "height": 156, "sizeInBytes": 31119}}	whyus2_eb6441dd67	.png	image/png	54.05	/uploads/whyus2_eb6441dd67.png	\N	local	\N	/	2024-04-09 05:23:05.821	2024-04-09 05:23:05.821	1	1
53	whyus3.png	\N	\N	532	456	{"small": {"ext": ".png", "url": "/uploads/small_whyus3_29d21a3e70.png", "hash": "small_whyus3_29d21a3e70", "mime": "image/png", "name": "small_whyus3.png", "path": null, "size": 152.21, "width": 500, "height": 429, "sizeInBytes": 152209}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_whyus3_29d21a3e70.png", "hash": "thumbnail_whyus3_29d21a3e70", "mime": "image/png", "name": "thumbnail_whyus3.png", "path": null, "size": 31, "width": 182, "height": 156, "sizeInBytes": 30996}}	whyus3_29d21a3e70	.png	image/png	41.85	/uploads/whyus3_29d21a3e70.png	\N	local	\N	/	2024-04-09 05:23:51.719	2024-04-09 05:23:51.719	1	1
54	logoped.png	\N	\N	456	456	{"thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_logoped_4d67e2800f.png", "hash": "thumbnail_logoped_4d67e2800f", "mime": "image/png", "name": "thumbnail_logoped.png", "path": null, "size": 33.77, "width": 156, "height": 156, "sizeInBytes": 33774}}	logoped_4d67e2800f	.png	image/png	43.51	/uploads/logoped_4d67e2800f.png	\N	local	\N	/	2024-04-09 06:19:09.157	2024-04-09 06:19:09.157	1	1
55	english.png	\N	\N	456	456	{"thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_english_a944e51fa1.png", "hash": "thumbnail_english_a944e51fa1", "mime": "image/png", "name": "thumbnail_english.png", "path": null, "size": 31.07, "width": 156, "height": 156, "sizeInBytes": 31069}}	english_a944e51fa1	.png	image/png	38.87	/uploads/english_a944e51fa1.png	\N	local	\N	/	2024-04-09 06:19:53.852	2024-04-09 06:19:53.852	1	1
56	musical.png	\N	\N	456	456	{"thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_musical_f7b92ef617.png", "hash": "thumbnail_musical_f7b92ef617", "mime": "image/png", "name": "thumbnail_musical.png", "path": null, "size": 24.33, "width": 156, "height": 156, "sizeInBytes": 24334}}	musical_f7b92ef617	.png	image/png	41.41	/uploads/musical_f7b92ef617.png	\N	local	\N	/	2024-04-09 06:20:21.605	2024-04-09 06:20:21.605	1	1
57	sport.png	\N	\N	456	456	{"thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_sport_5dddfc7c75.png", "hash": "thumbnail_sport_5dddfc7c75", "mime": "image/png", "name": "thumbnail_sport.png", "path": null, "size": 25.86, "width": 156, "height": 156, "sizeInBytes": 25862}}	sport_5dddfc7c75	.png	image/png	39.76	/uploads/sport_5dddfc7c75.png	\N	local	\N	/	2024-04-09 06:20:51.457	2024-04-09 06:20:51.457	1	1
58	galleryinfo.png	\N	\N	1307	734	{"large": {"ext": ".png", "url": "/uploads/large_galleryinfo_93688b99a0.png", "hash": "large_galleryinfo_93688b99a0", "mime": "image/png", "name": "large_galleryinfo.png", "path": null, "size": 929.29, "width": 1000, "height": 562, "sizeInBytes": 929287}, "small": {"ext": ".png", "url": "/uploads/small_galleryinfo_93688b99a0.png", "hash": "small_galleryinfo_93688b99a0", "mime": "image/png", "name": "small_galleryinfo.png", "path": null, "size": 262.14, "width": 500, "height": 281, "sizeInBytes": 262138}, "medium": {"ext": ".png", "url": "/uploads/medium_galleryinfo_93688b99a0.png", "hash": "medium_galleryinfo_93688b99a0", "mime": "image/png", "name": "medium_galleryinfo.png", "path": null, "size": 550.53, "width": 750, "height": 421, "sizeInBytes": 550528}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_galleryinfo_93688b99a0.png", "hash": "thumbnail_galleryinfo_93688b99a0", "mime": "image/png", "name": "thumbnail_galleryinfo.png", "path": null, "size": 72.49, "width": 245, "height": 138, "sizeInBytes": 72493}}	galleryinfo_93688b99a0	.png	image/png	222.51	/uploads/galleryinfo_93688b99a0.png	\N	local	\N	/	2024-04-09 06:59:02.003	2024-04-09 06:59:02.003	1	1
59	blog.jpeg	\N	\N	2731	4096	{"large": {"ext": ".jpeg", "url": "/uploads/large_blog_c11d2851f9.jpeg", "hash": "large_blog_c11d2851f9", "mime": "image/jpeg", "name": "large_blog.jpeg", "path": null, "size": 86.79, "width": 667, "height": 1000, "sizeInBytes": 86794}, "small": {"ext": ".jpeg", "url": "/uploads/small_blog_c11d2851f9.jpeg", "hash": "small_blog_c11d2851f9", "mime": "image/jpeg", "name": "small_blog.jpeg", "path": null, "size": 31.13, "width": 333, "height": 500, "sizeInBytes": 31132}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_blog_c11d2851f9.jpeg", "hash": "medium_blog_c11d2851f9", "mime": "image/jpeg", "name": "medium_blog.jpeg", "path": null, "size": 56.24, "width": 500, "height": 750, "sizeInBytes": 56240}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_blog_c11d2851f9.jpeg", "hash": "thumbnail_blog_c11d2851f9", "mime": "image/jpeg", "name": "thumbnail_blog.jpeg", "path": null, "size": 5.47, "width": 104, "height": 156, "sizeInBytes": 5466}}	blog_c11d2851f9	.jpeg	image/jpeg	986.24	/uploads/blog_c11d2851f9.jpeg	\N	local	\N	/	2024-04-09 10:53:12.921	2024-04-09 10:53:12.921	1	1
60	image_2024-03-25_05-18-41.png	\N	\N	2516	1079	{"large": {"ext": ".png", "url": "/uploads/large_image_2024_03_25_05_18_41_8a47d93c93.png", "hash": "large_image_2024_03_25_05_18_41_8a47d93c93", "mime": "image/png", "name": "large_image_2024-03-25_05-18-41.png", "path": null, "size": 470.87, "width": 1000, "height": 429, "sizeInBytes": 470873}, "small": {"ext": ".png", "url": "/uploads/small_image_2024_03_25_05_18_41_8a47d93c93.png", "hash": "small_image_2024_03_25_05_18_41_8a47d93c93", "mime": "image/png", "name": "small_image_2024-03-25_05-18-41.png", "path": null, "size": 147.66, "width": 500, "height": 214, "sizeInBytes": 147664}, "medium": {"ext": ".png", "url": "/uploads/medium_image_2024_03_25_05_18_41_8a47d93c93.png", "hash": "medium_image_2024_03_25_05_18_41_8a47d93c93", "mime": "image/png", "name": "medium_image_2024-03-25_05-18-41.png", "path": null, "size": 289.6, "width": 750, "height": 322, "sizeInBytes": 289602}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_image_2024_03_25_05_18_41_8a47d93c93.png", "hash": "thumbnail_image_2024_03_25_05_18_41_8a47d93c93", "mime": "image/png", "name": "thumbnail_image_2024-03-25_05-18-41.png", "path": null, "size": 45.15, "width": 245, "height": 105, "sizeInBytes": 45145}}	image_2024_03_25_05_18_41_8a47d93c93	.png	image/png	487.42	/uploads/image_2024_03_25_05_18_41_8a47d93c93.png	\N	local	\N	/	2024-04-12 16:16:01.105	2024-04-12 16:16:01.105	1	1
61	image_2024-03-25_05-17-39.png	\N	\N	2400	1282	{"large": {"ext": ".png", "url": "/uploads/large_image_2024_03_25_05_17_39_10ce7a20a4.png", "hash": "large_image_2024_03_25_05_17_39_10ce7a20a4", "mime": "image/png", "name": "large_image_2024-03-25_05-17-39.png", "path": null, "size": 539.42, "width": 1000, "height": 534, "sizeInBytes": 539419}, "small": {"ext": ".png", "url": "/uploads/small_image_2024_03_25_05_17_39_10ce7a20a4.png", "hash": "small_image_2024_03_25_05_17_39_10ce7a20a4", "mime": "image/png", "name": "small_image_2024-03-25_05-17-39.png", "path": null, "size": 167.46, "width": 500, "height": 267, "sizeInBytes": 167455}, "medium": {"ext": ".png", "url": "/uploads/medium_image_2024_03_25_05_17_39_10ce7a20a4.png", "hash": "medium_image_2024_03_25_05_17_39_10ce7a20a4", "mime": "image/png", "name": "medium_image_2024-03-25_05-17-39.png", "path": null, "size": 330.53, "width": 750, "height": 401, "sizeInBytes": 330527}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_image_2024_03_25_05_17_39_10ce7a20a4.png", "hash": "thumbnail_image_2024_03_25_05_17_39_10ce7a20a4", "mime": "image/png", "name": "thumbnail_image_2024-03-25_05-17-39.png", "path": null, "size": 50.17, "width": 245, "height": 131, "sizeInBytes": 50167}}	image_2024_03_25_05_17_39_10ce7a20a4	.png	image/png	547.97	/uploads/image_2024_03_25_05_17_39_10ce7a20a4.png	\N	local	\N	/	2024-04-12 16:16:01.298	2024-04-12 16:16:01.298	1	1
62	image_2024-03-25_05-14-19.png	\N	\N	2560	1440	{"large": {"ext": ".png", "url": "/uploads/large_image_2024_03_25_05_14_19_8358e8f2a7.png", "hash": "large_image_2024_03_25_05_14_19_8358e8f2a7", "mime": "image/png", "name": "large_image_2024-03-25_05-14-19.png", "path": null, "size": 473.44, "width": 1000, "height": 563, "sizeInBytes": 473440}, "small": {"ext": ".png", "url": "/uploads/small_image_2024_03_25_05_14_19_8358e8f2a7.png", "hash": "small_image_2024_03_25_05_14_19_8358e8f2a7", "mime": "image/png", "name": "small_image_2024-03-25_05-14-19.png", "path": null, "size": 143.57, "width": 500, "height": 281, "sizeInBytes": 143574}, "medium": {"ext": ".png", "url": "/uploads/medium_image_2024_03_25_05_14_19_8358e8f2a7.png", "hash": "medium_image_2024_03_25_05_14_19_8358e8f2a7", "mime": "image/png", "name": "medium_image_2024-03-25_05-14-19.png", "path": null, "size": 284.01, "width": 750, "height": 422, "sizeInBytes": 284013}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_image_2024_03_25_05_14_19_8358e8f2a7.png", "hash": "thumbnail_image_2024_03_25_05_14_19_8358e8f2a7", "mime": "image/png", "name": "thumbnail_image_2024-03-25_05-14-19.png", "path": null, "size": 45.12, "width": 245, "height": 138, "sizeInBytes": 45117}}	image_2024_03_25_05_14_19_8358e8f2a7	.png	image/png	610.57	/uploads/image_2024_03_25_05_14_19_8358e8f2a7.png	\N	local	\N	/	2024-04-12 16:16:01.824	2024-04-12 16:16:01.824	1	1
65	logo_kinder-removebg-preview.png	\N	\N	500	500	{"thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_logo_kinder_removebg_preview_18f815180a.png", "hash": "thumbnail_logo_kinder_removebg_preview_18f815180a", "mime": "image/png", "name": "thumbnail_logo_kinder-removebg-preview.png", "path": null, "size": 41.46, "width": 156, "height": 156, "sizeInBytes": 41459}}	logo_kinder_removebg_preview_18f815180a	.png	image/png	75.39	/uploads/logo_kinder_removebg_preview_18f815180a.png	\N	local	\N	/	2024-04-29 13:58:36.613	2024-04-29 13:58:36.613	1	1
66	kindergarten-logo.svg	Дошкольное образовательное учреждение "Кашкалдак" им. Азима Нарматова	\N	800	800	\N	kindergarten_logo_b911fbd31b	.svg	image/svg+xml	3519.82	/uploads/kindergarten_logo_b911fbd31b.svg	\N	local	\N	/	2024-04-29 17:45:15.81	2024-04-29 17:45:15.81	1	1
67	favicon-96x96 (1).png	\N	\N	384	384	{"thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_favicon_96x96_1_6af79f30e7.png", "hash": "thumbnail_favicon_96x96_1_6af79f30e7", "mime": "image/png", "name": "thumbnail_favicon-96x96 (1).png", "path": null, "size": 34.69, "width": 156, "height": 156, "sizeInBytes": 34694}}	favicon_96x96_1_6af79f30e7	.png	image/png	26.73	/uploads/favicon_96x96_1_6af79f30e7.png	\N	local	\N	/	2024-04-29 21:16:26.566	2024-04-29 21:16:26.566	1	1
\.


--
-- Data for Name: files_folder_links; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.files_folder_links (id, file_id, folder_id, file_order) FROM stdin;
\.


--
-- Data for Name: files_related_morphs; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.files_related_morphs (id, file_id, related_id, related_type, field, "order") FROM stdin;
67	51	2	api::why-us.why-us	image	1
68	51	1	api::why-us.why-us	image	1
73	53	6	api::why-us.why-us	image	1
74	53	5	api::why-us.why-us	image	1
77	54	2	api::home-program-item.home-program-item	image	1
78	54	1	api::home-program-item.home-program-item	image	1
80	55	4	api::home-program-item.home-program-item	image	1
81	55	3	api::home-program-item.home-program-item	image	1
84	56	6	api::home-program-item.home-program-item	image	1
85	56	5	api::home-program-item.home-program-item	image	1
87	57	8	api::home-program-item.home-program-item	image	1
88	57	7	api::home-program-item.home-program-item	image	1
90	58	2	api::home-gallery-info.home-gallery-info	image	1
91	58	1	api::home-gallery-info.home-gallery-info	image	1
94	59	2	api::blog.blog	image	1
95	59	1	api::blog.blog	image	1
98	59	3	api::blog.blog	image	1
100	59	6	api::blog.blog	image	1
101	59	5	api::blog.blog	image	1
102	59	1	api::gallery.gallery	album	1
103	58	1	api::gallery.gallery	album	2
104	57	1	api::gallery.gallery	album	3
105	56	1	api::gallery.gallery	album	4
106	52	2	api::gallery.gallery	album	1
109	48	1	api::hero.hero	image	1
50	45	3	api::group-category.group-category	image	1
52	46	5	api::group-category.group-category	image	1
54	47	7	api::group-category.group-category	image	1
112	50	3	api::about.about	image	1
57	48	2	api::hero.hero	image	1
58	45	2	api::group-category.group-category	image	1
59	46	4	api::group-category.group-category	image	1
60	47	6	api::group-category.group-category	image	1
113	50	4	api::about.about	image	1
115	57	8	api::blog.blog	image	1
116	57	7	api::blog.blog	image	1
117	49	1	api::about.about	image	1
118	49	2	api::about.about	image	1
119	60	3	api::gallery.gallery	album	1
120	61	3	api::gallery.gallery	album	2
121	62	3	api::gallery.gallery	album	3
124	61	11	api::blog.blog	image	1
137	62	14	api::blog.blog	image	1
138	62	13	api::blog.blog	image	1
139	59	15	api::blog.blog	image	1
140	59	4	api::blog.blog	image	1
141	56	16	api::blog.blog	image	1
160	60	10	api::blog.blog	image	1
161	60	12	api::blog.blog	image	1
162	65	1	api::logo.logo	logo	1
165	52	4	api::why-us.why-us	image	1
166	52	3	api::why-us.why-us	image	1
\.


--
-- Data for Name: form_errors; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.form_errors (id, errors, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	{"formType": {"ky": "ky choose form type", "ru": "ru choose form type"}}	2024-05-07 03:50:32.393	2024-05-07 03:53:05.763	1	1
\.


--
-- Data for Name: form_types; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.form_types (id, two_parents, one_parent, divorced, guardian, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	{"name": {"ky": "ky twoParents", "ru": "ru twoParents"}, "options": ["Death Cert"]}	{"name": {"ky": "ky oneParent", "ru": "ru oneParent"}, "options": ["Family cert", "Divorce cert", "#63"]}	{"name": {"ky": "ky divorced", "ru": "ru divorced"}, "options": ["Divorce cert"]}	{"name": {"ky": "ky guardian", "ru": "ru guardian"}, "options": ["Family cert", "Divorce cert", "Gurdian cert"]}	2024-05-07 00:08:53.353	2024-05-10 18:29:05.126	1	1
\.


--
-- Data for Name: galleries; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.galleries (id, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	2024-04-10 01:20:54.758	2024-04-10 01:20:54.758	1	1
2	2024-04-10 01:21:13.014	2024-04-10 01:21:13.014	1	1
3	2024-04-12 16:16:04.706	2024-04-12 16:16:04.706	1	1
\.


--
-- Data for Name: group_categories; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.group_categories (id, category, age, language, created_at, updated_at, created_by_id, updated_by_id, locale, "order") FROM stdin;
2	Младшая группа	3-4 года	Русская/Кыргызская группа	2024-04-09 03:39:36.624	2024-04-09 04:29:10.748	1	1	ky	1
3	Младшая группа	3-4 года	Русская/Кыргызская группа	2024-04-09 03:39:52.338	2024-04-09 04:29:10.767	1	1	ru	1
4	Средняя группа	4-5 лет	Русская/Кыргызская группа	2024-04-09 03:41:39.885	2024-04-09 04:29:23.94	1	1	ky	2
5	Средняя группа	4-5 лет	Русская/Кыргызская группа	2024-04-09 03:41:55.541	2024-04-09 04:29:23.954	1	1	ru	2
6	Старшая группа	5-6 лет	Русская/Кыргызская группа	2024-04-09 03:42:51.48	2024-04-09 04:29:30.066	1	1	ky	3
7	Старшая группа	5-6 лет	Русская/Кыргызская группа	2024-04-09 03:43:03.485	2024-04-09 04:29:30.076	1	1	ru	3
\.


--
-- Data for Name: group_categories_localizations_links; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.group_categories_localizations_links (id, group_category_id, inv_group_category_id, group_category_order) FROM stdin;
1	3	2	1
2	2	3	1
3	5	4	1
4	4	5	1
5	7	6	1
6	6	7	1
\.


--
-- Data for Name: heroes; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.heroes (id, title, description, created_at, updated_at, created_by_id, updated_by_id, locale) FROM stdin;
2	Дошкольное образовательное учреждение "Кашкалдак" им. Азима Нарматова	Чтобы занять очередь в детский садик нужно перейти на сайт Информационной системы  по приему детей в школу и детские сады	2024-04-09 02:24:25.1	2024-04-09 04:22:02.376	1	1	ru
1	Дошкольное образовательное учреждение "Кашкалдак" им. Азима Нарматова	Чтобы занять очередь в детский садик нужно перейти на сайт Информационной системы  по приему детей в школу и детские сады	2024-04-09 02:19:42.544	2024-04-11 02:38:00.482	1	1	ky
\.


--
-- Data for Name: heroes_localizations_links; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.heroes_localizations_links (id, hero_id, inv_hero_id, hero_order) FROM stdin;
1	2	1	1
2	1	2	1
\.


--
-- Data for Name: home_gallery_infos; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.home_gallery_infos (id, description, created_at, updated_at, created_by_id, updated_by_id, locale) FROM stdin;
2	Ознакомьтесь с коллекцией фотографий из повседневной жизни нашего детского сада, специальных мероприятий\nи увлекательного учебного процесса, которые делают нашу среду уникальной	2024-04-09 07:01:17.84	2024-04-09 07:01:17.84	1	1	ru
1	Kyrgyz4a с коллекцией фотографий из повседневной жизни нашего детского сада, специальных мероприятий\nи увлекательного учебного процесса, которые делают нашу среду уникальной	2024-04-09 07:01:13.986	2024-04-09 07:01:17.86	1	1	ky
\.


--
-- Data for Name: home_gallery_infos_localizations_links; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.home_gallery_infos_localizations_links (id, home_gallery_info_id, inv_home_gallery_info_id, home_gallery_info_order) FROM stdin;
1	2	1	1
2	1	2	1
\.


--
-- Data for Name: home_program_items; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.home_program_items (id, title, created_at, updated_at, created_by_id, updated_by_id, locale) FROM stdin;
2	Логопедия	2024-04-09 06:19:30.014	2024-04-09 06:19:30.014	1	1	ru
1	ЛогопедияKG	2024-04-09 06:19:15.871	2024-04-09 06:19:30.035	1	1	ky
4	Английский	2024-04-09 06:20:00.138	2024-04-09 06:20:00.138	1	1	ru
3	АнглийскийKG	2024-04-09 06:19:56.414	2024-04-09 06:20:00.155	1	1	ky
6	Музыка	2024-04-09 06:20:31.196	2024-04-09 06:20:31.196	1	1	ru
5	МузыкаKG	2024-04-09 06:20:24.71	2024-04-09 06:20:31.213	1	1	ky
8	Физическая активность	2024-04-09 06:20:57.428	2024-04-09 06:20:57.428	1	1	ru
7	FIZRA	2024-04-09 06:20:53.604	2024-04-09 06:20:57.441	1	1	ky
\.


--
-- Data for Name: home_program_items_localizations_links; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.home_program_items_localizations_links (id, home_program_item_id, inv_home_program_item_id, home_program_item_order) FROM stdin;
1	2	1	1
2	1	2	1
3	4	3	1
4	3	4	1
5	6	5	1
6	5	6	1
7	8	7	1
8	7	8	1
\.


--
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.i18n_locale (id, name, code, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
3	Russian (ru)	ru	2024-04-07 01:55:47.321	2024-04-07 01:55:47.321	1	1
2	Kyrgyz (ky)	ky	2024-04-07 01:55:26.255	2024-04-09 02:20:27.107	1	1
\.


--
-- Data for Name: instructions; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.instructions (id, content, created_at, updated_at, created_by_id, updated_by_id, locale) FROM stdin;
2	Чтобы отправить документ вам нужно  заполнить  пункты внизу 	2024-04-11 21:57:08.967	2024-04-11 21:57:08.967	1	1	ru
1	Бул администратор баракчасы. документтерди тапшыруу үчүн. бул жерде түшүндүрмө текст түзүү	2024-04-11 21:57:05.206	2024-04-18 03:33:45.548	1	1	ky
\.


--
-- Data for Name: instructions_localizations_links; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.instructions_localizations_links (id, instruction_id, inv_instruction_id, instruction_order) FROM stdin;
1	2	1	1
2	1	2	1
\.


--
-- Data for Name: langs; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.langs (id, ru, created_at, updated_at, published_at, created_by_id, updated_by_id, ky) FROM stdin;
1	{"form": {"inn": "ru inn", "email": "ru email", "error": {"inn": "ru type inn", "email": "ru type email", "addFile": "ru need to add files", "formType": "ru choose form type", "lastName": "ru type lastName", "firstName": "ru type firstName", "uploadFile": "ru upload files", "phoneNumber": "ru type phoneNumber"}, "modal": {"note": "ru strapi: Уважаемый родитель папорт должен быть с обеих сторон обеих родителей", "save": "ru save", "error": {"limit": "ru You have chooses --replace-- files, max allowed number of files are two for front and back or one for travel Passport", "duplicate": "ru You have duplicate --replace-- files, please remove duplicate"}, "title": "ru add docs", "button": "ru choose file", "upload": "ru upload", "clickDrop": {"drop": "ru drop here", "clickAndDrop": "ru drag or click to choose"}}, "submit": {"default": "ru submit", "isSubmitting": "ru isSubmitting"}, "addFile": {"add": "ru add file", "loaded": "ru all files loaded", "choosen": "ru all file field selected"}, "lastName": "ru lastName", "firstName": "ru firstName", "phoneNumber": "ru phoneNumber"}, "footer": {"nav": {"main": "Главная", "about": "О нас", "admin": "Администрация", "gallery": "Галерея", "parents": "Родителям"}, "address": "Адрес:"}, "header": {"nav": {"main": "Главная", "about": "О нас", "admin": "Администрация", "gallery": "Галерея", "parents": "Родителям"}, "LocaleSwitcher": {"label": "Язык", "locale": "русский"}}, "gallery": {"header": "Галерея"}, "parents": {"button": "ru button", "header": "Родителям"}, "calendar": {"label": "ru Category", "filter": "ru All categories", "header": "ru Calendar"}, "homePage": {"map": {"hours": "Часы работы:", "contacts": "Наши контакты"}, "hero": {"button": "нажать"}, "about": {"header": "О нас"}, "whyus": {"header": "Почему нас Выбирают"}, "programs": {"header": "Наши дополнительные программы"}, "ourGroups": {"header": "Наши Группы"}, "galleryInfo": {"button": "ru button", "header": "Галерея"}, "calendarRefference": {"promo": "Будьте в курсе событий и активностей нашего детского сада. Станьте частью нашего динамичного сообщества", "button": "Открыть календарь", "header": "Предстоящие Мероприятия"}}, "shareLink": {"copy": "ru copy", "share": "ru share", "copied": "ru copied"}}	2024-04-05 06:06:25.307	2024-05-08 22:52:31.441	2024-04-05 06:06:26.076	1	1	{"form": {"inn": "kg inn", "email": "kg email", "error": {"inn": "kg type inn", "email": "kg type email", "addFile": "kg need to add files", "formType": "kg choose form type", "lastName": "kg type lastName", "firstName": "kg type firstName", "uploadFile": "kg upload files", "phoneNumber": "kg type phoneNumber"}, "modal": {"note": "kg strapi: Уважаемый родитель папорт должен быть с обеих сторон обеих родителей", "save": "kg save", "error": {"limit": "kg You have chooses --replace-- files, max allowed number of files are two for front and back or one for travel Passport", "duplicate": "kg You have duplicate --replace-- files, please remove duplicate"}, "title": "kg add docs", "button": "kg choose file", "upload": "kg upload", "clickDrop": {"drop": "kg drop here", "clickAndDrop": "kg drag or click to choose"}}, "submit": {"default": "kg submit", "isSubmitting": "kg isSubmitting"}, "addFile": {"add": "kg add file", "loaded": "kg all files loaded", "choosen": "kg all file field selected"}, "lastName": "kg lastName", "firstName": "kg firstName", "phoneNumber": "kg phoneNumber"}, "footer": {"nav": {"main": "Главная", "about": "Биз жөнүндө", "admin": "Администрациясы", "gallery": "Галерея", "parents": "Ата-энелер"}, "address": "Адрес:"}, "header": {"nav": {"main": "Главная", "about": "Биз жөнүндө", "admin": "Администрациясы", "gallery": "Галерея", "parents": "Ата-энелер"}, "LocaleSwitcher": {"label": "Тил", "locale": "кыргызсча"}}, "gallery": {"header": "ГалереяKG"}, "parents": {"button": "kg button", "header": "РодителямKG"}, "calendar": {"label": "kg Category", "filter": "kg All categories", "header": "kg Calendar"}, "homePage": {"map": {"hours": "Часы работы:", "contacts": "Bizdin контакты"}, "hero": {"button": "нажать"}, "about": {"header": "O Nas"}, "whyus": {"header": "Почему нас Выбираютkg"}, "programs": {"header": "Наши дополнительные программы Kyrgyz4a"}, "ourGroups": {"header": "Bizdin gruppa"}, "galleryInfo": {"button": "kg button", "header": "Галерея"}, "calendarRefference": {"promo": "Kyrgyz4a в курсе событий и активностей нашего детского сада. Станьте частью нашего динамичного сообщества", "button": "Открыть календарь", "header": "Предстоящие Мероприятия"}}, "shareLink": {"copy": "kg copy", "share": "kg share", "copied": "kg copied"}}
\.


--
-- Data for Name: logos; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.logos (id, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	2024-04-29 13:34:58.897	2024-05-04 01:42:05.294	1	1
\.


--
-- Data for Name: strapi_api_token_permissions; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.strapi_api_token_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_api_token_permissions_token_links; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.strapi_api_token_permissions_token_links (id, api_token_permission_id, api_token_id, api_token_permission_order) FROM stdin;
\.


--
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.strapi_api_tokens (id, name, description, type, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	test	test	read-only	9c318e5f141d821a9805afe3d85c2c0e56add892ef513e0b95e996cf1bcf38cc34e2731b21f091e6b1b450644a0521edc2f90436bed46d50b7490829571f8f82	\N	2024-04-21 05:48:08.298	604800000	2024-04-14 05:48:08.298	2024-04-14 05:48:08.298	\N	\N
\.


--
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
2	plugin_content_manager_configuration_content_types::admin::permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"actionParameters":{"edit":{"label":"actionParameters","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"actionParameters","searchable":false,"sortable":false}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"edit":[[{"name":"action","size":6}],[{"name":"actionParameters","size":12}],[{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}],[{"name":"role","size":6}]]},"uid":"admin::permission"}	object	\N	\N
3	plugin_content_manager_configuration_content_types::admin::role	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6},{"name":"users","size":6}],[{"name":"permissions","size":6}]]},"uid":"admin::role"}	object	\N	\N
4	plugin_content_manager_configuration_content_types::admin::api-token	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}],[{"name":"lastUsedAt","size":6},{"name":"permissions","size":6}],[{"name":"expiresAt","size":6},{"name":"lifespan","size":4}]]},"uid":"admin::api-token"}	object	\N	\N
5	plugin_content_manager_configuration_content_types::admin::user	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"isActive","size":4}],[{"name":"roles","size":6},{"name":"blocked","size":4}],[{"name":"preferedLanguage","size":6}]]},"uid":"admin::user"}	object	\N	\N
6	plugin_content_manager_configuration_content_types::admin::api-token-permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::api-token-permission"}	object	\N	\N
7	plugin_content_manager_configuration_content_types::admin::transfer-token	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","accessKey"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"accessKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]},"uid":"admin::transfer-token"}	object	\N	\N
8	plugin_content_manager_configuration_content_types::plugin::upload.folder	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"pathId":{"edit":{"label":"pathId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pathId","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"parent","searchable":true,"sortable":true}},"children":{"edit":{"label":"children","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"children","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"files","searchable":false,"sortable":false}},"path":{"edit":{"label":"path","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"path","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","pathId","parent"],"edit":[[{"name":"name","size":6},{"name":"pathId","size":4}],[{"name":"parent","size":6},{"name":"children","size":6}],[{"name":"files","size":6},{"name":"path","size":6}]]},"uid":"plugin::upload.folder"}	object	\N	\N
9	plugin_content_manager_configuration_content_types::admin::transfer-token-permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::transfer-token-permission"}	object	\N	\N
23	plugin_i18n_default_locale	"ky"	string	\N	\N
24	core_admin_auth	{"providers":{"autoRegister":false,"defaultRole":null,"ssoLockedRoles":null}}	object	\N	\N
1	strapi_content_types_schema	{"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"admin::permission","plugin":"admin","globalId":"AdminPermission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"registrationToken":{"hidden":true}}},"kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"admin::user","plugin":"admin","globalId":"AdminUser"},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"admin::role","plugin":"admin","globalId":"AdminRole"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token","connection":"default","uid":"admin::api-token","plugin":"admin","globalId":"AdminApiToken"},"admin::api-token-permission":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token-permission","connection":"default","uid":"admin::api-token-permission","plugin":"admin","globalId":"AdminApiTokenPermission"},"admin::transfer-token":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"transfer-token","connection":"default","uid":"admin::transfer-token","plugin":"admin","globalId":"AdminTransferToken"},"admin::transfer-token-permission":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"}},"kind":"collectionType"},"modelType":"contentType","modelName":"transfer-token-permission","connection":"default","uid":"admin::transfer-token-permission","plugin":"admin","globalId":"AdminTransferTokenPermission"},"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null}],"kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true,"searchable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"file","connection":"default","uid":"plugin::upload.file","plugin":"upload","globalId":"UploadFile"},"plugin::upload.folder":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"kind":"collectionType","__schema__":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"folder","connection":"default","uid":"plugin::upload.folder","plugin":"upload","globalId":"UploadFolder"},"plugin::content-releases.release":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"}},"kind":"collectionType"},"modelType":"contentType","modelName":"release","connection":"default","uid":"plugin::content-releases.release","plugin":"content-releases","globalId":"ContentReleasesRelease"},"plugin::content-releases.release-action":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"entry":{"type":"relation","relation":"morphToOne","configurable":false},"contentType":{"type":"string","required":true},"locale":{"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"entry":{"type":"relation","relation":"morphToOne","configurable":false},"contentType":{"type":"string","required":true},"locale":{"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"}},"kind":"collectionType"},"modelType":"contentType","modelName":"release-action","connection":"default","uid":"plugin::content-releases.release-action","plugin":"content-releases","globalId":"ContentReleasesReleaseAction"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"locale","connection":"default","uid":"plugin::i18n.locale","plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"plugin::users-permissions.permission","plugin":"users-permissions","globalId":"UsersPermissionsPermission"},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"plugin::users-permissions.role","plugin":"users-permissions","globalId":"UsersPermissionsRole"},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"kind":"collectionType","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"plugin::users-permissions.user","plugin":"users-permissions","globalId":"UsersPermissionsUser"},"api::about.about":{"kind":"collectionType","collectionName":"abouts","info":{"singularName":"about","pluralName":"abouts","displayName":"about","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"text","required":true},"image":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}},"order":{"pluginOptions":{"i18n":{"localized":false}},"type":"integer","required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::about.about"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"abouts","info":{"singularName":"about","pluralName":"abouts","displayName":"about","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"text","required":true},"image":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}},"order":{"pluginOptions":{"i18n":{"localized":false}},"type":"integer","required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"about","connection":"default","uid":"api::about.about","apiName":"about","globalId":"About","actions":{},"lifecycles":{}},"api::blog.blog":{"kind":"collectionType","collectionName":"blogs","info":{"singularName":"blog","pluralName":"blogs","displayName":"blog","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"image":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}},"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"post":{"pluginOptions":{"i18n":{"localized":true}},"type":"blocks","required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::blog.blog"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"blogs","info":{"singularName":"blog","pluralName":"blogs","displayName":"blog","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"image":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}},"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"post":{"pluginOptions":{"i18n":{"localized":true}},"type":"blocks","required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"blog","connection":"default","uid":"api::blog.blog","apiName":"blog","globalId":"Blog","actions":{},"lifecycles":{}},"api::calendar.calendar":{"kind":"collectionType","collectionName":"calendars","info":{"singularName":"calendar","pluralName":"calendars","displayName":"Calendar","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"calendatID":{"type":"string","required":true},"publicKey":{"type":"string","required":true},"category":{"type":"string","required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"calendars","info":{"singularName":"calendar","pluralName":"calendars","displayName":"Calendar","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"calendatID":{"type":"string","required":true},"publicKey":{"type":"string","required":true},"category":{"type":"string","required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"calendar","connection":"default","uid":"api::calendar.calendar","apiName":"calendar","globalId":"Calendar","actions":{},"lifecycles":{}},"api::detail.detail":{"kind":"singleType","collectionName":"details","info":{"singularName":"detail","pluralName":"details","displayName":"details","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"tel1":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","required":true},"tel2":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","required":true},"weekday":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"weekend":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"orgName":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"address":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::detail.detail"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"details","info":{"singularName":"detail","pluralName":"details","displayName":"details","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"tel1":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","required":true},"tel2":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","required":true},"weekday":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"weekend":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"orgName":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"address":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true}},"kind":"singleType"},"modelType":"contentType","modelName":"detail","connection":"default","uid":"api::detail.detail","apiName":"detail","globalId":"Detail","actions":{},"lifecycles":{}},"api::docs-list.docs-list":{"kind":"collectionType","collectionName":"docs_lists","info":{"singularName":"docs-list","pluralName":"docs-lists","displayName":"docsList"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"docType":{"type":"json","required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"docs_lists","info":{"singularName":"docs-list","pluralName":"docs-lists","displayName":"docsList"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"docType":{"type":"json","required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"docs-list","connection":"default","uid":"api::docs-list.docs-list","apiName":"docs-list","globalId":"DocsList","actions":{},"lifecycles":{}},"api::form-error.form-error":{"kind":"singleType","collectionName":"form_errors","info":{"singularName":"form-error","pluralName":"form-errors","displayName":"formError"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"errors":{"type":"json","required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"form_errors","info":{"singularName":"form-error","pluralName":"form-errors","displayName":"formError"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"errors":{"type":"json","required":true}},"kind":"singleType"},"modelType":"contentType","modelName":"form-error","connection":"default","uid":"api::form-error.form-error","apiName":"form-error","globalId":"FormError","actions":{},"lifecycles":{}},"api::form-type.form-type":{"kind":"singleType","collectionName":"form_types","info":{"singularName":"form-type","pluralName":"form-types","displayName":"formType"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"twoParents":{"type":"json","required":true},"oneParent":{"type":"json","required":true},"divorced":{"type":"json","required":true},"guardian":{"type":"json","required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"form_types","info":{"singularName":"form-type","pluralName":"form-types","displayName":"formType"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"twoParents":{"type":"json","required":true},"oneParent":{"type":"json","required":true},"divorced":{"type":"json","required":true},"guardian":{"type":"json","required":true}},"kind":"singleType"},"modelType":"contentType","modelName":"form-type","connection":"default","uid":"api::form-type.form-type","apiName":"form-type","globalId":"FormType","actions":{},"lifecycles":{}},"api::gallery.gallery":{"kind":"collectionType","collectionName":"galleries","info":{"singularName":"gallery","pluralName":"galleries","displayName":"gallery","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"album":{"type":"media","multiple":true,"required":true,"allowedTypes":["images"]},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"galleries","info":{"singularName":"gallery","pluralName":"galleries","displayName":"gallery","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"album":{"type":"media","multiple":true,"required":true,"allowedTypes":["images"]}},"kind":"collectionType"},"modelType":"contentType","modelName":"gallery","connection":"default","uid":"api::gallery.gallery","apiName":"gallery","globalId":"Gallery","actions":{},"lifecycles":{}},"api::group-category.group-category":{"kind":"collectionType","collectionName":"group_categories","info":{"singularName":"group-category","pluralName":"group-categories","displayName":"groupCategory","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"category":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"age":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"language":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"image":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}},"order":{"pluginOptions":{"i18n":{"localized":false}},"type":"integer","required":true,"unique":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::group-category.group-category"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"group_categories","info":{"singularName":"group-category","pluralName":"group-categories","displayName":"groupCategory","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"category":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"age":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"language":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"image":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}},"order":{"pluginOptions":{"i18n":{"localized":false}},"type":"integer","required":true,"unique":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"group-category","connection":"default","uid":"api::group-category.group-category","apiName":"group-category","globalId":"GroupCategory","actions":{},"lifecycles":{}},"api::hero.hero":{"kind":"singleType","collectionName":"heroes","info":{"singularName":"hero","pluralName":"heroes","displayName":"hero","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"description":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"image":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::hero.hero"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"heroes","info":{"singularName":"hero","pluralName":"heroes","displayName":"hero","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"description":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"image":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}}},"kind":"singleType"},"modelType":"contentType","modelName":"hero","connection":"default","uid":"api::hero.hero","apiName":"hero","globalId":"Hero","actions":{},"lifecycles":{}},"api::home-gallery-info.home-gallery-info":{"kind":"singleType","collectionName":"home_gallery_infos","info":{"singularName":"home-gallery-info","pluralName":"home-gallery-infos","displayName":"home gallery info","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"text","required":true},"image":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::home-gallery-info.home-gallery-info"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"home_gallery_infos","info":{"singularName":"home-gallery-info","pluralName":"home-gallery-infos","displayName":"home gallery info","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"text","required":true},"image":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}}},"kind":"singleType"},"modelType":"contentType","modelName":"home-gallery-info","connection":"default","uid":"api::home-gallery-info.home-gallery-info","apiName":"home-gallery-info","globalId":"HomeGalleryInfo","actions":{},"lifecycles":{}},"api::home-program-item.home-program-item":{"kind":"collectionType","collectionName":"home_program_items","info":{"singularName":"home-program-item","pluralName":"home-program-items","displayName":"Home program item","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"image":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::home-program-item.home-program-item"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"home_program_items","info":{"singularName":"home-program-item","pluralName":"home-program-items","displayName":"Home program item","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"image":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}}},"kind":"collectionType"},"modelType":"contentType","modelName":"home-program-item","connection":"default","uid":"api::home-program-item.home-program-item","apiName":"home-program-item","globalId":"HomeProgramItem","actions":{},"lifecycles":{}},"api::instruction.instruction":{"kind":"singleType","collectionName":"instructions","info":{"singularName":"instruction","pluralName":"instructions","displayName":"instruction","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"content":{"pluginOptions":{"i18n":{"localized":true}},"type":"text","required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::instruction.instruction"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"instructions","info":{"singularName":"instruction","pluralName":"instructions","displayName":"instruction","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"content":{"pluginOptions":{"i18n":{"localized":true}},"type":"text","required":true}},"kind":"singleType"},"modelType":"contentType","modelName":"instruction","connection":"default","uid":"api::instruction.instruction","apiName":"instruction","globalId":"Instruction","actions":{},"lifecycles":{}},"api::lang.lang":{"kind":"singleType","collectionName":"langs","info":{"singularName":"lang","pluralName":"langs","displayName":"lang","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"ky":{"type":"json","required":true},"ru":{"type":"json","required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"langs","info":{"singularName":"lang","pluralName":"langs","displayName":"lang","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"ky":{"type":"json","required":true},"ru":{"type":"json","required":true}},"kind":"singleType"},"modelType":"contentType","modelName":"lang","connection":"default","uid":"api::lang.lang","apiName":"lang","globalId":"Lang","actions":{},"lifecycles":{}},"api::logo.logo":{"kind":"singleType","collectionName":"logos","info":{"singularName":"logo","pluralName":"logos","displayName":"logo","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"logo":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"logos","info":{"singularName":"logo","pluralName":"logos","displayName":"logo","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"logo":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]}},"kind":"singleType"},"modelType":"contentType","modelName":"logo","connection":"default","uid":"api::logo.logo","apiName":"logo","globalId":"Logo","actions":{},"lifecycles":{}},"api::submit-doc.submit-doc":{"kind":"collectionType","collectionName":"submit_docs","info":{"singularName":"submit-doc","pluralName":"submit-docs","displayName":"submitDoc"},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"formVariant":{"pluginOptions":{"i18n":{"localized":true}},"type":"json","required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::submit-doc.submit-doc"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"submit_docs","info":{"singularName":"submit-doc","pluralName":"submit-docs","displayName":"submitDoc"},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"formVariant":{"pluginOptions":{"i18n":{"localized":true}},"type":"json","required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"submit-doc","connection":"default","uid":"api::submit-doc.submit-doc","apiName":"submit-doc","globalId":"SubmitDoc","actions":{},"lifecycles":{}},"api::why-us.why-us":{"kind":"collectionType","collectionName":"why_uses","info":{"singularName":"why-us","pluralName":"why-uses","displayName":"WhyUs","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"order":{"pluginOptions":{"i18n":{"localized":false}},"type":"integer","required":true},"image":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::why-us.why-us"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"why_uses","info":{"singularName":"why-us","pluralName":"why-uses","displayName":"WhyUs","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"order":{"pluginOptions":{"i18n":{"localized":false}},"type":"integer","required":true},"image":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}}},"kind":"collectionType"},"modelType":"contentType","modelName":"why-us","connection":"default","uid":"api::why-us.why-us","apiName":"why-us","globalId":"WhyUs","actions":{},"lifecycles":{}}}	object	\N	\N
10	plugin_content_manager_configuration_content_types::plugin::upload.file	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"folder":{"edit":{"label":"folder","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"folder","searchable":true,"sortable":true}},"folderPath":{"edit":{"label":"folderPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"folderPath","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}],[{"name":"folder","size":6},{"name":"folderPath","size":6}]]},"uid":"plugin::upload.file"}	object	\N	\N
12	plugin_content_manager_configuration_content_types::plugin::users-permissions.permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"edit":[[{"name":"action","size":6},{"name":"role","size":6}]]},"uid":"plugin::users-permissions.permission"}	object	\N	\N
11	plugin_content_manager_configuration_content_types::plugin::content-releases.release	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"releasedAt":{"edit":{"label":"releasedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"releasedAt","searchable":true,"sortable":true}},"scheduledAt":{"edit":{"label":"scheduledAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"scheduledAt","searchable":true,"sortable":true}},"timezone":{"edit":{"label":"timezone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"timezone","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"actions":{"edit":{"label":"actions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"contentType"},"list":{"label":"actions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","releasedAt","scheduledAt"],"edit":[[{"name":"name","size":6},{"name":"releasedAt","size":6}],[{"name":"scheduledAt","size":6},{"name":"timezone","size":6}],[{"name":"status","size":6},{"name":"actions","size":6}]]},"uid":"plugin::content-releases.release"}	object	\N	\N
13	plugin_content_manager_configuration_content_types::plugin::content-releases.release-action	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"contentType","defaultSortBy":"contentType","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"contentType":{"edit":{"label":"contentType","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contentType","searchable":true,"sortable":true}},"locale":{"edit":{"label":"locale","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"locale","searchable":true,"sortable":true}},"release":{"edit":{"label":"release","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"release","searchable":true,"sortable":true}},"isEntryValid":{"edit":{"label":"isEntryValid","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isEntryValid","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","type","contentType","locale"],"edit":[[{"name":"type","size":6},{"name":"contentType","size":6}],[{"name":"locale","size":6},{"name":"release","size":6}],[{"name":"isEntryValid","size":4}]]},"uid":"plugin::content-releases.release-action"}	object	\N	\N
14	plugin_content_manager_configuration_content_types::plugin::users-permissions.user	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"role","size":6}]]},"uid":"plugin::users-permissions.user"}	object	\N	\N
15	plugin_content_manager_configuration_content_types::plugin::users-permissions.role	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"permissions","size":6}],[{"name":"users","size":6}]]},"uid":"plugin::users-permissions.role"}	object	\N	\N
16	plugin_content_manager_configuration_content_types::plugin::i18n.locale	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]},"uid":"plugin::i18n.locale"}	object	\N	\N
17	plugin_upload_settings	{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false}	object	\N	\N
18	plugin_upload_view_configuration	{"pageSize":10,"sort":"createdAt:DESC"}	object	\N	\N
20	plugin_users-permissions_grant	{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"discord","key":"","secret":"","callback":"api/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-square","key":"","secret":"","callback":"api/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"api/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","callback":"api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"api/auth/twitter/callback"},"instagram":{"enabled":false,"icon":"instagram","key":"","secret":"","callback":"api/auth/instagram/callback","scope":["user_profile"]},"vk":{"enabled":false,"icon":"vk","key":"","secret":"","callback":"api/auth/vk/callback","scope":["email"]},"twitch":{"enabled":false,"icon":"twitch","key":"","secret":"","callback":"api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"enabled":false,"icon":"linkedin","key":"","secret":"","callback":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"enabled":false,"icon":"aws","key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"enabled":false,"icon":"reddit","key":"","secret":"","state":true,"callback":"api/auth/reddit/callback","scope":["identity"]},"auth0":{"enabled":false,"icon":"","key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"enabled":false,"icon":"book","key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"},"patreon":{"enabled":false,"icon":"","key":"","secret":"","callback":"api/auth/patreon/callback","scope":["identity","identity[email]"]},"keycloak":{"enabled":false,"icon":"","key":"","secret":"","subdomain":"myKeycloakProvider.com/realms/myrealm","callback":"api/auth/keycloak/callback","scope":["openid","email","profile"]}}	object	\N	\N
21	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object	\N	\N
22	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}	object	\N	\N
19	plugin_upload_metrics	{"weeklySchedule":"26 32 19 * * 5","lastWeeklyUpdate":1715358979938}	object	\N	\N
31	plugin_upload_api-folder	{"id":1}	object	\N	\N
25	plugin_content_manager_configuration_content_types::api::lang.lang	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"ky":{"edit":{"label":"ky","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ky","searchable":false,"sortable":false}},"ru":{"edit":{"label":"ru","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ru","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"ky","size":12}],[{"name":"ru","size":12}]],"list":["id","createdAt","updatedAt","createdBy"]},"uid":"api::lang.lang"}	object	\N	\N
32	plugin_content_manager_configuration_content_types::api::hero.hero	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","description","image"],"edit":[[{"name":"title","size":6},{"name":"description","size":6}],[{"name":"image","size":6}]]},"uid":"api::hero.hero"}	object	\N	\N
33	plugin_content_manager_configuration_content_types::api::group-category.group-category	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"category","defaultSortBy":"category","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"category":{"edit":{"label":"category","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"category","searchable":true,"sortable":true}},"age":{"edit":{"label":"age","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"age","searchable":true,"sortable":true}},"language":{"edit":{"label":"language","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"language","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}},"order":{"edit":{"label":"order","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"order","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","category","age","language"],"edit":[[{"name":"category","size":6},{"name":"age","size":6}],[{"name":"language","size":6},{"name":"image","size":6}],[{"name":"order","size":4}]]},"uid":"api::group-category.group-category"}	object	\N	\N
35	plugin_content_manager_configuration_content_types::api::why-us.why-us	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"order":{"edit":{"label":"order","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"order","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","order","image"],"edit":[[{"name":"title","size":6},{"name":"order","size":4}],[{"name":"image","size":6}]]},"uid":"api::why-us.why-us"}	object	\N	\N
37	plugin_content_manager_configuration_content_types::api::home-program-item.home-program-item	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","image","createdAt"],"edit":[[{"name":"title","size":6},{"name":"image","size":6}]]},"uid":"api::home-program-item.home-program-item"}	object	\N	\N
38	plugin_content_manager_configuration_content_types::api::home-gallery-info.home-gallery-info	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","description","image","createdAt"],"edit":[[{"name":"description","size":6},{"name":"image","size":6}]]},"uid":"api::home-gallery-info.home-gallery-info"}	object	\N	\N
42	plugin_content_manager_configuration_content_types::api::instruction.instruction	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"content":{"edit":{"label":"content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","content","createdAt","updatedAt"],"edit":[[{"name":"content","size":6}]]},"uid":"api::instruction.instruction"}	object	\N	\N
40	plugin_content_manager_configuration_content_types::api::blog.blog	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"post":{"edit":{"label":"post","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"post","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","image","title","createdAt"],"edit":[[{"name":"image","size":6},{"name":"title","size":6}],[{"name":"post","size":12}]]},"uid":"api::blog.blog"}	object	\N	\N
41	plugin_content_manager_configuration_content_types::api::gallery.gallery	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"album":{"edit":{"label":"album","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"album","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","album","createdAt","updatedAt"],"edit":[[{"name":"album","size":6}]]},"uid":"api::gallery.gallery"}	object	\N	\N
39	plugin_content_manager_configuration_content_types::api::detail.detail	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"tel1":{"edit":{"label":"tel1","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"tel1","searchable":true,"sortable":true}},"tel2":{"edit":{"label":"tel2","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"tel2","searchable":true,"sortable":true}},"weekday":{"edit":{"label":"weekday","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"weekday","searchable":true,"sortable":true}},"weekend":{"edit":{"label":"weekend","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"weekend","searchable":true,"sortable":true}},"orgName":{"edit":{"label":"orgName","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"orgName","searchable":true,"sortable":true}},"address":{"edit":{"label":"address","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"address","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","createdAt","updatedAt","createdBy"],"edit":[[{"name":"tel1","size":6},{"name":"tel2","size":6}],[{"name":"weekday","size":6},{"name":"weekend","size":6}],[{"name":"orgName","size":6},{"name":"address","size":6}]]},"uid":"api::detail.detail"}	object	\N	\N
34	plugin_content_manager_configuration_content_types::api::about.about	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}},"order":{"edit":{"label":"order","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"order","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","description","image","createdAt"],"edit":[[{"name":"description","size":6},{"name":"image","size":6}],[{"name":"order","size":4}]]},"uid":"api::about.about"}	object	\N	\N
44	plugin_content_manager_configuration_content_types::api::calendar.calendar	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"calendatID","defaultSortBy":"calendatID","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"calendatID":{"edit":{"label":"calendatID","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"calendatID","searchable":true,"sortable":true}},"publicKey":{"edit":{"label":"publicKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"publicKey","searchable":true,"sortable":true}},"category":{"edit":{"label":"category","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"category","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"category","size":6}],[{"name":"calendatID","size":6},{"name":"publicKey","size":6}]],"list":["id","calendatID","publicKey","category"]},"uid":"api::calendar.calendar"}	object	\N	\N
46	plugin_content_manager_configuration_content_types::api::logo.logo	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"logo":{"edit":{"label":"logo","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"logo","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","logo","createdAt","updatedAt"],"edit":[[{"name":"logo","size":6}]]},"uid":"api::logo.logo"}	object	\N	\N
47	plugin_content_manager_configuration_content_types::api::submit-doc.submit-doc	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"formVariant":{"edit":{"label":"formVariant","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formVariant","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","createdAt","updatedAt","createdBy"],"edit":[[{"name":"formVariant","size":12}]]},"uid":"api::submit-doc.submit-doc"}	object	\N	\N
51	plugin_content_manager_configuration_content_types::api::form-error.form-error	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"errors":{"edit":{"label":"errors","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"errors","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","createdAt","updatedAt","createdBy"],"edit":[[{"name":"errors","size":12}]]},"uid":"api::form-error.form-error"}	object	\N	\N
49	plugin_content_manager_configuration_content_types::api::form-type.form-type	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"twoParents":{"edit":{"label":"twoParents","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"twoParents","searchable":false,"sortable":false}},"oneParent":{"edit":{"label":"oneParent","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"oneParent","searchable":false,"sortable":false}},"divorced":{"edit":{"label":"divorced","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"divorced","searchable":false,"sortable":false}},"guardian":{"edit":{"label":"guardian","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"guardian","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","createdAt","updatedAt","createdBy"],"edit":[[{"name":"twoParents","size":12}],[{"name":"oneParent","size":12}],[{"name":"divorced","size":12}],[{"name":"guardian","size":12}]]},"uid":"api::form-type.form-type"}	object	\N	\N
50	plugin_content_manager_configuration_content_types::api::docs-list.docs-list	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"docType":{"edit":{"label":"docType","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"docType","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","createdAt","updatedAt","createdBy"],"edit":[[{"name":"docType","size":12}]]},"uid":"api::docs-list.docs-list"}	object	\N	\N
\.


--
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
62	{"tables":[{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action_parameters","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users","indexes":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_tokens","indexes":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions","indexes":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_releases","indexes":[{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"released_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"scheduled_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"timezone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_release_actions","indexes":[{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"target_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"target_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_entry_valid","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_roles","indexes":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users","indexes":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"abouts","indexes":[{"name":"abouts_created_by_id_fk","columns":["created_by_id"]},{"name":"abouts_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"abouts_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"abouts_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"blogs","indexes":[{"name":"blogs_created_by_id_fk","columns":["created_by_id"]},{"name":"blogs_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"blogs_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"blogs_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"post","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"calendars","indexes":[{"name":"calendars_created_by_id_fk","columns":["created_by_id"]},{"name":"calendars_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"calendars_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"calendars_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"calendat_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"public_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"category","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"details","indexes":[{"name":"details_created_by_id_fk","columns":["created_by_id"]},{"name":"details_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"details_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"details_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"tel_1","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tel_2","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"weekday","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"weekend","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"org_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"address","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"docs_lists","indexes":[{"name":"docs_lists_created_by_id_fk","columns":["created_by_id"]},{"name":"docs_lists_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"docs_lists_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"docs_lists_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"doc_type","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"form_errors","indexes":[{"name":"form_errors_created_by_id_fk","columns":["created_by_id"]},{"name":"form_errors_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"form_errors_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"form_errors_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"errors","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"form_types","indexes":[{"name":"form_types_created_by_id_fk","columns":["created_by_id"]},{"name":"form_types_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"form_types_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"form_types_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"two_parents","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"one_parent","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"divorced","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"guardian","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"galleries","indexes":[{"name":"galleries_created_by_id_fk","columns":["created_by_id"]},{"name":"galleries_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"galleries_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"galleries_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"group_categories","indexes":[{"name":"group_categories_created_by_id_fk","columns":["created_by_id"]},{"name":"group_categories_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"group_categories_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"group_categories_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"category","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"age","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"heroes","indexes":[{"name":"heroes_created_by_id_fk","columns":["created_by_id"]},{"name":"heroes_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"heroes_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"heroes_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"home_gallery_infos","indexes":[{"name":"home_gallery_infos_created_by_id_fk","columns":["created_by_id"]},{"name":"home_gallery_infos_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"home_gallery_infos_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"home_gallery_infos_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"home_program_items","indexes":[{"name":"home_program_items_created_by_id_fk","columns":["created_by_id"]},{"name":"home_program_items_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"home_program_items_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"home_program_items_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"instructions","indexes":[{"name":"instructions_created_by_id_fk","columns":["created_by_id"]},{"name":"instructions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"instructions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"instructions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"langs","indexes":[{"name":"langs_created_by_id_fk","columns":["created_by_id"]},{"name":"langs_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"langs_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"langs_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"ky","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ru","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"logos","indexes":[{"name":"logos_created_by_id_fk","columns":["created_by_id"]},{"name":"logos_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"logos_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"logos_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"submit_docs","indexes":[{"name":"submit_docs_created_by_id_fk","columns":["created_by_id"]},{"name":"submit_docs_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"submit_docs_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"submit_docs_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"form_variant","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"why_uses","indexes":[{"name":"why_uses_created_by_id_fk","columns":["created_by_id"]},{"name":"why_uses_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"why_uses_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"why_uses_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions_role_links","indexes":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"]},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"admin_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"admin_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_links","indexes":[{"name":"admin_users_roles_links_fk","columns":["user_id"]},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"]},{"name":"admin_users_roles_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"admin_users_roles_links_order_fk","columns":["role_order"]},{"name":"admin_users_roles_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"admin_users_roles_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_links","indexes":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"]},{"name":"strapi_api_token_permissions_token_links_unique","columns":["api_token_permission_id","api_token_id"],"type":"unique"},{"name":"strapi_api_token_permissions_token_links_order_inv_fk","columns":["api_token_permission_order"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions_token_links","indexes":[{"name":"strapi_transfer_token_permissions_token_links_fk","columns":["transfer_token_permission_id"]},{"name":"strapi_transfer_token_permissions_token_links_inv_fk","columns":["transfer_token_id"]},{"name":"strapi_transfer_token_permissions_token_links_unique","columns":["transfer_token_permission_id","transfer_token_id"],"type":"unique"},{"name":"strapi_transfer_token_permissions_token_links_order_inv_fk","columns":["transfer_token_permission_order"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_token_links_fk","columns":["transfer_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_token_permissions","onDelete":"CASCADE"},{"name":"strapi_transfer_token_permissions_token_links_inv_fk","columns":["transfer_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"transfer_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_morphs","indexes":[{"name":"files_related_morphs_fk","columns":["file_id"]},{"name":"files_related_morphs_order_index","columns":["order"]},{"name":"files_related_morphs_id_column_index","columns":["related_id"]}],"foreignKeys":[{"name":"files_related_morphs_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_links","indexes":[{"name":"files_folder_links_fk","columns":["file_id"]},{"name":"files_folder_links_inv_fk","columns":["folder_id"]},{"name":"files_folder_links_unique","columns":["file_id","folder_id"],"type":"unique"},{"name":"files_folder_links_order_inv_fk","columns":["file_order"]}],"foreignKeys":[{"name":"files_folder_links_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_links_inv_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"file_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_links","indexes":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"]},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"]},{"name":"upload_folders_parent_links_unique","columns":["folder_id","inv_folder_id"],"type":"unique"},{"name":"upload_folders_parent_links_order_inv_fk","columns":["folder_order"]}],"foreignKeys":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_release_actions_release_links","indexes":[{"name":"strapi_release_actions_release_links_fk","columns":["release_action_id"]},{"name":"strapi_release_actions_release_links_inv_fk","columns":["release_id"]},{"name":"strapi_release_actions_release_links_unique","columns":["release_action_id","release_id"],"type":"unique"},{"name":"strapi_release_actions_release_links_order_inv_fk","columns":["release_action_order"]}],"foreignKeys":[{"name":"strapi_release_actions_release_links_fk","columns":["release_action_id"],"referencedColumns":["id"],"referencedTable":"strapi_release_actions","onDelete":"CASCADE"},{"name":"strapi_release_actions_release_links_inv_fk","columns":["release_id"],"referencedColumns":["id"],"referencedTable":"strapi_releases","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"release_action_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_action_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_links","indexes":[{"name":"up_permissions_role_links_fk","columns":["permission_id"]},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"up_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"up_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"up_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_links","indexes":[{"name":"up_users_role_links_fk","columns":["user_id"]},{"name":"up_users_role_links_inv_fk","columns":["role_id"]},{"name":"up_users_role_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"up_users_role_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"up_users_role_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"abouts_localizations_links","indexes":[{"name":"abouts_localizations_links_fk","columns":["about_id"]},{"name":"abouts_localizations_links_inv_fk","columns":["inv_about_id"]},{"name":"abouts_localizations_links_unique","columns":["about_id","inv_about_id"],"type":"unique"},{"name":"abouts_localizations_links_order_fk","columns":["about_order"]}],"foreignKeys":[{"name":"abouts_localizations_links_fk","columns":["about_id"],"referencedColumns":["id"],"referencedTable":"abouts","onDelete":"CASCADE"},{"name":"abouts_localizations_links_inv_fk","columns":["inv_about_id"],"referencedColumns":["id"],"referencedTable":"abouts","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"about_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_about_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"about_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"blogs_localizations_links","indexes":[{"name":"blogs_localizations_links_fk","columns":["blog_id"]},{"name":"blogs_localizations_links_inv_fk","columns":["inv_blog_id"]},{"name":"blogs_localizations_links_unique","columns":["blog_id","inv_blog_id"],"type":"unique"},{"name":"blogs_localizations_links_order_fk","columns":["blog_order"]}],"foreignKeys":[{"name":"blogs_localizations_links_fk","columns":["blog_id"],"referencedColumns":["id"],"referencedTable":"blogs","onDelete":"CASCADE"},{"name":"blogs_localizations_links_inv_fk","columns":["inv_blog_id"],"referencedColumns":["id"],"referencedTable":"blogs","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"blog_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_blog_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"blog_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"details_localizations_links","indexes":[{"name":"details_localizations_links_fk","columns":["detail_id"]},{"name":"details_localizations_links_inv_fk","columns":["inv_detail_id"]},{"name":"details_localizations_links_unique","columns":["detail_id","inv_detail_id"],"type":"unique"},{"name":"details_localizations_links_order_fk","columns":["detail_order"]}],"foreignKeys":[{"name":"details_localizations_links_fk","columns":["detail_id"],"referencedColumns":["id"],"referencedTable":"details","onDelete":"CASCADE"},{"name":"details_localizations_links_inv_fk","columns":["inv_detail_id"],"referencedColumns":["id"],"referencedTable":"details","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"detail_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_detail_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"detail_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"group_categories_localizations_links","indexes":[{"name":"group_categories_localizations_links_fk","columns":["group_category_id"]},{"name":"group_categories_localizations_links_inv_fk","columns":["inv_group_category_id"]},{"name":"group_categories_localizations_links_unique","columns":["group_category_id","inv_group_category_id"],"type":"unique"},{"name":"group_categories_localizations_links_order_fk","columns":["group_category_order"]}],"foreignKeys":[{"name":"group_categories_localizations_links_fk","columns":["group_category_id"],"referencedColumns":["id"],"referencedTable":"group_categories","onDelete":"CASCADE"},{"name":"group_categories_localizations_links_inv_fk","columns":["inv_group_category_id"],"referencedColumns":["id"],"referencedTable":"group_categories","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"group_category_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_group_category_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"group_category_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"heroes_localizations_links","indexes":[{"name":"heroes_localizations_links_fk","columns":["hero_id"]},{"name":"heroes_localizations_links_inv_fk","columns":["inv_hero_id"]},{"name":"heroes_localizations_links_unique","columns":["hero_id","inv_hero_id"],"type":"unique"},{"name":"heroes_localizations_links_order_fk","columns":["hero_order"]}],"foreignKeys":[{"name":"heroes_localizations_links_fk","columns":["hero_id"],"referencedColumns":["id"],"referencedTable":"heroes","onDelete":"CASCADE"},{"name":"heroes_localizations_links_inv_fk","columns":["inv_hero_id"],"referencedColumns":["id"],"referencedTable":"heroes","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"hero_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_hero_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"hero_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"home_gallery_infos_localizations_links","indexes":[{"name":"home_gallery_infos_localizations_links_fk","columns":["home_gallery_info_id"]},{"name":"home_gallery_infos_localizations_links_inv_fk","columns":["inv_home_gallery_info_id"]},{"name":"home_gallery_infos_localizations_links_unique","columns":["home_gallery_info_id","inv_home_gallery_info_id"],"type":"unique"},{"name":"home_gallery_infos_localizations_links_order_fk","columns":["home_gallery_info_order"]}],"foreignKeys":[{"name":"home_gallery_infos_localizations_links_fk","columns":["home_gallery_info_id"],"referencedColumns":["id"],"referencedTable":"home_gallery_infos","onDelete":"CASCADE"},{"name":"home_gallery_infos_localizations_links_inv_fk","columns":["inv_home_gallery_info_id"],"referencedColumns":["id"],"referencedTable":"home_gallery_infos","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"home_gallery_info_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_home_gallery_info_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"home_gallery_info_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"home_program_items_localizations_links","indexes":[{"name":"home_program_items_localizations_links_fk","columns":["home_program_item_id"]},{"name":"home_program_items_localizations_links_inv_fk","columns":["inv_home_program_item_id"]},{"name":"home_program_items_localizations_links_unique","columns":["home_program_item_id","inv_home_program_item_id"],"type":"unique"},{"name":"home_program_items_localizations_links_order_fk","columns":["home_program_item_order"]}],"foreignKeys":[{"name":"home_program_items_localizations_links_fk","columns":["home_program_item_id"],"referencedColumns":["id"],"referencedTable":"home_program_items","onDelete":"CASCADE"},{"name":"home_program_items_localizations_links_inv_fk","columns":["inv_home_program_item_id"],"referencedColumns":["id"],"referencedTable":"home_program_items","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"home_program_item_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_home_program_item_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"home_program_item_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"instructions_localizations_links","indexes":[{"name":"instructions_localizations_links_fk","columns":["instruction_id"]},{"name":"instructions_localizations_links_inv_fk","columns":["inv_instruction_id"]},{"name":"instructions_localizations_links_unique","columns":["instruction_id","inv_instruction_id"],"type":"unique"},{"name":"instructions_localizations_links_order_fk","columns":["instruction_order"]}],"foreignKeys":[{"name":"instructions_localizations_links_fk","columns":["instruction_id"],"referencedColumns":["id"],"referencedTable":"instructions","onDelete":"CASCADE"},{"name":"instructions_localizations_links_inv_fk","columns":["inv_instruction_id"],"referencedColumns":["id"],"referencedTable":"instructions","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"instruction_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_instruction_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"instruction_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"submit_docs_localizations_links","indexes":[{"name":"submit_docs_localizations_links_fk","columns":["submit_doc_id"]},{"name":"submit_docs_localizations_links_inv_fk","columns":["inv_submit_doc_id"]},{"name":"submit_docs_localizations_links_unique","columns":["submit_doc_id","inv_submit_doc_id"],"type":"unique"},{"name":"submit_docs_localizations_links_order_fk","columns":["submit_doc_order"]}],"foreignKeys":[{"name":"submit_docs_localizations_links_fk","columns":["submit_doc_id"],"referencedColumns":["id"],"referencedTable":"submit_docs","onDelete":"CASCADE"},{"name":"submit_docs_localizations_links_inv_fk","columns":["inv_submit_doc_id"],"referencedColumns":["id"],"referencedTable":"submit_docs","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"submit_doc_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_submit_doc_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"submit_doc_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"why_uses_localizations_links","indexes":[{"name":"why_uses_localizations_links_fk","columns":["why_us_id"]},{"name":"why_uses_localizations_links_inv_fk","columns":["inv_why_us_id"]},{"name":"why_uses_localizations_links_unique","columns":["why_us_id","inv_why_us_id"],"type":"unique"},{"name":"why_uses_localizations_links_order_fk","columns":["why_us_order"]}],"foreignKeys":[{"name":"why_uses_localizations_links_fk","columns":["why_us_id"],"referencedColumns":["id"],"referencedTable":"why_uses","onDelete":"CASCADE"},{"name":"why_uses_localizations_links_inv_fk","columns":["inv_why_us_id"],"referencedColumns":["id"],"referencedTable":"why_uses","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"why_us_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_why_us_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"why_us_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}	2024-05-07 03:50:09.484	742354c6e228ea3b565956197adce61e
\.


--
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.strapi_migrations (id, name, "time") FROM stdin;
\.


--
-- Data for Name: strapi_release_actions; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.strapi_release_actions (id, type, target_id, target_type, content_type, locale, is_entry_valid, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_release_actions_release_links; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.strapi_release_actions_release_links (id, release_action_id, release_id, release_action_order) FROM stdin;
\.


--
-- Data for Name: strapi_releases; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.strapi_releases (id, name, released_at, scheduled_at, timezone, status, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_token_permissions; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.strapi_transfer_token_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_token_permissions_token_links; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.strapi_transfer_token_permissions_token_links (id, transfer_token_permission_id, transfer_token_id, transfer_token_permission_order) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_tokens; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.strapi_transfer_tokens (id, name, description, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
\.


--
-- Data for Name: submit_docs; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.submit_docs (id, form_variant, created_at, updated_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: submit_docs_localizations_links; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.submit_docs_localizations_links (id, submit_doc_id, inv_submit_doc_id, submit_doc_order) FROM stdin;
\.


--
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	plugin::users-permissions.user.me	2024-04-05 06:03:13.402	2024-04-05 06:03:13.402	\N	\N
2	plugin::users-permissions.auth.changePassword	2024-04-05 06:03:13.402	2024-04-05 06:03:13.402	\N	\N
3	plugin::users-permissions.auth.callback	2024-04-05 06:03:13.406	2024-04-05 06:03:13.406	\N	\N
4	plugin::users-permissions.auth.connect	2024-04-05 06:03:13.406	2024-04-05 06:03:13.406	\N	\N
5	plugin::users-permissions.auth.forgotPassword	2024-04-05 06:03:13.406	2024-04-05 06:03:13.406	\N	\N
6	plugin::users-permissions.auth.resetPassword	2024-04-05 06:03:13.406	2024-04-05 06:03:13.406	\N	\N
7	plugin::users-permissions.auth.register	2024-04-05 06:03:13.406	2024-04-05 06:03:13.406	\N	\N
8	plugin::users-permissions.auth.emailConfirmation	2024-04-05 06:03:13.406	2024-04-05 06:03:13.406	\N	\N
9	plugin::users-permissions.auth.sendEmailConfirmation	2024-04-05 06:03:13.406	2024-04-05 06:03:13.406	\N	\N
10	api::lang.lang.find	2024-04-05 06:07:05.617	2024-04-05 06:07:05.617	\N	\N
18	plugin::upload.content-api.upload	2024-04-08 02:31:45.794	2024-04-08 02:31:45.794	\N	\N
19	plugin::i18n.locales.listLocales	2024-04-08 02:31:45.794	2024-04-08 02:31:45.794	\N	\N
20	plugin::upload.content-api.find	2024-04-08 04:39:12.697	2024-04-08 04:39:12.697	\N	\N
21	plugin::upload.content-api.findOne	2024-04-08 04:39:12.697	2024-04-08 04:39:12.697	\N	\N
22	api::hero.hero.find	2024-04-09 02:25:59.958	2024-04-09 02:25:59.958	\N	\N
23	api::group-category.group-category.find	2024-04-09 03:44:30.906	2024-04-09 03:44:30.906	\N	\N
24	api::about.about.find	2024-04-09 04:58:18.902	2024-04-09 04:58:18.902	\N	\N
25	api::why-us.why-us.find	2024-04-09 05:24:22.755	2024-04-09 05:24:22.755	\N	\N
27	api::home-program-item.home-program-item.find	2024-04-09 06:32:51.344	2024-04-09 06:32:51.344	\N	\N
28	api::home-gallery-info.home-gallery-info.find	2024-04-09 07:06:10.195	2024-04-09 07:06:10.195	\N	\N
29	api::detail.detail.find	2024-04-09 07:53:13.506	2024-04-09 07:53:13.506	\N	\N
30	api::blog.blog.find	2024-04-09 11:27:06.35	2024-04-09 11:27:06.35	\N	\N
31	api::gallery.gallery.find	2024-04-10 01:20:25.533	2024-04-10 01:20:25.533	\N	\N
32	api::calendar.calendar.find	2024-04-14 06:08:30.325	2024-04-14 06:08:30.325	\N	\N
33	api::calendar.calendar.findOne	2024-04-14 06:10:43.096	2024-04-14 06:10:43.096	\N	\N
34	api::logo.logo.find	2024-04-29 13:35:26.133	2024-04-29 13:35:26.133	\N	\N
35	api::docs-list.docs-list.find	2024-05-07 00:23:10.512	2024-05-07 00:23:10.512	\N	\N
36	api::form-type.form-type.find	2024-05-07 00:23:10.512	2024-05-07 00:23:10.512	\N	\N
37	api::form-error.form-error.find	2024-05-07 03:50:55.295	2024-05-07 03:50:55.295	\N	\N
38	api::instruction.instruction.find	2024-05-08 15:33:54.952	2024-05-08 15:33:54.952	\N	\N
\.


--
-- Data for Name: up_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.up_permissions_role_links (id, permission_id, role_id, permission_order) FROM stdin;
1	1	1	1
2	2	1	1
3	3	2	1
4	4	2	1
5	5	2	1
6	7	2	1
7	8	2	2
8	6	2	2
9	9	2	2
10	10	2	3
18	18	2	7
19	19	2	8
20	20	2	9
21	21	2	9
22	22	2	10
23	23	2	11
24	24	2	12
25	25	2	13
27	27	2	15
28	28	2	16
29	29	2	17
30	30	2	18
31	31	2	19
32	32	2	20
33	33	2	21
34	34	2	22
35	36	2	23
36	35	2	23
37	37	2	24
38	38	2	25
\.


--
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.up_roles (id, name, description, type, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Authenticated	Default role given to authenticated user.	authenticated	2024-04-05 06:03:13.398	2024-04-05 06:03:13.398	\N	\N
2	Public	Default role given to unauthenticated user.	public	2024-04-05 06:03:13.4	2024-05-08 15:45:17.422	\N	\N
\.


--
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.up_users (id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: up_users_role_links; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.up_users_role_links (id, user_id, role_id, user_order) FROM stdin;
\.


--
-- Data for Name: upload_folders; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.upload_folders (id, name, path_id, path, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: upload_folders_parent_links; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.upload_folders_parent_links (id, folder_id, inv_folder_id, folder_order) FROM stdin;
\.


--
-- Data for Name: why_uses; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.why_uses (id, title, "order", created_at, updated_at, created_by_id, updated_by_id, locale) FROM stdin;
2	Индивидуальный подход	1	2024-04-09 05:21:38.759	2024-04-09 05:21:38.759	1	1	ru
1	Индивидуальный подход	1	2024-04-09 05:21:32.593	2024-04-09 05:21:38.781	1	1	ky
6	Творческое обучение	3	2024-04-09 05:24:02.918	2024-04-09 05:24:02.918	1	1	ky
5	Творческое обучение	3	2024-04-09 05:23:56.402	2024-04-09 05:24:02.937	1	1	ru
4	Безопасная среда	2	2024-04-09 05:23:17.345	2024-05-10 18:44:30.484	1	1	ky
3	Безопасная среда	2	2024-04-09 05:23:09.777	2024-05-10 18:44:30.497	1	1	ru
\.


--
-- Data for Name: why_uses_localizations_links; Type: TABLE DATA; Schema: public; Owner: beksultanabdikaarov
--

COPY public.why_uses_localizations_links (id, why_us_id, inv_why_us_id, why_us_order) FROM stdin;
1	2	1	1
2	1	2	1
3	4	3	1
4	3	4	1
5	6	5	1
6	5	6	1
\.


--
-- Name: abouts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.abouts_id_seq', 4, true);


--
-- Name: abouts_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.abouts_localizations_links_id_seq', 4, true);


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 232, true);


--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.admin_permissions_role_links_id_seq', 232, true);


--
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);


--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.admin_users_roles_links_id_seq', 1, true);


--
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.blogs_id_seq', 16, true);


--
-- Name: blogs_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.blogs_localizations_links_id_seq', 14, true);


--
-- Name: calendars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.calendars_id_seq', 11, true);


--
-- Name: details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.details_id_seq', 2, true);


--
-- Name: details_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.details_localizations_links_id_seq', 2, true);


--
-- Name: docs_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.docs_lists_id_seq', 8, true);


--
-- Name: files_folder_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.files_folder_links_id_seq', 41, true);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.files_id_seq', 67, true);


--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.files_related_morphs_id_seq', 166, true);


--
-- Name: form_errors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.form_errors_id_seq', 1, true);


--
-- Name: form_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.form_types_id_seq', 1, true);


--
-- Name: galleries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.galleries_id_seq', 3, true);


--
-- Name: group_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.group_categories_id_seq', 7, true);


--
-- Name: group_categories_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.group_categories_localizations_links_id_seq', 6, true);


--
-- Name: heroes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.heroes_id_seq', 2, true);


--
-- Name: heroes_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.heroes_localizations_links_id_seq', 2, true);


--
-- Name: home_gallery_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.home_gallery_infos_id_seq', 2, true);


--
-- Name: home_gallery_infos_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.home_gallery_infos_localizations_links_id_seq', 2, true);


--
-- Name: home_program_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.home_program_items_id_seq', 8, true);


--
-- Name: home_program_items_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.home_program_items_localizations_links_id_seq', 8, true);


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 3, true);


--
-- Name: instructions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.instructions_id_seq', 2, true);


--
-- Name: instructions_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.instructions_localizations_links_id_seq', 2, true);


--
-- Name: langs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.langs_id_seq', 1, true);


--
-- Name: logos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.logos_id_seq', 1, true);


--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);


--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_links_id_seq', 1, false);


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 1, true);


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 51, true);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 62, true);


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);


--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.strapi_release_actions_id_seq', 1, false);


--
-- Name: strapi_release_actions_release_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.strapi_release_actions_release_links_id_seq', 1, false);


--
-- Name: strapi_releases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.strapi_releases_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_token_links_id_seq', 1, false);


--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.strapi_transfer_tokens_id_seq', 1, false);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- Name: submit_docs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.submit_docs_id_seq', 1, false);


--
-- Name: submit_docs_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.submit_docs_localizations_links_id_seq', 1, false);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 38, true);


--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.up_permissions_role_links_id_seq', 38, true);


--
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 2, true);


--
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.up_users_id_seq', 1, false);


--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.up_users_role_links_id_seq', 1, false);


--
-- Name: upload_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.upload_folders_id_seq', 2, true);


--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.upload_folders_parent_links_id_seq', 1, false);


--
-- Name: why_uses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.why_uses_id_seq', 6, true);


--
-- Name: why_uses_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beksultanabdikaarov
--

SELECT pg_catalog.setval('public.why_uses_localizations_links_id_seq', 6, true);


--
-- Name: abouts_localizations_links abouts_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.abouts_localizations_links
    ADD CONSTRAINT abouts_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: abouts_localizations_links abouts_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.abouts_localizations_links
    ADD CONSTRAINT abouts_localizations_links_unique UNIQUE (about_id, inv_about_id);


--
-- Name: abouts abouts_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.abouts
    ADD CONSTRAINT abouts_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_links admin_permissions_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_links admin_permissions_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_unique UNIQUE (permission_id, role_id);


--
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_links admin_users_roles_links_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_links admin_users_roles_links_unique; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_unique UNIQUE (user_id, role_id);


--
-- Name: blogs_localizations_links blogs_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.blogs_localizations_links
    ADD CONSTRAINT blogs_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: blogs_localizations_links blogs_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.blogs_localizations_links
    ADD CONSTRAINT blogs_localizations_links_unique UNIQUE (blog_id, inv_blog_id);


--
-- Name: blogs blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: calendars calendars_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.calendars
    ADD CONSTRAINT calendars_pkey PRIMARY KEY (id);


--
-- Name: details_localizations_links details_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.details_localizations_links
    ADD CONSTRAINT details_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: details_localizations_links details_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.details_localizations_links
    ADD CONSTRAINT details_localizations_links_unique UNIQUE (detail_id, inv_detail_id);


--
-- Name: details details_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.details
    ADD CONSTRAINT details_pkey PRIMARY KEY (id);


--
-- Name: docs_lists docs_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.docs_lists
    ADD CONSTRAINT docs_lists_pkey PRIMARY KEY (id);


--
-- Name: files_folder_links files_folder_links_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_pkey PRIMARY KEY (id);


--
-- Name: files_folder_links files_folder_links_unique; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_unique UNIQUE (file_id, folder_id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: files_related_morphs files_related_morphs_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_pkey PRIMARY KEY (id);


--
-- Name: form_errors form_errors_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.form_errors
    ADD CONSTRAINT form_errors_pkey PRIMARY KEY (id);


--
-- Name: form_types form_types_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.form_types
    ADD CONSTRAINT form_types_pkey PRIMARY KEY (id);


--
-- Name: galleries galleries_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.galleries
    ADD CONSTRAINT galleries_pkey PRIMARY KEY (id);


--
-- Name: group_categories_localizations_links group_categories_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.group_categories_localizations_links
    ADD CONSTRAINT group_categories_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: group_categories_localizations_links group_categories_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.group_categories_localizations_links
    ADD CONSTRAINT group_categories_localizations_links_unique UNIQUE (group_category_id, inv_group_category_id);


--
-- Name: group_categories group_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.group_categories
    ADD CONSTRAINT group_categories_pkey PRIMARY KEY (id);


--
-- Name: heroes_localizations_links heroes_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.heroes_localizations_links
    ADD CONSTRAINT heroes_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: heroes_localizations_links heroes_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.heroes_localizations_links
    ADD CONSTRAINT heroes_localizations_links_unique UNIQUE (hero_id, inv_hero_id);


--
-- Name: heroes heroes_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.heroes
    ADD CONSTRAINT heroes_pkey PRIMARY KEY (id);


--
-- Name: home_gallery_infos_localizations_links home_gallery_infos_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.home_gallery_infos_localizations_links
    ADD CONSTRAINT home_gallery_infos_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: home_gallery_infos_localizations_links home_gallery_infos_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.home_gallery_infos_localizations_links
    ADD CONSTRAINT home_gallery_infos_localizations_links_unique UNIQUE (home_gallery_info_id, inv_home_gallery_info_id);


--
-- Name: home_gallery_infos home_gallery_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.home_gallery_infos
    ADD CONSTRAINT home_gallery_infos_pkey PRIMARY KEY (id);


--
-- Name: home_program_items_localizations_links home_program_items_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.home_program_items_localizations_links
    ADD CONSTRAINT home_program_items_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: home_program_items_localizations_links home_program_items_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.home_program_items_localizations_links
    ADD CONSTRAINT home_program_items_localizations_links_unique UNIQUE (home_program_item_id, inv_home_program_item_id);


--
-- Name: home_program_items home_program_items_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.home_program_items
    ADD CONSTRAINT home_program_items_pkey PRIMARY KEY (id);


--
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- Name: instructions_localizations_links instructions_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.instructions_localizations_links
    ADD CONSTRAINT instructions_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: instructions_localizations_links instructions_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.instructions_localizations_links
    ADD CONSTRAINT instructions_localizations_links_unique UNIQUE (instruction_id, inv_instruction_id);


--
-- Name: instructions instructions_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.instructions
    ADD CONSTRAINT instructions_pkey PRIMARY KEY (id);


--
-- Name: langs langs_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.langs
    ADD CONSTRAINT langs_pkey PRIMARY KEY (id);


--
-- Name: logos logos_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.logos
    ADD CONSTRAINT logos_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_unique; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_unique UNIQUE (api_token_permission_id, api_token_id);


--
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions strapi_release_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions_release_links strapi_release_actions_release_links_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_release_actions_release_links
    ADD CONSTRAINT strapi_release_actions_release_links_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions_release_links strapi_release_actions_release_links_unique; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_release_actions_release_links
    ADD CONSTRAINT strapi_release_actions_release_links_unique UNIQUE (release_action_id, release_id);


--
-- Name: strapi_releases strapi_releases_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_unique; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_unique UNIQUE (transfer_token_permission_id, transfer_token_id);


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- Name: submit_docs_localizations_links submit_docs_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.submit_docs_localizations_links
    ADD CONSTRAINT submit_docs_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: submit_docs_localizations_links submit_docs_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.submit_docs_localizations_links
    ADD CONSTRAINT submit_docs_localizations_links_unique UNIQUE (submit_doc_id, inv_submit_doc_id);


--
-- Name: submit_docs submit_docs_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.submit_docs
    ADD CONSTRAINT submit_docs_pkey PRIMARY KEY (id);


--
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_links up_permissions_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_links up_permissions_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_unique UNIQUE (permission_id, role_id);


--
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_links up_users_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_links up_users_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_unique UNIQUE (user_id, role_id);


--
-- Name: upload_folders_parent_links upload_folders_parent_links_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_pkey PRIMARY KEY (id);


--
-- Name: upload_folders_parent_links upload_folders_parent_links_unique; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_unique UNIQUE (folder_id, inv_folder_id);


--
-- Name: upload_folders upload_folders_path_id_index; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);


--
-- Name: upload_folders upload_folders_path_index; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);


--
-- Name: upload_folders upload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);


--
-- Name: why_uses_localizations_links why_uses_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.why_uses_localizations_links
    ADD CONSTRAINT why_uses_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: why_uses_localizations_links why_uses_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.why_uses_localizations_links
    ADD CONSTRAINT why_uses_localizations_links_unique UNIQUE (why_us_id, inv_why_us_id);


--
-- Name: why_uses why_uses_pkey; Type: CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.why_uses
    ADD CONSTRAINT why_uses_pkey PRIMARY KEY (id);


--
-- Name: abouts_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX abouts_created_by_id_fk ON public.abouts USING btree (created_by_id);


--
-- Name: abouts_localizations_links_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX abouts_localizations_links_fk ON public.abouts_localizations_links USING btree (about_id);


--
-- Name: abouts_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX abouts_localizations_links_inv_fk ON public.abouts_localizations_links USING btree (inv_about_id);


--
-- Name: abouts_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX abouts_localizations_links_order_fk ON public.abouts_localizations_links USING btree (about_order);


--
-- Name: abouts_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX abouts_updated_by_id_fk ON public.abouts USING btree (updated_by_id);


--
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- Name: admin_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX admin_permissions_role_links_fk ON public.admin_permissions_role_links USING btree (permission_id);


--
-- Name: admin_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX admin_permissions_role_links_inv_fk ON public.admin_permissions_role_links USING btree (role_id);


--
-- Name: admin_permissions_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX admin_permissions_role_links_order_inv_fk ON public.admin_permissions_role_links USING btree (permission_order);


--
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- Name: admin_users_roles_links_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX admin_users_roles_links_fk ON public.admin_users_roles_links USING btree (user_id);


--
-- Name: admin_users_roles_links_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX admin_users_roles_links_inv_fk ON public.admin_users_roles_links USING btree (role_id);


--
-- Name: admin_users_roles_links_order_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX admin_users_roles_links_order_fk ON public.admin_users_roles_links USING btree (role_order);


--
-- Name: admin_users_roles_links_order_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX admin_users_roles_links_order_inv_fk ON public.admin_users_roles_links USING btree (user_order);


--
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- Name: blogs_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX blogs_created_by_id_fk ON public.blogs USING btree (created_by_id);


--
-- Name: blogs_localizations_links_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX blogs_localizations_links_fk ON public.blogs_localizations_links USING btree (blog_id);


--
-- Name: blogs_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX blogs_localizations_links_inv_fk ON public.blogs_localizations_links USING btree (inv_blog_id);


--
-- Name: blogs_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX blogs_localizations_links_order_fk ON public.blogs_localizations_links USING btree (blog_order);


--
-- Name: blogs_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX blogs_updated_by_id_fk ON public.blogs USING btree (updated_by_id);


--
-- Name: calendars_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX calendars_created_by_id_fk ON public.calendars USING btree (created_by_id);


--
-- Name: calendars_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX calendars_updated_by_id_fk ON public.calendars USING btree (updated_by_id);


--
-- Name: details_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX details_created_by_id_fk ON public.details USING btree (created_by_id);


--
-- Name: details_localizations_links_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX details_localizations_links_fk ON public.details_localizations_links USING btree (detail_id);


--
-- Name: details_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX details_localizations_links_inv_fk ON public.details_localizations_links USING btree (inv_detail_id);


--
-- Name: details_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX details_localizations_links_order_fk ON public.details_localizations_links USING btree (detail_order);


--
-- Name: details_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX details_updated_by_id_fk ON public.details USING btree (updated_by_id);


--
-- Name: docs_lists_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX docs_lists_created_by_id_fk ON public.docs_lists USING btree (created_by_id);


--
-- Name: docs_lists_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX docs_lists_updated_by_id_fk ON public.docs_lists USING btree (updated_by_id);


--
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- Name: files_folder_links_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX files_folder_links_fk ON public.files_folder_links USING btree (file_id);


--
-- Name: files_folder_links_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX files_folder_links_inv_fk ON public.files_folder_links USING btree (folder_id);


--
-- Name: files_folder_links_order_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX files_folder_links_order_inv_fk ON public.files_folder_links USING btree (file_order);


--
-- Name: files_related_morphs_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX files_related_morphs_fk ON public.files_related_morphs USING btree (file_id);


--
-- Name: files_related_morphs_id_column_index; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX files_related_morphs_id_column_index ON public.files_related_morphs USING btree (related_id);


--
-- Name: files_related_morphs_order_index; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX files_related_morphs_order_index ON public.files_related_morphs USING btree ("order");


--
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- Name: form_errors_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX form_errors_created_by_id_fk ON public.form_errors USING btree (created_by_id);


--
-- Name: form_errors_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX form_errors_updated_by_id_fk ON public.form_errors USING btree (updated_by_id);


--
-- Name: form_types_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX form_types_created_by_id_fk ON public.form_types USING btree (created_by_id);


--
-- Name: form_types_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX form_types_updated_by_id_fk ON public.form_types USING btree (updated_by_id);


--
-- Name: galleries_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX galleries_created_by_id_fk ON public.galleries USING btree (created_by_id);


--
-- Name: galleries_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX galleries_updated_by_id_fk ON public.galleries USING btree (updated_by_id);


--
-- Name: group_categories_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX group_categories_created_by_id_fk ON public.group_categories USING btree (created_by_id);


--
-- Name: group_categories_localizations_links_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX group_categories_localizations_links_fk ON public.group_categories_localizations_links USING btree (group_category_id);


--
-- Name: group_categories_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX group_categories_localizations_links_inv_fk ON public.group_categories_localizations_links USING btree (inv_group_category_id);


--
-- Name: group_categories_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX group_categories_localizations_links_order_fk ON public.group_categories_localizations_links USING btree (group_category_order);


--
-- Name: group_categories_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX group_categories_updated_by_id_fk ON public.group_categories USING btree (updated_by_id);


--
-- Name: heroes_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX heroes_created_by_id_fk ON public.heroes USING btree (created_by_id);


--
-- Name: heroes_localizations_links_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX heroes_localizations_links_fk ON public.heroes_localizations_links USING btree (hero_id);


--
-- Name: heroes_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX heroes_localizations_links_inv_fk ON public.heroes_localizations_links USING btree (inv_hero_id);


--
-- Name: heroes_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX heroes_localizations_links_order_fk ON public.heroes_localizations_links USING btree (hero_order);


--
-- Name: heroes_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX heroes_updated_by_id_fk ON public.heroes USING btree (updated_by_id);


--
-- Name: home_gallery_infos_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX home_gallery_infos_created_by_id_fk ON public.home_gallery_infos USING btree (created_by_id);


--
-- Name: home_gallery_infos_localizations_links_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX home_gallery_infos_localizations_links_fk ON public.home_gallery_infos_localizations_links USING btree (home_gallery_info_id);


--
-- Name: home_gallery_infos_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX home_gallery_infos_localizations_links_inv_fk ON public.home_gallery_infos_localizations_links USING btree (inv_home_gallery_info_id);


--
-- Name: home_gallery_infos_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX home_gallery_infos_localizations_links_order_fk ON public.home_gallery_infos_localizations_links USING btree (home_gallery_info_order);


--
-- Name: home_gallery_infos_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX home_gallery_infos_updated_by_id_fk ON public.home_gallery_infos USING btree (updated_by_id);


--
-- Name: home_program_items_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX home_program_items_created_by_id_fk ON public.home_program_items USING btree (created_by_id);


--
-- Name: home_program_items_localizations_links_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX home_program_items_localizations_links_fk ON public.home_program_items_localizations_links USING btree (home_program_item_id);


--
-- Name: home_program_items_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX home_program_items_localizations_links_inv_fk ON public.home_program_items_localizations_links USING btree (inv_home_program_item_id);


--
-- Name: home_program_items_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX home_program_items_localizations_links_order_fk ON public.home_program_items_localizations_links USING btree (home_program_item_order);


--
-- Name: home_program_items_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX home_program_items_updated_by_id_fk ON public.home_program_items USING btree (updated_by_id);


--
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- Name: instructions_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX instructions_created_by_id_fk ON public.instructions USING btree (created_by_id);


--
-- Name: instructions_localizations_links_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX instructions_localizations_links_fk ON public.instructions_localizations_links USING btree (instruction_id);


--
-- Name: instructions_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX instructions_localizations_links_inv_fk ON public.instructions_localizations_links USING btree (inv_instruction_id);


--
-- Name: instructions_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX instructions_localizations_links_order_fk ON public.instructions_localizations_links USING btree (instruction_order);


--
-- Name: instructions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX instructions_updated_by_id_fk ON public.instructions USING btree (updated_by_id);


--
-- Name: langs_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX langs_created_by_id_fk ON public.langs USING btree (created_by_id);


--
-- Name: langs_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX langs_updated_by_id_fk ON public.langs USING btree (updated_by_id);


--
-- Name: logos_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX logos_created_by_id_fk ON public.logos USING btree (created_by_id);


--
-- Name: logos_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX logos_updated_by_id_fk ON public.logos USING btree (updated_by_id);


--
-- Name: strapi_api_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);


--
-- Name: strapi_api_token_permissions_token_links_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX strapi_api_token_permissions_token_links_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_id);


--
-- Name: strapi_api_token_permissions_token_links_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX strapi_api_token_permissions_token_links_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_id);


--
-- Name: strapi_api_token_permissions_token_links_order_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX strapi_api_token_permissions_token_links_order_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_order);


--
-- Name: strapi_api_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- Name: strapi_release_actions_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX strapi_release_actions_created_by_id_fk ON public.strapi_release_actions USING btree (created_by_id);


--
-- Name: strapi_release_actions_release_links_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX strapi_release_actions_release_links_fk ON public.strapi_release_actions_release_links USING btree (release_action_id);


--
-- Name: strapi_release_actions_release_links_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX strapi_release_actions_release_links_inv_fk ON public.strapi_release_actions_release_links USING btree (release_id);


--
-- Name: strapi_release_actions_release_links_order_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX strapi_release_actions_release_links_order_inv_fk ON public.strapi_release_actions_release_links USING btree (release_action_order);


--
-- Name: strapi_release_actions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX strapi_release_actions_updated_by_id_fk ON public.strapi_release_actions USING btree (updated_by_id);


--
-- Name: strapi_releases_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX strapi_releases_created_by_id_fk ON public.strapi_releases USING btree (created_by_id);


--
-- Name: strapi_releases_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX strapi_releases_updated_by_id_fk ON public.strapi_releases USING btree (updated_by_id);


--
-- Name: strapi_transfer_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX strapi_transfer_token_permissions_created_by_id_fk ON public.strapi_transfer_token_permissions USING btree (created_by_id);


--
-- Name: strapi_transfer_token_permissions_token_links_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX strapi_transfer_token_permissions_token_links_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_permission_id);


--
-- Name: strapi_transfer_token_permissions_token_links_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX strapi_transfer_token_permissions_token_links_inv_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_id);


--
-- Name: strapi_transfer_token_permissions_token_links_order_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX strapi_transfer_token_permissions_token_links_order_inv_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_permission_order);


--
-- Name: strapi_transfer_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX strapi_transfer_token_permissions_updated_by_id_fk ON public.strapi_transfer_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_transfer_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX strapi_transfer_tokens_created_by_id_fk ON public.strapi_transfer_tokens USING btree (created_by_id);


--
-- Name: strapi_transfer_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX strapi_transfer_tokens_updated_by_id_fk ON public.strapi_transfer_tokens USING btree (updated_by_id);


--
-- Name: submit_docs_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX submit_docs_created_by_id_fk ON public.submit_docs USING btree (created_by_id);


--
-- Name: submit_docs_localizations_links_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX submit_docs_localizations_links_fk ON public.submit_docs_localizations_links USING btree (submit_doc_id);


--
-- Name: submit_docs_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX submit_docs_localizations_links_inv_fk ON public.submit_docs_localizations_links USING btree (inv_submit_doc_id);


--
-- Name: submit_docs_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX submit_docs_localizations_links_order_fk ON public.submit_docs_localizations_links USING btree (submit_doc_order);


--
-- Name: submit_docs_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX submit_docs_updated_by_id_fk ON public.submit_docs USING btree (updated_by_id);


--
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- Name: up_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX up_permissions_role_links_fk ON public.up_permissions_role_links USING btree (permission_id);


--
-- Name: up_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX up_permissions_role_links_inv_fk ON public.up_permissions_role_links USING btree (role_id);


--
-- Name: up_permissions_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX up_permissions_role_links_order_inv_fk ON public.up_permissions_role_links USING btree (permission_order);


--
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- Name: up_users_role_links_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX up_users_role_links_fk ON public.up_users_role_links USING btree (user_id);


--
-- Name: up_users_role_links_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX up_users_role_links_inv_fk ON public.up_users_role_links USING btree (role_id);


--
-- Name: up_users_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX up_users_role_links_order_inv_fk ON public.up_users_role_links USING btree (user_order);


--
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- Name: upload_files_created_at_index; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);


--
-- Name: upload_files_ext_index; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);


--
-- Name: upload_files_folder_path_index; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);


--
-- Name: upload_files_name_index; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX upload_files_name_index ON public.files USING btree (name);


--
-- Name: upload_files_size_index; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX upload_files_size_index ON public.files USING btree (size);


--
-- Name: upload_files_updated_at_index; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);


--
-- Name: upload_folders_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);


--
-- Name: upload_folders_parent_links_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX upload_folders_parent_links_fk ON public.upload_folders_parent_links USING btree (folder_id);


--
-- Name: upload_folders_parent_links_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX upload_folders_parent_links_inv_fk ON public.upload_folders_parent_links USING btree (inv_folder_id);


--
-- Name: upload_folders_parent_links_order_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX upload_folders_parent_links_order_inv_fk ON public.upload_folders_parent_links USING btree (folder_order);


--
-- Name: upload_folders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);


--
-- Name: why_uses_created_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX why_uses_created_by_id_fk ON public.why_uses USING btree (created_by_id);


--
-- Name: why_uses_localizations_links_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX why_uses_localizations_links_fk ON public.why_uses_localizations_links USING btree (why_us_id);


--
-- Name: why_uses_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX why_uses_localizations_links_inv_fk ON public.why_uses_localizations_links USING btree (inv_why_us_id);


--
-- Name: why_uses_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX why_uses_localizations_links_order_fk ON public.why_uses_localizations_links USING btree (why_us_order);


--
-- Name: why_uses_updated_by_id_fk; Type: INDEX; Schema: public; Owner: beksultanabdikaarov
--

CREATE INDEX why_uses_updated_by_id_fk ON public.why_uses USING btree (updated_by_id);


--
-- Name: abouts abouts_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.abouts
    ADD CONSTRAINT abouts_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: abouts_localizations_links abouts_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.abouts_localizations_links
    ADD CONSTRAINT abouts_localizations_links_fk FOREIGN KEY (about_id) REFERENCES public.abouts(id) ON DELETE CASCADE;


--
-- Name: abouts_localizations_links abouts_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.abouts_localizations_links
    ADD CONSTRAINT abouts_localizations_links_inv_fk FOREIGN KEY (inv_about_id) REFERENCES public.abouts(id) ON DELETE CASCADE;


--
-- Name: abouts abouts_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.abouts
    ADD CONSTRAINT abouts_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users_roles_links admin_users_roles_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- Name: admin_users_roles_links admin_users_roles_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: blogs blogs_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: blogs_localizations_links blogs_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.blogs_localizations_links
    ADD CONSTRAINT blogs_localizations_links_fk FOREIGN KEY (blog_id) REFERENCES public.blogs(id) ON DELETE CASCADE;


--
-- Name: blogs_localizations_links blogs_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.blogs_localizations_links
    ADD CONSTRAINT blogs_localizations_links_inv_fk FOREIGN KEY (inv_blog_id) REFERENCES public.blogs(id) ON DELETE CASCADE;


--
-- Name: blogs blogs_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: calendars calendars_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.calendars
    ADD CONSTRAINT calendars_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: calendars calendars_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.calendars
    ADD CONSTRAINT calendars_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: details details_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.details
    ADD CONSTRAINT details_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: details_localizations_links details_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.details_localizations_links
    ADD CONSTRAINT details_localizations_links_fk FOREIGN KEY (detail_id) REFERENCES public.details(id) ON DELETE CASCADE;


--
-- Name: details_localizations_links details_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.details_localizations_links
    ADD CONSTRAINT details_localizations_links_inv_fk FOREIGN KEY (inv_detail_id) REFERENCES public.details(id) ON DELETE CASCADE;


--
-- Name: details details_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.details
    ADD CONSTRAINT details_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: docs_lists docs_lists_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.docs_lists
    ADD CONSTRAINT docs_lists_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: docs_lists docs_lists_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.docs_lists
    ADD CONSTRAINT docs_lists_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files_folder_links files_folder_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files_folder_links files_folder_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_inv_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: files_related_morphs files_related_morphs_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: form_errors form_errors_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.form_errors
    ADD CONSTRAINT form_errors_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: form_errors form_errors_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.form_errors
    ADD CONSTRAINT form_errors_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: form_types form_types_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.form_types
    ADD CONSTRAINT form_types_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: form_types form_types_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.form_types
    ADD CONSTRAINT form_types_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: galleries galleries_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.galleries
    ADD CONSTRAINT galleries_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: galleries galleries_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.galleries
    ADD CONSTRAINT galleries_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: group_categories group_categories_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.group_categories
    ADD CONSTRAINT group_categories_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: group_categories_localizations_links group_categories_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.group_categories_localizations_links
    ADD CONSTRAINT group_categories_localizations_links_fk FOREIGN KEY (group_category_id) REFERENCES public.group_categories(id) ON DELETE CASCADE;


--
-- Name: group_categories_localizations_links group_categories_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.group_categories_localizations_links
    ADD CONSTRAINT group_categories_localizations_links_inv_fk FOREIGN KEY (inv_group_category_id) REFERENCES public.group_categories(id) ON DELETE CASCADE;


--
-- Name: group_categories group_categories_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.group_categories
    ADD CONSTRAINT group_categories_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: heroes heroes_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.heroes
    ADD CONSTRAINT heroes_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: heroes_localizations_links heroes_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.heroes_localizations_links
    ADD CONSTRAINT heroes_localizations_links_fk FOREIGN KEY (hero_id) REFERENCES public.heroes(id) ON DELETE CASCADE;


--
-- Name: heroes_localizations_links heroes_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.heroes_localizations_links
    ADD CONSTRAINT heroes_localizations_links_inv_fk FOREIGN KEY (inv_hero_id) REFERENCES public.heroes(id) ON DELETE CASCADE;


--
-- Name: heroes heroes_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.heroes
    ADD CONSTRAINT heroes_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: home_gallery_infos home_gallery_infos_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.home_gallery_infos
    ADD CONSTRAINT home_gallery_infos_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: home_gallery_infos_localizations_links home_gallery_infos_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.home_gallery_infos_localizations_links
    ADD CONSTRAINT home_gallery_infos_localizations_links_fk FOREIGN KEY (home_gallery_info_id) REFERENCES public.home_gallery_infos(id) ON DELETE CASCADE;


--
-- Name: home_gallery_infos_localizations_links home_gallery_infos_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.home_gallery_infos_localizations_links
    ADD CONSTRAINT home_gallery_infos_localizations_links_inv_fk FOREIGN KEY (inv_home_gallery_info_id) REFERENCES public.home_gallery_infos(id) ON DELETE CASCADE;


--
-- Name: home_gallery_infos home_gallery_infos_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.home_gallery_infos
    ADD CONSTRAINT home_gallery_infos_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: home_program_items home_program_items_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.home_program_items
    ADD CONSTRAINT home_program_items_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: home_program_items_localizations_links home_program_items_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.home_program_items_localizations_links
    ADD CONSTRAINT home_program_items_localizations_links_fk FOREIGN KEY (home_program_item_id) REFERENCES public.home_program_items(id) ON DELETE CASCADE;


--
-- Name: home_program_items_localizations_links home_program_items_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.home_program_items_localizations_links
    ADD CONSTRAINT home_program_items_localizations_links_inv_fk FOREIGN KEY (inv_home_program_item_id) REFERENCES public.home_program_items(id) ON DELETE CASCADE;


--
-- Name: home_program_items home_program_items_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.home_program_items
    ADD CONSTRAINT home_program_items_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: instructions instructions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.instructions
    ADD CONSTRAINT instructions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: instructions_localizations_links instructions_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.instructions_localizations_links
    ADD CONSTRAINT instructions_localizations_links_fk FOREIGN KEY (instruction_id) REFERENCES public.instructions(id) ON DELETE CASCADE;


--
-- Name: instructions_localizations_links instructions_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.instructions_localizations_links
    ADD CONSTRAINT instructions_localizations_links_inv_fk FOREIGN KEY (inv_instruction_id) REFERENCES public.instructions(id) ON DELETE CASCADE;


--
-- Name: instructions instructions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.instructions
    ADD CONSTRAINT instructions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: langs langs_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.langs
    ADD CONSTRAINT langs_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: langs langs_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.langs
    ADD CONSTRAINT langs_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: logos logos_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.logos
    ADD CONSTRAINT logos_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: logos logos_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.logos
    ADD CONSTRAINT logos_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_inv_fk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_release_actions strapi_release_actions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_release_actions_release_links strapi_release_actions_release_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_release_actions_release_links
    ADD CONSTRAINT strapi_release_actions_release_links_fk FOREIGN KEY (release_action_id) REFERENCES public.strapi_release_actions(id) ON DELETE CASCADE;


--
-- Name: strapi_release_actions_release_links strapi_release_actions_release_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_release_actions_release_links
    ADD CONSTRAINT strapi_release_actions_release_links_inv_fk FOREIGN KEY (release_id) REFERENCES public.strapi_releases(id) ON DELETE CASCADE;


--
-- Name: strapi_release_actions strapi_release_actions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_releases strapi_releases_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_releases strapi_releases_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_fk FOREIGN KEY (transfer_token_permission_id) REFERENCES public.strapi_transfer_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_inv_fk FOREIGN KEY (transfer_token_id) REFERENCES public.strapi_transfer_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: submit_docs submit_docs_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.submit_docs
    ADD CONSTRAINT submit_docs_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: submit_docs_localizations_links submit_docs_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.submit_docs_localizations_links
    ADD CONSTRAINT submit_docs_localizations_links_fk FOREIGN KEY (submit_doc_id) REFERENCES public.submit_docs(id) ON DELETE CASCADE;


--
-- Name: submit_docs_localizations_links submit_docs_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.submit_docs_localizations_links
    ADD CONSTRAINT submit_docs_localizations_links_inv_fk FOREIGN KEY (inv_submit_doc_id) REFERENCES public.submit_docs(id) ON DELETE CASCADE;


--
-- Name: submit_docs submit_docs_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.submit_docs
    ADD CONSTRAINT submit_docs_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions_role_links up_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- Name: up_permissions_role_links up_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users_role_links up_users_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: up_users_role_links up_users_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders upload_folders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders_parent_links upload_folders_parent_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders_parent_links upload_folders_parent_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_inv_fk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders upload_folders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: why_uses why_uses_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.why_uses
    ADD CONSTRAINT why_uses_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: why_uses_localizations_links why_uses_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.why_uses_localizations_links
    ADD CONSTRAINT why_uses_localizations_links_fk FOREIGN KEY (why_us_id) REFERENCES public.why_uses(id) ON DELETE CASCADE;


--
-- Name: why_uses_localizations_links why_uses_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.why_uses_localizations_links
    ADD CONSTRAINT why_uses_localizations_links_inv_fk FOREIGN KEY (inv_why_us_id) REFERENCES public.why_uses(id) ON DELETE CASCADE;


--
-- Name: why_uses why_uses_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: beksultanabdikaarov
--

ALTER TABLE ONLY public.why_uses
    ADD CONSTRAINT why_uses_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

