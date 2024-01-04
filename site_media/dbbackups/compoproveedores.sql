--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT user_id_refs_id_f2045483;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT user_id_refs_id_c8665aa;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT user_id_refs_id_831107f1;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT group_id_refs_id_3cea63fe;
ALTER TABLE ONLY public.core_status DROP CONSTRAINT core_status_usuario_id_fkey;
ALTER TABLE ONLY public.core_solicitudtrabajo DROP CONSTRAINT core_solicitudtrabajo_vacante_id_fkey;
ALTER TABLE ONLY public.core_rentadetalle DROP CONSTRAINT core_rentadetalle_renta_id_fkey;
ALTER TABLE ONLY public.core_rentadetalle DROP CONSTRAINT core_rentadetalle_equipo_id_fkey;
ALTER TABLE ONLY public.core_perfil DROP CONSTRAINT core_perfil_usuario_id_fkey;
ALTER TABLE ONLY public.core_marcacategoria DROP CONSTRAINT core_marcacategoria_marca_id_fkey;
ALTER TABLE ONLY public.core_marcacategoria DROP CONSTRAINT core_marcacategoria_categoria_id_fkey;
ALTER TABLE ONLY public.core_bitacora DROP CONSTRAINT core_bitacora_usuario_modificado_id_fkey;
ALTER TABLE ONLY public.core_bitacora DROP CONSTRAINT core_bitacora_usuario_id_fkey;
ALTER TABLE ONLY public.core_bitacora DROP CONSTRAINT core_bitacora_cliente_id_fkey;
ALTER TABLE ONLY public.core_actividad DROP CONSTRAINT core_actividad_usuario_creado_id_fkey;
ALTER TABLE ONLY public.core_actividad DROP CONSTRAINT core_actividad_usuario_asignado_id_fkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT content_type_id_refs_id_728de91f;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT content_type_id_refs_id_288599e6;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_permission_id_fkey;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_fkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_permission_id_fkey;
DROP INDEX public.django_session_expire_date;
DROP INDEX public.django_admin_log_user_id;
DROP INDEX public.django_admin_log_content_type_id;
DROP INDEX public.core_status_usuario_id;
DROP INDEX public.core_status_bitacora_id;
DROP INDEX public.core_solicitudtrabajo_vacante_id;
DROP INDEX public.core_rentadetalle_renta_id;
DROP INDEX public.core_rentadetalle_equipo_id;
DROP INDEX public.core_personaautorizada_distribuidor_id;
DROP INDEX public.core_bitacora_usuario_modificado_id;
DROP INDEX public.core_bitacora_usuario_id;
DROP INDEX public.core_bitacora_cliente_id;
DROP INDEX public.core_actividad_usuario_creado_id;
DROP INDEX public.core_actividad_usuario_asignado_id;
DROP INDEX public.auth_user_user_permissions_user_id;
DROP INDEX public.auth_user_user_permissions_permission_id;
DROP INDEX public.auth_user_groups_user_id;
DROP INDEX public.auth_user_groups_group_id;
DROP INDEX public.auth_permission_content_type_id;
DROP INDEX public.auth_group_permissions_permission_id;
DROP INDEX public.auth_group_permissions_group_id;
ALTER TABLE ONLY public.probador_urlparametro DROP CONSTRAINT probador_urlparametro_pkey;
ALTER TABLE ONLY public.probador_urlparametro DROP CONSTRAINT probador_urlparametro_name_key;
ALTER TABLE ONLY public.probador_url DROP CONSTRAINT probador_url_pkey;
ALTER TABLE ONLY public.probador_url DROP CONSTRAINT probador_url_name_key;
ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_pkey;
ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_key;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
ALTER TABLE ONLY public.core_vacante DROP CONSTRAINT core_vacante_pkey;
ALTER TABLE ONLY public.core_status DROP CONSTRAINT core_status_pkey;
ALTER TABLE ONLY public.core_solicitudtrabajo DROP CONSTRAINT core_solicitudtrabajo_pkey;
ALTER TABLE ONLY public.core_solicitarcredito DROP CONSTRAINT core_solicitarcredito_pkey;
ALTER TABLE ONLY public.core_rentadetalle DROP CONSTRAINT core_rentadetalle_pkey;
ALTER TABLE ONLY public.core_renta DROP CONSTRAINT core_renta_pkey;
ALTER TABLE ONLY public.core_producto DROP CONSTRAINT core_producto_pkey;
ALTER TABLE ONLY public.core_personaautorizada DROP CONSTRAINT core_personaautorizada_pkey;
ALTER TABLE ONLY public.core_perfil DROP CONSTRAINT core_perfil_usuario_id_key;
ALTER TABLE ONLY public.core_perfil DROP CONSTRAINT core_perfil_pkey;
ALTER TABLE ONLY public.core_mensajecontacto DROP CONSTRAINT core_mensajecontacto_pkey;
ALTER TABLE ONLY public.core_marcacategoria DROP CONSTRAINT core_marcacategoria_pkey;
ALTER TABLE ONLY public.core_marcacategoria DROP CONSTRAINT core_marcacategoria_marca_id_key;
ALTER TABLE ONLY public.core_marca DROP CONSTRAINT core_marca_pkey;
ALTER TABLE ONLY public.core_lista DROP CONSTRAINT core_lista_pkey;
ALTER TABLE ONLY public.core_imagen DROP CONSTRAINT core_imagen_pkey;
ALTER TABLE ONLY public.core_equiporenta DROP CONSTRAINT core_equiporenta_pkey;
ALTER TABLE ONLY public.core_encuestasatisfaccion DROP CONSTRAINT core_encuestasatisfaccion_pkey;
ALTER TABLE ONLY public.core_distribuidor DROP CONSTRAINT core_distribuidor_rfc_key;
ALTER TABLE ONLY public.core_distribuidor DROP CONSTRAINT core_distribuidor_razon_social_key;
ALTER TABLE ONLY public.core_distribuidor DROP CONSTRAINT core_distribuidor_pkey;
ALTER TABLE ONLY public.core_contacto DROP CONSTRAINT core_contacto_pkey;
ALTER TABLE ONLY public.core_contacto DROP CONSTRAINT core_contacto_email_key;
ALTER TABLE ONLY public.core_cliente DROP CONSTRAINT core_cliente_pkey;
ALTER TABLE ONLY public.core_categoria DROP CONSTRAINT core_categoria_pkey;
ALTER TABLE ONLY public.core_block DROP CONSTRAINT core_block_pkey;
ALTER TABLE ONLY public.core_bitacora DROP CONSTRAINT core_bitacora_pkey;
ALTER TABLE ONLY public.core_actividad DROP CONSTRAINT core_actividad_pkey;
ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_key;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_key;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_key;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_key;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
ALTER TABLE public.probador_urlparametro ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.probador_url ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_site ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.core_vacante ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.core_status ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.core_solicitudtrabajo ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.core_solicitarcredito ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.core_rentadetalle ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.core_renta ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.core_producto ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.core_personaautorizada ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.core_perfil ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.core_mensajecontacto ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.core_marcacategoria ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.core_marca ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.core_lista ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.core_imagen ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.core_equiporenta ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.core_encuestasatisfaccion ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.core_distribuidor ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.core_contacto ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.core_cliente ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.core_categoria ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.core_block ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.core_bitacora ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.core_actividad ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.probador_urlparametro_id_seq;
DROP TABLE public.probador_urlparametro;
DROP SEQUENCE public.probador_url_id_seq;
DROP TABLE public.probador_url;
DROP SEQUENCE public.django_site_id_seq;
DROP TABLE public.django_site;
DROP TABLE public.django_session;
DROP SEQUENCE public.django_content_type_id_seq;
DROP TABLE public.django_content_type;
DROP SEQUENCE public.django_admin_log_id_seq;
DROP TABLE public.django_admin_log;
DROP SEQUENCE public.core_vacante_id_seq;
DROP TABLE public.core_vacante;
DROP SEQUENCE public.core_status_id_seq;
DROP TABLE public.core_status;
DROP SEQUENCE public.core_solicitudtrabajo_id_seq;
DROP TABLE public.core_solicitudtrabajo;
DROP SEQUENCE public.core_solicitarcredito_id_seq;
DROP TABLE public.core_solicitarcredito;
DROP SEQUENCE public.core_rentadetalle_id_seq;
DROP TABLE public.core_rentadetalle;
DROP SEQUENCE public.core_renta_id_seq;
DROP TABLE public.core_renta;
DROP SEQUENCE public.core_producto_id_seq;
DROP TABLE public.core_producto;
DROP SEQUENCE public.core_personaautorizada_id_seq;
DROP TABLE public.core_personaautorizada;
DROP SEQUENCE public.core_perfil_id_seq;
DROP TABLE public.core_perfil;
DROP SEQUENCE public.core_mensajecontacto_id_seq;
DROP TABLE public.core_mensajecontacto;
DROP SEQUENCE public.core_marcacategoria_id_seq;
DROP TABLE public.core_marcacategoria;
DROP SEQUENCE public.core_marca_id_seq;
DROP TABLE public.core_marca;
DROP SEQUENCE public.core_lista_id_seq;
DROP TABLE public.core_lista;
DROP SEQUENCE public.core_imagen_id_seq;
DROP TABLE public.core_imagen;
DROP SEQUENCE public.core_equiporenta_id_seq;
DROP TABLE public.core_equiporenta;
DROP SEQUENCE public.core_encuestasatisfaccion_id_seq;
DROP TABLE public.core_encuestasatisfaccion;
DROP SEQUENCE public.core_distribuidor_id_seq;
DROP TABLE public.core_distribuidor;
DROP SEQUENCE public.core_contacto_id_seq;
DROP TABLE public.core_contacto;
DROP SEQUENCE public.core_cliente_id_seq;
DROP TABLE public.core_cliente;
DROP SEQUENCE public.core_categoria_id_seq;
DROP TABLE public.core_categoria;
DROP SEQUENCE public.core_block_id_seq;
DROP TABLE public.core_block;
DROP SEQUENCE public.core_bitacora_id_seq;
DROP TABLE public.core_bitacora;
DROP SEQUENCE public.core_actividad_id_seq;
DROP TABLE public.core_actividad;
DROP SEQUENCE public.auth_user_user_permissions_id_seq;
DROP TABLE public.auth_user_user_permissions;
DROP SEQUENCE public.auth_user_id_seq;
DROP SEQUENCE public.auth_user_groups_id_seq;
DROP TABLE public.auth_user_groups;
DROP TABLE public.auth_user;
DROP SEQUENCE public.auth_permission_id_seq;
DROP TABLE public.auth_permission;
DROP SEQUENCE public.auth_group_permissions_id_seq;
DROP TABLE public.auth_group_permissions;
DROP SEQUENCE public.auth_group_id_seq;
DROP TABLE public.auth_group;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_permission_id_seq', 174, true);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    password character varying(128) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_id_seq', 12, true);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Name: core_actividad; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE core_actividad (
    id integer NOT NULL,
    titulo character varying(150) NOT NULL,
    creado timestamp with time zone NOT NULL,
    usuario_creado_id integer NOT NULL,
    usuario_asignado_id integer,
    descripcion text NOT NULL,
    confirmar boolean NOT NULL,
    fecha_inicio timestamp with time zone NOT NULL,
    fecha_termino timestamp with time zone NOT NULL,
    cancelado boolean NOT NULL
);


--
-- Name: core_actividad_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE core_actividad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: core_actividad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE core_actividad_id_seq OWNED BY core_actividad.id;


--
-- Name: core_actividad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('core_actividad_id_seq', 5, true);


