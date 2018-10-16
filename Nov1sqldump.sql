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
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO lafiambrerauser;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE account_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO lafiambrerauser;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE account_emailaddress_id_seq OWNED BY account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO lafiambrerauser;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE account_emailconfirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO lafiambrerauser;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE account_emailconfirmation_id_seq OWNED BY account_emailconfirmation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO lafiambrerauser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO lafiambrerauser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO lafiambrerauser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO lafiambrerauser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO lafiambrerauser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO lafiambrerauser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO lafiambrerauser;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO lafiambrerauser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO lafiambrerauser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO lafiambrerauser;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO lafiambrerauser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO lafiambrerauser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: carthandler_cart; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE carthandler_cart (
    id integer NOT NULL,
    delivery_date date,
    delivery_time time without time zone,
    total_price double precision,
    qty integer,
    user_status integer,
    lunchbox_id integer,
    user_id integer
);


ALTER TABLE public.carthandler_cart OWNER TO lafiambrerauser;

--
-- Name: carthandler_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE carthandler_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carthandler_cart_id_seq OWNER TO lafiambrerauser;

--
-- Name: carthandler_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE carthandler_cart_id_seq OWNED BY carthandler_cart.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO lafiambrerauser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO lafiambrerauser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_blog_it_blogcategory; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE django_blog_it_blogcategory (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    slug character varying(20) NOT NULL,
    description character varying(500) NOT NULL,
    is_active boolean NOT NULL,
    user_id integer NOT NULL,
    meta_description text,
    meta_keywords text
);


ALTER TABLE public.django_blog_it_blogcategory OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_category_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE django_blog_it_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_blog_it_category_id_seq OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE django_blog_it_category_id_seq OWNED BY django_blog_it_blogcategory.id;


--
-- Name: django_blog_it_contactussettings; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE django_blog_it_contactussettings (
    id integer NOT NULL,
    from_email character varying(254) NOT NULL,
    reply_to_email character varying(254),
    email_admin character varying(254) NOT NULL,
    subject character varying(500) NOT NULL,
    body_user text NOT NULL,
    body_admin text NOT NULL
);


ALTER TABLE public.django_blog_it_contactussettings OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_contactussettings_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE django_blog_it_contactussettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_blog_it_contactussettings_id_seq OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_contactussettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE django_blog_it_contactussettings_id_seq OWNED BY django_blog_it_contactussettings.id;


--
-- Name: django_blog_it_facebook; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE django_blog_it_facebook (
    id integer NOT NULL,
    facebook_id character varying(100) NOT NULL,
    facebook_url character varying(200) NOT NULL,
    first_name character varying(200) NOT NULL,
    last_name character varying(200) NOT NULL,
    verified character varying(200) NOT NULL,
    name character varying(200) NOT NULL,
    language character varying(200) NOT NULL,
    hometown character varying(200) NOT NULL,
    email character varying(200) NOT NULL,
    gender character varying(200) NOT NULL,
    dob date,
    location character varying(200) NOT NULL,
    timezone character varying(200) NOT NULL,
    accesstoken character varying(2000) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.django_blog_it_facebook OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_facebook_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE django_blog_it_facebook_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_blog_it_facebook_id_seq OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_facebook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE django_blog_it_facebook_id_seq OWNED BY django_blog_it_facebook.id;


--
-- Name: django_blog_it_google; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE django_blog_it_google (
    id integer NOT NULL,
    google_id character varying(200) NOT NULL,
    google_url character varying(1000) NOT NULL,
    verified_email character varying(200) NOT NULL,
    family_name character varying(200) NOT NULL,
    name character varying(200) NOT NULL,
    picture character varying(200) NOT NULL,
    gender character varying(10) NOT NULL,
    dob character varying(50) NOT NULL,
    given_name character varying(200) NOT NULL,
    email character varying(200) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.django_blog_it_google OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_google_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE django_blog_it_google_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_blog_it_google_id_seq OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_google_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE django_blog_it_google_id_seq OWNED BY django_blog_it_google.id;


--
-- Name: django_blog_it_image_file; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE django_blog_it_image_file (
    id integer NOT NULL,
    upload character varying(100) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    is_image boolean NOT NULL,
    thumbnail character varying(100)
);


ALTER TABLE public.django_blog_it_image_file OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_image_file_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE django_blog_it_image_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_blog_it_image_file_id_seq OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_image_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE django_blog_it_image_file_id_seq OWNED BY django_blog_it_image_file.id;


--
-- Name: django_blog_it_menu; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE django_blog_it_menu (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    status boolean NOT NULL,
    lvl integer NOT NULL,
    parent_id integer
);


ALTER TABLE public.django_blog_it_menu OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE django_blog_it_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_blog_it_menu_id_seq OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE django_blog_it_menu_id_seq OWNED BY django_blog_it_menu.id;


--
-- Name: django_blog_it_page; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE django_blog_it_page (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    content text NOT NULL,
    slug character varying(50) NOT NULL,
    is_active boolean NOT NULL,
    meta_description text NOT NULL,
    keywords text NOT NULL,
    meta_title text NOT NULL
);


ALTER TABLE public.django_blog_it_page OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_page_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE django_blog_it_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_blog_it_page_id_seq OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE django_blog_it_page_id_seq OWNED BY django_blog_it_page.id;


--
-- Name: django_blog_it_post; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE django_blog_it_post (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    updated_on date NOT NULL,
    content text NOT NULL,
    status character varying(10) NOT NULL,
    keywords text NOT NULL,
    category_id integer,
    user_id integer NOT NULL,
    featured_image character varying(100),
    meta_description text,
    content_en text,
    content_es text,
    slug_en character varying(100),
    slug_es character varying(100),
    title_en character varying(100),
    title_es character varying(100)
);


ALTER TABLE public.django_blog_it_post OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_post_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE django_blog_it_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_blog_it_post_id_seq OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE django_blog_it_post_id_seq OWNED BY django_blog_it_post.id;


--
-- Name: django_blog_it_post_slugs; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE django_blog_it_post_slugs (
    id integer NOT NULL,
    slug character varying(100) NOT NULL,
    is_active boolean NOT NULL,
    blog_id integer NOT NULL
);


ALTER TABLE public.django_blog_it_post_slugs OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_post_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE django_blog_it_post_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_blog_it_post_slugs_id_seq OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_post_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE django_blog_it_post_slugs_id_seq OWNED BY django_blog_it_post_slugs.id;


--
-- Name: django_blog_it_post_tags; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE django_blog_it_post_tags (
    id integer NOT NULL,
    post_id integer NOT NULL,
    tags_id integer NOT NULL
);


ALTER TABLE public.django_blog_it_post_tags OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_post_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE django_blog_it_post_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_blog_it_post_tags_id_seq OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_post_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE django_blog_it_post_tags_id_seq OWNED BY django_blog_it_post_tags.id;


--
-- Name: django_blog_it_posthistory; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE django_blog_it_posthistory (
    id integer NOT NULL,
    content character varying(200) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.django_blog_it_posthistory OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_posthistory_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE django_blog_it_posthistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_blog_it_posthistory_id_seq OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_posthistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE django_blog_it_posthistory_id_seq OWNED BY django_blog_it_posthistory.id;


--
-- Name: django_blog_it_tags; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE django_blog_it_tags (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    slug character varying(20) NOT NULL
);


ALTER TABLE public.django_blog_it_tags OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE django_blog_it_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_blog_it_tags_id_seq OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE django_blog_it_tags_id_seq OWNED BY django_blog_it_tags.id;


--
-- Name: django_blog_it_theme; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE django_blog_it_theme (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    slug character varying(20) NOT NULL,
    description character varying(500) NOT NULL,
    enabled boolean NOT NULL
);


ALTER TABLE public.django_blog_it_theme OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_theme_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE django_blog_it_theme_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_blog_it_theme_id_seq OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_theme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE django_blog_it_theme_id_seq OWNED BY django_blog_it_theme.id;


--
-- Name: django_blog_it_userrole; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE django_blog_it_userrole (
    id integer NOT NULL,
    role character varying(10) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.django_blog_it_userrole OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_userrole_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE django_blog_it_userrole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_blog_it_userrole_id_seq OWNER TO lafiambrerauser;

--
-- Name: django_blog_it_userrole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE django_blog_it_userrole_id_seq OWNED BY django_blog_it_userrole.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO lafiambrerauser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO lafiambrerauser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO lafiambrerauser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO lafiambrerauser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_ses_sesstat; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE django_ses_sesstat (
    id integer NOT NULL,
    date date NOT NULL,
    delivery_attempts integer NOT NULL,
    bounces integer NOT NULL,
    complaints integer NOT NULL,
    rejects integer NOT NULL,
    CONSTRAINT django_ses_sesstat_bounces_check CHECK ((bounces >= 0)),
    CONSTRAINT django_ses_sesstat_complaints_check CHECK ((complaints >= 0)),
    CONSTRAINT django_ses_sesstat_delivery_attempts_check CHECK ((delivery_attempts >= 0)),
    CONSTRAINT django_ses_sesstat_rejects_check CHECK ((rejects >= 0))
);


ALTER TABLE public.django_ses_sesstat OWNER TO lafiambrerauser;

--
-- Name: django_ses_sesstat_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE django_ses_sesstat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_ses_sesstat_id_seq OWNER TO lafiambrerauser;

--
-- Name: django_ses_sesstat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE django_ses_sesstat_id_seq OWNED BY django_ses_sesstat.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO lafiambrerauser;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO lafiambrerauser;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO lafiambrerauser;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: easy_thumbnails_source; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE easy_thumbnails_source (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.easy_thumbnails_source OWNER TO lafiambrerauser;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE easy_thumbnails_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_source_id_seq OWNER TO lafiambrerauser;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE easy_thumbnails_source_id_seq OWNED BY easy_thumbnails_source.id;


--
-- Name: easy_thumbnails_thumbnail; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE easy_thumbnails_thumbnail (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL,
    source_id integer NOT NULL
);


ALTER TABLE public.easy_thumbnails_thumbnail OWNER TO lafiambrerauser;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE easy_thumbnails_thumbnail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_thumbnail_id_seq OWNER TO lafiambrerauser;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE easy_thumbnails_thumbnail_id_seq OWNED BY easy_thumbnails_thumbnail.id;


--
-- Name: easy_thumbnails_thumbnaildimensions; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE easy_thumbnails_thumbnaildimensions (
    id integer NOT NULL,
    thumbnail_id integer NOT NULL,
    width integer,
    height integer,
    CONSTRAINT easy_thumbnails_thumbnaildimensions_height_check CHECK ((height >= 0)),
    CONSTRAINT easy_thumbnails_thumbnaildimensions_width_check CHECK ((width >= 0))
);


ALTER TABLE public.easy_thumbnails_thumbnaildimensions OWNER TO lafiambrerauser;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_thumbnaildimensions_id_seq OWNER TO lafiambrerauser;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq OWNED BY easy_thumbnails_thumbnaildimensions.id;


--
-- Name: login_register_forgetpassword; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE login_register_forgetpassword (
    id integer NOT NULL,
    activation_key character varying(100) NOT NULL,
    start_datetime timestamp with time zone NOT NULL,
    end_datetime timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.login_register_forgetpassword OWNER TO lafiambrerauser;

--
-- Name: login_register_forgetpassword_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE login_register_forgetpassword_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.login_register_forgetpassword_id_seq OWNER TO lafiambrerauser;

--
-- Name: login_register_forgetpassword_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE login_register_forgetpassword_id_seq OWNED BY login_register_forgetpassword.id;


--
-- Name: mainapp_category; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE mainapp_category (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    description text NOT NULL,
    image character varying(100) NOT NULL,
    description_en text,
    description_es text,
    title_en character varying(200),
    title_es character varying(200),
    slug character varying(50) NOT NULL
);


ALTER TABLE public.mainapp_category OWNER TO lafiambrerauser;

--
-- Name: mainapp_category_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE mainapp_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mainapp_category_id_seq OWNER TO lafiambrerauser;

--
-- Name: mainapp_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE mainapp_category_id_seq OWNED BY mainapp_category.id;


--
-- Name: mainapp_checkoutcomment; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE mainapp_checkoutcomment (
    id integer NOT NULL,
    comment text,
    user_id integer
);


ALTER TABLE public.mainapp_checkoutcomment OWNER TO lafiambrerauser;

--
-- Name: mainapp_checkoutcomment_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE mainapp_checkoutcomment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mainapp_checkoutcomment_id_seq OWNER TO lafiambrerauser;

--
-- Name: mainapp_checkoutcomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE mainapp_checkoutcomment_id_seq OWNED BY mainapp_checkoutcomment.id;


--
-- Name: mainapp_homecontent; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE mainapp_homecontent (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    description text NOT NULL,
    description_en text,
    description_es text,
    title_en character varying(200),
    title_es character varying(200),
    msg text,
    msg_en text,
    msg_es text
);


ALTER TABLE public.mainapp_homecontent OWNER TO lafiambrerauser;

--
-- Name: mainapp_homecontent_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE mainapp_homecontent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mainapp_homecontent_id_seq OWNER TO lafiambrerauser;

--
-- Name: mainapp_homecontent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE mainapp_homecontent_id_seq OWNED BY mainapp_homecontent.id;


--
-- Name: mainapp_inviterequest; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE mainapp_inviterequest (
    id integer NOT NULL,
    email character varying(254),
    user_id integer,
    status boolean NOT NULL,
    key character varying(255)
);


ALTER TABLE public.mainapp_inviterequest OWNER TO lafiambrerauser;

--
-- Name: mainapp_inviterequest_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE mainapp_inviterequest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mainapp_inviterequest_id_seq OWNER TO lafiambrerauser;

--
-- Name: mainapp_inviterequest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE mainapp_inviterequest_id_seq OWNED BY mainapp_inviterequest.id;


--
-- Name: mainapp_inviterewards; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE mainapp_inviterewards (
    id integer NOT NULL,
    u_reward double precision,
    n_reward double precision
);


ALTER TABLE public.mainapp_inviterewards OWNER TO lafiambrerauser;

--
-- Name: mainapp_inviterewards_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE mainapp_inviterewards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mainapp_inviterewards_id_seq OWNER TO lafiambrerauser;

--
-- Name: mainapp_inviterewards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE mainapp_inviterewards_id_seq OWNED BY mainapp_inviterewards.id;


--
-- Name: mainapp_selectionreference; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE mainapp_selectionreference (
    id integer NOT NULL,
    shareselection_id integer,
    lunchbox_id integer
);


ALTER TABLE public.mainapp_selectionreference OWNER TO lafiambrerauser;

--
-- Name: mainapp_selectionreference_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE mainapp_selectionreference_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mainapp_selectionreference_id_seq OWNER TO lafiambrerauser;

--
-- Name: mainapp_selectionreference_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE mainapp_selectionreference_id_seq OWNED BY mainapp_selectionreference.id;


--
-- Name: mainapp_shareselection; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE mainapp_shareselection (
    id integer NOT NULL,
    receiver_id integer,
    date date,
    status boolean NOT NULL,
    user_id integer,
    credits double precision
);


ALTER TABLE public.mainapp_shareselection OWNER TO lafiambrerauser;

--
-- Name: mainapp_shareselection_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE mainapp_shareselection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mainapp_shareselection_id_seq OWNER TO lafiambrerauser;

--
-- Name: mainapp_shareselection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE mainapp_shareselection_id_seq OWNED BY mainapp_shareselection.id;


--
-- Name: mainapp_usernotification; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE mainapp_usernotification (
    id integer NOT NULL,
    unread boolean NOT NULL,
    msg text,
    date timestamp with time zone,
    user_id integer,
    head character varying(200),
    head_en character varying(200),
    head_es character varying(200),
    msg_en text,
    msg_es text,
    cat integer,
    share_id integer
);


ALTER TABLE public.mainapp_usernotification OWNER TO lafiambrerauser;

--
-- Name: mainapp_usernotification_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE mainapp_usernotification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mainapp_usernotification_id_seq OWNER TO lafiambrerauser;

--
-- Name: mainapp_usernotification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE mainapp_usernotification_id_seq OWNED BY mainapp_usernotification.id;


--
-- Name: orders_basket; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE orders_basket (
    id integer NOT NULL,
    is_catering boolean NOT NULL,
    qty integer,
    lunchbox_id integer,
    user_id integer
);


ALTER TABLE public.orders_basket OWNER TO lafiambrerauser;

--
-- Name: orders_basket_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE orders_basket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_basket_id_seq OWNER TO lafiambrerauser;

--
-- Name: orders_basket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE orders_basket_id_seq OWNED BY orders_basket.id;


--
-- Name: orders_comment; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE orders_comment (
    id integer NOT NULL,
    comment text,
    order_id integer
);


ALTER TABLE public.orders_comment OWNER TO lafiambrerauser;

--
-- Name: orders_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE orders_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_comment_id_seq OWNER TO lafiambrerauser;

--
-- Name: orders_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE orders_comment_id_seq OWNED BY orders_comment.id;


--
-- Name: orders_order; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE orders_order (
    id integer NOT NULL,
    uuid uuid NOT NULL,
    u_is_processing boolean NOT NULL,
    u_processing_date_from date,
    u_processing_date_till date,
    u_is_payment_requested boolean NOT NULL,
    u_payment_requested_date date,
    u_is_confirmed_by_lf boolean NOT NULL,
    u_is_confirmed_by_lf_date date,
    u_is_paid boolean NOT NULL,
    is_highlighted boolean NOT NULL,
    is_archived boolean NOT NULL,
    is_catering boolean NOT NULL,
    date timestamp with time zone,
    user_id integer,
    vat double precision NOT NULL
);


ALTER TABLE public.orders_order OWNER TO lafiambrerauser;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE orders_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_id_seq OWNER TO lafiambrerauser;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE orders_order_id_seq OWNED BY orders_order.id;


--
-- Name: orders_orderdatemail; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE orders_orderdatemail (
    id integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    mail_date date NOT NULL
);


ALTER TABLE public.orders_orderdatemail OWNER TO lafiambrerauser;

--
-- Name: orders_orderdatemail_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE orders_orderdatemail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_orderdatemail_id_seq OWNER TO lafiambrerauser;

--
-- Name: orders_orderdatemail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE orders_orderdatemail_id_seq OWNED BY orders_orderdatemail.id;


--
-- Name: orders_orderitem; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE orders_orderitem (
    id integer NOT NULL,
    qty integer,
    delivery_date timestamp with time zone,
    is_processed boolean NOT NULL,
    processed_date date,
    is_payment_requested boolean NOT NULL,
    payment_request_date date,
    is_confirmed_by_lf boolean NOT NULL,
    confirmation_by_lf_date date,
    is_payment_transferred boolean NOT NULL,
    payment_transfer_date date,
    lunchbox_id integer,
    order_id integer
);


ALTER TABLE public.orders_orderitem OWNER TO lafiambrerauser;

--
-- Name: orders_orderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE orders_orderitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_orderitem_id_seq OWNER TO lafiambrerauser;

--
-- Name: orders_orderitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE orders_orderitem_id_seq OWNED BY orders_orderitem.id;


--
-- Name: pages_contactus; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE pages_contactus (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    email character varying(254),
    phone character varying(50) NOT NULL,
    msg text NOT NULL
);


ALTER TABLE public.pages_contactus OWNER TO lafiambrerauser;

--
-- Name: pages_contactus_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE pages_contactus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_contactus_id_seq OWNER TO lafiambrerauser;

--
-- Name: pages_contactus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE pages_contactus_id_seq OWNED BY pages_contactus.id;


--
-- Name: pages_faqs; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE pages_faqs (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    description text NOT NULL,
    description_en text,
    description_es text,
    title_en character varying(200),
    title_es character varying(200)
);


ALTER TABLE public.pages_faqs OWNER TO lafiambrerauser;

--
-- Name: pages_faqs_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE pages_faqs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_faqs_id_seq OWNER TO lafiambrerauser;

--
-- Name: pages_faqs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE pages_faqs_id_seq OWNED BY pages_faqs.id;


--
-- Name: pages_groupbenifits; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE pages_groupbenifits (
    id integer NOT NULL,
    title character varying(11) NOT NULL,
    head character varying(200) NOT NULL,
    image character varying(100) NOT NULL,
    description text NOT NULL,
    description_en text,
    description_es text,
    head_en character varying(200),
    head_es character varying(200),
    title_en character varying(11),
    title_es character varying(11)
);


ALTER TABLE public.pages_groupbenifits OWNER TO lafiambrerauser;

--
-- Name: pages_groupbenifits_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE pages_groupbenifits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_groupbenifits_id_seq OWNER TO lafiambrerauser;

--
-- Name: pages_groupbenifits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE pages_groupbenifits_id_seq OWNED BY pages_groupbenifits.id;


--
-- Name: pages_lunchsteps; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE pages_lunchsteps (
    id integer NOT NULL,
    content text NOT NULL,
    title character varying(200) NOT NULL,
    content_en text,
    content_es text,
    title_en character varying(200),
    title_es character varying(200)
);


ALTER TABLE public.pages_lunchsteps OWNER TO lafiambrerauser;

--
-- Name: pages_lunchsteps_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE pages_lunchsteps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_lunchsteps_id_seq OWNER TO lafiambrerauser;

--
-- Name: pages_lunchsteps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE pages_lunchsteps_id_seq OWNED BY pages_lunchsteps.id;


--
-- Name: pages_supportdetails; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE pages_supportdetails (
    id integer NOT NULL,
    email character varying(254),
    phone character varying(50) NOT NULL
);


ALTER TABLE public.pages_supportdetails OWNER TO lafiambrerauser;

--
-- Name: pages_supportdetails_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE pages_supportdetails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_supportdetails_id_seq OWNER TO lafiambrerauser;

--
-- Name: pages_supportdetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE pages_supportdetails_id_seq OWNED BY pages_supportdetails.id;


--
-- Name: payments_lafiambrera_currency; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE payments_lafiambrera_currency (
    id integer NOT NULL,
    "OneEuro" integer NOT NULL
);


ALTER TABLE public.payments_lafiambrera_currency OWNER TO lafiambrerauser;

--
-- Name: payments_lafiambrera_currency_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE payments_lafiambrera_currency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_lafiambrera_currency_id_seq OWNER TO lafiambrerauser;

--
-- Name: payments_lafiambrera_currency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE payments_lafiambrera_currency_id_seq OWNED BY payments_lafiambrera_currency.id;


--
-- Name: payments_moneytowallet; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE payments_moneytowallet (
    id integer NOT NULL,
    amount double precision NOT NULL,
    lafiambera_credit double precision NOT NULL,
    status boolean NOT NULL,
    user_id integer NOT NULL,
    uuid uuid NOT NULL
);


ALTER TABLE public.payments_moneytowallet OWNER TO lafiambrerauser;

--
-- Name: payments_moneytowallet_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE payments_moneytowallet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_moneytowallet_id_seq OWNER TO lafiambrerauser;

--
-- Name: payments_moneytowallet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE payments_moneytowallet_id_seq OWNED BY payments_moneytowallet.id;


--
-- Name: payments_payment; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE payments_payment (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    amount numeric(10,2) NOT NULL,
    error_message text NOT NULL,
    coupon_id integer,
    order_id integer NOT NULL,
    paypal_response_id integer,
    sermepa_response_id integer,
    payment_type character varying(3) NOT NULL,
    status character varying(3) NOT NULL
);


ALTER TABLE public.payments_payment OWNER TO lafiambrerauser;

--
-- Name: payments_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE payments_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_payment_id_seq OWNER TO lafiambrerauser;

--
-- Name: payments_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE payments_payment_id_seq OWNED BY payments_payment.id;


--
-- Name: payments_paypalpaymentdetails; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE payments_paypalpaymentdetails (
    id integer NOT NULL,
    payfor character varying(20),
    payuiid character varying(200) NOT NULL,
    paypal_paymentid character varying(200) NOT NULL,
    paypal_token character varying(200),
    payer_id character varying(200),
    status boolean NOT NULL
);


ALTER TABLE public.payments_paypalpaymentdetails OWNER TO lafiambrerauser;

--
-- Name: payments_paypalpaymentdetails_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE payments_paypalpaymentdetails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_paypalpaymentdetails_id_seq OWNER TO lafiambrerauser;

--
-- Name: payments_paypalpaymentdetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE payments_paypalpaymentdetails_id_seq OWNED BY payments_paypalpaymentdetails.id;


--
-- Name: payments_wallet; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE payments_wallet (
    id integer NOT NULL,
    amount double precision NOT NULL,
    lafiambera_credit double precision NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.payments_wallet OWNER TO lafiambrerauser;

--
-- Name: payments_wallet_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE payments_wallet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_wallet_id_seq OWNER TO lafiambrerauser;

--
-- Name: payments_wallet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE payments_wallet_id_seq OWNED BY payments_wallet.id;


--
-- Name: payments_walletorder; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE payments_walletorder (
    id integer NOT NULL,
    paymentgateway double precision,
    status boolean NOT NULL,
    order_id integer NOT NULL,
    user_id integer NOT NULL,
    wallet_id integer NOT NULL
);


ALTER TABLE public.payments_walletorder OWNER TO lafiambrerauser;

--
-- Name: payments_walletorder_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE payments_walletorder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_walletorder_id_seq OWNER TO lafiambrerauser;

--
-- Name: payments_walletorder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE payments_walletorder_id_seq OWNED BY payments_walletorder.id;


--
-- Name: payments_walletpayment; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE payments_walletpayment (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    status character varying(3) NOT NULL,
    payment_type character varying(3) NOT NULL,
    amount numeric(10,2) NOT NULL,
    error_message text NOT NULL,
    moneytowallet_id integer NOT NULL,
    paypal_response_id integer,
    sermepa_response_id integer
);


ALTER TABLE public.payments_walletpayment OWNER TO lafiambrerauser;

--
-- Name: payments_walletpayment_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE payments_walletpayment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_walletpayment_id_seq OWNER TO lafiambrerauser;

--
-- Name: payments_walletpayment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE payments_walletpayment_id_seq OWNED BY payments_walletpayment.id;


--
-- Name: paypal_ipn; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE paypal_ipn (
    id integer NOT NULL,
    business character varying(127) NOT NULL,
    charset character varying(255) NOT NULL,
    custom character varying(256) NOT NULL,
    notify_version numeric(64,2),
    parent_txn_id character varying(19) NOT NULL,
    receiver_email character varying(254) NOT NULL,
    receiver_id character varying(255) NOT NULL,
    residence_country character varying(2) NOT NULL,
    test_ipn boolean NOT NULL,
    txn_id character varying(255) NOT NULL,
    txn_type character varying(255) NOT NULL,
    verify_sign character varying(255) NOT NULL,
    address_country character varying(64) NOT NULL,
    address_city character varying(40) NOT NULL,
    address_country_code character varying(64) NOT NULL,
    address_name character varying(128) NOT NULL,
    address_state character varying(40) NOT NULL,
    address_status character varying(255) NOT NULL,
    address_street character varying(200) NOT NULL,
    address_zip character varying(20) NOT NULL,
    contact_phone character varying(20) NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    payer_business_name character varying(127) NOT NULL,
    payer_email character varying(127) NOT NULL,
    payer_id character varying(13) NOT NULL,
    auth_amount numeric(64,2),
    auth_exp character varying(28) NOT NULL,
    auth_id character varying(19) NOT NULL,
    auth_status character varying(255) NOT NULL,
    exchange_rate numeric(64,16),
    invoice character varying(127) NOT NULL,
    item_name character varying(127) NOT NULL,
    item_number character varying(127) NOT NULL,
    mc_currency character varying(32) NOT NULL,
    mc_fee numeric(64,2),
    mc_gross numeric(64,2),
    mc_handling numeric(64,2),
    mc_shipping numeric(64,2),
    memo character varying(255) NOT NULL,
    num_cart_items integer,
    option_name1 character varying(64) NOT NULL,
    option_name2 character varying(64) NOT NULL,
    payer_status character varying(255) NOT NULL,
    payment_date timestamp with time zone,
    payment_gross numeric(64,2),
    payment_status character varying(255) NOT NULL,
    payment_type character varying(255) NOT NULL,
    pending_reason character varying(255) NOT NULL,
    protection_eligibility character varying(255) NOT NULL,
    quantity integer,
    reason_code character varying(255) NOT NULL,
    remaining_settle numeric(64,2),
    settle_amount numeric(64,2),
    settle_currency character varying(32) NOT NULL,
    shipping numeric(64,2),
    shipping_method character varying(255) NOT NULL,
    tax numeric(64,2),
    transaction_entity character varying(255) NOT NULL,
    auction_buyer_id character varying(64) NOT NULL,
    auction_closing_date timestamp with time zone,
    auction_multi_item integer,
    for_auction numeric(64,2),
    amount numeric(64,2),
    amount_per_cycle numeric(64,2),
    initial_payment_amount numeric(64,2),
    next_payment_date timestamp with time zone,
    outstanding_balance numeric(64,2),
    payment_cycle character varying(255) NOT NULL,
    period_type character varying(255) NOT NULL,
    product_name character varying(255) NOT NULL,
    product_type character varying(255) NOT NULL,
    profile_status character varying(255) NOT NULL,
    recurring_payment_id character varying(255) NOT NULL,
    rp_invoice_id character varying(127) NOT NULL,
    time_created timestamp with time zone,
    amount1 numeric(64,2),
    amount2 numeric(64,2),
    amount3 numeric(64,2),
    mc_amount1 numeric(64,2),
    mc_amount2 numeric(64,2),
    mc_amount3 numeric(64,2),
    password character varying(24) NOT NULL,
    period1 character varying(255) NOT NULL,
    period2 character varying(255) NOT NULL,
    period3 character varying(255) NOT NULL,
    reattempt character varying(1) NOT NULL,
    recur_times integer,
    recurring character varying(1) NOT NULL,
    retry_at timestamp with time zone,
    subscr_date timestamp with time zone,
    subscr_effective timestamp with time zone,
    subscr_id character varying(19) NOT NULL,
    username character varying(64) NOT NULL,
    case_creation_date timestamp with time zone,
    case_id character varying(255) NOT NULL,
    case_type character varying(255) NOT NULL,
    receipt_id character varying(255) NOT NULL,
    currency_code character varying(32) NOT NULL,
    handling_amount numeric(64,2),
    transaction_subject character varying(256) NOT NULL,
    ipaddress inet,
    flag boolean NOT NULL,
    flag_code character varying(16) NOT NULL,
    flag_info text NOT NULL,
    query text NOT NULL,
    response text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    from_view character varying(6),
    mp_id character varying(128),
    option_selection1 character varying(200) NOT NULL,
    option_selection2 character varying(200) NOT NULL
);


ALTER TABLE public.paypal_ipn OWNER TO lafiambrerauser;

--
-- Name: paypal_ipn_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE paypal_ipn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paypal_ipn_id_seq OWNER TO lafiambrerauser;

--
-- Name: paypal_ipn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE paypal_ipn_id_seq OWNED BY paypal_ipn.id;


--
-- Name: sermepa_sermepaidtpv; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE sermepa_sermepaidtpv (
    id integer NOT NULL,
    idtpv character varying(12) NOT NULL
);


ALTER TABLE public.sermepa_sermepaidtpv OWNER TO lafiambrerauser;

--
-- Name: sermepa_sermepaidtpv_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE sermepa_sermepaidtpv_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sermepa_sermepaidtpv_id_seq OWNER TO lafiambrerauser;

--
-- Name: sermepa_sermepaidtpv_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE sermepa_sermepaidtpv_id_seq OWNED BY sermepa_sermepaidtpv.id;


--
-- Name: sermepa_sermeparesponse; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE sermepa_sermeparesponse (
    id integer NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    "Ds_Date" date NOT NULL,
    "Ds_Hour" time without time zone NOT NULL,
    "Ds_SecurePayment" integer NOT NULL,
    "Ds_MerchantData" character varying(1024) NOT NULL,
    "Ds_Card_Country" integer,
    "Ds_Card_Type" character varying(1),
    "Ds_Terminal" integer NOT NULL,
    "Ds_MerchantCode" character varying(9) NOT NULL,
    "Ds_ConsumerLanguage" integer NOT NULL,
    "Ds_Response" character varying(4) NOT NULL,
    "Ds_Order" character varying(12) NOT NULL,
    "Ds_Currency" integer NOT NULL,
    "Ds_Amount" integer NOT NULL,
    "Ds_Signature" character varying(256) NOT NULL,
    "Ds_AuthorisationCode" character varying(256) NOT NULL,
    "Ds_TransactionType" character varying(1) NOT NULL,
    "Ds_Merchant_Identifier" character varying(40),
    "Ds_ExpiryDate" character varying(4),
    "Ds_Merchant_Group" character varying(9),
    "Ds_Card_Number" character varying(40)
);


ALTER TABLE public.sermepa_sermeparesponse OWNER TO lafiambrerauser;

--
-- Name: sermepa_sermeparesponse_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE sermepa_sermeparesponse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sermepa_sermeparesponse_id_seq OWNER TO lafiambrerauser;

--
-- Name: sermepa_sermeparesponse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE sermepa_sermeparesponse_id_seq OWNED BY sermepa_sermeparesponse.id;


--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO lafiambrerauser;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE social_auth_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO lafiambrerauser;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE social_auth_association_id_seq OWNED BY social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO lafiambrerauser;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE social_auth_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO lafiambrerauser;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE social_auth_code_id_seq OWNED BY social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO lafiambrerauser;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE social_auth_nonce_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO lafiambrerauser;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE social_auth_nonce_id_seq OWNED BY social_auth_nonce.id;


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data text NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO lafiambrerauser;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE social_auth_partial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_partial_id_seq OWNER TO lafiambrerauser;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE social_auth_partial_id_seq OWNED BY social_auth_partial.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO lafiambrerauser;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE social_auth_usersocialauth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO lafiambrerauser;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE social_auth_usersocialauth_id_seq OWNED BY social_auth_usersocialauth.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO lafiambrerauser;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE socialaccount_socialaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO lafiambrerauser;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE socialaccount_socialaccount_id_seq OWNED BY socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO lafiambrerauser;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE socialaccount_socialapp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO lafiambrerauser;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE socialaccount_socialapp_id_seq OWNED BY socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO lafiambrerauser;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE socialaccount_socialapp_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO lafiambrerauser;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE socialaccount_socialapp_sites_id_seq OWNED BY socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO lafiambrerauser;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE socialaccount_socialtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO lafiambrerauser;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE socialaccount_socialtoken_id_seq OWNED BY socialaccount_socialtoken.id;


--
-- Name: userprofiles_activation; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE userprofiles_activation (
    id integer NOT NULL,
    email character varying(254),
    key character varying(255),
    date timestamp with time zone,
    user_id integer
);


ALTER TABLE public.userprofiles_activation OWNER TO lafiambrerauser;

--
-- Name: userprofiles_activation_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE userprofiles_activation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofiles_activation_id_seq OWNER TO lafiambrerauser;

--
-- Name: userprofiles_activation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE userprofiles_activation_id_seq OWNED BY userprofiles_activation.id;


--
-- Name: userprofiles_adminnotification; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE userprofiles_adminnotification (
    id integer NOT NULL,
    archived boolean NOT NULL,
    priority integer,
    lunchbox_id integer,
    restaurant_id integer
);


ALTER TABLE public.userprofiles_adminnotification OWNER TO lafiambrerauser;

--
-- Name: userprofiles_adminnotification_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE userprofiles_adminnotification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofiles_adminnotification_id_seq OWNER TO lafiambrerauser;

--
-- Name: userprofiles_adminnotification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE userprofiles_adminnotification_id_seq OWNED BY userprofiles_adminnotification.id;


--
-- Name: userprofiles_checkoutpromocode; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE userprofiles_checkoutpromocode (
    id integer NOT NULL,
    promo_code character varying(15),
    percent double precision,
    qty integer,
    date_from date,
    date_till date
);


ALTER TABLE public.userprofiles_checkoutpromocode OWNER TO lafiambrerauser;

--
-- Name: userprofiles_checkoutpromocode_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE userprofiles_checkoutpromocode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofiles_checkoutpromocode_id_seq OWNER TO lafiambrerauser;

--
-- Name: userprofiles_checkoutpromocode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE userprofiles_checkoutpromocode_id_seq OWNED BY userprofiles_checkoutpromocode.id;


--
-- Name: userprofiles_checkoutpromocode_used_by; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE userprofiles_checkoutpromocode_used_by (
    id integer NOT NULL,
    checkoutpromocode_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.userprofiles_checkoutpromocode_used_by OWNER TO lafiambrerauser;

--
-- Name: userprofiles_checkoutpromocode_used_by_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE userprofiles_checkoutpromocode_used_by_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofiles_checkoutpromocode_used_by_id_seq OWNER TO lafiambrerauser;

--
-- Name: userprofiles_checkoutpromocode_used_by_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE userprofiles_checkoutpromocode_used_by_id_seq OWNED BY userprofiles_checkoutpromocode_used_by.id;


--
-- Name: userprofiles_city; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE userprofiles_city (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE public.userprofiles_city OWNER TO lafiambrerauser;

--
-- Name: userprofiles_city_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE userprofiles_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofiles_city_id_seq OWNER TO lafiambrerauser;

--
-- Name: userprofiles_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE userprofiles_city_id_seq OWNED BY userprofiles_city.id;


--
-- Name: userprofiles_customer; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE userprofiles_customer (
    id integer NOT NULL,
    name character varying(255),
    address character varying(255),
    street character varying(255),
    city character varying(50),
    state character varying(30),
    zip_code character varying(10),
    country character varying(255),
    user_id integer,
    building_num text,
    door_num text
);


ALTER TABLE public.userprofiles_customer OWNER TO lafiambrerauser;

--
-- Name: userprofiles_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE userprofiles_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofiles_customer_id_seq OWNER TO lafiambrerauser;

--
-- Name: userprofiles_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE userprofiles_customer_id_seq OWNED BY userprofiles_customer.id;


--
-- Name: userprofiles_lunchbox; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE userprofiles_lunchbox (
    id integer NOT NULL,
    name character varying(100),
    "desc" text,
    price double precision,
    available_from date,
    available_till date,
    protein double precision,
    carbohydrates double precision,
    fat double precision,
    sugar double precision,
    sodium double precision,
    published boolean NOT NULL,
    photoshoot_requested boolean NOT NULL,
    publishing_requested boolean NOT NULL,
    date timestamp with time zone,
    rate numeric(10,2),
    restaurant_id integer,
    category_id integer,
    desc_en text,
    desc_es text,
    vat double precision
);


ALTER TABLE public.userprofiles_lunchbox OWNER TO lafiambrerauser;

--
-- Name: userprofiles_lunchbox_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE userprofiles_lunchbox_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofiles_lunchbox_id_seq OWNER TO lafiambrerauser;

--
-- Name: userprofiles_lunchbox_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE userprofiles_lunchbox_id_seq OWNED BY userprofiles_lunchbox.id;


--
-- Name: userprofiles_lunchboxadminmessage; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE userprofiles_lunchboxadminmessage (
    id integer NOT NULL,
    msg character varying(255),
    inc boolean NOT NULL,
    watched boolean NOT NULL,
    priority integer,
    date timestamp with time zone,
    lunchbox_id integer,
    user_id integer
);


ALTER TABLE public.userprofiles_lunchboxadminmessage OWNER TO lafiambrerauser;

--
-- Name: userprofiles_lunchboxadminmessage_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE userprofiles_lunchboxadminmessage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofiles_lunchboxadminmessage_id_seq OWNER TO lafiambrerauser;

--
-- Name: userprofiles_lunchboxadminmessage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE userprofiles_lunchboxadminmessage_id_seq OWNED BY userprofiles_lunchboxadminmessage.id;


--
-- Name: userprofiles_lunchboxdiscount; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE userprofiles_lunchboxdiscount (
    id integer NOT NULL,
    percent double precision,
    qty integer,
    lunchbox_id integer
);


ALTER TABLE public.userprofiles_lunchboxdiscount OWNER TO lafiambrerauser;

--
-- Name: userprofiles_lunchboxdiscount_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE userprofiles_lunchboxdiscount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofiles_lunchboxdiscount_id_seq OWNER TO lafiambrerauser;

--
-- Name: userprofiles_lunchboxdiscount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE userprofiles_lunchboxdiscount_id_seq OWNED BY userprofiles_lunchboxdiscount.id;


--
-- Name: userprofiles_lunchboxfeedback; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE userprofiles_lunchboxfeedback (
    id integer NOT NULL,
    msg character varying(255),
    inc boolean NOT NULL,
    watched boolean NOT NULL,
    datetime timestamp with time zone,
    priority integer,
    lunchbox_id integer,
    restaurant_id integer,
    user_id integer
);


ALTER TABLE public.userprofiles_lunchboxfeedback OWNER TO lafiambrerauser;

--
-- Name: userprofiles_lunchboxfeedback_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE userprofiles_lunchboxfeedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofiles_lunchboxfeedback_id_seq OWNER TO lafiambrerauser;

--
-- Name: userprofiles_lunchboxfeedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE userprofiles_lunchboxfeedback_id_seq OWNED BY userprofiles_lunchboxfeedback.id;


--
-- Name: userprofiles_lunchboximage; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE userprofiles_lunchboximage (
    id integer NOT NULL,
    image character varying(100),
    lunchbox_id integer
);


ALTER TABLE public.userprofiles_lunchboximage OWNER TO lafiambrerauser;

--
-- Name: userprofiles_lunchboximage_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE userprofiles_lunchboximage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofiles_lunchboximage_id_seq OWNER TO lafiambrerauser;

--
-- Name: userprofiles_lunchboximage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE userprofiles_lunchboximage_id_seq OWNED BY userprofiles_lunchboximage.id;


--
-- Name: userprofiles_lunchboxprivileges; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE userprofiles_lunchboxprivileges (
    id integer NOT NULL,
    title character varying(50),
    image character varying(100)
);


ALTER TABLE public.userprofiles_lunchboxprivileges OWNER TO lafiambrerauser;

--
-- Name: userprofiles_lunchboxprivileges_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE userprofiles_lunchboxprivileges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofiles_lunchboxprivileges_id_seq OWNER TO lafiambrerauser;

--
-- Name: userprofiles_lunchboxprivileges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE userprofiles_lunchboxprivileges_id_seq OWNED BY userprofiles_lunchboxprivileges.id;


--
-- Name: userprofiles_lunchboxprivilegesitem; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE userprofiles_lunchboxprivilegesitem (
    id integer NOT NULL,
    lunchbox_id integer,
    privilege_id integer
);


ALTER TABLE public.userprofiles_lunchboxprivilegesitem OWNER TO lafiambrerauser;

--
-- Name: userprofiles_lunchboxprivilegesitem_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE userprofiles_lunchboxprivilegesitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofiles_lunchboxprivilegesitem_id_seq OWNER TO lafiambrerauser;

--
-- Name: userprofiles_lunchboxprivilegesitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE userprofiles_lunchboxprivilegesitem_id_seq OWNED BY userprofiles_lunchboxprivilegesitem.id;


--
-- Name: userprofiles_lunchboxrating; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE userprofiles_lunchboxrating (
    id integer NOT NULL,
    rating integer,
    lunchbox_id integer,
    user_id integer
);


ALTER TABLE public.userprofiles_lunchboxrating OWNER TO lafiambrerauser;

--
-- Name: userprofiles_lunchboxrating_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE userprofiles_lunchboxrating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofiles_lunchboxrating_id_seq OWNER TO lafiambrerauser;

--
-- Name: userprofiles_lunchboxrating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE userprofiles_lunchboxrating_id_seq OWNED BY userprofiles_lunchboxrating.id;


--
-- Name: userprofiles_lunchboxrequest; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE userprofiles_lunchboxrequest (
    id integer NOT NULL,
    lunchbox_id integer,
    user_id integer
);


ALTER TABLE public.userprofiles_lunchboxrequest OWNER TO lafiambrerauser;

--
-- Name: userprofiles_lunchboxrequest_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE userprofiles_lunchboxrequest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofiles_lunchboxrequest_id_seq OWNER TO lafiambrerauser;

--
-- Name: userprofiles_lunchboxrequest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE userprofiles_lunchboxrequest_id_seq OWNED BY userprofiles_lunchboxrequest.id;


--
-- Name: userprofiles_ordernotification; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE userprofiles_ordernotification (
    id integer NOT NULL,
    watched boolean NOT NULL,
    priority integer,
    order_item_id integer
);


ALTER TABLE public.userprofiles_ordernotification OWNER TO lafiambrerauser;

--
-- Name: userprofiles_ordernotification_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE userprofiles_ordernotification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofiles_ordernotification_id_seq OWNER TO lafiambrerauser;

--
-- Name: userprofiles_ordernotification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE userprofiles_ordernotification_id_seq OWNED BY userprofiles_ordernotification.id;


--
-- Name: userprofiles_profile; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE userprofiles_profile (
    id integer NOT NULL,
    phone character varying(50),
    lang character varying(2),
    user_id integer,
    customer_id integer,
    accounts_status integer NOT NULL
);


ALTER TABLE public.userprofiles_profile OWNER TO lafiambrerauser;

--
-- Name: userprofiles_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE userprofiles_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofiles_profile_id_seq OWNER TO lafiambrerauser;

--
-- Name: userprofiles_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE userprofiles_profile_id_seq OWNED BY userprofiles_profile.id;


--
-- Name: userprofiles_restaurant; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE userprofiles_restaurant (
    id integer NOT NULL,
    logo character varying(100),
    name character varying(255),
    "desc" text,
    address character varying(255),
    city character varying(50),
    state character varying(50),
    zip_code character varying(30),
    phone character varying(30),
    min_order integer,
    website character varying(200),
    facebook character varying(200),
    twitter character varying(200),
    instagram character varying(200),
    slug character varying(50),
    photoshoot_requested boolean NOT NULL,
    publishing_requested boolean NOT NULL,
    published boolean NOT NULL,
    rate double precision,
    is_confirmed boolean NOT NULL,
    is_premium boolean NOT NULL,
    user_id integer,
    opening_hours text,
    desc_en text,
    desc_es text,
    country character varying(50),
    street character varying(50),
    door character varying(50),
    floor character varying(50)
);


ALTER TABLE public.userprofiles_restaurant OWNER TO lafiambrerauser;

--
-- Name: userprofiles_restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE userprofiles_restaurant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofiles_restaurant_id_seq OWNER TO lafiambrerauser;

--
-- Name: userprofiles_restaurant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE userprofiles_restaurant_id_seq OWNED BY userprofiles_restaurant.id;


--
-- Name: userprofiles_restaurantcontract; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE userprofiles_restaurantcontract (
    id integer NOT NULL,
    text text,
    restaurant_id integer
);


ALTER TABLE public.userprofiles_restaurantcontract OWNER TO lafiambrerauser;

--
-- Name: userprofiles_restaurantcontract_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE userprofiles_restaurantcontract_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofiles_restaurantcontract_id_seq OWNER TO lafiambrerauser;

--
-- Name: userprofiles_restaurantcontract_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE userprofiles_restaurantcontract_id_seq OWNED BY userprofiles_restaurantcontract.id;


--
-- Name: userprofiles_restaurantdelivery; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE userprofiles_restaurantdelivery (
    id integer NOT NULL,
    possible boolean NOT NULL,
    city_id integer,
    restaurant_id integer
);


ALTER TABLE public.userprofiles_restaurantdelivery OWNER TO lafiambrerauser;

--
-- Name: userprofiles_restaurantdelivery_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE userprofiles_restaurantdelivery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofiles_restaurantdelivery_id_seq OWNER TO lafiambrerauser;

--
-- Name: userprofiles_restaurantdelivery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE userprofiles_restaurantdelivery_id_seq OWNED BY userprofiles_restaurantdelivery.id;


--
-- Name: userprofiles_restaurantdiscountcoupon; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE userprofiles_restaurantdiscountcoupon (
    id integer NOT NULL,
    available_from date,
    available_till date,
    time_from time without time zone,
    time_till time without time zone,
    discount_text character varying(50),
    percent double precision,
    restaurant_id integer
);


ALTER TABLE public.userprofiles_restaurantdiscountcoupon OWNER TO lafiambrerauser;

--
-- Name: userprofiles_restaurantdiscountcoupon_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE userprofiles_restaurantdiscountcoupon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofiles_restaurantdiscountcoupon_id_seq OWNER TO lafiambrerauser;

--
-- Name: userprofiles_restaurantdiscountcoupon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE userprofiles_restaurantdiscountcoupon_id_seq OWNED BY userprofiles_restaurantdiscountcoupon.id;


--
-- Name: userprofiles_restaurantimage; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE userprofiles_restaurantimage (
    id integer NOT NULL,
    image character varying(100),
    restaurant_id integer
);


ALTER TABLE public.userprofiles_restaurantimage OWNER TO lafiambrerauser;

--
-- Name: userprofiles_restaurantimage_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE userprofiles_restaurantimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofiles_restaurantimage_id_seq OWNER TO lafiambrerauser;

--
-- Name: userprofiles_restaurantimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE userprofiles_restaurantimage_id_seq OWNED BY userprofiles_restaurantimage.id;


--
-- Name: userprofiles_restaurantreview; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE userprofiles_restaurantreview (
    id integer NOT NULL,
    msg character varying(255),
    datetime timestamp with time zone,
    restaurant_id integer,
    user_id integer
);


ALTER TABLE public.userprofiles_restaurantreview OWNER TO lafiambrerauser;

--
-- Name: userprofiles_restaurantreview_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE userprofiles_restaurantreview_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofiles_restaurantreview_id_seq OWNER TO lafiambrerauser;

--
-- Name: userprofiles_restaurantreview_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE userprofiles_restaurantreview_id_seq OWNED BY userprofiles_restaurantreview.id;


--
-- Name: userprofiles_servicerating; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE userprofiles_servicerating (
    id integer NOT NULL,
    rating integer NOT NULL,
    order_id integer NOT NULL
);


ALTER TABLE public.userprofiles_servicerating OWNER TO lafiambrerauser;

--
-- Name: userprofiles_servicerating_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE userprofiles_servicerating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofiles_servicerating_id_seq OWNER TO lafiambrerauser;

--
-- Name: userprofiles_servicerating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE userprofiles_servicerating_id_seq OWNED BY userprofiles_servicerating.id;


--
-- Name: userprofiles_shift; Type: TABLE; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE TABLE userprofiles_shift (
    id integer NOT NULL,
    week_day character varying(3) NOT NULL,
    start time without time zone NOT NULL,
    "end" time without time zone NOT NULL,
    restaurant_id integer
);


ALTER TABLE public.userprofiles_shift OWNER TO lafiambrerauser;

--
-- Name: userprofiles_shift_id_seq; Type: SEQUENCE; Schema: public; Owner: lafiambrerauser
--

CREATE SEQUENCE userprofiles_shift_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofiles_shift_id_seq OWNER TO lafiambrerauser;

--
-- Name: userprofiles_shift_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lafiambrerauser
--

ALTER SEQUENCE userprofiles_shift_id_seq OWNED BY userprofiles_shift.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY account_emailaddress ALTER COLUMN id SET DEFAULT nextval('account_emailaddress_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('account_emailconfirmation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY carthandler_cart ALTER COLUMN id SET DEFAULT nextval('carthandler_cart_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_blog_it_blogcategory ALTER COLUMN id SET DEFAULT nextval('django_blog_it_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_blog_it_contactussettings ALTER COLUMN id SET DEFAULT nextval('django_blog_it_contactussettings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_blog_it_facebook ALTER COLUMN id SET DEFAULT nextval('django_blog_it_facebook_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_blog_it_google ALTER COLUMN id SET DEFAULT nextval('django_blog_it_google_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_blog_it_image_file ALTER COLUMN id SET DEFAULT nextval('django_blog_it_image_file_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_blog_it_menu ALTER COLUMN id SET DEFAULT nextval('django_blog_it_menu_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_blog_it_page ALTER COLUMN id SET DEFAULT nextval('django_blog_it_page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_blog_it_post ALTER COLUMN id SET DEFAULT nextval('django_blog_it_post_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_blog_it_post_slugs ALTER COLUMN id SET DEFAULT nextval('django_blog_it_post_slugs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_blog_it_post_tags ALTER COLUMN id SET DEFAULT nextval('django_blog_it_post_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_blog_it_posthistory ALTER COLUMN id SET DEFAULT nextval('django_blog_it_posthistory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_blog_it_tags ALTER COLUMN id SET DEFAULT nextval('django_blog_it_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_blog_it_theme ALTER COLUMN id SET DEFAULT nextval('django_blog_it_theme_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_blog_it_userrole ALTER COLUMN id SET DEFAULT nextval('django_blog_it_userrole_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_ses_sesstat ALTER COLUMN id SET DEFAULT nextval('django_ses_sesstat_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY easy_thumbnails_source ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_source_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY easy_thumbnails_thumbnail ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnaildimensions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY login_register_forgetpassword ALTER COLUMN id SET DEFAULT nextval('login_register_forgetpassword_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY mainapp_category ALTER COLUMN id SET DEFAULT nextval('mainapp_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY mainapp_checkoutcomment ALTER COLUMN id SET DEFAULT nextval('mainapp_checkoutcomment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY mainapp_homecontent ALTER COLUMN id SET DEFAULT nextval('mainapp_homecontent_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY mainapp_inviterequest ALTER COLUMN id SET DEFAULT nextval('mainapp_inviterequest_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY mainapp_inviterewards ALTER COLUMN id SET DEFAULT nextval('mainapp_inviterewards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY mainapp_selectionreference ALTER COLUMN id SET DEFAULT nextval('mainapp_selectionreference_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY mainapp_shareselection ALTER COLUMN id SET DEFAULT nextval('mainapp_shareselection_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY mainapp_usernotification ALTER COLUMN id SET DEFAULT nextval('mainapp_usernotification_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY orders_basket ALTER COLUMN id SET DEFAULT nextval('orders_basket_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY orders_comment ALTER COLUMN id SET DEFAULT nextval('orders_comment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY orders_order ALTER COLUMN id SET DEFAULT nextval('orders_order_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY orders_orderdatemail ALTER COLUMN id SET DEFAULT nextval('orders_orderdatemail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY orders_orderitem ALTER COLUMN id SET DEFAULT nextval('orders_orderitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY pages_contactus ALTER COLUMN id SET DEFAULT nextval('pages_contactus_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY pages_faqs ALTER COLUMN id SET DEFAULT nextval('pages_faqs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY pages_groupbenifits ALTER COLUMN id SET DEFAULT nextval('pages_groupbenifits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY pages_lunchsteps ALTER COLUMN id SET DEFAULT nextval('pages_lunchsteps_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY pages_supportdetails ALTER COLUMN id SET DEFAULT nextval('pages_supportdetails_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY payments_lafiambrera_currency ALTER COLUMN id SET DEFAULT nextval('payments_lafiambrera_currency_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY payments_moneytowallet ALTER COLUMN id SET DEFAULT nextval('payments_moneytowallet_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY payments_payment ALTER COLUMN id SET DEFAULT nextval('payments_payment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY payments_paypalpaymentdetails ALTER COLUMN id SET DEFAULT nextval('payments_paypalpaymentdetails_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY payments_wallet ALTER COLUMN id SET DEFAULT nextval('payments_wallet_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY payments_walletorder ALTER COLUMN id SET DEFAULT nextval('payments_walletorder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY payments_walletpayment ALTER COLUMN id SET DEFAULT nextval('payments_walletpayment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY paypal_ipn ALTER COLUMN id SET DEFAULT nextval('paypal_ipn_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY sermepa_sermepaidtpv ALTER COLUMN id SET DEFAULT nextval('sermepa_sermepaidtpv_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY sermepa_sermeparesponse ALTER COLUMN id SET DEFAULT nextval('sermepa_sermeparesponse_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY social_auth_association ALTER COLUMN id SET DEFAULT nextval('social_auth_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY social_auth_code ALTER COLUMN id SET DEFAULT nextval('social_auth_code_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('social_auth_nonce_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY social_auth_partial ALTER COLUMN id SET DEFAULT nextval('social_auth_partial_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('social_auth_usersocialauth_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialapp_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialtoken_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_activation ALTER COLUMN id SET DEFAULT nextval('userprofiles_activation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_adminnotification ALTER COLUMN id SET DEFAULT nextval('userprofiles_adminnotification_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_checkoutpromocode ALTER COLUMN id SET DEFAULT nextval('userprofiles_checkoutpromocode_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_checkoutpromocode_used_by ALTER COLUMN id SET DEFAULT nextval('userprofiles_checkoutpromocode_used_by_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_city ALTER COLUMN id SET DEFAULT nextval('userprofiles_city_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_customer ALTER COLUMN id SET DEFAULT nextval('userprofiles_customer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_lunchbox ALTER COLUMN id SET DEFAULT nextval('userprofiles_lunchbox_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_lunchboxadminmessage ALTER COLUMN id SET DEFAULT nextval('userprofiles_lunchboxadminmessage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_lunchboxdiscount ALTER COLUMN id SET DEFAULT nextval('userprofiles_lunchboxdiscount_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_lunchboxfeedback ALTER COLUMN id SET DEFAULT nextval('userprofiles_lunchboxfeedback_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_lunchboximage ALTER COLUMN id SET DEFAULT nextval('userprofiles_lunchboximage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_lunchboxprivileges ALTER COLUMN id SET DEFAULT nextval('userprofiles_lunchboxprivileges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_lunchboxprivilegesitem ALTER COLUMN id SET DEFAULT nextval('userprofiles_lunchboxprivilegesitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_lunchboxrating ALTER COLUMN id SET DEFAULT nextval('userprofiles_lunchboxrating_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_lunchboxrequest ALTER COLUMN id SET DEFAULT nextval('userprofiles_lunchboxrequest_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_ordernotification ALTER COLUMN id SET DEFAULT nextval('userprofiles_ordernotification_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_profile ALTER COLUMN id SET DEFAULT nextval('userprofiles_profile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_restaurant ALTER COLUMN id SET DEFAULT nextval('userprofiles_restaurant_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_restaurantcontract ALTER COLUMN id SET DEFAULT nextval('userprofiles_restaurantcontract_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_restaurantdelivery ALTER COLUMN id SET DEFAULT nextval('userprofiles_restaurantdelivery_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_restaurantdiscountcoupon ALTER COLUMN id SET DEFAULT nextval('userprofiles_restaurantdiscountcoupon_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_restaurantimage ALTER COLUMN id SET DEFAULT nextval('userprofiles_restaurantimage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_restaurantreview ALTER COLUMN id SET DEFAULT nextval('userprofiles_restaurantreview_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_servicerating ALTER COLUMN id SET DEFAULT nextval('userprofiles_servicerating_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_shift ALTER COLUMN id SET DEFAULT nextval('userprofiles_shift_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
118	hannahmc01@hotmail.com	f	t	557
122	testeresfera@gmail.com	f	t	593
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('account_emailaddress_id_seq', 122, true);


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('account_emailconfirmation_id_seq', 1, false);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY auth_group (id, name) FROM stdin;
1	Customer
2	Employee
3	Restaurant
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('auth_group_id_seq', 4, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add source	7	add_source
20	Can change source	7	change_source
21	Can delete source	7	delete_source
22	Can add thumbnail	8	add_thumbnail
23	Can change thumbnail	8	change_thumbnail
24	Can delete thumbnail	8	delete_thumbnail
25	Can add thumbnail dimensions	9	add_thumbnaildimensions
26	Can change thumbnail dimensions	9	change_thumbnaildimensions
27	Can delete thumbnail dimensions	9	delete_thumbnaildimensions
28	Can add site	10	add_site
29	Can change site	10	change_site
30	Can delete site	10	delete_site
31	Can add email address	11	add_emailaddress
32	Can change email address	11	change_emailaddress
33	Can delete email address	11	delete_emailaddress
34	Can add email confirmation	12	add_emailconfirmation
35	Can change email confirmation	12	change_emailconfirmation
36	Can delete email confirmation	12	delete_emailconfirmation
37	Can add social application	13	add_socialapp
38	Can change social application	13	change_socialapp
39	Can delete social application	13	delete_socialapp
40	Can add social account	14	add_socialaccount
41	Can change social account	14	change_socialaccount
42	Can delete social account	14	delete_socialaccount
43	Can add social application token	15	add_socialtoken
44	Can change social application token	15	change_socialtoken
45	Can delete social application token	15	delete_socialtoken
46	Can add PayPal IPN	16	add_paypalipn
47	Can change PayPal IPN	16	change_paypalipn
48	Can delete PayPal IPN	16	delete_paypalipn
49	Can add sermepa id tpv	17	add_sermepaidtpv
50	Can change sermepa id tpv	17	change_sermepaidtpv
51	Can delete sermepa id tpv	17	delete_sermepaidtpv
52	Can add sermepa response	18	add_sermeparesponse
53	Can change sermepa response	18	change_sermeparesponse
54	Can delete sermepa response	18	delete_sermeparesponse
55	Can add company	19	add_company
56	Can change company	19	change_company
57	Can delete company	19	delete_company
58	Can add profile	20	add_profile
59	Can change profile	20	change_profile
60	Can delete profile	20	delete_profile
61	Can add restaurant	21	add_restaurant
62	Can change restaurant	21	change_restaurant
63	Can delete restaurant	21	delete_restaurant
64	Can add restaurant image	22	add_restaurantimage
65	Can change restaurant image	22	change_restaurantimage
66	Can delete restaurant image	22	delete_restaurantimage
67	Can add restaurant review	23	add_restaurantreview
68	Can change restaurant review	23	change_restaurantreview
69	Can delete restaurant review	23	delete_restaurantreview
70	Can add shift	24	add_shift
71	Can change shift	24	change_shift
72	Can delete shift	24	delete_shift
73	Can add restaurant discount coupon	25	add_restaurantdiscountcoupon
74	Can change restaurant discount coupon	25	change_restaurantdiscountcoupon
75	Can delete restaurant discount coupon	25	delete_restaurantdiscountcoupon
76	Can add checkout promo code	26	add_checkoutpromocode
77	Can change checkout promo code	26	change_checkoutpromocode
78	Can delete checkout promo code	26	delete_checkoutpromocode
79	Can add city	27	add_city
80	Can change city	27	change_city
81	Can delete city	27	delete_city
82	Can add restaurant delivery	28	add_restaurantdelivery
83	Can change restaurant delivery	28	change_restaurantdelivery
84	Can delete restaurant delivery	28	delete_restaurantdelivery
85	Can add restaurant contract	29	add_restaurantcontract
86	Can change restaurant contract	29	change_restaurantcontract
87	Can delete restaurant contract	29	delete_restaurantcontract
88	Can add lunchbox	30	add_lunchbox
89	Can change lunchbox	30	change_lunchbox
90	Can delete lunchbox	30	delete_lunchbox
91	Can add lunchbox image	31	add_lunchboximage
92	Can change lunchbox image	31	change_lunchboximage
93	Can delete lunchbox image	31	delete_lunchboximage
94	Can add Lunchbox privilege	32	add_lunchboxprivileges
95	Can change Lunchbox privilege	32	change_lunchboxprivileges
96	Can delete Lunchbox privilege	32	delete_lunchboxprivileges
97	Can add lunchbox privileges item	33	add_lunchboxprivilegesitem
98	Can change lunchbox privileges item	33	change_lunchboxprivilegesitem
99	Can delete lunchbox privileges item	33	delete_lunchboxprivilegesitem
100	Can add lunchbox discount	34	add_lunchboxdiscount
101	Can change lunchbox discount	34	change_lunchboxdiscount
102	Can delete lunchbox discount	34	delete_lunchboxdiscount
103	Can add lunchbox rating	35	add_lunchboxrating
104	Can change lunchbox rating	35	change_lunchboxrating
105	Can delete lunchbox rating	35	delete_lunchboxrating
106	Can add lunchbox feedback	36	add_lunchboxfeedback
107	Can change lunchbox feedback	36	change_lunchboxfeedback
108	Can delete lunchbox feedback	36	delete_lunchboxfeedback
109	Can add lunchbox request	37	add_lunchboxrequest
110	Can change lunchbox request	37	change_lunchboxrequest
111	Can delete lunchbox request	37	delete_lunchboxrequest
112	Can add lunchbox admin message	38	add_lunchboxadminmessage
113	Can change lunchbox admin message	38	change_lunchboxadminmessage
114	Can delete lunchbox admin message	38	delete_lunchboxadminmessage
115	Can add admin notification	39	add_adminnotification
116	Can change admin notification	39	change_adminnotification
117	Can delete admin notification	39	delete_adminnotification
118	Can add order notification	40	add_ordernotification
119	Can change order notification	40	change_ordernotification
120	Can delete order notification	40	delete_ordernotification
121	Can add activation	41	add_activation
122	Can change activation	41	change_activation
123	Can delete activation	41	delete_activation
124	Can add service rating	42	add_servicerating
125	Can change service rating	42	change_servicerating
126	Can delete service rating	42	delete_servicerating
127	Can add basket	43	add_basket
128	Can change basket	43	change_basket
129	Can delete basket	43	delete_basket
130	Can add order	44	add_order
131	Can change order	44	change_order
132	Can delete order	44	delete_order
133	Can add order item	45	add_orderitem
134	Can change order item	45	change_orderitem
135	Can delete order item	45	delete_orderitem
136	Can add payment	46	add_payment
137	Can change payment	46	change_payment
138	Can delete payment	46	delete_payment
139	Can add SES Stat	47	add_sesstat
140	Can change SES Stat	47	change_sesstat
141	Can delete SES Stat	47	delete_sesstat
142	Can add category	48	add_category
143	Can change category	48	change_category
144	Can delete category	48	delete_category
145	Can add language	49	add_language
146	Can change language	49	change_language
147	Can delete language	49	delete_language
148	Can add faqs	50	add_faqs
149	Can change faqs	50	change_faqs
150	Can delete faqs	50	delete_faqs
151	Can add lunch steps	51	add_lunchsteps
152	Can change lunch steps	51	change_lunchsteps
153	Can delete lunch steps	51	delete_lunchsteps
154	Can add contact us	52	add_contactus
155	Can change contact us	52	change_contactus
156	Can delete contact us	52	delete_contactus
157	Can add google	53	add_google
158	Can change google	53	change_google
159	Can delete google	53	delete_google
160	Can add facebook	54	add_facebook
161	Can change facebook	54	change_facebook
162	Can delete facebook	54	delete_facebook
163	Can add tags	55	add_tags
164	Can change tags	55	change_tags
165	Can delete tags	55	delete_tags
166	Can add post	56	add_post
167	Can change post	56	change_post
168	Can delete post	56	delete_post
169	Can add post_ slugs	57	add_post_slugs
170	Can change post_ slugs	57	change_post_slugs
171	Can delete post_ slugs	57	delete_post_slugs
172	Can add contact us settings	58	add_contactussettings
173	Can change contact us settings	58	change_contactussettings
174	Can delete contact us settings	58	delete_contactussettings
175	Can add image_ file	59	add_image_file
176	Can change image_ file	59	change_image_file
177	Can delete image_ file	59	delete_image_file
178	Can add theme	60	add_theme
179	Can change theme	60	change_theme
180	Can delete theme	60	delete_theme
181	Can add page	61	add_page
182	Can change page	61	change_page
183	Can delete page	61	delete_page
184	Can add post history	62	add_posthistory
185	Can change post history	62	change_posthistory
186	Can delete post history	62	delete_posthistory
187	Can add category	63	add_category
188	Can change category	63	change_category
189	Can delete category	63	delete_category
190	Can add menu	64	add_menu
191	Can change menu	64	change_menu
192	Can delete menu	64	delete_menu
193	Can add user role	65	add_userrole
194	Can change user role	65	change_userrole
195	Can delete user role	65	delete_userrole
196	Can add blog category	63	add_blogcategory
197	Can change blog category	63	change_blogcategory
198	Can delete blog category	63	delete_blogcategory
199	Can add lafiambrera_ currency	66	add_lafiambrera_currency
200	Can change lafiambrera_ currency	66	change_lafiambrera_currency
201	Can delete lafiambrera_ currency	66	delete_lafiambrera_currency
202	Can add home content	67	add_homecontent
203	Can change home content	67	change_homecontent
204	Can delete home content	67	delete_homecontent
205	Can add money to wallet	68	add_moneytowallet
206	Can change money to wallet	68	change_moneytowallet
207	Can delete money to wallet	68	delete_moneytowallet
208	Can add customer	69	add_customer
209	Can change customer	69	change_customer
210	Can delete customer	69	delete_customer
211	Can add association	70	add_association
212	Can change association	70	change_association
213	Can delete association	70	delete_association
214	Can add nonce	71	add_nonce
215	Can change nonce	71	change_nonce
216	Can delete nonce	71	delete_nonce
217	Can add code	72	add_code
218	Can change code	72	change_code
219	Can delete code	72	delete_code
220	Can add user social auth	73	add_usersocialauth
221	Can change user social auth	73	change_usersocialauth
222	Can delete user social auth	73	delete_usersocialauth
223	Can add partial	74	add_partial
224	Can change partial	74	change_partial
225	Can delete partial	74	delete_partial
226	Can add to cart	75	add_tocart
227	Can change to cart	75	change_tocart
228	Can delete to cart	75	delete_tocart
229	Can add auth cart user	76	add_authcartuser
230	Can change auth cart user	76	change_authcartuser
231	Can delete auth cart user	76	delete_authcartuser
232	Can add cart	77	add_cart
233	Can change cart	77	change_cart
234	Can delete cart	77	delete_cart
235	Can add checkout comment	78	add_checkoutcomment
236	Can change checkout comment	78	change_checkoutcomment
237	Can delete checkout comment	78	delete_checkoutcomment
238	Can add wallet payment	79	add_walletpayment
239	Can change wallet payment	79	change_walletpayment
240	Can delete wallet payment	79	delete_walletpayment
241	Can add category	80	add_category
242	Can change category	80	change_category
243	Can delete category	80	delete_category
244	Can add paypal payment details	81	add_paypalpaymentdetails
245	Can change paypal payment details	81	change_paypalpaymentdetails
246	Can delete paypal payment details	81	delete_paypalpaymentdetails
247	Can add wallet	82	add_wallet
248	Can change wallet	82	change_wallet
249	Can delete wallet	82	delete_wallet
250	Can add wallet order	83	add_walletorder
251	Can change wallet order	83	change_walletorder
252	Can delete wallet order	83	delete_walletorder
253	Can add pay wallet	84	add_paywallet
254	Can change pay wallet	84	change_paywallet
255	Can delete pay wallet	84	delete_paywallet
256	Can add testing table	85	add_testingtable
257	Can change testing table	85	change_testingtable
258	Can delete testing table	85	delete_testingtable
259	Can add comment	86	add_comment
260	Can change comment	86	change_comment
261	Can delete comment	86	delete_comment
262	Can add group benifits	87	add_groupbenifits
263	Can change group benifits	87	change_groupbenifits
264	Can delete group benifits	87	delete_groupbenifits
265	Can add invit request	88	add_invitrequest
266	Can change invit request	88	change_invitrequest
267	Can delete invit request	88	delete_invitrequest
268	Can add invite request	89	add_inviterequest
269	Can change invite request	89	change_inviterequest
270	Can delete invite request	89	delete_inviterequest
271	Can add invite rewards	90	add_inviterewards
272	Can change invite rewards	90	change_inviterewards
273	Can delete invite rewards	90	delete_inviterewards
274	Can add user notification	91	add_usernotification
275	Can change user notification	91	change_usernotification
276	Can delete user notification	91	delete_usernotification
278	Can add forget password	93	add_forgetpassword
279	Can change forget password	93	change_forgetpassword
280	Can delete forget password	93	delete_forgetpassword
281	Can add share selection	94	add_shareselection
282	Can change share selection	94	change_shareselection
283	Can delete share selection	94	delete_shareselection
284	Can add selection reference	95	add_selectionreference
285	Can change selection reference	95	change_selectionreference
286	Can delete selection reference	95	delete_selectionreference
287	Can add order date mail	96	add_orderdatemail
288	Can change order date mail	96	change_orderdatemail
289	Can delete order date mail	96	delete_orderdatemail
290	Can add support details	97	add_supportdetails
291	Can change support details	97	change_supportdetails
292	Can delete support details	97	delete_supportdetails
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('auth_permission_id_seq', 292, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
588		\N	f	guest0				f	t	2017-10-03 06:56:36.65759+02
591	pbkdf2_sha256$36000$XVH0Z8gCvSJk$L2HAqkDR8M4FgcPVECNtNi5tVzG9sJEYJDrANQHttc8=	2017-10-03 07:26:29.725492+02	f	amandeep_kaur@esferasoft.com	Aman	Thakur	amandeep_kaur@esferasoft.com	f	t	2017-10-03 07:26:29.31378+02
412	pbkdf2_sha256$36000$QwL9UJdajrFj$tPCJ05N88XlYphS2VzM0493PoKMmOdrh4dJD3+rA/Kk=	2017-10-09 17:08:16.853492+02	f	admin@mohointernational.com	Hannah	Collins	admin@mohointernational.com	f	t	2017-09-04 12:00:24+02
557	!dPu9oWFhKzmSFE3n8Fec2EmIGuOl61yeV5oCqNDC	2017-10-26 14:57:33.646429+02	f	hannah	Hannah	Collins	hannahmc01@hotmail.com	f	t	2017-09-21 15:01:48.38888+02
518	pbkdf2_sha256$36000$Fa2YBMZgqQJD$X7mLv7hN45MeTr9G/07QOW7IyOitjOYNKi/QoXaw9PI=	2017-09-18 12:01:02.826584+02	f	hannahcollins1402@gmail.com	Emily	Collins	hannahcollins1402@gmail.com	f	t	2017-09-18 12:00:20.11875+02
515	pbkdf2_sha256$36000$2u6zDXg6WUJk$AV9JJwT27wokVPh0ernagSWF/JxwUpsQvtoFZMmJ7+w=	2017-09-15 17:11:51.409957+02	f	info@mohointernational.com	Arash	Mashkoor	info@mohointernational.com	f	t	2017-09-15 17:10:24.139302+02
600		\N	f	guest603				f	t	2017-10-27 16:15:28.095518+02
512	pbkdf2_sha256$36000$BtuaSwsfykTA$WSZ1P01ykMVRkWnbA2vQTEmvwIsEGUG9li0vD/Fdoz0=	2017-10-27 16:33:55.681232+02	t	test123			dontdelete@delete.com	t	t	2017-09-15 09:17:48.209188+02
536	pbkdf2_sha256$36000$DU4oG6cNYlEP$cbFlMppc5rO87Me+SxhuRhQRlIFcRbchbnplgbYAwek=	2017-09-21 15:17:22.275283+02	f	info@mohoparty.com	la 	fiambrera	info@mohoparty.com	f	t	2017-09-20 11:06:02.198881+02
595		\N	f	guest589				f	t	2017-10-11 12:52:40.869316+02
587	pbkdf2_sha256$36000$0sCKwN5qQKPp$NQshHE0ychGnAW0pyVBSDxDccghPpVzwouT0tpibYPs=	2017-10-03 15:04:33.116257+02	f	ritik@gmail.com	ritik	thakur	ritik@gmail.com	f	t	2017-10-03 06:22:30.618015+02
598		\N	f	guest599				f	t	2017-10-27 13:19:05.957262+02
601	pbkdf2_sha256$36000$GjlqD1NScX8l$4TTebxLQU2cYl6ofvL1WZHLDHIuSdypgkfWgF8CZyGE=	2017-11-01 06:15:38.887221+01	t	test				t	t	2017-11-01 06:15:17.379152+01
584	pbkdf2_sha256$36000$k98TGozjMRWk$A/nEGWPfF9yplq2SFQ+Q6m4PMlOnJRxkbQxOZg73IN0=	2017-10-03 07:44:02.951627+02	f	rajinder_mohan@esferasoft.com	Raj	Sharma	rajinder_mohan@esferasoft.com	f	t	2017-10-03 05:56:02.574299+02
589	pbkdf2_sha256$36000$TV5T5vcmlWBd$6uNJLhgGtzwIfy/bxXsbvoKhy5KEXq33RuxtSgVP1vs=	2017-10-03 07:56:21.540571+02	f	poonam_kumari@esferasoft.com	Poonam	Thakur	poonam_kumari@esferasoft.com	f	t	2017-10-03 07:14:44.758268+02
590		\N	f	guest581				f	t	2017-10-03 07:21:37.956995+02
585	pbkdf2_sha256$36000$z8KWI1MW17uG$GiM/L1k33IzqqBZKVeNixPjMnPkgiZW6nFvPQl5kZZw=	2017-10-04 07:06:22.200316+02	f	bandna@gmail.com	Bandna	Thakur	bandna@gmail.com	f	t	2017-10-03 05:58:55.833409+02
596		\N	f	guest597				f	t	2017-10-13 15:41:19.693844+02
593	!xSgFTkTFfhRdBBW7rpsgN3U49upQq8MBVJRJqkuK	2017-10-03 07:49:39.296093+02	f	amit	Amit	Rana	testeresfera@gmail.com	f	t	2017-10-03 07:49:39.2639+02
599	pbkdf2_sha256$36000$zaGAUIlV2kDi$DS6erlooznH4wa2IXjIiq1Hg/d2lz3BJ9EhdPExrjRw=	2017-10-27 13:30:00.989886+02	f	cris.mq1991@gmail.com	cristina 	muoz	cris.mq1991@gmail.com	f	t	2017-10-27 13:30:00.678025+02
514	pbkdf2_sha256$36000$wGgJSPaQJzEq$LDr5IjmXPYiRx+hdMh5RVYe8UAOG5tdBlLvBVWDvozw=	2017-09-21 12:41:56.61366+02	f	mohodrinks@gmail.com	Restaurant	Owner	mohodrinks@gmail.com	f	t	2017-09-15 12:40:13.451997+02
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
187	584	1
188	585	1
190	587	3
191	589	1
192	591	1
193	599	1
145	514	3
146	515	3
149	518	3
163	536	3
110	412	1
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 193, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('auth_user_id_seq', 601, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: carthandler_cart; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY carthandler_cart (id, delivery_date, delivery_time, total_price, qty, user_status, lunchbox_id, user_id) FROM stdin;
596	\N	\N	100	1	0	98	595
597	\N	\N	2600	26	0	99	596
580	\N	\N	127.25	5	0	97	588
598	\N	\N	100	1	0	98	596
588	\N	\N	100	1	1	99	591
601	2017-10-31	12:00:00	12	1	1	100	599
602	\N	\N	12	1	1	100	557
603	\N	\N	100	1	0	99	600
\.


--
-- Name: carthandler_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('carthandler_cart_id_seq', 603, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1849	2017-09-15 09:20:14.220042+02	409	amit	3		4	512
1850	2017-09-15 13:00:08.990757+02	488	1z@gmail.com	3		4	512
1851	2017-09-15 13:00:08.993081+02	513	amit	3		4	512
1852	2017-09-15 13:00:08.994495+02	373	aparna@gmail.com	3		4	512
1853	2017-09-15 13:00:08.995775+02	405	arnav@gmail.com	3		4	512
1854	2017-09-15 13:00:08.997038+02	484	asdfg@gmail.com	3		4	512
1855	2017-09-15 13:00:08.998304+02	483	asd@gmail.com	3		4	512
1856	2017-09-15 13:00:08.999614+02	478	asff@gmail.com	3		4	512
1857	2017-09-15 13:00:09.000797+02	489	chander_shekhar@esferasoft.com	3		4	512
1858	2017-09-15 13:00:09.001981+02	494	e@gmail.com	3		4	512
1859	2017-09-15 13:00:09.003184+02	375	guest0	3		4	512
1860	2017-09-15 13:00:09.004394+02	377	guest213	3		4	512
1861	2017-09-15 13:00:09.005535+02	379	guest218	3		4	512
1862	2017-09-15 13:00:09.006698+02	380	guest220	3		4	512
1863	2017-09-15 13:00:09.007852+02	399	guest240	3		4	512
1864	2017-09-15 13:00:09.008972+02	404	guest241	3		4	512
1865	2017-09-15 13:00:09.010098+02	410	guest260	3		4	512
1866	2017-09-15 13:00:09.011361+02	413	guest261	3		4	512
1867	2017-09-15 13:00:09.012543+02	424	guest287	3		4	512
1868	2017-09-15 13:00:09.013687+02	429	guest295	3		4	512
1869	2017-09-15 13:00:09.015059+02	433	guest300	3		4	512
1870	2017-09-15 13:00:09.016213+02	435	guest308	3		4	512
1871	2017-09-15 13:00:09.017385+02	447	guest320	3		4	512
1872	2017-09-15 13:00:09.018475+02	438	guest321	3		4	512
1873	2017-09-15 13:00:09.019637+02	441	guest329	3		4	512
1874	2017-09-15 13:00:09.020867+02	444	guest332	3		4	512
1875	2017-09-15 13:00:09.022027+02	449	guest344	3		4	512
1876	2017-09-15 13:00:09.023635+02	448	guest345	3		4	512
1877	2017-09-15 13:00:09.025871+02	451	guest348	3		4	512
1878	2017-09-15 13:00:09.027018+02	453	guest351	3		4	512
1879	2017-09-15 13:00:09.028186+02	454	guest354	3		4	512
1880	2017-09-15 13:00:09.029317+02	455	guest355	3		4	512
1881	2017-09-15 13:00:09.03048+02	462	guest378	3		4	512
1882	2017-09-15 13:00:09.031628+02	464	guest380	3		4	512
1883	2017-09-15 13:00:09.032815+02	465	guest394	3		4	512
1884	2017-09-15 13:00:09.033941+02	466	guest397	3		4	512
1885	2017-09-15 13:00:09.035177+02	467	guest398	3		4	512
1886	2017-09-15 13:00:09.03637+02	468	guest399	3		4	512
1887	2017-09-15 13:00:09.037497+02	469	guest402	3		4	512
1888	2017-09-15 13:00:09.038626+02	470	guest405	3		4	512
1889	2017-09-15 13:00:09.039806+02	479	guest406	3		4	512
1890	2017-09-15 13:00:09.041064+02	473	guest407	3		4	512
1891	2017-09-15 13:00:09.04225+02	475	guest409	3		4	512
1892	2017-09-15 13:00:09.043546+02	474	guest410	3		4	512
1893	2017-09-15 13:00:09.044749+02	486	guest421	3		4	512
1894	2017-09-15 13:00:09.045917+02	493	guest431	3		4	512
1895	2017-09-15 13:00:09.047065+02	505	guest435	3		4	512
1896	2017-09-15 13:00:09.048305+02	506	guest436	3		4	512
1897	2017-09-15 13:00:09.049489+02	507	guest437	3		4	512
1898	2017-09-15 13:00:09.050693+02	508	guest438	3		4	512
1899	2017-09-15 13:00:09.05188+02	509	guest439	3		4	512
1900	2017-09-15 13:00:09.053053+02	510	guest440	3		4	512
1901	2017-09-15 13:00:09.054181+02	392	hannah	3		4	512
1902	2017-09-15 13:00:09.055327+02	385	jatinder	3		4	512
1903	2017-09-15 13:00:09.056469+02	416	kangna@gmail.com	3		4	512
1904	2017-09-15 13:00:09.057584+02	411	pihu@gmail.com	3		4	512
1905	2017-09-15 13:00:09.058777+02	477	radha@gmail.com	3		4	512
1906	2017-09-15 13:00:09.060029+02	457	raghav@gmail.com	3		4	512
1907	2017-09-15 13:00:09.06121+02	456	rahul@gmail.com	3		4	512
1908	2017-09-15 13:00:09.062363+02	397	rajinder	3		4	512
1909	2017-09-15 13:00:09.06365+02	458	rishu@gmail.com	3		4	512
1910	2017-09-15 13:00:09.064776+02	374	rudra	3		4	512
1911	2017-09-15 13:00:09.065928+02	407	siya@gmail.com	3		4	512
1912	2017-09-15 13:00:09.067137+02	376	vipul	3		4	512
1913	2017-09-15 13:00:09.068285+02	482	z@gmail.com	3		4	512
1914	2017-09-18 17:23:29.939426+02	1	Eat Local, Eat Fresh	2	[]	67	512
1915	2017-09-18 17:24:19.525686+02	178	rajinder_mohan@esferasoft.com	2	[{"changed": {"fields": ["msg", "msg_en"]}}]	91	512
1916	2017-09-18 18:00:41.088728+02	4	Steps to a healthy lunch	2	[{"changed": {"fields": ["content", "content_en", "content_es"]}}]	51	512
1917	2017-09-19 07:54:03.424389+02	522	amit	3		4	512
1918	2017-09-19 08:45:08.841741+02	4	Steps to a healthy lunch	2	[{"changed": {"fields": ["content"]}}]	51	512
1919	2017-09-19 08:48:25.499711+02	4	Steps to a healthy lunch	2	[{"changed": {"fields": ["content", "content_en"]}}]	51	512
1920	2017-09-19 08:50:44.871681+02	4	Steps to a healthy lunch	2	[{"changed": {"fields": ["content_en"]}}]	51	512
1921	2017-09-19 09:17:23.589498+02	4	Steps to a healthy lunch	2	[{"changed": {"fields": ["content", "content_en", "content_es"]}}]	51	512
1922	2017-09-19 09:17:49.706395+02	4	Steps to a healthy lunch	2	[{"changed": {"fields": ["content", "content_en", "content_es"]}}]	51	512
1923	2017-09-19 09:54:22.992769+02	4	Steps to a healthy lunch	2	[{"changed": {"fields": ["content", "content_en", "content_es"]}}]	51	512
1924	2017-09-19 09:55:27.358429+02	4	Steps to a healthy lunch	2	[{"changed": {"fields": ["content", "content_en", "content_es"]}}]	51	512
1925	2017-09-19 11:04:18.756672+02	4	Steps to a healthy lunch	2	[]	51	512
1926	2017-09-19 11:11:27.961156+02	4	Steps to a healthy lunch	2	[{"changed": {"fields": ["content_en"]}}]	51	512
1927	2017-09-19 11:23:28.014977+02	4	Steps to a healthy lunch	2	[{"changed": {"fields": ["content_en"]}}]	51	512
1928	2017-09-19 11:24:12.148908+02	4	Steps to a healthy lunch	2	[]	51	512
1929	2017-09-19 11:25:49.362176+02	4	Steps to a healthy lunch	2	[{"changed": {"fields": ["content", "content_en"]}}]	51	512
1930	2017-09-19 11:54:26.813388+02	4	Steps to a healthy lunch	2	[{"changed": {"fields": ["content_en"]}}]	51	512
1931	2017-09-19 11:59:01.083629+02	4	Steps to a healthy lunch	2	[{"changed": {"fields": ["content"]}}]	51	512
1932	2017-09-19 12:26:10.144948+02	4	Steps to a healthy lunch	2	[{"changed": {"fields": ["content", "content_en"]}}]	51	512
1933	2017-09-19 12:36:30.45266+02	1	Eat Local, Eat Fresh	2	[{"changed": {"fields": ["msg", "msg_en", "msg_es"]}}]	67	512
1934	2017-09-19 12:41:58.473483+02	528	dhanesh@esferasoft.com	3		4	512
1935	2017-09-19 13:03:57.184704+02	529	dhanesh@esferasoft.com	3		4	512
1936	2017-09-19 13:08:56.504214+02	530	dhanesh@esferasoft.com	3		4	512
1937	2017-09-19 13:11:39.980213+02	531	dhanesh@esferasoft.com	3		4	512
1938	2017-09-19 13:14:15.24749+02	532	dhanesh@esferasoft.com	3		4	512
1939	2017-09-19 13:14:52.223246+02	533	dhanesh@esferasoft.com	3		4	512
1940	2017-09-19 13:16:53.382631+02	690	Hannah's Restaurant	3		24	512
1941	2017-09-19 13:17:00.654084+02	688	Hannah's Restaurant	3		24	512
1942	2017-09-19 13:53:53.972932+02	523	amit	3		4	512
1943	2017-09-20 14:08:22.645027+02	535	amit	3		4	512
1944	2017-09-20 14:39:13.19053+02	538	amit	3		4	512
1945	2017-09-20 15:30:54.357206+02	516	rajinder_mohan@esferasoft.com	3		4	512
1946	2017-09-20 15:33:14.7294+02	540	rajinder_mohan@esferasoft.com	3		4	512
1947	2017-09-21 07:32:18.227959+02	539	amit	3		4	512
1948	2017-09-21 07:38:06.95706+02	537	isha_sharma@esferasoft.com	3		4	512
1949	2017-09-21 07:46:33.264797+02	546	amit	3		4	512
1950	2017-09-21 08:39:57.1546+02	521	poonam_kumari@esferasoft.com	3		4	512
1951	2017-09-21 08:40:19.398295+02	548	amit	3		4	512
1952	2017-09-21 08:46:46.803406+02	550	poonam_kumari@esferasoft.com	3		4	512
1953	2017-09-21 08:50:37.517271+02	549	amit	3		4	512
1954	2017-09-21 08:51:46.968122+02	552	amit	3		4	512
1955	2017-09-21 15:40:44.273308+02	1	Eat Local, Eat Fresh	2	[{"changed": {"fields": ["msg", "msg_en", "msg_es"]}}]	67	512
1956	2017-09-22 05:49:51.878573+02	558	dhanesh@esferasoft.com	3		4	512
1957	2017-09-22 05:49:51.882623+02	559	jatinder_kumar@esferasoft.com	3		4	512
1958	2017-09-22 09:08:55.288107+02	31	Code: mypromo222, Percent: 10.0%, Quantity: 5	2	[]	26	512
1959	2017-09-23 06:54:21.283828+02	68	anika restaurant	2	[{"changed": {"fields": ["desc", "desc_en", "desc_es", "opening_hours"]}}]	21	512
1960	2017-09-25 08:37:23.627728+02	144	amit	3		14	512
1961	2017-09-25 09:07:39.192455+02	117	testeresfera@gmail.com (amit)	3		11	512
1962	2017-09-26 06:12:04.403552+02	553	amit	3		4	512
1963	2017-09-26 06:14:00.416574+02	571	amit	3		4	512
1964	2017-09-26 06:23:54.35482+02	551	poonam_kumari@esferasoft.com	3		4	512
1965	2017-09-26 06:49:18.572829+02	32	Code: mypromo223, Percent: 10.0%, Quantity: 5	1	[{"added": {}}]	26	512
1966	2017-09-26 07:46:38.656781+02	33	Code: mypromo500, Percent: 10.0%, Quantity: 5	1	[{"added": {}}]	26	512
1967	2017-09-26 11:10:24.852013+02	547	isha_sharma@esferasoft.com	3		4	512
1968	2017-09-27 12:25:35.606073+02	91	sat resturant	3		30	512
1969	2017-09-27 12:25:35.610803+02	90	Yummy Times	3		30	512
1970	2017-09-27 12:25:35.618412+02	88	Lunchbox Test	3		30	512
1971	2017-09-27 12:25:35.63187+02	87	aman tester	3		30	512
1972	2017-09-27 12:25:35.633778+02	86	box	3		30	512
1973	2017-09-27 12:25:35.635215+02	84	my box	3		30	512
1974	2017-09-27 12:25:35.636574+02	78	Testing Lunchbox	3		30	512
1975	2017-09-27 12:25:35.637791+02	77	Test Lunchbox sdf	3		30	512
1976	2017-09-27 12:25:35.638986+02	76	Dummy Testing	3		30	512
1977	2017-09-27 12:25:35.640251+02	75	Dummy tester	3		30	512
1978	2017-09-27 12:25:35.641401+02	74	Indian	3		30	512
1979	2017-09-27 12:25:35.642577+02	73	Indian	3		30	512
1980	2017-09-27 12:25:35.643755+02	72	Cucumber Chat	3		30	512
1981	2017-09-27 12:25:35.644914+02	71	Lactose	3		30	512
1982	2017-09-27 12:25:35.646044+02	70	Test Demo	3		30	512
1983	2017-09-27 12:25:35.64721+02	69	Test Reci	3		30	512
1984	2017-09-27 12:25:35.648467+02	68	Test Rajmah	3		30	512
1985	2017-09-27 12:25:35.649692+02	67	Rajmah Recipe	3		30	512
1986	2017-09-27 12:25:35.651127+02	65	Rajmah	3		30	512
1987	2017-09-27 12:25:35.65256+02	64	Rice rajmah	3		30	512
1988	2017-09-27 12:25:35.653829+02	63	kadai paneer 	3		30	512
1989	2017-09-27 12:25:35.655194+02	62	saahi paneer	3		30	512
1990	2017-09-27 12:25:35.656435+02	55	Vegetarian Sushi Selection	3		30	512
1991	2017-09-27 12:25:35.657796+02	54	Quinoa Salad and Lasagne	3		30	512
1992	2017-09-27 12:26:21.642307+02	578	guest577	3		77	512
1993	2017-09-27 12:26:21.645461+02	576	anu@gmail.com	3		77	512
1994	2017-09-27 12:26:21.647319+02	570	guest569	3		77	512
1995	2017-09-27 12:26:21.648692+02	565	isha_sharma@esferasoft.com	3		77	512
1996	2017-09-27 12:26:21.650136+02	478	emilyc07@hotmail.com	3		77	512
1997	2017-09-27 12:26:21.65166+02	472	guest470	3		77	512
1998	2017-10-03 05:50:43.893503+02	554	aadya@gmail.com	3		4	512
1999	2017-10-03 05:50:43.899395+02	524	aanya@gmail.com	3		4	512
2000	2017-10-03 05:50:43.901097+02	570	amandeep_kaur@esferasoft.com	3		4	512
2001	2017-10-03 05:50:43.902439+02	544	aman@gmailc.om	3		4	512
2002	2017-10-03 05:50:43.903801+02	572	amit	3		4	512
2003	2017-10-03 05:50:43.905256+02	555	anika@gmail.com	3		4	512
2004	2017-10-03 05:50:43.906651+02	520	anu@gmail.com	3		4	512
2005	2017-10-03 05:50:43.908035+02	541	arsh@gmail.com	3		4	512
2006	2017-10-03 05:50:43.909255+02	542	arshleen@gmail.com	3		4	512
2007	2017-10-03 05:50:43.910615+02	561	emilyc07@hotmail.com	3		4	512
2008	2017-10-03 05:50:43.912071+02	566	esfera@gmail.com	3		4	512
2009	2017-10-03 05:50:43.91332+02	526	guest436	3		4	512
2010	2017-10-03 05:50:43.914576+02	545	guest470	3		4	512
2011	2017-10-03 05:50:43.915909+02	556	guest473	3		4	512
2012	2017-10-03 05:50:43.917249+02	560	guest478	3		4	512
2013	2017-10-03 05:50:43.918504+02	575	guest479	3		4	512
2014	2017-10-03 05:50:43.92002+02	563	guest485	3		4	512
2015	2017-10-03 05:50:43.921277+02	564	guest494	3		4	512
2016	2017-10-03 05:50:43.922889+02	568	guest509	3		4	512
2017	2017-10-03 05:50:43.924279+02	580	guest569	3		4	512
2018	2017-10-03 05:50:43.925614+02	581	guest572	3		4	512
2019	2017-10-03 05:50:43.927016+02	583	guest577	3		4	512
2020	2017-10-03 05:50:43.928479+02	577	isha_sharma@esferasoft.com	3		4	512
2021	2017-10-03 05:50:43.930022+02	574	navya@gmail.com	3		4	512
2022	2017-10-03 05:50:43.931675+02	573	poonam_kumari@esferasoft.com	3		4	512
2023	2017-10-03 05:50:43.933942+02	569	qweqeqw@gmail.com	3		4	512
2024	2017-10-03 05:50:43.935418+02	578	radha@gmail.com	3		4	512
2025	2017-10-03 05:50:43.936658+02	525	ridima@gmail.com	3		4	512
2026	2017-10-03 05:50:43.938134+02	534	sagun@gmail.com	3		4	512
2027	2017-10-03 05:50:43.939646+02	576	sania@gmail.com	3		4	512
2028	2017-10-03 05:50:43.941235+02	527	sinu@gmail.com	3		4	512
2029	2017-10-03 05:50:43.94326+02	519	sivam@gmail.com	3		4	512
2030	2017-10-03 05:50:43.944652+02	565	testerchd@gmail.com	3		4	512
2031	2017-10-03 05:50:43.946173+02	543	test@gmail.com	3		4	512
2032	2017-10-03 07:48:36.640196+02	592	amit	3		4	512
2033	2017-10-03 08:16:22.902924+02	34	Code: mypromo99, Percent: 10.0%, Quantity: 5	1	[{"added": {}}]	26	512
2034	2017-10-26 08:55:04.977719+02	5	Low calorie	2	[{"changed": {"fields": ["title", "title_en", "title_es", "description", "description_en", "description_es", "slug"]}}]	48	512
2035	2017-10-26 08:55:28.107484+02	8	dummmmy category	3		48	512
2036	2017-10-26 09:11:01.89745+02	4	Lactose-free	2	[{"changed": {"fields": ["title_es", "description", "description_en", "description_es"]}}]	48	512
2037	2017-10-26 09:13:52.419016+02	5	Low calorie	2	[{"changed": {"fields": ["image"]}}]	48	512
2038	2017-10-26 09:22:30.768646+02	3	Cross-fit	2	[{"changed": {"fields": ["description", "description_en", "description_es", "image"]}}]	48	512
2039	2017-10-26 09:28:56.235241+02	2	Yoga	2	[{"changed": {"fields": ["description", "description_en", "description_es", "image"]}}]	48	512
2040	2017-10-26 09:38:08.025733+02	1	Gluten-free	2	[{"changed": {"fields": ["title_es", "description", "description_en", "description_es", "image"]}}]	48	512
2041	2017-10-26 09:44:10.82189+02	10	Dairy-free	1	[{"added": {}}]	48	512
2042	2017-10-26 09:49:19.859933+02	4	Steps to a healthy lunch	2	[{"changed": {"fields": ["content", "content_en"]}}]	51	512
2043	2017-10-26 09:54:09.906455+02	1	Discounts	2	[{"changed": {"fields": ["image"]}}]	87	512
2044	2017-10-26 12:08:11.924014+02	1	Discounts	2	[{"changed": {"fields": ["image"]}}]	87	512
2045	2017-10-26 12:12:43.257075+02	2	Credits	2	[{"changed": {"fields": ["image"]}}]	87	512
2046	2017-10-26 12:27:00.12271+02	3	Invitations	2	[{"changed": {"fields": ["title", "title_en", "title_es", "image"]}}]	87	512
2047	2017-10-26 12:28:05.670431+02	3	Invitations	2	[{"changed": {"fields": ["head", "head_en"]}}]	87	512
2048	2017-10-26 12:45:47.910576+02	9	Is there a minimum order?	2	[{"changed": {"fields": ["title", "title_en", "title_es", "description", "description_en", "description_es"]}}]	50	512
2049	2017-10-26 12:46:28.664939+02	8	HOW DOES OUR ORDERING SYSTEM WORK?	3		50	512
2050	2017-10-26 12:46:28.668821+02	7	Lorem ipsum dolor sit amet, consectetur ?	3		50	512
2051	2017-10-26 12:46:28.67046+02	3	IS THERE A MINIMUM ORDER?	3		50	512
2052	2017-10-26 12:46:28.672013+02	2	HOW DOES OUR ORDERING SYSTEM WORK?	3		50	512
2053	2017-10-26 12:46:28.673682+02	1	This Is Firs Faq in DB.	3		50	512
2054	2017-10-26 12:50:21.035229+02	6	When can I order food?	2	[{"changed": {"fields": ["title", "title_en", "title_es", "description", "description_en", "description_es"]}}]	50	512
2055	2017-10-26 14:54:00.189718+02	5	How can I apply a promotional code?	2	[{"changed": {"fields": ["title", "title_en", "title_es", "description", "description_en", "description_es"]}}]	50	512
2056	2017-10-26 15:10:18.695365+02	4	How can I pay for my order?	2	[{"changed": {"fields": ["title", "title_en", "title_es", "description", "description_en", "description_es"]}}]	50	512
2057	2017-10-26 15:16:36.042881+02	6	Healthy eating	1	[{"added": {}}]	63	512
2058	2017-10-26 15:37:08.009699+02	9	The Benefits of Avocados in your Diet	1	[{"added": {}}]	56	512
2059	2017-10-26 15:37:34.749723+02	9	The Benefits of Avocados in your Diet	2	[{"changed": {"fields": ["status"]}}]	56	512
2060	2017-10-26 15:45:08.176718+02	1	http://138.68.136.81:9002/	2	[{"changed": {"fields": ["name"]}}]	10	512
2061	2017-10-26 15:47:08.678777+02	2	Paul Alto	3		27	512
2062	2017-10-27 16:12:20.586371+02	1	Eat Local, Eat Fresh	2	[]	67	512
2063	2017-10-27 16:13:07.287425+02	89	bandna thakur	2	[{"changed": {"fields": ["msg"]}}]	52	512
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 2063, true);


--
-- Data for Name: django_blog_it_blogcategory; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY django_blog_it_blogcategory (id, name, slug, description, is_active, user_id, meta_description, meta_keywords) FROM stdin;
6	Healthy eating	healthy-eating	Blog posts about eating healthily	t	412		
\.


--
-- Name: django_blog_it_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('django_blog_it_category_id_seq', 6, true);


--
-- Data for Name: django_blog_it_contactussettings; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY django_blog_it_contactussettings (id, from_email, reply_to_email, email_admin, subject, body_user, body_admin) FROM stdin;
\.


--
-- Name: django_blog_it_contactussettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('django_blog_it_contactussettings_id_seq', 1, false);


--
-- Data for Name: django_blog_it_facebook; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY django_blog_it_facebook (id, facebook_id, facebook_url, first_name, last_name, verified, name, language, hometown, email, gender, dob, location, timezone, accesstoken, user_id) FROM stdin;
\.


--
-- Name: django_blog_it_facebook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('django_blog_it_facebook_id_seq', 1, false);


--
-- Data for Name: django_blog_it_google; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY django_blog_it_google (id, google_id, google_url, verified_email, family_name, name, picture, gender, dob, given_name, email, user_id) FROM stdin;
\.


--
-- Name: django_blog_it_google_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('django_blog_it_google_id_seq', 1, false);


--
-- Data for Name: django_blog_it_image_file; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY django_blog_it_image_file (id, upload, date_created, is_image, thumbnail) FROM stdin;
\.


--
-- Name: django_blog_it_image_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('django_blog_it_image_file_id_seq', 1, false);


--
-- Data for Name: django_blog_it_menu; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY django_blog_it_menu (id, title, url, status, lvl, parent_id) FROM stdin;
\.


--
-- Name: django_blog_it_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('django_blog_it_menu_id_seq', 1, false);


--
-- Data for Name: django_blog_it_page; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY django_blog_it_page (id, title, content, slug, is_active, meta_description, keywords, meta_title) FROM stdin;
\.


--
-- Name: django_blog_it_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('django_blog_it_page_id_seq', 1, false);


--
-- Data for Name: django_blog_it_post; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY django_blog_it_post (id, title, slug, created_on, updated_on, content, status, keywords, category_id, user_id, featured_image, meta_description, content_en, content_es, slug_en, slug_es, title_en, title_es) FROM stdin;
9	The Benefits of Avocados in your Diet	the-benefits-of-avocados-in-your-diet	2017-10-26 15:37:07.991183+02	2017-10-26	Healthy fats are important in our diet and avocados are the superfruit that can provide that. So-called mono-unsaturated fatty acids are fats that the body burns easily for energy. Avocadoes are packed with nutrients, such as fiber and vitamin E and B, as well as potassium to enhance your metabolism and uscle strength.\r\n\r\nBesides that Avocados can help reduce excess cholesterol and inflammation. They can fight cancer cells and protect your liver. Avocado toast, freshly made guacamole or simply sliced into your salad - get some of the green goodness today!	Published	avocados \r\naguacates \r\nhealthy \r\nsaludable \r\ncomida sana	6	412	uploads/hass-avocado-2685821_1920.jpg	The nutritional benefits of eating avocados, including healthy fats, and why you should incorporate this superfruit into your diet.	Healthy fats are important in our diet and avocados are the superfruit that can provide that. So-called mono-unsaturated fatty acids are fats that the body burns easily for energy. Avocadoes are packed with nutrients, such as fiber and vitamin E and B, as well as potassium to enhance your metabolism and uscle strength.\r\n\r\nBesides that Avocados can help reduce excess cholesterol and inflammation. They can fight cancer cells and protect your liver. Avocado toast, freshly made guacamole or simply sliced into your salad - get some of the green goodness today!	Las grasas saludables son importantes en nuestra dieta y los aguacates son la superfruta que puede proporcionarlo. Los ácidos grasos mono-insaturados son grasas que el cuerpo se quema fácilmente para la energía. Los aguacates se embalan con los alimentos, tales como fibra y vitamina E y B, así como el potasio para realzar su metabolismo y fuerza muscle.\r\n\r\nAdemás de que los aguacates pueden ayudar a reducir el exceso de colesterol e inflamación. Pueden combatir las células cancerosas y proteger su hígado. ¡ tostadas de aguacate, guacamole recién hecho o simplemente rebanadas en su ensalada-obtener algo de la nutritivo verde hoy!	the-benefits-of-avocados-in-your-diet	aguacates_beneficios	The Benefits of Avocados in your Diet	Los beneficios de los aguacates en su dieta
\.


--
-- Name: django_blog_it_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('django_blog_it_post_id_seq', 9, true);


--
-- Data for Name: django_blog_it_post_slugs; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY django_blog_it_post_slugs (id, slug, is_active, blog_id) FROM stdin;
\.


--
-- Name: django_blog_it_post_slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('django_blog_it_post_slugs_id_seq', 1, false);


--
-- Data for Name: django_blog_it_post_tags; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY django_blog_it_post_tags (id, post_id, tags_id) FROM stdin;
9	9	2
\.


--
-- Name: django_blog_it_post_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('django_blog_it_post_tags_id_seq', 9, true);


--
-- Data for Name: django_blog_it_posthistory; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY django_blog_it_posthistory (id, content, created_at, post_id, user_id) FROM stdin;
\.


--
-- Name: django_blog_it_posthistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('django_blog_it_posthistory_id_seq', 1, false);


--
-- Data for Name: django_blog_it_tags; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY django_blog_it_tags (id, name, slug) FROM stdin;
2	Lunchbox	lunchbox
\.


--
-- Name: django_blog_it_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('django_blog_it_tags_id_seq', 3, true);


--
-- Data for Name: django_blog_it_theme; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY django_blog_it_theme (id, name, slug, description, enabled) FROM stdin;
\.


--
-- Name: django_blog_it_theme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('django_blog_it_theme_id_seq', 1, false);


--
-- Data for Name: django_blog_it_userrole; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY django_blog_it_userrole (id, role, user_id) FROM stdin;
\.


--
-- Name: django_blog_it_userrole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('django_blog_it_userrole_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	easy_thumbnails	source
8	easy_thumbnails	thumbnail
9	easy_thumbnails	thumbnaildimensions
10	sites	site
11	account	emailaddress
12	account	emailconfirmation
13	socialaccount	socialapp
14	socialaccount	socialaccount
15	socialaccount	socialtoken
16	ipn	paypalipn
17	sermepa	sermepaidtpv
18	sermepa	sermeparesponse
19	userprofiles	company
20	userprofiles	profile
21	userprofiles	restaurant
22	userprofiles	restaurantimage
23	userprofiles	restaurantreview
24	userprofiles	shift
25	userprofiles	restaurantdiscountcoupon
26	userprofiles	checkoutpromocode
27	userprofiles	city
28	userprofiles	restaurantdelivery
29	userprofiles	restaurantcontract
30	userprofiles	lunchbox
31	userprofiles	lunchboximage
32	userprofiles	lunchboxprivileges
33	userprofiles	lunchboxprivilegesitem
34	userprofiles	lunchboxdiscount
35	userprofiles	lunchboxrating
36	userprofiles	lunchboxfeedback
37	userprofiles	lunchboxrequest
38	userprofiles	lunchboxadminmessage
39	userprofiles	adminnotification
40	userprofiles	ordernotification
41	userprofiles	activation
42	userprofiles	servicerating
43	orders	basket
44	orders	order
45	orders	orderitem
46	payments	payment
47	django_ses	sesstat
48	mainapp	category
49	mainapp	language
50	pages	faqs
51	pages	lunchsteps
52	pages	contactus
53	django_blog_it	google
54	django_blog_it	facebook
55	django_blog_it	tags
56	django_blog_it	post
57	django_blog_it	post_slugs
58	django_blog_it	contactussettings
59	django_blog_it	image_file
60	django_blog_it	theme
61	django_blog_it	page
62	django_blog_it	posthistory
64	django_blog_it	menu
65	django_blog_it	userrole
63	django_blog_it	blogcategory
66	payments	lafiambrera_currency
67	mainapp	homecontent
68	payments	moneytowallet
69	userprofiles	customer
70	social_django	association
71	social_django	nonce
72	social_django	code
73	social_django	usersocialauth
74	social_django	partial
75	cart_handling	tocart
76	cart_handling	authcartuser
77	carthandler	cart
78	mainapp	checkoutcomment
79	payments	walletpayment
80	django_blog_it	category
81	payments	paypalpaymentdetails
82	payments	wallet
83	payments	walletorder
84	mainapp	paywallet
85	userprofiles	testingtable
86	orders	comment
87	pages	groupbenifits
88	mainapp	invitrequest
89	mainapp	inviterequest
90	mainapp	inviterewards
91	mainapp	usernotification
93	login_register	forgetpassword
94	mainapp	shareselection
95	mainapp	selectionreference
96	orders	orderdatemail
97	pages	supportdetails
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('django_content_type_id_seq', 97, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-03-13 12:51:40.771803+01
2	auth	0001_initial	2017-03-13 12:51:40.877184+01
3	account	0001_initial	2017-03-13 12:51:40.924408+01
4	account	0002_email_max_length	2017-03-13 12:51:40.937474+01
5	admin	0001_initial	2017-03-13 12:51:40.980843+01
6	admin	0002_logentry_remove_auto_add	2017-03-13 12:51:40.993388+01
7	contenttypes	0002_remove_content_type_name	2017-03-13 12:51:41.022779+01
8	auth	0002_alter_permission_name_max_length	2017-03-13 12:51:41.034584+01
9	auth	0003_alter_user_email_max_length	2017-03-13 12:51:41.048112+01
10	auth	0004_alter_user_username_opts	2017-03-13 12:51:41.058708+01
11	auth	0005_alter_user_last_login_null	2017-03-13 12:51:41.086404+01
12	auth	0006_require_contenttypes_0002	2017-03-13 12:51:41.088584+01
13	auth	0007_alter_validators_add_error_messages	2017-03-13 12:51:41.099208+01
14	django_ses	0001_initial	2017-03-13 12:51:41.109371+01
15	easy_thumbnails	0001_initial	2017-03-13 12:51:41.15645+01
16	easy_thumbnails	0002_thumbnaildimensions	2017-03-13 12:51:41.184107+01
17	ipn	0001_initial	2017-03-13 12:51:41.222727+01
18	ipn	0002_paypalipn_mp_id	2017-03-13 12:51:41.233061+01
19	ipn	0003_auto_20141117_1647	2017-03-13 12:51:41.242963+01
20	ipn	0004_auto_20150612_1826	2017-03-13 12:51:41.440401+01
21	ipn	0005_auto_20151217_0948	2017-03-13 12:51:41.458265+01
22	ipn	0006_auto_20160108_1112	2017-03-13 12:51:41.500118+01
23	ipn	0007_auto_20160219_1135	2017-03-13 12:51:41.518814+01
24	orders	0001_initial	2017-03-13 12:51:41.581385+01
25	userprofiles	0001_initial	2017-03-13 12:51:42.481434+01
26	orders	0002_auto_20170313_1220	2017-03-13 12:51:42.693701+01
27	sermepa	0001_initial	2017-03-13 12:51:42.714195+01
28	payments	0001_initial	2017-03-13 12:51:42.804159+01
29	sessions	0001_initial	2017-03-13 12:51:42.821993+01
30	sites	0001_initial	2017-03-13 12:51:42.833095+01
31	sites	0002_alter_domain_unique	2017-03-13 12:51:42.845584+01
32	socialaccount	0001_initial	2017-03-13 12:51:43.159492+01
33	socialaccount	0002_token_max_lengths	2017-03-13 12:51:43.407966+01
34	socialaccount	0003_extra_data_default_dict	2017-03-13 12:51:43.469378+01
35	orders	0003_auto_20170404_1352	2017-04-06 18:22:55.255654+02
36	userprofiles	0002_restaurant_opening_hours	2017-04-06 18:22:55.803552+02
37	orders	0004_auto_20170421_1150	2017-04-21 11:50:29.384263+02
38	orders	0005_auto_20170422_0544	2017-04-22 05:44:44.819775+02
39	orders	0006_auto_20170422_0601	2017-04-22 06:01:48.510658+02
40	userprofiles	0003_auto_20170422_0601	2017-04-22 06:01:49.165503+02
41	orders	0007_auto_20170422_0614	2017-04-22 06:15:02.198542+02
42	orders	0008_auto_20170422_0617	2017-04-22 06:17:43.036716+02
43	auth	0008_alter_user_username_max_length	2017-05-18 08:45:56.171683+02
44	orders	0009_auto_20170511_1544	2017-05-18 08:45:56.221604+02
45	orders	0010_auto_20170518_0755	2017-05-18 08:45:56.263394+02
46	orders	0011_auto_20170518_0845	2017-05-18 08:45:56.295035+02
47	mainapp	0001_initial	2017-06-07 14:17:37.322772+02
48	orders	0012_auto_20170607_1417	2017-06-07 14:17:37.457892+02
49	orders	0013_auto_20170607_1418	2017-06-07 14:18:39.283444+02
50	mainapp	0002_language	2017-06-07 14:19:50.061117+02
51	orders	0014_auto_20170607_1419	2017-06-07 14:19:50.108858+02
52	mainapp	0003_auto_20170608_0710	2017-06-08 07:11:45.613795+02
53	orders	0015_auto_20170608_0710	2017-06-08 07:11:45.871585+02
54	orders	0016_auto_20170608_0711	2017-06-08 07:11:45.906755+02
55	mainapp	0004_auto_20170608_0720	2017-06-08 07:20:25.786901+02
56	orders	0017_auto_20170608_0720	2017-06-08 07:20:25.839659+02
57	orders	0018_auto_20170608_0721	2017-06-08 07:21:41.239082+02
58	mainapp	0005_delete_language	2017-06-20 11:35:56.834372+02
59	orders	0019_auto_20170620_1135	2017-06-20 11:35:56.983905+02
60	userprofiles	0004_lunchbox_category	2017-06-20 11:35:57.168082+02
61	mainapp	0006_auto_20170620_1216	2017-06-20 12:17:00.645823+02
62	orders	0020_auto_20170620_1216	2017-06-20 12:17:00.696775+02
63	orders	0021_auto_20170620_1332	2017-06-20 13:32:23.129509+02
64	mainapp	0007_category_slug	2017-06-20 13:37:34.914152+02
65	orders	0022_auto_20170620_1337	2017-06-20 13:37:34.965246+02
66	orders	0023_auto_20170701_1208	2017-07-01 12:09:00.114438+02
67	userprofiles	0005_auto_20170701_1208	2017-07-01 12:09:00.355702+02
68	orders	0024_auto_20170703_0637	2017-07-03 06:37:56.573276+02
69	userprofiles	0006_auto_20170703_0637	2017-07-03 06:37:56.798104+02
70	orders	0025_auto_20170703_0643	2017-07-03 06:44:08.155141+02
71	orders	0026_auto_20170703_0753	2017-07-03 08:14:22.533321+02
72	orders	0027_auto_20170703_0801	2017-07-03 08:14:22.594493+02
73	orders	0028_auto_20170703_0803	2017-07-03 08:14:22.637435+02
74	orders	0029_auto_20170703_0803	2017-07-03 08:14:22.675973+02
75	orders	0030_auto_20170703_0804	2017-07-03 08:14:22.71103+02
76	userprofiles	0007_auto_20170703_0803	2017-07-03 08:14:22.814047+02
77	userprofiles	0008_auto_20170703_0803	2017-07-03 08:14:22.963958+02
78	userprofiles	0009_auto_20170703_0804	2017-07-03 08:14:23.022395+02
79	orders	0031_auto_20170703_0851	2017-07-03 08:59:07.874473+02
80	orders	0032_auto_20170703_0852	2017-07-03 08:59:07.932858+02
81	orders	0033_auto_20170703_0855	2017-07-03 08:59:07.976789+02
82	orders	0034_auto_20170703_0858	2017-07-03 08:59:08.021806+02
83	pages	0001_initial	2017-07-03 08:59:08.463761+02
84	orders	0035_auto_20170703_0904	2017-07-03 09:04:29.976914+02
85	pages	0002_auto_20170703_0904	2017-07-03 09:04:30.054735+02
86	orders	0036_auto_20170703_1030	2017-07-03 12:57:52.658598+02
87	orders	0037_auto_20170703_1257	2017-07-03 12:57:52.702318+02
88	pages	0003_lunchsteps	2017-07-03 12:57:52.953911+02
89	orders	0038_auto_20170703_1313	2017-07-03 13:13:17.555472+02
90	orders	0039_auto_20170703_1325	2017-07-03 13:25:11.287409+02
91	pages	0004_lunchsteps_title	2017-07-03 13:25:11.671396+02
92	orders	0040_auto_20170703_1357	2017-07-03 13:57:35.464864+02
93	pages	0005_auto_20170703_1357	2017-07-03 13:57:35.493907+02
94	orders	0041_auto_20170703_1424	2017-07-03 14:24:48.513772+02
95	pages	0006_contactus	2017-07-03 14:24:48.71658+02
96	orders	0042_auto_20170703_1428	2017-07-03 14:28:33.761895+02
97	pages	0007_auto_20170703_1428	2017-07-03 14:28:34.122898+02
98	django_blog_it	0001_initial	2017-07-04 06:04:56.868471+02
99	django_blog_it	0002_auto_20160223_0521	2017-07-04 06:04:57.26853+02
100	django_blog_it	0003_auto_20160224_0410	2017-07-04 06:04:57.309335+02
101	django_blog_it	0004_posthistory	2017-07-04 06:04:57.535277+02
102	django_blog_it	0005_auto_20160330_0539	2017-07-04 06:04:57.737925+02
103	django_blog_it	0006_page	2017-07-04 06:04:57.943948+02
104	django_blog_it	0007_menu	2017-07-04 06:04:58.110759+02
105	django_blog_it	0008_post_featured_image	2017-07-04 06:04:58.160614+02
106	django_blog_it	0009_contactussettings	2017-07-04 06:04:58.296016+02
107	django_blog_it	0010_theme	2017-07-04 06:04:58.619485+02
108	django_blog_it	0011_auto_20160719_1140	2017-07-04 06:04:59.061771+02
109	django_blog_it	0012_auto_20160722_0657	2017-07-04 06:04:59.422252+02
110	django_blog_it	0013_facebook	2017-07-04 06:04:59.738476+02
111	django_blog_it	0014_post_slugs	2017-07-04 06:05:00.070003+02
112	orders	0043_auto_20170704_0604	2017-07-04 06:05:00.188899+02
113	pages	0008_auto_20170704_0604	2017-07-04 06:05:00.211475+02
114	django_blog_it	0015_auto_20170704_1151	2017-07-04 11:51:46.103784+02
115	orders	0044_auto_20170704_1151	2017-07-04 11:51:46.198949+02
116	django_blog_it	0016_auto_20170705_0701	2017-07-05 07:01:39.933881+02
117	orders	0045_auto_20170705_0701	2017-07-05 07:01:40.217927+02
118	django_blog_it	0017_auto_20170705_0908	2017-07-05 09:08:46.607514+02
119	orders	0046_auto_20170705_0908	2017-07-05 09:08:46.671594+02
120	payments	0002_lafiambrera_currency	2017-07-05 09:08:47.068046+02
121	mainapp	0008_homecontent	2017-07-05 14:26:33.721799+02
122	orders	0047_auto_20170705_1426	2017-07-05 14:26:33.781121+02
123	mainapp	0009_auto_20170705_1436	2017-07-05 14:36:31.664568+02
124	orders	0048_auto_20170705_1436	2017-07-05 14:36:31.724056+02
125	orders	0049_auto_20170706_0903	2017-07-06 09:03:59.705533+02
126	userprofiles	0010_auto_20170706_0903	2017-07-06 09:04:01.024634+02
127	django_blog_it	0018_auto_20170706_1159	2017-07-06 11:59:52.880231+02
128	orders	0050_auto_20170706_1159	2017-07-06 11:59:52.977144+02
129	orders	0051_auto_20170706_1453	2017-07-06 14:54:07.21722+02
130	payments	0003_auto_20170706_1453	2017-07-06 14:54:07.898517+02
131	orders	0052_auto_20170707_1412	2017-07-07 14:12:40.769778+02
132	userprofiles	0011_auto_20170707_1412	2017-07-07 14:12:41.756118+02
133	orders	0053_auto_20170707_1513	2017-07-07 15:13:31.727784+02
134	userprofiles	0012_customer_country	2017-07-07 15:13:31.898827+02
135	orders	0054_auto_20170710_0544	2017-07-10 05:44:24.832467+02
136	orders	0055_auto_20170710_0552	2017-07-10 05:52:49.339813+02
137	userprofiles	0013_customer_user	2017-07-10 05:52:49.773083+02
138	orders	0056_auto_20170710_0620	2017-07-10 06:20:37.920059+02
139	orders	0057_auto_20170710_0623	2017-07-10 06:23:30.158461+02
140	userprofiles	0014_remove_customer_user	2017-07-10 06:23:30.410876+02
141	orders	0058_auto_20170710_0650	2017-07-10 06:50:25.763225+02
142	userprofiles	0015_customer_user	2017-07-10 06:50:26.002906+02
143	orders	0059_auto_20170710_1431	2017-07-11 06:39:40.095723+02
144	orders	0060_auto_20170711_0639	2017-07-11 06:39:40.25986+02
145	orders	0061_auto_20170711_0908	2017-07-11 09:08:29.774282+02
146	default	0001_initial	2017-07-11 09:08:31.032162+02
147	social_auth	0001_initial	2017-07-11 09:08:31.048592+02
148	default	0002_add_related_name	2017-07-11 09:08:31.215713+02
149	social_auth	0002_add_related_name	2017-07-11 09:08:31.224136+02
150	default	0003_alter_email_max_length	2017-07-11 09:08:31.250288+02
151	social_auth	0003_alter_email_max_length	2017-07-11 09:08:31.257502+02
152	default	0004_auto_20160423_0400	2017-07-11 09:08:31.409427+02
153	social_auth	0004_auto_20160423_0400	2017-07-11 09:08:31.41729+02
154	social_auth	0005_auto_20160727_2333	2017-07-11 09:08:31.49899+02
155	social_django	0006_partial	2017-07-11 09:08:31.790668+02
156	social_django	0002_add_related_name	2017-07-11 09:08:31.800068+02
157	social_django	0003_alter_email_max_length	2017-07-11 09:08:31.806993+02
158	social_django	0001_initial	2017-07-11 09:08:31.815788+02
159	social_django	0004_auto_20160423_0400	2017-07-11 09:08:31.823776+02
160	social_django	0005_auto_20160727_2333	2017-07-11 09:08:31.832128+02
161	cart_handling	0001_initial	2017-07-14 07:26:43.022394+02
162	orders	0062_auto_20170714_0726	2017-07-14 07:26:43.188941+02
163	cart_handling	0002_tocart_date	2017-07-14 07:46:40.344198+02
164	orders	0063_auto_20170714_0746	2017-07-14 07:46:40.409748+02
165	orders	0064_auto_20170714_0915	2017-07-14 09:19:02.942172+02
166	orders	0065_auto_20170714_0917	2017-07-14 09:19:03.003867+02
167	orders	0066_auto_20170714_0918	2017-07-14 09:19:03.046126+02
168	orders	0067_auto_20170714_0919	2017-07-14 09:19:51.044035+02
169	orders	0068_auto_20170714_0919	2017-07-14 09:19:51.096431+02
170	orders	0069_auto_20170714_0921	2017-07-14 09:30:39.437243+02
171	orders	0070_auto_20170714_0924	2017-07-14 09:30:39.489414+02
172	orders	0071_auto_20170714_0930	2017-07-14 09:30:39.537959+02
173	orders	0072_auto_20170714_0931	2017-07-14 09:38:15.321632+02
174	orders	0073_auto_20170714_0937	2017-07-14 09:38:15.370195+02
175	orders	0074_auto_20170714_0938	2017-07-14 09:38:15.411258+02
176	cart_handling	0002_auto_20170714_1534	2017-07-14 15:34:18.118642+02
177	orders	0075_auto_20170714_1534	2017-07-14 15:34:18.207672+02
178	orders	0076_auto_20170714_1543	2017-07-14 15:43:32.551934+02
179	orders	0077_auto_20170714_1546	2017-07-14 15:46:57.436002+02
180	carthandler	0001_initial	2017-07-17 05:56:07.032889+02
181	orders	0078_auto_20170714_1632	2017-07-17 05:56:07.145421+02
182	orders	0079_auto_20170714_1639	2017-07-17 05:56:07.209715+02
183	orders	0080_auto_20170717_0555	2017-07-17 05:56:07.333012+02
184	carthandler	0002_remove_cart_lunhbox	2017-07-17 08:01:33.7923+02
185	orders	0081_auto_20170717_0801	2017-07-17 08:01:33.87232+02
186	carthandler	0003_auto_20170717_1007	2017-07-17 10:08:04.042037+02
187	carthandler	0004_auto_20170717_1007	2017-07-17 10:08:04.257762+02
188	orders	0082_auto_20170717_1007	2017-07-17 10:08:04.319129+02
189	orders	0083_auto_20170717_1007	2017-07-17 10:08:04.408138+02
190	orders	0084_auto_20170720_0808	2017-07-20 08:09:19.881105+02
191	payments	0004_auto_20170720_0808	2017-07-20 08:09:20.944847+02
192	mainapp	0010_checkoutcomment	2017-07-20 09:17:43.345748+02
193	orders	0085_auto_20170720_0917	2017-07-20 09:17:43.417285+02
194	orders	0086_auto_20170720_1127	2017-07-20 11:27:49.060372+02
195	payments	0005_auto_20170720_1127	2017-07-20 11:27:49.99247+02
196	orders	0087_auto_20170721_1309	2017-07-21 13:14:45.082185+02
197	orders	0088_auto_20170721_1333	2017-07-21 13:34:01.374561+02
198	orders	0089_auto_20170721_1334	2017-07-21 13:34:17.951455+02
199	orders	0090_auto_20170722_1535	2017-07-22 15:35:19.817434+02
200	payments	0006_paypalpaymentdetails	2017-07-22 15:35:20.272749+02
201	orders	0091_auto_20170724_0757	2017-07-24 07:57:59.188362+02
202	payments	0007_auto_20170724_0757	2017-07-24 07:57:59.506326+02
203	orders	0092_auto_20170724_0854	2017-07-24 08:54:39.225088+02
204	payments	0008_wallet	2017-07-24 08:54:39.496034+02
205	orders	0093_auto_20170725_0636	2017-07-25 06:36:51.756201+02
206	payments	0009_walletorder	2017-07-25 06:36:52.115593+02
207	mainapp	0011_paywallet	2017-07-25 07:52:01.550595+02
208	orders	0094_auto_20170725_0751	2017-07-25 07:52:01.642257+02
209	payments	0010_auto_20170725_0751	2017-07-25 07:52:02.075137+02
210	mainapp	0012_delete_paywallet	2017-07-25 10:52:23.63795+02
211	orders	0095_auto_20170725_1052	2017-07-25 10:52:23.75747+02
212	carthandler	0005_auto_20170729_0803	2017-07-29 08:03:51.549487+02
213	django_blog_it	0019_auto_20170729_0803	2017-07-29 08:03:52.225622+02
214	orders	0096_auto_20170729_0803	2017-07-29 08:03:52.407321+02
242	mainapp	0014_invitrequest	2017-08-11 13:12:30.669768+02
215	userprofiles	0016_auto_20170729_0803	2017-07-29 08:03:52.711483+02
216	orders	0097_auto_20170802_0611	2017-08-02 06:12:02.61887+02
217	userprofiles	0017_testingtable	2017-08-02 06:12:02.780088+02
218	orders	0098_auto_20170802_0622	2017-08-02 06:22:11.545257+02
219	userprofiles	0018_delete_testingtable	2017-08-02 06:22:11.64603+02
220	orders	0099_auto_20170802_0904	2017-08-02 09:04:25.876398+02
221	orders	0100_auto_20170802_0909	2017-08-02 09:09:45.569961+02
222	userprofiles	0019_lunchbox_vat	2017-08-02 09:09:45.663196+02
223	orders	0101_auto_20170802_0917	2017-08-02 09:18:04.946388+02
224	userprofiles	0020_auto_20170802_0917	2017-08-02 09:18:05.015525+02
225	mainapp	0013_auto_20170808_1334	2017-08-08 13:35:02.479742+02
226	orders	0102_auto_20170808_1334	2017-08-08 13:35:02.927473+02
227	orders	0103_auto_20170809_1212	2017-08-09 12:12:53.836336+02
228	orders	0104_auto_20170809_1447	2017-08-09 14:47:31.647583+02
229	pages	0009_groupbenifits	2017-08-09 14:47:31.801594+02
230	django_blog_it	0020_auto_20170809_1457	2017-08-09 14:57:24.299875+02
231	orders	0105_auto_20170809_1457	2017-08-09 14:57:24.430689+02
232	pages	0010_auto_20170809_1457	2017-08-09 14:57:24.549371+02
233	orders	0106_auto_20170810_0710	2017-08-10 07:10:34.445283+02
234	orders	0107_auto_20170810_0837	2017-08-10 08:37:41.080783+02
235	orders	0108_auto_20170810_0920	2017-08-10 09:20:54.97304+02
236	orders	0109_auto_20170810_0922	2017-08-10 09:24:08.447177+02
237	orders	0110_auto_20170810_0924	2017-08-10 09:24:08.537087+02
238	orders	0111_auto_20170810_1007	2017-08-10 10:07:15.849757+02
239	orders	0112_auto_20170811_0556	2017-08-11 11:01:33.823988+02
240	orders	0113_auto_20170811_0600	2017-08-11 11:01:33.941548+02
241	pages	0011_auto_20170811_0556	2017-08-11 11:01:34.528315+02
243	orders	0114_auto_20170811_1312	2017-08-11 13:12:30.816981+02
244	orders	0115_auto_20170811_1316	2017-08-11 13:17:00.960685+02
245	mainapp	0015_auto_20170812_0548	2017-08-12 05:49:02.291864+02
246	orders	0116_auto_20170812_0548	2017-08-12 05:49:02.432321+02
247	mainapp	0016_auto_20170812_0657	2017-08-12 06:57:47.108415+02
248	orders	0117_auto_20170812_0657	2017-08-12 06:57:47.260434+02
249	orders	0118_auto_20170812_0658	2017-08-12 06:58:10.256468+02
250	mainapp	0017_auto_20170812_1517	2017-08-12 15:17:27.841056+02
251	orders	0119_auto_20170812_1517	2017-08-12 15:17:28.039595+02
252	mainapp	0018_usernotification	2017-08-14 11:49:17.63226+02
253	orders	0120_auto_20170814_1149	2017-08-14 11:49:17.804306+02
254	mainapp	0019_usernotification_head	2017-08-14 12:01:36.320272+02
255	orders	0121_auto_20170814_1201	2017-08-14 12:01:36.45584+02
256	orders	0122_auto_20170814_1201	2017-08-14 12:01:36.593506+02
257	mainapp	0020_auto_20170814_1208	2017-08-14 12:08:16.901961+02
258	orders	0123_auto_20170814_1208	2017-08-14 12:08:17.033294+02
260	login_register	0001_initial	2017-08-18 12:56:29.31426+02
261	orders	0124_auto_20170818_1256	2017-08-18 12:56:29.546718+02
262	mainapp	0021_shareselection	2017-08-18 15:38:05.933831+02
263	orders	0125_auto_20170818_1907	2017-08-18 15:38:06.165846+02
264	mainapp	0022_selectionreference	2017-08-18 15:47:07.255938+02
265	orders	0126_auto_20170818_1917	2017-08-18 15:47:07.413428+02
266	mainapp	0023_selectionreference_lunchbox_id	2017-08-18 15:53:36.629785+02
267	orders	0127_auto_20170818_1923	2017-08-18 15:53:36.691569+02
268	mainapp	0024_auto_20170819_0953	2017-08-19 06:24:01.922045+02
269	orders	0128_auto_20170819_0953	2017-08-19 06:24:02.06046+02
270	mainapp	0025_auto_20170819_1019	2017-08-19 06:49:07.368416+02
271	orders	0129_auto_20170819_1019	2017-08-19 06:49:07.480875+02
272	orders	0130_auto_20170819_1939	2017-08-19 16:10:28.700626+02
273	orders	0131_auto_20170819_1940	2017-08-19 16:10:28.8038+02
274	orders	0132_auto_20170821_1240	2017-08-21 09:10:26.018449+02
275	orders	0133_auto_20170821_1248	2017-08-21 09:18:42.102492+02
276	django_blog_it	0015_auto_20170822_1200	2017-08-22 12:00:03.977275+02
277	django_blog_it	0019_merge_20170822_1429	2017-08-22 12:00:04.006318+02
278	django_blog_it	0020_auto_20170822_1526	2017-08-22 12:00:04.016874+02
279	mainapp	0026_auto_20170822_1200	2017-08-22 12:00:04.025297+02
280	mainapp	0027_auto_20170822_1526	2017-08-22 12:00:04.038973+02
281	orders	0134_auto_20170822_1200	2017-08-22 12:00:04.04892+02
282	orders	0135_auto_20170822_1208	2017-08-22 12:00:04.055919+02
283	orders	0136_auto_20170822_1214	2017-08-22 12:00:04.063353+02
284	orders	0137_auto_20170822_1526	2017-08-22 12:00:04.070946+02
285	orders	0138_auto_20170822_1528	2017-08-22 12:00:04.077457+02
286	orders	0139_auto_20170822_1531	2017-08-22 12:01:33.109545+02
287	django_blog_it	0021_auto_20170822_1547	2017-08-22 12:17:52.91946+02
288	orders	0140_auto_20170822_1547	2017-08-22 12:17:52.926934+02
289	orders	0141_auto_20170823_1545	2017-08-23 12:15:46.801594+02
290	userprofiles	0021_profile_accounts_status	2017-08-23 12:15:46.904657+02
291	orders	0142_auto_20170824_1840	2017-08-24 15:10:59.264198+02
292	payments	0011_auto_20170824_1840	2017-08-24 15:10:59.427155+02
293	orders	0143_auto_20170828_1433	2017-08-28 11:03:27.575517+02
294	orders	0144_auto_20170830_1434	2017-08-30 11:04:59.673188+02
295	orders	0145_auto_20170831_1009	2017-08-31 06:40:10.709567+02
296	userprofiles	0022_auto_20170831_1009	2017-08-31 06:40:10.930433+02
297	django_blog_it	0019_auto_20170901_0927	2017-09-01 05:58:18.014068+02
298	orders	0146_auto_20170901_0927	2017-09-01 05:58:18.164683+02
299	orders	0147_auto_20170905_1113	2017-09-05 07:43:21.231472+02
300	userprofiles	0023_auto_20170905_1113	2017-09-05 07:43:21.456688+02
301	orders	0148_auto_20170905_1117	2017-09-05 07:47:36.247782+02
302	userprofiles	0024_auto_20170905_1117	2017-09-05 07:47:36.605621+02
303	orders	0149_auto_20170906_1003	2017-09-06 06:34:32.510611+02
304	orders	0150_auto_20170906_1005	2017-09-06 06:35:16.147706+02
305	userprofiles	0025_auto_20170906_1005	2017-09-06 06:35:16.26242+02
306	orders	0151_auto_20170906_1533	2017-09-06 12:03:33.422427+02
307	orders	0152_auto_20170906_1534	2017-09-06 12:04:27.575764+02
308	userprofiles	0026_auto_20170906_1534	2017-09-06 12:04:27.77594+02
309	orders	0153_auto_20170908_1428	2017-09-08 10:58:11.265871+02
310	pages	0012_supportdetails	2017-09-08 10:58:11.285716+02
311	orders	0154_auto_20170909_1831	2017-09-09 15:01:39.36445+02
312	pages	0013_groupbenifits_content	2017-09-09 15:01:39.410993+02
313	orders	0155_auto_20170909_1832	2017-09-09 15:02:39.72998+02
314	pages	0014_auto_20170909_1832	2017-09-09 15:02:39.876944+02
315	orders	0156_auto_20170909_1924	2017-09-09 15:54:20.878272+02
316	pages	0015_auto_20170909_1924	2017-09-09 15:54:20.907784+02
317	orders	0157_auto_20170909_1924	2017-09-09 15:54:49.179288+02
318	pages	0016_remove_groupbenifits_content	2017-09-09 15:54:49.195551+02
319	mainapp	0028_homecontent_content	2017-09-19 07:27:33.530919+02
320	mainapp	0029_auto_20170919_0720	2017-09-19 07:27:33.534946+02
321	mainapp	0030_auto_20170919_0721	2017-09-19 07:27:33.538047+02
322	orders	0158_auto_20170919_0718	2017-09-19 07:27:33.541554+02
323	orders	0159_auto_20170919_0720	2017-09-19 07:27:33.543844+02
324	orders	0160_auto_20170919_0720	2017-09-19 07:27:33.546103+02
325	orders	0161_auto_20170919_0721	2017-09-19 07:27:33.54827+02
326	userprofiles	0027_auto_20170919_0718	2017-09-19 07:27:33.55058+02
327	mainapp	0031_remove_homecontent_msg	2017-09-19 07:29:02.198699+02
328	orders	0162_auto_20170919_0728	2017-09-19 07:29:02.201906+02
329	mainapp	0032_homecontent_msg	2017-09-19 12:32:38.855075+02
330	orders	0163_auto_20170919_1232	2017-09-19 12:32:38.92627+02
331	mainapp	0033_auto_20170919_1233	2017-09-19 12:33:19.490821+02
332	orders	0164_auto_20170919_1233	2017-09-19 12:33:19.689986+02
333	orders	0165_auto_20170920_1528	2017-09-20 15:29:01.138056+02
334	userprofiles	0028_auto_20170920_1528	2017-09-20 15:29:01.376696+02
335	orders	0166_auto_20170921_1543	2017-09-21 15:43:32.042658+02
336	userprofiles	0029_auto_20170921_1543	2017-09-21 15:43:32.562594+02
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('django_migrations_id_seq', 336, true);


--
-- Data for Name: django_ses_sesstat; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY django_ses_sesstat (id, date, delivery_attempts, bounces, complaints, rejects) FROM stdin;
\.


--
-- Name: django_ses_sesstat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('django_ses_sesstat_id_seq', 1, false);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
q7uhjclhhjc35tftvndzg2kcufqp3tap	Y2I0M2JiODg2ZTBhMjY5NGJmMjI1MGVhZDI4YmZjNzU1NmQ0ODJiMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2017-04-11 16:15:36.882566+02
rild9fe088ay5uwifire9c51xndwrxmc	NGUwZTJkNjg0MTQ0NDc2MmI4Mjc1YWZiY2UxMThiMTU1NzIxY2NjZjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiR2VYSTN5QXhwZTc5Il19	2017-04-13 17:50:13.951094+02
d6u5bdgrzbsrdu1wyd6r2so4i4nx1j96	NmFjNzNkMzY4ZjFjODQwNjM1YTc5YWZmNDk4ZGY4ZGVjZjgxZjIzNjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDNmYTVjOWVkNDE2ZjA1NDM5YWQ1YTQwZjc1ODQzOGI5NTlhNGJmMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2017-04-03 11:14:53.729098+02
g2m447c6u33m64lbt6eg4eiipnjk534y	NWJiOGQ3MmRmMTRlZjQwZWE5YjhhM2NkNzJiY2UxNmNjMDRlYzYxMDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiVlJpRWRxVjEzUWFJIl19	2017-04-20 20:08:59.87149+02
0oa8s219ir5apw6u1yeq9pdnt0iky9pj	YjRjZmYxYzI1YWRiODA2M2RmMTFiNzUwM2FlNjVkOTViMDk1OGNmYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9oYXNoIjoiOTYzNWE0YjM5NDA3OTc5ZTk0MGI0OTZhYzZhMjQwZDdiODY5NTdhNSIsIl9sYW5ndWFnZSI6ImVzIn0=	2017-03-27 20:05:53.717526+02
vx1pgz507duf3sk5es4dqphnqksp6gzu	YTVmYjgzMDg1MzA5M2M1NmFiODk4MTZjNjBiMjViZTc1MjAxOTAxYzp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2xhbmd1YWdlIjoiZW4iLCJfYXV0aF91c2VyX2hhc2giOiI5NjM1YTRiMzk0MDc5NzllOTQwYjQ5NmFjNmEyNDBkN2I4Njk1N2E1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-04-20 22:50:22.141407+02
dh2o0cq6p25v72rsvz98hgr9bslg6bk0	MWRkOWY2NWI4YzAxN2Y4YWM0OTQwYmNhZDQyYWUxMDMyNmViNTc3Zjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDNmYTVjOWVkNDE2ZjA1NDM5YWQ1YTQwZjc1ODQzOGI5NTlhNGJmMyJ9	2017-03-28 10:42:04.949323+02
090g0d8n2dqavxgq5eqwpdz0sbzif7ro	YzFmYzY3ZWU3MDBmMGY2YzMyOWM4ZmYwOTdlY2MwYWFlMWFiN2FiMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ3MzcyN2NiYzdhN2YyNTYyNTE1YTU1MGNhZjMzZTE4Yzk4NzNhZWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlcyIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-03-28 11:35:14.867631+02
b02pkztrfhv486ip768inivry2huib9w	ZmI3ZDI5NTQ5ZmNlMGQzMTZhYzdlZDMyNjVjZmQ2ODUxNWQ3YTk4ZTp7Il9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2hhc2giOiJkM2ZhNWM5ZWQ0MTZmMDU0MzlhZDVhNDBmNzU4NDM4Yjk1OWE0YmYzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-04-11 10:12:58.700268+02
aa0ulgbxthqq1pfxlfnsa2bqc3a3nftr	MWRkOWY2NWI4YzAxN2Y4YWM0OTQwYmNhZDQyYWUxMDMyNmViNTc3Zjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDNmYTVjOWVkNDE2ZjA1NDM5YWQ1YTQwZjc1ODQzOGI5NTlhNGJmMyJ9	2017-04-03 20:53:08.917875+02
a75nzo4hkpivawlttjja2m1cj79g4zwt	OTViNzk3ZmZhZDYzODlhMDFmZDIxYmM5ZTdkZjY0MWI1YWVlZTg2Nzp7Il9hdXRoX3VzZXJfaGFzaCI6IjIyZjE0OGY2MmZkZjIxNDI3NzlkZTQ5OWUyODc5MDk4MDRkNTNjNDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiIsIl9hdXRoX3VzZXJfaWQiOiIxMiJ9	2017-04-04 18:58:11.793288+02
drzpyjmd9sdth0bi7e1tnfo1s9jsq4gy	YjRjZmYxYzI1YWRiODA2M2RmMTFiNzUwM2FlNjVkOTViMDk1OGNmYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9oYXNoIjoiOTYzNWE0YjM5NDA3OTc5ZTk0MGI0OTZhYzZhMjQwZDdiODY5NTdhNSIsIl9sYW5ndWFnZSI6ImVzIn0=	2017-04-03 15:45:20.072108+02
i5kghs7qmwphcfxlt1sog1t3fmv9hi5b	NzYxN2RiNGMyODU5NDA1MzZjNTcyMDZlNDY0MzI4YzhhZTFmZmJlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzZmE1YzllZDQxNmYwNTQzOWFkNWE0MGY3NTg0MzhiOTU5YTRiZjMiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2017-04-04 19:05:01.213402+02
u4bdbrpx7fh2y80ul4ybvx8o3d03sdq2	YjRjZmYxYzI1YWRiODA2M2RmMTFiNzUwM2FlNjVkOTViMDk1OGNmYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9oYXNoIjoiOTYzNWE0YjM5NDA3OTc5ZTk0MGI0OTZhYzZhMjQwZDdiODY5NTdhNSIsIl9sYW5ndWFnZSI6ImVzIn0=	2017-04-03 15:45:57.155988+02
ymr17n13qdf2qaymqt7n95ykge3g6v4y	NjVhOWJmNzNiNTUyZDlmNTI0YmEzYWU1MTEyNTFiZGZiOGFhM2ZlNzp7Il9sYW5ndWFnZSI6ImVzIn0=	2017-04-03 23:24:47.629218+02
vgc2robk3czh103gmyot6embj3nl6kfs	YzFmYzY3ZWU3MDBmMGY2YzMyOWM4ZmYwOTdlY2MwYWFlMWFiN2FiMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ3MzcyN2NiYzdhN2YyNTYyNTE1YTU1MGNhZjMzZTE4Yzk4NzNhZWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlcyIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-03-29 17:14:01.056668+02
5h9aj6ag401hbhtnocawg1pr2jc1r3ge	ZGIwZmMzYjQzY2YwMzVmOWUzOTIwOTY5YjI1MzIyYjkxNzQ0MmYyNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzZmE1YzllZDQxNmYwNTQzOWFkNWE0MGY3NTg0MzhiOTU5YTRiZjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2017-03-27 14:52:07.398413+02
96bpy90m7rcrkjiiub76c3z13zgz9xlu	Y2I0M2JiODg2ZTBhMjY5NGJmMjI1MGVhZDI4YmZjNzU1NmQ0ODJiMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2017-04-07 15:29:17.860369+02
65wjnjwx4fnd7opmp6wmo2bmjoqr3pr8	Y2I0M2JiODg2ZTBhMjY5NGJmMjI1MGVhZDI4YmZjNzU1NmQ0ODJiMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2017-04-04 23:00:00.485173+02
um9j6bjqcr0hwp62n4d9wfn5pefamqjs	ZGY5YWMyM2E4NGQyOGJkMGE3ZjYyZTUxODc1YWQwNjI2NmEwMzI5ZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzZmE1YzllZDQxNmYwNTQzOWFkNWE0MGY3NTg0MzhiOTU5YTRiZjMiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-03-30 14:10:15.865019+02
7zq96i5o4o7kyzsxzhddltil2gft6a21	YTgwOTEyNjI0OTkyNmMxMGM4YTI3YTQ4MDZhMDcyNjJlN2IxMTcwZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ3MzcyN2NiYzdhN2YyNTYyNTE1YTU1MGNhZjMzZTE4Yzk4NzNhZWIiLCJfbGFuZ3VhZ2UiOiJlcyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-04-03 18:52:32.465317+02
26oxxd9fffaiaymzxvp99gog0kiwh7ib	MWRkOWY2NWI4YzAxN2Y4YWM0OTQwYmNhZDQyYWUxMDMyNmViNTc3Zjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDNmYTVjOWVkNDE2ZjA1NDM5YWQ1YTQwZjc1ODQzOGI5NTlhNGJmMyJ9	2017-04-04 11:26:59.830861+02
2d2lbrp6glspw0jlbvu9k2o0zrz78mhz	NzYxN2RiNGMyODU5NDA1MzZjNTcyMDZlNDY0MzI4YzhhZTFmZmJlMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzZmE1YzllZDQxNmYwNTQzOWFkNWE0MGY3NTg0MzhiOTU5YTRiZjMiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2017-03-30 17:09:17.682251+02
pr7umluss0hwi8bx6ox3dqn57d1ybqc4	MmM4MjNjYWViYzBkNTVmN2I5NjE0NjBmZmVjZTM1YjkwM2Y1MTA5Yzp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2xhbmd1YWdlIjoiZXMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5NjM1YTRiMzk0MDc5NzllOTQwYjQ5NmFjNmEyNDBkN2I4Njk1N2E1In0=	2017-04-03 20:37:58.734351+02
ium59d2teqxtxh29l4xxcmr5au024704	ODgyODM5NmM2NDQ3YjU2N2E0ZDhjOTg2NzJkYTEyODkyNmYzOGY0ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDNmYTVjOWVkNDE2ZjA1NDM5YWQ1YTQwZjc1ODQzOGI5NTlhNGJmMyJ9	2017-04-05 11:41:17.966341+02
d1ykvqiqbaarfrsr7mf17opadhf2p6x7	MTNkYWZmYjVlMzU3MTg0NzQ3ZjJkNjYwNjYyZTJiOGUxNjZhMDEzMzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InNjb3BlIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwiYXV0aF9wYXJhbXMiOiIifSwieGlhQ24zNG5rNkNnIl19	2017-04-12 03:25:23.844232+02
8g4z235lsw6xi4mrh8y0357m1ywwi38t	MDdjOGI1NGE4NzJlMTE0Y2UwYjU5YzZjMjkyNzMxY2VmYjU1M2U1ZDp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI0NSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjQwZDk0MzY4MjZkZGJkZWM0MDA3MDg1ZjA5NWYwYWY5Mzc5MGJhZDEifQ==	2017-04-12 09:48:32.077371+02
k3j5cp5uo733uj6ydbkyk35rp4uymdto	ZTE1Y2I2Mzg5YTllNTRhNDUxMGI1YTQwNzc3YmQwYjUwMDFiNjgxZjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk2MzVhNGIzOTQwNzk3OWU5NDBiNDk2YWM2YTI0MGQ3Yjg2OTU3YTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNCIsIl9sYW5ndWFnZSI6ImVuIn0=	2017-04-12 10:02:26.669479+02
ptz8dzwz1046lijx1cog85cxvfjp93hd	Nzk3Yzk2OTgzOGY2MzBmZTg2OWNjYmNiYTVjODgyN2U1ZmRiZTIxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfaGFzaCI6IjcwZWViNmFlMDdiNGZlYWI0NWVkMTg1OTdlYTAzOGYwY2IyOWEzNGYifQ==	2017-04-13 18:33:40.072366+02
n31016ua94m3dxwv6119ypv20aqipjmd	YzkyODU5YzFjNzNmNThjYjczMDg0MjY0Zjk2ZGEwYjQ3ZjBkY2E1OTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMCIsIl9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTg2NDM5MDA5YTlmZWM0ODAzNGNmZWZlY2QzYjAyYWNjZTJkMzg4YiJ9	2017-04-10 12:39:45.952781+02
z0ynepi11a6uiovmhlas63lxemtucy5t	ODgwZmUwNzg2MGU0NTgxMGVjYTc2MzQ1NjdjNjNjOGFmZTY1OWYzZjp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjZiZDk2MzQ1MWE1ZjUzYWU3NWZlYjQ1MTFjMDg3ZGQ4YzJmMzVlNzQifQ==	2017-04-11 20:20:22.583376+02
pzuc8efbeo4hmynvopprjl63nircqvyl	ZDdjNzBlYzExYmJmOGMzZDVmNThjMjBjNTNlYmE4YjgzNjk3MTdjYTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InNjb3BlIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwiYXV0aF9wYXJhbXMiOiIifSwiZkZPdTB0bG9ycnlKIl19	2017-04-11 12:05:03.125077+02
j5ir90inxcgfi6b2wixii0fcyp4e4v5w	NDQxN2ExMzBhOWM3ZWQxYTY0NzFiZjY3YzdiZmM3M2JhMjMwMTVkYTp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI0NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjY3N2VmM2UzNzBmMTBlNmE0NGY1NTc3NjM4NThiMjBiNjZhMGM4ZjUifQ==	2017-04-12 00:31:00.502407+02
0f4cv5qmsieodrl8l4w67vvrmy26yiz4	MTBjN2I2ZmYyOGZmMjNiNDEwMzJhZTRkMDI1ZTFhYWJkZGZmY2I1OTp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiIzMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjRlMjExZThjOGY2NWUzMzdlZDExOGY2MjQ5YzI4NTg4NTBiZDgwM2QifQ==	2017-04-11 12:22:35.079911+02
x0jjp7bbzmc5mc48ko6y54wgkz6hlbmu	ZWRjMDU1NjE5MzJjMWZhMTc3MTEzZGViZGUxZGE1MzVlNGE0MmE1Yjp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiIzMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImRlOWRlZmFkMzZiYjVmOGVmOWNjMGVjYjk1ZGI0YjQ1ZDM0OTdlZjYifQ==	2017-04-11 12:23:18.253147+02
dwul7epcae824jujzerhre8u3z9n9eah	Y2I0M2JiODg2ZTBhMjY5NGJmMjI1MGVhZDI4YmZjNzU1NmQ0ODJiMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2017-04-10 18:38:59.203172+02
hes13y6j4en39j1l0bkhd45own1vn7vn	Nzc5MzFiNWFjYTg1MTllZTRjMWQ4ZjI2MzljZDAzNjY3NWRhMTRmZDp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiIzMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjdmMDcwNjA0ZGY4ZGJmMzg0ZDcwMGU2YTQ3YTAyOTBkZjFiN2JkMDkifQ==	2017-04-11 12:24:49.480378+02
b0m346fflqkkvunzfuktxf404ssmqtsr	ZDA0Nzc4M2U0NmQ4NDA3YWE0OTZkZDhiOGNjZThkMTM1Mzk1NTIyMDp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjY1ODk3NjM0NzdhZThmZjI3NWUwZmQ4MmJjNjA1ODRmNDJkODFlOTIiLCJzb2NpYWxhY2NvdW50X3NvY2lhbGxvZ2luIjp7ImVtYWlsX2FkZHJlc3NlcyI6W3siZW1haWwiOiJwYXUuZ2ltb0BnbWFpbC5jb20iLCJpZCI6bnVsbCwidmVyaWZpZWQiOmZhbHNlLCJwcmltYXJ5Ijp0cnVlLCJ1c2VyX2lkIjpudWxsfV0sInVzZXIiOnsiZmlyc3RfbmFtZSI6IlBhdSIsImlzX2FjdGl2ZSI6dHJ1ZSwiaWQiOm51bGwsInVzZXJuYW1lIjoiIiwiaXNfc3RhZmYiOmZhbHNlLCJsYXN0X2xvZ2luIjpudWxsLCJsYXN0X25hbWUiOiJLZUxmIiwiZGF0ZV9qb2luZWQiOiIyMDE3LTAzLTI3VDE3OjU4OjMwLjQzMloiLCJlbWFpbCI6InBhdS5naW1vQGdtYWlsLmNvbSIsInBhc3N3b3JkIjoiITZZekIweVhmcmNIQjVFNHpUVzEyWDBHdlVBdXQwbFZqSjZUaGpwMHEiLCJpc19zdXBlcnVzZXIiOmZhbHNlfSwidG9rZW4iOnsiZXhwaXJlc19hdCI6bnVsbCwiaWQiOm51bGwsImFjY291bnRfaWQiOm51bGwsInRva2VuX3NlY3JldCI6IiIsInRva2VuIjoiRUFBYTVZZWhUVVBJQkFJSzk3SzlUSTlFTjBIVkgzN283djNaQkpYRzJxYmg1bWZvaUtBVEF2eVdHYkxKTGthZmU2M2Q4bnB3YVFhZFpCeFlLOEM3Q1BtWTREQzNnT2VHZnlVV0drd1lXdGJaQXozdlNMY3lsODJ3RkJnajBHZGhwUVkzRTNyb0FNRG1mWG9WcEM0akJXSjVPVDFwdkpZRUZiUmZ0S2FLMWZESTcyRXlqajQxUUFTbHlOMkJYZjRZQlFaQlBOdzhSbmdaRFpEIiwiYXBwX2lkIjoyfSwic3RhdGUiOnsic2NvcGUiOiIiLCJwcm9jZXNzIjoibG9naW4iLCJhdXRoX3BhcmFtcyI6IiJ9LCJhY2NvdW50Ijp7ImRhdGVfam9pbmVkIjpudWxsLCJpZCI6bnVsbCwiZXh0cmFfZGF0YSI6eyJnZW5kZXIiOiJtYWxlIiwibG9jYWxlIjoiZXNfRVMiLCJpZCI6IjEwMjEzMjM3ODk3ODQ4NDU3IiwidmVyaWZpZWQiOnRydWUsImxhc3RfbmFtZSI6IktlTGYiLCJ1cGRhdGVkX3RpbWUiOiIyMDE2LTA2LTA1VDIxOjI0OjE1KzAwMDAiLCJlbWFpbCI6InBhdS5naW1vQGdtYWlsLmNvbSIsInRpbWV6b25lIjoxLCJsaW5rIjoiaHR0cHM6Ly93d3cuZmFjZWJvb2suY29tL2FwcF9zY29wZWRfdXNlcl9pZC8xMDIxMzIzNzg5Nzg0ODQ1Ny8iLCJuYW1lIjoiUGF1IEtlTGYiLCJmaXJzdF9uYW1lIjoiUGF1In0sImxhc3RfbG9naW4iOm51bGwsInVzZXJfaWQiOm51bGwsInVpZCI6IjEwMjEzMjM3ODk3ODQ4NDU3IiwicHJvdmlkZXIiOiJmYWNlYm9vayJ9fSwiX2F1dGhfdXNlcl9pZCI6IjI3IiwiX2xhbmd1YWdlIjoiZXMifQ==	2017-04-11 11:14:49.155168+02
k4x9oyqgt31j1yxtszwrt89fznqzy634	YjdkZDM3N2MzOWVlNTVjNTMyNjI0MWMxOTRhMGRiYTlmMDI1YzQ5ZDp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiIzMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImYzN2MyZjExYWRmYWVlMWVjNjFhY2JmZDYzN2Y2ODVhNjBlNjM1Y2UifQ==	2017-04-11 12:31:10.310552+02
gr2sb9to7p05u74d7sa2sg0rwvl89lef	Y2I0M2JiODg2ZTBhMjY5NGJmMjI1MGVhZDI4YmZjNzU1NmQ0ODJiMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2017-04-11 13:27:15.807181+02
70rygo1gv7o3nvfja7olibjzqtfg5ove	YmJmYzlhNTZkNjgzOWQ2ZTE0ZDgyY2FlODI5YjBkZmYyMjAyNzk0OTp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiIzNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjQxYWJiMDI0NGRlZjhkNzlhNDc4ZTAxNWQ3OTVmOWY0Yzk3Y2I1Y2EifQ==	2017-04-11 13:47:36.143435+02
rbic80zlbujnh2btc217wgbkw7i7jme0	MzEyMzU1NTk5NmU0NWEyMzgzYzU5OTBiYjIyODBkYjg0Yjk0MTRlYTp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiIzNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA4MDEwMWMxNzA1YWQ2YjQ1N2MwZDU3MjUwMmExZjE2NDRiMDVlYWUifQ==	2017-04-11 14:36:20.838784+02
owkxv04xgbsxq2ozunt0dkb98g40660i	MWI5NzdjZTQ5NDYzYjZkMGFiY2ZiMGVlNzMwNGFhMTE1ODhhOTk0Mzp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiIzNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjQ5MDkxMmEzY2Y2NDc2ZjhkNWZmMzI3YTIwMDQ3ODUwYzVjZmYzZTIifQ==	2017-04-11 14:48:22.15597+02
zw8uogree5kaqm9z9k6j3852r2dbcg5z	MWExOGJlMzMwYTZjNjQ0YjU0MDI2MzMwNzZjODA2YzY0ODEyMWUwYTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiM3lmNFlOSW1LenhPIl19	2017-04-21 19:17:37.114509+02
fwan7dyg3692iirugwpsw43x21jsmm0k	Y2Y4MjFhODhmNzhkYjQzNmJjZGY1NzZlNmFlYzRhOWU0YmVhZWM4OTp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI5MyIsIl9hdXRoX3VzZXJfaGFzaCI6ImY5YWUxNDY4YjllNmJmOTk1NGYwOWU2NjY1YWNhZjNmYzNlYWQ0NGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-04-22 01:19:23.575878+02
2z2nkaatlapspjv8l4dy51gign2vdqze	YWYyYjBkMzFjYjU5Mzc3YmQwMzJlYjhlOWMzZDc3NzU3OThiZWYwMzp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF9leHBpcmVzX2luIjoiNTk5Iiwib2F1dGhfdG9rZW5fc2VjcmV0IjoiNzBlOGVmYjMtYTA4YS00ZGI5LWJmNjMtYjhmMjg3NzhkOTk5IiwieG9hdXRoX3JlcXVlc3RfYXV0aF91cmwiOiJodHRwczovL2FwaS5saW5rZWRpbi5jb20vdWFzL29hdXRoL2F1dGhvcml6ZSIsIm9hdXRoX3Rva2VuIjoiNzgtLTQ2OTQ2YTIxLWNkYzgtNDkzZi04YWYxLTkxMDNiMzMyNmY3MiIsIm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZCI6InRydWUifSwiX2F1dGhfdXNlcl9pZCI6IjM5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2ZmOWI0M2JjM2ViMDNmZmE2ZGRhM2I0YTM5NDNiNTA2ZmMyMTcyOSJ9	2017-04-11 17:13:24.941144+02
hcogr838121wd9vsfh278k095am1pjzd	ZjdmMzNhM2YxOWM4NjM2M2Q2NmYzMjMwOTYzNGI0NWE0YTUzY2E3Njp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiOG5ocHBXMVdKRjNsIl19	2017-04-22 11:50:51.863795+02
88e4j1t50l1lw1yazmoyeggjy3jcqxgo	MjFmOThhMzE5MWM0MzUzYTNmZjczMzkzMDNjOThjZDNjZjVkMmMyYjp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImRjOWNmNDNlZWRlMzU3NjhiZGQ0NDA1ZWM5YWEwOWUzMTgyMTc3NzkiLCJvYXV0aF9hcGkubGlua2VkaW4uY29tX2FjY2Vzc190b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiJmM2M0NWIwYi1mOTQwLTRiYzUtOTBjYS1lNDU4M2JjZmNkMWUiLCJvYXV0aF9hdXRob3JpemF0aW9uX2V4cGlyZXNfaW4iOiI1MTgzOTk5Iiwib2F1dGhfdG9rZW4iOiIzYjMyNDZjMS0yMGI3LTQ4NmQtYjU3My0zMjU0ZmRhMWIyZjgiLCJvYXV0aF9leHBpcmVzX2luIjoiNTE4Mzk5OSJ9LCJvYXV0aF9hcGkubGlua2VkaW4uY29tX3JlcXVlc3RfdG9rZW4iOnsib2F1dGhfdG9rZW5fc2VjcmV0IjoiYzI4NzJiYTUtZmQwNy00MDFmLWI3MzctODVkNjA0YjgxZGYyIiwieG9hdXRoX3JlcXVlc3RfYXV0aF91cmwiOiJodHRwczovL2FwaS5saW5rZWRpbi5jb20vdWFzL29hdXRoL2F1dGhvcml6ZSIsIm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZCI6InRydWUiLCJvYXV0aF90b2tlbiI6Ijc4LS0yNDg3ZTAxYi04YWEwLTQzZDYtYWYzNS0wYTMwZGY4NWIzYjMiLCJvYXV0aF9leHBpcmVzX2luIjoiNTk5In0sIl9hdXRoX3VzZXJfaWQiOiI0NiIsIl9sYW5ndWFnZSI6ImVuIn0=	2017-04-12 10:01:46.707305+02
cxkkhzp2i2g7ek32bqsmsojw113by8n0	N2QxNmVkMjFhODVmNzQ0YmM3NGIzOWE1MzczNzBhNjkzODhlZDBmYTp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI0MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjdjNjYzOGJkOTEwMjI1MDA0ODVjY2ZlMGJjMTZmNmZiM2Q3MDNkMzcifQ==	2017-04-11 19:21:41.727713+02
oqj4d7x3425ow398xsvttvkt2knlu7wf	YTc3NzRiNWMzZTliNDQxNjkyNmQ5OWZiNDI3ZWI5NjZmODQ5ODk4ZDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiM1Jna3FwRHN1Znc4Il19	2017-04-12 10:17:02.008894+02
nawkh4yrjjygzf31k2y10qj2fyb04g5o	ZWQyYmVhNzAzMzNmYWY2MmYyOTVlYWE0MTA2YzA0ZWUyNWRkZThkMDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiUDhTWExtSkxNU21NIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiI0YzM5MmM3ZC04ZWNmLTRmYzAtOTlkNC0zY2FiZTUwYTI4ZGMiLCJvYXV0aF9leHBpcmVzX2luIjoiNTk5Iiwib2F1dGhfdG9rZW4iOiI3OC0tYjc1OTgwMTMtNzAzZi00ZjE1LWIwMjUtNzIzNmMzNTliOTZjIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsInhvYXV0aF9yZXF1ZXN0X2F1dGhfdXJsIjoiaHR0cHM6Ly9hcGkubGlua2VkaW4uY29tL3Vhcy9vYXV0aC9hdXRob3JpemUifX0=	2017-04-12 10:17:43.372334+02
zppsb3fq1gc3m2hmub5fetgqiiq1y74n	ZGM1ODYxMjc3ZWNlNjU3MjVmNGYzMzZmNzAzZmQ0MDU1Y2NiYzg3Nzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiVEN3YkNkeWdjTUhsIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiJlMmUwMDU1Ny1kNDFmLTQzNjQtYTMyZC03YzdhYTBiOTZjNWUiLCJvYXV0aF9leHBpcmVzX2luIjoiNTk5Iiwib2F1dGhfdG9rZW4iOiI3OC0tNTUxOWI2M2QtN2IwNy00YWEwLTgyOTEtYTIwNDY5NDY1NmNkIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsInhvYXV0aF9yZXF1ZXN0X2F1dGhfdXJsIjoiaHR0cHM6Ly9hcGkubGlua2VkaW4uY29tL3Vhcy9vYXV0aC9hdXRob3JpemUifX0=	2017-04-12 10:20:06.312003+02
0jrakzbcwqgdm4sjlbjng10cxx8m6bzc	OWE3YjgzYjVmNzQxMTQwODNlOTliYmE2OGRkMzVhMTI5OWY4ZGVkZjp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI0MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjlkOGM5ODFiMjc3ZmY5MzYwOWJmY2U2MjFmNDhmMzlhZTIyYTAyNTQifQ==	2017-04-11 20:53:31.708736+02
v1ead99iqxbflqrac3el3f7rqbpdbjf3	MmUxZTZlOTI3MjdlZGUyZmI3MWM3YTY5NzFmNDMzMTFlNzdlYmMxMDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiZTZsRXhHNGQzSzNUIl19	2017-04-12 10:22:34.240455+02
zcx0hgba9g2ui8d2s26na34l3za4kfnq	Yjg2YWYyODgwODVhMmM2MThmY2FkZDVmMjQxNjY0MjRlODdkN2RiMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImRlOWRlZmFkMzZiYjVmOGVmOWNjMGVjYjk1ZGI0YjQ1ZDM0OTdlZjYiLCJfYXV0aF91c2VyX2lkIjoiMzEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-04-11 21:52:35.214947+02
4eelj2ac8qsen8ya12ohhq4dlua751aj	ODczYzM2ZGZlZTBmNWQ0ZTUwY2RlYWUxYzllZGNlMjgyMmE1ZjI1ZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwic2NvcGUiOiIiLCJwcm9jZXNzIjoibG9naW4ifSwicTdOZkpGcjhJdkhxIl19	2017-04-12 10:24:57.949257+02
uh364ejs2kh28cg6m1hkm4wkp0f7izjy	OTkyMDVmMzkwMmUxZWIxZTE1NWUwZWRiNzJlODJiMWIyMmQwZWRmNDp7Im9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbiI6Ijc4LS01MjcyOGZjOC1mZWVhLTQxZjUtYjhlNS0xOTY1Mzk5Y2E0YWQiLCJvYXV0aF90b2tlbl9zZWNyZXQiOiJlZGNjYjMxZi0yYWE2LTRiZGQtOTY3OC01ZThlNmNlZmQzZmMiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfZXhwaXJlc19pbiI6IjU5OSIsIm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZCI6InRydWUifSwic29jaWFsYWNjb3VudF9zdGF0ZSI6W3sicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiJ9LCJLdmc5UGtiNlRRcjMiXX0=	2017-04-12 10:27:21.228254+02
1vi0nj6yg38g81wmzrqcz6fz2uypnda0	OTBlYjg4ZmIyZGNjYjNkMWI2MWM4NjgzOGRkMjM5OTZhMmZkNWE0MDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsImF1dGhfcGFyYW1zIjoiIiwic2NvcGUiOiIifSwiUTg0TEtlRTJwaWRUIl0sIl9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjQiLCJfYXV0aF91c2VyX2hhc2giOiI5NjM1YTRiMzk0MDc5NzllOTQwYjQ5NmFjNmEyNDBkN2I4Njk1N2E1In0=	2017-04-12 10:36:35.047066+02
annorsqbn98p4fyd1qtbsolx3u7td5bk	M2JlODhmMGMzMjJmM2VjNzQ2NDYxMTQxZWZkODU1MDA3YjQ3ZWMyYjp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTYzNWE0YjM5NDA3OTc5ZTk0MGI0OTZhYzZhMjQwZDdiODY5NTdhNSJ9	2017-04-12 10:54:21.873339+02
3z8nprinvl3g5cozc0a2yhar9kx3imr1	OWZlODViNjVlNWVhOTFjOGE0YjU0MjQ3NGMxNjU2YTk0YjBlNGU1Njp7Il9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjQiLCJfYXV0aF91c2VyX2hhc2giOiI5NjM1YTRiMzk0MDc5NzllOTQwYjQ5NmFjNmEyNDBkN2I4Njk1N2E1In0=	2017-04-12 10:55:24.241189+02
us0rlnl0ci7lpve0ep7qnkcocrr863tr	OWZlODViNjVlNWVhOTFjOGE0YjU0MjQ3NGMxNjU2YTk0YjBlNGU1Njp7Il9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjQiLCJfYXV0aF91c2VyX2hhc2giOiI5NjM1YTRiMzk0MDc5NzllOTQwYjQ5NmFjNmEyNDBkN2I4Njk1N2E1In0=	2017-04-12 10:56:51.545582+02
d2qwhelyw0kazh56rvhqw9k10n5kycls	ZGNkZDE0MGY2Y2Y3MGMwY2NkZmFmNWM4Y2ZiYzdkZDMzMzE4MTRiZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0OCIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6IjU0NWJiZDVjYmMxMzEzYWU1NmM3OTE0MGVjYTZiM2JhOTgzODZlZTAifQ==	2017-04-13 17:41:07.198682+02
yj3b0t2umljh1ibkgdyqqdl59414pvef	YTk0YzI2NTE5YjgxYTcwNjJhMTRiMDU5ZGJkMTBlZjlhYjEzNDU0Yzp7InVzZXJfaWQiOjIyMCwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fSwidXNlcl90eXBlIjoiQ3VzdG9tZXIiLCJjYXJ0IjoicmFqIn0=	2017-08-01 06:59:38.310017+02
oam2ueyzjywu3sawb9vn229rs9zfja11	NzM5OWYyMzg0OTk5ZmNkZDIzZTgyZDU3ODE5ZmRlMGMyNGVmYmU1Zjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiZlhqWFlTbmp0TDNCIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiJhYWY1YmZiOS0wYmE2LTQxOWItODMxNi0xZDgxM2UwODJjOTUiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkiLCJvYXV0aF90b2tlbiI6Ijc4LS00MGQ4MGMwMy0yZGU5LTRlZDMtYTBlOC05ZjBkZmEyNzM5MjcifX0=	2017-04-13 17:50:13.452152+02
2y0zdxjm73903k6rbvjerwvzhc00f5wn	M2IwZjZmZTA3MjBmMDdjM2JmZDNkYmRjM2I2NGJlZWY5ZGE2ZmIyMDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwieWVpbjJmdWFSVGUwIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiJhODYzYjdmOS0yYmE0LTQ3ZTQtYjdmYS05N2Y5YzQyNjMyYjMiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkiLCJvYXV0aF90b2tlbiI6Ijc4LS0zNmUwM2YwMy00ZDYzLTQ5MTAtOTBjZS1iNjhlYjc1N2NjZjEifX0=	2017-04-13 17:50:15.820985+02
74gv7a59dh8xwx6sh95noa646wfe6u9y	NmJjMjNlMTc2ODBmNGI4ZWQ5ZjdiYjM2ZmQzODdkM2Y4NDM3NzkwZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwicXNXN0tSaU1Wa2czIl19	2017-04-13 19:18:01.61458+02
ugjwk5dqm3dzr0q3nb1ymublqpishobj	ODc5OTNiMmQ1MWUxZGI2ZGFmYzg5OTg5MGRiNGJmMWNlZDQzMDc3ZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiUzhDdnNVRlV3NFM0Il19	2017-04-13 19:48:21.734079+02
o6jfae45z1j2vdnml4ffeykhbhih9j78	MzU1YjEwMzVhOTg2MmUwOGQzNmViNWQxNWU1MzVhYjQwOGZlNjIxZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiN3ZsMTlOaWdiQU5EIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiI1M2VlZDExYi00M2U3LTQwNTYtYTZmMS0yMzVlODVmY2ZjODEiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkiLCJvYXV0aF90b2tlbiI6Ijc4LS01ODIxNjNiMi01MmNjLTQwNTMtOGRmNy01YWQyZWI3NjQxMzUifX0=	2017-04-13 19:48:22.096423+02
io5m07h0zfng966ruzk379ubbuqfr28m	MjQ2ZGFhMDRmMDBiMDZhMWMwN2YzZjJhM2Q3MGU3YjcwOTJhNWZhMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0OSIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6Ijg4MGJiNzliY2IxNjBhZmRkYjVmYzE5Njk0NTZiYWFjYjg4Y2Y0NjkifQ==	2017-04-13 22:41:58.595414+02
ac2cnm0u4yybem80dyyzh973dd3ox7f9	MTI5ZGRiMjE5ZmI5MjlhMTJkMzJlZDQ1NWZiNmVkM2ZhMTE1N2JiNzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiNkgxdFdOa2dQTHM3Il19	2017-04-14 06:02:05.082562+02
pm6zkevyy17kopktm9wnx02v3bxff87x	ZWQ5YjE3ZTZiZDI4NjZiNGExOTVkMzkwYmQ2MzM4MzhkYzk4ZjJkZDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiQ3J2azNQRlpYREVCIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiJiNjNjZjAzZi02YWZjLTQ2YWEtYjMwYy05MjE2NzkyOTQ4MzkiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkiLCJvYXV0aF90b2tlbiI6Ijc4LS05ZGQzZGVlOC0zNGNkLTRjZWQtOWI1NS1kMmNkYjEyNDEzZjYifX0=	2017-04-14 06:02:05.492088+02
5x1ay17cz1z6pnmhsqnnzvo6qjb3bzbw	YzJlMjE1OGZlNTM1Mjg3ZjFlYTg5MzRmNmI1NWE5NTllODBjNDk1MDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1MSIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6ImY0YTMzZDk3OTlkZjk4NWVjNGNhMDY5MWZhZWQyMDdhY2U1ZmNlMGIifQ==	2017-04-14 09:34:36.976426+02
lvy601h8xuvu7ad5tnc77gtzn29hzho4	Y2M1MjA4YTc5NWMzZTdlZmZlZGZjZTQyYTRjYzkyOWQ4Mjc4MTg1ODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfaGFzaCI6IjQ5MjRhMTU1MmM5ZWYwNjBiMDg4OWE4NjMxNGFlNzI0MjMzNjgyNWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiJ9	2017-04-12 16:04:34.175601+02
fr6d6ezlepkcgdnm8ax3v3r73cb6e5zw	ZjIxYzk2Y2JjOTM1Y2MyZjU4YjdlMmE2N2M3OGY3N2ViYWRjM2Y3OTp7Il9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjU3IiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0OWZlOTA5ZmEyMTY1ZGRhYTc2Yzc4ZTRjYWUyYzUzMjZkZmZmYiJ9	2017-04-15 18:55:08.994854+02
gwsa2ee6o8ns4hgtagza013l6scbo0ak	ODgyODM5NmM2NDQ3YjU2N2E0ZDhjOTg2NzJkYTEyODkyNmYzOGY0ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDNmYTVjOWVkNDE2ZjA1NDM5YWQ1YTQwZjc1ODQzOGI5NTlhNGJmMyJ9	2017-04-12 19:14:52.112693+02
dwlzfisidb1kdsokdcju3hs8x66jkmo6	YTFmNjkxOTQwZjg4YzkzMTBhOTE0YWZiOWRiZTQyNzU3YjUwNTNjNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0NyIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6IjAzNmZmZGRiYjc0MTE3MGVlNTIzYWRjNmE2NjhkMDMxNDllNjZmNDMifQ==	2017-04-12 21:14:30.312675+02
33atlihfrvagmn3t2eiwkja601er723h	MzQxYWI0YzUzYTE5OGRmOTQ5ODIzYjViYjRiOTg2ZTkyMWU1ZTlmZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiVExabkhYdkppMGxuIl19	2017-04-13 01:47:11.681486+02
83nqw9n5m16pmdel946x0in3y2cql234	YThkYWUwNWE2ZjhjZWYwOWY5YTZiNmE0YTY1NWE2MmFlMDAyMTEzYjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiOTNlYzZHSUZWUWJKIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiIyNmNlOGVjYi03ZDg0LTQ1ZmItOGE0NC1iYTk3OTBhMDNjNjEiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkiLCJvYXV0aF90b2tlbiI6Ijc4LS00ZTM3YzJjMS1iYTRmLTRiMmUtOTIzNS04NTYxNmM5ZWRhYWEifX0=	2017-04-13 01:49:22.301528+02
pox87lc6q0uwtjizqkf93iiqhaoj9nqw	NTZlMWMzNTFmN2I1ZTUyNjAxOWYxNWMyODc0OTExYWRlZGNlNjNiMTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiTXJvY3BxTjFqM0s3Il19	2017-04-13 07:35:00.676237+02
q9ll5ugr39xheetmfq13tfqbml3zipxb	YWZjNDFkNjg4ODY5YTc4MmMxZWUxNmVkZDc0YzFiYzA1NTY0YjdkNDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwidmludjEzeVBxVDEwIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiJhYWJiOTg1MC02YmI5LTRiNDEtYmQ4Yy1jMmU4YWU1ZWFkYTYiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkiLCJvYXV0aF90b2tlbiI6Ijc4LS1jMGRlNTVlMy01Y2IyLTQ0ZGItODE2Yy03YTEyMTE1YzBiNTcifX0=	2017-04-13 07:35:00.910743+02
ve1ubzqzuwq3kaz3zvhzr9wjb1pfskik	ZjAxMmRhZGYwYzllYTA0YWVjNTJiNWMxMjA4ZDg0ZDUyMDcyYzZmMDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiSjJUaWYwcFo4WDhOIl19	2017-04-14 08:48:50.558448+02
87pcf5p5rwwh5fc5eiv7ssj2n4neaz1q	MDU1NjQ3MzM4M2ViYmVjZDQ4OTM1YmFiYWQzM2UwZmNhODNmYjZmNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1MiIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6ImU0OTIwOTBjM2MzYmRiNTQwMWM5ZWE3NjZkN2I4YjczZTViNmRiN2YifQ==	2017-04-14 22:05:52.5171+02
y9snw6csjxg1qs0grmobgs9suxn3osbb	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-18 15:39:41.564828+02
3ffedt48nl7m5bs1b8lbtq0dzcr8ma9g	NzU5YjU5YTg4NmMyYmRmZmU2ZmM5ZGFiMmE3NmMwZmEyYWIyMGM0MDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiMEpRWDNFR1ZnMGtGIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiI5ZWFjMWU0ZC05NDMyLTRhNDEtYjMyYS1kYTNkZTliZjM1YzYiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkiLCJvYXV0aF90b2tlbiI6Ijc4LS1jZTE0NGQ3Yy1hMTFlLTQxNDQtYjk4Ni04N2VlNTllOWY0ZTQifX0=	2017-04-14 08:48:50.89672+02
gw8f9i6yn3kwvh6d5wak9jrrkvcc732c	NDkyZTQ1OWJkZDYyOWY1YTgyMGMwYzY4NjQ4YzY4YTk2ZTdiZDg0MDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiZWNERk9KTUFvUmg5Il19	2017-04-14 16:35:06.996721+02
mdzhpd03a742qe40n5d5f0f1fc2ud8sz	ZWQzYTNkM2E2YmY0N2MyODUyOWNjNjE5ZmMxNmI1YjY1Yjk4YjQwNDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwidFZaQ0hwSGJ1VDltIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiIzMjMxNTY3NC1mMjE3LTQ1MmEtODQ0YS1hOTAzMDRhNzQ4NzYiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkiLCJvYXV0aF90b2tlbiI6Ijc4LS1jMmQzNDUzMy1jMTNmLTRlM2QtYTU1YS01OTY3ZjAzNDlhMTgifX0=	2017-04-14 16:35:07.584502+02
6hawsi89wobmcgvxgde33xm370qf28m6	OGViMzJlZTczNWRiMjhhNDAwNWNmZDdhOGZiOWRiN2Q3NTgwMTlkOTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwidlV5c1VhTFdmYkY2Il19	2017-04-14 18:47:34.775509+02
3y795jg2qs2ngdt1bdotmu7rc2x9pt9n	NDU3MGQxNTRiYWU2MzRhZjk4ZmRiN2Q3MWMyZGJhM2ZlNTU2ZTVhZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiYUJWNFpBR3E5bGFBIl19	2017-04-14 20:24:56.368597+02
k9cnxzjm5scvx2rr7vb5lg3zslj0pijv	OTQxOTRkMmVhYTkxODUxYzYxZWQzZjcxNjI2Yjc0Zjc0OGQ0NmVmOTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiTnMxanc2UlVybTYwIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiI3YjJhZmQwNS1iMjI0LTQzM2QtOTNkZi1kN2VlOGViYzc3MWIiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkiLCJvYXV0aF90b2tlbiI6Ijc4LS1iM2JjYjMwMi05OWYwLTRhOTktYjk3My0zZjMxMDJjZjQzZjYifX0=	2017-04-14 20:24:57.528831+02
yoibgv2jv3rbmzss7er29bjtuw0r5gwi	MWRmNjQ0MGU1MjM5YzI1ZTdmNTkxNjIxN2U0YmNmMzY0ZTBkNGM1ODp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI4OSIsIl9hdXRoX3VzZXJfaGFzaCI6ImFlMjY5YTAzZDVmZWE0MzYyZmFiNjY0MDZhZDhiYTQ3ZjY4ODY3ZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-04-21 14:56:41.88636+02
vrubvtgzp9t2x9ao9x1vmp8n6k7o0u1v	YTVmYjgzMDg1MzA5M2M1NmFiODk4MTZjNjBiMjViZTc1MjAxOTAxYzp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2xhbmd1YWdlIjoiZW4iLCJfYXV0aF91c2VyX2hhc2giOiI5NjM1YTRiMzk0MDc5NzllOTQwYjQ5NmFjNmEyNDBkN2I4Njk1N2E1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-04-20 18:42:05.858654+02
41j72542bf6qu156ebxiocx5zhpvfhat	YzVmNzhiNTgwYjc5MTM0MDdiNTJjMjVmZTU4NzY2ZGE5ZGQzOWM3Yjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiR1hUUnRMb2t4UXFrIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiIxNzc3NjQyYy1jMWNhLTRjNTgtOWRiYS05MjJjMWUwMmUzMDQiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkiLCJvYXV0aF90b2tlbiI6Ijc4LS1hNGQ2Njg4Yi0yYTM2LTRhNTEtYmMzYy01OGI4MzI3NWI2ZTEifX0=	2017-04-17 21:42:46.78865+02
dzdswh27gjictoo4iws6g6stqmla8of6	ZmViZjRiMDM0NTlkYzdhYjc1MDViMTA3ZDY3MzBhMDNhZWU0Y2U0NDp7Im9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX3Rva2VuIjoiNzgtLTgwZTkwY2UyLTYxZDEtNGY4ZC05YjAyLWI1NTNmZGNkZjdlZSIsIm9hdXRoX3Rva2VuX3NlY3JldCI6ImU3YjIwMTQyLWM1MzctNDFiYS1hODZhLThmNzMxNTg1OWQ2NSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkifSwic29jaWFsYWNjb3VudF9zdGF0ZSI6W3sicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiJ9LCJQbWRXcmRKSlcxUUsiXX0=	2017-04-20 20:09:03.173667+02
goo29m2mlpac97swb7og69vfazqo0cb2	ZmI0ZDE3Nzg5Mzk4NWFhMDljNWNkNGU4YTEyZTIzNGY4Yjc1M2M5MTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiUUdhdHY1UnprenBVIl19	2017-04-18 21:12:10.164573+02
if82uy1bxmo73yzd18yl4i285hxjtsx5	N2YzNzIwMGUwNWI2OTFhNWNiNWQ0ZWIyMGM0NzFmZThjNTc2NDM3OTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiZzN4Nk5mZmFMWVJTIl19	2017-04-19 17:44:34.598768+02
1cpcqovyxcjizuz17xas6an6zam7gftl	NTIwMTIxNzAxMzBmMGY3ZDI5NTZkMTFiZDZhN2Q3NGNhNTcwZGJhNDp7Im9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX3Rva2VuIjoiNzgtLWQ5ZWU1Y2IzLTAwZWEtNDZhMi05ZmJkLWVlNjY1MmM1YTM4YSIsIm9hdXRoX3Rva2VuX3NlY3JldCI6ImVmNTUyYzE1LWQyNmItNGYyNy04NDc1LTU2M2I3ZGQzNjEyNSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkifSwic29jaWFsYWNjb3VudF9zdGF0ZSI6W3sicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiJ9LCJGU3ZYTnhDQ1RJQVIiXX0=	2017-04-21 19:17:37.443918+02
rnh2rku0zqcns3w4coaf8upaj5hjzh6w	YTVmYjgzMDg1MzA5M2M1NmFiODk4MTZjNjBiMjViZTc1MjAxOTAxYzp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2xhbmd1YWdlIjoiZW4iLCJfYXV0aF91c2VyX2hhc2giOiI5NjM1YTRiMzk0MDc5NzllOTQwYjQ5NmFjNmEyNDBkN2I4Njk1N2E1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-04-20 22:50:58.341958+02
j8p3b9ko0z0nvthgba3sftrn4i9usjes	OWIzYzhhYjgwMTFkZjVhMmNkMzdmYTc1NjFhZWUwMjcyZDBiZTlkZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiVTI2VzVpMmU0SFhKIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiIyMTYwMjYyNC1iM2JkLTRmZmYtYjFmNy03NDhhMmMxZTQ3MDAiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkiLCJvYXV0aF90b2tlbiI6Ijc4LS03YjhlOTk0Mi1jMGRjLTQ5YTQtOGEzNi00ZjljYzEwODE4MWUifX0=	2017-04-20 12:32:31.170194+02
q268tu4kpdlatv3i1sg7dfmcgbiy09aa	ZDQwZGQ2ZTFjNTdkODY2ZDgzZTJmOGZmMDU3NGI3Nzc4ZGMzNGEyYTp7Il9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Ijc5IiwiX2F1dGhfdXNlcl9oYXNoIjoiNDM0ZjZhODkwYzI5MGU4ZmUxYTEyNjUzMTIxYzJlNzNiOTRlMTI1YyJ9	2017-04-20 14:33:14.725812+02
hhhn8ptvr8b2lh0sf8sk4z1z6p5htcz2	NWJlNWFjYTFlNzU4Njc2N2Q1MmRlNGM2M2IyOGFmMWFhNjkzYjA1NDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiclVsRGh6ZlFqOEZmIl19	2017-04-21 09:30:22.861916+02
lifpbdutavwszb54di0afg0smsbsbyp0	M2Y0MDY2YTcwNjg3MDQxNTI1MTE3MjE1YmEyYzdkZjkyNjIzOWIyMzp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI4OCIsIl9hdXRoX3VzZXJfaGFzaCI6IjExZGU4MDY3MjQ1OWEwNDg2N2Y3OTIzOTcxYWJlZGUzZGZjYmJlN2UiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-04-21 14:50:11.043436+02
ixg84jgq2yy6hqpqrttv5oy9m8g713ie	ZGJlMTJjMzg0MGE1NTZhMTFmMDRjZTIxNjE3OWQyMGI1MmIwZmNhNzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwibHc1RDJSUHdEaWZCIl19	2017-05-02 01:17:31.988743+02
yhl4jbml49whw2wfg9mrms2r1qsbryx6	NmEzOWNmZjJiNjhmNDQwNjNmZDZmMmU0MDUwNTQwYjFkYmU3ZjBjYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzllMDg1MTk1N2U2Yjg0NTBjZjc3ZWRmNjFjNjRhMjUyMzJhZjEzYyIsIl9hdXRoX3VzZXJfaWQiOiIxMzEifQ==	2017-05-09 13:15:02.965868+02
ung5u84jueijsrsyra9oyqkboqe6c0fq	ZDllMjJlNDQzMjdiYmUwZDdiNzA3NGJiMjRjZWQ5MzU3OTViMmZjMjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiUk9IZHcxMTEzSTE0Il19	2017-04-17 22:17:33.927247+02
c4j9jc3mfclo9arhu7mpqs5emwqx9kib	NTlkNjFlNTA2NWRmYWY1NTcxNTJlMjk2YzFjNDk0MmE2OThiOGE2OTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwia2FBd2VISXNRbU55Il19	2017-04-18 23:20:36.350951+02
mnyy88a9j3t951fu1ivqffm3wvngs9mw	MWQ0YjNiYzkyNzdmNjY3M2U4ZjlhOWQ1MjBhN2NmMWY2OWFmMTgwNzp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDkyNGExNTUyYzllZjA2MGIwODg5YTg2MzE0YWU3MjQyMzM2ODI1ZCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2017-04-20 20:48:25.854487+02
b5w5229fwoup7imiy1pcnkk2qjs8sjqp	MmJhOTAyNDkxMjU0OGNlNmQ0ZDQ2OGVlYjdmMTMyNmRlNTQyNzI1Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3NyIsIl9hdXRoX3VzZXJfaGFzaCI6IjczNDhkYTAyNmMxYmM2YjQxZWExZmYyYzcyMjEyMGM1Y2JjMzcyNzMifQ==	2017-04-20 00:04:12.557176+02
lqf4k0udnk8nko8yo8jscf7i4ad4hgj3	MDM3YTllZjAyNmRmZmJjMzMxZGRhZTdmMDZkNzJjMzg5MTAwNDZkMTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fYWNjZXNzX3Rva2VuIjp7Im9hdXRoX3Rva2VuX3NlY3JldCI6IjEyYThmMDU1LThlYTgtNGRhNS1iMWZjLTY4ZTYwN2M3YTlkNSIsIm9hdXRoX3Rva2VuIjoiNWViMWU2ZmEtNzFiOS00ZmJmLThjYTctZTU1MzkyOWExMTU4Iiwib2F1dGhfZXhwaXJlc19pbiI6IjUxODM5OTkiLCJvYXV0aF9hdXRob3JpemF0aW9uX2V4cGlyZXNfaW4iOiI1MTgzOTk5In0sIl9hdXRoX3VzZXJfaWQiOiIxMTYiLCJfYXV0aF91c2VyX2hhc2giOiI2OWE5ZTFmNjZjNGIxZjZiOTU0MDJiNzUwMTUyYTg3ZTA4YzExM2U2IiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbCwib2F1dGhfYXBpLmxpbmtlZGluLmNvbV9yZXF1ZXN0X3Rva2VuIjp7Im9hdXRoX3Rva2VuX3NlY3JldCI6IjE5OGQzZmY1LTc0MDMtNGFlNi04NTk5LWVjMWM4NGRmNWFlOCIsIm9hdXRoX3Rva2VuIjoiNzgtLTViMzkzYjliLTc1OWItNDFmOC1iYjE0LTgxNjNlNjUzYTRjMSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkiLCJvYXV0aF9jYWxsYmFja19jb25maXJtZWQiOiJ0cnVlIiwieG9hdXRoX3JlcXVlc3RfYXV0aF91cmwiOiJodHRwczovL2FwaS5saW5rZWRpbi5jb20vdWFzL29hdXRoL2F1dGhvcml6ZSJ9fQ==	2017-05-02 20:59:36.201418+02
tcepd968y4ci0060gfdr87a12q46z7m1	ZTAwMmE3YjdmZWQwYjc0YzUzNzE3MWU0NTZhNDM3M2YzNDFkNTNlOTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiWWpudUtBc1paR1FFIl19	2017-04-22 15:05:17.620386+02
g2dazt1yxet6knu819mo9y10hm53poxf	YjkwMjdlOTI3ZDA3ZTc3ODQ2NmE1OWRjNjNlMWY3YjNjOTYwOTRlMTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiOWhCMURmWEZxWkNVIl19	2017-04-22 20:56:56.550019+02
d3ljxr5rimd45ct9pjk19fftljsq5fjs	YmEzNmM2NDE5Nzc0ODNhZjQwMzM2M2U5NTc2OWQ5YTVmOWIyNjlkMjp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI5OCIsIl9hdXRoX3VzZXJfaGFzaCI6ImE0YWQwOTFkOTNlYjZmNTM5ZTFlYzhiYTg5ZWI2ZWU0Yjc0ZmEwZmYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-04-23 09:56:04.42793+02
pxffrvpwdjqo319ugnue9ksvnr1xz74h	ZjEyMGM5YTE4NjU2NjQ1MmEwMjE0MzU1YzIzOTRiYTU1OWFmMTA2Yzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiVm03OEZMTlRSTE9oIl19	2017-04-23 22:30:38.584422+02
z7tgqcmpmp59hioijh0r4x01jgic5q0a	Njg1Yjc5OTM5MTVjZjExYTA3MTI5NjU4YWNlMjU1YTE5MTQzYjlhZDp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI4NSIsIl9hdXRoX3VzZXJfaGFzaCI6IjYyZWRlYjA3N2U5YzRkMzBhY2UzM2Y4ODdhMDE1MGRlZTQzZDE4MDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-04-21 14:38:05.792634+02
21yoagwduwazwwpys5rn129xndgi04gs	OTBlYWQyYWE5OWY1OWM2MjJmYzA2NzA0NTQ2Y2VhNzZhMDllYTk1ODp7Im9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX3Rva2VuIjoiNzgtLTA0Y2JjOTlhLTVhODQtNDBmZi04ZDgwLTMyNDAxNTVhZWZiYiIsIm9hdXRoX3Rva2VuX3NlY3JldCI6ImVkM2FmZDU5LThlOGYtNGZjZS1hMWU2LTlkZTM3NTgyOTkzZCIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkifSwic29jaWFsYWNjb3VudF9zdGF0ZSI6W3sicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiJ9LCJHak9vTjZrd3RudzMiXX0=	2017-04-26 11:04:23.779239+02
f58ybwhwz9u53q3wwp05z9rnwcmzavqh	ZGIwZmMzYjQzY2YwMzVmOWUzOTIwOTY5YjI1MzIyYjkxNzQ0MmYyNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzZmE1YzllZDQxNmYwNTQzOWFkNWE0MGY3NTg0MzhiOTU5YTRiZjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2017-05-05 15:03:52.867488+02
n5p2n1887a6kd414hiruh2tawieg8jl3	N2QzY2RjY2E3NGQ4ZTU4ZDczOGYwMjBkODg5NWExOGE0YjUyMjE0Mzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImQzZmE1YzllZDQxNmYwNTQzOWFkNWE0MGY3NTg0MzhiOTU5YTRiZjMiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2017-05-12 08:26:48.056503+02
88any6pec2dhm9npwb6p5q1tdgnjh9qa	ZjM0NDIwYzA3ZjBhZGRjMGJhZTJkY2IwMzAyNzk2YTM5ZDdjODU2Yjp7Im9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX3Rva2VuIjoiNzgtLTIwZDdlYzYwLTdiNmItNDVlYy1hNDg3LWQyYzVjNjhmMTc2ZiIsIm9hdXRoX3Rva2VuX3NlY3JldCI6IjZkZjNlZjU3LWJiNWMtNGI1ZC1iZDg3LWIwODJmOGY2Y2U4OCIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkifSwic29jaWFsYWNjb3VudF9zdGF0ZSI6W3sicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiJ9LCJQV09ZNXI1S2dvckIiXX0=	2017-04-26 17:03:47.177306+02
0qggncf5co1uy6mm7fwdhyirzd4qyn81	YjQwMmIyMDUwNzQzZTJmZmRmN2E2NDM4MDE2NmYzNDEwMGMxODJmNDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiQ3VuUFZXQjI1SWxCIl19	2017-04-28 03:30:20.523056+02
amky7w5ahrieez2yz8indwa8sgw7gakr	ZDdhMGQxNmNiYWE4NWYyYWQ3OWMyZGI0ZjI0OGNiZDg4YmNmYzFlYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY0NDMwOTlmODE1NmQ4NGQyNzQzYjkwZWU2YjQyNjg2MzQ5ZTExZWIiLCJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTE4In0=	2017-05-04 10:05:29.791685+02
go9fbqre9w4flerj2112ulxwt1kpwiz8	ZmQ3NWVhM2UzMWUxYjg5MWMyNTM2NWVlNWIwYzc4MTQwNzZjZTdkNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImNjMDNmNmRmOWExOGRmYTE2MzRmZThmZTI3NDc4ZWY0NzdkYzliMjkiLCJfbGFuZ3VhZ2UiOiJlcyIsIl9hdXRoX3VzZXJfaWQiOiIxMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-05-04 12:04:07.594003+02
omu8g0vkn7zc6s8ufov2bkjfkckwsae3	NjVhOWJmNzNiNTUyZDlmNTI0YmEzYWU1MTEyNTFiZGZiOGFhM2ZlNzp7Il9sYW5ndWFnZSI6ImVzIn0=	2017-05-04 15:03:22.669195+02
5q7qwp5ha9jyxpikb0l0552uybck5l31	NjYwMDM4NjY1YjQzMWQyMzIyZmViZTBkNGMzYmY1YjNkMWQxNWQzODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1MyIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6IjM5YmVmYmRkZGU4MWFhNmMzOTU1NzBiYjYzMzZjZWZjMmEyZWEyNDUifQ==	2017-04-14 22:31:53.258414+02
h6qrepp9w9g22i92rjgwb499kw0z8oiq	Y2I0M2JiODg2ZTBhMjY5NGJmMjI1MGVhZDI4YmZjNzU1NmQ0ODJiMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2017-05-09 12:00:28.162561+02
wc4zr1h7uxm1wflmzolde9f9z2l2epjz	OTBiZGM4NGJkMDBhY2QxZmZkMmEzNjQwZTdmNDRmZGY0YTkzMjUxZjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiS2NUUFZOQTNoUVFsIl19	2017-04-22 13:38:47.556705+02
uh94iq4r4qceolj8ndcg3ftz8ulu1c2i	MGU1OGUyOTQ1Zjc1MzBmOTkwZTRkYzg5ZmI2MjdmZmQ0ZDY4MWFlZDp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI5MCIsIl9hdXRoX3VzZXJfaGFzaCI6ImMzZjQ5N2U2YTgwMTVmM2VmZGQwMDAyZmYyODNkYWNiZWVlZmIzNWEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-04-21 15:00:09.667862+02
e9mh4yd9mizeqpkvs70zhmbflv1ywfgx	ZDIwMmU2ZjY5Y2ZiMmRlOTg4Nzg1MTZiZDVmNDM4NmJiZDgxOTljMTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2OCIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6ImNmOTY1MDI2OGYwOGRhY2RiYjExMGJmOWUxZDFlMDAyOGZiOTVkM2IifQ==	2017-04-17 18:33:25.414003+02
6k4y6lt47g273651bdfx54tdrzpkqjzq	NjJmMmIzMWVlNTVlNjY0MTE2ZmQ3ZmI3YWM0NDlhZjZiZmM1Yzc4MDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiaHlQbkxCTHJza2ltIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiI0ODY3NWIxMC00ZDYyLTRlMmEtYjU1OS1kYWQyNTg2NWU4MTIiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkiLCJvYXV0aF90b2tlbiI6Ijc4LS03NzBjMTM1NS0zOGUwLTQ1M2MtYTY5Ny1kMTBhN2ZhYTYwMjYifX0=	2017-04-18 05:59:47.874336+02
c8d5t38tsmms27c16v6uaztxsbtg5ygn	Y2I0M2JiODg2ZTBhMjY5NGJmMjI1MGVhZDI4YmZjNzU1NmQ0ODJiMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2017-04-21 19:42:55.061338+02
o5emi8j41lv2jq36y4dzguzfvjlkm8za	Y2RiM2Q2MjQ2MDI1MWYzYTBiODU2ODhkMGQwMDliMzE1NzQ5ZDkyOTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiY3FuYkd4SlRKeFU3Il19	2017-04-20 21:55:36.163767+02
lh52t1lpsoqaxghtqp8cvjtb5jst8b5x	ZjQ2ODk3NTRjMTQ1NGJkNTliODEyNDllOGU4NDZhNTVhY2NiYmUzMTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3NSIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6IjI5YTMyOThmNjEzOTY3M2VkZjZmM2ZmMGE5OTdhYzNjZjMwNTA1ZDIifQ==	2017-04-19 19:23:48.258987+02
dsb19oe40chyj5uot2kthf3li0swy776	ZjVjMTRhNDRhZjk1MzcwZDA3ZTVmZTIxNzI2YWRhZjg2OTE4NzgyZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfaGFzaCI6IjVkYzg0ZDIwMWI0YzBiMTlmNzFiZjg2MDcyMmJiYjlmZTFiZWFhNWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-04-22 09:25:31.520365+02
cfe7q0b8ikaf0mdkbnogs9243jd59yxe	NGVkMTg0MjgzN2UyNTU1NmU2ZDUxMWYxNDg1OGEwOWE4YzIyNDc4NDp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI4MSIsIl9hdXRoX3VzZXJfaGFzaCI6IjFhNmEwOGI4YzRjZjBhMmY0YTI2NzBhOWMxMzQ5NzY4Njc4Y2FkOTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-04-20 23:42:23.069182+02
4hw861avttu1pl36hnx02y9xn2r885y6	ZDgwOTIyZTA2ZDU1MWM1MmU0M2U3YzA1ZDQ4ODhmMmU4MWE2ODdlNTp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI5NSIsIl9hdXRoX3VzZXJfaGFzaCI6ImU1M2NhYzA4YzkwM2FmNDNkZGEzNmI2ZjQwOWRmYzA3NzU2NTA1YTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-04-22 11:51:35.897769+02
kt78k50w7ownplgqyuy9cfb0pe5z6hob	YWEwYmQxY2FiOTFiM2Q4MTg0ZjgwZmY5YjI0OTIyYjU4OGRjZDY1ZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiOUs5S0dTRkdrTHhwIl19	2017-04-22 17:20:03.327387+02
6p447wg0dhrewl8uc0l5d9bfo13xclpm	MjcyODU5NTU0NDk4MjQ4NjJiNjE5M2IzNGZiYTMwOGY3ZjlkOGZjYTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiM0NRdzRyeHBKMEx6Il19	2017-04-23 12:49:37.014977+02
4r6t52oauyp5zh6dvieaq1bxqgq6pbpe	ZWYwMjE1MGRiYmQ1NTQ3NzA5YjhhODAzMjhjZDc4YWYxZDJlNDYyODp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiIxMDIiLCJfYXV0aF91c2VyX2hhc2giOiJiMmRjNDkxZGUyODIyOWM0Y2FhMDUwODI5YzZlMGE3OTE0ZTE3ZTIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-04-24 10:35:37.050256+02
q8p8lrhhn6d14885d0e5ln16gjmg42l5	YjlhY2Q0NjZkZTFhMzU0MGQ0MGQ3ZDk4Njk4NWJiNWIyODZlNjQ0Yzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwicHUzVmVDOG9aRFVWIl19	2017-04-26 17:06:50.97862+02
bgk83w8jxzhpb80hghnlv4dqdwz9ijbb	YTNjZDZhNGM1MjAwMWZjM2JhODFhYmRiNTk1NWM5NjBjOWRhNTgxMjp7Im9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX3Rva2VuIjoiNzgtLTMwZTNjYTYwLWYyNDUtNGYwNS04MDIxLWFlYjFhNWIyZmE5OCIsIm9hdXRoX3Rva2VuX3NlY3JldCI6IjQ1OThkMzI4LThlZjEtNDA3Ny04NDgyLWJjNzcwNTU4ZmMyOCIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkifSwic29jaWFsYWNjb3VudF9zdGF0ZSI6W3sicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiJ9LCI4bmFIMUlXVG4xV1AiXX0=	2017-04-26 17:06:51.256798+02
kjfo8n8wu2021xtbz93le4jmbunmycis	ZGY4MTAzNTdkYzRkZGIzZDA4NjZjMWNhYWU1ODllYmE4MzFhNzgzOTp7Il9hdXRoX3VzZXJfaGFzaCI6ImEzY2MzMTBlMzdlYWZkN2JhNDViNmQzYzg4NmQ1MGQ4YzJkMmM5NjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTI4IiwiX2xhbmd1YWdlIjoiZW4ifQ==	2017-05-06 07:09:08.488081+02
ycyll3hpwk91lakribwkus2v95hbwd57	NmFjNzNkMzY4ZjFjODQwNjM1YTc5YWZmNDk4ZGY4ZGVjZjgxZjIzNjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDNmYTVjOWVkNDE2ZjA1NDM5YWQ1YTQwZjc1ODQzOGI5NTlhNGJmMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2017-04-25 12:52:02.312223+02
k73exjzmhkt6i1dcnllff2vbzjh5rk56	NzEyNDNiOGNkMjdhODczMzY4YWI3M2QwNTllMmEzN2RhZTYwNjc2ZDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiaTFJakNob3k2MThGIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiIxZDY5MDdhZS04OThmLTQ5NWUtOTAxZC1iYWViNmI0OWY5NTEiLCJvYXV0aF90b2tlbiI6Ijc4LS00M2ZjZDkyZi01NmFlLTQwMjMtYTc4Zi1kY2FiODUwODE0MTYiLCJvYXV0aF9leHBpcmVzX2luIjoiNTk5Iiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsInhvYXV0aF9yZXF1ZXN0X2F1dGhfdXJsIjoiaHR0cHM6Ly9hcGkubGlua2VkaW4uY29tL3Vhcy9vYXV0aC9hdXRob3JpemUifX0=	2017-04-28 03:30:20.794489+02
dymjx8jry5zt137beruyjjo9qh5sgohx	YWNmMjA5NTBhYjYxYzA3MDhmMDU5ODU3ZGRjOGFmOGY4ZjcyNTc5OTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiTVBWYXRWSVBlNWdSIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiI0ZTUwNTlhYi1hNGY0LTRlNTYtOTIxNi1hMTRhMmE1NzM0YTAiLCJvYXV0aF90b2tlbiI6Ijc4LS1lOTBmNTJmMy00MTkyLTQxYjgtYjdiMC1iMGNmMDdlZjEwMTkiLCJvYXV0aF9leHBpcmVzX2luIjoiNTk5Iiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsInhvYXV0aF9yZXF1ZXN0X2F1dGhfdXJsIjoiaHR0cHM6Ly9hcGkubGlua2VkaW4uY29tL3Vhcy9vYXV0aC9hdXRob3JpemUifX0=	2017-04-29 10:11:57.432428+02
gzxwx8579xiwedkv6obqu22wh5ym3pvr	ZjQzN2MyZDVlOTUxMGViOWJhNTZkN2FhMTkwZjMxMjhlMmI4MDVkMTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1NCIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6Ijk5ZmIyYmNhNWQ0NjQ3MDBmOWJjZDQzMmYyN2JhZjQ1M2JhZTAxNGYifQ==	2017-04-15 00:02:33.437471+02
osu9ifsk24zqr39k1qk1jafrtwihfd2g	NDg5NTY4ZTc2MDYxMDBiNTM1NGQ3YWU3ZTJkNzVjZmIyZjRmYTQ2NDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiUzZNdHlWaHBiaVdiIl19	2017-04-21 22:53:52.49206+02
8q3vm5m4h1wrf3uumc9ayvzze1mf8dch	MGM4ODM1ZmMwZWIzOWFmNTUzYTJmZDIyOTNlMDEwOTY3NGM1ODNhYjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiNUV5V0diNU1tMEJXIl19	2017-04-22 11:13:16.938883+02
d5rc2y8aft02tmdkxnjptce6oe2vp3yr	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-09 14:27:44.356536+02
zy2jx8yhkqraoz33pnbduosvq7v6i1uw	YTVmYjgzMDg1MzA5M2M1NmFiODk4MTZjNjBiMjViZTc1MjAxOTAxYzp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2xhbmd1YWdlIjoiZW4iLCJfYXV0aF91c2VyX2hhc2giOiI5NjM1YTRiMzk0MDc5NzllOTQwYjQ5NmFjNmEyNDBkN2I4Njk1N2E1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-04-20 18:55:53.041244+02
a68yfpcbam3fej3f93isdow72q9omdfv	OWQ2ODg0MjMwYTRlOWIxZWYxYjk1MmNmNGFjMjRkNWRjMGNlYWU2Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3MiIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6IjY0NWMwZTliNjAyYzNiOThiNTljNjVmOTIzZjlmZGMxZjFiYjA1MTQifQ==	2017-04-19 02:12:37.667969+02
u76krxxtkxelwbf13q2szaasnh2hs94d	NTg5ZDliNTJlZjVjOWU0OGVlYjM4ZWI3YTk2YWIzZGQ2ZmExMGY2NTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwidjJaUzljUGprN2hEIl19	2017-04-19 22:44:30.04006+02
p0b0wfw1ma3ifjydm2ph5bwn4d4u4c83	MmJhOTAyNDkxMjU0OGNlNmQ0ZDQ2OGVlYjdmMTMyNmRlNTQyNzI1Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3NyIsIl9hdXRoX3VzZXJfaGFzaCI6IjczNDhkYTAyNmMxYmM2YjQxZWExZmYyYzcyMjEyMGM1Y2JjMzcyNzMifQ==	2017-04-20 00:08:52.153119+02
jan5a962mkx9kyqf7ojqjo28zuo39qlk	YTE3ZTRhZTkxMTgxZmUwM2U0YzI0MGJhODU1YTdhNTBhYWQ3YmRjODp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI5NyIsIl9hdXRoX3VzZXJfaGFzaCI6ImFlMWEyMzAwYzIwZTZkZTZhOGU0MTc2NTQyNTA5NDQ4NDY5MjY5ZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-04-23 00:20:19.514334+02
ky7n6tsit9vbuvenjbdn1opvennljtjh	ZjM5ZTBiY2Q1MWVmYjc1NWViNjJjMGEyZWJiOTgyYmYyMTc3NDQwYjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiSDV6d3RiVDFjVWN1Il19	2017-04-23 15:34:30.951082+02
hgute3pxtzgd3c59l2ky86j3645vbav0	ZmRhMzkwOTg0ZTRhMjllN2NhZTZlNWUxMDU4ZjdjNGEwMTI4ZTYwZjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjQxOWQ0OGFjMjVmYzk4ZDI1ZWM4M2ViNjlkMTliODg3ODhmODA2YSIsIl9hdXRoX3VzZXJfaWQiOiIxMzMifQ==	2017-05-19 13:03:57.143053+02
wegklqjk0h2qhrz7svzyzbudo18rnx3g	ZjIzNzQzMjhmNDRjN2FhYjlmZWYwNzA1MTBjZWIyMjhiNGVjOTc5Mzp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiIxMDAiLCJfYXV0aF91c2VyX2hhc2giOiI4NjE2YTFhZmE0YjNhMjhlZjdjZjM1NzYxZjQxOTkxYTIwYzI1NjRhIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-04-23 23:08:06.470372+02
7oyuhfh1ukr4325l4ib8jdq1hj9pthvx	YmQxNWRjN2YwZDdlNjYwOTA4ZDAxMjlkYjE1NDllY2UwMzU3OGRkMzp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fYWNjZXNzX3Rva2VuIjp7Im9hdXRoX2F1dGhvcml6YXRpb25fZXhwaXJlc19pbiI6IjUxODM5OTgiLCJvYXV0aF90b2tlbiI6ImUyMjE0MTgyLTA3ZjQtNDczMC04N2JmLTk5MWExZWE2MmRiOCIsIm9hdXRoX3Rva2VuX3NlY3JldCI6ImQwODljYWUxLThlZWUtNDM2My04NTM1LWQ3OWJkNWMyNjRlMiIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1MTgzOTk4In0sIl9hdXRoX3VzZXJfaWQiOiIxMDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJvYXV0aF9hcGkubGlua2VkaW4uY29tX3JlcXVlc3RfdG9rZW4iOnsib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsInhvYXV0aF9yZXF1ZXN0X2F1dGhfdXJsIjoiaHR0cHM6Ly9hcGkubGlua2VkaW4uY29tL3Vhcy9vYXV0aC9hdXRob3JpemUiLCJvYXV0aF90b2tlbiI6Ijc4LS0yODAzZThmYi05NWZiLTRmYmYtODgzYi05ZjBlZWYwNTk4OTQiLCJvYXV0aF90b2tlbl9zZWNyZXQiOiIwYjFlOGM2My1mMmFlLTQ1NWYtODlhMi05ODNhNTdlZjViNDMiLCJvYXV0aF9leHBpcmVzX2luIjoiNTk5In0sIl9hdXRoX3VzZXJfaGFzaCI6ImQwMTMwNTRiMzA0ODRhNDQzZTdhZTZhODYzOWJjYjVkMWE5YTdlY2UifQ==	2017-04-24 12:54:37.015772+02
8413ezftqq6gft5crj87j1ay82xlf1mt	OTY0NTcwNWRhMThiY2QwY2E4ODczZTc0NThlNzkyMGIwMWVhMzg5ODp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI4NiIsIl9hdXRoX3VzZXJfaGFzaCI6ImJhMzIxZGQ3YzZjMzE4ODUyOTdmNGZjNjdmNTYxNTc1MzQzODEzZjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-04-21 14:39:04.712471+02
z2m8057qabkc86ke4rxs9l101k07pukz	YTRjYTdmMjRlM2JjZmQxMjJlNzUwN2I1Mjc1YTg0NGE0NWE3ZmE1Yzp7Il9hdXRoX3VzZXJfaWQiOiIzMSIsIl9hdXRoX3VzZXJfaGFzaCI6ImRlOWRlZmFkMzZiYjVmOGVmOWNjMGVjYjk1ZGI0YjQ1ZDM0OTdlZjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-04-24 14:37:55.412661+02
lhryvu4urviq1flrpv740sbqz4bd00z4	NThiOGEzNDQ3NmExZmE4NjMyODE1YWMxZWMwMDk3YTJkZTY1NDQyYjp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fYWNjZXNzX3Rva2VuIjp7Im9hdXRoX2F1dGhvcml6YXRpb25fZXhwaXJlc19pbiI6IjUxODM5OTkiLCJvYXV0aF90b2tlbiI6IjM2Njg0YmEyLTJkM2ItNGJmYS1iNjM1LTZkNGFhM2MwNWE0YSIsIm9hdXRoX3Rva2VuX3NlY3JldCI6ImFlOGY4ZTA3LWNjMDUtNGQxYS04N2FlLWU2NDdmYzBiY2NmZiIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1MTgzOTk5In0sIl9hdXRoX3VzZXJfaWQiOiIxMDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJvYXV0aF9hcGkubGlua2VkaW4uY29tX3JlcXVlc3RfdG9rZW4iOnsib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsInhvYXV0aF9yZXF1ZXN0X2F1dGhfdXJsIjoiaHR0cHM6Ly9hcGkubGlua2VkaW4uY29tL3Vhcy9vYXV0aC9hdXRob3JpemUiLCJvYXV0aF90b2tlbiI6Ijc4LS1mZWVmYTFiOC0yN2M0LTQyZmMtYTJmNC0xOTBkNDAyOGRiZDUiLCJvYXV0aF90b2tlbl9zZWNyZXQiOiI4OTk3YTY0NC0yNWUzLTRkYjQtOTQ4MS01YmFiZGFkNzIyMTciLCJvYXV0aF9leHBpcmVzX2luIjoiNTk5In0sIl9hdXRoX3VzZXJfaGFzaCI6IjQ2NWVjM2ZkMTU2Y2QzNDMxYzVmZGY4YjMxMTMzMWIwNTg3MWY2MjEifQ==	2017-04-24 15:41:36.035532+02
sesi6sx1xx1siz2wxdevn3pk2gzpx73y	MmRkNDZmMTY1NjM4ZjJhOTc2M2U0YzEyZThiNjA1YmUyYWE5NjhjNTp7Il9hdXRoX3VzZXJfaWQiOiIxMDMiLCJfbGFuZ3VhZ2UiOiJlbiIsIl9hdXRoX3VzZXJfaGFzaCI6ImIzZDFkZTE3NTY4Y2NlZDRmOWYyMWZkOWRhMGY0MmIyYjBhMDIxZDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-04-26 13:00:01.068832+02
9v51i9p9i0t2dr4k4gn58ruzyhb2u1ja	Zjc3YmNjZmNlMTViMTA5ODc4NDVmYzVlMTE4OTIzNTVmNjE0N2VhODp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiWFY3ZWhCdG1vZ0dDIl19	2017-04-26 17:03:46.806488+02
byivu2b51qwychct2p7cugpcw7obedx4	YzM2ZjkxNTIxNDcwMzQyNDM4ZjM4MzkzNDdlOWQ5N2YyZjczMWI1MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImVlZDA2ZjZiZmYxMGY5MDhmMmI0ZjMxYTk5MjY3ZWY4NGU2ZDIyN2UiLCJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTEzIn0=	2017-04-29 00:39:40.384519+02
zkoixgvuw3yz1mfontpflv9ahzwjmf7w	OGQ5MGNlYzVmZWFkNTE1OWZiMGQxZDcxZGExMzgxNWMwYTQ5NmY2Mjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiSmpTb1o3Q1R1Y1dEIl19	2017-04-30 17:50:26.403613+02
yr3ad5xuvkzlq7oi5fncn7wwvd47vqal	NzBiNjU3ZjZmNTY2NDBiODg0ZmMwZWNhYWFlNDU4ZjY5MjZlMWIwNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1NSIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6IjhmMjkyZWU1ZWE5YjU4ZDlmZDJmMWVkYTg4NDEwZWI5YzA1OTVhYzAifQ==	2017-04-15 06:51:23.626939+02
r5ozawulubykk1ls5udkuvkq0awbyq2b	YjM2MjY3ZGIzYjUyY2FlYTM0ZTc5MGY0MzEyZjhhNzUwYTU0MzM4MDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiS3duMURUclRING1MIl19	2017-04-15 11:56:31.271093+02
kv9gmia72b82p0zohk4u71mvtvjjmnba	OWQwN2UzMTk3YTE4ZjkyMWYzZjgyMmE4MWNmNWNlOWZiMTJlMmMxYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NyIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6IjU1ODQ5YmFmYTliODQ0OGI1OWMzOTQxNDhmYWVjYzZlZjBiMGZlZDcifQ==	2017-04-17 16:05:46.462472+02
3pzlptjxe162cqk6ds2utgsr59g1rymq	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-28 15:57:11.670048+02
9j4bvek6xjiaqww1d47i5x2iiyjzy8w9	ODRjNzM2ZTA1NDgzY2NlNDNlYjFiZGZiY2RiNDI3NjJmOTcyZmRhODp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiWEZrWE9HY1oxZmpoIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiJjOTFlNGI2OS1hOGM1LTQxZDktYjc0My1hYWQ1ZWE1ZDJiNTciLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkiLCJvYXV0aF90b2tlbiI6Ijc4LS0zYzFiZDgxMS0zYTZkLTRkMTMtOTE4ZS1iZTU2YmUzMzRlZDMifX0=	2017-04-15 11:56:31.621028+02
z01pfcwz8ho696v4uwh6mvbpr1ivv0vf	NTg1N2UxYzE4OTg5MmVmMDE2MjMzNzQxMWZiNTczNWUwMzk1OGVhMjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiM2U2WG16NzBuWHZLIl19	2017-04-15 12:52:17.052045+02
4jfsrs38w8nu8s8okphdy35rfkrdm2zz	MzhmNzAyYTRmMTQwOTJkOThmMDM3YzVlN2JkYTM1NzQ0ZDk2ZGZmNjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwibm1HcUg5VXd3NURUIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiIyMjE1MWM0Yi0zMTY1LTRhNDMtOGMwYi1hZGU3NjUwMGNjZTkiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkiLCJvYXV0aF90b2tlbiI6Ijc4LS1iZmI4MjJhMC01ZmI2LTRjNjYtYjk1Ny04NzJjNTY4ODVmYjYifX0=	2017-04-15 12:52:17.152804+02
b16votrs2t6g4zu991z3e69u234lndnf	Y2I0M2JiODg2ZTBhMjY5NGJmMjI1MGVhZDI4YmZjNzU1NmQ0ODJiMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2017-04-25 17:17:26.814624+02
s2e4rob402x0dk0jjyrc3sftxcuokwop	NWNjZWMyM2QyODJlODY5MmVlODE3MDY2M2VlOWQ1N2I1MTUzYmFhYjp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI5MSIsIl9hdXRoX3VzZXJfaGFzaCI6ImJhYjg2MDdkODRiYzc3NWZjMDczZWI2NDUzMDBmMTgwNzVkOTkwNzAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-04-21 15:35:24.827871+02
bo3f3y922cqwcercykg9ozoi1a1xaebz	MDEwY2EyNTZmOTIxYzUyOGE4MDk0MWU2MTViOGFiYzAzZTE4ZGE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2OSIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6ImQ0ZDk2YmUxM2I5ZjVlM2FlNzg1YTE2NGJhNDIwOWQyZGQ2MWNlNjEifQ==	2017-04-17 18:52:35.148382+02
x6jrn5e1atbpc6si98zzellexb7ff58p	Y2ZhZGI4MGNjODdjYWM1YWI5MzFhNjkwM2VkODljNDNkZDdhNDNmYjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiaW9sazVjcUN2OW5QIl19	2017-04-25 17:53:26.577767+02
anbx09ivn64veof8h4s1zkt9ubd3d5rr	YTVmYjgzMDg1MzA5M2M1NmFiODk4MTZjNjBiMjViZTc1MjAxOTAxYzp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2xhbmd1YWdlIjoiZW4iLCJfYXV0aF91c2VyX2hhc2giOiI5NjM1YTRiMzk0MDc5NzllOTQwYjQ5NmFjNmEyNDBkN2I4Njk1N2E1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-04-20 18:57:19.683498+02
djkc6kwmixw80rrkdzkw6stm6gr6gff1	YjVjNWUzMjlmMWJhYjIzMDY0ZDI2NWFlNjY0NGY1YmQ3MDk4OGQxZjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3MSIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6Ijg2MzllODJkOGQ1YTE5NTA0NzdhODY0NmYyYjNlOWU2ZDUxZjUyODYifQ==	2017-04-18 16:38:13.67149+02
ay26q55e0ngz2a6h8d61bblpa2xh4ikl	OTVmM2ZjZmRjYTllMDcyNjk3NTMwMzlkZDRhZWVjOWUyMjYwM2RiYTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiWHphTFlZVVB1c2dsIl19	2017-04-22 14:03:32.414366+02
6losh51p4pag00y647hlszt306f0zbat	OTM0ZmNiOWI5M2FlOTYxMTdhMTAzNjczZWNmZGQwOGRjZWU2NTg2MTp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI4MCIsIl9hdXRoX3VzZXJfaGFzaCI6ImIwMTUzYzUyMjQ1ZWM1MDgzMWE4OTFiODdmZjlmYzkxMWJiOGM5ODIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-04-20 22:04:52.801659+02
14ynlnrr3e6itc8pcvy9w2kkovp38bgh	NDEyYTRmZWI4MWMyYmZjNmRhNDE5ODk3ZTFlYTc1N2JhNzliZmVlODp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiaFZKZ0FLMzlvbTZDIl19	2017-04-20 04:12:02.360789+02
bu6oymo0r1t4ruldwh8dwa9cykaamtov	Y2I0M2JiODg2ZTBhMjY5NGJmMjI1MGVhZDI4YmZjNzU1NmQ0ODJiMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2017-05-05 14:34:56.88246+02
zgb74xppzms496tdp8dki6n8bqvvwfuh	ZGUwNGNjODQ0ZGIzODRjZGI0MGJjZDA5MmViNjg2MTkxNTg4NDhiOTp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI4MiIsIl9hdXRoX3VzZXJfaGFzaCI6ImE0MjYyY2JiNDYwNjc1M2EzYWRjMDliODZmNWUyMDkwZGU3YmQ1OTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-04-21 00:02:51.492763+02
91ieuu06uhosexa5kaenjkupi7um8xds	ZmVhNzM5NWZkODczYzgwOWU4NWI4NTMyZWZmYmVjN2FlZTM0OTg0ODp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI5NiIsIl9hdXRoX3VzZXJfaGFzaCI6IjA1NzAwNGFjNzNkYThiYTBkN2NlYzYxZjhiOWJjMzg4ZjEzZTM5OTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-04-22 18:01:09.614561+02
lrpbog9op2nm5l884lgo6w8bh5dzbgp2	MWI0MGIxZDk3NzIzY2NhMzhmZTY3YzFhMGUwNTUxNmMyNTg0Yzk1OTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwid09ORjN1dHRJMUo0Il19	2017-04-23 03:04:34.457096+02
aupx6xh4s7l3n4fool2rr53g7z64s4u3	ODQ4NzQxZGExZTUxMzNjZDQwMjhlYmJmOGQ4ZWM3NzBlYjAyYjI4ZDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiZUw5VXJ6SXl5eFJyIl19	2017-04-23 16:35:25.611465+02
0gkm38yirurvitajhhfjkl5l4y9ibfan	M2ViMzU0NzhlZTM3NGJjZTQ3NmIyOWJlN2JjNzAxZTg0NDhmMDdkNTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiT0tyOFhmbDQzYUlyIl19	2017-05-03 08:05:04.986281+02
gpiyblrmst2o5jph0kfptsfl5iwbsxyu	NGE1ZWVhNTVmNTM5NzliMDBiYWU3ZjZkZGVhYzNmMzUzMjg1YTU1NDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwicHE3aHJZeHdVeXBHIl19	2017-04-24 14:52:23.332551+02
o1drf5gve3emtlqasjgtipih74ge3z7v	NTIyYTk1ZjQ5NWI1OTAzMDQ3YzVjYTNmMTZmMzM1ZTQ5NzI3YTUxNDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiNW9SNmpoSkRBRzNPIl19	2017-04-26 13:06:36.694756+02
krx293vj7htcnuttaupn0ic9fog6fq4c	OWZmNjYxMTU1MGM4ZWVmYWE3Yzk4MjA3ZmRiZGNiM2UwNGRkNzdkYjp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiIxMTEiLCJfYXV0aF91c2VyX2hhc2giOiJjMGQyYzEwYmJhZDJmODAzNmNmNzUwNTRiOGY3NGVhNTA1ZWQ5MGQxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-04-26 20:49:26.812712+02
rj7i3gh77l8zqqf56p0uoi6v8cln25c2	NTdiNDM1ODc3MDdlYjQ5ODc5NDEyMGQ4MTA4ZWU0MjY5YmNkNzJlNTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiQkg3VUxDV25aZ1lZIl19	2017-04-29 10:11:57.044844+02
wsdx0qu9ize2ga7ytqcwk586vdntdym5	NTc5NjM4NmIyMmUyNGY2MmZmOTg1MDJlZDJjYTNiOGJlMGJlNzIyZjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1NiIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6IjY4ZTE4YmM1YTBmNDQ0NjlkYWRiMWZkMDQ2YTFhY2ZlMDkxOGE0YzIifQ==	2017-04-15 14:18:38.555438+02
pbcma4ztjbxdg8iifwv45of2hvnum5ep	ZDIyOWY0ZmQ2N2QxMDhkYWI3OTdlN2RlZDkyYzg1MGVlODhiZGMxMjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwidEVxaGFDNzUwU3BCIl19	2017-04-15 20:33:22.449084+02
2znzjzvf6cli3mojuleuvrnfkwiv0s88	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-19 10:25:33.453246+02
2n3y52lfs10c81lnvmzu7k7jk3h4davz	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-12 14:12:32.708926+02
c6ja3t4kfig352ujpsgwywqzwcxs3jc3	OGIxYWYxMzYwNDhjM2NlZmIyZmE2YTNlYjQxYzVhN2M1YjJhZGQ2OTp7Im9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX3Rva2VuIjoiNzgtLWY2YzBlZGFkLTYzOWEtNDEwNi04MjRmLWJmZTY3MzJiNTlmMSIsIm9hdXRoX3Rva2VuX3NlY3JldCI6Ijc2OWUzYjM1LTRlOTktNGU3My1iZDc1LTFjZTg1ZTI5ZDRmNyIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkifSwic29jaWFsYWNjb3VudF9zdGF0ZSI6W3sicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiJ9LCJKYlpSUzRZYktmZkMiXX0=	2017-04-21 16:32:48.871521+02
aq0zy3mhgzps8nb1w8uab6jii2ulgid7	MGQwZWZiNzY0MWQyZTc1YzNmMjZkNzRmOTYwYjY3YTY5YTdjYTEyNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3MSIsIl9hdXRoX3VzZXJfaGFzaCI6Ijg2MzllODJkOGQ1YTE5NTA0NzdhODY0NmYyYjNlOWU2ZDUxZjUyODYifQ==	2017-04-20 15:29:52.760559+02
g8i9cwdlxt7qviw9fyvjylou5whw7o6x	NmEzOWNmZjJiNjhmNDQwNjNmZDZmMmU0MDUwNTQwYjFkYmU3ZjBjYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzllMDg1MTk1N2U2Yjg0NTBjZjc3ZWRmNjFjNjRhMjUyMzJhZjEzYyIsIl9hdXRoX3VzZXJfaWQiOiIxMzEifQ==	2017-05-09 12:11:35.040902+02
gyrgwhiyez0weof3df6ejuv4rsedp542	OWI2YjY4NjI5NjFkOGE4YzY1MGUyMzI0Y2Y5ZjliMGYwY2EzNzdiYjp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI5MiIsIl9hdXRoX3VzZXJfaGFzaCI6ImRiMzE1MzMzYTlhYjZjMzk5Y2Q3NWY1YjdhNTlmZjU5NmUwM2NlZGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-04-21 23:32:39.005866+02
c6efxlw9gdtbz3jpi201so1yf09jrr5o	NzcyOWQ1OWMzZWZlYzY0NDliN2ZiNzdlNmI1ZDBjOWU1Nzc5ZjllNDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiZHByNmlDUUxWeWFDIl19	2017-04-18 19:08:12.721539+02
ksqy9jmk7ne3npej5djkb11icqe98oy1	MmVjNTlhMDAyZDAwZmI1ZmUwZTExZmQyZDRkYmUyNzEzMzcwZmUwZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3MyIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6IjU0ZjI0NGE5MWQ4MzEzYWY3ODZlMzllMTVkYzUyNjdmMTVmZjJmOTIifQ==	2017-04-19 06:42:45.706086+02
d2dvlle3v3zithz2us5w2e5z5t474tvk	YTVmYjgzMDg1MzA5M2M1NmFiODk4MTZjNjBiMjViZTc1MjAxOTAxYzp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2xhbmd1YWdlIjoiZW4iLCJfYXV0aF91c2VyX2hhc2giOiI5NjM1YTRiMzk0MDc5NzllOTQwYjQ5NmFjNmEyNDBkN2I4Njk1N2E1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-04-20 18:58:44.759388+02
tu7ca51bfexkap2ssn45509305l83ds7	YWE3MTVhODg3ODdjYjQ5OTk1OGM2NGFiZTJkY2IxZTQwZjYyMThkYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3NiIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6ImRhOTEzYjk2ZTNmZjFiY2U0N2VhMTU1MDZiOWZjYWE1MmNiMzhjZjcifQ==	2017-04-19 23:18:18.369967+02
bd7jpxba2vyxtwhbaisuin2x7k6jm700	NDZlMDc0ZTM5N2YyMjkyZjFiYjIxNzM0MDA4ZDM5NzUyMjJhNjA0Yzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiNGZ2WVhXaDlKbVFFIl19	2017-04-20 05:19:47.483316+02
vz52l0vxerrvjjwg5cxrqikfxnskps9m	ODc1ZjRiYzNkOGI4NTQ3ZTMxZWFiZDE1OTQyMWRhMjRhMWQxYjU2Mjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiRDdScE5pSFJBSjdoIl19	2017-04-20 22:42:06.641166+02
4tcwfmm6mogq6d679k3gqlo8jjkw2hkm	YzM3YjlhMzE2OTYzYzVlZDY2Y2ExZThkYzc4OGU4YjExYzM2MWQ0Njp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwicko4OEJud2ltaU9KIl19	2017-04-21 00:47:18.05234+02
u1y02p4mi5uh1b410poqvzp9b4t90wub	YmFmMzQxNGQ1ZWYyYjc3OTE5MjZmOTUwNmQyYTlmODFiODE1ZTE5Mjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzMSIsIl9hdXRoX3VzZXJfaGFzaCI6ImRlOWRlZmFkMzZiYjVmOGVmOWNjMGVjYjk1ZGI0YjQ1ZDM0OTdlZjYifQ==	2017-04-20 13:56:27.087724+02
gqvbh8ffzegmt0bexsm8z4sn7qejcd7i	ZTJjNGM2OThhZjgzZmU2MmJlNWM4YjE3OWI1YWZhN2I5NjRkMzY2YTp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI5NCIsIl9hdXRoX3VzZXJfaGFzaCI6IjFjMjVhOGU2NTMzZjRhOWMyMzAxYjEzYTU1MDc4NTY4ZmUwY2ZkZDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-04-22 11:48:11.433328+02
k88dmx7lx4ugg1iap26sliyxoc6l2lot	YWU1ZjExZmE2Y2Q1N2QyNjE3OWM3YzJmMDUwMDY1MjVkY2FlNDc2Zjp7Im9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX3Rva2VuIjoiNzgtLTA4MWY2ZmE0LWY3MmMtNGYwMy04NDQxLTdkNDkwYzA0OTM0ZCIsIm9hdXRoX3Rva2VuX3NlY3JldCI6IjYwM2NlY2IwLWFlYWEtNDc1OS04ZmE1LTg1ZjU5Y2FkMjQ2NSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkifSwic29jaWFsYWNjb3VudF9zdGF0ZSI6W3sicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiJ9LCJHdWltakx4YzhVNlUiXX0=	2017-04-22 14:03:32.8527+02
ml1dzznmhgpnqara3ed25bpjmtgzozzu	M2U5N2QxNGMzNWZlMmRlNjEyNzEzYTQ5NDhjMzkyMGI2MzZhOGEwNzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiWndyZ2dzQ2RLZUtPIl19	2017-04-22 18:36:31.458415+02
oucg1gpizd3tra12hiotjrg03unig1h6	MTA4YzFlNjEwZTY0MjBiYWM3YmZhYTdjMGQ3NTJhODg0Y2U0MzA2MDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiMmlTdDE1SzZ4eW5wIl19	2017-04-23 17:43:44.744305+02
3mtjln6mhdhdt3je1m9jo1dw47ffaj6d	ZmQ0MmZiMWFhYzRmMGI1MTI4ZWEzZjU3NThlOTAxYmRmYTlkOWIwODp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI4NCIsIl9hdXRoX3VzZXJfaGFzaCI6ImUwZDFiY2VjMzkwZmQ0NDgxYjNhZmFiMWJkNGMzNTM0ODlhNDY5ODQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-04-21 13:17:27.36764+02
rroflt82xh3j02hqzn0kr5evbvmb9cb4	Y2RlMTk0N2I5NjUyYTQxNzdkMDFkMjhkYzhjMzRkMTI0YmQyZWZiODp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI4NyIsIl9hdXRoX3VzZXJfaGFzaCI6IjEzYjUxNTI3MTUyODA0ODUzNDg2NTc2ZGVjOWFlMTI5YmY4NGIzMTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-04-21 14:46:40.86551+02
xs8nvakdh98f9ra82i3awra2oyklj1u8	N2Q1MjIwYjA2OTc1MjdmMDNjMGI0YjJjYmE0NWNhYWRlMGZmNmM1YTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2xhbmd1YWdlIjoiZXMiLCJfYXV0aF91c2VyX2hhc2giOiJkM2ZhNWM5ZWQ0MTZmMDU0MzlhZDVhNDBmNzU4NDM4Yjk1OWE0YmYzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-04-27 10:10:43.178801+02
ao29wkwqux1ndo3cp413b6bseuqyt3oz	MGFmN2U3N2QxNWZmNWU1YzNhYTExODY0M2E5Mjc2OWRhOGMyMDNjYzp7Il9hdXRoX3VzZXJfaWQiOiIxMDYiLCJfYXV0aF91c2VyX2hhc2giOiJhYzk0MzBmNzBmYmNjZDM3M2Q2OTMyM2UxN2E2YjgyZjIwN2Q1ZGJmIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-04-25 11:44:44.719153+02
8y1tsm67mowrouwxh0lkyzpgy3izt6rh	ZjUyZjRmMDM1MmE3YjczZmRhMzMwZDlhNGE0NTM2MTg1ODA0ZjNlNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1OCIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6Ijk3YmQwY2M5NzA2MjBiOWY1MTIzODhmYTYzOGFkM2ZkZGYwZmFjNzcifQ==	2017-04-15 22:12:48.517599+02
roer7g5h5ymlm6slbk2rh6uenprhrib9	YmY4M2E0ZTcwNmJlNTcwYmQ0NTZjNDQ5MzFkZDdmYWYwZWYwNTkwMTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3MCIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6Ijc2ZTMwNDU1YzkxMTdiMGVjODZjZGU1MjRiOTdiYjk2ZDIwZTM0ODkifQ==	2017-04-17 20:55:28.98069+02
d2yo0hkar5uku9uq62pmi14psw4tisd0	MTIzZjJiMWUxY2M1NDA4NmU4MjFmYmZiYmZiMmY2MTdmODM0OGFjOTp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sImNhcnQiOiJndWVzdDE1MiJ9	2017-08-09 16:16:17.249937+02
jabttgueypfjdzxwtqox9kjfejkvt6wk	MjZhMDc3NGY0YzIyN2E0ZjQ4MTNlOTIxZWIxMzhiMDQ3MTY5M2UzYTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwicmZqR0tkOU1rOVZpIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiI1YWI0MjVkNy1mMjIxLTRmZTEtYWZiOC1jNThlYzZmZWVkNjgiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkiLCJvYXV0aF90b2tlbiI6Ijc4LS0xYzU5MTZkYi0yMTQ4LTRkNzYtYTcwOC05NDQxZWQzODM1OTMifX0=	2017-04-15 23:17:29.072661+02
u5zn5k6z7om9x0npmro17r6whfig46d0	MDgxMDBiNWQ2MDhkZjlkNzM4ZWFiMjVmM2ZkOGEwNjU5NTIyMTkzZDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwieFR2bVRoNWkyWjVWIl19	2017-04-16 06:05:58.843279+02
cdwmgp50dy7s1y8edotvlj1gnbmdjc1g	YjY0ZTZjNmUxMzQyMGY0ZGRkZDQ1NjQyZDkwY2VmODUxYzc4MDg0ZDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiVU5wZklVbGFsd0FjIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiI3NTg2YzA1MC05NGRlLTQ4ZjAtYjUyNi1iMzYxYWY0MzIwM2IiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkiLCJvYXV0aF90b2tlbiI6Ijc4LS1iOTlmODA5NC0wZWEzLTRhYTAtYWJiZi1lOGMxYjBjZjg5NzYifX0=	2017-04-16 06:05:59.614698+02
49mbtom35x0qjtjxsm8pu54u0haxq5c5	YWI3OGE5MzIyZWY2MzI3ZGFlY2ZiNGUwYTZjMDUxYzJlMzU0MjU5ODp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiS0tIcUxJU3Rua0x5Il0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiI0ZGRmZWU3ZS05MWVlLTQ2ZTktOTUxMS1mNTQzM2M0YTgzMmQiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkiLCJvYXV0aF90b2tlbiI6Ijc4LS00ZjU1MDlmNS05NTk1LTQ0ZmUtYmJlZS1jOTM5YmM4OWFiNmEifX0=	2017-04-16 10:34:34.151715+02
9tz7fmg1ud9nartczzms7s97k1yyvfmm	MzlkMzI0MGIyNDIzODQxODNiZWVlMDVjZTI5ZDU3ZTQ2NmMwNzkwMjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiU3JjVm8yamJLMkFNIl19	2017-04-16 10:42:48.439402+02
j2r08wm4j6ibnwpiglmiwlhzlabkcb0r	N2E0MzJmYjllYWI0ZDI0YzJjMDMyZGZmZDMzYmI2MzBiYzRkNWYwYTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiZFBPRjhFMDVNZUtEIl19	2017-04-20 19:11:41.895459+02
65qg28ojlogc7lgqqn4g2ur5swghm1dr	ZjdlYWZlZDQ0MDg3M2IwYWY5NjlkMzEyM2Q0MjBiYWI4ODk0NWU4Mzp7Il9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjE0IiwiX2F1dGhfdXNlcl9oYXNoIjoiZTMyZGFmYWQzMTgzMDhiMjhjMjVkMTY3MWE0MWM4YzYwMDdlYmY0MiJ9	2017-04-16 11:04:51.39298+02
ajhkd7dz7k6fudaea1i76plgb5129p5u	Y2I0M2JiODg2ZTBhMjY5NGJmMjI1MGVhZDI4YmZjNzU1NmQ0ODJiMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2017-04-20 12:10:58.577531+02
7d3uu9wjgcxgkmw1odlbe3cmwcz25ifv	ZWFhOWNlYzYyNTBlZGRmMDgwMjdhNjdhNWU4NmY2NDYwNjc1MDg3MTp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6ImU0YzE2NDcyNDVjMzdhYmJlMTYyNGNmOTE0YTBkOTUzOWI3NTliZjgiLCJvYXV0aF9hcGkubGlua2VkaW4uY29tX3JlcXVlc3RfdG9rZW4iOnsib2F1dGhfdG9rZW5fc2VjcmV0IjoiNTgyOTM2ZjItNDRiNS00YTUzLThjZGYtZjM4ZjExNjYxN2NjIiwieG9hdXRoX3JlcXVlc3RfYXV0aF91cmwiOiJodHRwczovL2FwaS5saW5rZWRpbi5jb20vdWFzL29hdXRoL2F1dGhvcml6ZSIsIm9hdXRoX3Rva2VuIjoiNzgtLTQxYWU0OTA1LTA2ZjMtNDk2NS05MWRhLWY4MDMxZTU3ODM1OCIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkiLCJvYXV0aF9jYWxsYmFja19jb25maXJtZWQiOiJ0cnVlIn0sIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1OSIsIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fYWNjZXNzX3Rva2VuIjp7Im9hdXRoX3Rva2VuX3NlY3JldCI6ImVlMDZhN2FmLWI2NTEtNGZjNy05YTU4LWRkZWVlZjE4YTk0MCIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1MTgzOTk4Iiwib2F1dGhfYXV0aG9yaXphdGlvbl9leHBpcmVzX2luIjoiNTE4Mzk5OCIsIm9hdXRoX3Rva2VuIjoiYWFmYjZkMDItMmE5MC00MjRiLWJhNGMtZTllYjc5ZjI3MjBkIn19	2017-04-16 11:10:48.771944+02
f6br8vgpvyldbuphu8v5gsnw9xqbngs2	OWQyYzc5YjU4MmY4NWZhYWQ2MDI1NGI0NmNiZDE4ZTI5NDM2OWIxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2MCIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6IjdkODg2MzlkYzA1YmE5NGE2MDVhMzNlMjQyMWFkZDhjZGZkMjA1MjcifQ==	2017-04-16 11:25:56.230187+02
7pz6tcd81imdbak28910ppi9wu513a7e	M2Q3ZWMzYjZmYzc5ODNhNDYyZTJhZjM3NDk0ZWYzMGRiZGM4YjM1ODp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiOEVBZENOQTd3VGJmIl19	2017-04-16 13:00:06.240288+02
bbcc12vodu9oraxvgj6icopehmdhltd9	YjM0ZjcwZTMyZDE5ZDk3NTVjMGRiNGJhMGZiNmMxNTAwZWMxMzkyOTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwibmtjTmxEYXRiSnZ6Il19	2017-04-16 14:15:35.686773+02
jq4h2x1wbcoykbvwdoi90m6uhtur7qch	YTFhNDM4NDczY2U1YWZmYmVjMGEyOWFjNmYzMjdmNGU0OTgzYjMxNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2MiIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6IjVkYzg0ZDIwMWI0YzBiMTlmNzFiZjg2MDcyMmJiYjlmZTFiZWFhNWMifQ==	2017-04-16 15:53:21.114769+02
u3erj7rhf01po6g38ivqkc31jblfw6ng	ZTg3ZWZjN2Q3NTE0MzRlOTlhMTIyMjI3MjE3NjNhZWY5NDQzYmYxODp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiTGJTbVpENU9Za1ZzIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiIyM2YwYjkwNS01ODRjLTQ0MTYtYWE0My00MGUxY2VlMTgxNTIiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkiLCJvYXV0aF90b2tlbiI6Ijc4LS1hODE4MGVlYi0yY2RmLTRhOGUtODZiZC02YTRjY2Y1YjUzNTMifX0=	2017-04-16 19:49:56.078651+02
kmf2w89uh2najwwf8cg8ubv3i0emgg9t	M2M5OTU3ZTlkMDdmZmI3MzE5NGY4OTI5Yjg1NzFlNmYzOWFhNTEwOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2MyIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6IjRjOGIzZmMzNWUyYzI5M2ZmMGMwZWEzNjcwYWMxYjE4MzEyYzAxNTEifQ==	2017-04-16 23:45:52.457749+02
pskf80bsz5e0ulr1hngfmn2yrpcieqix	Y2Q1ZjQ4NTA2Yjc2OTVkMWEzYzBmMDllYTQxM2JhNzM1MzZiODgwMDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiVjBTeFh3cjJuT2Q1Il0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiJhOGRhYjdiZC1jMDI0LTRkNWItYjhiZS1iYWNhMWJlOWQ2OTUiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkiLCJvYXV0aF90b2tlbiI6Ijc4LS0wYjI2NGZkYS0wYTYxLTQxOGItOGEwYS1mNGRhZmM2MjZmZGUifX0=	2017-04-16 23:49:00.186945+02
9bwogpdhzcvuf2a00r7sn42bc5gh78lm	Nzg3OGE0NDUzYzFkYjA3Y2E0YzhlNDVkN2U5MDIwMDNkMDVkZWE2Nzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiVTIwdkJGeWNhNWhhIl19	2017-04-17 05:18:10.230789+02
gqahpl2u7gkp00qtiln226vqlag04g80	ZmVjMDIzYThjNjQ3ZjIyZWY4MGFhZWM5ZmYyNDIzYTQwNjZiMzA3Yjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiRUh1aVI4Mmt3Sm1GIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiI2NDJkZWU5Ni1lYjc0LTQ5MDctODE2OC0xNmYzMDg1YzhlOGEiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkiLCJvYXV0aF90b2tlbiI6Ijc4LS04ZjA4YzM4Yy04YjA0LTRkNjMtYTU3OC02ZDllYmM1ZGI1YjMifX0=	2017-04-17 05:18:10.966831+02
42qqvt1l138p9mh053k2z6o8htr7vya9	ZDZkNzFhMzgxM2NlMjY1YjY3Y2YzYjAyZTZkNGJkZmNkZWU3ZTFmNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NCIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6ImNiMTgzYTFmOTAzZmJkODM4MmQ1ZGMyZWI5OWJkZTQ2ZmJhODk2NTAifQ==	2017-04-17 11:24:41.633771+02
hxdssr72yhl2abpj91fjimz6udu4sb9i	NTJlZWQyNGU2ODUyMGJlNDU2YTUwMzQxYTc5NmQ3NGU5NmYwNWRmZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiMklFbzJSSXptZTZtIl19	2017-04-21 18:44:26.300327+02
tr0hshq2puja45l1qg3x43h5jstzksm4	NDYzNGFhYzI0MjdlMmRjNjg4NTM3MzFmMmRjYmUwMGE3MGE2NTFiMzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NSIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6IjllYjYwNDBlYzRmOWNjYzdhZjVmYmVmOWViODgxNDc1YWIzNWRhMDMifQ==	2017-04-17 12:20:13.091467+02
f66sbckekrqrwu7d2q09wc5e0oix7xxc	YjUxMjhiNmFlMWVjMTkzYzIzNTNlZjk0ZjEzMmQzMDQ4ODVmNTFmODp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiTTAwc21ieGltY2s1Il0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiIyNjNjNGQ4ZS0wODZiLTQ0ZDUtYThjOS02MjE0MWIzOGZlOGYiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkiLCJvYXV0aF90b2tlbiI6Ijc4LS1hZDg5NjBhMi04OTU5LTRkYjAtOGJlNy0zYzAzYmZhMzJjYWQifX0=	2017-04-18 19:49:56.43525+02
6dlbdj7c2qe26y15gybga7cbmb3ybtj7	MGQwZWZiNzY0MWQyZTc1YzNmMjZkNzRmOTYwYjY3YTY5YTdjYTEyNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3MSIsIl9hdXRoX3VzZXJfaGFzaCI6Ijg2MzllODJkOGQ1YTE5NTA0NzdhODY0NmYyYjNlOWU2ZDUxZjUyODYifQ==	2017-04-20 15:34:59.058484+02
cuc96jhlqneeaw03l04vawi3k9eto47h	Y2I0M2JiODg2ZTBhMjY5NGJmMjI1MGVhZDI4YmZjNzU1NmQ0ODJiMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2017-05-24 15:58:49.85167+02
92uh8hdp53fw8k28k2q5qs9aii6x3irc	Yjg2NzZhYWZmNzg1YWNlMGM4MzAzN2I3Y2Y4N2YyMWVhYWRlYmI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3NCIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6IjJhZTlkY2Y0MGVmZjE4YzRjYTI0ZTVlZDEyZGFkZWRlNWY3YTA3ZDAifQ==	2017-04-19 10:32:47.432644+02
jtjdgnmsb1ktadunyx5hjpx1wvagetny	NWYxOWRjZTVhNmQ2OGY1OWQwY2YxZjI0MGYxMGZiYTk4ZTE0ZDEyMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3NyIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6IjczNDhkYTAyNmMxYmM2YjQxZWExZmYyYzcyMjEyMGM1Y2JjMzcyNzMifQ==	2017-04-20 00:01:02.818346+02
n5i8oq3r1otra959olol85sucnqbsr9s	NGM2NDBjNWNlOTg5YTAyYjhiNWQxNzAyNWRiYzUzYmI2MjE5MTk5Mjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiaGJ3MHZzR3JjZXFRIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiJkMzljMjQxOC04Mzc4LTRkZDUtYjNhNy1kM2RiMGRjYmQ5MmQiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkiLCJvYXV0aF90b2tlbiI6Ijc4LS1hMWQ4NGJmOC02Y2JiLTRlZDAtYTFmYi03Mjk5NGE5YTk5ZjEifX0=	2017-04-20 05:19:47.836975+02
yqksko007uisv2zr4dpuz31rqai85awq	N2MyNmVjMWQ4NzAyY2QxMDI1MmZhMjI5YzUyNzU3MTRjZjQzYWUyNDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwidGFpcFpiTEdYVXRDIl19	2017-04-20 12:32:30.844345+02
ojmge4l5iffbd3q44bk3pt102epd1zla	NTA5NDMyNTQ3ZWJlM2FiMzIwNzQ2ZmJkOTMxZTU1ZGU2ZDgzMjk1Yzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiQktDdUhoUVBzcDluIl19	2017-04-20 19:37:16.575883+02
f0slmzi3pdyk60fih15pxu2lxdms4xz8	MmM1ZjUwMjM3NTIxYWI3MWRhYjEwMDJmMjU0Y2M3NWM3NDdlNTVkYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3OCIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6IjYwNTBlZDJkNzczYjE3ODFkOWM3M2FjYmRiNzFhNGFhNmExZDY4OTQifQ==	2017-04-20 14:00:27.412017+02
9591elz9khbmpxpna88gc5qote6l55z4	YTVmYjgzMDg1MzA5M2M1NmFiODk4MTZjNjBiMjViZTc1MjAxOTAxYzp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2xhbmd1YWdlIjoiZW4iLCJfYXV0aF91c2VyX2hhc2giOiI5NjM1YTRiMzk0MDc5NzllOTQwYjQ5NmFjNmEyNDBkN2I4Njk1N2E1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-04-20 22:49:14.969974+02
wm6ex2idcne8v7qwcksjvhdbipnpgitc	MDEyMjM4MWM3MDk4OTdjZjExM2M3OTViYzQ3ZmRmMTRiMzk0YmIzYzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiS2VLM25OaXQ2NlpvIl19	2017-04-21 06:05:57.671066+02
otd3vhoznalcgkp0m4ukzht79u8fs39k	OWQ4MGMzMTdhOTg3YWYzMDU0MjFiMjNkYmJjOTBjZGRmMDQ3YTQxMjp7Im9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX3Rva2VuIjoiNzgtLTQ1MGJkYjNlLTY1ZGYtNDdlNC04MTg2LWMxNjRiOTBjMGNjMSIsIm9hdXRoX3Rva2VuX3NlY3JldCI6IjQ3OTcyZTA5LTU4NDUtNDc0My04YjJmLWVhZDFhY2ViYzIyMyIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkifSwic29jaWFsYWNjb3VudF9zdGF0ZSI6W3sicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiJ9LCJLdEJGeHBTSFROQ2EiXX0=	2017-04-21 14:33:19.639582+02
jwh20plrjdfl7x3il94z7onmph8dc2vu	ZWNiYzg3NDlhMTdkMTg4NmY5YjhjYzI3YTA5NDE5YzkxMjA0ODRmOTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiS3EzUHpCY2p0YmlyIl19	2017-04-26 11:04:23.511358+02
ujd1dw2o43zocsf26ijfvdez97qetyui	NWExZWJkZjg4NGE3NWJiMWEzZTlkYmQzY2QzZjdlZTYyYzdlODY5Mjp7Im9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX3Rva2VuIjoiNzgtLTFhMjJmNzM1LTBkOWUtNDNiOS1hMTAyLThkODYxNjg2MTM4MSIsIm9hdXRoX3Rva2VuX3NlY3JldCI6ImFmMTEyMGQ4LWM4NWUtNDVjNS1hMjMxLTg2Mjc1NmUwMTI4MyIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkifSwic29jaWFsYWNjb3VudF9zdGF0ZSI6W3sicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiJ9LCJzR1RXVDF1TWFHbGQiXX0=	2017-04-26 13:06:39.001196+02
pk8kxkqgply4q7ucr1mdjcyqavku0lwz	NWNkZDk4Mzg3N2FmOGQyMzM4NDYyZjgwMDc2OGE0NzY0NWZkZTRjZjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiM09kd1VDM2xrNlFVIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiIxZjg5YjU4NC0xMTk4LTRmODQtOGZhOC01MmJmMzk5NTk0YTAiLCJvYXV0aF90b2tlbiI6Ijc4LS0wNzBhZjgyMy00NGYwLTQ3NDAtOTc4Zi1kMjBjMGE5MzJjYjMiLCJvYXV0aF9leHBpcmVzX2luIjoiNTk5Iiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsInhvYXV0aF9yZXF1ZXN0X2F1dGhfdXJsIjoiaHR0cHM6Ly9hcGkubGlua2VkaW4uY29tL3Vhcy9vYXV0aC9hdXRob3JpemUifX0=	2017-04-30 17:50:26.694078+02
a8ehd6wgea33zkwmjnw8exsfx3ulpwbb	MTdmZWVhODNjZDYyMTU4YzE2YjFiZDE4YWMxMWQyNDRlMTE5ODAzMDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiZlNuMGo0dWV1eFdzIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiJjNjk1ZWJiYy04ZTI4LTQ5OTYtYmRkMS02MGY4NWJmYzEwZGYiLCJvYXV0aF90b2tlbiI6Ijc3LS0yNzg0Y2VmZC02OWE3LTQ3M2UtYWZjMS1iMTQzYzY3Y2I2NjEiLCJvYXV0aF9leHBpcmVzX2luIjoiNTk5Iiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsInhvYXV0aF9yZXF1ZXN0X2F1dGhfdXJsIjoiaHR0cHM6Ly9hcGkubGlua2VkaW4uY29tL3Vhcy9vYXV0aC9hdXRob3JpemUifX0=	2017-05-02 01:17:32.272353+02
jtstq0u5y91rh1uo7if0xy0w1z93mzex	MDliOWU2YzFjNTU4Y2MwNDQ3YTkzZTVmOTA4ZTc5YzQ5Njc4NjcxNzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiMGRHcEtGcWlNTUplIl19	2017-05-21 13:12:55.920192+02
0f0bld639vytlbytxsysb9x76rr65j9j	OTY3MGEzMTFkZGFjMjA4NzhlYTVlNGUyMGQ4NWI1MDYyNjg4NjYzNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjcwZWViNmFlMDdiNGZlYWI0NWVkMTg1OTdlYTAzOGYwY2IyOWEzNGYiLCJfYXV0aF91c2VyX2lkIjoiMzcifQ==	2017-05-10 11:30:15.503374+02
gphwmglcl92bky8zb74qd2qjyeuvcwny	ZWQ0ZTg3NzhjZTllODM3NzI5Y2ZkZGM1NzJmNThjNGZhNjliMjJmZjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsImF1dGhfcGFyYW1zIjoiIiwic2NvcGUiOiIifSwiZmJZVkVROWx6cnB5Il19	2017-05-05 21:52:20.821336+02
bfrxzbji9vzqex98mxufukeyp4ogno9b	NDdmZmIyNmM3MDdlYzdlZDJmOTE3ZmVjYjVhNzEzNzIxMjI5OTVkZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwia0JoaHFvN0RsSW5pIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiIxN2I2NWFjYy1jMjI2LTRjODEtODA0OC1mNjNmZmFjZmEyZDgiLCJvYXV0aF90b2tlbiI6Ijc4LS03ZDc3OTMwMS0yZDA1LTQ4MDYtOTFmNS0xYjQxNzMwYjk3OWQiLCJvYXV0aF9leHBpcmVzX2luIjoiNTk5Iiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsInhvYXV0aF9yZXF1ZXN0X2F1dGhfdXJsIjoiaHR0cHM6Ly9hcGkubGlua2VkaW4uY29tL3Vhcy9vYXV0aC9hdXRob3JpemUifX0=	2017-05-03 08:05:05.384393+02
mz2q4xt89ayq3fw7q7alzdx1ch7nec0m	NjVhOWJmNzNiNTUyZDlmNTI0YmEzYWU1MTEyNTFiZGZiOGFhM2ZlNzp7Il9sYW5ndWFnZSI6ImVzIn0=	2017-05-03 13:16:12.444171+02
z1rhqeiwen2hsninoym4z4dr82uyjhrm	MTBmOGMzNmY3NTg1YWU1YjQ5MDliNTQ4MjQ3NjljZGI2NGI0ZTZkNTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJwcm9jZXNzIjoibG9naW4ifSwiYnBQcnpDc04zajREIl19	2017-05-07 02:02:27.566954+02
vjfp55d9fz3c1zi51qqvah75ziyne8ik	NzU5NTllMmMzMzRhMjE2YThmODRhYjNjYWYyZjQ4M2FkMTJkMmViZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImU2NjUxMDE0YTRhMGUxNWZmOGRhZDc3MTI1MGFmZWNlYTc0ZjU1M2MiLCJfbGFuZ3VhZ2UiOiJlcyIsIl9hdXRoX3VzZXJfaWQiOiIxMjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-05-04 12:00:27.894523+02
thmstmn3uef3t5mz0a229fvs291lar24	YmMwMWE2NWY5MmRkNWViMGRhY2JjMmZmODkyMGZkYmY4NjIzYWQ2NTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ODczYjE4NzEyN2Y3NGM2ZjQ0ZjU0YzdjMzZmZGNiZTQzYzc5MzYiLCJfbGFuZ3VhZ2UiOiJlcyIsIl9hdXRoX3VzZXJfaWQiOiIxMjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-05-04 12:04:19.755695+02
5szrrrc48vl7ce5qmhmirqhsa6vttnaw	ODE0NGNmMGIxMTI1YmM4NWUwZjU1NTA5OTgwYmI5MWRjODM3ZDdiNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5Mzc4NThlMGEwYTRmZDdiYzYyMzlmYWM3OGFjMWZiNmNjMWIyYzMiLCJfbGFuZ3VhZ2UiOiJlcyIsIl9hdXRoX3VzZXJfaWQiOiIxMjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-05-04 12:04:26.541563+02
a8h790qdugzu33us8das6sxhf503he0y	NTRmNGE3ODJkMjgyMTJiNGI1ZWQ0ZDI4YjJhNWJjMzA2NDgzZjFiZTp7Il9hdXRoX3VzZXJfaWQiOiIxMjgiLCJfbGFuZ3VhZ2UiOiJlbiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImEzY2MzMTBlMzdlYWZkN2JhNDViNmQzYzg4NmQ1MGQ4YzJkMmM5NjQifQ==	2017-05-08 11:08:01.086238+02
inm81vdl9lgkuo7cx5dj9s8ivjzxntic	OTViNGUwMjFmMDBiNjc5YmJhMmEzMWFjNTRjZTU0ZmY5NGM5OTFkNTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ5ODM2NDI4ZGIxNzRmYWJhOWQwOTgzMDEzZjlmZmQ1MzZmMTEwNmEiLCJfbGFuZ3VhZ2UiOiJlcyIsIl9hdXRoX3VzZXJfaWQiOiIxMjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-05-04 12:08:41.78489+02
7gx1d82juauh45im4f0wjxzoaokx6ukg	NWMzNDg4MDVmNTQ2NTlhOWIwZjNkYmIyZmU5NmJhY2FkZTRmM2NlYjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiTDJMQW5zOHFIYlprIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiI1MzBkMzMwMS05OGFlLTQ4MTYtOTJkNy03M2MyYmMwYmM2ZGIiLCJvYXV0aF90b2tlbiI6Ijc4LS0zZjc5M2UzNS1lNjZjLTQ1Y2YtOTY5NC00YzlkYzBiMDQzYjMiLCJvYXV0aF9leHBpcmVzX2luIjoiNTk5Iiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsInhvYXV0aF9yZXF1ZXN0X2F1dGhfdXJsIjoiaHR0cHM6Ly9hcGkubGlua2VkaW4uY29tL3Vhcy9vYXV0aC9hdXRob3JpemUifX0=	2017-05-04 12:26:45.333118+02
myr2gwdgs2fdl3ukutie5zzg5ndqv9yj	ZDkxYTNmMTZjNTFlNjA3OWEyZGM5NjdkMjlhN2ExM2Q4OGI5NDQzYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImNlYjdlYmQ4ZDVjNGY2MTJhYTA4MjQzZmY1ZTEyODk4NmEzNjgyNmEiLCJfbGFuZ3VhZ2UiOiJlcyIsIl9hdXRoX3VzZXJfaWQiOiIxMjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-05-04 15:04:48.939918+02
dokslfew450l0a4958gcorfeusbvevzc	MGRlZThlMDgzNGRiNjU3MzY3Nzc2ZmYxMzNlOWY5ODI2MWVkYWZmYzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiZDNySlpOemtCenVBIl19	2017-05-04 15:04:51.117187+02
ax64insujhkhqllmyy4j8qqh78owwwua	ZmZhMTIwNWNkMzRjNjJiNGI0NDJmYTA2YjM0NTkyYjk1MWExOWQ5Nzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwidmV2Z2pBamFObVJ6Il0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiIxMjUzMzM0Yi1jYTQ3LTQwYjItYTYyMy1kZGVhN2FkMzMxYmEiLCJvYXV0aF90b2tlbiI6Ijc4LS05ZjU0YjY1Yi04ZGU0LTRhMGEtODA2YS1iYzRjZTdjYzllZGQiLCJvYXV0aF9leHBpcmVzX2luIjoiNTk5Iiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsInhvYXV0aF9yZXF1ZXN0X2F1dGhfdXJsIjoiaHR0cHM6Ly9hcGkubGlua2VkaW4uY29tL3Vhcy9vYXV0aC9hdXRob3JpemUifX0=	2017-05-04 15:04:51.829656+02
xs602f4q4nt3wk3t704u3zwjo9kyqht3	ZmJjNDM3NTgxZDIxMjhkZTg2ZjBmNGMwYjk5OWFkZDE5YWUwYTQyMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImNjODE1YTc0NGU0ZDk5NzEyZTA0NGY1ZjQ4ZDcyZGY1MWQ3M2RiZmMiLCJfbGFuZ3VhZ2UiOiJlbiIsIl9hdXRoX3VzZXJfaWQiOiIxMTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-05-05 10:44:36.389629+02
ciyfufoplr1sabrzi30wibneberlzkz1	ZjgzZGQ2NjRjZGQyZGY5ZDhlMmM0NzA5NTZlOGFmZjBmNzE5ZGZjMTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk2MzVhNGIzOTQwNzk3OWU5NDBiNDk2YWM2YTI0MGQ3Yjg2OTU3YTUiLCJfbGFuZ3VhZ2UiOiJlbiIsIl9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-05-05 11:02:57.157821+02
myzn5bt6yz2auqmmuhr79qqccpe2fu7z	ZjljODgwZjk5OTYyODAzZTkxNDRjMWMwODIyZWE1YmVmNzkyZmJhOTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiUHZaZzEwRm1XZTZSIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiIyNTQyNTJkMy1kNzc4LTRiZjYtOGNmOC1lZTRhN2RhMTkxZmYiLCJvYXV0aF90b2tlbiI6Ijc4LS03YzVhZjM2NS00ZjllLTQ2OWUtOWM5Ni1jM2RiNjlhMjRmM2UiLCJvYXV0aF9leHBpcmVzX2luIjoiNTk5Iiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsInhvYXV0aF9yZXF1ZXN0X2F1dGhfdXJsIjoiaHR0cHM6Ly9hcGkubGlua2VkaW4uY29tL3Vhcy9vYXV0aC9hdXRob3JpemUifX0=	2017-05-05 09:04:28.959932+02
f17zyrvt13l7a5ax9xw5z91xhuvydo1x	MjIxNGUzNDAyY2Y2NTU2MjgzYTVkMjZhNzJkY2Q2ZGU0ZDVhODQ0Mjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTNjYzMxMGUzN2VhZmQ3YmE0NWI2ZDNjODg2ZDUwZDhjMmQyYzk2NCIsIl9hdXRoX3VzZXJfaWQiOiIxMjgifQ==	2017-05-09 15:10:25.183668+02
5m5i7kys0yp2mhb7f7jmi42ybrj6kp2d	NzUwNzE0Yjk5MTY2YjE5OWVjYzE2Njk0ZGZhZmM2YjFhMjhmYTUyODp7Il9hdXRoX3VzZXJfaGFzaCI6IjcwZWViNmFlMDdiNGZlYWI0NWVkMTg1OTdlYTAzOGYwY2IyOWEzNGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiIsIl9hdXRoX3VzZXJfaWQiOiIzNyJ9	2017-05-05 14:42:17.149494+02
e85eae2dt6fl41mme66tahylicv6jix1	MjhlNmJhYTY1Mzk2OGQzNDEyYWNiN2VhZWQ5ZjJkYWRhZDdhODFkZjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9sYW5ndWFnZSI6ImVzIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzBlZWI2YWUwN2I0ZmVhYjQ1ZWQxODU5N2VhMDM4ZjBjYjI5YTM0ZiIsIl9hdXRoX3VzZXJfaWQiOiIzNyJ9	2017-05-09 17:08:50.197001+02
smtur11n5jh18bjejc6p2a0uyqb1rpt7	ZTE0NTI2ZjE4YzVkNjM2NjJlYTBjMGVjNmE4ZTEzNzUxZTk0ZTkwZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiWWQxbVhIcWlHaGV2Il19	2017-06-01 13:25:12.716162+02
o78yjfsq8ti7fx46jm077fgjm56f3i92	MzgzYjg0ODFmNjA0YjYwMjBjNTU2ZmJmZTI4MDZlNzRjODkwMjljOTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzZmE1YzllZDQxNmYwNTQzOWFkNWE0MGY3NTg0MzhiOTU5YTRiZjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9sYW5ndWFnZSI6ImVzIn0=	2017-05-05 15:11:19.77171+02
21nvm87iwaqyfnz6f0pchw2g9yacm0il	ZDYyNGNhN2NkNDFhNGRmMTk0ZmI4MmRiNGU5OWUwNDNhMDA1OWFkMTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiSWtWeHF4ZFI1b3ZjIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiIwYWQzNzU4ZC0xMjQ1LTRkMzgtOTBmZS1mNjMwOTMxMDQxYTAiLCJvYXV0aF90b2tlbiI6Ijc4LS0xOTMxZjExYi02MGY2LTRlZWItOGNkMy05ZmIxMDZkNWExYWQiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkifX0=	2017-05-09 22:15:43.180362+02
8nkdzieq7sle4ujmrwatvs4lc8szu4g4	NmM5NzYyOTFlZWE0NDc5ZjczMTNjYWYyMGVjNGMwMmJmY2M4YTg4NDp7Im9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbiI6Ijc4LS1jN2E5MjlhMC1iM2RjLTRhNjEtYWY1Zi1lODhlNWYyM2ExNjYiLCJvYXV0aF9leHBpcmVzX2luIjoiNTk5IiwieG9hdXRoX3JlcXVlc3RfYXV0aF91cmwiOiJodHRwczovL2FwaS5saW5rZWRpbi5jb20vdWFzL29hdXRoL2F1dGhvcml6ZSIsIm9hdXRoX3Rva2VuX3NlY3JldCI6ImIyZjg3Zjk4LTU5MjUtNDQ3Ny04YzI0LTJkMWMzMWVkZDkwMCIsIm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZCI6InRydWUifSwic29jaWFsYWNjb3VudF9zdGF0ZSI6W3sicHJvY2VzcyI6ImxvZ2luIiwiYXV0aF9wYXJhbXMiOiIiLCJzY29wZSI6IiJ9LCIycTJ6c1k5c2hFTjAiXX0=	2017-05-05 21:52:21.1529+02
witlhu3x90q5ft7rtreowii67z4cg1xr	OTg2N2ZmNzU5YjdlNmFjYzYyOTJlYmY3ZTA0N2VjNDQ4NThmMzllZDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiVld5NFNYYnVTUEowIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiJjMmMyZTgyMi0xMTk3LTQzMTYtYTA2ZS01MzRlYzM2Zjk1ZTIiLCJvYXV0aF90b2tlbiI6Ijc4LS04M2JmNzRkYi04NjIzLTQ1MmUtYWRhYS1hYTFiYTY2ZTA3ZTkiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkifX0=	2017-05-09 22:31:34.085972+02
r6yn6bjeuc566y3xuwboxpx2g06pch43	YjRmZGYwNmQ4NWRhZmJiMjkyYTQ1YmVhODIxYWY3MzIwZmNlYmM4YTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJwcm9jZXNzIjoibG9naW4ifSwieDlOZWNobU9NYzYwIl19	2017-05-07 01:52:10.262343+02
by0qz6yjsku6t4onnce8wm0ob5asq6jl	ZGJmM2IyMzRkYjFmNjA2ZDU2NjA2NjZmZGJkNThmYTY2MDU5YTMzZDp7Im9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbiI6Ijc4LS0wMWYxZTk3Mi0xMzE4LTRlMzEtYjk5Mi03NWY2YWVjMjM1MzEiLCJvYXV0aF9leHBpcmVzX2luIjoiNTk5Iiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX3Rva2VuX3NlY3JldCI6IjExOWNmMGMyLWYyOWItNGE0Mi1hMjRmLWE5OTk0MTY3OGY0YiIsInhvYXV0aF9yZXF1ZXN0X2F1dGhfdXJsIjoiaHR0cHM6Ly9hcGkubGlua2VkaW4uY29tL3Vhcy9vYXV0aC9hdXRob3JpemUifSwic29jaWFsYWNjb3VudF9zdGF0ZSI6W3sic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiIsInByb2Nlc3MiOiJsb2dpbiJ9LCJFWUZGS3gxd1dLMEoiXX0=	2017-05-07 02:02:27.886068+02
sox0r4y4oxq7y9chhrrgk1eyhwzh6yxx	OGE0ZDMyN2RlOWYyMDVhODc0NTA1ZDQ1NDE3NmRjNjI1MDQ2MmJiMDp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjY2YzI0NTEyMTk1MTQ4Nzk3ZjE0ZDRlZmZlYzljYjhhMmI2NjBkNTEiLCJfYXV0aF91c2VyX2lkIjoiMTMyIn0=	2017-05-10 09:38:21.412467+02
dz66ijndo89rg66v1ijdaog1hapbxm7v	Y2I0M2JiODg2ZTBhMjY5NGJmMjI1MGVhZDI4YmZjNzU1NmQ0ODJiMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2017-05-10 18:27:08.687544+02
8krx55d71wqmr7hw0orzxfklsfa2068x	N2QzY2RjY2E3NGQ4ZTU4ZDczOGYwMjBkODg5NWExOGE0YjUyMjE0Mzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImQzZmE1YzllZDQxNmYwNTQzOWFkNWE0MGY3NTg0MzhiOTU5YTRiZjMiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2017-05-24 18:39:10.376081+02
qq9920w5lsuhp50iibcop1bqvp907yk7	OGVjZjVjOWM1MTIyMTMwN2U0MzM2NjE2MzQwMmI3ZGIyYWNlMGY1Njp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJwcm9jZXNzIjoibG9naW4ifSwiTW9WdUxUYUlGQm5XIl19	2017-05-08 12:54:18.029716+02
x029bwa4n7dkyoduuc3u4u8ouzaeker7	MmJjMmMwZmI2ZTgxMWFmNTM3MmQyZThhZmQzMGVmNTczODBlZWIxNDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJwcm9jZXNzIjoibG9naW4ifSwiQ1pXMk11dG1NOWpUIl19	2017-05-08 13:24:31.903134+02
6jytbgr86fr2qiy4sor5t1uhbv1wuai4	ZjZmMzg4Mzc5MTA3ZDZkYmViYjVlZmIyNzYxMWRhYjM1MDVlZTk3NDp7Im9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbiI6Ijg2LS1jM2UwMDRmMC1jZGYyLTQ2YTEtOGUyMS1lMTdkMmVhNTI5MTUiLCJvYXV0aF9leHBpcmVzX2luIjoiNTk5Iiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX3Rva2VuX3NlY3JldCI6IjBjZjRkMmM4LTlmNmMtNDkyOC1iMmM3LWFmZGQ0YTZmNGFhNyIsInhvYXV0aF9yZXF1ZXN0X2F1dGhfdXJsIjoiaHR0cHM6Ly9hcGkubGlua2VkaW4uY29tL3Vhcy9vYXV0aC9hdXRob3JpemUifSwic29jaWFsYWNjb3VudF9zdGF0ZSI6W3sic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiIsInByb2Nlc3MiOiJsb2dpbiJ9LCJpdXhVOE5xOFlGeHYiXX0=	2017-05-08 19:44:52.032218+02
qc5x4ghr1nhxv6qvq8dqt1k0vdoac1ox	MjhlNmJhYTY1Mzk2OGQzNDEyYWNiN2VhZWQ5ZjJkYWRhZDdhODFkZjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9sYW5ndWFnZSI6ImVzIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzBlZWI2YWUwN2I0ZmVhYjQ1ZWQxODU5N2VhMDM4ZjBjYjI5YTM0ZiIsIl9hdXRoX3VzZXJfaWQiOiIzNyJ9	2017-05-09 11:06:20.894718+02
kr32pcu16mfw5nrp61beafqrmr2d6thx	N2QzY2RjY2E3NGQ4ZTU4ZDczOGYwMjBkODg5NWExOGE0YjUyMjE0Mzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImQzZmE1YzllZDQxNmYwNTQzOWFkNWE0MGY3NTg0MzhiOTU5YTRiZjMiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2017-05-09 11:28:43.98426+02
9b744yt9a3xtuw1958svcxyx2esyl3gg	NmEzOWNmZjJiNjhmNDQwNjNmZDZmMmU0MDUwNTQwYjFkYmU3ZjBjYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzllMDg1MTk1N2U2Yjg0NTBjZjc3ZWRmNjFjNjRhMjUyMzJhZjEzYyIsIl9hdXRoX3VzZXJfaWQiOiIxMzEifQ==	2017-05-09 12:48:51.346195+02
yj8xk8egoo1htaw86ko6qclfmgkhhflu	Y2I0M2JiODg2ZTBhMjY5NGJmMjI1MGVhZDI4YmZjNzU1NmQ0ODJiMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2017-05-05 14:54:29.485436+02
wr3c064orbv543aefdlh3s9x8f7brrw2	MmNiNTlmZTc5YTZiMGUzNDNlYTlmOWNkYTEwOGU2MGMwZDkyYzhhZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjM3OWVhMDI3Y2FjOGY5YzViZjE5NjM3OTA0ZDYyZjliNzBjZWVjZjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTI3In0=	2017-05-05 12:23:19.661378+02
un6az701p16nkvbzonhhobe7i4cgtvwa	MTUyNGRmY2I5YWYwZmU0YWQ2ZDlmZjE3YTQwNDM2ZTM0NzVhZWM4Njp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwianVmZ0RDbnlVb3N4Il19	2017-05-09 22:15:42.897848+02
hb7cb451eoyqr5rqfe5mf3enuklrjywf	MWFlZmVmYWY2ZWU5YzdkMzI3OGMxNTM4ZmY1NmRmZDg3ZjRlYzZmOTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiQWdlajNkUlZIbzhkIl19	2017-05-09 22:31:33.655423+02
zlnk294goi5bwhfn140thdkq8v575gl8	ZWM2ZjQ4MmNkMmU3MzI0Mzk2NjAxNDhiNjQ5MGM1NmM4YmI3NzYyOTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwidXZ1TUREZG5vTk9kIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiIwNmY4ZjRmMy1kODQ3LTQ3ZWUtYmM5YS1iY2Q4ZGY1MmYwOTIiLCJvYXV0aF90b2tlbiI6Ijc4LS00MjJkMGYyMS04MGY4LTQyYTEtYTY5MC03NTMwZjQ1ZmJmODUiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkifX0=	2017-05-21 13:12:57.108847+02
u9hg4whqf9edib0v96l3ri45l77ayvtl	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-15 10:28:40.607868+02
afl0k2huknwitxy3s9knx92pumij6wov	ZTlhZWU2NWU5M2FhYTg4ZmVlN2M2ZGI1Mjc3NjRlYTRlMzRlZTg3ODp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg5YjM3N2U4OGMwYWNjNTQzN2Y4NWJiOTQ5ZjQyYmQyYWJmMDU4MTQiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2lkIjoiNDA5Iiwic29jaWFsYWNjb3VudF9zb2NpYWxsb2dpbiI6eyJ0b2tlbiI6eyJhY2NvdW50X2lkIjpudWxsLCJhcHBfaWQiOjEsImV4cGlyZXNfYXQiOm51bGwsInRva2VuIjoiZmQ2NTI4OWYtNjM3Ni00YWVjLWE3YmMtNDhmZWU1NjQwOGE2IiwiaWQiOm51bGwsInRva2VuX3NlY3JldCI6Ijg0NTVjMzk4LTk5YmEtNDM2Ny1hOTc5LTMyMGNlOWFlYTM0MiJ9LCJhY2NvdW50Ijp7InVzZXJfaWQiOm51bGwsInVpZCI6ImZiMTZiSllfRm0iLCJsYXN0X2xvZ2luIjpudWxsLCJwcm92aWRlciI6ImxpbmtlZGluIiwiZXh0cmFfZGF0YSI6eyJlbWFpbC1hZGRyZXNzIjoidGVzdGVyZXNmZXJhQGdtYWlsLmNvbSIsImxhc3QtbmFtZSI6InJhbmEiLCJwaWN0dXJlLXVybHMiOnsicGljdHVyZS11cmwiOiJodHRwczovL21lZGlhLmxpY2RuLmNvbS9tcHIvbXByeC8wX0N6bHZZMm10RkZYSjFZaDM2VHlVWlM3SzNMUk16eTIzNlRmNFpES3l1bHNzbGdZN2tMck1WSXJ4MWp2In0sInB1YmxpYy1wcm9maWxlLXVybCI6Imh0dHBzOi8vd3d3LmxpbmtlZGluLmNvbS9pbi9hbWl0LXJhbmEtOGE1OTI0OTciLCJwaWN0dXJlLXVybCI6Imh0dHBzOi8vbWVkaWEubGljZG4uY29tL21wci9tcHJ4LzBfLUZKakMtcHVNeFFZWmhiY3lpd0NDbFlpSnlBMTRfQmN5X0RDQ2xwcjZNTEdGRjhCWTNkQTJBZU9jLWxEVWtuUjFYUmlTOUdJcXBJQiIsImZpcnN0LW5hbWUiOiJhbWl0IiwiaWQiOiJmYjE2YkpZX0ZtIn0sImlkIjpudWxsLCJkYXRlX2pvaW5lZCI6bnVsbH0sInN0YXRlIjp7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiZW1haWxfYWRkcmVzc2VzIjpbeyJpZCI6bnVsbCwidXNlcl9pZCI6bnVsbCwidmVyaWZpZWQiOmZhbHNlLCJlbWFpbCI6InRlc3RlcmVzZmVyYUBnbWFpbC5jb20iLCJwcmltYXJ5Ijp0cnVlfV0sInVzZXIiOnsidXNlcm5hbWUiOiIiLCJmaXJzdF9uYW1lIjoiYW1pdCIsImxhc3RfbmFtZSI6InJhbmEiLCJpc19hY3RpdmUiOnRydWUsImVtYWlsIjoidGVzdGVyZXNmZXJhQGdtYWlsLmNvbSIsImlzX3N1cGVydXNlciI6ZmFsc2UsImlzX3N0YWZmIjpmYWxzZSwibGFzdF9sb2dpbiI6bnVsbCwicGFzc3dvcmQiOiIhejYxZ0UycHhCSTdjQ1oybVZRTUw4TzdNbkJINmFEb09sMkpXanBmZiIsImlkIjpudWxsLCJkYXRlX2pvaW5lZCI6IjIwMTctMDktMDlUMDQ6MzY6MDUuODc5WiJ9fSwiY2FydCI6ImFtaXQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJvYXV0aF9hcGkubGlua2VkaW4uY29tX2FjY2Vzc190b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiI4NDU1YzM5OC05OWJhLTQzNjctYTk3OS0zMjBjZTlhZWEzNDIiLCJvYXV0aF9hdXRob3JpemF0aW9uX2V4cGlyZXNfaW4iOiI1MTgzOTk3Iiwib2F1dGhfdG9rZW4iOiJmZDY1Mjg5Zi02Mzc2LTRhZWMtYTdiYy00OGZlZTU2NDA4YTYiLCJvYXV0aF9leHBpcmVzX2luIjoiNTE4Mzk5NyJ9LCJvYXV0aF9hcGkubGlua2VkaW4uY29tX3JlcXVlc3RfdG9rZW4iOnsib2F1dGhfdG9rZW5fc2VjcmV0IjoiOTBiNzgwNmMtZDRlZi00NDczLWEwZDUtODhhMDZkMzA5Y2IxIiwib2F1dGhfdG9rZW4iOiI3OC0tZjVmYTc3YWEtYzE1Ny00MThmLWJiM2MtYjAyZGE3YzhkMTE3IiwieG9hdXRoX3JlcXVlc3RfYXV0aF91cmwiOiJodHRwczovL2FwaS5saW5rZWRpbi5jb20vdWFzL29hdXRoL2F1dGhvcml6ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkiLCJvYXV0aF9jYWxsYmFja19jb25maXJtZWQiOiJ0cnVlIn19	2017-09-23 06:44:50.332867+02
yg45qn4o3kjkqzm1390wb13cl8xnysj6	ZGY4MTAzNTdkYzRkZGIzZDA4NjZjMWNhYWU1ODllYmE4MzFhNzgzOTp7Il9hdXRoX3VzZXJfaGFzaCI6ImEzY2MzMTBlMzdlYWZkN2JhNDViNmQzYzg4NmQ1MGQ4YzJkMmM5NjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTI4IiwiX2xhbmd1YWdlIjoiZW4ifQ==	2017-05-06 06:27:31.124094+02
zgrbrm330j0ucgp4z4qs0gobeeqqc4sa	N2QzMTc4ZDA4ZGI2NmM5NTdhMDAzMzcyMTE3NzZjMzA5OWZhNmQ4Mjp7Im9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbiI6Ijc4LS1hN2I2ZDhmYi04MDEyLTRlYzAtYjNiZi05NTM3YzU4Y2M1YWQiLCJvYXV0aF9leHBpcmVzX2luIjoiNTk5Iiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX3Rva2VuX3NlY3JldCI6ImI3NzIzNTRiLTFmOGYtNGUyNS1iZDcyLTJjOGMwNTQxNGRiZSIsInhvYXV0aF9yZXF1ZXN0X2F1dGhfdXJsIjoiaHR0cHM6Ly9hcGkubGlua2VkaW4uY29tL3Vhcy9vYXV0aC9hdXRob3JpemUifSwic29jaWFsYWNjb3VudF9zdGF0ZSI6W3sic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiIsInByb2Nlc3MiOiJsb2dpbiJ9LCJUbTdqYU10bEd3ZjUiXX0=	2017-05-07 01:52:10.636833+02
fpcdgjz8ah7hw1m4w43ojmd7p7gkeu0r	YzJlZDQxY2ZmYjQ0ZWYwZGI4M2JhYTllNjVhYTUxMmZhNjgyMTg0Njp7Im9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbiI6Ijc4LS0zYzlhYzE0NS1kYTYyLTRlYjYtYWVlMy03ODg5MDlhN2QwYmYiLCJvYXV0aF9leHBpcmVzX2luIjoiNTk5Iiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX3Rva2VuX3NlY3JldCI6IjYwZGMzOTk5LTM3ZTAtNDEyOC04ZjA5LTA1ZjZjNTJlMDQ3ZCIsInhvYXV0aF9yZXF1ZXN0X2F1dGhfdXJsIjoiaHR0cHM6Ly9hcGkubGlua2VkaW4uY29tL3Vhcy9vYXV0aC9hdXRob3JpemUifSwic29jaWFsYWNjb3VudF9zdGF0ZSI6W3sic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiIsInByb2Nlc3MiOiJsb2dpbiJ9LCJ3bVN4UzltZWpFNHIiXX0=	2017-05-07 14:09:52.52317+02
5ok9755ue3cfnin615htqsjqk5l5k6cf	MjQ0M2I3ZWVmOWE2ZGIwNjQ2ZDI2OGRkYTVhMTkwYTZkNTI1MTU2OTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTYzNWE0YjM5NDA3OTc5ZTk0MGI0OTZhYzZhMjQwZDdiODY5NTdhNSIsIl9hdXRoX3VzZXJfaWQiOiI0In0=	2017-05-11 19:16:53.517801+02
hm6jghxdkskcoihqytpv6il120q2unyo	NTRmNGE3ODJkMjgyMTJiNGI1ZWQ0ZDI4YjJhNWJjMzA2NDgzZjFiZTp7Il9hdXRoX3VzZXJfaWQiOiIxMjgiLCJfbGFuZ3VhZ2UiOiJlbiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImEzY2MzMTBlMzdlYWZkN2JhNDViNmQzYzg4NmQ1MGQ4YzJkMmM5NjQifQ==	2017-05-08 11:04:46.124782+02
n1zbzhyvunh4q0jd2gcwl3xm4up1cgww	NTg3ZWRhNTcxZDBiNWJiNjY0ZjYyMjliYWQ5MDFmNTk0NjMxMDE5Yzp7Im9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbiI6Ijc4LS00NTgyNTA4YS04Zjg4LTQ2ODUtOWM2Ni03MDk1YmExYzViMTIiLCJvYXV0aF9leHBpcmVzX2luIjoiNTk5Iiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX3Rva2VuX3NlY3JldCI6ImVmMzQ5ZTM5LWY1ZTMtNDJlYi1iMjA1LTAxMThhMGNjYmE2NyIsInhvYXV0aF9yZXF1ZXN0X2F1dGhfdXJsIjoiaHR0cHM6Ly9hcGkubGlua2VkaW4uY29tL3Vhcy9vYXV0aC9hdXRob3JpemUifSwic29jaWFsYWNjb3VudF9zdGF0ZSI6W3sic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiIsInByb2Nlc3MiOiJsb2dpbiJ9LCI0dEYzaVQ5Ylc1VjciXX0=	2017-05-08 12:54:18.297355+02
2a0290oiaei2evi6c5zcak82lvfy0ryp	MmExZmUxM2M2NjE2ZTczZGQ3Mjc4MWE0YTRkZTQ0YjdlMmE3MTY0YTp7Il9hdXRoX3VzZXJfaWQiOiIxMjgiLCJfbGFuZ3VhZ2UiOiJlbiIsInNvY2lhbGFjY291bnRfc3RhdGUiOlt7InNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJwcm9jZXNzIjoibG9naW4ifSwiV3VBYTJrR2dIYkNoIl0sIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImEzY2MzMTBlMzdlYWZkN2JhNDViNmQzYzg4NmQ1MGQ4YzJkMmM5NjQifQ==	2017-05-08 13:08:05.633036+02
qgfq8pkf8nym5a5t5d3foaycli859a14	NzMyM2EyYTJkYmE0YjFhMjllNDcwZmRlNjk4ZDZhNDExMzVmNmQyZDp7Il9hdXRoX3VzZXJfaWQiOiIxMjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsLCJfYXV0aF91c2VyX2hhc2giOiI0ZmYwODNhNmU3MzY1ZjQxOWYxNTYwM2QzNTI5NjQyMzEzNzhjYmI0In0=	2017-05-08 19:08:58.710506+02
flrjum41osufg1rq6z1xryumjnrm5411	MTI5YmFkNThmMTFhNTBmZWUzMTk0MDgxZjVkNTY1OGEzY2E3OGQ4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxMjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0ZmYwODNhNmU3MzY1ZjQxOWYxNTYwM2QzNTI5NjQyMzEzNzhjYmI0In0=	2017-05-08 19:13:06.621686+02
wrphf2h4cq939hgadnda0htrzhaozadh	NTRmNGE3ODJkMjgyMTJiNGI1ZWQ0ZDI4YjJhNWJjMzA2NDgzZjFiZTp7Il9hdXRoX3VzZXJfaWQiOiIxMjgiLCJfbGFuZ3VhZ2UiOiJlbiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImEzY2MzMTBlMzdlYWZkN2JhNDViNmQzYzg4NmQ1MGQ4YzJkMmM5NjQifQ==	2017-05-09 06:04:02.048945+02
hycpsz5fsxuwqmiw1lxl7d8ysjy6flyv	MzYzNjM2ODM3Yjg2ODFhMDcwNDkyOWJlYWQzZGIyMDFjZDhhZWY2MTp7Il9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTNjYzMxMGUzN2VhZmQ3YmE0NWI2ZDNjODg2ZDUwZDhjMmQyYzk2NCIsIl9hdXRoX3VzZXJfaWQiOiIxMjgifQ==	2017-05-09 08:23:38.859344+02
o289db41leqeoca8vs3insjrgacih6he	NGQyM2JjM2VlNWViNzY2YjgzNGJmZTg5MWQwOTk1OTUyMDM5MGQ0Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9sYW5ndWFnZSI6ImVzIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWY4NTQ4NGMwYTVlZTY4MWY1ZjAzOGI3MTA2YmRjY2U4NDM0NDYxMCIsIl9hdXRoX3VzZXJfaWQiOiIxMTAifQ==	2017-05-18 13:07:25.771005+02
7vgx6dac0gftjgf1bk45bazsphdnifuf	MjIxNGUzNDAyY2Y2NTU2MjgzYTVkMjZhNzJkY2Q2ZGU0ZDVhODQ0Mjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTNjYzMxMGUzN2VhZmQ3YmE0NWI2ZDNjODg2ZDUwZDhjMmQyYzk2NCIsIl9hdXRoX3VzZXJfaWQiOiIxMjgifQ==	2017-05-09 11:12:35.605503+02
zqs7ha8t8rja9p44ahkea41rcyaextrw	OWEwMTQ0NzBjOTI2ZDRkYzFkZjMxMDMxNTA5MWIwN2ZkY2E3NzdjMTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiRW0xcXB6NW16NjZtIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiIyZDJiYzAwNC1mMmYzLTQ0YTgtYWNmMi0wZGRkNmU2ZDE1NzQiLCJvYXV0aF90b2tlbiI6Ijc4LS0yZjBiMGQ4Ny01MGRmLTRkYjYtYWUxMS0xZTBmOGIwNzJlOTAiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkifX0=	2017-05-19 14:19:51.471049+02
n35kkagaq8z3kqif2cvh710az8ehjlpw	Y2RkYWYyYWYxMDBlN2UwOTdmY2NlZWViOTMyMWJmMWJiNDQ4MjcwODp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiTTlkODA4ektDQ051Il19	2017-05-21 13:13:02.631539+02
61x28cg3io466e2zn2a08s63qs36e74u	MTM0MTQyZWI0MmJiZTFhYzNjMTA5YjAxMWE0NWZlMjJkZTZmMWIxMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjM3OWVhMDI3Y2FjOGY5YzViZjE5NjM3OTA0ZDYyZjliNzBjZWVjZjAiLCJfYXV0aF91c2VyX2lkIjoiMTI3In0=	2017-05-10 11:16:52.550314+02
75mggpge9jdshetuemg7mcx5xhjrrj82	N2QzY2RjY2E3NGQ4ZTU4ZDczOGYwMjBkODg5NWExOGE0YjUyMjE0Mzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImQzZmE1YzllZDQxNmYwNTQzOWFkNWE0MGY3NTg0MzhiOTU5YTRiZjMiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2017-05-10 11:22:42.319709+02
ag91hkgiy0isce6e15x51gvwsibs6z8d	NGQyM2JjM2VlNWViNzY2YjgzNGJmZTg5MWQwOTk1OTUyMDM5MGQ0Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9sYW5ndWFnZSI6ImVzIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWY4NTQ4NGMwYTVlZTY4MWY1ZjAzOGI3MTA2YmRjY2U4NDM0NDYxMCIsIl9hdXRoX3VzZXJfaWQiOiIxMTAifQ==	2017-05-19 17:58:58.62947+02
wdvq8ee7cthul2vy0aczupbc1q8w3sc3	Nzg3NzFkODBmZTFjMzRiOTZkMGFkZDBhYWFhMDA1OTY5NDA4OTZiYTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiZ1hTVFg3WUxEajJGIl19	2017-05-23 03:52:55.981281+02
9cb3qbxdeaomuazspe1bdkk2z109t8h1	ZjVkZDdhMjUxM2Q3ZTdiZDkwOTIzM2FhODZmMjI4N2I3YTEwMmRkYjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sImNhcnQiOiJndWVzdDcwIn0=	2017-08-04 14:05:59.066982+02
5fx5wyvkr0ay6a9as3ms76ibt8ri3vg0	OWY5YjVmMGZjMmE0OWFlMjk4MGVjMjlmNTQ0YmZjNjUxZTUxZTU2OTp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fYWNjZXNzX3Rva2VuIjp7Im9hdXRoX3Rva2VuX3NlY3JldCI6ImZiMzdkZTdiLWRmZjEtNGM0Yy1hOTczLTk5N2MwNmQ5YmYwNiIsIm9hdXRoX3Rva2VuIjoiZTUwOWY2MGItNzY0YS00NjE2LTlkZTUtNDJiOTc4YTcxZGQyIiwib2F1dGhfYXV0aG9yaXphdGlvbl9leHBpcmVzX2luIjoiNTE4Mzk5OSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1MTgzOTk5In0sIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjkxY2I1NTRhOGQ2YzY0Mjc5NTQzN2QwYzk5NDg5OTY5ZjljY2Q0YzEiLCJvYXV0aF9hcGkubGlua2VkaW4uY29tX3JlcXVlc3RfdG9rZW4iOnsib2F1dGhfdG9rZW5fc2VjcmV0IjoiMGQ0NzUwN2ItY2FlOS00YWFiLTgxODctYTEwOTQyZjczYzNiIiwib2F1dGhfdG9rZW4iOiI3OC0tY2EzNzhmOGYtYTIwZC00NDIwLTg0YTYtMWY3NTMwMzY0YWM1IiwieG9hdXRoX3JlcXVlc3RfYXV0aF91cmwiOiJodHRwczovL2FwaS5saW5rZWRpbi5jb20vdWFzL29hdXRoL2F1dGhvcml6ZSIsIm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZCI6InRydWUiLCJvYXV0aF9leHBpcmVzX2luIjoiNTk5In0sIl9hdXRoX3VzZXJfaWQiOiIxMzcifQ==	2017-05-25 10:34:37.814692+02
a85dbbrfypgd8pfzlujrblxv6cpnhz4b	N2QzY2RjY2E3NGQ4ZTU4ZDczOGYwMjBkODg5NWExOGE0YjUyMjE0Mzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImQzZmE1YzllZDQxNmYwNTQzOWFkNWE0MGY3NTg0MzhiOTU5YTRiZjMiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2017-05-25 11:06:38.976829+02
49ajatwwfbwyc6e3tta3vb504zyvhfs2	NGNkNGNjMDA0OTk1MTVmMTcxMjhhYzcxM2UxYWVhNThiODI3ZTlmODp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiQ1pVeWNwY1FsNVQwIl19	2017-05-11 07:14:32.227247+02
f4d3zsw36p9cv4shzpjol0qnjjjyocx9	NjQxOTQ0MjkzMWY4NDc4OTk4MjQ4Mjg2NTNkNzIyZjM5MGQ1ODNlYjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiaWVtRnBSMElRSVlLIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiJhNmU3YmQ2ZC0zZGIyLTQwODktYTEyZi00OGUyMTk5NWYzNTEiLCJvYXV0aF90b2tlbiI6Ijc4LS1hNDlhNDAwYi1lZDVlLTRlNTMtODUzNC1hYTk5N2NjYWQ4ZWEiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkifX0=	2017-05-11 07:14:32.674904+02
49lmqfmphwqrcd0i6lit51rqzo10m8qt	NjY3MTYzODM4ZWZkZjU1MzdlOWM2MDY3Yjc1NGM3OTVjMWNiY2VmZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiNmJ5ZG94YlpzQTR1Il19	2017-05-11 07:22:15.755336+02
zrc3pwk0ph7uof63dipzq7ue9snukmai	YTYwNjUzZGZiNjg4ODM2YWFkYTRlZDJjNTJkZTc4MTBiNDNhMTkyZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwieDFOV1FFVXJSSVpPIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiJhYzg2ZWIzNy1lMmU0LTRhOWMtYTc0Ni1kYTVkMTk0NDVkOWYiLCJvYXV0aF90b2tlbiI6Ijc4LS05OTU3NzdmZi04N2Y5LTQ1NDktYjNlOC1mYzFmODVkYzllMjQiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkifX0=	2017-05-11 07:22:16.194887+02
0116i3tcjg4bjhr3434404cdmjt6case	N2E0NzU1MjBhMTZmZDYwZjk0ZTI1OTllOTMxYTNhOTIyMDQyMDI0Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmRkOGY2NzYyMmM1ZWM3YWZmN2Y0ZjUyYjMwM2NiMzJlY2UxNTI1NyIsIl9hdXRoX3VzZXJfaWQiOiIxMzUifQ==	2017-05-19 11:09:35.280647+02
lsv3lymbg9zp0g7bkjo4qxnapa48r4qn	ZjUyNWZlMjNhOTQzZGEzOGJhN2RiZmRjN2JkMWQ5MWZiMGNkNGI3Yzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiWjJSbmJ5MXd0RkI3Il19	2017-05-12 14:21:37.48008+02
0qj6d21uofnzv9v5pps8hbp82lgdpl6x	NGRjYzk3MTVhMTQ3MTA4OWRlMGY0ZTgwOWVlYzI0ZDNhYjIwZWI1Yjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiUk9BN3I2cTQ0M0l4Il0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiIyMjRlYjMwMi1mOWVhLTQxMGYtYmMzNC1kOWM0MWZlMTBmYWYiLCJvYXV0aF90b2tlbiI6Ijc4LS00YWM5YzFkMy1mYjVhLTRmNDctOGMwYS1mYjExMmFiNTliMTQiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkifX0=	2017-05-12 14:21:37.782849+02
secmuj06jn3m4s7yphn7o9i0rh7ad8tw	ZDI3MmE1MDBlMjNhODVhODJlZTliZDlhM2VlN2Y0NzIwYTM4MTMzNDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiSmxQaUFITDBySWZOIl19	2017-05-12 14:36:58.417777+02
7l2ogvsg1nt1p7edvew8zjwvlm49w9aw	MDlhOTZkYmZhNzYyY2JkNDk5OGI1ZDI0MmM4NTI4ZDIzM2RjZDdiYzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwiUkdaSlpYOWkwUWN0Il0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiI1NmFkMGI3ZS0zZDM5LTQyZjUtOWJhMC1hOTM1NDZjYTk3YzMiLCJvYXV0aF90b2tlbiI6Ijc4LS1mNWM4ODNkMC04ZjYwLTRmNTYtOTBhNy1hYWNlZjA4ZDgxZTIiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkifX0=	2017-05-12 14:36:58.753994+02
lu9o60w5eq3cj8shc00v717xcea8pbsu	MzI3YWZlN2JhYWM1NzgxNDQ3MGEyMDg0NDc0YjNlY2EzMzE4OTk0Mjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwic29QVG1ERGpaWWRLIl0sIl9hdXRoX3VzZXJfaGFzaCI6Ijg1YzVhZmI4NThiZDA3YzZlNDNmMmJlZjg3ZDRkMWVhM2Q3YWEwZDciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiIsIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiIxOTM3ZjQ3MS1hOTg2LTQ4YTgtYmU0Ny04NzViY2VlMjdlZDkiLCJvYXV0aF90b2tlbiI6Ijc4LS1mZjQzZGI3ZC02Y2MyLTRiZjMtODNmYy1mOTMxMDBlNDRkNzUiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkifSwiX2F1dGhfdXNlcl9pZCI6IjE3In0=	2017-05-17 12:05:02.429935+02
ylrlrrvdssbj5ifnvbgxkz9g353o69r7	ZjUwN2EzZmY5YTQ0ZDU5NTEwNTgzZDY3OWJiMjU3M2MwMjQ4OTFjZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwia0hPVzVpUzJKb0xiIl19	2017-05-18 07:22:24.790343+02
prlio6brlr6djsn3z66de7iaig3ur7d1	ZDcyZmUzNzFmNDNiNTM0ZTU4ZjVlMTE1MzY0YmZjYzEyNTlmYjY1ZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDNmYTVjOWVkNDE2ZjA1NDM5YWQ1YTQwZjc1ODQzOGI5NTlhNGJmMyIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2017-05-20 06:00:30.080675+02
cmjs4hfnttqsz1thktp72n6s79gb6w3g	Y2I0M2JiODg2ZTBhMjY5NGJmMjI1MGVhZDI4YmZjNzU1NmQ0ODJiMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2017-05-24 15:54:46.014424+02
ylpkfk845bsfh5aemue8jt3hcuyp45ad	M2Y3NDkxOGM3ZjRmNGEzNDU1NDI2ZGFkNDhhMmE1N2Q3NDJmNWQxOTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7ImF1dGhfcGFyYW1zIjoiIiwicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIifSwibVVkb09kdVBYR0dsIl0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiJhYTc1ZDYzNC0xMWU1LTQ4YjAtYmYzYy1iYWFjYjA3NTVmYjMiLCJvYXV0aF90b2tlbiI6Ijc4LS04NGJlNjhkOC01Zjg1LTQ3OTQtODAxMS05ZDFiZjU2ZGRmNGQiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1OTkifX0=	2017-05-18 15:54:34.971712+02
292o5llmi27iwtx5bji1s2jxfi3p218c	Y2I0M2JiODg2ZTBhMjY5NGJmMjI1MGVhZDI4YmZjNzU1NmQ0ODJiMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2017-05-20 06:16:22.033543+02
twrqdwtp75ngxmgmp1f6rgch05t5e0ov	OTY3MGEzMTFkZGFjMjA4NzhlYTVlNGUyMGQ4NWI1MDYyNjg4NjYzNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjcwZWViNmFlMDdiNGZlYWI0NWVkMTg1OTdlYTAzOGYwY2IyOWEzNGYiLCJfYXV0aF91c2VyX2lkIjoiMzcifQ==	2017-05-24 15:55:17.74425+02
3kgasqzgp0ljgs9rtj7p2dj0roo8d2dl	YjJiZTlhODNkMmQwZDU2ZDgxYjdiYjAyNmFkNjZiZWZjMDc0MTMxZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjAxZGQ3MmFiNzVhZjVhM2Y3ZmMzNjg0MjMwZTRhYjA1OWZiMTYzMzciLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNTEifQ==	2017-07-27 10:41:57.73845+02
nis7crq0see8tlbaohb6rx0t9sjyu8op	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-19 11:38:20.667936+02
nqsf3qm0cc1kcc8pvyrwzmqg57wjxdgz	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-06-02 09:01:25.98281+02
v98csussql7dgcqqo9ysagtrvbhx8a2l	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-06-02 14:38:38.448453+02
mfkrag9l1irt18ejge7k84zpugvfqipu	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-20 07:33:42.000297+02
1fh11tvtqewm46vyds1rzllgc5p7zcav	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-20 08:28:03.542412+02
cciq0h9tg86prm8v8ofr3sxwwgxj9123	YTE5ZDY5MzUzOTEwYzU4MWJjNzZlMDVjYWQ5M2M5MzFmNzEyYjY4Yzp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7IjIzIjp7InF1YW50aXR5IjozfX0sIml0ZW1Db3VudCI6MSwidG90YWxQcmljZSI6IjQyLjAifX0=	2017-06-03 14:11:29.870051+02
x1llypx59ol4w9ajuhezloekf6821tu4	MmNjMmQ3MTMzMTg3NjlmMTE4ZWIwM2IzMDczZjI2ODAxZDJhM2RkNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImM0M2EwMDg2ZGNkY2U1OWE2MjE2YjA0YTBlOGMxMjc4MjJjNDM3ZjYiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTM4In0=	2017-06-13 10:49:29.27457+02
1idb1mxfhnbwcpqgx6sk60h1d77xuap9	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-06-13 11:04:42.743148+02
rah2znkfzv8namuruqao1wn952lyjt2v	ZDFhYjg4YTU2MjRjNTFjZGYxNWE4YTAwMzNlZWU5MzBjN2NmOTk0Njp7Il9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzVkMTMxZjQyOTIzNDA3ZjEzNzJkYWI4OWVhZWE2YWI0NzJkNzE4OCIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNDUifQ==	2017-06-14 06:02:41.223048+02
93wo9g3zy2eaejg0xqgpq2t2mf6tzr57	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-06-14 06:10:06.75894+02
2cnmn8dhmp9e98qn1sgaldbc27ga635u	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-06-16 15:16:24.156101+02
kjpqjq22sdaytquos4g7kqyw3szz2rjj	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-06-21 14:13:49.593064+02
fg564robp6r5th5jipms8f8w5aurwvly	NzZlOWUwNjE1OTMzZTkwNzMzYWM1ZWRjZjA2YzNmMjNlYTNjZDhkZjp7Il9hdXRoX3VzZXJfaGFzaCI6ImViNmQ1MTZjNjAxODExNGEwZWIxMjdhOGY0Y2RmYmEwYTBiZDc3NDMiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTQ2In0=	2017-06-21 14:16:48.416439+02
0lwoj245ww3f003k8zgcqt97uy86qxq6	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-06-21 15:36:22.758701+02
ziq7gm4894skrnb3jtun84bzjhgtx4v8	MmIyOTQ0Nzk3YjFhMjY2MWYyZjRhZTEzNzE5ZjI5NzAzMjY1ZTBkYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA1NzRiMDE2ZjgxYjRlM2UwOTQyMmUyNTQwNWI1OTE4ZDJkZjdmZjUiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTQ3In0=	2017-07-03 07:07:15.252226+02
51dsq3o4y3ofm4zkdwklx2sbfr6tm6ey	MTViM2YyZWYwYjZkZDM3ZjA2Yzg2ZDdmYjI2MDA4Njc1OGIzYTU2ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImM0M2EwMDg2ZGNkY2U1OWE2MjE2YjA0YTBlOGMxMjc4MjJjNDM3ZjYiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTM4Iiwic29jaWFsYWNjb3VudF9zdGF0ZSI6W3sicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiJ9LCJ3NlJxMDc5OVJIdjIiXX0=	2017-07-03 13:45:33.739497+02
8synj8qvrz93cd7jz2dgg1yb7rxpzr3b	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-05 11:50:36.052481+02
uztv39pnbkxd1yuiox6tvm70txzlp6wd	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-13 07:03:18.49295+02
3yuf1sevh4uzna7ckjo5943rfz1iev7a	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-13 07:06:05.934955+02
lfum1upoi9uu6z27xdmqburji6d57vmx	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-13 07:35:43.214678+02
ietum5y3nkpw3p5kht4lwjsk5fquxwhu	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-13 07:36:28.320892+02
6frbs72j8t6ryqc38acyl8nxh6l8gpqe	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-13 07:39:43.168015+02
snkfc9z3hcdt39hekush8geaum9pce69	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-13 08:44:47.886851+02
nftu6em7z4yqg9c5qu4z8hji0e54ygm8	MWI5ZDYwZGEyM2FmYzAwY2VjZWIxNmY5MzdlZTAwNmRhMjQ2ZDQxMzp7Il9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9oYXNoIjoiOGFhYjFmMThhNzlhNWRmMjg3ZWJjMGJhMjMyOGYxZWY1ZGRhMjI2MSIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7IjI0Ijp7InF1YW50aXR5IjoxNX0sIjI1Ijp7InF1YW50aXR5IjoxMX0sIjIzIjp7InF1YW50aXR5Ijo3fX0sIml0ZW1Db3VudCI6MywidG90YWxQcmljZSI6IjIyNTguMCJ9LCJfYXV0aF91c2VyX2lkIjoiMTI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-07-13 13:01:51.855035+02
h9m1bqrhtjsj9e0muvnrn653nbf774wx	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-14 11:16:09.341484+02
jol2upcfinqwmsuh9viab0b8bqjh5yzr	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-15 07:23:35.162551+02
i85aejw41tjvxr3lzw4bi503xi5gp04t	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-17 07:34:35.474305+02
58m6let2n3jphcmik4kqex54qicd0p24	MjM3NzYzZTIzMjBjMWMyNTIxYjAxNTUwYjk1YzUwMTYxY2IwYzk3Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwMjlmMzFkMmMwN2VmMzhjYjgwNWU5NjM4MWVjZjdlMzc3OGE1OGUiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e30sIml0ZW1Db3VudCI6MCwidG90YWxQcmljZSI6IjAifSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEzOSJ9	2017-07-19 06:14:49.038891+02
ot8v4ar2pmp9zqnfv69fuh92k03obr8p	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-18 08:57:40.298035+02
atmqn327x60prxr9pp9rnfylv4ggn0vf	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-18 09:14:56.880618+02
c16as2erd02ms8inpmuyksrp0mtlkjah	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-19 08:18:21.106193+02
p4h6221q6z9rxrmdkftaliic3bic7o8m	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-19 11:02:52.267813+02
1aj5bid62e7tjqpae8wjo6t8sipmx1mh	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-18 14:25:56.490334+02
vmxj0ejku5bqg2qar0r8yaame74axg8y	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-19 13:20:59.794366+02
0g521zxm6bu3uxct15kfczucmanf1ely	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-20 07:14:25.545964+02
30z6bpamr7uslktk12zq3d0r1l4fw20l	YTgyYmIxZTMzOWI3ZWE0ZmRlOWQ4NjdmZTM5M2I1NmM5OWQwMDlkYzp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sImNhcnQiOiJndWVzdDE1MyJ9	2017-08-09 16:16:36.220159+02
vuoumwsrgahfqn9avg9a5kya7iib375v	Y2NkMTFmOWU0NmY2YmFmZDU5ODQ1ZGI5ZTlmYzM1NDhiMmZhOWU1ZDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7IjIzIjp7InF1YW50aXR5Ijo5fX0sIml0ZW1Db3VudCI6MSwidG90YWxQcmljZSI6IjEyNi4wIn0sIl9hdXRoX3VzZXJfaWQiOiIxNTIiLCJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sInY4MzV0RENoRmlrVSJdLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsImNhcnQiOiJyYWoiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsInVzZXJfaWQiOjIyMiwiX2F1dGhfdXNlcl9oYXNoIjoiY2U0MjkzY2Y3NDIyYmZkMmExNDZjNzdlODFiM2JlNDZjOWNiY2NhNSIsInVzZXJfbmFtZSI6InJhaiIsIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiI0OWI5MTExZC1jZDM4LTQ5ZTUtODE2NS1iNTViMzFmMjE2ZTQiLCJvYXV0aF90b2tlbiI6IjgxLS0wMGJkM2FlOS0yYzcyLTQ1NzMtYTAwYy1hNjk4MDUwZWZjMDYiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfZXhwaXJlc19pbiI6IjU5OSIsIm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZCI6InRydWUifX0=	2017-08-03 15:46:14.801683+02
l24uc66ic44oorglvemswnl83idlug6d	ZjEyOWIwNzZjYjBlMTAxNDg5NDc2YmRkOTdkYjEyNzgwNmM0MjY3NDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sImNhcnQiOiJndWVzdDY4In0=	2017-08-04 07:11:17.281115+02
pfwfpuadcktucwuo67c63oexjxstvzpy	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-19 06:16:04.270456+02
xmtlepks85kdtg1d0pun6rvti77aoscm	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-21 05:40:58.78849+02
g3loqw2ztheat0lwu0tii1bhqpkac72x	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-21 11:11:22.932876+02
4xukujhg3qpl7e590w0535ie756j8s7o	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-21 13:52:26.352947+02
4qnk9y4rtw07ov3ikqztl5gj48brrbii	NDA1MjczZmQ1OGEyYzlkODg0MjhkODI0MGE0NjU1MDM2OTQ2ZjI5MTp7Il9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDJhNGY1MWYyYTAzZWZhNzExNGFhZjNjMmZjOTYwYTEwYmY0ZmY5ZSIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIxOTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-07-25 08:28:16.554466+02
4ua6gvwc1f8arv2n8mc10a3j45kkirkr	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-31 07:11:05.096991+02
yld9xkqi68isz7mv1kp3b2jyzp4z2w2q	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-03 13:57:29.412223+02
gptcwlnnt2a32aep5ycs0gaqcbxxxkn6	YzRiZjFhYzJmZjEwN2Q2NjRmOWZmNjhlYjFkNzkxZDExNzM2YzdiNzp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sImNhcnQiOiJndWVzdDY2In0=	2017-08-04 06:30:47.574087+02
xjd8rb9ajgihhemao63rcupoxltabull	YjJiZTlhODNkMmQwZDU2ZDgxYjdiYjAyNmFkNjZiZWZjMDc0MTMxZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjAxZGQ3MmFiNzVhZjVhM2Y3ZmMzNjg0MjMwZTRhYjA1OWZiMTYzMzciLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNTEifQ==	2017-07-25 11:12:34.927047+02
hdx64efc744o68ewafbngx9x9f2kiqyq	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-26 06:13:35.911955+02
q7bpj3yrwsknaf0c6c37cv7l0dayjey2	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-27 05:42:28.301302+02
00udepoi9z14pj7w2ckbgmetlw0s071e	N2E5NGUzOWI0ZjE0ZDJkOTcwODc2YTUzZTZjM2FkMjY0MDM5M2VhMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg5NGRjOTgwZTI3N2ZjODQ2ZjUzYzRmNWExOTIxOTg1MTA0NjZjMjciLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxODIifQ==	2017-07-28 13:33:00.523551+02
uqlo73tccvgrom2fx48ggpy9z08jjbns	OTU3ZWM4NWMyODIwODU2N2ZmZmYyYmE3OWFjZjk2OGYxYjk2M2IzNjp7InVzZXJfaWQiOjIyMiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fSwidXNlcl90eXBlIjoiQ3VzdG9tZXIiLCJjYXJ0IjoicmFqIiwidXNlcl9uYW1lIjoicmFqIn0=	2017-08-04 06:43:39.861632+02
09iubemefzl9djz2d61njqecfgzyiizq	MWIzZDJlMTcxYjlmNjdjZTdlNGFmYTM2NGI4MDM5Y2IyYWVmY2Y4Zjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sImNhcnQiOiJyYWoifQ==	2017-08-04 09:34:13.901415+02
d9bu0wurzgwupc5scfgcxayj7kzdnbh3	YjJiZTlhODNkMmQwZDU2ZDgxYjdiYjAyNmFkNjZiZWZjMDc0MTMxZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjAxZGQ3MmFiNzVhZjVhM2Y3ZmMzNjg0MjMwZTRhYjA1OWZiMTYzMzciLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNTEifQ==	2017-07-27 06:06:18.340826+02
uzdkevxnaen5cjptkcm0vz5y7yvhlr9q	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-07-28 15:08:52.639851+02
d042iv9jkcuukjeqm3ld12l7z3kk4edx	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-02 05:55:52.910592+02
5901g03ove1q6zn1sqws63v3ydgdzy7v	MjBkNGFlNWNmMzRkNWMwYWJjMjRiYjNhMTA5MDkzN2MyZTM1MTA2NDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIxODIiLCJjYXJ0IjoiZGhhbmVzaCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidXNlcl9pZCI6MTEyLCJfYXV0aF91c2VyX2hhc2giOiI4OTRkYzk4MGUyNzdmYzg0NmY1M2M0ZjVhMTkyMTk4NTEwNDY2YzI3IiwidXNlcl9uYW1lIjoiZGhhbmVzaCJ9	2017-08-04 05:45:05.468289+02
z1jwnxw9mmygz8pjjur6674hg0la6ycc	YjY2ZDc5Y2YxNTQzZDU4MDVhMDUxNWM4YThhYmUxOWEzMGM3Y2RiNTp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaGFzaCI6Ijg5NGRjOTgwZTI3N2ZjODQ2ZjUzYzRmNWExOTIxOTg1MTA0NjZjMjciLCJ1c2VyX2lkIjoxMTIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjE4MiJ9	2017-07-27 06:10:59.976088+02
bgljbp80rht77sledifokro3bpk0vfn0	YjJiZTlhODNkMmQwZDU2ZDgxYjdiYjAyNmFkNjZiZWZjMDc0MTMxZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjAxZGQ3MmFiNzVhZjVhM2Y3ZmMzNjg0MjMwZTRhYjA1OWZiMTYzMzciLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNTEifQ==	2017-07-28 15:31:29.752536+02
y5f2xy5i7paj8kgdcr8skzncvw7q2z96	ZTg4Yjc4ZTg2MjkxNmZmZDU0MmE3MDU0MThiMzc3MGNmZDk4NGQ2Nzp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIxODIiLCJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sImJxa1c5WUN2UDVMayJdLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4OTRkYzk4MGUyNzdmYzg0NmY1M2M0ZjVhMTkyMTk4NTEwNDY2YzI3Iiwib2F1dGhfYXBpLmxpbmtlZGluLmNvbV9yZXF1ZXN0X3Rva2VuIjp7Im9hdXRoX3Rva2VuX3NlY3JldCI6IjY0ZDUwNDUxLTNiZWYtNDY0Yi05Y2QwLWIzMWY0MzM1OWIwMSIsIm9hdXRoX3Rva2VuIjoiODYtLWY3ODE0YTZlLTRiZDEtNDAwMS1iYWE1LWNiODVkODRhZTAxMiIsInhvYXV0aF9yZXF1ZXN0X2F1dGhfdXJsIjoiaHR0cHM6Ly9hcGkubGlua2VkaW4uY29tL3Vhcy9vYXV0aC9hdXRob3JpemUiLCJvYXV0aF9leHBpcmVzX2luIjoiNTk5Iiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSJ9fQ==	2017-07-25 06:36:41.924832+02
rekcg5jk10mg7ug8sn1bqx24mi8g82y6	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-09 16:05:00.919034+02
4lkmtnfww491vy08djh7c5t2rw446cyt	YjJiZTlhODNkMmQwZDU2ZDgxYjdiYjAyNmFkNjZiZWZjMDc0MTMxZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjAxZGQ3MmFiNzVhZjVhM2Y3ZmMzNjg0MjMwZTRhYjA1OWZiMTYzMzciLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNTEifQ==	2017-08-04 10:41:34.000166+02
2to96uzcx4gchgfa1d0js7mdkwd560ci	MWMyZTkwODk5MjlhN2Q2ZGNlMzQ3ZDNmYjcxMDgzMmZkZDRiYTNhNTp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sImNhcnQiOiJndWVzdDY5In0=	2017-08-04 12:15:03.678724+02
iui7k1pp45q5mgcupnckjv4wp13csucl	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-04 12:15:48.595677+02
zon5zzmn29aotnktcnlxcvsfhtuvxyln	YTI4MDlkYmNjMTA4YjFlZjNiMTQ3NjliNWE5MWNhM2ZkMTQyMmE0Nzp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sImNhcnQiOiJndWVzdDE1MCJ9	2017-08-09 14:44:09.70773+02
rks15xywnh9tlm2co23os9w0coturu60	ZWEyOWRmMzJlOTQxMWJiZjMyOTcyMjg1OGFkYzUwMTUwYmNhY2Q3YTp7InVzZXJfaWQiOjI5NiwiX2F1dGhfdXNlcl9pZCI6IjI5NiIsInJlc3RhdXJhbnRfaWQiOjI5LCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiJjZDc0MTBhYmU4OTFhN2QwNWIzNWEyYTU1NzNlMTQyODAxYjQ5MTI3IiwidXNlcl9uYW1lIjoiZGhhbmVzaCJ9	2017-08-18 05:58:37.743305+02
268h7pi0dx25i9cd41j9bjnh8t46rccx	OGNmOGI5NWFiMWM0NGMwMTUwYTNiODRjZGU0Mzk2OWMzYTdlZTNkZTp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sInNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiU0Z3SlhwdXp2WjFlIl19	2017-09-01 11:15:13.907406+02
mqez4rhza2krx5qeypzhfillvmrdsftl	YWEwMWJmMTE5ODhiMDg5NzQ5ZTZiM2RlNGI2MGE0NjFlYzY5MWJmZTp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sInNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiMXM0WDROeFhtY3ZzIl19	2017-09-01 11:31:58.436612+02
glg9d7gpjyka02ohdhthxbyjrpgk3hwe	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-07 14:02:35.054211+02
wh29i36nbpb0rmrz5ky3c604833qtu69	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-07 14:02:50.834055+02
ltvkcnl8xty6lx2nmbtd61t4osjkx5qn	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-23 22:42:01.19753+02
4o2oib9wzw5fc83kb0da0fbso6cr8fvr	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-11 05:53:14.498228+02
rqe5spa53g2nnixowp6b42xuog7nanes	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-08 06:48:30.425663+02
p4yb03csw2e811kjez3lcsxuej75jo5m	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-15 14:07:52.221964+02
e6o8dnfjdeh2mlbso1zst8us4x4zl0b7	YjljYTI0OWU5OGRhMjk0N2IwNmU4NDcyNGIyMThlMDA0ZjFhNzczMDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sImNhcnQiOiJndWVzdDExOCJ9	2017-08-08 13:51:05.99284+02
xkr1x543a72pngtoqs3v7ndx0mmrhqbm	ZThmNTRhMDRjZmY4NDlmNzhlODdhMTJjMDViNDIyNzhiZDAxY2Q3YTp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sInVzZXJfaWQiOjIyOCwidXNlcl90eXBlIjoiQ3VzdG9tZXIiLCJjYXJ0IjoicmFqIiwidXNlcl9uYW1lIjoicmFqIn0=	2017-08-08 13:52:33.253288+02
mw6o4d4wgqnp548ecsjdo7s7icgd389j	YzE4NTU2OTRlNzRhZWVkNjQ0ZjY3MWRlZGM2Njk5MzVjZGFiZWQ2ODp7InVzZXJfbmFtZSI6ImRoYW5lc2giLCJ1c2VyX2lkIjoyNTQsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fX0=	2017-08-08 14:58:40.958281+02
uclv2vt4vp5h6jlxlktws2zvwi07ii04	YWVhYWI0ZWMzNmJmZTZlOTYzODgzN2NkMzJhMTliYjJiZTI2OGQ5ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDFkZDcyYWI3NWFmNWEzZjdmYzM2ODQyMzBlNGFiMDU5ZmIxNjMzNyIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIxNTEiLCJjYXJ0IjoiZ3Vlc3QxODkifQ==	2017-08-11 14:04:39.266731+02
47bxih4a8buz1gj61s1r2cqkt9ylx772	NzQ3NmVlNjRmMTIxZmI0OGE1NDI4MDAxNzQwODNkOWE2ZmYzYTNmNzp7InJlc3RhdXJhbnRfaWQiOjI3LCJfYXV0aF91c2VyX2hhc2giOiIwMWRkNzJhYjc1YWY1YTNmN2ZjMzY4NDIzMGU0YWIwNTlmYjE2MzM3IiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fSwiX2F1dGhfdXNlcl9pZCI6IjE1MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-08-15 14:53:45.366467+02
cg7j1b9jkmgwz3nnd55e49gsflyblgch	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-11 14:29:31.339115+02
ypoy6l1g09qalasymivjwgvm5utaw31t	OGMwNzJjZWQ3OGM0ZDFkMzJlZDUyMTU5MjA0NmZiZjIyYTM5Yzg2Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDFkZDcyYWI3NWFmNWEzZjdmYzM2ODQyMzBlNGFiMDU5ZmIxNjMzNyIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIxNTEiLCJjYXJ0IjoiZ3Vlc3QxOTIifQ==	2017-08-11 15:39:00.907111+02
sn4eo36grfd4pgkmyjs30hkepw83n59c	MTM3ZmQ2ODhhNTVlM2JkYzQ5ZjFjZmNkMjM4NDkyZDYyNDVmMmI5ZTp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sInVzZXJfaWQiOjI4NSwidXNlcl90eXBlIjoiQ3VzdG9tZXIiLCJjYXJ0IjoicmFqIiwidXNlcl9uYW1lIjoicmFqIn0=	2017-08-11 15:39:31.264782+02
dcbcwfum5b87ng79jp06kptafeeof0hi	MTM3ZmQ2ODhhNTVlM2JkYzQ5ZjFjZmNkMjM4NDkyZDYyNDVmMmI5ZTp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sInVzZXJfaWQiOjI4NSwidXNlcl90eXBlIjoiQ3VzdG9tZXIiLCJjYXJ0IjoicmFqIiwidXNlcl9uYW1lIjoicmFqIn0=	2017-08-11 15:42:34.000101+02
uahc8edvrgx76j3or9zvhk4j3lv3tp5p	Mjg4ZmYzNjcyMTM4MzEzYjczOGFiNWViYzc3MThjNmFhOTIzY2M5Zjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiY2FydCI6InRlc3QiLCJ1c2VyX25hbWUiOiJ0ZXN0In0=	2017-08-11 16:00:28.77645+02
5tvy7uy25mmv1e4qki1funk3nakgdjlw	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-09 10:33:02.495439+02
xwzjp6z6lw68y52r5nvl9laouexwsfyy	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-09 10:35:50.251182+02
n6qdnfdulltfv2qdh9ggj3mke9z7g380	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-16 06:33:57.918783+02
3myf0b704y54tl4mngx1mrhut7oj5ixv	MjAzZjcwZmRhMWI5ODFhYjJmNTNhYzE4ZDdiNjk4NTQwMjYzNTI4MDp7Il9sYW5ndWFnZSI6ImVuIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fX0=	2017-08-16 08:27:35.937759+02
l3nwk46zz6gewv0jdk60uh3xeqw2t3hj	NDMyMGIwNzY0MTY3OTEwYzMxNDMzZWU4MGFkZDFkYWU1ZDNlOWE3Njp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIxNTEiLCJyZXN0YXVyYW50X2lkIjoxNSwiY2FydCI6Imd1ZXN0MTYwIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMWRkNzJhYjc1YWY1YTNmN2ZjMzY4NDIzMGU0YWIwNTlmYjE2MzM3In0=	2017-08-12 08:08:24.286202+02
pajqlp3ut206rzx0yprzoirgleh9oks3	MmM1ZGQ4ZmRlNzMzMjFlOTdmZjRmN2UyY2ZlZmM3MGIzYmIyZGRmNDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIyOTYiLCJyZXN0YXVyYW50X2lkIjoyOSwidXNlcl90eXBlIjoiUmVzdGF1cmFudCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidXNlcl9pZCI6Mjk2LCJfYXV0aF91c2VyX2hhc2giOiJjZDc0MTBhYmU4OTFhN2QwNWIzNWEyYTU1NzNlMTQyODAxYjQ5MTI3IiwidXNlcl9uYW1lIjoiZGhhbmVzaCJ9	2017-08-16 09:22:43.634165+02
nwvbzwachbnj8mxvwdsrnzetfm1kulg9	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-16 10:47:53.141391+02
9kh5ynodcya34876h62sesf3chj3zwa6	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-16 13:28:08.720189+02
5zxafa08k16d6vzq5kglu2oxpq7bt5lg	MmM1ZGQ4ZmRlNzMzMjFlOTdmZjRmN2UyY2ZlZmM3MGIzYmIyZGRmNDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIyOTYiLCJyZXN0YXVyYW50X2lkIjoyOSwidXNlcl90eXBlIjoiUmVzdGF1cmFudCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidXNlcl9pZCI6Mjk2LCJfYXV0aF91c2VyX2hhc2giOiJjZDc0MTBhYmU4OTFhN2QwNWIzNWEyYTU1NzNlMTQyODAxYjQ5MTI3IiwidXNlcl9uYW1lIjoiZGhhbmVzaCJ9	2017-08-17 05:57:13.971957+02
q10umin7zucatheyp6ed1kevlig3qqap	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-17 13:09:49.590361+02
juhqv45sfxark1167jy3clqzisw03vrc	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-17 13:24:11.307662+02
wm0gbz3ze1ctso0gmlrmam3l8x50z5gs	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-01 07:45:05.023591+02
iir6z27smxxl8ozdtyb9zm8kwebktqpx	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-25 10:33:40.465794+02
14bzo3syc4sd9kq9b8hjuxobic2db6rc	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-25 11:20:04.045177+02
dvl10l3sbdgut5mlu800luhllv5n4g2j	OTRmZTRjNTU0NmUxNjNiMWQ3M2UyOWY1ZGQwN2UzNmQ3NmEyMWYwODp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sImNhcnQiOiJndWVzdDIxMCJ9	2017-08-25 11:20:52.188975+02
g5tyqrvw2ots5h4pdu8hso0jm293f33x	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-25 11:42:03.506699+02
r8gaseki3ex80rbtzomzlj4fnyp6oo76	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-02 13:51:54.407491+02
t2vou8vnft7d18e5wncfdevvuucesdd8	OTRmZTRjNTU0NmUxNjNiMWQ3M2UyOWY1ZGQwN2UzNmQ3NmEyMWYwODp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sImNhcnQiOiJndWVzdDIxMCJ9	2017-08-25 13:43:46.713008+02
77ionmty386ckrv7kak6ejbvbz6rb4lo	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-26 06:06:23.660522+02
81tmp5w7735nwnfmmug71dn91vlo7b4y	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-26 08:11:53.632161+02
kqbm88qgl4r2pdzjfbsqce91yy1u1wot	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-26 08:34:08.213659+02
q07ziex9tqhko3i3bp5x7nu2dr1vib63	ZDQ0Mzg4N2FkYWUxYTRlMjM4M2QyNmYzNDIwNjllZjQ0MzkxMmVkZjp7InVzZXJfaWQiOjI4NSwiX2F1dGhfdXNlcl9pZCI6IjI4NSIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiY2FydCI6InJhaiIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaGFzaCI6ImU0MjAxMjIwZTY4ZmVhOTIyMTJmY2U3NzU2YWI2MGExZmIyODhlMmYiLCJ1c2VyX25hbWUiOiJyYWoifQ==	2017-08-26 11:33:53.619189+02
e5xt8nr4wzoc3pm9elje25f1dhjbgo6j	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-01 12:32:29.659212+02
m3uq96j499n4ycgh088bwk639zp2g6qy	ZGE5MzE0NTY5NWZkN2ZhMDhhY2MzOTEyZWE0M2YzZTljMzk3ZjIxZjp7InJlc3RhdXJhbnRfaWQiOjMsIl9hdXRoX3VzZXJfaGFzaCI6IjAxZGQ3MmFiNzVhZjVhM2Y3ZmMzNjg0MjMwZTRhYjA1OWZiMTYzMzciLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2lkIjoiMTUxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-09-04 05:55:49.765657+02
z82l5hoaxkqg75dhng9gur0h18oe32kq	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-04 08:34:46.113287+02
ai4sjriqsklfnzkssomxwjdqyq8axtx1	YmZiNDU1MTBmYjc2ODExNjNlYmNlNTE2NzI5ZDBiYTRmNTRkODY2MTp7InVzZXJfaWQiOjI4NSwiX2F1dGhfdXNlcl9pZCI6IjI4NSIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiY2FydCI6InJhaiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaGFzaCI6ImU0MjAxMjIwZTY4ZmVhOTIyMTJmY2U3NzU2YWI2MGExZmIyODhlMmYiLCJ1c2VyX25hbWUiOiJyYWoifQ==	2017-08-26 18:12:35.620508+02
1kwpxngv9oyutsl7ha7vbjflenmexhyp	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-28 06:09:04.897148+02
0c117oinx8mpwo8wllnvf8xk1sz0pzp7	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-23 01:18:48.374371+02
hdl3iuf477k7v3yqk5w8ukbs3wabqg02	MDFmM2ZmZmExMTU0M2NlNjUxZWY3NDlhM2MxNTU2N2NiMzJmN2ZkNzp7InVzZXJfaWQiOjI5NiwiX2F1dGhfdXNlcl9pZCI6IjI5NiIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiY2FydCI6ImFtaXQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiIyYmY3YzgxMjUyNWFkODQ3NjdjNGZjNDcyOWFkOTgwYjk4OWVhZmFhIiwidXNlcl9uYW1lIjoiYW1pdCJ9	2017-09-01 13:26:51.8256+02
ehf60qn0lwjg2xkj83nf5owflpst0ey1	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-01 13:32:24.326853+02
tejjkxrfjmzbhsvzoorbsecvzqelx9bh	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-24 02:15:34.295759+02
kbkp82p3z1qn1f90qjvxzubdui1f06jz	NGM0M2UwNjIxYmQxMjIwOWY4OTY5YzM0MDQyOWJlNjMyOTNkNWE5ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjAxZGQ3MmFiNzVhZjVhM2Y3ZmMzNjg0MjMwZTRhYjA1OWZiMTYzMzciLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTUxIn0=	2017-08-31 06:12:55.778931+02
x5auuvq5jp6wo604jg2m17sg0o0r4s62	ZGE5MzE0NTY5NWZkN2ZhMDhhY2MzOTEyZWE0M2YzZTljMzk3ZjIxZjp7InJlc3RhdXJhbnRfaWQiOjMsIl9hdXRoX3VzZXJfaGFzaCI6IjAxZGQ3MmFiNzVhZjVhM2Y3ZmMzNjg0MjMwZTRhYjA1OWZiMTYzMzciLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2lkIjoiMTUxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-09-01 13:33:48.786425+02
f0gixzqt4v88y4y4rq6v9p0c39s44j7m	MzQ5MGJkMjJhNWFmZjYxN2U2NWU3NzNjZTE0NTljOTMwMDQ4NzE4Zjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIzMDIiLCJyZXN0YXVyYW50X2lkIjozMCwidXNlcl90eXBlIjoiUmVzdGF1cmFudCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsInVzZXJfaWQiOjMwMiwiX2F1dGhfdXNlcl9oYXNoIjoiMzE4Mzk4ZjNmYmM0NGE1OTk2Yjc0NzQ4MmQ5N2YxMzRlZjFjOTQzMyIsInVzZXJfbmFtZSI6ImphdGluZGVyIn0=	2017-09-01 14:02:56.635763+02
s8yimhigroywhmtkfde88p0ehf71594g	YTVlYTUzYmY0MjIzY2EzODVkZmMyZWVjMDUwNDUzZDA5Njc5YzMxYzp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIzMDMiLCJyZXN0YXVyYW50X2lkIjozMSwidXNlcl90eXBlIjoiUmVzdGF1cmFudCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsImNhcnQiOiJndWVzdDEyNSIsInVzZXJfaWQiOjMwMywiX2F1dGhfdXNlcl9oYXNoIjoiYWNjNGU2MzY1YzIzMDc4M2MzNDE2ZDI4M2Q0YTMyN2MzOTNiYTM2ZCIsInVzZXJfbmFtZSI6InJhbSJ9	2017-09-01 14:19:13.335767+02
5cfqzcdpyso074rkts6kh85osa2hwgfb	Njk4MDdkY2FjZjZiNzY3NmYwYTI2ZjRmYTg0NTE5YjhiYzM1Njk1ZDp7InJlc3RhdXJhbnRfaWQiOjMxLCJfYXV0aF91c2VyX2hhc2giOiIwMWRkNzJhYjc1YWY1YTNmN2ZjMzY4NDIzMGU0YWIwNTlmYjE2MzM3IiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fSwiX2F1dGhfdXNlcl9pZCI6IjE1MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2017-09-01 14:27:03.904893+02
xfwbospali59li0n1v474pm5511acqb2	MmM1ZGQ4ZmRlNzMzMjFlOTdmZjRmN2UyY2ZlZmM3MGIzYmIyZGRmNDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIyOTYiLCJyZXN0YXVyYW50X2lkIjoyOSwidXNlcl90eXBlIjoiUmVzdGF1cmFudCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidXNlcl9pZCI6Mjk2LCJfYXV0aF91c2VyX2hhc2giOiJjZDc0MTBhYmU4OTFhN2QwNWIzNWEyYTU1NzNlMTQyODAxYjQ5MTI3IiwidXNlcl9uYW1lIjoiZGhhbmVzaCJ9	2017-08-16 10:35:04.414961+02
bsgm7k27u2h9l5krzin6zo1ooqnwtt8f	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-18 05:57:32.688753+02
bqhj1isdli9a946d2t1i8eux3xdf90gj	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-31 15:28:43.530312+02
p81bhjh8ih2hpc0p24msxdyvdtq8iag2	ZWEyOWRmMzJlOTQxMWJiZjMyOTcyMjg1OGFkYzUwMTUwYmNhY2Q3YTp7InVzZXJfaWQiOjI5NiwiX2F1dGhfdXNlcl9pZCI6IjI5NiIsInJlc3RhdXJhbnRfaWQiOjI5LCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiJjZDc0MTBhYmU4OTFhN2QwNWIzNWEyYTU1NzNlMTQyODAxYjQ5MTI3IiwidXNlcl9uYW1lIjoiZGhhbmVzaCJ9	2017-08-18 11:35:51.269358+02
xoq7oopkv15bu61cobbd6x71kzn5l8is	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-22 08:00:06.0281+02
4qcdwbd7lpl2j6hu73w2eihjdji4jjsq	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-22 11:03:11.578953+02
ovnqju97py2ra1pbz6o7svi4ec6invkt	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-22 12:30:51.197272+02
4876dttta1vwgihrfdxfh5mp45uofqdc	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-22 13:47:03.542263+02
rsal8e1140kf03tnzmwllgiczjcinx4b	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-25 05:54:24.779409+02
8gnczj4ecu97aivc530ssf6cr57iq64p	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-25 10:33:49.426771+02
4rs5mbjubqh6stlk8u75lr152n304nnc	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-02 13:51:33.573131+02
vgl9mvozs6ly66b467daa4qvcp0cksl2	ZDEwMGQwMTQyOWVkNjdjMzUxODQzZDU2ZTE1NmI4ZDE4ZTJiOGRmZDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sInNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiQW4wT0o3WjZLQlNEIl19	2017-08-25 10:45:42.841878+02
q7vpb669e7os5w8fgmfgr8v1i41nsplz	ZGE4M2MzOWVjMWNjMjE3ZTliNWE3NjIyMjk2ZGVhMTFiMzMwYjYyMTp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sInNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiRkxjOG95TEl4Um5YIl19	2017-08-25 11:10:44.248476+02
cnyva1maqykoez1flzog1az5jze625c0	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-25 11:17:36.962301+02
2m5hb587q5i2x506dkek4cmzquwicl17	NmI1YzE1ODhkY2FiZTA0ZWM5MDU3ZTMzMDZiNDUxYTM0MDg4Njk1Nzp7fQ==	2017-08-25 11:20:04.542301+02
3zlcx596388iufnn3jb5us94q5pg984l	YzkyN2FjYWQyZWYwNDVlZjFiZThkYzhkNmNkOTcyOTJiNDM3NzVjMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sInNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiRjV0UTFrSzlsVFh4Il19	2017-09-01 11:27:05.677344+02
6cuyhwkf6e4331feta1ekpbe1mai8o3g	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-01 11:32:29.430987+02
h5hrwte6rizdnmnjo4ajj4rl4e78xzjz	OTRmZTRjNTU0NmUxNjNiMWQ3M2UyOWY1ZGQwN2UzNmQ3NmEyMWYwODp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sImNhcnQiOiJndWVzdDIxMCJ9	2017-08-25 11:22:37.061365+02
76b0kk2g0x7un67dj2q9si5v612mnhw2	NGM0M2UwNjIxYmQxMjIwOWY4OTY5YzM0MDQyOWJlNjMyOTNkNWE5ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjAxZGQ3MmFiNzVhZjVhM2Y3ZmMzNjg0MjMwZTRhYjA1OWZiMTYzMzciLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTUxIn0=	2017-08-26 06:03:09.337162+02
ma1580at8duktxsdrk2l4d0924x6bigt	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-26 08:13:00.399653+02
8vw3u8mdylvka37ypfseg3rg3l7bvlg1	NGM0M2UwNjIxYmQxMjIwOWY4OTY5YzM0MDQyOWJlNjMyOTNkNWE5ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjAxZGQ3MmFiNzVhZjVhM2Y3ZmMzNjg0MjMwZTRhYjA1OWZiMTYzMzciLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTUxIn0=	2017-08-26 08:35:44.479404+02
geqlr3d80pqt9qq8mxl5v2zgur7bmeaq	YTQ5ZmQ5ZmU5ZWY2Y2ZiMWQzZTEzOWRlMThlOWY3NGNmN2FhMjJlYTp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sInV1aWQiOiJmNmViNjAxZC03M2RkLTQifQ==	2017-09-01 13:32:07.911103+02
mhca7a6h73pfq7u9xl5m18pm9lx8coxd	NmMwM2U2ZTI0ZmFkNTUzZWZjNzlhZTQyMzY1OWFjZDc1YTQyZTFkZjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIyNDIiLCJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sImNGaUtOT1U4dDNYbCJdLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsImNhcnQiOiJyYWpzaGFybWEiLCJ1c2VyX2lkIjoyNDIsIl9hdXRoX3VzZXJfaGFzaCI6ImU5NWMyM2M5MTVkY2I5ZmMxOTg0OTE0MWI4MTJhYTE0YzI3MzFlMDkiLCJ1c2VyX25hbWUiOiJyYWpzaGFybWEifQ==	2017-08-26 16:31:17.139877+02
l92ajpd4rht8dimbyiqcep2rvdetihl6	NDNiMGZiZGYyZDUyZjcxZGU4OGE1YTFiYTQwYzIzOTE3Yjc2NDhlNzp7InVzZXJfaWQiOjI4NSwiX2F1dGhfdXNlcl9pZCI6IjI4NSIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fSwiX2F1dGhfdXNlcl9oYXNoIjoiYWQ4NDEyNzU0YjQ5OWEwZjgxNmJlZTRhZWNiZDNjNzA1Mzk2ZDUxYyIsInVzZXJfbmFtZSI6InJhaiJ9	2017-09-04 11:14:36.582374+02
nw4llxi0mbl48vzalv4whxwedcibgk0q	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-28 11:05:41.764415+02
5acwdi4xytfa08vli3lm4rse5w6l1hbb	NzU1MDRjMDFiZmE4YzU0Y2I5M2UwMDg0Zjk4NzIwNzY1MDMwYzUyODp7InVzZXJfaWQiOjI0NSwiX2F1dGhfdXNlcl9pZCI6IjI0NSIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fSwiX2F1dGhfdXNlcl9oYXNoIjoiMDc4ZmEyOTVhMjZhMzdmNDA4NTlkZmExNGY1MGMxNTJiOTc1N2U3OCIsInVzZXJfbmFtZSI6IkphdGluIn0=	2017-08-28 13:23:38.467+02
8ppbc7xcpcudv2p35hh1nhhwo80s5wzd	OGJkMTc4NzU2YWIzOGEwNjZkYjUzZTdlNTQyOTQ3Y2E2MmE1NjE2ZTp7InVzZXJfaWQiOjI5NiwiX2F1dGhfdXNlcl9pZCI6IjI5NiIsInJlc3RhdXJhbnRfaWQiOjI5LCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fSwiX2F1dGhfdXNlcl9oYXNoIjoiY2Q3NDEwYWJlODkxYTdkMDViMzVhMmE1NTczZTE0MjgwMWI0OTEyNyIsInVzZXJfbmFtZSI6ImRoYW5lc2gifQ==	2017-08-31 06:13:29.820779+02
efs2oyhwpgtnsxje8b22lb1k45xp9ex0	MTM3ZmQ2ODhhNTVlM2JkYzQ5ZjFjZmNkMjM4NDkyZDYyNDVmMmI5ZTp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sInVzZXJfaWQiOjI4NSwidXNlcl90eXBlIjoiQ3VzdG9tZXIiLCJjYXJ0IjoicmFqIiwidXNlcl9uYW1lIjoicmFqIn0=	2017-08-16 10:43:54.828165+02
85j57ckq2vtdh40gmpfdjw1sd8mkewcb	ZjBiOTk5ODJkMmVmZmJjNjM1NTE5MjllM2UzMzYxY2U2YTk2YTQ2Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAxZGQ3MmFiNzVhZjVhM2Y3ZmMzNjg0MjMwZTRhYjA1OWZiMTYzMzciLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2lkIjoiMTUxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==	2017-08-16 11:16:00.546168+02
ps1sm98va4am0u4vfb955sjsm13d0cjw	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-31 13:39:54.593667+02
bfpeg5zz1zjrkye07r2jbw55mwqpekvo	OWM3ZjM5MTAyMTFiYzg1NTdmYWFiYmVjZjA3OGQzMGU0NmM5Mzk3Zjp7ImZhY2Vib29rX3N0YXRlIjoiWDJObzFqZHZ4N1R0NmhXN3JHS1BPUmFSb1A1elo4eEkiLCJuZXh0IjoiL2VuL2xvZ2luLyIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sInNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwidmZtQ05EaUFKM0hqIl19	2017-08-24 13:29:04.626322+02
cno32bs7bsziiqi51fmnnobby0uflvhw	MmM1ZGQ4ZmRlNzMzMjFlOTdmZjRmN2UyY2ZlZmM3MGIzYmIyZGRmNDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIyOTYiLCJyZXN0YXVyYW50X2lkIjoyOSwidXNlcl90eXBlIjoiUmVzdGF1cmFudCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidXNlcl9pZCI6Mjk2LCJfYXV0aF91c2VyX2hhc2giOiJjZDc0MTBhYmU4OTFhN2QwNWIzNWEyYTU1NzNlMTQyODAxYjQ5MTI3IiwidXNlcl9uYW1lIjoiZGhhbmVzaCJ9	2017-08-17 11:50:22.828636+02
c2smz5ekqnjjx1iiwciinhe1m7q5puz1	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-17 13:23:01.862203+02
7mmld6rbud49uf4iqic42yj86hp1wb6b	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-21 06:17:15.163887+02
i75k69drjfczfxe5tidbpzdmb8vgr0ck	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-21 15:05:40.58748+02
v9ki7uaox37arh976km3arwaqbbbdk2y	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-01 10:56:43.087137+02
mbradlq7k4n1kx23nw4aqfzdsyimqydj	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-01 11:34:27.054344+02
t6qtp66ogetv1nflk5ahg1dq1nbwc803	OTRmZTRjNTU0NmUxNjNiMWQ3M2UyOWY1ZGQwN2UzNmQ3NmEyMWYwODp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sImNhcnQiOiJndWVzdDIxMCJ9	2017-08-25 10:31:16.255261+02
bhsqvglomffl2p7dmhsm1wxf8nro2wtv	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-22 11:04:40.788293+02
j4omj1oufsw5e431dk83qtskpqj57t7h	M2MyM2FhMmIwNGU1MmUwNGVhNDVkNzRlZGJiYjI2NTA3YzYzNTgzMDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sInNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwic3VJSmNOTHhGVjVSIl19	2017-08-25 11:14:16.571237+02
q16xxu5muw0o1okknvft4sfpbnzy8bn4	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-25 11:20:04.566832+02
9y2pzz8ufu204v0a2upv69yxs1ho8m6q	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-22 13:49:32.276704+02
g4e866n4d5bv821joelllrq4558r2ndl	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-23 08:19:27.355229+02
0cnstt1i8wdno6xg1lbthys5jtxkq2rk	NWQ1ZGU4NWYzYzdkMjNhNTdkOWU4NzNmYTg2YTJlOGEzY2FlYTE5NDp7InVzZXJfaWQiOjI5NiwiX2F1dGhfdXNlcl9pZCI6IjI5NiIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiY2FydCI6ImFtaXQiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiIyYmY3YzgxMjUyNWFkODQ3NjdjNGZjNDcyOWFkOTgwYjk4OWVhZmFhIiwidXNlcl9uYW1lIjoiYW1pdCJ9	2017-09-01 12:30:56.599374+02
7ss6mi0j5b4dxmp7glb8lori3r5oj18u	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-02 15:42:01.252267+02
72ac5yahvmeav9ia1imxm6add6qxa8hx	ZDI0MzhmZWQxMmYyMGYwMzEyNTc2NWNlNDliMjQ1OTY2MGRkYzc3Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjEwOThiNzk1Zjk2ZmM5MzM4OTE2MDNiMGRiNTFjYWE2YjVmMWJkOGYiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2lkIjoiMzE2IiwiY2FydCI6Imd1ZXN0MTUwIn0=	2017-09-04 06:53:37.309341+02
s9m58q0o05jwmwwaxncqa694wtp1fn82	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-26 06:04:04.777822+02
0v1u7xt24dsspy6ylwntmnjnphbefui1	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-08-26 08:17:09.775207+02
r1ssclgg3u0jzpfqrc0pnw21mhmsmj41	NGM0M2UwNjIxYmQxMjIwOWY4OTY5YzM0MDQyOWJlNjMyOTNkNWE5ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjAxZGQ3MmFiNzVhZjVhM2Y3ZmMzNjg0MjMwZTRhYjA1OWZiMTYzMzciLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTUxIn0=	2017-09-01 13:34:48.45381+02
h5c8wn8twjry54ge4th58n1l9agyuuo1	ZTdkMTNjZGZlNjMyMzY2ZTczZTgzNGE4NzVmN2ZjNzJkYzQ5YWZjNjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sImNhcnQiOiJndWVzdDEyNiJ9	2017-09-01 14:25:53.738084+02
plrqpy4sd6hnq6430oygygkj0rth8kap	NGM0M2UwNjIxYmQxMjIwOWY4OTY5YzM0MDQyOWJlNjMyOTNkNWE5ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjAxZGQ3MmFiNzVhZjVhM2Y3ZmMzNjg0MjMwZTRhYjA1OWZiMTYzMzciLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTUxIn0=	2017-09-01 14:41:34.020739+02
64npawukq44k4oskb66s4blhmx0acafj	MzE4ZmY1OWYzNTRiNWRlNjhkZGM4NmY0ZDkwMDI5ZDM4NTM0YWQ4ZTp7InVzZXJfaWQiOjI4NSwiX2F1dGhfdXNlcl9pZCI6IjI4NSIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiY2FydCI6Imd1ZXN0OTciLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiJlNDIwMTIyMGU2OGZlYTkyMjEyZmNlNzc1NmFiNjBhMWZiMjg4ZTJmIiwidXNlcl9uYW1lIjoicmFqIn0=	2017-08-26 18:12:34.593346+02
1tcflldc5eeombyxmg6g6kuedog59ujg	NGM0M2UwNjIxYmQxMjIwOWY4OTY5YzM0MDQyOWJlNjMyOTNkNWE5ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjAxZGQ3MmFiNzVhZjVhM2Y3ZmMzNjg0MjMwZTRhYjA1OWZiMTYzMzciLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTUxIn0=	2017-09-02 07:19:30.918468+02
4w69e7n8amqfgpmg6l10n0st5zbfa8ds	NzU1MDRjMDFiZmE4YzU0Y2I5M2UwMDg0Zjk4NzIwNzY1MDMwYzUyODp7InVzZXJfaWQiOjI0NSwiX2F1dGhfdXNlcl9pZCI6IjI0NSIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fSwiX2F1dGhfdXNlcl9oYXNoIjoiMDc4ZmEyOTVhMjZhMzdmNDA4NTlkZmExNGY1MGMxNTJiOTc1N2U3OCIsInVzZXJfbmFtZSI6IkphdGluIn0=	2017-08-28 13:22:02.38313+02
tzrnuktahtzfd623ytjf2e3wlisrbvyx	NmY5NWU3NjU2NWZmNTg1YjdjYmQ2OTI2YzIwNjUwMGFmODBiZWRhNjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIyODUiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsInVzZXJfaWQiOjI4NSwiX2F1dGhfdXNlcl9oYXNoIjoiYWQ4NDEyNzU0YjQ5OWEwZjgxNmJlZTRhZWNiZDNjNzA1Mzk2ZDUxYyIsInVzZXJfbmFtZSI6InJhaiJ9	2017-09-02 14:46:16.592253+02
41s2b1s22nc67pv92xyv1dwx0diajhiy	MWIxZTg1NmY4YTg0NWUzYmI2MzliZWVlYTg3OGE0MjU1YjIyOTdmMTp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIyODUiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsImNhcnQiOiJyYWoiLCJ1c2VyX2lkIjoyODUsIl9hdXRoX3VzZXJfaGFzaCI6ImFkODQxMjc1NGI0OTlhMGY4MTZiZWU0YWVjYmQzYzcwNTM5NmQ1MWMiLCJ1c2VyX25hbWUiOiJyYWoifQ==	2017-09-04 12:25:46.50823+02
5wgu5e27fg76hdvgbgyzy7vl1dw0m281	NGM0M2UwNjIxYmQxMjIwOWY4OTY5YzM0MDQyOWJlNjMyOTNkNWE5ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjAxZGQ3MmFiNzVhZjVhM2Y3ZmMzNjg0MjMwZTRhYjA1OWZiMTYzMzciLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTUxIn0=	2017-09-04 11:21:19.16314+02
e7mv5db1u6tudvipbyaavdfdqrky7o6b	ZDdjOWVkYmMzNGEwOWIxYjk0OWI5MTZhZGMxMzk3Y2NmYzAyMzM0NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjAxZGQ3MmFiNzVhZjVhM2Y3ZmMzNjg0MjMwZTRhYjA1OWZiMTYzMzciLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2lkIjoiMTUxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-09-04 12:31:22.932771+02
3asf263nb87wuqemkiy9r8g2cp08uu3k	ZjZjMjQyMzY3NWI1MDFiMDVkODI2NWMxZjI5NzFkYmJmNTQzMmFmNTp7Il9hdXRoX3VzZXJfaGFzaCI6ImVhZGQyNzM0MmY2YmVlOGM1ZWI4OGVlMTIzNzZhOWNkZTI2ZWQ3MGIiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2lkIjoiMzIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-09-09 10:44:40.801647+02
yn1gyj2g7ppfttc1d9mhlfvtawlwqwlc	MDJlMWFkZTM4M2NjMWYzNzYzZTVjMDI0NjU3ZjE3ODI5MmY5Y2JmYTp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sImNhcnQiOiJndWVzdDE3NSJ9	2017-09-06 11:45:04.749509+02
edv460h74s9ad1z1kbunnw4juy5xgfar	OTQ5ODU2MWNmNDBlNTJhOTE1MDFmZmViNzNiOWFiOGQxMzA3NzM0MTp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sInNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwienVqM3hWOWtSdWI0Il19	2017-09-06 14:22:13.616397+02
3mnnskkr64vb4o3tl8ppzx55ce9pqjej	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-06 14:35:41.267032+02
xludexdztlu1ij6fw5fr3qdso05y28tq	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-06 11:24:09.699878+02
z9y4ku8zc6ij04ioaii7tlf0jy2bremk	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-06 12:48:33.851804+02
7whof3hzo7f7we8okf0js41f5inbtv1r	NWVlM2MzOGE3ZDFjNzI1NzM0YjMzYTQ1NzA5YjFhNTQxYmU2YjZkZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVhZGQyNzM0MmY2YmVlOGM1ZWI4OGVlMTIzNzZhOWNkZTI2ZWQ3MGIiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMzIyIn0=	2017-09-07 13:12:23.406485+02
hiih0swswx6azrgds3714j8rlymcyxj1	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-06 15:09:08.435653+02
ffyauprl1mzg2x4f1xv23pmm7meqqma8	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-06 06:47:10.551761+02
et24rnen378nasttjnivr2edv2m9w6cf	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-06 06:50:24.857236+02
gipyndiqshyvfy1vjo9xvh2apl1jr78j	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-09 07:45:16.117503+02
zbbxvv39orl2b4xl2f8iv07uck5p3egf	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-07 06:16:32.518183+02
n2cs5dospgp2dbcybuhgwhjph24gn7av	ZjZjMjQyMzY3NWI1MDFiMDVkODI2NWMxZjI5NzFkYmJmNTQzMmFmNTp7Il9hdXRoX3VzZXJfaGFzaCI6ImVhZGQyNzM0MmY2YmVlOGM1ZWI4OGVlMTIzNzZhOWNkZTI2ZWQ3MGIiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2lkIjoiMzIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-09-09 08:40:11.873541+02
86jtiihc3kuf2elpnfv7aduu8i5pf7f8	NjFlMzM4ZDMwOTYwZTllMTJmYzYwZTRlMDVlNmY1OWQ2OWQ0NGM2Yzp7InVzZXJfaWQiOjM2MSwiX2F1dGhfdXNlcl9pZCI6IjM2MSIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiY2FydCI6ImlzaHUiLCJfbGFuZ3VhZ2UiOiJlbiIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaGFzaCI6IjBmYzJjNGRhY2Y1Y2ZiNTM5NmZmMzVjNzE0M2Q1YmVmNDg1YTJkZDMiLCJ1c2VyX25hbWUiOiJpc2h1In0=	2017-09-09 08:48:18.252985+02
qhsg96xc6xutmrl0gvnvjx43wdevnde7	ODE5ZmEzZjk5NmRkYmE0OGIzZDI1ZGQ4YmI2ZTBmY2FhOTkyOWU0Mzp7Il9sYW5ndWFnZSI6ImVuIiwic29jaWFsYWNjb3VudF9zb2NpYWxsb2dpbiI6eyJ0b2tlbiI6eyJhY2NvdW50X2lkIjpudWxsLCJhcHBfaWQiOjIsImV4cGlyZXNfYXQiOiIyMDE3LTEwLTIyVDA2OjE4OjAxLjA3MVoiLCJ0b2tlbiI6IkVBQVZpNHZvYmJNTUJBSzZ6Q2ZKUmRtMGxaQlQ2Q1kwaVFpNWNaQ1BxSHVhbUxCeTNLTEhaQ2phUHBZWkJtbEkyWFpBUkNISnNFbWdnbFpBaTZRZHJlNjNZOTVkYzVZdVFSMk41dlJQd2ZlYURxUGFTUmtqMzU2TmpQZ05Wd2VaQzZDYmlldUl4WERlbUQ5TVI0azZkWGMwTkdxdFpCbkJIN3kwU1hleGdqTnF2NXdaRFpEIiwiaWQiOm51bGwsInRva2VuX3NlY3JldCI6IiJ9LCJhY2NvdW50Ijp7InVzZXJfaWQiOm51bGwsInVpZCI6IjcxODkyNjE2NDk2MjkyOCIsImxhc3RfbG9naW4iOm51bGwsInByb3ZpZGVyIjoiZmFjZWJvb2siLCJleHRyYV9kYXRhIjp7ImZpcnN0X25hbWUiOiJBbWl0IiwibGFzdF9uYW1lIjoiUmFuYSIsInZlcmlmaWVkIjp0cnVlLCJuYW1lIjoiQW1pdCBSYW5hIiwibG9jYWxlIjoiZW5fVVMiLCJnZW5kZXIiOiJtYWxlIiwidXBkYXRlZF90aW1lIjoiMjAxNy0wNy0xMVQxMjowNToyNyswMDAwIiwibGluayI6Imh0dHBzOi8vd3d3LmZhY2Vib29rLmNvbS9hcHBfc2NvcGVkX3VzZXJfaWQvNzE4OTI2MTY0OTYyOTI4LyIsImlkIjoiNzE4OTI2MTY0OTYyOTI4IiwidGltZXpvbmUiOjUuNSwiZW1haWwiOiJ0ZXN0ZXJlc2ZlcmFAZ21haWwuY29tIn0sImlkIjpudWxsLCJkYXRlX2pvaW5lZCI6bnVsbH0sInN0YXRlIjp7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiZW1haWxfYWRkcmVzc2VzIjpbeyJ1c2VyX2lkIjpudWxsLCJlbWFpbCI6InRlc3RlcmVzZmVyYUBnbWFpbC5jb20iLCJ2ZXJpZmllZCI6ZmFsc2UsImlkIjpudWxsLCJwcmltYXJ5Ijp0cnVlfV0sInVzZXIiOnsidXNlcm5hbWUiOiIiLCJmaXJzdF9uYW1lIjoiQW1pdCIsImxhc3RfbmFtZSI6IlJhbmEiLCJpc19hY3RpdmUiOnRydWUsImVtYWlsIjoidGVzdGVyZXNmZXJhQGdtYWlsLmNvbSIsImlzX3N1cGVydXNlciI6ZmFsc2UsImlzX3N0YWZmIjpmYWxzZSwibGFzdF9sb2dpbiI6bnVsbCwicGFzc3dvcmQiOiIhb1VsVzlZWFZ6RzNPMnNGN2FadFVqVThFNUJtVVFQMm5PS3R0MzBIRSIsImlkIjpudWxsLCJkYXRlX2pvaW5lZCI6IjIwMTctMDgtMjRUMDY6MDI6NTguMjEwWiJ9fSwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fX0=	2017-09-07 08:02:58.222838+02
zpjvai4eogghajcjqdkw4oap4ii0lrmc	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-07 08:14:54.367335+02
e5uxs91ln8nlquuixjh7vtrqakp81w3f	MTU1ZTczOWM0MzliZmIxZjExNmM1ZGYzYTBlZTNhMjdlOTZiYjEzNjp7InJlc3RhdXJhbnRfaWQiOjMzLCJfYXV0aF91c2VyX2hhc2giOiJlYWRkMjczNDJmNmJlZThjNWViODhlZTEyMzc2YTljZGUyNmVkNzBiIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fSwiX2F1dGhfdXNlcl9pZCI6IjMyMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2017-09-06 07:40:34.445839+02
ccpaxp4tuqrpckzary0gadty9ywypc8r	NWVlM2MzOGE3ZDFjNzI1NzM0YjMzYTQ1NzA5YjFhNTQxYmU2YjZkZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVhZGQyNzM0MmY2YmVlOGM1ZWI4OGVlMTIzNzZhOWNkZTI2ZWQ3MGIiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMzIyIn0=	2017-09-06 07:51:57.438527+02
1m3ixp2gt66in4ixy34pr0pbcrjbvu8t	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-06 08:08:46.193971+02
7tjlbkhcpiqvi1k8citvll1ffvj9e3ed	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-06 11:24:09.781419+02
8i2iebk7p17yun66eimsscxon9obx78a	MjAzZjcwZmRhMWI5ODFhYjJmNTNhYzE4ZDdiNjk4NTQwMjYzNTI4MDp7Il9sYW5ndWFnZSI6ImVuIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fX0=	2017-09-09 09:21:56.062307+02
cuivh8fivfwxmbxhycfxtvv1ktbke7fx	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-06 08:12:12.816335+02
jezas4ua8i8icko6lorq8md5q64ciu1g	OGIxNmYzZjE0OGRkYjQ0MjRkY2JjMDA2NThhYmQ0OWRlYzJiYzc1Mzp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sImNhcnQiOiJndWVzdDE3NiJ9	2017-09-06 12:04:50.56122+02
uncadbc3gc1epgge0hly0hq6uph4twl4	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-06 08:12:51.447897+02
8nrgv96dl0lgpis5bzuyu337fdhw7p43	MjlmMDRmNDE3MmQ3MmUxZjFmYWEzNmIxMTVhNmVkMWI5YjU2OGNmOTp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIzMzIiLCJzb2NpYWxhY2NvdW50X3NvY2lhbGxvZ2luIjp7ImFjY291bnQiOnsidXNlcl9pZCI6bnVsbCwidWlkIjoiMTkyNDY0MTIyNDQ5MDA2NiIsImxhc3RfbG9naW4iOm51bGwsInByb3ZpZGVyIjoiZmFjZWJvb2siLCJleHRyYV9kYXRhIjp7ImZpcnN0X25hbWUiOiJQYW5ha2FqIiwibGFzdF9uYW1lIjoiU2hhcm1hIiwidmVyaWZpZWQiOnRydWUsIm5hbWUiOiJQYW5ha2FqIFNoYXJtYSIsImxvY2FsZSI6ImVuX1VTIiwiZ2VuZGVyIjoibWFsZSIsInVwZGF0ZWRfdGltZSI6IjIwMTUtMDQtMDJUMDQ6Mzg6MzYrMDAwMCIsImxpbmsiOiJodHRwczovL3d3dy5mYWNlYm9vay5jb20vYXBwX3Njb3BlZF91c2VyX2lkLzE5MjQ2NDEyMjQ0OTAwNjYvIiwiaWQiOiIxOTI0NjQxMjI0NDkwMDY2IiwidGltZXpvbmUiOjUuNSwiZW1haWwiOiJwYW5rYWpfa3VtYXJAZXNmZXJhc29mdC5jb20ifSwiaWQiOm51bGwsImRhdGVfam9pbmVkIjpudWxsfSwidG9rZW4iOnsiYWNjb3VudF9pZCI6bnVsbCwiYXBwX2lkIjoyLCJleHBpcmVzX2F0IjoiMjAxNy0xMC0yMlQwNjowNjozNi45NzRaIiwidG9rZW4iOiJFQUFWaTR2b2JiTU1CQUVjN1lsSlVYWGpzS1RTMml5bWxpblpBRUVSa09VT3E2UFR5eVpBZ0thaTJKU3M2anQ0Z0FaQ3g0aElaQ2xMNWN5eXJWUlNsMnZxcmFiRktoQktTTGxaQVRlSXo4N2xJRVc2d2pwT2FqOWtta2R2SnMwZzNpaDBsMVpDMmVWendyU2pwRDlwVHhmM2NlVkJsZmF3T3FjTHJZWkJtTHdQcFFaRFpEIiwiaWQiOm51bGwsInRva2VuX3NlY3JldCI6IiJ9LCJ1c2VyIjp7InVzZXJuYW1lIjoiIiwiZmlyc3RfbmFtZSI6IlBhbmFrYWoiLCJsYXN0X25hbWUiOiJTaGFybWEiLCJpc19hY3RpdmUiOnRydWUsImVtYWlsIjoicGFua2FqX2t1bWFyQGVzZmVyYXNvZnQuY29tIiwiaXNfc3VwZXJ1c2VyIjpmYWxzZSwiaXNfc3RhZmYiOmZhbHNlLCJsYXN0X2xvZ2luIjpudWxsLCJwYXNzd29yZCI6IiEyZkJENVlmMENEZUZhS1VSZXhIekV0ODVkeHdjNHdxdnZLdDIwTmRCIiwiaWQiOm51bGwsImRhdGVfam9pbmVkIjoiMjAxNy0wOC0yM1QwNjowNjozNy4xMDdaIn0sImVtYWlsX2FkZHJlc3NlcyI6W3siaWQiOm51bGwsInVzZXJfaWQiOm51bGwsInZlcmlmaWVkIjpmYWxzZSwiZW1haWwiOiJwYW5rYWpfa3VtYXJAZXNmZXJhc29mdC5jb20iLCJwcmltYXJ5Ijp0cnVlfV0sInN0YXRlIjp7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifX0sIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaGFzaCI6ImI5YTFlMjM4NzkxNTIyZWFhNWMyNjRjNzlhNDU3YzZkZjgyY2RmNTEifQ==	2017-09-09 10:55:08.708696+02
098yvsjxfm1wj0nkxspvqbvlnbw3iy2w	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-06 08:13:05.587946+02
2zq7mnx7kknwt55yfmkzfkjv5plexxnh	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-06 13:11:05.605433+02
t06u4ki4vcs6tqtm4z8em3pvjgsgn3aa	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-06 14:31:20.564351+02
xeum3dqhy4m8t1jkqsgsdvp98jddvbiv	Zjg4YjA5YTQ0MjlhMjhmN2JhNzlhNjUxNDIyMjU2MzMxMjQ0MzAyMzp7InVzZXJfaWQiOjM1NiwiX2F1dGhfdXNlcl9pZCI6IjM1NiIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiI4ZDdkOGFjYmY2YTNjZGI1YzczZjdmYTAyZWIxY2FhZDFiNWYyM2VhIiwidXNlcl9uYW1lIjoiZmQifQ==	2017-09-07 10:48:11.914607+02
jxwzwh7q9z3l4qimu1jqtmcxzhbkhq9s	NDM4MDJmZjBhMTAxNWIxMGY3OTZjNWIzNjU1MjNiMjE5Yjg1MTUwYjp7InVzZXJfaWQiOjM0NiwiX2F1dGhfdXNlcl9pZCI6IjM0NiIsInJlc3RhdXJhbnRfaWQiOjM5LCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiIwMzBkNWY2MzVjMGM0Y2RjYTEzYzNiYmExMzcyNWFmZjk0Mzc3YWRjIiwidXNlcl9uYW1lIjoiYWJjZCJ9	2017-09-06 15:31:41.678314+02
x9eq747y6slpbwqmawe6y248u5e8o2is	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-09 07:49:15.693951+02
gljf19bqj15y7wls741r1p9uk5bdeyzv	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-09 08:48:45.973062+02
2kz7q27hiuu0mji662lxntxz4sm9lo8d	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-06 11:24:10.070452+02
bue1wr6go5ha7t47sv2ktozqd3zx2asq	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-06 13:24:18.88145+02
4b0pqnok9ay3kq7y8aeroexb3w3ugfg7	YTVkNWYyYjE2NzkyOTkxZjA3YTU4ZDAxNmUwYjdkMGU1OTc3NGJmNzp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sInNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiUks1Tm9KUUM1S2s2Il19	2017-09-09 10:06:55.180501+02
xzmgqcl6qc3mntm4jndrtvvxfk7malox	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-07 13:27:06.692778+02
vrr5b2r3zgwinqtocnze69wnp33u38yg	MjAzZjcwZmRhMWI5ODFhYjJmNTNhYzE4ZDdiNjk4NTQwMjYzNTI4MDp7Il9sYW5ndWFnZSI6ImVuIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fX0=	2017-09-07 13:48:47.778829+02
8b208laq8jrb7eqt3srrf6gcfswulk7o	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-07 08:11:13.5366+02
w84vllpp0aogdk5r4unh4xlcyqts15dq	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-09 08:46:41.084203+02
exvk6iqb9bhg1t2m8f8sjkhq8oarak7x	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-06 08:38:22.694369+02
bupaw1q6nxsvntg577yyewkndl8ge0yb	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-09 10:07:22.224019+02
fthdlltjz0az97ie55msmtra541a847d	NzYzNmYyM2M4OTYyMGI2MDJjOGU2NzlmOTczODVlN2E4MmY1ZTQxMzp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sImNhcnQiOiJndWVzdDE3NCJ9	2017-09-06 11:33:12.856341+02
sd2cgqsh529fwaqnd98b8ldtugbkpqer	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-06 08:50:51.104047+02
5tv440d5zdncyt0frzh5aivcnib9k74u	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-07 13:27:12.886058+02
m404yyt0j55aoepbi3g8zg7vjvcfqo6w	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-06 10:35:30.894508+02
1c2lj0dzg9d9aa6fume45regekrpom36	YmEwNTc2NjQ0M2YzNGJlMjU1MmJhNjU1ZTJhMjk3NGMwNWZhMTI3Mzp7InJlc3RhdXJhbnRfaWQiOjEyLCJfYXV0aF91c2VyX2hhc2giOiJlYWRkMjczNDJmNmJlZThjNWViODhlZTEyMzc2YTljZGUyNmVkNzBiIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fSwiX2F1dGhfdXNlcl9pZCI6IjMyMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2017-09-06 12:25:31.976269+02
nyc4zxpqsookj8v9uubyxncmo40gpmqk	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-06 15:01:48.920108+02
1zfuew24r7f0ddsyld9j0yauxox22tvk	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-06 10:56:36.456616+02
9bg7ionyh6lrr3bwtxymezro215wrsch	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-09 07:40:58.535968+02
svoh6gxclt19zulpvhyua8621m8215uw	MTRkNmJhODIxYjRiMGY1ZDUwYzg1OTQxMTNhMGNjMGFlYTkwMzI4Nzp7Il9hdXRoX3VzZXJfaGFzaCI6IjVlMTk0MTdiNTNjMDIzMmVmMzM1OGIxN2EwMmE2YWI5NjQwNDU0ZDgiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2lkIjoiMzM2Iiwic29jaWFsYWNjb3VudF9zb2NpYWxsb2dpbiI6eyJhY2NvdW50Ijp7InVzZXJfaWQiOm51bGwsInVpZCI6ImZiMTZiSllfRm0iLCJsYXN0X2xvZ2luIjpudWxsLCJwcm92aWRlciI6ImxpbmtlZGluIiwiZXh0cmFfZGF0YSI6eyJlbWFpbC1hZGRyZXNzIjoidGVzdGVyZXNmZXJhQGdtYWlsLmNvbSIsImxhc3QtbmFtZSI6InJhbmEiLCJwaWN0dXJlLXVybHMiOnsicGljdHVyZS11cmwiOiJodHRwczovL21lZGlhLmxpY2RuLmNvbS9tcHIvbXByeC8wX0N6bHZZMm10RkZYSjFZaDM2VHlVWlM3SzNMUk16eTIzNlRmNFpES3l1bHNzbGdZN2tMck1WSXJ4MWp2In0sInB1YmxpYy1wcm9maWxlLXVybCI6Imh0dHBzOi8vd3d3LmxpbmtlZGluLmNvbS9pbi9hbWl0LXJhbmEtOGE1OTI0OTciLCJwaWN0dXJlLXVybCI6Imh0dHBzOi8vbWVkaWEubGljZG4uY29tL21wci9tcHJ4LzBfLUZKakMtcHVNeFFZWmhiY3lpd0NDbFlpSnlBMTRfQmN5X0RDQ2xwcjZNTEdGRjhCWTNkQTJBZU9jLWxEVWtuUjFYUmlTOUdJcXBJQiIsImZpcnN0LW5hbWUiOiJhbWl0IiwiaWQiOiJmYjE2YkpZX0ZtIn0sImlkIjpudWxsLCJkYXRlX2pvaW5lZCI6bnVsbH0sImVtYWlsX2FkZHJlc3NlcyI6W3sidXNlcl9pZCI6bnVsbCwiZW1haWwiOiJ0ZXN0ZXJlc2ZlcmFAZ21haWwuY29tIiwidmVyaWZpZWQiOmZhbHNlLCJpZCI6bnVsbCwicHJpbWFyeSI6dHJ1ZX1dLCJzdGF0ZSI6eyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sInRva2VuIjp7ImFjY291bnRfaWQiOm51bGwsImFwcF9pZCI6MSwiZXhwaXJlc19hdCI6bnVsbCwidG9rZW4iOiJmZDY1Mjg5Zi02Mzc2LTRhZWMtYTdiYy00OGZlZTU2NDA4YTYiLCJpZCI6bnVsbCwidG9rZW5fc2VjcmV0IjoiODQ1NWMzOTgtOTliYS00MzY3LWE5NzktMzIwY2U5YWVhMzQyIn0sInVzZXIiOnsidXNlcm5hbWUiOiIiLCJmaXJzdF9uYW1lIjoiYW1pdCIsImxhc3RfbmFtZSI6InJhbmEiLCJpc19hY3RpdmUiOnRydWUsImVtYWlsIjoidGVzdGVyZXNmZXJhQGdtYWlsLmNvbSIsImlzX3N1cGVydXNlciI6ZmFsc2UsImlzX3N0YWZmIjpmYWxzZSwibGFzdF9sb2dpbiI6bnVsbCwicGFzc3dvcmQiOiIhU0J0czNlSTRzbmh6WW9zMkV6aVNkVk5IVklMWkc4MkFsVTBsVzJvRSIsImlkIjpudWxsLCJkYXRlX2pvaW5lZCI6IjIwMTctMDgtMjNUMDg6NTc6NDAuNjE0WiJ9fSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbCwib2F1dGhfYXBpLmxpbmtlZGluLmNvbV9hY2Nlc3NfdG9rZW4iOnsib2F1dGhfdG9rZW5fc2VjcmV0IjoiODQ1NWMzOTgtOTliYS00MzY3LWE5NzktMzIwY2U5YWVhMzQyIiwib2F1dGhfYXV0aG9yaXphdGlvbl9leHBpcmVzX2luIjoiNTE4Mzk5OCIsIm9hdXRoX3Rva2VuIjoiZmQ2NTI4OWYtNjM3Ni00YWVjLWE3YmMtNDhmZWU1NjQwOGE2Iiwib2F1dGhfZXhwaXJlc19pbiI6IjUxODM5OTgifSwib2F1dGhfYXBpLmxpbmtlZGluLmNvbV9yZXF1ZXN0X3Rva2VuIjp7Im9hdXRoX3Rva2VuX3NlY3JldCI6IjMyZWNmZTZkLTQ4OTEtNDFhZS1hYTA5LTMwOGRlYmJiZjI5ZSIsIm9hdXRoX3Rva2VuIjoiNzctLWQyOTcyNjEyLWM5ODEtNGU1ZS05MDViLTk2ZDJhODA4NWIwNiIsInhvYXV0aF9yZXF1ZXN0X2F1dGhfdXJsIjoiaHR0cHM6Ly9hcGkubGlua2VkaW4uY29tL3Vhcy9vYXV0aC9hdXRob3JpemUiLCJvYXV0aF9leHBpcmVzX2luIjoiNTk5Iiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSJ9fQ==	2017-09-06 10:59:43.768701+02
nec89kdr6jyaamoujt814o31d31o51zf	NzgxNzNkODkyMGM1Yzk3MmFmMzZhOTkwZjg3OGJjNDJlZTZlMTVjZjp7InJlc3RhdXJhbnRfaWQiOjM5LCJfYXV0aF91c2VyX2hhc2giOiJlYWRkMjczNDJmNmJlZThjNWViODhlZTEyMzc2YTljZGUyNmVkNzBiIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fSwiX2F1dGhfdXNlcl9pZCI6IjMyMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2017-09-07 08:34:28.362377+02
36f1h9r1hntp42ulrw45wogr0hn5wk1x	ZDM0NGMxMWQxYzc2OGRhOWRlMjQyMDAxZTkwMjBlZjI0MzViZDMzZTp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIzNjkiLCJzb2NpYWxhY2NvdW50X3NvY2lhbGxvZ2luIjp7ImFjY291bnQiOnsidXNlcl9pZCI6bnVsbCwidWlkIjoiMTU1MTUyNzMzNDkwNTU2OCIsImxhc3RfbG9naW4iOm51bGwsInByb3ZpZGVyIjoiZmFjZWJvb2siLCJleHRyYV9kYXRhIjp7ImZpcnN0X25hbWUiOiJSYWppbmRlciIsImxhc3RfbmFtZSI6Ik1vaGFuIiwidmVyaWZpZWQiOnRydWUsIm5hbWUiOiJSYWppbmRlciBNb2hhbiIsImxvY2FsZSI6ImVuX1VTIiwiZ2VuZGVyIjoibWFsZSIsInVwZGF0ZWRfdGltZSI6IjIwMTctMDgtMTRUMjE6MjQ6MTArMDAwMCIsImxpbmsiOiJodHRwczovL3d3dy5mYWNlYm9vay5jb20vYXBwX3Njb3BlZF91c2VyX2lkLzE1NTE1MjczMzQ5MDU1NjgvIiwiaWQiOiIxNTUxNTI3MzM0OTA1NTY4IiwidGltZXpvbmUiOjUuNSwiZW1haWwiOiJyYWppbmRlci5tb2hhbjAwMkBnbWFpbC5jb20ifSwiaWQiOm51bGwsImRhdGVfam9pbmVkIjpudWxsfSwidG9rZW4iOnsiYWNjb3VudF9pZCI6bnVsbCwiYXBwX2lkIjoyLCJleHBpcmVzX2F0IjoiMjAxNy0xMC0yNVQwODo0NDowMC43MDFaIiwidG9rZW4iOiJFQUFWaTR2b2JiTU1CQUR1aHoyOUFtSDhjbnRESHVXZ0E1eHhlUXJoTVpCNjF2YmtONHBhWkFkNDhRcjJ4RXBCQkZKR3FIbXFyNlRoaUF5UHF4V1pDejg1dWdVSlN0YVRNdkpJWFpDY0tMNVEyTkxKdHRjZ25wdE1uVnpaQWJFdVVUM1Q2RFFYT2xsSDg0dE9pR0hBSTFaQ3Rod0twdkdhVHJkaDJQSXV5ZFZQZ1pEWkQiLCJpZCI6bnVsbCwidG9rZW5fc2VjcmV0IjoiIn0sInVzZXIiOnsidXNlcm5hbWUiOiIiLCJmaXJzdF9uYW1lIjoiUmFqaW5kZXIiLCJsYXN0X25hbWUiOiJNb2hhbiIsImlzX2FjdGl2ZSI6dHJ1ZSwiZW1haWwiOiJyYWppbmRlci5tb2hhbjAwMkBnbWFpbC5jb20iLCJpc19zdXBlcnVzZXIiOmZhbHNlLCJpc19zdGFmZiI6ZmFsc2UsImxhc3RfbG9naW4iOm51bGwsInBhc3N3b3JkIjoiIW43a1VMd2pGZHYxaUp2UXlVUExnbDE1V21nMkNOdkJSa2Y0VjBmMlgiLCJpZCI6bnVsbCwiZGF0ZV9qb2luZWQiOiIyMDE3LTA4LTI2VDA4OjQ0OjAwLjg5N1oifSwiZW1haWxfYWRkcmVzc2VzIjpbeyJpZCI6bnVsbCwidXNlcl9pZCI6bnVsbCwidmVyaWZpZWQiOmZhbHNlLCJlbWFpbCI6InJhamluZGVyLm1vaGFuMDAyQGdtYWlsLmNvbSIsInByaW1hcnkiOnRydWV9XSwic3RhdGUiOnsicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiJ9fSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiY2FydCI6IlJhamluZGVyX21vaGFuIiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbCwiX2xhbmd1YWdlIjoiZW4iLCJfYXV0aF91c2VyX2hhc2giOiI0M2M4NjQxODE1MGE1Yzg1MjBhYzY3Zjk2MmVjNzE3YmIyZjgzZWE2In0=	2017-09-09 10:45:57.832888+02
ulzi9yq0258kxdda2x1fekeacbaushks	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-02 12:18:06.804929+02
0gx9qekio552xr58t5tqccp2up1cmrbh	Y2Q4NmQ0MzhkMWZmNjM2MmIzNWM3OWQ3OThjY2Q2MDdmOWZhZThmZjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sInNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwicmtCR2tUWWRDNUdlIl19	2017-09-11 11:11:48.500132+02
8n26w8zw6nvl3t3uu5bzhusq20zdd1zl	Y2I0M2JiODg2ZTBhMjY5NGJmMjI1MGVhZDI4YmZjNzU1NmQ0ODJiMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2017-09-23 06:48:04.18966+02
mukongnhjaofd3yzvyey0qubg0qeafv2	MDRlMzZmNzE0NTI4OThmYzE4MTQ5ZDhlODczYjlhMDZmOTM2ZWE3OTp7Il9hdXRoX3VzZXJfaGFzaCI6ImVhZGQyNzM0MmY2YmVlOGM1ZWI4OGVlMTIzNzZhOWNkZTI2ZWQ3MGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMzIyIn0=	2017-09-14 20:32:23.473386+02
lw5rjzbcc8wtygsdqfjjfpzin16nm72b	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-24 13:13:24.206037+02
qaryhwv4h6szfdzgfo9oqij91ktt2ku8	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-11 11:16:27.532745+02
pmomv89aubvj8d9ga6yc0j7vzrjykm4b	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-23 06:02:22.720908+02
p5tr0dpx5fcib63ctkxvmgzy48wdgu70	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-15 15:06:38.870305+02
2413q3czyz52099jvym28kprx6j3gp6t	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-19 12:42:57.148082+02
91hhf5dn6ejsb98pu352kjgido7u90po	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-19 12:50:04.593429+02
11glfskik2u8hp26p86b3j3tbm226ge7	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-19 12:56:02.388381+02
dsvnkxdf6sb1j2y9r0exkyqe9maw4xkz	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-19 13:00:18.735002+02
fnp30shc2yf2zmzqvdv5ggz52fhnewcq	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-13 05:49:32.379376+02
krrv1n73s2u92hrhxa16m39e6v4hfx5v	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-20 11:19:25.571139+02
bipkhbby11fkhl2b5yzycr9pwis5uqml	OWQwNGU5Zjg4ZjBmMTkzNTllODc5ZDBhZjU2MDBhMjRmOTM5ZTVmMzp7InVzZXJfaWQiOjM3MywiX2F1dGhfdXNlcl9pZCI6IjM3MyIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiJjMTdiZDY2MTI2NDVhMjA4YWNmMTIzZWU0MTFiY2JhZmUzNmYxN2JlIiwidXNlcl9uYW1lIjoiYXBhcm5hIn0=	2017-09-13 08:06:43.298583+02
tztxpwm9hkqjlk01rtidq45snzlzmbi4	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-14 11:43:00.403178+02
9u9j9hg2zek7llhq2iqm0fiwnam0u1a6	N2IyYWI4YzNkZDc0ZDY4Y2E3YThkOTNjM2IwNTY5ZjdjMTIyYmY0Yzp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIzNzMiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsImNhcnQiOiJhcGFybmEiLCJfbGFuZ3VhZ2UiOiJlbiIsInVzZXJfaWQiOjM3MywiX2F1dGhfdXNlcl9oYXNoIjoiYzE3YmQ2NjEyNjQ1YTIwOGFjZjEyM2VlNDExYmNiYWZlMzZmMTdiZSIsInVzZXJfbmFtZSI6ImFwYXJuYSJ9	2017-09-14 15:30:51.984836+02
1eo0pz4zdm99emo1cbnv51ufdhb97d9q	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-11 12:16:13.502341+02
87dvv7qrlurvx3kx0hkjzb1ax7bb8x7a	ODFhYTFiYWI3YjUxZWIyODE0Njc4YjVhODZmNTk4ODMzMmQwNGVhMTp7InVzZXJfaWQiOjM3MywiX2F1dGhfdXNlcl9pZCI6IjM3MyIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiY2FydCI6ImFwYXJuYSIsIl9sYW5ndWFnZSI6ImVuIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fSwiX2F1dGhfdXNlcl9oYXNoIjoiYzE3YmQ2NjEyNjQ1YTIwOGFjZjEyM2VlNDExYmNiYWZlMzZmMTdiZSIsInVzZXJfbmFtZSI6ImFwYXJuYSJ9	2017-09-11 12:21:19.36608+02
fpw1hoyvlmvsl9xcq9muxs1m892e1xy8	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-11 12:24:34.370082+02
igaozadz5o7mmmx60f5ablf4e5sys0vd	NGY4ZDlkY2NiMjg2NTY5MzMxOGVkZDgzMDJlNmM3YWQxYzJlY2QwYzp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIzNzMiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsImNhcnQiOiJhcGFybmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiIsInVzZXJfaWQiOjM3MywiX2F1dGhfdXNlcl9oYXNoIjoiYzE3YmQ2NjEyNjQ1YTIwOGFjZjEyM2VlNDExYmNiYWZlMzZmMTdiZSIsInVzZXJfbmFtZSI6ImFwYXJuYSJ9	2017-09-11 12:28:18.531732+02
ja0po775omxuro2hp1uikqyeq79gh2ws	ODNiNDVlNjBiYmM2YTAzZWM3MTcyYjI3NTExY2VlYTQ3ODA4Y2IwZTp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiI3NjQ2Yjc1OS03ZDhlLTQ5MTktYmY3MS03ZTlhZDk5MTUyZjkiLCJvYXV0aF90b2tlbiI6Ijc4LS1kYTYxODg2Ni04MzQyLTQ1MGQtODQ3MS0wMTliYjZmYTJjMmEiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfZXhwaXJlc19pbiI6IjU5OSIsIm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZCI6InRydWUifSwic29jaWFsYWNjb3VudF9zdGF0ZSI6W3sicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiJ9LCJzVFJCV1dzVmNHZ0MiXX0=	2017-09-11 12:36:40.476289+02
ypyt6c0sqr454qw0mp9gnf4hwqjfap9j	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-22 08:14:37.926785+02
cqhvhtbzkduyf0g0gglkklrbpdh8tjcm	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-26 11:29:38.669451+02
ey7o49s4gqrtvsxvtcrrhejj8n0caet7	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-24 13:13:24.417312+02
q8fvmnnsnrwhe6nzrkgyhze1sdkevslk	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-06 08:28:25.021086+02
nujo66mcfd19p7se13ncsa6t7bq5g5t4	ZTgxOGI2NjY3N2Q0MDdkMDk2MTVmMWFmZDBlNjQ4M2Q0ZDNmMzNjNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImVhZGQyNzM0MmY2YmVlOGM1ZWI4OGVlMTIzNzZhOWNkZTI2ZWQ3MGIiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2lkIjoiMzIyIiwiY2FydCI6Imd1ZXN0Mjg3In0=	2017-09-21 12:17:21.592388+02
ra66360z69txp8385x1vv3xxzkqlenw8	OWJjMjc4M2ZlNWJkN2VhMmM3OGJmOWRiZTljMjY5ZjIxMDBmNDZmYzp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIzNzMiLCJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIm95aHZta0RLUUk1UCJdLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsImNhcnQiOiJhcGFybmEiLCJfbGFuZ3VhZ2UiOiJlbiIsInVzZXJfaWQiOjM3MywiX2F1dGhfdXNlcl9oYXNoIjoiYzE3YmQ2NjEyNjQ1YTIwOGFjZjEyM2VlNDExYmNiYWZlMzZmMTdiZSIsInVzZXJfbmFtZSI6ImFwYXJuYSIsIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiIwYjY2NzU0Yy01MjBhLTQyMTktYmU5OC1jZGI5NWJmMGIwYTAiLCJvYXV0aF90b2tlbiI6Ijc4LS1iOTNjZGMwNS1hMjg3LTQ3MjAtOWQ5MC05Yzg0NjRjNDU2ZmMiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfZXhwaXJlc19pbiI6IjU5OSIsIm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZCI6InRydWUifX0=	2017-09-11 12:40:55.868297+02
z33x6i9qg0gecmczfi0kf792awyxx6s2	YTg0ZTYyZDZiM2E1YzZkOGZhMTk4YzUzMDFlNjQ4MTE5MzcxMTdjMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sImNhcnQiOiJndWVzdDM1NCJ9	2017-09-23 06:13:40.790419+02
zn7cwdiiqq8d708yf5xa0n8eorwfwns2	NWE3MGU2MjcwMWU5MWU5YzlkM2I4NTk2Y2FkNzQ5MGMzYjk3YmIzZjp7InVzZXJfaWQiOjM3MywiX2F1dGhfdXNlcl9pZCI6IjM3MyIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiY2FydCI6ImFwYXJuYSIsIl9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzE3YmQ2NjEyNjQ1YTIwOGFjZjEyM2VlNDExYmNiYWZlMzZmMTdiZSIsInVzZXJfbmFtZSI6ImFwYXJuYSJ9	2017-09-11 12:40:55.954085+02
5qzu82398cujg518gwgwzgtjreeq5732	NWE3MGU2MjcwMWU5MWU5YzlkM2I4NTk2Y2FkNzQ5MGMzYjk3YmIzZjp7InVzZXJfaWQiOjM3MywiX2F1dGhfdXNlcl9pZCI6IjM3MyIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiY2FydCI6ImFwYXJuYSIsIl9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzE3YmQ2NjEyNjQ1YTIwOGFjZjEyM2VlNDExYmNiYWZlMzZmMTdiZSIsInVzZXJfbmFtZSI6ImFwYXJuYSJ9	2017-09-11 12:40:56.004882+02
hgvzy7dwtmkgew8kq877noraehqoyd5l	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-02 14:01:33.175045+02
b1kif5ii38f5fw9z0856fq7lswocxdsn	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-05 07:31:18.826923+02
vhqkctjsak5vf3d14hsqir4zhrrmldli	ZTdlOWU0YmM4Nzk4ODczOTg4NzQ2YTI0MmUwNDExZTEyZjk2YjJmMDp7InVzZXJfaWQiOjQwNSwiX2F1dGhfdXNlcl9pZCI6IjQwNSIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiI2NDk5MTdjYWQzM2JhYjMxZDY0NjU4OTUxYzdjMDgwOTU5YzJkM2I5IiwidXNlcl9uYW1lIjoiYXJuYXZAZ21haWwuY29tIn0=	2017-09-18 10:50:14.183137+02
346ghw3dicle4ltudr3e9q5bxzb3gzwk	NGY4ZDlkY2NiMjg2NTY5MzMxOGVkZDgzMDJlNmM3YWQxYzJlY2QwYzp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIzNzMiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsImNhcnQiOiJhcGFybmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiIsInVzZXJfaWQiOjM3MywiX2F1dGhfdXNlcl9oYXNoIjoiYzE3YmQ2NjEyNjQ1YTIwOGFjZjEyM2VlNDExYmNiYWZlMzZmMTdiZSIsInVzZXJfbmFtZSI6ImFwYXJuYSJ9	2017-09-11 12:44:30.987704+02
f01tml7ztiad0q1a2dvidffnnk084i9e	NDc1NmJmNmJjMTRmYTBjMjhiMmI4Y2UxZTZmMjczZmRmOWUwODBmODp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sImNhcnQiOiJndWVzdDI5NSJ9	2017-09-22 04:23:27.687915+02
n19ch4yxtyspbzwhrvhnzh4rovz1chuh	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-03 07:47:22.668324+02
dts1g1ztb0qk7mz82wljum27nhli1za8	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-13 05:54:17.499131+02
gbexwuqmjq9m2w5acpobqrh9mjw3n0a9	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-18 08:57:26.628338+02
voyzjurl2eizu0hl5lixbewiararlciw	OWQwNGU5Zjg4ZjBmMTkzNTllODc5ZDBhZjU2MDBhMjRmOTM5ZTVmMzp7InVzZXJfaWQiOjM3MywiX2F1dGhfdXNlcl9pZCI6IjM3MyIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiJjMTdiZDY2MTI2NDVhMjA4YWNmMTIzZWU0MTFiY2JhZmUzNmYxN2JlIiwidXNlcl9uYW1lIjoiYXBhcm5hIn0=	2017-09-13 08:08:17.379725+02
dpzg66xja8xhnwiwn2yp2qld2xrgfbvy	ZTI4Yjg0OWJhZDdhMmM2NmQ3NzNjMGM3OWFhOWJhMmNmOTY4Nzg4NDp7Im9hdXRoX2FwaS5saW5rZWRpbi5jb21fYWNjZXNzX3Rva2VuIjp7Im9hdXRoX3Rva2VuX3NlY3JldCI6Ijg0NTVjMzk4LTk5YmEtNDM2Ny1hOTc5LTMyMGNlOWFlYTM0MiIsIm9hdXRoX2F1dGhvcml6YXRpb25fZXhwaXJlc19pbiI6IjUxODM5OTYiLCJvYXV0aF90b2tlbiI6ImZkNjUyODlmLTYzNzYtNGFlYy1hN2JjLTQ4ZmVlNTY0MDhhNiIsIm9hdXRoX2V4cGlyZXNfaW4iOiI1MTgzOTk2In0sImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIm9hdXRoX2FwaS5saW5rZWRpbi5jb21fcmVxdWVzdF90b2tlbiI6eyJvYXV0aF90b2tlbl9zZWNyZXQiOiIzMWRlNThlZS05ZGQxLTQ3ZmItYjU1ZS01YmZhODZjZDliYWEiLCJvYXV0aF90b2tlbiI6Ijc4LS1lNzU4ZjYwMC0wMDk5LTQwZmEtODNlZC03ODEwMzEwYTFiY2YiLCJ4b2F1dGhfcmVxdWVzdF9hdXRoX3VybCI6Imh0dHBzOi8vYXBpLmxpbmtlZGluLmNvbS91YXMvb2F1dGgvYXV0aG9yaXplIiwib2F1dGhfZXhwaXJlc19pbiI6IjU5OSIsIm9hdXRoX2NhbGxiYWNrX2NvbmZpcm1lZCI6InRydWUifX0=	2017-09-11 12:47:10.825479+02
jshwzfl6uzwzqdevdsii9akrd90s44na	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-18 10:08:58.372449+02
7i7aj8rkxom0wzpe3u4el6u2y66b6z0w	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-19 12:44:54.007414+02
m3vziof3rnh5zk75apyjs2uvobv50ooc	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-19 12:50:44.737665+02
eq5afjpk5zgxse5dnuhawnigzf9sbkil	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-19 12:56:24.584082+02
i00gxvt024w6p9bb2hv67n1s3h24go6v	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-19 13:01:31.61773+02
od1eaz4s0r9gm1mgrvq30vq2rrqhdiji	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-14 11:16:09.640358+02
3w9lsqfo1z77v1pjxxahe0u8hjo9c53a	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-20 11:23:11.350584+02
exubnogkaisqr60r0umpd1imf1xa3ijb	NzBmODhhMjViZWMwN2MyODY5NzlhOTM4ZTBjOTlkZmIwNWNkMjAxYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjU4YzA1OGMyYjExMGM4Zjg1NjRjNGU3MDkyZDU4ZWRlOWFhZTYyY2IiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMzk4In0=	2017-09-14 14:55:33.608444+02
69evivtkmuae8ok090905imhpxsefylz	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-02 15:19:47.820008+02
oe12q53xbrlvmsb9ui20f2krjqq739zk	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-09 14:45:34.948351+02
xhcxxls4g1fglktj0wtfkzucgppksmgi	MjkwZGU5OTcwNWNhOGUyNTM2YTVjYzhkZjU3YTU0NGFiNmVjMDdiZDp7InVzZXJfaWQiOjM3MywiX2F1dGhfdXNlcl9pZCI6IjM3MyIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiY2FydCI6ImFwYXJuYUBnbWFpbC5jb20iLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaGFzaCI6ImMxN2JkNjYxMjY0NWEyMDhhY2YxMjNlZTQxMWJjYmFmZTM2ZjE3YmUiLCJ1c2VyX25hbWUiOiJhcGFybmFAZ21haWwuY29tIn0=	2017-09-25 08:43:07.160451+02
vgnrrru9zamvjixfbg35j4pbs6s8yvmb	YzY4NzVjMzg0ZTRhYTQwN2UyMTdjODE1MmFmZjVhNWU3NjAyM2EzMTp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIzNzMiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9sYW5ndWFnZSI6ImVuIiwidXNlcl9pZCI6MzczLCJfYXV0aF91c2VyX2hhc2giOiJjMTdiZDY2MTI2NDVhMjA4YWNmMTIzZWU0MTFiY2JhZmUzNmYxN2JlIiwidXNlcl9uYW1lIjoiYXBhcm5hIn0=	2017-09-22 13:07:18.51785+02
1y90r2t3dttjc39d4ano3ckvc092gzhi	NTA5Yzc3MjJmYzA5MjJkZGIxYWE3NzhjYWI1ZTM5MzI4YWJmOTBlNTp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sImNhcnQiOiJndWVzdDQwNSJ9	2017-09-25 10:47:38.791257+02
q5cadrme682g04g47l2likd4amy5v9ez	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-23 08:08:31.331326+02
pl0934u561frpvlpyishll9ir65v0wgn	OWQwNGU5Zjg4ZjBmMTkzNTllODc5ZDBhZjU2MDBhMjRmOTM5ZTVmMzp7InVzZXJfaWQiOjM3MywiX2F1dGhfdXNlcl9pZCI6IjM3MyIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiJjMTdiZDY2MTI2NDVhMjA4YWNmMTIzZWU0MTFiY2JhZmUzNmYxN2JlIiwidXNlcl9uYW1lIjoiYXBhcm5hIn0=	2017-09-22 07:57:13.297364+02
vkc8jmwc1z93ypcrszpq3juk33gjvn02	MjAzZjcwZmRhMWI5ODFhYjJmNTNhYzE4ZDdiNjk4NTQwMjYzNTI4MDp7Il9sYW5ndWFnZSI6ImVuIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fX0=	2017-09-29 09:21:49.898321+02
i2clbydviwisohfj6ixoqowzu19vr7vy	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-19 09:45:16.670404+02
wuwcz4acjov28ffhck363hfdlovlaf9t	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-19 12:46:12.359013+02
9n2917ok9vasrrqq00n246iw34hxtevl	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-19 12:51:35.74883+02
cbk6onnf7tzzm0zz45vy6mqfmdj7ct3h	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-19 12:57:05.577145+02
t9uwxoquew1mrypebt8jt0ucgobwf70e	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-19 13:02:48.378792+02
s7eokzi5g3rzv104kylzf3vebhczfwug	OThlNDgyODU0OTY0NGEzNmU4MjU4Y2QzY2ZlN2U5MDhlNTk4ZjU2Yzp7Il9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWFkZDI3MzQyZjZiZWU4YzVlYjg4ZWUxMjM3NmE5Y2RlMjZlZDcwYiIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzMjIifQ==	2017-09-20 05:42:23.984857+02
rqehdo3ptemer5rhyywznee636q27goc	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-25 12:15:08.239426+02
e50zc5p2zrr697mnbb1b288dmihj4b1c	YzY4NzVjMzg0ZTRhYTQwN2UyMTdjODE1MmFmZjVhNWU3NjAyM2EzMTp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIzNzMiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9sYW5ndWFnZSI6ImVuIiwidXNlcl9pZCI6MzczLCJfYXV0aF91c2VyX2hhc2giOiJjMTdiZDY2MTI2NDVhMjA4YWNmMTIzZWU0MTFiY2JhZmUzNmYxN2JlIiwidXNlcl9uYW1lIjoiYXBhcm5hIn0=	2017-09-22 13:25:41.175645+02
z3zps6wcp43ho02ta0jg8u35pe2rxwli	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-13 06:54:16.779939+02
kn90rde8a2knetxx9crj4uzr909k9td5	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-29 12:36:37.582242+02
27q3b1df1zuv8nnlilnf3d0apqcnueaa	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-26 12:13:11.542361+02
qfmysg374mtn54c7op02au3k1b3b68hw	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-13 08:03:24.141363+02
uqo97vb4m5rjkc3hspmtxw5te9r5xtml	OTU0YTQzM2ZkYWU5MmUwNDQwYmE4ZmQ1NzIzOTBhYjJjMjM4MWZmNDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sInV1aWQiOiIxNGJjN2FjMC00MDExLTQiLCJfYXV0aF91c2VyX2lkIjoiMzczIiwidXNlcl90eXBlIjoiQ3VzdG9tZXIiLCJjYXJ0IjoiYXBhcm5hQGdtYWlsLmNvbSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9sYW5ndWFnZSI6ImVuIiwidXNlcl9pZCI6MzczLCJfYXV0aF91c2VyX2hhc2giOiJjMTdiZDY2MTI2NDVhMjA4YWNmMTIzZWU0MTFiY2JhZmUzNmYxN2JlIiwidXNlcl9uYW1lIjoiYXBhcm5hQGdtYWlsLmNvbSJ9	2017-09-23 14:38:19.638138+02
239dfy7vkgsum6iulagezwecaecxizo5	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-24 13:13:25.176542+02
07y8spobwebrqg0zzszs4d7qhbr34ffp	ZDU5OTc0ZGRiMTYyMWM5MzBjYjUxZjkxYWRhZWVhMTQxMTVkZTRhMDp7InVzZXJfaWQiOjQ1MiwiX2F1dGhfdXNlcl9pZCI6IjQ1MiIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiI5NDUyOGZmNjAyMDY4OTA1OGFlZDI4MzUzNjJlODQ3NmQ4MzI0OWU2IiwidXNlcl9uYW1lIjoiZGhhbmVzaEBlc2ZlcmFzb2Z0LmNvbSJ9	2017-09-22 15:25:56.658199+02
xbgzpiwkkbuw1dd2nvnnfvrpg6j4rzob	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-11 15:45:26.493647+02
y7prb22rblxj80dhnj3boblg4e7ijcy3	NWVlM2MzOGE3ZDFjNzI1NzM0YjMzYTQ1NzA5YjFhNTQxYmU2YjZkZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVhZGQyNzM0MmY2YmVlOGM1ZWI4OGVlMTIzNzZhOWNkZTI2ZWQ3MGIiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMzIyIn0=	2017-09-22 16:32:13.327128+02
r62zwcomrebj1z724t78hpvnplipam9s	YTg1NWJkNTJiNzY2YzBmZmJjMjg5ODQ4NTJmNmRjNWM4YzI2NWQ3Yzp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIzNzMiLCJzb2NpYWxhY2NvdW50X3NvY2lhbGxvZ2luIjp7ImFjY291bnQiOnsidXNlcl9pZCI6bnVsbCwidWlkIjoiNzE4OTI2MTY0OTYyOTI4IiwibGFzdF9sb2dpbiI6bnVsbCwicHJvdmlkZXIiOiJmYWNlYm9vayIsImV4dHJhX2RhdGEiOnsiZmlyc3RfbmFtZSI6IkFtaXQiLCJsYXN0X25hbWUiOiJSYW5hIiwidmVyaWZpZWQiOnRydWUsIm5hbWUiOiJBbWl0IFJhbmEiLCJsb2NhbGUiOiJlbl9VUyIsImdlbmRlciI6Im1hbGUiLCJ1cGRhdGVkX3RpbWUiOiIyMDE3LTA3LTExVDEyOjA1OjI3KzAwMDAiLCJsaW5rIjoiaHR0cHM6Ly93d3cuZmFjZWJvb2suY29tL2FwcF9zY29wZWRfdXNlcl9pZC83MTg5MjYxNjQ5NjI5MjgvIiwiaWQiOiI3MTg5MjYxNjQ5NjI5MjgiLCJ0aW1lem9uZSI6NS41LCJlbWFpbCI6InRlc3RlcmVzZmVyYUBnbWFpbC5jb20ifSwiaWQiOm51bGwsImRhdGVfam9pbmVkIjpudWxsfSwiZW1haWxfYWRkcmVzc2VzIjpbeyJ1c2VyX2lkIjpudWxsLCJlbWFpbCI6InRlc3RlcmVzZmVyYUBnbWFpbC5jb20iLCJ2ZXJpZmllZCI6ZmFsc2UsImlkIjpudWxsLCJwcmltYXJ5Ijp0cnVlfV0sInN0YXRlIjp7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwidG9rZW4iOnsiYWNjb3VudF9pZCI6bnVsbCwiYXBwX2lkIjoyLCJleHBpcmVzX2F0IjoiMjAxNy0xMC0zMFQxMjozMTowMi4yMzBaIiwidG9rZW4iOiJFQUFWaTR2b2JiTU1CQUozclU4azRwb1pDdW9rSU5vMTI1NzNjWkE3aUt3OHhHdGtaQlVaQUQzVHEwZGpPeGpaQjJZeFcxZDNnQWZOWDZ0NXlrcFpCYzRjRXFaQ3ZKejFEQk1UaldBZk1TbHdvZzRBWkFtQ2JYR1Y3N2xYTjJkS3VPajZwbGpqbEt0WkIzWUVua2hLMlZYTDRDc0pFeFV5eTVlRndNdUYyeWIyRlVLUVpEWkQiLCJpZCI6bnVsbCwidG9rZW5fc2VjcmV0IjoiIn0sInVzZXIiOnsidXNlcm5hbWUiOiIiLCJmaXJzdF9uYW1lIjoiQW1pdCIsImxhc3RfbmFtZSI6IlJhbmEiLCJpc19hY3RpdmUiOnRydWUsImVtYWlsIjoidGVzdGVyZXNmZXJhQGdtYWlsLmNvbSIsImlzX3N1cGVydXNlciI6ZmFsc2UsImlzX3N0YWZmIjpmYWxzZSwibGFzdF9sb2dpbiI6bnVsbCwicGFzc3dvcmQiOiIhQ2JoUjEwWlh3MFJDQ0NITkpJanhpcjBmQk93RFVvYjlGaHpiMEVwSiIsImlkIjpudWxsLCJkYXRlX2pvaW5lZCI6IjIwMTctMDgtMzFUMTI6MzE6MDMuNDExWiJ9fSwidXNlcl90eXBlIjoiQ3VzdG9tZXIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJjYXJ0IjoiYXBhcm5hIiwiX2xhbmd1YWdlIjoiZW4iLCJ1c2VyX2lkIjozNzMsIl9hdXRoX3VzZXJfaGFzaCI6ImMxN2JkNjYxMjY0NWEyMDhhY2YxMjNlZTQxMWJjYmFmZTM2ZjE3YmUiLCJ1c2VyX25hbWUiOiJhcGFybmEifQ==	2017-09-14 14:39:51.740328+02
e68bqgel1x6uca4n709skxftctlnt1or	NGY4ZDlkY2NiMjg2NTY5MzMxOGVkZDgzMDJlNmM3YWQxYzJlY2QwYzp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIzNzMiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsImNhcnQiOiJhcGFybmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiIsInVzZXJfaWQiOjM3MywiX2F1dGhfdXNlcl9oYXNoIjoiYzE3YmQ2NjEyNjQ1YTIwOGFjZjEyM2VlNDExYmNiYWZlMzZmMTdiZSIsInVzZXJfbmFtZSI6ImFwYXJuYSJ9	2017-09-22 07:41:46.731791+02
q17dupwbsmk74z57m6d6yywgi6ew5qxn	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-22 07:41:52.991436+02
nfjxaw0rb4b4009k2uk6l7hhno57wlqx	MzU1NTkwYzVlY2NmZTcxNjYyZjg0YzFiYjU0MWMyYjNiYTY3NjU1Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImY4MjE5NzA0NWM1ODVkMWRiMDg2OWRmZmM3NTdhYTE4Y2ExNGQ3ZmMiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2lkIjoiNDQyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwidXVpZCI6IjM2MDI0YWVkLTdjNzYtNCJ9	2017-09-22 12:08:02.788024+02
bw30nfzg8gpm7rthguqikeafrkd5ity6	MzBmNmQ2NTM5MDE2ZjhjNTQ1OWVlMmFiYjhmMWRlODIzZTk0MWZlNjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI0NTkiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsImNhcnQiOiJwb29uYW1fa3VtYXJpQGVzZmVyYXNvZnQuY29tIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJ1c2VyX2lkIjo0NTksIl9hdXRoX3VzZXJfaGFzaCI6IjJlOWRmZDNmMDQwNjUyMDRhMzYyNDNlZjU2YjkxOTNlNGFhZWY4ZjUiLCJ1c2VyX25hbWUiOiJwb29uYW1fa3VtYXJpQGVzZmVyYXNvZnQuY29tIn0=	2017-09-25 10:42:10.478048+02
7eqsf0rl4vr1n0fxqrt2h89vygq2ata2	Yjg3NjM5ZmE4MmJkY2JkMmVmZjc0NzU1ZWJhNjBmMmU0MTAwYzJjMTp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI0MjgiLCJzb2NpYWxhY2NvdW50X3NvY2lhbGxvZ2luIjp7InVzZXIiOnsidXNlcm5hbWUiOiIiLCJmaXJzdF9uYW1lIjoiUmFqaW5kZXIiLCJsYXN0X25hbWUiOiJNb2hhbiIsImlzX2FjdGl2ZSI6dHJ1ZSwiaWQiOm51bGwsImlzX3N1cGVydXNlciI6ZmFsc2UsImlzX3N0YWZmIjpmYWxzZSwibGFzdF9sb2dpbiI6bnVsbCwicGFzc3dvcmQiOiIhaW51TEZUTmkxOXhWSjhnWFJxcDVkd1E4ZDJFSnJ6ellHWFE5M0lGbyIsImVtYWlsIjoicmFqaW5kZXJfbW9oYW5AZXNmZXJhc29mdC5jb20iLCJkYXRlX2pvaW5lZCI6IjIwMTctMDktMDdUMDY6MDE6MDcuNjk3WiJ9LCJ0b2tlbiI6eyJhY2NvdW50X2lkIjpudWxsLCJhcHBfaWQiOjIsImV4cGlyZXNfYXQiOiIyMDE3LTExLTA2VDA2OjAxOjA1Ljk1M1oiLCJ0b2tlbiI6IkVBQVZpNHZvYmJNTUJBRzdNOFlNRmdPMWZJbDR1cU9CV3BRWkNrdVNLUDBkalIxTnB1NlpDbzhaQXFRaXFIcTROSTNSWkFYUllCcEg2b2R6SjlaQmVlTmtCdGJVbHV4UExZY2hBM1NZQ0E3U2g5MWtMRXRERFpBaTJyUm5LZ2JqWkJ0dVpDa3lXZ3JWZURPbExLemFxSlpBWDNYR1pCRDJiTmRNR3hZQ29mZjc4VTJyaVZqWkFzWTNQVXYwIiwiaWQiOm51bGwsInRva2VuX3NlY3JldCI6IiJ9LCJhY2NvdW50Ijp7InVzZXJfaWQiOm51bGwsInVpZCI6IjEwMjg4ODY5Mzc4NzMwNiIsImxhc3RfbG9naW4iOm51bGwsInByb3ZpZGVyIjoiZmFjZWJvb2siLCJleHRyYV9kYXRhIjp7ImZpcnN0X25hbWUiOiJSYWppbmRlciIsImxhc3RfbmFtZSI6Ik1vaGFuIiwidmVyaWZpZWQiOmZhbHNlLCJuYW1lIjoiUmFqaW5kZXIgTW9oYW4iLCJsb2NhbGUiOiJlbl9HQiIsImdlbmRlciI6Im1hbGUiLCJ1cGRhdGVkX3RpbWUiOiIyMDE3LTA5LTA3VDA2OjAwOjE2KzAwMDAiLCJlbWFpbCI6InJhamluZGVyX21vaGFuQGVzZmVyYXNvZnQuY29tIiwibGluayI6Imh0dHBzOi8vd3d3LmZhY2Vib29rLmNvbS9hcHBfc2NvcGVkX3VzZXJfaWQvMTAyODg4NjkzNzg3MzA2LyIsInRpbWV6b25lIjo1LjUsImlkIjoiMTAyODg4NjkzNzg3MzA2In0sImlkIjpudWxsLCJkYXRlX2pvaW5lZCI6bnVsbH0sImVtYWlsX2FkZHJlc3NlcyI6W3sidmVyaWZpZWQiOmZhbHNlLCJ1c2VyX2lkIjpudWxsLCJlbWFpbCI6InJhamluZGVyX21vaGFuQGVzZmVyYXNvZnQuY29tIiwicHJpbWFyeSI6dHJ1ZSwiaWQiOm51bGx9XSwic3RhdGUiOnsicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiJ9fSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbCwiX2xhbmd1YWdlIjoiZW4iLCJfYXV0aF91c2VyX2hhc2giOiJlODliMjI4MzFlNDAwMjZiOTVhZDAwZjVlNzRjYTlmYjg2NjhjNmJlIn0=	2017-09-21 08:02:12.984387+02
pqe6gvabzyabuv3da86o1m3w9t734ihm	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-09 14:45:48.528171+02
hu8pgmf5g9cieq8poof1lhqw1bkrt5vk	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-25 14:44:16.095379+02
e4js3fwrvk3da6bihqvodgaljywajr5z	MjAzZjcwZmRhMWI5ODFhYjJmNTNhYzE4ZDdiNjk4NTQwMjYzNTI4MDp7Il9sYW5ndWFnZSI6ImVuIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fX0=	2017-10-09 08:52:30.745334+02
tnjdbaoq3oqhec1rf2viutjo9c4x1kcg	ZjZmYjNkZmE0N2U2MjdjNTkxMjlmM2NjOTNmOTk1MmE2Njc2YmUyNDp7InVzZXJfaWQiOjQ5NiwiX2F1dGhfdXNlcl9pZCI6IjQ5NiIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fSwiX2F1dGhfdXNlcl9oYXNoIjoiMWVmMzFhYjMwN2IzOWY4YTVjODE0MjIxM2UyZDFkYjMzODU3NGNlZiIsInVzZXJfbmFtZSI6InRlc3RlcmVzZmVyYUBnbWFpbC5jb20ifQ==	2017-09-26 11:36:15.180394+02
36voitb7hnfwvo32ex09f8f72xpbwke0	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-26 11:53:10.06696+02
50i8u4qjd0zsmfkrb7m1zcynk277580x	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-22 09:52:25.289585+02
pipu20aa5o9oozuqivl8iphgoal0zntq	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-29 09:32:20.205065+02
q6dfmeudcl55757w8crope03wbtbtwft	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-06 08:28:25.108301+02
9l6wp5n8ziw588r64xseh79ipa7hj5s4	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-19 12:49:29.521726+02
rrvb0d4772z30kxllwp5kvff93fwwtq7	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-19 12:54:43.15489+02
x410cb4iiuvn1z09z7s9rp1k8xjjc44x	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-19 12:58:07.732125+02
qmb1v6d5myu3tt7r0uikxmgi8ytwpai9	MjAzZjcwZmRhMWI5ODFhYjJmNTNhYzE4ZDdiNjk4NTQwMjYzNTI4MDp7Il9sYW5ndWFnZSI6ImVuIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fX0=	2017-09-20 05:43:02.513107+02
18tjroq4t6xiox9727tefdu6pfgl1eft	NWExNjNhNDJmMTliMzQwMTc2Njc0Y2Y0ZTlmOTI1NmJkODYwMjY4Mzp7InVzZXJfaWQiOjQxNiwiX2F1dGhfdXNlcl9pZCI6IjQxNiIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiIxZTEyNWMyYWIyY2FjMDMzYTNiMDIzYjFjZjRlMDAzNGNkZGZiYTkzIiwidXNlcl9uYW1lIjoia2FuZ25hQGdtYWlsLmNvbSJ9	2017-09-20 11:29:15.96127+02
kl0prqlzajjnxdskirwg5nutwpgvkp3s	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-26 07:35:45.057662+02
xtioa8sesgjwckxot5eo7xtakczpf18w	ODhhNTZjODBiZmY0N2QyYTAyZDg3Yzk3ZGI4ZThjYjI2NDBhNjQ5ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVhZGQyNzM0MmY2YmVlOGM1ZWI4OGVlMTIzNzZhOWNkZTI2ZWQ3MGIiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2lkIjoiMzIyIiwic29jaWFsYWNjb3VudF9zb2NpYWxsb2dpbiI6eyJ1c2VyIjp7InVzZXJuYW1lIjoiIiwiZmlyc3RfbmFtZSI6ImFtaXQiLCJsYXN0X25hbWUiOiJyYW5hIiwiaXNfYWN0aXZlIjp0cnVlLCJpZCI6bnVsbCwiaXNfc3VwZXJ1c2VyIjpmYWxzZSwiaXNfc3RhZmYiOmZhbHNlLCJsYXN0X2xvZ2luIjpudWxsLCJwYXNzd29yZCI6IiE1a2xqcm8xbjl5RjUxbElEem1NWHpISTA4NDdDeE14d2N3c20xaHpOIiwiZW1haWwiOiJ0ZXN0ZXJlc2ZlcmFAZ21haWwuY29tIiwiZGF0ZV9qb2luZWQiOiIyMDE3LTA5LTA0VDA2OjU5OjU2LjUzM1oifSwidG9rZW4iOnsiYWNjb3VudF9pZCI6bnVsbCwiYXBwX2lkIjoxLCJleHBpcmVzX2F0IjpudWxsLCJ0b2tlbiI6ImZkNjUyODlmLTYzNzYtNGFlYy1hN2JjLTQ4ZmVlNTY0MDhhNiIsImlkIjpudWxsLCJ0b2tlbl9zZWNyZXQiOiI4NDU1YzM5OC05OWJhLTQzNjctYTk3OS0zMjBjZTlhZWEzNDIifSwiYWNjb3VudCI6eyJ1c2VyX2lkIjpudWxsLCJ1aWQiOiJmYjE2YkpZX0ZtIiwibGFzdF9sb2dpbiI6bnVsbCwicHJvdmlkZXIiOiJsaW5rZWRpbiIsImV4dHJhX2RhdGEiOnsiZW1haWwtYWRkcmVzcyI6InRlc3RlcmVzZmVyYUBnbWFpbC5jb20iLCJsYXN0LW5hbWUiOiJyYW5hIiwicGljdHVyZS11cmxzIjp7InBpY3R1cmUtdXJsIjoiaHR0cHM6Ly9tZWRpYS5saWNkbi5jb20vbXByL21wcngvMF9Demx2WTJtdEZGWEoxWWgzNlR5VVpTN0szTFJNenkyMzZUZjRaREt5dWxzc2xnWTdrTHJNVklyeDFqdiJ9LCJwdWJsaWMtcHJvZmlsZS11cmwiOiJodHRwczovL3d3dy5saW5rZWRpbi5jb20vaW4vYW1pdC1yYW5hLThhNTkyNDk3IiwicGljdHVyZS11cmwiOiJodHRwczovL21lZGlhLmxpY2RuLmNvbS9tcHIvbXByeC8wXy1GSmpDLXB1TXhRWVpoYmN5aXdDQ2xZaUp5QTE0X0JjeV9EQ0NscHI2TUxHRkY4QlkzZEEyQWVPYy1sRFVrblIxWFJpUzlHSXFwSUIiLCJmaXJzdC1uYW1lIjoiYW1pdCIsImlkIjoiZmIxNmJKWV9GbSJ9LCJpZCI6bnVsbCwiZGF0ZV9qb2luZWQiOm51bGx9LCJlbWFpbF9hZGRyZXNzZXMiOlt7InZlcmlmaWVkIjpmYWxzZSwidXNlcl9pZCI6bnVsbCwiZW1haWwiOiJ0ZXN0ZXJlc2ZlcmFAZ21haWwuY29tIiwicHJpbWFyeSI6dHJ1ZSwiaWQiOm51bGx9XSwic3RhdGUiOnsicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiJ9fSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwib2F1dGhfYXBpLmxpbmtlZGluLmNvbV9hY2Nlc3NfdG9rZW4iOnsib2F1dGhfdG9rZW5fc2VjcmV0IjoiODQ1NWMzOTgtOTliYS00MzY3LWE5NzktMzIwY2U5YWVhMzQyIiwib2F1dGhfYXV0aG9yaXphdGlvbl9leHBpcmVzX2luIjoiNTE4Mzk5OCIsIm9hdXRoX3Rva2VuIjoiZmQ2NTI4OWYtNjM3Ni00YWVjLWE3YmMtNDhmZWU1NjQwOGE2Iiwib2F1dGhfZXhwaXJlc19pbiI6IjUxODM5OTgifSwib2F1dGhfYXBpLmxpbmtlZGluLmNvbV9yZXF1ZXN0X3Rva2VuIjp7Im9hdXRoX3Rva2VuX3NlY3JldCI6IjEzY2FlMGNkLTMwZjItNDJmNi1iMDQ1LTYzYjZmYzkwOGQ5YSIsIm9hdXRoX3Rva2VuIjoiNzgtLWYxY2YzZTllLWY2M2EtNDIwMi1iMzEyLTg3ZmEyOTJmOGQxYiIsInhvYXV0aF9yZXF1ZXN0X2F1dGhfdXJsIjoiaHR0cHM6Ly9hcGkubGlua2VkaW4uY29tL3Vhcy9vYXV0aC9hdXRob3JpemUiLCJvYXV0aF9leHBpcmVzX2luIjoiNTk5Iiwib2F1dGhfY2FsbGJhY2tfY29uZmlybWVkIjoidHJ1ZSJ9fQ==	2017-09-18 09:01:17.621542+02
mvz0g5li200s6cldonbswlzlniyytv5r	ODIyOGM0ZDFlZTU0N2MyYzljMjc2YjQ1ZDVkNzNjMDNkYzRjZWIyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijg5YjM3N2U4OGMwYWNjNTQzN2Y4NWJiOTQ5ZjQyYmQyYWJmMDU4MTQiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2lkIjoiNDA5IiwiY2FydCI6ImFtaXQifQ==	2017-09-22 07:25:14.805174+02
wyk1ijs4e3w3805j29d8so15poh0zx3i	ZGYyMTk1ZDZhN2ZiMWNkNzViZWM0MDY0OTViZDM5MjQ0YmMzOTM0Mjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sInV1aWQiOiIzNjAyNGFlZC03Yzc2LTQifQ==	2017-09-22 12:07:46.81586+02
zlggfo0e28a2cuinehwe87stol6gwcpz	NGY4ZDlkY2NiMjg2NTY5MzMxOGVkZDgzMDJlNmM3YWQxYzJlY2QwYzp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIzNzMiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsImNhcnQiOiJhcGFybmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiIsInVzZXJfaWQiOjM3MywiX2F1dGhfdXNlcl9oYXNoIjoiYzE3YmQ2NjEyNjQ1YTIwOGFjZjEyM2VlNDExYmNiYWZlMzZmMTdiZSIsInVzZXJfbmFtZSI6ImFwYXJuYSJ9	2017-09-22 07:35:21.628187+02
f1cdjpvnj7jx5zxr4vo7koauz6fhhrxv	NmVhMzYyM2FiZGExZTAzODgyOWNkOWU5NTBiNWVjZTllMDE2YTEzMzp7ImNhcnQiOiJhbWl0IiwiX2F1dGhfdXNlcl9oYXNoIjoiODliMzc3ZTg4YzBhY2M1NDM3Zjg1YmI5NDlmNDJiZDJhYmYwNTgxNCIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI0MDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-09-23 06:48:24.895808+02
urlfuuweg6cmx79qk320jndmunr0zvz6	NmVhMzYyM2FiZGExZTAzODgyOWNkOWU5NTBiNWVjZTllMDE2YTEzMzp7ImNhcnQiOiJhbWl0IiwiX2F1dGhfdXNlcl9oYXNoIjoiODliMzc3ZTg4YzBhY2M1NDM3Zjg1YmI5NDlmNDJiZDJhYmYwNTgxNCIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI0MDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2017-09-23 06:49:05.357157+02
x3c18qzhwsojlalc8ppev1scys9k79wd	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-26 10:18:29.838514+02
t9ez1x9yroazj8hho544vag60ixh3hmm	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-23 11:18:11.626071+02
d1l2z6ujcreamf92x1jaddm26mfsjpne	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-23 12:38:01.074353+02
r4nwn5ypu5m2gsa7ibtpekog8ilvquk6	NjYxNzJlNmE5YzBjMjIxMjViYTBhYjk4OWZhYWI1MjdlNTBjYTg4NDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI0MDUiLCJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sImRrVWhpZFVuZG5McSJdLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9sYW5ndWFnZSI6ImVuIiwidXNlcl9pZCI6NDA1LCJfYXV0aF91c2VyX2hhc2giOiI2NDk5MTdjYWQzM2JhYjMxZDY0NjU4OTUxYzdjMDgwOTU5YzJkM2I5IiwidXNlcl9uYW1lIjoiYXJuYXZAZ21haWwuY29tIn0=	2017-09-22 16:35:51.397086+02
kb9gg07kc4ptj5zus6hk22ne4p9dzagj	M2U3MGI5OGY3NGUyNTY3NDFlYzAxYWUwNGYyNTRlZjgwY2NjZDI5Nzp7InJlc3RhdXJhbnRfaWQiOjQ2LCJfYXV0aF91c2VyX2hhc2giOiJlYWRkMjczNDJmNmJlZThjNWViODhlZTEyMzc2YTljZGUyNmVkNzBiIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjMyMiJ9	2017-09-23 07:02:36.696203+02
gvk15xtfqzrpjyf34crs9c3qf51ln801	Y2UxNjYxYWY5OGFkYTQxZDg5ZGIwYWU2ZTlmMTljNGI2MDE4MDNhZDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIzNzMiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsImNhcnQiOiJhcGFybmFAZ21haWwuY29tIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJ1c2VyX2lkIjozNzMsIl9hdXRoX3VzZXJfaGFzaCI6ImMxN2JkNjYxMjY0NWEyMDhhY2YxMjNlZTQxMWJjYmFmZTM2ZjE3YmUiLCJ1c2VyX25hbWUiOiJhcGFybmFAZ21haWwuY29tIn0=	2017-09-23 07:23:02.026237+02
emdo1uvnxo7xd6mg5pi0kzl8k9twktug	NDVmNWY2OGYyMDA4ODcwYWM4YmEyYzYzOGYwODYxYWQ1YTU2MWM2Yzp7InVzZXJfaWQiOjUyMCwiX2F1dGhfdXNlcl9pZCI6IjUyMCIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiIzZTJlMThlZjVlODhkOGQ4MGUyYmVmMTljMmFkNTNlYzdiMmMwZDAxIiwidXNlcl9uYW1lIjoiYW51QGdtYWlsLmNvbSJ9	2017-10-07 12:20:24.902095+02
sdakh634m0hlmqfe96v8sqjcrbzvh2y2	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-09 14:45:59.340652+02
8ek6h8bcqa3vrcdb4dwhdafjiff1aggc	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-06 08:28:25.156196+02
bu5aqd2ekx4acc4c7y962xid4wyuc80r	Y2UxNjYxYWY5OGFkYTQxZDg5ZGIwYWU2ZTlmMTljNGI2MDE4MDNhZDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIzNzMiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsImNhcnQiOiJhcGFybmFAZ21haWwuY29tIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJ1c2VyX2lkIjozNzMsIl9hdXRoX3VzZXJfaGFzaCI6ImMxN2JkNjYxMjY0NWEyMDhhY2YxMjNlZTQxMWJjYmFmZTM2ZjE3YmUiLCJ1c2VyX25hbWUiOiJhcGFybmFAZ21haWwuY29tIn0=	2017-09-26 07:32:13.656099+02
wa66b7bqzwizwv5nwz6b22bn1q50xial	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-26 07:35:46.585644+02
udwwghztbscpmsllkvdhgz28hegnq2fx	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-26 07:36:04.453474+02
swq4neid0ng1bnm8yj7r3ctksb1df62t	MzQ1NmZlOWEyNDY3NmU0NTQ3YzYyMThkNWUzYzYwMDVkYWFmN2RkZjp7InVzZXJfaWQiOjQ5OSwiX2F1dGhfdXNlcl9pZCI6IjQ5OSIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fSwiX2F1dGhfdXNlcl9oYXNoIjoiN2Q4N2JmNmNmZDI4MmQyMjRjNGRlOTRlOTc2NDY0MzM4ZmQ3OWUyZCIsInVzZXJfbmFtZSI6InRlc3Rlcm1vaGFsaUBnbWFpbC5jb20ifQ==	2017-09-26 11:51:45.68646+02
qd4k16gtfx3f08jel8zppvw4yccfhuas	Y2QwYjFlMTcyODAyODVhNDg5MWYwODVlYTZmMTYzZjAxOTEwNTJmODp7InVzZXJfaWQiOjM3MywiX2F1dGhfdXNlcl9pZCI6IjM3MyIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiJjMTdiZDY2MTI2NDVhMjA4YWNmMTIzZWU0MTFiY2JhZmUzNmYxN2JlIiwidXNlcl9uYW1lIjoiYXBhcm5hQGdtYWlsLmNvbSJ9	2017-09-26 11:53:35.911733+02
uicoqztm2w7j722zeklan2ymn51x0j4g	MjNiYjNhYTc2N2VmNzg4ZjRhODhlNTg2ZDRiYzQwZjA4MThkZjQ1ZDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI1MDAiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9sYW5ndWFnZSI6ImVuIiwidXNlcl9pZCI6NTAwLCJfYXV0aF91c2VyX2hhc2giOiI4N2VlMmNmNTA2NGFkOWQ4YjEyOTY4NjhjYmIwNDZlNzhmZjZlZjBhIiwidXNlcl9uYW1lIjoidGVzdGRlbW90ZXN0MEBnbWFpbC5jb20ifQ==	2017-09-26 11:55:45.947278+02
qs8pwmxqayckot3m15doxc525kf1yvmt	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-29 09:58:21.821325+02
5095tfect44b92h70nwl8ngmgopruh5m	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-02 15:21:17.931886+02
2gofqtags76zxdpto9hlny4nukseymsz	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-29 12:36:37.889354+02
g7vwzd3poddc87uw15khauzfj64yfmbx	MjkwZGU5OTcwNWNhOGUyNTM2YTVjYzhkZjU3YTU0NGFiNmVjMDdiZDp7InVzZXJfaWQiOjM3MywiX2F1dGhfdXNlcl9pZCI6IjM3MyIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiY2FydCI6ImFwYXJuYUBnbWFpbC5jb20iLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaGFzaCI6ImMxN2JkNjYxMjY0NWEyMDhhY2YxMjNlZTQxMWJjYmFmZTM2ZjE3YmUiLCJ1c2VyX25hbWUiOiJhcGFybmFAZ21haWwuY29tIn0=	2017-09-25 09:02:21.693724+02
dcmd021igkqm0pqw3aby9tk35c9wh88r	MjkwZGU5OTcwNWNhOGUyNTM2YTVjYzhkZjU3YTU0NGFiNmVjMDdiZDp7InVzZXJfaWQiOjM3MywiX2F1dGhfdXNlcl9pZCI6IjM3MyIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiY2FydCI6ImFwYXJuYUBnbWFpbC5jb20iLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaGFzaCI6ImMxN2JkNjYxMjY0NWEyMDhhY2YxMjNlZTQxMWJjYmFmZTM2ZjE3YmUiLCJ1c2VyX25hbWUiOiJhcGFybmFAZ21haWwuY29tIn0=	2017-09-25 09:09:08.080809+02
gwafj1g1yhbvjtmqxcrf3lcbf7dznrl0	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-02 06:11:49.295536+02
pytk26vuiydh2kwot6n1k6weywrla6ue	Y2UxNjYxYWY5OGFkYTQxZDg5ZGIwYWU2ZTlmMTljNGI2MDE4MDNhZDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIzNzMiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsImNhcnQiOiJhcGFybmFAZ21haWwuY29tIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJ1c2VyX2lkIjozNzMsIl9hdXRoX3VzZXJfaGFzaCI6ImMxN2JkNjYxMjY0NWEyMDhhY2YxMjNlZTQxMWJjYmFmZTM2ZjE3YmUiLCJ1c2VyX25hbWUiOiJhcGFybmFAZ21haWwuY29tIn0=	2017-09-25 09:29:47.694529+02
awhkjlq9mx04vfzrcdjyahmh7tat7svx	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-02 08:29:54.626291+02
ihe7x6fvyd3h47okypcqgymh94sq3iij	NDVmNWY2OGYyMDA4ODcwYWM4YmEyYzYzOGYwODYxYWQ1YTU2MWM2Yzp7InVzZXJfaWQiOjUyMCwiX2F1dGhfdXNlcl9pZCI6IjUyMCIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiIzZTJlMThlZjVlODhkOGQ4MGUyYmVmMTljMmFkNTNlYzdiMmMwZDAxIiwidXNlcl9uYW1lIjoiYW51QGdtYWlsLmNvbSJ9	2017-10-03 07:12:14.463933+02
bh3izslig1p93xerzf7r9iufdbe01lza	MjdlZmI3ODEzZmJjNDFiZDQyN2VhN2MxNGEyOGJhNGNmYWM5NGRhMDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI0NjEiLCJzb2NpYWxhY2NvdW50X3NvY2lhbGxvZ2luIjp7InRva2VuIjp7ImFjY291bnRfaWQiOm51bGwsImFwcF9pZCI6MiwiZXhwaXJlc19hdCI6IjIwMTctMTEtMDhUMDc6MjU6NTQuMzA2WiIsInRva2VuIjoiRUFBVmk0dm9iYk1NQkFIZmZzNFlaQVNpNDVwbUQycWhibTRwQ2diaGZlQVF4M1FTVkRSQnFPZE5CUWhxb2VWblNxOFJPekUyYW0xd1JaQmNaQlpCRlJNREo4NEpGajBaQW83ZXFIUTBnbHRPbWRCa1VjMWNqUDFFYlR5c0xEV243M0hXZzFJNFpDb0E5S1pDZEdsOXF0a0F1SjNRYWc1Vmw0c1ZoUEY5ZU9pbGxlYlpBRXdqdFZEbEciLCJpZCI6bnVsbCwidG9rZW5fc2VjcmV0IjoiIn0sImFjY291bnQiOnsidXNlcl9pZCI6bnVsbCwidWlkIjoiMTAyODg4NjkzNzg3MzA2IiwibGFzdF9sb2dpbiI6bnVsbCwicHJvdmlkZXIiOiJmYWNlYm9vayIsImV4dHJhX2RhdGEiOnsiZmlyc3RfbmFtZSI6IlJhamluZGVyIiwibGFzdF9uYW1lIjoiTW9oYW4iLCJ2ZXJpZmllZCI6ZmFsc2UsIm5hbWUiOiJSYWppbmRlciBNb2hhbiIsImxvY2FsZSI6ImVuX0dCIiwiZ2VuZGVyIjoibWFsZSIsInVwZGF0ZWRfdGltZSI6IjIwMTctMDktMDdUMDY6MDA6MTYrMDAwMCIsImxpbmsiOiJodHRwczovL3d3dy5mYWNlYm9vay5jb20vYXBwX3Njb3BlZF91c2VyX2lkLzEwMjg4ODY5Mzc4NzMwNi8iLCJpZCI6IjEwMjg4ODY5Mzc4NzMwNiIsInRpbWV6b25lIjo1LjUsImVtYWlsIjoicmFqaW5kZXJfbW9oYW5AZXNmZXJhc29mdC5jb20ifSwiaWQiOm51bGwsImRhdGVfam9pbmVkIjpudWxsfSwic3RhdGUiOnsicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiJ9LCJlbWFpbF9hZGRyZXNzZXMiOlt7ImlkIjpudWxsLCJ1c2VyX2lkIjpudWxsLCJ2ZXJpZmllZCI6ZmFsc2UsImVtYWlsIjoicmFqaW5kZXJfbW9oYW5AZXNmZXJhc29mdC5jb20iLCJwcmltYXJ5Ijp0cnVlfV0sInVzZXIiOnsidXNlcm5hbWUiOiIiLCJmaXJzdF9uYW1lIjoiUmFqaW5kZXIiLCJsYXN0X25hbWUiOiJNb2hhbiIsImlzX2FjdGl2ZSI6dHJ1ZSwiZW1haWwiOiJyYWppbmRlcl9tb2hhbkBlc2ZlcmFzb2Z0LmNvbSIsImlzX3N1cGVydXNlciI6ZmFsc2UsImlzX3N0YWZmIjpmYWxzZSwibGFzdF9sb2dpbiI6bnVsbCwicGFzc3dvcmQiOiIhMENCV21acUFoTWtEeEFabWdsWmNEZE1pVVpWbW91OVFNcjA1b3k5ZyIsImlkIjpudWxsLCJkYXRlX2pvaW5lZCI6IjIwMTctMDktMDlUMDk6MDI6MjguNjE0WiJ9fSwiY2FydCI6InJhamluZGVyMDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsLCJfbGFuZ3VhZ2UiOiJlbiIsIl9hdXRoX3VzZXJfaGFzaCI6ImI4OGFhNGJiYmVkYjJiZTBjOGFiOTVmZjg1YzlhOTY4NTJmNWVhNWQifQ==	2017-09-23 16:02:51.335379+02
inh3tqrc9tal34igcko6vwsjh8dnd9tn	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-03 08:29:16.58711+02
1j21pndcfsvopged432ovjr4d8wtlubi	Y2I0M2JiODg2ZTBhMjY5NGJmMjI1MGVhZDI4YmZjNzU1NmQ0ODJiMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2017-10-03 09:02:52.18801+02
vu64di9ttsfbvpi4ri1sfqqi1sw3zgc8	Y2UxNjYxYWY5OGFkYTQxZDg5ZGIwYWU2ZTlmMTljNGI2MDE4MDNhZDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIzNzMiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsImNhcnQiOiJhcGFybmFAZ21haWwuY29tIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJ1c2VyX2lkIjozNzMsIl9hdXRoX3VzZXJfaGFzaCI6ImMxN2JkNjYxMjY0NWEyMDhhY2YxMjNlZTQxMWJjYmFmZTM2ZjE3YmUiLCJ1c2VyX25hbWUiOiJhcGFybmFAZ21haWwuY29tIn0=	2017-09-25 14:43:08.669519+02
g7v0wkjrtl4i7kam2yhmpldq8hx5fonb	MjkwZGU5OTcwNWNhOGUyNTM2YTVjYzhkZjU3YTU0NGFiNmVjMDdiZDp7InVzZXJfaWQiOjM3MywiX2F1dGhfdXNlcl9pZCI6IjM3MyIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiY2FydCI6ImFwYXJuYUBnbWFpbC5jb20iLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaGFzaCI6ImMxN2JkNjYxMjY0NWEyMDhhY2YxMjNlZTQxMWJjYmFmZTM2ZjE3YmUiLCJ1c2VyX25hbWUiOiJhcGFybmFAZ21haWwuY29tIn0=	2017-09-25 14:45:56.273383+02
ekca5n5ffxu0l09vto7lhqutiz0hr44g	OTdkYzhlMjdiMGY5NDcwMTRlZjhkODcxYmM0YjYxNzFkYzVkMDU3NTp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sInNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiRzFqOW14RVYwMFFUIl19	2017-09-26 05:59:02.142639+02
6tegn69klysv6dvtztouw7bmol8upkro	Y2UxNjYxYWY5OGFkYTQxZDg5ZGIwYWU2ZTlmMTljNGI2MDE4MDNhZDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiIzNzMiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsImNhcnQiOiJhcGFybmFAZ21haWwuY29tIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJ1c2VyX2lkIjozNzMsIl9hdXRoX3VzZXJfaGFzaCI6ImMxN2JkNjYxMjY0NWEyMDhhY2YxMjNlZTQxMWJjYmFmZTM2ZjE3YmUiLCJ1c2VyX25hbWUiOiJhcGFybmFAZ21haWwuY29tIn0=	2017-09-26 06:35:11.954591+02
w4xdqyg97rz3u7fc90hs2l7jnqxo1vi9	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-09 14:46:04.045545+02
a9djmpkaol20ngnxoz5j3u4z8kplp4hx	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-02 15:27:34.241815+02
pvge9uquhi8gcsh01a7t0awlde2agb4q	NjM1OTdmM2RiZWJjYzU5YmNlNDQ5MWE0ZDFkYzQxZDVlOTVjYmYwYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjE1YzZmYjI5YzEzMjA4NTFiN2FlZmE0ZWEzNjFkMzM4NTBlMjhmZjQiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNDk1In0=	2017-09-26 11:38:32.361133+02
40remzbfpe22nsotamd7q6m1l86avikn	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-05 07:38:18.418209+02
ya0rtw22gk2mh63rp2gle9jpdrv8hlvq	MjAzZjcwZmRhMWI5ODFhYjJmNTNhYzE4ZDdiNjk4NTQwMjYzNTI4MDp7Il9sYW5ndWFnZSI6ImVuIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fX0=	2017-10-11 07:36:31.979737+02
htt1hv4ltw2q3aohjxbcqp9mjtw44aip	MjAzZjcwZmRhMWI5ODFhYjJmNTNhYzE4ZDdiNjk4NTQwMjYzNTI4MDp7Il9sYW5ndWFnZSI6ImVuIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fX0=	2017-10-10 10:51:27.367511+02
ngbi8knaegsicffd1ngxl98bvua0d9gj	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-29 12:03:46.650299+02
j9xuy7jisv9xule5a04q1s76dw3ysar0	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-29 13:22:11.0372+02
x0ed50axacvtikq2p66jdo3j8k9qsj72	ZTQ1YzFmODljYjNjMmI2MjRiODAzOGJkYzcwYTExZWY4NTgwYTRkZjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI0MDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiIsIl9hdXRoX3VzZXJfaGFzaCI6Ijg5YjM3N2U4OGMwYWNjNTQzN2Y4NWJiOTQ5ZjQyYmQyYWJmMDU4MTQifQ==	2017-09-23 13:16:16.099303+02
1k0ul88nufco8rb72pkztp6p6lhz4ksy	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-29 14:29:52.107931+02
egbi0y2fmuhye3p2l3axakcebe5gwz6d	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-29 15:45:38.795373+02
zninsa2r5lfgmcjqp8yiz26eb7svlykz	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-30 09:37:22.174575+02
hkw6yo241peq0coscnalbxt00k15b10w	MGFiYWQ5ZTgxZjM2ZTMwNjUzNzk2MjFiNDZhMDk5OGE0ZjhmMThmYjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI0MDkiLCJjYXJ0IjoiYW1pdCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9oYXNoIjoiODliMzc3ZTg4YzBhY2M1NDM3Zjg1YmI5NDlmNDJiZDJhYmYwNTgxNCJ9	2017-09-23 12:39:57.165692+02
l8wnjjcjein1i5aunhxujtoqyuat05x8	MjkwZGU5OTcwNWNhOGUyNTM2YTVjYzhkZjU3YTU0NGFiNmVjMDdiZDp7InVzZXJfaWQiOjM3MywiX2F1dGhfdXNlcl9pZCI6IjM3MyIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiY2FydCI6ImFwYXJuYUBnbWFpbC5jb20iLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaGFzaCI6ImMxN2JkNjYxMjY0NWEyMDhhY2YxMjNlZTQxMWJjYmFmZTM2ZjE3YmUiLCJ1c2VyX25hbWUiOiJhcGFybmFAZ21haWwuY29tIn0=	2017-09-23 13:19:46.014902+02
uehzglpfauhddpii0zts5v5qcxscqs6t	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-26 07:35:52.866966+02
rwf41huj2iotbvoz2cz0n46j5gqe2r03	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-26 07:36:15.110148+02
bz2ak106rjn5f40ugl3fq32c4eshatvj	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-02 08:29:54.640696+02
8c8c01vt2tpr1cl57aohged94en8ipz2	MDFjZWY1Zjk3Zjk0MGMzMDdkZTAxYWM0YTM3YzdlYzUxN2NmYjRlZDp7InVzZXJfaWQiOjQ4NCwiX2F1dGhfdXNlcl9pZCI6IjQ4NCIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiI2ZjFjYWI0MGQ4MzI5YjUyZDMzNzY4ZGFkZWM2N2NmY2U1YjAxZmY5IiwidXNlcl9uYW1lIjoiYXNkZmdAZ21haWwuY29tIn0=	2017-09-26 08:32:22.432252+02
krpa2h5jzrqsf4haiamcosfwu9zxt2uh	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-26 08:43:48.244551+02
yv90k3nyi86bto7da1zk3l5he8r8c821	ODIyMzA4NDMyNmM1YmEwZDU4NTYwNDUxNmFmNzIzYTEzNTkxMjg4Njp7InVzZXJfaWQiOjQ1NiwiX2F1dGhfdXNlcl9pZCI6IjQ1NiIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiY2FydCI6InJhaHVsQGdtYWlsLmNvbSIsIl9sYW5ndWFnZSI6ImVuIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fSwiX2F1dGhfdXNlcl9oYXNoIjoiMjAxYWFmOTM0MjljZjVkYjkxYzZjNjc4YmRlYTU5M2ZhZTIyMjYxZCIsInVzZXJfbmFtZSI6InJhaHVsQGdtYWlsLmNvbSJ9	2017-09-29 08:27:55.516476+02
zihbaqs5zlciiw3jiqv2izc0nxbfqg2u	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-24 10:15:27.625128+02
gwevtxn5eoo9vcsgcp36m6n7hkjq0qjo	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-25 07:55:10.361539+02
ar4j70pq7ve4l31in86yw3phinjutji7	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-25 14:54:59.64154+02
md7mybvyo3fio1lb6pwh0osfxc5e9emi	Y2QwYjFlMTcyODAyODVhNDg5MWYwODVlYTZmMTYzZjAxOTEwNTJmODp7InVzZXJfaWQiOjM3MywiX2F1dGhfdXNlcl9pZCI6IjM3MyIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiJjMTdiZDY2MTI2NDVhMjA4YWNmMTIzZWU0MTFiY2JhZmUzNmYxN2JlIiwidXNlcl9uYW1lIjoiYXBhcm5hQGdtYWlsLmNvbSJ9	2017-09-26 08:58:01.864564+02
kufpfbn58jxp26i93t0v4c5godu0dgoe	ODA1YWEzZjk5ZWRmZDMxZDdmOTczOTg3ZDgxYjYxMTQyOWM5YmY4ZTp7InVzZXJfaWQiOjQ5MCwiX2F1dGhfdXNlcl9pZCI6IjQ5MCIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fSwiX2F1dGhfdXNlcl9oYXNoIjoiMzA0YWY0YzczNWNjZThkNjNhNjk5NmVkOGU5ZWYwNzIzNzZhODQ4MCIsInVzZXJfbmFtZSI6InRlc3RkZW1vdGVzdDBAZ21haWwuY29tIn0=	2017-09-26 11:12:04.107108+02
klo8yo3pghg7cztrvo5p44s2zz2c6tlg	NjgxMzMwYjE3YTEyODEzNjIzMmEwMjk5MWJiYWMxYTAzOTk0ZDdiYjp7InVzZXJfaWQiOjU0NywiX2F1dGhfdXNlcl9pZCI6IjU0NyIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiI0YTg0OGE4MzA0NzZiMzI1MjVjZjVhOGYwMzdiOWRhMzRjMzhjZjJhIiwidXNlcl9uYW1lIjoiaXNoYV9zaGFybWFAZXNmZXJhc29mdC5jb20ifQ==	2017-10-09 12:45:05.679396+02
063dyip4asisduka4c1lllh9dx5zg42k	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-09 13:03:37.292661+02
s77afgfb3g2j3kyrl3jdfi56q731em3q	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-10 05:57:34.92245+02
u8u0ann4uuj2p32lkxe0s39du6qjgv95	MDQ0MjdjOGY4YmVkNTFmNDc5ZmY0MjkxMTQwNzEwOWI0YmFhYWVhNjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI1MTIiLCJyZXN0YXVyYW50X2lkIjo2OCwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJfYXV0aF91c2VyX2hhc2giOiIxYmNiMmJmODUyZGUyNDE1ZmE0NjI5M2Q2ZTNjNTNkYTU5N2U3ZDFmIn0=	2017-10-07 07:06:25.334435+02
teh4ccyv26a69xnbvdt57z9850ugwsb3	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-09 13:03:48.549589+02
yykssdp6pr3bo5cx9fb8qmyjmgfm75pr	ZGEyMDFjODVkNmZmZGJjNThmZjcxYTg0MjA0MWIyNTY5NjJkMDJhNjp7InVzZXJfaWQiOjU2NiwiX2F1dGhfdXNlcl9pZCI6IjU2NiIsInJlc3RhdXJhbnRfaWQiOjcwLCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiI3NThiYjA2ZTU3NTZlNDczMzgwM2UxYWJiYTJmNTA0ZDFjNmYzNWEzIiwidXNlcl9uYW1lIjoiZXNmZXJhQGdtYWlsLmNvbSJ9	2017-10-07 09:27:41.597641+02
jmgra2u6wke8xg9i93w8hgo3rd45qhmd	MjkwZGU5OTcwNWNhOGUyNTM2YTVjYzhkZjU3YTU0NGFiNmVjMDdiZDp7InVzZXJfaWQiOjM3MywiX2F1dGhfdXNlcl9pZCI6IjM3MyIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiY2FydCI6ImFwYXJuYUBnbWFpbC5jb20iLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaGFzaCI6ImMxN2JkNjYxMjY0NWEyMDhhY2YxMjNlZTQxMWJjYmFmZTM2ZjE3YmUiLCJ1c2VyX25hbWUiOiJhcGFybmFAZ21haWwuY29tIn0=	2017-09-29 09:16:55.545062+02
3owgyp88w05nrqyut26xzj5e9q8br4n2	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-29 11:13:00.318124+02
xnmlb29j1ufz2oov66xlir6o7nc3ujxn	ODQwOTljZGE3ZDIzYjAyY2MzZmUxZWUwZDlmZmUyMzk4OWMwMGQ2OTp7InVzZXJfaWQiOjUyNywiX2F1dGhfdXNlcl9pZCI6IjUyNyIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiI4MDQzZGYyZTg3MTUwMWE3NTVlZmFlMzZmMjZlN2M1MzczZmIwZjk1IiwidXNlcl9uYW1lIjoic2ludUBnbWFpbC5jb20ifQ==	2017-10-03 09:27:07.531544+02
55cnkjo57cai5wz2tf509qa9v2x4s3ap	NDVmNWY2OGYyMDA4ODcwYWM4YmEyYzYzOGYwODYxYWQ1YTU2MWM2Yzp7InVzZXJfaWQiOjUyMCwiX2F1dGhfdXNlcl9pZCI6IjUyMCIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiIzZTJlMThlZjVlODhkOGQ4MGUyYmVmMTljMmFkNTNlYzdiMmMwZDAxIiwidXNlcl9uYW1lIjoiYW51QGdtYWlsLmNvbSJ9	2017-10-03 11:53:21.620625+02
n4db7ogftj75e603h6kqg66oex7wm0dp	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-02 05:23:57.355546+02
ka0dqxx1nnlh7b3xf8esg35hk6f100ab	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-03 13:05:45.756599+02
33x0sgh6gzg4a1g4br53l7yslhrxl4lf	MjAzZjcwZmRhMWI5ODFhYjJmNTNhYzE4ZDdiNjk4NTQwMjYzNTI4MDp7Il9sYW5ndWFnZSI6ImVuIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fX0=	2017-10-03 13:13:12.516533+02
pfxutxclw7cm5y4t3prpsl9tb4e5ltxi	ZjkzY2ZlMDNmMjhkODRiOTU1YjJlMjE0NTA0NDFhY2I1OGE1ZjIxODp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI1MTkiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsImNhcnQiOiJzaXZhbUBnbWFpbC5jb20iLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJ1c2VyX2lkIjo1MTksIl9hdXRoX3VzZXJfaGFzaCI6IjU0MWZmZDgzNjlkZTQ2MGE5OWE3MjlkNDZiY2E3ODYyZTUyYjljMGMiLCJ1c2VyX25hbWUiOiJzaXZhbUBnbWFpbC5jb20ifQ==	2017-10-03 07:09:46.078995+02
x2l1xct9d8olofubcnd7gcfs69qmctl2	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-04 07:39:35.837392+02
lbw7ci7pehdzlh9i27p6a93hsunwqvgg	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-04 10:09:34.865801+02
9k2b67m8l7n0739exjqtbk071jljev7l	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-04 10:09:34.9818+02
phh03mfyaf5zqb8k8mf1apkjj1opfzu2	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-27 03:34:47.80813+02
5qvpvo91e8x3sonvl1kcsyn2x7uxhgwc	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-03 08:29:16.709891+02
tg777z5olxdlj1u8b5jk4dtquwjbs391	NTY4MjRkMDQyYWJlM2U4YTI1ZjYwZWNjYWU3NmRhZjFkNmY0NzViODp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI0NTYiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsImNhcnQiOiJyYWh1bEBnbWFpbC5jb20iLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiIsInVzZXJfaWQiOjQ1NiwiX2F1dGhfdXNlcl9oYXNoIjoiMjAxYWFmOTM0MjljZjVkYjkxYzZjNjc4YmRlYTU5M2ZhZTIyMjYxZCIsInVzZXJfbmFtZSI6InJhaHVsQGdtYWlsLmNvbSJ9	2017-09-27 07:15:13.027393+02
4pfc6iuw44yrwx0yg93wj0z3ukp22i3y	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-27 11:06:33.71779+02
xl665at89d60b9gxmecj6c9mwzjire1h	NjM0OGFhZmI5NzJiNGU4ZmY1ODg5Mzg1OTFhZGRmYmI1ZTg0ZmZiYjp7Il9sYW5ndWFnZSI6ImVuIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fSwiY2FydCI6Imd1ZXN0NDQwIn0=	2017-09-27 11:42:01.25591+02
58fqt7w3l1ewsnguhvgrtp0nn9jai1s5	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-27 15:06:27.883055+02
b8em1fxs94satysgz5m98jd6dakikc9q	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-28 05:46:59.658019+02
c7skxxxw4n265lfw3zh8979qa3h51a9e	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-28 15:09:48.717954+02
dsboyzc080r3bnc4fqpddi5tblf8i8g5	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-28 18:29:43.030389+02
z2xe1ef11cpdjxqblax1ogncvuu7jviy	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-29 05:32:31.573429+02
gj89autokh8ry17ao9m4gvxto1gaznvf	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-29 05:32:31.954361+02
0o8r9ciixvw5grmmz3wcyom2adleutx9	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-29 05:35:28.129415+02
yn4zqwb0exivrct31gp2r9ncikj5uvf7	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-29 07:18:18.269744+02
vmpepj3mep3pf97yreu9tnkvexnhrge4	YjZiOTEwNWJiMzU2OGE2OTA1NjBjNDViODM1ZDNlNjE1OTY5YTdiNTp7InJlc3RhdXJhbnRfaWQiOjU0LCJfYXV0aF91c2VyX2hhc2giOiIxYmNiMmJmODUyZGUyNDE1ZmE0NjI5M2Q2ZTNjNTNkYTU5N2U3ZDFmIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fSwiX2F1dGhfdXNlcl9pZCI6IjUxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2017-10-03 08:43:04.461862+02
25fnsqzslpnxczlrvwpp2vx7z9egcg8v	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-09-29 08:36:09.175455+02
z8hdx8l1jcx0qzd6o2c13gk55xtlapdm	ZGEyMDFjODVkNmZmZGJjNThmZjcxYTg0MjA0MWIyNTY5NjJkMDJhNjp7InVzZXJfaWQiOjU2NiwiX2F1dGhfdXNlcl9pZCI6IjU2NiIsInJlc3RhdXJhbnRfaWQiOjcwLCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiI3NThiYjA2ZTU3NTZlNDczMzgwM2UxYWJiYTJmNTA0ZDFjNmYzNWEzIiwidXNlcl9uYW1lIjoiZXNmZXJhQGdtYWlsLmNvbSJ9	2017-10-10 07:48:43.367175+02
skvn5j1oyxdcdtit2t8lozehsmk0szij	ZGEyMDFjODVkNmZmZGJjNThmZjcxYTg0MjA0MWIyNTY5NjJkMDJhNjp7InVzZXJfaWQiOjU2NiwiX2F1dGhfdXNlcl9pZCI6IjU2NiIsInJlc3RhdXJhbnRfaWQiOjcwLCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiI3NThiYjA2ZTU3NTZlNDczMzgwM2UxYWJiYTJmNTA0ZDFjNmYzNWEzIiwidXNlcl9uYW1lIjoiZXNmZXJhQGdtYWlsLmNvbSJ9	2017-10-09 11:06:28.65346+02
y4bo7l8wxbepu7mug1lgt1eyd6gn84a6	OWI3MmFkMGU1M2MzODExZDU4YzkzNDQ5YTZlYTdkZDE0OWFlNGU3NTp7InVzZXJfaWQiOjUzNCwiX2F1dGhfdXNlcl9pZCI6IjUzNCIsInJlc3RhdXJhbnRfaWQiOjYwLCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiIxZDE0NWEzODRkNzJlN2VkZGQwZThmYTFhMzA0YmViZTA5ODJmMDg5IiwidXNlcl9uYW1lIjoic2FndW5AZ21haWwuY29tIn0=	2017-10-03 13:31:57.022549+02
838tvftpvl86gunqyxmw2mbch8rprhs9	ZDQ4ZjQyOTA5ZDE5ZmRkZjEwODg5ZWEyMjYzMDliOTVmZDM1YThkNzp7InVzZXJfaWQiOjU4NywiX2F1dGhfdXNlcl9pZCI6IjU4NyIsInJlc3RhdXJhbnRfaWQiOjc2LCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiIxZDlkZTAzMmY3MTQxYmU4NGE1YjJkMjNlZGQ0NDM1MDc2YTVmYTFjIiwidXNlcl9uYW1lIjoicml0aWtAZ21haWwuY29tIn0=	2017-10-17 09:15:18.796344+02
4984vv3jgvh0svedr3f7co4aykbjqpch	ZTQyMWI2ZjcyNWUwMWZlMGVjYTRiYjZjZmY1NDJjYzdhZDg4OGQ1ODp7InVzZXJfaWQiOjUyMCwiX2F1dGhfdXNlcl9pZCI6IjUyMCIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiY2FydCI6ImFudUBnbWFpbC5jb20iLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaGFzaCI6IjNlMmUxOGVmNWU4OGQ4ZDgwZTJiZWYxOWMyYWQ1M2VjN2IyYzBkMDEiLCJ1c2VyX25hbWUiOiJhbnVAZ21haWwuY29tIn0=	2017-10-11 08:46:24.186992+02
0ag8t8rhofdf0k431p09jk0rge0kvw6z	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-09 13:04:48.968367+02
tmhipqjjbettsjmb46ikoghrbb2983tz	ZGEyMDFjODVkNmZmZGJjNThmZjcxYTg0MjA0MWIyNTY5NjJkMDJhNjp7InVzZXJfaWQiOjU2NiwiX2F1dGhfdXNlcl9pZCI6IjU2NiIsInJlc3RhdXJhbnRfaWQiOjcwLCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiI3NThiYjA2ZTU3NTZlNDczMzgwM2UxYWJiYTJmNTA0ZDFjNmYzNWEzIiwidXNlcl9uYW1lIjoiZXNmZXJhQGdtYWlsLmNvbSJ9	2017-10-10 09:06:09.462051+02
wlvm34rh922vd9uulry2we4liws9ym1z	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-12 11:14:50.170397+02
mqhvfo6y90v4kbztkmuy2hqhd3qsdsra	ZTBhMTQzMjA1ZGU3ZTI5Nzk0ZWQwZDM1N2M2Yzc1MTQ3YWYzMDM2Yzp7InVzZXJfaWQiOjU4NSwiX2F1dGhfdXNlcl9pZCI6IjU4NSIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiY2FydCI6ImJhbmRuYUBnbWFpbC5jb20iLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaGFzaCI6ImRiYzBhYzAwZGFjMjg2ZDRkZjFkODQwMzAzOWZiYjM5MGM5ZGNmNWQiLCJ1c2VyX25hbWUiOiJiYW5kbmFAZ21haWwuY29tIn0=	2017-10-17 13:58:41.744461+02
ix0t8lfwnmh23tlwlttanqvnr14lvuc9	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-11 11:33:39.743952+02
gf5wq3o3vudujjcscszvx9ce5j6ej02s	ZmJmODcwNjg4MGRiZjJkYTQ2NzI1NTg4YmIxYzI1ZjhmNzU4MzNiYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiY2IyYmY4NTJkZTI0MTVmYTQ2MjkzZDZlM2M1M2RhNTk3ZTdkMWYiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2lkIjoiNTEyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-10-17 14:14:59.967753+02
vpvqaq59t6wetvryojox5veiamcy99v8	ZDQ4ZjQyOTA5ZDE5ZmRkZjEwODg5ZWEyMjYzMDliOTVmZDM1YThkNzp7InVzZXJfaWQiOjU4NywiX2F1dGhfdXNlcl9pZCI6IjU4NyIsInJlc3RhdXJhbnRfaWQiOjc2LCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiIxZDlkZTAzMmY3MTQxYmU4NGE1YjJkMjNlZGQ0NDM1MDc2YTVmYTFjIiwidXNlcl9uYW1lIjoicml0aWtAZ21haWwuY29tIn0=	2017-10-17 15:06:42.598169+02
vg0qstupol9p8d8oo0tcrl023msxnke7	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-24 10:37:56.834095+02
3u42rfkh1ibew1hoy7fb78xvk0fwym9b	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-25 12:51:53.090627+02
yez8fn5joqe9nwnmlkod0auqn7npumwc	ZTBhMTQzMjA1ZGU3ZTI5Nzk0ZWQwZDM1N2M2Yzc1MTQ3YWYzMDM2Yzp7InVzZXJfaWQiOjU4NSwiX2F1dGhfdXNlcl9pZCI6IjU4NSIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiY2FydCI6ImJhbmRuYUBnbWFpbC5jb20iLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaGFzaCI6ImRiYzBhYzAwZGFjMjg2ZDRkZjFkODQwMzAzOWZiYjM5MGM5ZGNmNWQiLCJ1c2VyX25hbWUiOiJiYW5kbmFAZ21haWwuY29tIn0=	2017-10-17 07:36:40.729636+02
g0h35v6um7qdqbqctrlk65wulab5cb1a	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-26 06:18:38.140153+02
g4ge6x1om519nkdvrhezpy5p6zob8b3x	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-27 09:00:10.841123+02
uf7uyfza71bswuk6tsus7qgz7hp8sdw3	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-30 07:54:08.340777+01
g7hlnmswjf6dn62m87dzwoyjje217mmv	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-11-01 08:55:38.083975+01
gbq99f6f47z6wmet8w77nqtnjg84l7bu	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-11-09 09:48:17.145696+01
84of88d7axh06h548c0nw0qiqolwm2sy	ZDQwZjgxY2VhZjE2ZmJkMzQ0ZjljNGQ3OTc5OWNlMmQ0NTVhMzJjYzp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI1ODUiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsImNhcnQiOiJiYW5kbmFAZ21haWwuY29tIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJ1c2VyX2lkIjo1ODUsIl9hdXRoX3VzZXJfaGFzaCI6ImRiYzBhYzAwZGFjMjg2ZDRkZjFkODQwMzAzOWZiYjM5MGM5ZGNmNWQiLCJ1c2VyX25hbWUiOiJiYW5kbmFAZ21haWwuY29tIn0=	2017-10-17 07:37:49.689688+02
29h9bqzo5jvm0hogil9c1k4nnw7xqscq	MGVmNTE0NWFhMDMzOGY0MjhlOTZkNjg5MTRlMjJkYzgzMDFhNDYzMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjVkZjU2ZjAzMjMwNDdmNmYwYTI5MWU1MTYyYjk0YjliNzBmZGIyZDIiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNjAxIn0=	2017-11-15 06:15:38.8903+01
onvo1y30pde9rilz7p65zstuee6xfveq	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-09 15:19:05.275243+02
0e3j1z0pbmvg0i9fgiumjb0chav66ddx	ZGEyMDFjODVkNmZmZGJjNThmZjcxYTg0MjA0MWIyNTY5NjJkMDJhNjp7InVzZXJfaWQiOjU2NiwiX2F1dGhfdXNlcl9pZCI6IjU2NiIsInJlc3RhdXJhbnRfaWQiOjcwLCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiI3NThiYjA2ZTU3NTZlNDczMzgwM2UxYWJiYTJmNTA0ZDFjNmYzNWEzIiwidXNlcl9uYW1lIjoiZXNmZXJhQGdtYWlsLmNvbSJ9	2017-10-11 11:40:34.296545+02
xvmj5o2t1jld6i05rysyi99rrg83jb2h	ZGEyMDFjODVkNmZmZGJjNThmZjcxYTg0MjA0MWIyNTY5NjJkMDJhNjp7InVzZXJfaWQiOjU2NiwiX2F1dGhfdXNlcl9pZCI6IjU2NiIsInJlc3RhdXJhbnRfaWQiOjcwLCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiI3NThiYjA2ZTU3NTZlNDczMzgwM2UxYWJiYTJmNTA0ZDFjNmYzNWEzIiwidXNlcl9uYW1lIjoiZXNmZXJhQGdtYWlsLmNvbSJ9	2017-10-07 09:09:58.107053+02
u8pdr6rp0ra9mb2iefwkxiq1b77ifznb	NWQ1ZmU2YmI4NzM2YjE2NjlkMzVhZTFkZDUwMWMyYjJjYzQxMWZiZTp7InVzZXJfaWQiOjUyNSwiX2F1dGhfdXNlcl9pZCI6IjUyNSIsInJlc3RhdXJhbnRfaWQiOjU0LCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiIzNmJmOTc5Y2MwZDRjZTg2NTIxYjQ0ODQzYTVjNzFkMWZiZDE0MGFlIiwidXNlcl9uYW1lIjoicmlkaW1hQGdtYWlsLmNvbSJ9	2017-10-05 11:45:39.991779+02
jqpl8ssgmw5xkeqxvbfw8ui21at5ea8k	MjAzZjcwZmRhMWI5ODFhYjJmNTNhYzE4ZDdiNjk4NTQwMjYzNTI4MDp7Il9sYW5ndWFnZSI6ImVuIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fX0=	2017-10-17 08:53:57.930791+02
90a306f8v7a2i1co64jchmzl76w69o19	MjAzZjcwZmRhMWI5ODFhYjJmNTNhYzE4ZDdiNjk4NTQwMjYzNTI4MDp7Il9sYW5ndWFnZSI6ImVuIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fX0=	2017-10-07 11:56:21.926562+02
1ox16ksjew9ufbxjbyerfp0emm01m8s0	MjAzZjcwZmRhMWI5ODFhYjJmNTNhYzE4ZDdiNjk4NTQwMjYzNTI4MDp7Il9sYW5ndWFnZSI6ImVuIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fX0=	2017-10-11 07:38:53.712998+02
bzphzm4w9s5e1rb1l2rvoxzi5m5oxjz5	NjZhZTY0YzQ4NGY5ZDZhNGE2MDg5M2ZlZjE3OGNhNjVlMmIxMjk1ZTp7Il9sYW5ndWFnZSI6ImVuIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fSwiY2FydCI6Imd1ZXN0NTc3In0=	2017-10-11 12:01:31.604393+02
ckbjxq29cuke00y6gciwx8fs4i2fvsm2	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-05 10:48:11.971971+02
882ubf18lxsagidlgxjzhl0d7rhug8tz	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-12 14:43:24.891361+02
7e17v8jdi88emwfw7ex661n2krho0qrp	ZmJmODcwNjg4MGRiZjJkYTQ2NzI1NTg4YmIxYzI1ZjhmNzU4MzNiYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiY2IyYmY4NTJkZTI0MTVmYTQ2MjkzZDZlM2M1M2RhNTk3ZTdkMWYiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2lkIjoiNTEyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-10-06 09:05:09.605039+02
k84ye64jig8jlhoj6yyols5ne3m86e8e	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-10 06:20:16.286513+02
a5po79ji0auv7mf6maprmyi1kaqgoxsn	MjAzZjcwZmRhMWI5ODFhYjJmNTNhYzE4ZDdiNjk4NTQwMjYzNTI4MDp7Il9sYW5ndWFnZSI6ImVuIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fX0=	2017-10-10 12:41:30.498603+02
8xluv6rxlzl7gsfwrz4u3jvp5cjjt4gc	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-10 07:34:19.550931+02
q3p3nyerr2uz4boh34gw6o3ev2vlhldl	MWU5YWU0ZmZlOTA4NWRkODFlNjgwNmQ0Y2Y3MDA5Mjk3N2E5ZTU0ODp7Il9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWJjYjJiZjg1MmRlMjQxNWZhNDYyOTNkNmUzYzUzZGE1OTdlN2QxZiIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1MTIifQ==	2017-10-17 06:50:52.348378+02
j838fy4llrcjcbnq1j5ys10dfyijndk9	OTJiOWYyNTBjZTgxN2YzMTM2NmM2Njc5M2NkOTdjMmI5NzIwM2M0Yjp7InVzZXJfaWQiOjU4NSwiX2F1dGhfdXNlcl9pZCI6IjU4NSIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiJkYmMwYWMwMGRhYzI4NmQ0ZGYxZDg0MDMwMzlmYmIzOTBjOWRjZjVkIiwidXNlcl9uYW1lIjoiYmFuZG5hQGdtYWlsLmNvbSJ9	2017-10-18 07:06:22.216709+02
yney0frmapbg821hq257y86vaj3r33ji	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-09 13:05:36.353027+02
qakla9951hbvjls84j7333fvdsozw8rx	NjA5YWJmMjUyYzZmZjFmOWM3YzBlODViYWMzZjM0ODg0MGM0MzExYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiY2IyYmY4NTJkZTI0MTVmYTQ2MjkzZDZlM2M1M2RhNTk3ZTdkMWYiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNTEyIn0=	2017-10-23 17:36:03.925215+02
n40d1jsgvadi9pan7tr4eo6sjricuwiv	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-24 10:37:56.869484+02
ahhiz6r00aweogmzvjzcz55c8s4xrmtj	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-25 12:51:53.543985+02
jin3jz58i1xfy0al01hcf3fivbv1slup	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-26 09:19:44.878803+02
wegyy2nte31gamuvmxc5drjtiyooc9o4	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-27 11:20:25.209911+02
kcf6zj35ix8tzdh3ewowb6yc1l4glx2q	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-30 16:06:48.250584+01
i8zrufxfmyqyd2nl759zakb1tbv0odwo	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-11-02 07:27:52.859336+01
yi8ttd2p9t2qttpbsvpxfwwf4ynfkdh8	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-11-09 06:24:24.853064+01
kv7e98vmammx38tjyjl5nxrsvcfc0y6t	MDc1MDgxYjg1OWE2ZjZmZDMzM2E2YjlhOTJiZjIzZTNkOWFhMzEyMDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI1OTkiLCJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIjg5TTlJSjVmYm13MCJdLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsImNhcnQiOiJjcmlzLm1xMTk5MUBnbWFpbC5jb20iLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiIsInVzZXJfaWQiOjU5OSwiX2F1dGhfdXNlcl9oYXNoIjoiZDI3MzdhNTg4NjY4YzVkNmU0YTFlMmVkMjNkYWQ5NjdhNmMxMWRmOCIsInVzZXJfbmFtZSI6ImNyaXMubXExOTkxQGdtYWlsLmNvbSJ9	2017-11-10 12:40:22.900664+01
b9phpq54hu6hw9dyw17qh3gbqu1inob2	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-11-15 06:16:07.434144+01
prse9s1a4qm2w85qujbhim8f1tlhob81	NWQ1ZmU2YmI4NzM2YjE2NjlkMzVhZTFkZDUwMWMyYjJjYzQxMWZiZTp7InVzZXJfaWQiOjUyNSwiX2F1dGhfdXNlcl9pZCI6IjUyNSIsInJlc3RhdXJhbnRfaWQiOjU0LCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiIzNmJmOTc5Y2MwZDRjZTg2NTIxYjQ0ODQzYTVjNzFkMWZiZDE0MGFlIiwidXNlcl9uYW1lIjoicmlkaW1hQGdtYWlsLmNvbSJ9	2017-10-03 14:04:23.527979+02
ffhrxdq581bp87nk6te9e0wybz17kb7l	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-05 11:24:30.549935+02
19ysztcuxntcfs97qyitbr12vvl4us4v	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-04 15:47:02.463782+02
08rcv4br10ipyghtyqejkyesbgyr1wlg	ZTQyMWI2ZjcyNWUwMWZlMGVjYTRiYjZjZmY1NDJjYzdhZDg4OGQ1ODp7InVzZXJfaWQiOjUyMCwiX2F1dGhfdXNlcl9pZCI6IjUyMCIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiY2FydCI6ImFudUBnbWFpbC5jb20iLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaGFzaCI6IjNlMmUxOGVmNWU4OGQ4ZDgwZTJiZWYxOWMyYWQ1M2VjN2IyYzBkMDEiLCJ1c2VyX25hbWUiOiJhbnVAZ21haWwuY29tIn0=	2017-10-11 06:33:23.534307+02
o8nk4h7oc6i4nbsgrucgizftmh8u55pz	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-11 12:26:47.137725+02
m8mh71tve8i472l3wj45m9yp9hn6f9eg	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-12 14:52:32.266904+02
3u7rgz10q6ij8lm9wnv1iyf3t7077j1n	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-09 13:05:51.795858+02
hj4en2nm7qe29mxzkwbbbsu10mpjf9rn	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-05 10:48:12.082955+02
gujtoj1q7908uyo9ulb6iri3ptmbsp7r	NzVhMzMxNmRiMDU5ZDY3YzYzMTc4ZDY3MmJlNTMzZjE4MzRlMmFhYzp7InVzZXJfaWQiOjU3MCwiX2F1dGhfdXNlcl9pZCI6IjU3MCIsInJlc3RhdXJhbnRfaWQiOjcxLCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiJkMGUxZjg2MTI3MzZiOTFkNWY4YmEyZmYzYWE0OWE5MDZmZTdhNDA3IiwidXNlcl9uYW1lIjoiYW1hbmRlZXBfa2F1ckBlc2ZlcmFzb2Z0LmNvbSJ9	2017-10-09 14:28:10.698106+02
optjp5b40ehfjgeycmfb4n9pcvllppa3	NWQ1ZmU2YmI4NzM2YjE2NjlkMzVhZTFkZDUwMWMyYjJjYzQxMWZiZTp7InVzZXJfaWQiOjUyNSwiX2F1dGhfdXNlcl9pZCI6IjUyNSIsInJlc3RhdXJhbnRfaWQiOjU0LCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiIzNmJmOTc5Y2MwZDRjZTg2NTIxYjQ0ODQzYTVjNzFkMWZiZDE0MGFlIiwidXNlcl9uYW1lIjoicmlkaW1hQGdtYWlsLmNvbSJ9	2017-10-10 09:26:41.296139+02
xbdp61ksrqlsqw9amq8wxfccpq7tvw80	Y2FmZmZmNzFlYmFmNDA1NzM2OTRiM2YyNWM4OTllMGNjMzRlMDE4ZDp7Il9sYW5ndWFnZSI6ImVuIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fSwiY2FydCI6Imd1ZXN0MCJ9	2017-10-17 06:56:36.683724+02
igrljxtsgcx14z3xyycw6aahw1xlpxdg	NWNlNjEzODRmOTIwYmI2NWJmN2RkODk3MjhiNDdhYmYxZTI1YjZiNzp7InVzZXJfaWQiOjU3NywiX2F1dGhfdXNlcl9pZCI6IjU3NyIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiY2FydCI6ImlzaGFfc2hhcm1hQGVzZmVyYXNvZnQuY29tIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiJmZjRjNWIyM2JkYTczNmEwNTEwMzA5ZGEzNmQ4ZmEwZTMzNjVkYmJiIiwidXNlcl9uYW1lIjoiaXNoYV9zaGFybWFAZXNmZXJhc29mdC5jb20ifQ==	2017-10-10 13:03:57.133101+02
wnyd8ddjvdpu2hyeunmsf7kepbk3snj7	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-11 00:03:46.33934+02
0xters5o8x1hhj7fs3ih638v1wdhj346	MTliNGRjNTc5MWY5OGIwMTBjMTM1OTRjYzlkYzBlMjAyYjE0YTY1YTp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI1ODkiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9sYW5ndWFnZSI6ImVuIiwidXNlcl9pZCI6NTg5LCJfYXV0aF91c2VyX2hhc2giOiJiYzc2NzAyNjEwODk3ZGVkMmMxMjliNTlhODdkNTZmMzgxOTZmMjI4IiwidXNlcl9uYW1lIjoicG9vbmFtX2t1bWFyaUBlc2ZlcmFzb2Z0LmNvbSJ9	2017-10-17 08:19:28.901564+02
yht89d4toohmhldnfpi18l2v5cwimu1j	ZmViMDc0ZjZlMjNkOTNiMzJiNDFiZDQ5MmIxOGIxMzI4YTFiZTg0NDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI1ODUiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9sYW5ndWFnZSI6ImVuIiwidXNlcl9pZCI6NTg1LCJfYXV0aF91c2VyX2hhc2giOiJkYmMwYWMwMGRhYzI4NmQ0ZGYxZDg0MDMwMzlmYmIzOTBjOWRjZjVkIiwidXNlcl9uYW1lIjoiYmFuZG5hQGdtYWlsLmNvbSJ9	2017-10-17 15:03:19.432321+02
25mof38lrrlnm1ayzhkufcxsfw9daxg4	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-18 10:46:02.742932+02
ovcvlhjou6b7ppzkmfb4u8cb7dylcz8c	ZGEyMDFjODVkNmZmZGJjNThmZjcxYTg0MjA0MWIyNTY5NjJkMDJhNjp7InVzZXJfaWQiOjU2NiwiX2F1dGhfdXNlcl9pZCI6IjU2NiIsInJlc3RhdXJhbnRfaWQiOjcwLCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiI3NThiYjA2ZTU3NTZlNDczMzgwM2UxYWJiYTJmNTA0ZDFjNmYzNWEzIiwidXNlcl9uYW1lIjoiZXNmZXJhQGdtYWlsLmNvbSJ9	2017-10-07 11:58:21.666169+02
dupltx3qr7xi2bcp3wzxcs0rz4de5j4m	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-24 14:25:08.061752+02
phdun4c98cyhugcbs6r5lugz2ze5j6og	NTM3NGQ3NmY4ZmFlZWE1ZjMxYmQxNTY5NmFhNmM1Y2IyOTZlZTg4MDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sImNhcnQiOiJndWVzdDU4OSJ9	2017-10-25 12:52:40.912845+02
iuqdvera5dzuzhc9nbjy91wtridzontp	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-26 09:19:44.976968+02
u41svsw7g4al0nxdw09zdruetab089x7	YWM4OWMwMzgyNDJmNDdkYzJmMjMxYjhiNDIzMjcyODMwZDVlNDkzYTp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sImNhcnQiOiJndWVzdDU5NyIsInNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiWGFJQnViMDd4VGtiIl19	2017-10-27 15:43:19.024689+02
road4o3v3513kniei8snz05t1fwl5nc1	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-30 16:06:48.338685+01
rwwadsqv55vfogw5dzvc2djlavy8pcw4	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-11-02 07:27:52.900933+01
iwrtvyhhezh7vslh7prsiql1784s4ypd	Y2IxMWMzMjZmOGM4YTM2YjQ0NWQ3MmE2MThmYzQ5ZWZkOTQ0NGVhNzp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sImNhcnQiOiJndWVzdDYwMyJ9	2017-11-10 15:15:28.123843+01
hilbvnbeuhzj2f2k42w48lxeey4rifx8	MjAzZjcwZmRhMWI5ODFhYjJmNTNhYzE4ZDdiNjk4NTQwMjYzNTI4MDp7Il9sYW5ndWFnZSI6ImVuIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fX0=	2017-10-09 15:22:13.898732+02
27ryrnn99un8y9i3h62v6jes8h8ch6hv	MjRlZmIyMmM1MGE2YmI2YzcxMTViYzc4ODJiYmVkMzIxNDJmZjZlMDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI1MjAiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsImNhcnQiOiJhbnVAZ21haWwuY29tIiwiX2xhbmd1YWdlIjoiZW4iLCJ1c2VyX2lkIjo1MjAsIl9hdXRoX3VzZXJfaGFzaCI6IjNlMmUxOGVmNWU4OGQ4ZDgwZTJiZWYxOWMyYWQ1M2VjN2IyYzBkMDEiLCJ1c2VyX25hbWUiOiJhbnVAZ21haWwuY29tIn0=	2017-10-10 05:43:26.328269+02
gkma0jqaxe2lsrj5k4pg6decafiomw0b	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-11 06:55:52.952158+02
0c73nr8506u4gg70e1ygo5exl4ammhf5	MjAzZjcwZmRhMWI5ODFhYjJmNTNhYzE4ZDdiNjk4NTQwMjYzNTI4MDp7Il9sYW5ndWFnZSI6ImVuIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fX0=	2017-10-09 09:12:17.586037+02
138il35vrt5txice1q0151jzc4zx0mji	NWQ1ZmU2YmI4NzM2YjE2NjlkMzVhZTFkZDUwMWMyYjJjYzQxMWZiZTp7InVzZXJfaWQiOjUyNSwiX2F1dGhfdXNlcl9pZCI6IjUyNSIsInJlc3RhdXJhbnRfaWQiOjU0LCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiIzNmJmOTc5Y2MwZDRjZTg2NTIxYjQ0ODQzYTVjNzFkMWZiZDE0MGFlIiwidXNlcl9uYW1lIjoicmlkaW1hQGdtYWlsLmNvbSJ9	2017-10-03 14:23:04.906423+02
u23iix2wqu4t6ne657y32k9ftxabq699	NzIzOWQyOTFjMTAxYjQ3M2FlYjE0Yjc5NWRlYjI3YzJhMjhlYzdkNjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI1MjAiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsImNhcnQiOiJhbnVAZ21haWwuY29tIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJ1c2VyX2lkIjo1MjAsIl9hdXRoX3VzZXJfaGFzaCI6IjNlMmUxOGVmNWU4OGQ4ZDgwZTJiZWYxOWMyYWQ1M2VjN2IyYzBkMDEiLCJ1c2VyX25hbWUiOiJhbnVAZ21haWwuY29tIn0=	2017-10-06 12:12:14.90645+02
ghuuorvlrgg7s74rny9ss08d8rltstjo	ZmJmODcwNjg4MGRiZjJkYTQ2NzI1NTg4YmIxYzI1ZjhmNzU4MzNiYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiY2IyYmY4NTJkZTI0MTVmYTQ2MjkzZDZlM2M1M2RhNTk3ZTdkMWYiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2lkIjoiNTEyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-10-17 12:44:02.405219+02
762dhhpskt0911keroxxs2i5wmdbakgl	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-09 13:06:04.519727+02
e7f6wx28dhumxxpzq42zjmt9gsannmnr	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-13 05:46:44.980871+02
il9gkujwoxpcq8u91zuo9xo9zvhsylmc	ZTBhMTQzMjA1ZGU3ZTI5Nzk0ZWQwZDM1N2M2Yzc1MTQ3YWYzMDM2Yzp7InVzZXJfaWQiOjU4NSwiX2F1dGhfdXNlcl9pZCI6IjU4NSIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiY2FydCI6ImJhbmRuYUBnbWFpbC5jb20iLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaGFzaCI6ImRiYzBhYzAwZGFjMjg2ZDRkZjFkODQwMzAzOWZiYjM5MGM5ZGNmNWQiLCJ1c2VyX25hbWUiOiJiYW5kbmFAZ21haWwuY29tIn0=	2017-10-17 14:24:55.908683+02
gunsb593niui9bj7n0eg5lf32q7turf6	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-17 06:57:36.563217+02
sjjrf0dm9yh3y3j1kpo0irjqxhf1ifo1	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-21 07:09:42.437069+02
g6h3vdh3y8vydiw4krl96g6lj7au40hy	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-05 10:48:12.101548+02
yjxdb8te20dqc6kbpo87rzj98u9r93pd	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-24 22:50:18.002548+02
2fj6k56jwmaq6rgmibyyw8oebrc2la09	ZDQ4ZjQyOTA5ZDE5ZmRkZjEwODg5ZWEyMjYzMDliOTVmZDM1YThkNzp7InVzZXJfaWQiOjU4NywiX2F1dGhfdXNlcl9pZCI6IjU4NyIsInJlc3RhdXJhbnRfaWQiOjc2LCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiIxZDlkZTAzMmY3MTQxYmU4NGE1YjJkMjNlZGQ0NDM1MDc2YTVmYTFjIiwidXNlcl9uYW1lIjoicml0aWtAZ21haWwuY29tIn0=	2017-10-17 07:22:38.091015+02
s93a62qki7uunb2ed965xs4d4xpm1iep	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-25 16:46:44.602836+02
lrfoqesh90gw26n0sgec1lmyg5fto872	MjYxZjRmNjNhZWJmMWUxN2NlZTI4NmQ0NWIzN2I0YTczYjhjMmIwOTp7InVzZXJfaWQiOjU4NCwiX2F1dGhfdXNlcl9pZCI6IjU4NCIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiIzYmE5NzcyN2QzMjk2NmMwMDA0ZGQwNzZhNjljNDc3MTZiMjQyMjczIiwidXNlcl9uYW1lIjoicmFqaW5kZXJfbW9oYW5AZXNmZXJhc29mdC5jb20ifQ==	2017-10-17 07:44:02.963706+02
zvm7ke797oziqexj33epezc0zrf8s9wc	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-17 08:40:09.847505+02
qdig1detxwloyk8n5l7k1kj3vjzo2j07	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-26 09:19:45.037032+02
aoos0f1klmu8510rw3symtb6bz09y1z8	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-28 06:46:55.794103+02
dy913aj5q6qfnt2aamvwiq9hhwqtq1wa	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-31 04:40:49.435483+01
y0u7kwlmgmq355kforvcpx2ye94ptbl1	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-10 09:08:31.475357+02
x6lnb27z8dpeluf2pwpos4x6alxii6uy	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-11-03 07:40:08.333454+01
hlivbb22tf4utcbsfuenkelc2cfzwy5v	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-11-09 07:25:27.928738+01
44vbrbfnp2vd9ccpcu1vhqvyro9ueva5	MWU4ZTc4MGIyNmUwZWM2OTQzZGVlZWMzYWQyNTY3ZWY5NzBiMmVmMDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI1MzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsLCJfbGFuZ3VhZ2UiOiJlbiIsIl9hdXRoX3VzZXJfaGFzaCI6IjMxMmYyYWI4ZDI2MWFkMWJiNmFmNzliMDYxODdiYzQ2MTBlMmQ2NTYifQ==	2017-10-04 14:27:16.818456+02
qv1rv5hs5gau5ol92ixtppf483ibx7yq	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-04 15:51:53.737438+02
os53e53c6b8k7u0cfsy41gd4nfa6gti0	MjAzZjcwZmRhMWI5ODFhYjJmNTNhYzE4ZDdiNjk4NTQwMjYzNTI4MDp7Il9sYW5ndWFnZSI6ImVuIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fX0=	2017-10-10 08:18:05.025297+02
84qmellh6vdplrvgzt1q4uxcpf8veonb	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-10 09:08:51.12011+02
nx92cpp522t33qpa1mx04zggvn5h6ibn	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-09 15:37:30.578889+02
ro4nmgw5fsizmqde0mojsdz4vs2xhjbq	YTVlMWE2MWVlN2Y0YTQ5YmRhMDc3M2FiZTVjNDE3ZTVjM2Q2M2ZiNDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI1NTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiIsIl9hdXRoX3VzZXJfaGFzaCI6ImI0MmU3NThjZWIxZmRjMDc2NmI1MDkxYzc4NmRkYzg4ZmYyYWQ1NzUifQ==	2017-10-06 09:34:21.286029+02
pewquvilfiz7poz35a9fxs1ho3p6mykr	ZDQ4ZjQyOTA5ZDE5ZmRkZjEwODg5ZWEyMjYzMDliOTVmZDM1YThkNzp7InVzZXJfaWQiOjU4NywiX2F1dGhfdXNlcl9pZCI6IjU4NyIsInJlc3RhdXJhbnRfaWQiOjc2LCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiIxZDlkZTAzMmY3MTQxYmU4NGE1YjJkMjNlZGQ0NDM1MDc2YTVmYTFjIiwidXNlcl9uYW1lIjoicml0aWtAZ21haWwuY29tIn0=	2017-10-17 09:21:00.50433+02
vi6pucn1algmx278gw3v3smbryqftlvf	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-09 09:19:43.824866+02
vjztmconhdcy0zjr4t7nai88wpxtjbzs	ZmJmODcwNjg4MGRiZjJkYTQ2NzI1NTg4YmIxYzI1ZjhmNzU4MzNiYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiY2IyYmY4NTJkZTI0MTVmYTQ2MjkzZDZlM2M1M2RhNTk3ZTdkMWYiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2lkIjoiNTEyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-10-10 06:11:02.543973+02
bern21ycxl6e71ohj2y350abwrkjlvba	ZmJmODcwNjg4MGRiZjJkYTQ2NzI1NTg4YmIxYzI1ZjhmNzU4MzNiYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiY2IyYmY4NTJkZTI0MTVmYTQ2MjkzZDZlM2M1M2RhNTk3ZTdkMWYiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2lkIjoiNTEyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-10-10 06:23:29.843291+02
f7lm1r1q6zqfubinekqwfspm1mv03kbx	NzIzOWQyOTFjMTAxYjQ3M2FlYjE0Yjc5NWRlYjI3YzJhMjhlYzdkNjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI1MjAiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsImNhcnQiOiJhbnVAZ21haWwuY29tIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJ1c2VyX2lkIjo1MjAsIl9hdXRoX3VzZXJfaGFzaCI6IjNlMmUxOGVmNWU4OGQ4ZDgwZTJiZWYxOWMyYWQ1M2VjN2IyYzBkMDEiLCJ1c2VyX25hbWUiOiJhbnVAZ21haWwuY29tIn0=	2017-10-11 12:31:36.980247+02
c8s3tw599r39kyvbfqm2mf5vit64ddmc	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-09 13:06:17.102154+02
jfy9v8178d5ff18ftte7pd52zjxd2ztu	MjAzZjcwZmRhMWI5ODFhYjJmNTNhYzE4ZDdiNjk4NTQwMjYzNTI4MDp7Il9sYW5ndWFnZSI6ImVuIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fX0=	2017-10-10 06:36:25.980972+02
wdya4huu7lgqsm3pl2smfjgaml35xmcv	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-13 08:23:33.462871+02
i44d6zf397rjze4lvu0kwws0s28ux1ce	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-17 06:23:38.072389+02
6774fpsrypkspwzef9cq6u3vvdu14q8s	NDVmNWY2OGYyMDA4ODcwYWM4YmEyYzYzOGYwODYxYWQ1YTU2MWM2Yzp7InVzZXJfaWQiOjUyMCwiX2F1dGhfdXNlcl9pZCI6IjUyMCIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiIzZTJlMThlZjVlODhkOGQ4MGUyYmVmMTljMmFkNTNlYzdiMmMwZDAxIiwidXNlcl9uYW1lIjoiYW51QGdtYWlsLmNvbSJ9	2017-10-09 14:17:47.952352+02
n44ecupptpu2n5nx30wfsmxtamf42djs	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-23 10:20:38.284084+02
q47hwoh5cky3m7bt87iwcszrbfccq5mj	ZTQyMWI2ZjcyNWUwMWZlMGVjYTRiYjZjZmY1NDJjYzdhZDg4OGQ1ODp7InVzZXJfaWQiOjUyMCwiX2F1dGhfdXNlcl9pZCI6IjUyMCIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiY2FydCI6ImFudUBnbWFpbC5jb20iLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaGFzaCI6IjNlMmUxOGVmNWU4OGQ4ZDgwZTJiZWYxOWMyYWQ1M2VjN2IyYzBkMDEiLCJ1c2VyX25hbWUiOiJhbnVAZ21haWwuY29tIn0=	2017-10-11 06:00:51.179204+02
rtt96tgre0brm9er739ull2cm2uy6kjd	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-17 07:44:47.562085+02
f2io1hygimma91gd4vgovlxt1xzoglyx	YTVlMWE2MWVlN2Y0YTQ5YmRhMDc3M2FiZTVjNDE3ZTVjM2Q2M2ZiNDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI1NTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiIsIl9hdXRoX3VzZXJfaGFzaCI6ImI0MmU3NThjZWIxZmRjMDc2NmI1MDkxYzc4NmRkYzg4ZmYyYWQ1NzUifQ==	2017-10-23 17:54:06.645208+02
qyxp9sy5xj1ac2zr669epcnfkker2bpq	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-24 22:50:18.160374+02
455ta02602hgv11gmllh5fdj17oje6f0	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-25 16:46:44.680368+02
iehvders6rjcsk75gboqmzq9dii619wp	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-27 05:25:56.954712+02
wreatj3ch8sitpx6qj31u2898hd3sl31	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-30 04:26:06.061688+01
tyuw5cwq8jqqgvchb9tvfkotjhuteqtx	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-31 07:23:14.466894+01
12uaktxsi2ktq7g04ise0qjcbmq6d42c	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-11-06 05:19:08.767698+01
59vorw7t2o1kxwcvckwjtzq0w6ifzcfd	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-11-10 11:25:35.009919+01
8z2hnoqnw4hh841khbko9lajaq5zgaqi	NjA5YWJmMjUyYzZmZjFmOWM3YzBlODViYWMzZjM0ODg0MGM0MzExYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiY2IyYmY4NTJkZTI0MTVmYTQ2MjkzZDZlM2M1M2RhNTk3ZTdkMWYiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNTEyIn0=	2017-11-10 15:33:55.684387+01
qbt9xtfa8zyhc0hsc97zu4n8uzo6fq0u	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-04 14:37:56.858943+02
gidbynb75n574o6cjxu5odruo4t7x9xx	YTdmNDg2NmZhNmYyZmU5MTU5MjljYWZiNzRmNWQyYTkwODg0NTU3MDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI1MjUiLCJyZXN0YXVyYW50X2lkIjo1NCwidXNlcl90eXBlIjoiUmVzdGF1cmFudCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsImNhcnQiOiJndWVzdDQzNiIsIl9sYW5ndWFnZSI6ImVuIiwidXNlcl9pZCI6NTI1LCJfYXV0aF91c2VyX2hhc2giOiIzNmJmOTc5Y2MwZDRjZTg2NTIxYjQ0ODQzYTVjNzFkMWZiZDE0MGFlIiwidXNlcl9uYW1lIjoicmlkaW1hQGdtYWlsLmNvbSJ9	2017-10-04 16:03:53.829611+02
zta77807oqmqof86anmh6dwg95cyr9pp	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-10 09:11:15.412625+02
jpux5hj5lozehg9grhxakhubxc1i50b5	YmFiOGVkNDZjNjRmOWIwZGE5ZTg0Y2Y2YTc5MTUwOTM1ZWQzNDhmYzp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI1MTkiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9sYW5ndWFnZSI6ImVuIiwidXNlcl9pZCI6NTE5LCJfYXV0aF91c2VyX2hhc2giOiI1NDFmZmQ4MzY5ZGU0NjBhOTlhNzI5ZDQ2YmNhNzg2MmU1MmI5YzBjIiwidXNlcl9uYW1lIjoic2l2YW1AZ21haWwuY29tIn0=	2017-10-05 07:27:36.69513+02
2xnxbqv8pd36u38wfma9qnvc48clp6og	Yzc0ZGVjYWM3OTc3NmY5YmVlYzlhNjgwNjI4ZmEzYzI2MDBiMDBiZTp7InVzZXJfaWQiOjU0NywiX2F1dGhfdXNlcl9pZCI6IjU0NyIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiI3NzU0MThhMzI0NDFmNjcyNGMwZDcxNWM0MTNkOTEwOTU3NDk0M2RiIiwidXNlcl9uYW1lIjoiaXNoYV9zaGFybWFAZXNmZXJhc29mdC5jb20ifQ==	2017-10-10 11:07:18.522076+02
n3vutmvteckscga4va7p6qm5oo1jwr89	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-10 11:31:43.761264+02
uzr203o0j7jwheul7vkt769cf6yxhd0n	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-11 13:07:44.686805+02
dgo6ti6p0but0fsgfvw0ymy9c212x1ii	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-13 08:39:20.412061+02
jk3ysfrp1p20og65y7xhfsjaufg9tkb6	NjA5YWJmMjUyYzZmZjFmOWM3YzBlODViYWMzZjM0ODg0MGM0MzExYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiY2IyYmY4NTJkZTI0MTVmYTQ2MjkzZDZlM2M1M2RhNTk3ZTdkMWYiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNTEyIn0=	2017-10-17 08:58:07.19623+02
1g88jcm59qhh3x2i80g7mbvsuxo03xx6	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-09 12:56:29.940476+02
u2t0r1nxzjg6mwyplqat957nlwh8zush	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-17 06:25:35.818876+02
jdybv1tavuc3axtlw50r6yvtx1qw6vby	ZDQ4ZjQyOTA5ZDE5ZmRkZjEwODg5ZWEyMjYzMDliOTVmZDM1YThkNzp7InVzZXJfaWQiOjU4NywiX2F1dGhfdXNlcl9pZCI6IjU4NyIsInJlc3RhdXJhbnRfaWQiOjc2LCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiIxZDlkZTAzMmY3MTQxYmU4NGE1YjJkMjNlZGQ0NDM1MDc2YTVmYTFjIiwidXNlcl9uYW1lIjoicml0aWtAZ21haWwuY29tIn0=	2017-10-17 14:32:42.26516+02
4i56fjf3sb34slu43zmyka2cymm68fqh	ZDQ4ZjQyOTA5ZDE5ZmRkZjEwODg5ZWEyMjYzMDliOTVmZDM1YThkNzp7InVzZXJfaWQiOjU4NywiX2F1dGhfdXNlcl9pZCI6IjU4NyIsInJlc3RhdXJhbnRfaWQiOjc2LCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiIxZDlkZTAzMmY3MTQxYmU4NGE1YjJkMjNlZGQ0NDM1MDc2YTVmYTFjIiwidXNlcl9uYW1lIjoicml0aWtAZ21haWwuY29tIn0=	2017-10-17 14:43:42.965358+02
y6pg7zkfcp8o8u0cye2sawrv0t7y06cw	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-23 10:20:38.665108+02
0wrurhsed1ctqq48rj72mmjot3x6idm1	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-24 05:31:48.882802+02
darg30r2ttcfj1dx0lvpg8b132vp26d7	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-24 22:50:18.182746+02
i47qekkxzpa6tp60svkp188x6atbo5f4	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-25 16:46:44.739519+02
yutt1pbbhtah74lgprdqysoen59xrtwn	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-27 09:00:10.642708+02
s2fhbbtgr4kofz3viczahbexweqd38gr	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-30 07:54:08.168384+01
9y89ogh8c647l64m63r1msuejbvglhe0	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-31 07:23:14.549277+01
o7ehpdja321b682oap47cjjtv1dhqe3s	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-11-06 07:19:24.371334+01
lm5ktff7bjzdb5uj7r0i2e7y3wwydi6i	NjA5YWJmMjUyYzZmZjFmOWM3YzBlODViYWMzZjM0ODg0MGM0MzExYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiY2IyYmY4NTJkZTI0MTVmYTQ2MjkzZDZlM2M1M2RhNTk3ZTdkMWYiLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNTEyIn0=	2017-10-07 08:44:27.587896+02
43qnd2m7c4hl4h8j2mjycg9v4tbiilc0	NzIzOWQyOTFjMTAxYjQ3M2FlYjE0Yjc5NWRlYjI3YzJhMjhlYzdkNjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI1MjAiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsImNhcnQiOiJhbnVAZ21haWwuY29tIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJ1c2VyX2lkIjo1MjAsIl9hdXRoX3VzZXJfaGFzaCI6IjNlMmUxOGVmNWU4OGQ4ZDgwZTJiZWYxOWMyYWQ1M2VjN2IyYzBkMDEiLCJ1c2VyX25hbWUiOiJhbnVAZ21haWwuY29tIn0=	2017-10-11 06:08:30.298308+02
gun40qiskevjotunw3h99wdr0jxaq6rg	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-05 05:45:25.414751+02
0ocsmus8dmuqtb15t7psm3x8knuhyqri	MTcwZDI0MzU3MDFlOWE3ZTAzMzNlZjM4MmJjYmNmNzAwZGE5OTgzZjp7InVzZXJfaWQiOjU2NiwiX2F1dGhfdXNlcl9pZCI6IjU2NiIsInJlc3RhdXJhbnRfaWQiOjcwLCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJfYXV0aF91c2VyX2hhc2giOiI3NThiYjA2ZTU3NTZlNDczMzgwM2UxYWJiYTJmNTA0ZDFjNmYzNWEzIiwidXNlcl9uYW1lIjoiZXNmZXJhQGdtYWlsLmNvbSJ9	2017-10-11 11:54:58.530696+02
37rixggmcmaymg0nqytu49mf1p8qc4sj	ZDQ4ZjQyOTA5ZDE5ZmRkZjEwODg5ZWEyMjYzMDliOTVmZDM1YThkNzp7InVzZXJfaWQiOjU4NywiX2F1dGhfdXNlcl9pZCI6IjU4NyIsInJlc3RhdXJhbnRfaWQiOjc2LCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiIxZDlkZTAzMmY3MTQxYmU4NGE1YjJkMjNlZGQ0NDM1MDc2YTVmYTFjIiwidXNlcl9uYW1lIjoicml0aWtAZ21haWwuY29tIn0=	2017-10-17 09:12:37.971607+02
xqwiula0c15n6janpa4ws22voghbezjv	NDVmNWY2OGYyMDA4ODcwYWM4YmEyYzYzOGYwODYxYWQ1YTU2MWM2Yzp7InVzZXJfaWQiOjUyMCwiX2F1dGhfdXNlcl9pZCI6IjUyMCIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiIzZTJlMThlZjVlODhkOGQ4MGUyYmVmMTljMmFkNTNlYzdiMmMwZDAxIiwidXNlcl9uYW1lIjoiYW51QGdtYWlsLmNvbSJ9	2017-10-10 06:03:33.316794+02
dj67ftdm5oojcuaj9s634ql08k1krh62	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-13 10:38:48.955536+02
efcsvxaoy944w7xkyh2pt4jqbldp79s2	NzIzOWQyOTFjMTAxYjQ3M2FlYjE0Yjc5NWRlYjI3YzJhMjhlYzdkNjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI1MjAiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsImNhcnQiOiJhbnVAZ21haWwuY29tIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJ1c2VyX2lkIjo1MjAsIl9hdXRoX3VzZXJfaGFzaCI6IjNlMmUxOGVmNWU4OGQ4ZDgwZTJiZWYxOWMyYWQ1M2VjN2IyYzBkMDEiLCJ1c2VyX25hbWUiOiJhbnVAZ21haWwuY29tIn0=	2017-10-09 12:53:35.779927+02
rsz87ft88crdfhnz5rnc7asoe3iogr75	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-09 13:02:57.082745+02
cv14nmbrnxufsokviuv14476vn7v35hp	ZDQ4ZjQyOTA5ZDE5ZmRkZjEwODg5ZWEyMjYzMDliOTVmZDM1YThkNzp7InVzZXJfaWQiOjU4NywiX2F1dGhfdXNlcl9pZCI6IjU4NyIsInJlc3RhdXJhbnRfaWQiOjc2LCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiIxZDlkZTAzMmY3MTQxYmU4NGE1YjJkMjNlZGQ0NDM1MDc2YTVmYTFjIiwidXNlcl9uYW1lIjoicml0aWtAZ21haWwuY29tIn0=	2017-10-17 13:50:32.620908+02
x8udzu6owkwoum2558una9g96ljhbbqr	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-17 06:33:17.407856+02
fkgxaknkhfjlfz0x9ip54bniulj33t9i	NmY2MzZlMzI0OWVmNTMzYmQ1MDNhYzQ1MTU1MDJlYjVjNjdiN2MxZDp7InVzZXJfaWQiOjU4NywiX2F1dGhfdXNlcl9pZCI6IjU4NyIsInJlc3RhdXJhbnRfaWQiOjc2LCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJfYXV0aF91c2VyX2hhc2giOiIxZDlkZTAzMmY3MTQxYmU4NGE1YjJkMjNlZGQ0NDM1MDc2YTVmYTFjIiwidXNlcl9uYW1lIjoicml0aWtAZ21haWwuY29tIn0=	2017-10-17 14:05:35.146901+02
mtph28oko59e5nbv4i66ps5n1nw348t8	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-17 07:19:45.319278+02
h67p69u0ysw5dibknmxi0eg7xzzi8nw8	ZGEyMDFjODVkNmZmZGJjNThmZjcxYTg0MjA0MWIyNTY5NjJkMDJhNjp7InVzZXJfaWQiOjU2NiwiX2F1dGhfdXNlcl9pZCI6IjU2NiIsInJlc3RhdXJhbnRfaWQiOjcwLCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiI3NThiYjA2ZTU3NTZlNDczMzgwM2UxYWJiYTJmNTA0ZDFjNmYzNWEzIiwidXNlcl9uYW1lIjoiZXNmZXJhQGdtYWlsLmNvbSJ9	2017-10-11 08:55:18.084079+02
n4566i5w426s6dh8icn0tf9wsjesic0s	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-17 07:33:56.16157+02
2go48bsrygvziahjyy7noro9wrpceykz	ZTQyMWI2ZjcyNWUwMWZlMGVjYTRiYjZjZmY1NDJjYzdhZDg4OGQ1ODp7InVzZXJfaWQiOjUyMCwiX2F1dGhfdXNlcl9pZCI6IjUyMCIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiY2FydCI6ImFudUBnbWFpbC5jb20iLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaGFzaCI6IjNlMmUxOGVmNWU4OGQ4ZDgwZTJiZWYxOWMyYWQ1M2VjN2IyYzBkMDEiLCJ1c2VyX25hbWUiOiJhbnVAZ21haWwuY29tIn0=	2017-10-09 14:00:15.25284+02
jfo9uzi38cv0br16jz7x8ld22bixywap	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-06 06:16:55.652005+02
cosvqzgm7k68apl1uqwv6i4xls23ak5w	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-23 10:20:38.737089+02
fen2hsi60h7t3j6epm27qru6wjqenqfz	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-24 08:32:52.01806+02
j84z3y8w40fg4h95stgie9s8wyklmr27	NzIzOWQyOTFjMTAxYjQ3M2FlYjE0Yjc5NWRlYjI3YzJhMjhlYzdkNjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI1MjAiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsImNhcnQiOiJhbnVAZ21haWwuY29tIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJ1c2VyX2lkIjo1MjAsIl9hdXRoX3VzZXJfaGFzaCI6IjNlMmUxOGVmNWU4OGQ4ZDgwZTJiZWYxOWMyYWQ1M2VjN2IyYzBkMDEiLCJ1c2VyX25hbWUiOiJhbnVAZ21haWwuY29tIn0=	2017-10-11 09:22:28.447599+02
w94grtc1470xzzit37xcwvn8z5d7eqq4	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-25 05:27:12.761263+02
4ysed8fm9x7knwdthcxga1qw3t8g48ph	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-25 18:09:28.4898+02
dgwuw3o6khgo5u3m75w3na5u9e0wn7nm	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-27 09:00:10.784936+02
vigifr76myz0frlvv6vhc6ysotwujjqq	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-30 07:54:08.290282+01
f9th8tzm8eq7wbj19er9pd2l97jej5om	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-11-01 08:55:38.046128+01
lefv4r0a95rsr3dvjiam75z7s0fzt6tl	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-11-09 09:48:17.073766+01
l2t1tkwyyweb0ci1vhnqjnw8qid7w6g3	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-07 08:53:30.779615+02
9em6d6mphljrxaqxfxxatjy0fw8lukrb	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-10 05:34:42.194272+02
784611p3p82e636t088o6uqh08t40kgz	ZTRhNTc2Y2I1OTRkMDBmZjQ5YzgzMGFlM2I3MWEwZDRiNWYwZDg4NTp7InVzZXJfaWQiOjUzNywiX2F1dGhfdXNlcl9pZCI6IjUzNyIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiY2FydCI6ImlzaGFfc2hhcm1hQGVzZmVyYXNvZnQuY29tIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiJiZDA1NDMwMzRkNDA5NmNhZmVlYmY1OGYwODg5ZTg4YWE2NzNkZTY2IiwidXNlcl9uYW1lIjoiaXNoYV9zaGFybWFAZXNmZXJhc29mdC5jb20ifQ==	2017-10-05 05:30:01.893318+02
du4f3ispgjjd9fjx7l6w8x2p55foah5g	ZGEyMDFjODVkNmZmZGJjNThmZjcxYTg0MjA0MWIyNTY5NjJkMDJhNjp7InVzZXJfaWQiOjU2NiwiX2F1dGhfdXNlcl9pZCI6IjU2NiIsInJlc3RhdXJhbnRfaWQiOjcwLCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiI3NThiYjA2ZTU3NTZlNDczMzgwM2UxYWJiYTJmNTA0ZDFjNmYzNWEzIiwidXNlcl9uYW1lIjoiZXNmZXJhQGdtYWlsLmNvbSJ9	2017-10-11 12:34:33.003534+02
kze9xnc1gfvotmpwqtrtgnc3w9c8twor	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-09 13:03:03.532844+02
j6zxgmif7npl5b8owg0hv47wz2fk7gu8	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-12 10:58:08.354117+02
j54qv6n7suzvfq33u0ku9jncb7yw3ynh	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-17 05:50:18.785547+02
lo41baggs8yya959jsut9n6cwyod06ky	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-11 09:21:51.604067+02
431svnxhp5uwgy4u0q5l9g25ixmfpg4u	NDVmNWY2OGYyMDA4ODcwYWM4YmEyYzYzOGYwODYxYWQ1YTU2MWM2Yzp7InVzZXJfaWQiOjUyMCwiX2F1dGhfdXNlcl9pZCI6IjUyMCIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiIzZTJlMThlZjVlODhkOGQ4MGUyYmVmMTljMmFkNTNlYzdiMmMwZDAxIiwidXNlcl9uYW1lIjoiYW51QGdtYWlsLmNvbSJ9	2017-10-11 10:31:00.449491+02
2odn5bhpmkwd8283cqzlt2zwosj67jx7	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-06 06:45:38.674788+02
xruyya0xhzvstxp1rmuaki1q3honv9mu	MTcwZDI0MzU3MDFlOWE3ZTAzMzNlZjM4MmJjYmNmNzAwZGE5OTgzZjp7InVzZXJfaWQiOjU2NiwiX2F1dGhfdXNlcl9pZCI6IjU2NiIsInJlc3RhdXJhbnRfaWQiOjcwLCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJfYXV0aF91c2VyX2hhc2giOiI3NThiYjA2ZTU3NTZlNDczMzgwM2UxYWJiYTJmNTA0ZDFjNmYzNWEzIiwidXNlcl9uYW1lIjoiZXNmZXJhQGdtYWlsLmNvbSJ9	2017-10-11 10:38:58.849619+02
17rdbwe13bf7nqsv4grjocwwtqpd7ja7	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-24 10:37:56.596562+02
g8j200xijsafqgjd2hyfeh1jqnx8sprl	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-25 12:50:59.307858+02
5c5d6qovnssla1f2uxfvlmgadxl1p5sc	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-26 05:41:59.510138+02
u0h7d56m9xsv41u04z9rzeha9wh4ejdi	NjgxMzMwYjE3YTEyODEzNjIzMmEwMjk5MWJiYWMxYTAzOTk0ZDdiYjp7InVzZXJfaWQiOjU0NywiX2F1dGhfdXNlcl9pZCI6IjU0NyIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiI0YTg0OGE4MzA0NzZiMzI1MjVjZjVhOGYwMzdiOWRhMzRjMzhjZjJhIiwidXNlcl9uYW1lIjoiaXNoYV9zaGFybWFAZXNmZXJhc29mdC5jb20ifQ==	2017-10-10 08:22:25.29319+02
pq3i2yaqnt8krbfsob7qrixs69kjotfs	ZGEyMDFjODVkNmZmZGJjNThmZjcxYTg0MjA0MWIyNTY5NjJkMDJhNjp7InVzZXJfaWQiOjU2NiwiX2F1dGhfdXNlcl9pZCI6IjU2NiIsInJlc3RhdXJhbnRfaWQiOjcwLCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiI3NThiYjA2ZTU3NTZlNDczMzgwM2UxYWJiYTJmNTA0ZDFjNmYzNWEzIiwidXNlcl9uYW1lIjoiZXNmZXJhQGdtYWlsLmNvbSJ9	2017-10-11 11:08:33.662823+02
k6j316pi0945lwt7fbt6es9fcwwicl2e	MzQxZTA5NWNmOWZmYWI4ODhlNDRjZmEzNWE3NjEzZWE0YjQ5MDBmMjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX19	2017-10-10 09:18:04.130361+02
btn0mk2pj80xlupio3lhhbqqv5dx4bzv	ZTQyMWI2ZjcyNWUwMWZlMGVjYTRiYjZjZmY1NDJjYzdhZDg4OGQ1ODp7InVzZXJfaWQiOjUyMCwiX2F1dGhfdXNlcl9pZCI6IjUyMCIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiY2FydCI6ImFudUBnbWFpbC5jb20iLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJlbiIsImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaGFzaCI6IjNlMmUxOGVmNWU4OGQ4ZDgwZTJiZWYxOWMyYWQ1M2VjN2IyYzBkMDEiLCJ1c2VyX25hbWUiOiJhbnVAZ21haWwuY29tIn0=	2017-10-11 11:36:09.509536+02
c9md1d1014122git4d1k02dj0sgjv8z2	ZWY4ZmJhMDFjMTAyMTE4MDM2NmNhZTU3ZmMxZWIwODM2YzY5MWRlZDp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI1MjAiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9sYW5ndWFnZSI6ImVuIiwidXNlcl9pZCI6NTIwLCJfYXV0aF91c2VyX2hhc2giOiIzZTJlMThlZjVlODhkOGQ4MGUyYmVmMTljMmFkNTNlYzdiMmMwZDAxIiwidXNlcl9uYW1lIjoiYW51QGdtYWlsLmNvbSJ9	2017-10-10 11:34:26.360916+02
h1xz8ubfhehlmlywcmqfh292ncrcs2id	MjAzZjcwZmRhMWI5ODFhYjJmNTNhYzE4ZDdiNjk4NTQwMjYzNTI4MDp7Il9sYW5ndWFnZSI6ImVuIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fX0=	2017-10-04 13:02:58.1746+02
r4z3lhep9n27pteupvsjym0itxer1d2z	NWQ1ZmU2YmI4NzM2YjE2NjlkMzVhZTFkZDUwMWMyYjJjYzQxMWZiZTp7InVzZXJfaWQiOjUyNSwiX2F1dGhfdXNlcl9pZCI6IjUyNSIsInJlc3RhdXJhbnRfaWQiOjU0LCJ1c2VyX3R5cGUiOiJSZXN0YXVyYW50IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiIzNmJmOTc5Y2MwZDRjZTg2NTIxYjQ0ODQzYTVjNzFkMWZiZDE0MGFlIiwidXNlcl9uYW1lIjoicmlkaW1hQGdtYWlsLmNvbSJ9	2017-10-04 13:10:22.633287+02
rqszndlop1ma9jbfd8ozhiwx0x8ugpy1	NDVmNWY2OGYyMDA4ODcwYWM4YmEyYzYzOGYwODYxYWQ1YTU2MWM2Yzp7InVzZXJfaWQiOjUyMCwiX2F1dGhfdXNlcl9pZCI6IjUyMCIsInVzZXJfdHlwZSI6IkN1c3RvbWVyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJlYXN5Y2FydCI6eyJpdGVtcyI6e319LCJfYXV0aF91c2VyX2hhc2giOiIzZTJlMThlZjVlODhkOGQ4MGUyYmVmMTljMmFkNTNlYzdiMmMwZDAxIiwidXNlcl9uYW1lIjoiYW51QGdtYWlsLmNvbSJ9	2017-10-04 13:17:31.803166+02
d58pr8zaium3tnxel986hxv8ioejxmea	NzIzOWQyOTFjMTAxYjQ3M2FlYjE0Yjc5NWRlYjI3YzJhMjhlYzdkNjp7ImVhc3ljYXJ0Ijp7Iml0ZW1zIjp7fX0sIl9hdXRoX3VzZXJfaWQiOiI1MjAiLCJ1c2VyX3R5cGUiOiJDdXN0b21lciIsImNhcnQiOiJhbnVAZ21haWwuY29tIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJ1c2VyX2lkIjo1MjAsIl9hdXRoX3VzZXJfaGFzaCI6IjNlMmUxOGVmNWU4OGQ4ZDgwZTJiZWYxOWMyYWQ1M2VjN2IyYzBkMDEiLCJ1c2VyX25hbWUiOiJhbnVAZ21haWwuY29tIn0=	2017-10-04 13:56:58.527234+02
ljepn6nv33yl5efcp2j094qkn0bqxu0v	OGU1MDk5YjEwMGRhMjE1MDU2OWUzY2RjMzAzMjVmZWQxNWQ2NmNiMDp7Il9sYW5ndWFnZSI6ImVuIiwiZWFzeWNhcnQiOnsiaXRlbXMiOnt9fSwic29jaWFsYWNjb3VudF9zdGF0ZSI6W3sicHJvY2VzcyI6ImxvZ2luIiwic2NvcGUiOiIiLCJhdXRoX3BhcmFtcyI6IiJ9LCI1VFZiMDhkWXJoeHMiXX0=	2017-10-04 14:12:52.39968+02
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY django_site (id, domain, name) FROM stdin;
1	http://138.68.136.81:9002/	La Fiambrera
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('django_site_id_seq', 2, true);


--
-- Data for Name: easy_thumbnails_source; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY easy_thumbnails_source (id, storage_hash, name, modified) FROM stdin;
3	f9bde26a1556cd667f742bd34ec7c55e	web_img_4.jpg	2017-03-16 10:44:31.018444+01
13	f9bde26a1556cd667f742bd34ec7c55e	Bananas (1).png	2017-03-20 22:29:37.765204+01
220	f9bde26a1556cd667f742bd34ec7c55e	red-planet-snow-fantasy-stars-night-stones-4k-moon-mountains-HD.jpg	2017-07-13 07:44:48.85466+02
226	f9bde26a1556cd667f742bd34ec7c55e	Screenshot from 2017-07-26 12:45:17.png	2017-07-27 14:53:47.556925+02
424	f9bde26a1556cd667f742bd34ec7c55e	18815394_1797332850293429_1039476084907137473_o.jpg	2017-10-09 16:32:03.806735+02
427	f9bde26a1556cd667f742bd34ec7c55e	startup-594091_1280.jpg	2017-10-26 12:21:05.739362+02
299	f9bde26a1556cd667f742bd34ec7c55e	ON_NOW.png	2017-09-18 06:50:45.832045+02
288	f9bde26a1556cd667f742bd34ec7c55e	Restaurant_1.jpg	2017-09-18 06:50:50.787112+02
289	f9bde26a1556cd667f742bd34ec7c55e	Restaurant_3.jpg	2017-09-18 06:50:50.890717+02
290	f9bde26a1556cd667f742bd34ec7c55e	Photo_4_resized.png	2017-09-18 06:50:51.229027+02
291	f9bde26a1556cd667f742bd34ec7c55e	Restaurant_2.jpg	2017-09-18 06:50:51.405165+02
292	f9bde26a1556cd667f742bd34ec7c55e	Restaurant_1_EoGWrn3.jpg	2017-09-18 06:50:51.650761+02
429	f9bde26a1556cd667f742bd34ec7c55e	18222388_10155047093262911_2757984268670020079_n.jpg	2017-10-27 12:19:15.389004+02
293	f9bde26a1556cd667f742bd34ec7c55e	3006_fb.jpg	2017-09-18 11:22:51.648225+02
430	f9bde26a1556cd667f742bd34ec7c55e	1941498_833245553386735_2182990711469944183_o.jpg	2017-10-27 12:19:15.547229+02
431	f9bde26a1556cd667f742bd34ec7c55e	12466059_540951606064731_692768623589436791_o.jpg	2017-10-27 12:19:15.625322+02
432	f9bde26a1556cd667f742bd34ec7c55e	12698452_947655861957045_3581490821245775076_o.jpg	2017-10-27 12:19:15.810037+02
433	f9bde26a1556cd667f742bd34ec7c55e	The_Butcher.jpg	2017-10-27 12:19:15.859633+02
304	f9bde26a1556cd667f742bd34ec7c55e	Photo_2.jpg	2017-09-18 13:05:27.742901+02
305	f9bde26a1556cd667f742bd34ec7c55e	Photo_1_cropped.png	2017-09-18 13:05:27.96141+02
418	f9bde26a1556cd667f742bd34ec7c55e	g_VGijZjh.JPG	2017-10-03 06:56:18.95918+02
417	f9bde26a1556cd667f742bd34ec7c55e	f_f36FP5b.jpg	2017-10-03 06:56:19.128525+02
416	f9bde26a1556cd667f742bd34ec7c55e	f_QINuejg.jpg	2017-10-03 06:56:19.333226+02
415	f9bde26a1556cd667f742bd34ec7c55e	g.JPG	2017-10-03 06:56:19.464162+02
414	f9bde26a1556cd667f742bd34ec7c55e	f.jpg	2017-10-03 06:56:19.59422+02
403	f9bde26a1556cd667f742bd34ec7c55e	a.jpg	2017-10-03 07:04:02.366569+02
405	f9bde26a1556cd667f742bd34ec7c55e	e.jpg	2017-10-03 07:04:02.468595+02
406	f9bde26a1556cd667f742bd34ec7c55e	b.jpg	2017-10-03 07:04:02.608738+02
407	f9bde26a1556cd667f742bd34ec7c55e	c.jpg	2017-10-03 07:04:02.713274+02
322	f9bde26a1556cd667f742bd34ec7c55e	Restaurant_2_ilaajvQ.jpg	2017-09-21 15:26:19.124413+02
323	f9bde26a1556cd667f742bd34ec7c55e	Restaurant_3_h64vlYs.jpg	2017-09-21 15:26:19.258818+02
324	f9bde26a1556cd667f742bd34ec7c55e	Restaurant_4.jpg	2017-09-21 15:26:19.344673+02
325	f9bde26a1556cd667f742bd34ec7c55e	Logo_for_website.png	2017-09-25 08:36:36.907512+02
321	f9bde26a1556cd667f742bd34ec7c55e	Restaurant_1_w6CC86m.jpg	2017-09-21 15:26:18.949204+02
426	f9bde26a1556cd667f742bd34ec7c55e	wallet-2383496_1280.jpg	2017-10-26 12:08:24.115692+02
428	f9bde26a1556cd667f742bd34ec7c55e	wedding-2589803_1280.jpg	2017-10-26 12:27:13.78833+02
435	f9bde26a1556cd667f742bd34ec7c55e	Moho_On_Ice_2.0.jpg	2017-10-27 12:18:54.68006+02
423	f9bde26a1556cd667f742bd34ec7c55e	k_ZkwptyM.jpg	2017-10-03 07:02:12.688363+02
408	f9bde26a1556cd667f742bd34ec7c55e	d_SZHk9ES.jpg	2017-10-03 07:04:02.813235+02
434	f9bde26a1556cd667f742bd34ec7c55e	Moho_All_Bottles_Final.jpg	2017-10-27 15:55:41.144468+02
422	f9bde26a1556cd667f742bd34ec7c55e	l_HXIFbEm.jpg	2017-10-03 08:45:30.471012+02
421	f9bde26a1556cd667f742bd34ec7c55e	l.jpg	2017-10-03 08:45:30.750613+02
420	f9bde26a1556cd667f742bd34ec7c55e	k.jpg	2017-10-03 08:45:30.992316+02
419	f9bde26a1556cd667f742bd34ec7c55e	j.jpg	2017-10-03 08:45:31.113337+02
436	f9bde26a1556cd667f742bd34ec7c55e	Moho_On_Ice.jpg	2017-10-27 15:55:41.408329+02
\.


--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('easy_thumbnails_source_id_seq', 436, true);


--
-- Data for Name: easy_thumbnails_thumbnail; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY easy_thumbnails_thumbnail (id, storage_hash, name, modified, source_id) FROM stdin;
5	d26becbf46ac48eda79c7a39a13a02dd	BDdgl-qWFT2a.jpg	2017-03-16 10:44:31.021562+01	3
6	d26becbf46ac48eda79c7a39a13a02dd	mYplh7rU0sef.jpg	2017-03-16 10:44:31.124281+01	3
489	d26becbf46ac48eda79c7a39a13a02dd	aYpq0xARfmtV.jpg	2017-09-15 13:31:54.999313+02	288
490	d26becbf46ac48eda79c7a39a13a02dd	2Fog5gkM6fL4.jpg	2017-09-15 13:31:55.062296+02	289
491	d26becbf46ac48eda79c7a39a13a02dd	NPYVHy05HqC9.png	2017-09-15 13:31:55.262721+02	290
12	d26becbf46ac48eda79c7a39a13a02dd	EZALyK8IOYDf.png	2017-03-20 22:29:37.767791+01	13
492	d26becbf46ac48eda79c7a39a13a02dd	cYgBSXEhL-FN.jpg	2017-09-15 13:31:55.352248+02	291
18	d26becbf46ac48eda79c7a39a13a02dd	tlmaJzW7vlU-.png	2017-03-20 22:29:42.310743+01	13
493	d26becbf46ac48eda79c7a39a13a02dd	66Az3hhw1be9.jpg	2017-09-15 13:31:55.456905+02	292
494	d26becbf46ac48eda79c7a39a13a02dd	HHAIBWHEpIfi.jpg	2017-09-15 13:33:35.546963+02	293
495	d26becbf46ac48eda79c7a39a13a02dd	hxVCD10bL7uJ.jpg	2017-09-15 13:33:58.627473+02	293
826	d26becbf46ac48eda79c7a39a13a02dd	zqNDtqVpS4s1.jpg	2017-10-09 16:27:05.219214+02	424
832	d26becbf46ac48eda79c7a39a13a02dd	7BIWSfzoigEn.jpg	2017-10-26 12:27:13.792895+02	428
841	d26becbf46ac48eda79c7a39a13a02dd	OyZUfrJwoSwp.jpg	2017-10-27 12:17:55.979116+02	436
852	d26becbf46ac48eda79c7a39a13a02dd	R7FrvyE8uXBN.jpg	2017-10-27 15:55:41.148965+02	434
853	d26becbf46ac48eda79c7a39a13a02dd	Z5LRh5YKcWWb.jpg	2017-10-27 15:55:41.411135+02	436
511	d26becbf46ac48eda79c7a39a13a02dd	m2MpXU3TqLP_.png	2017-09-15 17:26:43.885113+02	299
512	d26becbf46ac48eda79c7a39a13a02dd	UWHyMrCye-BZ.png	2017-09-15 17:27:01.397564+02	299
513	d26becbf46ac48eda79c7a39a13a02dd	OASblWULN7Bq.png	2017-09-15 17:27:20.964303+02	299
514	d26becbf46ac48eda79c7a39a13a02dd	BOfQm6lPOlJJ.png	2017-09-18 06:47:44.263277+02	299
346	d26becbf46ac48eda79c7a39a13a02dd	9b_BNDCkhpfM.png	2017-07-27 14:53:47.565783+02	226
515	d26becbf46ac48eda79c7a39a13a02dd	usGQ2VgFDB3t.jpg	2017-09-18 06:50:45.547106+02	293
516	d26becbf46ac48eda79c7a39a13a02dd	JuvIgLTd_st-.png	2017-09-18 06:50:45.836569+02	299
517	d26becbf46ac48eda79c7a39a13a02dd	L8y2cKhAe6wb.jpg	2017-09-18 06:50:50.790219+02	288
518	d26becbf46ac48eda79c7a39a13a02dd	QeoIVjn9I2Vy.jpg	2017-09-18 06:50:50.893323+02	289
519	d26becbf46ac48eda79c7a39a13a02dd	GsFYu3i208A-.png	2017-09-18 06:50:51.231833+02	290
520	d26becbf46ac48eda79c7a39a13a02dd	_DQeaBHKKnwi.jpg	2017-09-18 06:50:51.421008+02	291
521	d26becbf46ac48eda79c7a39a13a02dd	boN0g5S8XX-Z.jpg	2017-09-18 06:50:51.656698+02	292
522	d26becbf46ac48eda79c7a39a13a02dd	XrWc2ljfCIxG.jpg	2017-09-18 08:43:35.33099+02	293
785	d26becbf46ac48eda79c7a39a13a02dd	R3rOLmG5TA5C.jpg	2017-10-03 06:56:03.234797+02	414
524	d26becbf46ac48eda79c7a39a13a02dd	mB2WgL5l-u7O.jpg	2017-09-18 11:22:51.651687+02	293
786	d26becbf46ac48eda79c7a39a13a02dd	-w8mzG7leqNV.JPG	2017-10-03 06:56:03.290439+02	418
797	d26becbf46ac48eda79c7a39a13a02dd	wO2YLdynNuFJ.jpg	2017-10-03 07:00:07.228332+02	423
798	d26becbf46ac48eda79c7a39a13a02dd	-ocgtaMUVt3O.jpg	2017-10-03 07:00:07.320098+02	422
799	d26becbf46ac48eda79c7a39a13a02dd	Y1JU3_scwhZU.jpg	2017-10-03 07:00:07.408675+02	421
800	d26becbf46ac48eda79c7a39a13a02dd	z6S456os7YsA.jpg	2017-10-03 07:00:07.457788+02	420
801	d26becbf46ac48eda79c7a39a13a02dd	qaU2IYRvFk5k.jpg	2017-10-03 07:00:07.518057+02	419
531	d26becbf46ac48eda79c7a39a13a02dd	D98L9vW1Zpeq.jpg	2017-09-18 12:17:45.218959+02	304
532	d26becbf46ac48eda79c7a39a13a02dd	Zo4F-R0Ud4jH.png	2017-09-18 12:17:45.293429+02	305
533	d26becbf46ac48eda79c7a39a13a02dd	KqlHiZJn3C1r.jpg	2017-09-18 13:05:27.746705+02	304
534	d26becbf46ac48eda79c7a39a13a02dd	mfl65C43-cZ6.png	2017-09-18 13:05:27.964017+02	305
805	d26becbf46ac48eda79c7a39a13a02dd	MJDk3J0Fsgue.jpg	2017-10-03 07:02:12.691737+02	423
812	d26becbf46ac48eda79c7a39a13a02dd	B6BpWUMC9WpC.jpg	2017-10-03 08:45:30.4816+02	422
813	d26becbf46ac48eda79c7a39a13a02dd	WSqyN_loP_YK.jpg	2017-10-03 08:45:30.617673+02	422
814	d26becbf46ac48eda79c7a39a13a02dd	mlPtaZm6AlfC.jpg	2017-10-03 08:45:30.754113+02	421
815	d26becbf46ac48eda79c7a39a13a02dd	gqMj644go8ht.jpg	2017-10-03 08:45:30.935932+02	421
816	d26becbf46ac48eda79c7a39a13a02dd	PK0tYAc5fFjm.jpg	2017-10-03 08:45:30.995863+02	420
817	d26becbf46ac48eda79c7a39a13a02dd	I39ypyKk22Nu.jpg	2017-10-03 08:45:31.042287+02	420
818	d26becbf46ac48eda79c7a39a13a02dd	4yzq-EJqtShE.jpg	2017-10-03 08:45:31.117053+02	419
819	d26becbf46ac48eda79c7a39a13a02dd	FgrCGJTVKJJK.jpg	2017-10-03 08:45:31.176119+02	419
567	d26becbf46ac48eda79c7a39a13a02dd	QriP2ZA6gHBP.jpg	2017-09-20 11:14:01.690007+02	321
568	d26becbf46ac48eda79c7a39a13a02dd	HX1CffQ541gt.jpg	2017-09-20 11:14:01.743927+02	322
569	d26becbf46ac48eda79c7a39a13a02dd	zhR72rFiiRTY.jpg	2017-09-20 11:14:01.799172+02	323
570	d26becbf46ac48eda79c7a39a13a02dd	sDBgFnovfBAP.jpg	2017-09-20 11:14:01.845875+02	324
571	d26becbf46ac48eda79c7a39a13a02dd	ILc0UzY1YTk5.png	2017-09-20 11:16:07.220106+02	325
572	d26becbf46ac48eda79c7a39a13a02dd	iYDqb2Rpqph4.png	2017-09-20 11:16:37.886799+02	325
573	d26becbf46ac48eda79c7a39a13a02dd	D2zwOXnZcWJR.png	2017-09-20 11:49:16.734817+02	325
574	d26becbf46ac48eda79c7a39a13a02dd	1avPhDtqwfYB.png	2017-09-20 11:51:21.82322+02	325
827	d26becbf46ac48eda79c7a39a13a02dd	ABHTq9iHojOp.jpg	2017-10-09 16:29:17.622309+02	424
830	d26becbf46ac48eda79c7a39a13a02dd	Jm0xfrnkSqrS.jpg	2017-10-26 12:08:24.121746+02	426
833	d26becbf46ac48eda79c7a39a13a02dd	zCLOp_j2ETkO.jpg	2017-10-27 12:13:39.328141+02	429
834	d26becbf46ac48eda79c7a39a13a02dd	mEW5Dnu7i6Tz.jpg	2017-10-27 12:13:39.445495+02	430
835	d26becbf46ac48eda79c7a39a13a02dd	omgaiWUke5eA.jpg	2017-10-27 12:13:39.492719+02	431
756	d26becbf46ac48eda79c7a39a13a02dd	BoqkKY5EXQpO.jpg	2017-10-03 06:47:34.57367+02	403
836	d26becbf46ac48eda79c7a39a13a02dd	pVO8oGuNtOK3.jpg	2017-10-27 12:13:39.616147+02	432
758	d26becbf46ac48eda79c7a39a13a02dd	Xn0wHIJG7b-q.jpg	2017-10-03 06:47:34.809097+02	405
759	d26becbf46ac48eda79c7a39a13a02dd	Opd-hrTN3dtQ.jpg	2017-10-03 06:47:34.897822+02	406
760	d26becbf46ac48eda79c7a39a13a02dd	gtLvO70ECwAt.jpg	2017-10-03 06:47:34.995138+02	407
837	d26becbf46ac48eda79c7a39a13a02dd	7Niz64Vh0VYh.jpg	2017-10-27 12:13:39.657512+02	433
842	d26becbf46ac48eda79c7a39a13a02dd	Mzg7QJc-48sS.jpg	2017-10-27 12:18:54.387973+02	436
843	d26becbf46ac48eda79c7a39a13a02dd	evlwdIuhREnG.jpg	2017-10-27 12:18:54.683146+02	435
844	d26becbf46ac48eda79c7a39a13a02dd	XnSdq4HhxCaH.jpg	2017-10-27 12:18:54.918577+02	435
845	d26becbf46ac48eda79c7a39a13a02dd	UhwwL24k_yIp.jpg	2017-10-27 12:18:55.246475+02	434
846	d26becbf46ac48eda79c7a39a13a02dd	SswXORK3T3yC.jpg	2017-10-27 12:18:55.506967+02	434
787	d26becbf46ac48eda79c7a39a13a02dd	F73hJABoRAJh.JPG	2017-10-03 06:56:08.018846+02	418
802	d26becbf46ac48eda79c7a39a13a02dd	QwBe1VGo1Ws_.jpg	2017-10-03 07:00:14.250531+02	419
803	d26becbf46ac48eda79c7a39a13a02dd	73joNUSm2Z7d.jpg	2017-10-03 07:00:14.28127+02	423
806	d26becbf46ac48eda79c7a39a13a02dd	VO8O61_RYrwO.jpg	2017-10-03 07:04:02.373988+02	403
807	d26becbf46ac48eda79c7a39a13a02dd	wNZeBFKIIkK5.jpg	2017-10-03 07:04:02.471254+02	405
808	d26becbf46ac48eda79c7a39a13a02dd	nY_hIO0VEYlA.jpg	2017-10-03 07:04:02.614203+02	406
809	d26becbf46ac48eda79c7a39a13a02dd	Tv351k5csFUD.jpg	2017-10-03 07:04:02.715835+02	407
810	d26becbf46ac48eda79c7a39a13a02dd	iMHL1Kk41W76.jpg	2017-10-03 07:04:02.815808+02	408
828	d26becbf46ac48eda79c7a39a13a02dd	GOyyhfb37cTv.jpg	2017-10-09 16:32:03.812005+02	424
831	d26becbf46ac48eda79c7a39a13a02dd	unMQTODfhYBY.jpg	2017-10-26 12:21:05.744804+02	427
838	d26becbf46ac48eda79c7a39a13a02dd	5O3nm7lbG9F0.jpg	2017-10-27 12:17:01.32229+02	436
839	d26becbf46ac48eda79c7a39a13a02dd	VKDpJlExONfh.jpg	2017-10-27 12:17:01.58687+02	435
761	d26becbf46ac48eda79c7a39a13a02dd	YQphHWbSuodz.jpg	2017-10-03 06:49:05.406722+02	408
840	d26becbf46ac48eda79c7a39a13a02dd	6CbVjNS4us5s.jpg	2017-10-27 12:17:01.874498+02	434
847	d26becbf46ac48eda79c7a39a13a02dd	oQHEhjM82mqG.jpg	2017-10-27 12:19:15.393427+02	429
780	d26becbf46ac48eda79c7a39a13a02dd	luWYQyP1_8P3.JPG	2017-10-03 06:55:29.298727+02	418
781	d26becbf46ac48eda79c7a39a13a02dd	lLDMgLf4cgCv.jpg	2017-10-03 06:55:29.384811+02	417
782	d26becbf46ac48eda79c7a39a13a02dd	e0NOJDbSMpa2.jpg	2017-10-03 06:55:29.430833+02	416
783	d26becbf46ac48eda79c7a39a13a02dd	ZeZ7x1Rmcl-S.JPG	2017-10-03 06:55:29.470654+02	415
784	d26becbf46ac48eda79c7a39a13a02dd	RBs7RIhdVgwt.jpg	2017-10-03 06:55:29.505583+02	414
788	d26becbf46ac48eda79c7a39a13a02dd	glO3Kjk1kbZU.JPG	2017-10-03 06:56:18.968683+02	418
789	d26becbf46ac48eda79c7a39a13a02dd	dSgV3kJFyBt4.jpg	2017-10-03 06:56:19.134791+02	417
790	d26becbf46ac48eda79c7a39a13a02dd	lKduui4R6O1H.jpg	2017-10-03 06:56:19.20845+02	417
791	d26becbf46ac48eda79c7a39a13a02dd	mfewv_01dMnm.jpg	2017-10-03 06:56:19.335858+02	416
792	d26becbf46ac48eda79c7a39a13a02dd	tv_QCGp3hIg3.jpg	2017-10-03 06:56:19.37959+02	416
793	d26becbf46ac48eda79c7a39a13a02dd	7c26sC8RiH42.JPG	2017-10-03 06:56:19.46687+02	415
794	d26becbf46ac48eda79c7a39a13a02dd	leQHYlmn-VWX.JPG	2017-10-03 06:56:19.507283+02	415
795	d26becbf46ac48eda79c7a39a13a02dd	tWgUjm7BizeD.jpg	2017-10-03 06:56:19.598756+02	414
796	d26becbf46ac48eda79c7a39a13a02dd	oicVsJLpdViQ.jpg	2017-10-03 06:56:19.663639+02	414
804	d26becbf46ac48eda79c7a39a13a02dd	Is5IoopqoYc0.jpg	2017-10-03 07:00:17.328813+02	423
848	d26becbf46ac48eda79c7a39a13a02dd	bZHQ3fhBtiPs.jpg	2017-10-27 12:19:15.550152+02	430
849	d26becbf46ac48eda79c7a39a13a02dd	_jS0uIFGahqD.jpg	2017-10-27 12:19:15.628319+02	431
850	d26becbf46ac48eda79c7a39a13a02dd	SK36f2ODj9jE.jpg	2017-10-27 12:19:15.813396+02	432
851	d26becbf46ac48eda79c7a39a13a02dd	ACLoTUxOF_oc.jpg	2017-10-27 12:19:15.863385+02	433
687	d26becbf46ac48eda79c7a39a13a02dd	hNl3f8DcLU-q.jpg	2017-09-21 15:26:18.954762+02	321
688	d26becbf46ac48eda79c7a39a13a02dd	JBuFDWEo30iv.jpg	2017-09-21 15:26:19.126931+02	322
689	d26becbf46ac48eda79c7a39a13a02dd	Uk5RElWdVYSb.jpg	2017-09-21 15:26:19.261471+02	323
690	d26becbf46ac48eda79c7a39a13a02dd	X1htdTxLLXCe.jpg	2017-09-21 15:26:19.34715+02	324
697	d26becbf46ac48eda79c7a39a13a02dd	5atY2wiWWbhi.png	2017-09-25 08:36:36.914297+02	325
\.


--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnail_id_seq', 853, true);


--
-- Data for Name: easy_thumbnails_thumbnaildimensions; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY easy_thumbnails_thumbnaildimensions (id, thumbnail_id, width, height) FROM stdin;
\.


--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnaildimensions_id_seq', 1, false);


--
-- Data for Name: login_register_forgetpassword; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY login_register_forgetpassword (id, activation_key, start_datetime, end_datetime, user_id) FROM stdin;
170	d152601ef98b132b1d187748cf186a99426f6fbf	2017-10-03 07:54:43.806207+02	2017-10-03 10:04:43.806207+02	589
171	c9c8856098abfd2c3c83685698e087d3a4df2719	2017-10-27 16:35:26.450284+02	2017-10-27 18:45:26.450284+02	515
145	d0b90fde8eb70ab47949d1b973af8d6cf4905a0b	2017-09-07 12:13:11.76663+02	2017-09-07 14:23:11.76663+02	412
161	8593b1331a1ea8c8a64ca1f4fe31df718db2075f	2017-09-18 11:20:00.993635+02	2017-09-18 13:30:00.993635+02	514
165	f0bbb6a491d284a2f52953617c8367a01fd86397	2017-09-21 12:36:18.286322+02	2017-09-21 14:46:18.286322+02	514
\.


--
-- Name: login_register_forgetpassword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('login_register_forgetpassword_id_seq', 171, true);


--
-- Data for Name: mainapp_category; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY mainapp_category (id, title, description, image, description_en, description_es, title_en, title_es, slug) FROM stdin;
4	Lactose-free	The food in lactose-free lunchboxes does not contain lactose, but may contain the milk proteins casein and whey.	mainapp/uploads/meet_your_need_img_2.jpg	The food in lactose-free lunchboxes does not contain lactose, but may contain the milk proteins casein and whey.	Los alimentos en nuestras fiambreras sin lactosa no contienen lactosa, pero pueden contener las proteínas de la leche caseína y suero.	Lactose-free	Sin lactosa	lactose-free
5	Low calorie	Low calorie lunchboxes all provide a complete, nutritional meal with a maximum of 500 calories.	mainapp/uploads/eat-208672_1280.jpg	Low calorie lunchboxes all provide a complete, nutritional meal with a maximum of 500 calories.	Las loncheras bajas en calorías ofrecen una comida completa y nutricional con un máximo de 500 calorías.	Low calorie	Baja en calorías	low-calorie
3	Cross-fit	Lunchboxes that provide all of the slow-burning energy and protein needed for Cross-fit sessions.	mainapp/uploads/barbell-375482_1280.jpg	Lunchboxes that provide all of the slow-burning energy and protein needed for Cross-fit sessions.	Fiambreras que proporcionan toda la energía de combustión lenta y la proteína necesaria para las sesiones de ajuste cruzado.	Cross-fit	Cross-fit	cross-fit
2	Yoga	Lunchboxes that contain food high in protein, but provide a lighter meal, with lots of fruit and/or vegetables.	mainapp/uploads/yoga-774243_1280.jpg	Lunchboxes that contain food high in protein, but provide a lighter meal, with lots of fruit and/or vegetables.	Fiambreras mas ligera, que contienen comida alta en proteínas y un montón de frutas y/o verduras.	Yoga	Yoga	yoga
1	Gluten-free	Gluten-free lunchboxes do not contain any gluten.	mainapp/uploads/sushi-373588_1280.jpg	Gluten-free lunchboxes do not contain any gluten.	Las fiambreras sin gluten no continien gluten.	Gluten-free	Sin gluten	gluten-free
10	Dairy-free	The foods in dairy-free lunchboxes do not include any dairy products	mainapp/uploads/pizza-1072468_1280.jpg	The foods in dairy-free lunchboxes do not include any dairy products	Los alimentos en las fiambreras sin lácteos no incluyen ningún producto lácteo	Dairy-free	Dairy-free	dairy-free
\.


--
-- Name: mainapp_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('mainapp_category_id_seq', 10, true);


--
-- Data for Name: mainapp_checkoutcomment; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY mainapp_checkoutcomment (id, comment, user_id) FROM stdin;
\.


--
-- Name: mainapp_checkoutcomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('mainapp_checkoutcomment_id_seq', 1, true);


--
-- Data for Name: mainapp_homecontent; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY mainapp_homecontent (id, title, description, description_en, description_es, title_en, title_es, msg, msg_en, msg_es) FROM stdin;
1	Eat Local, Eat Fresh	Nutritionally balanced lunchboxes created by Barcelona's top restaurants.	Nutritionally balanced lunchboxes created by Barcelona's top restaurants.	Almuerzos nutricionalmente equilibrados creados por los mejores restaurantes de Barcelona.	Eat Local, Eat Fresh	Comer local, comer fresco	Lunchboxes must be ordered by 1:00 PM for same-day delivery.	Lunchboxes must be ordered by 1:00 PM for same-day delivery.	Las cajas de almuerzo deben ser ordenadas a las 1:00 PM para el mismo día de entrega.
\.


--
-- Name: mainapp_homecontent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('mainapp_homecontent_id_seq', 2, true);


--
-- Data for Name: mainapp_inviterequest; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY mainapp_inviterequest (id, email, user_id, status, key) FROM stdin;
\.


--
-- Name: mainapp_inviterequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('mainapp_inviterequest_id_seq', 81, true);


--
-- Data for Name: mainapp_inviterewards; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY mainapp_inviterewards (id, u_reward, n_reward) FROM stdin;
1	50	30
\.


--
-- Name: mainapp_inviterewards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('mainapp_inviterewards_id_seq', 2, true);


--
-- Data for Name: mainapp_selectionreference; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY mainapp_selectionreference (id, shareselection_id, lunchbox_id) FROM stdin;
75	63	54
16	13	51
17	14	50
86	72	99
87	73	99
88	74	98
89	75	98
90	76	98
91	76	99
65	54	50
66	54	51
\.


--
-- Name: mainapp_selectionreference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('mainapp_selectionreference_id_seq', 91, true);


--
-- Data for Name: mainapp_shareselection; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY mainapp_shareselection (id, receiver_id, date, status, user_id, credits) FROM stdin;
14	392	2017-09-07	f	412	0
13	392	2017-09-07	t	412	0
63	557	2017-09-22	t	412	20
73	589	2017-10-03	t	585	50
72	589	2017-10-03	t	589	10
74	589	2017-10-03	t	585	12
75	585	2017-10-03	t	589	22
76	557	2017-10-09	t	412	0
54	392	2017-09-12	t	412	0
\.


--
-- Name: mainapp_shareselection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('mainapp_shareselection_id_seq', 76, true);


--
-- Data for Name: mainapp_usernotification; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY mainapp_usernotification (id, unread, msg, date, user_id, head, head_en, head_es, msg_en, msg_es, cat, share_id) FROM stdin;
251	t	You have successfully added 400.00 La-Fiambrera credits in your account.	2017-10-03 06:10:29.162429+02	585	Wallet	Wallet	Billetera	You have successfully added 400.00 La-Fiambrera credits in your account.	Has agregado 400.00 créditos de La-Fiambrera correctamente en tu cuenta.	0	0
253	t	You have successfully added 500.00 La-Fiambrera credits in your account.	2017-10-03 07:07:42.314481+02	585	Wallet	Wallet	Billetera	You have successfully added 500.00 La-Fiambrera credits in your account.	Has agregado 500.00 créditos de La-Fiambrera correctamente en tu cuenta.	0	0
255	f	poonam_kumari@esferasoft.com accepted your invitation. You got 50.0 La-Fiambrera credit in your wallet.	2017-10-03 07:14:45.093358+02	585	Wallet	Wallet	Billetera	poonam_kumari@esferasoft.com accepted your invitation. You got 50.0 La-Fiambrera credit in your wallet.	poonam_kumari@esferasoft.com aceptó su invitación. Tienes 50.0 créditos de La-Fiambrera en tu cartera.	0	0
256	f	Congratualtions! You have won 50.0 La-Fiambrera credit by using refferal code from Bandna Thakur. Invite your friends to win more credits.	2017-10-03 07:14:45.095283+02	589	Wallet	Wallet	Billetera	Congratualtions! You have won 50.0 La-Fiambrera credit by using refferal code from Bandna Thakur. Invite your friends to win more credits.	Felicitaciones! Has ganado 50.0 crédito de La-Fiambrera usando el código de referencia de Bandna Thakur. Invita a tus amigos a ganar más créditos.	0	0
258	t	Your friend Bandna Thakur shared their lunchbox selection with you.	2017-10-03 07:18:22.745387+02	589	Share Lunchbox	Share Lunchbox	Compartir La Fiambrera	Your friend Bandna Thakur shared their lunchbox selection with you.	Su amigo Bandna Thakur compartió su selección de comida con usted.ff.	1	73
260	t	Your friend Poonam Thakur shared their lunchbox selection with you.	2017-10-03 07:23:06.060644+02	585	Share Lunchbox	Share Lunchbox	Compartir La Fiambrera	Your friend Poonam Thakur shared their lunchbox selection with you.	Su amigo Poonam Thakur compartió su selección de comida con usted.ff.	1	75
263	f	Amit Rana sent you 22 La-Fiambrera credits.	2017-10-03 07:52:39.101899+02	591	Wallet	Wallet	Billetera	Amit Rana sent you 22 La-Fiambrera credits.	Amit Rana Te envía 22 créditos de La-Fiambrera.	0	0
265	f	You have successfully added 500.00 La-Fiambrera credits in your account.	2017-10-03 08:04:24.209308+02	589	Wallet	Wallet	Billetera	You have successfully added 500.00 La-Fiambrera credits in your account.	Has agregado 500.00 créditos de La-Fiambrera correctamente en tu cuenta.	0	0
267	f	Thank you! Your order is placed succesfully.	2017-10-03 08:19:26.408786+02	589	Order	Order	Orden	Thank you! Your order is placed succesfully.	Gracias! Su pedido se ha realizado correctamente.	0	0
269	t	You have successfully added 250.00 La-Fiambrera credits in your account.	2017-10-09 17:15:31.936094+02	412	Wallet	Wallet	Billetera	You have successfully added 250.00 La-Fiambrera credits in your account.	Has agregado 250.00 créditos de La-Fiambrera correctamente en tu cuenta.	0	0
271	t	Your friend Hannah Collins shared their lunchbox selection with you.	2017-10-09 17:17:18.263075+02	557	Share Lunchbox	Share Lunchbox	Compartir La Fiambrera	Your friend Hannah Collins shared their lunchbox selection with you.	Su amigo Hannah Collins compartió su selección de comida con usted.ff.	1	76
273	f	Thank you! Your order is placed succesfully.	2017-10-27 12:30:41.699137+02	557	Order	Order	Orden	Thank you! Your order is placed succesfully.	Gracias! Su pedido se ha realizado correctamente.	0	0
252	t	You have successfully added 400.00 La-Fiambrera credits in your account.	2017-10-03 06:17:01.077063+02	585	Wallet	Wallet	Billetera	You have successfully added 400.00 La-Fiambrera credits in your account.	Has agregado 400.00 créditos de La-Fiambrera correctamente en tu cuenta.	0	0
254	f	Thank you! Your order is placed succesfully.	2017-10-03 07:12:09.482553+02	585	Order	Order	Orden	Thank you! Your order is placed succesfully.	Gracias! Su pedido se ha realizado correctamente.	0	0
210	t	You have successfully added 50.00 La-Fiambrera credits in your account.	2017-09-22 09:14:10.334042+02	412	Wallet	Wallet	Billetera	You have successfully added 50.00 La-Fiambrera credits in your account.	Has agregado 50.00 créditos de La-Fiambrera correctamente en tu cuenta.	0	0
212	t	You have successfully added 20.00 La-Fiambrera credits in your account.	2017-09-22 09:16:40.671257+02	412	Wallet	Wallet	Billetera	You have successfully added 20.00 La-Fiambrera credits in your account.	Has agregado 20.00 créditos de La-Fiambrera correctamente en tu cuenta.	0	0
213	t	Your friend Hannah Collins shared their lunchbox selection with you.	2017-09-22 09:17:14.272602+02	557	Share Lunchbox	Share Lunchbox	Compartir La Fiambrera	Your friend Hannah Collins shared their lunchbox selection with you.	Su amigo Hannah Collins compartió su selección de comida con usted.ff.	1	63
211	t	Hannah Collins send you 50 La-Fiambrera credits.	2017-09-22 09:14:49.237222+02	557	Wallet	Wallet	Billetera	Hannah Collins send you 50 La-Fiambrera credits.	Hannah Collins Te envía 50 créditos de La-Fiambrera.	0	0
257	t	Your friend Poonam Thakur shared their lunchbox selection with you.	2017-10-03 07:16:36.757458+02	589	Share Lunchbox	Share Lunchbox	Compartir La Fiambrera	Your friend Poonam Thakur shared their lunchbox selection with you.	Su amigo Poonam Thakur compartió su selección de comida con usted.ff.	1	72
259	t	Your friend Bandna Thakur shared their lunchbox selection with you.	2017-10-03 07:22:22.690518+02	589	Share Lunchbox	Share Lunchbox	Compartir La Fiambrera	Your friend Bandna Thakur shared their lunchbox selection with you.	Su amigo Bandna Thakur compartió su selección de comida con usted.ff.	1	74
261	f	amandeep_kaur@esferasoft.com accepted your invitation. You got 50.0 La-Fiambrera credit in your wallet.	2017-10-03 07:26:29.743511+02	585	Wallet	Wallet	Billetera	amandeep_kaur@esferasoft.com accepted your invitation. You got 50.0 La-Fiambrera credit in your wallet.	amandeep_kaur@esferasoft.com aceptó su invitación. Tienes 50.0 créditos de La-Fiambrera en tu cartera.	0	0
262	f	Congratualtions! You have won 50.0 La-Fiambrera credit by using refferal code from Bandna Thakur. Invite your friends to win more credits.	2017-10-03 07:26:29.745783+02	591	Wallet	Wallet	Billetera	Congratualtions! You have won 50.0 La-Fiambrera credit by using refferal code from Bandna Thakur. Invite your friends to win more credits.	Felicitaciones! Has ganado 50.0 crédito de La-Fiambrera usando el código de referencia de Bandna Thakur. Invita a tus amigos a ganar más créditos.	0	0
264	f	You have successfully added 200.00 La-Fiambrera credits in your account.	2017-10-03 07:59:55.574686+02	589	Wallet	Wallet	Billetera	You have successfully added 200.00 La-Fiambrera credits in your account.	Has agregado 200.00 créditos de La-Fiambrera correctamente en tu cuenta.	0	0
266	f	You have successfully added 400.00 La-Fiambrera credits in your account.	2017-10-03 08:14:02.058362+02	589	Wallet	Wallet	Billetera	You have successfully added 400.00 La-Fiambrera credits in your account.	Has agregado 400.00 créditos de La-Fiambrera correctamente en tu cuenta.	0	0
268	f	You have successfully added 30.00 La-Fiambrera credits in your account.	2017-10-03 08:44:49.502582+02	585	Wallet	Wallet	Billetera	You have successfully added 30.00 La-Fiambrera credits in your account.	Has agregado 30.00 créditos de La-Fiambrera correctamente en tu cuenta.	0	0
270	t	Hannah Collins sent you 200 La-Fiambrera credits.	2017-10-09 17:16:27.181843+02	557	Wallet	Wallet	Billetera	Hannah Collins sent you 200 La-Fiambrera credits.	Hannah Collins Te envía 200 créditos de La-Fiambrera.	0	0
272	t	Thank you! Your order is placed succesfully.	2017-10-09 17:40:17.232411+02	557	Order	Order	Orden	Thank you! Your order is placed succesfully.	Gracias! Su pedido se ha realizado correctamente.	0	0
\.


--
-- Name: mainapp_usernotification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('mainapp_usernotification_id_seq', 273, true);


--
-- Data for Name: orders_basket; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY orders_basket (id, is_catering, qty, lunchbox_id, user_id) FROM stdin;
\.


--
-- Name: orders_basket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('orders_basket_id_seq', 257, true);


--
-- Data for Name: orders_comment; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY orders_comment (id, comment, order_id) FROM stdin;
143	Hello everyone welcome enjoy the holidays	555
144		557
145	Please make extra spicy	559
91		490
146		560
147		561
148		562
\.


--
-- Name: orders_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('orders_comment_id_seq', 148, true);


--
-- Data for Name: orders_order; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY orders_order (id, uuid, u_is_processing, u_processing_date_from, u_processing_date_till, u_is_payment_requested, u_payment_requested_date, u_is_confirmed_by_lf, u_is_confirmed_by_lf_date, u_is_paid, is_highlighted, is_archived, is_catering, date, user_id, vat) FROM stdin;
555	682c08ba-dcbc-450b-ab28-0720604d2ec1	f	2017-10-03	2017-10-05	f	\N	f	\N	t	f	f	f	2017-10-03 07:11:48.026559+02	585	10
556	4e084403-955e-4f07-9989-98eaa96e82b5	f	2017-10-03	2017-10-10	f	\N	f	\N	f	f	f	f	2017-10-03 08:03:30.835774+02	589	50
557	56a7af7e-b7cd-44dc-92d3-753a1d4ea86d	f	2017-10-03	2017-10-10	f	\N	f	\N	t	f	f	f	2017-10-03 08:18:37.79482+02	589	100
558	2cbbb6ea-4dc1-4635-94e3-3661cd4ccdc4	f	2017-10-09	2017-10-10	f	\N	f	\N	t	f	f	f	2017-10-09 17:39:30.150346+02	557	110
559	7cefa86f-01a8-42d1-8ca2-c1cb25189de3	f	2017-10-09	2017-10-10	f	\N	f	\N	t	f	f	f	2017-10-09 17:53:00.792074+02	557	10
560	ecde1c82-e515-477c-ace2-6f9a9f822296	f	2017-10-26	2017-11-02	f	\N	f	\N	f	f	f	f	2017-10-26 14:58:06.616145+02	557	10
561	d604780a-bb90-4c64-a410-46470533d055	f	2017-10-27	2017-11-02	f	\N	f	\N	t	f	f	f	2017-10-27 12:27:25.961223+02	557	12
562	8603ee3f-53a7-4762-b043-78747dd71fb1	f	2017-10-27	2017-11-02	f	\N	f	\N	f	f	f	f	2017-10-27 13:30:54.91927+02	599	1.19999999999999996
490	2812c1ef-04ec-4e45-8ae0-6bb47dfe62cd	f	2017-09-21	2017-09-28	f	\N	f	\N	f	f	f	f	2017-09-21 15:07:00.721058+02	557	1
496	4d5a5cc3-6f0d-468e-85cd-11832bd2c01e	f	2017-09-22	2017-09-29	f	\N	f	\N	t	f	f	f	2017-09-22 09:28:59.724708+02	557	0
\.


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('orders_order_id_seq', 562, true);


--
-- Data for Name: orders_orderdatemail; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY orders_orderdatemail (id, start_date, end_date, mail_date) FROM stdin;
5	2017-09-13	2017-09-20	2017-09-20
\.


--
-- Name: orders_orderdatemail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('orders_orderdatemail_id_seq', 5, true);


--
-- Data for Name: orders_orderitem; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY orders_orderitem (id, qty, delivery_date, is_processed, processed_date, is_payment_requested, payment_request_date, is_confirmed_by_lf, confirmation_by_lf_date, is_payment_transferred, payment_transfer_date, lunchbox_id, order_id) FROM stdin;
667	1	2017-10-03 14:00:00+02	f	\N	f	\N	f	\N	f	\N	98	555
668	5	2017-10-03 15:00:00+02	f	\N	f	\N	f	\N	f	\N	98	556
669	10	2017-10-03 14:00:00+02	f	\N	f	\N	f	\N	f	\N	98	557
670	10	2017-10-10 15:00:00+02	f	\N	f	\N	f	\N	f	\N	98	558
671	1	2017-10-10 15:00:00+02	f	\N	f	\N	f	\N	f	\N	99	558
672	1	2017-10-10 15:00:00+02	f	\N	f	\N	f	\N	f	\N	98	559
673	1	2017-10-27 17:00:00+02	f	\N	f	\N	f	\N	f	\N	98	560
674	10	2017-10-31 15:00:00+01	f	\N	f	\N	f	\N	f	\N	100	561
675	1	2017-10-31 13:00:00+01	f	\N	f	\N	f	\N	f	\N	100	562
\.


--
-- Name: orders_orderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('orders_orderitem_id_seq', 675, true);


--
-- Data for Name: pages_contactus; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY pages_contactus (id, name, email, phone, msg) FROM stdin;
70	name	name@gmail.com	09876544321	HY BA
71	Ram	ram@gmail.com	12345667889	Zgxf Duffy hcjcj
72	ram	ram@gmail.com	3456789054	trytyt ytytu uyrure iui
73	ram	ram@gmail.com	2345678967	yay ytuy uyu uyu uyu
74	rishu	rishu@gmail.com	4343454554656	hgh hh jhgjf gjjkj jhjfhj
75	sinu	sinu@gmail.com	097564321	ui uuy uiu uui
76	Hannah	admin@mohointernational.com	666913718	Hi, testing email
77	ram	ram@gmail.com	0987563423	gv hg hghg ghj hghg hghh
78	hddffddfgfdhshhssssssssssssssssssssssssssssssssfhgfhhfdhgfhfhhfhfhfhhhhhhhhhhhhhhhhhhhhhfhhfhfhfhhhhhhhhhhhhhhhhhhhhhhhhhhhfhfhhfhfhfhfhfhfhfhfhfhhfhfhf	645645645tgh@gmail.com	4444444444	rtyrtytryrtyrtyrtyrtytrrt
79	ram	ram@gmail.com	95869587989	rewtryteryt
80	riya	riya@gmail.com	7568697800	ghyugujhjh gjhg yhgyu jhjh jhjh hjhjh
81	raghavthakur	raghav@gmail.com	65463543576	dfgh fghjfgh jh hjkj jhkj
82	raghav thakur	raghav@gmail.com	098765346	trt ry yt yhuht uy iuyniuy iuy iiu 
83	anu tester	anuradha@gmail.com	65657667678	gfh jhjrt jjhn kjhk kj kj kjh 
84	jnggggfjgjgjggjghjghgghghjggfj	gfgdf@gmail.com	343454534	6464
85	vxgd	gsgsg@gmail.com	5656566766	ggxgdg
86	raman tester	raman@gmail.com	645765775	ghfgj jhjkghhjkgfh kjhkg hjkgfhkgkjkjg
87	Test tester	test@gmail.com	0987654332	Fgg Hhj Hhj hu high hhh hhh
88	anuradha thakur	anuradha@gmail.com	0987654323	gfgh hgjf gjhfj jgh ghj gjfh gjh
89	bandna thakur	bandna23@gmail.com	6856868666	ghjfh gh gjhf gkjhfd fgjhf gfhgg
\.


--
-- Name: pages_contactus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('pages_contactus_id_seq', 89, true);


--
-- Data for Name: pages_faqs; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY pages_faqs (id, title, description, description_en, description_es, title_en, title_es) FROM stdin;
9	Is there a minimum order?	No, there is not a minimum order. However, the cost of each lunchbox will be reduced the more you order!	No, there is not a minimum order. However, the cost of each lunchbox will be reduced the more you order!	No, no hay un orden mínimo. ¡ sin embargo, el costo de cada Fiambrera se reducirá más usted pide!	Is there a minimum order?	Hay un pedido mínimo?
6	When can I order food?	You can place an order online whenever you like, just select the date and timeslot you would like the lunchboxes to be delivered. However, in order to receive the delivery on the same day, orders must be made before 1pm.	You can place an order online whenever you like, just select the date and timeslot you would like the lunchboxes to be delivered. However, in order to receive the delivery on the same day, orders must be made before 1pm.	Usted puede poner un orden en línea siempre que usted tiene gusto, apenas selecciona la fecha y horario que usted quisiera que las fiambreras fueran entregadas. Sin embargo, para recibir la entrega el mismo día, las órdenes deben hacerse antes de la 1 pm.	When can I order food?	Cuando puedo pedir las fiambreras?
5	How can I apply a promotional code?	To benefit from the special offer associated with a promotional code, type the code into the "Promo Code" box at checkout and click "Apply".	To benefit from the special offer associated with a promotional code, type the code into the "Promo Code" box at checkout and click "Apply".	Para beneficiarse de la oferta especial asociada con un código promocional, escriba el código en la casilla "Promo Code" (código promocional) al hacer la comprobación y haga clic en "Apply" (aplicar).	How can I apply a promotional code?	Cómo puedo aplicar un código de descuento?
4	How can I pay for my order?	There are four ways you can pay for your order.\r\n1. Visa Debit/Credit\r\n2. PayPal - If you do not have a PayPal account, you can pay via PayPal using your credit or debit card\r\n3. Restaurant Ticket card\r\n4. La Fiambrera credits - You can purchase as many La Fiambrera credits as you like for future orders. You can be transfer credits to another user's account or receive credits from theirs. If you do not have enough credits to pay for the entire order, you will be prompted to cover the remaining cost using one of the other payment methods.	There are four ways you can pay for your order.\r\n1. Visa Debit/Credit\r\n2. PayPal - If you do not have a PayPal account, you can pay via PayPal using your credit or debit card\r\n3. Restaurant Ticket card\r\n4. La Fiambrera credits - You can purchase as many La Fiambrera credits as you like for future orders. You can be transfer credits to another user's account or receive credits from theirs. If you do not have enough credits to pay for the entire order, you will be prompted to cover the remaining cost using one of the other payment methods.	Hay cuatro maneras que usted puede pagar por su orden:\r\n1. Visa débito/credito\r\n2. PayPal - si usted no tiene una cuenta PayPal, usted puede pagar vía PayPal usando su tarjeta de crédito o débito \r\n3. Tarjeta de Restaurant Ticket \r\n4. Creditos de La Fiambrera - usted puede comprar tantos créditos de La Fiambrera como usted tiene gusto para las órdenes futuras. Puede transferir créditos a la cuenta de otro usuario o recibir créditos de la suya. Si usted no tiene suficientes créditos para pagar todo el pedido, se le pedirá que cubra el costo restante usando uno de los otros métodos de pago.	How can I pay for my order?	Cómo puedo pagar por mi pedido?
\.


--
-- Name: pages_faqs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('pages_faqs_id_seq', 10, true);


--
-- Data for Name: pages_groupbenifits; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY pages_groupbenifits (id, title, head, image, description, description_en, description_es, head_en, head_es, title_en, title_es) FROM stdin;
1	Discounts	Discounts	wallet-2383496_1280.jpg	Receive discounts for larger orders!	Receive discounts for larger orders!	Recibe descuentos para pedidos más grandes!	Discounts	Descuentos	Discounts	Descuentos
2	Credits	La Fiambrera Credits	startup-594091_1280.jpg	Purchase La Fiambrera credits that can be transferred to a friend’s account for group orders and discounts!	Purchase La Fiambrera credits that can be transferred to a friend’s account for group orders and discounts!	Compra créditos de La Fiambrera que pueden ser transferidos a la cuenta de un amigo para pedidos de grupo y descuentos!	La Fiambrera Credits	La Fiambrera Credits	Credits	Créditos
3	Invitations	Invite a Friend	wedding-2589803_1280.jpg	Send your friend an invite to join La Fiambrera!\r\nWhen they order their first lunchbox, you’ll both receive La Fiambrera credits	Send your friend an invite to join La Fiambrera!\r\nWhen they order their first lunchbox, you’ll both receive La Fiambrera credits	Envía a tu amigo una invitación para unirse a La Fiambrera!\r\nCuando pidan su primera lonchera, ambos recibirán créditos de La Fiambrera	Invite a Friend	Invitar a un amigo	Invitations	Invitacióne
\.


--
-- Name: pages_groupbenifits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('pages_groupbenifits_id_seq', 4, true);


--
-- Data for Name: pages_lunchsteps; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY pages_lunchsteps (id, content, title, content_en, content_es, title_en, title_es) FROM stdin;
4	<section class="step_to_healthy_lunch_section pull-left full-width">\r\n<div class="container">\r\n<div class="inner_title pull-left full-width">\r\n<h1 class="pull-left full-width text-center">Steps to a healthy lunch</h1>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_content pull-left full-width text-center">\r\n<p>La Fiambrera have worked with Barcelona&#39;s top restaurants to create nutritionally balanced lunchboxes, cooked to order and delivered to you<br />\r\nSpecialised&nbsp;in catering for specific dietary requirements</p>\r\n\r\n<p>Larger orders receive significant discounts<br />\r\nOrder with your colleagues or friends,for a working lunch or corporate event, for a party or picnic.</p>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_section_box_left_image pull-left full-width">\r\n<div class="step_to_healthy_lunch_section_left pull-left full-width">\r\n<div class="stay_healthy_img_section left">\r\n<div class="stay_healthy_img_section_outer">\r\n<div class="stay_healthy_img_section_inner"><img alt="" src="/static/mainapp/img/stay_healthy_img1.png" /></div>\r\n</div>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_section_discription pull-right">\r\n<h2 class="discover_plan">Discover and plan</h2>\r\n\r\n<ul class="step_to_healthy_lunch_listing">\r\n\t<li>See our range of lunchboxes,check their nutritional values and read about their restaurant of origin</li>\r\n\t<li>Busy time ahead? Order your lunch in advance and prepare for an event by arranging catering weeks ahead of the big day</li>\r\n\t<li>We believe in the enjoyment of eating together! Group orders can save you money</li>\r\n\t<li>Choose&nbsp;lunchboxes from the same restaurant to be delivered to the same location in order to receive discounts! Share&nbsp;La Fiambrera credits and lunchbox selection with another registered user so that they can order for everyone&nbsp;</li>\r\n</ul>\r\n\r\n<div class="round_circle_left text-center">1</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_section_box_left_image pull-left full-width">\r\n<div class="step_to_healthy_lunch_section_left pull-left full-width">\r\n<div class="stay_healthy_img_section right">\r\n<div class="stay_healthy_img_section_outer">\r\n<div class="stay_healthy_img_section_inner"><img alt="" src="/static/mainapp/img/stay_healthy_img2.png" /></div>\r\n</div>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_section_discription_right text-right pull-left">\r\n<h2 class="discover_plan">Dietary Requirements</h2>\r\n\r\n<ul class="step_to_healthy_lunch_listing_right">\r\n\t<li>Intolerant to gluten or lactose? Vegetarian or vegan?</li>\r\n\t<li>Need a high protein meal after Yoga?&nbsp;Want slow-burning carbohydrates before your Cross-Fit session?</li>\r\n\t<li>Each lunchbox is categorised according to its nutritional content and the dietary requirements or physical activity that it&#39;s suitable for</li>\r\n\t<li>Look out for the category icons assigned to each lunchbox, or browse all of the lunchboxes within a specific category&nbsp;</li>\r\n</ul>\r\n\r\n<div class="round_circle_right text-center">2</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_section_box_left_image pull-left full-width">\r\n<div class="step_to_healthy_lunch_section_left pull-left full-width">\r\n<div class="stay_healthy_img_section left">\r\n<div class="stay_healthy_img_section_outer">\r\n<div class="stay_healthy_img_section_inner"><img alt="" src="/static/mainapp/img/stay_healthy_img3.png" /></div>\r\n</div>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_section_discription pull-right">\r\n<h2 class="place_order">Place your order</h2>\r\n\r\n<ul class="step_to_healthy_lunch_listing">\r\n\t<li>Order before 1pm for lunch that day! After 1pm, expect to receive your lunchbox the next day or&nbsp;choose a later date</li>\r\n\t<li>Select your delivery time slot (13:00-14:00, 14:00-15:00, 15:00-16:00)</li>\r\n\t<li>Specific requests and location details can be left in the Comments box</li>\r\n\t<li>Want a picnic in the park or at the beach? Change your delivery location to a nearby landmark and specify the exact delivery location in the Comments box</li>\r\n\t<li>Ticket Restaurant Card, Paypal and Visa Debit are all available as payment methods</li>\r\n</ul>\r\n\r\n<div class="round_circle_left text-center">3</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_section_box_left_image pull-left full-width">\r\n<div class="step_to_healthy_lunch_section_left pull-left full-width">\r\n<div class="stay_healthy_img_section right">\r\n<div class="stay_healthy_img_section_outer">\r\n<div class="stay_healthy_img_section_inner"><img alt="" src="/static/mainapp/img/stay_healthy_img4.png" /></div>\r\n</div>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_section_discription_right text-right pull-left extra_padding">\r\n<h2 class="enjoy_lunchbox_icon">Enjoy your lunchbox</h2>\r\n\r\n<ul class="step_to_healthy_lunch_listing_right">\r\n\t<li>Your lunch will arrive during the chosen one hour timeslot in&nbsp;a recyclable box with cutlery provided</li>\r\n\t<li>Take time to eat with colleagues in the office or enjoy with friends in the sunshine</li>\r\n\t<li>Leave a review of the lunchbox on our website!</li>\r\n</ul>\r\n\r\n<div class="round_circle_right text-center">4</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</section>	Steps to a healthy lunch	<section class="step_to_healthy_lunch_section pull-left full-width">\r\n<div class="container">\r\n<div class="inner_title pull-left full-width">\r\n<h1 class="pull-left full-width text-center">Steps to a healthy lunch</h1>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_content pull-left full-width text-center">\r\n<p>La Fiambrera have worked with Barcelona&#39;s top restaurants to create nutritionally balanced lunchboxes, cooked to order and delivered to you<br />\r\nSpecialised&nbsp;in catering for specific dietary requirements</p>\r\n\r\n<p>Larger orders receive significant discounts<br />\r\nOrder with your colleagues or friends,for a working lunch or corporate event, for a party or picnic.</p>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_section_box_left_image pull-left full-width">\r\n<div class="step_to_healthy_lunch_section_left pull-left full-width">\r\n<div class="stay_healthy_img_section left">\r\n<div class="stay_healthy_img_section_outer">\r\n<div class="stay_healthy_img_section_inner"><img alt="" src="/static/mainapp/img/stay_healthy_img1.png" /></div>\r\n</div>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_section_discription pull-right">\r\n<h2 class="discover_plan">Discover and plan</h2>\r\n\r\n<ul class="step_to_healthy_lunch_listing">\r\n\t<li>See our range of lunchboxes,check their nutritional values and read about their restaurant of origin</li>\r\n\t<li>Busy time ahead? Order your lunch in advance and prepare for an event by arranging catering weeks ahead of the big day</li>\r\n\t<li>We believe in the enjoyment of eating together! Group orders can save you money</li>\r\n\t<li>Choose&nbsp;lunchboxes from the same restaurant to be delivered to the same location in order to receive discounts! Share&nbsp;La Fiambrera credits and lunchbox selection with another registered user so that they can order for everyone&nbsp;</li>\r\n</ul>\r\n\r\n<div class="round_circle_left text-center">1</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_section_box_left_image pull-left full-width">\r\n<div class="step_to_healthy_lunch_section_left pull-left full-width">\r\n<div class="stay_healthy_img_section right">\r\n<div class="stay_healthy_img_section_outer">\r\n<div class="stay_healthy_img_section_inner"><img alt="" src="/static/mainapp/img/stay_healthy_img2.png" /></div>\r\n</div>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_section_discription_right text-right pull-left">\r\n<h2 class="discover_plan">Dietary Requirements</h2>\r\n\r\n<ul class="step_to_healthy_lunch_listing_right">\r\n\t<li>Intolerant to gluten or lactose? Vegetarian or vegan?</li>\r\n\t<li>Need a high protein meal after Yoga?&nbsp;Want slow-burning carbohydrates before your Cross-Fit session?</li>\r\n\t<li>Each lunchbox is categorised according to its nutritional content and the dietary requirements or physical activity that it&#39;s suitable for</li>\r\n\t<li>Look out for the category icons assigned to each lunchbox, or browse all of the lunchboxes within a specific category&nbsp;</li>\r\n</ul>\r\n\r\n<div class="round_circle_right text-center">2</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_section_box_left_image pull-left full-width">\r\n<div class="step_to_healthy_lunch_section_left pull-left full-width">\r\n<div class="stay_healthy_img_section left">\r\n<div class="stay_healthy_img_section_outer">\r\n<div class="stay_healthy_img_section_inner"><img alt="" src="/static/mainapp/img/stay_healthy_img3.png" /></div>\r\n</div>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_section_discription pull-right">\r\n<h2 class="place_order">Place your order</h2>\r\n\r\n<ul class="step_to_healthy_lunch_listing">\r\n\t<li>Order before 1pm for lunch that day! After 1pm, expect to receive your lunchbox the next day or&nbsp;choose a later date</li>\r\n\t<li>Select your delivery time slot (13:00-14:00, 14:00-15:00, 15:00-16:00)</li>\r\n\t<li>Specific requests and location details can be left in the Comments box</li>\r\n\t<li>Want a picnic in the park or at the beach? Change your delivery location to a nearby landmark and specify the exact delivery location in the Comments box</li>\r\n\t<li>Ticket Restaurant Card, Paypal and Visa Debit are all available as payment methods</li>\r\n</ul>\r\n\r\n<div class="round_circle_left text-center">3</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_section_box_left_image pull-left full-width">\r\n<div class="step_to_healthy_lunch_section_left pull-left full-width">\r\n<div class="stay_healthy_img_section right">\r\n<div class="stay_healthy_img_section_outer">\r\n<div class="stay_healthy_img_section_inner"><img alt="" src="/static/mainapp/img/stay_healthy_img4.png" /></div>\r\n</div>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_section_discription_right text-right pull-left extra_padding">\r\n<h2 class="enjoy_lunchbox_icon">Enjoy your lunchbox</h2>\r\n\r\n<ul class="step_to_healthy_lunch_listing_right">\r\n\t<li>Your lunch will arrive during the chosen one hour timeslot in&nbsp;a recyclable box with cutlery provided</li>\r\n\t<li>Take time to eat with colleagues in the office or enjoy with friends in the sunshine</li>\r\n\t<li>Leave a review of the lunchbox on our website!</li>\r\n</ul>\r\n\r\n<div class="round_circle_right text-center">4</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</section>	<section class="step_to_healthy_lunch_section pull-left full-width">\r\n<div class="container">\r\n<div class="inner_title pull-left full-width">\r\n<h1 class="pull-left full-width text-center">Steps to a healthy lunch</h1>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_content pull-left full-width text-center">\r\n<p>La Fiambrera have worked with Barcelona&#39;s top restaurants to create nutritionally balanced lunchboxes, cooked to order and delivered to you<br />\r\nSpecialising in catering for groups, larger orders receive significant discounts<br />\r\nOrder with your colleagues or friends,for a working lunch or corporate event, for a party or picnic.</p>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_section_box_left_image pull-left full-width">\r\n<div class="step_to_healthy_lunch_section_left pull-left full-width">\r\n<div class="stay_healthy_img_section left">\r\n<div class="stay_healthy_img_section_outer">\r\n<div class="stay_healthy_img_section_inner"><img alt="" src="/static/mainapp/img/stay_healthy_img1.png" /></div>\r\n</div>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_section_discription pull-right">\r\n<h2 class="discover_plan">Discover and plan</h2>\r\n\r\n<ul class="step_to_healthy_lunch_listing">\r\n\t<li>See our range of lunchboxes,check their nutritional values and read about their restaurant of origin</li>\r\n\t<li>Busy time ahead? Plan your lunch in advance</li>\r\n\t<li>Prepare for an event by arranging catering weeks ahead of the big day</li>\r\n</ul>\r\n\r\n<div class="round_circle_left text-center">1</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_section_box_left_image pull-left full-width">\r\n<div class="step_to_healthy_lunch_section_left pull-left full-width">\r\n<div class="stay_healthy_img_section right">\r\n<div class="stay_healthy_img_section_outer">\r\n<div class="stay_healthy_img_section_inner"><img alt="" src="/static/mainapp/img/stay_healthy_img2.png" /></div>\r\n</div>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_section_discription_right text-right pull-left">\r\n<h2 class="discounts">Discounts</h2>\r\n\r\n<ul class="step_to_healthy_lunch_listing_right">\r\n\t<li>we believe in the enjoyment of eating together</li>\r\n\t<li>Choosing lucnhboxes from the same restaurant to be delivered to the same loca</li>\r\n\t<li>10 lunchboxes=10% discount</li>\r\n\t<li>15 lunchboxes=15% discount</li>\r\n</ul>\r\n\r\n<div class="round_circle_right text-center">2</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_section_box_left_image pull-left full-width">\r\n<div class="step_to_healthy_lunch_section_left pull-left full-width">\r\n<div class="stay_healthy_img_section left">\r\n<div class="stay_healthy_img_section_outer">\r\n<div class="stay_healthy_img_section_inner"><img alt="" src="/static/mainapp/img/stay_healthy_img3.png" /></div>\r\n</div>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_section_discription pull-right">\r\n<h2 class="place_order">Place your order</h2>\r\n\r\n<ul class="step_to_healthy_lunch_listing">\r\n\t<li>Order before 1pm for lunch that day!</li>\r\n\t<li>After 1pm, expect to receive your lunchbox the next day or you can choose a later date</li>\r\n\t<li>Select your delivery time slot (13:00-14:00-15:00)</li>\r\n\t<li>Ticket Restaurant, Paypal and Visa Debit can all be used to pay</li>\r\n</ul>\r\n\r\n<div class="round_circle_left text-center">3</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_section_box_left_image pull-left full-width">\r\n<div class="step_to_healthy_lunch_section_left pull-left full-width">\r\n<div class="stay_healthy_img_section right">\r\n<div class="stay_healthy_img_section_outer">\r\n<div class="stay_healthy_img_section_inner"><img alt="" src="/static/mainapp/img/stay_healthy_img4.png" /></div>\r\n</div>\r\n</div>\r\n\r\n<div class="step_to_healthy_lunch_section_discription_right text-right pull-left extra_padding">\r\n<h2 class="enjoy_lunchbox_icon">Enjoy your lunchbox</h2>\r\n\r\n<ul class="step_to_healthy_lunch_listing_right">\r\n\t<li>Your lunch will arrive during the chosen one hour</li>\r\n\t<li>time -shot,in a recyelable box with cutlery provided</li>\r\n</ul>\r\n\r\n<div class="round_circle_right text-center">4</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</section>	Steps to a healthy lunch	Steps to a healthy lunch
\.


--
-- Name: pages_lunchsteps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('pages_lunchsteps_id_seq', 5, true);


--
-- Data for Name: pages_supportdetails; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY pages_supportdetails (id, email, phone) FROM stdin;
1	support@lafiambrera.cat	+34 666913718
\.


--
-- Name: pages_supportdetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('pages_supportdetails_id_seq', 1, true);


--
-- Data for Name: payments_lafiambrera_currency; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY payments_lafiambrera_currency (id, "OneEuro") FROM stdin;
3	1
\.


--
-- Name: payments_lafiambrera_currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('payments_lafiambrera_currency_id_seq', 4, true);


--
-- Data for Name: payments_moneytowallet; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY payments_moneytowallet (id, amount, lafiambera_credit, status, user_id, uuid) FROM stdin;
169	400	400	f	585	b63f2726-1543-47c9-b186-ab425f39c29f
170	400	400	f	585	1b487ef2-6290-4327-83a4-abe35bbbc20a
171	400	400	t	585	138d4bf9-edce-47fd-9471-a22054635900
172	500	500	f	585	658190f4-447a-40b2-a893-25caa3b14412
173	400	400	f	585	870e88eb-72ea-439e-b888-d1e99e9cf261
174	400	400	t	585	c4466657-3240-44cf-8478-3135cd9aaa56
175	500	500	t	585	186bf75f-86f6-481a-a720-c37b16a2c496
176	300	300	t	593	41fa4041-6782-4098-abbc-d342ac80880c
130	50	50	f	412	cede4e06-78ce-4222-9677-63211ac13262
131	50	50	f	412	a5399bd2-178c-4a20-8f80-51f3c44a655b
132	50	50	t	412	bdede2dd-e5dc-43ef-8ce9-03bfa619f9b9
133	20	20	f	412	61deabfd-a8c0-459f-9f76-de436532bf7e
134	20	20	t	412	64063d48-7e40-4111-bcab-cb20a5dc086e
177	200	200	t	589	30c75f86-abfa-4e6d-9d8a-4b931d81bcae
178	500	500	t	589	c2ea5029-fd79-4e69-818e-7ceb4ea35c2e
179	400	400	t	589	41f4f8ad-cfba-43f1-b588-82ee1cf6380d
180	30	30	t	585	1ea2419a-b1da-4eed-81e3-0a1227c55e8a
181	30	30	f	585	4c13cfce-c84f-4270-be19-819867828ab0
182	5	5	t	589	7ad70153-6e6f-4776-82a5-61aa95c55624
183	250	250	t	412	91750678-fb78-4545-a7bf-3b0e43db3998
\.


--
-- Name: payments_moneytowallet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('payments_moneytowallet_id_seq', 183, true);


--
-- Data for Name: payments_payment; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY payments_payment (id, created, modified, amount, error_message, coupon_id, order_id, paypal_response_id, sermepa_response_id, payment_type, status) FROM stdin;
515	2017-10-03 07:11:48.039776+02	2017-10-03 07:12:09.479176+02	110.00		\N	555	\N	\N	pyp	ok
516	2017-10-03 08:03:30.847281+02	2017-10-03 08:03:30.847304+02	550.00		\N	556	\N	\N	wlt	pen
517	2017-10-03 08:18:37.806676+02	2017-10-03 08:19:26.40552+02	955.00		\N	557	\N	\N	pyp	ok
518	2017-10-09 17:39:30.165186+02	2017-10-09 17:40:17.229049+02	1055.00		\N	558	\N	\N	wlt	ok
519	2017-10-09 17:53:00.80301+02	2017-10-09 17:53:56.31961+02	110.00		\N	559	\N	67	rsy	ok
520	2017-10-26 14:58:06.637511+02	2017-10-26 14:58:06.637536+02	110.00		\N	560	\N	\N	pyp	pen
521	2017-10-27 12:27:25.972726+02	2017-10-27 12:30:41.694684+02	120.00		\N	561	\N	\N	pyp	ok
522	2017-10-27 13:30:54.929071+02	2017-10-27 13:30:54.929098+02	13.20		\N	562	\N	\N	rsy	pen
450	2017-09-21 15:07:00.731011+02	2017-09-21 15:07:00.731056+02	11.00		\N	490	\N	\N	rsy	pen
456	2017-09-22 09:28:59.740522+02	2017-09-22 09:34:10.742938+02	95.14		31	496	\N	44	wlt	ok
\.


--
-- Name: payments_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('payments_payment_id_seq', 522, true);


--
-- Data for Name: payments_paypalpaymentdetails; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY payments_paypalpaymentdetails (id, payfor, payuiid, paypal_paymentid, paypal_token, payer_id, status) FROM stdin;
1	Order	3c39a9c8-0e8f-488b-9ade-75495a0e91cd	PAY-2KC59942RM207015JLF2XIEI	\N	\N	f
2	Order	72cf14eb-7908-42d1-8852-bd654dcbad5e	PAY-6J490045VW594001LLF2XTYQ	\N	\N	f
38	MoneyToWallet	c3c86534-7dcb-4b3a-9c8a-b135b98880b4	PAY-0H09535504005625ELGEZIRI	\N	\N	f
39	Order	c31e2bc0-2d26-405e-8185-d35d79a855c6	PAY-79L443807R5450056LGJ5VOI	EC-0E406610PX660815F	V9LELBM62T74N	t
40	Order	9520e037-f6cb-4d28-9339-2461ccbe5eae	PAY-6HH236515R195281ALGJ57AI	EC-9GJ827455R856635M	V9LELBM62T74N	t
41	Order	c0655205-657b-4bcd-9a26-23fa5c8b65f0	PAY-8AU17586LK6222605LGJ6MCQ	EC-0NK043455S287090D	V9LELBM62T74N	t
18	MoneyToWallet	ce330e9a-fd92-4a0a-887c-002b0f453089	PAY-97G05370WN8459615LF2ZPYA	\N	\N	f
19	MoneyToWallet	d94c2ba0-ee11-4432-b573-4cf4e21271a3	PAY-70X77104W88087522LF2ZTXQ	\N	\N	f
20	MoneyToWallet	46d8235d-bbbc-4d17-972d-e94cdfdea4d4	PAY-74R32654CH046335NLF2ZVBA	EC-2R972396ES532104A	HAHFZ739VRF96	t
21	MoneyToWallet	63ea9817-2115-40e6-8b74-da7247d3f036	PAY-6KY97291X9038584CLF2ZWNA	EC-19282932AJ863135L	HAHFZ739VRF96	t
22	MoneyToWallet	7a133f47-d3d7-495f-9224-e26abbb6b5c0	PAY-6H615115C3261200HLF2ZXKY	EC-8SA807468V572261T	HAHFZ739VRF96	t
23	Order	8176b09f-864a-41b3-992b-81326df94371	PAY-6UR09812AW964123BLF23LSI	EC-0T517758HJ361024V	HAHFZ739VRF96	t
24	Order	fba406c2-5bd8-4f12-9124-aed74c097fb4	PAY-97745387FB461684DLF23QTQ	EC-19W69173U27883045	HAHFZ739VRF96	t
25	Order	0a61498a-58ac-4565-a36e-4c23cedcb402	PAY-2H01259371867992BLF232TI	\N	\N	f
26	Order	4bbb98ed-79e5-4472-9383-336f85e4a46d	PAY-6HG26306AK168683KLF3S2NI	EC-3BY72631H1490330K	HAHFZ739VRF96	t
27	Order	21352383-08a5-45b0-b1b2-0c20a3d42c7a	PAY-8FL59811EH590613TLF3S55A	EC-7A550703GS962830V	HAHFZ739VRF96	t
28	Order	b9f7a405-1998-49a2-88e9-ccad59230942	PAY-8C910975UE843864ULF3S7HY	EC-4FL880218K216814R	HAHFZ739VRF96	t
29	MoneyToWallet	72d241ca-6676-40d3-8f18-08e4b241acd0	PAY-2CW24905JP526152FLF3TSVQ	\N	\N	f
30	MoneyToWallet	e16e9e42-6ac1-42f9-8c98-419879a6e6bc	PAY-1FE42695Y0786900ELF3UEMA	\N	\N	f
31	MoneyToWallet	8f438948-4e7a-4bb1-9a19-4138ef77419b	PAY-8PL56018NY219812MLF3UPMI	EC-8G037054UC6292703	V9LELBM62T74N	t
32	Order	06ea374f-ba26-424b-a244-5cf9c9eaa087	PAY-2UJ134312N2786528LF3URIA	EC-4RU6918191819832S	V9LELBM62T74N	t
33	Order	76fe39bf-0856-408b-96eb-ed2b2e243a18	PAY-7NE8729323165362CLF3USJI	EC-9Y626123328310043	V9LELBM62T74N	t
34	Order	e4e6e7a3-2a1c-404b-afdd-c6946d18fe97	PAY-0N683567FT014014SLF3UUSA	EC-71L49922CL341484W	V9LELBM62T74N	t
35	Order	32f35ebd-5d64-4d42-9590-da73e678625c	PAY-70674930B1683713TLF7Q36I	EC-9LK55114PA7234347	V9LELBM62T74N	t
36	Order	07480f9a-f37c-48bc-a04e-371b10e9f036	PAY-0E168362L00294454LGAEGPY	EC-7RT662943X5056058	V9LELBM62T74N	t
37	Order	2e627df4-5666-45ef-b863-93c7a0a364bc	PAY-4HM11386KR371681RLGAZCEQ	EC-37180920JE579205J	V9LELBM62T74N	t
42	Order	21fee988-bd9f-488b-b9f8-fb87ca7b2148	PAY-8FS61833EA186054FLGJ6PRI	EC-7XJ56153XR503942S	V9LELBM62T74N	t
43	Order	09e6a00f-f052-47d0-91ad-c7da0eee5728	PAY-44G49955N3122181CLGJ6WGA	EC-78978898WH776313S	V9LELBM62T74N	t
44	Order	d5b72ed1-0508-4960-a50e-43631fdbf4dd	PAY-2F925536D20912343LGKBGAA	EC-66J860260C170281P	V9LELBM62T74N	t
45	Order	3c768cfb-c9c9-4d1f-a030-dad1409f06c0	PAY-8N4260904F894750VLGKBJGA	EC-6K589194SL239011K	V9LELBM62T74N	t
46	Order	b3b94f1a-3c54-481d-8da4-7b92e50eb297	PAY-2YJ36731Y0293490ALGKBKCA	EC-02P47211WR9945220	V9LELBM62T74N	t
47	Order	57b04608-6d2d-4457-8532-6744943d6051	PAY-7T28125760653274ULGKCA6A	EC-6R39140973708731L	V9LELBM62T74N	t
48	Order	be2b7908-2b4e-4a49-ac6e-dad434895a51	PAY-8YA54752JL3896507LGKCCBA	EC-93X15426JL4354835	V9LELBM62T74N	t
49	Order	1317370f-50b0-4a29-83b4-5e9420d811a8	PAY-3JN62936NU632253ELGKCEHQ	EC-0TF00656GT9115729	V9LELBM62T74N	t
50	Order	3c45b088-a040-4e71-9cac-12a2ddcf28e2	PAY-1DD32329MN006083BLGLJYHI	EC-2US199583D505904V	V9LELBM62T74N	t
52	Order	4c83f8cb-6c47-4f23-9450-736583de8ed4	PAY-3WS14279CG2884804LGLMHRA	EC-8XG590893C528124M	MGPMLBK2VDFG6	t
53	Order	0bb997b3-d14a-4201-ba88-5250bf1caa8c	PAY-3G307251ST1070117LGLMWZI	\N	\N	f
54	MoneyToWallet	a268407a-e71a-41b8-bb0b-8c581caea307	PAY-9M272184U3643745JLGLNDEA	\N	\N	f
55	Order	2d21ff19-659b-4b1f-9a2f-a6f23e9edc71	PAY-7ET097040V2232417LGMC45I	EC-7HY91271XJ654121F	V9LELBM62T74N	t
56	Order	87a81dd1-0ca0-476d-8b43-023315ead3eb	PAY-2HP61719BG125981MLGMDBSI	EC-08B51592EA929081V	V9LELBM62T74N	t
57	Order	d036e752-fca3-4ec0-927e-49c3757fc6a8	PAY-0UB93247KE6434535LGMDFWI	EC-43U44239CJ178405L	V9LELBM62T74N	t
59	Order	8c84e5f6-c018-4aff-a175-11a7e639b2af	PAY-9J832147MN8818038LGOQ3YA	EC-7ED646764M819284J	ZLGXHZ5Q9DCHA	t
58	Order	36bedc7d-5123-4624-a6cb-71e5fc13b299	PAY-2HH01902LJ321542WLGOQ3RI	EC-72H769535P0684635	MGPMLBK2VDFG6	t
60	Order	5ed4e23c-f709-4b46-abc9-30efaf08bfe6	PAY-7BB36657A2546874VLGORYQI	EC-8BX698440K155881T	V9LELBM62T74N	t
61	Order	1d9b69aa-7be4-406e-83a4-cd2bc86ee7bd	PAY-6V578200RU356640NLGPFTGY	EC-3FF22398UW213904W	V9LELBM62T74N	t
62	MoneyToWallet	e3921c2b-74fb-4cd0-98b0-2dfd1e1bc3ff	PAY-58K88583X4015220BLGPGKMY	EC-81S762560P421121X	V9LELBM62T74N	t
63	Order	2eb04ace-39ec-4ce1-8147-a069ddf1b60c	PAY-92C88421ES773501RLGPGMEY	EC-5U800360SP275250L	V9LELBM62T74N	t
64	MoneyToWallet	d6ef27e9-1b9e-4dbb-965b-2aecbfd8dd51	PAY-83064442C0266615FLGPHHTA	EC-76036376J3435704B	V9LELBM62T74N	t
65	MoneyToWallet	a4eb46a7-0891-4cc6-b473-d98fdbde37fc	PAY-5NA85598A9756524SLGPHODA	EC-0FM59226TC759464S	V9LELBM62T74N	t
66	MoneyToWallet	9b2a49dd-11f4-4439-bbdc-2a59d18f66cc	PAY-6MF05587FS410842GLGPHPUQ	EC-2SX274806Y338973P	V9LELBM62T74N	t
67	MoneyToWallet	f151867f-f780-4df5-a285-2c15b258ff13	PAY-1B968615Y4990263JLGPHSHQ	EC-749690614L929230W	V9LELBM62T74N	t
68	MoneyToWallet	b4376035-e491-47de-81c3-2026db5717af	PAY-4WK230823H082314TLGPLLPQ	EC-83H03899YU667342D	V9LELBM62T74N	t
69	Order	1bddf977-54a6-4f33-937e-b1aeea7dd447	PAY-38S80299XU788160GLGPLN5I	EC-081721640N4792348	V9LELBM62T74N	t
70	MoneyToWallet	cf93d354-1af5-4b3d-9228-c1fb3a1e9be5	PAY-2HL12910TT806281GLGQQ72Y	\N	\N	f
71	MoneyToWallet	89ea92f8-104c-4682-8e21-916f3c256fa0	PAY-6WR24972G1296572ALGQQ77I	\N	\N	f
72	MoneyToWallet	adcdfaa8-4ca8-4314-88f8-98ab32364c24	PAY-729533385N964292DLGQRCSA	EC-5J656343LA795232M	ZLGXHZ5Q9DCHA	t
73	MoneyToWallet	d7600ec2-769f-4ce6-9003-d7afb5400b73	PAY-20L653794H706891WLGQRWPA	EC-8Y661729JX281735E	ZLGXHZ5Q9DCHA	t
74	MoneyToWallet	d7e87042-6671-4458-abd4-fd4a7231ff66	PAY-95P47815LW798161BLGR6MZI	EC-6TL83640RE130971H	V9LELBM62T74N	t
75	Order	b2b5b22c-1325-47c6-8a96-5ea2a960de60	PAY-70F67315WA7823021LGR6U3I	EC-6V53190212568750Y	V9LELBM62T74N	t
76	MoneyToWallet	62721c60-1049-48dc-9683-05610b89489d	PAY-0CU96875V4949042ALGR6XNY	EC-86Y52368MG6650501	V9LELBM62T74N	t
77	Order	e9006235-07ea-45bc-9db4-5114548e5e2e	PAY-1D385712U7903991YLGR647Q	\N	\N	f
78	Order	4c95d5e7-5b23-48ce-a121-94fee7c89a92	PAY-09446457D7582613CLGR7A4Y	\N	\N	f
79	Order	4a8b366c-bb70-419d-8785-e07a17f96755	PAY-6RP96661RJ6170301LGR7OJI	EC-9EF084692C863590W	V9LELBM62T74N	t
80	Order	46bc2d19-d35a-4599-a53e-995671c4d6e4	PAY-37P983537U3809628LGR7ZOA	EC-74Y5272494994344T	V9LELBM62T74N	t
81	Order	21047cd0-87d3-48c4-9d00-49e80dc8494f	PAY-5GS89858UD459154NLGSAODA	\N	\N	f
82	Order	458089f3-3110-4382-a17d-85a3534f4b4a	PAY-39M99959RY928633TLGSQUFQ	EC-34N94883RG778783V	V9LELBM62T74N	t
83	Order	b58b80f8-86bd-487c-a373-50b187a886fd	PAY-8FL143493P510010TLGSUHKQ	EC-4W096971HT113292N	V9LELBM62T74N	t
84	Order	bdca80b7-fb57-41d1-9e70-f03225670506	PAY-8GL365888L5866107LGWOMII	EC-18U04457B8276750U	V9LELBM62T74N	t
85	MoneyToWallet	0e570b92-102c-4ad0-8f76-c0b38c76d5ce	PAY-0R304051H5013830DLGWPAYI	EC-4J5721182R876614V	V9LELBM62T74N	t
86	MoneyToWallet	aaa3a43b-f47a-4717-9cef-fc96bd99e8ef	PAY-1XG95958893193140LGWPIMA	EC-7FV42285RF542845T	V9LELBM62T74N	t
87	MoneyToWallet	a690e0a0-8ecf-451b-8abe-64ba4c23acc1	PAY-7ML564649W913854JLGWPQ3Q	EC-44C99600J34058414	V9LELBM62T74N	t
88	Order	0009a93c-113c-4dbc-b258-0d4f6688305b	PAY-3UJ80419992528328LGWP2DQ	\N	\N	f
89	Order	ddce9949-de78-4981-8cd4-84ecaf4f743c	PAY-9RL09874MP456323PLGWP3AI	EC-1LX42829CG1598031	V9LELBM62T74N	t
90	MoneyToWallet	e024d198-96f4-4cee-aaf8-58e3cc230017	PAY-4PS70613M6215050HLGWRBAY	EC-3W2486824V492684A	V9LELBM62T74N	t
91	Order	ab65e913-645d-42db-9494-dada6426e264	PAY-44F96427MA877302BLGXW5OI	\N	\N	f
92	MoneyToWallet	1922f5ad-f86b-403a-9cb7-fcad617f608a	PAY-38K429819T861962KLGX4DDA	EC-6CN998614U479672M	V9LELBM62T74N	t
93	MoneyToWallet	cce265a4-e8d1-4665-96e6-68b698165166	PAY-9U438236RB9852055LGZBVYI	EC-3BL660176B5309339	V9LELBM62T74N	t
94	MoneyToWallet	3cdca560-3019-480e-9c6e-be18ecd4ea24	PAY-9H8928317G951002HLGZDBZQ	EC-6403802955395404N	V9LELBM62T74N	t
96	MoneyToWallet	f77c9db1-dfdf-4bdc-b6b0-6ed093232160	PAY-9E878662T48632359LGZJOEQ	\N	\N	f
95	MoneyToWallet	b0b91975-57fc-4878-8921-a5da034dfff1	PAY-30A549876K094152NLGZJJOY	EC-4PW03470L1472142A	V9LELBM62T74N	t
97	MoneyToWallet	33369e73-3a62-44e5-90f7-532b8b621cde	PAY-7B3352144K353651LLGZKV6Q	\N	\N	f
98	MoneyToWallet	bd6bb5a9-84ad-44b1-97fd-2bb31ebab94f	PAY-4BN28572G68638432LGZWPNQ	EC-4LP14922JS499460L	V9LELBM62T74N	t
99	MoneyToWallet	74ef2296-fd8b-4be6-90ab-4ee14986108d	PAY-80L65891E60117153LGZWY3Y	EC-5A1249921C5104142	V9LELBM62T74N	t
100	MoneyToWallet	37c2058b-3f05-42ca-9593-ab402b412adf	PAY-6VS25753JK4502428LGZYEGI	\N	\N	f
101	MoneyToWallet	098640d6-3ddb-49b7-9128-9bb251e157cd	PAY-60S18383FS485845XLGZYELY	EC-87N28342CD779645H	V9LELBM62T74N	t
102	MoneyToWallet	ebf13c42-bdfa-4725-8431-91bee0b879c3	PAY-14X13074S55690036LGZYI6Y	EC-86S67508TB396682R	V9LELBM62T74N	t
103	MoneyToWallet	6cf360c5-3d28-47b3-9ec8-1e2832a979c4	PAY-2YJ76980845842926LGZYTVI	EC-7CN38615E1959381M	V9LELBM62T74N	t
104	MoneyToWallet	09003c95-aee9-4e0a-807b-40affa2e4542	PAY-7B8775170T6799506LGZYZZY	EC-69T46822GR247644A	V9LELBM62T74N	t
105	MoneyToWallet	37bbe4c6-9227-47b7-9b3d-7dea51ae48bc	PAY-22685965MS0208640LGZY2II	EC-3KK088119P516902W	V9LELBM62T74N	t
106	MoneyToWallet	eb9e0260-0774-43c2-8f50-b4fdedc94eb4	PAY-7HW11471E7900990CLGZY36I	EC-6R5120671P168164F	V9LELBM62T74N	t
107	MoneyToWallet	cf80bce4-fee6-44cc-80fb-b493e384787a	PAY-2AD72879V93394436LGZZDAQ	EC-1XT61069K8087671H	V9LELBM62T74N	t
108	MoneyToWallet	762fbe38-bdd0-43ea-a2a1-f2ed94ac746e	PAY-8N947501MG008064CLGZ4RWA	\N	\N	f
109	MoneyToWallet	b2f487c1-97a2-4006-b12a-b28410236f8b	PAY-18C51582AA363353YLGZ4SBY	\N	\N	f
110	MoneyToWallet	ee4a9436-b15a-4169-b6ca-6a7a5e96b5b8	PAY-20M1288666858423KLGZ4SKY	\N	\N	f
111	MoneyToWallet	ed84960f-ab3f-41d7-8234-321d37546527	PAY-9MN7230975757050FLGZ4TBY	EC-9CR94890JH971801R	V9LELBM62T74N	t
112	Order	7c1d81b2-f841-47df-bbba-8dd8e0da9041	PAY-0RD14212D2479450XLGZ422Q	EC-8F762419V1820574M	V9LELBM62T74N	t
113	MoneyToWallet	af5e537b-79cd-41d5-b0dc-cd4b45f5a6d3	PAY-52S79891MG979734VLGZ46JQ	\N	\N	f
114	MoneyToWallet	4dc1fbda-6d0b-4ff1-b033-31564301ad42	PAY-09K043807W4046450LG3BZOI	\N	\N	f
115	MoneyToWallet	27b8ba6d-a886-4613-8450-cbd5ae396092	PAY-7H644187G9668601RLG3BZUY	\N	\N	f
116	Order	b72e2132-36f1-4473-b0c0-f9b5535de8c3	PAY-9NN165514T3593444LG3B2EY	\N	\N	f
117	MoneyToWallet	06dceb2a-691d-45ab-87b7-a659ad68a2c8	PAY-0V559493F6873135ULG3B5SI	EC-2GK55870JD4634108	V9LELBM62T74N	t
118	Order	967f9dee-3693-485c-9cf6-0811ed76241d	PAY-2066179041444414VLG3B6RY	EC-5VB51856EW870432M	V9LELBM62T74N	t
119	Order	c3be869a-6713-4e51-a18a-47c04549ff0d	PAY-6FJ55227TK706912GLG3CR4Y	\N	\N	f
120	MoneyToWallet	06b71de6-a906-4d05-820c-22da666aabb5	PAY-25E10918S3090174DLG3CSFQ	EC-0FJ775280H3088831	V9LELBM62T74N	t
121	MoneyToWallet	d9050c41-fb0b-46b8-a238-92436595e290	PAY-6HD99097378918619LG3C6UA	EC-6U0352294P3103421	V9LELBM62T74N	t
122	MoneyToWallet	32d10bd5-4e36-4b10-885f-2c440d8db9f6	PAY-00H35683FS126441GLG3DGNY	EC-7GV50176RT971363F	V9LELBM62T74N	t
124	MoneyToWallet	08694fc0-27e5-4be7-b866-47ec016c81bd	PAY-7F158694LE495190KLG3DHUQ	EC-0TE091882B858133T	V9LELBM62T74N	t
123	MoneyToWallet	e3537f79-eacb-4238-9cfd-52c13b9b471f	PAY-6F593687UM793524DLG3DHNA	EC-13486897WN0870258	V9LELBM62T74N	t
125	MoneyToWallet	c2fed2a5-b781-4b68-a5e8-89d81c3433b7	PAY-9HC61868MG0699245LG3DS7Y	\N	\N	f
126	MoneyToWallet	cc746e27-c614-43c4-92ad-8605acdb53a8	PAY-72D99937YU7716415LG3DTIY	EC-74W89076SG527372P	V9LELBM62T74N	t
127	Order	c9aaed65-f86a-4f8b-a731-bd1c610c1091	PAY-3L750887G3453632LLG3FFNY	\N	\N	f
128	MoneyToWallet	274e92b1-af2e-4f86-b784-79898c642038	PAY-9U2520705C064793WLG3FKXI	EC-4YT24052RV855400T	V9LELBM62T74N	t
129	MoneyToWallet	d27d9ab1-3b26-4ea9-b701-ed769a5fce64	PAY-54C14315125796420LG3WTDI	EC-3S2279826A797590U	V9LELBM62T74N	t
130	Order	773c9cf9-49d8-47ff-ade0-1f93733a26c5	PAY-7BM70578X7360054LLG3W2NQ	EC-6CB31372FG5854109	V9LELBM62T74N	t
131	MoneyToWallet	8573c9b6-a54d-495e-8150-7791ad25c7c6	PAY-78182894NN209540FLG3W7WA	\N	\N	f
132	MoneyToWallet	8ee33a0b-f661-47ae-8ac5-0d8b6fb8d42d	PAY-5ML85698U80339418LG3XARA	EC-4LD349492B3874350	ZLGXHZ5Q9DCHA	t
133	Order	07b3e56a-9027-4ec7-941d-2e2a45f9899d	PAY-2RS905800F845384NLG3XDJY	EC-7CV286070H3020946	ZLGXHZ5Q9DCHA	t
134	Order	7f11cd69-5603-4470-be8e-361630e66f0e	PAY-33F72077MW658492SLG3XFEQ	EC-5LS226039N9148242	V9LELBM62T74N	t
135	MoneyToWallet	6aca87c8-e6ec-4dd7-b771-a2100cc37587	PAY-16D514973L683193KLG3YAWY	EC-10592387NP4030849	ZLGXHZ5Q9DCHA	t
136	Order	b84c74e0-a7c6-4bc0-aa66-76ee607dc519	PAY-535513261M1269130LG3YBHY	EC-1WY10113EX922341C	ZLGXHZ5Q9DCHA	t
137	Order	3ffdc2af-9e89-41b8-8c1d-257f4680e1b3	PAY-5TY83158NV130044SLG3YJJQ	EC-0WS920042A880322T	V9LELBM62T74N	t
138	Order	9c3461eb-4cc2-48fa-884e-19b28c1ed827	PAY-7D3418560U356233TLG3YKYI	EC-4D133262DS400303U	V9LELBM62T74N	t
139	Order	d421e6ff-f262-429a-95a4-a0211d5d8c87	PAY-12F3067398970525BLG3YLNQ	EC-3VK59921KN474784A	ZLGXHZ5Q9DCHA	t
140	MoneyToWallet	346aa79f-a63a-4358-8e86-f916f8bee83e	PAY-0DH192711R746711HLG32BPI	EC-8BU700036W4191312	V9LELBM62T74N	t
141	MoneyToWallet	6daf8041-e41a-4bbb-b6ab-3e53666ca44a	PAY-85J90940036134121LG5XFEY	\N	\N	f
142	MoneyToWallet	aa0e1499-52dd-498d-a6d2-1b8bf17b8bf6	PAY-0S167675004161417LG5XFJI	EC-9FW37287YK6976502	V9LELBM62T74N	t
143	Order	6ec3888b-1523-4fe9-9a9b-5db3248ee1cd	PAY-8G835457BH181682GLG5XGZI	EC-57C75109RC103060Y	V9LELBM62T74N	t
144	Order	0131423a-a9a0-4755-b9ea-f537ee3a7b9d	PAY-6YG22641HB767324LLG7V2DQ	EC-5WL02739L87004455	2G6CGEZVZY9KY	t
145	Order	41645540-2592-4032-97b6-2b886263929f	PAY-4MB91513TG7819410LG7XKRY	EC-4EM309325P0648405	V9LELBM62T74N	t
146	MoneyToWallet	62744880-89a6-423e-99e7-7bf93858544c	PAY-8BE16049HX951851WLHAKFYQ	EC-40T982024Y1363307	V9LELBM62T74N	t
147	Order	96869619-9340-43ea-a664-dd3e80f41426	PAY-27401416XS704941CLHAKHSQ	EC-45438584RG1810902	V9LELBM62T74N	t
148	Order	30f56cca-1e12-4e6b-87e3-f234e37c0d49	PAY-47J655351L2269006LHAKIIQ	EC-3HR72894PU2619032	V9LELBM62T74N	t
149	Order	a762edac-1212-4987-a8c8-0e0b43255975	PAY-4HJ460735T7759508LHAKJ6Y	EC-06E84942EF307870N	V9LELBM62T74N	t
150	MoneyToWallet	51407d0d-3962-427a-9af8-f093f587a721	PAY-9SD73994RX684983WLHAKLTI	\N	\N	f
151	MoneyToWallet	be5d1a29-8c9e-4fdb-be99-22d70ff00d0b	PAY-8VS986007Y239914FLHAKLYI	EC-0D791575V3746072R	V9LELBM62T74N	t
152	Order	34a95eb1-1ffa-4aec-85ae-21925c8ee94d	PAY-8TR65922NP4259151LHAP4MA	EC-7U166413A8664654V	V9LELBM62T74N	t
153	MoneyToWallet	2f033fe2-bb8d-469e-9109-76cb04c549dd	PAY-0Y1850162J863990FLHAP46A	EC-63R2737445025621F	V9LELBM62T74N	t
154	Order	4ac2d93c-97ee-416a-af11-5831f0767ae1	PAY-8XT67639JV873770VLHA7WXA	\N	\N	f
155	Order	4b314406-4ee8-46c4-a890-f19e390f786a	PAY-9W302685JP6229401LHA7XCY	\N	\N	f
156	MoneyToWallet	293882fc-2fe1-42ab-bb46-c48f8e97f92b	PAY-1E7151396A6847413LHBFNSY	EC-1CS97973ER1550428	V9LELBM62T74N	t
157	Order	e97ce654-2d86-4a6a-b783-1af80c947005	PAY-53V44188M5907142TLHBFQDY	EC-21M251524M946292E	V9LELBM62T74N	t
158	MoneyToWallet	2e2a0108-698e-4475-a2c9-dcd0b5507542	PAY-07W8852621066404ELHBUZOA	EC-1WT20420DY119921L	V9LELBM62T74N	t
159	Order	b81d43df-f841-484c-b566-31faa39bbb29	PAY-11J2556019247731MLHBU4MA	EC-8R199386DS430170P	V9LELBM62T74N	t
160	Order	f4f23ac7-2dd1-4219-a6b4-704c631dbb61	PAY-9ML19342XS581153XLHBVCDI	EC-8HN98420D6387454M	V9LELBM62T74N	t
161	MoneyToWallet	9150fbe9-0707-4b21-aa75-07f59a1515de	PAY-04A100852F988072BLHBV2CA	EC-484566633Y638010E	V9LELBM62T74N	t
162	MoneyToWallet	bdede2dd-e5dc-43ef-8ce9-03bfa619f9b9	PAY-29C64939TK993573ELHCLP7Y	EC-7KM79138J10212158	V9LELBM62T74N	t
163	MoneyToWallet	64063d48-7e40-4111-bcab-cb20a5dc086e	PAY-38D5153874226063CLHCLRPI	EC-33667942BR618713A	V9LELBM62T74N	t
164	Order	fa763c83-d5cd-49ee-a6c3-38a471bf16a8	PAY-2XP55724PM1361447LHC7Q2Q	\N	\N	f
165	Order	a7320525-7043-4902-ba41-b9875780ffc3	PAY-59D35911XJ5741721LHDAHGA	\N	\N	f
166	Order	52b9a901-f335-45df-911c-6893b02d53e8	PAY-0Y950568AH5553625LHDA2AQ	\N	\N	f
167	MoneyToWallet	00f83246-c824-4421-8c63-3520ceae8b56	PAY-7P209757S0626072JLHENBGY	EC-75H36655AL005250U	V9LELBM62T74N	t
168	MoneyToWallet	f9cc7e29-74fe-46e5-af58-00bdcefa01a3	PAY-12F99579PV5181732LHENPCA	\N	\N	f
169	MoneyToWallet	fc5d73f3-392a-49a0-80d5-c5c6313b19c7	PAY-20M30933UX361530CLHENPJA	EC-4RS89173UE180102Y	V9LELBM62T74N	t
170	MoneyToWallet	b73ca731-d205-4fae-b797-995e2c1a3ba6	PAY-7EL17676H74753323LHENQIY	EC-3LD90060MD930880X	V9LELBM62T74N	t
171	MoneyToWallet	212ee6f5-83cc-42c4-b36c-543fe8b9e45a	PAY-89W82241NH022120GLHE5CVQ	EC-92095022SP015071T	V9LELBM62T74N	t
172	MoneyToWallet	4a43eeef-031b-4eb6-8105-fcbe58979942	PAY-7BX24824VL397440PLHE5EOA	EC-9RD13039M45760744	V9LELBM62T74N	t
173	Order	e6b83eb7-dc10-4c14-8980-d79acf649a14	PAY-06K80335TM996660RLHE5O6I	EC-0FB3731952554571N	V9LELBM62T74N	t
174	Order	8378f28d-b282-4139-a498-df5bc5bc48fc	PAY-3C521263YN109281DLHE6VPA	EC-6NL68309DY4758947	V9LELBM62T74N	t
175	MoneyToWallet	374cf682-9a9d-40b8-a59a-cc058bddf7df	PAY-0AJ7442493297720GLHE6XXY	EC-2UV74379622266158	V9LELBM62T74N	t
176	Order	bce112f1-383a-43c9-b0c5-b8c5e531e602	PAY-8ED79556D6667400BLHE63KY	EC-9UG22108UE660020U	V9LELBM62T74N	t
177	Order	8dc06f35-af2d-46ee-8c8c-34fec643f73c	PAY-3AX952136P7068402LHE7AEY	EC-2WU79133UN861801M	V9LELBM62T74N	t
178	MoneyToWallet	cff53a18-95f3-4074-b9ef-5171fd73fa3d	PAY-24M27694XW1501441LHE7AYQ	EC-1UK90926NJ6439518	V9LELBM62T74N	t
179	Both	18c91e64-9f91-437f-9fe9-8b957e0f6829	PAY-03547592JK182430PLHE7FUA	EC-5TF24092BE101834Y	V9LELBM62T74N	t
180	MoneyToWallet	ec9a04bb-f8e0-4194-90ca-7c778bf7dc91	PAY-5D438399SG002833VLHE7IIQ	EC-9AM25662S7166905H	V9LELBM62T74N	t
181	Order	dbf22629-60d6-4b8a-83f3-f4a12b649584	PAY-50U86339PT6935425LHFB5YY	EC-18567303AS478084H	V9LELBM62T74N	t
182	Order	ad225f81-eb74-4427-a07a-415dc6244171	PAY-8DE818768B136052VLHFSSYA	\N	\N	f
183	MoneyToWallet	1c811504-8167-4e56-b5a9-8281f39646df	PAY-09835764HD3342258LHFU3MI	\N	\N	f
184	Order	2227f564-c404-4721-902a-dba42a7aea44	PAY-1B570962V00754129LHFWJ7Y	\N	\N	f
185	Order	0067631b-96d0-4f3b-8018-fba4c95bda87	PAY-9AU98913C42767642LHFWT6Y	EC-0FD12302LC7141153	V9LELBM62T74N	t
186	Order	f54fd46f-b67a-41a0-825c-66adb93c7bf3	PAY-3HB88805CV1352350LHFWYRI	EC-3GL43242J1788140A	V9LELBM62T74N	t
187	MoneyToWallet	b63f2726-1543-47c9-b186-ab425f39c29f	PAY-7N5035661V0896704LHJQXJY	\N	\N	f
188	MoneyToWallet	1b487ef2-6290-4327-83a4-abe35bbbc20a	PAY-01P40290P7982401RLHJQXSQ	\N	\N	f
189	MoneyToWallet	138d4bf9-edce-47fd-9471-a22054635900	PAY-69273582XR344911ULHJQXWA	EC-3GC21756TR1202242	4DT24GVJJH3PS	t
190	MoneyToWallet	658190f4-447a-40b2-a893-25caa3b14412	PAY-6UC93869JS7032308LHJQ5ZA	\N	\N	f
191	MoneyToWallet	c4466657-3240-44cf-8478-3135cd9aaa56	PAY-0KG37763UU4705812LHJQ6JY	EC-82833328P1695241P	4DT24GVJJH3PS	t
192	MoneyToWallet	186bf75f-86f6-481a-a720-c37b16a2c496	PAY-3FW10148EK2160542LHJRV4I	EC-0HD949312N553471C	4DT24GVJJH3PS	t
193	Order	682c08ba-dcbc-450b-ab28-0720604d2ec1	PAY-7BX56411VX003152ALHJRYFI	EC-3CJ244952N417244Y	4DT24GVJJH3PS	t
194	MoneyToWallet	30c75f86-abfa-4e6d-9d8a-4b931d81bcae	PAY-8US33152Y5700870JLHJSOLI	EC-9TH426644N9979503	4DT24GVJJH3PS	t
195	MoneyToWallet	c2ea5029-fd79-4e69-818e-7ceb4ea35c2e	PAY-8VL34442E54401251LHJSQVA	EC-3LA61384CK436392P	4DT24GVJJH3PS	t
196	MoneyToWallet	41f4f8ad-cfba-43f1-b588-82ee1cf6380d	PAY-4MU21848JF1640901LHJSVFY	EC-5YG10150ET7296011	4DT24GVJJH3PS	t
197	Order	56a7af7e-b7cd-44dc-92d3-753a1d4ea86d	PAY-4CB33018PL589351GLHJSXPY	EC-7WT70025R44709516	4DT24GVJJH3PS	t
198	MoneyToWallet	1ea2419a-b1da-4eed-81e3-0a1227c55e8a	PAY-95V02902X0459583VLHJTDEI	EC-5E751163JD050635J	4DT24GVJJH3PS	t
199	MoneyToWallet	4c13cfce-c84f-4270-be19-819867828ab0	PAY-2D633439BU913352YLHJTOBQ	\N	\N	f
200	MoneyToWallet	91750678-fb78-4545-a7bf-3b0e43db3998	PAY-3S7871512C163593SLHNZENQ	EC-04T02700CK842682W	V9LELBM62T74N	t
201	Both	2cbbb6ea-4dc1-4635-94e3-3661cd4ccdc4	PAY-5DS694410M1514646LHNZQSQ	EC-60F743342K3880433	V9LELBM62T74N	t
202	Order	ecde1c82-e515-477c-ace2-6f9a9f822296	PAY-8HM0543789441602DLHY5XYA	\N	\N	f
203	Order	d604780a-bb90-4c64-a410-46470533d055	PAY-4BM23129V2981925MLHZQUEI	EC-63T65004AA157531S	V9LELBM62T74N	t
\.


--
-- Name: payments_paypalpaymentdetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('payments_paypalpaymentdetails_id_seq', 203, true);


--
-- Data for Name: payments_wallet; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY payments_wallet (id, amount, lafiambera_credit, user_id) FROM stdin;
59	1390	1390	585
60	1185	1185	589
20	50	50	412
55	0	0	557
61	72	72	591
62	278	278	593
\.


--
-- Name: payments_wallet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('payments_wallet_id_seq', 62, true);


--
-- Data for Name: payments_walletorder; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY payments_walletorder (id, paymentgateway, status, order_id, user_id, wallet_id) FROM stdin;
67	25.1400000000000006	t	496	557	55
80	270	f	556	589	60
81	855	t	558	557	55
\.


--
-- Name: payments_walletorder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('payments_walletorder_id_seq', 81, true);


--
-- Data for Name: payments_walletpayment; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY payments_walletpayment (id, created, modified, status, payment_type, amount, error_message, moneytowallet_id, paypal_response_id, sermepa_response_id) FROM stdin;
142	2017-10-03 08:43:27.436339+02	2017-10-03 08:44:49.495783+02	ok	pyp	30.00		180	\N	\N
143	2017-10-03 09:06:45.281858+02	2017-10-03 09:06:45.281886+02	pen	pyp	30.00		181	\N	\N
144	2017-10-03 10:52:56.753368+02	2017-10-03 10:53:30.178403+02	ok	rsy	5.00		182	\N	66
145	2017-10-09 17:13:39.309654+02	2017-10-09 17:15:31.928428+02	ok	pyp	250.00		183	\N	\N
93	2017-09-22 09:12:19.313315+02	2017-09-22 09:12:19.313342+02	pen	rsy	50.00		130	\N	\N
94	2017-09-22 09:12:46.260094+02	2017-09-22 09:12:46.260117+02	pen	rsy	50.00		131	\N	\N
129	2017-10-03 06:01:35.709928+02	2017-10-03 06:01:35.709966+02	pen	pyp	400.00		169	\N	\N
95	2017-09-22 09:13:01.114992+02	2017-09-22 09:14:10.327276+02	ok	pyp	50.00		132	\N	\N
96	2017-09-22 09:15:50.269217+02	2017-09-22 09:15:50.269242+02	pen	rsy	20.00		133	\N	\N
131	2017-10-03 06:02:04.28378+02	2017-10-03 06:02:04.283804+02	pen	pyp	400.00		170	\N	\N
97	2017-09-22 09:16:11.469479+02	2017-09-22 09:16:40.665535+02	ok	pyp	20.00		134	\N	\N
133	2017-10-03 06:02:30.635453+02	2017-10-03 06:10:29.155219+02	ok	pyp	400.00		171	\N	\N
134	2017-10-03 06:15:31.100254+02	2017-10-03 06:15:31.100277+02	pen	pyp	500.00		172	\N	\N
136	2017-10-03 06:16:31.601143+02	2017-10-03 06:17:01.070062+02	ok	pyp	400.00		174	\N	\N
137	2017-10-03 07:06:54.508173+02	2017-10-03 07:07:42.309366+02	ok	pyp	500.00		175	\N	\N
138	2017-10-03 07:50:55.999222+02	2017-10-03 07:51:53.965919+02	ok	rsy	300.00		176	\N	65
139	2017-10-03 07:59:05.318103+02	2017-10-03 07:59:55.568244+02	ok	pyp	200.00		177	\N	\N
140	2017-10-03 08:04:03.063306+02	2017-10-03 08:04:24.201698+02	ok	pyp	500.00		178	\N	\N
141	2017-10-03 08:13:41.590669+02	2017-10-03 08:14:02.051921+02	ok	pyp	400.00		179	\N	\N
\.


--
-- Name: payments_walletpayment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('payments_walletpayment_id_seq', 145, true);


--
-- Data for Name: paypal_ipn; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY paypal_ipn (id, business, charset, custom, notify_version, parent_txn_id, receiver_email, receiver_id, residence_country, test_ipn, txn_id, txn_type, verify_sign, address_country, address_city, address_country_code, address_name, address_state, address_status, address_street, address_zip, contact_phone, first_name, last_name, payer_business_name, payer_email, payer_id, auth_amount, auth_exp, auth_id, auth_status, exchange_rate, invoice, item_name, item_number, mc_currency, mc_fee, mc_gross, mc_handling, mc_shipping, memo, num_cart_items, option_name1, option_name2, payer_status, payment_date, payment_gross, payment_status, payment_type, pending_reason, protection_eligibility, quantity, reason_code, remaining_settle, settle_amount, settle_currency, shipping, shipping_method, tax, transaction_entity, auction_buyer_id, auction_closing_date, auction_multi_item, for_auction, amount, amount_per_cycle, initial_payment_amount, next_payment_date, outstanding_balance, payment_cycle, period_type, product_name, product_type, profile_status, recurring_payment_id, rp_invoice_id, time_created, amount1, amount2, amount3, mc_amount1, mc_amount2, mc_amount3, password, period1, period2, period3, reattempt, recur_times, recurring, retry_at, subscr_date, subscr_effective, subscr_id, username, case_creation_date, case_id, case_type, receipt_id, currency_code, handling_amount, transaction_subject, ipaddress, flag, flag_code, flag_info, query, response, created_at, updated_at, from_view, mp_id, option_selection1, option_selection2) FROM stdin;
38	seller@paypalsandbox.com		xyz123	2.10		seller@paypalsandbox.com	seller@paypalsandbox.com	US	t	170530867	web_accept	AFcWxV21C7fd0v3bYYYRCpSSRl31AFVJlxHfpcX39yhonYveFaPSBWbO	United States	San Jose	US	John Smith	CA	confirmed	123 any street	95131		John	Smith		buyer@paypalsandbox.com	TESTBUYERID01	\N				\N	102	something	AK-1234	USD	0.44	12.34	\N	\N		\N			verified	2017-03-20 19:32:37.871217+01	\N	Completed	echeck			1		\N	\N		3.04		2.02			\N	\N	\N	\N	\N	\N	\N	\N								\N	\N	\N	\N	\N	\N	\N						\N		\N	\N	\N			\N					\N		\N	f			payment_type=echeck&payment_date=Mon%20Mar%2020%202017%2019%3A32%3A31%20GMT%2B0100%20%28CET%29&payment_status=Completed&address_status=confirmed&payer_status=verified&first_name=John&last_name=Smith&payer_email=buyer@paypalsandbox.com&payer_id=TESTBUYERID01&address_name=John%20Smith&address_country=United%20States&address_country_code=US&address_zip=95131&address_state=CA&address_city=San%20Jose&address_street=123%20any%20street&business=seller@paypalsandbox.com&receiver_email=seller@paypalsandbox.com&receiver_id=seller@paypalsandbox.com&residence_country=US&item_name=something&item_number=AK-1234&quantity=1&shipping=3.04&tax=2.02&mc_currency=USD&mc_fee=0.44&mc_gross=12.34&mc_gross_1=12.34&txn_type=web_accept&txn_id=170530867&notify_version=2.1&custom=xyz123&invoice=102&test_ipn=1&verify_sign=AFcWxV21C7fd0v3bYYYRCpSSRl31AFVJlxHfpcX39yhonYveFaPSBWbO	VERIFIED	2017-03-20 19:32:39.002304+01	2017-03-20 19:32:39.004656+01				
39	seller@paypalsandbox.com		xyz123	2.10		seller@paypalsandbox.com	seller@paypalsandbox.com	US	t	182457940	web_accept	AFcWxV21C7fd0v3bYYYRCpSSRl31AJ3XVYws7-n29HyhSdomMO4F146H	United States	San Jose	US	John Smith	CA	confirmed	123 any street	95131		John	Smith		buyer@paypalsandbox.com	TESTBUYERID01	\N				\N	103	something	AK-1234	USD	0.44	12.34	\N	\N		\N			verified	2017-03-20 19:51:47.760022+01	\N	Completed	echeck			1		\N	\N		3.04		2.02			\N	\N	\N	\N	\N	\N	\N	\N								\N	\N	\N	\N	\N	\N	\N						\N		\N	\N	\N			\N					\N		\N	f			payment_type=echeck&payment_date=Mon%20Mar%2020%202017%2019%3A51%3A42%20GMT%2B0100%20%28CET%29&payment_status=Completed&address_status=confirmed&payer_status=verified&first_name=John&last_name=Smith&payer_email=buyer@paypalsandbox.com&payer_id=TESTBUYERID01&address_name=John%20Smith&address_country=United%20States&address_country_code=US&address_zip=95131&address_state=CA&address_city=San%20Jose&address_street=123%20any%20street&business=seller@paypalsandbox.com&receiver_email=seller@paypalsandbox.com&receiver_id=seller@paypalsandbox.com&residence_country=US&item_name=something&item_number=AK-1234&quantity=1&shipping=3.04&tax=2.02&mc_currency=USD&mc_fee=0.44&mc_gross=12.34&mc_gross_1=12.34&txn_type=web_accept&txn_id=182457940&notify_version=2.1&custom=xyz123&invoice=103&test_ipn=1&verify_sign=AFcWxV21C7fd0v3bYYYRCpSSRl31AJ3XVYws7-n29HyhSdomMO4F146H	VERIFIED	2017-03-20 19:51:48.862355+01	2017-03-20 19:51:48.875262+01				
40	wailingtam105-facilitator@hotmail.com	windows-1252		3.80		wailingtam105-facilitator@hotmail.com	8GB7PGVFG3VQW	ES	t	6VP37739RB8253302	web_accept	A-X91d6dvj07IIDTUn5hM8p8w8LxAoII.l3fNMmtfLpv.FBUHqvjrFe3										test	buyer		wailingtam105-buyer@hotmail.com	6M6NFWFNAKXTL	\N				\N	93	La Fiambrera - Order #93		EUR	1.55	35.25	\N	\N		\N			verified	2017-03-20 20:07:56.227888+01	\N	Completed	instant		Ineligible	1		\N	\N		\N		\N			\N	\N	\N	\N	\N	\N	\N	\N								\N	\N	\N	\N	\N	\N	\N						\N		\N	\N	\N			\N					\N		\N	f			transaction_subject=&payment_date=08%3A03%3A56+Mar+20%2C+2017+PDT&txn_type=web_accept&last_name=buyer&residence_country=ES&item_name=La+Fiambrera+-+Order+%2393&payment_gross=&mc_currency=EUR&business=wailingtam105-facilitator%40hotmail.com&payment_type=instant&protection_eligibility=Ineligible&verify_sign=A-X91d6dvj07IIDTUn5hM8p8w8LxAoII.l3fNMmtfLpv.FBUHqvjrFe3&payer_status=verified&test_ipn=1&payer_email=wailingtam105-buyer%40hotmail.com&txn_id=6VP37739RB8253302&quantity=1&receiver_email=wailingtam105-facilitator%40hotmail.com&first_name=test&invoice=93&payer_id=6M6NFWFNAKXTL&receiver_id=8GB7PGVFG3VQW&item_number=&payment_status=Completed&payment_fee=&mc_fee=1.55&mc_gross=35.25&custom=&charset=windows-1252&notify_version=3.8&ipn_track_id=ba9916ae5a86	VERIFIED	2017-03-20 20:07:57.263184+01	2017-03-20 20:07:57.26567+01				
41	wailingtam105-facilitator@hotmail.com	windows-1252		3.80		wailingtam105-facilitator@hotmail.com	8GB7PGVFG3VQW	ES	t	5WV05372G2234752D	web_accept	AHUQcCfEx4qtQAyCmw6xGze3r2YaAeV5Gw37G0mIO51hKnI4MKPaqiYn										test	buyer		wailingtam105-buyer@hotmail.com	6M6NFWFNAKXTL	\N				\N	99	La Fiambrera - Order #99		EUR	1.69	39.35	\N	\N		\N			verified	2017-03-20 21:56:29.889131+01	\N	Completed	instant		Ineligible	1		\N	\N		\N		\N			\N	\N	\N	\N	\N	\N	\N	\N								\N	\N	\N	\N	\N	\N	\N						\N		\N	\N	\N			\N					\N		\N	f			transaction_subject=&payment_date=09%3A59%3A50+Mar+20%2C+2017+PDT&txn_type=web_accept&last_name=buyer&residence_country=ES&item_name=La+Fiambrera+-+Order+%2399&payment_gross=&mc_currency=EUR&business=wailingtam105-facilitator%40hotmail.com&payment_type=instant&protection_eligibility=Ineligible&verify_sign=AHUQcCfEx4qtQAyCmw6xGze3r2YaAeV5Gw37G0mIO51hKnI4MKPaqiYn&payer_status=verified&test_ipn=1&payer_email=wailingtam105-buyer%40hotmail.com&txn_id=5WV05372G2234752D&quantity=1&receiver_email=wailingtam105-facilitator%40hotmail.com&first_name=test&invoice=99&payer_id=6M6NFWFNAKXTL&receiver_id=8GB7PGVFG3VQW&item_number=&payment_status=Completed&payment_fee=&mc_fee=1.69&mc_gross=39.35&custom=&charset=windows-1252&notify_version=3.8&ipn_track_id=edf10cc92a93b	VERIFIED	2017-03-20 21:56:30.985291+01	2017-03-20 21:56:30.987676+01				
42	wailingtam105-facilitator@hotmail.com	windows-1252		3.80		wailingtam105-facilitator@hotmail.com	8GB7PGVFG3VQW	ES	t	55W71879Y1524660F	web_accept	AFFIASYBPB4TY3B2VIHX1thDFvcyAW2XEMoME5AaukxOXLqkuUSsEUCT										test	buyer		wailingtam105-buyer@hotmail.com	6M6NFWFNAKXTL	\N				\N	101	La Fiambrera - Order #101		EUR	1.02	19.68	\N	\N		\N			verified	2017-03-20 22:06:17.131504+01	\N	Completed	instant		Ineligible	1		\N	\N		\N		\N			\N	\N	\N	\N	\N	\N	\N	\N								\N	\N	\N	\N	\N	\N	\N						\N		\N	\N	\N			\N					\N		\N	f			transaction_subject=&payment_date=11%3A28%3A52+Mar+20%2C+2017+PDT&txn_type=web_accept&last_name=buyer&residence_country=ES&item_name=La+Fiambrera+-+Order+%23101&payment_gross=&mc_currency=EUR&business=wailingtam105-facilitator%40hotmail.com&payment_type=instant&protection_eligibility=Ineligible&verify_sign=AFFIASYBPB4TY3B2VIHX1thDFvcyAW2XEMoME5AaukxOXLqkuUSsEUCT&payer_status=verified&test_ipn=1&payer_email=wailingtam105-buyer%40hotmail.com&txn_id=55W71879Y1524660F&quantity=1&receiver_email=wailingtam105-facilitator%40hotmail.com&first_name=test&invoice=101&payer_id=6M6NFWFNAKXTL&receiver_id=8GB7PGVFG3VQW&item_number=&payment_status=Completed&payment_fee=&mc_fee=1.02&mc_gross=19.68&custom=&charset=windows-1252&notify_version=3.8&ipn_track_id=84c7ede366ff2	VERIFIED	2017-03-20 22:06:18.231909+01	2017-03-20 22:06:18.234166+01				
43	wailingtam105-facilitator@hotmail.com	windows-1252		3.80		wailingtam105-facilitator@hotmail.com	8GB7PGVFG3VQW	ES	t	6VP37739RB8253302	web_accept	A-X91d6dvj07IIDTUn5hM8p8w8LxAoII.l3fNMmtfLpv.FBUHqvjrFe3										test	buyer		wailingtam105-buyer@hotmail.com	6M6NFWFNAKXTL	\N				\N	93	La Fiambrera - Order #93		EUR	1.55	35.25	\N	\N		\N			verified	2017-03-20 22:11:40.227556+01	\N	Completed	instant		Ineligible	1		\N	\N		\N		\N			\N	\N	\N	\N	\N	\N	\N	\N								\N	\N	\N	\N	\N	\N	\N						\N		\N	\N	\N			\N					\N		\N	t		Duplicate txn_id. (6VP37739RB8253302)	transaction_subject=&payment_date=08%3A03%3A56+Mar+20%2C+2017+PDT&txn_type=web_accept&last_name=buyer&residence_country=ES&item_name=La+Fiambrera+-+Order+%2393&payment_gross=&mc_currency=EUR&business=wailingtam105-facilitator%40hotmail.com&payment_type=instant&protection_eligibility=Ineligible&verify_sign=A-X91d6dvj07IIDTUn5hM8p8w8LxAoII.l3fNMmtfLpv.FBUHqvjrFe3&payer_status=verified&test_ipn=1&payer_email=wailingtam105-buyer%40hotmail.com&txn_id=6VP37739RB8253302&quantity=1&receiver_email=wailingtam105-facilitator%40hotmail.com&first_name=test&invoice=93&payer_id=6M6NFWFNAKXTL&receiver_id=8GB7PGVFG3VQW&item_number=&payment_status=Completed&payment_fee=&mc_fee=1.55&mc_gross=35.25&custom=&charset=windows-1252&notify_version=3.8&ipn_track_id=ba9916ae5a86	VERIFIED	2017-03-20 22:11:41.289136+01	2017-03-20 22:11:41.304286+01				
44	wailingtam105-facilitator@hotmail.com	windows-1252		3.80		wailingtam105-facilitator@hotmail.com	8GB7PGVFG3VQW	ES	t	9Y048444AL701654L	web_accept	AREk5eRRQyB.Gz0vTvIVchZkkKiAAR9bosinp0a-l-WTgYyEgkt90xxu										test	buyer		wailingtam105-buyer@hotmail.com	6M6NFWFNAKXTL	\N				\N	98	La Fiambrera - Order #98		EUR	1.02	19.68	\N	\N		\N			verified	2017-03-20 22:26:28.19377+01	\N	Completed	instant		Ineligible	1		\N	\N		\N		\N			\N	\N	\N	\N	\N	\N	\N	\N								\N	\N	\N	\N	\N	\N	\N						\N		\N	\N	\N			\N					\N		\N	f			transaction_subject=&payment_date=09%3A56%3A36+Mar+20%2C+2017+PDT&txn_type=web_accept&last_name=buyer&residence_country=ES&item_name=La+Fiambrera+-+Order+%2398&payment_gross=&mc_currency=EUR&business=wailingtam105-facilitator%40hotmail.com&payment_type=instant&protection_eligibility=Ineligible&verify_sign=AREk5eRRQyB.Gz0vTvIVchZkkKiAAR9bosinp0a-l-WTgYyEgkt90xxu&payer_status=verified&test_ipn=1&payer_email=wailingtam105-buyer%40hotmail.com&txn_id=9Y048444AL701654L&quantity=1&receiver_email=wailingtam105-facilitator%40hotmail.com&first_name=test&invoice=98&payer_id=6M6NFWFNAKXTL&receiver_id=8GB7PGVFG3VQW&item_number=&payment_status=Completed&payment_fee=&mc_fee=1.02&mc_gross=19.68&custom=&charset=windows-1252&notify_version=3.8&ipn_track_id=5a323514d74c1	VERIFIED	2017-03-20 22:26:29.322808+01	2017-03-20 22:26:29.325136+01				
45	wailingtam105-facilitator@hotmail.com	windows-1252		3.80		wailingtam105-facilitator@hotmail.com	8GB7PGVFG3VQW	ES	t	59K05938BB503642Y	web_accept	AYm-UvofG9njKKDeEI8KzfvIh05IA1-xiq2MiDr36CBHR3xoCKlJ1GS3										test	buyer		wailingtam105-buyer@hotmail.com	6M6NFWFNAKXTL	\N				\N	102	La Fiambrera - Order #102		EUR	1.12	22.75	\N	\N		\N			verified	2017-03-20 22:35:59.332762+01	\N	Completed	instant		Ineligible	1		\N	\N		\N		\N			\N	\N	\N	\N	\N	\N	\N	\N								\N	\N	\N	\N	\N	\N	\N						\N		\N	\N	\N			\N					\N		\N	f			transaction_subject=&payment_date=11%3A32%3A07+Mar+20%2C+2017+PDT&txn_type=web_accept&last_name=buyer&residence_country=ES&item_name=La+Fiambrera+-+Order+%23102&payment_gross=&mc_currency=EUR&business=wailingtam105-facilitator%40hotmail.com&payment_type=instant&protection_eligibility=Ineligible&verify_sign=AYm-UvofG9njKKDeEI8KzfvIh05IA1-xiq2MiDr36CBHR3xoCKlJ1GS3&payer_status=verified&test_ipn=1&payer_email=wailingtam105-buyer%40hotmail.com&txn_id=59K05938BB503642Y&quantity=1&receiver_email=wailingtam105-facilitator%40hotmail.com&first_name=test&invoice=102&payer_id=6M6NFWFNAKXTL&receiver_id=8GB7PGVFG3VQW&item_number=&payment_status=Completed&payment_fee=&mc_fee=1.12&mc_gross=22.75&custom=&charset=windows-1252&notify_version=3.8&ipn_track_id=c756aa7734840	VERIFIED	2017-03-20 22:36:00.477555+01	2017-03-20 22:36:00.480271+01				
46	wailingtam105-facilitator@hotmail.com	windows-1252		3.80		wailingtam105-facilitator@hotmail.com	8GB7PGVFG3VQW	ES	t	2JA883939U9628930	web_accept	AWkT50gtrA0iXnh55b939tXXlAFYAu2PS5eAcv707qnjx2S3h3lW4hB3										test	buyer		wailingtam105-buyer@hotmail.com	6M6NFWFNAKXTL	\N				\N	103	La Fiambrera - Order #103		EUR	0.76	12.00	\N	\N		\N			verified	2017-03-20 22:38:22.714509+01	\N	Completed	instant		Ineligible	1		\N	\N		\N		\N			\N	\N	\N	\N	\N	\N	\N	\N								\N	\N	\N	\N	\N	\N	\N						\N		\N	\N	\N			\N					\N		\N	f			transaction_subject=&payment_date=11%3A49%3A49+Mar+20%2C+2017+PDT&txn_type=web_accept&last_name=buyer&residence_country=ES&item_name=La+Fiambrera+-+Order+%23103&payment_gross=&mc_currency=EUR&business=wailingtam105-facilitator%40hotmail.com&payment_type=instant&protection_eligibility=Ineligible&verify_sign=AWkT50gtrA0iXnh55b939tXXlAFYAu2PS5eAcv707qnjx2S3h3lW4hB3&payer_status=verified&test_ipn=1&payer_email=wailingtam105-buyer%40hotmail.com&txn_id=2JA883939U9628930&quantity=1&receiver_email=wailingtam105-facilitator%40hotmail.com&first_name=test&invoice=103&payer_id=6M6NFWFNAKXTL&receiver_id=8GB7PGVFG3VQW&item_number=&payment_status=Completed&payment_fee=&mc_fee=0.76&mc_gross=12.00&custom=&charset=windows-1252&notify_version=3.8&ipn_track_id=787132e693333	VERIFIED	2017-03-20 22:38:23.792309+01	2017-03-20 22:38:23.794559+01				
47	wailingtam105-facilitator@hotmail.com	windows-1252		3.80		wailingtam105-facilitator@hotmail.com	8GB7PGVFG3VQW	ES	t	9Y048444AL701654L	web_accept	AREk5eRRQyB.Gz0vTvIVchZkkKiAAR9bosinp0a-l-WTgYyEgkt90xxu										test	buyer		wailingtam105-buyer@hotmail.com	6M6NFWFNAKXTL	\N				\N	98	La Fiambrera - Order #98		EUR	1.02	19.68	\N	\N		\N			verified	2017-03-20 23:22:50.475214+01	\N	Completed	instant		Ineligible	1		\N	\N		\N		\N			\N	\N	\N	\N	\N	\N	\N	\N								\N	\N	\N	\N	\N	\N	\N						\N		\N	\N	\N			\N					\N		\N	t		Duplicate txn_id. (9Y048444AL701654L)	transaction_subject=&payment_date=09%3A56%3A36+Mar+20%2C+2017+PDT&txn_type=web_accept&last_name=buyer&residence_country=ES&item_name=La+Fiambrera+-+Order+%2398&payment_gross=&mc_currency=EUR&business=wailingtam105-facilitator%40hotmail.com&payment_type=instant&protection_eligibility=Ineligible&verify_sign=AREk5eRRQyB.Gz0vTvIVchZkkKiAAR9bosinp0a-l-WTgYyEgkt90xxu&payer_status=verified&test_ipn=1&payer_email=wailingtam105-buyer%40hotmail.com&txn_id=9Y048444AL701654L&quantity=1&receiver_email=wailingtam105-facilitator%40hotmail.com&first_name=test&invoice=98&payer_id=6M6NFWFNAKXTL&receiver_id=8GB7PGVFG3VQW&item_number=&payment_status=Completed&payment_fee=&mc_fee=1.02&mc_gross=19.68&custom=&charset=windows-1252&notify_version=3.8&ipn_track_id=5a323514d74c1	VERIFIED	2017-03-20 23:22:51.533939+01	2017-03-20 23:22:51.536259+01				
48	wailingtam105-facilitator@hotmail.com	windows-1252		3.80		wailingtam105-facilitator@hotmail.com	8GB7PGVFG3VQW	ES	t	5WV05372G2234752D	web_accept	AHUQcCfEx4qtQAyCmw6xGze3r2YaAeV5Gw37G0mIO51hKnI4MKPaqiYn										test	buyer		wailingtam105-buyer@hotmail.com	6M6NFWFNAKXTL	\N				\N	99	La Fiambrera - Order #99		EUR	1.69	39.35	\N	\N		\N			verified	2017-03-21 00:48:44.97134+01	\N	Completed	instant		Ineligible	1		\N	\N		\N		\N			\N	\N	\N	\N	\N	\N	\N	\N								\N	\N	\N	\N	\N	\N	\N						\N		\N	\N	\N			\N					\N		\N	t		Duplicate txn_id. (5WV05372G2234752D)	transaction_subject=&payment_date=09%3A59%3A50+Mar+20%2C+2017+PDT&txn_type=web_accept&last_name=buyer&residence_country=ES&item_name=La+Fiambrera+-+Order+%2399&payment_gross=&mc_currency=EUR&business=wailingtam105-facilitator%40hotmail.com&payment_type=instant&protection_eligibility=Ineligible&verify_sign=AHUQcCfEx4qtQAyCmw6xGze3r2YaAeV5Gw37G0mIO51hKnI4MKPaqiYn&payer_status=verified&test_ipn=1&payer_email=wailingtam105-buyer%40hotmail.com&txn_id=5WV05372G2234752D&quantity=1&receiver_email=wailingtam105-facilitator%40hotmail.com&first_name=test&invoice=99&payer_id=6M6NFWFNAKXTL&receiver_id=8GB7PGVFG3VQW&item_number=&payment_status=Completed&payment_fee=&mc_fee=1.69&mc_gross=39.35&custom=&charset=windows-1252&notify_version=3.8&ipn_track_id=edf10cc92a93b	VERIFIED	2017-03-21 00:48:46.132979+01	2017-03-21 00:48:46.135847+01				
49	wailingtam105-facilitator@hotmail.com	windows-1252		3.80		wailingtam105-facilitator@hotmail.com	8GB7PGVFG3VQW	ES	t	55W71879Y1524660F	web_accept	AFFIASYBPB4TY3B2VIHX1thDFvcyAW2XEMoME5AaukxOXLqkuUSsEUCT										test	buyer		wailingtam105-buyer@hotmail.com	6M6NFWFNAKXTL	\N				\N	101	La Fiambrera - Order #101		EUR	1.02	19.68	\N	\N		\N			verified	2017-03-21 02:05:26.517179+01	\N	Completed	instant		Ineligible	1		\N	\N		\N		\N			\N	\N	\N	\N	\N	\N	\N	\N								\N	\N	\N	\N	\N	\N	\N						\N		\N	\N	\N			\N					\N		\N	t		Duplicate txn_id. (55W71879Y1524660F)	transaction_subject=&payment_date=11%3A28%3A52+Mar+20%2C+2017+PDT&txn_type=web_accept&last_name=buyer&residence_country=ES&item_name=La+Fiambrera+-+Order+%23101&payment_gross=&mc_currency=EUR&business=wailingtam105-facilitator%40hotmail.com&payment_type=instant&protection_eligibility=Ineligible&verify_sign=AFFIASYBPB4TY3B2VIHX1thDFvcyAW2XEMoME5AaukxOXLqkuUSsEUCT&payer_status=verified&test_ipn=1&payer_email=wailingtam105-buyer%40hotmail.com&txn_id=55W71879Y1524660F&quantity=1&receiver_email=wailingtam105-facilitator%40hotmail.com&first_name=test&invoice=101&payer_id=6M6NFWFNAKXTL&receiver_id=8GB7PGVFG3VQW&item_number=&payment_status=Completed&payment_fee=&mc_fee=1.02&mc_gross=19.68&custom=&charset=windows-1252&notify_version=3.8&ipn_track_id=84c7ede366ff2	VERIFIED	2017-03-21 02:05:27.556197+01	2017-03-21 02:05:27.558593+01				
50	am@mohoparty.com	windows-1252		3.80		am@mohoparty.com	ZTQQZCQBSRRSL	ES	f	2WR60716TW202270F	web_accept	AnVZdAXaP2jTH5o0dsUv9XpQEl-UALPfolfIkU.3xhRSvdxQQhmw4GJ0										Wai Ling	Tam		wailingtam105@hotmail.com	UXPBG88F3PNKC	\N				\N	105	La Fiambrera - Order #105		EUR	0.05	0.05	\N	\N		\N			verified	2017-03-21 10:41:14.55001+01	\N	Completed	instant		Ineligible	1		\N	\N		\N		\N			\N	\N	\N	\N	\N	\N	\N	\N								\N	\N	\N	\N	\N	\N	\N						\N		\N	\N	\N			\N					\N		\N	f			transaction_subject=&payment_date=02%3A41%3A05+Mar+21%2C+2017+PDT&txn_type=web_accept&last_name=Tam&residence_country=ES&item_name=La+Fiambrera+-+Order+%23105&payment_gross=&mc_currency=EUR&business=am%40mohoparty.com&payment_type=instant&protection_eligibility=Ineligible&verify_sign=AnVZdAXaP2jTH5o0dsUv9XpQEl-UALPfolfIkU.3xhRSvdxQQhmw4GJ0&payer_status=verified&payer_email=wailingtam105%40hotmail.com&txn_id=2WR60716TW202270F&quantity=1&receiver_email=am%40mohoparty.com&first_name=Wai+Ling&invoice=105&payer_id=UXPBG88F3PNKC&receiver_id=ZTQQZCQBSRRSL&item_number=&payment_status=Completed&payment_fee=&mc_fee=0.05&mc_gross=0.05&custom=&charset=windows-1252&notify_version=3.8&ipn_track_id=d225f9465495d	VERIFIED	2017-03-21 10:41:15.673413+01	2017-03-21 10:41:15.675827+01				
\.


--
-- Name: paypal_ipn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('paypal_ipn_id_seq', 51, true);


--
-- Data for Name: sermepa_sermepaidtpv; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY sermepa_sermepaidtpv (id, idtpv) FROM stdin;
1	1000000001
2	1000000002
3	1000000003
4	1000000004
5	1000000005
6	1000000006
7	1000000007
8	1000000008
9	1000000009
10	1000000010
11	1000000011
12	1000000012
13	1000000052
14	1000000053
15	1000000054
16	1000000055
17	1000000056
18	1000000057
19	1000000058
20	1000000059
21	1000000060
22	1000000061
23	1000000062
24	1000000063
25	1000000064
26	1000000065
27	1000000066
28	1000000067
29	1000000068
30	1000000069
31	1000000070
32	1000000071
33	1000000072
34	1000000073
35	1000000074
36	1000000075
37	1000000076
38	1000000077
39	1000000078
40	1000000079
41	1000000080
42	1000000081
43	1000000082
44	1000000083
45	1000000084
46	1000000085
47	1000000086
48	1000000087
49	1000000187
50	1000000188
51	1000000189
52	1000000190
53	1000000191
54	1000000192
55	1000000193
56	1000000194
57	1000000195
58	1000000196
59	1000000197
60	1000000198
61	1000000199
62	1000000200
63	1000000201
64	1000000202
65	1000000203
66	1000000204
67	1000000205
68	1000000206
69	1000000207
70	1000000208
71	1000000209
72	1000000210
73	1000000211
74	1000000212
75	1000000213
76	1000000214
77	1000000215
78	1000000216
79	1000000217
80	1000000218
81	1000000219
82	1000000220
83	1000000221
84	1000000222
85	1000000223
86	1000000224
87	1000000225
88	1000000226
89	1000000227
90	1000000228
91	1000000229
92	1000000230
93	1000000231
94	1000000232
95	1000000233
96	1000000234
97	1000000235
98	1000000236
99	1000000237
100	1000000238
101	1000000239
102	1000000240
103	1000000241
104	1000000242
105	1000000243
106	1000000244
107	1000000245
108	1000000246
109	1000000247
110	1000000248
111	1000000249
112	1000000250
113	1000000251
114	1000000252
115	1000000253
116	1000000254
117	1000000255
118	1000000256
119	1000000257
120	1000000258
121	1000000259
123	1000000260
124	1000000261
125	1000000262
126	1000000263
127	1000000264
128	1000000265
129	1000000266
130	1000000267
131	1000000268
132	1000000269
133	1000000270
134	1000000271
135	1000000272
136	1000000273
137	1000000274
138	1000000275
139	1000000276
140	1000000277
141	1000000278
142	1000000279
143	1000000280
144	1000000281
145	1000000282
146	1000000283
147	1000000284
148	1000000285
149	1000000286
150	1000000287
151	1000000288
152	1000000289
153	1000000290
154	1000000291
155	1000000292
156	1000000293
157	1000000294
158	1000000295
159	1000000296
160	1000000297
161	1000000298
162	1000000299
163	1000000300
164	1000000301
165	1000000302
166	1000000303
167	1000000304
168	1000000305
169	1000000306
170	1000000307
171	1000000308
172	1000000309
173	1000000310
174	1000000311
175	1000000312
176	1000000313
177	1000000314
178	1000000315
179	1000000316
180	1000000317
181	1000000318
182	1000000319
183	1000000320
184	1000000321
185	1000000322
186	1000000323
187	1000000324
188	1000000325
189	1000000326
190	1000000327
191	1000000328
192	1000000329
193	1000000330
194	1000000331
195	1000000332
196	1000000333
197	1000000334
198	1000000335
199	1000000336
200	1000000337
201	1000000338
202	1000000339
203	1000000340
204	1000000341
205	1000000342
206	1000000343
\.


--
-- Name: sermepa_sermepaidtpv_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('sermepa_sermepaidtpv_id_seq', 206, true);


--
-- Data for Name: sermepa_sermeparesponse; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY sermepa_sermeparesponse (id, creation_date, "Ds_Date", "Ds_Hour", "Ds_SecurePayment", "Ds_MerchantData", "Ds_Card_Country", "Ds_Card_Type", "Ds_Terminal", "Ds_MerchantCode", "Ds_ConsumerLanguage", "Ds_Response", "Ds_Order", "Ds_Currency", "Ds_Amount", "Ds_Signature", "Ds_AuthorisationCode", "Ds_TransactionType", "Ds_Merchant_Identifier", "Ds_ExpiryDate", "Ds_Merchant_Group", "Ds_Card_Number") FROM stdin;
1	2017-03-13 16:30:03.625744+01	2017-03-13	16:30:00	1		724	\N	1	335992137	1	0000	1000000061	978	1025		967734	0	\N	\N	\N	\N
2	2017-03-13 16:33:07.040683+01	2017-03-13	16:33:00	1		724	\N	1	335992137	1	0000	1000000062	978	1025		967741	0	\N	\N	\N	\N
3	2017-03-13 16:35:47.500933+01	2017-03-13	16:35:00	1		724	\N	1	335992137	1	0000	1000000063	978	1025		967748	0	\N	\N	\N	\N
4	2017-03-13 16:36:49.442656+01	2017-03-13	16:36:00	1		724	\N	1	335992137	1	0000	1000000064	978	1025		967750	0	\N	\N	\N	\N
5	2017-03-13 16:38:24.594051+01	2017-03-13	16:38:00	1		724	\N	1	335992137	1	0000	1000000065	978	1025		967755	0	\N	\N	\N	\N
6	2017-03-13 16:40:14.161976+01	2017-03-13	16:40:00	1		724	\N	1	335992137	1	0000	1000000066	978	1025		967764	0	\N	\N	\N	\N
7	2017-03-13 16:44:46.555647+01	2017-03-13	16:44:00	1		724	\N	1	335992137	1	0000	1000000067	978	1025		967776	0	\N	\N	\N	\N
8	2017-03-13 16:52:49.887905+01	2017-03-13	16:52:00	1		724	\N	1	335992137	1	0000	1000000068	978	1025		967788	0	\N	\N	\N	\N
9	2017-03-13 16:57:18.537497+01	2017-03-13	16:57:00	1		724	\N	1	335992137	1	0000	1000000069	978	1025		967793	0	\N	\N	\N	\N
10	2017-03-13 17:12:15.975865+01	2017-03-13	17:12:00	1		724	\N	1	335992137	1	0000	1000000071	978	1025		967816	0	\N	\N	\N	\N
11	2017-03-13 17:14:09.422505+01	2017-03-13	17:14:00	1		724	\N	1	335992137	1	0000	1000000072	978	1025		967823	0	\N	\N	\N	\N
12	2017-03-13 17:23:21.114777+01	2017-03-13	17:23:00	1		724	\N	1	335992137	1	0000	1000000073	978	1025		967842	0	\N	\N	\N	\N
13	2017-03-13 17:31:13.995439+01	2017-03-13	17:31:00	1	39cc3f45-9ab3-4e2a-b09b-86b15f04f413	724	\N	1	335992137	1	0000	1000000074	978	1025		967849	0	\N	\N	\N	\N
14	2017-03-13 17:34:02.344362+01	2017-03-13	17:34:00	1	d50cbec3-39fb-48b0-a1b4-beba9786c4f7	724	\N	1	335992137	1	0000	1000000075	978	1025		967853	0	\N	\N	\N	\N
15	2017-03-13 17:35:44.407594+01	2017-03-13	17:35:00	1	a226f339-95af-48e9-98a9-b20a1012af86	724	\N	1	335992137	1	0000	1000000076	978	1025		967854	0	\N	\N	\N	\N
16	2017-03-13 18:13:44.086942+01	2017-03-13	18:13:00	1	44784049-f6d3-4d1a-9b9e-1086cf89a828	724	\N	1	335992137	1	0000	1000000084	978	922		967895	0	\N	\N	\N	\N
17	2017-03-13 19:06:32.960476+01	2017-03-13	19:06:00	1	bf2e0bd4-0a71-4af7-8c61-bb6c15ce2590	724	\N	1	335992137	1	0000	1000000087	978	2152		967930	0	\N	\N	\N	\N
18	2017-03-16 12:29:54.916382+01	2017-03-16	12:29:00	1	00e0ebf2-73d6-4e25-b4e0-37c14ca00e3c	724	\N	1	335992137	1	0000	1000000188	978	1968		228860	0	\N	\N	\N	\N
19	2017-03-20 15:36:44.390117+01	2017-03-20	15:36:00	1	16d0ef76-15b5-4070-a2f5-4ef26c2d0eb9	724	\N	1	335992137	1	0000	1000000189	978	3750		570180	0	\N	\N	\N	\N
20	2017-03-20 15:52:02.990001+01	2017-03-20	15:52:00	1	3f10071f-744a-4a32-b745-1799d128a585	724	\N	1	335992137	1	0000	1000000190	978	6250		570188	0	\N	\N	\N	\N
21	2017-03-20 16:05:24.499982+01	2017-03-20	16:05:00	1	aec81c80-be8a-447d-b018-6ebe935025a1	724	\N	1	335992137	1	0000	1000000191	978	4345		570203	0	\N	\N	\N	\N
22	2017-03-20 17:38:03.302852+01	2017-03-20	17:38:00	1	9206b071-b53b-48cf-b8d6-2dbec2cead99	724	\N	1	335992137	1	0000	1000000192	978	5390		570290	0	\N	\N	\N	\N
23	2017-03-20 18:30:57.5264+01	2017-03-20	18:30:00	1	8b0c983f-62b5-47ba-b8d4-07aeeddc1def	724	\N	1	335992137	1	0000	1000000193	978	3935		570343	0	\N	\N	\N	\N
24	2017-03-20 19:52:39.725202+01	2017-03-20	19:52:00	1	5797a965-ef7a-41d1-9a7d-d3aa04c3865a	724	\N	1	335992137	1	0000	1000000194	978	1200		570478	0	\N	\N	\N	\N
25	2017-03-21 18:04:18.83974+01	2017-03-21	18:04:00	1	7cf9d36e-4897-41a9-bb1d-1d9fd9ceee3a	724	\N	1	335992137	1	0000	1000000196	978	1000		792964	0	\N	\N	\N	\N
26	2017-03-21 18:04:42.689669+01	2017-03-21	18:04:00	0	3a7ad1dd-42d3-4088-80cb-c49dbf6a2b49	0	\N	1	335992137	1	0180	1000000197	978	1000		++++++	0	\N	\N	\N	\N
27	2017-03-21 18:07:49.852889+01	2017-03-21	18:07:00	0	8879b72f-ed31-4819-86a3-f5968a5cbc7b	\N	\N	1	335992137	1	9915	1000000198	978	26000		++++++	0	\N	\N	\N	\N
28	2017-03-29 10:06:12.689621+02	2017-03-29	10:06:00	0	44bbbbaa-71c0-4cc4-8a7a-801b1788da57	\N	\N	1	335992137	1	9915	1000000204	978	16500		++++++	0	\N	\N	\N	\N
29	2017-04-03 00:32:41.888866+02	2017-04-03	00:32:00	0	04a58380-5c56-4120-b4d7-6bd9ab4441ca	\N	\N	1	335992137	1	9915	1000000210	978	1500		++++++	0	\N	\N	\N	\N
30	2017-04-21 10:47:37.583784+02	2017-04-21	10:47:00	0	de6ae1df-70f9-41c0-b889-6ca74240fa08	\N	\N	1	335992137	1	9915	1000000227	978	1350		++++++	0	\N	\N	\N	\N
31	2017-04-25 10:04:23.91834+02	2017-04-25	10:04:00	0	10317eb2-45d8-4568-86ff-4b5ed47ce99a	\N	\N	1	335992137	1	9915	1000000241	978	3920		++++++	0	\N	\N	\N	\N
32	2017-04-25 10:09:24.559239+02	2017-04-25	10:09:00	0	5d4e84ad-2a5d-4492-a889-4b294eef062a	\N	\N	1	335992137	1	9915	1000000242	978	12150		++++++	0	\N	\N	\N	\N
33	2017-05-10 15:58:29.52796+02	2017-05-10	15:58:00	0	398d0744-4f63-4e88-98fc-7ae7071e2fdf	\N	\N	1	335992137	1	9915	1000000253	978	1500		++++++	0	\N	\N	\N	\N
35	2017-09-19 06:00:21.637876+02	2017-09-19	06:00:00	1	d503cb4f-570d-46e7-b872-66f21282cadd	724	\N	1	335992137	1	0000	1000000280	978	22		439493	0	\N	\N	\N	\N
36	2017-09-19 06:03:36.060138+02	2017-09-19	06:03:00	1	165f0447-2a86-4dbc-a4f6-514d32cff22f	724	\N	1	335992137	1	0000	1000000281	978	11		044557	0	\N	\N	\N	\N
37	2017-09-19 06:33:13.741312+02	2017-09-19	06:33:00	1	117ac62f-84bd-4bf2-b8bd-c8c6b3264412	724	\N	1	335992137	1	0000	1000000282	978	11		439499	0	\N	\N	\N	\N
38	2017-09-19 08:06:29.959251+02	2017-09-19	08:06:00	1	64bc810b-e3bc-4743-a554-e7d2e1b25212	724	\N	1	335992137	1	0000	1000000283	978	22		439519	0	\N	\N	\N	\N
39	2017-09-19 09:11:45.261244+02	2017-09-19	09:11:00	0	fc76d778-a5c0-49c5-bece-6d65bfd2c8c1	0	\N	1	335992137	1	0180	1000000284	978	143		++++++	0	\N	\N	\N	\N
40	2017-09-21 07:27:28.706858+02	2017-09-21	07:27:00	1	2e5e3441-1128-4b21-891e-e3a0786b2d6d	724	\N	1	335992137	1	0000	1000000285	978	90		441879	0	\N	\N	\N	\N
41	2017-09-22 06:15:01.217901+02	2017-09-22	06:15:00	1	5a760af4-dff3-447f-8d44-5bdabf19f793	724	\N	1	335992137	1	0000	1000000287	978	11		048148	0	\N	\N	\N	\N
42	2017-09-22 06:16:47.635425+02	2017-09-22	06:16:00	0	193d6e2a-afcd-4693-abc2-d1db2d6682d2	\N	\N	1	335992137	1	9915	1000000288	978	329		++++++	0	\N	\N	\N	\N
43	2017-09-22 06:30:27.903619+02	2017-09-22	06:30:00	0	ed820e42-8a4a-4692-a062-28fc66791c57	\N	\N	1	335992137	1	9915	1000000291	978	329		++++++	0	\N	\N	\N	\N
44	2017-09-22 09:34:10.715262+02	2017-09-22	09:34:00	1	4d5a5cc3-6f0d-468e-85cd-11832bd2c01e	724	\N	1	335992137	1	0000	1000000292	978	25		443174	0	\N	\N	\N	\N
45	2017-09-23 07:19:27.457622+02	2017-09-23	07:19:00	1	a7171163-2ca3-407f-a64a-4ee29a93a093	724	\N	1	335992137	1	0000	1000000295	978	37824		049256	0	\N	\N	\N	\N
46	2017-09-23 08:08:04.621658+02	2017-09-23	08:08:00	0	2636f7e0-7ab8-4216-ba33-b86559d9661a	\N	\N	1	335992137	1	9915	1000000298	978	9560		++++++	0	\N	\N	\N	\N
47	2017-09-23 08:16:29.658683+02	2017-09-23	08:16:00	1	b7cb4fc1-c5e6-4bea-a506-06b80c2719f3	724	\N	1	335992137	1	0000	1000000299	978	9560		444170	0	\N	\N	\N	\N
48	2017-09-23 11:13:41.090005+02	2017-09-23	11:13:00	1	204fe8f2-2831-422e-b677-142de2cbf2ce	724	\N	1	335992137	1	0000	1000000303	978	8145		444225	0	\N	\N	\N	\N
49	2017-09-23 11:18:55.942493+02	2017-09-23	11:18:00	0	1b8512d3-3445-494f-8984-8965f38df3dc	\N	\N	1	335992137	1	9915	1000000305	978	7000		++++++	0	\N	\N	\N	\N
50	2017-09-23 11:55:25.207226+02	2017-09-23	11:55:00	1	3b61d9b7-1aa5-41cb-ba59-5c1a0bf2e30b	724	\N	1	335992137	1	0000	1000000314	978	452500		049336	0	\N	\N	\N	\N
51	2017-09-23 12:21:13.577748+02	2017-09-23	12:21:00	1	215bd468-8ec1-4930-be44-0440a64eaa05	724	\N	1	335992137	1	0000	1000000316	978	2200		049350	0	\N	\N	\N	\N
52	2017-09-23 12:23:34.771927+02	2017-09-23	12:23:00	1	92117324-536a-420a-a77b-cbaba0a8286a	724	\N	1	335992137	1	0000	1000000317	978	65500		444251	0	\N	\N	\N	\N
53	2017-09-25 10:59:07.842534+02	2017-09-25	10:59:00	1	94bfea57-a0d0-4999-b710-a49fd626443c	724	\N	1	335992137	1	0000	1000000321	978	500000		445144	0	\N	\N	\N	\N
54	2017-09-25 11:16:48.843085+02	2017-09-25	11:16:00	1	6912ad69-2cc9-41d6-90da-8fcf969eaa49	724	\N	1	335992137	1	0000	1000000322	978	1222500		050305	0	\N	\N	\N	\N
55	2017-09-25 11:22:52.938031+02	2017-09-25	11:22:00	1	63359a0a-6d16-41f1-ae89-b9160e151dea	724	\N	1	335992137	1	0000	1000000323	978	2300		050315	0	\N	\N	\N	\N
56	2017-09-25 11:35:37.41456+02	2017-09-25	11:35:00	1	23fc640b-e256-4ce2-b60e-29434072c027	724	\N	1	335992137	1	0000	1000000324	978	222300		050336	0	\N	\N	\N	\N
57	2017-09-25 11:46:10.505529+02	2017-09-25	11:46:00	1	1219255a-d01d-4b86-8989-e0adeda67155	724	\N	1	335992137	1	0000	1000000325	978	2000		050355	0	\N	\N	\N	\N
58	2017-09-25 12:15:26.392433+02	2017-09-25	12:15:00	1	753aeb4c-a912-4d24-8be7-c5e2af685648	724	\N	1	335992137	1	0000	1000000326	978	44400		050425	0	\N	\N	\N	\N
59	2017-09-26 06:23:32.788381+02	2017-09-26	06:23:00	1	016ef2f9-fd3f-40e9-a342-bc6b75a544a7	724	\N	1	335992137	1	0000	1000000328	978	7259		555615	0	\N	\N	\N	\N
60	2017-09-26 07:10:46.002719+02	2017-09-26	07:10:00	1	5e88a24a-b892-42dc-95ee-170279e3a445	724	\N	1	335992137	1	0000	1000000331	978	1350000		555632	0	\N	\N	\N	\N
61	2017-09-26 07:27:25.583783+02	2017-09-26	07:27:00	1	03a47652-018b-434c-bcc4-32890e84ebb3	724	\N	1	335992137	1	0000	1000000332	978	38592		555638	0	\N	\N	\N	\N
62	2017-09-26 07:38:23.572856+02	2017-09-26	07:38:00	1	1ecff50d-06ee-4d74-bc19-27d50453f10d	724	\N	1	335992137	1	0000	1000000333	978	15015		555642	0	\N	\N	\N	\N
63	2017-09-26 07:47:20.065221+02	2017-09-26	07:47:00	1	6d18b305-9392-4aca-8dd0-b0743500221a	724	\N	1	335992137	1	0000	1000000334	978	1222500		555646	0	\N	\N	\N	\N
64	2017-09-26 11:21:47.265106+02	2017-09-26	11:21:00	1	a9497893-e6e3-43ed-9b82-45b6c25d01fe	724	\N	1	335992137	1	0000	1000000337	978	40000		646673	0	\N	\N	\N	\N
65	2017-10-03 07:51:53.949824+02	2017-10-03	07:51:00	1	41fa4041-6782-4098-abbc-d342ac80880c	724	\N	1	335992137	1	0000	1000000340	978	30000		653180	0	\N	\N	\N	\N
66	2017-10-03 10:53:30.169022+02	2017-10-03	10:53:00	1	7ad70153-6e6f-4776-82a5-61aa95c55624	724	\N	1	335992137	1	0000	1000000341	978	500		653375	0	\N	\N	\N	\N
67	2017-10-09 17:53:56.299203+02	2017-10-09	17:53:00	1	7cefa86f-01a8-42d1-8ca2-c1cb25189de3	724	\N	1	335992137	1	0000	1000000342	978	11000		818555	0	\N	\N	\N	\N
\.


--
-- Name: sermepa_sermeparesponse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('sermepa_sermeparesponse_id_seq', 67, true);


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('social_auth_association_id_seq', 1, false);


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY social_auth_code (id, email, code, verified) FROM stdin;
\.


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('social_auth_code_id_seq', 1, false);


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('social_auth_nonce_id_seq', 1, false);


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY social_auth_partial (id, token, next_step, backend, data) FROM stdin;
\.


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('social_auth_partial_id_seq', 1, false);


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY social_auth_usersocialauth (id, provider, uid, extra_data, user_id) FROM stdin;
\.


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('social_auth_usersocialauth_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
149	linkedin	fb16bJY_Fm	2017-10-03 07:49:39.274474+02	2017-10-03 07:49:39.274495+02	{"email-address": "testeresfera@gmail.com", "last-name": "rana", "picture-urls": {"picture-url": "https://media.licdn.com/mpr/mprx/0_CzlvY2mtFFXJ1Yh36TyUZS7K3LRMzy236Tf4ZDKyulsslgY7kLrMVIrx1jv"}, "public-profile-url": "https://www.linkedin.com/in/amit-rana-8a592497", "picture-url": "https://media.licdn.com/mpr/mprx/0_-FJjC-puMxQYZhbcyiwCClYiJyA14_Bcy_DCClpr6MLGFF8BY3dA2AeOc-lDUknR1XRiS9GIqpIB", "first-name": "amit", "id": "fb16bJY_Fm"}	593
145	facebook	10155083792489926	2017-10-26 14:57:33.626994+02	2017-09-21 15:01:48.399488+02	{"first_name": "Hannah", "last_name": "Collins", "verified": true, "name": "Hannah Collins", "locale": "en_US", "gender": "female", "email": "hannahmc01@hotmail.com", "link": "https://www.facebook.com/app_scoped_user_id/10155083792489926/", "timezone": 2, "updated_time": "2017-08-19T20:25:42+0000", "id": "10155083792489926"}	557
\.


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('socialaccount_socialaccount_id_seq', 149, true);


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
2	facebook	Facebook	1516101881785539	924aa19065d386893c6695407524651e	
1	linkedin	LinkedIn	81igtru91iqr3h	DSf5J2yD677XTY4t	
\.


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('socialaccount_socialapp_id_seq', 3, true);


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
1	1	1
2	2	1
\.


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('socialaccount_socialapp_sites_id_seq', 3, true);


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
151	fd65289f-6376-4aec-a7bc-48fee56408a6	8455c398-99ba-4367-a979-320ce9aea342	\N	149	1
147	EAAVi4vobbMMBAErYX7ACvhAsJjKDRwpD9OtvoArZCX5JDU35hdT1UgBty6mqijqKtTOHZA7bEiw3dWkSESMens798JWzxaZASls0uqK7ZCVBZBY2ieSNF0K4yeY1u9V6lZACSc3rgX6BUu6Fsnzs9JuXkw8bXEFwAJYgGBZC94WBQZDZD		2017-12-25 13:57:33.526162+01	145	2
\.


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('socialaccount_socialtoken_id_seq', 151, true);


--
-- Data for Name: userprofiles_activation; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY userprofiles_activation (id, email, key, date, user_id) FROM stdin;
\.


--
-- Name: userprofiles_activation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('userprofiles_activation_id_seq', 38, true);


--
-- Data for Name: userprofiles_adminnotification; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY userprofiles_adminnotification (id, archived, priority, lunchbox_id, restaurant_id) FROM stdin;
88	f	4	100	\N
\.


--
-- Name: userprofiles_adminnotification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('userprofiles_adminnotification_id_seq', 88, true);


--
-- Data for Name: userprofiles_checkoutpromocode; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY userprofiles_checkoutpromocode (id, promo_code, percent, qty, date_from, date_till) FROM stdin;
3	CWS0517	30	500	2017-04-20	2017-05-31
4	TEST2517	30	20	2017-04-25	2017-05-31
6	TEST2100	100	20	2017-04-26	2017-05-31
7	TEST3100	100	20	2017-04-28	2017-05-31
5	TEST100	100	20	2017-04-26	2017-05-31
9	DICOM1105	40	100	2017-05-11	2017-06-30
11	TESTPROMO321	15	10	2017-08-23	2017-08-29
13	TESTPROMO321	15	10	2017-08-23	2017-08-31
14	TESTPROMO322	15	10	2017-08-23	2017-08-30
15	TESTPROMO324	10	10	2017-08-23	2017-09-09
16	TESTPROMO325	10	5	2017-08-23	2017-09-10
17	TESTPROMO326	10	5	2017-08-23	2017-08-31
18	TESTPROMO327	10	5	2017-08-23	2017-08-31
19	MYPROMO313	10	10	2017-08-23	2017-08-31
20	MYPROMO334	10	5	2017-08-23	2017-09-23
21	MyPromo123	10	5	2017-08-24	2017-09-24
22	Mypromo111	10	5	2017-08-24	2017-09-22
23	mypromo112	10	5	2017-08-24	2017-08-31
24	MYPROMO567	10	5	2017-08-24	2017-08-31
25	mypromo999	10	5	2017-08-26	2017-09-30
26	mypromo991	10	5	2017-08-26	2017-09-30
27	mypromo100	10	5	2017-08-23	2017-09-29
28	mypromo101	10	5	2017-08-17	2017-09-30
29	mypromo102	10	5	2017-08-15	2017-09-30
10	THANKYOU1105	40	70	2017-05-11	2017-08-31
8	FBCOMP0905	100	1	2017-08-28	2017-08-31
30	mypromo330	10	5	2017-09-01	2017-09-30
31	mypromo222	10	5	2017-09-01	2017-09-30
32	mypromo223	10	5	2017-09-10	2017-10-28
33	mypromo500	10	5	2017-09-26	2017-10-28
34	mypromo99	10	5	2017-10-03	2017-10-31
\.


--
-- Name: userprofiles_checkoutpromocode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('userprofiles_checkoutpromocode_id_seq', 34, true);


--
-- Data for Name: userprofiles_checkoutpromocode_used_by; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY userprofiles_checkoutpromocode_used_by (id, checkoutpromocode_id, user_id) FROM stdin;
8	31	557
\.


--
-- Name: userprofiles_checkoutpromocode_used_by_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('userprofiles_checkoutpromocode_used_by_id_seq', 8, true);


--
-- Data for Name: userprofiles_city; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY userprofiles_city (id, name) FROM stdin;
1	Barcelona
\.


--
-- Name: userprofiles_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('userprofiles_city_id_seq', 3, true);


--
-- Data for Name: userprofiles_customer; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY userprofiles_customer (id, name, address, street, city, state, zip_code, country, user_id, building_num, door_num) FROM stdin;
133	Bandna Thakur	barcelona	yg76htyuty	Barcelona	punjab	iuiiuyiuyo	Spain	585	yg76htyuty	56yuytiyti
135	Aman Thakur	mohali 45	76qw	Barcelona	punjab	tyu7896755	Spain	591	76qw	56uiop
132	Raj Sharma	Mohali Stadium Road, Sector 55, Phase 1, Sahibzada Ajit Singh Nagar, Chandigarh, India	78	Mohali fdvfd	Ch	160055	Spain	584	78	25
136	Amit Rana	Chandigarh Bus Terminus, ISBT Road, 17G, 17F, Chandigarh, India	78	Chandigarh	CH	160017	India	593	78	45
134	Poonam Thakur	Mohali Stadium Road, Sector 60, Sahibzada Ajit Singh Nagar, Punjab, India	45	Sahibzada Ajit Singh Nagar	punjab	576868	Spain	589	45	23
71	Hannah Collins	Carrer del Perill, 32, Barcelona, Spain	32	Barcelona	CT	08012	Spain	412	32	
137	cristina  muoz	calle de diputacion 	337	barcelona		08007	Spain	599	337	
124	Hannah Collins	Carrer del Perill, 32, Barcelona, Spain	32	Barcelona	CT	08012	Spain	557	32	
\.


--
-- Name: userprofiles_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('userprofiles_customer_id_seq', 137, true);


--
-- Data for Name: userprofiles_lunchbox; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY userprofiles_lunchbox (id, name, "desc", price, available_from, available_till, protein, carbohydrates, fat, sugar, sodium, published, photoshoot_requested, publishing_requested, date, rate, restaurant_id, category_id, desc_en, desc_es, vat) FROM stdin;
98	Kadai Paneer		100	2017-10-03	2017-12-30	23	89	55	66	3.70000000000000018	f	f	f	2017-10-03 08:25:53.134044+02	90.00	76	5			10
99	Pizza		100	2017-10-03	2017-11-25	4.79999999999999982	4.29999999999999982	34	34	2.29999999999999982	f	f	f	2017-10-27 08:50:45.796106+02	100.00	76	3		<p>hgfjhg&nbsp;hghfg&nbsp;gghfg&nbsp;gjhg&nbsp;gjfhg&nbsp;gbfg&nbsp;gjhbghgfhgfh&nbsp;fhgfj&nbsp;gjdfhgdf&nbsp;gjghdfg&nbsp;g</p>\r\n	10
100	Moho munchies	<p>This&nbsp;lunchbox&nbsp;is&nbsp;truly&nbsp;delicious!</p>\r\n	12	2017-05-25	2017-12-30	8	50	10	12	2	t	t	t	2017-10-27 12:17:00.608036+02	9.00	50	4	<p>This&nbsp;lunchbox&nbsp;is&nbsp;truly&nbsp;delicious!</p>\r\n	<p>Esta&nbsp;Fiambrera&nbsp;es&nbsp;muy&nbsp;bueno!</p>\r\n	10
\.


--
-- Name: userprofiles_lunchbox_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('userprofiles_lunchbox_id_seq', 100, true);


--
-- Data for Name: userprofiles_lunchboxadminmessage; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY userprofiles_lunchboxadminmessage (id, msg, inc, watched, priority, date, lunchbox_id, user_id) FROM stdin;
\.


--
-- Name: userprofiles_lunchboxadminmessage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('userprofiles_lunchboxadminmessage_id_seq', 7, true);


--
-- Data for Name: userprofiles_lunchboxdiscount; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY userprofiles_lunchboxdiscount (id, percent, qty, lunchbox_id) FROM stdin;
438	5	10	98
439	10	20	98
440	15	30	98
444	20	20	99
445	5	5	99
446	10	10	99
447	10	10	100
448	15	15	100
449	20	20	100
\.


--
-- Name: userprofiles_lunchboxdiscount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('userprofiles_lunchboxdiscount_id_seq', 449, true);


--
-- Data for Name: userprofiles_lunchboxfeedback; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY userprofiles_lunchboxfeedback (id, msg, inc, watched, datetime, priority, lunchbox_id, restaurant_id, user_id) FROM stdin;
42	hello everyone nice dish	t	t	2017-10-03 08:45:48.202644+02	4	99	76	585
43	thank u so much	f	f	2017-10-03 08:51:56.67523+02	4	99	76	585
\.


--
-- Name: userprofiles_lunchboxfeedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('userprofiles_lunchboxfeedback_id_seq', 43, true);


--
-- Data for Name: userprofiles_lunchboximage; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY userprofiles_lunchboximage (id, image, lunchbox_id) FROM stdin;
147	f.jpg	98
148	g.JPG	98
149	f_QINuejg.jpg	98
150	f_f36FP5b.jpg	98
151	g_VGijZjh.JPG	98
152	j.jpg	99
153	k.jpg	99
154	l.jpg	99
155	l_HXIFbEm.jpg	99
156	k_ZkwptyM.jpg	99
157	Moho_All_Bottles_Final.jpg	100
158	Moho_On_Ice_2.0.jpg	100
159	Moho_On_Ice.jpg	100
\.


--
-- Name: userprofiles_lunchboximage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('userprofiles_lunchboximage_id_seq', 159, true);


--
-- Data for Name: userprofiles_lunchboxprivileges; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY userprofiles_lunchboxprivileges (id, title, image) FROM stdin;
3	test	red-planet-snow-fantasy-stars-night-stones-4k-moon-mountains-HD.jpg
\.


--
-- Name: userprofiles_lunchboxprivileges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('userprofiles_lunchboxprivileges_id_seq', 3, true);


--
-- Data for Name: userprofiles_lunchboxprivilegesitem; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY userprofiles_lunchboxprivilegesitem (id, lunchbox_id, privilege_id) FROM stdin;
\.


--
-- Name: userprofiles_lunchboxprivilegesitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('userprofiles_lunchboxprivilegesitem_id_seq', 1, false);


--
-- Data for Name: userprofiles_lunchboxrating; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY userprofiles_lunchboxrating (id, rating, lunchbox_id, user_id) FROM stdin;
\.


--
-- Name: userprofiles_lunchboxrating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('userprofiles_lunchboxrating_id_seq', 3, true);


--
-- Data for Name: userprofiles_lunchboxrequest; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY userprofiles_lunchboxrequest (id, lunchbox_id, user_id) FROM stdin;
\.


--
-- Name: userprofiles_lunchboxrequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('userprofiles_lunchboxrequest_id_seq', 1, false);


--
-- Data for Name: userprofiles_ordernotification; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY userprofiles_ordernotification (id, watched, priority, order_item_id) FROM stdin;
265	f	4	667
266	t	2	669
267	f	4	671
268	f	4	670
269	f	4	672
270	f	4	674
\.


--
-- Name: userprofiles_ordernotification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('userprofiles_ordernotification_id_seq', 270, true);


--
-- Data for Name: userprofiles_profile; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY userprofiles_profile (id, phone, lang, user_id, customer_id, accounts_status) FROM stdin;
378	09876543221	en	585	133	1
362	666913718	en	557	124	0
381	0987654321	en	589	134	1
324	655017173	en	515	\N	1
380	5466676866	en	587	\N	1
382	0987654332	en	591	135	1
384	565656577	en	593	136	0
344	655017173	en	536	\N	1
377	1234568798	en	584	132	1
279	666913718	en	412	71	1
385	+34672364805	en	599	137	1
321	\N	en	512	\N	0
323	666913718	en	514	\N	1
327	666913718	en	518	\N	1
\.


--
-- Name: userprofiles_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('userprofiles_profile_id_seq', 385, true);


--
-- Data for Name: userprofiles_restaurant; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY userprofiles_restaurant (id, logo, name, "desc", address, city, state, zip_code, phone, min_order, website, facebook, twitter, instagram, slug, photoshoot_requested, publishing_requested, published, rate, is_confirmed, is_premium, user_id, opening_hours, desc_en, desc_es, country, street, door, floor) FROM stdin;
52		Emily's Restaurant	<h1>Creative&nbsp;cuisine&nbsp;in&nbsp;L&#39;Eixample</h1>\r\n\r\n<h2><em>Come&nbsp;and&nbsp;discover&nbsp;Emily&#39;s&nbsp;culinary&nbsp;flair</em></h2>\r\n\r\n<ul>\r\n\t<li><em>Brunch</em></li>\r\n\t<li><em>Cakes</em></li>\r\n\t<li><em>Art&nbsp;gallery</em></li>\r\n\t<li>&nbsp;</li>\r\n</ul>\r\n	Carrer de Muntaner, 184, Barcelona, Spain	Barcelona	CT	08036	666913718	1					emilys-restaurant	f	f	f	10	f	f	518	Tuesday 16:43-00:00<br>Thursday 16:44-00:00	<h1>Creative&nbsp;cuisine&nbsp;in&nbsp;L&#39;Eixample</h1>\r\n\r\n<h2><em>Come&nbsp;and&nbsp;discover&nbsp;Emily&#39;s&nbsp;culinary&nbsp;flair</em></h2>\r\n\r\n<ul>\r\n\t<li><em>Brunch</em></li>\r\n\t<li><em>Cakes</em></li>\r\n\t<li><em>Art&nbsp;gallery</em></li>\r\n\t<li>&nbsp;</li>\r\n</ul>\r\n	<p>None</p>\r\n	\N	184	0	0
76	18815394_1797332850293429_1039476084907137473_o.jpg	ritk restaurant	<p><big>Welcome&nbsp;to&nbsp;Ritk&nbsp;Restaurant,&nbsp;located&nbsp;in&nbsp;the&nbsp;heart&nbsp;of&nbsp;El&nbsp;Born.</big></p>\r\n\r\n<p>Here&nbsp;you&nbsp;can&nbsp;try&nbsp;a&nbsp;range&nbsp;of&nbsp;favourite&nbsp;foods,&nbsp;including:</p>\r\n\r\n<ul>\r\n\t<li>Burgers</li>\r\n\t<li>Pizza</li>\r\n\t<li>Pasta</li>\r\n\t<li>Pies</li>\r\n</ul>\r\n\r\n<p>Our&nbsp;restaurant&nbsp;gets&nbsp;busy,&nbsp;so&nbsp;we&nbsp;advise&nbsp;you&nbsp;to&nbsp;book&nbsp;ahead!</p>\r\n	barcelona 32 ytyty	Barcelona		657575	9897866453	3					ritk-restaurant	f	f	f	10	f	f	587	Monday 12:30-23:00<br>Tuesday 12:30-16:16<br>Friday 13:00-01:00<br>Wednesday 14:00-00:00<br>Thursday 14:00-00:00<br>Sunday 13:00-22:00<br>Saturday 12:00-01:00	<p><big>Welcome&nbsp;to&nbsp;Ritk&nbsp;Restaurant,&nbsp;located&nbsp;in&nbsp;the&nbsp;heart&nbsp;of&nbsp;El&nbsp;Born.</big></p>\r\n\r\n<p>Here&nbsp;you&nbsp;can&nbsp;try&nbsp;a&nbsp;range&nbsp;of&nbsp;favourite&nbsp;foods,&nbsp;including:</p>\r\n\r\n<ul>\r\n\t<li>Burgers</li>\r\n\t<li>Pizza</li>\r\n\t<li>Pasta</li>\r\n\t<li>Pies</li>\r\n</ul>\r\n\r\n<p>Our&nbsp;restaurant&nbsp;gets&nbsp;busy,&nbsp;so&nbsp;we&nbsp;advise&nbsp;you&nbsp;to&nbsp;book&nbsp;ahead!</p>\r\n	<p>Bienvenido&nbsp;a&nbsp;Ritk&nbsp;Restaurant,&nbsp;situado&nbsp;en&nbsp;el&nbsp;corazon&nbsp;del&nbsp;Born.</p>\r\n\r\n<p>Aqui&nbsp;puede&nbsp;probar&nbsp;muchas&nbsp;comidas&nbsp;favoridas,&nbsp;incluyen:</p>\r\n\r\n<ul>\r\n\t<li>Hamburgers</li>\r\n\t<li>Pizza</li>\r\n\t<li>Pasta</li>\r\n\t<li>Pies</li>\r\n</ul>\r\n\r\n<p>Nuestras&nbsp;restaurante&nbsp;siempre&nbsp;es&nbsp;llena,&nbsp;asi&nbsp;que&nbsp;te&nbsp;advisamos&nbsp;reservar&nbsp;una&nbsp;mesa!</p>\r\n	\N			
50	ON_NOW.png	Arash's Restaurant	<h1>Traditional&nbsp;Danish&nbsp;Tapas&nbsp;in&nbsp;Barcelona!</h1>\r\n\r\n<h2>Discover&nbsp;Denmark&#39;s&nbsp;secrets</h2>\r\n\r\n<p>This&nbsp;cosy&nbsp;cafe&nbsp;is&nbsp;situated&nbsp;in&nbsp;El&nbsp;Born,&nbsp;and&nbsp;offers&nbsp;unique&nbsp;Danish&nbsp;tapas&nbsp;and&nbsp;drinks</p>\r\n	Passatge d'Alió, 31, Barcelona, Spain	Barcelona	CT	08037	655017173	2	www.mohointernational.com	https://www.facebook.com/MohoDrinks	www.twitter.com/mohodrinks	www.instagram.com/mohodrinks	arashs-restaurant	f	f	f	10	f	f	515	Tuesday 09:00-16:00<br>Wednesday 12:30-19:30	<h1>Traditional&nbsp;Danish&nbsp;Tapas&nbsp;in&nbsp;Barcelona!</h1>\r\n\r\n<h2>Discover&nbsp;Denmark&#39;s&nbsp;secrets</h2>\r\n\r\n<p>This&nbsp;cosy&nbsp;cafe&nbsp;is&nbsp;situated&nbsp;in&nbsp;El&nbsp;Born,&nbsp;and&nbsp;offers&nbsp;unique&nbsp;Danish&nbsp;tapas&nbsp;and&nbsp;drinks</p>\r\n	<h1>Tapas&nbsp;de&nbsp;Dinamarce&nbsp;tradicional&nbsp;en&nbsp;Barcelona!</h1>\r\n\r\n<h2>Descubre&nbsp;los&nbsp;secretos&nbsp;de&nbsp;Dinamarca</h2>\r\n\r\n<p>Este&nbsp;cafe&nbsp;acogedor&nbsp;esta&nbsp;en&nbsp;El&nbsp;Born,&nbsp;se&nbsp;ofrece&nbsp;tapas&nbsp;y&nbsp;bebidas&nbsp;de&nbsp;Dinamarca&nbsp;unicamente</p>\r\n	\N	31	0	0
61	Logo_for_website.png	la fiambrera	<p>n;&nbsp;snf;v;fjb;j;JBWJB[Wjbjjb;None</p>\r\n	Passatge d'Alió, 31, Barcelona, Spain	Barcelona	CT	08037	655017173	3	http://www.zerokm.es	https://www.facebook.com/ZeroKM.BCN			la-fiambrera	f	f	f	10	f	f	536	Tuesday 12:00-00:00<br>Wednesday 12:00-16:00, 16:00-00:00<br>Monday 12:00-00:00	<p>n;&nbsp;snf;v;fjb;j;JBWJB[Wjbjjb;None</p>\r\n	<p>wvnLH;LVH;Whhvhv;jh;None</p>\r\n	\N	31	0	0
49	3006_fb.jpg	Hannah's Restaurant	<h1><strong>Hannah&#39;s&nbsp;Restaurant</strong></h1>\r\n\r\n<h2>The&nbsp;Best&nbsp;restaurant&nbsp;in&nbsp;Barcelona</h2>\r\n\r\n<div>This&nbsp;restaurant&nbsp;is&nbsp;in&nbsp;Gracia&nbsp;and&nbsp;serves&nbsp;amazing&nbsp;English&nbsp;food,&nbsp;including:</div>\r\n\r\n<ul>\r\n\t<li>Sunday&nbsp;Roasts</li>\r\n\t<li>Sausage&nbsp;and&nbsp;Mash</li>\r\n\t<li>Fish&nbsp;and&nbsp;Chips</li>\r\n\t<li>Beef&nbsp;Casserole</li>\r\n\t<li>Chicken&nbsp;Pie</li>\r\n\t<li>Fish&nbsp;Pie</li>\r\n</ul>\r\n	Passeig de Gràcia, 1, Barcelona, Spain	Barcelona	CT	08007	666913718	1	http://www.bananas-barcelona.com	https://www.facebook.com/bananasbcn	https://twitter.com/kafebananas	https://www.instagram.com/mohodrinks/	hannahs-restaurant	f	f	f	10	f	f	514	Friday 12:30-16:00<br>Tuesday 12:30-16:00<br>Thursday 12:00-00:00<br>Wednesday 12:30-16:00<br>Monday 12:30-16:00	<h1><strong>Hannah&#39;s&nbsp;Restaurant</strong></h1>\r\n\r\n<h2>The&nbsp;Best&nbsp;restaurant&nbsp;in&nbsp;Barcelona</h2>\r\n\r\n<div>This&nbsp;restaurant&nbsp;is&nbsp;in&nbsp;Gracia&nbsp;and&nbsp;serves&nbsp;amazing&nbsp;English&nbsp;food,&nbsp;including:</div>\r\n\r\n<ul>\r\n\t<li>Sunday&nbsp;Roasts</li>\r\n\t<li>Sausage&nbsp;and&nbsp;Mash</li>\r\n\t<li>Fish&nbsp;and&nbsp;Chips</li>\r\n\t<li>Beef&nbsp;Casserole</li>\r\n\t<li>Chicken&nbsp;Pie</li>\r\n\t<li>Fish&nbsp;Pie</li>\r\n</ul>\r\n	<h1><strong><em>El&nbsp;Restaurante&nbsp;de&nbsp;Hannah</em></strong></h1>\r\n\r\n<h2>El&nbsp;mejor&nbsp;restaurante&nbsp;en&nbsp;Barcelona</h2>\r\n\r\n<div>Este&nbsp;restaurante&nbsp;en&nbsp;Gracia&nbsp;tiene&nbsp;comida&nbsp;inglesa&nbsp;estupenda,&nbsp;incluyen:</div>\r\n\r\n<ul>\r\n\t<li>Tradicional&nbsp;Cena&nbsp;del&nbsp;Domingo</li>\r\n\t<li>Botifarra&nbsp;y&nbsp;Patatas</li>\r\n\t<li>Pescado&nbsp;y&nbsp;Patatas&nbsp;Fritas</li>\r\n\t<li>Casserole&nbsp;de&nbsp;Ternera</li>\r\n\t<li>Pie&nbsp;de&nbsp;Pollo</li>\r\n\t<li>Pie&nbsp;de&nbsp;Pescado</li>\r\n</ul>\r\n	\N	1	0	0
\.


--
-- Name: userprofiles_restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('userprofiles_restaurant_id_seq', 76, true);


--
-- Data for Name: userprofiles_restaurantcontract; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY userprofiles_restaurantcontract (id, text, restaurant_id) FROM stdin;
\.


--
-- Name: userprofiles_restaurantcontract_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('userprofiles_restaurantcontract_id_seq', 1, true);


--
-- Data for Name: userprofiles_restaurantdelivery; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY userprofiles_restaurantdelivery (id, possible, city_id, restaurant_id) FROM stdin;
86	t	1	61
88	t	1	49
113	t	1	76
115	t	1	50
\.


--
-- Name: userprofiles_restaurantdelivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('userprofiles_restaurantdelivery_id_seq', 115, true);


--
-- Data for Name: userprofiles_restaurantdiscountcoupon; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY userprofiles_restaurantdiscountcoupon (id, available_from, available_till, time_from, time_till, discount_text, percent, restaurant_id) FROM stdin;
6	2017-07-05	2017-07-28	17:00:00	17:00:00	\N	\N	\N
7	2017-07-25	2017-07-29	16:55:00	16:55:00	\N	\N	\N
28	2017-09-18	2017-10-18	15:00:00	15:00:00	Visit the restaurant!	10	52
31	2017-09-21	2018-01-20	23:55:00	23:55:00	only by dining in	10	61
25	2017-10-28	2017-10-28	23:55:00	23:55:00	10% Discount at Hannah's	10	49
38	2017-10-03	2018-02-28	18:30:00	18:30:00	Money off total bill	10	76
26	2017-10-18	2018-09-18	18:45:00	18:45:00	Visit the restaurant!	10	50
\.


--
-- Name: userprofiles_restaurantdiscountcoupon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('userprofiles_restaurantdiscountcoupon_id_seq', 38, true);


--
-- Data for Name: userprofiles_restaurantimage; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY userprofiles_restaurantimage (id, image, restaurant_id) FROM stdin;
36	Restaurant_1.jpg	49
37	Restaurant_3.jpg	49
38	Photo_4_resized.png	49
39	Restaurant_2.jpg	49
40	Restaurant_1_EoGWrn3.jpg	49
41	Photo_2.jpg	52
42	Photo_1_cropped.png	52
53	Restaurant_1_w6CC86m.jpg	61
54	Restaurant_2_ilaajvQ.jpg	61
55	Restaurant_3_h64vlYs.jpg	61
56	Restaurant_4.jpg	61
73	a.jpg	76
75	e.jpg	76
76	b.jpg	76
77	c.jpg	76
74	d_SZHk9ES.jpg	76
78	18222388_10155047093262911_2757984268670020079_n.jpg	50
79	1941498_833245553386735_2182990711469944183_o.jpg	50
80	12466059_540951606064731_692768623589436791_o.jpg	50
81	12698452_947655861957045_3581490821245775076_o.jpg	50
82	The_Butcher.jpg	50
\.


--
-- Name: userprofiles_restaurantimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('userprofiles_restaurantimage_id_seq', 82, true);


--
-- Data for Name: userprofiles_restaurantreview; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY userprofiles_restaurantreview (id, msg, datetime, restaurant_id, user_id) FROM stdin;
\.


--
-- Name: userprofiles_restaurantreview_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('userprofiles_restaurantreview_id_seq', 16, true);


--
-- Data for Name: userprofiles_servicerating; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY userprofiles_servicerating (id, rating, order_id) FROM stdin;
\.


--
-- Name: userprofiles_servicerating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('userprofiles_servicerating_id_seq', 34, true);


--
-- Data for Name: userprofiles_shift; Type: TABLE DATA; Schema: public; Owner: lafiambrerauser
--

COPY userprofiles_shift (id, week_day, start, "end", restaurant_id) FROM stdin;
708	Tue	16:43:00	00:00:00	52
709	Thu	16:44:00	00:00:00	52
963	Mon	12:30:00	23:00:00	76
964	Tue	12:30:00	16:16:00	76
965	Wed	14:00:00	00:00:00	76
966	Thu	14:00:00	00:00:00	76
780	Mon	12:00:00	00:00:00	61
781	Tue	12:00:00	00:00:00	61
782	Wed	12:00:00	16:00:00	61
783	Wed	16:00:00	00:00:00	61
967	Fri	13:00:00	01:00:00	76
968	Sat	12:00:00	01:00:00	76
969	Sun	13:00:00	22:00:00	76
852	Mon	12:30:00	16:00:00	49
853	Tue	12:30:00	16:00:00	49
854	Wed	12:30:00	16:00:00	49
855	Thu	12:00:00	00:00:00	49
856	Fri	12:30:00	16:00:00	49
971	Tue	09:00:00	16:00:00	50
972	Wed	12:30:00	19:30:00	50
\.


--
-- Name: userprofiles_shift_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lafiambrerauser
--

SELECT pg_catalog.setval('userprofiles_shift_id_seq', 972, true);


--
-- Name: account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: carthandler_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY carthandler_cart
    ADD CONSTRAINT carthandler_cart_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_blog_it_category_name_key; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_blogcategory
    ADD CONSTRAINT django_blog_it_category_name_key UNIQUE (name);


--
-- Name: django_blog_it_category_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_blogcategory
    ADD CONSTRAINT django_blog_it_category_pkey PRIMARY KEY (id);


--
-- Name: django_blog_it_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_blogcategory
    ADD CONSTRAINT django_blog_it_category_slug_key UNIQUE (slug);


--
-- Name: django_blog_it_contactussettings_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_contactussettings
    ADD CONSTRAINT django_blog_it_contactussettings_pkey PRIMARY KEY (id);


--
-- Name: django_blog_it_facebook_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_facebook
    ADD CONSTRAINT django_blog_it_facebook_pkey PRIMARY KEY (id);


--
-- Name: django_blog_it_google_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_google
    ADD CONSTRAINT django_blog_it_google_pkey PRIMARY KEY (id);


--
-- Name: django_blog_it_image_file_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_image_file
    ADD CONSTRAINT django_blog_it_image_file_pkey PRIMARY KEY (id);


--
-- Name: django_blog_it_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_menu
    ADD CONSTRAINT django_blog_it_menu_pkey PRIMARY KEY (id);


--
-- Name: django_blog_it_page_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_page
    ADD CONSTRAINT django_blog_it_page_pkey PRIMARY KEY (id);


--
-- Name: django_blog_it_post_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_post
    ADD CONSTRAINT django_blog_it_post_pkey PRIMARY KEY (id);


--
-- Name: django_blog_it_post_slug_41a73cf1_uniq; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_post
    ADD CONSTRAINT django_blog_it_post_slug_41a73cf1_uniq UNIQUE (slug);


--
-- Name: django_blog_it_post_slug_en_key; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_post
    ADD CONSTRAINT django_blog_it_post_slug_en_key UNIQUE (slug_en);


--
-- Name: django_blog_it_post_slug_es_key; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_post
    ADD CONSTRAINT django_blog_it_post_slug_es_key UNIQUE (slug_es);


--
-- Name: django_blog_it_post_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_post_slugs
    ADD CONSTRAINT django_blog_it_post_slugs_pkey PRIMARY KEY (id);


--
-- Name: django_blog_it_post_slugs_slug_key; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_post_slugs
    ADD CONSTRAINT django_blog_it_post_slugs_slug_key UNIQUE (slug);


--
-- Name: django_blog_it_post_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_post_tags
    ADD CONSTRAINT django_blog_it_post_tags_pkey PRIMARY KEY (id);


--
-- Name: django_blog_it_post_tags_post_id_tags_id_244c91a5_uniq; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_post_tags
    ADD CONSTRAINT django_blog_it_post_tags_post_id_tags_id_244c91a5_uniq UNIQUE (post_id, tags_id);


--
-- Name: django_blog_it_post_title_d211e366_uniq; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_post
    ADD CONSTRAINT django_blog_it_post_title_d211e366_uniq UNIQUE (title);


--
-- Name: django_blog_it_post_title_en_key; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_post
    ADD CONSTRAINT django_blog_it_post_title_en_key UNIQUE (title_en);


--
-- Name: django_blog_it_post_title_es_key; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_post
    ADD CONSTRAINT django_blog_it_post_title_es_key UNIQUE (title_es);


--
-- Name: django_blog_it_posthistory_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_posthistory
    ADD CONSTRAINT django_blog_it_posthistory_pkey PRIMARY KEY (id);


--
-- Name: django_blog_it_tags_name_key; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_tags
    ADD CONSTRAINT django_blog_it_tags_name_key UNIQUE (name);


--
-- Name: django_blog_it_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_tags
    ADD CONSTRAINT django_blog_it_tags_pkey PRIMARY KEY (id);


--
-- Name: django_blog_it_tags_slug_key; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_tags
    ADD CONSTRAINT django_blog_it_tags_slug_key UNIQUE (slug);


--
-- Name: django_blog_it_theme_name_key; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_theme
    ADD CONSTRAINT django_blog_it_theme_name_key UNIQUE (name);


--
-- Name: django_blog_it_theme_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_theme
    ADD CONSTRAINT django_blog_it_theme_pkey PRIMARY KEY (id);


--
-- Name: django_blog_it_theme_slug_key; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_theme
    ADD CONSTRAINT django_blog_it_theme_slug_key UNIQUE (slug);


--
-- Name: django_blog_it_userrole_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_blog_it_userrole
    ADD CONSTRAINT django_blog_it_userrole_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_ses_sesstat_date_key; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_ses_sesstat
    ADD CONSTRAINT django_ses_sesstat_date_key UNIQUE (date);


--
-- Name: django_ses_sesstat_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_ses_sesstat
    ADD CONSTRAINT django_ses_sesstat_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_source_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_source_storage_hash_481ce32d_uniq; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_storage_hash_481ce32d_uniq UNIQUE (storage_hash, name);


--
-- Name: easy_thumbnails_thumbnail_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_fb375270_uniq; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_storage_hash_fb375270_uniq UNIQUE (storage_hash, name, source_id);


--
-- Name: easy_thumbnails_thumbnaildimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnaildimensions_thumbnail_id_key; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_thumbnail_id_key UNIQUE (thumbnail_id);


--
-- Name: login_register_forgetpassword_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY login_register_forgetpassword
    ADD CONSTRAINT login_register_forgetpassword_pkey PRIMARY KEY (id);


--
-- Name: mainapp_category_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY mainapp_category
    ADD CONSTRAINT mainapp_category_pkey PRIMARY KEY (id);


--
-- Name: mainapp_checkoutcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY mainapp_checkoutcomment
    ADD CONSTRAINT mainapp_checkoutcomment_pkey PRIMARY KEY (id);


--
-- Name: mainapp_homecontent_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY mainapp_homecontent
    ADD CONSTRAINT mainapp_homecontent_pkey PRIMARY KEY (id);


--
-- Name: mainapp_inviterequest_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY mainapp_inviterequest
    ADD CONSTRAINT mainapp_inviterequest_pkey PRIMARY KEY (id);


--
-- Name: mainapp_inviterewards_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY mainapp_inviterewards
    ADD CONSTRAINT mainapp_inviterewards_pkey PRIMARY KEY (id);


--
-- Name: mainapp_selectionreference_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY mainapp_selectionreference
    ADD CONSTRAINT mainapp_selectionreference_pkey PRIMARY KEY (id);


--
-- Name: mainapp_shareselection_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY mainapp_shareselection
    ADD CONSTRAINT mainapp_shareselection_pkey PRIMARY KEY (id);


--
-- Name: mainapp_usernotification_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY mainapp_usernotification
    ADD CONSTRAINT mainapp_usernotification_pkey PRIMARY KEY (id);


--
-- Name: orders_basket_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY orders_basket
    ADD CONSTRAINT orders_basket_pkey PRIMARY KEY (id);


--
-- Name: orders_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY orders_comment
    ADD CONSTRAINT orders_comment_pkey PRIMARY KEY (id);


--
-- Name: orders_order_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY orders_order
    ADD CONSTRAINT orders_order_pkey PRIMARY KEY (id);


--
-- Name: orders_orderdatemail_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY orders_orderdatemail
    ADD CONSTRAINT orders_orderdatemail_pkey PRIMARY KEY (id);


--
-- Name: orders_orderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY orders_orderitem
    ADD CONSTRAINT orders_orderitem_pkey PRIMARY KEY (id);


--
-- Name: pages_contactus_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY pages_contactus
    ADD CONSTRAINT pages_contactus_pkey PRIMARY KEY (id);


--
-- Name: pages_faqs_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY pages_faqs
    ADD CONSTRAINT pages_faqs_pkey PRIMARY KEY (id);


--
-- Name: pages_groupbenifits_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY pages_groupbenifits
    ADD CONSTRAINT pages_groupbenifits_pkey PRIMARY KEY (id);


--
-- Name: pages_lunchsteps_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY pages_lunchsteps
    ADD CONSTRAINT pages_lunchsteps_pkey PRIMARY KEY (id);


--
-- Name: pages_supportdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY pages_supportdetails
    ADD CONSTRAINT pages_supportdetails_pkey PRIMARY KEY (id);


--
-- Name: payments_lafiambrera_currency_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY payments_lafiambrera_currency
    ADD CONSTRAINT payments_lafiambrera_currency_pkey PRIMARY KEY (id);


--
-- Name: payments_moneytowallet_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY payments_moneytowallet
    ADD CONSTRAINT payments_moneytowallet_pkey PRIMARY KEY (id);


--
-- Name: payments_payment_order_id_key; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY payments_payment
    ADD CONSTRAINT payments_payment_order_id_key UNIQUE (order_id);


--
-- Name: payments_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY payments_payment
    ADD CONSTRAINT payments_payment_pkey PRIMARY KEY (id);


--
-- Name: payments_paypalpaymentdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY payments_paypalpaymentdetails
    ADD CONSTRAINT payments_paypalpaymentdetails_pkey PRIMARY KEY (id);


--
-- Name: payments_wallet_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY payments_wallet
    ADD CONSTRAINT payments_wallet_pkey PRIMARY KEY (id);


--
-- Name: payments_walletorder_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY payments_walletorder
    ADD CONSTRAINT payments_walletorder_pkey PRIMARY KEY (id);


--
-- Name: payments_walletpayment_moneytowallet_id_51f607eb_uniq; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY payments_walletpayment
    ADD CONSTRAINT payments_walletpayment_moneytowallet_id_51f607eb_uniq UNIQUE (moneytowallet_id);


--
-- Name: payments_walletpayment_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY payments_walletpayment
    ADD CONSTRAINT payments_walletpayment_pkey PRIMARY KEY (id);


--
-- Name: paypal_ipn_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY paypal_ipn
    ADD CONSTRAINT paypal_ipn_pkey PRIMARY KEY (id);


--
-- Name: sermepa_sermepaidtpv_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY sermepa_sermepaidtpv
    ADD CONSTRAINT sermepa_sermepaidtpv_pkey PRIMARY KEY (id);


--
-- Name: sermepa_sermeparesponse_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY sermepa_sermeparesponse
    ADD CONSTRAINT sermepa_sermeparesponse_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association_server_url_handle_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code_email_code_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce_server_url_timestamp_salt_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth_provider_uid_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount_provider_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_socialapp_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialtoken_app_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: userprofiles_activation_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_activation
    ADD CONSTRAINT userprofiles_activation_pkey PRIMARY KEY (id);


--
-- Name: userprofiles_adminnotification_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_adminnotification
    ADD CONSTRAINT userprofiles_adminnotification_pkey PRIMARY KEY (id);


--
-- Name: userprofiles_checkoutpromoco_checkoutpromocode_id_361d9fc0_uniq; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_checkoutpromocode_used_by
    ADD CONSTRAINT userprofiles_checkoutpromoco_checkoutpromocode_id_361d9fc0_uniq UNIQUE (checkoutpromocode_id, user_id);


--
-- Name: userprofiles_checkoutpromocode_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_checkoutpromocode
    ADD CONSTRAINT userprofiles_checkoutpromocode_pkey PRIMARY KEY (id);


--
-- Name: userprofiles_checkoutpromocode_used_by_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_checkoutpromocode_used_by
    ADD CONSTRAINT userprofiles_checkoutpromocode_used_by_pkey PRIMARY KEY (id);


--
-- Name: userprofiles_city_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_city
    ADD CONSTRAINT userprofiles_city_pkey PRIMARY KEY (id);


--
-- Name: userprofiles_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_customer
    ADD CONSTRAINT userprofiles_customer_pkey PRIMARY KEY (id);


--
-- Name: userprofiles_lunchbox_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_lunchbox
    ADD CONSTRAINT userprofiles_lunchbox_pkey PRIMARY KEY (id);


--
-- Name: userprofiles_lunchboxadminmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_lunchboxadminmessage
    ADD CONSTRAINT userprofiles_lunchboxadminmessage_pkey PRIMARY KEY (id);


--
-- Name: userprofiles_lunchboxdiscount_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_lunchboxdiscount
    ADD CONSTRAINT userprofiles_lunchboxdiscount_pkey PRIMARY KEY (id);


--
-- Name: userprofiles_lunchboxfeedback_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_lunchboxfeedback
    ADD CONSTRAINT userprofiles_lunchboxfeedback_pkey PRIMARY KEY (id);


--
-- Name: userprofiles_lunchboximage_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_lunchboximage
    ADD CONSTRAINT userprofiles_lunchboximage_pkey PRIMARY KEY (id);


--
-- Name: userprofiles_lunchboxprivileges_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_lunchboxprivileges
    ADD CONSTRAINT userprofiles_lunchboxprivileges_pkey PRIMARY KEY (id);


--
-- Name: userprofiles_lunchboxprivilegesitem_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_lunchboxprivilegesitem
    ADD CONSTRAINT userprofiles_lunchboxprivilegesitem_pkey PRIMARY KEY (id);


--
-- Name: userprofiles_lunchboxrating_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_lunchboxrating
    ADD CONSTRAINT userprofiles_lunchboxrating_pkey PRIMARY KEY (id);


--
-- Name: userprofiles_lunchboxrequest_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_lunchboxrequest
    ADD CONSTRAINT userprofiles_lunchboxrequest_pkey PRIMARY KEY (id);


--
-- Name: userprofiles_ordernotification_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_ordernotification
    ADD CONSTRAINT userprofiles_ordernotification_pkey PRIMARY KEY (id);


--
-- Name: userprofiles_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_profile
    ADD CONSTRAINT userprofiles_profile_pkey PRIMARY KEY (id);


--
-- Name: userprofiles_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_profile
    ADD CONSTRAINT userprofiles_profile_user_id_key UNIQUE (user_id);


--
-- Name: userprofiles_restaurant_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_restaurant
    ADD CONSTRAINT userprofiles_restaurant_pkey PRIMARY KEY (id);


--
-- Name: userprofiles_restaurantcontract_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_restaurantcontract
    ADD CONSTRAINT userprofiles_restaurantcontract_pkey PRIMARY KEY (id);


--
-- Name: userprofiles_restaurantdelivery_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_restaurantdelivery
    ADD CONSTRAINT userprofiles_restaurantdelivery_pkey PRIMARY KEY (id);


--
-- Name: userprofiles_restaurantdiscountcoupon_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_restaurantdiscountcoupon
    ADD CONSTRAINT userprofiles_restaurantdiscountcoupon_pkey PRIMARY KEY (id);


--
-- Name: userprofiles_restaurantimage_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_restaurantimage
    ADD CONSTRAINT userprofiles_restaurantimage_pkey PRIMARY KEY (id);


--
-- Name: userprofiles_restaurantreview_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_restaurantreview
    ADD CONSTRAINT userprofiles_restaurantreview_pkey PRIMARY KEY (id);


--
-- Name: userprofiles_servicerating_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_servicerating
    ADD CONSTRAINT userprofiles_servicerating_pkey PRIMARY KEY (id);


--
-- Name: userprofiles_shift_pkey; Type: CONSTRAINT; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

ALTER TABLE ONLY userprofiles_shift
    ADD CONSTRAINT userprofiles_shift_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_e8701ad4; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX account_emailaddress_e8701ad4 ON account_emailaddress USING btree (user_id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailconfirmation_6f1edeac; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX account_emailconfirmation_6f1edeac ON account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: carthandler_cart_user_id_29156f1e; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX carthandler_cart_user_id_29156f1e ON carthandler_cart USING btree (user_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_blog_it_category_name_9ad17cda_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_category_name_9ad17cda_like ON django_blog_it_blogcategory USING btree (name varchar_pattern_ops);


--
-- Name: django_blog_it_category_slug_1b0cb51c_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_category_slug_1b0cb51c_like ON django_blog_it_blogcategory USING btree (slug varchar_pattern_ops);


--
-- Name: django_blog_it_category_user_id_c9073eef; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_category_user_id_c9073eef ON django_blog_it_blogcategory USING btree (user_id);


--
-- Name: django_blog_it_facebook_email_48ebb761; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_facebook_email_48ebb761 ON django_blog_it_facebook USING btree (email);


--
-- Name: django_blog_it_facebook_email_48ebb761_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_facebook_email_48ebb761_like ON django_blog_it_facebook USING btree (email varchar_pattern_ops);


--
-- Name: django_blog_it_facebook_user_id_e939655e; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_facebook_user_id_e939655e ON django_blog_it_facebook USING btree (user_id);


--
-- Name: django_blog_it_google_email_2acc93e0; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_google_email_2acc93e0 ON django_blog_it_google USING btree (email);


--
-- Name: django_blog_it_google_email_2acc93e0_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_google_email_2acc93e0_like ON django_blog_it_google USING btree (email varchar_pattern_ops);


--
-- Name: django_blog_it_google_user_id_f970e972; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_google_user_id_f970e972 ON django_blog_it_google USING btree (user_id);


--
-- Name: django_blog_it_menu_parent_id_f8aeeae7; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_menu_parent_id_f8aeeae7 ON django_blog_it_menu USING btree (parent_id);


--
-- Name: django_blog_it_page_slug_53c7128b; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_page_slug_53c7128b ON django_blog_it_page USING btree (slug);


--
-- Name: django_blog_it_page_slug_53c7128b_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_page_slug_53c7128b_like ON django_blog_it_page USING btree (slug varchar_pattern_ops);


--
-- Name: django_blog_it_post_category_id_9e286b64; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_post_category_id_9e286b64 ON django_blog_it_post USING btree (category_id);


--
-- Name: django_blog_it_post_slug_41a73cf1_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_post_slug_41a73cf1_like ON django_blog_it_post USING btree (slug varchar_pattern_ops);


--
-- Name: django_blog_it_post_slug_en_7aa18160_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_post_slug_en_7aa18160_like ON django_blog_it_post USING btree (slug_en varchar_pattern_ops);


--
-- Name: django_blog_it_post_slug_es_db851b94_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_post_slug_es_db851b94_like ON django_blog_it_post USING btree (slug_es varchar_pattern_ops);


--
-- Name: django_blog_it_post_slugs_blog_id_14bc4fb7; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_post_slugs_blog_id_14bc4fb7 ON django_blog_it_post_slugs USING btree (blog_id);


--
-- Name: django_blog_it_post_slugs_slug_96e86688_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_post_slugs_slug_96e86688_like ON django_blog_it_post_slugs USING btree (slug varchar_pattern_ops);


--
-- Name: django_blog_it_post_tags_post_id_b108d27e; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_post_tags_post_id_b108d27e ON django_blog_it_post_tags USING btree (post_id);


--
-- Name: django_blog_it_post_tags_tags_id_ba0d1457; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_post_tags_tags_id_ba0d1457 ON django_blog_it_post_tags USING btree (tags_id);


--
-- Name: django_blog_it_post_title_d211e366_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_post_title_d211e366_like ON django_blog_it_post USING btree (title varchar_pattern_ops);


--
-- Name: django_blog_it_post_title_en_624a71e5_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_post_title_en_624a71e5_like ON django_blog_it_post USING btree (title_en varchar_pattern_ops);


--
-- Name: django_blog_it_post_title_es_1ba00c48_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_post_title_es_1ba00c48_like ON django_blog_it_post USING btree (title_es varchar_pattern_ops);


--
-- Name: django_blog_it_post_user_id_06ce17be; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_post_user_id_06ce17be ON django_blog_it_post USING btree (user_id);


--
-- Name: django_blog_it_posthistory_post_id_bf867db2; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_posthistory_post_id_bf867db2 ON django_blog_it_posthistory USING btree (post_id);


--
-- Name: django_blog_it_posthistory_user_id_d1b257d4; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_posthistory_user_id_d1b257d4 ON django_blog_it_posthistory USING btree (user_id);


--
-- Name: django_blog_it_tags_name_dd59291f_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_tags_name_dd59291f_like ON django_blog_it_tags USING btree (name varchar_pattern_ops);


--
-- Name: django_blog_it_tags_slug_6e01ba19_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_tags_slug_6e01ba19_like ON django_blog_it_tags USING btree (slug varchar_pattern_ops);


--
-- Name: django_blog_it_theme_name_4a05f3cb_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_theme_name_4a05f3cb_like ON django_blog_it_theme USING btree (name varchar_pattern_ops);


--
-- Name: django_blog_it_theme_slug_bb547011_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_theme_slug_bb547011_like ON django_blog_it_theme USING btree (slug varchar_pattern_ops);


--
-- Name: django_blog_it_userrole_user_id_b7a27589; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_blog_it_userrole_user_id_b7a27589 ON django_blog_it_userrole USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX django_site_domain_a2e37b91_like ON django_site USING btree (domain varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_b068931c; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_b068931c ON easy_thumbnails_source USING btree (name);


--
-- Name: easy_thumbnails_source_b454e115; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_b454e115 ON easy_thumbnails_source USING btree (storage_hash);


--
-- Name: easy_thumbnails_source_name_5fe0edc6_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_name_5fe0edc6_like ON easy_thumbnails_source USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_storage_hash_946cbcc9_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_storage_hash_946cbcc9_like ON easy_thumbnails_source USING btree (storage_hash varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_0afd9202; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_0afd9202 ON easy_thumbnails_thumbnail USING btree (source_id);


--
-- Name: easy_thumbnails_thumbnail_b068931c; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_b068931c ON easy_thumbnails_thumbnail USING btree (name);


--
-- Name: easy_thumbnails_thumbnail_b454e115; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_b454e115 ON easy_thumbnails_thumbnail USING btree (storage_hash);


--
-- Name: easy_thumbnails_thumbnail_name_b5882c31_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_name_b5882c31_like ON easy_thumbnails_thumbnail USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_f1435f49_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_storage_hash_f1435f49_like ON easy_thumbnails_thumbnail USING btree (storage_hash varchar_pattern_ops);


--
-- Name: login_register_forgetpassword_user_id_85d2d1a6; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX login_register_forgetpassword_user_id_85d2d1a6 ON login_register_forgetpassword USING btree (user_id);


--
-- Name: mainapp_checkoutcomment_user_id_08333e54; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX mainapp_checkoutcomment_user_id_08333e54 ON mainapp_checkoutcomment USING btree (user_id);


--
-- Name: mainapp_inviterequest_user_id_e9089ef5; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX mainapp_inviterequest_user_id_e9089ef5 ON mainapp_inviterequest USING btree (user_id);


--
-- Name: mainapp_selectionreference_shareselection_id_d94e4c75; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX mainapp_selectionreference_shareselection_id_d94e4c75 ON mainapp_selectionreference USING btree (shareselection_id);


--
-- Name: mainapp_shareselection_user_id_bf2b04b7; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX mainapp_shareselection_user_id_bf2b04b7 ON mainapp_shareselection USING btree (user_id);


--
-- Name: mainapp_usernotification_user_id_1b4ddb3d; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX mainapp_usernotification_user_id_1b4ddb3d ON mainapp_usernotification USING btree (user_id);


--
-- Name: orders_basket_d78a9f0a; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX orders_basket_d78a9f0a ON orders_basket USING btree (lunchbox_id);


--
-- Name: orders_basket_e8701ad4; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX orders_basket_e8701ad4 ON orders_basket USING btree (user_id);


--
-- Name: orders_comment_order_id_6f03ba56; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX orders_comment_order_id_6f03ba56 ON orders_comment USING btree (order_id);


--
-- Name: orders_order_e8701ad4; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX orders_order_e8701ad4 ON orders_order USING btree (user_id);


--
-- Name: orders_orderitem_69dfcb07; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX orders_orderitem_69dfcb07 ON orders_orderitem USING btree (order_id);


--
-- Name: orders_orderitem_d78a9f0a; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX orders_orderitem_d78a9f0a ON orders_orderitem USING btree (lunchbox_id);


--
-- Name: payments_moneytowallet_user_id_fc10dd21; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX payments_moneytowallet_user_id_fc10dd21 ON payments_moneytowallet USING btree (user_id);


--
-- Name: payments_payment_2fb72c6e; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX payments_payment_2fb72c6e ON payments_payment USING btree (coupon_id);


--
-- Name: payments_payment_672d1942; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX payments_payment_672d1942 ON payments_payment USING btree (paypal_response_id);


--
-- Name: payments_payment_cf85b389; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX payments_payment_cf85b389 ON payments_payment USING btree (sermepa_response_id);


--
-- Name: payments_wallet_user_id_5ce859c2; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX payments_wallet_user_id_5ce859c2 ON payments_wallet USING btree (user_id);


--
-- Name: payments_walletorder_order_id_b1ceb492; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX payments_walletorder_order_id_b1ceb492 ON payments_walletorder USING btree (order_id);


--
-- Name: payments_walletorder_user_id_f8599453; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX payments_walletorder_user_id_f8599453 ON payments_walletorder USING btree (user_id);


--
-- Name: payments_walletorder_wallet_id_935deb73; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX payments_walletorder_wallet_id_935deb73 ON payments_walletorder USING btree (wallet_id);


--
-- Name: payments_walletpayment_moneytowallet_id_51f607eb; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX payments_walletpayment_moneytowallet_id_51f607eb ON payments_walletpayment USING btree (moneytowallet_id);


--
-- Name: payments_walletpayment_paypal_response_id_4ac95b61; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX payments_walletpayment_paypal_response_id_4ac95b61 ON payments_walletpayment USING btree (paypal_response_id);


--
-- Name: payments_walletpayment_sermepa_response_id_54eb385e; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX payments_walletpayment_sermepa_response_id_54eb385e ON payments_walletpayment USING btree (sermepa_response_id);


--
-- Name: paypal_ipn_8e113603; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX paypal_ipn_8e113603 ON paypal_ipn USING btree (txn_id);


--
-- Name: paypal_ipn_txn_id_8fa22c44_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX paypal_ipn_txn_id_8fa22c44_like ON paypal_ipn USING btree (txn_id varchar_pattern_ops);


--
-- Name: social_auth_code_code_a2393167; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX social_auth_code_code_a2393167 ON social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX social_auth_code_code_a2393167_like ON social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_partial_token_3017fea3; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX social_auth_partial_token_3017fea3 ON social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_user_id_17d28448; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON social_auth_usersocialauth USING btree (user_id);


--
-- Name: socialaccount_socialaccount_e8701ad4; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX socialaccount_socialaccount_e8701ad4 ON socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_9365d6e7; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX socialaccount_socialapp_sites_9365d6e7 ON socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_fe95b0a0; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX socialaccount_socialapp_sites_fe95b0a0 ON socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_8a089c2a; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX socialaccount_socialtoken_8a089c2a ON socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_f382adfe; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX socialaccount_socialtoken_f382adfe ON socialaccount_socialtoken USING btree (app_id);


--
-- Name: userprofiles_activation_e8701ad4; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_activation_e8701ad4 ON userprofiles_activation USING btree (user_id);


--
-- Name: userprofiles_adminnotification_d78a9f0a; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_adminnotification_d78a9f0a ON userprofiles_adminnotification USING btree (lunchbox_id);


--
-- Name: userprofiles_adminnotification_ee9d9d3e; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_adminnotification_ee9d9d3e ON userprofiles_adminnotification USING btree (restaurant_id);


--
-- Name: userprofiles_checkoutpromocode_used_by_6cef66ac; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_checkoutpromocode_used_by_6cef66ac ON userprofiles_checkoutpromocode_used_by USING btree (checkoutpromocode_id);


--
-- Name: userprofiles_checkoutpromocode_used_by_e8701ad4; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_checkoutpromocode_used_by_e8701ad4 ON userprofiles_checkoutpromocode_used_by USING btree (user_id);


--
-- Name: userprofiles_customer_user_id_e275e396; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_customer_user_id_e275e396 ON userprofiles_customer USING btree (user_id);


--
-- Name: userprofiles_lunchbox_category_id_5ae53f48; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_lunchbox_category_id_5ae53f48 ON userprofiles_lunchbox USING btree (category_id);


--
-- Name: userprofiles_lunchbox_ee9d9d3e; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_lunchbox_ee9d9d3e ON userprofiles_lunchbox USING btree (restaurant_id);


--
-- Name: userprofiles_lunchboxadminmessage_d78a9f0a; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_lunchboxadminmessage_d78a9f0a ON userprofiles_lunchboxadminmessage USING btree (lunchbox_id);


--
-- Name: userprofiles_lunchboxadminmessage_e8701ad4; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_lunchboxadminmessage_e8701ad4 ON userprofiles_lunchboxadminmessage USING btree (user_id);


--
-- Name: userprofiles_lunchboxdiscount_d78a9f0a; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_lunchboxdiscount_d78a9f0a ON userprofiles_lunchboxdiscount USING btree (lunchbox_id);


--
-- Name: userprofiles_lunchboxfeedback_d78a9f0a; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_lunchboxfeedback_d78a9f0a ON userprofiles_lunchboxfeedback USING btree (lunchbox_id);


--
-- Name: userprofiles_lunchboxfeedback_e8701ad4; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_lunchboxfeedback_e8701ad4 ON userprofiles_lunchboxfeedback USING btree (user_id);


--
-- Name: userprofiles_lunchboxfeedback_ee9d9d3e; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_lunchboxfeedback_ee9d9d3e ON userprofiles_lunchboxfeedback USING btree (restaurant_id);


--
-- Name: userprofiles_lunchboximage_d78a9f0a; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_lunchboximage_d78a9f0a ON userprofiles_lunchboximage USING btree (lunchbox_id);


--
-- Name: userprofiles_lunchboxprivilegesitem_a3783896; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_lunchboxprivilegesitem_a3783896 ON userprofiles_lunchboxprivilegesitem USING btree (privilege_id);


--
-- Name: userprofiles_lunchboxprivilegesitem_d78a9f0a; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_lunchboxprivilegesitem_d78a9f0a ON userprofiles_lunchboxprivilegesitem USING btree (lunchbox_id);


--
-- Name: userprofiles_lunchboxrating_d78a9f0a; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_lunchboxrating_d78a9f0a ON userprofiles_lunchboxrating USING btree (lunchbox_id);


--
-- Name: userprofiles_lunchboxrating_e8701ad4; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_lunchboxrating_e8701ad4 ON userprofiles_lunchboxrating USING btree (user_id);


--
-- Name: userprofiles_lunchboxrequest_d78a9f0a; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_lunchboxrequest_d78a9f0a ON userprofiles_lunchboxrequest USING btree (lunchbox_id);


--
-- Name: userprofiles_lunchboxrequest_e8701ad4; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_lunchboxrequest_e8701ad4 ON userprofiles_lunchboxrequest USING btree (user_id);


--
-- Name: userprofiles_ordernotification_2374a8a2; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_ordernotification_2374a8a2 ON userprofiles_ordernotification USING btree (order_item_id);


--
-- Name: userprofiles_profile_customer_id_45f0658c; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_profile_customer_id_45f0658c ON userprofiles_profile USING btree (customer_id);


--
-- Name: userprofiles_restaurant_2dbcba41; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_restaurant_2dbcba41 ON userprofiles_restaurant USING btree (slug);


--
-- Name: userprofiles_restaurant_e8701ad4; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_restaurant_e8701ad4 ON userprofiles_restaurant USING btree (user_id);


--
-- Name: userprofiles_restaurant_slug_27699d96_like; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_restaurant_slug_27699d96_like ON userprofiles_restaurant USING btree (slug varchar_pattern_ops);


--
-- Name: userprofiles_restaurantcontract_ee9d9d3e; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_restaurantcontract_ee9d9d3e ON userprofiles_restaurantcontract USING btree (restaurant_id);


--
-- Name: userprofiles_restaurantdelivery_c7141997; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_restaurantdelivery_c7141997 ON userprofiles_restaurantdelivery USING btree (city_id);


--
-- Name: userprofiles_restaurantdelivery_ee9d9d3e; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_restaurantdelivery_ee9d9d3e ON userprofiles_restaurantdelivery USING btree (restaurant_id);


--
-- Name: userprofiles_restaurantdiscountcoupon_ee9d9d3e; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_restaurantdiscountcoupon_ee9d9d3e ON userprofiles_restaurantdiscountcoupon USING btree (restaurant_id);


--
-- Name: userprofiles_restaurantimage_ee9d9d3e; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_restaurantimage_ee9d9d3e ON userprofiles_restaurantimage USING btree (restaurant_id);


--
-- Name: userprofiles_restaurantreview_e8701ad4; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_restaurantreview_e8701ad4 ON userprofiles_restaurantreview USING btree (user_id);


--
-- Name: userprofiles_restaurantreview_ee9d9d3e; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_restaurantreview_ee9d9d3e ON userprofiles_restaurantreview USING btree (restaurant_id);


--
-- Name: userprofiles_servicerating_69dfcb07; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_servicerating_69dfcb07 ON userprofiles_servicerating USING btree (order_id);


--
-- Name: userprofiles_shift_ee9d9d3e; Type: INDEX; Schema: public; Owner: lafiambrerauser; Tablespace: 
--

CREATE INDEX userprofiles_shift_ee9d9d3e ON userprofiles_shift USING btree (restaurant_id);


--
-- Name: D26d1f5e7132d13cd7c6490e4cad21a8; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_checkoutpromocode_used_by
    ADD CONSTRAINT "D26d1f5e7132d13cd7c6490e4cad21a8" FOREIGN KEY (checkoutpromocode_id) REFERENCES userprofiles_checkoutpromocode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_em_email_address_id_5b7f8c58_fk_account_emailaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT account_em_email_address_id_5b7f8c58_fk_account_emailaddress_id FOREIGN KEY (email_address_id) REFERENCES account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: carthandler_cart_user_id_29156f1e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY carthandler_cart
    ADD CONSTRAINT carthandler_cart_user_id_29156f1e_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_blog_it_category_user_id_c9073eef_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_blog_it_blogcategory
    ADD CONSTRAINT django_blog_it_category_user_id_c9073eef_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_blog_it_facebook_user_id_e939655e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_blog_it_facebook
    ADD CONSTRAINT django_blog_it_facebook_user_id_e939655e_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_blog_it_google_user_id_f970e972_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_blog_it_google
    ADD CONSTRAINT django_blog_it_google_user_id_f970e972_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_blog_it_menu_parent_id_f8aeeae7_fk_django_bl; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_blog_it_menu
    ADD CONSTRAINT django_blog_it_menu_parent_id_f8aeeae7_fk_django_bl FOREIGN KEY (parent_id) REFERENCES django_blog_it_menu(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_blog_it_post__blog_id_14bc4fb7_fk_django_bl; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_blog_it_post_slugs
    ADD CONSTRAINT django_blog_it_post__blog_id_14bc4fb7_fk_django_bl FOREIGN KEY (blog_id) REFERENCES django_blog_it_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_blog_it_post__post_id_b108d27e_fk_django_bl; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_blog_it_post_tags
    ADD CONSTRAINT django_blog_it_post__post_id_b108d27e_fk_django_bl FOREIGN KEY (post_id) REFERENCES django_blog_it_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_blog_it_post__tags_id_ba0d1457_fk_django_bl; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_blog_it_post_tags
    ADD CONSTRAINT django_blog_it_post__tags_id_ba0d1457_fk_django_bl FOREIGN KEY (tags_id) REFERENCES django_blog_it_tags(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_blog_it_post_category_id_9e286b64_fk_django_bl; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_blog_it_post
    ADD CONSTRAINT django_blog_it_post_category_id_9e286b64_fk_django_bl FOREIGN KEY (category_id) REFERENCES django_blog_it_blogcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_blog_it_post_user_id_06ce17be_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_blog_it_post
    ADD CONSTRAINT django_blog_it_post_user_id_06ce17be_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_blog_it_posth_post_id_bf867db2_fk_django_bl; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_blog_it_posthistory
    ADD CONSTRAINT django_blog_it_posth_post_id_bf867db2_fk_django_bl FOREIGN KEY (post_id) REFERENCES django_blog_it_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_blog_it_posthistory_user_id_d1b257d4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_blog_it_posthistory
    ADD CONSTRAINT django_blog_it_posthistory_user_id_d1b257d4_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_blog_it_userrole_user_id_b7a27589_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY django_blog_it_userrole
    ADD CONSTRAINT django_blog_it_userrole_user_id_b7a27589_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thum_thumbnail_id_c3a0c549_fk_easy_thumbnails_thumbnail_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thum_thumbnail_id_c3a0c549_fk_easy_thumbnails_thumbnail_id FOREIGN KEY (thumbnail_id) REFERENCES easy_thumbnails_thumbnail(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thumbnails_source_id_5b57bc77_fk_easy_thumbnails_source_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_source_id_5b57bc77_fk_easy_thumbnails_source_id FOREIGN KEY (source_id) REFERENCES easy_thumbnails_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: login_register_forgetpassword_user_id_85d2d1a6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY login_register_forgetpassword
    ADD CONSTRAINT login_register_forgetpassword_user_id_85d2d1a6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mainapp_checkoutcomment_user_id_08333e54_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY mainapp_checkoutcomment
    ADD CONSTRAINT mainapp_checkoutcomment_user_id_08333e54_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mainapp_inviterequest_user_id_e9089ef5_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY mainapp_inviterequest
    ADD CONSTRAINT mainapp_inviterequest_user_id_e9089ef5_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mainapp_selectionref_shareselection_id_d94e4c75_fk_mainapp_s; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY mainapp_selectionreference
    ADD CONSTRAINT mainapp_selectionref_shareselection_id_d94e4c75_fk_mainapp_s FOREIGN KEY (shareselection_id) REFERENCES mainapp_shareselection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mainapp_shareselection_user_id_bf2b04b7_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY mainapp_shareselection
    ADD CONSTRAINT mainapp_shareselection_user_id_bf2b04b7_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mainapp_usernotification_user_id_1b4ddb3d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY mainapp_usernotification
    ADD CONSTRAINT mainapp_usernotification_user_id_1b4ddb3d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_basket_lunchbox_id_954dc346_fk_userprofiles_lunchbox_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY orders_basket
    ADD CONSTRAINT orders_basket_lunchbox_id_954dc346_fk_userprofiles_lunchbox_id FOREIGN KEY (lunchbox_id) REFERENCES userprofiles_lunchbox(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_basket_user_id_474689e6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY orders_basket
    ADD CONSTRAINT orders_basket_user_id_474689e6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_comment_order_id_6f03ba56_fk_orders_order_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY orders_comment
    ADD CONSTRAINT orders_comment_order_id_6f03ba56_fk_orders_order_id FOREIGN KEY (order_id) REFERENCES orders_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_order_user_id_e9b59eb1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY orders_order
    ADD CONSTRAINT orders_order_user_id_e9b59eb1_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_orderit_lunchbox_id_f8b3debf_fk_userprofiles_lunchbox_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY orders_orderitem
    ADD CONSTRAINT orders_orderit_lunchbox_id_f8b3debf_fk_userprofiles_lunchbox_id FOREIGN KEY (lunchbox_id) REFERENCES userprofiles_lunchbox(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_orderitem_order_id_fe61a34d_fk_orders_order_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY orders_orderitem
    ADD CONSTRAINT orders_orderitem_order_id_fe61a34d_fk_orders_order_id FOREIGN KEY (order_id) REFERENCES orders_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: paym_sermepa_response_id_6b785fe7_fk_sermepa_sermeparesponse_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY payments_payment
    ADD CONSTRAINT paym_sermepa_response_id_6b785fe7_fk_sermepa_sermeparesponse_id FOREIGN KEY (sermepa_response_id) REFERENCES sermepa_sermeparesponse(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payment_coupon_id_9afc3fc6_fk_userprofiles_checkoutpromocode_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY payments_payment
    ADD CONSTRAINT payment_coupon_id_9afc3fc6_fk_userprofiles_checkoutpromocode_id FOREIGN KEY (coupon_id) REFERENCES userprofiles_checkoutpromocode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payments_moneytowallet_user_id_fc10dd21_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY payments_moneytowallet
    ADD CONSTRAINT payments_moneytowallet_user_id_fc10dd21_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payments_payment_order_id_22c479b7_fk_orders_order_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY payments_payment
    ADD CONSTRAINT payments_payment_order_id_22c479b7_fk_orders_order_id FOREIGN KEY (order_id) REFERENCES orders_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payments_payment_paypal_response_id_49926afa_fk_paypal_ipn_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY payments_payment
    ADD CONSTRAINT payments_payment_paypal_response_id_49926afa_fk_paypal_ipn_id FOREIGN KEY (paypal_response_id) REFERENCES paypal_ipn(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payments_wallet_user_id_5ce859c2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY payments_wallet
    ADD CONSTRAINT payments_wallet_user_id_5ce859c2_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payments_walletorder_order_id_b1ceb492_fk_orders_order_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY payments_walletorder
    ADD CONSTRAINT payments_walletorder_order_id_b1ceb492_fk_orders_order_id FOREIGN KEY (order_id) REFERENCES orders_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payments_walletorder_user_id_f8599453_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY payments_walletorder
    ADD CONSTRAINT payments_walletorder_user_id_f8599453_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payments_walletorder_wallet_id_935deb73_fk_payments_wallet_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY payments_walletorder
    ADD CONSTRAINT payments_walletorder_wallet_id_935deb73_fk_payments_wallet_id FOREIGN KEY (wallet_id) REFERENCES payments_wallet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payments_walletpayme_moneytowallet_id_51f607eb_fk_payments_; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY payments_walletpayment
    ADD CONSTRAINT payments_walletpayme_moneytowallet_id_51f607eb_fk_payments_ FOREIGN KEY (moneytowallet_id) REFERENCES payments_moneytowallet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payments_walletpayme_paypal_response_id_4ac95b61_fk_paypal_ip; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY payments_walletpayment
    ADD CONSTRAINT payments_walletpayme_paypal_response_id_4ac95b61_fk_paypal_ip FOREIGN KEY (paypal_response_id) REFERENCES paypal_ipn(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payments_walletpayme_sermepa_response_id_54eb385e_fk_sermepa_s; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY payments_walletpayment
    ADD CONSTRAINT payments_walletpayme_sermepa_response_id_54eb385e_fk_sermepa_s FOREIGN KEY (sermepa_response_id) REFERENCES sermepa_sermeparesponse(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialacc_account_id_951f210e_fk_socialaccount_socialaccount_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT socialacc_account_id_951f210e_fk_socialaccount_socialaccount_id FOREIGN KEY (account_id) REFERENCES socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccou_socialapp_id_97fb6e7d_fk_socialaccount_socialapp_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccou_socialapp_id_97fb6e7d_fk_socialaccount_socialapp_id FOREIGN KEY (socialapp_id) REFERENCES socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_soc_app_id_636a42d7_fk_socialaccount_socialapp_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_soc_app_id_636a42d7_fk_socialaccount_socialapp_id FOREIGN KEY (app_id) REFERENCES socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_site_site_id_2579dee5_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_site_site_id_2579dee5_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: use_privilege_id_3b2468bb_fk_userprofiles_lunchboxprivileges_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_lunchboxprivilegesitem
    ADD CONSTRAINT use_privilege_id_3b2468bb_fk_userprofiles_lunchboxprivileges_id FOREIGN KEY (privilege_id) REFERENCES userprofiles_lunchboxprivileges(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofil_restaurant_id_1c8e5c36_fk_userprofiles_restaurant_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_restaurantreview
    ADD CONSTRAINT userprofil_restaurant_id_1c8e5c36_fk_userprofiles_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES userprofiles_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofil_restaurant_id_32a9aebc_fk_userprofiles_restaurant_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_adminnotification
    ADD CONSTRAINT userprofil_restaurant_id_32a9aebc_fk_userprofiles_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES userprofiles_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofil_restaurant_id_426c3fb6_fk_userprofiles_restaurant_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_restaurantimage
    ADD CONSTRAINT userprofil_restaurant_id_426c3fb6_fk_userprofiles_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES userprofiles_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofil_restaurant_id_5dc4498c_fk_userprofiles_restaurant_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_lunchboxfeedback
    ADD CONSTRAINT userprofil_restaurant_id_5dc4498c_fk_userprofiles_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES userprofiles_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofil_restaurant_id_7814fef0_fk_userprofiles_restaurant_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_restaurantdiscountcoupon
    ADD CONSTRAINT userprofil_restaurant_id_7814fef0_fk_userprofiles_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES userprofiles_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofil_restaurant_id_902d694a_fk_userprofiles_restaurant_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_restaurantdelivery
    ADD CONSTRAINT userprofil_restaurant_id_902d694a_fk_userprofiles_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES userprofiles_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofil_restaurant_id_a3f0849d_fk_userprofiles_restaurant_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_lunchbox
    ADD CONSTRAINT userprofil_restaurant_id_a3f0849d_fk_userprofiles_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES userprofiles_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofil_restaurant_id_b5a4b83a_fk_userprofiles_restaurant_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_shift
    ADD CONSTRAINT userprofil_restaurant_id_b5a4b83a_fk_userprofiles_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES userprofiles_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofil_restaurant_id_f71def83_fk_userprofiles_restaurant_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_restaurantcontract
    ADD CONSTRAINT userprofil_restaurant_id_f71def83_fk_userprofiles_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES userprofiles_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofiles_a_lunchbox_id_f2a18673_fk_userprofiles_lunchbox_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_adminnotification
    ADD CONSTRAINT userprofiles_a_lunchbox_id_f2a18673_fk_userprofiles_lunchbox_id FOREIGN KEY (lunchbox_id) REFERENCES userprofiles_lunchbox(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofiles_activation_user_id_02a7c91b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_activation
    ADD CONSTRAINT userprofiles_activation_user_id_02a7c91b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofiles_checkoutpromocode_user_id_339f1daf_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_checkoutpromocode_used_by
    ADD CONSTRAINT userprofiles_checkoutpromocode_user_id_339f1daf_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofiles_customer_user_id_e275e396_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_customer
    ADD CONSTRAINT userprofiles_customer_user_id_e275e396_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofiles_l_lunchbox_id_1308b69c_fk_userprofiles_lunchbox_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_lunchboxadminmessage
    ADD CONSTRAINT userprofiles_l_lunchbox_id_1308b69c_fk_userprofiles_lunchbox_id FOREIGN KEY (lunchbox_id) REFERENCES userprofiles_lunchbox(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofiles_l_lunchbox_id_35a49752_fk_userprofiles_lunchbox_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_lunchboximage
    ADD CONSTRAINT userprofiles_l_lunchbox_id_35a49752_fk_userprofiles_lunchbox_id FOREIGN KEY (lunchbox_id) REFERENCES userprofiles_lunchbox(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofiles_l_lunchbox_id_9f5d4a07_fk_userprofiles_lunchbox_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_lunchboxrequest
    ADD CONSTRAINT userprofiles_l_lunchbox_id_9f5d4a07_fk_userprofiles_lunchbox_id FOREIGN KEY (lunchbox_id) REFERENCES userprofiles_lunchbox(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofiles_l_lunchbox_id_a291f157_fk_userprofiles_lunchbox_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_lunchboxdiscount
    ADD CONSTRAINT userprofiles_l_lunchbox_id_a291f157_fk_userprofiles_lunchbox_id FOREIGN KEY (lunchbox_id) REFERENCES userprofiles_lunchbox(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofiles_l_lunchbox_id_bbac5191_fk_userprofiles_lunchbox_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_lunchboxfeedback
    ADD CONSTRAINT userprofiles_l_lunchbox_id_bbac5191_fk_userprofiles_lunchbox_id FOREIGN KEY (lunchbox_id) REFERENCES userprofiles_lunchbox(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofiles_l_lunchbox_id_bf38edc9_fk_userprofiles_lunchbox_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_lunchboxprivilegesitem
    ADD CONSTRAINT userprofiles_l_lunchbox_id_bf38edc9_fk_userprofiles_lunchbox_id FOREIGN KEY (lunchbox_id) REFERENCES userprofiles_lunchbox(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofiles_l_lunchbox_id_d77de7e4_fk_userprofiles_lunchbox_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_lunchboxrating
    ADD CONSTRAINT userprofiles_l_lunchbox_id_d77de7e4_fk_userprofiles_lunchbox_id FOREIGN KEY (lunchbox_id) REFERENCES userprofiles_lunchbox(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofiles_lunchbo_category_id_5ae53f48_fk_mainapp_c; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_lunchbox
    ADD CONSTRAINT userprofiles_lunchbo_category_id_5ae53f48_fk_mainapp_c FOREIGN KEY (category_id) REFERENCES mainapp_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofiles_lunchboxadminmess_user_id_b9a86b7d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_lunchboxadminmessage
    ADD CONSTRAINT userprofiles_lunchboxadminmess_user_id_b9a86b7d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofiles_lunchboxfeedback_user_id_d8baa688_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_lunchboxfeedback
    ADD CONSTRAINT userprofiles_lunchboxfeedback_user_id_d8baa688_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofiles_lunchboxrating_user_id_4e187fd3_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_lunchboxrating
    ADD CONSTRAINT userprofiles_lunchboxrating_user_id_4e187fd3_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofiles_lunchboxrequest_user_id_592319b5_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_lunchboxrequest
    ADD CONSTRAINT userprofiles_lunchboxrequest_user_id_592319b5_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofiles_orde_order_item_id_837efa70_fk_orders_orderitem_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_ordernotification
    ADD CONSTRAINT userprofiles_orde_order_item_id_837efa70_fk_orders_orderitem_id FOREIGN KEY (order_item_id) REFERENCES orders_orderitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofiles_profile_customer_id_45f0658c_fk_userprofi; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_profile
    ADD CONSTRAINT userprofiles_profile_customer_id_45f0658c_fk_userprofi FOREIGN KEY (customer_id) REFERENCES userprofiles_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofiles_profile_user_id_5d6ade0a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_profile
    ADD CONSTRAINT userprofiles_profile_user_id_5d6ade0a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofiles_restauran_city_id_0651dfda_fk_userprofiles_city_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_restaurantdelivery
    ADD CONSTRAINT userprofiles_restauran_city_id_0651dfda_fk_userprofiles_city_id FOREIGN KEY (city_id) REFERENCES userprofiles_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofiles_restaurant_user_id_ecb17adc_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_restaurant
    ADD CONSTRAINT userprofiles_restaurant_user_id_ecb17adc_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofiles_restaurantreview_user_id_50f3eb86_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_restaurantreview
    ADD CONSTRAINT userprofiles_restaurantreview_user_id_50f3eb86_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofiles_servicerating_order_id_ca2e46a1_fk_orders_order_id; Type: FK CONSTRAINT; Schema: public; Owner: lafiambrerauser
--

ALTER TABLE ONLY userprofiles_servicerating
    ADD CONSTRAINT userprofiles_servicerating_order_id_ca2e46a1_fk_orders_order_id FOREIGN KEY (order_id) REFERENCES orders_order(id) DEFERRABLE INITIALLY DEFERRED;


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