--
-- Name: core_bitacora; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE core_bitacora (
    id integer NOT NULL,
    tipo integer NOT NULL,
    cliente_id integer,
    fecha_modificado timestamp with time zone NOT NULL,
    usuario_modificado_id integer NOT NULL,
    usuario_id integer NOT NULL,
    folio integer NOT NULL,
    fecha date NOT NULL,
    fecha_factura date,
    clave character varying(255) NOT NULL,
    descripcion character varying(255) NOT NULL,
    accesorios character varying(255) NOT NULL,
    num_factura character varying(255) NOT NULL,
    guia character varying(10) NOT NULL,
    falla text NOT NULL,
    acciones_correctivas text NOT NULL,
    refacciones text NOT NULL,
    observaciones text NOT NULL,
    estado integer NOT NULL,
    cable_corriente_lap boolean NOT NULL,
    bateria boolean NOT NULL,
    otros_lap boolean NOT NULL,
    otros_especificar_lap character varying(250) NOT NULL,
    contrasena_bios character varying(250) NOT NULL,
    contrasena_sesion character varying(250) NOT NULL,
    bandeja boolean NOT NULL,
    toner boolean NOT NULL,
    cartuchos_tinta boolean NOT NULL,
    cabezales boolean NOT NULL,
    cable_usb boolean NOT NULL,
    cable_paralelo boolean NOT NULL,
    cable_corriente_imp boolean NOT NULL,
    otros_imp boolean NOT NULL,
    otros_especificar_imp character varying(250) NOT NULL,
    monitor boolean NOT NULL,
    sesion boolean NOT NULL,
    sesion_especificar character varying(250) NOT NULL,
    password boolean NOT NULL,
    password_especificar character varying(250) NOT NULL,
    cable_corriente boolean NOT NULL,
    fecha_vencimiento date,
    fecha_aviso date,
    equipo character varying(250),
    marca character varying(250),
    no_serie character varying(250),
    modelo character varying(250),
    otros_pc boolean,
    otros_especificar_pc character varying(250),
    otros text
);


--
-- Name: core_bitacora_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE core_bitacora_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: core_bitacora_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE core_bitacora_id_seq OWNED BY core_bitacora.id;


--
-- Name: core_bitacora_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('core_bitacora_id_seq', 51, true);


--
-- Name: core_block; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE core_block (
    id integer NOT NULL,
    texto text NOT NULL
);


--
-- Name: core_block_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE core_block_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: core_block_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE core_block_id_seq OWNED BY core_block.id;


--
-- Name: core_block_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('core_block_id_seq', 7, true);


--
-- Name: core_categoria; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE core_categoria (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL
);


--
-- Name: core_categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE core_categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: core_categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE core_categoria_id_seq OWNED BY core_categoria.id;


--
-- Name: core_categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('core_categoria_id_seq', 6, true);


--
-- Name: core_cliente; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE core_cliente (
    id integer NOT NULL,
    numero integer,
    rfc character varying(255) NOT NULL,
    nombre character varying(255) NOT NULL,
    direccion character varying(255) NOT NULL,
    ciudad character varying(255) NOT NULL,
    estado character varying(255) NOT NULL,
    celular character varying(255) NOT NULL,
    telefono character varying(255) NOT NULL,
    telefono_extra character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    vendedor character varying(255) NOT NULL,
    contacto character varying(255) NOT NULL,
    desactivar_email boolean NOT NULL,
    CONSTRAINT core_cliente_numero_check CHECK ((numero >= 0))
);


--
-- Name: core_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE core_cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: core_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE core_cliente_id_seq OWNED BY core_cliente.id;


--
-- Name: core_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('core_cliente_id_seq', 11, true);


--
-- Name: core_contacto; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE core_contacto (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    email character varying(75)
);


--
-- Name: core_contacto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE core_contacto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: core_contacto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE core_contacto_id_seq OWNED BY core_contacto.id;


--
-- Name: core_contacto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('core_contacto_id_seq', 12, true);


--
-- Name: core_distribuidor; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE core_distribuidor (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    distribuidor boolean NOT NULL,
    clave_modificacion character varying(50) NOT NULL,
    fecha_clave date,
    no_clientes_interno integer,
    clasificacion_interno character varying(255) NOT NULL,
    no_vendedor_interno integer,
    dias_credito_interno integer,
    limite_credito_interno integer,
    razon_social character varying(255) NOT NULL,
    nombre_comercial character varying(255) NOT NULL,
    domicilio character varying(255) NOT NULL,
    colonia character varying(255) NOT NULL,
    ciudad character varying(255) NOT NULL,
    estado character varying(255) NOT NULL,
    rfc character varying(15) NOT NULL,
    curp character varying(255) NOT NULL,
    telefono character varying(255) NOT NULL,
    fax character varying(255) NOT NULL,
    cp character varying(5) NOT NULL,
    pagina_web character varying(250) NOT NULL,
    representante_apellido_paterno character varying(255) NOT NULL,
    representante_apellido_materno character varying(255) NOT NULL,
    representante_nombre character varying(255) NOT NULL,
    representante_domicilio character varying(255) NOT NULL,
    representante_colonia character varying(255) NOT NULL,
    representante_ciudad character varying(255) NOT NULL,
    representante_estado character varying(255) NOT NULL,
    representante_telefono character varying(255) NOT NULL,
    representante_email character varying(75) NOT NULL,
    desactivar_email boolean NOT NULL,
    representante_identificacion character varying(255) NOT NULL,
    vendedor character varying(255) NOT NULL,
    dias_credito integer NOT NULL,
    limite_credito character varying(255) NOT NULL,
    pagos_banco_1 character varying(255) NOT NULL,
    pagos_no_cuenta_1 character varying(255) NOT NULL,
    pagos_banco_2 character varying(255) NOT NULL,
    pagos_no_cuenta_2 character varying(255) NOT NULL,
    contacto_revision_facturas character varying(255) NOT NULL,
    dias_revision character varying(255) NOT NULL,
    horario_revision character varying(255) NOT NULL,
    telefono_revision character varying(255) NOT NULL,
    encargado_departamento_pago character varying(255) NOT NULL,
    encargado_entregas_pago character varying(255) NOT NULL,
    email_pago character varying(255) NOT NULL,
    telefono_pago character varying(255) NOT NULL,
    dias_pago character varying(255) NOT NULL,
    horario_pago character varying(255) NOT NULL,
    pagina_web_pago character varying(255) NOT NULL,
    correo_envio_facturas character varying(75) NOT NULL,
    documento_revision_pago character varying(10000000) NOT NULL,
    almacen_domicilio character varying(255) NOT NULL,
    almacen_colonia character varying(255) NOT NULL,
    almacen_telefono character varying(255) NOT NULL,
    almacen_horario character varying(255) NOT NULL,
    almacen_atencion_a character varying(255) NOT NULL,
    lugar integer NOT NULL,
    tiempo_residir character varying(255) NOT NULL,
    giro_principal character varying(255) NOT NULL,
    no_empleados character varying(255) NOT NULL,
    titular_cuenta character varying(255) NOT NULL,
    banco character varying(255) NOT NULL,
    no_cuenta character varying(255) NOT NULL,
    sucursal character varying(255) NOT NULL,
    ejecutivo character varying(255) NOT NULL,
    telefono_bancarias character varying(255) NOT NULL,
    promedio_mensual character varying(255) NOT NULL,
    antiguedad_bancarias character varying(255) NOT NULL,
    observaciones character varying(255) NOT NULL,
    nombre_empresa character varying(255) NOT NULL,
    ciudad_comerciales character varying(255) NOT NULL,
    estado_comerciales character varying(255) NOT NULL,
    atencion_comerciales character varying(255) NOT NULL,
    telefono_comerciales character varying(255) NOT NULL,
    antiguedad_comerciales character varying(255) NOT NULL,
    dias_credito_comerciales character varying(255) NOT NULL,
    credito_comerciales character varying(255) NOT NULL,
    forma_pago_comerciales character varying(255) NOT NULL,
    copia_rfc character varying(1000000),
    copia_alta character varying(1000000),
    copia_identificacion character varying(1000000),
    copia_comprobante_domicilio character varying(1000000),
    CONSTRAINT core_distribuidor_dias_credito_interno_check CHECK ((dias_credito_interno >= 0)),
    CONSTRAINT core_distribuidor_limite_credito_interno_check CHECK ((limite_credito_interno >= 0)),
    CONSTRAINT core_distribuidor_no_clientes_interno_check CHECK ((no_clientes_interno >= 0)),
    CONSTRAINT core_distribuidor_no_vendedor_interno_check CHECK ((no_vendedor_interno >= 0))
);


--
-- Name: core_distribuidor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE core_distribuidor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: core_distribuidor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE core_distribuidor_id_seq OWNED BY core_distribuidor.id;


--
-- Name: core_distribuidor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('core_distribuidor_id_seq', 1, true);


--
-- Name: core_encuestasatisfaccion; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE core_encuestasatisfaccion (
    id integer NOT NULL,
    creado timestamp with time zone NOT NULL,
    pregunta_1 integer NOT NULL,
    pregunta_2 integer NOT NULL,
    pregunta_3 integer NOT NULL,
    pregunta_4 integer NOT NULL,
    pregunta_5 integer NOT NULL,
    pregunta_6 integer,
    pregunta_6_1 integer NOT NULL,
    pregunta_6_2 integer NOT NULL,
    pregunta_6_3 integer NOT NULL,
    pregunta_6_4 integer NOT NULL,
    pregunta_6_5 integer NOT NULL,
    pregunta_6_6 integer NOT NULL,
    pregunta_6_7 integer NOT NULL,
    pregunta_7 integer,
    pregunta_7_1 integer NOT NULL,
    pregunta_7_2 integer NOT NULL,
    pregunta_7_3 integer NOT NULL,
    pregunta_7_4 integer NOT NULL,
    pregunta_7_5 integer NOT NULL,
    pregunta_8 integer NOT NULL,
    pregunta_9 integer NOT NULL,
    comentarios text NOT NULL,
    razon_social character varying(255) NOT NULL,
    puesto character varying(255) NOT NULL,
    CONSTRAINT core_encuestasatisfaccion_pregunta_1_check CHECK ((pregunta_1 >= 0)),
    CONSTRAINT core_encuestasatisfaccion_pregunta_2_check CHECK ((pregunta_2 >= 0)),
    CONSTRAINT core_encuestasatisfaccion_pregunta_3_check CHECK ((pregunta_3 >= 0)),
    CONSTRAINT core_encuestasatisfaccion_pregunta_4_check CHECK ((pregunta_4 >= 0)),
    CONSTRAINT core_encuestasatisfaccion_pregunta_5_check CHECK ((pregunta_5 >= 0)),
    CONSTRAINT core_encuestasatisfaccion_pregunta_6_1_check CHECK ((pregunta_6_1 >= 0)),
    CONSTRAINT core_encuestasatisfaccion_pregunta_6_2_check CHECK ((pregunta_6_2 >= 0)),
    CONSTRAINT core_encuestasatisfaccion_pregunta_6_3_check CHECK ((pregunta_6_3 >= 0)),
    CONSTRAINT core_encuestasatisfaccion_pregunta_6_4_check CHECK ((pregunta_6_4 >= 0)),
    CONSTRAINT core_encuestasatisfaccion_pregunta_6_5_check CHECK ((pregunta_6_5 >= 0)),
    CONSTRAINT core_encuestasatisfaccion_pregunta_6_6_check CHECK ((pregunta_6_6 >= 0)),
    CONSTRAINT core_encuestasatisfaccion_pregunta_6_7_check CHECK ((pregunta_6_7 >= 0)),
    CONSTRAINT core_encuestasatisfaccion_pregunta_6_check CHECK ((pregunta_6 >= 0)),
    CONSTRAINT core_encuestasatisfaccion_pregunta_7_1_check CHECK ((pregunta_7_1 >= 0)),
    CONSTRAINT core_encuestasatisfaccion_pregunta_7_2_check CHECK ((pregunta_7_2 >= 0)),
    CONSTRAINT core_encuestasatisfaccion_pregunta_7_3_check CHECK ((pregunta_7_3 >= 0)),
    CONSTRAINT core_encuestasatisfaccion_pregunta_7_4_check CHECK ((pregunta_7_4 >= 0)),
    CONSTRAINT core_encuestasatisfaccion_pregunta_7_5_check CHECK ((pregunta_7_5 >= 0)),
    CONSTRAINT core_encuestasatisfaccion_pregunta_7_check CHECK ((pregunta_7 >= 0)),
    CONSTRAINT core_encuestasatisfaccion_pregunta_8_check CHECK ((pregunta_8 >= 0)),
    CONSTRAINT core_encuestasatisfaccion_pregunta_9_check CHECK ((pregunta_9 >= 0))
);


--
-- Name: core_encuestasatisfaccion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE core_encuestasatisfaccion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: core_encuestasatisfaccion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE core_encuestasatisfaccion_id_seq OWNED BY core_encuestasatisfaccion.id;


--
-- Name: core_encuestasatisfaccion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('core_encuestasatisfaccion_id_seq', 11, true);


--
-- Name: core_equiporenta; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE core_equiporenta (
    id integer NOT NULL,
    marca character varying(255) NOT NULL,
    modelo character varying(255) NOT NULL,
    descripcion character varying(255) NOT NULL,
    categoria character varying(255) NOT NULL,
    disponible boolean DEFAULT true NOT NULL,
    valor numeric(12,2) DEFAULT 0 NOT NULL,
    no_serie integer DEFAULT 0 NOT NULL
);


--
-- Name: core_equiporenta_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE core_equiporenta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: core_equiporenta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE core_equiporenta_id_seq OWNED BY core_equiporenta.id;


--
-- Name: core_equiporenta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('core_equiporenta_id_seq', 9, true);


--
-- Name: core_imagen; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE core_imagen (
    id integer NOT NULL,
    creado timestamp with time zone NOT NULL,
    fecha_vencimiento date,
    activo boolean NOT NULL,
    imagen_chica character varying(2000000),
    imagen_grande character varying(2000000)
);


--
-- Name: core_imagen_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE core_imagen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: core_imagen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE core_imagen_id_seq OWNED BY core_imagen.id;


--
-- Name: core_imagen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('core_imagen_id_seq', 4, true);


--
-- Name: core_lista; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE core_lista (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    fecha_vencimiento date,
    archivo character varying(10000000)
);


--
-- Name: core_lista_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE core_lista_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: core_lista_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE core_lista_id_seq OWNED BY core_lista.id;


--
-- Name: core_lista_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('core_lista_id_seq', 6, true);


--
-- Name: core_marca; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE core_marca (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    logo character varying(1000000) NOT NULL
);


--
-- Name: core_marca_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE core_marca_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: core_marca_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE core_marca_id_seq OWNED BY core_marca.id;


--
-- Name: core_marca_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('core_marca_id_seq', 7, true);


--
-- Name: core_marcacategoria; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE core_marcacategoria (
    id integer NOT NULL,
    marca_id integer NOT NULL,
    categoria_id integer NOT NULL,
    url character varying(255) NOT NULL
);


--
-- Name: core_marcacategoria_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE core_marcacategoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: core_marcacategoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE core_marcacategoria_id_seq OWNED BY core_marcacategoria.id;


--
-- Name: core_marcacategoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('core_marcacategoria_id_seq', 8, true);


--
-- Name: core_mensajecontacto; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE core_mensajecontacto (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    empresa character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    telefono character varying(255) NOT NULL,
    comentarios text NOT NULL,
    desactivar_email boolean DEFAULT false NOT NULL
);


--
-- Name: core_mensajecontacto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE core_mensajecontacto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: core_mensajecontacto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE core_mensajecontacto_id_seq OWNED BY core_mensajecontacto.id;


--
-- Name: core_mensajecontacto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('core_mensajecontacto_id_seq', 10, true);


--
-- Name: core_perfil; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE core_perfil (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    color character varying(10) NOT NULL,
    departamento character varying(100) DEFAULT ''::character varying,
    extension character varying(100) DEFAULT ''::character varying,
    sucursal integer
);


--
-- Name: core_perfil_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE core_perfil_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: core_perfil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE core_perfil_id_seq OWNED BY core_perfil.id;


--
-- Name: core_perfil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('core_perfil_id_seq', 9, true);


--
-- Name: core_personaautorizada; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE core_personaautorizada (
    id integer NOT NULL,
    distribuidor_id integer NOT NULL,
    apellido_paterno character varying(255) NOT NULL,
    apellido_materno character varying(255) NOT NULL,
    nombre character varying(255) NOT NULL,
    puesto character varying(255) NOT NULL,
    numero_ife character varying(255) NOT NULL
);


--
-- Name: core_personaautorizada_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE core_personaautorizada_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: core_personaautorizada_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE core_personaautorizada_id_seq OWNED BY core_personaautorizada.id;


--
-- Name: core_personaautorizada_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('core_personaautorizada_id_seq', 7, true);


--
-- Name: core_producto; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE core_producto (
    id integer NOT NULL,
    marca character varying(255) NOT NULL,
    tipo character varying(255) NOT NULL,
    clave character varying(255) NOT NULL,
    descripcion character varying(255) NOT NULL
);


--
-- Name: core_producto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE core_producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: core_producto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE core_producto_id_seq OWNED BY core_producto.id;


--
-- Name: core_producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('core_producto_id_seq', 452, true);


--
-- Name: core_renta; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE core_renta (
    id integer NOT NULL,
    folio integer NOT NULL,
    numero_cliente character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    cliente character varying(255) NOT NULL,
    responsable character varying(255) NOT NULL,
    direccion character varying(255) NOT NULL,
    ciudad character varying(255) NOT NULL,
    telefono character varying(255) NOT NULL,
    condicion integer NOT NULL,
    fecha_inicio date,
    fecha_final date,
    status boolean NOT NULL,
    CONSTRAINT core_renta_folio_check CHECK ((folio >= 0))
);


--
-- Name: core_renta_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE core_renta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: core_renta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE core_renta_id_seq OWNED BY core_renta.id;


--
-- Name: core_renta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('core_renta_id_seq', 3, true);


--
-- Name: core_rentadetalle; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE core_rentadetalle (
    id integer NOT NULL,
    renta_id integer NOT NULL,
    equipo_id integer NOT NULL
);


--
-- Name: core_rentadetalle_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE core_rentadetalle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: core_rentadetalle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE core_rentadetalle_id_seq OWNED BY core_rentadetalle.id;


--
-- Name: core_rentadetalle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('core_rentadetalle_id_seq', 33, true);


--
-- Name: core_solicitarcredito; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE core_solicitarcredito (
    id integer NOT NULL,
    distribuidor boolean NOT NULL,
    razon_social character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    banco_1 character varying(255) NOT NULL,
    pagos_no_cuenta_1 character varying(255) NOT NULL,
    pagos_banco_2 character varying(255) NOT NULL,
    pagos_no_cuenta_2 character varying(255) NOT NULL,
    rc_nombre_empresa_1 character varying(255) NOT NULL,
    rc_ciudad_estado_1 character varying(255) NOT NULL,
    rc_atencion_1 character varying(255) NOT NULL,
    rc_telefono_1 character varying(255) NOT NULL,
    rc_antiguedad_1 character varying(255) NOT NULL,
    rc_dias_credito_1 character varying(255) NOT NULL,
    monto_credito_1 character varying(255) NOT NULL,
    forma_pago_1 character varying(255) NOT NULL,
    rc_nombre_empresa_2 character varying(255) NOT NULL,
    rc_ciudad_estado_2 character varying(255) NOT NULL,
    rc_atencion_2 character varying(255) NOT NULL,
    rc_telefono_2 character varying(255) NOT NULL,
    rc_antiguedad_2 character varying(255) NOT NULL,
    rc_dias_credito_2 character varying(255) NOT NULL,
    monto_credito_2 character varying(255) NOT NULL,
    forma_pago_2 character varying(255) NOT NULL,
    rc_nombre_empresa_3 character varying(255) NOT NULL,
    rc_ciudad_estado_3 character varying(255) NOT NULL,
    rc_atencion_3 character varying(255) NOT NULL,
    rc_telefono_3 character varying(255) NOT NULL,
    rc_antiguedad_3 character varying(255) NOT NULL,
    rc_dias_credito_3 character varying(255) NOT NULL,
    monto_credito_3 character varying(255) NOT NULL,
    forma_pago_3 character varying(255) NOT NULL
);


--
-- Name: core_solicitarcredito_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE core_solicitarcredito_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: core_solicitarcredito_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE core_solicitarcredito_id_seq OWNED BY core_solicitarcredito.id;


--
-- Name: core_solicitarcredito_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('core_solicitarcredito_id_seq', 2, true);


--
-- Name: core_solicitudtrabajo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE core_solicitudtrabajo (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    nombre character varying(255) NOT NULL,
    apellido character varying(255) NOT NULL,
    telefono character varying(255) NOT NULL,
    email character varying(75) NOT NULL,
    vacante_id integer,
    aspiracion character varying(255) NOT NULL,
    curriculum character varying(10000000) NOT NULL,
    desactivar_email boolean NOT NULL
);


--
-- Name: core_solicitudtrabajo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE core_solicitudtrabajo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: core_solicitudtrabajo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE core_solicitudtrabajo_id_seq OWNED BY core_solicitudtrabajo.id;


--
-- Name: core_solicitudtrabajo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('core_solicitudtrabajo_id_seq', 1, true);


--
-- Name: core_status; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE core_status (
    id integer NOT NULL,
    creado timestamp with time zone NOT NULL,
    usuario_id integer NOT NULL,
    bitacora_id integer NOT NULL,
    status text NOT NULL
);


--
-- Name: core_status_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE core_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: core_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE core_status_id_seq OWNED BY core_status.id;


--
-- Name: core_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('core_status_id_seq', 39, true);


--
-- Name: core_vacante; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE core_vacante (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion text NOT NULL,
    sueldo character varying(255) NOT NULL,
    ciudad integer
);


--
-- Name: core_vacante_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE core_vacante_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: core_vacante_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE core_vacante_id_seq OWNED BY core_vacante.id;


--
-- Name: core_vacante_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('core_vacante_id_seq', 10, true);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_content_type_id_seq', 38, true);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: django_site; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Name: probador_url; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE probador_url (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


--
-- Name: probador_url_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE probador_url_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: probador_url_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE probador_url_id_seq OWNED BY probador_url.id;


--
-- Name: probador_url_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('probador_url_id_seq', 122, true);


--
-- Name: probador_urlparametro; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE probador_urlparametro (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


--
-- Name: probador_urlparametro_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE probador_urlparametro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: probador_urlparametro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE probador_urlparametro_id_seq OWNED BY probador_urlparametro.id;


--
-- Name: probador_urlparametro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('probador_urlparametro_id_seq', 105, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE core_actividad ALTER COLUMN id SET DEFAULT nextval('core_actividad_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE core_bitacora ALTER COLUMN id SET DEFAULT nextval('core_bitacora_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE core_block ALTER COLUMN id SET DEFAULT nextval('core_block_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE core_categoria ALTER COLUMN id SET DEFAULT nextval('core_categoria_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE core_cliente ALTER COLUMN id SET DEFAULT nextval('core_cliente_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE core_contacto ALTER COLUMN id SET DEFAULT nextval('core_contacto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE core_distribuidor ALTER COLUMN id SET DEFAULT nextval('core_distribuidor_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE core_encuestasatisfaccion ALTER COLUMN id SET DEFAULT nextval('core_encuestasatisfaccion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE core_equiporenta ALTER COLUMN id SET DEFAULT nextval('core_equiporenta_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE core_imagen ALTER COLUMN id SET DEFAULT nextval('core_imagen_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE core_lista ALTER COLUMN id SET DEFAULT nextval('core_lista_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE core_marca ALTER COLUMN id SET DEFAULT nextval('core_marca_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE core_marcacategoria ALTER COLUMN id SET DEFAULT nextval('core_marcacategoria_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE core_mensajecontacto ALTER COLUMN id SET DEFAULT nextval('core_mensajecontacto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE core_perfil ALTER COLUMN id SET DEFAULT nextval('core_perfil_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE core_personaautorizada ALTER COLUMN id SET DEFAULT nextval('core_personaautorizada_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE core_producto ALTER COLUMN id SET DEFAULT nextval('core_producto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE core_renta ALTER COLUMN id SET DEFAULT nextval('core_renta_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE core_rentadetalle ALTER COLUMN id SET DEFAULT nextval('core_rentadetalle_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE core_solicitarcredito ALTER COLUMN id SET DEFAULT nextval('core_solicitarcredito_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE core_solicitudtrabajo ALTER COLUMN id SET DEFAULT nextval('core_solicitudtrabajo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE core_status ALTER COLUMN id SET DEFAULT nextval('core_status_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE core_vacante ALTER COLUMN id SET DEFAULT nextval('core_vacante_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE probador_url ALTER COLUMN id SET DEFAULT nextval('probador_url_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE probador_urlparametro ALTER COLUMN id SET DEFAULT nextval('probador_urlparametro_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
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
19	Can add site	7	add_site
20	Can change site	7	change_site
21	Can delete site	7	delete_site
22	Can add producto	8	add_producto
23	Can change producto	8	change_producto
24	Can delete producto	8	delete_producto
25	Can add imagen	9	add_imagen
26	Can change imagen	9	change_imagen
27	Can delete imagen	9	delete_imagen
28	Can add lista	10	add_lista
29	Can change lista	10	change_lista
30	Can delete lista	10	delete_lista
31	Can add contacto	11	add_contacto
32	Can change contacto	11	change_contacto
33	Can delete contacto	11	delete_contacto
34	Can add cliente	12	add_cliente
35	Can change cliente	12	change_cliente
36	Can delete cliente	12	delete_cliente
37	Can add bitacora	13	add_bitacora
38	Can change bitacora	13	change_bitacora
39	Can delete bitacora	13	delete_bitacora
40	Can add vacante	14	add_vacante
41	Can change vacante	14	change_vacante
42	Can delete vacante	14	delete_vacante
43	Can add solicitud trabajo	15	add_solicitudtrabajo
44	Can change solicitud trabajo	15	change_solicitudtrabajo
45	Can delete solicitud trabajo	15	delete_solicitudtrabajo
46	Can add distribuidor	16	add_distribuidor
47	Can change distribuidor	16	change_distribuidor
48	Can delete distribuidor	16	delete_distribuidor
49	Can add persona autorizada	17	add_personaautorizada
50	Can change persona autorizada	17	change_personaautorizada
51	Can delete persona autorizada	17	delete_personaautorizada
52	Can add mensaje contacto	18	add_mensajecontacto
53	Can change mensaje contacto	18	change_mensajecontacto
54	Can delete mensaje contacto	18	delete_mensajecontacto
127	Can add equipo renta	23	add_equiporenta
128	Can change equipo renta	23	change_equiporenta
129	Can delete equipo renta	23	delete_equiporenta
58	Can add categoria	20	add_categoria
59	Can change categoria	20	change_categoria
60	Can delete categoria	20	delete_categoria
133	Can add renta detalle	25	add_rentadetalle
134	Can change renta detalle	25	change_rentadetalle
135	Can delete renta detalle	25	delete_rentadetalle
136	Can add block	26	add_block
137	Can change block	26	change_block
138	Can delete block	26	delete_block
139	Can add solicitar credito	27	add_solicitarcredito
140	Can change solicitar credito	27	change_solicitarcredito
141	Can delete solicitar credito	27	delete_solicitarcredito
142	Can add url	28	add_url
143	Can change url	28	change_url
144	Can delete url	28	delete_url
145	Can add url parametro	29	add_urlparametro
146	Can change url parametro	29	change_urlparametro
147	Can delete url parametro	29	delete_urlparametro
148	Can add modelo	30	add_modelo
149	Can change modelo	30	change_modelo
150	Can delete modelo	30	delete_modelo
151	Can add estado	31	add_estado
152	Can change estado	31	change_estado
153	Can delete estado	31	delete_estado
154	Can add ciudad	34	add_ciudad
155	Can change ciudad	34	change_ciudad
156	Can delete ciudad	34	delete_ciudad
157	Can add direccion	33	add_direccion
158	Can change direccion	33	change_direccion
159	Can delete direccion	33	delete_direccion
160	Can add condicion	32	add_condicion
161	Can change condicion	32	change_condicion
162	Can delete condicion	32	delete_condicion
163	Can add status	35	add_status
164	Can change status	35	change_status
165	Can delete status	35	delete_status
166	Can add actividad	36	add_actividad
167	Can change actividad	36	change_actividad
168	Can delete actividad	36	delete_actividad
172	Can add encuesta satisfaccion	38	add_encuestasatisfaccion
173	Can change encuesta satisfaccion	38	change_encuestasatisfaccion
174	Can delete encuesta satisfaccion	38	delete_encuestasatisfaccion
130	Can add renta	24	add_renta
131	Can change renta	24	change_renta
132	Can delete renta	24	delete_renta
169	Can add perfil	37	add_perfil
170	Can change perfil	37	change_perfil
171	Can delete perfil	37	delete_perfil
121	Can add marca	21	add_marca
122	Can change marca	21	change_marca
123	Can delete marca	21	delete_marca
124	Can add marca categoria	22	add_marcacategoria
125	Can change marca categoria	22	change_marcacategoria
126	Can delete marca categoria	22	delete_marcacategoria
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user (id, username, first_name, last_name, email, password, is_staff, is_active, is_superuser, last_login, date_joined) FROM stdin;
10	fer44dd	Jhon	tecnicos	asaf@asd.asd	!	f	t	t	2011-12-13 17:12:31.168919-07	2011-12-13 17:12:31.168984-07
11	fer3		administrador	fer@asd.ss	sha1$YnXTpwkXFohv$6754989076e9a8ffca5477cecfe339973d67fe1f	t	t	t	2012-01-20 12:24:57.630496-07	2011-12-14 11:58:43.660624-07
6	fer		administrador	fer@asd.asd	!	t	t	t	2011-12-06 14:42:44.181398-07	2011-11-28 14:27:51.349563-07
1	ferss	ferasd	bolsa_trabajo	fer@hot.com	!	t	t	t	2011-11-25 14:30:19.685127-07	2011-09-27 10:38:57.945162-07
8	fer5	fernadno	clientes	fer@asd.asd	!	f	t	f	2011-12-13 15:19:31.773552-07	2011-12-13 15:18:54.472423-07
7	fer2		administrador	fer@ads.asd	!	t	t	t	2011-12-14 08:57:14.265744-07	2011-12-07 09:05:02.901811-07
4	a		arrendamiento	a@aaa.aaa	!	t	t	t	2011-10-19 12:26:29.253869-07	2011-10-19 12:26:12.310032-07
5	Fernando	Fer	administrador	fer@asd.asd	!	f	t	t	2011-11-25 17:03:31.066865-07	2011-11-25 17:03:31.066939-07
12	asd asd a	asd	bolsa_trabajo	fer@asd.asd	sha1$1q9vlncVocn1$4bee9a864cc82a15ade1f5a6f5ecfb07cfe91a00	f	t	f	2012-01-06 17:42:32.199753-07	2012-01-06 17:42:32.199819-07
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: core_actividad; Type: TABLE DATA; Schema: public; Owner: -
--

COPY core_actividad (id, titulo, creado, usuario_creado_id, usuario_asignado_id, descripcion, confirmar, fecha_inicio, fecha_termino, cancelado) FROM stdin;
1	TASDE	2011-12-20 09:48:45.466613-07	11	5	asdasd	t	2011-12-21 09:00:00-07	2011-12-22 08:00:00-07	f
4	asdadas	2011-12-20 10:42:22.506177-07	11	\N	4234	f	2011-12-20 08:00:00-07	2011-12-20 08:00:00-07	t
5	fdsf	2011-12-20 10:47:32.42098-07	11	1	sdffd	t	2011-12-20 08:00:00-07	2011-12-31 08:00:00-07	f
\.


--
-- Data for Name: core_bitacora; Type: TABLE DATA; Schema: public; Owner: -
--

COPY core_bitacora (id, tipo, cliente_id, fecha_modificado, usuario_modificado_id, usuario_id, folio, fecha, fecha_factura, clave, descripcion, accesorios, num_factura, guia, falla, acciones_correctivas, refacciones, observaciones, estado, cable_corriente_lap, bateria, otros_lap, otros_especificar_lap, contrasena_bios, contrasena_sesion, bandeja, toner, cartuchos_tinta, cabezales, cable_usb, cable_paralelo, cable_corriente_imp, otros_imp, otros_especificar_imp, monitor, sesion, sesion_especificar, password, password_especificar, cable_corriente, fecha_vencimiento, fecha_aviso, equipo, marca, no_serie, modelo, otros_pc, otros_especificar_pc, otros) FROM stdin;
14	2	\N	2011-12-20 09:01:22.657438-07	11	11	3	2011-12-16	\N					0003068	jljkjsadasdas ada\r\ndsd \r\nasd\r\nasd asdasdñlf ñsdfl kñsdfk sdlkflsñd lsñdk sñdlfks dñlskd fsdfsdjljkjsadasdas ada\r\ndsd \r\nasd\r\nasd asdasdñlf ñsdfl kñsdfk sdlkflsñd lsñdk sñdlfks dñlskd fsdfsdjljkjsadasdas ada\r\ndsd \r\nasd\r\nasd asdasdñlf ñsdfl kñsdfk sdlkflsñd lsñdk sñdlfks dñlskd fsdfsdjljkjsadasdas ada\r\ndsd \r\nasd\r\nasd asdasdñlf ñsdfl kñsdfk sdlkflsñd lsñdk sñdlfks dñlskd fsdfsdjljkjsadasdas ada\r\ndsd \r\nasd\r\nasd asdasdñlf ñsdfl kñsdfk sdlkflsñd lsñdk sñdlfks dñlskd fsdfsdjljkjsadasdas ada\r\ndsd \r\nasd\r\nasd asdasdñlf ñsdfl kñsdfk sdlkflsñd lsñdk sñdlfks dñlskd fsdfsdjljkjsadasdas ada\r\ndsd \r\nasd\r\nasd asdasdñlf ñsdfl kñsdfk sdlkflsñd lsñdk sñdlfks dñlskd fsdfsdjljkjsadasdas ada\r\ndsd \r\nasd\r\nasd asdasdñlf ñsdfl kñsdfk sdlkflsñd lsñdk sñdlfks dñlskd fsdfsdjljkjsadasdas ada\r\ndsd \r\nasd\r\nasd asdasdñlf ñsdfl kñsdfk sdlkflsñd lsñdk sñdlfks dñlskd fsdfsdjljkjsadasdas ada\r\ndsd \r\nasd\r\nasd asdasdñlf ñsdfl kñsdfk sdlkflsñd lsñdk sñdlfks dñlskd fsdfsdjljkjsadasdas ada\r\ndsd \r\nasd\r\nasd asdasdñlf ñsdfl kñsdfk sdlkflsñd lsñdk sñdlfks dñlskd fsdfsdjljkjsadasdas ada\r\ndsd \r\nasd\r\nasd asdasdñlf ñsdfl kñsdfk sdlkflsñd lsñdk sñdlfks dñlskd fsdfsdjljkjsadasdas ada\r\ndsd \r\nasd\r\nasd asdasdñlf ñsdfl kñsdfk sdlkflsñd lsñdk sñdlfks dñlskd fsdfsdjljkjsadasdas ada\r\ndsd \r\nasd\r\nasd asdasdñlf ñsdfl kñsdfk sdlkflsñd lsñdk sñdlfks dñlskd fsdfsdjljkjsadasdas ada\r\ndsd \r\nasd\r\nasd asdasdñlf ñsdfl kñsdfk sdlkflsñd lsñdk sñdlfks dñlskd fsdfsdjljkjsadasdas ada\r\ndsd \r\nasd\r\nasd asdasdñlf ñsdfl kñsdfk sdlkflsñd lsñdk sñdlfks dñlskd fsdfsdjljkjsadasdas ada\r\ndsd \r\nasd\r\nasd asdasdñlf ñsdfl kñsdfk sdlkflsñd lsñdk sñdlfks dñlskd fsdfsd				1	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	\N	\N	\N	\N	\N	\N	\N	\N	\N
24	0	1	2011-12-21 13:03:29.324215-07	11	11	9	2011-12-21	2011-12-08	asd	fsdf	sdf	sdf	0009537	sdf				0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	2012-01-20	2012-01-13	\N	\N	\N	\N	\N	\N	\N
1	1	1	2011-12-19 16:39:08.095235-07	11	11	1	2011-12-16	\N						df sdfsdfsf sdf sdf sdf sdf sdf 	dfgdfg	54456	456456	1	t	t	t	sdad	sadsad	asd	t	t	t	t	f	t	f	f		t	t	asdaad	f		f	\N	\N	\N	\N	\N	\N	\N	\N	\N
21	2	\N	2011-12-20 09:23:20.301797-07	11	11	6	2011-12-19	\N					0006083	asdefdssdf 				0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	2011-12-22	2011-12-20	\N	\N	\N	\N	\N	\N	\N
16	2	\N	2011-12-19 17:00:56.636848-07	11	11	4	2011-12-16	\N					0004853	asdasdsdfsdf	sdf	fdsdf	sdfsdfsd	0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	0	1	2011-12-19 16:29:15.772526-07	11	11	5	2011-12-16	2011-12-28	sad	sad	sda	sad	0005245	sdf222	sdf21111111	sdfdsdfsdf134444444444	sdfsd55555555	0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	2	\N	2011-12-19 17:36:17.567612-07	11	11	5	2011-12-19	\N					0005393	asdsda				0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	1	1	2011-12-19 17:38:56.630775-07	11	11	5	2011-12-19	\N					0005345	sdfsd				0	f	t	f				f	f	f	t	f	f	f	f		t	f		f		f	2011-12-26	2011-12-24	\N	\N	\N	\N	\N	\N	\N
20	0	1	2011-12-19 17:40:57.506856-07	11	11	8	2011-12-19	2011-12-13	asda	asd	asd	dsasd	0008570	fsdfsdf				0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	2012-01-18	2012-01-11	\N	\N	\N	\N	\N	\N	\N
7	0	1	2011-12-16 12:50:06.057724-07	11	11	2	2011-12-16	2011-12-07	234	324	234	234	0002375					3	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	0	1	2011-12-16 12:52:56.783448-07	11	11	1	2011-12-16	2011-12-14	32423	fsdfewr	234	34	0004487	dfs				2	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	1	1	2011-12-16 12:53:56.55848-07	11	11	3	2011-12-16	\N						fgrt45				2	t	t	f				t	t	t	f	f	f	f	f		f	f		f		f	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	0	1	2011-12-16 12:59:51.50889-07	11	11	4	2011-12-16	2011-12-21	w	qw	qw	234	0004533					0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	0	1	2011-12-16 13:00:34.005952-07	11	11	6	2011-12-16	2011-12-21	w	qw	qw	234	0006283					0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	\N	\N	\N	\N	\N	\N	\N	\N	\N
26	0	1	2011-12-21 13:04:06.720981-07	11	11	10	2011-12-21	2011-12-05	asd	asd	das	dsa	0010557					0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	2012-01-20	2012-01-13	\N	\N	\N	\N	\N	\N	\N
22	2	\N	2011-12-21 12:34:00.181398-07	11	11	7	2011-12-21	\N					0007106	fdg				0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	2011-12-24	2011-12-23	\N	\N	\N	\N	\N	\N	\N
12	2	\N	2011-12-16 13:24:16.319457-07	11	11	1	2011-12-16	\N					0001249	jljkj				2	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	1	1	2011-12-21 12:58:57.746881-07	11	11	2	2011-12-16	\N						345	sdf	sd	sdf	1	f	f	f		sdf	sdf	f	f	f	f	t	t	f	f		f	f		f		f	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	0	4	2011-12-16 15:23:37.514154-07	11	11	7	2011-12-16	2011-12-20	u	u	u	u	0007242	34234				0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	\N	\N	\N	\N	\N	\N	\N	\N	\N
27	2	\N	2011-12-21 13:04:34.211176-07	11	11	8	2011-12-21	\N					0008365	3333333333333333333332				0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	2011-12-24	2011-12-23	\N	\N	\N	\N	\N	\N	\N
8	0	1	2011-12-21 13:10:03.968121-07	11	11	3	2011-12-16	2011-12-28	sad	sad	sda	sad	0003094					2	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	\N	\N	\N	\N	\N	\N	\N	\N	\N
40	1	1	2012-01-16 16:45:08.245917-07	11	11	13	2012-01-16	\N					0013608	,mn,,,m				0	t	f	t				f	f	t	f	f	f	f	f		f	f		f		t	2012-01-23	2012-01-21	123	123	213	123	t	asd	\N
29	1	4	2011-12-21 17:03:58.170319-07	11	11	8	2011-12-21	\N					0008578	erwwer				0	t	t	f		wew	we	f	f	t	t	t	t	f	f		t	t	wer	t	wer	t	2011-12-28	2011-12-26	234	324	433	sdf	\N	\N	\N
32	1	1	2012-01-17 08:43:35.007548-07	11	11	10	2012-01-06	\N					0010368	dfgd				1	t	t	t	456	asd	asd	t	t	t	t	t	t	t	t	34	t	t	sdf	t	sdf	t	2012-01-13	2012-01-11	123	3	21	21	\N	\N	\N
30	0	4	2011-12-21 17:22:48.314709-07	11	11	11	2011-12-21	2011-12-27	asd	qwe	32	23	0011179	dw				0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	2012-01-20	2012-01-13					\N	\N	\N
31	1	4	2011-12-21 17:24:13.495571-07	11	11	9	2011-12-21	\N					0009560					0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	2011-12-28	2011-12-26	dqwe	we	wer	wer	\N	\N	\N
42	1	1	2012-01-17 09:04:44.488853-07	11	11	15	2012-01-16	\N					0015503	fersad				1	t	t	f		32	2332	t	t	t	t	f	f	f	t		t	f		f		t	2012-01-23	2012-01-21	as2332	32sa	asd	32	f		\N
33	0	9	2012-01-06 17:30:39.210314-07	11	11	12	2012-01-06	2012-01-25	ds	345	345	34	0012932	dfg				0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	2012-02-05	2012-01-29					\N	\N	\N
34	1	1	2012-01-06 17:31:49.195375-07	11	11	11	2012-01-06	\N					0011521					0	f	f	f				f	t	f	f	f	t	f	f		f	f		f		f	2012-01-13	2012-01-11	234	asd	a	as	\N	\N	\N
36	0	1	2012-01-06 17:38:44.607325-07	11	11	13	2012-01-06	2012-01-11	23	asd	asd	ads	0013623	asd				0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	2012-02-05	2012-01-29					\N	\N	\N
37	0	10	2012-01-06 17:39:09.508541-07	11	11	14	2012-01-06	2012-01-31	fasd	as	ads	das	0014906	sda				0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	2012-02-05	2012-01-29					\N	\N	\N
38	0	1	2012-01-06 17:39:53.740504-07	11	11	15	2012-01-06	2012-01-31	fasd	as	ads	das	0015383	sdasd				0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	2012-02-05	2012-01-29					\N	\N	\N
13	2	\N	2012-01-06 17:40:08.992124-07	11	11	2	2011-12-16	\N					0002444	adasdwwsad				2	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	\N	\N	\N	\N	\N	\N	\N	\N	\N
39	2	\N	2012-01-16 16:28:51.280059-07	11	11	9	2012-01-16	\N					0009440	asdas				0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	2012-01-19	2012-01-18					\N	\N	\N
41	1	1	2012-01-16 16:51:09.701507-07	11	11	14	2012-01-16	\N					0014348	fer				0	t	t	f		32	2332	t	t	t	t	f	f	f	f		t	f		f		f	2012-01-23	2012-01-21	2332	32	asd	32	f		\N
44	0	9	2012-01-16 16:57:35.902469-07	11	11	16	2012-01-16	2012-01-04	fer	123	213	123	0016194	fsdfsdfsdf				0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	2012-02-15	2012-02-08					f		\N
28	1	11	2012-01-17 08:35:09.725197-07	11	11	7	2011-12-21	\N					0007997	dsfsdf				0	t	t	f		23	34	f	f	t	t	t	f	f	f		f	t		t		f	2011-12-28	2011-12-26	asd	ads	233	as	f		\N
25	1	1	2012-01-17 08:42:43.894633-07	11	11	6	2011-12-21	\N					0006364	asasd				0	t	t	f				f	t	t	f	f	f	f	f		t	t	23	f		f	2011-12-28	2011-12-26	asd	asd	as	as	f		\N
35	1	9	2012-01-17 08:41:28.429284-07	11	11	12	2012-01-06	\N					0012755	adasd				1	f	f	f				t	f	t	t	f	f	f	f		f	f		f		f	2012-01-13	2012-01-11	sad	as	fer2	asd	f		\N
17	1	1	2012-01-17 08:42:56.704568-07	11	11	4	2011-12-16	\N					0004826					1	t	t	f				f	f	f	f	f	f	f	f		f	f		f		f	\N	\N	ads	asd	asd	asd	f		\N
43	1	9	2012-01-17 09:04:01.266083-07	11	11	16	2012-01-16	\N					0016696	sadas				1	f	t	f				f	f	t	f	f	t	t	f		f	f		t		f	2012-01-23	2012-01-21	asd	sad	sda	as	t	sad	\N
45	0	9	2012-01-16 17:00:19.501666-07	11	11	17	2012-01-16	2012-01-18	123	32	231	213	0017931	asdads				0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	2012-02-15	2012-02-08					f		\N
46	0	9	2012-01-16 17:00:32.192046-07	11	11	18	2012-01-16	2012-01-18	123	32	231	213	0018739	asdads				0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	2012-02-15	2012-02-08					f		\N
47	2	\N	2012-01-16 17:00:52.613391-07	11	11	10	2012-01-16	\N					0010082	dfg				0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	2012-01-19	2012-01-18					f		\N
48	2	\N	2012-01-17 08:33:08.607184-07	11	11	11	2012-01-17	\N					0011865	fasdas				0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	2012-01-20	2012-01-19					f		\N
49	1	1	2012-01-17 08:53:29.079188-07	11	11	17	2012-01-17	\N					0017800	sdf				0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	2012-01-24	2012-01-22	sdf	sdf	sd	sdf	f		\N
50	2	\N	2012-01-17 10:12:53.148481-07	11	11	12	2012-01-17	\N					0012125	dasdas				0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	2012-01-20	2012-01-19					f		
51	2	\N	2012-01-17 10:13:59.261358-07	11	11	13	2012-01-17	\N					0013020	dfd				0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	2012-01-20	2012-01-19					f		
\.


--
-- Data for Name: core_block; Type: TABLE DATA; Schema: public; Owner: -
--

COPY core_block (id, texto) FROM stdin;
4	dsfsadf
5	sdfsdfaddd22
6	gdfgdfg
7	44444444444 444444444444444444444
\.


--
-- Data for Name: core_categoria; Type: TABLE DATA; Schema: public; Owner: -
--

COPY core_categoria (id, nombre) FROM stdin;
4	ñp55
1	asdasd
3	qweqw
\.


--
-- Data for Name: core_cliente; Type: TABLE DATA; Schema: public; Owner: -
--

COPY core_cliente (id, numero, rfc, nombre, direccion, ciudad, estado, celular, telefono, telefono_extra, email, vendedor, contacto, desactivar_email) FROM stdin;
1	123	asd	asd	asd	asd	asd	asd	asd	asd	fer@asd.com	asd	asd	f
4	23423	1111111111111	ssssss	123123	123123	123	323	3323	23	fer@asd.asd	3	3	f
6	12	w	qw	fer	qw	w	qw	qw	q		wq	wq	f
7	123	w	qw	qw	w	qw	qw	qw	qw		w	q	f
8	\N	fer	123	123	231	12qw	qw	qwqw	qw	fe@asd.asd	qw	qw	f
9	\N	asdasd	asdasdasd22	qwqw	qw	qw	qw	qw	qw		q	w	f
10	\N	as	as sad s aa	ad	asdasd	qqwqwqw	qw	wq	qw		qw	345	f
11	\N		ass	dsda	da	a	a	a	a		asdas	a	f
\.


--
-- Data for Name: core_contacto; Type: TABLE DATA; Schema: public; Owner: -
--

COPY core_contacto (id, nombre, email) FROM stdin;
8	sadasd	dsasd@asdsa.adsdsa
9	asdasd	asd@asd.asd
10	asdasd	asdas@asd.sss
11	Elec	fernando@hot.com
12	fer	feer@sdasd.ass
\.


--
-- Data for Name: core_distribuidor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY core_distribuidor (id, created, distribuidor, clave_modificacion, fecha_clave, no_clientes_interno, clasificacion_interno, no_vendedor_interno, dias_credito_interno, limite_credito_interno, razon_social, nombre_comercial, domicilio, colonia, ciudad, estado, rfc, curp, telefono, fax, cp, pagina_web, representante_apellido_paterno, representante_apellido_materno, representante_nombre, representante_domicilio, representante_colonia, representante_ciudad, representante_estado, representante_telefono, representante_email, desactivar_email, representante_identificacion, vendedor, dias_credito, limite_credito, pagos_banco_1, pagos_no_cuenta_1, pagos_banco_2, pagos_no_cuenta_2, contacto_revision_facturas, dias_revision, horario_revision, telefono_revision, encargado_departamento_pago, encargado_entregas_pago, email_pago, telefono_pago, dias_pago, horario_pago, pagina_web_pago, correo_envio_facturas, documento_revision_pago, almacen_domicilio, almacen_colonia, almacen_telefono, almacen_horario, almacen_atencion_a, lugar, tiempo_residir, giro_principal, no_empleados, titular_cuenta, banco, no_cuenta, sucursal, ejecutivo, telefono_bancarias, promedio_mensual, antiguedad_bancarias, observaciones, nombre_empresa, ciudad_comerciales, estado_comerciales, atencion_comerciales, telefono_comerciales, antiguedad_comerciales, dias_credito_comerciales, credito_comerciales, forma_pago_comerciales, copia_rfc, copia_alta, copia_identificacion, copia_comprobante_domicilio) FROM stdin;
1	2012-01-20 12:23:52.960868-07	t		\N	\N		\N	\N	\N	Fernando	Fer	Fer	asd	wq	w	qw	qwqw	qw	qw	qw		dsf	dfs	sdf	sdf	ds	df	sdf	sdf	fer@asd.asd	f	sdf		0						sdf	sdf	sdf	sfd	sdf	sdf	12@asd.asd	sdf	sdf	sdf		fer@asd.asd		sdf	sdf	sdf	sdf	sdf	1	sdf	sdf	sdf	sdf	sfd	sfd	sdf	sf	sdf	sdf	sfd		234	234	24	34	43					rfc/code_20.jpg	rfc/mi_foto.jpg	rfc/code_21.jpg	rfc/code_22.jpg
\.


--
-- Data for Name: core_encuestasatisfaccion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY core_encuestasatisfaccion (id, creado, pregunta_1, pregunta_2, pregunta_3, pregunta_4, pregunta_5, pregunta_6, pregunta_6_1, pregunta_6_2, pregunta_6_3, pregunta_6_4, pregunta_6_5, pregunta_6_6, pregunta_6_7, pregunta_7, pregunta_7_1, pregunta_7_2, pregunta_7_3, pregunta_7_4, pregunta_7_5, pregunta_8, pregunta_9, comentarios, razon_social, puesto) FROM stdin;
1	2011-12-19 13:20:31.587676-07	1	1	1	9	3	\N	1	2	3	3	3	3	3	\N	2	4	4	4	4	1	1	dfsdf	fer	123
2	2011-12-19 13:21:30.408182-07	3	2	3	11	5	\N	2	2	5	5	5	5	2	\N	3	3	3	3	3	1	2	fsdff	fer	123
3	2011-12-19 15:15:31.191105-07	4	4	3	10	6	\N	1	1	1	1	1	1	1	\N	1	1	1	1	1	2	2	dg	dfgdfg	gdfgdfg
4	2011-12-19 15:29:29.790399-07	4	3	1	10	5	\N	1	1	1	1	1	1	1	\N	2	2	2	2	2	1	1	jghjgh	ghj	gj
5	2011-12-19 15:32:26.310059-07	4	3	1	10	5	\N	1	1	1	1	1	1	1	\N	2	2	2	2	2	1	1	jghjgh	ghj	gj
6	2011-12-19 15:32:41.771804-07	4	3	1	10	5	\N	1	1	1	1	1	1	1	\N	2	2	2	2	2	1	1	jghjgh	ghj	gj
7	2011-12-19 15:32:57.595954-07	4	3	1	10	5	\N	1	1	1	1	1	1	1	\N	2	2	2	2	2	1	1	jghjgh	ghj	gj
8	2011-12-19 15:33:21.502597-07	4	3	1	10	5	\N	1	1	1	1	1	1	1	\N	2	2	2	2	2	1	1	jghjgh	ghj	gj
9	2011-12-19 15:33:39.228856-07	4	3	1	10	5	\N	1	1	1	1	1	1	1	\N	2	2	2	2	2	1	1	jghjgh	ghj	gj
10	2011-12-19 15:34:05.365112-07	4	4	3	10	6	\N	1	1	1	1	1	1	1	\N	1	1	1	1	1	2	2	dg	gf	h
11	2012-01-09 15:08:43.891048-07	1	1	2	11	6	\N	2	2	2	2	2	2	2	\N	2	2	2	2	2	2	2	sadas	fer	123
\.


--
-- Data for Name: core_equiporenta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY core_equiporenta (id, marca, modelo, descripcion, categoria, disponible, valor, no_serie) FROM stdin;
9	fer	sad	asd	ads	t	23.00	234
4	ad	3e	sdfdfgdfgdsfgdsfgsdfger	ere	t	879.00	89
8	as	asd	asd	as	t	233223.00	23
5	asd	asdasd	sadasd	asdsad	t	23.00	32
7	asd	asd	asd	s	f	32.00	32
6	23	32	32	32	f	23.00	23
3	jk	iu	88asasasdasd	dfgdsfgsdfgdsfg	t	345.00	890
\.


--
-- Data for Name: core_imagen; Type: TABLE DATA; Schema: public; Owner: -
--

COPY core_imagen (id, creado, fecha_vencimiento, activo, imagen_chica, imagen_grande) FROM stdin;
1	2011-12-01 10:18:38.471592-07	2012-01-26	t	imagen/code_1.jpg	imagen/code_2.jpg
2	2011-12-01 10:18:58.165454-07	2012-01-26	t	imagen/mi_foto_1.jpg	imagen/mi_foto_2.jpg
3	2011-12-01 11:15:39.361359-07	2012-01-25	t	imagen/images_1.jpg	imagen/images_2.jpg
4	2011-12-01 11:16:05.401245-07	2012-01-26	t	imagen/LOGO_SYNSA.jpg	imagen/LOGO_SYNSA_1.jpg
\.


--
-- Data for Name: core_lista; Type: TABLE DATA; Schema: public; Owner: -
--

COPY core_lista (id, created, fecha_vencimiento, archivo) FROM stdin;
6	2011-11-28 14:35:13.618113-07	2011-11-30	listas/ejemplo_3.xls
\.


--
-- Data for Name: core_marca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY core_marca (id, nombre, logo) FROM stdin;
2	ferooo	
4	ferppp	
3	feroo	logos/images.jpg
5	ferkkkkkrtrt	logos/images_1.jpg
6	ferpoip	
\.


--
-- Data for Name: core_marcacategoria; Type: TABLE DATA; Schema: public; Owner: -
--

COPY core_marcacategoria (id, marca_id, categoria_id, url) FROM stdin;
3	4	4	http://sistemasideales.com/facevedo/compu/nosotros.html
4	6	3	http://localhost:8000/edit_url/0/
5	2	4	http://localhost:8000/edit_url/0/
6	3	3	http://localhost:8000/edit_url/0/
7	3	4	http://localhost:8000/edit_url/0/
8	3	1	http://localhost:8000/edit_url/0/
2	2	3	http://localhost:8000/edit_url/0/
\.


--
-- Data for Name: core_mensajecontacto; Type: TABLE DATA; Schema: public; Owner: -
--

COPY core_mensajecontacto (id, nombre, empresa, email, telefono, comentarios, desactivar_email) FROM stdin;
1	asd	asd	asd@asd.com	123	ewer	f
2	asd	asd	sda@asd.com	sad	asd	f
3	asd	asd	sda@asd.com	sad	asd	f
4	asd	asd	sda@asd.com	sad	asd	t
5	fer	asd	asd@asd.com	qwe	qwe	t
6	Fernando	Silva		324	24234	f
7	Fernando	Silva		324	24234	f
8	Fernando	Silva		324	24234	f
9	Fernando	Silva		324	24234	f
10	Fernando	Silva		324	24234	f
\.


--
-- Data for Name: core_perfil; Type: TABLE DATA; Schema: public; Owner: -
--

COPY core_perfil (id, usuario_id, color, departamento, extension, sucursal) FROM stdin;
5	6	dceddf			\N
2	1	638bc7			\N
8	8	f012ff			\N
6	7	f209f2			\N
3	4	d42adf			\N
4	5	cdced1	sdfsd	sdf	\N
9	12				\N
1	10	d42ad4	sdasd	asds	2
7	11	e805e8	sdad	3234	4
\.


--
-- Data for Name: core_personaautorizada; Type: TABLE DATA; Schema: public; Owner: -
--

COPY core_personaautorizada (id, distribuidor_id, apellido_paterno, apellido_materno, nombre, puesto, numero_ife) FROM stdin;
1	1	werwer	werwer	wrerwer	werwer	3434
2	2	werwer	werwer	wrerwer	werwer	3434
3	1	Silva	Encinas	Manuel Fernando	Ninguno	43434
4	1	Jhonson	Lopez	Jhon Enrique	sdas	3434
5	1	345	345	345	345	345
6	1	43	54	354	345	345
7	1	345	435	45	345	5
\.


--
-- Data for Name: core_producto; Type: TABLE DATA; Schema: public; Owner: -
--

COPY core_producto (id, marca, tipo, clave, descripcion) FROM stdin;
\.


--
-- Data for Name: core_renta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY core_renta (id, folio, numero_cliente, created, cliente, responsable, direccion, ciudad, telefono, condicion, fecha_inicio, fecha_final, status) FROM stdin;
2	34	qw	2011-12-12 11:30:48.146846-07	qw	wq	wwq	qw	wq	2	2011-12-16	2011-12-31	t
3	37	sqs	2011-12-13 09:30:59.669727-07	s	qs	qs	sd	23	2	2011-12-30	2011-12-31	f
1	36	s	2011-12-12 11:17:30.52702-07	qs	s	s	s	s	1	2011-12-12	2011-12-22	f
\.


--
-- Data for Name: core_rentadetalle; Type: TABLE DATA; Schema: public; Owner: -
--

COPY core_rentadetalle (id, renta_id, equipo_id) FROM stdin;
29	2	4
30	2	8
26	2	6
31	1	7
32	2	5
33	1	6
\.


--
-- Data for Name: core_solicitarcredito; Type: TABLE DATA; Schema: public; Owner: -
--

COPY core_solicitarcredito (id, distribuidor, razon_social, created, banco_1, pagos_no_cuenta_1, pagos_banco_2, pagos_no_cuenta_2, rc_nombre_empresa_1, rc_ciudad_estado_1, rc_atencion_1, rc_telefono_1, rc_antiguedad_1, rc_dias_credito_1, monto_credito_1, forma_pago_1, rc_nombre_empresa_2, rc_ciudad_estado_2, rc_atencion_2, rc_telefono_2, rc_antiguedad_2, rc_dias_credito_2, monto_credito_2, forma_pago_2, rc_nombre_empresa_3, rc_ciudad_estado_3, rc_atencion_3, rc_telefono_3, rc_antiguedad_3, rc_dias_credito_3, monto_credito_3, forma_pago_3) FROM stdin;
1	f	sdf	2011-11-25 11:29:01.503123-07	345	345			wer	ewr	ereewr	erw	w	w	w	w	w	w	w	w	w	w	w	w	w	w	w	w	w	w	w	w
2	f	ewrew	2011-11-25 11:29:35.283581-07	rwerwer	werwer	werwer	wer	wewe	e	e	e	e	e	e	e	e	e	e	e	e	e	e	e	e	e	e	e	e	e	e	e
\.


--
-- Data for Name: core_solicitudtrabajo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY core_solicitudtrabajo (id, created, nombre, apellido, telefono, email, vacante_id, aspiracion, curriculum, desactivar_email) FROM stdin;
1	2012-01-17 10:37:40.361328-07	fer	123	123	fer@asd.asd	\N		solicitudes_trabajo/code_2.jpg	f
\.


--
-- Data for Name: core_status; Type: TABLE DATA; Schema: public; Owner: -
--

COPY core_status (id, creado, usuario_id, bitacora_id, status) FROM stdin;
8	2011-12-13 09:35:43.689306-07	7	1	fsdfgrdf
9	2011-12-13 09:35:47.14035-07	7	1	fgfresdf
10	2011-12-16 08:52:19.166512-07	11	1	easas
11	2011-12-16 11:40:11.072121-07	11	1	dsdf
12	2011-12-16 11:42:03.697394-07	11	1	dsdf
13	2011-12-16 11:42:20.020634-07	11	1	dsdf
14	2011-12-16 11:42:25.910352-07	11	1	sdf
15	2011-12-16 11:43:27.962801-07	11	1	asdas
16	2011-12-16 12:20:52.590457-07	11	3	fgfrgdfg
17	2011-12-16 12:30:34.235916-07	11	3	dfsdfsd
18	2011-12-16 12:30:39.340856-07	11	3	asssadasasd
19	2011-12-16 12:44:31.087874-07	11	6	sfdsdfwer
20	2011-12-16 12:44:34.351461-07	11	6	sdasasd
21	2011-12-16 12:44:37.829133-07	11	6	sdasdas
22	2011-12-16 13:18:41.832934-07	11	12	sdf
23	2011-12-16 15:08:26.16594-07	11	13	asdwasasde 
24	2011-12-16 15:54:52.153254-07	11	8	dfgdfg
25	2011-12-16 15:55:22.187853-07	11	8	adsd
26	2011-12-16 16:08:53.801207-07	11	13	sdfsdf
27	2011-12-16 16:09:04.197105-07	11	13	sdfsdf
28	2011-12-16 16:09:17.40967-07	11	2	fghfg
29	2011-12-16 16:11:45.0169-07	11	17	asdasd
30	2011-12-19 16:38:51.540777-07	11	1	sdfsdf
31	2011-12-19 16:39:02.535165-07	11	1	sdfsdf
32	2011-12-19 16:39:08.074311-07	11	1	fgh
33	2011-12-20 09:01:17.381492-07	11	14	dgdfgrgdfg
34	2011-12-20 09:01:22.634083-07	11	14	sdfwesdfsd
35	2012-01-17 08:36:43.207872-07	11	35	sadasd
36	2012-01-17 08:43:34.986586-07	11	32	dsadasaaaaaaaaaaaaaaaaaaaaaaa
37	2012-01-17 08:53:57.965836-07	11	43	sdfsdfs sfsdfsdf sdfs
38	2012-01-17 09:01:18.102461-07	11	42	fsdfsdf
39	2012-01-17 09:04:01.241802-07	11	43	kkl
\.


--
-- Data for Name: core_vacante; Type: TABLE DATA; Schema: public; Owner: -
--

COPY core_vacante (id, created, nombre, descripcion, sueldo, ciudad) FROM stdin;
5	2011-12-08 13:03:08.038379-07	asAS	qweqwe		1
6	2011-12-08 16:35:16.649526-07	Gerente	No haces nada	187965878	1
7	2011-12-08 16:35:29.861865-07	Jefe	ASDasd	2344556665678886	1
8	2011-12-08 16:35:52.535843-07	empleado	Trabajas 14 horas	5	1
10	2011-12-08 16:36:08.067557-07	3434	asdasas	3434	1
3	2011-09-29 15:39:57.73905-07	sdf	45	df	1
9	2011-12-08 16:36:02.591574-07	seew	asdas	23322	1
4	2011-09-29 15:40:01.811607-07	sdf	df	345	1
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	log entry	admin	logentry
2	permission	auth	permission
3	group	auth	group
4	user	auth	user
5	content type	contenttypes	contenttype
6	session	sessions	session
7	site	sites	site
8	producto	core	producto
9	imagen	core	imagen
10	lista	core	lista
11	contacto	core	contacto
12	cliente	core	cliente
13	bitacora	core	bitacora
14	vacante	core	vacante
15	solicitud trabajo	core	solicitudtrabajo
16	distribuidor	core	distribuidor
17	persona autorizada	core	personaautorizada
18	mensaje contacto	core	mensajecontacto
20	categoria	core	categoria
21	marca	core	marca
22	marca categoria	core	marcacategoria
23	equipo renta	core	equiporenta
24	renta	core	renta
25	renta detalle	core	rentadetalle
26	block	core	block
27	solicitar credito	core	solicitarcredito
28	url	probador	url
29	url parametro	probador	urlparametro
30	modelo	utils	modelo
31	estado	utils	estado
32	condicion	utils	condicion
33	direccion	utils	direccion
34	ciudad	utils	ciudad
35	status	core	status
36	actividad	core	actividad
37	perfil	core	perfil
38	encuesta satisfaccion	core	encuestasatisfaccion
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
e82d22d21fdf1d094cef26457d28ae90	YjQ4NDk1NTcyNmQ4MjJlYzliZjg5YjA2Y2NjZThiZTEzNzJiMmJlMTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-10-11 10:39:00.525074-07
dbe8185840534de7c1968212582a0889	NTBjYmEyODEyN2JlOGQ5MmVhMDIxODQxMzQ0OWFmODkxNzFlY2YwMjqAAn1xAS4=\n	2011-10-13 16:06:59.32375-07
8dc1b55b7d02013d2f85c8b34579c765	NTBjYmEyODEyN2JlOGQ5MmVhMDIxODQxMzQ0OWFmODkxNzFlY2YwMjqAAn1xAS4=\n	2011-10-13 16:33:50.357023-07
442dcf802182babe1c868e7d7d6ccfdb	YjQ4NDk1NTcyNmQ4MjJlYzliZjg5YjA2Y2NjZThiZTEzNzJiMmJlMTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-12-09 14:30:19.703533-07
416f3daa873ecb525706be703a65e087	YjQ4NDk1NTcyNmQ4MjJlYzliZjg5YjA2Y2NjZThiZTEzNzJiMmJlMTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-10-14 11:50:07.402447-07
c9bb297982c09def8aa5b47806f3b5a8	YjQ4NDk1NTcyNmQ4MjJlYzliZjg5YjA2Y2NjZThiZTEzNzJiMmJlMTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-10-14 11:50:36.397973-07
c43cb85d10ebef1bddb7a64af162027b	YWRhNWNlYjgwY2MxZDU3ZTA0OWQ5OGUyOWM3NmM1ODRlZmM2MWFhMzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBnUu\n	2011-12-12 14:27:55.628057-07
21ede1ef6879f158df6ba649cb5d8dc0	NTBjYmEyODEyN2JlOGQ5MmVhMDIxODQxMzQ0OWFmODkxNzFlY2YwMjqAAn1xAS4=\n	2011-10-14 11:58:51.196477-07
2d04db65b88ac971aeb09aa2703aa395	NTBjYmEyODEyN2JlOGQ5MmVhMDIxODQxMzQ0OWFmODkxNzFlY2YwMjqAAn1xAS4=\n	2011-11-17 17:10:10.06468-07
7fd651358801ebec7043c9c0233eb468	YjQ4NDk1NTcyNmQ4MjJlYzliZjg5YjA2Y2NjZThiZTEzNzJiMmJlMTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-10-14 12:19:53.458532-07
703be55b2a151603041957eb93473a4a	YWRhNWNlYjgwY2MxZDU3ZTA0OWQ5OGUyOWM3NmM1ODRlZmM2MWFhMzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBnUu\n	2011-12-13 09:00:57.029205-07
33ea6fd8b48491e7da153d4102c2e6e9	ZWRhZDlhZWE1NzA4MTZkZDgxZWVkOWM0OTliOWMzZTUzYTYyYmNiZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBHUu\n	2011-11-02 12:26:29.386881-07
b82ebaccda05704b3067f1bb4ebdc408	YWRhNWNlYjgwY2MxZDU3ZTA0OWQ5OGUyOWM3NmM1ODRlZmM2MWFhMzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBnUu\n	2011-12-13 09:29:49.408435-07
f0ec11ac105c74ecc912275d87b4a9bb	YjQ4NDk1NTcyNmQ4MjJlYzliZjg5YjA2Y2NjZThiZTEzNzJiMmJlMTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-11-16 11:09:13.464907-07
12a514a8453fdc62fb6fd97226fd18b4	YjQ4NDk1NTcyNmQ4MjJlYzliZjg5YjA2Y2NjZThiZTEzNzJiMmJlMTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-11-17 10:36:07.693763-07
51e8d9a1d2a09a5402e5c15d6703a30d	Nzk1M2IwNDgwNTc4MjJjMzE0M2QwYWRmOTM5Zjk0NDc4YmJiZWEyYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLC3Uu\n	2011-12-28 12:11:09.329241-07
4b719435b205be79002c44f4b20f6512	NTBjYmEyODEyN2JlOGQ5MmVhMDIxODQxMzQ0OWFmODkxNzFlY2YwMjqAAn1xAS4=\n	2011-12-30 08:51:14.50986-07
a9fe9a39b25f55b40e7d4bdac879fc85	YjQ4NDk1NTcyNmQ4MjJlYzliZjg5YjA2Y2NjZThiZTEzNzJiMmJlMTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-11-17 12:25:43.617915-07
71a6cbc8d828097de399499aef143e8c	YWRhNWNlYjgwY2MxZDU3ZTA0OWQ5OGUyOWM3NmM1ODRlZmM2MWFhMzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBnUu\n	2011-12-15 11:15:02.137575-07
f4fdd6f56643b6c48b19a8906977463d	YjQ4NDk1NTcyNmQ4MjJlYzliZjg5YjA2Y2NjZThiZTEzNzJiMmJlMTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-11-21 12:48:38.87435-07
0a1fa1f69e91026f7a4298d1a1544a98	YjQ4NDk1NTcyNmQ4MjJlYzliZjg5YjA2Y2NjZThiZTEzNzJiMmJlMTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-11-21 18:02:20.107062-07
c5dcfddf554f83e2fa8eeb143e833211	YjQ4NDk1NTcyNmQ4MjJlYzliZjg5YjA2Y2NjZThiZTEzNzJiMmJlMTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-11-24 16:54:04.602884-07
61b78c6e2caf699629fd77ff424c932f	YjQ4NDk1NTcyNmQ4MjJlYzliZjg5YjA2Y2NjZThiZTEzNzJiMmJlMTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-11-17 14:52:46.861495-07
542f505106497e003e10aef108df17ab	Nzk1M2IwNDgwNTc4MjJjMzE0M2QwYWRmOTM5Zjk0NDc4YmJiZWEyYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLC3Uu\n	2012-01-03 08:54:18.046531-07
b6837e5d44c0e664d495158a783ba18d	NTBjYmEyODEyN2JlOGQ5MmVhMDIxODQxMzQ0OWFmODkxNzFlY2YwMjqAAn1xAS4=\n	2011-11-24 16:58:01.640302-07
ed67857ecf83e1c6e731246a867be9da	YjQ4NDk1NTcyNmQ4MjJlYzliZjg5YjA2Y2NjZThiZTEzNzJiMmJlMTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-11-25 09:24:49.797274-07
aa571e2976d4cbe3b09e72714ac284d4	Nzk1M2IwNDgwNTc4MjJjMzE0M2QwYWRmOTM5Zjk0NDc4YmJiZWEyYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLC3Uu\n	2012-01-05 08:53:41.994294-07
043212ccbc6b086a370359e322bc5c1b	NTBjYmEyODEyN2JlOGQ5MmVhMDIxODQxMzQ0OWFmODkxNzFlY2YwMjqAAn1xAS4=\n	2011-11-25 13:50:18.182269-07
293333e9e8dbee8081c3c19d9110dc3a	NTBjYmEyODEyN2JlOGQ5MmVhMDIxODQxMzQ0OWFmODkxNzFlY2YwMjqAAn1xAS4=\n	2011-12-21 11:44:40.694614-07
f225476d1c0e8935f735f522c2bee149	Nzk1M2IwNDgwNTc4MjJjMzE0M2QwYWRmOTM5Zjk0NDc4YmJiZWEyYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLC3Uu\n	2012-01-20 17:07:01.938401-07
df3bc082cb528406acc49d36c324c7cc	MGZlODY4YmE5ZjMzM2VlNmYxN2VhYzFmMzM0ZjUyZDVkOGVhMGQ3ODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLB3Uu\n	2011-12-22 12:30:01.796805-07
c9b453d7658b8d502cedde044118f40f	YjQ4NDk1NTcyNmQ4MjJlYzliZjg5YjA2Y2NjZThiZTEzNzJiMmJlMTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-12-02 14:37:44.87293-07
fed0e271a5607cefb9648d44eee4c61b	MGZlODY4YmE5ZjMzM2VlNmYxN2VhYzFmMzM0ZjUyZDVkOGVhMGQ3ODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLB3Uu\n	2011-12-28 08:57:14.33435-07
2b1bddc8608ed481e80073e9fa55e9f2	NTBjYmEyODEyN2JlOGQ5MmVhMDIxODQxMzQ0OWFmODkxNzFlY2YwMjqAAn1xAS4=\n	2012-01-23 15:09:13.68176-07
5e70ab486a8532340484f43fd5f075ae	Nzk1M2IwNDgwNTc4MjJjMzE0M2QwYWRmOTM5Zjk0NDc4YmJiZWEyYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLC3Uu\n	2012-01-31 08:31:00.29837-07
ff5632edb98117db19ce38890daaad92	Nzk1M2IwNDgwNTc4MjJjMzE0M2QwYWRmOTM5Zjk0NDc4YmJiZWEyYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLC3Uu\n	2012-01-31 08:52:50.825578-07
c3c520d65094fce4a3d6effcef471f0a	Nzk1M2IwNDgwNTc4MjJjMzE0M2QwYWRmOTM5Zjk0NDc4YmJiZWEyYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLC3Uu\n	2012-01-31 09:00:54.376813-07
341b6f8491f7fe98f19170a5b93aff9d	Nzk1M2IwNDgwNTc4MjJjMzE0M2QwYWRmOTM5Zjk0NDc4YmJiZWEyYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLC3Uu\n	2012-02-03 12:24:57.674266-07
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: probador_url; Type: TABLE DATA; Schema: public; Owner: -
--

COPY probador_url (id, name) FROM stdin;
82	/
83	/productos/
84	/productos_servicios/
85	/directorio/
86	/contacto/
87	/soluciones_empresas/
88	/bolsa_trabajo/
89	/distribuidores/
90	/registro_distribuidor/
91	/solicitar_credito_distribuidor/
92	/seleccionar/
93	/nosotros/
94	/soluciones/
95	/ver_block/
96	/promociones/
97	/empresas/
98	/registro_empresa/
99	/solicitar_credito_empresa/
100	/garantia/
101	/servicio_tecnico/
102	/nuestra_historia/
103	/admin/
104	/administrar_productos/
105	/administrar_imagenes/
106	/administrar_directorio/
107	/usuarios/
108	/clientes/
109	/subir_clientes/
110	/block/
111	/vacantes/
112	/solicitudes_trabajo/
113	/bitacoras_garantia/
114	/bitacoras_servicio/
115	/ver_distribuidores/
116	/ver_empresas/
117	/direcciones_email/
118	/generar_remitente/
119	/marca_categoria/
120	/equipo_renta/
121	/rentas/
122	/site_media/(?P<path>.*)
\.


--
-- Data for Name: probador_urlparametro; Type: TABLE DATA; Schema: public; Owner: -
--

COPY probador_urlparametro (id, name) FROM stdin;
71	/modificacion_distribuidor/(.+)/(.+)/
72	/solucion/(.*)/
73	/distribuidor_pdf/(\\d+)/
74	/empresa_pdf/(\\d+)/
75	/solicitar_credito_dis_pdf/(\\d+)/
76	/solicitar_credito_cli_pdf/(\\d+)/
77	/usuario/(.+)/
78	/cambiar_password/(\\d+)/
79	/eliminar_usuario/(.+)/
80	/eliminar_lista/(\\d+)/
81	/cliente/(.+)/
82	/eliminar_cliente/(.+)/
83	/vacante/(.+)/
84	/eliminar_vacante/(\\d+)/
85	/bitacora_garantia/(.*)/
86	/bitacora_servicio/(.*)/
87	/imprimir_bitacora_garantia/(.+)/
88	/imprimir_bitacora_servicio/(.+)/
89	/eliminar_bitacora_garantia/(.+)/
90	/eliminar_bitacora_servicio/(.+)/
91	/ver_distribuidor/(.+)/
92	/ver_empresas/(.+)/
93	/generar_clave_distribuidor/(.+)/
94	/desactivar_email/(.+)/(.+)/
95	/activar_email/(.+)/(.+)/
96	/edit_marca/(.+)/
97	/edit_categoria/(.+)/
98	/edit_url/(.+)/
99	/eliminar_marca/(.+)/
100	/eliminar_categoria/(.+)/
101	/eliminar_url/(.+)/
102	/edit_equipo_renta/(.+)/
103	/eliminar_equipo_renta/(.+)/
104	/renta/(.+)/
105	/renta_pdf/(.+)/
\.


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: core_actividad_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_actividad
    ADD CONSTRAINT core_actividad_pkey PRIMARY KEY (id);


--
-- Name: core_bitacora_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_bitacora
    ADD CONSTRAINT core_bitacora_pkey PRIMARY KEY (id);


--
-- Name: core_block_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_block
    ADD CONSTRAINT core_block_pkey PRIMARY KEY (id);


--
-- Name: core_categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_categoria
    ADD CONSTRAINT core_categoria_pkey PRIMARY KEY (id);


--
-- Name: core_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_cliente
    ADD CONSTRAINT core_cliente_pkey PRIMARY KEY (id);


--
-- Name: core_contacto_email_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_contacto
    ADD CONSTRAINT core_contacto_email_key UNIQUE (email);


--
-- Name: core_contacto_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_contacto
    ADD CONSTRAINT core_contacto_pkey PRIMARY KEY (id);


--
-- Name: core_distribuidor_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_distribuidor
    ADD CONSTRAINT core_distribuidor_pkey PRIMARY KEY (id);


--
-- Name: core_distribuidor_razon_social_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_distribuidor
    ADD CONSTRAINT core_distribuidor_razon_social_key UNIQUE (razon_social);


--
-- Name: core_distribuidor_rfc_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_distribuidor
    ADD CONSTRAINT core_distribuidor_rfc_key UNIQUE (rfc);


--
-- Name: core_encuestasatisfaccion_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_encuestasatisfaccion
    ADD CONSTRAINT core_encuestasatisfaccion_pkey PRIMARY KEY (id);


--
-- Name: core_equiporenta_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_equiporenta
    ADD CONSTRAINT core_equiporenta_pkey PRIMARY KEY (id);


--
-- Name: core_imagen_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_imagen
    ADD CONSTRAINT core_imagen_pkey PRIMARY KEY (id);


--
-- Name: core_lista_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_lista
    ADD CONSTRAINT core_lista_pkey PRIMARY KEY (id);


--
-- Name: core_marca_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_marca
    ADD CONSTRAINT core_marca_pkey PRIMARY KEY (id);


--
-- Name: core_marcacategoria_marca_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_marcacategoria
    ADD CONSTRAINT core_marcacategoria_marca_id_key UNIQUE (marca_id, categoria_id);


--
-- Name: core_marcacategoria_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_marcacategoria
    ADD CONSTRAINT core_marcacategoria_pkey PRIMARY KEY (id);


--
-- Name: core_mensajecontacto_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_mensajecontacto
    ADD CONSTRAINT core_mensajecontacto_pkey PRIMARY KEY (id);


--
-- Name: core_perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_perfil
    ADD CONSTRAINT core_perfil_pkey PRIMARY KEY (id);


--
-- Name: core_perfil_usuario_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_perfil
    ADD CONSTRAINT core_perfil_usuario_id_key UNIQUE (usuario_id);


--
-- Name: core_personaautorizada_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_personaautorizada
    ADD CONSTRAINT core_personaautorizada_pkey PRIMARY KEY (id);


--
-- Name: core_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_producto
    ADD CONSTRAINT core_producto_pkey PRIMARY KEY (id);


--
-- Name: core_renta_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_renta
    ADD CONSTRAINT core_renta_pkey PRIMARY KEY (id);


--
-- Name: core_rentadetalle_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_rentadetalle
    ADD CONSTRAINT core_rentadetalle_pkey PRIMARY KEY (id);


--
-- Name: core_solicitarcredito_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_solicitarcredito
    ADD CONSTRAINT core_solicitarcredito_pkey PRIMARY KEY (id);


--
-- Name: core_solicitudtrabajo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_solicitudtrabajo
    ADD CONSTRAINT core_solicitudtrabajo_pkey PRIMARY KEY (id);


--
-- Name: core_status_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_status
    ADD CONSTRAINT core_status_pkey PRIMARY KEY (id);


--
-- Name: core_vacante_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY core_vacante
    ADD CONSTRAINT core_vacante_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: probador_url_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY probador_url
    ADD CONSTRAINT probador_url_name_key UNIQUE (name);


--
-- Name: probador_url_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY probador_url
    ADD CONSTRAINT probador_url_pkey PRIMARY KEY (id);


--
-- Name: probador_urlparametro_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY probador_urlparametro
    ADD CONSTRAINT probador_urlparametro_name_key UNIQUE (name);


--
-- Name: probador_urlparametro_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY probador_urlparametro
    ADD CONSTRAINT probador_urlparametro_pkey PRIMARY KEY (id);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: core_actividad_usuario_asignado_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX core_actividad_usuario_asignado_id ON core_actividad USING btree (usuario_asignado_id);


--
-- Name: core_actividad_usuario_creado_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX core_actividad_usuario_creado_id ON core_actividad USING btree (usuario_creado_id);


--
-- Name: core_bitacora_cliente_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX core_bitacora_cliente_id ON core_bitacora USING btree (cliente_id);


--
-- Name: core_bitacora_usuario_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX core_bitacora_usuario_id ON core_bitacora USING btree (usuario_id);


--
-- Name: core_bitacora_usuario_modificado_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX core_bitacora_usuario_modificado_id ON core_bitacora USING btree (usuario_modificado_id);


--
-- Name: core_personaautorizada_distribuidor_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX core_personaautorizada_distribuidor_id ON core_personaautorizada USING btree (distribuidor_id);


--
-- Name: core_rentadetalle_equipo_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX core_rentadetalle_equipo_id ON core_rentadetalle USING btree (equipo_id);


--
-- Name: core_rentadetalle_renta_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX core_rentadetalle_renta_id ON core_rentadetalle USING btree (renta_id);


--
-- Name: core_solicitudtrabajo_vacante_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX core_solicitudtrabajo_vacante_id ON core_solicitudtrabajo USING btree (vacante_id);


--
-- Name: core_status_bitacora_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX core_status_bitacora_id ON core_status USING btree (bitacora_id);


--
-- Name: core_status_usuario_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX core_status_usuario_id ON core_status USING btree (usuario_id);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_288599e6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT content_type_id_refs_id_288599e6 FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_728de91f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_728de91f FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_actividad_usuario_asignado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY core_actividad
    ADD CONSTRAINT core_actividad_usuario_asignado_id_fkey FOREIGN KEY (usuario_asignado_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_actividad_usuario_creado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY core_actividad
    ADD CONSTRAINT core_actividad_usuario_creado_id_fkey FOREIGN KEY (usuario_creado_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_bitacora_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY core_bitacora
    ADD CONSTRAINT core_bitacora_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES core_cliente(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_bitacora_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY core_bitacora
    ADD CONSTRAINT core_bitacora_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_bitacora_usuario_modificado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY core_bitacora
    ADD CONSTRAINT core_bitacora_usuario_modificado_id_fkey FOREIGN KEY (usuario_modificado_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_marcacategoria_categoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY core_marcacategoria
    ADD CONSTRAINT core_marcacategoria_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES core_categoria(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_marcacategoria_marca_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY core_marcacategoria
    ADD CONSTRAINT core_marcacategoria_marca_id_fkey FOREIGN KEY (marca_id) REFERENCES core_marca(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_perfil_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY core_perfil
    ADD CONSTRAINT core_perfil_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_rentadetalle_equipo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY core_rentadetalle
    ADD CONSTRAINT core_rentadetalle_equipo_id_fkey FOREIGN KEY (equipo_id) REFERENCES core_equiporenta(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_rentadetalle_renta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY core_rentadetalle
    ADD CONSTRAINT core_rentadetalle_renta_id_fkey FOREIGN KEY (renta_id) REFERENCES core_renta(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_solicitudtrabajo_vacante_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY core_solicitudtrabajo
    ADD CONSTRAINT core_solicitudtrabajo_vacante_id_fkey FOREIGN KEY (vacante_id) REFERENCES core_vacante(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_status_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY core_status
    ADD CONSTRAINT core_status_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_3cea63fe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_3cea63fe FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_831107f1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_831107f1 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_c8665aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT user_id_refs_id_c8665aa FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_f2045483; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_f2045483 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

