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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO root;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO root;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO root;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO root;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO root;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO root;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO root;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO root;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO root;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO root;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO root;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO root;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: core_actividad; Type: TABLE; Schema: public; Owner: root; Tablespace: 
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


ALTER TABLE core_actividad OWNER TO root;

--
-- Name: core_actividad_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_actividad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_actividad_id_seq OWNER TO root;

--
-- Name: core_actividad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_actividad_id_seq OWNED BY core_actividad.id;


--
-- Name: core_avisoprivacidad; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_avisoprivacidad (
    id integer NOT NULL,
    titulo character varying(200) NOT NULL,
    texto text NOT NULL,
    creado timestamp with time zone NOT NULL
);


ALTER TABLE core_avisoprivacidad OWNER TO root;

--
-- Name: core_avisoprivacidad_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_avisoprivacidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_avisoprivacidad_id_seq OWNER TO root;

--
-- Name: core_avisoprivacidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_avisoprivacidad_id_seq OWNED BY core_avisoprivacidad.id;


--
-- Name: core_bitacora; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_bitacora (
    id integer NOT NULL,
    tipo integer NOT NULL,
    cliente_id integer,
    fecha_modificado timestamp with time zone NOT NULL,
    usuario_modificado_id integer NOT NULL,
    usuario_id integer NOT NULL,
    folio integer NOT NULL,
    fecha timestamp with time zone,
    fecha_factura date,
    fecha_vencimiento date,
    fecha_aviso date,
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
    sucursal integer,
    tipo_garantia integer,
    factura_costo_garantia character varying(255) NOT NULL,
    garantia_costo boolean NOT NULL,
    tipo_servicio integer,
    tipo_equipo integer,
    equipo character varying(250) NOT NULL,
    marca character varying(250) NOT NULL,
    modelo character varying(250) NOT NULL,
    no_serie character varying(250) NOT NULL,
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
    otros_pc boolean NOT NULL,
    otros_especificar_pc character varying(250) NOT NULL,
    otros text NOT NULL,
    fecha_recepcion date,
    lugar_servicio integer,
    fecha_diagnostico date,
    fecha_cierre timestamp with time zone,
    fecha_inicio timestamp with time zone,
    fecha_termino timestamp with time zone,
    accesorios_incluye text NOT NULL,
    usa_herramienta boolean NOT NULL,
    usa_escalera boolean NOT NULL,
    usa_equipo boolean NOT NULL,
    usa_reporte boolean NOT NULL,
    usa_remision boolean NOT NULL,
    usa_factura boolean NOT NULL,
    usa_acuerdo boolean NOT NULL,
    usa_liberacion boolean NOT NULL,
    usa_otra boolean NOT NULL,
    es_proyecto boolean NOT NULL
);


ALTER TABLE core_bitacora OWNER TO root;

--
-- Name: core_bitacora_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_bitacora_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_bitacora_id_seq OWNER TO root;

--
-- Name: core_bitacora_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_bitacora_id_seq OWNED BY core_bitacora.id;


--
-- Name: core_bitacoraimagen; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_bitacoraimagen (
    id integer NOT NULL,
    bitacora_id integer NOT NULL,
    imagen character varying(2000000)
);


ALTER TABLE core_bitacoraimagen OWNER TO root;

--
-- Name: core_bitacoraimagen_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_bitacoraimagen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_bitacoraimagen_id_seq OWNER TO root;

--
-- Name: core_bitacoraimagen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_bitacoraimagen_id_seq OWNED BY core_bitacoraimagen.id;


--
-- Name: core_block; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_block (
    id integer NOT NULL,
    texto text NOT NULL
);


ALTER TABLE core_block OWNER TO root;

--
-- Name: core_block_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_block_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_block_id_seq OWNER TO root;

--
-- Name: core_block_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_block_id_seq OWNED BY core_block.id;


--
-- Name: core_categoria; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_categoria (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE core_categoria OWNER TO root;

--
-- Name: core_categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_categoria_id_seq OWNER TO root;

--
-- Name: core_categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_categoria_id_seq OWNED BY core_categoria.id;


--
-- Name: core_cliente; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_cliente (
    id integer NOT NULL,
    rfc character varying(255) NOT NULL,
    nombre character varying(255) NOT NULL,
    sucursal integer NOT NULL,
    direccion character varying(255) NOT NULL,
    ciudad character varying(255) NOT NULL,
    estado character varying(255) NOT NULL,
    celular character varying(255) NOT NULL,
    telefono character varying(255) NOT NULL,
    telefono_extra character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    contacto character varying(255) NOT NULL,
    desactivar_email boolean NOT NULL,
    ext character varying(255) NOT NULL,
    distribuidor_id integer NOT NULL
);


ALTER TABLE core_cliente OWNER TO root;

--
-- Name: core_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_cliente_id_seq OWNER TO root;

--
-- Name: core_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_cliente_id_seq OWNED BY core_cliente.id;


--
-- Name: core_concretarcita; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_concretarcita (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    desactivar_email boolean NOT NULL,
    nombre character varying(255) NOT NULL,
    empresa character varying(255) NOT NULL,
    telefono character varying(255) NOT NULL,
    email character varying(75) NOT NULL,
    comentarios text NOT NULL,
    solucion text NOT NULL
);


ALTER TABLE core_concretarcita OWNER TO root;

--
-- Name: core_concretarcita_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_concretarcita_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_concretarcita_id_seq OWNER TO root;

--
-- Name: core_concretarcita_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_concretarcita_id_seq OWNED BY core_concretarcita.id;


--
-- Name: core_contacto; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_contacto (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    email character varying(75)
);


ALTER TABLE core_contacto OWNER TO root;

--
-- Name: core_contacto_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_contacto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_contacto_id_seq OWNER TO root;

--
-- Name: core_contacto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_contacto_id_seq OWNED BY core_contacto.id;


--
-- Name: core_distribuidor; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_distribuidor (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    distribuidor boolean NOT NULL,
    clave_modificacion character varying(50) NOT NULL,
    fecha_clave date,
    tipo_distribuidor integer NOT NULL,
    sucursal character varying(255) NOT NULL,
    no_clientes_interno integer,
    clasificacion_interno character varying(255) NOT NULL,
    dias_credito_interno integer,
    limite_credito_interno integer,
    vendedor_interno_id integer,
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
    doc_revision character varying(255) NOT NULL,
    encargado_departamento_pago character varying(255) NOT NULL,
    encargado_entregas_pago character varying(255) NOT NULL,
    email_pago character varying(255) NOT NULL,
    telefono_pago character varying(255) NOT NULL,
    dias_pago character varying(255) NOT NULL,
    horario_pago character varying(255) NOT NULL,
    pagina_web_pago character varying(255) NOT NULL,
    correo_envio_facturas character varying(75) NOT NULL,
    documento_revision_pago character varying(255) NOT NULL,
    almacen_domicilio character varying(255) NOT NULL,
    almacen_colonia character varying(255) NOT NULL,
    almacen_telefono character varying(255) NOT NULL,
    almacen_dias character varying(255) NOT NULL,
    almacen_horario character varying(255) NOT NULL,
    almacen_atencion_a character varying(255) NOT NULL,
    datos_compra_contacto character varying(255) NOT NULL,
    datos_compra_correo character varying(75) NOT NULL,
    datos_compra_telefono character varying(255) NOT NULL,
    lugar integer NOT NULL,
    tiempo_residir character varying(255) NOT NULL,
    giro_principal character varying(255) NOT NULL,
    no_empleados character varying(255) NOT NULL,
    titular_cuenta character varying(255) NOT NULL,
    banco character varying(255) NOT NULL,
    no_cuenta character varying(255) NOT NULL,
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
    nombre_empresa_2 character varying(255) NOT NULL,
    ciudad_comerciales_2 character varying(255) NOT NULL,
    estado_comerciales_2 character varying(255) NOT NULL,
    atencion_comerciales_2 character varying(255) NOT NULL,
    telefono_comerciales_2 character varying(255) NOT NULL,
    nombre_empresa_3 character varying(255) NOT NULL,
    ciudad_comerciales_3 character varying(255) NOT NULL,
    estado_comerciales_3 character varying(255) NOT NULL,
    atencion_comerciales_3 character varying(255) NOT NULL,
    telefono_comerciales_3 character varying(255) NOT NULL,
    antiguedad_comerciales character varying(255) NOT NULL,
    dias_credito_comerciales character varying(255) NOT NULL,
    credito_comerciales character varying(255) NOT NULL,
    forma_pago_comerciales character varying(255) NOT NULL,
    copia_rfc character varying(1000000),
    copia_alta character varying(1000000),
    copia_identificacion character varying(1000000),
    copia_comprobante_domicilio character varying(1000000),
    no_usar_datos_bancarios boolean NOT NULL,
    CONSTRAINT core_distribuidor_dias_credito_interno_check CHECK ((dias_credito_interno >= 0)),
    CONSTRAINT core_distribuidor_limite_credito_interno_check CHECK ((limite_credito_interno >= 0)),
    CONSTRAINT core_distribuidor_no_clientes_interno_check CHECK ((no_clientes_interno >= 0))
);


ALTER TABLE core_distribuidor OWNER TO root;

--
-- Name: core_distribuidor_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_distribuidor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_distribuidor_id_seq OWNER TO root;

--
-- Name: core_distribuidor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_distribuidor_id_seq OWNED BY core_distribuidor.id;


--
-- Name: core_encuestasatisfaccion; Type: TABLE; Schema: public; Owner: root; Tablespace: 
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
    pregunta_8_porque character varying(255),
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


ALTER TABLE core_encuestasatisfaccion OWNER TO root;

--
-- Name: core_encuestasatisfaccion_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_encuestasatisfaccion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_encuestasatisfaccion_id_seq OWNER TO root;

--
-- Name: core_encuestasatisfaccion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_encuestasatisfaccion_id_seq OWNED BY core_encuestasatisfaccion.id;


--
-- Name: core_equiporenta; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_equiporenta (
    id integer NOT NULL,
    marca character varying(255) NOT NULL,
    modelo character varying(255) NOT NULL,
    descripcion character varying(255) NOT NULL,
    categoria character varying(255) NOT NULL,
    disponible boolean NOT NULL,
    valor numeric(12,2) NOT NULL,
    no_serie character varying(255) NOT NULL,
    sucursal integer NOT NULL
);


ALTER TABLE core_equiporenta OWNER TO root;

--
-- Name: core_equiporenta_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_equiporenta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_equiporenta_id_seq OWNER TO root;

--
-- Name: core_equiporenta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_equiporenta_id_seq OWNED BY core_equiporenta.id;


--
-- Name: core_imagen; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_imagen (
    id integer NOT NULL,
    creado timestamp with time zone NOT NULL,
    fecha_vencimiento date,
    activo boolean NOT NULL,
    imagen_chica character varying(2000000),
    imagen_grande character varying(2000000)
);


ALTER TABLE core_imagen OWNER TO root;

--
-- Name: core_imagen_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_imagen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_imagen_id_seq OWNER TO root;

--
-- Name: core_imagen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_imagen_id_seq OWNED BY core_imagen.id;


--
-- Name: core_imageninicio; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_imageninicio (
    id integer NOT NULL,
    creado timestamp with time zone NOT NULL,
    fecha_vencimiento date,
    activo boolean NOT NULL,
    imagen character varying(2000000),
    url character varying(255) NOT NULL
);


ALTER TABLE core_imageninicio OWNER TO root;

--
-- Name: core_imageninicio_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_imageninicio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_imageninicio_id_seq OWNER TO root;

--
-- Name: core_imageninicio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_imageninicio_id_seq OWNED BY core_imageninicio.id;


--
-- Name: core_lista; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_lista (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    fecha_vencimiento date,
    archivo character varying(10000000)
);


ALTER TABLE core_lista OWNER TO root;

--
-- Name: core_lista_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_lista_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_lista_id_seq OWNER TO root;

--
-- Name: core_lista_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_lista_id_seq OWNED BY core_lista.id;


--
-- Name: core_marca; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_marca (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    logo character varying(1000000) NOT NULL
);


ALTER TABLE core_marca OWNER TO root;

--
-- Name: core_marca_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_marca_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_marca_id_seq OWNER TO root;

--
-- Name: core_marca_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_marca_id_seq OWNED BY core_marca.id;


--
-- Name: core_marcacategoria; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_marcacategoria (
    id integer NOT NULL,
    marca_id integer NOT NULL,
    subcategoria_id integer NOT NULL,
    url character varying(255) NOT NULL
);


ALTER TABLE core_marcacategoria OWNER TO root;

--
-- Name: core_marcacategoria_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_marcacategoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_marcacategoria_id_seq OWNER TO root;

--
-- Name: core_marcacategoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_marcacategoria_id_seq OWNED BY core_marcacategoria.id;


--
-- Name: core_mensajecontacto; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_mensajecontacto (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    empresa character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    telefono character varying(255) NOT NULL,
    comentarios text NOT NULL,
    desactivar_email boolean NOT NULL
);


ALTER TABLE core_mensajecontacto OWNER TO root;

--
-- Name: core_mensajecontacto_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_mensajecontacto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_mensajecontacto_id_seq OWNER TO root;

--
-- Name: core_mensajecontacto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_mensajecontacto_id_seq OWNED BY core_mensajecontacto.id;


--
-- Name: core_mundotecnologia; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_mundotecnologia (
    id integer NOT NULL,
    imagen character varying(2000000)
);


ALTER TABLE core_mundotecnologia OWNER TO root;

--
-- Name: core_mundotecnologia_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_mundotecnologia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_mundotecnologia_id_seq OWNER TO root;

--
-- Name: core_mundotecnologia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_mundotecnologia_id_seq OWNED BY core_mundotecnologia.id;


--
-- Name: core_perfil; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_perfil (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    color character varying(10) NOT NULL,
    departamento character varying(100) NOT NULL,
    extension character varying(100) NOT NULL,
    sucursal integer NOT NULL
);


ALTER TABLE core_perfil OWNER TO root;

--
-- Name: core_perfil_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_perfil_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_perfil_id_seq OWNER TO root;

--
-- Name: core_perfil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_perfil_id_seq OWNED BY core_perfil.id;


--
-- Name: core_personaautorizada; Type: TABLE; Schema: public; Owner: root; Tablespace: 
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


ALTER TABLE core_personaautorizada OWNER TO root;

--
-- Name: core_personaautorizada_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_personaautorizada_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_personaautorizada_id_seq OWNER TO root;

--
-- Name: core_personaautorizada_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_personaautorizada_id_seq OWNED BY core_personaautorizada.id;


--
-- Name: core_producto; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_producto (
    id integer NOT NULL,
    marca character varying(255) NOT NULL,
    tipo character varying(255) NOT NULL,
    clave character varying(255) NOT NULL,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE core_producto OWNER TO root;

--
-- Name: core_producto_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_producto_id_seq OWNER TO root;

--
-- Name: core_producto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_producto_id_seq OWNED BY core_producto.id;


--
-- Name: core_renta; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_renta (
    id integer NOT NULL,
    folio integer NOT NULL,
    numero_cliente character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    cliente character varying(255) NOT NULL,
    responsable character varying(255) NOT NULL,
    departamento character varying(255) NOT NULL,
    direccion character varying(255) NOT NULL,
    ciudad character varying(255) NOT NULL,
    telefono character varying(255) NOT NULL,
    condicion integer NOT NULL,
    fecha_inicio date,
    fecha_final date,
    status boolean NOT NULL,
    observaciones text NOT NULL,
    CONSTRAINT core_renta_folio_check CHECK ((folio >= 0))
);


ALTER TABLE core_renta OWNER TO root;

--
-- Name: core_renta_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_renta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_renta_id_seq OWNER TO root;

--
-- Name: core_renta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_renta_id_seq OWNED BY core_renta.id;


--
-- Name: core_rentadetalle; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_rentadetalle (
    id integer NOT NULL,
    renta_id integer NOT NULL,
    equipo_id integer NOT NULL
);


ALTER TABLE core_rentadetalle OWNER TO root;

--
-- Name: core_rentadetalle_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_rentadetalle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_rentadetalle_id_seq OWNER TO root;

--
-- Name: core_rentadetalle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_rentadetalle_id_seq OWNED BY core_rentadetalle.id;


--
-- Name: core_solicitarcredito; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_solicitarcredito (
    id integer NOT NULL,
    distribuidor boolean NOT NULL,
    dist_id integer NOT NULL,
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
    forma_pago_3 character varying(255) NOT NULL,
    doc_req_1 character varying(255),
    doc_req_2 character varying(255),
    doc_req_3 character varying(255)
);


ALTER TABLE core_solicitarcredito OWNER TO root;

--
-- Name: core_solicitarcredito_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_solicitarcredito_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_solicitarcredito_id_seq OWNER TO root;

--
-- Name: core_solicitarcredito_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_solicitarcredito_id_seq OWNED BY core_solicitarcredito.id;


--
-- Name: core_solicitudtrabajo; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_solicitudtrabajo (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    nombre character varying(255) NOT NULL,
    apellido character varying(255) NOT NULL,
    telefono character varying(255) NOT NULL,
    email character varying(75) NOT NULL,
    vacante_id integer,
    puesto character varying(255),
    aspiracion character varying(255) NOT NULL,
    curriculum character varying(10000000) NOT NULL,
    desactivar_email boolean NOT NULL
);


ALTER TABLE core_solicitudtrabajo OWNER TO root;

--
-- Name: core_solicitudtrabajo_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_solicitudtrabajo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_solicitudtrabajo_id_seq OWNER TO root;

--
-- Name: core_solicitudtrabajo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_solicitudtrabajo_id_seq OWNED BY core_solicitudtrabajo.id;


--
-- Name: core_status; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_status (
    id integer NOT NULL,
    creado timestamp with time zone NOT NULL,
    usuario_id integer NOT NULL,
    bitacora_id integer NOT NULL,
    status text NOT NULL
);


ALTER TABLE core_status OWNER TO root;

--
-- Name: core_status_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_status_id_seq OWNER TO root;

--
-- Name: core_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_status_id_seq OWNED BY core_status.id;


--
-- Name: core_subcategoria; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_subcategoria (
    id integer NOT NULL,
    categoria_id integer NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE core_subcategoria OWNER TO root;

--
-- Name: core_subcategoria_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_subcategoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_subcategoria_id_seq OWNER TO root;

--
-- Name: core_subcategoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_subcategoria_id_seq OWNED BY core_subcategoria.id;


--
-- Name: core_vacante; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_vacante (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    nombre character varying(255) NOT NULL,
    ciudad character varying(255) NOT NULL,
    descripcion text NOT NULL,
    sueldo character varying(255) NOT NULL
);


ALTER TABLE core_vacante OWNER TO root;

--
-- Name: core_vacante_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_vacante_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_vacante_id_seq OWNER TO root;

--
-- Name: core_vacante_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_vacante_id_seq OWNED BY core_vacante.id;


--
-- Name: core_vendedor; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_vendedor (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    folio character varying(100) NOT NULL
);


ALTER TABLE core_vendedor OWNER TO root;

--
-- Name: core_vendedor_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_vendedor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_vendedor_id_seq OWNER TO root;

--
-- Name: core_vendedor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_vendedor_id_seq OWNED BY core_vendedor.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO root;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO root;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO root;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO root;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO root;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_actividad ALTER COLUMN id SET DEFAULT nextval('core_actividad_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_avisoprivacidad ALTER COLUMN id SET DEFAULT nextval('core_avisoprivacidad_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_bitacora ALTER COLUMN id SET DEFAULT nextval('core_bitacora_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_bitacoraimagen ALTER COLUMN id SET DEFAULT nextval('core_bitacoraimagen_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_block ALTER COLUMN id SET DEFAULT nextval('core_block_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_categoria ALTER COLUMN id SET DEFAULT nextval('core_categoria_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_cliente ALTER COLUMN id SET DEFAULT nextval('core_cliente_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_concretarcita ALTER COLUMN id SET DEFAULT nextval('core_concretarcita_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_contacto ALTER COLUMN id SET DEFAULT nextval('core_contacto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_distribuidor ALTER COLUMN id SET DEFAULT nextval('core_distribuidor_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_encuestasatisfaccion ALTER COLUMN id SET DEFAULT nextval('core_encuestasatisfaccion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_equiporenta ALTER COLUMN id SET DEFAULT nextval('core_equiporenta_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_imagen ALTER COLUMN id SET DEFAULT nextval('core_imagen_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_imageninicio ALTER COLUMN id SET DEFAULT nextval('core_imageninicio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_lista ALTER COLUMN id SET DEFAULT nextval('core_lista_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_marca ALTER COLUMN id SET DEFAULT nextval('core_marca_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_marcacategoria ALTER COLUMN id SET DEFAULT nextval('core_marcacategoria_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_mensajecontacto ALTER COLUMN id SET DEFAULT nextval('core_mensajecontacto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_mundotecnologia ALTER COLUMN id SET DEFAULT nextval('core_mundotecnologia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_perfil ALTER COLUMN id SET DEFAULT nextval('core_perfil_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_personaautorizada ALTER COLUMN id SET DEFAULT nextval('core_personaautorizada_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_producto ALTER COLUMN id SET DEFAULT nextval('core_producto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_renta ALTER COLUMN id SET DEFAULT nextval('core_renta_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_rentadetalle ALTER COLUMN id SET DEFAULT nextval('core_rentadetalle_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_solicitarcredito ALTER COLUMN id SET DEFAULT nextval('core_solicitarcredito_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_solicitudtrabajo ALTER COLUMN id SET DEFAULT nextval('core_solicitudtrabajo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_status ALTER COLUMN id SET DEFAULT nextval('core_status_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_subcategoria ALTER COLUMN id SET DEFAULT nextval('core_subcategoria_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_vacante ALTER COLUMN id SET DEFAULT nextval('core_vacante_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_vendedor ALTER COLUMN id SET DEFAULT nextval('core_vendedor_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add perfil	6	add_perfil
17	Can change perfil	6	change_perfil
18	Can delete perfil	6	delete_perfil
19	Can add producto	7	add_producto
20	Can change producto	7	change_producto
21	Can delete producto	7	delete_producto
22	Can add imagen	8	add_imagen
23	Can change imagen	8	change_imagen
24	Can delete imagen	8	delete_imagen
25	Can add lista	9	add_lista
26	Can change lista	9	change_lista
27	Can delete lista	9	delete_lista
28	Can add contacto	10	add_contacto
29	Can change contacto	10	change_contacto
30	Can delete contacto	10	delete_contacto
31	Can add concretar cita	11	add_concretarcita
32	Can change concretar cita	11	change_concretarcita
33	Can delete concretar cita	11	delete_concretarcita
34	Can add vendedor	12	add_vendedor
35	Can change vendedor	12	change_vendedor
36	Can delete vendedor	12	delete_vendedor
37	Can add distribuidor	13	add_distribuidor
38	Can change distribuidor	13	change_distribuidor
39	Can delete distribuidor	13	delete_distribuidor
40	Can add persona autorizada	14	add_personaautorizada
41	Can change persona autorizada	14	change_personaautorizada
42	Can delete persona autorizada	14	delete_personaautorizada
43	Can add cliente	15	add_cliente
44	Can change cliente	15	change_cliente
45	Can delete cliente	15	delete_cliente
46	Can add bitacora	16	add_bitacora
47	Can change bitacora	16	change_bitacora
48	Can delete bitacora	16	delete_bitacora
49	Can add vacante	17	add_vacante
50	Can change vacante	17	change_vacante
51	Can delete vacante	17	delete_vacante
52	Can add solicitud trabajo	18	add_solicitudtrabajo
53	Can change solicitud trabajo	18	change_solicitudtrabajo
54	Can delete solicitud trabajo	18	delete_solicitudtrabajo
55	Can add mensaje contacto	19	add_mensajecontacto
56	Can change mensaje contacto	19	change_mensajecontacto
57	Can delete mensaje contacto	19	delete_mensajecontacto
58	Can add marca	20	add_marca
59	Can change marca	20	change_marca
60	Can delete marca	20	delete_marca
61	Can add categoria	21	add_categoria
62	Can change categoria	21	change_categoria
63	Can delete categoria	21	delete_categoria
64	Can add sub categoria	22	add_subcategoria
65	Can change sub categoria	22	change_subcategoria
66	Can delete sub categoria	22	delete_subcategoria
67	Can add marca categoria	23	add_marcacategoria
68	Can change marca categoria	23	change_marcacategoria
69	Can delete marca categoria	23	delete_marcacategoria
70	Can add equipo renta	24	add_equiporenta
71	Can change equipo renta	24	change_equiporenta
72	Can delete equipo renta	24	delete_equiporenta
73	Can add renta	25	add_renta
74	Can change renta	25	change_renta
75	Can delete renta	25	delete_renta
76	Can add solicitar credito	26	add_solicitarcredito
77	Can change solicitar credito	26	change_solicitarcredito
78	Can delete solicitar credito	26	delete_solicitarcredito
79	Can add renta detalle	27	add_rentadetalle
80	Can change renta detalle	27	change_rentadetalle
81	Can delete renta detalle	27	delete_rentadetalle
82	Can add block	28	add_block
83	Can change block	28	change_block
84	Can delete block	28	delete_block
85	Can add status	29	add_status
86	Can change status	29	change_status
87	Can delete status	29	delete_status
88	Can add actividad	30	add_actividad
89	Can change actividad	30	change_actividad
90	Can delete actividad	30	delete_actividad
91	Can add encuesta satisfaccion	31	add_encuestasatisfaccion
92	Can change encuesta satisfaccion	31	change_encuestasatisfaccion
93	Can delete encuesta satisfaccion	31	delete_encuestasatisfaccion
94	Can add imagen inicio	32	add_imageninicio
95	Can change imagen inicio	32	change_imageninicio
96	Can delete imagen inicio	32	delete_imageninicio
97	Can add mundo tecnologia	33	add_mundotecnologia
98	Can change mundo tecnologia	33	change_mundotecnologia
99	Can delete mundo tecnologia	33	delete_mundotecnologia
100	Can add bitacora imagen	34	add_bitacoraimagen
101	Can change bitacora imagen	34	change_bitacoraimagen
102	Can delete bitacora imagen	34	delete_bitacoraimagen
103	Can add aviso privacidad	35	add_avisoprivacidad
104	Can change aviso privacidad	35	change_avisoprivacidad
105	Can delete aviso privacidad	35	delete_avisoprivacidad
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_permission_id_seq', 105, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
30	pbkdf2_sha256$12000$IDpirwklH4iu$6rqXE/YhzMHdNDJve8I68biTwHaf7vvmUPsvpmJ8FXk=	2014-11-24 19:33:17.944821-05	f	fernando.cortez	Fernando C	ventas	fernandocortez@compuproveedores.com	f	t	2014-11-24 19:33:17.944877-05
25	pbkdf2_sha256$12000$ihevMkfO4C8f$6AFBAlCEbQF6j9oowzkF6yroPqaT1LwoVUT4UHwPY0w=	2014-11-24 12:33:55.983489-05	f	benjamin.carrillo	Benjamin	reporte_interno	benjamincarrillo@compuproveedores.com	f	t	2014-11-24 12:33:55.983537-05
27	pbkdf2_sha256$12000$HdNrVN8nhkn2$Q4L3n0uD0U7N2LXpq4Jg7RdEAP6kYlVySLwo48D7PoI=	2014-11-24 12:36:14.391781-05	f	maritza.navarro	Maritza	reporte_interno	maritzanavarro@compuproveedores.com	f	t	2014-11-24 12:36:14.391829-05
28	pbkdf2_sha256$12000$zO5sPyx6tgMU$0+nt4loeFeBg8NuLU0GGifl96a+zQNUwL4DB2DL8B8k=	2014-11-24 12:37:53.123155-05	f	sofia.jimenez	Sofia	reporte_interno	sofiajimenez@compuproveedores.com	f	t	2014-11-24 12:37:53.123253-05
11	pbkdf2_sha256$12000$HWDdBt1o7jdh$iftuoB+DTSLYdMiTKfqRbaot9iSwQStWU8NaQxjsNI8=	2015-01-13 13:15:48.983265-05	f	luz.castillo	Lucy	mercadotecnia	luzcastillo@compuproveedores.com	f	t	2014-11-11 22:17:24.257986-05
1	pbkdf2_sha256$12000$EKbEEG0CP6TQ$zReGjHZlX7Ek6GOtaj5N3RwBTmdCsw4uUI4VkEszYaM=	2015-05-20 13:03:53.706031-04	t	admin			admin@admintotal.com	t	t	2014-11-08 14:56:57.769948-05
13	pbkdf2_sha256$12000$yhrK7nY7Alqy$3ad7tkI5RZqcUyXqrIwpy3yKRpB4gDXHxZFKvqfuvOM=	2015-05-11 14:27:04.076543-04	f	griselda.fernandez	Griselda	credito_cobranza	griseldafernandez@compuproveedores.com	f	t	2014-11-11 22:22:51.69754-05
12	pbkdf2_sha256$12000$C7hLiN4oNDZT$OZQnTZGI6do2A+JixuXVZIeTq+TeWjy2tGqxzbBK7NA=	2014-11-11 22:18:30.744309-05	f	carlos.morales	Carlos	mercadotecnia	carlosmorales@compuproveedores.com	f	t	2014-11-11 22:18:30.744388-05
2	pbkdf2_sha256$12000$6DsDlX3E9IDV$N6GHbqvIty2YiSA1BuYekh+SMrrAqCWOxGR+zdtpvgk=	2015-02-23 18:23:52.355814-05	t	JCASTILLO	Proveedor IT	administrador	juanefren@dmspitic.com	f	t	2014-11-10 15:35:27.95168-05
31	pbkdf2_sha256$12000$q0TU5oelzc0j$4lrv9BoeBEBjz0w6DS8ixfM13SdVQBGannJrt6xKezs=	2014-12-09 14:05:27.35748-05	f	PRUEBA	PRUEBA	soluciones_tecnologicas	PRUEBA@DMSPITIC.COM	f	t	2014-12-09 13:37:12.03999-05
6	pbkdf2_sha256$12000$Mh19TzdnGedF$V+wljAhXBRvbDFgAN3580Imv519odT9e5A+qKAv/2sk=	2014-11-11 18:04:54.607221-05	f	adan.romero	Adan Romero	credito_cobranza	adanromero@compuproveedores.com	f	t	2014-11-11 18:04:54.607295-05
20	pbkdf2_sha256$12000$Z1MU7TeHRokI$wcgIsJC/vy1Xa3a0rlKDrHbfKaCb2tNj37OiZ9ESeVQ=	2015-01-09 11:13:08.44575-05	f	noe.holguin	Noe	soporte_tecnico	noeholguin@compuproveedores.com	f	t	2014-11-20 16:47:18.010603-05
5	pbkdf2_sha256$12000$rCZJS2a8C6L0$gQ5a67FGGzxLOonECeB2xITQpGilEA5Ye/Tet3o7HF0=	2015-05-26 19:51:00.702781-04	f	marcela.parra	Marcela	credito_cobranza	marcelaparra@compuproveedores.com	f	t	2014-11-11 18:02:40.146077-05
16	pbkdf2_sha256$12000$LUTZWtNGwnoy$Aslq+SUy+h7YHbonKIesqXD3lpAgXddZuXYzv5vUI/s=	2014-11-14 14:25:31.336001-05	f	luz.coeto	LUZ DEL MAR	gerencia_administrativa	luzdelmarcoeto@compuproveedores.com	f	t	2014-11-14 14:25:31.336076-05
14	pbkdf2_sha256$12000$CPY3eY1reqrO$7znXRKWV5cGtJZUAYl2OU9U5gPtVaQEBNZCGOHVTZwk=	2015-05-25 14:54:25.945697-04	f	estefania.fimbres	Estefania	soporte_tecnico	estefaniafimbres@compuproveedores.com	f	t	2014-11-11 22:27:40.543332-05
19	pbkdf2_sha256$12000$078sM0fe8X0a$/b/6BeXqsnkiWqjd0D/8P67nAjlMNZWlG6QoKwRR70E=	2015-05-26 19:13:39.37889-04	f	marco.canedo	Marco	soporte_tecnico	marcocanedo@compuproveedores.com	f	t	2014-11-19 17:47:51.279951-05
26	pbkdf2_sha256$12000$1Vti7VPgeFHZ$+cjvC37qMbVZOmlxIZB8APMYyZhryCV7rCSmysvWRlQ=	2014-11-24 12:34:42.162996-05	f	xochitl.cordova	Xochitl	reporte_interno	xochitlcordova@compuproveedores.com	f	t	2014-11-24 12:34:42.163043-05
37	pbkdf2_sha256$12000$RCpzJ6xiAZnA$T/3lZCg6gMI0/7Q3L2y6/1vyozmZdRUn3SnEbZuQjuk=	2015-05-21 13:03:55.325992-04	t	pedro.jimenez	Pedro	administrador	pedrojimenez@compuproveedores.com	f	t	2015-01-10 12:52:08.899609-05
22	pbkdf2_sha256$12000$GYDWSIBv8VK1$iznP4xEq3ocMocfyknA2RHoqOXzq23vVmw0LVusvaIs=	2015-03-05 10:13:10.608296-05	f	fernando.leon	Fernando L	soporte_tecnico	fernandoleon@compuproveedores.com	f	t	2014-11-20 16:48:56.47444-05
4	pbkdf2_sha256$12000$1dBHUw3BONdY$AsfxW8cUhfRlmceQlLYBehRpaQw3LiPHzEfE6LL98yg=	2015-05-26 11:57:01.000612-04	t	ruben.valenzuela	Ruben	administrador	rubenvalenzuela@compuproveedores.com	f	t	2014-11-11 16:51:08.790396-05
24	pbkdf2_sha256$12000$XgleSe5fK1Da$fjVyHQQFBN3Wa4oYy2GTp0ZUrKbGN+P6ww43q/91ZWI=	2015-04-29 14:41:48.821428-04	f	alfonso.rivas	Alfonso	ventas	alfonsorivas@compuproveedores.com	f	t	2014-11-20 17:28:22.343823-05
17	pbkdf2_sha256$12000$eUZWh7nGVqOo$//FpMGwIYaT1c+7+FlRc6FEKNrHALlZPtT6TfmCyuz4=	2015-05-11 15:56:41.581026-04	f	emmanuel.lara	Emmanuel 	soluciones_tecnologicas	emmanuellara@compuproveedores.com	f	t	2014-11-19 13:18:34.743597-05
29	pbkdf2_sha256$12000$2ymnmYKQDJdc$/0kwmPmlPV+ccfliO9P/BoBOxtcmYKjMzXnZjHy+dgM=	2015-05-13 15:59:24.635193-04	f	daniela.leon	Daniela	ventas	danielaleon@compuproveedores.com	f	t	2014-11-24 16:34:30.77824-05
23	pbkdf2_sha256$12000$WY2JwDwOJxSO$rBA+LxykuEF4MMBbafxLhOGcfsgXCLugE5IcU5kY1fo=	2015-05-21 18:33:12.725412-04	f	athziry.rodriguez	Athziry	soporte_tecnico	athziryrodriguez@compuproveedores.com	f	t	2014-11-20 17:07:43.28846-05
21	pbkdf2_sha256$12000$fqPBuW0HAhgb$9FkLf4ez3akvNB72/6lDc/7EUpIhtVAT0icKWnuUVqw=	2015-03-04 18:06:47.220789-05	f	aaron.flores	Aaron	soluciones_tecnologicas	aaronflores@compuproveedores.com	f	t	2014-11-20 16:48:19.949543-05
35	pbkdf2_sha256$12000$T3PhhixfcehL$ui+KmYK2Np1IgKyJuvI4+bk0IA+v1imfdVNXwU+suMw=	2015-05-21 18:39:34.42676-04	f	lillian.rivas	Lillian	ventas	lillianrivas@compuproveedores.com	f	t	2015-01-07 11:31:56.563541-05
9	pbkdf2_sha256$12000$Tv9sj51BIJaZ$lttDaCBtrA2lzsRCmOKHxj9NUFrn6ZCH0CMqMTs0rf8=	2015-04-23 12:50:28.961543-04	f	omar.sardo	Omar	recursos_humanos	omarsardo@compuproveedores.com	f	t	2014-11-11 22:13:17.160567-05
32	pbkdf2_sha256$12000$TClXdLktu3o8$K/zmgal3njDjhb/0csRIvNEPPb2fmcSaGhylmzotpOM=	2015-05-13 19:37:22.447824-04	f	karla.solano	Karla	ventas	karlasolano@compuproveedores.com	f	t	2014-12-12 18:13:58.836183-05
36	pbkdf2_sha256$12000$ynRD4tpL3ZcO$kEqsAKShcxWSL+ofknuK3Kh+rdtZe60nrDHuGrmEJ4Q=	2015-05-22 19:34:54.406237-04	f	enrique.gomez	Enrique	soporte_tecnico	compuya-parian@outlook.com	f	t	2015-01-07 14:09:03.654046-05
3	pbkdf2_sha256$12000$3gZNaB1Yi1Bz$WG4477Mr3TidxlpAZQHOV0jiGMdgW6KJeIlXkEhoQzE=	2015-05-25 11:07:23.924013-04	t	tzirahuen.martinez	Tzirahuen	administrador	tzirahuenmartinez@compuproveedores.com	f	t	2014-11-11 16:49:59.091959-05
34	pbkdf2_sha256$12000$1jUh9isJPQbP$HNi6TWP5oG6r5+dVs195GxoLZcq7m5BFvjB6LwU42ho=	2015-01-19 14:21:52.169045-05	f	silvia.alvarez	Silvia	reporte_interno	silviaalvarez@compuproveedores.com	f	t	2014-12-22 14:59:00.981853-05
10	pbkdf2_sha256$12000$iacmyzDTdTFZ$rf8zZqUqfqioiuoiRmKaKMtLmwYc/lClWAzQ/weeCkc=	2015-05-14 15:05:15.203654-04	f	mercedes.delosreyes	Mercedes	mercadotecnia	mercedesdelosreyes@compuproveedores.com	f	t	2014-11-11 22:15:32.292515-05
18	pbkdf2_sha256$12000$d2AnZhG2X5jY$ZeOf7PeBycc6rnNpSMnHeI9qeA5r2RsxQCIfAqVGIfk=	2015-03-02 13:09:09.975742-05	t	mario.perez	Mario Perez	administrador	soporte@compuproveedores.com	f	t	2014-11-19 16:43:26.134244-05
7	pbkdf2_sha256$12000$18JTG9Zo0RT0$4U4Vq3JFleepmQ6652Sq8Lw96HDfwziqUMdO8OcpOBk=	2015-03-17 11:44:37.603675-04	f	nubia.valenzuela	Nubia	credito_cobranza	nubiavalenzuela@compuproveedores.com	f	t	2014-11-11 18:07:00.213389-05
33	pbkdf2_sha256$12000$GUbm90H4SOiu$KmVMLrWb0Md8Zpg016PJHTlL54tsdKeqHnaVVPpB6Ew=	2015-03-11 19:22:17.463914-04	f	elizabeth.velez	Elizabeth	ventas	elizabethvelez@compuproveedores.com	f	t	2014-12-15 10:48:44.636924-05
15	pbkdf2_sha256$12000$hGUh7eFqctyQ$ciA2ltLXbISMOFYJWCqmF4tvdIvlTyGF2i9wdhiAYzM=	2015-05-11 14:30:26.863206-04	t	liliana.navarro	Liliana	administrador	liliananavarro@compuproveedores.com	f	t	2014-11-14 12:17:55.153209-05
8	pbkdf2_sha256$12000$gzEMghjjzCHn$sFnr9LI6ohfg/xk2I4x+EnnDszZ2H5Wzc9J5ImKRuGg=	2015-05-27 11:13:29.02469-04	f	isabel.ubaldo	Isabel	soporte_tecnico	isabelubaldo@compuproveedores.com	f	t	2014-11-11 18:20:04.042381-05
38	pbkdf2_sha256$12000$i27cHrbMf0c6$ldjTQU0DVWVXbHSF8uBm13HTq+AtwChSLnuV9Lt22hY=	2015-01-19 13:00:26.323375-05	f	ramon.lara	Ramon La	soporte_tecnico	ramonlara@compuproveedores.com	f	t	2015-01-19 12:41:42.33679-05
46	pbkdf2_sha256$12000$X34D0rSTLrgs$NDGh6EFGOpWPAockH1DEjs6wlSTSz4H1VWuzPT/xmuU=	2015-05-26 15:24:10.111375-04	t	cleo.felix	Cleo	administrador	cleofelix@compuproveedores.com	f	t	2015-04-21 15:50:11.127353-04
47	pbkdf2_sha256$12000$5QFrQSUwYN1y$Jk7fGu53xOkNZlB4OtoVHOOLsSsMAGGmJZycd/zakTs=	2015-05-26 18:16:47.938728-04	t	victor.sanchez	Victor	administrador	victorsanchez@compuproveedores.com	f	t	2015-04-22 11:26:01.580522-04
43	pbkdf2_sha256$12000$dzPQu36KFOIu$norxyKpio/hPjh/Meh0Ukl0B5hQRKHVWkxn7mFNTfL0=	2015-02-05 18:09:24.6976-05	f	nazli.coeto	Nazli Coeto	ventas	nazli.coeto@compuproveedores.com	f	t	2015-02-05 18:09:03.486154-05
39	pbkdf2_sha256$12000$Y6MG54wAwUkt$AK6kDWoetUEw97d3Asiqc7DH1wHr6GogWiz/Otgm5BE=	2015-05-08 12:13:01.618008-04	f	manuel.castillo	Manuel Castillo	ventas	manuelcastillo@compuproveedores.com	f	t	2015-01-19 16:18:33.854028-05
48	pbkdf2_sha256$12000$GA0Ulgl3b2T7$rrat+6iWENHCpYWTgNPk4ZZCnJ+WGoHxZg0Hr2PBvGw=	2015-05-11 14:26:21.912452-04	f	veronica.luna	Veronica	ventas	toner20-veronica@outlook.com	f	t	2015-05-11 14:20:55.126983-04
40	pbkdf2_sha256$12000$hfLtOcnmXJdU$e87W0AB79MrBqQcPT/QGwfU0c7178rzAZ5gmqlT2wng=	2015-05-15 12:00:22.789545-04	f	carmen.mejia	Carmen 	soporte_tecnico	carmen.mejia@compuproveedores.com	f	t	2015-01-23 17:43:42.649609-05
41	pbkdf2_sha256$12000$r0VW349DUPqv$hSDvYbi7+UMYPx65SoVPWYt+FS1SQDraubl6PEQTA5s=	2015-03-10 22:06:23.553044-04	f	armando.felix	Armando Felix	ventas	armandofelix@compuproveedores.com	f	t	2015-01-27 17:20:47.296604-05
44	pbkdf2_sha256$12000$j2MLUYFx4GR9$AQmfWweegejNyDDMKBVUVDSTqypLX8tBL3bKuDnxg/E=	2015-03-11 11:47:21.5039-04	f	diego.garcia	Diego	ventas	toner20-ventas30@outlook.com	f	t	2015-03-07 11:24:48.752085-05
45	pbkdf2_sha256$12000$vZSsvsYKXiVh$B1jtK9TmZtS9a4fifuqh/Zj3+w5jTQSbysgD8N6WaaI=	2015-04-21 14:48:29.44663-04	f	raymundo.vega	Raymundo	ventas	raymundovega@compuproveedores.com	f	t	2015-04-21 14:48:29.4467-04
49	pbkdf2_sha256$12000$ntmWyAbBucfz$7H9HBaaSCFIKCn2ur3bc/huOoaqUziAIADhBGq6J5Vs=	2015-05-20 13:05:35.023869-04	f	lorenia.santacruz	Lorenia Santacruz	reporte_interno	loreniasantacruz@compuproveedores.com	f	t	2015-05-20 13:05:17.012753-04
42	pbkdf2_sha256$12000$bewRTogVsM4v$A+UHA297huQngzCXrU7jwM12vKPHVvS0l/Cu7YN16rg=	2015-05-25 18:07:46.136761-04	f	mario.noriega	Mario Noriega	soporte_tecnico	marionoriega@hpstorehermosillo.com	f	t	2015-01-29 15:03:45.575072-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_user_id_seq', 49, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: core_actividad; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_actividad (id, titulo, creado, usuario_creado_id, usuario_asignado_id, descripcion, confirmar, fecha_inicio, fecha_termino, cancelado) FROM stdin;
\.


--
-- Name: core_actividad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_actividad_id_seq', 1, false);


--
-- Data for Name: core_avisoprivacidad; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_avisoprivacidad (id, titulo, texto, creado) FROM stdin;
1	AVISO DE PRIVACIDAD	En cumplimiento a lo previsto en la Ley Federal de Protección de Datos Personales en Posesión de los Particulares (en lo sucesivo "la Ley"), nos permitimos informarle lo siguiente: \r\n\r\n1. Identidad del Responsable \r\nCompuproveedores, S. A. de C. V. (en lo sucesivo COMPUPROVEEDORES), señalando para efectos del presente Aviso de Privacidad el domicilio ubicado en San Luis Potosí N° 21, Col. Centro, Hermosillo, Sonora, C.P. 83000, COMPUPROVEEDORES será el responsable del uso y protección de los Datos Personales que le sean proporcionados por las personas físicas o morales a quien correspondan dichos datos (en lo sucesivo el Titular). \r\n\r\n2. Datos Personales \r\nEl tratamiento de los Datos Personales del Titular que se han puesto a disposición de COMPUPROVEEDORES bajo cualquier forma o circunstancia, podrá ser efectuado de conformidad con los presentes términos y condiciones, por lo que desde este momento se entiende, que el Titular otorga su consentimiento para dicho tratamiento. Entendiéndose por Datos Personales y por Datos Personales Sensibles lo siguiente: \r\n\r\nDatos Personales: Cualquier información concerniente a una persona física identificada o identificable, incluyendo de manera enunciativa más no limitativa: (i) nombre completo, (ii) edad o fecha de nacimiento, (iii) lugar de nacimiento, (iv) actividad, profesión, ocupación u oficio (v) domicilio particular, (vi) número telefónico, (vii) correo electrónico, entre otros. \r\n\r\nDatos Personales Sensibles: Aquellos datos personales que afecten a la esfera más íntima de su Titular, o cuya utilización indebida puedan dar origen a discriminación o conlleve un riesgo grave para éste. En particular, se consideran Datos Personales Sensibles aquellos que puedan revelar aspectos como origen racial o étnico, estado de salud presente y futuro, información genética, creencias religiosas, filosóficas y morales, afiliación sindical, opiniones políticas, preferencia sexual, entre otros. \r\n\r\n3. Finalidad del Tratamiento de Datos \r\nLa información de Datos Personales y/o Datos Sensibles, que es recolectada por COMPUPROVEEDORES de manera directa del Titular con su pleno consentimiento, tendrá el uso que en forma enunciativa pero no limitativa se describe a continuación: i) identificarle, ii) ubicarle iii) comunicarle, contactarse iv) enviarle información, promociones y/o mercancía, v) estadísticos, así como su transmisión a terceros por cualquier medio que permita la Ley. El uso de los Datos Personales y/o Sensibles, tendrán relación directa con la relación que usted tiene en su carácter de Cliente y/o Asociado. \r\n\r\nLos Datos personales del Titular que sean solicitados por COMPUPROVEEDORES en la Orden de Compra, bien sea por formato en papel o electrónico, podrán ser transferidos al Distribuidor o Fabricante, según corresponda, con la única finalidad de informarle sobre la solicitud comercial hecha por el Titular. \r\n\r\nPara las finalidades antes mencionadas, COMPUROVEEDORES requiere obtener los siguientes datos personales del Titular: nombre, dirección, correo electrónico, número de teléfono, todos ellos relacionados con la empresa para la cual el Titular trabaja o representa. \r\n\r\nEs responsabilidad del Titular de los Datos Personales, el garantizar que los datos facilitados a COMPUPROVEEDORES sean veraces y completos, y es responsable de comunicar a COMPUPROVEEDORES cualquier modificación en los mismos a efecto de que se pueda cumplir con la obligación de mantener la información actualizada. \r\nLa temporalidad del manejo de los Datos Personales del Titular, dependerá de la relación jurídica que se tenga celebrada con COMPUPROVEEDORES, así como de las obligaciones exigidas por la legislación vigente y las autoridades competentes. En todos los casos la información será guardada sólo por el tiempo razonable. \r\n\r\n4. Derechos para limitar el uso o divulgación de los Datos Personales \r\nLa información que sea entregada a COMPUPROVEEDORES, será debidamente resguardada, conservada y protegida, con los medios tecnológicos y físicos adecuados a efecto de que se impida su pérdida, mal uso, alteración, acceso no autorizado y robo. Sólo tendrán acceso a la información aquellas personas autorizadas por COMPUPROVEEDORES, ya sean empleados, proveedores de servicios, o socios de negocios, quienes han asumido el compromiso de mantener la información bajo un estricto orden de confidencialidad y seguridad; para ello los empleados firmaron en su contrato una cláusula de confidencialidad con COMPUPROVEEDORES, y los proveedores y socios de negocio han suscrito en los convenios y contratos una cláusula donde se acuerda la confidencialidad de la información. \r\n\r\n5. Transferencia de Datos \r\nEn caso de que los Datos Personales resguardados por COMPUPROVEEDORES sean requeridos por una autoridad de cualquier índole, ya sea por proceso legal, para responder a cualquier reclamo o acciones legales con motivo del cumplimiento de la relación jurídica celebrada entre el Titular y COMPUPROVEEDORES, o para proteger los derechos de COMPUPROVEEDORES o sus clientes y el público; estos datos se pondrán a disposición de la autoridad dentro del estricto cumplimiento a la Ley. \r\n\r\n6. Medios para ejercer los Derechos ARCO \r\nEl Titular de la información tendrán derecho a solicitar el acceso, rectificación, cancelación u oposición de sus datos, mediante solicitud escrita dirigida al siguiente domicilio: San Luis Potosí N° 21, Col. Centro, Hermosillo, Sonora, C.P. 83000, de las 08:00 am a 1:00 pm y de las 02:00 pm a 5:00 pm, de lunes a viernes con atención a Griselda Fernández, o mediante solicitud formulada a nuestros teléfonos del Sistema de Atención a Clientes (662) 214 2200, o al correo electrónico griseldafernandez@compuproveedores.com. \r\n\r\nCOMPUPROVEEDORES, dará respuesta a las solicitudes del Titular de la información, siempre y cuando no se actualice alguna de las excepciones contenidas en la Ley, y el solicitante cumpla con los requisitos contenidos en el artículo 29 de la Ley que se describen a continuación:\r\n \r\nI.\tSeñalar el nombre del Titular y domicilio u otro medio para comunicarle la respuesta a su solicitud; \r\nII.\tLos documentos que acrediten la identidad o, en su caso, la representación legal del Titular; \r\nIII.\tLa descripción clara y precisa de los Datos Personales respecto de los que se busca ejercer alguno de los derechos antes mencionados, y \r\nIV.\tCualquier otro elemento o documento que facilite la localización de los Datos Personales, es decir, a qué área de COMPUPROVEEDORES fueron proporcionados, la persona a quién fueron proporcionados o área de la empresa a la que pertenece la persona a la que se proporcionaron los datos.\r\n\r\nEl Titular puede dejar de recibir mensajes promocionales por teléfono, correo postal y/o correo electrónico a través de una solicitud a las línea de atención a clientes o enviando un correo electrónico a promociones@compuproveedores.com \r\n\r\n7. Consentimiento \r\nCon el presente Aviso de Privacidad, el Titular consiente tácitamente el uso de su información personal y queda debidamente informado de los datos que se recabaron de él y con qué fines, aceptando los términos contenidos que fueron elaborados en cumplimiento a la Ley Federal de Protección de Datos Personales en Posesión de los Particulares. \r\n\r\n8. Cambios al Aviso de Privacidad \r\nCOMPUPROVEEDORES, se reserva el derecho a modificar la presente política para adaptarla a novedades legislativas o jurisprudenciales así como a prácticas de la industria. En dichos supuestos, se anunciará en esta página los cambios introducidos con razonable antelación a su puesta en práctica. \r\n\r\nLa fecha de la última actualización al presente Aviso de Privacidad: 02/06/2013 \r\n\r\nEste Aviso de Privacidad y sus modificaciones estarán a su disposición en la página de Internet www.compuproveedores.com .\r\n\r\nEl presente Aviso de Privacidad, así como el manejo en general de la Ley que haga COMPUPROVEEDORES, se rige por la legislación vigente y aplicable en los Estados Unidos Mexicanos, cualquier controversia que se suscite con motivo de su aplicación deberá ventilarse ante los Órganos Jurisdiccionales competentes en la Ciudad de Hermosillo, Sonora. 	2014-11-11 18:33:40.584692-05
\.


--
-- Name: core_avisoprivacidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_avisoprivacidad_id_seq', 1, true);


--
-- Data for Name: core_bitacora; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_bitacora (id, tipo, cliente_id, fecha_modificado, usuario_modificado_id, usuario_id, folio, fecha, fecha_factura, fecha_vencimiento, fecha_aviso, clave, descripcion, accesorios, num_factura, guia, falla, acciones_correctivas, refacciones, observaciones, estado, sucursal, tipo_garantia, factura_costo_garantia, garantia_costo, tipo_servicio, tipo_equipo, equipo, marca, modelo, no_serie, cable_corriente_lap, bateria, otros_lap, otros_especificar_lap, contrasena_bios, contrasena_sesion, bandeja, toner, cartuchos_tinta, cabezales, cable_usb, cable_paralelo, cable_corriente_imp, otros_imp, otros_especificar_imp, monitor, sesion, sesion_especificar, password, password_especificar, cable_corriente, otros_pc, otros_especificar_pc, otros, fecha_recepcion, lugar_servicio, fecha_diagnostico, fecha_cierre, fecha_inicio, fecha_termino, accesorios_incluye, usa_herramienta, usa_escalera, usa_equipo, usa_reporte, usa_remision, usa_factura, usa_acuerdo, usa_liberacion, usa_otra, es_proyecto) FROM stdin;
60	0	803	2014-12-02 10:22:08.246285-05	1	3	932	2014-11-18 11:17:49.873515-05	2014-01-06	2014-12-18	\N	GHIA27154B	TABLETA GHIA ANY 2715B 1GHZ 8GB	ADAPTADOR DE CORRIENTE 	HM2393	0932178	NO CARGA. NO ENCIENTE. TABLETA COLOR NEGRA. CAJA COLOR GUINDA.				2	2	1		f	\N	\N				C27154B1309049027	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2014-12-02 10:22:08.246031-05	\N	\N		f	f	f	f	f	f	f	f	f	f
41	1	792	2015-01-20 11:33:24.012077-05	37	1	921	2014-11-11 10:39:19.184069-05	\N	2014-11-18	\N					0921131	FALLA EN BANDEJAS	SE LE RECORDÓ A EJECUTIVO DE CUENTA LA FACTURACIÓN, COMENTA QUE ESTA EN ESPERA DE LA ORDEN DE COMPRA PARA SU FACTURACIÓN 10/12/2014	Kit de mantenimiento completo.	HP Laserjet 9040	2	2	\N	HM 10606	f	1	3		HP	LASERJET	PENDIENTE	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-01-20 11:33:24.01175-05	2014-11-12 22:00:00-05	2014-11-13 00:00:00-05		f	f	f	t	f	f	f	f	f	f
385	0	818	2015-05-25 11:49:25.327732-04	14	36	1062	2015-04-21 20:59:42.932502-04	2015-02-12	2015-05-21	\N	VAMVB02027	BOCINA VB02027 CON SUBWOOFER HI FI 	CABLES USB	Rem 52	1062658	TIENE PARTES SUELTAS Y QUEBRADAS		ninguna		2	2	1	BOCINA VB02027 CON SUBWOOFER HI FI	f	\N	\N				00	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-05-18	\N	\N	2015-05-25 11:49:25.327374-04	\N	\N		f	f	f	f	f	f	f	f	f	f
44	0	798	2014-11-12 11:18:10.235913-05	8	8	923	2014-11-11 18:55:39.945905-05	2014-05-06	2014-12-11	\N	HPQ6472A	TONER HP LASERJET AMA 3600	No aplica	TJ1132	0923121	Toner no pinta.				2	1	2		f	\N	\N				No aplica	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2014-11-12 11:18:10.235622-05	\N	\N		f	f	f	f	f	f	f	f	f	f
40	1	229	2014-12-09 11:51:01.263586-05	1	1	2	2014-11-10 18:52:20.348437-05	\N	2014-11-17	\N					0002177	CLIENTE REPORTA RUIDO EN IMPRESORA				2	2	\N	HM55	f	1	3		SAMSUNG	SCX-6545	VARIOS	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2014-12-09 11:51:01.263225-05	2014-11-11 21:00:00-05	2014-11-11 11:00:00-05		f	f	f	t	f	f	f	f	t	f
59	1	757	2014-12-09 11:57:37.132912-05	1	1	927	2014-11-18 10:20:01.278743-05	\N	2014-11-25	\N					0927560	HOJAS ATORADAS.	SE SOLICITA FACTURA A EJECUTIVO DE CUENTA. 18/11/2014\r\n			2	2	\N	HM13116	f	2	3		XEROX	PHASER 7500	PENDIENTE	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2014-12-09 11:57:37.132667-05	2014-11-19 01:00:00-05	2014-11-19 02:00:00-05		t	f	f	f	f	f	f	f	f	f
52	1	801	2015-01-07 11:10:10.387732-05	1	1	923	2014-11-13 13:59:11.979389-05	\N	2014-11-20	\N					0923974	MARCA ATASCO DE PAPEL.	YA SE LE HABLO A CLIENTE PASA EN ESTA SEMANA ENTRE 12 Y 13 DE DICIEMBRE			2	2	\N	SE ENVIARA A RESICLADO	f	2	3		HP	OFFICEJET PRO 8600	CN2BJB4G37	f	f	f				t	f	t	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-01-07 11:10:10.387304-05	\N	\N		f	f	f	f	f	f	f	f	f	f
53	1	802	2014-12-02 11:25:29.180127-05	3	1	924	2014-11-13 14:33:25.562395-05	\N	2014-11-20	\N					0924927	Revisar el jack de corriente y boton izquierdo de mousepad se queda atorado. Y mantenimiento preventivo.	NO SE HA LOCALIZADO UN CARGADOR GENERICO DE BAJO COSTO PARA EL CLIENTE.			2	2	\N	HM12984	f	2	1		HP	PAVILION DV4-2014LA	CND9410Q3M	t	t	t			elcamino79	f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2014-12-02 11:25:29.179875-05	\N	\N		f	f	f	f	f	f	f	f	f	f
225	1	209	2015-02-10 16:30:44.801103-05	37	29	1003	2015-01-23 18:30:55.77784-05	\N	2015-01-30	\N					1003418	ESTA ATORANDO LAS HOJAS CONSTANTEMENTE. FAVOR DE IR A REVISARLA	Impartir así como firma, nombre de carta capacitación.			2	2	\N	HM14488	f	1	3		SAMSUNG	SCX-6545N	 	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-02-10 16:30:44.800868-05	2015-01-24 04:00:00-05	2015-01-24 04:00:00-05		f	f	f	f	f	f	f	f	f	f
300	1	640	2015-03-03 18:04:02.176434-05	4	4	1031	2015-02-24 10:45:01.018158-05	\N	2015-03-03	\N					1031101	UNIDAD DE IMAGEN AGOTADA, SE SOLICITA PIEZA A ASISTENTE DE VENTAS PARA INSTALAR REFACCIÓN.				2	2	\N	HM14490	f	3	3		SAMSUNG	SCX-6545	PENDIENTE	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-03-03 18:04:02.176184-05	2015-02-24 20:00:00-05	2015-02-24 21:00:00-05		f	f	f	f	f	f	f	f	f	f
45	1	800	2014-12-02 11:47:17.788226-05	1	1	922	2014-11-12 10:22:49.529021-05	\N	2014-11-19	\N					0922616	INSTALACIÓN DE PLOTER DESINGJET T120, 1 NODO Y CONFIGURACIÓN DE RED.				2	2	\N	HM12014	f	3	3		HP	DESIGNJET T120	PENDIENTE	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2014-12-02 11:47:17.787892-05	2014-11-11 21:00:00-05	2014-11-12 12:00:00-05		f	f	f	f	f	f	f	f	f	f
55	0	4	2015-01-06 13:11:06.282963-05	3	1	930	2014-11-13 19:38:01.72188-05	2014-08-01	2014-12-15	\N	27154P	GHIA ANY7 27154P	CARGAGOR AUDIFONOS USB	COMPUYA	0930577	NO TOMA FOTOS BIEN PANTALLA AZUL		NINGUNA	FIRMA REPORTE DE CIERRE JONATHAN GARCIA. 	2	2	1	GHIA27154P	f	\N	\N				C27154P1401060072	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-11-14	\N	\N	2015-01-06 13:11:06.282651-05	\N	\N		f	f	f	f	f	f	f	f	f	f
276	0	128	2015-03-21 15:58:13.777722-04	14	15	1015	2015-02-11 13:04:50.564775-05	2014-03-03	2015-03-13	\N	HPH6X33AA	AIO HP PRESARIO 18-2309LA	CABLE DE CORRIENTE	HM4833	1015183	PANTALLA SE PONE EN BLANCO, DIAGNOSTICAR.			se reemplaza disco duro, se actualiza el bios y se repara tarjeta de sistema.	2	2	1	HP 18-2309LA 00XC	f	\N	\N				5CM34200XC	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-02-18	\N	\N	2015-03-21 15:58:13.777454-04	\N	\N		f	f	f	f	f	f	f	f	f	f
50	0	799	2014-11-12 12:07:45.474707-05	8	8	927	2014-11-12 12:05:05.20889-05	2014-10-15	2014-12-12	\N	HPCE390A	TONER HP 90A NEGRO LJ M 4555 H MFP	No aplica	TJ2188	0927356	La carcasa tiene una fuga de toner.				2	1	2		f	\N	\N				No aplica	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2014-11-12 12:07:45.474403-05	\N	\N		f	f	f	f	f	f	f	f	f	f
51	0	87	2014-11-14 17:26:38.529007-05	1	1	928	2014-11-12 19:12:06.983999-05	2014-06-01	2014-12-14	\N	HPX547DW	OFFICEJET X457DW	NINGUNO	HMXXXX	0928305	ERROR EN SISTEMA DE TINTA. CAMBIO FÍSICO.				2	2	1		f	\N	\N				CN34HCJ00V	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2014-11-14 17:26:38.528669-05	\N	\N		f	f	f	f	f	f	f	f	f	f
56	0	11	2014-12-02 10:21:55.738867-05	1	1	931	2014-11-13 19:40:28.36767-05	2014-11-01	2014-12-15	\N	GHIAC20218P	GHIAC20218P	CARGADOR	PENDIENTE	0931421	NO ENCIENDE				2	2	1		f	\N	\N				GHIAC20218P	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2014-12-02 10:21:55.738542-05	\N	\N		f	f	f	f	f	f	f	f	f	f
2	2	\N	2015-04-20 20:09:45.923738-04	3	2	1140	2014-11-10 15:38:53.727479-05	\N	2014-11-13	\N					0001739	ejemplo				2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-20 20:09:45.923248-04	\N	\N		f	f	f	f	f	f	f	f	f	f
8	1	796	2014-11-24 10:32:15.086357-05	1	2	920	2014-11-10 15:48:38.37188-05	\N	2014-11-17	\N					0001862	XXX				2	2	\N	EJEMPLO	f	1	1		XXX	XX	XXXXX	f	t	t		XX	XX	f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2014-11-24 10:32:15.08612-05	\N	\N		f	f	f	f	f	f	f	f	f	f
380	0	928	2015-04-23 14:44:24.080038-04	14	14	1059	2015-04-17 15:13:16.544329-04	2014-08-16	2015-05-19	\N	GHIA27154P	TABLET GHIA 27154P	CARGADOR	R-  8372	1059587	NO ENCIENDE		ninguna	Se entrega equipo a Mercedes de los Reyes funcionando correctamente	2	2	1	TABLET GHIA 27154P	f	\N	\N				C27154P1401045303	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-04-20	\N	\N	2015-04-23 14:44:24.079707-04	\N	\N		f	f	f	f	f	f	f	f	f	f
103	0	87	2014-12-12 11:59:37.527161-05	3	4	945	2014-12-03 13:41:37.532452-05	2014-05-01	2015-01-02	\N	HPCF278A	HP LASERJET M401	NINGUNO	HM1234	0945019	SE QUEDA EN LA PANTALLA INICIALIZANDO Y NO ENTRA A  SISTEMA		NINGUNA	IMPRIMIENDO CORRECTAMENTE.	2	2	1	HP LASERJET M401	f	\N	\N				PHGDC05486	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-12-03	\N	\N	2014-12-12 11:59:37.526869-05	\N	\N		f	f	f	f	f	f	f	f	f	f
83	1	87	2014-12-12 14:26:24.775661-05	3	29	942	2014-11-26 16:18:05.322069-05	\N	2014-12-03	\N					0942061	REPORTADA ES DE OBREGON CALIFORNIA ATORA LAS OJAS Y NO IMPRIME, LA TIENEN CARLOS PREYRA EN EXBAXICO RECAUDACION.\r\nSALUDOS.		GARANTIA.	SE ENTREGA FUNCIONANDO CORRECTAMENTE.	2	2	\N	GARANTIA	f	1	3		HP	M401N	PHGDF02171	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2014-12-12 14:26:24.775433-05	2014-11-27 04:00:00-05	2014-11-28 04:00:00-05		f	f	f	f	f	f	f	f	f	f
46	0	87	2014-11-14 17:24:56.48333-05	1	1	924	2014-11-12 10:36:20.09068-05	2014-03-05	2014-12-12	\N	HPE381LT	AIO 205	ELIMINADOR DE COTTIENTE	HMXXXX	0924285	NO MUESTRA VIDEO				2	2	1	NINGUNO	t	\N	\N				4CE40109WR	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-11-14	\N	\N	2014-11-14 17:24:56.483004-05	\N	\N		f	f	f	f	f	f	f	f	f	f
61	0	803	2014-12-02 10:23:04.57791-05	1	3	933	2014-11-18 11:23:53.616391-05	2013-12-06	2014-12-18	\N	GHIA27154P	TABLETA GHIA ANY 27154P 1GHZ 8GB GRIS	ADAPTADOR DE CORRIENTE 	HM1806	0933514	NO CARGA. NO ENCIENDE. TABLETA COLOR GRIS. CAJA COLOR GUINDA.				2	2	1		f	\N	\N				C27154B13090490276	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2014-12-02 10:23:04.577631-05	\N	\N		f	f	f	f	f	f	f	f	f	f
7	0	796	2014-11-25 11:45:31.781846-05	2	2	920	2014-11-10 15:48:12.417843-05	2014-11-10	2014-12-10	\N	XX	XXX	No aplica	XXXX	0001803	XXXXXXXXX				2	2	2		f	\N	\N				No aplica	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2014-11-25 11:45:31.781549-05	\N	\N		f	f	f	f	f	f	f	f	f	f
82	1	757	2014-12-02 11:46:14.385483-05	1	23	941	2014-11-26 14:44:44.685726-05	\N	2014-12-03	\N					0941662	instalacion de fusor para impresora				2	2	\N	HM12496	f	3	3		HP	LASERJET 5500	XXXXXXXXX	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2014-12-02 11:46:14.385204-05	2014-11-27 21:00:00-05	2014-11-27 21:00:00-05		f	f	f	f	f	f	f	f	f	f
362	0	293	2015-03-24 13:23:50.426073-04	19	19	1051	2015-03-24 13:23:50.399791-04	2015-02-12	2015-04-23	\N	HPCC364XC	TONER HP 64X 24K PAG NEGRO CONTRACT	No aplica	10261	1051161	NO SE DETECTA, UNA VES INSTALADO\r\nVENDEDOR: Daniela León.				0	2	2		f	\N	\N				No aplica	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
75	1	811	2014-12-04 14:18:12.947209-05	15	18	935	2014-11-24 14:30:10.810254-05	\N	2014-12-01	\N					0935084	DIAGNOSTICAR, EL EQUIPO PONE LA PANTALLA BLANCA, Y NO ENCIENDE.		SERVICIO01 $75.00	SE REGRESA LA EQUIPO AL CLIENTE SIN REPARAR.	2	2	\N	R9518	f	2	1		HP	G42	CNF04680M7	f	f	f		ckalolo130990		f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2014-12-04 14:18:12.946901-05	\N	\N		f	f	f	f	f	f	f	f	f	f
62	0	304	2014-12-04 14:20:46.47389-05	3	3	934	2014-11-18 12:57:29.687821-05	2014-05-08	2014-12-18	\N	OK62433101	MULTIFUNCIONAL OKIDATA MB460 MONOCROMATICA	SIN ACCESORIOS - SIN CONSUMIBLES	REMISION 1010	0934828	LA FALLA QUEDO PENDIENTE.\r\nLA PERSONA QUE LA TRAE NO SABE CUAL ES LA FALLA.	Fecha Factura:\t8 de Mayo de 2012.\r\nREMISIÓN 1010.\r\nSE DARÁ CONTINUIDAD EN EL SERVICIO Folio: 928.	NINGUNA	Fecha Factura:\t8 de Mayo de 2012.\r\nREMISIÓN 1010.\r\nSE DARÁ CONTINUIDAD EN EL SERVICIO Folio: 928.	2	2	1	REMISIÓN 1010	f	\N	\N				SAL17057926C0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-11-18	\N	\N	2014-12-04 14:20:46.473626-05	\N	\N		f	f	f	f	f	f	f	f	f	f
80	2	\N	2015-04-17 15:38:39.576823-04	3	15	1144	2014-11-25 13:04:36.965997-05	\N	2014-12-25	\N					1144414	Buenos días, Compañeros.\r\n\r\nEl motivo del reporte es porque tengo un problema, cuando se va la energía no me respalda nada de mi trabajo de mi computadora se apaga inmediatamente tengo un NO BREAK pero no funciona, para que por favor me ayudan a solucionarlo, gracias.\r\n\r\nSaludos cordiales.				1	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	t
67	0	336	2014-12-10 14:17:19.642102-05	19	19	935	2014-11-19 17:55:08.742417-05	2014-10-29	2014-12-19	\N	HPC9381A	TINTA HP 88 NEGRO AMARILLO CABEZAL K550	No aplica	9114	0935575	AL MOMENTO DE INSTALARLO MARCO "FALLA EN EL CABEZAL".				2	2	2	VIANEY	f	\N	\N				No aplica	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-12-03	\N	\N	2014-12-10 14:17:19.64179-05	\N	\N		f	f	f	f	f	f	f	f	f	f
64	2	\N	2015-04-17 15:22:48.23394-04	14	14	1142	2014-11-18 13:35:02.814394-05	\N	2014-11-21	\N					1142469	Adquirir los siguientes equipos (consumo interno) para la sucursal de \r\n\r\nAguascalientes:\r\n\r\n3 Monitores LED HP 18.5 mod. W1952\r\n1 Mouse y Teclado HP mod. H4B79AA\r\n6 NoBreak Microsrinet 480va XRN-21-481\r\n\r\n				2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 15:22:48.233659-04	\N	\N		f	f	f	f	f	f	f	f	f	f
70	1	343	2014-12-10 18:01:11.28928-05	15	1	932	2014-11-20 16:03:02.877477-05	\N	2014-11-27	\N					0932995	CONFIGURACION DE EQUIPO	SE LE PROPORCIONA A EJECUTIVO DE CUENTA NUMERO DE PARTE DE PIEZA DAÑADA PARA SU COTIZACIÓN 20/11/2014			2	2	\N	RM9367	f	1	3		XEROX	N/A	N/A	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2014-12-10 18:01:11.289006-05	2014-11-20 18:00:00-05	2014-11-20 19:00:00-05		f	f	f	f	f	f	f	f	f	f
112	0	829	2014-12-16 17:31:58.817389-05	8	8	948	2014-12-09 13:50:24.219974-05	2014-12-02	2015-01-08	\N	HPCZ103AL	TINTA HP No. 662 NEGRO	No aplica	TJ2568	0948193	NO IMPRIME.				2	1	2	Consumible	f	\N	\N				No aplica	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-12-10	\N	\N	2014-12-16 17:31:58.817105-05	\N	\N		f	f	f	f	f	f	f	f	f	f
128	1	160	2015-01-14 17:57:49.295653-05	4	1	965	2014-12-15 10:52:26.492159-05	\N	2014-12-22	\N					0965535	EQUIPO PRESENTA FALLAS AL MOMENTO DE IMPRIMIR\r\n				2	2	\N	APOYO VENTAS	f	3	3		XEROX	WORKCENTRE 5020	PENDIENTE	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-01-14 17:57:49.295275-05	2014-12-15 18:30:00-05	2014-12-10 19:30:00-05		f	f	f	f	f	f	f	f	f	f
72	1	343	2014-11-24 10:27:18.076689-05	24	24	934	2014-11-22 13:09:32.249752-05	\N	2014-11-28	\N					0934694	INSTALACION DE EQUIPO NUEVO HP				3	2	\N		f	3	3		HP	OFFICEJET 8620	SN	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	\N	2014-11-24 11:00:00-05	2014-11-24 12:00:00-05		f	f	f	t	t	f	f	f	f	f
66	1	806	2014-12-09 11:52:43.327648-05	1	15	930	2014-11-19 13:50:32.636784-05	\N	2014-11-26	\N					0930142	DIAGNOSTICO DE EQUIPO.	ABANICO, DISCO DURO Y CARCASA INFERIOR DAÑADAS. SE LE AVISA A CLIENTE Y RECHAZA REPARACIÓN PARA ENVIAR EQUIPO A GARANTIA.  			2	2	\N	NINGUNO	f	2	1		HP	M7-J020DX	6CH33414NM	f	f	f		JimWilcox3666	JimWilcox3666	f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2014-12-09 11:52:43.327378-05	\N	\N		f	f	f	f	f	f	f	f	f	f
71	1	712	2014-12-09 12:51:07.282382-05	1	24	933	2014-11-20 17:37:06.766445-05	\N	2014-11-27	\N					0933976	INSTALACION EN SALA DE JUNTAS DE ACUICOLA SELECTA.				2	2	\N	HM12921	f	3	4		POLYCOM	SN	SN	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		POLYCOM	\N	2	\N	2014-12-09 12:51:07.282043-05	2014-11-20 13:00:00-05	2014-11-20 15:00:00-05	INSTALACION	t	f	f	f	f	f	f	f	f	f
392	1	663	2015-04-30 16:01:22.202217-04	37	23	1064	2015-04-23 15:09:43.721646-04	\N	2015-04-30	\N					1064167	INSTALACIÓN PARA 50 COMPUTADORA LENOVO THINKCENTRE M73Z AIO DE OFFICE 365.	Desinstalar versión de office 365.		Configuración de office 365 en sistema Windows 8.1	2	2	\N	R10894	f	3	2		LENOVO	COMPUTADORA LENOVO THINKCENTRE M73Z AIO	XXXXXXX	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-04-30 16:01:22.202005-04	2015-04-24 12:00:00-04	2015-04-25 12:00:00-04		f	f	f	f	f	f	f	f	f	f
81	1	265	2015-01-07 11:10:42.025607-05	1	15	940	2014-11-26 14:00:49.753983-05	\N	2014-12-03	\N					0940592	ATASCO DE HOJAS AL ESCANEAR, COTIZAR.				2	2	\N	NINGUNO	f	2	4		HP	SCANJET 7000	N/A	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		ESCANER	\N	1	\N	2015-01-07 11:10:42.025276-05	\N	\N	ADAPTADOR DE CORRIENTE	f	f	f	f	f	f	f	f	f	f
42	0	243	2014-12-02 10:19:04.93495-05	1	3	921	2014-11-11 17:54:04.954722-05	2014-10-16	2014-12-11	\N	HPJ2L87LT	LAPTOP HP 250 i3-3217U 	PENDIENTE	HM11580	0921896	EQUIPO 1\r\n\r\nFALLA: \r\nProblemas con uno de los seguros que mantienen unida la batería al equipo.\r\n\r\nDIRECCIÓN: \r\nPaseo Rió Sonora edificio TI No. 110 2° piso \r\nentre Río Cocospera y Río California\r\nCol. Proyecto Río Sonora.\r\n\r\nDIRECCIÓN GENERAL DE AUDITORIA FISCAL\r\nDEPARTAMENTO ADMINISTRATIVO\r\nJOSÉ GUADALUPE MAYTORENA SILVA\r\n662-212-34-05 TELEFONO OFICINA\r\n				2	2	1		f	\N	\N				CND43678sz	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2014-12-02 10:19:04.934575-05	\N	\N		f	f	f	f	f	f	f	f	f	f
73	0	4	2014-11-28 10:28:43.704953-05	14	14	936	2014-11-22 14:17:27.499639-05	2014-10-20	2014-12-23	\N	ANY 7" 27154B	Tablet de 7"	Adaptador USB, Cable mini USB, Cargador, Audifonos.	TICKET 350	0936484	AL CARGAR SE CALIENTA Y YA NO ENCENDIÓ. INFORMA EL CLIENTE QUE SE ESCUCHO UN "TRONIDO" POR LA PARTE POSTERIOR.	Se le entrego a Yonatan (CompuYA)			2	2	1		f	\N	\N				C27154B1312005904	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-11-28	\N	\N	2014-11-28 10:28:43.7046-05	\N	\N		f	f	f	f	f	f	f	f	f	f
79	1	160	2014-12-10 18:23:09.067514-05	15	23	939	2014-11-25 10:40:11.976464-05	\N	2014-12-02	\N					0939179	LA BANDEJA 2 DE LA IMPRESORA XEROX 5020 FRUNCE LAS HOJAS.				2	2	\N	HM13246	f	1	3		xerox	5020	XXXXXXXXXXX	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2014-12-10 18:23:09.067203-05	2014-11-25 21:00:00-05	2014-11-26 21:00:00-05		f	f	f	f	f	f	f	f	f	f
76	1	642	2014-12-12 17:42:45.021049-05	1	24	936	2014-11-24 16:37:54.343131-05	\N	2014-12-01	\N					0936328	COTIZAR LA INSTALACION DE UN PROYECTOR Y UN HOME TEATHER	PENDIENTE APROBACIÓN DE PROYECTO, POR PARTE DE CLIENTE.10/12/2014			2	2	\N	HM13161	f	2	4		SN	SN	SN	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		SALA DE JUNTAS	\N	2	\N	2014-12-12 17:42:45.020786-05	2014-11-24 20:00:00-05	2014-11-24 21:00:00-05		f	f	f	t	f	f	f	f	f	f
77	1	705	2014-12-12 17:42:24.304569-05	1	24	937	2014-11-24 16:44:10.375958-05	\N	2014-12-01	\N					0937574	EN 4TO DE PRIMARIA DE ARCOS SE SOLTO LA BANDEJA DEL PIZARRON, FAVOR DE COLOCARLA DE NUEVO.	ALFONSO PASARA LA FACTURA, AUN NO LA REALIZA.			2	2	\N	HM13016	f	3	4		SMART	SB	SN	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		BANDEJA SMART BOARD 4TO	\N	2	\N	2014-12-12 17:42:24.304304-05	2014-11-25 18:00:00-05	2014-11-24 19:00:00-05	BANDEJA DAÑADA	t	f	f	t	f	f	f	f	f	f
78	1	209	2014-12-12 17:57:13.98648-05	1	4	938	2014-11-24 19:26:42.430855-05	\N	2014-12-01	\N					0938367	INSTALACIÓN, CONFIGURACIÓN Y CAPACITACIÓN DE MULTI FUNCIONAL SAMSUNG SCX6545.				2	2	\N	APOYO VENTAS	f	3	3		SAMSUNG	SCX-6545	N/A	f	f	f				f	f	f	f	f	f	t	f		f	f		f		f	f			\N	2	\N	2014-12-12 17:57:13.986251-05	2014-11-24 20:00:00-05	2014-11-24 21:30:00-05		f	f	f	t	f	f	f	f	f	f
65	1	804	2014-12-12 17:56:55.438521-05	1	3	929	2014-11-18 14:04:59.836257-05	\N	2014-11-25	\N					0929308	CALENTAMIENTO DESPUES DE UNAS HORA DE USO.\r\nNO INCLUYE BATERIA.\r\nREALIZAR SERVICIO PREVENTIVO.\r\n				2	2	\N	HM13351	f	1	1		COMPAQ	PRESARIO CQ42-123LA	CNF0191PF5	f	f	f		SIN CONTRASEÑA	SIN CONTRASEÑA	f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2014-12-12 17:56:55.438274-05	\N	\N		f	f	f	f	f	f	f	f	f	f
133	1	830	2014-12-17 15:01:49.526499-05	1	18	967	2014-12-17 14:21:18.664541-05	\N	2014-12-24	\N					0967746	ESTA MUY LENTA AL ENTRAR A INTERNET SE ABREN MUCHAS VENTANAS Y YA NO SE PUEDE IMPRIMIR COTIZAR MEMORIA				3	2	\N	HM13659	f	1	2		COMPAQ	PRESARIO	CNX72527HT	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
84	2	\N	2015-04-20 14:18:35.647308-04	3	9	1145	2014-11-26 17:43:06.404636-05	\N	2014-12-01	\N					1145559	BUENAS TARDES\r\nFAVOR DE CREARLE CUENTA DE CORREO, SKY PE Y CREDENCIALES A:\r\nFERNANDO ANTONIO LEÓN ORTIZ\r\nFECHA DE NAC. 23/06/1985\r\n\r\nASÍ COMO LAS CARTAS RESPONSIVAS CORRESPONDIENTE A EQUIPO Y MOBILIARIO, CLAVES DE IMPRESIÓN, ETC.\r\n\r\nSIN MAS POR EL MOMENTO, GRACIAS		NINGUNA	Cualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.\r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-20 14:18:35.646968-04	\N	\N		f	f	f	f	f	f	f	f	f	f
74	0	103	2014-12-04 14:29:03.571831-05	3	18	937	2014-11-24 13:12:15.242036-05	2014-03-26	2014-12-24	\N	DELLI14HI5S6	LAPTOP DELL INSPIRON 14 CI5 6GB 1TB W8	ADAPTADOR DE CORRIENTE 	5205	0937140	SE TRABA EQUIPO, REINICIA SOLO, SE DISTORCIONA PANTALLA Y AL ENCENDERLA APARECE INTERNAL HARD DISK NOT FOUND CHECAR LA SERIE CON PROVEEDOR YA QUE NO COINCIDE LA SERIE DEL EQUIPO CON LA FACTURA Y LA SERIE DEL EQUIPO ES OTRA 	DELL ENVIARA TECNICO CON DISCO DURO PARA SU INSTALACION DE 3 A 5 DIAS HABILES (25/11/2014)	NINGUNA	SE ENTREGO AL CLIENTE FUNCIONANDO CORRECTO.	2	2	1		f	\N	\N				CN0M75GC762063910054A00	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-11-24	\N	\N	2014-12-04 14:29:03.571388-05	\N	\N		f	f	f	f	f	f	f	f	f	f
94	0	87	2014-12-10 13:39:52.818629-05	3	1	941	2014-12-01 16:33:38.422211-05	2014-12-01	2014-12-31	\N	HPCF278A	HP LASERJET M401	NINGUNO	PENDIENTE	0941455	Esta atascando papel constantemente cunado se manda imprimir arriba de 4 hojas 		NINGUNNA	FUNCIONANDO CORRECTAMENTE	2	2	1	SIN COSTO	f	\N	\N				PHDGC05683	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-12-03	\N	\N	2014-12-10 13:39:52.818198-05	\N	\N		f	f	f	f	f	f	f	f	f	f
132	0	4	2014-12-16 19:19:34.922941-05	3	3	958	2014-12-16 19:12:48.500876-05	2014-12-16	2015-01-15	\N	GHIA27154B	TABLET ANY 7" 27154B BLANCA	CAJA, CARGADOR.	NO SE ENTREGO	0958182	NO INICIA SISTEMA	LA TRAJO SEÑOR ANA. 	NINGUNA	SE REINSTALO SISTEMA. \r\nSE ENTREGO EN DIFUSA NORTE.	2	2	1	GHIA27154B	f	\N	\N				C27154B1309049044	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-12-16	\N	\N	2014-12-16 19:19:34.922685-05	\N	\N		f	f	f	f	f	f	f	f	f	f
372	1	818	2015-05-19 13:12:55.71501-04	37	36	1058	2015-04-08 20:44:41.507448-04	\N	2015-04-15	\N					1058284	esta roto display, touch. \r\n\r\nNota: Dejo anticipo de $450.00			Se realizo reparación de pantalla y membrana touchscreen.	2	2	\N	HM17658	f	1	4		GHIA	27258B 	s/n color blanca	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		Tableta	\N	1	\N	2015-05-19 13:12:55.714755-04	\N	\N	solamente la tableta	f	f	f	f	f	f	f	f	f	f
88	1	129	2014-11-28 13:34:11.71832-05	18	18	944	2014-11-28 13:29:35.211265-05	\N	2014-12-05	\N					0944221	ATASCA LAS HOJAS, Y SALEN ARRUGADAS Y MANCHADO EN HOJAS.				3	2	\N		f	2	3		HM	7110	CN3BD3MGZ8	f	f	f				f	f	t	f	f	f	t	f		f	f		f		f	f			\N	1	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
113	1	830	2014-12-17 15:02:17.928445-05	1	18	958	2014-12-09 18:25:33.911953-05	\N	2014-12-16	\N					0958804	HACER RESPALDO DE INFORMACION TIENE VIRUS ESTA MUY LENTA COTIZAR MEMORIA RAM 	FACTURAR SERVICIO01 $550.00			2	2	\N	HM13659	f	1	1		HP	HPDV5-2129WM	5CA0382K GX	t	t	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2014-12-17 15:02:17.928187-05	\N	\N		f	f	f	f	f	f	f	f	f	f
92	1	816	2014-12-12 13:41:50.748257-05	15	1	945	2014-11-29 12:26:39.306192-05	\N	2014-12-05	\N					0945031	EQUIPO NO ENCIENDE, SE PROGRAMA SERVICIO PREVENTIVO Y CORRECTIVO EN SIRIO				2	2	\N	HM13351	f	1	2		HP	N/A	N/A	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2014-12-12 13:41:50.747989-05	2014-11-29 20:00:00-05	2014-11-29 10:00:00-05		t	f	f	t	f	f	f	f	f	f
384	0	883	2015-04-30 17:18:22.046063-04	14	14	1061	2015-04-21 17:59:51.593093-04	2015-02-04	2015-05-21	\N	LEN10BBA0K9LS	LENOVO M73Z	POR DEFINIR	14655	1061446	NO ENCIENDE		ninguna	SE DETECTAN FALLAS EN TARJETA MADRE Y PROCESADOR.\r\n\r\nSE REEMPLAZAN REFACCIONES DAÑADAS Y EL EQUIPO QUEDA LISTO PARA USARSE.	2	2	1	LENOVO M73Z <302RGLB>	f	\N	\N				MJ01N4Y2	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-04-21	\N	\N	2015-04-30 17:18:22.045664-04	\N	\N		f	f	f	f	f	f	f	f	f	f
101	1	821	2014-12-08 10:42:52.974149-05	15	15	951	2014-12-03 11:48:48.530914-05	\N	2014-12-10	\N					0951597	SE ATORAN LAS HOJAS. /6621 433993				3	2	\N		f	1	3		HP	M4345	PENDIENTE	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	\N	2014-12-03 04:00:00-05	2014-12-03 14:00:00-05		t	f	f	t	f	f	f	f	f	f
43	0	243	2014-12-02 10:19:20.939074-05	1	3	922	2014-11-11 17:56:24.129638-05	2014-10-16	2014-12-11	\N	HPJ2L87LT	LAPTOP HP 250 i3-3217U 	PENDIENTE	HM11580	0922454	EQUIPO 2\r\nFALLA: Batería dañada. (No carga)\r\n\r\nDIRECCIÓN: \r\nPaseo Río Sonora edificio TI No. 110 2° piso \r\nentre Río Cocospera y Río California\r\nCol. Proyecto Río Sonora.\r\n\r\nDIRECCIÓN GENERAL DE AUDITORIA FISCAL\r\nDEPARTAMENTO ADMINISTRATIVO\r\nJOSÉ GUADALUPE MAYTORENA SILVA\r\n662-212-34-05 TELEFONO OFICINA\r\n				2	2	1		f	\N	\N				CND43623yw	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2014-12-02 10:19:20.938589-05	\N	\N		f	f	f	f	f	f	f	f	f	f
292	2	\N	2015-04-17 15:09:23.665361-04	3	13	1187	2015-02-18 14:37:33.034434-05	\N	2015-02-23	\N					1187979	Solcito poder visualizar las carpetas completas del correo: enviofacturadigital@hpstorehermosillo.com\r\n\r\n\r\nGracias.		Ninguna.	Solicitud realizada. 	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 15:09:23.665082-04	\N	\N		f	f	f	f	f	f	f	f	f	f
89	0	129	2014-12-02 10:24:17.801826-05	1	18	939	2014-11-28 13:33:35.819728-05	2014-01-28	2014-12-30	\N	HPCR768A	IMPRESORA TABLOIDE	CABLE USB, CARTUCHOS Y ELIMINADOR DE CORRIENTE.	HM3200	0939001	ATASCA LAS HOJAS, Y SALEN ARRUGADAS Y MANCHADO EN HOJAS. 				2	2	1		f	\N	\N				CN3BD3MGZ8	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2014-12-02 10:24:17.801541-05	\N	\N		f	f	f	f	f	f	f	f	f	f
316	1	728	2015-03-18 18:15:42.716233-04	37	41	1043	2015-03-03 18:15:38.356381-05	\N	2015-03-10	\N					1043890	MANTENIMIENTO PREVENTIVO		Ninguna.	Se realiza mantenimiento preventivo a equipo servidor. Costo servicio: $1200.00 +IVA.	2	2	\N	HM15917	f	1	4		HP	ML 350 G6	XXXXXXXXXXXXX	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		SERVIDOR	\N	2	\N	2015-03-18 18:15:42.715993-04	2015-03-04 04:00:00-05	2015-03-04 04:00:00-05		f	f	f	f	f	f	f	f	f	f
95	1	663	2014-12-02 11:21:23.15012-05	1	23	947	2014-12-01 17:40:44.608248-05	\N	2014-12-08	\N					0947371	INSTALACIÓN DE MEMORIA 				2	2	\N	HM13079	f	3	1		LENOVO	M93P	SMJ01QVMD	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2014-12-02 11:21:23.149893-05	2014-12-02 21:00:00-05	2014-12-02 21:00:00-05		f	f	f	f	f	f	f	f	f	f
97	1	819	2014-12-02 12:55:21.874764-05	15	15	948	2014-12-02 12:47:50.639961-05	\N	2014-12-09	\N					0948422	FORMATEAR EQUIPO. / COSTO DE $350 				3	2	\N		f	3	2		HP	PAVILION P6-2133LA	MXX220041R	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
93	1	813	2015-01-19 10:44:18.997174-05	4	1	946	2014-12-01 10:38:03.847661-05	\N	2014-12-08	\N					0946975	SE SOLICITA LA INSTALACION DE KIT DE MANTENIMIENTO.				2	2	\N	PTE CIERRE	f	3	3		N/A	N/A	N/A	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-01-19 10:44:18.996915-05	2014-12-01 18:00:00-05	2014-12-01 20:00:00-05		t	f	f	f	f	f	f	f	f	f
98	1	343	2014-12-10 17:32:41.561986-05	1	1	949	2014-12-02 14:09:39.104267-05	\N	2014-12-09	\N					0949127	COTIZACION DE CABLEADO PARA TELEFONÍA IP				3	2	\N		f	2	4		N/A	N/A	PENDIENTE	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		TELEFONIA IP	\N	2	\N	\N	2014-12-02 14:00:00-05	2014-12-02 04:00:00-05		f	f	f	f	f	f	f	f	f	f
85	1	511	2014-12-12 13:42:10.543437-05	15	15	943	2014-11-26 17:54:06.247203-05	\N	2014-12-03	\N					0943500	NO LEE MEMORIA, NO TIENE BATERÍA COTIZAR Y DIAGNOSTICAR EL EQUIPO,  				2	2	\N	HM13282	f	2	1		HP / HPWZ461LA	PAVILION DV5	CNU0220F2X	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2014-12-12 13:42:10.543169-05	\N	\N		f	f	f	f	f	f	f	f	f	f
69	1	453	2014-12-12 17:35:28.004838-05	15	3	931	2014-11-20 12:36:46.044667-05	\N	2014-11-27	\N					0931410	REALIZAR INSTALACIÓN DE SOFTWARE EN COMPUTADORA ASIGNADA PARA EL CONTROL DE ASISTENCIA. \r\nCONFIGURACIÓN DE TERMINAL BIOMETRICA: NEO CONNECT PLUS.\r\n				2	2	\N	TJ2663	f	3	4		SIASA	CONTROL EFECTIVO DEL TIEMPO .NET	NO APLICA	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		SOFTWARE CHECADOR	\N	2	\N	2014-12-12 17:35:28.00454-05	2014-11-22 04:00:00-05	2014-11-23 04:00:00-05	SOFTWARE PROPORCIONADO POR EL CLIENTE EN FORMATO COMPRIMIDO .RAR.	t	f	f	t	f	f	f	f	f	f
104	1	304	2014-12-03 17:49:36.922856-05	3	3	952	2014-12-03 17:24:42.3759-05	\N	2014-12-10	\N					0952717	LA FALLA QUEDO PENDIENTE. LA PERSONA QUE LA TRAE NO SABE CUAL ES LA FALLA. \r\nEL TELÉFONO DE CONTACTO NO ES CORRECTO (662)1945496, TAMBIÉN AL 2591100 EXT 11212 SIN EXISTO.\r\n\r\nNO INCLUYE TONER.\r\nNO INCLUYE CABLE DE CORRIENTE.		NINGUNA 	SE CIERRA ESTE REPORTE PORQUE YA ESTABA CREADO EL SERVICIO 928 CON EL CUAL SE LE ESTA DANDO SEGUIMIENTO.	2	2	\N	SERVICIO-928	f	1	3		OKIDATA	MULTIFUNCIONAL OKIDATA MB460 MONOCROMATICA	SAL17057926C0	f	f	f				t	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2014-12-03 17:49:36.922614-05	\N	\N		f	f	f	f	f	f	f	f	f	f
111	0	828	2015-01-20 15:01:09.169699-05	8	8	947	2014-12-09 13:48:16.615976-05	2014-11-27	2015-01-08	\N	SPEM19LED	MONITOR LED SPECOTECH 19' CCTV HDMI NTSC	CABLES	TJ2535	0947079	EL MONITOR SE APAGA TRABAJANDO				2	1	1	SPECOTECH	f	\N	\N				41694390140	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-12-22	\N	\N	2015-01-20 15:01:09.169135-05	\N	\N		f	f	f	f	f	f	f	f	f	f
115	1	815	2014-12-12 13:41:31.65359-05	3	3	959	2014-12-10 13:57:57.459801-05	\N	2014-12-17	\N					0959812	servicio preventivo de software.\r\nRespaldo y Restauracion de sistema operativo.\r\nSession: Ana Bolena\r\nOutlook: Ana Bolena, abestrella@tetrixsolutions.com.mx, pop.secureserver.net, smtpout.secureserver.net, POP3 110, SMTP 80.\r\n		NINGUNA	No se realiza servicio.\r\nSin costo.\r\nSeguimiento a Garantía 940.	2	2	\N	G940	f	1	1		LENOVO	THINKPAD E431	PF0LAXX	t	t	f			ab526842	f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2014-12-12 13:41:31.653188-05	\N	\N		f	f	f	f	f	f	f	f	f	f
90	2	\N	2014-12-09 10:25:50.387243-05	3	10	1147	2014-11-28 17:32:06.598442-05	\N	2014-12-03	\N					1147772	" Buenas tardes, Charlie como ya sabes el día de mañana es el evento DEL DIA DEL FUNCIONARIO, por lo que necesitare que se ponga una extensión, si gustan hoy pueden ir a ver donde estaremos en Expoforum, también necesito la BAM ya lista para utilizarla, sinchos y un multicontacto, saludos. "\r\n\r\n		Ninguna	Se regresaron las extensiones, multicontacto y BAM.	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2014-12-09 10:25:50.386877-05	\N	\N		f	f	f	f	f	f	f	f	f	f
107	1	757	2014-12-16 14:04:06.134196-05	15	23	954	2014-12-05 10:44:00.480287-05	\N	2014-12-12	\N					0954529	atasco de papel en impresora de direccion	SE SOLICITO A EJECUTIVO DE CUENTA VIA SKYPE FACTURA PARA CIERRE DE SERVICIO 9/12/14			2	2	\N	HM13598	f	2	3		xerox	phaser 7500	XXXXXXXXX	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2014-12-16 14:04:06.133954-05	2014-12-06 04:00:00-05	2014-12-06 04:00:00-05		f	f	f	f	f	f	f	f	f	f
114	0	343	2014-12-18 13:35:36.570418-05	3	15	949	2014-12-10 10:52:54.24608-05	2014-11-25	2015-01-09	\N	I797TPC	TABLETA IVIEW 7IN 8GB HDMI BLUETOOTH 3G	EQUIPO DE CAJA	RM9383	0949254	EL EQUIPO SE ABRE Y SE ENCUENTRA LA PANTALLA CON RAYAS.	Ninguna	Ninguna	Equipo se entrega sin rayas en la tablet.	2	2	1	TABLETA IVIEW	f	\N	\N				1404797TPCBKD0544	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-12-10	\N	\N	2014-12-18 13:35:36.57015-05	\N	\N		f	f	f	f	f	f	f	f	f	f
110	1	511	2014-12-10 13:35:35.795295-05	3	15	957	2014-12-08 12:36:52.423805-05	\N	2014-12-15	\N					0957266	EL EQUIPO NO ENCIENDE Y PRESENTA UN SONIDO, OCUPA UN SERVICIO Y QUE DIAGNOSTIQUEN LA FALLA.			SE RECOMIENDA REALIZA EL CAMBIO DE DISCO DURO.\r\n	2	2	\N	HM13420	f	2	2		COMPAQ 	PRESARIO	CNX7321M15	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2014-12-10 13:35:35.795064-05	\N	\N		f	f	f	f	f	f	f	f	f	f
109	1	511	2014-12-10 13:36:18.326678-05	3	15	956	2014-12-08 12:35:37.619368-05	\N	2014-12-15	\N					0956506	EL EQUIPO NO ENCIENDE Y HACE UN SONIDO, PARA QUE SE DIAGNOSTICO Y SERVICIO.	4GB Module - DDR3 1333MHz\r\nPart Number: KTH9600BS/4G  	SERVICIO PREVENTIVO HARDWARE $350.00	SE RECOMIENDA AUMENTAR LA MEMORIA RAM A 4GB	2	2	\N	HM13420	f	2	2		HP	PAVILION	MXX2100176	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2014-12-10 13:36:18.326306-05	\N	\N		f	f	f	f	f	f	f	f	f	f
105	0	823	2014-12-16 18:55:04.025295-05	3	15	946	2014-12-03 18:46:58.496658-05	2014-12-27	2015-01-02	\N	GHIA27154B	TABLET 7 PULGADAS 8 GB COLOR BLANCO	CARGADOR	HM8096	0946906	LA TABLET SE APAGO, YA NO PRENDE NI CARGANDO EL EQUIPO.	COMPRA 27/06/2014	NINGUNA	TABLET FUNCIONANDO CORRECTAMENTE.	2	2	1	GHIA	f	\N	\N				C27154B1312009152	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-12-04	\N	\N	2014-12-16 18:55:04.025029-05	\N	\N		f	f	f	f	f	f	f	f	f	f
54	0	4	2014-12-12 11:54:41.003041-05	3	1	929	2014-11-13 17:00:33.022172-05	2014-10-31	2014-12-15	\N	HPE363LT	HP AIO ELITEONE 800 G1	NINGUNO	H1634	0929213	EQUIPO CON PROBLEMAS EN RED INALAMBRICA	EQUIPO CON TICKET LEVANTADO EN HP #4740814187\r\nCONTRASEÑA: 4740814187	NINGUNA	SE RESTAURO EL SISTEMA OPERATIVO.	2	2	1	HP AIO ELITEONE 800 G1	f	\N	\N				MXL4090BQ1	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-11-13	\N	\N	2014-12-12 11:54:41.00276-05	\N	\N		f	f	f	f	f	f	f	f	f	f
118	0	103	2014-12-17 14:12:02.63691-05	3	3	951	2014-12-11 14:03:37.318488-05	2014-12-11	2015-01-12	\N	DELL P37G003	PORTATIL DELL INSPIRON 5437	BATERIA	NO ENTREGADA	0951047	LA IMAGEN DE LA PANTALLA SE MUEVE.\r\nSE DISTORSIONA IMAGEN.\r\nINSPIRON 5437 SERVICE TAG DJCWLW1. \r\nEXPRESS SERVICE CODE: 2946-8704-465.	el equipo paso correctamente el test de hardware. 	Ninguna	Se entrega al equipo funcionando correctamente al cliente.	2	2	1	DELL INSPIRON 5437	f	\N	\N				CN0M75GC762063910054A00	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-12-11	\N	\N	2014-12-17 14:12:02.636638-05	\N	\N		f	f	f	f	f	f	f	f	f	f
120	1	831	2015-01-08 10:27:00.450542-05	1	15	962	2014-12-11 18:39:27.807889-05	\N	2014-12-18	\N					0962549	PRESENTA ERROR EN LA TARJETA MADRE, EL EQUIPO YA NO PRENDE. 				2	2	\N	NO SE ENCONTRO PIEZA PROVEEDORES	f	2	2		HP	ALL IN ONE / PAVILION 23	3CR3210KQ0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-01-08 10:27:00.449867-05	\N	\N		f	f	f	f	f	f	f	f	f	f
91	0	815	2014-12-12 11:53:52.989597-05	3	3	940	2014-11-28 19:14:56.859514-05	2013-12-17	2014-12-29	\N	LEN627782S	LAPTOP LENOVO THINKPAD E431	ADAPTADOR DE CORRIENTE 	HM2123	0940584	NO INICIABA SISTEMA OPERATIVO.\r\nCUANDO ENTRA EL SISTEMA OPERATIVO SE TRABA EL SISTEMA.\r\nERROR DE DIAGNOSTICO 0X3BC3.\r\nCONTRASEÑA: ab526842\r\n\r\nTYPE: 6277-825		NINGUNA	NO PRESENTO FALLA EN HARDWARE.\r\nSE DARÁ SERVICIO PREVENTIVO. \r\nFOLIO SERVICIO 959.	2	2	1	NO PRESENTO FALLA	f	\N	\N				PF0LAXX	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-12-01	\N	\N	2014-12-12 11:53:52.989287-05	\N	\N		f	f	f	f	f	f	f	f	f	f
170	1	853	2015-02-10 18:02:09.715132-05	37	24	982	2015-01-08 11:44:43.47234-05	\N	2015-01-15	\N					0982025	EL CLIENTE DESEA QUE SU RED SEA MAS EXTENSA EN SU OFICINA, HOY EN DIA ESTA MUY LIMITADA, IR A REVISAR SU RED Y VER QUE SOLUCION PROPONER.				2	2	\N	Se realizo visita cotizacion	f	2	4		SN	SN	SN	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		ROUTER	\N	2	\N	2015-02-10 18:02:09.714871-05	2015-01-09 02:00:00-05	2015-01-09 03:00:00-05	SN	f	f	f	t	f	f	f	f	f	f
363	0	27	2015-03-27 11:05:50.360627-04	14	14	1052	2015-03-26 11:11:55.050534-04	2014-09-19	2015-04-27	\N	HPC8T89AV	HP PRODESK 600 G1	NINGUNO	10650	1052853	AL ENTRAR A WINDOWS SE PONE LA PANTALLA NEGRA				3	2	1		f	\N	\N				MXL4242420	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
391	1	433	2015-04-23 15:22:20.86455-04	37	37	1063	2015-04-23 14:37:36.506508-04	\N	2015-04-30	\N					1063461	ENSAMBLE Y CONFIGURACION DE EQUIPO PC.			Instalación y configuración de equipos.	2	2	\N	POR COBRAR	f	3	2		ACTECK	S/N	S/N	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-04-23 15:22:20.864294-04	\N	\N		f	f	f	f	f	f	f	f	f	f
119	1	663	2015-01-13 11:16:50.080065-05	15	23	961	2014-12-11 18:15:20.296714-05	\N	2014-12-18	\N					0961899	INSTALACIÓN DE OFFICE 365 50 EQUIPOS REMISIÓN 9646				3	2	\N	RM9646\t	f	3	2		LENOVO	THINKCENTRE M73Z AIO	XXXXXXXXXXXXXXXXXXX	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	\N	2014-12-12 21:00:00-05	2014-12-19 21:00:00-05		f	f	f	f	f	f	f	f	f	f
121	1	716	2014-12-12 17:55:58.820241-05	1	24	963	2014-12-11 19:16:53.49947-05	\N	2014-12-18	\N					0963312	INSTALAR OFFICE PARA MAC 2011				2	2	\N	R9648	f	3	1		APPLE	MACBOOK AIR	C02NJ0TPG085	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2014-12-12 17:55:58.820012-05	\N	\N		f	f	f	f	f	f	f	f	f	f
99	0	22	2015-01-06 12:40:42.81826-05	3	18	943	2014-12-02 16:40:46.693398-05	2014-12-02	2015-01-01	\N	HPF4J41LA	HP14	CABLE DE CORRIENTE	HM3616	0943817	NO INICIA SE QUEDA PANTALLA EN BLANCO, FUNCIONABA BIEN TODAVIA EL DIA SABADO 29 NOV TIENE LA CONTRASEÑA: blackberry220621 / favor de tratar de recuperar información 		NINGUNA	EQUIPO PORTATIL SE ENTREGA AL CLIENTE FUNCIONANDO CORRECTAMENTE. 	2	2	1	HP <4001777283>	f	\N	\N				CND4222603	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-12-04	\N	\N	2015-01-06 12:40:42.817902-05	\N	\N		f	f	f	f	f	f	f	f	f	f
117	1	489	2015-01-13 11:18:44.846813-05	1	1	960	2014-12-11 10:27:29.47361-05	\N	2014-12-18	\N					0960391	ATASCO DE PAPEL				2	2	\N	HM12869	f	2	3		HP	LASERJET 3015	PENDIENTE	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-01-13 11:18:44.846579-05	2014-12-11 18:00:00-05	2014-12-11 19:00:00-05		t	f	f	t	f	f	f	f	f	f
125	2	\N	2015-01-19 18:55:04.289168-05	3	32	1148	2014-12-12 18:19:45.153302-05	\N	2014-12-17	\N					1148576	hola\r\nme ayudan porfa con mi compu, según Ruben tiene algo mal en la configuración por que no imprime los documentos completos			FOLIO DUPLICADO	3	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
139	0	663	2015-01-28 10:51:37.592578-05	3	3	961	2014-12-23 13:26:17.861341-05	2014-10-13	2015-01-22	\N	LENTM73Z	LENOVO THINKCENTRE M73Z MT-M:10BB - A0K9LS	NINGUNO	8943	0961391	NO RECONOCE EL SISTEMA OPERATIVO, SE TRABA AL ESTAR EN USO. YA SE REALIZO EL CAMBIO DE DISCO DURO.	MI PC 	NINGUNA - CALL CENTER: 001 866 434-2080	COMPUTADORA SERIE: MJ01JKA9 QUEDA EN EL ALMACÉN DE COMPUPROVEEDORES, EN CAJA CON NUMERO DE SERIE MJ01JKAH.	2	2	1	<411541> EN CAS LENOVO	f	\N	\N				MJ01JKA9	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-12-23	\N	\N	2015-01-28 10:51:37.592185-05	\N	\N		f	f	f	f	f	f	f	f	f	f
406	0	668	2015-04-30 14:47:12.920792-04	19	19	1072	2015-04-30 14:47:12.898254-04	2015-03-04	2015-06-01	\N	HPCE402A	TONER H´P 507A AMARILLO	No aplica	HM15523	1072781	EL CLIENTE INDICA QUE EL TONER ESTA DEFECTUOSO				0	2	2		f	\N	\N				No aplica	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
108	1	142	2015-01-14 17:55:12.82789-05	4	24	955	2014-12-05 17:24:53.502302-05	\N	2014-12-12	\N					0955312	CONFIGURAR EL CONMUTADOR STEREN DE LA SUCURSAL FRENTE AL APTO	FAVOR DE FACTURAR SERVICIO01 POR $400.00	SERVICIO01 POR $400.00	CONMUTADOR CON DOS LINEAS TELMEX Y 3 EXTENSIONES FUNCIONANDO CORRECTAMENTE.	2	2	\N	HM13562	f	3	4		STEREN	SN	SN	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		CONMUTADOR STEREN	\N	2	\N	2015-01-14 17:55:12.827523-05	2014-12-06 02:00:00-05	2014-12-06 04:00:00-05	SN	t	f	f	t	f	f	f	f	f	f
124	1	833	2014-12-18 13:23:54.39461-05	1	15	964	2014-12-12 16:57:13.007089-05	\N	2014-12-19	\N					0964544	INSTALACIÓN DE DISCO DURO Y SISTEMA OPERATIVO		SERVICIO01 COSTO $350.00	COSTO TOTAL DEL SERVICIO $350.00	2	2	\N	HM13700	f	3	1		DELL	INSPIRON M5030	CN0C8PJJ701660AKOOJ7A00	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2014-12-18 13:23:54.394326-05	\N	\N		f	f	f	f	f	f	f	f	f	f
126	0	336	2014-12-19 18:38:38.93392-05	3	4	954	2014-12-13 11:26:29.845701-05	2014-04-11	2015-01-13	\N	GHIANOTGHIA100	TABLET GHIA	AUDIFONOS,CARGADOR.ODT,CALBE USB DATOS 	HM5834	0954485	LINEA EN PANTALLA  Y APARECE LEYENDA DE ERROR DE APLICACION Y NO DEJA ACCESAR A SISTEMA 	C29218P1311005691	NINGUNA	FOLIO DUPLICADO ..\r\nSEGUIMIENTO EN EL FOLIO 955.	2	2	1	GHIANOTGHIA100	f	\N	\N				C29218P1311005691	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-12-15	\N	\N	2014-12-19 18:38:38.93367-05	\N	\N		f	f	f	f	f	f	f	f	f	f
87	0	663	2014-12-16 15:03:24.256059-05	3	4	938	2014-11-27 13:13:51.53214-05	2014-05-27	2014-12-29	\N	HPE3T81LT	HP 205	ADAPTADOR DE CORRIENTE	HM6995	0938690	ERROR DEL DISCO DURO, PIDE EJECUTAR PRUEBA DE DISCO DURO EN DIAGNOSTICO DE SISTEMA	<CASE:4741822591> 	NINGUNA	Cambio físico de disco duro y instalación de sistema operativo.\r\n\r\nSe entrega equipo funcionando correctamente en domicilio del cliente.	2	2	1	<4741822630> AIO 205 ESPERA DE FABRICANTE	f	\N	\N				4CE1020D21	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-12-02	\N	\N	2014-12-16 15:03:24.255439-05	\N	\N		f	f	f	f	f	f	f	f	f	f
142	1	209	2015-01-14 18:03:25.629302-05	4	3	972	2014-12-29 13:35:30.058462-05	\N	2015-01-05	\N					0972948	SE TERMINO TONER, SOLICITAN CAMBIO DE CONSUMIBLE, EQUIPO COMODATO.				2	2	\N	APOYO VENTAS	f	3	3		SAMSUNG 	SCX-6545	PENDIENTE	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-01-14 18:03:25.629061-05	2014-12-29 21:00:00-05	2015-01-05 21:00:00-05		f	f	f	t	t	f	f	f	f	f
140	1	613	2015-03-10 11:07:43.572291-04	37	3	971	2014-12-23 15:00:20.932528-05	\N	2014-12-30	\N					0971829	INSTALACION DE UNIDAD DE IMAGEN Y FUSOR. (HPC8532A Y HPCB457A)			Servicio preventivo: $928.00 IVA Incluido.	2	2	\N	HM15705	f	3	3		HP	LASERJET 9050	PENDIENTE	f	f	f				t	t	f	f	f	f	t	f		f	f		f		f	f			\N	2	\N	2015-03-10 11:07:43.572049-04	2014-12-23 21:00:00-05	2014-12-23 14:00:00-05		t	f	f	t	t	f	f	f	f	f
102	0	757	2015-01-12 14:12:25.182618-05	3	3	944	2014-12-03 12:42:29.743681-05	2014-04-11	2015-01-02	\N	HPE363LT	HP AIO ELITEONE 800 G1	SIN ACCESORIOS	6332 SISTEMA UNISON	0944573	NO CARGA WINDOWS.\r\nESTA LENTA Y RUIDO EN DISCO DURO.\r\nEL TEST DE LA MAQUINA NO DETECTA FALLA ALGUNA.\r\n\r\nEDIFICIO 8C (INFORMATICA)\r\n8AM A 7PM.		NINGUNA 	CAMBIO DE DISCO DURO, EQUIPO FUNCIONANDO  CORRECTAMENTE. ENTREGADO EN SISTEMAS (EDIFICIO 8G)	2	2	1	<4742 9639 71> AIO ELITEONE 800 - TECNICOS A SITIO	f	\N	\N				MXL4132F1W	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-12-05	\N	\N	2015-01-12 14:12:25.182308-05	\N	\N		f	f	f	f	f	f	f	f	f	f
100	1	37	2014-12-18 18:33:41.085301-05	1	24	950	2014-12-02 17:19:22.886925-05	\N	2014-12-09	\N					0950899	LIMPIEZA PROFUNDA DE PLOTTER 510 DE HP.\r\nRECOLECTAR EN GDI HERMOSILLO (PREGUNTAR A RAMON COMO LLEGAR) DE 9 A 5PM URGENTE. SE COBRO $1000 PESOS POR EL SERVICIO.	PENDIENTE POR FACTURAR EN ESPERA DE CABEZALES PARA REALIZAR CALIBRAZON Y REALIZAR EL CIERRE DE SERVICIO.			2	2	\N	HM13555	f	1	3		HP	DESIGNJET 510	MY23M63017.	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2014-12-18 18:33:41.08495-05	\N	\N		f	f	f	f	f	f	f	f	f	f
141	0	336	2015-01-06 11:45:45.454052-05	3	3	962	2014-12-23 16:05:19.460624-05	2014-09-30	2015-01-22	\N	GHIA20218P	TABLETA GHIA 2021 8GB PLATEADA	COMPLETA: CAJA, CARGADOR, CABLE DATOS, AUDÍFONOS Y MANUAL.	8830	0962018	NO INICIA SISTEMA.		NINGUNA	SE ENTREGA TABLETA FUNCIONANDO CORRECTAMENTE	2	2	1	GHIA20218P	f	\N	\N				C20218P1311006877	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-12-23	\N	\N	2015-01-06 11:45:45.453708-05	\N	\N		f	f	f	f	f	f	f	f	f	f
135	0	818	2014-12-23 10:31:57.775326-05	3	3	959	2014-12-19 17:29:39.258352-05	2014-12-13	2015-01-20	\N	GHIA27158B	TABLETA GHIA 2715 8GB BLANCA	COMPLETA: CAJA, CARGADOR, CABLE DATOS Y MANUAL.	TABLET 1095	0959952	TABLET HACE LENTA AL ABRIR APP DE INTERNET.		NINGUNA	SE ENTREGA FUNCIONANDO CORRECTAMENTE.	2	2	1	GHIA27158B	f	\N	\N				C27158B-1404004127	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-12-19	\N	\N	2014-12-23 10:31:57.774916-05	\N	\N		f	f	f	f	f	f	f	f	f	f
123	0	663	2015-01-05 14:09:49.530553-05	3	3	953	2014-12-12 16:16:03.42101-05	2014-11-25	2015-01-13	\N	LENTM73Z	LENOVO THINKCENTRE M73Z	NO INCLUYE	HM12874	0953690	PROBLEMA CON LA TARJETA DE RED, SE DESCONECTA Y SE CONECTA; SE REALIZO UN PING-T Y SE  PIERDE LA CONEXION		NINGUNA	Eequipo funcionando correctamente. 	2	2	1	<941505> LENOVO M73Z	f	\N	\N				SMJ01JK7V	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-12-12	\N	\N	2015-01-05 14:09:49.529819-05	\N	\N		f	f	f	f	f	f	f	f	f	f
48	0	87	2015-01-17 14:53:42.377234-05	3	1	926	2014-11-12 10:48:53.660966-05	2014-03-05	2014-12-12	\N	HPE381LT	AIO 205	ELIMINADOR DE CORRIENTE	HM2129	0926611	, REPORTANDO EL USUARIO EL MISMO PROBLEMA  EL CUAL CONSISTE EN:  SE BLOQUEA SISTEMA OPERATIVO, PANTALLA DE PONE NEGRA Y CUANDO PERMITE TRABAJAR ES MUYY  LENTA.	se instalo sistema operativo de prueba para revisar el funcionamiento del equipo.	NINGUNA	equipo se entrega a oficina del cliente. 	2	2	1	<4742216329> HP 115 ALL-IN-ONE BUSINESS PC	t	\N	\N				5CM33104J9	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-10-13	\N	\N	2015-01-17 14:53:42.376814-05	\N	\N		f	f	f	f	f	f	f	f	f	f
136	0	818	2015-02-24 14:42:01.600886-05	3	3	960	2014-12-19 18:10:11.480111-05	2014-12-13	2015-01-20	\N	AT723C	TABLET ACTECH 723C	COMPLETA: CAJA, CARGADOR, 2 CABLES DATOS.	BAZAR NAVIDEÑO	0960465	SE GASTA DEMASIADO RAPIDO LA BATERIA		NINGUNA		1	2	1	ACTECH 723C	f	\N	\N				970791001379	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-12-19	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
138	1	716	2015-01-05 10:50:05.519498-05	1	3	970	2014-12-22 18:29:07.351306-05	\N	2014-12-29	\N					0970047	INSTALAR OFFICE PARA MAC 2011				2	2	\N	R9648	f	3	1		APPLE	MACBOOK AIR	C02NJ0TPG085	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-01-05 10:50:05.519071-05	\N	\N		f	f	f	f	f	f	f	f	f	f
131	0	838	2015-01-20 13:55:32.747661-05	8	8	957	2014-12-16 18:39:07.425058-05	2014-12-08	2015-01-15	\N	SAMUN46FH5005	TV LED 46 SAMSUNG HD 60HZ	CONTROL REMOTO, CABLES	TJ2612	0957976	SE VEN MANCHAS NEGRAS EN LA PANTALLA.	INGENIERIA XC, S.A DE C.V.\r\nBLV. DIAZ ORDAZ, PLAZA LAS PALMAS.\r\nCOLONIA LA ESCONDIDA.\r\nTELÉFONO: 664 6080719.\r\nATENCION: JIMENA\r\n\r\n	NINGUNA		2	1	1	<4128161178> RECHAZO DE GARANTIA	f	\N	\N				01Y13CAF504258	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-12-22	\N	\N	2015-01-20 13:55:32.747372-05	\N	\N		f	f	f	f	f	f	f	f	f	f
386	0	336	2015-04-27 13:10:26.785963-04	14	14	1063	2015-04-22 11:45:59.635535-04	2015-03-23	2015-05-22	\N	MIU7Z00008	MOUSE MICROSOFT 1850	N/A	HMO392087	1063228	NO FUNCIONA el Scroll 		ninguna		2	2	1		f	\N	\N				0693501252589	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-04-22	\N	\N	2015-04-27 13:10:26.785616-04	\N	\N		f	f	f	f	f	f	f	f	f	f
148	1	336	2015-01-14 16:51:38.372945-05	3	3	975	2015-01-06 12:20:30.412252-05	\N	2015-01-13	\N					0975065	ARTURO TELLEZ GONZALEZ: PANTALLA QUEDABRA. \r\nSOLICITA COTIZAR LA PIEZA O PIEZAS DAÑADAS. 				3	2	\N		f	2	4		IVIEW	600	IMEI No.: 1406 0112 0002 004	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		PHABLET	\N	1	\N	\N	\N	\N	CAJA, ADAPTADOR DE SIM CARD, AUIDOFONOS, MANUALES DE USUARIO. (SIN CARGADOR). 	f	f	f	f	f	f	f	f	f	f
143	0	818	2015-02-27 13:06:49.55836-05	36	3	963	2014-12-29 14:09:27.844718-05	2014-12-13	2015-01-28	\N	29218P	TABLETA GHIA 2921 8GB PLATEADA	COMPLETA: CAJA, CARGADOR, CABLE DATOS, AUDÍFONOS Y MANUAL.	BAZAR NAVIDEÑO	0963750	PANTALLA TOUCH MOVIDA, PRESENTA DAÑO EN ESQUINA. CLIENTE COMENTA QUE NO FUE DAÑADA POR EL. 				1	2	1	GHIA 29218P 3556	f	\N	\N				C29218P 1305003556	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-05	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
277	1	875	2015-03-27 11:58:28.020003-04	4	15	1018	2015-02-11 14:52:28.061964-05	\N	2015-02-18	\N					1018888	EQUIPO AIO APARECE PANTALLA NEGRA, NO INICIA. DIAGNOSTICAR.	Se informo a cliente realizar pago $700, NOS COMUNICAMOS CON CLIENTE Y NOS COMENTA QUE POR MOTIVOS PERSONALES NO HA PODIDO REALIZAR EL ANTICIPO 04/03/2015			1	2	\N		f	2	2		ACER 	ALL IN ONE  ACER VERITON	PQVD6P8002123005223000	f	f	f				f	f	f	f	f	f	f	f		t	f		f		t	f			\N	1	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
145	1	716	2015-01-14 18:02:04.560224-05	4	24	973	2015-01-05 14:16:01.150615-05	\N	2015-01-12	\N					0973869	SERVICIO PREVENTIVO A ESCANER KODAK, FAVOR DE RECOGERLO CON LA LIC MAYREL PEREZ EN LA NOTARIA 51.	En espera de factura, Ejecutivo cuenta: Alfonso Rivas.			2	2	\N	HM14082	f	1	3		KODAK	ESCANER	SN	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-01-14 18:02:04.559818-05	\N	\N		f	f	f	f	f	f	f	f	f	f
373	0	818	2015-05-21 12:22:37.504742-04	14	36	1056	2015-04-08 21:03:11.725766-04	2015-03-09	2015-05-10	\N	PIXPLAYONEN	TABLET PIXEL PLAY ONE 7" ANDROID C/FUNDA	1 Eliminador de corriente, 1 cable OTG, 1 Cable USB, 1 Manual de usuario 	Rem 53	1056739	No entra al menu		ninguna		1	2	1	PIXPLAYONEN	f	\N	\N				S/N	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-04-23	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
189	0	818	2015-02-09 13:51:09.308891-05	3	36	985	2015-01-14 19:37:28.679245-05	2014-04-11	2015-02-15	\N	GHIANOTGHIA100	TABLETA GHIA ANY 10.1" 16GB 2 CAM WIFI	CABLE CORRIENTE	HM 5834	0985082	- SE DESCARGA RAPIDO \r\n- LA PANTALLA PRESENTA LINEAS		NINGUNA	TABLETA SE ENTREGA FUNCIONANDO CORRECTAMENTE	2	2	1	REPARADA GHIA C29218P 	f	\N	\N				C29218P1305003553	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-17	\N	\N	2015-02-09 13:51:09.308617-05	\N	\N		f	f	f	f	f	f	f	f	f	f
301	0	757	2015-03-04 17:27:25.019263-05	1	35	1022	2015-02-24 11:19:20.524848-05	2014-05-20	2015-03-26	\N	HPJ9727A	SWITCH HP 2920-24G POE	NA	HM6780	1022513	marca estado de error		Se entregaron los siguientes equipos 2 SWITCH HP 2920-24G POE:\r\n-SG49FLX3V5.\r\n-SG3AFLX206.	Se entregaron equipos a encargado de departamento, Sergio Alan Urias Montaño. 	2	2	1	HP <4746914104> HPJ9727A	f	\N	\N				SG43FLX5SH, SG43FLX53H	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-02-20	\N	\N	2015-03-04 17:27:25.018909-05	\N	\N		f	f	f	f	f	f	f	f	f	f
289	1	879	2015-03-06 13:31:51.307463-05	37	15	1025	2015-02-17 13:50:14.896443-05	\N	2015-02-24	\N					1025466	NO ENCIENDE, EL CELULAR DIAGNOSTICAR	Caso: 3012868624; Orden Recoleccion DHL: 4002181337.		Costo servicio correctivo: $340 + IVA.	2	2	\N	HM15041,	f	2	4		HP	SLATE 6 VOICE TAB	6CY43585FV	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		SLATE 6 VOICE TAB	\N	1	\N	2015-03-06 13:31:51.307169-05	\N	\N	CARGADOR	f	f	f	f	f	f	f	f	f	f
208	0	261	2015-02-09 19:42:20.838088-05	3	19	992	2015-01-21 11:37:19.409211-05	2014-09-22	2015-02-20	\N	HPCH561HL	TINTA HP 122 NEGRO DESKJET 2820 2840 MF	No aplica	10695	0992683	AL MOMENTO DE MANDAR IMPRIMIR, NO SALE LA IMPRESIÓN. 				2	2	2	CONSUMIBLE	f	\N	\N				No aplica	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-21	\N	\N	2015-02-09 19:42:20.837799-05	\N	\N		f	f	f	f	f	f	f	f	f	f
146	1	843	2015-01-15 13:43:01.500738-05	37	15	974	2015-01-05 17:21:51.709638-05	\N	2015-01-12	\N					0974297	NO FUNCIONA LECTOR DE DVD, NO SIRVE EL LECTOR DE HUELLA, TECLAS DE VOLUMEN BRILLO NO FUNCIONAN, EL MOUSE NO SIRVE, Y ESTA DEMASIADO LENTO EL PORTATIL.		Ninguna	Respaldar información provoca lentitud.	2	2	\N	ENTREGADO AL CLIENTE	f	3	1		SONY	SONY VAIO PCG-6X1P	ST:J003CSDR	f	f	f		NO TIENE	NO TIENE	f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-01-15 13:43:01.500334-05	\N	\N		f	f	f	f	f	f	f	f	f	f
183	1	405	2015-02-13 18:41:35.439748-05	15	15	987	2015-01-14 12:11:23.967731-05	\N	2015-01-21	\N					0987491	SERVICIO PREVENTIVO.		Ninguna. 	SERVICIO PREVENTIVO: $700.00 IVA Incluido	2	2	\N	HM14975	f	1	3		ZEBRA	ZM400	08J09340659	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-02-13 18:41:35.439502-05	\N	\N		f	f	f	f	f	f	f	f	f	f
116	0	430	2015-01-17 14:45:19.921697-05	3	3	950	2014-12-10 19:34:12.887697-05	2013-11-29	2015-01-11	\N	CA6989B004AA	MFC PIXMA MX451 INY	NINGUNO	HM1494	0950132	multifuncional para revisión, sí escanea pero no imprime. \r\n\r\n	Especialistas en servicios para oficinas  01 55 5254 2448\r\nGuía 0163145035/60846\r\n\r\nCOSTO $1,260.00\r\nCANON MEXICANA  (55) 5249 4905 Y 01(800) 030 0251	01 55 5254 2448		2	2	1	CANON	f	\N	\N				CA6989B004AA 21LVBA08953	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-11-18	\N	\N	2015-01-17 14:45:19.921441-05	\N	\N		f	f	f	f	f	f	f	f	f	f
256	0	663	2015-02-17 17:03:18.737496-05	3	15	1009	2015-02-03 11:05:58.441797-05	2014-11-25	2015-03-05	\N	LENTM73Z	LENOVO THINKCENTRE M73Z	NINGUNO	HM12874	1009515	RAYAS EN LA PANTALLA AL PRENDER EL EQUIPO 		ninguna	SE ENTREGA A ENRIQUE RUIZ EN COMONFORT Y DR. PALIZA S/N, EN PLANTA BAJA, ENFRENTE DE PLAZA BICENTENARIO.	2	2	1	LENTM73Z	f	\N	\N				MJ01N4X7	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-02-04	\N	\N	2015-02-17 17:03:18.737191-05	\N	\N		f	f	f	f	f	f	f	f	f	f
188	0	818	2015-01-17 14:34:49.290231-05	3	36	984	2015-01-14 19:28:09.239002-05	2014-12-19	2015-02-15	\N	GHIA27158N	TABLET GHIA ANY KIDS 27158N, 7", NARANJA	CABLE USB, ADAPTADOR DE CORRIENTE, CABLE ODT, AUDIFONOS	REM 45	0984422	-NO SE PUEDEN DESCARGAR LAS APLICACIONES.\r\n-SE BLOQUEA LA PANTALLA (SE CONGELA Y SE PIERDE LA IMAGEN).\r\n-EN OCASIONES TARDA EL ENCENDIDO.		NINGUNA	SE ENTREGA TABLETA EN DOMICILIO DEL CLIENTE.	2	2	1	C27158N	f	\N	\N				C27158N1404009044	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-17	\N	\N	2015-01-17 14:34:49.289944-05	\N	\N		f	f	f	f	f	f	f	f	f	f
198	1	860	2015-01-19 18:41:00.463091-05	37	18	993	2015-01-19 13:19:36.442532-05	\N	2015-01-26	\N					0993510	AL ENCENDERLA NO INICIA SE QUEDA EL LOGO DELL QUE YA SE LA HABIAN CHECADO EN OTRA PARTE Y LE DIJERON QUE TENIAN QUE CARGARLE EL SISTEMA OPERATIVO 	SE DETECTO PROBLEMA CON DISCO DURO.	NINGUNA	SE CIERRA REPORTE PARA PROCEDER CON REPORTE DE GARANTÍA.	2	2	\N	NINGUNA, PASA A GARANTÍA.	f	1	1		DELL	INSPIRON 11	4WWX1Y1	t	t	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-01-19 18:41:00.462625-05	\N	\N		f	f	f	f	f	f	f	f	f	f
228	1	663	2015-02-04 14:28:44.277899-05	37	23	1005	2015-01-26 11:05:27.558938-05	\N	2015-02-02	\N					1005750	INSTALACIÓN DE OFFICE 365 EN 50 EQUIPOS.	Se realizo la instalación de Office 365 en 50 equipos.	Ninguna.	Se realizo la instalación de Office 365 en 50 equipos.	2	2	\N	R10158	f	3	2		LENOVO	THINKCENTRE M73Z AIO	Varios	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-02-04 14:28:44.277652-05	2015-01-27 04:00:00-05	2015-01-27 04:00:00-05		f	f	f	f	f	f	f	f	f	f
230	1	613	2015-02-21 11:35:21.905702-05	1	1	1006	2015-01-27 10:43:19.051763-05	\N	2015-02-03	\N					1006669	EQUIPO PRESENTA FALLAS AL IMPRIMIR EN DUPLEX.	Pieza paso a reporte de garantía: G1003			2	2	\N	NINGUNA, PASA A GARANTÍA.	f	3	3		HP	LASERJET 9050DN	PENDIENTE	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-02-21 11:35:21.905465-05	2015-01-28 01:00:00-05	2015-01-28 03:00:00-05		f	f	f	f	f	f	f	f	f	f
284	1	701	2015-03-03 13:16:04.786094-05	37	37	1022	2015-02-13 18:29:32.598075-05	\N	2015-02-20	\N					1022593	Se autoriza instalación de 2 equipos Scanner.	OC - 41490 - 1 MUX-USB, 2 Pares EXT.USB, 2 cables USB 3m.\r\nOC - 41564 - 2 Cables USB.\r\n		Se realiza instalación y configuración de equipo scanner, en 2 usuarios planta Alta. Se configura equipo scanner en área de recepción planta baja.	2	2	\N	HM15479	f	3	4		Xerox	DM752	832TW10884761600016; 816TW1084K761600019	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-03-03 13:16:04.78586-05	2015-02-14 18:00:00-05	2015-02-18 18:00:00-05	2 Cables y 2 cables de AC.	f	f	t	f	f	f	f	f	f	f
134	1	502	2015-01-07 10:52:00.529209-05	1	15	968	2014-12-17 14:43:54.335704-05	\N	2014-12-24	\N					0968645	REVISAR TECLADO Y PANTALLA PARA COTIZAR PIEZAS NUEVAS, RECOLECTAREN NUSANTARA HERMOSILLO CON ARACELY EN RESEPCION, VIENE CON SU MOCHILA SWISS GEAR (TRAERLA)	SERVICIO FACTURADO $500.00 HM13861			2	2	\N	HM13861	f	2	1		HP	PROBOOK 4540S	2CE33926WN	f	f	f		SN	SN	f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-01-07 10:52:00.528898-05	\N	\N		f	f	f	f	f	f	f	f	f	f
63	1	304	2015-01-23 18:00:49.338622-05	37	3	928	2014-11-18 13:32:00.29262-05	\N	2014-11-25	\N					0928401	LA FALLA QUEDO PENDIENTE. SIN TONNER.\r\nLA PERSONA QUE LA TRAJO NO SABE CUAL ES LA FALLA.\r\nLUIS VALENZUELA (662)1945496\r\nSE CANCELA GARANTÍA Folio: 934\r\nNúmero factura:\tREMISION 1010\r\nFecha Factura:\t8 de Mayo de 2012	Comúnmente el problema con scanner se presenta por sensor o apertura de modulo ADF.	R9996 - Toner Okidata (OK43979201)\r\nR10003 - Tambor Okidata (OK43979001\r\nR10006 - Servicio reparación impresora.	Ya se reviso y verifico el correcto funcionamiento de scanner desde equipo computadora.\r\n\r\nPresentaba error en un sensor.	2	2	\N	R9996, R10003, R10061	f	1	3		OKIDATA	MB460 MONOCROMATICA	SAL17057926C0	f	f	f				t	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-01-23 18:00:49.338393-05	\N	\N		f	f	f	f	f	f	f	f	f	f
154	0	847	2015-01-17 13:23:32.760038-05	3	15	968	2015-01-07 10:43:52.40981-05	2014-12-19	2015-02-06	\N	TABLET 7" GHIA ANYGIRL	TABLET 7 PULGADAS 8 GB COLOR BLANCO CON ROSA	Cargador, Audifonos, 2 Cable de datos	H1866	0968405	EL EQUIPO SI PRENDE PERO APARECE UNA INFORMACION DE ANDROID CON FALLA. Y LA CARGA NO LE DURA AL EQUIPO Y AVECES NO CARGA TAMBIEN.		NINGUNA	RESTAURACION DEL SISTEMA. \r\nTABLET QUEDA FUNCIONANDO CORRECTAMENTE. \r\nSE ENTREGA AL CLIENTE. 	2	2	1		f	\N	\N				C27218B1404014713	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-09	\N	\N	2015-01-17 13:23:32.759637-05	\N	\N		f	f	f	f	f	f	f	f	f	f
194	1	858	2015-01-20 16:35:03.715117-05	37	15	991	2015-01-16 13:05:36.352603-05	\N	2015-01-23	\N					0991104	EL EQUIPO ENCIENDE, PERO AL INSTANTE SE APAGA CONSTANTEMENTE, SE DIAGNOSTICARA Y SI ES NECESARIO RESPALDAR FOTOS DEL EQUIPO.	QUIERE SABER SI PUEDE RESPALDAR SUS FOTOS UNICAMENTE EN DADO CASO QUE SE NECESITE FORMATEAR EQUIPO.	COTIZADO DISCO DURO WD BLACK 2.5 500GB SATA3 6GB/S 16MB 7200 RPM 9.5MM P/NOTEBOOK DE ALTO RENDIMIENTO # DE PARTE: WD5000BPKX $1500 POR TODO, SERVICIO Y DISCO.	Se entrega equipo, solo se realizo el diagnostico de falla disco duro. Servicio: $150.00 IVA Incluido.	2	2	\N	R10047	f	2	1		ACER	ASPIRE 4250-3875	NXRK2AL00320704A0D7600	f	f	f		NINGUNA	SIN CONTRASEÑA	f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-01-20 16:35:03.714657-05	\N	\N		f	f	f	f	f	f	f	f	f	f
419	0	936	2015-05-06 16:01:45.255027-04	19	19	1080	2015-05-06 16:01:45.230478-04	2015-04-22	2015-06-05	\N	HPCB388A	KIT DE MANTENIMIENTO PARA HP 4015 110AV	No aplica	CN192	1080696	50.3 High fuser temperature				0	3	2		f	\N	\N				No aplica	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
195	1	859	2015-01-20 11:21:50.720084-05	37	15	992	2015-01-19 11:00:44.629894-05	\N	2015-01-26	\N					0992463	REVISIÓN DE EQUIPO EN GENERAL, 	Cargador dañado. 	Ninguna	Se requiere compra o reparación de cargador batería.	2	2	\N	ENTREGADO AL CLIENTE	f	2	1		ACER	NAV50	LUSBN0D0010120EA701601	t	f	f		NINGUNA	SIN CONTRASEÑA	f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-01-20 11:21:50.719762-05	\N	\N		f	f	f	f	f	f	f	f	f	f
199	2	\N	2015-01-19 18:54:26.226206-05	3	34	1157	2015-01-19 14:24:54.057646-05	\N	2015-01-22	\N					1157066	Configurar Scaner a computadora asignada.\r\nConfigurar impresora de etiquetas a computadora asignada.\r\nDar acceso a DN Difusa y  Compuya.\r\nPendiente compra de Silla.\r\n			FOLIO DUPLICADO	3	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
152	0	848	2015-01-17 14:37:01.205706-05	3	3	966	2015-01-07 10:34:09.787888-05	2014-11-28	2015-02-06	\N	GUIA27158N	TABLETA GHIA 2715 8GB KID	NINGUNO	R-9465	0966095	PIEZA INTERNA SUELTA. \r\n		NINGUNA	RESTAURACIÓN DEL SISTEMA. \r\nTABLETA QUEDA FUNCIONANDO CORRECTAMENTE. \r\nSE ENTREGA AL CLIENTE. 	2	2	1	GUIA27158N	f	\N	\N				C27158N1404004845	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-09	\N	\N	2015-01-17 14:37:01.205194-05	\N	\N		f	f	f	f	f	f	f	f	f	f
153	0	849	2015-01-17 14:43:23.139164-05	3	3	967	2015-01-07 10:42:54.459255-05	2014-12-01	2015-02-06	\N	SMSBT7WH8G13G	TABLET SMARTBITT 7" DC1.2 1/8GB HDMI MIN	UNICAMENTE CAJA.	PENDIENTE	0967279	PANTALLA INTERNA DAÑADA.\r\nCOTIZAR REPARACIÓN.		NINGUNA	SE ENTREGA AL CLIENTE. 	2	2	1		f	\N	\N				WH20140600634	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-09	\N	\N	2015-01-17 14:43:23.13874-05	\N	\N		f	f	f	f	f	f	f	f	f	f
220	0	686	2015-02-09 13:48:36.369746-05	3	24	997	2015-01-22 14:29:29.119213-05	2013-12-12	2015-02-23	\N	NOB011	NO BREAK MICROSR INET480VA SOLA BASIC	SN	HM1970	0997294	ME REPORTA EL CLIENTE QUE EL NO BREAK SE CORTA Y NO REALIZA SU FUNCION. 			NOBREAK SE ENTREGA AL CLIENTE FUNCIONANDO CORRECCTAMENTE.	2	2	1	SOLABASIC INET 480VA	f	\N	\N				E13J16985	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-29	\N	\N	2015-02-09 13:48:36.369484-05	\N	\N		f	f	f	f	f	f	f	f	f	f
410	0	663	2015-04-30 18:19:16.613969-04	19	19	1076	2015-04-30 18:19:16.590168-04	2015-04-16	2015-06-01	\N	HPCC364X	HP TONER LASERJET NEGRO	No aplica	CN188	1076555	AL QUITAR LA BANDA DE SEGURIDAD, SE ROMPIO Y QUEDO ATASCADA				0	2	2		f	\N	\N				No aplica	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
221	1	304	2015-02-10 16:24:53.671045-05	37	29	1001	2015-01-22 16:45:43.938603-05	\N	2015-01-29	\N					1001322	FAVOR DE IR A DARLE SERICIO A IMPRESORA DE VADO DEL RIO DE ARRENDAMIENTO, YA QUE AUNQUE ESTE EL TONER NUEVO.. MARCA EN LA PANTTALLA COMO TONER GASTADO. EL TEL. ES 2591151 				2	2	\N	R10123	f	1	3		SAMSUNG	SCX-6545N	 	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-02-10 16:24:53.670817-05	2015-01-23 21:00:00-05	2015-01-23 21:00:00-05		f	f	f	f	f	f	f	f	f	f
184	1	405	2015-02-13 18:41:16.207508-05	15	15	988	2015-01-14 12:12:09.581911-05	\N	2015-01-21	\N					0988431	SERVICIO PREVENTIVO		Ninguna.	SERVICIO PREVENTIVO: $700.00 IVA Incluido	2	2	\N	HM14975	f	1	3		CUB	CB-1024	24M0450211	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-02-13 18:41:16.207087-05	\N	\N		f	f	f	f	f	f	f	f	f	f
147	0	844	2015-02-16 13:20:31.896285-05	3	15	965	2015-01-05 18:28:54.694697-05	2015-08-07	2015-02-04	\N	GHIA27154P	TABLETA GHIA 7" ANY 27154P 8GB GRIS	NINGUNO	8190	0965094	NO SE VE LA PANTALLA, EL EQUIPO NO SE PRENDIÓ PORQUE NO TRAÍA CARGADOR, SIN NINGÚN ACCESORIO.		NINGUNA	TABLETA ENTREGADA A CLIENTE FUNCIONANDO CORRECTAMENTE.	2	2	1	CVA <4845> GHIA27154P	f	\N	\N				C27154P1401043403	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-06	\N	\N	2015-02-16 13:20:31.896025-05	\N	\N		f	f	f	f	f	f	f	f	f	f
202	1	862	2015-01-21 13:41:19.406987-05	1	1	994	2015-01-19 16:33:17.845566-05	\N	2015-01-26	\N					0994834	ERROR EN SISTEMA DE TINTA	SE ENVIÓ COTIZACIÓN A CLIENTE.			2	2	\N	R10040	f	2	3		HP	DESINGJET T120	PENDIENTE	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-01-21 13:41:19.406744-05	2015-01-19 19:00:00-05	2015-01-19 20:00:00-05		f	f	f	t	f	f	f	f	f	f
205	0	863	2015-01-21 10:47:34.878722-05	3	15	991	2015-01-20 13:10:33.862199-05	2014-12-01	2015-02-19	\N	27158N	TABLET 7 PULGADAS 8 GB COLOR NARANJA	Cargador, Audifonos, 2 Cable de datos	pendiente	0991830	NO INICIA SISTEMA.\r\nSE QUEDA EL LOGOTIPO DE ANDROIT.		NINGUNA	RESTAURACIÓN DEL SISTEMA.\r\nTABLETA QUEDA FUNCIONANDO CORRECTAMENTE.	2	2	1		f	\N	\N				C27154P1404014478	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-21	\N	\N	2015-01-21 10:47:34.878392-05	\N	\N		f	f	f	f	f	f	f	f	f	f
190	0	343	2015-01-22 12:32:27.597089-05	3	15	986	2015-01-15 10:57:46.306065-05	2014-10-28	2015-02-16	\N	HPF4H36LA	LAPTOP HP PAVILION 10-E013LA TOUCH	CARGADOR	R9108	0986738	EL EQUIPO FUNCIONA SOLAMENTE CARGANDO EL EQUIPO UN VEZ DESCONECTADO NO RECIBE CARGA Y SE APAGA.		NINGUNA.	Se entrega portátil funcionando correctamente con batería nueva al cliente.	2	2	1	HP case <30 11 58 60 90>	f	\N	\N				5CD4070V1L	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-22	\N	\N	2015-01-22 12:32:27.596833-05	\N	\N		f	f	f	f	f	f	f	f	f	f
291	1	819	2015-03-03 13:19:50.34569-05	1	15	1027	2015-02-18 14:08:46.716223-05	\N	2015-02-25	\N					1027431	CAMBIAR DISCO DURO E INSTALAR EL SISTEMA OPERATIVO, WINDOWS 7.	Se recibe e instala disco duro, se detecto ruido en ventilador de fuente de poder.	Disco duro WD SATAIII 500GB 7200. Precio: $962.80	Se realiza la instalación de disco duro y re-instalación de sistema operativo.	2	2	\N	HM15300	f	2	2		HP	PAVILION	MXX220041R	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-03-03 13:19:50.345461-05	\N	\N		f	f	f	f	f	f	f	f	f	f
155	1	489	2015-01-13 11:32:59.192152-05	4	1	979	2015-01-07 11:20:29.195126-05	\N	2015-01-14	\N					0979356	ERROR 13.01.00				2	2	\N	HM12869	f	3	3		HP 	P3015	VND3F12373	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-01-13 11:32:59.191923-05	2015-01-07 19:00:00-05	2015-01-07 20:00:00-05		f	f	f	f	f	f	f	f	f	f
191	0	66	2015-01-27 11:55:23.518745-05	3	3	987	2015-01-15 12:16:47.302884-05	2014-09-01	2015-02-16	\N	TOSL50DA5172WM	TOSHIBA SATELLITE L50D 15.6" AMD A6	CARGADOR	HM10048	0987494	ya no prende.. no detecta el cargador...		NINGUNA	EQUIPO PORTÁTIL SE ENTREGA FUNCIONANDO CORRECTAMENTE. 	2	2	1	MI PC <200115-1>	f	\N	\N				S4E172476U	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-20	\N	\N	2015-01-27 11:55:23.518307-05	\N	\N		f	f	f	f	f	f	f	f	f	f
171	0	818	2015-01-17 14:56:46.694903-05	3	36	978	2015-01-08 13:59:53.007691-05	2015-01-07	2015-02-09	\N	(2) MS10615, (9) MS3033, (21) VB02016, (1) VB02020	varios	1	1	0978164	- MS10615: Maltratadas, centro de carga no sirve.\r\n- MS3033: Maltratadas, centro de carga no sirve.\r\n- VB02016: Cables cambiados, No funcionan, Controles dañados.\r\n- VBVB02020: Controladores dañados.				1	2	1	VAMAC	f	\N	\N				varios	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-17	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
308	1	705	2015-03-05 11:40:47.032346-05	37	23	1038	2015-02-27 17:57:00.332191-05	\N	2015-03-06	\N					1038553	INSTALACIÓN DE PANTALLA DE PARED NO. PARTE KEP0206.			Se realiza instalación de pantalla. Costo Servicio: $500.00 +IVA	2	2	\N	HM15401	f	3	4		Kensington	P0206	XXXXXXXXX	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		pantalla de pared	\N	2	\N	2015-03-05 11:40:47.032018-05	2015-03-03 04:00:00-05	2015-03-04 04:00:00-05		f	f	f	f	f	f	f	f	f	f
237	0	613	2015-03-24 14:12:26.903142-04	14	41	1003	2015-01-27 17:25:35.379762-05	2014-12-23	2015-02-26	\N	HPC8532A	UNIDAD DUPLEX HP PARA LASERJET 9050	NO	9883	1003291	NO HACE LA FUNCIÓN DE DUPLEX				2	2	3	HP DUPLEX	f	\N	\N				NO APLICA	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-29	\N	\N	2015-03-24 14:12:26.902801-04	\N	\N		f	f	f	f	f	f	f	f	f	f
157	0	852	2015-02-26 14:54:23.995848-05	3	15	970	2015-01-07 16:28:45.838957-05	2014-12-03	2015-02-06	\N	TABLET 7" GHIA	TABLET 7 PULGADAS 8 GB COLOR BLANCO	CARGADOR, CABLE DE CORRIENTE	R9507	0970956	EL EQUIPO NO ENCIENDE.		NINGUNA	Se entrega funcionando correctamente a LILIANA MARIA NAVARRO VALENCIA.	2	2	1	Finalizada GHIA C27158B 1076 <9244>	f	\N	\N				C27158B1404071076	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-17	\N	\N	2015-02-26 14:54:23.995579-05	\N	\N		f	f	f	f	f	f	f	f	f	f
247	2	\N	2015-04-17 15:16:22.036856-04	3	36	1172	2015-01-28 15:06:59.525453-05	\N	2015-02-02	\N					1172119	NO HAY INTERNET \r\nTELMEX 6622124662		NINGUNA	SERVICIO DE INTERNET FUNCIONANDO CORRECTAMENTE.	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 15:16:22.036551-04	\N	\N		f	f	f	f	f	f	f	f	f	f
172	1	854	2015-01-28 13:01:34.661204-05	37	15	983	2015-01-08 14:21:04.370472-05	\N	2015-01-15	\N					0983830	EL EQUIPO PRENDE PERFECTAMENTE, A LA PORTATIL NO LE FUNCIONA EL TECLADO, EL TRACKPAD FUNCIONA PERFECTAMENTE PERO AL UTILIZARLO ESCRIBE LETRAS.	EN ESPERA DE HERRAMIENTA PARA PODER REALIZAR UN DIAGNOSTICO MAS PRECISO. (19/01/2015)	Ninguna.	Se realiza servicio preventivo de equipo. $340.00 + IVA.	2	2	\N	HM 14464	f	2	1		MAC APPLE	MAC BOOK AIR 	C02KHGVADRVC	f	f	f		Santiago Moreno	geociencias	f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-01-28 13:01:34.660914-05	\N	\N		f	f	f	f	f	f	f	f	f	f
287	0	663	2015-03-26 12:15:01.454418-04	14	3	1018	2015-02-17 11:42:14.17746-05	2013-11-28	2015-03-19	\N	HPD8D46LT	HP 1155 All-in-One Business PC - Overview	PENDIENTE DE ESPECIFICAR	1421	1018054	no arranca sistema  y no reconoce teclado ni mouse		NINGUNA	Se sustituye el equipo HP 1155 con numero de parte D8D46LT#ABM con serie 5CM33104VM\r\nCon la remision: 10608\r\nEquipo HP 205 G1 con numero de parte: E3T81LT#ABM con numero de serie: 4CE44507V6	2	2	1	HP 1155 04VM	f	\N	\N				5CM33104VM	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-02-18	\N	\N	2015-03-26 12:15:01.454078-04	\N	\N		f	f	f	f	f	f	f	f	f	f
166	0	818	2015-02-05 04:41:06.327072-05	3	36	976	2015-01-07 19:12:28.726217-05	2015-01-06	2015-02-08	\N	VARIOS	VARIOS	1	1	0976855	- VAMLEDVL001: SE TRABA AL GIRAR\r\n- VAMMS106: FALTA CABLES\r\n- VAMMS3033: MERCANCÍA DAÑADA\r\n- OKERSU613BL: TECLADO NO FUNCIONA				1	2	1	VAMAC	f	\N	\N				1	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-02-05	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
222	1	531	2015-01-27 13:43:03.773644-05	37	15	1002	2015-01-22 17:28:37.243329-05	\N	2015-01-29	\N					1002199	DIAGNOSTICAR EQUIPO, PRESENTA UN ERROR.	Se realizan pruebas de impresión manual, por red e inalambrico.	Ninguna.	Servicio diagnostico: $164.00 + IVA.	2	2	\N	HM 14427	f	2	3		HP	LASERJET CP1525	CNBF228427	f	f	f				f	t	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-01-27 13:43:03.773219-05	\N	\N		f	f	f	f	f	f	f	f	f	f
169	2	\N	2015-04-17 15:19:33.592697-04	3	13	1151	2015-01-08 11:28:14.251779-05	\N	2015-01-13	\N					1151460	Solicito la instalación del programa Microsip en mi equipo para facturar a Gobierno.\r\n\r\nMe urge.\r\n\r\nGracias.		NINGUNA 	Cualquier duda o comentario quedo a sus órdenes.\r\nSaludos.\r\nTzirahuén Martínez \r\nDepartamento Soporte Técnico\r\nOficina (662) 214 2200 ext. 250.\r\nCelular (662) 229 3979 Directo 2113.	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 15:19:33.59244-04	\N	\N		f	f	f	f	f	f	f	f	f	f
161	0	818	2015-01-12 14:37:53.133606-05	3	36	972	2015-01-07 17:44:06.571468-05	2015-01-19	2015-02-06	\N	GHIA27158N	TABLET GHIA ANY KIDS 27158N 7"	AUDIFONOS, ODT,CBLE CARGADOR Y ADAPTADOR CORRIENTE 	REM 045	0972809	AL PRENDER NO PASA DE LA PANTALLA DE INICIO 		NINGUNA.	TABLET FUNCIONANDO CORRECTAMENTE.\r\nSE ENTREGA EN DOMICILIO DEL CLIENTE.	2	2	1	GHIA27158N	t	\N	\N				C27158N14704006798	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-07	\N	\N	2015-01-12 14:37:53.133075-05	\N	\N		f	f	f	f	f	f	f	f	f	f
167	1	30	2015-01-08 11:47:39.016624-05	24	24	981	2015-01-08 11:03:00.058245-05	\N	2015-01-15	\N					0981546	El cliente justifica que su internet no tiene el alcance suficiente en toda su oficina, por lo que requiere una recomendación de alguna solución que podamos proponer.				3	2	\N		f	2	4		SN	SN	SN	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		ROUTER	\N	2	\N	\N	2015-01-08 12:00:00-05	2015-01-08 13:00:00-05		f	f	f	t	f	f	f	f	f	f
173	2	\N	2015-01-19 18:53:50.856926-05	3	20	1152	2015-01-09 11:13:54.923571-05	\N	2015-01-14	\N					1152487	Audifono no se escucha o falla\r\n\r\nSi es posible realizar un cambio\r\n\r\n			FOLIO DUPLICADO.	3	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
159	2	\N	2015-01-08 14:39:45.947588-05	3	32	1149	2015-01-07 17:29:18.048798-05	\N	2015-01-12	\N					1149220	hola\r\nnecesito que por favor le den acceso a la carpeta de licitaciones a oscar legapsi, Fernando cortez y Alejandro perez		Logmein Hamachi.	Oscar legapsi, Fernando cortez y Alejandro perez confirman acceso a la carpeta Licitacion a travez de Logmein. 	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-01-08 14:39:45.947156-05	\N	\N		f	f	f	f	f	f	f	f	f	f
137	1	839	2015-01-22 17:21:36.327233-05	15	15	969	2014-12-22 17:16:04.403746-05	\N	2014-12-29	\N					0969096	COTIZAR PANTALLA, SE ENCUENTRA QUEBRADA.	CLIENTE YA TRAJO ANTICIPO EN ESPERA DE DISPLAY.			2	2	\N	HM14354	f	2	1		HP	PAVILION 15-N019WM	5CD3334D8X	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-01-22 17:21:36.326858-05	\N	\N		f	f	f	f	f	f	f	f	f	f
253	0	4	2015-02-05 17:39:03.066857-05	3	42	1006	2015-01-29 15:17:22.419105-05	2014-01-29	2015-03-02	\N	CZ284A	HP DESKJET 4625	NO APLICA	1654516	1006603	CABEZAL				1	2	1	HP DESKJET 4625	f	\N	\N				CN31C210VQ	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-02-05	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
185	1	87	2015-02-10 16:44:08.746214-05	37	29	989	2015-01-14 14:29:08.124515-05	\N	2015-01-21	\N					0989975	FAVOR DE IR A ALMACEN EN EXBANCO DE MEXICO CON CARLOS PREREIRA A CHECAR UNA IMPRESORA M401N, ESTA DESCONFIGURADA Y PRESENTA ALGUNAS FALLAS , COMO NO IMPRIMIR ETC.		Actualización firmware de impresora.		2	2	\N	NINGUNO	f	1	3		HP	M401N	 	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-02-10 16:44:08.745981-05	2015-01-15 11:00:00-05	2015-01-15 11:00:00-05		f	f	f	f	f	f	f	f	f	f
299	0	891	2015-03-27 11:19:20.660093-04	8	8	1021	2015-02-23 17:06:12.356849-05	2014-12-16	2015-03-25	\N	HPCF06467901	KIT DE MANTENIMIENTO HP LASERJET M601	No aplica	TJ2702	1021303	Se cambió el fusor y en una hora marco un error de fusor.				2	1	2	CONSUMIBLE	f	\N	\N				No aplica	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-02-24	\N	\N	2015-03-27 11:19:20.659618-04	\N	\N		f	f	f	f	f	f	f	f	f	f
106	1	824	2015-01-09 11:56:59.060994-05	15	15	953	2014-12-05 10:29:56.378886-05	\N	2014-12-12	\N					0953744	PANTALLA ESTA OBSCURA, EL EQUIPO SI PRENDE. PERO SE DIAGNOSTICARA.	EN ESPERA DE COTIZACION, SE SOLICITO A OSCAR CID VENTAS@RESUMYTEC.COM			2	2	\N	HM14020	f	2	2		HP	TOUCH SMART 310	4CS037018X	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-01-09 11:56:59.060734-05	\N	\N		f	f	f	f	f	f	f	f	f	f
365	1	27	2015-03-27 17:55:55.851673-04	37	37	1054	2015-03-27 12:08:43.227005-04	\N	2015-04-03	\N					1054055	AL ENTRAR A WINDOWS SE PONE LA PANTALLA NEGRA			Servicio preventivo a equipo de computo Costo servicio: $270.00 + IVA.	2	2	\N	HM16269	f	1	2		HP 	PRODESK 600 G1	MXL4242420	f	f	f				f	f	f	f	f	f	f	f		t	f		f		f	f			\N	1	\N	2015-03-27 17:55:55.851428-04	\N	\N		f	f	f	f	f	f	f	f	f	f
201	2	\N	2015-01-22 01:23:17.089241-05	3	39	1159	2015-01-19 16:21:13.132442-05	\N	2015-01-22	\N					1159235	Solicito acceso al SAE de MTT y de la Tienda Virtual, para poder consultar las ventas de los clientes 34, 39 y 5208, respectivamente y para hacer las propuestas de precios. Requiero solo consultar. Gracias		ninguna 	Cualquier duda o comentario quedo a sus órdenes.\r\nSaludos.\r\nTzirahuén Martínez \r\nDepartamento Soporte Técnico\r\nOficina (662) 214 2200 ext. 250.\r\nCelular (662) 229 3979 Directo 2113.\r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-01-22 01:23:17.088875-05	\N	\N		f	f	f	f	f	f	f	f	f	f
165	1	818	2015-01-24 11:19:47.444687-05	1	36	980	2015-01-07 19:04:57.452499-05	\N	2015-01-14	\N					0980761	COTIZAR DISCO DURO Y A DECISIÓN DEL CLIENTE SE REPARARA	Cobro Diagnostico $204.00 IVA Incluido. Aplica 50 % descuento.	Ninguna.	Servicio Diagnostico: $102.00	2	2	\N	R10047	f	2	1		HP	HP MINI ROSA 210-2141LA	4CZ11720N8	t	t	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-01-24 11:19:47.444441-05	\N	\N		f	f	f	f	f	f	f	f	f	f
58	1	578	2015-01-13 11:14:07.54981-05	1	14	926	2014-11-14 14:43:44.614316-05	\N	2014-11-21	\N					0926820	Recolección (Martes 18-Nov-2014) , para luego dar diagnostico.	SE CONSULTO A EJECUTIVO DE CUENTA EL TIEMPO DE ENTREGA DE FUSOR.			2	2	\N	ARMANDO F.	f	2	3		HP	 Laserjet 1600	na	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-01-13 11:14:07.549406-05	2014-11-19 01:00:00-05	2014-11-21 21:00:00-05		f	f	f	t	f	f	f	f	f	f
231	0	793	2015-03-11 18:06:58.244796-04	14	29	1000	2015-01-27 10:47:40.272449-05	2014-10-14	2015-02-26	\N	DELL1610HD	PROYECTOR DELL MOD.1610HD	 	REM 8967	1000090	presenta falla de encendido, solo se queda la iluminación del teclado parpadeando, se le instalo otra lámpara y presenta la misma falla.		ninguno	SE ENTREGA EN PLANTA FORD. Se entrega a Wenceslao.	2	2	1	DELL PROYECTOR	f	\N	\N				8F12NY1	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-29	\N	\N	2015-03-11 18:06:58.244527-04	\N	\N		f	f	f	f	f	f	f	f	f	f
217	2	\N	2015-02-05 19:53:48.882259-05	3	9	1163	2015-01-22 11:30:24.784132-05	\N	2015-01-27	\N					1163875	BUEN DÍA\r\n\r\n\r\nFAVOR DE REVISAR LA CUENTA DE CARMEN MEJÍA PARA INGRESAR A  LA PÁGINA DE COMPUPROVEEDORES, YA QUE NO LE ESA PERMITIENDO INICIAR SESIÓN.		NINGUNA	Se envía información a correo electronico del carmen mejia.\r\n \r\nReporte finalizado, se procede a imprimir reporte y cerrar solicitud solicitada.	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-02-05 19:53:48.881902-05	\N	\N		f	f	f	f	f	f	f	f	f	f
156	0	231	2015-01-27 12:23:28.304047-05	3	35	969	2015-01-07 11:42:23.743988-05	2014-09-30	2015-02-06	\N	LEN20A8A01CLM	PORTATIL LENOVO THINKPAD X1	CABLE	HM10956	0969984	NO ENCIENDE. LA VAN A TRAER EL DIA DE HOY	CONTACTO: PABLO ORTIZ\r\nCELULAR: 662 155 4955	NINGUNA	se entrega el equipo portátil funcionando correctamente. 	2	2	1	THINKPAD X1	f	\N	\N				SR901WB27	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-12	\N	\N	2015-01-27 12:23:28.3038-05	\N	\N		f	f	f	f	f	f	f	f	f	f
235	1	306	2015-02-28 12:36:34.864861-05	4	1	1008	2015-01-27 14:15:37.082996-05	\N	2015-02-03	\N					1008935	EQUIPO NO ENCIENDE, RECUPERAR INFORMACIÓN. RECOLECTAR DE 4:00 A 6:00 EL DÍA 27/01/2015	Dañada Motherboard.	Ninguna.	Servicio diagnostico (Equipo dañado): (respaldo de información)	2	2	\N	HM14994	f	2	1		HP	g7-1167dx	CN1232F19	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-02-28 12:36:34.864557-05	\N	\N		f	f	f	f	f	f	f	f	f	f
387	0	798	2015-05-15 20:03:28.176963-04	8	8	1064	2015-04-22 19:19:32.164726-04	2014-09-11	2015-05-22	\N	HPCZ195A	IMPRESORA HP LASERJET PRO M401N	CABLE	TJ 1972	1064826	NO JALA LAS HOJAS PARA LA IMPRESION, SE QUEDAN ATORADAS. 				2	1	1		f	\N	\N				PHGDC05743	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-04-30	\N	\N	2015-05-15 20:03:28.176631-04	\N	\N		f	f	f	f	f	f	f	f	f	f
174	2	\N	2015-04-17 15:39:54.082375-04	3	20	1153	2015-01-09 11:14:22.474829-05	\N	2015-01-14	\N					1153466	Audifono falla \r\n\r\nFavor de realizar cambio en lo posible		Ninguna	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. 	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 15:39:54.082118-04	\N	\N		f	f	f	f	f	f	f	f	f	f
297	1	91	2015-02-28 12:25:51.961001-05	4	1	1030	2015-02-20 11:31:13.190374-05	\N	2015-02-27	\N					1030486	REALIZAR MANTENIMIENTO PREVENTIVO (INCLUYE REEMPLAZO DE KIT DE MANTENIMIENTO: 105999302)	PROGRAMAR VISITA VIERNES 27 FEBRERO.		Se duplico reporte 1037	2	2	\N	HM15124	f	1	3		ZEBRA	ZM400	PENDIENTE	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-02-28 12:25:51.960769-05	2015-02-25 09:00:00-05	2015-02-25 11:00:00-05		f	f	t	f	f	f	f	f	f	f
196	0	757	2015-01-26 19:09:42.748988-05	3	15	989	2015-01-19 12:38:03.978168-05	2014-01-28	2015-02-18	\N	CR768A	OFFICEJET 7110	CABLE DE CORRIENTE Y CONSUMIBLES	HM3200	0989173	EL EQUIPO IMPRIME LAS HOJAS PERO SE ATORAN Y SE MANCHAN.		NINGUNA	SE ENTREGA AL CLIENTE CAMBIO FISICO. 	2	2	1	HP CASE <30 11 8097 56>	f	\N	\N				CN3BD3MGZ8	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-19	\N	\N	2015-01-26 19:09:42.748646-05	\N	\N		f	f	f	f	f	f	f	f	f	f
180	0	761	2015-01-22 13:19:52.690869-05	3	19	982	2015-01-12 13:08:21.794986-05	2014-08-25	2015-02-11	\N	I64018H	TONER LEXMARK T640 64018HL	No aplica	9835	0982831	AL MOMENTO DE IMPRIMIR, LAS HOJAS SALEN MANCHADAS				1	2	2	CONSUMIBLE	f	\N	\N				No aplica	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-12	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
178	0	209	2015-01-22 13:20:01.583488-05	3	19	980	2015-01-10 13:26:18.164654-05	2014-10-24	2015-02-10	\N	HPCZ135A	CARTUCHO P/T120/T520 #711 TRIPACK MAGENTA	No aplica	11851	0980808	NO LOS LEE EL PLOTTER AL MOMENTO DE INSTALARSE.				1	2	2	CONSUMIBLE	f	\N	\N				No aplica	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-10	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
177	0	739	2015-01-22 13:20:09.59516-05	3	19	979	2015-01-10 12:17:09.300456-05	2014-11-04	2015-02-10	\N	XE106R01529	TONER XEROX 3550 NEGRO	No aplica	12205	0979520	AL MOMENTO DE IMPRIMIR MANCHA LAS HOJAS				1	2	2	CONSUMIBLE	f	\N	\N				No aplica	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-10	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
366	1	87	2015-05-19 13:14:47.877683-04	37	29	1055	2015-03-28 13:00:04.890527-04	\N	2015-04-03	\N					1055385	REPARACION DE IMPRESORA MODELO HP LASER JET P3015 CON SERIE VNB3R51316 EN AGENICA FISCAL CUM HERMOSILLO, QUE TENEMOS EN COMODATO.\r\n\r\nNOTA:  NO SE PUEDE CONECTAR EL CABLE USB YA QUE LA CLAVIJA ESTA SUELTA (AL PARECER DESOLDADA). \r\n				2	2	\N	COMODATO	f	1	3		HP	P3015DN	VNB3R51316	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-05-19 13:14:47.877415-04	2015-03-28 22:00:00-04	2015-03-28 22:00:00-04		f	f	f	f	f	f	f	f	f	f
207	1	818	2015-01-27 13:08:09.882861-05	37	36	996	2015-01-20 20:35:29.978519-05	\N	2015-01-27	\N					0996325	pantalla quebrada (cotizar)		Ninguna.	No se encontró refacción o proveedor para reparación de pantalla	2	2	\N	NINGUNO	f	2	1		Color Tab 7"	ctab0714	CT0714AZ1409004887	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-01-27 13:08:09.882554-05	\N	\N		f	f	f	f	f	f	f	f	f	f
236	1	705	2015-02-28 12:39:12.229424-05	4	24	1009	2015-01-27 16:46:05.195225-05	\N	2015-02-03	\N					1009904	INSTALACION EN SANTA FE 5TO AÑO CONTACTAR A LIZ ARAUJO\r\nLic. Lizbeth Araujo Chávez\r\nTels: 2166416 y 2184912 \r\n				2	2	\N	HM15278	f	3	4		VIEWSONIC	PJD5132	SN	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		PROYECTOR VIEWSONIC PJD5132	\N	2	\N	2015-02-28 12:39:12.229143-05	2015-01-28 11:30:00-05	2015-01-28 13:00:00-05	CABLES	t	f	f	t	f	f	f	f	f	f
233	0	867	2015-02-26 17:07:52.786045-05	3	15	1001	2015-01-27 13:10:10.873811-05	2015-01-14	2015-02-26	\N	VORHP300NEGRO	DIADEMA VORAGO ALTA FIDELIDAD HP-300 NEGRO	NINGUNO	RM9989	1001966	NO SE ESCUCHA EL SONIDO DE LA DIADEMA 		NINGUNA	Se entrega funcionando correctamente al cliente en su domicilio.	1	2	1	Finalizado VORAGO	f	\N	\N				SIN SERIE	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-27	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
224	0	305	2015-03-23 11:55:18.109462-04	3	29	999	2015-01-23 11:39:36.593412-05	2014-10-16	2015-02-24	\N	CNDRM140	DR-M140 DOCUMENT SCANNER SIMPLEX 40 OOM D	 	HM11586	0999572	SCANEA MOVIDO Y LOS COLORES SON DIFERIDOS. JORGE ESTRADA TEL. 2183205				2	2	1	CANON SCANNER	f	\N	\N				FT315115	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-29	\N	\N	2015-03-23 11:55:18.109138-04	\N	\N		f	f	f	f	f	f	f	f	f	f
209	1	774	2015-01-23 12:06:22.514749-05	37	23	997	2015-01-21 12:27:43.428149-05	\N	2015-01-28	\N					0997911	NO prende	ES UN PROYECTOR Y EL EQUIPO NO ENCIENDE. SE REALIZARA EL DIAGNOSTICO. Se detecto problema físico con puerto VGA1	Ninguna.	Equipo se entrega con diagnostico de falla en puerto VGA1. Posteriormente cliente decide si envía a reparación de puerto, consideran habilitarlo con puerto VGA2. Se verifico el correcto funcionamiento de equipo, resolución y calidad de imagen.	2	2	\N	NINGUNO	f	2	4		PANASONIC	XX	SD0420023	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-01-23 12:06:22.514507-05	2015-01-24 08:00:00-05	2015-01-24 08:00:00-05	Cable AC.	f	f	f	f	f	f	f	f	f	f
206	1	818	2015-01-23 14:48:25.892396-05	37	36	995	2015-01-20 20:30:49.409746-05	\N	2015-01-27	\N					0995989	No prende (cotizar)		Ninguna.	Cliente no autorizo la reparacion, se entrego equipo a cliente.	3	2	\N	NINGUNO	f	2	1		kindle	kindle	00	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
234	0	4	2015-01-27 13:19:19.863299-05	3	3	1002	2015-01-27 13:10:51.563733-05	2015-01-01	2015-02-26	\N	B4L10-64001	HP DESKJET INK ADVANTAGE 4645	NINGUNO	PENDIENTE	1002748	MARCA ERROR EN CARTUCHOS.		NINGUNA	SE ENTREGA MULTINACIONAL FUNCIONANDO CORRECTAMENTE AL CLIENTE EN SU DOMICILIO.	2	2	1		f	\N	\N				CN4883B0G8	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-27	\N	\N	2015-01-27 13:19:19.862962-05	\N	\N		f	f	f	f	f	f	f	f	f	f
219	1	865	2015-01-24 11:44:58.517058-05	37	15	1000	2015-01-22 13:30:17.63992-05	\N	2015-01-29	\N					1000767	DIAGNOSTICO Y SERVICIO PREVENTIVO.	INSTALAR SUITE CS6 ADOBE	Ninguna.	Para instalar Adobe CS6 Master Suite se requiere comprar Software.	2	2	\N	R10088	f	1	1		MAC	MACBOOK PRO	C17JCGV8DTY3	t	f	f		lizeth rivas	lizeth13	f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-01-24 11:44:58.516777-05	\N	\N		f	f	f	f	f	f	f	f	f	f
47	0	663	2015-01-26 16:09:02.551317-05	3	1	925	2014-11-12 10:39:21.630173-05	2014-03-05	2014-12-12	\N	HPE381LT	AIO 205	ELIMINADOR DE CORRIENTE	HMXXXX	0925938	AL INSTALAR PROGRAMAS PESADOS.	15 de Diciembre de 2014 a las 16:38 - Numero Orden: HP0013799 ... \r\n4 de Diciembre de 2014 a las 10:35 - case 4741-8226-30 :solicitud de media de instalación (sistema operativo). 	NINGUNA.	SE ENTREGA COMPUTADORA FUNCIONANDO CORRECTAMENTE EN OFICINAS DEL CLIENTE. 	2	2	1	HP <744 7103 02> AIO 205	t	\N	\N				4CE4010B7N	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-11-13	\N	\N	2015-01-26 16:09:02.550963-05	\N	\N		f	f	f	f	f	f	f	f	f	f
396	1	304	2015-04-24 18:19:44.16841-04	4	37	1068	2015-04-23 18:18:30.699079-04	\N	2015-04-30	\N					1068853	Se requiere el reemplazo de Unidad de Imagen en equipo impresora.	Reemplazo de unidad de Imagen.	DRUM SAMSUNG SCX-6555 80000		2	2	\N	COMODATO	f	3	3		SAMSUNG	SCX-6555	PENDIENTE	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-04-24 18:19:44.167981-04	2015-04-25 02:00:00-04	2015-04-25 04:00:00-04		f	f	f	f	f	f	f	f	f	f
218	1	624	2015-01-27 14:29:08.42311-05	37	24	999	2015-01-22 11:37:58.743601-05	\N	2015-01-29	\N					0999552	La ALL IN ONE al parecer no tiene sonido, tal vez sea un problema de configuración. Me comenta JORGE que ya sabes llegar a su domicilio de ARTURO BAYARDO, es una ALL IN ONE que instalaron ahí mismo.	Presenta lentitud en Internet.	Ninguna.		2	2	\N	NINGUNO	f	1	2		HP	ENVY 23	3CR25200CN	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-01-27 14:29:08.422855-05	2015-01-23 19:00:00-05	2015-01-23 20:00:00-05		t	f	f	t	f	f	f	f	f	f
168	0	577	2015-01-27 13:00:09.131422-05	3	15	977	2015-01-08 11:15:07.91486-05	2014-12-17	2015-02-09	\N	EPB11B190011	ESCANER EPSON GT-1500	EN CAJA ORIGINAL CON ACCSESORIOS: CABLE DE CORRIENTE, CABLE USB	HM13661/R9911	0977854	APARECE ERROR UN PARPADEO DE FOCO NARANJA HAY QUE DIAGNOSTICAR EL ESCANER.	epson 01 800 0871 081	NINGUNA.	SE ENTREGA EQUIPO FUNCIONANDO CORRECTAMENTE\r\nEN DOMICILIO DEL CLIENTE, POR PERSONAL DE SERVICIO CON FOLIO 1007.	2	2	1	 EPSON <150 108 0060 75>	f	\N	\N				KSJW120074	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-08	\N	\N	2015-01-27 13:00:09.131089-05	\N	\N		f	f	f	f	f	f	f	f	f	f
176	1	209	2015-01-27 14:48:45.7994-05	37	29	985	2015-01-09 14:28:14.175622-05	\N	2015-01-16	\N					0985313	FAVOR DE PASAR CON MANUEL LLERENAS HOY POR LA TARDE YA QUE EL EQUIPO LE PONE HOJAS EN LA BANDEJA 1 Y LE APARECE QUE NO TIENE PAPEL, SIEMPRE LO CONFIGURA PERO CUANDO LA PAPAGA Y VUELVE A PRENDER AL OTRO DIA SE DESCONFIGURA TODO, TAMBIEN QUIERE VER SI PUEDE ADICINAR USUARIOS, SI ESTO LO PODEMOS HACER POR TELEFONO, SE PUEDE HACER DE ESE MODO,. SI NO IR HOY POR LA TARDE DE FAVOR.\r\n\r\nSALUDOS.	Se acude a realizar configuración de equipo.	Ninguna.	No se realiza cobro por area de soporte.	2	2	\N	NINGUNO	f	1	3		SAMSUNG	SCX-6545N	 	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-01-27 14:48:45.798992-05	2015-01-09 21:00:00-05	2015-01-09 21:00:00-05		f	f	f	f	f	f	f	f	f	f
210	0	809	2015-02-17 19:05:20.925046-05	3	23	993	2015-01-21 16:27:59.566874-05	2014-03-11	2015-02-20	\N	HPE3W15LT	HP PROBOOK 440 G1	XXXX	HM4639	0993108	NO PRENDE		NINGUNA	se entrega en el domicilio del cliente.\r\nse requiere reinstalación del sistema operativo a la versión de fabrica. 	2	2	1	HP <4746249307> PROBOOK 440 G1	f	\N	\N				2CE40702BH	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-22	\N	\N	2015-02-17 19:05:20.924724-05	\N	\N		f	f	f	f	f	f	f	f	f	f
375	1	142	2015-04-17 17:15:44.744125-04	37	23	1060	2015-04-09 18:03:45.857147-04	\N	2015-04-16	\N					1060809	GERARDO BOJORQUEZ	2 equipos Laptop, 5 equipos desktop y 2 equipos impresoras.		Se realizan servicios preventivos a 2 equipos Laptop, 5 equipos desktop, 2 equipos impresoras y ordenamiento de cables en cada estación de trabajo.	2	2	\N	HM16745	f	2	2		xxxx	XXx	XXx	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-04-17 17:15:44.743452-04	2015-04-10 05:00:00-04	2015-04-11 05:00:00-04		f	f	f	f	f	f	f	f	f	f
411	2	\N	2015-05-25 13:48:49.454343-04	3	40	1205	2015-05-04 13:06:03.510395-04	\N	2015-06-03	\N					1205081	BUEN DIA:\r\nPOR RECOMENDACION DE LIC.LUZ DEL MAR, SE SOLICITA AGREGAR GRABACION AL CONMUTADOR, DE PROMOCIONES DE LA EMPRESA, MIENTRAS LA LINEA ESTA EN ESPERA. GRACIAS	BUSCAR UN PROVEEDOR QUE MANEJE ASTERIX PARA REALIZAR LA SOLICITUD.			1	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	t
149	1	845	2015-02-05 16:21:14.95046-05	4	15	976	2015-01-06 14:10:27.008608-05	\N	2015-01-13	\N					0976263	ERROR NO IMPRIME.	Problemas con cartuchos (viejos)	REQUIERE LOS CARTUCHOS 940 $267.94 C/U YA NETO EN COLORES: CYAN, MAGENTA Y YELLOW. 	Se instalaron cartuchos Cyan, Magenta y Yellow. Se realizaron pruebas satisfactorias de impresión. Servicio por Diagnostico: $164.00 + IVA	2	2	\N	HM14700	f	2	3		HP	OFFICEJET 8000	CN05B3K1CY	f	f	f				f	f	f	f	f	f	t	f		f	f		f		f	f			\N	1	\N	2015-02-05 16:21:14.950178-05	\N	\N		f	f	f	f	f	f	f	f	f	f
150	1	845	2015-02-05 16:21:29.869971-05	4	15	977	2015-01-06 14:12:29.202266-05	\N	2015-01-13	\N					0977779	DIAGNOSTICO	Realizo limpieza de cabezal, se detecto requiere de cartucho negro para corregir problema de letras incompletas y manchas.	Se entrego cartucho por cliente pero no funciono.\r\n	Equipo funciona e imprime correctamente. Servicio por Diagnostico: $164.00 + IVA.	2	2	\N	HM14700	f	2	3		HP 	PHOTOSMART D110	CN06ED14TT	f	f	f				f	f	f	f	t	f	t	f		f	f		f		f	f			\N	1	\N	2015-02-05 16:21:29.869726-05	\N	\N		f	f	f	f	f	f	f	f	f	f
151	1	845	2015-02-05 16:21:47.143886-05	4	15	978	2015-01-06 14:13:54.963983-05	\N	2015-01-13	\N					0978979	DIAGNOSTICO.	Se realiza limpieza interna de polvo e inyectores, se ajusta y alinea. Observaciones: presenta letras incompletas por cartucho incompatible (negro)	Ninguna / CARTUCHO 670 NEGRO $120.66 ESTÁNDAR / 670 XL $197.73 YA NETO. Pendiente autorizacion:Servicio preventivo: $272.00 + IVA 	Servicio por Diagnostico: $164.00 + IVA.	2	2	\N	HM14700	f	2	3		HP 	HP Deskjet 5525	CN24D1C0BR	f	f	f				f	f	f	f	f	f	t	f		f	f		f		f	f			\N	1	\N	2015-02-05 16:21:47.143517-05	\N	\N		f	f	f	f	f	f	f	f	f	f
281	1	142	2015-03-03 13:17:09.608489-05	1	15	1021	2015-02-13 14:53:41.799424-05	\N	2015-02-20	\N					1021895	EL EQUIPO NO ENCIENDE, SE APAGADO. TEL 01 6621 620955 / LEONARDO CASTRO contacto / IZAI GRANADOS	Se detecta problema con office 2007 y antivirus.	Gabinete Acteck SLim Micro ATX 500W: $490.00	Se realizo el intercambio de piezas y periféricos en otro gabinete, se verifica el correcto inicio de sistema operativo. ***Se entrega gabinete con fuente de poder dañada***	2	2	\N	HM15277	f	2	4		ARMADO	PENDIENTE	PENDIENTE	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		CPU	\N	1	\N	2015-03-03 13:17:09.608241-05	\N	\N		f	f	f	f	f	f	f	f	f	f
340	1	905	2015-03-13 12:18:53.743219-04	44	44	1047	2015-03-11 12:00:02.207659-04	\N	2015-03-18	\N					1047163	INSTALACIÓN 				3	2	\N		f	3	3		HP	P3015	PENDIENTE 	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	\N	2015-03-12 14:00:00-04	2015-03-12 15:00:00-04		f	f	f	t	f	f	f	f	f	f
214	0	818	2015-02-21 13:58:07.805995-05	3	36	996	2015-01-21 20:41:17.032273-05	2014-12-18	2015-02-22	\N	GHIA27218B	TABLET GHIA ANY GIRL 27218B 8GB BCA-	Adaptador, Cable USB, Cable ODT, Audifonos.	REM 44	0996093	Pantalla quebrada (cotizar)	Display 210.80 mas iVA\r\nMano de obra 84.00 mas IVA\r\n	NINGUNA	SE ENTREGA TABLETA A Luis Enrique Gómez Felix PORQUE SE REQUIERE ANTICIPO Y AUTORIZACION DE REPARACION POR PARTE DEL CLIENTE FINAL.\r\n	2	2	1	GHIA C27218B 4545	t	\N	\N				C27218B1494014545	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-22	\N	\N	2015-02-21 13:58:07.805729-05	\N	\N		f	f	f	f	f	f	f	f	f	f
296	1	757	2015-03-24 19:16:53.902656-04	37	37	1029	2015-02-19 18:52:11.500962-05	\N	2015-02-26	\N					1029963	EQUIPO AL ABRIRLO MUESTRA DERRAME DE TONER.	Tel. Xerox\r\n01 800 0093 769; Opción 5\r\nse genero el reporte para el ALTA: 1262123 de 24 a 48 hrs hábiles.\r\n\r\nGerardo Molina - Quejas contactara con Mario Martinez.		No se realiza servicio, se inicio proceso de garantía.	2	2	\N	GARANTIA	f	2	4		XEROX	Phaser 7500DN	RXD139760F	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		IMPRESORA	\N	2	\N	2015-03-24 19:16:53.902425-04	2015-02-20 22:00:00-05	2015-02-21 00:00:00-05		f	f	t	t	f	f	t	f	f	f
290	1	880	2015-02-23 13:24:41.987901-05	37	15	1026	2015-02-17 14:03:56.213153-05	\N	2015-02-24	\N					1026686	DIAGNOSTICAR TABLET, NO ENCIENDE 	MB-UMA 1G 8GeMMC Logic CPU PCA: 740258-001	Ninguna.	Se detecto daño en tarjeta: MB-UMA 1G 8GeMMC Logic CPU PCA: 740258-001	2	2	\N	HM15042	f	2	4		HP	HP INSIDE	PENDIENTE	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		TABLET HP	\N	1	\N	2015-02-23 13:24:41.987613-05	\N	\N	NINGUNO SOLAMENTE LA TABLET.	f	f	f	f	f	f	f	f	f	f
317	0	757	2015-03-28 16:08:10.903123-04	14	14	1025	2015-03-03 18:39:22.883559-05	2015-02-09	2015-04-02	\N	XE7500DN	XEROX Phaser 7500DN	Completo	HM14800	1025322	EL EQUIPO AL ABRIRLO MUESTRA DERRAME DE TONER		ninguna	Se reemplaza impresora Xerox Phaser 7500DN con numero de serie: RXD139760F\r\npor impresora Xerox Phaser 7500DN con numero de serie: RXD140556F.	2	2	1	7500_DN	f	\N	\N				RXD139760F	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-03-11	\N	\N	2015-03-28 16:08:10.902693-04	\N	\N		f	f	f	f	f	f	f	f	f	f
96	0	818	2015-04-29 13:15:54.702143-04	14	1	942	2014-12-02 10:33:22.27232-05	2014-11-26	2015-01-01	\N	C27158N	TABLET GHIA C27158N	CARGADOR, USB, AUDIFONOS, ODT INSTRUCTIVO.	R-9429	0942088	NO ENCIENDE.\r\n		NINGUNA		1	2	1	GHIA 27158N 4892 <4744> 	f	\N	\N				C27158N1404014892	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-12-03	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
280	1	464	2015-02-17 17:10:38.262194-05	37	37	1020	2015-02-12 17:57:20.537764-05	\N	2015-02-19	\N					1020692	LOS EQUIPOS CONECTADOS A EQUIPO ROUTER PIERDEN CONEXIÓN HACIA EL EQUIPO QUE TIENEN CONFIGURADO CON SOFTWARE CONTPAQ. SOLICITAN LA REVISION DE EQUIPOS Y CONEXIONES EN SITIO.	Requiere cotizar equipo para servidor CONTPAQ. El actual presenta ruido en disco duro.	Ninguna.	Se realiza visita de servicio correctivo por configuración de IP/Fija en equipo servidor. Cobro: $300 + IVA	2	2	\N	HM15018	f	2	4		DLINK	DES-1016A	N/A	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		Router	\N	2	\N	2015-02-17 17:10:38.261956-05	2015-02-14 08:00:00-05	2015-02-14 11:00:00-05		f	f	t	t	f	f	f	f	f	f
279	0	303	2015-02-18 10:28:48.810535-05	3	29	1016	2015-02-12 14:00:52.982395-05	2015-02-11	2015-03-16	\N	C8771WL	TINTA CYAN IMPRESORAQ INKJET 02	No aplica	HM14845	1016432	LO COMPRO AYER , LO INSTALO Y LE APARECE QUE EL CARTUCHO ESTA VACIO. FAVOR DE TRAMITAR LA GARANTIA.				1	2	2		f	\N	\N				No aplica	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
388	0	868	2015-05-27 11:22:00.407311-04	8	8	1065	2015-04-22 19:27:12.752178-04	2015-03-13	2015-05-22	\N	HPCE390X	TONER HP 90X NEGRO LJ M4555H M4555F	No aplica	TJ3269	1065145	TIRA EL POLVO Y MANCHA LAS HOJAS.				2	1	2		f	\N	\N				No aplica	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-05-27 11:22:00.406811-04	\N	\N		f	f	f	f	f	f	f	f	f	f
310	0	901	2015-04-15 14:51:06.103948-04	14	18	1023	2015-03-02 13:15:18.705292-05	2014-08-16	2015-04-01	\N	GHIA27154B	TABLETA GHIA ANY 27154B 1GHZ 8GB GRIS	ADAPTADOR DE CORRIENTE 	8371	1023416	JACK DE CORRIENTE NO CARGA POSIBLE FALSO EN CENTRO DE CARGA 		ninguna		2	2	1		f	\N	\N				C27154B1312001846	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-03-02	\N	\N	2015-04-15 14:51:06.103685-04	\N	\N		f	f	f	f	f	f	f	f	f	f
270	0	874	2015-02-24 14:23:17.562601-05	3	15	1011	2015-02-06 18:52:10.180777-05	2014-08-08	2015-03-10	\N	HPF4J41LA	LAPTOP HP 14-R016LA N2830	CABLE DE CORRIENTE	REM-8273	1011531	EL EQUIPO ESTA DEMACIADO LENTO, AVECES ENCIENDE. NO INICIA SISTEMA OPERATIVO.		Ninguna	el equipo se entrega al cliente funcionando correctamente. 	2	2	1	HP <4002128111> 14-R016LA	f	\N	\N				CND42226N0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-02-09	\N	\N	2015-02-24 14:23:17.562148-05	\N	\N		f	f	f	f	f	f	f	f	f	f
212	1	87	2015-03-03 13:43:13.928414-05	37	29	998	2015-01-21 16:58:24.528582-05	\N	2015-01-28	\N					0998857	LA IMPRESORA ENTRA Y SALE DE CONEXION, FAVOR DE IR A CHECAR A EXBANCO DE MEXICO CON CARLOS PEREIRA  O DIRECTAMENTE EN MEZANINE DONDE ESTA LA IMPRESORA		Se realizo garantía de refacción.	Servicio preventivo realizado: $270.00	2	2	\N	COMODATO	f	1	3		HP	M401N	THGDC05548	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-03-03 13:43:13.928188-05	2015-01-23 00:00:00-05	2015-01-23 01:00:00-05		f	f	f	f	f	f	f	f	f	f
305	1	597	2015-03-02 13:53:00.724297-05	37	18	1035	2015-02-25 18:31:08.486832-05	\N	2015-03-04	\N					1035824	LA IMPRESION A COLOR SALE DISTORCIONADA Y LA OCUPA UN SERVICIO GENERAL  	Se realizo calibración y actualización de firmware.	Ninguna. 	Se realizo mantenimiento preventivo a equipo, se realiza calibración de impresión y color. Equipo listo para su recolección. Servicio diagnostico: $174.00 (HM15306) bonificar al Servicio preventivo: $270.00 + IVA. 	2	2	\N	HM15432	f	2	3		HP	HPCC377A	CNAC8720HS	f	f	f				t	t	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-03-02 13:53:00.724007-05	\N	\N		f	f	f	f	f	f	f	f	f	f
241	2	\N	2015-04-17 15:02:09.079211-04	3	40	1169	2015-01-28 13:11:03.50728-05	\N	2015-02-02	\N					1169921	BUEN DIA: A SOLICITUD DE GERENCIA ADMINISTRATIVA, SE SOLICITA EQUIPO DE ESCRITORIO PARA NUEVOS COORDINADORES DE VENTA, LAS CUALES YA DEBEN TENER LISTO OUTLOOK, SAE, CONTRASEÑAS Y DEMAS HERRAMIENTAS PARA SUS TAREAS.		NINGUNA	SOLICITUD REALIZADA. 	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 15:02:09.078833-04	\N	\N		f	f	f	f	f	f	f	f	f	f
324	2	\N	2015-04-21 15:38:41.945627-04	3	8	1192	2015-03-05 13:14:58.298527-05	\N	2015-04-06	\N					1192206	BANDEJA DE IMPRESORA HP COLOR LASER JET CM2320nf MFP (UTILIZADA POR ADMINISTRACION Y ALMACEN), DONDE SE ENCUENTRAN LOS CARTUCHOS ESTA ATORADA DEL LADO DERECHO,POR LO TANTO LA BANDEJA NO SE PUEDE ABRIR PARA REALIZAR LOS CAMBIOS DE CARTUCHOS.  				1	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	t
239	2	\N	2015-04-17 15:17:27.983885-04	3	9	1167	2015-01-28 11:46:39.141146-05	\N	2015-02-02	\N					1167957	BUEN DÍA\r\n\r\n\r\nFAVOR DE REDIRECCIONAR LA CUENTA DE CORREO DE ILIANA FUENTAS AL CORREO DE SILVIA ALVAREZ, LO ANTERIOR DEBIDO A LA INCAPACIDAD DE ILIANA.\r\n\r\nTAMBIEN REDIRECCIONAR LA CUENTA DE VIANEY AL CORREO DE MARCO ANTONIO CAÑEDO.\r\n\r\n\r\n\r\nGRACIAS		ninguna	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.\r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 15:17:27.9835-04	\N	\N		f	f	f	f	f	f	f	f	f	f
378	0	883	2015-04-23 18:40:20.700175-04	14	14	1057	2015-04-14 12:05:28.303508-04	2015-01-19	2015-05-14	\N	LEN10BBA0K9LS	Lenovo M73z	POR DEFINIR	14238	1057410	NO ENCIENDE	Se deja equipo en caja con mouse, teclado y cable de corriente originales.	ninguna		2	2	1	Lenovo M73z <302QNCV>	f	\N	\N				MJ01N4ZP	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-04-16	\N	\N	2015-04-23 18:40:20.699909-04	\N	\N		f	f	f	f	f	f	f	f	f	f
330	0	4	2015-05-26 11:30:54.243253-04	14	42	1031	2015-03-06 20:36:45.461682-05	2014-10-20	2015-04-06	\N	F3F28AA	HP AIO 19	FUENTE	1710031948141020113323	1031471	NO PRENDE		ninguna		2	2	1	HP AIO 19 0BKY <4002289192> 	t	\N	\N				3CR4180BKY	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-03-09	\N	\N	2015-05-26 11:30:54.243008-04	\N	\N		f	f	f	f	f	f	f	f	f	f
255	0	868	2015-02-23 17:11:08.087968-05	8	8	1008	2015-01-29 19:32:26.069836-05	2014-11-14	2015-03-02	\N	HPCE993A	IMPRESORA HP LASERJET M602X	CABLES Y CHAROLA	TJ2442	1008158	Cuando se instaló al prenderla se queda inicializando por mucho tiempo, si se apaga y se vuelve a prender marca el error 590090.				2	1	1	HP LASERJET M602X	f	\N	\N				CNDCGBX1HM 	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-02-04	\N	\N	2015-02-23 17:11:08.087696-05	\N	\N		f	f	f	f	f	f	f	f	f	f
175	1	343	2015-01-29 12:50:18.927765-05	37	15	984	2015-01-09 11:45:44.716673-05	\N	2015-01-16	\N					0984308	SE COTIZA REPARACIÓN DE EQUIPO, FALTA DE UNIDAD DE IMAGEN, SE DIAGNOSTICARA EN GENERAL.		Ninguna.	Cliente decide no realizar ningún servicio.	2	2	\N	NINGUNO	f	2	3		XEROX	PHASER 6121MFP	E188585	f	f	f				f	t	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-01-29 12:50:18.927436-05	\N	\N		f	f	f	f	f	f	f	f	f	f
252	1	336	2015-02-13 18:21:11.146059-05	37	37	1012	2015-01-29 13:07:15.862774-05	\N	2015-02-05	\N					1012631	Configuración de equipo Scanner.	ACTIVO: 1900.100.009	Ninguna.	Se entrego equipo en oficina.	2	2	\N	NINGUNO	f	3	4		Xerox	DM752	816TW1084K761600019	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		Scanner	\N	2	\N	2015-02-13 18:21:11.14571-05	2015-01-31 08:00:00-05	2015-01-31 08:00:00-05	Adaptador AC, Cable USB.	f	f	t	f	f	f	f	f	f	f
278	1	87	2015-03-03 13:37:26.783691-05	37	29	1019	2015-02-12 12:37:13.706487-05	\N	2015-02-19	\N					1019336	CENTRO DE GOBIERNO ALA SUR 1ER PUISO ICRESON /DAVID BENITEZ /  6622130591 / SOBREPONE LA IMPRESION, ESTA IMPRIMIENDO DOBLE...	No se detecto problema con equipo, se mantuvo operando correctamente.	Ninguna.	No se detecto problema con equipo, se mantuvo operando correctamente.	2	2	\N	COMODATO	f	1	3		HP	M401N	 	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-03-03 13:37:26.78343-05	2015-02-12 21:00:00-05	2015-02-12 12:00:00-05		f	f	f	f	f	f	f	f	f	f
232	1	577	2015-01-29 14:39:17.994074-05	37	29	1007	2015-01-27 12:18:17.404729-05	\N	2015-02-03	\N					1007995	ESTE SCANER LO MANDO A GARANTIA EL DIA SIGUIENTE DE LA COMPRA, LO CHECO TZIRAHUEN Y DIJO QUE NO SERVIA, SE MANDO A EPSON Y ELLOS SI LO PUDIERON HACER FUNCIONAR, COMO VEN EL CLIENTE ESTA MOLESTO CON ESTA SITUACION Y LO QUE MENOS PIDE ES QUE SE LO LLEVEMOS Y LO DEJEMOS INSTALADO, ME PUEDEN AYDUAR CON ESTA INSTALACION? ESPERO DE SU AYUDA.. EL SCANER ESTA EN SOPORTE TECNICO CON TZIRA,		Ninguna.	Se acude realizando configuración e instalación de equipo correctamente.	2	2	\N	NINGUNO	f	3	4		EPSON	GT-1500	 	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		scaner	\N	2	\N	2015-01-29 14:39:17.993588-05	2015-01-28 04:00:00-05	2015-01-27 19:00:00-05	 	f	f	f	f	f	f	f	f	f	f
254	0	393	2015-02-18 12:01:37.156778-05	3	24	1007	2015-01-29 18:12:12.82855-05	2015-01-29	2015-03-02	\N	KINDTIG432GB	MEMORIA USB KINGSTON 32G DATATRAVELER	SN	HM13287	1007988	No la lee, Primero comenzó con unas máquinas y ahora ninguna puede leerlas\r\n				1	2	1	KINGSTON 32G	f	\N	\N				SN	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-02-05	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
251	1	336	2015-02-13 18:21:59.911154-05	37	37	1011	2015-01-29 13:05:41.781157-05	\N	2015-02-05	\N					1011508	Configuración de equipo Scanner.	ACTIVO: 1900.100.286	Ninguna.	Se entrego equipo en oficina.	2	2	\N	NINGUNO	f	3	4		Xerox	DM752	832TW10884761600016	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-02-13 18:21:59.910873-05	2015-01-31 15:00:00-05	2015-01-31 15:00:00-05	Adaptador AC, Cable USB.	f	f	t	f	f	f	f	f	f	f
244	0	818	2015-02-09 13:50:22.009207-05	3	3	1004	2015-01-28 14:34:32.716863-05	2014-12-01	2015-02-27	\N	GHIA27158B	TABLETA GHIA 2715 8GB BLANCA	1 CABLE OTG, 1 ELIMINADOR DE CORRIENTE, 1 MANUAL DE USUARIO, 1 CABLE USB.	PENDIENTE	1004312	NO SE CONECTA A INTERNET. 		NINGUNA	TABLETA SE ENTREGA A ENRIQUE FUNCIONANDO CORRECTAMENTE.	2	2	1	REPARADA GHIA C27158B 4275	f	\N	\N				C27158B 1404004275	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-28	\N	\N	2015-02-09 13:50:22.00895-05	\N	\N		f	f	f	f	f	f	f	f	f	f
294	1	686	2015-02-19 18:15:38.274042-05	37	37	1028	2015-02-19 13:25:47.589281-05	\N	2015-02-26	\N					1028926	REINCIDENCIA DE FOLIO GARANTIA: 997 / MISMA FALLA SE VUELVE A PRESENTAR REPORTA EL CLIENTE QUE EL NO BREAK SE CORTA Y NO REALIZA SU FUNCION.				3	2	\N		f	2	4		SOLABASIC	INET480VA BASIC	E13J16985	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		NO BREAK	\N	2	\N	\N	2015-02-19 14:00:00-05	2015-02-19 14:00:00-05		f	f	f	t	f	f	f	f	f	f
243	1	336	2015-02-21 11:42:05.336743-05	1	3	1010	2015-01-28 13:54:13.037147-05	\N	2015-02-04	\N					1010666	INSTALAR MULTIFUNCIONAL.\r\nDOMICILIO: COMPUYA PARIAN\r\nUBICACIÓN: A ESPALDA DE ENRIQUE.\r\n\r\nCONFIGURACIÓN:\r\nCONECTAR A LA RED IMPRESORA. \r\nCREAR USUARIO PARA SACAR COPIAS.\r\nCONFIGURAR COMPUTADORA DE ENRIQUE PARA QUE IMPRIMIR.\r\n				2	2	\N	NINGUNO	f	3	3		SAMSUNG 	SCX-6545	Z2SCBJED200004Z	f	f	f				t	t	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-02-21 11:42:05.336497-05	2015-01-28 21:00:00-05	2015-01-30 21:00:00-05		t	f	f	t	f	f	f	f	f	f
163	0	818	2015-02-21 13:21:25.879183-05	3	36	974	2015-01-07 18:36:42.271645-05	2014-09-18	2015-02-06	\N	GHIA27154P	TABLET GHIA ANY 27154P 1GHZ 8GB GRIS	CABLE DE CORRIENTE, CABLE DE DATOS, ADAPTADOR, ODT	HM 10641	0974025	-NO SIRVE EL POSTE DEL CARGADOR\r\n-COTIZAR CUANTO SALE REPARACION		NINGUNO.	SE ENTREGA TABLETA A Luis Enrique Gómez Felix PORQUE SE REQUIERE ANTICIPO Y AUTORIZACION DE REPARACION POR PARTE DEL CLIENTE FINAL.	2	2	1	GHIA27154P No aplica garantia. 	t	\N	\N				C27154P1401060270	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-08	\N	\N	2015-02-21 13:21:25.878777-05	\N	\N		f	f	f	f	f	f	f	f	f	f
248	2	\N	2015-04-17 15:15:24.595208-04	3	36	1173	2015-01-28 15:09:45.911415-05	\N	2015-02-02	\N					1173220	SOLICITO POR REALIZAR CAMBIO DE PRECIO CON EL USUARIO DE PARIAN.		ninguna	Cambio de sistema de facturación. 	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 15:15:24.594892-04	\N	\N		f	f	f	f	f	f	f	f	f	f
351	2	\N	2015-04-17 12:48:49.817574-04	3	9	1197	2015-03-20 12:22:51.63251-04	\N	2015-03-25	\N					1197613	FAVOR DE COMPRAR TELEFONO FIJO (LINEA TELMEX) PARA COMPUYA.		Ninguna	Carta responsiva se envio por correo al usuario y recursos humanos. \r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 12:48:49.817279-04	\N	\N		f	f	f	f	f	f	f	f	f	f
323	0	883	2015-03-13 17:06:48.705782-04	14	14	1028	2015-03-05 12:19:48.139469-05	2013-12-17	2015-04-06	\N	HPD8D46LT	HP 1155	Por definir	HM2122	1028236	Presenta una raya en pantalla.\r\n 		Ninguna	El técnico de HP le Cambia la pantalla dañada al equipo y lo deja funcionando correctamente, el equipo esta listo.	2	2	1	HP 1155 <4650877843>	f	\N	\N				5CM33104JF	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-03-10	\N	\N	2015-03-13 17:06:48.705499-04	\N	\N		f	f	f	f	f	f	f	f	f	f
249	2	\N	2015-04-17 15:15:05.813107-04	3	8	1174	2015-01-28 17:13:48.354795-05	\N	2015-02-02	\N					1174469	REVISIÓN EQUIPO DE COMPUTO.\r\nFavor de revisar computadora de escritorio Sucursal TJ, teléfono, red, etc. para verificar su funcionamiento correctamente, para uso de los nuevos coordinadores de ventas que están por contratarse.		Ninguna	Reporte finalizado.	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 15:15:05.812666-04	\N	\N		f	f	f	f	f	f	f	f	f	f
200	2	\N	2015-04-17 14:56:35.584725-04	3	34	1158	2015-01-19 14:25:19.073619-05	\N	2015-01-22	\N					1158029	Configurar Scaner a computadora asignada.\r\nConfigurar impresora de etiquetas a computadora asignada.\r\nDar acceso a DN Difusa y  Compuya.\r\nPendiente compra de Silla.\r\n		Ninguna. 	Solicitudes realizados. \r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 14:56:35.584387-04	\N	\N		f	f	f	f	f	f	f	f	f	f
283	0	818	2015-04-29 13:16:11.937121-04	14	36	1017	2015-02-13 17:25:30.30753-05	2014-12-01	2015-03-17	\N	GHIA27158B	TABLETA GHIA 27158B 8GB BLANCA	1 CABLE OTG, 1 ELIMINADOR DE CORRIENTE, 1 MANUAL DE USUARIO, 1 CABLE USB	PENDIENTE	1017982	NO SE CONECTA AL INTERNET				1	2	1	GHIA 27158B 4275 <5030>	f	\N	\N				C27158B1404004275	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-02-13	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
264	1	790	2015-02-11 17:17:35.269923-05	4	15	1014	2015-02-04 17:45:52.932291-05	\N	2015-02-11	\N					1014390	EL PROYECTOR MARCA UN ERROR Y MARCA QUE OCUPA REPARACIÓN, DIAGNOSTICAR.	Se realizo limpieza de tarjetas electrónicas. Presentaban polvo y grasa en su interior.	Ninguna.	Se realiza el mantenimiento preventivo de equipo proyector. Costo: $500 + IVA	2	2	\N	HM14760	f	2	4		INFOCUS	IN2112	BEGB05000942	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		PROYECTOR 	\N	1	\N	2015-02-11 17:17:35.269681-05	\N	\N	CABLES DE PROYECTOR Y CONTROL	f	f	f	f	f	f	f	f	f	f
389	2	\N	2015-05-25 13:30:13.73078-04	3	9	1202	2015-04-23 12:54:17.699366-04	\N	2015-04-28	\N					1202702	FAVOR DE CREAR CUENTAS DE USUARIO PARA LOS SISTEMAS DE SU PUESTO, ASÍ COMO LAS CARTAS RESPONSIVAS PERTINENTES.				1	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
192	0	774	2015-02-16 14:06:53.225919-05	3	3	988	2015-01-15 12:50:00.317601-05	2014-11-13	2015-02-16	\N	SONVPLCW255	VIDEO PROYECTOR SONY WXGA 4500 CW255	PENDIENTE DE ESPECIFICAR	HM12570	0988822	DESPUÉS DE ESTAR CONECTADO A LA CORRIENTE ELÉCTRICA, EMPIEZA A SONAR EL ABANICO Y EL PROYECTOR SE APAGA. \r\nSI SE TRATA DE PRENDER NUEVAMENTE, NO ENCIENDE, SOLAMENTE EL LED DE ENCIENDE SE PONE COLOR NARANJA. 		NINGUNA	SE ENTREGA A CLIENTE EN SUS OFICINAS.\r\nCENTRO DE SERVICIO AUTORIZADO NO DETECTO PROBLEMA CON PROYECTOR.	2	2	1	WONG <1467>	f	\N	\N				S017009538	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-21	\N	\N	2015-02-16 14:06:53.225641-05	\N	\N		f	f	f	f	f	f	f	f	f	f
158	0	663	2015-02-04 10:11:08.546475-05	3	3	971	2015-01-07 17:11:47.229251-05	2014-04-04	2015-02-06	\N	HPE3T81LT	COMPUTADORA HP ALL ONE 205	NINGUNO	HM5525	0971441	REPORTANDO EQUIPO CON FALLA NO DA VIDEO		NINGUNA	SE ENTREGA  FUNCIONANDO CORRECTAMENTE EN LAS OFICINAS DEL CLIENTE.	2	2	1	HP <4745 0274 60> AIO 205	f	\N	\N				4CE4010B4F	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-08	\N	\N	2015-02-04 10:11:08.546109-05	\N	\N		f	f	f	f	f	f	f	f	f	f
122	0	663	2015-02-04 10:39:16.025726-05	3	3	952	2014-12-12 16:11:32.989758-05	2014-10-14	2015-01-13	\N	LENTM73Z	LENOVO THINKCENTRE M73Z	NO INCLUYE	HM11526	0952002	PROBLEMA CON AUDIO, NO RESPONDE A SONIDO NI MULTIMEDIA  NI  DE SISTEMA, SE INSTALO DRIVER Y SIGUE SIN SONIDO, PROBLEMA DE HADWARE		NINGUNA	SE CORRIGIÓ PROBLEMA DE AUDIO.\r\nCOMPUTADORA FUNCIONANDO CORRECTAMENTE. \r\nSE ENTREGA EQUIPO AL CLIENTE. 	2	2	1	LENOVO M73Z	f	\N	\N				SMJ01JK9A	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-12-12	\N	\N	2015-02-04 10:39:16.025444-05	\N	\N		f	f	f	f	f	f	f	f	f	f
261	2	\N	2015-04-16 19:53:27.521589-04	3	9	1180	2015-02-04 10:43:35.26387-05	\N	2015-03-06	\N					1180231	BUEN DÍA\r\n\r\n\r\nTZIRA ME PODRÍAS APOYAR CON LA BÚSQUEDA DE UN PROTECTOR DE PANTALLA, PARA MARCELA PARRA DE CRÉDITO Y COBRANZA.\r\n\r\nGRACIAS				1	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	t
127	0	818	2015-02-26 14:55:36.202755-05	3	4	955	2014-12-13 11:29:58.002948-05	2014-04-11	2015-01-13	\N	GHIANOTGHIA100	TABLET GHIA 10"	AUDIFONOS,CARGADOR.ODT,CALBE USB DATOS 	HM 5834	0955686	LINEA EN PANTALLA Y APARECE UNA LEYENDA AL ENTRAR A SISTEMA QUE DICE ERROR DE APLICACIÓN 		NINGUNA	Se entrega funcionando correctamente a Luis Enrique Gómez Felix.	2	2	1	Finalizada GHIA C29218P CVA <4929>	f	\N	\N				C29218P1311005691	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2014-12-15	\N	\N	2015-02-26 14:55:36.202472-05	\N	\N		f	f	f	f	f	f	f	f	f	f
269	1	675	2015-03-07 11:13:54.890639-05	37	4	1016	2015-02-06 16:51:54.850573-05	\N	2015-02-13	\N					1016704	La imagen que proyecta es muy tenue. 	Se detectan tornillos sueltos, cable plano		Servicio preventivo: $500 + IVA.	2	2	\N	HM15621,R10186	f	2	4		EPSON	EMP-S3	G7PG592166F	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		PROYECTOR	\N	1	\N	2015-03-07 11:13:54.890385-05	\N	\N	NINGUNO	f	f	f	f	f	f	f	f	f	f
263	1	209	2015-03-10 18:21:37.438557-04	37	29	1013	2015-02-04 12:21:29.95499-05	\N	2015-02-11	\N					1013003	DAR SERVICIO PREVENTIVO A IMPRESORA EN RENTA. \r\n			Servicio preventivo arrendamiento: $300.00 	2	2	\N	HM15714	f	1	3		SAMSUNG	SCX-6545N	 	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-03-10 18:21:37.438314-04	2015-02-04 21:00:00-05	2015-02-04 21:00:00-05		f	f	f	f	f	f	f	f	f	f
265	1	871	2015-02-09 11:10:04.397643-05	4	15	1015	2015-02-04 17:52:04.406787-05	\N	2015-02-11	\N					1015080	DIAGNOSTICAR.	Se reinstalo controlador para banda ancha USB. 	Ninguna.	Se desactivaron actualizaciones automáticas de Windows y reinstala controlador de banda ancha USB. Servicio Diagnostico: $150 + IVA	2	2	\N	R10189	f	2	1		HP	15-G010DX	CND4201226	f	f	f		NINGUNA	SIN CONTRASEÑA	f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-02-09 11:10:04.397379-05	\N	\N		f	f	f	f	f	f	f	f	f	f
266	2	\N	2015-04-16 19:53:51.234013-04	3	5	1181	2015-02-05 14:46:09.86303-05	\N	2015-03-09	\N					1181254	cuando se busca al cte que se registro en la pagina no aparece nada, no arroja informacion como si no estuviera registrado habiendo asi llegado un correo del registro del cte.\r\nel cte registrado es concepcion pacheco garcia de hermosillo.				1	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	t
258	2	\N	2015-04-20 18:05:19.637651-04	3	9	1177	2015-02-03 12:19:46.405114-05	\N	2015-02-06	\N					1177727	BUEN DÍA\r\n\r\nFAVOR DE HACER LAS CARTAS RESPONSIVAS DE EQUIPO Y MOBILIARIARIO, ASÍ COMO LAS CUENTAS DE SKY PE Y OUTLOOK A :\r\n\r\nDIEGO ALEJANDRO GARCÍA SAHAGÚN\r\nFECHA DE NAC. 25/06/1993\r\nDEPARTAMENTO: COMERCIALIZACIÓN, ESTARA EN LA MÁQUINA DE TONNER 2.0.\r\n\r\n\r\nGRACIAS\r\n		Ninguna. 	Cualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-20 18:05:19.637259-04	\N	\N		f	f	f	f	f	f	f	f	f	f
268	2	\N	2015-04-21 15:38:24.903163-04	3	9	1183	2015-02-05 18:16:10.496611-05	\N	2015-02-10	\N					1183983	BUENAS TARDES, EL PRESENTE ES PARA SOLICITAR LE SEAN CREADAS LAS CUENTAS DE OUTLOOK, SKYPE, ASI COMO CARTAS RESPONSIVAS CORRESPONDIENTES A:\r\n\r\nOMAR SAHID SARDO LOMELIN\r\n13-09-1973\r\n\r\nQUE ESTARÁ OCUPANDO EL PUESTO DE COORDINADOR DE RH.\r\n\r\nGRACIAS		Ninguna.	Cualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-21 15:38:24.902865-04	\N	\N		f	f	f	f	f	f	f	f	f	f
257	2	\N	2015-04-17 15:13:21.375393-04	3	9	1176	2015-02-03 12:16:50.840063-05	\N	2015-02-06	\N					1176393	BUEN DÍA\r\n\r\nFAVOR DE HACER REPOSICIÓN POR USO  DE TECLADOS A LAS SIGUIENTES PERSONAS:\r\n\r\nXOCHILT CÓRDOVA   (CONTABILIDAD)\r\nNUBIA VALENZUELA  ( CRÉDITO Y C)\r\nHORACIO MORALES   (COMPRAS)\r\n\r\n\r\nGRACIAS		NINGUNA	Reporte finalizado, cambios solicitados realizado.	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 15:13:21.375137-04	\N	\N		f	f	f	f	f	f	f	f	f	f
381	1	663	2015-04-20 17:27:16.814427-04	4	23	1061	2015-04-17 19:13:22.826869-04	\N	2015-04-24	\N					1061450	INSTALACIÓN DE MEMORIA KINKTLTC16S4G\r\n				2	2	\N	HM16760	f	3	2		LENOVO	THINK CENTRE M83 	SMJ022XGN	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-04-20 17:27:16.814152-04	2015-04-20 22:00:00-04	2015-04-21 22:00:00-04		f	f	f	f	f	f	f	f	f	f
383	0	852	2015-04-23 13:10:03.960915-04	14	14	1060	2015-04-21 16:00:10.906047-04	2014-12-11	2015-05-21	\N	GHIA27158B	TABKET GHIA 27154B	NINGUNO	R- 9640	1060685	NO ENCIENDE		ninguna	Se entrega equipo a Liliana funcionando correctamente.	2	2	1		f	\N	\N				C27158B1404028268	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-04-23	\N	\N	2015-04-23 13:10:03.960546-04	\N	\N		f	f	f	f	f	f	f	f	f	f
374	1	652	2015-04-23 15:32:54.426892-04	37	15	1059	2015-04-09 12:53:28.109183-04	\N	2015-04-16	\N					1059501	COTIZACION DE PIEZAS / SIN CARGADOR..			Se envió cotización a cliente por coordinador empresarial.	2	2	\N	COTIZACION	f	2	1		HP	ZBOOK	CNU41394TY	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-04-23 15:32:54.42667-04	\N	\N		f	f	f	f	f	f	f	f	f	f
144	0	842	2015-02-09 13:52:02.181791-05	3	15	964	2015-01-05 12:06:06.134849-05	2014-08-08	2015-02-04	\N	HPE7H63LA	PORTSTYIL COMPAQ CQ45-D00LA	CARGADOR, CABLE DE CORRIENTE	RM8226	0964206	EQUIPO SI ENCIENDE PERO PRESENTA UNAS RALLAS EN LA PANTALLA QUE CADA VEZ, APARECEN MAS RALLAS DE COLORES, EQUIPO FUNCIONA PERFECTAMENTE EL ÚNICO DETALLE ES EL DE LA PANTALLA.		NINGUNA	EQUIPO SE ENTREGA AL CLIENTE FUNCIONANDO CORRECTAMENTE.	2	2	1	reparada COMPAQ CQ45-D00LA	f	\N	\N				5CG3371CV4	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-15	\N	\N	2015-02-09 13:52:02.18153-05	\N	\N		f	f	f	f	f	f	f	f	f	f
313	1	818	2015-03-03 14:29:04.495175-05	36	36	1041	2015-03-03 14:24:12.215446-05	\N	2015-03-10	\N					1041215	Pantalla quebrada.\r\n\r\n\r\nFolio Anterior. (975)\r\nse cotizo en $500.00 la reparación \r\nDio de Anticipo $200.00\r\nResta $300.00				3	2	\N		f	1	4		GHIA	Tableta GHIA ANY 7" 27154B	C27154B1312007548	t	f	t				f	f	f	f	f	f	f	f		f	f		f		f	f		Tableta 	\N	1	\N	\N	\N	\N	1 Audifonos\r\n1 Cable de datos USB\r\n1 Cable ODT	f	f	f	f	f	f	f	f	f	f
179	0	336	2015-03-06 20:18:06.144185-05	3	3	981	2015-01-10 14:51:40.95598-05	2013-01-01	2015-02-10	\N	GUIA27154P	GHIA 7" 8G PLATEADA	SOLAMENTE CAJA ORIGINAL	PENDIENTE	0981658	DANIELA LEON.\r\nTOUCH CON MAL FUNCIONAMIENTO.\r\nSE ACTIVAN FUNCIONES SIN OPRIMIR EL TOUCH.		NINGUNA	NO PROCEDE GARANTIA	1	2	1	F GHIA C27158B 2106-2 dany	f	\N	\N				*27154P1309062062(1)06 o 27154P1309062062(4)06  	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-17	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
275	1	833	2015-02-28 11:20:13.371167-05	37	15	1017	2015-02-11 12:18:41.711148-05	\N	2015-02-18	\N					1017738	EL EQUIPO NO REINICIA SISTEMA OPERATIVO.	Se detecta ruido en disco duro, se reinstalo windows.	Ninguna.	***Batería dañada*** Se realizo servicio preventivo: $340.00 + IVA	2	2	\N	R10411	f	2	1		DELL	M5030	8CHS9N1	t	f	f		NINGUNA	SIN CONTRASEÑA	f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-02-28 11:20:13.37093-05	\N	\N		f	f	f	f	f	f	f	f	f	f
274	0	686	2015-03-18 14:49:34.906694-04	14	15	1014	2015-02-10 18:58:20.753477-05	2013-12-12	2015-03-12	\N	NOB011	NO BREAK MICROSR INET480VA BASIC	SN	HM1970	1014443	REINCIDENCIA DE FOLIO 997 / MISMA FALLA SE VUELVE A PRESENTAR		NINGUNA	SE ENTREGA FUNCIONANDO CORRECTAMENTEN EN EL DOMICILIO DEL CLIENTE.	2	2	1	ISB  INET480 6985	f	\N	\N				E13J16985	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-02-17	\N	\N	2015-03-18 14:49:34.906429-04	\N	\N		f	f	f	f	f	f	f	f	f	f
164	0	818	2015-02-21 13:53:50.096652-05	3	36	975	2015-01-07 18:49:06.224844-05	2014-07-10	2015-02-06	\N	GHIA27154B	TABLETA GHIA ANY 27154B 1GHZ 8GB BCO	CABLE DE CORRIENTE, AUDIFONOS, CABLE DE DATOS USB, ODT	HM 8527	0975441	PANTALLA QUEBRADA		NINGUNA	SE ENTREGA TABLETA A Luis Enrique Gómez Felix PORQUE SE REQUIERE ANTICIPO Y AUTORIZACION DE REPARACION POR PARTE DEL CLIENTE FINAL.\r\n	2	2	1	GHIA27154B anticipo reparacion	t	\N	\N				C27154B1312007548	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-08	\N	\N	2015-02-21 13:53:50.09638-05	\N	\N		f	f	f	f	f	f	f	f	f	f
285	1	705	2015-02-23 13:37:28.194083-05	15	15	1023	2015-02-16 16:56:51.904409-05	\N	2015-02-23	\N					1023829	DIAGNOSTICAR EL EQUIPO 				3	2	\N		f	2	4		SMART	PENDIENTE	PENDIENTE	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		PROYECTOR 	\N	2	\N	\N	2015-02-16 05:30:00-05	2015-02-16 06:00:00-05		t	f	f	t	f	f	f	f	f	f
303	1	893	2015-03-10 18:19:46.20403-04	37	18	1033	2015-02-24 13:50:47.430193-05	\N	2015-03-03	\N					1033454	FALLA AL COPIAR LA IMAGEN SE IMPRIME EN PARTES NO RECIBE DATOS AL MANDAR IMPRIMIR NO ESTA EN USO DESDE JUEVES 19 DE FEBRERO (NOTA:IMPRESORA ENPOLVADA ALGO MALTRATADA YCABLE DE CORRIENTE MALTRATADO ) 	Requiere servicio limpieza de inyectores.	Ninguna.	Se detectan inyectores sucios y tapados, cabezal (Negro/Amarillo: 88-C9381A) dañado y cartucho de tinta (Magenta:- 88XL - N/P: C9392A) vacio. Costo diagnostico: $150.00 +IVA  	2	2	\N	HM15737	f	2	3		HP	HPCB821A	MY8AA1233W	f	f	f				t	f	t	t	f	f	t	f		f	f		f		f	f			\N	1	\N	2015-03-10 18:19:46.203666-04	\N	\N		f	f	f	f	f	f	f	f	f	f
288	1	433	2015-02-17 17:09:03.310008-05	37	37	1024	2015-02-17 12:16:18.459872-05	\N	2015-02-24	\N					1024776	Equipo no inicia correctamente.		Ninguna.	Se restablece sesión de windows y configuración de cuenta Skype.	2	2	\N	NINGUNO	f	2	2		PENDIENTE	S/N	PENDIENTE	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-02-17 17:09:03.309781-05	2015-02-18 04:00:00-05	2015-02-18 04:00:00-05		f	f	f	f	f	f	f	f	f	f
246	2	\N	2015-05-26 13:55:33.973022-04	3	9	1171	2015-01-28 14:47:04.23873-05	\N	2015-02-02	\N					1171692	URGE REVISAR LA PC DE LA CASA DE LUZ, YA QUE TARDAR EN ENTRAR EL SISTEMA Y SE LES ESTA COMPLICANDO CHECAR LAS ASISTENCIAS.\r\n\r\n\r\nGRACIAS		NINGUNA	Cualquier duda o comentario quedo a sus órdenes. Saludos. Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250.\r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-05-26 13:55:33.972789-04	\N	\N		f	f	f	f	f	f	f	f	f	f
273	2	\N	2015-04-17 15:11:23.14484-04	3	41	1184	2015-02-10 17:19:13.544362-05	\N	2015-02-13	\N					1184522	Instalación de cuenta de correo, office, antivirus, ccleaner, y todo lo necesario para operar con las nuevas Laptop de Coordinadores Empresariales (Lillian Rivas, Nazli Coeto, Alfonso Rivas y Armando Félix)		Ninguna	Solicitudes realizadas, Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.\r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 15:11:23.144547-04	\N	\N		f	f	f	f	f	f	f	f	f	f
223	0	818	2015-02-26 14:56:12.387537-05	3	36	998	2015-01-22 17:35:47.523871-05	2014-12-11	2015-02-23	\N	GHIA27158B	TABLET GHIA ANY 7" 27158B ANDROID	Adaptador, Cable USB, Cable ODT, Audifonos.	REM 41	0998675	La pantalla se puso negra y no se ve nada		NINGUNA	Se entrega funcionando correctamente a Luis Enrique Gómez Felix.	2	2	1	Finalizada GHIA 27158B 1166 CVA <4921>	f	\N	\N				C27158B1404071166	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-29	\N	\N	2015-02-26 14:56:12.387239-05	\N	\N		f	f	f	f	f	f	f	f	f	f
272	0	645	2015-02-18 10:28:57.611243-05	3	19	1013	2015-02-09 19:22:50.879117-05	2014-12-01	2015-03-11	\N	HPC9723A	TONER HP 641A MAGENTA	No aplica	9473	1013062	NO SE DETECTA EL TONER				1	2	2		f	\N	\N				No aplica	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
271	0	327	2015-02-18 10:29:10.901432-05	3	19	1012	2015-02-09 19:00:07.906354-05	2014-10-13	2015-03-11	\N	HPCE285A	TONER HP 85A NEGRO	No aplica	11430	1012244	TONER MANCHA LAS HOJAS				1	2	2		f	\N	\N				No aplica	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
298	0	225	2015-02-24 12:13:16.615006-05	3	41	1020	2015-02-23 15:03:34.939823-05	2015-01-13	2015-03-25	\N	TARTBT053US	TARGUS MALETIN 15.6 CITYLITE NYLON	CORREA	HM14099	1020772	El maletín presente una cortada aparentemente de navaja (PLANTA CPP EN GUAYMAS, SONORA)				1	2	3	TARGUS MALETIN	f	\N	\N				NO APLICA	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-02-24	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
226	1	511	2015-03-17 17:29:29.12-04	1	15	1004	2015-01-23 18:57:35.287272-05	\N	2015-01-30	\N					1004308	RESPALDO DE INFORMACIÓN Y REINSTALACIÓN DE SISTEMA OPERATIVO	Dañado disco duro, teclado presenta fallas.Se coloca oc. CVA: 41514.	Disco duro WD 500GB 2.5" 7200RPM.	Reemplazo de disco duro y re instalación de sistema operativo. Disco duro: $1230+IVA; Servicio Correctivo: $500+IVA: Costo total reparación: $2006.80	2	2	\N	HM15347	f	2	1		HP	PAVILION DV5	CNU0220F2X	t	f	f		NO TIENE	SIN CONTRASEÑA	f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-03-17 17:29:29.119768-04	\N	\N		f	f	f	f	f	f	f	f	f	f
304	1	896	2015-02-26 18:50:06.770527-05	4	15	1034	2015-02-25 16:25:22.753727-05	\N	2015-03-04	\N					1034549	INSTALACION Y CONFIGURACION DE 5 EQUIPOS CON IMPRESORA EN RED.			SE REALIZO LA INSTALACION Y CONFIGURACION DE IMPRESORA EN 4 DE 5 EQUIPOS SOLICITADOS. SE PROCEDE A CIERRE DE REPORTE	2	2	\N	HM15284	f	3	3		HP	M521DN	CNB7F4T4MD	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-02-26 18:50:06.770219-05	2015-02-25 18:30:00-05	2015-02-25 20:00:00-05		t	f	f	t	f	f	f	f	f	f
213	0	818	2015-02-27 13:11:43.877147-05	36	36	995	2015-01-21 20:33:35.067191-05	2014-12-11	2015-02-22	\N	GHIA27158B	TABLET GHIA ANY 7" 27158B ANDROID	Adaptador, Cable USB, Cable ODT, Audifonos.	41	0995415	No entra al internet				1	2	1	GHIA 27158B 4204	f	\N	\N				C27158B1404064204	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-22	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
130	1	837	2015-02-27 18:20:47.216239-05	1	15	966	2014-12-16 18:09:43.119395-05	\N	2014-12-23	\N					0966198	COTIZAR TARJETA MADRE.	COSTO TOTAL DE REPARACIÓN $2500.00 EN ESPERA DE REEMPLAZO DE PIEZA, EL PROVEEDOR ENVIÓ UN NUMERO DE PARTE EQUIVOCADO.	Factura HM14493: Tarjeta madre Pavilion DV5-2000: $2100.00	Se realiza instalación de tarjeta madre, Costo servicio: $340.00 + IVA.	2	2	\N	HM15385	f	2	1		HP	DV5	CNU02239MQ	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-02-27 18:20:47.215948-05	\N	\N		f	f	f	f	f	f	f	f	f	f
307	1	91	2015-02-28 12:28:01.256265-05	4	4	1037	2015-02-27 13:11:38.354983-05	\N	2015-03-06	\N					1037196	MARCA ERROR AL MOMENTO DE INICIAS, CLIENTE SOLICITA DIAGNOSTICO Y SERVICIO PREVENTIVO		Kit de limpieza zebra zxp.	SE REALIZA SERVICIO PREVENTIVO Y PRUEBAS DE IMPRESIÓN CORROBORANDO EL CORRECTO FUNCIONAMIENTO DE EL EQUIPO.	2	2	\N	HM15124	f	3	3		ZEBRA	ZEBRA ZXP SERIES 3	Z3J111700516	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-02-28 12:28:01.255872-05	2015-02-28 01:00:00-05	2015-02-28 04:00:00-05		f	f	f	f	f	f	f	f	f	f
321	0	51	2015-03-25 19:01:27.020979-04	14	14	1027	2015-03-04 18:41:13.135314-05	2014-07-22	2015-04-03	\N	APPMF432EA	IPAD MINI WI.FI 16GB SPACE GRAY SPA	Por definir	HM8823	1027786	El equipo comenzó a temblar de la pantalla y a ponerse en color blancuzco				3	2	1		f	\N	\N				SF7RM2W9GFP84	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
311	1	860	2015-03-03 18:47:15.111276-05	37	37	1039	2015-03-02 16:41:39.254787-05	\N	2015-03-09	\N					1039828	AL ENCENDERLA NO INICIA SE QUEDA EL LOGO DELL QUE YA SE LA HABIAN CHECADO EN OTRA PARTE Y LE DIJERON QUE TENIAN QUE CARGARLE EL SISTEMA OPERATIVO.		R10421: Disco duro 1TB. Precio: $978.27 + IVA.\r\n	Se realiza restauración de sistema operativo y configuración. Costo servicio: $340 + IVA	2	2	\N	HM15505	f	1	1		DELL	Inspiron 11	4WWX1Y1	t	t	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-03-03 18:47:15.111045-05	\N	\N		f	f	f	f	f	f	f	f	f	f
315	0	828	2015-03-28 17:53:21.18388-04	8	8	1024	2015-03-03 17:47:13.014383-05	2014-08-21	2015-04-02	\N	HPF7W16LTBITDEF	HP 250G2 Ci3-3110M 15.6" 4GB 500GB DVD	BATERIA 	TJ1816	1024710	PROBLEMAS CON LA BATERIA.		NINGUNO		2	1	1	HP 250G2 02TJ <4650839500>	f	\N	\N				5CB42402TJ	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-03-05	\N	\N	2015-03-28 17:53:21.183551-04	\N	\N		f	f	f	f	f	f	f	f	f	f
314	1	4	2015-04-06 15:22:42.700378-04	37	42	1042	2015-03-03 14:32:46.343591-05	\N	2015-03-10	\N					1042260	cambiar pantalla, ya se pidió a G PARTS en OC 1480 (DIFUSA) Num part (GPS0060)	No. DE PARTE: B140XTT01.0	Pantalla 14.0 LED TOUCHSCREEN 1366x768 WXGA HD GLOSSY MARCA AU OPTRONICS	Se realiza instalación de pantalla en equipo portátil.	2	2	\N	HM16307	f	3	1		HP	E7H74LA	5CD3456Q7V	f	t	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-04-06 15:22:42.699947-04	\N	\N		f	f	f	f	f	f	f	f	f	f
306	1	624	2015-03-05 12:32:59.306733-05	37	24	1036	2015-02-25 21:34:13.413098-05	\N	2015-03-04	\N					1036101	IR A CASA DE ARTURO BAYARDO POR EL EQUIPO ALL IN ONE PARA QUE LO REVISEN POR QUE NO SIRVE EL AUDIO AUN.		Ninguna.	Se actualiza BIOS y controlador de audio.	2	2	\N	NO SE COBRA SERVICIO	f	3	2		ALL IN ONE 	SN	SN	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-03-05 12:32:59.30648-05	\N	\N		f	f	f	f	f	f	f	f	f	f
312	1	818	2015-04-09 13:21:51.993576-04	37	36	1040	2015-03-03 14:24:10.307126-05	\N	2015-03-10	\N					1040654	Pantalla quebrada.\r\n\r\n\r\nFolio Anterior. (975)\r\nse cotizo en $500.00 la reparación \r\nDio de Anticipo $200.00\r\nResta $300.00		Display Tablet Guia 7"	Se realizo la reparación de pantalla con proveedor. Costo servicio $500.00	2	2	\N	HM16421	f	1	4		GHIA	Tableta GHIA ANY 7" 27154B	C27154B1312007548	t	f	t				f	f	f	f	f	f	f	f		f	f		f		f	f		Tableta 	\N	1	\N	2015-04-09 13:21:51.993011-04	\N	\N	1 Audifonos\r\n1 Cable de datos USB\r\n1 Cable ODT	f	f	f	f	f	f	f	f	f	f
318	0	883	2015-03-11 12:40:50.141997-04	3	14	1026	2015-03-03 18:47:05.673123-05	2014-01-21	2015-04-02	\N	HPD8D46LT	HP 1155	Por definir	HM3004	1026266	no arranca el sistema y no permite restauración de sistema\r\n\r\nNOTA:  le informo que necesito hacer respaldo de la información\r\n		NINGUNA	Se le reinstala el sistema y se realiza el respaldo. 	2	2	1	HP 1155 09F7	f	\N	\N				5CM33009F7	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-03-05	\N	\N	2015-03-11 12:40:50.141702-04	\N	\N		f	f	f	f	f	f	f	f	f	f
302	1	4	2015-03-05 18:49:15.045512-05	37	3	1032	2015-02-24 12:52:07.754688-05	\N	2015-03-03	\N					1032233	IMAGEN EN PANTALLA BORROSA.\r\nCOMPRA: LIVERPOOL HERMOSILLO.\r\nDOCTO: 1813\r\n27 DE ENERO DEL 2015.	01-800-474-68368 OPCIÓN 1 Y 3. FOLIO SERVICIO HP: 4002215438. Caso: 3013083458	Pantalla.	Se realiza el proceso de garantía con fabricante. Costo Servicio con (50% DIFUSA): $170 + IVA.	2	2	\N	HM15570	f	2	4		HP	7 G2	8CA44709Q0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		TABLET	\N	1	\N	2015-03-05 18:49:15.04492-05	\N	\N	CAJA, POLIZA DE GARANTIA, SIN CARGADOR Y COPIA DE TICKET.	f	f	f	f	f	f	f	f	f	f
293	0	4	2015-03-05 18:51:19.519389-05	14	42	1019	2015-02-18 20:30:45.775185-05	2015-01-27	2015-03-22	\N	J4Y29AA	TABLET HP 7 G2	NO APLICA	1813	1019030	IMAGEN EN PANTALLA BORROSA		ninguna	Se le cambia pantalla y se le reinstala el sistema.	2	2	1	TABLET HP 7 G2	f	\N	\N				8CA44709Q0	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-02-25	\N	\N	2015-03-05 18:51:19.519088-05	\N	\N		f	f	f	f	f	f	f	f	f	f
326	2	\N	2015-04-21 12:11:53.523947-04	3	9	1193	2015-03-06 12:07:48.981389-05	\N	2015-03-11	\N					1193665	FAVOR DE CREAR CUENTAS Y CARTAS RESPONSIVAS CORRESPONDIENTES A SU PUESTO A ANGELES ESTEFANIA FIMBRES HERALDEZ, FECHA DE NACIMIENTO 02AGO1990.		Ninguna	Cualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-21 12:11:53.523613-04	\N	\N		f	f	f	f	f	f	f	f	f	f
322	2	\N	2015-04-17 15:39:01.461944-04	3	22	1191	2015-03-05 10:20:11.806031-05	\N	2015-04-06	\N					1191668	Mi equipo Lenovo se comportaba lento e hice un  respaldo de mi información y reinstale Windows 7 Pro x64 porque creí que se trataba del sistema operativo. Después de instalar y configurar todos los programas, mi equipo se comporta mas lento y se cicla mas frecuentemente. Pienso yo que es el disco duro y que después de reinstalar Windows, parte del sistema operativo quedo en sectores dañados del disco duro y por eso se cicla mas frecuentemente.				1	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	t
328	0	818	2015-03-06 13:37:44.428567-05	36	36	1029	2015-03-06 13:37:44.408912-05	2015-02-12	2015-04-07	\N	VAMREFTSSL, VAMLEDVL001, VAMVB02016, VAMVB02024, VAMVB02024	Varios	00	Req. 49 y 51	1029759	-(2 PZ. VAMREFTSSL): No agarra la memoria.\r\n-(2 PZ. VAMLEDVL001): Se trava al girar.\r\n-(9 PZ. VAMVB02016): Trae piezas suletas, No prenden).\r\n-(2 PZ. VAMVB02024): Piezas Sueltas.\r\n-(1 PZ. VAMVB02020): No prende.				0	2	1		f	\N	\N				Varios	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
245	0	818	2015-05-18 12:48:38.753947-04	14	3	1005	2015-01-28 14:41:59.070216-05	2014-12-01	2015-02-27	\N	GHIA27218B	TABLET GHIA 2721B GIRL ROSA	1 CABLE OTG, 1 ELIMINADOR DE CORRIENTE, 1 MANUAL DE USUARIO, 1 CABLE USB.	PENDIENTE	1005455	NO CARGA.\r\nPRESENTA BOTONES HUNDIDOS (ENCENDIDO Y VOLUMEN).		NINGUNA	Se detectan fallas en el cargador y se reemplaza con uno que funciona correctamente.	2	2	1	GHIA 27218B 0159 <4923>	f	\N	\N				C27218B 1404000159	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-02-03	\N	\N	2015-05-18 12:48:38.753352-04	\N	\N		f	f	f	f	f	f	f	f	f	f
129	0	103	2015-03-06 14:43:39.78221-05	3	24	956	2014-12-15 10:59:46.517437-05	2014-08-21	2015-01-14	\N	SKTX629C	CONTROL DE ASISTENCIA X629C	CABLE DE CORRIENTE	HM9757	0956614	NO DETECTA NINGUN CABLE DE RED	Guía 01134446208 paquetexpress\r\nMicro click\r\n(81) 83479802 \r\n01 800 90 25425	Folio: 10 194.	Se entrego funcionando correctamente al cliente	2	2	1	 X629C Espera de retorno.	f	\N	\N				0335141500959	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-05	\N	\N	2015-03-06 14:43:39.781939-05	\N	\N		f	f	f	f	f	f	f	f	f	f
186	1	231	2015-03-09 11:09:01.524089-04	37	35	990	2015-01-14 19:14:23.965837-05	\N	2015-01-21	\N					0990162	se requiere diagnostico. Centro de gobierno, segundo piso, contraloria General. Edificio Hermosillo	Se diagnosticó en sitio la impresora que presentaba falla en el recolector. Pablo Ortiz comento que él le quito el recolector y se lo volvió a poner, pero ya no realizo más pruebas y dejo apagada la impresora. Al encender la impresora esta comenzó a imprimir los documentos que estaban la cola de impresión; El error ya no se presentó.			2	2	\N	HM15657	f	2	3		hp	LASERJET 500	NA	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-03-09 11:09:01.523779-04	2015-01-16 04:00:00-05	2015-01-15 17:00:00-05		t	f	f	t	f	f	f	f	f	f
334	0	883	2015-03-13 17:06:24.021428-04	14	14	1034	2015-03-10 13:51:07.950949-04	2014-03-19	2015-04-09	\N	HPE3T81LT	HP 205 G1	POR DEFINIR	4897	1034007	LA COMPUTADORA TIENE FALLA EN PANTALLA, NO MUESTRA VIDEO, AL PARECER ESTA DAÑADA	Nos van a enviar técnico de HP a reparar el equipo.	Ninguna	El técnico de HP le cambia la tarjeta madre al equipo y se deja funcionando correctamente.	2	2	1	HP 205 09WR <4650877681>	f	\N	\N				4CE40109WR	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-03-10	\N	\N	2015-03-13 17:06:24.021096-04	\N	\N		f	f	f	f	f	f	f	f	f	f
187	0	818	2015-03-09 11:59:52.54755-04	14	36	983	2015-01-14 19:22:01.225502-05	2014-12-11	2015-02-15	\N	ACTLKAC001	TABLET ACTECK MVTA-023 7 DC 512MB/8GB	ADAPTADOR DE CORRIENTE, CABLE USB, CABLE ODT	REM 41	0983111	NO FUNCIONA EL TOUCH			Se entrega funcionando correctamente a Luis Enrique Gómez Felix.	2	2	1	ACTECK MVTA-023 	f	\N	\N				970791019159	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-17	\N	\N	2015-03-09 11:59:52.547282-04	\N	\N		f	f	f	f	f	f	f	f	f	f
162	0	818	2015-03-09 12:01:04.530303-04	14	36	973	2015-01-07 18:13:41.911538-05	2015-01-11	2015-02-06	\N	ACMVTA023	TABLET ACTECK MVTA-023 7 DC 512MB/8GB	CABLE DE CORRIENTE, CABLE DE DATOS, ADAPTADOR, ODT	41	0973593	PRESENTA ERROR DE SISTEMA AL DESCARGAR APLICACIONES.		NINGUNA	Se entrega funcionando correctamente a Luis Enrique Gómez Felix.	2	2	1	ACTECK MVTA-023 	f	\N	\N				970791012555	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-08	\N	\N	2015-03-09 12:01:04.53005-04	\N	\N		f	f	f	f	f	f	f	f	f	f
211	0	697	2015-03-10 14:00:35.396778-04	14	35	994	2015-01-21 16:51:25.910559-05	2013-08-05	2015-02-20	\N	EVOPM1H00000RD	IMPRESORA CREDENCIALES EVOLIS PRIMACY	NA	H24388	0994520	REVISAR...		Ninguna	el equipo ha mostrado fallas por falta de mantenimiento	2	2	1	RE EVOLIS	f	\N	\N				PF00076510000287983	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-22	\N	\N	2015-03-10 14:00:35.396453-04	\N	\N		f	f	f	f	f	f	f	f	f	f
331	1	231	2015-03-09 20:25:24.694605-04	37	23	1046	2015-03-07 13:44:38.10194-05	\N	2015-03-13	\N					1046539	instalacion y mano de obra de una unidad recolectora CE254A para impresora laserjet M551dn.		Consumible: HP Recolectora CP3525	Se realiza instalación de unidad recolectora.	2	2	\N	HM15657	f	3	3		HP	m551dn	XXXXXXXXXXXXXXXXXXX	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-03-09 20:25:24.694376-04	2015-03-10 05:00:00-04	2015-03-10 05:00:00-04		f	f	f	f	f	f	f	f	f	f
57	1	613	2015-03-10 11:06:35.247206-04	37	1	925	2014-11-14 13:13:31.834858-05	\N	2014-11-21	\N					0925836	COTIZACION DE  MANTENIMIENTO IMPRESORAS	VARIOS EQUIPOS, Y SE REQUIERE PIEZA PARA EL SERVICIO		Servicio Preventivo: $1508.00 IVA incluido.	2	2	\N	HM15705	f	2	3		VARIOS	VARIOS	VARIOS	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-03-10 11:06:35.246971-04	2014-11-15 17:29:00-05	2014-11-15 18:40:00-05		f	f	f	f	f	f	f	f	f	f
338	0	818	2015-03-28 16:08:30.844233-04	14	36	1038	2015-03-10 21:48:52.87041-04	2014-12-19	2015-04-09	\N	GHIA27158N	TABLET GHIA NY KIDS 27158N, 7", NARANJA	1 Adaptador de energia, 1 Cable USB, 1 Manual de usuario	45	1038845	NO ENTRA AL MENU		ninguna	se le reinstala el sistema	2	2	1		f	\N	\N				C27158B1404006798	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-03-26	\N	\N	2015-03-28 16:08:30.843901-04	\N	\N		f	f	f	f	f	f	f	f	f	f
336	0	818	2015-04-10 14:53:11.378184-04	14	36	1036	2015-03-10 20:30:39.272937-04	2015-01-11	2015-04-09	\N	ACMVTA023	TABLET ACTECK MVTA-023 7 DC 512MB/8GB	1 Adaptador de energia, 1 Cable USB, 1 Cable OTG.	41	1036998	PRESENTA ERROR DE SISTEMA AL DESCARGAR APLICACIONES. SE MANDO A GARANTÍA Y REGRESO CON EL MISMO PROBLEMA (FOLIO ANTERIOR 973)		ninguna	Se le Borran cookies de google play y el equipo queda listo para usarse.	2	2	1	ACTECK MVTA-023 7 <2555>	f	\N	\N				970791012555	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-03-18	\N	\N	2015-04-10 14:53:11.377825-04	\N	\N		f	f	f	f	f	f	f	f	f	f
332	0	868	2015-05-04 14:11:19.002207-04	8	8	1032	2015-03-09 19:50:14.470241-04	2014-11-14	2015-04-08	\N	HPCE993A	IMPRESORA HP LASERJET M602X	Cable y charola.	TJ2442	1032729	Hace mucho ruido la unidad dúplex.				2	1	1	HP M602X X1JT <0630583022>	f	\N	\N				CNDCGBX1JT 	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-03-10	\N	\N	2015-05-04 14:11:19.001953-04	\N	\N		f	f	f	f	f	f	f	f	f	f
337	0	818	2015-04-10 14:52:40.495789-04	14	36	1037	2015-03-10 20:59:35.52156-04	2014-09-19	2015-04-09	\N	GHIA27154P	TABLETA GHIA ANY 27154P 1GHZ 8GB GRIS	1 Cable de corriente, 1 Manual de usuario	HM10641	1037847	NO ENTRA AL MENU Y TIENE FALLA AL CONECTAR EL CABLE DE CORRIENTE.		ninguna		2	2	1	TABLETA GHIA ANY 27154P 1GHZ 8GB GRIS <5075>	f	\N	\N				C27154P1401060308	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-04-06	\N	\N	2015-04-10 14:52:40.495437-04	\N	\N		f	f	f	f	f	f	f	f	f	f
368	1	37	2015-04-13 16:02:42.374843-04	37	15	1057	2015-04-07 14:25:22.360616-04	\N	2015-04-14	\N					1057317	Diagnostico de equipo no inicia correctamente. gburgos@gdi.com.mx		Ninguna.	Se diagnostica problema en disco duro dañado, no fue posible extraer información. Costo servicio diagnostico $150.00 + IVA.	2	2	\N	HM16469	f	2	1		HP	435	5CB2094DLQ	f	t	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-04-13 16:02:42.374399-04	\N	\N		f	f	f	f	f	f	f	f	f	f
367	1	37	2015-04-13 16:03:31.392566-04	37	15	1056	2015-04-07 14:21:20.455933-04	\N	2015-04-14	\N					1056749	Se requiere realizar servicio preventivo, respaldo y configurar sistema operativo.		Ninguna.	Cliente indica no configurar correo electrónico "Outlook", se agrega archivo de datos y correos anteriores. Costo servicio preventivo $340.00 + IVA; Costo Servicio correctivo $200.00 + IVA.	2	2	\N	HM16543	f	1	1		HP	Probook 4430s	CNU2093FRW	t	t	f			"compras19"	f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-04-13 16:03:31.39218-04	\N	\N		f	f	f	f	f	f	f	f	f	f
335	0	883	2015-03-13 17:05:53.311016-04	14	3	1035	2015-03-10 15:27:13.530132-04	2014-06-04	2015-04-09	\N	HPE3T81LT	COMPUTADORA HP ALL IN ONE 205	PENDIENTE DE ESPECIFICAR	HM7283	1035147	El equipo no arranca ni por el disco duro, ni por  el cd/dvd\r\n\r\nError:\r\nNo se ha encontrado nigún dispositivo de arranque\r\n\r\nInstale un sistema operativo en su disco duro\r\nDisco duro (3FO)\r\nF2  Diagnostico del sistema\r\n\r\nAtte\r\n\r\nJulio César Flores Guajardo\r\n	COMPRAS ####\r\n27/05/2014\r\n	NINGUNA	Se reinstala el sistema operativo.	2	2	1	HP 205 0DRZ 	f	\N	\N				4CE4020DRZ	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-03-11	\N	\N	2015-03-13 17:05:53.310567-04	\N	\N		f	f	f	f	f	f	f	f	f	f
325	1	26	2015-03-11 19:11:22.156364-04	37	4	1045	2015-03-05 18:12:22.838474-05	\N	2015-03-12	\N					1045036	SERVICIO PREVENTIVO Y CORRECTIVO 3 IMPRESORAS MARCA HP Y ZEBRA.			LASERJET HP 9040 MFP\t$1000,00\r\nHP LASERJET  4345 MFP\t$700,00\r\nIMPRESORA ETIQUETAS ZEBRA\t$800,00\r\n	2	2	\N	HM15767	f	1	3		VARIOS	VARIOS	VARIOS	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-03-11 19:11:22.156135-04	2015-03-06 18:00:00-05	2015-03-05 10:00:00-05		t	f	f	f	f	f	f	f	f	f
329	0	4	2015-04-16 11:59:24.786279-04	14	42	1030	2015-03-06 20:30:40.337808-05	2015-01-10	2015-04-06	\N	F4G87LA	HP PAVILION	NO APLICA	9829718980761107475257	1030437	LINEA EN PANTALLA		ninguna	Se cambia pantalla y el equipo queda listo.	2	2	1	HP PAVILION <3013666841>	t	\N	\N				5CD40441DD	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-03-11	\N	\N	2015-04-16 11:59:24.785787-04	\N	\N		f	f	f	f	f	f	f	f	f	f
379	0	627	2015-04-16 13:01:59.916385-04	19	19	1058	2015-04-16 13:01:59.891639-04	2015-03-23	2015-05-18	\N	HPCE390XC	TONCER CE390X NEGRO CONTRACT	No aplica	10594	1058146	son dos toners de los cuales 1 imprime punteado y el otro toner no es detectado				0	2	2		f	\N	\N				No aplica	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
333	0	4	2015-03-23 14:24:50.948088-04	14	42	1033	2015-03-10 13:48:54.298508-04	2014-10-31	2015-04-09	\N	E3T63LT	AIO ELITE 800	FUENTE	H1634	1033826	PROGRAMAS QUE SE UTILIZAN REGULARMENTE CON LICENCIA ORIGINAL SE CIERRAN, SOLAMENTE ACEPTA VERSIONES DE PRUEBA, EL EQUIPO ANTERIORMENTE PRESENTO PROBLEMAS CON RED.			Se cambia disco duro dañado por uno en buenas condiciones y se le reinstala el sistema, se deja equipo funcionando correctamente.	2	2	1	ELITE 800	f	\N	\N				MXL4090BQ1	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-03-13	\N	\N	2015-03-23 14:24:50.947709-04	\N	\N		f	f	f	f	f	f	f	f	f	f
341	0	303	2015-03-11 14:27:18.286154-04	14	14	1039	2015-03-11 12:06:58.159406-04	2015-03-02	2015-04-10	\N	HBJNJKM	JKKJ,LÑ.	JJJJJJJJJJJJJJJJJJJJJJJJJ	788990	1039057	HNMKOJ,LÑ-				3	2	1		f	\N	\N				KM ÑL.LÑ	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
215	2	\N	2015-03-12 17:28:51.978228-04	3	9	1161	2015-01-22 11:11:35.882815-05	\N	2015-01-27	\N					1161782	BUEN DIA\r\n\r\nLE PRESENTE ES PARA SOLICITAR CARTA RESPONSIVA DE LA PORTÁTIL DE ALEJANDRO PÉREZ.\r\n\r\nY A LA VEZ REPORTAR QUE LA CUENTA OUTLOOK NO QUEDO BIEN CONFIGURADA EN LA PORTÁTIL.		NINGUNA	Cualquier duda o comentario quedo a sus órdenes.\r\nSaludos.\r\nTzirahuén Martínez \r\nDepartamento Soporte Técnico\r\nOficina (662) 214 2200 ext. 250.\r\nCelular (662) 229 3979 Directo 2113.	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-03-12 17:28:51.977891-04	\N	\N		f	f	f	f	f	f	f	f	f	f
181	1	87	2015-03-24 19:11:19.879277-04	37	29	986	2015-01-13 13:02:44.838507-05	\N	2015-01-20	\N					0986009	FAVOR DE IR A AGENCIA FISCAL CUM HERMOSILLO A CHECAR UNA IMPRESORA P3015DN DE ARRENDAMIENTO YA QUE NO CUENTA CON USB, NO SE SI LO QUEBRARON  O QUE PASO,. PERO HAY QUE IR A CHECAR Y TRAERLA APRA REPARACION,.	Se recibió equipo sin toner y sin puerto usb.		Equipo no entra en garantía.	2	2	\N	COMODATO	f	1	3		HP	P3015DN	VNB3R51414	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-03-24 19:11:19.879024-04	2015-01-14 18:00:00-05	2015-01-14 18:00:00-05		f	f	f	f	f	f	f	f	f	f
344	0	883	2015-04-23 18:40:37.323868-04	14	14	1040	2015-03-17 13:05:16.032949-04	2014-03-19	2015-04-16	\N	HPE3T81LT	HP 205 G1	POR DEFINIR	4897	1040919	El equipo no emite audio			se asigna caso 4650984982.	2	2	1	HP 205 G1 <4650984982>	f	\N	\N				4CE40109WR	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-03-23	\N	\N	2015-04-23 18:40:37.323382-04	\N	\N		f	f	f	f	f	f	f	f	f	f
357	1	142	2015-03-24 18:13:48.001097-04	37	4	1053	2015-03-23 12:24:46.689826-04	\N	2015-03-30	\N					1053109	CONFIGURACIÓN DE CONMUTADOR			Se realizo configuración de conmutador en sitio. Costo servicio: $400.00 +IVA	2	2	\N	HM16088	f	1	4		STEREN	STEREN	STEREN	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		CONMUTADOR 	\N	2	\N	2015-03-24 18:13:48.000759-04	2015-03-24 05:00:00-04	2015-03-24 03:00:00-04	NINGUNO	f	f	f	f	f	f	f	f	f	f
343	1	907	2015-03-17 17:38:31.077093-04	4	15	1049	2015-03-12 18:47:43.497006-04	\N	2015-03-19	\N					1049701	falla de impresion diagnostico				2	2	\N	CANCELADO	f	2	3		HP	Q6455A	CNGC66N0NK	f	f	f				t	t	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-03-17 17:38:31.0768-04	\N	\N		f	f	f	f	f	f	f	f	f	f
355	1	304	2015-03-26 15:32:48.767381-04	4	29	1052	2015-03-21 12:22:28.132983-04	\N	2015-03-27	\N					1052867	servicio preventivo a imresoras de renta, en vado del rio y col. las quintas.. CFE,. 				2	2	\N	R10123	f	1	3		SAMSUNG	SCX-6545N	 VARIOS	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-03-26 15:32:48.767143-04	2015-03-21 18:00:00-04	2015-03-21 11:00:00-04		f	f	f	f	f	f	f	f	f	f
352	0	728	2015-05-05 17:32:34.743267-04	14	14	1044	2015-03-20 14:23:04.347478-04	2014-09-05	2015-04-21	\N	GRAGXP1405	TELEFONO DIGITAL DUAL SWITCH 10/100 MB	CONMUTADOR BOCINA, CABLE, FUENTE, SOPORTES	HM10301	1044076	NO ENCIENDE 		Ninguna.	Se cambia equipo con numero de serie: 20EYXQZDC05CD120, por uno nuevo con numero de serie: 22MT6XFEA06FC8D9.	2	2	1	TELEFONO DIGITAL	f	\N	\N				20EYXQZDC05CD120	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-04-10	\N	\N	2015-05-05 17:32:34.742969-04	\N	\N		f	f	f	f	f	f	f	f	f	f
345	0	757	2015-03-26 12:18:39.821303-04	14	14	1041	2015-03-17 17:20:48.966372-04	2014-06-05	2015-04-16	\N	HPQZ711AV	Compaq Pro 6305	POR DEFINIR	7308	1041519	Algunas veces prende pero no da video, y otras veces no prende				2	2	1	Compaq Pro 6305 <4650959888>	f	\N	\N				MXL4202C50	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-03-17	\N	\N	2015-03-26 12:18:39.820958-04	\N	\N		f	f	f	f	f	f	f	f	f	f
346	0	757	2015-03-26 12:19:04.225812-04	14	14	1042	2015-03-17 17:23:22.930664-04	2014-06-05	2015-04-16	\N	HPQZ711AV	Compaq Pro 6305	Por definir	7308	1042731	Algunas veces prende pero no da video, y otras veces no prende				2	2	1	Compaq Pro 6305	f	\N	\N				MXL4202C4C	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-03-17	\N	\N	2015-03-26 12:19:04.225547-04	\N	\N		f	f	f	f	f	f	f	f	f	f
347	1	757	2015-03-27 20:12:44.130676-04	4	35	1050	2015-03-17 17:56:37.917883-04	\N	2015-03-24	\N					1050510	TIENE HOJAS ATORADAS	SE LE RECORDÓ A VENDEDOR Y NOS COMENTA QUE SIGUE EN ESPERA DE LA AUTORIZACIÓN DE FACTURA.			2	2	\N	HM16247	f	2	3		XEROX	PHASER 7500	NA	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-03-27 20:12:44.130259-04	2015-03-18 03:00:00-04	2015-03-18 04:00:00-04		t	f	f	f	f	f	f	f	f	f
349	1	663	2015-03-20 13:52:58.487882-04	4	23	1051	2015-03-19 13:57:49.310791-04	\N	2015-03-26	\N					1051543	INSTALACION DE TARJETA DE VIDEO PNYGT630 2GB			Servicio instalación periférico, Costo:$200 + IVA	2	2	\N	HM16016	f	2	2		LENOVO	THINKCENTRE M93P	SMJ023Z8J	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-03-20 13:52:58.487569-04	\N	\N		f	f	f	f	f	f	f	f	f	f
369	0	4	2015-04-16 17:37:38.679468-04	14	42	1053	2015-04-07 21:54:19.130985-04	2014-02-24	2015-05-07	\N	A7F64A	IMPRESORA AIO HP 8610	NO APLICA	H2168	1053763	TAPADERA DE CAMA DE ESCANER SE TRABA AL BAJAR			Se realiza cambio físico del equipo.\r\nSe entrega nuevo funcionando correctamente.	2	2	1	AIO HP 8610 <4002456522>	f	\N	\N				CN474CW0FW	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-04-08	\N	\N	2015-04-16 17:37:38.679167-04	\N	\N		f	f	f	f	f	f	f	f	f	f
421	0	868	2015-05-11 17:44:26.539099-04	14	8	1081	2015-05-07 12:09:24.304057-04	2014-11-14	2015-06-08	\N	HPCE993A	IMPRESORA HP LASERJET M602X	CABLE	TJ2442	1081116	Atora el papel en el fusor. 				1	1	1		f	\N	\N				CNCCFB007K	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
358	0	883	2015-04-07 18:06:34.614641-04	14	14	1047	2015-03-23 14:06:04.57434-04	2014-01-21	2015-04-22	\N	HPD8D46LT	HP 1155	Por definir	3004	1047378	FALLÓ PRUEBA. sE RECOMIENDA REMPLAZO DE UNIDAD\r\ncODIGO DE TERMINACIÓN :7\r\nERROR EN HDD		Ninguna		2	2	1	 HP 1155 <4651010091>	f	\N	\N				5CM33104DY	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-03-25	\N	\N	2015-04-07 18:06:34.614172-04	\N	\N		f	f	f	f	f	f	f	f	f	f
354	0	818	2015-04-10 14:52:56.577356-04	14	36	1045	2015-03-20 22:01:51.821497-04	2014-12-19	2015-04-20	\N	GHIA27158N	TABLET GHIA ANY KIDS 27158N, 7", NARANJA	1 Adaptador de energia, 1 Cable USB	REM 45	1045948	No carga, esta fallando el conector de la tablet		ninguna		2	2	1	TABLET GHIA ANY KIDS 27158N, 7", NARANJA <5076>	f	\N	\N				C27158N1404002516	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-04-06	\N	\N	2015-04-10 14:52:56.57701-04	\N	\N		f	f	f	f	f	f	f	f	f	f
356	0	911	2015-04-06 13:27:32.879307-04	14	14	1046	2015-03-21 15:51:18.404053-04	2015-01-09	2015-04-21	\N	PC082699	MOCHILA PERFECT CHOICE	N/A	REM 9944	1046858	 costuras corridas		ninguna		2	2	1	MOCHILA PERFECT CHOICE  <J5914 >	f	\N	\N				S/N	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-03-23	\N	\N	2015-04-06 13:27:32.878927-04	\N	\N		f	f	f	f	f	f	f	f	f	f
342	1	907	2015-04-10 14:09:44.638375-04	37	15	1048	2015-03-12 14:14:16.190549-04	\N	2015-03-19	\N					1048267	el cliente necesita cablear correctamente sus equipos/ instalacion de proyector y renovacion de CPU			Cliente no autoriza la instalación de equipos ya que se encuentre en remodelación interna de oficinas.	2	2	\N	NINGUNO	f	2	4		VARIOS	OTROS	210590	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-04-10 14:09:44.63796-04	2015-03-12 22:00:00-04	2015-03-12 22:00:00-04	LEVANTAMIENTO	f	f	f	f	f	f	f	f	f	f
229	2	\N	2015-04-17 15:03:46.280312-04	3	40	1165	2015-01-26 12:22:17.242422-05	\N	2015-01-29	\N					1165783	buen día:\r\nSE REALIZA PROCESO DE RECLUTAMIENTO PARA LA CONTRATACION DE DOS COORDINADORES DE VENTA, POR LO QUE SOLICITA 2 EQUIPOS PORTATILES PARA ELLOS, YA QUE ES NECESARIO TENERLOS ANTES DE SU CONTRATACION. SALUDOS Y GRACIAS.		ninguna	El nuevo personal esta trabajando sus respectivos equipos. 	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 15:03:46.279932-04	\N	\N		f	f	f	f	f	f	f	f	f	f
182	2	\N	2015-04-17 15:19:21.134058-04	3	11	1154	2015-01-13 13:18:18.991731-05	\N	2015-01-16	\N					1154286	\r\nBuen día,\r\nal entrar al administrador de la pagina de HP me aparece esto en la pantalla.		Ninguna.	Solicitud realizada. 	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 15:19:21.133655-04	\N	\N		f	f	f	f	f	f	f	f	f	f
350	0	883	2015-04-20 11:13:07.401196-04	14	14	1043	2015-03-19 14:59:28.920068-04	2014-09-22	2015-04-20	\N	LEN10BD004FLS	LENOVO E73Z	Por definir	10694	1043610	El disco duro esta dañado		NINGUNA	Se le reemplaza disco duro dañado por uno funcionando correctamente.\r\n\r\nSe le reinstala el sistema y el equipo queda listo.	2	2	1	LENOVO E73Z <302MD3D>	f	\N	\N				S1002SXQ	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-03-23	\N	\N	2015-04-20 11:13:07.40053-04	\N	\N		f	f	f	f	f	f	f	f	f	f
370	0	4	2015-04-24 19:37:59.298042-04	14	42	1054	2015-04-07 21:59:57.149675-04	2014-11-29	2015-05-07	\N	PSKRJM	TOSHIBA SATELLITE	CARGADOR	133	1054174	FALLA EN DISCO DURO		ninguna	se reinstala el sistema y el equipo llega funcionando correctamente.	2	2	1	TOSHIBA SATELLITE <100415-5> factura 16944	t	\N	\N				XE086415S	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-04-08	\N	\N	2015-04-24 19:37:59.29769-04	\N	\N		f	f	f	f	f	f	f	f	f	f
319	2	\N	2015-04-17 15:06:43.560302-04	3	21	1190	2015-03-04 18:10:28.868216-05	\N	2015-03-09	\N					1190600	El teléfono de oficina no tiene línea.\r\n\r\nEn la pantalla sólo indica "Verif. Línea".		Ninguna	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.\r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 15:06:43.559957-04	\N	\N		f	f	f	f	f	f	f	f	f	f
320	1	728	2015-03-23 19:28:59.75995-04	37	41	1044	2015-03-04 18:16:45.72859-05	\N	2015-03-11	\N					1044236	se les va a dar mantenimiento preventivo a laptop y computadoras de escritorio del cliente. no se han reportado fallas en los equipos.			Costo servicio: $6310 + IVA	2	2	\N	HM16081	f	1	1		VARIAS	VARIOS	VARIOS	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-03-23 19:28:59.759671-04	2015-03-09 22:00:00-04	2015-03-12 22:00:00-04		t	f	t	f	f	f	f	f	f	f
348	2	\N	2015-04-17 12:50:55.8662-04	3	32	1196	2015-03-18 14:41:59.999774-04	\N	2015-03-23	\N					1196955	HOLA, de nuevo tengo problemas con el multi x476 atasca las hojas, imprime descuadrado, las hojas tiene gotas de tinta. ya tengo un folio abierto con anterioridad y aun sigo con problemas.\r\n		Ninguna. 	Se realizo cambio físico de multifuncional, se asigno impresora para uso personal y se adquirirá un escaner  para su uso exclusivo. 	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 12:50:55.865936-04	\N	\N		f	f	f	f	f	f	f	f	f	f
361	0	913	2015-04-07 18:30:40.354745-04	14	14	1050	2015-03-23 18:59:44.655301-04	2014-01-02	2015-04-22	\N	GHIA2715P	GHIA27154P	CARGADOR	R5547	1050902	NO ENTRA AL SISTEMA			se reinstala el sistema y el equipo se deja listo, se detectaron fallas en el funcionamiento de la batería.	2	2	1		f	\N	\N				C2715P1309021918	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-03-26	\N	\N	2015-04-07 18:30:40.354403-04	\N	\N		f	f	f	f	f	f	f	f	f	f
360	0	913	2015-04-07 18:30:57.228322-04	14	15	1049	2015-03-23 18:57:22.346628-04	2014-02-06	2015-04-22	\N	GHIA27514B	TABLET GHIA 8GB BCO	TABLET	hm2400	1049535	no entra al sistema		ninguna	se reinstala el sistema y el equipo se deja listo.	2	2	1		f	\N	\N				C27154B1309049054	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-03-26	\N	\N	2015-04-07 18:30:57.227792-04	\N	\N		f	f	f	f	f	f	f	f	f	f
364	2	\N	2015-04-09 15:25:22.644368-04	3	19	1199	2015-03-26 11:28:05.534932-04	\N	2015-03-31	\N					1199101	Buen dia.\r\n\r\nMe podrian proporcionar un mouse, ya que el que tengo dejo de funcionar unos de los botones esta fallando y como que quiere salirse.\r\n\r\nSaludos		Ninguna	Reporte finalizado, se procede a imprimir reporte y cerrar solicitud solicitada. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.\r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-09 15:25:22.644081-04	\N	\N		f	f	f	f	f	f	f	f	f	f
339	2	\N	2015-04-17 12:59:07.562214-04	3	41	1195	2015-03-10 22:07:05.9566-04	\N	2015-03-15	\N					1195079	no tengo antivirus en mi equipo. me ayudan por favor.\r\ngracias\r\n		Ninguna	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.\r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 12:59:07.56197-04	\N	\N		f	f	f	f	f	f	f	f	f	f
267	2	\N	2015-04-17 12:36:02.895841-04	3	43	1182	2015-02-05 18:11:02.497814-05	\N	2015-02-10	\N					1182287	Por favor su apoyo para revisar que las facturas de mostrador a pesar de ponerle el número de vendedor, no se registra. Gracias		Ninguna	Cualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.\r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 12:36:02.895544-04	\N	\N		f	f	f	f	f	f	f	f	f	f
242	2	\N	2015-04-17 15:01:46.685793-04	3	40	1170	2015-01-28 13:12:18.77057-05	\N	2015-02-02	\N					1170874	BUEN DIA: ME COMENTA GERENCIA ADMINISTRATIVA QUE ESTA PENDIENTE DE CANCELAR UNA LINEA (POSIBLMENTE IUSACELL) Y QUE EL NUMERO DE MTT APAREZCA COMO LADA DE TIJUANA, ME PUEDEN RETROALIMENTAR AL RESPECTO. GRACIAS		NINGUNA	Las llamadas de la linea de MTT esta direccionado al celular de Daniela Leon con lada de Tijuana.	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 15:01:46.68527-04	\N	\N		f	f	f	f	f	f	f	f	f	f
309	2	\N	2015-04-17 15:07:16.680628-04	3	10	1189	2015-03-02 10:55:11.394397-05	\N	2015-03-05	\N					1189849	buen día, necesitamos el proyector que se encuentra en la tienda HP, esto es para una expo que asistiremos en Aguascalientes, este se mandara por paqueteria el día martes 03 de marzo.		Ninguno	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.\r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 15:07:16.680256-04	\N	\N		f	f	f	f	f	f	f	f	f	f
295	2	\N	2015-04-17 15:08:27.493884-04	3	15	1188	2015-02-19 14:02:35.208275-05	\N	2015-02-24	\N					1188608	Buenos días, :)\r\n\r\nMe comunico por este medio para pedir tu apoyo en cuanto a que me cambiare al departamento de comprar eventualmente para que apoyarlos con algunas actividades entonces, no se si me pueden cambiar mi teléfono para allá y pues la cuestión de mi equipo creo que puedo trabajar remoto por LogMeIn tu dime, quedo atenta a tus comentarios, saludos =)		Ninguna	Se realizaron los cambios solicitados. \r\nReporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada.	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 15:08:27.493652-04	\N	\N		f	f	f	f	f	f	f	f	f	f
423	1	256	2015-05-07 12:46:15.387884-04	4	4	1071	2015-05-07 12:45:46.222343-04	\N	2015-05-14	\N					1071643	CONTRATO DE SERVICIOS PREVENTIVOS Y/O CORRECTIVOS GRUPO TERRA HERMOSILLO				2	2	\N	HM17274	f	1	4		VARIOS	VARIOS	VARIOS	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-05-07 12:46:15.387622-04	2015-05-07 22:00:00-04	2016-01-07 21:00:00-05		f	f	f	f	f	f	f	f	f	f
160	2	\N	2015-04-17 15:19:58.87842-04	3	32	1150	2015-01-07 17:30:06.015664-05	\N	2015-01-12	\N					1150253	necesito imprimir la declaración anual 2013 y que salga completa, ruben dijo que esta mal configurado algo en mi compu, saludos		NINGUNA	se ha realizo impresiones sin volver a presente el problema. 	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 15:19:58.878176-04	\N	\N		f	f	f	f	f	f	f	f	f	f
399	1	26	2015-05-27 12:51:38.278666-04	37	14	1069	2015-04-27 16:02:19.721487-04	\N	2015-05-04	\N					1069799	Le cambiaron la lampara recientemente y el equipo muestra alerta de lampara y despide un olor a quemado.	Brand Infocus Projector Model No. IN2102EP Lamp Part Number: SP-LAMP-039\r\n		Se detecto olor a quemado en interior detectando pieza plástica quemada. Costo servicio diagnostico: $150.00 + IVA.	2	2	\N	HM17908	f	2	4		INFOCUS	W2100	AZMB94600812	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		Proyector	\N	1	\N	2015-05-27 12:51:38.278424-04	\N	\N	NINGUNO 	f	f	f	f	f	f	f	f	f	f
286	2	\N	2015-04-17 15:09:48.167783-04	3	13	1186	2015-02-16 19:19:52.973457-05	\N	2015-02-19	\N					1186030	Tzirahuen.\r\n\r\nSolicitud para eliminar las cuentas bancarias de las facturas, solo se quedara la cuenta de Bancomer\r\n\r\nCta. 0446911153\r\nClabe: 012760004469111534\r\n\r\nConvenio CIE:1095390\r\nClabe: 012914002010953902\r\n\r\ny Referencia del cliente esta esta en el campo libre 7 de SAE.\r\n\r\nEn Matriz y las sucursales Culiacan, Tijuana, Aguascalientes y Tienda Virtual.\r\n\r\nTe mande la carta por correo que las muchachas van a estar enviándole a los clientes, donde quedan sin efecto las otras cuentas.\r\n\r\nQuedo a la orden.\r\n\r\nGracias.\r\n\r\n\r\n\r\n		Ninguna.	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.\r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 15:09:48.167543-04	\N	\N		f	f	f	f	f	f	f	f	f	f
282	2	\N	2015-04-17 15:10:40.026393-04	3	13	1185	2015-02-13 16:37:14.9053-05	\N	2015-02-18	\N					1185988	SOLIICITO CAMBIO DE BATERIA DEL MI TELEFONO PLANTRONICS, YA QUE NO DURA LA CARGA Y ME FALLA\r\n\r\nSALUDOS.		Ninguna	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.\r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 15:10:40.026132-04	\N	\N		f	f	f	f	f	f	f	f	f	f
259	2	\N	2015-04-17 15:12:42.444588-04	3	32	1178	2015-02-03 12:27:41.296026-05	\N	2015-02-06	\N					1178136	podrían por favor revisar el multi de arriba esta atorando las hojas y por lo tanto las impresiones salen mal, descuadradas, y necesita cartuchos nuevos.\r\ngracias		Ninguna.	Se realizo cambio fisico de multifuncional, Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.\r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 15:12:42.444299-04	\N	\N		f	f	f	f	f	f	f	f	f	f
227	2	\N	2015-04-17 15:18:00.707409-04	3	19	1164	2015-01-24 12:53:40.191839-05	\N	2015-01-28	\N					1164240	cambiar correo compras@compupproveedores.com a PC de Asistente de compras 1 para uso de Marco Antonio; agregar correo ilianafuentes@commpuproveedores.com a PC de Silvia 		ninguno	Realizado.\r\n\r\nCualquier duda o comentario quedo a sus órdenes.\r\nSaludos.\r\nTzirahuén Martínez \r\nDepartamento Soporte Técnico\r\nOficina (662) 214 2200 ext. 250.\r\nCelular (662) 229 3979 Directo 2113.	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 15:18:00.707116-04	\N	\N		f	f	f	f	f	f	f	f	f	f
204	2	\N	2015-04-17 15:18:22.482211-04	3	24	1160	2015-01-19 19:01:34.326307-05	\N	2015-01-22	\N					1160508	Solicito limpieza de HW y SW de mi equipo, así mismo revisar la batería ya que dura muy poco y es necesario que la tenga en buen estado por que me voy de viaje 1 mes		ninguna	se realizo limpieza solicitada.\r\n\r\nCualquier duda o comentario quedo a sus órdenes.\r\nSaludos.\r\nTzirahuén Martínez \r\nDepartamento Soporte Técnico\r\nOficina (662) 214 2200 ext. 250.\r\nCelular (662) 229 3979 Directo 2113.	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 15:18:22.481948-04	\N	\N		f	f	f	f	f	f	f	f	f	f
197	2	\N	2015-04-17 15:18:33.393873-04	3	38	1156	2015-01-19 12:44:20.908055-05	\N	2015-01-22	\N					1156572	Buenos días\r\npor favor solicito su ayuda para poder \r\nentrar al SKIPER me solicita contraseña\r\nmuchas gracias.\r\n\r\nsaludos.\r\n		NINGUNA.	Cualquier duda o comentario quedo a sus órdenes.\r\nSaludos.\r\nTzirahuén Martínez \r\nDepartamento Soporte Técnico\r\nOficina (662) 214 2200 ext. 250.\r\nCelular (662) 229 3979 Directo 2113.	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 15:18:33.393629-04	\N	\N		f	f	f	f	f	f	f	f	f	f
193	2	\N	2015-04-17 15:19:05.144601-04	3	36	1155	2015-01-15 13:24:22.486795-05	\N	2015-01-20	\N					1155878	solicito una impresora HP 4645,\r\nla cual requiero para las siguientes funciones:\r\n- impresión de reportes de garantías, entradas de mercancía, formatos de garantías de tienda, entre otros.\r\ncomo ademas publicidad y etiquetas de precios que se ocupen\r\n\r\n- ofrecer servicio de copiado, ya que varias personas llegan solicitando dicho servicio.		Ninguna	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.\r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 15:19:05.144332-04	\N	\N		f	f	f	f	f	f	f	f	f	f
68	2	\N	2015-04-17 15:21:42.538455-04	3	17	1143	2014-11-20 11:17:48.668035-05	\N	2014-11-25	\N					1143370	Solicitud de disco duro externo\r\n\r\nMi equipo cuenta con un disco SSD de 90 GB el cual ya esta lleno, actualmente cuento con toda mi información en servidor al rededor de 500 GB en imágenes de sistemas operativos, material de venta, cursos, fichas técnicas y material de implementación. \r\n\r\nToda esta información es necesaria para implementaciones de proyectos y servicios brindados en mexico. \r\n\r\n\r\n		Ninguno	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.\r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-17 15:21:42.538212-04	\N	\N		f	f	f	f	f	f	f	f	f	f
401	0	818	2015-05-08 17:47:49.692999-04	14	36	1068	2015-04-28 15:35:10.794276-04	2014-12-18	2015-05-28	\N	GHIA27218B	TABLET GHIA ANY GIRL 27218B 8GB BCA	1 Eliminador de corriente, 1 cable OTG, 1 Cable USB, 1 Manual de usuario 	Rem 44	1068785	Pila Reventada				1	2	1	TABLET GHIA <5141>	f	\N	\N				C27218B1404011974	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-05-08	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
371	0	4	2015-05-08 17:44:40.298332-04	14	42	1055	2015-04-07 22:05:11.965634-04	2014-08-19	2015-05-07	\N	F4J41LA	Notebook 14-r016la	CARGADOR	H1343	1055809	NO PRENDE			se detectan problemas con la tarjeta madre.\r\nSe invalida garantía porque el equipo tiene derrame de líquido en tarjeta madre.	2	2	1	 Notebook 14-r016la <4002472474>	f	\N	\N				CND4222246	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-04-08	\N	\N	2015-05-08 17:44:40.298065-04	\N	\N		f	f	f	f	f	f	f	f	f	f
404	1	209	2015-04-30 12:43:41.173298-04	37	29	1070	2015-04-29 13:37:52.784098-04	\N	2015-05-06	\N					1070987	IMPRESORA SAMSUNG EN ARRENDAMIENTO, ESTA HACIENDO UN RUIDO AL MOMENTO DE IMPRIMIR, IR A CHECARLA Y LLEVAR UN TONER DE REEMPLAZO.\r\n\r\nSALUDOS.			Equipos queda operando correctamente.	2	2	\N	R10881	f	1	3		SAMSUNG	SCX-6545N	 	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-04-30 12:43:41.173076-04	2015-04-29 22:00:00-04	2015-04-29 22:00:00-04		f	f	f	f	f	f	f	f	f	f
393	1	663	2015-04-30 16:01:43.107376-04	37	23	1065	2015-04-23 15:09:51.070059-04	\N	2015-04-30	\N					1065699	INSTALACIÓN PARA 50 COMPUTADORA LENOVO THINKCENTRE M73Z AIO DE OFFICE 365.	Desinstalar versión de office 365.		Configuración de office 365 en sistema Windows 8.1	2	2	\N	R10895	f	3	2		LENOVO	COMPUTADORA LENOVO THINKCENTRE M73Z AIO	XXXXXXX	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-04-30 16:01:43.107114-04	2015-04-24 12:00:00-04	2015-04-25 12:00:00-04		f	f	f	f	f	f	f	f	f	f
412	2	\N	2015-05-26 13:53:10.609404-04	3	39	1206	2015-05-04 15:46:42.236295-04	\N	2015-05-07	\N					1206986	Les pido por favor redireccionar la cuenta de elizabethvelez@compuproveedores.com a mi correo electrónico, con el fin de poder saber cuando los clientes de la pagina virtual suban algún pedido. Gracias		Ninguna.	Confirmación del usuario por Skype de la solución del problema reportado. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250.\r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-05-26 13:53:10.609117-04	\N	\N		f	f	f	f	f	f	f	f	f	f
49	2	\N	2015-04-20 14:00:19.170394-04	3	9	1141	2014-11-12 10:58:01.545657-05	\N	2014-11-17	\N					1141290	BUEN DIA\r\nFAVOR DE CREAR CUENTA DE CORREO, SKYPE, NÚMERO DE VENDEDOR, CLAVE DE SAE, ASÍ COMO ASIGNARLE UNA PORTATIL, ETC. A: OSCAR FERNANDO LEGASPI ANDRADE\r\nFECHA DE NAC. 30/03/1987\r\nEL ESTARA COMO COORDINADOR DE VENTAS EN AGUASCALIENTES\r\n\r\nSIN MÁS POR EL MOMENTO, GRACIAS		Ninguna.	\r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.\r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-20 14:00:19.16999-04	\N	\N		f	f	f	f	f	f	f	f	f	f
86	2	\N	2015-04-20 15:14:44.645053-04	3	9	1146	2014-11-26 18:03:41.760828-05	\N	2014-12-01	\N					1146125	BUENAS TARDES\r\n\r\nFAVOR DE CREARLE LAS CREDENCIALES NECESARIAS, ASÍ COMO LAS CARTAS RESPONSIVAS DE EQUIPO A:\r\nLUIS ENRIQUE GÓMEZ FELIX\r\nQUIEN SE ESTA INTEGRANDO COMO VENDEDOR EN COMPUYA.\r\n\r\n\r\nGRACIAS		NINGUNA	Cualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-20 15:14:44.644818-04	\N	\N		f	f	f	f	f	f	f	f	f	f
203	0	860	2015-04-20 15:27:56.072177-04	14	37	990	2015-01-19 18:39:26.168957-05	2013-10-01	2015-02-18	\N	Portatil	Dell Inspiron 11 3000	Batería, Cargador	Pendiente	0990628	AL ENCENDERLA NO INICIA SE QUEDA EL LOGO "DELL". EN DIAGNOSTICO DE BIOS INDICA PROBLEMAS EN DISCO DURO.		ninguna	El equipo se paso a servicios, porque no encontró el ticket de compra, por lo tanto no entró en garantía.	2	2	1	Dell <906621969> 	t	\N	\N				4WWX1Y1	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-01-28	\N	\N	2015-04-20 15:27:56.07168-04	\N	\N		f	f	f	f	f	f	f	f	f	f
216	2	\N	2015-04-20 16:10:51.107004-04	3	9	1162	2015-01-22 11:24:17.141474-05	\N	2015-01-27	\N					1162481	BUEN DIA\r\n\r\nFAVOR DE HACER LAS CARTAS RESPONSIVAS CORRESPONDIENTES DE EQUIPO Y MOBILIARIO A PEDRO ANTONIO JIMENEZ IBARRA, ASI COMO SU CUENTA DE OUTLOOK.\r\nSU FECHA DE NACIMIENTO ES: 14/06/1982.		Ninguna	Cualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-20 16:10:51.106647-04	\N	\N		f	f	f	f	f	f	f	f	f	f
238	2	\N	2015-04-20 17:41:47.69549-04	3	9	1166	2015-01-28 11:45:21.216842-05	\N	2015-02-02	\N					1166167	BUEN DÍA\r\n\r\nFAVOR DE CREAR CUENTA DE CORREO, SKY PE ,ASÍ COMO LAS CARTAS RESPONSIVAS DE EQUIPO Y MOBILIARIO A:\r\n\r\nMARCO ANTONIO CAÑEDO VELASCO\r\nFECHA NAC. 10/06/1985\r\nDEPARTAMENTO: COMPRAS\r\nPUESTO ASISTENTE\r\n\r\n\r\nGRACIAS		NINGUNA	Cualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-20 17:41:47.695037-04	\N	\N		f	f	f	f	f	f	f	f	f	f
240	2	\N	2015-04-20 18:03:10.627095-04	3	9	1168	2015-01-28 11:52:08.842851-05	\N	2015-02-02	\N					1168954	BUEN DÍA\r\n\r\n\r\nFAVOR DE REALIZAR LAS CARTAS RESPONSIVAS DE EQUIPO DE COMPUTO Y MOBILIARIO, ASÍ COMO EL DE ADECUAR EL LUGAR EN QUE ESTABA ANTERIORMENTE ALFONSO, PARA LA PERSONA NUEVA QUE ESTARA COMO COORDINADOR DE VENTAS DE TONER 2.0 AQUI EN HERMOSILLO:\r\n\r\nDIEGO GARCIA SAHAGÚN\r\nFECHA DE NAC. 25/06/1993\r\n\r\nGRACIAS		Ninguna. 	Cualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-20 18:03:10.626817-04	\N	\N		f	f	f	f	f	f	f	f	f	f
260	2	\N	2015-04-20 19:09:16.040771-04	3	40	1179	2015-02-04 09:27:15.570159-05	\N	2015-02-09	\N					1179441	BUEN DIA: DE NUEVO SOLICITANDO APOYO PARA QUE QUEDE CONFIGURADO EL CORREO DE ALEJANDRO PEREZ EN LA PORTATIL QUE LE FUE ASIGNADA. HOY AL EMPEZAR A LABORAR VEMOS QUE ESTA ACTIVADO PERO EL DE MIGUEL FRANCO, QUE YA NO LABORA AQUI, Y NO APARECEN LOS CORREOS GENERADOS DESDE HACE 3 MESES POR ALEX PEREZ. FAVOR DE REVISAR. GRACIAS.		Ninguna	Cualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-20 19:09:16.040483-04	\N	\N		f	f	f	f	f	f	f	f	f	f
327	2	\N	2015-04-21 15:21:50.126463-04	3	9	1194	2015-03-06 12:08:54.695196-05	\N	2015-03-11	\N					1194869	FAVOR DE CREAR CUENTAS Y CARTAS RESPONSIVAS CORRESPONDIENTES A SU PUESTO A RAYMUNDO HALCON VEGA REYNOSO, FECHA DE NACIMIENTO 03DIC1981.		Ninguna	Cualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-04-21 15:21:50.126114-04	\N	\N		f	f	f	f	f	f	f	f	f	f
382	1	464	2015-04-23 15:19:49.011283-04	15	15	1062	2015-04-21 13:18:39.275913-04	\N	2015-04-28	\N					1062496	esta reportando el cliente que se fue la luz. y el equipo se apago junto con el nobreak que no se mantubo prendido para darle oportunidad de guardar..se vendio con la fact HM10699 ya anteriormente ya ah presentado fallas..				3	2	\N		f	1	4		APC	350VA	S4B1403P43239	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		nobreak	\N	2	\N	\N	2015-04-21 15:00:00-04	2015-04-21 15:00:00-04		f	f	f	t	f	f	f	f	f	f
402	0	818	2015-05-08 17:46:53.711848-04	14	36	1069	2015-04-28 15:51:41.017502-04	2015-04-19	2015-05-28	\N	GHIA27158N	TABLET GHIA ANY KIDS 27158N, 7", NARANJA	1 Cable OTG, 1 MANUAL DE USUARIO	Rem 45	1069059	NO CARGA \r\n"VENTA EN EVENTO NAVIDEÑO"				1	2	1	TABLET GHIA <5142>	f	\N	\N				C27158N1404006406	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-05-08	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
359	0	434	2015-04-30 13:22:25.272371-04	14	24	1048	2015-03-23 18:18:27.409588-04	2014-08-18	2015-04-22	\N	SONVPLDX100	PROYECTOR SONY DX100 XGA HDMI	sn	HM9632	1048651	Las fallas son al encender presenta como burbujas o  gotas de colores y se van expandiendo hasta quitarse y quedar del color normal de la pantalla pero en el centro de la pantalla se mira una mancha la cual no deja ver lo que se proyecte.		ninguna\r\n	Se descartan fallas en el lente\r\nSe detectan fallas en tarjeta.\r\nSe cambia la tarjeta y el equipo queda funcionando correctamente.	2	2	1	SONY DX100 XGA HDMI <36>	f	\N	\N				S017100385A	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-04-07	\N	\N	2015-04-30 13:22:25.271985-04	\N	\N		f	f	f	f	f	f	f	f	f	f
397	0	87	2015-04-30 17:20:33.311607-04	14	29	1066	2015-04-24 13:03:32.148808-04	2013-12-13	2015-05-26	\N	A5V72AA	MONITOR LCD 18.5" HPLV1911	 	HM2009	1066067	NO FUNCIONA PARECE QUE SE FUNDIO LA LAMPARA, IR A ALMACEN DE RECAUDACION CON CARLOS PREIRA,.,. URGE.,\r\n\r\nSALUDOS.		ninguna		2	2	1	MONITOR LCD 18.5" HPLV1911	f	\N	\N				6CM33938XC	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-04-24	\N	\N	2015-04-30 17:20:33.311356-04	\N	\N		f	f	f	f	f	f	f	f	f	f
409	0	663	2015-04-30 17:56:40.237154-04	19	19	1075	2015-04-30 17:56:40.213872-04	2015-04-23	2015-06-01	\N	HPCC364X	HP TONER LASERJET NEGRO	No aplica	CN196	1075299	AL QUITAR LA BANDA DE SEGURIDAD QUE TRAEN, SE ROMPIO Y QUEDO ATASCADA				0	2	2		f	\N	\N				No aplica	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
414	2	\N	2015-05-25 13:32:36.009631-04	3	46	1207	2015-05-05 15:52:05.436829-04	\N	2015-05-08	\N					1207629	podrias revisar el modulo de inventario ya que no me esta filtrando las existencias, y aprovechando tambien la impresora B6200 OKIDATA ya que me esta mandando 1 hoja extra cuando mando imprimir pero la manda en blanco limpia podra tener con una limpieza, o ya de plano cambio ya que tambien suena el rodillo cuando mando la impresion.		servicio01		1	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
429	0	383	2015-05-27 12:18:13.977724-04	14	14	1082	2015-05-11 11:33:42.86751-04	2015-04-29	2015-06-10	\N	SHURE522	MICROFONO	NA	HM17081	1082162	VIENE CON DAÑO FÍSICO		niguna		1	2	1	SHURE522	f	\N	\N				N/A	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-05-14	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
422	2	\N	2015-05-25 11:28:27.643766-04	47	13	1211	2015-05-07 12:34:02.044284-04	\N	2015-05-12	\N					1211086	SOLICITO REVISAR MI SESION O USUARIO DE SAE, YA QUE NO PUEDE ENVIAR CORREOS INDIVIDUALES, NI MASIVOS DE LOS ARCHIVOS DE FACTURAS, EN NINGUNA DE LAS SUCURSALES.\r\n\r\nESPERO SU PRONTA INTERVENSION.\r\n\r\nGRACIAS.				1	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
417	2	\N	2015-05-07 12:54:36.262621-04	3	23	1208	2015-05-06 13:13:11.5408-04	\N	2015-05-11	\N					1208422	buen día.\r\n\r\nsolicito un servicio de mantenimiento a la impresora OKI B6200, tiene un sonido muy feo.\r\n\r\nagradezco su atención.\r\n			SOLICITUD DUPLICADA CON EL REPORTE 1209.	3	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
395	1	705	2015-05-07 11:12:17.540476-04	37	35	1067	2015-04-23 18:06:53.133516-04	\N	2015-04-30	\N					1067257	Colegio Muñoz el llano tengo un problema con un proyector en biblioteca y me estan informando que es el cable VGA. LIZETH ARAUJO			Se realiza el reemplazo de Cable Video VGA.	2	2	\N	HM17257	f	2	4		na	na	na	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		proyector	\N	2	\N	2015-05-07 11:12:17.540074-04	2015-04-25 05:00:00-04	2015-04-24 18:00:00-04	na	t	t	f	f	f	f	f	f	f	f
415	0	868	2015-05-27 11:21:17.664437-04	8	8	1078	2015-05-05 16:18:54.74611-04	2014-11-14	2015-06-04	\N	HPCE993A	IMPRESORA HP LASERJET M602X	CABLE	TJ2442	1078052	Ruido al empezar y durante la impresión en la parte posterior enentre el duplex y la charola, es un sonido constante como si los engranes estuvieran patinando y en algunas ocasiones se atora la impresora		ninguna		2	1	1	IMPRESORA HP LASERJET M602X <4651391134>	f	\N	\N				CNDCGBX1K3	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-05-12	\N	\N	2015-05-27 11:21:17.664169-04	\N	\N		f	f	f	f	f	f	f	f	f	f
398	0	757	2015-05-08 17:45:29.921738-04	14	14	1067	2015-04-24 13:32:21.020441-04	2013-07-31	2015-05-26	\N	HPC3Z94AA	MONITOR 23´´	POR DEFINIR	H24132	1067401	el monitor presenta la imagen en color azul tenue y con un cuadriculado  también muy tenue.		ninguna	Se Reemplaza monitor HP Pavilion 23xi con serie: 3CM30705CQ por un monitor HP V241p con serie: 3CQ5034CBS. 	2	2	1	MONITOR HP 23´´	f	\N	\N				3CM30705CQ	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-04-24	\N	\N	2015-05-08 17:45:29.921448-04	\N	\N		f	f	f	f	f	f	f	f	f	f
425	1	757	2015-05-08 15:18:57.346918-04	4	35	1073	2015-05-07 16:00:55.468497-04	\N	2015-05-14	\N					1073527	TRASLADAR DE SITIO, DE DIRECCION DE SERVICIOS UNIVERSITARIOS A LA IMPRENTA UNISON, REALIZAR LA INSTALACION				2	2	\N	HM17295	f	3	3		XEROX	PHASER 7500	na	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-05-08 15:18:57.346655-04	2015-05-08 20:00:00-04	2015-05-08 21:00:00-04		t	f	f	f	f	t	f	f	f	f
408	0	757	2015-05-08 17:44:04.740706-04	14	14	1074	2015-04-30 15:52:15.81574-04	2014-05-19	2015-06-01	\N	HPJ9766B	TELEFONO HP 4120	EN CAJA ORIGINAL	6773	1074725	NO ENCIENDE		ninguna	Se cambia telefono IP dañado con serie: CN41G7H29S por uno nuevo con seire:CN38G7H409.	2	2	1	 TELEFONO HP 4120 <4751472926 >	f	\N	\N				CN41G7H29S	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-05-04	\N	\N	2015-05-08 17:44:04.74039-04	\N	\N		f	f	f	f	f	f	f	f	f	f
407	0	757	2015-05-08 17:44:19.02887-04	14	14	1073	2015-04-30 15:49:04.99972-04	2014-05-19	2015-06-01	\N	HPJ9766B	ELEFONO HP 4120	EN CAJA ORIGINAL	6773	1073363	NO ENCIENDE		ninguna	Se cambia telefono IP dañado con serie: CN46G7H39G por uno nuevo con seire: CN41G7H11N	2	2	1	ELEFONO HP 4120 <4751473169>	f	\N	\N				CN46G7H39G	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-05-04	\N	\N	2015-05-08 17:44:19.028425-04	\N	\N		f	f	f	f	f	f	f	f	f	f
428	1	757	2015-05-25 12:41:15.48896-04	37	35	1074	2015-05-08 17:55:24.926769-04	\N	2015-05-15	\N					1074117	CAMBIO LOCALIZACION DE EQUIPO Y MONTAJE DE MONITOR EN PARED PARA LA UNISON\r\nCALLE DEL MURO n.5 colonia pimentel		Ninguna.	Costo servicio preventivo: $500.00 + IVA\r\nFactura: HM17796	2	2	\N	HM17796	f	3	3		XEROX	PHASER 7500	na	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		Montaje de monitor	\N	2	\N	2015-05-25 12:41:15.488733-04	2015-05-09 03:30:00-04	2015-05-09 05:00:00-04		t	t	f	f	f	f	f	f	f	f
430	1	27	2015-05-12 11:09:14.473259-04	15	15	1075	2015-05-11 14:35:49.944977-04	\N	2015-05-18	\N					1075339	instalacion programa de ecotec / solo cargador protec smart 14-n007la				3	2	\N		f	2	1		HP	Probook 4440 g2/ protec smart 14-n007la	5cd3502bt5 / cnd447g3y5	t	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
424	1	336	2015-05-12 11:41:03.321707-04	37	3	1072	2015-05-07 12:52:49.562159-04	\N	2015-05-14	\N					1072400	Solicito un servicio de mantenimiento a la impresora OKI B6200, tiene un sonido muy feo. agradezco su atención.\r\n\r\nCONTACTO:\tAthziry\r\nDepartamento:\tVENTAS\r\nExtensión o teléfono:\t205				2	2	\N	INTERNO	f	1	3		OKIDATA	B6200	105059	f	f	f				t	t	f	f	f	f	t	f		f	f		f		f	f			\N	1	\N	2015-05-12 11:41:03.321404-04	\N	\N		f	f	f	f	f	f	f	f	f	f
405	0	103	2015-05-14 15:05:49.303588-04	14	24	1071	2015-04-29 14:46:05.440251-04	2014-09-18	2015-05-29	\N	HPG5Q99LT	COMPUTADORA HP PRODESK 400 G1 SFF	MOUSE, TECLADO	HM10617	1071529	Al momento de encender la maquina préndenlas luces normales pero ni da ningún pitido y no da señal de imagen, se cambiaron varios monitores para ver si ese era el problema pero continua igual sin mostrar nada de imagen ni sonido. EL CLIENTE LLEVARA EQUIPO DE COMPUTO A SUCURSAL TIJUANA DE COMPUPROVEEDORES YA QUE SE ENCUENTRA EN LA SUCURSALL DE SUPERLLANTAS DE TIJUANA,BCN. LA MATRIZ SE ENCUENTRA EN HERMOSILLO.		NINGUNA		2	2	1	 HP PRODESK 400 G1 SFF<4751356217><*4751701326>	f	\N	\N				MXL4321DVY	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-04-30	\N	\N	2015-05-14 15:05:49.303298-04	\N	\N		f	f	f	f	f	f	f	f	f	f
431	2	\N	2015-05-25 15:12:06.213032-04	3	48	1214	2015-05-11 14:48:13.817722-04	\N	2015-05-14	\N					1214504	Necesito en mi formato de factura lo siguientes: 1. que aparezca mi RFC completo, actualmente la homoclave no sale completa.\r\n2. Que aparezcan los números de serie porque actualmente, apesar de estar dados de alta en el sistema no aparecen en la factura. No me permite jalarlos a la hora de facturar.\r\n3. Actualmente me aparece un error que me indica que uno de los archivos adjuntos no se reconoce..y no envía los archivos PDF y XML al cliente. Me puedes ayudar a corregir este error.\r\n4. Necesito que el formato de factura, aparezca el no. de Pedido del cliente.\r\n5. No me deja jalar las remisiones para facturar.				1	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
427	2	\N	2015-05-25 12:42:44.306451-04	3	39	1213	2015-05-08 12:14:30.843597-04	\N	2015-05-13	\N					1213959	Buen dia,\r\nPara solicitarles configurar las cuentas que manejo de Outlook en la laptop que me hicieron favor de enviar, así como el sistema SAE. Gracias		ninguna	Usuario confirma por skype solución del problema. \r\n\r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250.	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-05-25 12:42:44.306237-04	\N	\N		f	f	f	f	f	f	f	f	f	f
416	0	868	2015-05-27 11:20:09.328936-04	8	8	1079	2015-05-05 16:21:20.803145-04	2014-11-14	2015-06-04	\N	HPCE993A	IMPRESORA HP LASERJET M602X	CABLE	TJ2442	1079589	Marca un error despues de  unos minutos de estar imprimiendo con la leyenda "49.2F.FF Error Turn power off then on" si se apaga la impresora y se prende de nuevo vuelve a funcionar normal pero despues de unos minutps de nuevo empieza el error.		ninguna		2	1	1	HP LASERJET M602X <4651411475>	f	\N	\N				CNDCGBX1JJ	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-05-14	\N	\N	2015-05-27 11:20:09.328647-04	\N	\N		f	f	f	f	f	f	f	f	f	f
438	1	336	2015-05-14 17:21:59.401597-04	4	29	1079	2015-05-13 16:00:37.684021-04	\N	2015-05-20	\N					1079396	retirar un multifuncional M521 que dejó Diego como Demo en las instalaciones de Tres Guerras Transportes.\r\nAhí  todavía no esta muerto el asunto, por lo que es muy importante que a Daniel el Gerente le retiren el equipo y le dejen bien instalado el otro que tiene ahí.\r\n				2	2	\N	COMODATO	f	3	3		 	 	 	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-05-14 17:21:59.401355-04	2015-05-13 22:00:00-04	2015-05-13 22:00:00-04		f	f	f	f	f	f	f	f	f	f
437	1	757	2015-05-14 17:22:50.030739-04	4	4	1078	2015-05-13 12:27:18.501363-04	\N	2015-05-20	\N					1078215	CONFIGURACION DE IMPRESORA.	COTIZAR SENSORES.			1	2	\N		f	3	3		XEROX	PHASER 7500	PENDIENTE	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	\N	2015-05-13 20:00:00-04	2015-05-13 21:00:00-04		f	f	f	f	f	f	f	f	f	f
403	0	883	2015-05-12 18:59:18.781774-04	14	14	1070	2015-04-28 19:15:55.474824-04	2015-04-16	2015-05-28	\N	LEN10BD00FGLS	MOUSE LENOVO	NINGUNO	HM16690	1070132	LO SACARON DEL EMPAQUE CON DAÑO FÍSICO.		NINGUNA	Se realiza cambio físico del mouse.	2	2	1	MOUSE LENOVO	f	\N	\N				4420363	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-04-28	\N	\N	2015-05-12 18:59:18.781474-04	\N	\N		f	f	f	f	f	f	f	f	f	f
435	1	343	2015-05-13 19:36:20.24659-04	37	4	1076	2015-05-12 17:20:05.602467-04	\N	2015-05-19	\N					1076768	INSTALACIÓN DE IMPRESORA EN EQUIPOS	COSTO SERVICIO: $350.00	Ninguna.	Se realiza instalación y configuración de equipo en sitio. Costo servicio: $350.00	2	2	\N	R10989	f	3	3		HP	P1102	VND3W35562	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-05-13 19:36:20.24637-04	2015-05-14 07:00:00-04	2015-05-14 08:00:00-04		t	f	f	f	f	f	f	f	f	f
394	1	663	2015-05-12 19:06:52.134725-04	37	23	1066	2015-04-23 15:11:14.477716-04	\N	2015-04-30	\N					1066918	INSTALACION A 50 COMPUTADORAS LENOVO THINKCENTRE M73Z AIO EL OFFICE 365			Configuración de office 365 en sistema Windows 8.1	2	2	\N	R10971	f	3	2		LENOVO	COMPUTADORA LENOVO THINKCENTRE M73Z AIO	XXXXXXXXXXXXXXXXXXX	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	2015-05-12 19:06:52.13431-04	2015-04-24 19:00:00-04	2015-04-25 19:00:00-04		f	f	f	f	f	f	f	f	f	f
433	0	4	2015-05-13 19:23:53.506074-04	14	42	1083	2015-05-11 19:24:00.287799-04	2014-10-30	2015-06-10	\N	E7H86LA	HP Pavilion X2 11-h010la	CARGADOR	ICACV77113	1083755	BOTON WINDOWS NO AGARRA EN TEBLET, SALE HUMO DEL TECLADO		NINGUNO		1	2	1	HP Pavilion X2 11-h010la <BFRK2982>	t	\N	\N				5CD3444G55	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-05-13	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
434	0	4	2015-05-13 19:28:28.752034-04	14	42	1084	2015-05-12 13:17:58.398262-04	2015-02-13	2015-06-11	\N	F4H94LA	PAVILION 15-R005LA	CARGADOR	92DD7D36	1084819	PUERTO HDMI NO FUNCIONA		NINGUNA		1	2	1	PAVILION 15-R005LA<BFRK3152>	t	\N	\N				CND446GBNW	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-05-13	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
440	0	868	2015-05-14 14:37:19.006496-04	8	8	1085	2015-05-14 14:37:18.982446-04	2014-11-14	2015-06-15	\N	HPCE993A	IMPRESORA HP LASERJET M602X	CABLE DE CORRIENTE	TJ2442	1085927	Hace ruido al prender en la parte posterior entre el dúplex y la charola, tampoco detecta la bandeja numero tres manda un mensaje de error. 				0	1	1		f	\N	\N				CNDCGBX1JY	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
439	2	\N	2015-05-25 12:34:11.449941-04	3	32	1216	2015-05-13 19:38:01.965282-04	\N	2015-05-18	\N					1216305	NO PUEDO ENTRAR A SAE ME INDICA QUE MI USUARIO NO ESTA REGISTRADO, SE SUPONE QUE ES VENTAS03 Y CONTRASEÑA : SOLANO		Ninguna	Usuario confirmar por Skype la solución del problema. \r\n\r\nReporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250.\r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-05-25 12:34:11.449722-04	\N	\N		f	f	f	f	f	f	f	f	f	f
442	1	4	2015-05-15 12:11:03.782028-04	42	42	1080	2015-05-14 18:06:48.306506-04	\N	2015-05-21	\N					1080860	EQUIPO NO MANDA IMAGEN, AUN SE ENCUENTRA DENTRO DEL TIEMPO DE GARANTIA PERO EL PORTAL HP NO LO RECONOCE COMO EQUIPO NACIONAL				3	2	\N		f	2	1		HP	J5N26LT	CND42235RJ	t	t	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
436	1	818	2015-05-18 19:28:53.999067-04	36	36	1077	2015-05-12 20:49:35.664536-04	\N	2015-05-19	\N					1077115	*NOTA: No Formatear. se ocupa sacar la informacion del equipo, ya que en la misma se encuentran unos archivos de la tesis del cliente. Por el cual no borrar la informacion				3	2	\N		f	2	1		Polaroid	s/n	s/n	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
441	2	\N	2015-05-25 12:25:53.209118-04	3	10	1217	2015-05-14 15:08:03.733546-04	\N	2015-05-19	\N					1217691	Crear usarios para la tienda de linea que tenemos con INGRAM, para Silvia Alvarez, Manuel Ramirez y Mercedes De los Reyes.		Ninguna	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250.\r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-05-25 12:25:53.208893-04	\N	\N		f	f	f	f	f	f	f	f	f	f
443	2	\N	2015-05-25 12:09:09.539127-04	3	40	1218	2015-05-15 12:04:28.278975-04	\N	2015-05-20	\N					1218832	BUEN DIA:\r\nPARA SOLICITAR QUE EN LOS REPORTES Y DOCUMENTOS QUE SE GENERAN DE LA EMPRESA VICTOR (MTT) NO APAREZCA EN EL PIE DE PAGINA LA PUBLICIDAD DE LA PAGINA DE COMPUPROVEEDORES. GRACIAS		Ninguna	se modifico formato de impresión. \r\n\r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250.	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-05-25 12:09:09.538914-04	\N	\N		f	f	f	f	f	f	f	f	f	f
432	2	\N	2015-05-25 12:38:19.109915-04	3	17	1215	2015-05-11 15:57:29.369999-04	\N	2015-05-14	\N					1215927	Solicitud de Lectora Samsung para proyecto en cananea el dia 12/05/2015\r\n\r\nPréstamo de 1 día.		ninguna	Equipo entregado.\r\n\r\nReporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. 	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-05-25 12:38:19.109684-04	\N	\N		f	f	f	f	f	f	f	f	f	f
452	1	663	2015-05-25 11:13:28.426346-04	37	35	1085	2015-05-21 18:42:44.322256-04	\N	2015-05-28	\N					1085895	INSTALACION FISICA DE MEMORIA . EDIFICIO DEL PODER JUDICIAL DEL ESTADO. Segundo Piso, enseguida de los baños de mujeres. Estará esperando Irene para abrirles.			Se realiza instalación de memorias en equipo servidor HP-Proliant ML350.	2	2	\N	R11069	f	3	4		HP	NA	NA	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f		SERVIDOR	\N	2	\N	2015-05-25 11:13:28.426116-04	2015-05-22 19:00:00-04	2015-05-22 20:00:00-04	NA	t	f	f	f	f	t	f	f	f	f
376	2	\N	2015-05-25 12:57:34.662466-04	3	39	1200	2015-04-10 17:30:34.886422-04	\N	2015-04-15	\N					1200970	Favor de configurar lo siguiente a mi laptop:\r\n- Outlook, cuenta de manuel.castillo@compuproveedores.com\r\n- LYNC\r\n- SAE\r\n\r\nGracias.\r\nSaludos		Ninguna	Confirmación del usuario por Skype de la solución del problema reportado. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250.\r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-05-25 12:57:34.66225-04	\N	\N		f	f	f	f	f	f	f	f	f	f
447	1	4	2015-05-21 11:47:44.813995-04	4	42	1082	2015-05-19 13:11:45.633964-04	\N	2015-05-26	\N					1082414	AL PARECER ES  LA TARJETA MADRE, CLIENTE PIDE DIAGNOSTICO				1	2	\N		f	1	2		HP	HLK602LT	MXL1350Q7H	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
413	0	883	2015-05-20 11:14:03.936808-04	14	14	1077	2015-05-04 17:24:54.577676-04	2014-03-19	2015-06-03	\N	HPE3T81LT	HP ALL IN ONE 205	POR DEFINIR	4873	1077076	La imagen se presenta como si estuviera manchada 		NINGUNA	SE CAMBIA EQUIPO HP ALL IN ONE 205 CON NUMERO DE SERIE 4CE4010B7M POR UN EQUIPO HP ALL IN ONE 205 CON NUMERO DE SERIE 4CE5060JPQ	2	2	1	HP ALL IN ONE 205	f	\N	\N				4CE4010B7M	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-05-18	\N	\N	2015-05-20 11:14:03.93641-04	\N	\N		f	f	f	f	f	f	f	f	f	f
377	2	\N	2015-05-25 13:03:20.426969-04	3	5	1201	2015-04-13 14:55:51.88277-04	\N	2015-05-13	\N					1201229	SOLICITO REVISION O CAMBIO DE TELEFONO EXT. 241 YA QUE AL COLGAR NO SIRVE LA TECLA (OFF) PARA COLGAR LLAMADA, SE ATORA LA TECLA Y NO SE CUELGA.				1	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	t
451	0	798	2015-05-20 18:57:54.813086-04	8	8	1088	2015-05-20 18:57:54.780867-04	2014-09-11	2015-06-19	\N	HPCZ195A	IMPRESORA HP LASERJET PRO M401N	CABLE CORRIENTE	TJ1972	1088250	FALLA TRUENA AL ENCENDER Y ATORA LAS HOJAS. CAMBIO DE IMPRESORA REFERENCIADA CON EL CASO NO. 4751356229				0	1	1		f	\N	\N				PHGDC05743	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
449	1	942	2015-05-22 12:02:43.2174-04	37	4	1084	2015-05-19 15:07:56.771567-04	\N	2015-05-26	\N					1084511	FORMATEO DE EQUIPO, TODOS LOS DOCUMENTOS, RESPALDAR SOLAMENTE LAS IMAGENES, FOTOS. COSTO $300.00 YA NETO.		Ninguna.	Se realiza el respaldo de información. Reinstalaron sistema operativo sin programas. \r\nHM17676: $300.00	2	2	\N	HM17676	f	1	2		ARMADO	ARMADO	ARMADO	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-05-22 12:02:43.216912-04	\N	\N		f	f	f	f	f	f	f	f	f	f
453	0	883	2015-05-25 11:36:50.559927-04	14	14	1089	2015-05-25 11:36:50.535419-04	2014-03-19	2015-06-24	\N	HPE3T81LT	HP ALL IN ONE 205	POR DEFINIR	4837	1089262	NO ENCIENDE				0	2	1		f	\N	\N				4CE5060JPQ	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
390	2	\N	2015-05-25 13:21:42.502137-04	3	9	1203	2015-04-23 12:59:59.142947-04	\N	2015-04-28	\N					1203682	FAVOR DE ASIGNAR CABLE PARA CONECTAR TELÉFONO DE SERVICIO TELMEX, A LUIS ENRIQUE GOMEZ FELIX		Ninguna. 	Confirmación del usuario por Skype de la solución del problema reportado. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250.\r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-05-25 13:21:42.501917-04	\N	\N		f	f	f	f	f	f	f	f	f	f
445	1	790	2015-05-25 12:41:57.538056-04	4	37	1081	2015-05-15 15:07:13.457177-04	\N	2015-05-22	\N					1081227	No enciende correctamente. Se intercambio botón de encendido y al instalar controlador ya no inicio. Solicita instalar sistema operativo Windows 7 profesional 64 bits en equipo.				2	2	\N	HM17765	f	3	2		GUIA	PC971	151597	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-05-25 12:41:57.537701-04	\N	\N		f	f	f	f	f	f	f	f	f	f
446	0	883	2015-05-22 14:05:52.417294-04	14	14	1087	2015-05-19 11:57:26.847764-04	2014-05-16	2015-06-18	\N	HPE3T81LT	HP ALL IN ONE 205	POR DEFINIR	6756	1087768	No arranca sistema  y manda mensaje de error del disco duro.\r\nse ejecuta diagnostico de sistema  y no funciona equipo\r\n		NINGUNA		1	2	1	HP ALL IN ONE 205 <4651478480>	f	\N	\N				4CE4010XC4	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-05-22	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
448	1	30	2015-05-25 11:12:29.428466-04	4	4	1083	2015-05-19 14:30:58.959501-04	\N	2015-05-26	\N					1083844	DISGOSTICO PANTALLA	SE PASA NUMERO DE PARTE PARA COTIZACIÓN.			3	2	\N		f	2	1		DELL	LATITUDE E6440	LATITUDE E6440	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
418	2	\N	2015-05-25 13:04:49.985673-04	3	23	1209	2015-05-06 13:13:30.372728-04	\N	2015-05-11	\N					1209263	buen día.\r\n\r\nsolicito un servicio de mantenimiento a la impresora OKI B6200, tiene un sonido muy feo.\r\n\r\nagradezco su atención.\r\n		servicio01	Confirmación del usuario por Skype de la solución del problema reportado. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250.\r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-05-25 13:04:49.98519-04	\N	\N		f	f	f	f	f	f	f	f	f	f
426	2	\N	2015-05-25 12:45:35.153854-04	3	32	1212	2015-05-07 17:34:29.811582-04	\N	2015-05-12	\N					1212386	hola.\r\nchicos me urge la instalación de mi escáner y que me compren la licencia para el PDF convert profesional.\r\ngracias		Ninguna.	Confirmación del usuario por Skype de la solución del problema reportado. \r\n\r\nReporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. 	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-05-25 12:45:35.153619-04	\N	\N		f	f	f	f	f	f	f	f	f	f
420	2	\N	2015-05-25 12:47:34.587479-04	3	39	1210	2015-05-07 11:21:07.52466-04	\N	2015-05-12	\N					1210035	Buen día, \r\nComo sabrán desde el pasado 1 de mayo me estoy encargando de la Tienda Virtual y necesito facturar 3 pedidos pendientes.\r\nLes pido por favor su apoyo para hacer los ajustes necesarios en SAE TVC con el fin de poder darle continuidad a mi nueva labor.\r\nGracias.		NINGUNA	SE REALIZO EL CAMBIO DE PERFIL. \r\nSE PREDETERMINO EL FOLIO: TVC \r\n\r\nConfirmación del usuario por Skype de la solución del problema reportado. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250.\r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-05-25 12:47:34.587261-04	\N	\N		f	f	f	f	f	f	f	f	f	f
400	2	\N	2015-05-25 13:24:56.704743-04	3	15	1204	2015-04-27 17:42:57.162062-04	\N	2015-04-30	\N					1204756	Buenas tardes.\r\n\r\nSolicito de ayuda, para que instalen el equipo de Iliana en su lugar y el mio lo pongan donde corresponde, y por favor revisen el escaner de compras ya que no lo podemos utilizar.\r\nGracias :) \r\nPD. URGENTE!		Ninguna.	Confirmación del usuario por Skype de la solución del problema reportado. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250.\r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-05-25 13:24:56.704436-04	\N	\N		f	f	f	f	f	f	f	f	f	f
450	2	\N	2015-05-25 13:44:58.318371-04	3	49	1219	2015-05-20 13:06:22.7545-04	\N	2015-05-25	\N					1219759	buen día.\r\npara solicitarles reposición de toner de multifuncional de administración..\r\nmuchas gracias.		ninguna. 	Cualquier duda o comentario quedo a sus órdenes. Saludos. Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250.	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-05-25 13:44:58.318135-04	\N	\N		f	f	f	f	f	f	f	f	f	f
454	0	757	2015-05-25 17:26:03.99492-04	14	14	1090	2015-05-25 14:58:11.040271-04	2014-05-19	2015-06-24	\N	HPJ9766B	TELEFONO HP  4120 IP	BOCINA CABLE 	6773	1090026	NO ENCIENDE (NO FUNCIONA)		ninguna		1	2	1	 TELEFONO HP 4120 IP <4752775685>	f	\N	\N				CN41G7H2DR	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-05-25	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
262	0	637	2015-05-25 17:54:17.555755-04	14	23	1010	2015-02-04 10:51:25.966857-05	2014-03-11	2015-03-06	\N	IN2126	PROYECTOR MARCA INFOCUS MODELO IN2126	XXXX	HM4671	1010421	NO PRENDE	INFORMACION DE DOCTORDISPLAY: TEL (55)56878786\r\nPASADENA No16, COL. DEL VALLE, CP 03100, DEL. BENITO JUAREZ, MEXICO DF.	NINGUNA	SE REEMPLAZA LAMPARA DAÑADA POR UNA QUE FUNCIONA CORRECTAMENTE.	2	2	1	INFOCUS IN2126 <01009140>	f	\N	\N				1SBKMK34900547	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-02-05	\N	\N	2015-05-25 17:54:17.555461-04	\N	\N		f	f	f	f	f	f	f	f	f	f
455	1	637	2015-05-26 20:06:36.401479-04	37	37	1086	2015-05-25 18:07:26.995598-04	\N	2015-06-01	\N					1086067	Requiere servicio preventivo.		Ninguna.	Se realiza servicio preventivo, limpieza interna, revisión estado de lámpara, funcionamiento de botones y proyección de video. Costo servicio: $500.00 + IVA. HM17870	2	2	\N	HM17870	f	1	4		INFOCUS	IN2126	BKMK34900547	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	1	\N	2015-05-26 20:06:36.40124-04	\N	\N	Cable alimentación corriente, cable video VGA.	f	f	f	f	f	f	f	f	f	f
444	0	4	2015-05-27 12:06:32.681636-04	14	42	1086	2015-05-15 13:24:07.154688-04	2014-10-24	2015-06-16	\N	J5N26LT	HP 240 G3 Notebook PC	CARGADOR	14228	1086719	EQUIPO NO MANDA IMAGEN		ninguna	Se le cambia tarjeta madre en centro de servicio\r\n\r\nSe le reinstala el sistema 	2	2	1	HP 240 G3 Notebook PC <4752234484> factura HM17871	t	\N	\N				CND42235RJ	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-05-15	\N	\N	2015-05-27 12:06:32.681305-04	\N	\N		f	f	f	f	f	f	f	f	f	f
250	2	\N	2015-05-26 13:45:59.73985-04	3	8	1175	2015-01-28 17:15:56.694881-05	\N	2015-02-27	\N					1175247	EQUIPO COMPLETO ESCRITORIO.\r\nSe solicita un equipo de escritorio, teléfono y todo lo necesario para su instalación; así como la revisión del cableado y red para él mismo. Este equipo se asignara a 1 de los nuevos colaboradores por ingresar. Gracias!		ninguna.	Confirmación del usuario por Skype de la solución del problema reportado. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250.\r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-05-26 13:45:59.739559-04	\N	\N		f	f	f	f	f	f	f	f	f	t
353	2	\N	2015-05-26 14:48:51.774657-04	3	9	1198	2015-03-20 20:17:06.711412-04	\N	2015-04-20	\N					1198749	BUENAS TARDES\r\n\r\nEL PRESENTE ES PARA INFORMARLES QUE PROXIMAMENTE ESTA INGRESANDO UN NUEVO COLABORADOR AL ÁREA DE SOLUCIONES TECNOLOGICAS, POR LO QUE SE REQUIERE DEL SIGUIENTE EQUIPO:\r\n1 PORTATIL: CORE I5 500GB DISCO DURO, DAPTADOR DE RED, ADAPTADOR DE USB A R32 MACHO.\r\n1- TELEFONO\r\n1. SILLA\r\n1. DOCKING\r\nCUENTA  DE SKYPE\r\nCUENTA DE CORREO\r\nCLAVE DE IMPRESIÓN\r\n SIN MAS POR EL MOMENTO. GRACIAS		Ninguna	Confirmación del usuario por Skype de la solución del problema reportado. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250.\r\n	2	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	2015-05-26 14:48:51.774249-04	\N	\N		f	f	f	f	f	f	f	f	f	t
457	1	935	2015-05-26 15:21:25.714132-04	46	46	1088	2015-05-26 15:21:25.691111-04	\N	2015-06-02	\N					1088812	INSTALACION Y CONFIGURACION DE MULTIFUNCIONAL HP A 9 EQUIPOS				0	2	\N		f	3	3		HP	A8P79A	CNB7H1N18R	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	\N	2015-05-27 15:00:00-04	2015-05-27 15:00:00-04		f	f	f	f	f	f	f	f	f	f
458	0	883	2015-05-26 18:06:11.282744-04	14	14	1091	2015-05-26 17:46:36.411956-04	2014-05-16	2015-06-25	\N	HPE3T81LT	HP ALL IN ONE 205	POR DEFINIR	6756	1091766	NO DA VIEDEO		ninguna		1	2	1		f	\N	\N				4CE4010X80	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			2015-05-26	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
460	0	742	2015-05-26 19:24:07.838676-04	19	19	1092	2015-05-26 19:24:07.81328-04	2015-04-10	2015-06-25	\N	HPCE278AD	TONER HP 784 LJ P1566 NEGRO DUAL PACK	No aplica	HM16524	1092433	SE MUESTRA AL TONER COMO SI ESTUVIERA SECO				0	2	2		f	\N	\N				No aplica	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
456	1	946	2015-05-26 19:34:15.691591-04	37	4	1087	2015-05-26 11:29:32.731639-04	\N	2015-06-02	\N					1087946	INSTALACIÓN DE NODO Y ASESORÍA PARA LA INSTALACIÓN DE MEDIDOR BI DIRECCIONAL CFE 			Costo de servicio instalación: 850 + IVA.	1	2	\N		f	3	4		INSTALACION	MODEM MEGACABLE	NINGUNO	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	\N	2015-05-26 19:30:00-04	2015-05-26 22:00:00-04	CANALETA CABLE UTP	t	t	f	f	f	f	f	f	f	f
461	2	\N	2015-05-26 19:35:27.21891-04	8	8	1220	2015-05-26 19:35:27.215254-04	\N	2015-05-29	\N					1220418	Buenas tardes:\r\nFavor de instalar impresora HP MFP M476NW color en sustitución del equipo dañado HP CM2320NF MOD.CC436A, en maquina de Ramon Lara, donde se encuentra fisicamente (almacén) y por red en maquina Isabel Ubaldo (administración.\r\nGracias!!				0	\N	\N		f	\N	\N					f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	\N	\N	\N	\N	\N		f	f	f	f	f	f	f	f	f	f
459	1	336	2015-05-26 19:44:33.692381-04	4	47	1089	2015-05-26 18:21:03.890059-04	\N	2015-06-02	\N					1089205	impresora B6200 OKIDATA ya que me esta mandando 1 hoja extra cuando mando imprimir pero la manda en blanco limpia podrá tener con una limpieza, o ya de plano cambio ya que también suena el rodillo cuando mando la impresión. impresora de cleo				1	2	\N		f	1	3		okidata	B6200	sn	f	f	f				f	f	f	f	f	f	f	f		f	f		f		f	f			\N	2	\N	\N	2015-05-27 15:00:00-04	2015-05-27 15:00:00-04		f	f	f	f	f	f	f	f	f	f
\.


--
-- Name: core_bitacora_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_bitacora_id_seq', 461, true);


--
-- Data for Name: core_bitacoraimagen; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_bitacoraimagen (id, bitacora_id, imagen) FROM stdin;
5	182	imagen/errorhp.jpg
6	282	imagen/IMG_20150213_143305386.jpg
7	282	imagen/IMG_20150213_143246107.jpg
8	324	imagen/IMG_23851.JPG
9	324	imagen/IMG_23861.JPG
\.


--
-- Name: core_bitacoraimagen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_bitacoraimagen_id_seq', 9, true);


--
-- Data for Name: core_block; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_block (id, texto) FROM stdin;
\.


--
-- Name: core_block_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_block_id_seq', 1, false);


--
-- Data for Name: core_categoria; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_categoria (id, nombre) FROM stdin;
\.


--
-- Name: core_categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_categoria_id_seq', 1, false);


--
-- Data for Name: core_cliente; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_cliente (id, rfc, nombre, sucursal, direccion, ciudad, estado, celular, telefono, telefono_extra, email, contacto, desactivar_email, ext, distribuidor_id) FROM stdin;
1	ENO8910131AA	EXEL DEL NORTE S A P I DE CV	2	LAZARO CARDENAS				(81) 8368 5900		xmlproveedores@exel.com.mx		f		1
2	AMR0705073LA	AUTOS MAGNOS RIO SONORA SA DE CV	2	REFORMA	HERMOSILLO			662 2599500		contabilidad@cadillachermosillo.com		f		2
3	REBL820216DX1	LUZ MARIA MERCEDES DE LOS REYES BURROLA	2	IGNACIA E DE AMANTE	HERMOSILLO							f		3
5	PPP1208295T7	PROPEC PROCESOS PECUARIOS, S.A. DE C.V.	2	CARRETERA A LA COLORADA	HERMOSILLO			662 2510972		jessica.guevara@propec.com.mx		f		5
7	SFA0310144M8	SONORA FORMING ADMINISTRATIVE SERVICES S.A. DE C.V.	2	BLVD. HENRY FORD	HERMOSILLO			662 2895500		sftpayables@cosma.com		f		7
8	HEBD7506237E8	DANIEL LEONEL HERMOSILLO BORBON	2	PRIVADA MORENO 1 ESTE	HERMOSILLO			662 2612584		danyelsh7@hotmail.com		f		8
9	CALM9008065U0	MIRIAM LIZETH CHAVEZ LOPEZ	2	CAMINO DEL SERI	HERMOSILLO			662 2177808		facturas.losprofes@gmail.com		f		9
10	BABP661202M83	PEDRO ANGEL BARCELO BAYON	2	AVE. TERESA MACIAS	HERMOSILLO			662 3588928		super_chicha_sa@hotmail.com		f		10
12	MAMJ821110SC1	JORGE LUIS MADRID MENESES	2	QUINTA DE LAS TORCASAS	HERMOSILLO					arq_madrid@hotmail.com		f		12
13	SOBK-870527-CN0	KARLA PATRICIA SOLANO BACAME	2	AVE SAN MARCIAL	HERMOSILLO			6622 276712				f		13
14	COR0810311H2	CORPOCRED SA DE CV	2	AVE. ALVARO OBREGON	DISTRITO FEDERAL			55 40000643		a.osorio@corpocred.com.mx; a.flores@corpocred.com.mx		f		14
15	CAR0005066U6	CONGELADORA EL ARRECIFE, S.A DE C.V	2	BLVD. VILDOSOLA	HERMOSILLO			662 250 0532		contabilidadarrecife@prodigy.net.mx		f		15
16	LOMC900607EK4	CARLOS LOPEZ MOLINA	2	2DA DE PERIFERICO	HERMOSILLO			662 218 23 27		clm_90@me.com		f		16
17	AEE070712PN3	ASISTENCIA ESPECIAL DE ENFERMERAS SC	2	PILARES NO.9 ESQ. CON AVE.7 DE NOVIEMBRE	HERMOSILLO			217 0770		bespinoza.aee@gmail.com		f		17
18	KAU140725IY8	KOREAN AUTOMOTRIZ S.A DE C.V	2	BLVD.PASEO RIO SONORA	HERMOSILLO			6622599500		pilar.corro@gruposolana.com		f		18
19	RBA930406717	RODRIGUEZ BAGGIO Y ASOCIADOS, S.C.	2	RIO MIXCOAC	DISTRITO FEDERAL			6622366247		daniel.leal92@hotmail.com		f		19
20	VPR091222R63	VSH PROTECCION SA DE CV	2	BENITO JUAREZ	HERMOSILLO			6622106400		maryochoa@vsh-seguridad.com		f		20
21	VAAR731028GT7	RIGOBERTO VALENZUELA AQUINO	2	CALLE 17 AVENIDA 9	GUAYMAS			6222280629		oniuqa1973@hotmail.com		f		21
23	HECD741006SJ0	DOLORES HERRERA CARBAJAL	2	DR.NORIEGA				2135505		mochilandia@hotmail.com		f		23
24	JSE110406T32	JOSMASA SERVICIOS SA DE CV	2	OBRERO MUNDIAL				662 260 8837		ivanescalantep@hotmail.com; alvo90@outlook.com		f		24
25	GLN000912939	GRUPO LOMA DEL NORTE, S.A. DE C.V.	2	AV. ESCOBEDO OTE	TORREON			(871) 722 5321		hp.consumibles@gloma.com.mx		f		25
27	RAOM810104GH3	MARIA MARICELA RAMIREZ ORTIZ	2	LEY FEDERAL DEL TRABAJO				6623 14 40 36		servechermosillo@hotmail.com		f		27
28	SSO1104053J1	SEOD SERVICIOS, OBRAS Y DISEÑOS SA DE CV.	2	ENRIQUE GARCÍA SANCHEZ	HERMOSILLO			662 214 1893		gilberto.lizardi@gmail.com		f		28
29	GOHA771223E98	ANA SILVIA GONZALEZ DE LA HOYA	2	CERRO DEL ORO	HERMOSILLO							f		29
31	EMH140101P92	EQUIPOS MINEROS LA HACIENDA S.A DE C.V	2	CALZADA SALTILLO 400				871 729 6203		Juan_Cortinas@ponoles.com.mx		f		31
32	BABR9304034K1	RICARDO BRAVO BALLESTEROS	2	AURORA BOREAL	HERMOSILLO			662 216 7611		ricardobravoballesteros@gmail.com		f		32
33	OIRR770303MGA	JOSE RODOLFO OLIVEROS RODRIGUEZ	2	CIRCUITO MEDITERRANEO	GUAYMAS			(622) 111 0074		dist.seal@live.com.mx		f		33
34	HEPF900206NH0	FERNANDO HERNANDEZ PEREZ	2	AVE JUAN BAUTISTA DE ANZA	HERMOSILLO			(662) 344 6770		fer_nandohp1990@hotmail.com		f		34
35	MOLF6108127V2	FLORENTINO MONTOYA LOPEZ	2	LADERA	HERMOSILLO			(662)205 6039		tinomontoya@hmo.megared.net.mx		f		35
36	LELC700306GM1	CARLOS ADRIAN LEON LASTRA	2	AV. JUAREZ PORVENIR				656-679-61-59		contabilidad@pc-plus.com.mx		f		36
37	GDI020322DZ7	GRUPO DESARROLLO INFRAESTRUCTURA S.A. DE C.V.	2	MARIANO OTERO	ZAPOPAN			(637) 372 2399		jcramirez@gdi.com.mx; fojeda@gdi.com.mx		f		37
38	ASP010123NG3	ASOCIACION SONORENSE DE PADRES DE NIÑOS AUTISTAS IAP	2	SIERRA DEL BOLEO	HERMOSILLO			662 215 2705		a-ha96@hotmail.com		f		38
39	MGR751110G56	MULTILLANTAS GRIMALDI, S.A. DE C.V.	2	DE LOS PIMAS	HERMOSILLO			662 108 4420		cxp@kaltire.com		f		39
40	AFI920720EZ1	ALERCE FORMACION INTEGRAL SC	2	BOULEVARD NAVARRETE	HERMOSILLO			(662) 260 7770		informatica@alerce.edu.mx		f		40
41	UUN071016UVA	UNIVERSIDAD UNILIDER SC	2	BLVD. ENRIQUE MAZON LOPEZ	HERMOSILLO			(662) 215 7997		daniel.palafox@unilider.edu.mx		f		41
42	BMU8605134I8	BEBIDAS MUNDIALES, S. DE R. L. DE  C.V.	2	BLVD. LAZARO CARDENAS				81 81 32 04 40		bemusa.cxp@arcacontal.com		f		42
43	AFL1304166H8	ADMINISTRADORA DEL FRACCIONAMIENTO LOS LAGOS A.C	2	LAGO DEL CISNE				(662) 2365058		sistemas@dynatech.com.mx; recepcion@dynatech.com.mx		f		43
44	GOMJ8409146C5	JESUS  ROBERTO GOMEZ MENDOZA	2	CALLE 4 LOTE 12 MANZANA	EMPALME			(622) 223 1658		jrgomez84@hotmail.com		f		44
45	AAU840208MD4	AGRICOLA Y AUTOMOTRIZ , S.A. DE C.V.	2	CARRETERA INTERNACIONAL KM 9.5	NOGALES			6313111890		fernando.arreola@agricolavw.com ;  cuentasporpagar@agricolav		f		45
46	IPI860102AI1	INNOVACIONES PITIC SA DE CV	2	BLVD. FRANCISCO EUSEBIO KINO	HERMOSILLO			(662) 260 8090		leinnovaciones@gmail.com		f		46
47	TURA760803LZ9	ANTONIO TRUJILLO RUIZ	2	CERRADA PASEO CUCURPE	HERMOSILLO			(662) 217 0770		dsalcido@ferrologistics.com		f		47
48	HEHA591202NL4	HERNANDEZ HERNANDEZ ARACELI	2	BLVD. JOSE LOPEZ PORTILLO	HERMOSILLO			(662) 2148740		lab_starosa@prodigy.net.mx		f		48
49	CDE110617QZ8	COMERCIALIZADORA DETI SA DE CV	2	CALLE 15	HERMOSILLO			3 02 78 25		comercializadoradeti@hotmail.com		f		49
50	SVA8503182A0	SALES DEL VALLE SA DE CV	2	CIRCUITO INTERIOR	OBREGON			(644) 411 0017		carlos.lechuga@salesdelvalle.com.mx		f		50
6	IMI0708287XA	IACNA MEXICO II S DE RL DE CV	2	BLVD. HENRY FORD	PUEBLA			662 108 1299		OSANDOVAL@IACNA.COM		f		6
11	PEOM-810628-3W9	MARIO JORGE PEREZ OLOÑO	2	AVE. SINOQUIPE	HERMOSILLO	SONORA	(662) 1059850	(662) 1059850	(662) 1059850	mariopreso.81@gmail.com	MARIO PEREZ	f	NINGUNA	11
22	GORR610621231	ROSARIO GOMEZ ROSAS	2	CEREZOS 117, COLONIA FUENTES DEL MEZQUITAL. C.P.: 83240	HERMOSILLO	SONORA	(662)155  2036	(662)155  2036	(662)155  2036	CHA_YO61@HOTMAIL.COM	ROSARIO	f	No Aplica	22
30	RIVA870113IZ0	AGUSTIN ALFONSO RIVAS VARELA	2	AV. OCOTILLO	HERMOSILLO	SONORA	(662) 1 68 01 16	(662) 19 00273			JUAN CARLOS ACOSTA	f		30
52	FDP830815HDA	FRACCIONADORA DINAMICA DEL PACIFICO S.A DE C.V	2	CARRETERA INTERNACIONAL A NOGALES KM 8.7	HERMOSILLO			2135430		dynamica@prodigy.net.mx		f		52
53	HEOI77080659A	IVAN ALEJANDRO HEREDIA ORTIZ	2	PERIFERICO	HERMOSILLO			(662) 212 4767		comercamoca@outlook.com		f		53
54	AUAH741208791	HERIBERTO AUDELO AVILEZ	2	MOCANERO 3253	CULIACAN			(667) 780 2645		ventasmarketoficce@hotmail.com		f		54
55	AAS990219C43	ASISTENCIA ADMINISTRATIVA DE SONORA S.A DE C.V	2	OBRERO MUNDIAL	HERMOSILLO			2 36 50 58		sistemas@dynatech.com.mx		f		55
56	LDM810123TF7	LDM S.A. DE C.V.	2	BLVD. XOLOTL	HERMOSILLO			(662) 108-0034 Ext. 433		compras.aduanas1@corporativoldm.com		f		56
57	NUEM8711272W2	MINERVA ESTEFANIA NUÑEZ ESPINOZA	2	AVENIDA NUEVE	HERMOSILLO			662 3 02 40 55		cecat.info@gmail.com		f		57
58	CVE860215PD8	CONSTRUCTORA VERTEX SA DE CV	2	CALLE BRIÑAS	HERMOSILLO			(662) 236 6001		wsilva@vertex86.com.mx; naguayo@vertex86.com.mx		f		58
59	FAT670201223	FATUVISA S.A DE C.V	2	BOULRVARD GARCIA MORALES	HERMOSILLO			(662) 156 0963		patricia@fatuvisa.com.mx		f		59
60	EITA820325V66	ALEJANDRO ESPINOZA TAPIA	2	AVE LEON GUZMAN	HERMOSILLO			(662) 215 0011		docs.espinoza@gmail.com		f		60
61	LIQS870803NA0	SERGIO ALFONSO LIMON QUINTERO	2	EJE ROSALES	HERMOSILLO			662 174 1121		salq87@gmail.com		f		61
62	ECN910416TV2	ELECTRO CONTROLES DEL NOROESTE SA DE CV	2	BOULEVARD PASEO RIO SONORA SUR	HERMOSILLO			(662) 215 6450		admon.proyectos@ecn.com.mx		f		62
63	MELJ860314JR3	JESUS ANTONIO MEDELLIN LUCERO	2	AVENIDA YECORA	HERMOSILLO			(662) 3416941		maestro_medellin@hotmail.com		f		63
64	AERG770906BN3	JOSE GUILLERMO ARMENTA RUIZ	2	AVENIDA PASEO DEL CIMARRON	HERMOSILLO			(662) 262 6767		gmoarmenta@correom.uson.mx		f		64
65	CRM060329859	CUMMINS ROCKY MOUNTAIN S. DE R.L DE CV	2	BLVD MORELOS	HERMOSILLO			2 80 50 82		mario.palomino@cummins.com		f		65
67	OELG7211239F1	GILDARDO ORTEGA LUNA	2	CALLE 28 Y 29 CALLEJON AVE 33	AGUA PRIETA			(633)335 8196		g_ortega_luna@hotmail.com		f		67
68	AMA080219A26	AGRICOLA MARIA AMPARO, SA DE CV	2	OBRERO MUNDIAL	HERMOSILLO			6623010625 6623013624		egarcia@mazon.com.mx		f		68
69	EIS430714ER6	ENSEÑANZA E INVESTIGACION SUPERIOR  A.C	2	CHAPULTEPEC	SAN LUIS POTOSI			8305-3200 Y 01-444- 12922		emvazque@tecmilenio.mx		f		69
70	CAGR660616UM9	RENE FERNANDO CHAN GOMEZ	2	IGNACIO ZARAGOZA	GUASAVE			6871315780		renechan_secom@hotmail.com		f		70
71	MCO140523PL2	METALURGICA DE COBRE SA DE CV	2	CAMPOS ELISEOS	MIGUEL HIDALGO							f		71
72	OMN140523KH1	OPERADORA DE MINAS DE NACOZARI SA DE CV	2	CAMPOS ELISEOS	MIGUEL HIDALGO							f		72
73	IMC1002022R5	INSTITUTO MUNICIPAL DE CULTURA ARTE Y TURISMO	2	DR. AGUILAR	HERMOSILLO			2138639		neblinacla@hotmail.com		f		73
74	PDA000111U43	PAPELERIA DANY SA DE CV	2	PINO SUAREZ SUR	HERMOSILLO			216-02-74, 260-82-42		almachavez@papeleriadany.com.mx		f		74
75	FQU140322NL7	FORO QUATTRO  S.A.P.I. de C.V.	2	DOCTOR NORIEGA	HERMOSILLO			(662) 2136423		almacecilia_87@hotmail.com		f		75
77	USN910624L44	UNIVERSIDAD LA SALLE NOROESTE AC	2	VERACRUZ	OBREGON			1090946		anel.alvarado@regislasalle.edu.mx		f		77
78	DIN910819QA9	DINAMICA INDUSTRIAL DEL NOROESTE S.A DE C.V	2	TABASCO	HERMOSILLO			2 10 67 09				f		78
79	SABE7800057R6	ESTEBAN SANCHEZ BAUTISTA	2	AVENIDA PLUTARCO ELIAS CALLES	HERMOSILLO			662 180 2655		oscar.1207junio@gmail.com		f		79
80	CAAE870420EFA	EDUARDO CAMACHO ACUÑA	2	HERIBERTO VALDEZ PONIENTE	LOS MOCHIS			6681657117 y 6681768852		benjamin.acuna@printpro.com.mx		f		80
81	GNO930317ID7	GASOLINERAS DEL NOROESTE SA DE CV	2	CALLE 6	AGUA PRIETA			01 633-338-2554		libarrola@ibael.com  ;  eiexml@ibael.com		f		81
82	EIE920502BB0	EMPRESAS IBARROLA ELIAS SA DE CV	2	CARRETERA INTERNACIONAL	AGUAPRIETA			01633-338-2554		libarrola@ibael.com  ;  eiexml@ibael.com		f		82
83	YAEC500901HT4	CARLOS ARMANDO YBARRA ENCINAS	2	BENITO JUAREZ	HERMOSILLO					ybarraca@yahoo.com.mx		f		83
84	ROLA660717AY4	ALFREDO RODRIGUEZ LEON	2	CEFIRO	HERMOSILLO			1-35-31-40				f		84
85	CMU860106H75	CLAUDIA CAROLINA MUÑOZ VAZQUEZ	2	LAMPONTILLO				6622 689480				f		85
86	BSS140303BY1	BEL SERVICIOS Y SUMINISTROS SA DE CV	2	AV SEIS	HERMOSILLO			(662) 143 5316,  2603525		lorenaanguloh4@hotmail.com		f		86
88	SAO0511298X6	OPERASON S.A DE C.V	2	CALLE DE LOS PIMAS	HERMOSILLO			217 37 07   217 37 16		facturasao@minasdeoro.com		f		88
89	BUAL680824D1A	MARIA LUISA BUSTAMANTE AMBRIZ	2	VALLE E MENA	NEZAHUALCOYOTL			(55) 5711 8829		a_aconsumibles@hotmail.com		f		89
90	TSA920227QH7	TRIBUNAL SUPERIOR AGRARIO	2	ORIZABA	MEXICO			214 7906				f		90
92	FOCG701114QW3	GRUPO PAPELERO SMART	2	SIRVENT	TIJUANA			664 216 9598		gpsxml@gmail.com		f		92
93	ROSF651029BT2	FRANCISCO JAVIER RODRIGUEZ SANCHEZ	2	CALLE 20 Y AV 15	GUAYMAS			622 2241377		mundo_internet@hotmail.com		f		93
94	CCA100617PJ5	COMERCIALIZADORA CAMOCA, S.A DE C.V	2	JUAREZ	HERMOSILLO			(662) 2 12 47 67		COMERCAMOCA@OUTLOOK.COM		f		94
95	IAME690730FS1	ELSA VERONICA IBARRA MORALES	2	GRAL. BERNARDO REYES	HERMOSILLO			6623102698		elsavero@hotmail.com		f		95
96	AIRE6703046P4	ERNESTO ORLANDO ARVIZU ROUSSE	2	AVENIDA LINCES	HERMOSILLO					ernestto67@hotmail.com		f		96
97	RIPT760112M10	MARIA TERESA RIVERA PARTIDA	2	REPUBLICA DE CUBA	HERMOSILLO					rinconpapeleria@hotmail.com		f		97
98	MOAL6103312B1	MARIA LOURDES MOLINA ACEDO	2	PRIMO DE VERDAD	HERMOSILLO			250 5366				f		98
99	GMS060614P46	GONZALEZ MARTINEZ Y COMPAÑIA SERVICIOS EN COMERCIO EXTERIOR SC	2	CIRCUITO EL TITANIO	HEROICA DE NOGALES			2890010		eduardo@secomex.com.mx		f		99
100	HME871101RG3	HEWLETT-PACKARD MEXICO S. DE R.L DE C.V.	2	AV. PROLONGACION REFORMA	MEXICO			01 55 5 25 8 46 00		hp.invoicereception@hp.com		f		100
76	IME070108PX7	IACNA MEXICO S DE RL DE CV	2	CALLE 4 LT 8	TOLUCA			52777319299		igarcia01@iacgroup.com		f		76
51	MOSTGOHM8907224IA	MARIANO GONZALEZ HERNANDEZ	2	AV. CONCHITAS RDCIAL LOMA BONITA	HERMOSILLO	SONORA	(662) 211 17 33	(662) 211 17 33	(662) 211 17 33	MGONZALEZ@MAINTEK.NET	MARIANO GONZALEZ	f	MGONZALEZ@MAINTEK.NET	51
66	UKI8508206P3	UNIVERSIDAD KINO AC	2	CALZADA PBRO. PEDRO VILLEGAS RAMIREZ	HERMOSILLO	SONORA	(662)2590808	(662)2590808	(662)2590808	vanessa@unikino.mx	Vanessa Torua 	f	No Aplica	66
91	PPG751215RA6	PRODUCTOS PESQUEROS DE GUAYMAS S.A DE C.V	2	SIN NOMBRE MANZANA C	GUAYMAS	SONORA	(622) 2250300	(622) 2250300 ext 320		arivas@guaymex.com	ALBERTO RIVAS	f	320	91
101	EPR-100624-IG3	EC PRINT, S.A. DE C.V.	2	VIA RAPIDA PONIENTE	TIJUANA			664 608 02 00				f		101
102	KDS020613NR5	KENWORTH DISTRIBUIDORA DE SONORA, SA DE CV	2	BLVD. FCO. EUSEBIO KINO	HERMOSILLO			(662) 210 67 60		recepcion@kwsonora.com		f		102
104	JIRJ9210111J7	JAVIER LEONARDO JIMENEZ RUELAS	2	PERIFERICO SUR	HERMOSILLO			6622817647				f		104
105	SAS1011249C3	SKINODUCTO & SPIRODUCTO SA DE CV	2	GENERAL PIÑA	HERMOSILLO			662 267 11 37				f		105
106	FEBJ8108145X7	JESUS ARMANDO FELIX BAYARDO	2	CIRCUITO DE LOS CEDROS	HERMOSILLO			197 0974				f		106
107	TEGJ880206B71	JAIME ARTURO TELLEZ GONZALEZ	2	AVENIDA PIEDRA SIDERITA	HERMOSILLO							f		107
108	IDV091220FU7	INGENIERIA DV S.A DE C.V	2	ANGEL GARCIA ABURTO				2 15 60 50		aflores@ingenieriadv.com		f		108
109	DLE010430QP0	D LUZ ELECTRICA S.A. DE C.V.	2	PERIFERICO NORTE 20				(662)214 12 88		contacto.hmo@dluzelectrica.com.mx		f		109
110	VABH870323RH9	HILDA GUADALUPE BERMUDEZ VALENZUELA	2	SAN JUAN	HERMOSILLO			6623-26-32-64				f		110
111	DURL7005105W5	DUARTE RODRIGUEZ MAYO LEON	2	BACADEHUACHI								f		111
112	TCO130305A4A	TL CONSTRUPROYECTOS S.A. DE C.V.	2	CORDILLERA ALASKA						lfuentes_87@hotmail.com		f		112
113	WIAD450328JX9	MARIA DOLORES WILLIAMS ANDRADE	2	LIC. PRIMO DE VERDAD	HERMOSILLO			214 1394, 210 2233		offimundo@gmail.com		f		113
114	JME040430993	JAVID DE MEXICO, S DE R.L DE CV	2	CARR. INT Y PERFERICO L.D.C	NOGALES			(631) 311 39 50		cmartinez@javidmexico.com		f		114
115	SFC1401101F0	SERVICIOS FRONTERA COBRE DEL MAYO, S.A. DE C.V.	2	LOCALIDAD PIEDRAS VERDES	ALAMOS			52-647428-3026		Dinora Urbalejo <dinora.urbalejo@cobredelmayo.com		f		115
116	DTN931028649	DESARROLLOS TECNOLOGICOS DEL NOROESTE SA DE CV	2	VILLA MARIA				2 13 00 72		mariel.flores@dtnmex.com		f		116
117	GAEM691218JM5	MARTHA CECILIA GALVEZ ENRIQUEZ	2	CONSTITUCION	HERMOSILLO			2106262		marthaceciliage@yahoo.com.mx		f		117
118	CAEF620429HU3	FRANCISCO DAVID CASTILLO ENCINAS	2	IGNACIO AYALA	HERMOSILLO			2126615		davidcastillo_m@hotmail.com		f		118
119	CAL110106RH1	CS ALIMENTOS S.A DE C.V	2	AV. GERMAN TAPIA GAMEZ				(662)2 67 11 22		contabilidad@citysalads.com		f		119
120	CEL920210FB7	COMISION ESTATAL DE LA LECHE	2	EDIFICIO ESTATAL SUR SEGUNDO NIVEL				2172700				f		120
121	QNO9903229J0	QAR DEL NOROESTE SA DE CV	2	CALZADA LOS ANGELES				109 33 00		maria.coronado@grupoqar.com		f		121
122	LULO8205248A6	OSCAR MAURICIO LUNA LOPEZ	2	PASEO DE LOS PELICANOS				(447) 138 7143				f		122
123	GADJ791230FT0	JESUS MANUEL GRACIA DEWAR	2	TUNEZ				662 140 0070		jesusgracia00@hotmail.com		f		123
124	FEEM730213UU4	MIRCIA VERONICA FELIX ESPINOZA	2	DOMINGO OLIVARES				662 260 1028		papeleria.aquarela@hotmail.com		f		124
125	CMR9201064P4	COMPUMARK S.A DE C.V.	2	POLOTITLAN				(81) 8346-1770 ext.124		raquel.zapata@compumark.com.mx		f		125
126	OOL1208084E8	OLN OPERADORA LOGISTICA DEL NOROESTE S A P I DE C.V.	2	CAMINO GRANJA MERCEDES				(662) 216 5638		cdiaz@redactiva.com.mx		f		126
127	CNO931208RL9	COPILASER DEL NORTE, S.A. DE C.V.	2	ALTAMIRANO				01 614 426 7020		jc.servin@copilaser.com.mx; j.chacon@copilaser.com.mx		f		127
128	SEM131105SF0	SISTEMA ESPECIALIZADO DE MONITOREO INTEGRAL CASSA S.A DE C.V.	2	PRIVADA A				212 38 30		semicassa@gmail.com		f		128
130	TSO131007GW3	TETRIX SOLUTIONS. S. A DE C.V.	2	BLVD. DE LOS SERIS				251 0819		abestrella@tetrixsolutions.com.mx		f		130
131	VEPN710510P2A	NORMAN VEGA PACHECO	2	PRIV MONREALE	HERMOSILLO			2126063 /2126065				f		131
132	GAG990412U14	GANFER SOCIEDAD AGRICOLA, S.A DE C.V.	2	JESUS GARCIA				662 280 5059				f		132
133	MIL070126KQ1	MRAI INTERNATIONAL LLC S.A DE C.V.	2	NUEVA ZAMBIA				(631) 311 39 50		facturacion@seitsa-consultores.com		f		133
134	GANA830925RW1	ALAN DE JESUS GALLARDO NAVARRO	2	PRIV. FRASCATI				66 2196 7467				f		134
135	CRE631115HG4	COLEGIO REGIS A.C	2	JAVIER DE LEON	HERMOSILLO			214 10 50		proveedoresregis@hotmail.com		f		135
136	PAEJ830427R36	JESUS PARRA ESTRADA	2	FRANCISCO JAVIER MINA	HERMOSILLO			139 15 47		jesusparra_@hotmail.com		f		136
137	LERA7601309TA	AARON RIGOBERTO LEON RUIZ	2	PRIVADA ACUARELA	HERMOSILLO			6628 48 06 97		aaron_lr@hotmail.com		f		137
138	RUSA841107IK3	AIDA FERNANDA RUIZ SALDAÑA	2	RIO COATZACOALCOS	RAMOS ARISPE							f		138
139	ORG060302RI9	ORGOM, S. A DE C. V	2	JALISCO	TIJUANA			664 638 81 32		eibarra@exernaservicios.com		f		139
140	MAS760819NU9	MATERIALES ARQUITECTONICOS DE SONORA SA DE CV	2	BLVD. LUIS ENCINAS Y LOPEZ DEL CASTILLO	HERMOSILLO			218 59 82		julio.vallejo@massa.mx		f		140
141	IMC9701024T5	IBM DE MEXICO COMERCIALIZACION Y SERVICIOS S DE RL DE CV	2	ALFONSO NAPOLES G	DISTRITO FEDERAL			55 5270 3000		mgardun@mx1.ibm.com		f		141
143	MCL9901258E3	AARON ARMANDO FELIX ORTIZ	2	P. DE LA RIVERA	HERMOSILLO							f		143
144	MLC9901258E3	RITO MANUEL VILLEGAS SPENCER	2	CDA. KUKUPA	HERMOSILLO							f		144
145	BEBB8708054I6	BARBARA BELTRAN BARRIENTOS	2	BLVD. JUAN NAVARRETE LOCAL 1	HERMOSILLO			262 01 38		barbara.beltran@gmail.com		f		145
147	CIA820316TI4	CENTRO DE INVESTIGACION EN ALIMENTACION Y DESARROLLO, A. C.	2	CARRETERA AL VARADERO NACIONAL KM 6.6	GUAYMAS							f		147
148	HISD840708JD8	DANIEL ALEJANDRO HINOJOSA SAENZ	2	AVE. DE LA CONQUISTA	HERMOSILLO			229 80 96		ing.daniel.hinojosa@hstechnologies.com.mx		f		148
149	SAU5203032M7	SUPER AUTOS SA DE CV	2	BLVD. JOSE MARIA MORELOS	HERMOSILLO			109 02 00		rcantu@superautospremier.com.mx		f		149
150	MCL9901258E3	BARBARA MARIELA RAMOS VEGA	2	PALOMA	HERMOSILLO							f		150
151	MCL9901258E3	MARIA MAYREL PEREZ LIZARRAGA	2	SEVILLANA	HERMOSILLO							f		151
152	SEI111129128	SOLUCIONES ELECTRICAS INDUSTRIALES NVH SA DE CV	2	PUEBLO BONITO	HERMOSILLO			220 22 82				f		152
153	QSU1205315Q7	QAR SUPERMERCADOS S A P I DE CV	2	CALZADA LOS ANGELES	HERMOSILLO			1 18 96 59		efacturasacreedores@abarrey.com; victoria.robles@abarr		f		153
103	PSN960705716	PRODUCTOS Y SERVICIOS DEL NOROESTE SA DE CV	2	VERACRUZ	HERMOSILLO	SONORA	(662) 109 4000	(662) 109 4000	(662) 109 4000	eacosta@superllantas.com.mx	EDUARDO ACOSTA	f	4477	103
154	VCP1307088R8	VALCOR CORPORATIVO PROFESIONAL S DE R. L. DE C. V.	2	JAIME NUNO	HERMOSILLO			262 73 46		roberto@flexbpo.com;cfuentes@freshsoftwareconcepts.com		f		154
155	FMI110622PJ6	FACILIDADES Y MANTENIMIENTO INDUSTRIAL FMI SA DE CV	2	AVENIDA CALPULLI	HERMOSILLO			311 85 34		fmi.solis@gmail.com; fmi.olea@gmail.com		f		155
156	MMI080711A24	MEGASHEAR MINING-EXPLORATION SA DE CV	2	BLVD. CARLOS QUINTERO ARCE	HERMOSILLO			136 80 80		emma.garcia@argonautgold.com		f		156
157	ZENP701213IX5	PATRICIA ZEPEDA NUÑEZ	2	AVE. EDUARDO W. VILLA	HERMOSILLO			6623 464577/ 2162527				f		157
158	GAMM570617IN7	MIGUEL MARTIN GANDARA MADRIGAL	2	CARLOS ORTIZ LOCAL 6	HERMOSILLO					mgandaramadrigal@yahoo.com.mx		f		158
159	SEG970227BQ2	SEGLO S.A DE C.V	2	PRIVADA 15 DE MAYO	PUEBLA			237 9462		alejandra.arreola@seglo.com.mx		f		159
160	APA130506N52	ALMERIA DEL PACIFICO SA DE CV	2	LUIS ENCINAS JOHNSON	HERMOSILLO			289 89 20		cobrafactura@hotmail.com		f		160
161	GVE051223GQ5	GASOLINERA EL VERTEDOR SA DE CV	2	JOSE SANTIAGO HEALY	HERMOSILLO			2149295		facturacion.electronica@grupoalvarado.com.mx		f		161
162	GMA020213C39	GASERVICIO MATAMOROS SA DE CV	2	JOSE SANTIAGO HEALY	HERMOSILLO			2149295		facturacion.electronica@grupoalvarado.com.mx		f		162
163	GAL0512238SA	GASOLINERA ALVER SA DE CV	2	JOSE SANTIAGO HEALY	HERMOSILLO			2149295		facturacion.electronica@grupoalvarado.com.mx		f		163
164	FEC920212PB9	FOMENTO EDUCATIVO Y CULTURAL FRANCISCO DE IBARRA AC	2	AVE. UNIVERSIDAD AUTONOMA DE DURANGO	DURANGO			210 50 02		jsagasta@uds.com.mx		f		164
165	GDR060807PB0	GLOBEXPLORE DRILLING SA DE CV	2	ENRIQUE MAZON RUBIO	HERMOSILLO			215 32 67		norma.jimenez@globexploredrilling.com		f		165
166	MOC850913JD2	MERCANTIL OCCIDENTAL SA DE CV	2	DR. NORMAN E. BOPRLAUG	CD. OBREGON			644 410 22 00		finanzas@mercantiloccidental.com		f		166
167	GOJ9607224R2	GRANJAS OJAI SA DE CV	2	AVE. MIGUEL HIDALGO	HERMOSILLO			664 414 91 17 EXT.174		jorge.vega@grupoojai.com		f		167
168	PEVM530330BH7	MARTHA ALICIA PRECIADO VALENCIA	2	BLVD. VILLA BONITA	CD. OBREGON			01644 445 2064		siisonora@hotmail.com		f		168
169	ROSM750211TW2	MANUEL RENE ROSAS SAMANIEGO	2	CARLOS CATUREGLI	HERMOSILLO			6622 56 44 78		renerosas.s@gmail.com		f		169
170	TSH940307MV9	TRAVESIAS SHEREZADA SA DE CV	2	BLVD. NAVARRETE	HERMOSILLO			260 35 51		info@sherezadaviajes.com		f		170
171	MORJ6506249D5	JUAN RICARDO MORENO ROBLES	2	ARCO IRIS	HERMOSILLO							f		171
172	DOPR640101FV3	RITA TERESA DORAME PIÑA	2	SAN MELECIO	HERMOSILLO			251 71 37 / 6621 37 29 48				f		172
173	SOL021205B49	SEGLO OPERACIONES LOGISTICAS SA DE CV	2	PRIV. 15 DE MAYO	PUEBLA			237 9462 Ext 6012		alejandra.arreola@seglo.com.mx		f		173
174	CMN681016224	CENTRO MEDICO DEL NOROESTE SA DE CV	2	LUIS DONALDO COLOSIO	HERMOSILLO			108 09 50		ramongarcia@clinicadelnoroeste.com		f		174
175	BAPJ661005GP0	JOAQUIN BAYARDO PONCE	2	ASTURIAS	CUIDAD OBREGON			644 998 78 14		jbayardo@cajeme.com.mx		f		175
176	IKL900119HW3	INDUSTRIAS KOLA LOKA SA DE CV	2	RAMON CORRAL	HERMOSILLO			214 40 90		facturahermosillo@kolaloka.com; vvaldez@kolaloka.com		f		176
177	CHE860930IJA	COMERCIAL DE HERRAMIENTAS SA DE CV	2	ISIDORO SEPULVEDA	APODACA			01818 196 26 00		lrangel@totalcraft.com.mx		f		177
178	EME870831T20	EPSON MEXICO, S.A DE C.V.	2	BLVD. MANUEL AVILA CAMACHO	MEXICO			01 55 13 23 20 00 etx. 21		alechuga@epson.com.mx		f		178
179	UTS020902FI7	UNIVERSIDAD TECNOLOGICA DEL SUR DE SONORA	2	DR. NORMAN E. BORLAUNG KM 14	CAJEME			01644 414 86 87 EXT 120		rerellano@uts.edu.mx		f		179
180	PEEG720604CL5	GABRIELA ELVIRA PEREA ESPINOZA	2	RUTA MARIANO MATAMOROS	TIJUANA			664 978 55 10				f		180
181	GSM071030733	G Y S MARKETING S DE RL DE CV	2	BOULEVARD IGNACIO SOTO	HERMOSILLO			215 38 71		yrodriguez@gysmarketing.com		f		181
182	ASO951108RMA	AGROEXPORT DE SONORA SA DE CV	2	GARMENDA	HERMOSILLO			210 18 01 Y 12				f		182
183	PCL0101275N6	PROMOTORA CL SA DE CV	2	GARMENDIA	HERMOSILLO			210 18 01 Y 12				f		183
184	ACO100902U59	AGRICOLA COSI SA DE CV	2	GARMENDIA	HERMOSILLO			210 18 01 Y 12				f		184
185	XAXX010101000	EDGAR DARIO MARTINEZ TAFOLLA	2	AVENIDA QUIEROBABI	HERMOSILLO			(662) 264 0388				f		185
186	NGS1107274Y6	NUEVA GENERACION SONORA AC	2	BLVD ABELARDO L. RODRIGUEZ DIFICIO ISABEL DESPACHO 3	HERMOSILLO			210 56 73				f		186
187	RTU7410102Z8	RENTA TUR SA DE CV	2	GARMENDIA	HERMOSILLO			210 18 01 y 12				f		187
188	AUHC7605283M0	CARLOS AGUSTIN AGUIRRE HARO	2	CERRADA SEBASTIAN EL CANO	HERMOSILLO			carlosaguirreharo@hotmail		carlosaguirreharo@hotmail.com		f		188
189	PTE0802197FA	PERYAN TECNOLOGIA SA DE CV	2	MATEO RAMIREZ	HERMOSILLO			210 38 05				f		189
190	AGE990706CA7	AGRICOLA Y GANADERA LA ESPERANZA SA DE CV	2	BLVD. KINO	HERMOSILLO			109 01 00				f		190
191	INC9805295N1	INMUEBLES Y CONSTRUCCION DEL NOROESTE SA DE CV	2	ADALBERTO TRUQUI	HERMOSILLO			218 93 69		anoriega@inconno.com		f		191
192	SAM0802087G0	SEI & METALMECANICA SA DE CV	2	DEL PLOMO	HERMOSILLO			251 00 60				f		192
193	MDG110119BT5	MASSON DESING GROUP SA DE CV	2	PRIVADA CARSOLI	HERMOSILLO			310 42 52				f		193
194	GAMM770729LK0	MARTHA PATRICIA GALLEGO MEDRANO	2	SAN ATALO	HERMOSILLO			218 49 12				f		194
195	SPM970401I24	SERVICIO PESQUEIRA MATUZ SA DE CV	2	JOSE SANTIAGO HEALY	HERMOSILLO			214 92 95		facturacion.electronica@grupoalvarado.com.mx		f		195
196	GSO020107RR9	GASOLINERA SOYOPA SA DE CV	2	JOSE SANTIAGO HEALY	HERMOSILLO			214 92 95		facturacion.electronica@grupoalvarado.com.mx		f		196
197	GSE970411DXA	GASOLINERA EL SERI SA DE CV	2	JOSE SANTIAGO HEALY	HERMOSILLO			214 92 95		facturacion.electronica@grupoalvarado.com.mx		f		197
198	VAMM810926EP5	MANUEL OCTAVIO VALENZUELA MUÑOZ	2	AVE. DECIMA PRIVADA DE YAÑEZ	HERMOSILLO			135 30 95				f		198
199	MACM7802127L6	MAURO ELEAZAR MALDONADO CONTRERAS	2	CONOSIDO	ACONCHI			623 233 03 84				f		199
200	DOPA750318R38	ANDRES RICARDO DOMINGUEZ PULIDO	2	AVENIDA DE LAS VENDIMIAS	HERMOSILLO							f		200
201	GGA921106TH3	GUADALUPANA GASOLINERA SA DE CV	2	JOSE SANTIAGO HEALY	HERMOSILLO			214 92 95		facturacion.electronica@grupoalvarado.com.mx		f		201
202	GAL921106GK6	GASOLINERA ALVARADO SA DE CV	2	JOSE SANTIAGO HEALY	HERMOSILLO			214 92 95		facturacion.electronica@grupoalvarado.com.mx		f		202
203	VARG660917871	MARIA GUADALUPE VALENZUELA RIOS	2	CERRADA DE MINA	HERMOSILLO			260 32 92				f		203
204	MLI940407HN1	MINERALES LIBERTAD SA DE CV	2	EMILIO BERAUD	HERMOSILLO			311 88 39		mineraleslibertad@hotmail.com		f		204
205	TUAM610101HH5	MARIA TRUJILLO ARVIZU	2	BLVD LOPEZ PORTILLO	HERMOSILLO			215 80 40				f		205
206	MIG130528PD8	MANTENIMIENTO INDUSTRIAL GAXIOLA SA DE CV	2	EVERARDO MONROY	HERMOSILLO			310 36 63				f		206
207	XAXX010101000	MARIELA JOSELYN GALVEZ ESCALANTE	2	ARCO IRIS	HERMOSILLO							f		207
210	ISL090820QL6	IMPRIME SIN LIMITES S DE RL DE CV	2	BLVD. SANCHEZ TABOADA	TIJUANA			6646818163				f		210
211	TAF100906E88	TAFAM SA DE CV	2	BOULEVARD FRANCISCO EUSEBIO KINO	HERMOSILLO					almacenhinn@vallegrande.com.mx		f		211
212	TPI7302201V28	TRANSPORTES PITIC SA DE CV	2	CALZADA DE LOS PINOS	HERMOSILLO			259 90 18		gesquivel@tpitic.com.mx; pvasquez@tpitic.com.mx		f		212
213	GUOR5408107P4	RUBEN GUTIERREZ OSORIO	2	BOSQUES DE LAS PRADERAS	HERMOSILLO							f		213
214	GARR620411HE2	RENE OCTAVIO GARCIA RIVERA	2	AVE. SALAMANCA SECCION DEL FERROCARRIL	HERMOSILLO							f		214
215	ROVC721027358	CARLOS FRANCISCO ROMERO VILLALOBOS	2	PRIVADA DURANCE	HERMOSILLO			6622 220 61 27				f		215
216	VILR840430D88	ROBERTO CARLOS VILLARREAL LEON	2	PASEO DE LAS MARGARITAS SUR	HERMOSILLO							f		216
217	BACJ7107306Q7	JORGE EDUARDO BARRAGAN CHACON	2	PRIVADA DURANCE	HERMOSILLO							f		217
218	USI020415U24	UNIVERSIDAD DE LA SIERRA	2	CARRETERA MOCTEZUMA-CUMPAS KM 2.5	MOCTEZUMA			634 342 96 00				f		218
219	OECA7012153B6	ARTURO ALFONSO ORTEGA CASTRO	2	NAYARIT	CARBORCA			637 372 03 68		arturoortegac@hotmail.com		f		219
220	VAMP861026337	PRISCILA VALENZUELA MORENO	2	CUERNAVACA	HERMOSILLO							f		220
221	TEME7512298I9	EMILIA TERAN MORENO	2	ANTONIO CASO	HERMOSILLO							f		221
222	MUAJ861225GL4	JORGE LUIS MUÑOZ ASTIAZARAN	2	AVE. VIA DEL TORCAS	HERMOSILLO			218 49 12				f		222
223	GADL7008154E1	MARIA LAURA GAMBOA DURAN	2	DE LAS MISIONES	HERMOSILLO			218 49 12				f		223
224	GOMP681017CE0	PILAR GOMEZ MUÑOZ	2	RETORNO GRANADA	HERMOSILLO			218 49 12				f		224
225	MTK861014317	MAQUILAS TETAKAWI, S.A DE C.V	2	CARR. INTERNACIONAL KM 1969 GUAD-NOG KM2	EMPALME			225 40 21		efactura@mtk.com.mx		f		225
226	FERA721221RJ7	ANA GRISELDA FERNANDEZ RENDON	2	RETORNO CANANEOS	HERMOSILLO			662 197 09 78				f		226
227	BAGE620714BK7	EDUARDO RENE BALLESTEROS GUTIERREZ	2	DE LAS AMERICAS	HERMOSILLO			215 34 12, 13 Y 21		marisela@solucionesadhesivas.com.mx		f		227
228	COM040930S28	COMERCI SA DE CV	2	NO REELECCION OTE	CD. OBREGON			(644) 410 98 00				f		228
231	GES790913CT0	GOBIERNO DEL ESTADO DE SONORA - CONTRALORIA	2	COMONFORT Y DR. PALIZA	HERMOSILLO			217 20 51		factura.contraloria@sonora.gob.mx;andrea.castillo@sonora.gob		f		231
232	GES790913CT0	GOBIERO DEL ESTADO DE SONORA (PGJ)	2	COMONFORT Y DR. PALIZA	HERMOSILLO			259 48 00				f		232
233	SCA0305068C1	SALSAS CASTILLO S A P I DE CV	2	ASTEROIDES	HERMOSILLO			251 05 19 / 01 800 234 00		nsantiago@salsascastillo.com		f		233
234	AAU0205318M1	AIISA AUTOMATION SA DE CV	2	ANGELA PERALTA	HERMOSILLO			213 45 90				f		234
235	SSC040816G99	SUPPLIERS CITY, S.A DE C.V	2	BLVD. FUTURA	HERMOSILLO			2 37 96 22		ibeltran@suppliercity.com.mx		f		235
236	CEG110503IN2	CENTROS ESCOLARES GEU. A.C.	2	ESTHER TAPIA DE CASTELLANOS	JALISCO			33 3617 37 77		mgocano@gmail.com		f		236
239	FRC810401N85	FIDEICOMISO DE RIESGO COMPARTIDO	2	IGNACIA E. DE AMANTES	HERMOSILLO			212 64 45				f		239
240	MCA900621K92	BUENAVISTA DEL COBRE SA DE CV	2	AVE. JUAREZ	CANANEA			01645 33 28 009				f		240
241	CPF6307036N8	CAMINOS Y PUENTES FEDERALES DE INGRESOS Y SERVICIOS CONEXOS	2	CALZADA DE LOS REYES	CUERNAVACA			66 77 59 18 00				f		241
242	IDH0304287B1	IMPRESIONES DIGITALES DE HERMOSILLO	2	BLVD. KINO	HERMOSILLO			2 10 58 61				f		242
244	IIPL580830LJ2	LUCAS JUAN IÑIGO PABLOVICH	2	BOULEVARD IGNACIO SOTO	HERMOSILLO			2890245				f		244
245	DSO930705NU3	DAQU DE SONORA SA DE CV	2	BLVD. KINO	HERMOSILLO			280 50 51		calvarez@ganferfranquicias.com		f		245
246	CUM0512078A3	CONSORCIO DE UNIVERSIDADES MEXICANAS, A.C.	2	LUIS ENCINAS JOHNSON	HERMOSILLO			662 454 84 99		cumex@guayacan.uson.com		f		246
247	AME070607MI5	ANDROID DE MEXICO S DE RL DE CV	2	AV INDEPENDENCIA	MEXICO			236 01 69		carevalo@android-ind.com		f		247
248	FSS120124HC6	FARMACIAS SANTAFE DEL SANTO NIÑO JESUS DE LA SALUD S.A DE C.V	2	BOULEVARD LUIS ENCINAS	HERMOSILLO			267 0040 AL 43		luis.flores@supermercadossantafe.com		f		248
249	GGA130311DG9	GRUPO GASOLINERO ALVER, S.A DE C.V	2	JOSE SANTIAGO HEALY	HERMOSILLO			214 92 95		facturacion.electronica@grupoalvarado.com.mx		f		249
250	VIMJ6709095H7	JESUS MANUEL VILLASEÑOR MEDINA	2	ARGEL	HERMOSILLO			212 12 97				f		250
252	SOR0909052M4	SUPERMERCADOS SANTAFE, S.A DE C.V.	2	BOULEVARD LUIS ENCINAS	HERMOSILLO			267 0040 AL 43		luis.flores@supermercadossantafe.com		f		252
253	SSS9610231Y3	SERVICIOS DE LA SALUD SE SINALOA	2	CERRO MONTEBELLO	CULIACAN			66 77 59 25 08				f		253
254	ECO8602141P4	ELECTRONICA COM, S.A DE C.V	2	AVE. TOLUCA	MEXICO, D.F.			525 555 95 55 20				f		254
255	EIS430714ER6	ENSEÑANZA E INVESTIGACION SUPERIOR, AC.	2	ZACATECAS	C.D. OBREGON			(644) 410 87 00				f		255
256	THE091209BP6	TERRA HERMOSILLO, S.A. DE C.V.	2	MATAMOROS	HERMOSILLO			(33)35 40 20 20		fsilva@alexacorp.com		f		256
257	SANR821113NN2	RUBEN SATARAIN NAVARRO	2	BACOBAMPO	HERMOSILLO			2195326		rsatarain@gmail.com		f		257
208	OME110124EV2	OPERADORA DE MINAS E INSTALACIONES MINERAS S.A DE C.V	2	CAMPOS ELISEOS	DISTRITO FEDERAL			109 21 19		mesadeservicios@csc.gmexico.com		f		208
237	MPC100616LH9	MULTISERVICIOS PROFESIONALES CCGV S DE RL DE CV	2	BENITO JUAREZ LOCAL K	HERMOSILLO	.	.	(662)1 43 08 56.		sara@valencianavarrete.com	.	f		237
230	GES790913CT0	GOBIERNO DEL ESTADO DE SONORA (SIDUR)	2	COMONFORT Y DR. PALIZA	HERMOSILLO			217 09 74 EXT. 224		edanzos@hotmail.com		f		230
238	ISS630101488	ISSSTESON	2	BLVD. HIDALGO	HERMOSILLO			217 10 28				f		238
243	RACV72060972A	VICTOR MANUEL RAMIREZ CASTILLO	2	CIPRES	TIJUANA	BAJA CALIFORNIA	(664) 120 0283           	(664) 681 7547	(664) 2136	victorramirezmtt@hotmail.com	AYLEEN  VALENCIA 	f	227	243
258	ASA990803D8A	AGROINDUSTRIAL SERVICIOS EN ADMINISTRACION S DE RL DE CV	2	CALLE DE LA PLATA	HERMOSILLO			259 58 00		felectronica@norson.net		f		258
259	IIP8303218H1	INSTRUMENTOS INDUSTRIALES DEL PACIFICO, S.A DE C.V	2	CALLEJON JUAN CARRAZCO	LOS MOCHIS			668 816 01 40		carolina.alarcon@iipsa.com; enrique.armenta@iipsa.com		f		259
261	MISG610724SE6	GONZALO MIMIAGA SANCHEZ	2	BLVD SOLIDARIDAD	HERMOSILLO			216 2940		lmimiaga@xpertprinter.com; liz@xpertprinter.com		f		261
262	ZAGJ540303NG4	MARIA JESUS ZAMORA GARCIA	2	AVE. ALBERTO GUTIERREZ	HERMOSILLO							f		262
263	OSX960613MZ0	OVANDOS S.A DE C.V	2	JUAREZ	HERMOSILLO			217 59 06				f		263
264	AEP120330PY0	LA AGRICULTURA ES PRIMERO, LAGRIPRIM, S.C	2	OTANCAHUI	HERMOSILLO			261 12 00				f		264
266	LCT121113ES0	LECAR CONSULTORIA EN TI SC	2	GASTON MADRID	HERMOSILLO			210 28 03		carolina@lecarti.com		f		266
267	GAML710113NH2	LUIS ARMANDO GAMEZ MEZA	2	BLVD LOPEZ PORTILLO	HERMOSILLO			215 40 40		gamaz71@hotmail.com		f		267
268	SOAI730920K69	MARIA ISABEL SOTOMAYOR ANDRADE	2	VERACRUZ	HERMOSILLO			2855940				f		268
269	GOVA870424GT8	ALEJANDRO GORTAREZ VALDEZ	2	CERRADA SAN CISPIN	HERMOSILLO			6621 00 32 66				f		269
270	XEXX010101000	FRESH SOFTWARE CONCEPTS LLC	2	PO BOX	Louisville, KY							f		270
271	PED781129JT6	PRODUCTOS ELECTRICOS DIVERSIFICADOS S.A DE C.V	2	CALLE NUMERO 9	BACUM			644 410 52 40				f		271
272	GOMJ7207291E6	JUAN FRANCISCO GONZALEZ MASCAREÑA	2	NO REELECCION	HERMOSILLO			254 32 69				f		272
273	SRE080722JA7	SIGNUM RESEARCH S.A DE C.V	2	AVE. CAFETALES 1702-305	DISTRITO FEDERAL					juanita.villegas@signumresearch.com		f		273
274	SAPA911113I19	ALEJANDRO SANTA CRUZ PRECIADO	2	BOULEVARD EUSEBIO KINO	HERMOSILLO			214 29 68 / 6622 99 00 31				f		274
276	HFE011011HH1	SOCIEDAD HIPOTECARIA FEDERAL, S.N.C	2	AV. EJERCITO NACIONAL No.180 PISO				(52) 55 52 63 45 41				f		276
277	FECF761230V9	FRANCISCO JAVIER FELIX CABALLERO	2	GENERAL PIÑA	HERMOSILLO			044 66 21 12 87 06				f		277
278	PIT130112C58	PTN INFRAESTRUCTURA EN TELECOMUNICACIONES S.A. DE C.V.	2	REBEICO	HERNOSILLO			211 64 84		david@ptn.com.mx		f		278
279	IME910214GD1	ISOLUX DE MEXICO SA DE CV	2	PASEO DELA REFORMA PISO 12	DISTRITO FEDERAL			55 52 07 26 25		psantillan@isaluxcorsan.com		f		279
280	MME9403251Y3	MINERA MEXICO SA DE CV	2	CAMPOS ELISEOS	DISTRITO FEDEREL			55 11 03 54 76		ruben.lugo@mm.gmexico.com		f		280
281	DME870724367	DISTRIBUIDORA MEGAMAK S.A DE C.V	2	BLVD. GARCIA MORALES	HERMOSILLO			236 03 00		bsallard@bepensamotriz.com.mx; carce@megamak.com.mx		f		281
282	VIMA641001BE4	ANGELICA GUADALUPE VILLALPANDO MENDEZ	2	AV. LAZARO CARDENAS 38 LOC.	DISTRITO FEDERAL			01 55 55 10 015 90				f		282
283	PED781129JT6	PRODUCTOS ELECTRICOS DIVERSIFICADOS SA DE CV	2	MIGUEL HIDALGO Y COSTILLA	ETCHOJOA			81 81 34 49 32		zaima.valenzuela@mx.yazaki.com		f		283
284	SGU871021QD2	SELECTA DE GUAYMAS SA DE CV	2	PEDRO VILLEGAS	HERMOSILLO			217 30 02		Facturacion.selectalabor@selecta.com.mx		f		284
285	AHE870608S77	AUTOS DE HERMOSILLO S.A DE C.V	2	REFORMA Y NAVARRETE	HERMOSILLO			289 20 00		mrivera@gemso.com.mx; rgonzalez@gemso.com.mx		f		285
286	ABH061124TN7	AUTOMOTORES BALTICOS DE HERMOSILLO SA DE CV	2	BLVD. LUIS DONALDO COLOSIO	HERMOSILLO			289 85 10				f		286
287	ICT001127ND1	ICY TECNICOS INDUSTRIALES SA DE CV	2	DEL PLOMO	HERMOSILLO			251 0433		angetrujillo@hotmail.com		f		287
288	XEXX010101000	IACG HOLDINGS II LUX S.A.R.L.	2	COTE D´ EICH 73	LUXEMBOURGH			(844) 43884409		rgaona@iacgroup.com		f		288
289	CIS850618KG7	COMERCIAL E IMPORTADORA SONORENSE SA DE CV	2	DR. NORMAN E. BORLAUG	CD. OBREGON			644 41 00 525		rcarlos.ceissa@gmail.com		f		289
290	MUL020502GL1	MULTIDICONA, S.A DE C.V.	2	CARR. INTERNACIONAL KM 6.5 EDIFICIO14-B				631 31 90 220		finanzas06@multidicona.com; orderconfirm@multidicona.com		f		290
291	GAR120927369	GLB AUTOMATIZACIONES Y ROBOTICA, S.A DE C.V.	2	GENERAL YAÑEZ				214 0505		abracamontes@glbayr.com		f		291
293	FMO8304236C5	FORD MOTOR COMPANY, S.A. DE C.V.	2	CALLE GUILLERMO GONZALEZ CAMARENA 5o PISO	MEXICO			52 55 1103 3059		pnohphal@ford.com		f		293
292	SFC950703RF5	SERVICIOS FORD CREDIT SA DE CV	2	CTO GUILLERMO  GONZALEZ CAMARENA	MEXICO			5511033059		lalber10@ford.com		f		292
294	OISM861129QB2	MARTIN ALBERTO ONTIVEROS SALINAS	2	PRIVADA 1 JUANA DE CASILLA	HERMOSILLO			6628485890		sumiseto@gmail.com		f		294
295	MGS060916PU3	MUNICIPIO DE GUAYMAS SONORA	2	AVE. SERDAN	GUAYMAS			(622)222 4070, 2 0701		crocaranza@hotmail.com		f		295
296	TMI100312NI0	TIENDAS DEL MINERO SA DE CV	2	CAMPOS ELISEOS	DISTRITO FEDERAL			(634) 3420455		omar.lafuente@prodigy.net.mx		f		296
297	SME100611LF6	SILVER CREST DE MEXICO SA DE CV	2	MARIANO ESCOBEDO	HERMOSILLO			(662)2670182		cynthia.calles@seop.mx		f		297
298	FPN080723Q43	FRIO DEL PACIFICO DEL NOROESTE SA DE CV	2	MINA ROCA ROJA	HERMOSILLO			(662)1971025		juancarlosreyes@yahoo.com		f		298
299	RARL920908UB9	LIRIO RAMIREZ RAMIREZ	2	AV DE LOS CONTRATISTAS	HERMOSILLO			3092091 /CEL 6629381042				f		299
300	BME910913BA2	BENTELER DE MEXICO, SA DE CV	2	CARRETERA A SAHUARIPA KM. 3.5 NO. 1	HERMOSILLO			662-259-8812				f		300
301	ASP9105146G5	ASOCIACION SONORENSE PRO PERSONAS CON PARALISIS CEREBRAL IAP	2	SAN LUIS POTOSI	HERMOSILLO							f		301
305	MHE570101FI1	MUNICIPIO DE HERMOSILLO	2	BLVD. HIDALGO Y COMONFORT S/N	HERMOSILLO			289 30 00		blanca.castro@hermosillo.gob.mx		f		305
302	CAVL6406244V5	MARIA LAURA AMPARO CHAVEZ CAMACHO VELA	2	PUEBLA	CD.OBREGON			045 6441227806				f		302
303	CFE370814QI0	COMISION FEDERAL DE ELECTRICIDAD	2	AV. PASEO DE LA REFORMA	MEXICO			2 59 12 74		hb001.cfd@cfe.gob.mx		f		303
350	PPR9311056R2	PAPELERIA PRNCIPADO S.A. DE C.V.	2	CAMPESINOS				5554453000				f		350
306	FME-971022Q44	FERROCARRIL MEXICANO, S.A. DE C.V.	2	BOSQUE DE CIRUELOS				289 15 00		egresos.hermosillo@ferromex.com.mx		f		306
307	SAFJ671109RF8	JORGE ALBERTO SALMAN FORT	2	AV. CASTELLANA	HERMOSILLO			6623424453				f		307
308	LOML881029F65	LUIS ANTONIO LOPEZ MEDINA	2	LEOPOLDO RAMOS	HERMOSILLO			(662) 123 80 05		luanlop88@gmail.com		f		308
309	ZME000103USA	ZOBELE DE MEXICO, S.A DE C.V	2	CARRETERA A SAHUARIPA KM 4.5	HERMOSILLO			289 92 00/ 02 EXT 51209		ivan.flores@zobele.com		f		309
310	POAA710421D80	ALEJANDRA MARIA POMPA ACUÑA	2	BLVD. LAS QUINTAS	HERMOSILLO							f		310
311	BCO1209114H4	BORGA COMERCIALIZADORA SA DE CV	2	CTO.PERIFERICO SUR	HERMOSILLO							f		311
312	CFV0502243E7	CORPORATIVO FINANCIERO VIMIFOS SA DE CV SOFOM ENR	2	AVENIDA LAZARO CARDENAS 3430 303	GUADALAJARA			(644) 4109500				f		312
313	XEXX010101000	MINERA  SAN RAFAEL S. A.	2	KM 8.6 ANTIGUA CARRETERA A EL SALVADOR	SANTA CATARINA PINULA			5202931488				f		313
314	SAGH8307099U5	HECTOR RENE SANCHEZ GARCIA	2	GARCIA LOPEZ	GUAYMAS			(662) 222 37 36		mysanchez@gmail.com		f		314
315	CMU030424PB2	CONSTRUCTORA METROPOLITANA URBI SA DE CV	2	AV DE LAS PALMAS	DEL. MIGUEL  HIDALGO			(55) 55207645/55 55207751				f		315
316	ZAFR770710PN8	MARIA DEL ROSARIO ZARATE FIGUEROA	2	SAN RAMON	HERMOSILLO			(662) 3026084				f		316
317	NAH850320159	NACIONAL DE ALIMENTOS Y HELADOS SA DE CV	2	CALLE SAN PEDRO	MONTERREY			(644)4104805		bokados.cxp@arcacontal.com		f		317
318	ACA990520MW8	AGRICOLA  CACTUS SA DE CV	2	BLVD. KINO	HERMOSILLO			(622) 2890171		contabilidad@agricactus.com		f		318
319	SAU0105259QA	SURMAN AUTOMOTRIZ SA DE CV	2	ROSALES	HERMOSILLO			(622) 2133330		luz.navarro@gruposurman.com		f		319
320	SOTA8503263L9	ATAULFO JOSE SOTELO TORRES	2	LAMBERTO HERNANDEZ	HERMOSILLO			(662) 216 72 91		neost2@hotmail.com		f		320
321	PCC040624FJA	PROYECTOS COMPUTACIONALES Y COMUNICACIONES SA DE CV	2	RETORNO DE TORRE VIEJA	HERMOSULLO			2591108				f		321
322	BCO081112810	BORGAM COMERCIALIZADORA SA DE CV	2	PERIFERICO SUR	HERMOSILLO			662 110 09 88				f		322
323	SSM0901207F0	SR SERVICIOS MINEROS S.A. DE C.V.	2	GUILLERMO CARPENA	HERMOSILLO			(662) 2101424		cecilia@sonoranresource.com		f		323
324	BAU080603FS1	BAQUI AUTOMOTRIZ S. DE R.L. DE C.V.	2	BLVD. FRANCISCO SERNA ESQ. REFORMA	HERMOSILLO			(622) 259 79 00		contabilidad.servicios@toyotahermosillo.com		f		324
325	LIT850619Q49	LITOBEL SA DE CV	2	CALLE MARTIRES DE TACUBAYA	DISTRITO FEDERAL			55 1450 9460 AL 63 EXT205		miguel@litobel.com		f		325
326	CMU030424PB2	CONTRUCTORA METROPOLITANA URBI S.A. DE C.V.	2	AV DE LA PALMAS	DELEGACION MIGUEL HIDALGO			(555) 520 76 45		rafael.ruiz@urbi.com; luis.barajas@urbi.com		f		326
229	GES790913CT0	GOBIERNO DEL ESTADO DE SONORA (PGJ)	2	COMONFORT Y DR. PALIZA	HERMOSILLO			259 48 00 EXT. 14500		archivos.xml2014@hotmail.com		f		229
343	SCO120305QD5	SERSATEX CONSULTORIA SA DE CV	2	CERRADA SAN BERNARDINO	HERMOSILLO	SONORA	(662) 211 17 33	(662) 211 17 33	(662) 211 17 33	mgh0789@hotmail.com	GRISELDA LUNA	f	griselda.luna@	343
336	COM890602EE8	COMPUPROVEEDORES, S.A DE C.V.	2	SAN LUIS POTOSI # 21	HERMOSILLO	SONORA	(662) 214 2200	(662) 214 2200	(662) 214 2200	soporte@compuproveedores.com	DANIELA LEON	f	(662) 214 2200	336
327	UES830928HF5	UNIVERSIDAD ESTATAL DE SONORA	2	LEY FEDERAL DE TRABAJO	HERMOSILLO			632 322 40 85		facturas_m@ues.mx ;  ricardoflores3@hotmail.com		f		327
328	SCO790710CQ2	SERVI CONO SA DE CV	2	BLVD. PASEO RIO SONORA SUR	HERMOSILLO			(662) 2896570		lejandra.nava@servindustrias.com.mx		f		328
329	ROVD8306091YA	DIANA RODRIGUEZ VALENZUELA	2	RIO NAZAS	C.D OBREGON CAJEME			(662) 267 01 38		luiserv@hotmail.com;lili_feso@hotmail.com		f		329
330	ATI030129753	AVANCES TECNICOS EN INFORMATICA SA DE CV	2	ALDAMA	COLIMA			( 312 ) 323 74 43		admon@tecnologiaintegrada.com.mx		f		330
331	HUML590811AZA	LUIS ALFREDO HUGUEZ MARTINEZ	2	LIC ENRIQUE B MICHEL ESQ EMILIANA DE ZUBELDIA	HERMOSILLO			213 53 36		luisalfredoh@hotmail.com		f		331
332	BRE971119KZ2	BREAKER S.A. DE C.V.	2	JOSE LOPEZ PORTILLO	HERMOSILLO			(662) 236 21 10		imaldonado@breakermex.com		f		332
333	SAC990216LN2	SERVICIOS DE ASEGURAMIENTO DE CALIDAD MU&ING SC	2	AV. DE LA CONVENCION NORTE	AGUASCALIENTES			449 9128686				f		333
334	OOMR721023GUA	RAFAEL OCHOA MEDINA	2	DE LOS MILAGROS	HERMOSILLO			662) 75 24 91				f		334
335	DWE060201SU0	DECSSON WELDING SA DE CV	2	SUAQUI	HERMOSILLO			(662) 260 72 68		recepcion@decssonwelding.com.mx		f		335
337	EIM980328HLA	ETIQUETAS E IMPRESIONES DE MEXICO SA DE CV	2	QUINTANA ROO	HERMOSILLO			(662) 210 03 73		eim_xml@hotmail.com		f		337
338	GCS960325TG3	GANADERA CONTRERAS S P R DE R L	2	CARRETERA A SAHUARIPA KM 1	HERMOSILLO			(662) 108 22 00		facturaelectronica@jcfriconsa.com		f		338
339	XEXX010101000	OPTIMA PRODUCE SOFTWARE	2	PO BOX 6457				1(520) 761 1611		cfuentes@optimaproduce.net		f		339
340	PARA621204EJ5	ALVA FLERIDA PALAZUELOS RAMIREZ	2	WOOLFOLK 202 SIN NUMERO	MAGDALENA			(632) 3 22 11 50		papelerialp1@msn.com		f		340
341	SIN820826MF6	SERVI INDUSTRIAS DEL NOROESTE SA DE CV	2	BLVD. PASEO RIO SONORA	HERMOSILLO			( 662) 289 65 70		alejandra.nava@servindustrias.com.mx		f		341
342	PIQG640221417	GUADALUPE PIÑA QUIJADA	2	CALLEJON NACO	HERMOSILLO			662 1562392		gpe_pina@hotmail.com		f		342
344	IAG9908024V2	INDUSTRIAS AGROFARMS S DE RL DE C.V	2	DE LA PLATA	HERMOSILLO			2595800				f		344
345	FAS990802L92	FASSA S DE RL DE CV	2	CALLE DE LA PLATA	HERMOSILLO			259 5800		fbadilla@norson.net		f		345
346	CRA120314RB7	CRNM RADIO SA DE CV	2	AVENIDA OAXACA	HERMOSILLO			212 13 23		javier_wt@hotmail.com		f		346
347	JME920323-9S7	JUMBOLON DE MEXICO SA DE CV	2	BOULEVARD JESUS GARCIA MORALES	HERMOSILLO			662 260 41 68		amartinez@jumbolon.com.mx		f		347
348	VAU001020JV7	VITRO AUTOMOTRIZ SA DE CV	2	CARRETERA VILLA DE GARCIA KM 10.3				662 251 10 13,14,16 Y 18		jmorinj@vitro.com		f		348
349	SEP210905778	SEP/INSTITUTO TECNOLOGICO DE HERMOSILLO	2	NEZAHUALCOYOTL	MEXICO			260 65 00    260 65 53		ramonoriegacastillo@yahoo.com.mx		f		349
351	LDI110209AM4	LABOPRINTEC DIGITAL SA DE CV	2	NAYARIT	HERMOSILLO			662 215 38 34		contabilidad@mytoner.com.mx		f		351
352	GIS040223JT9	GLOBAL INTEGRAL SERVICES SA DE CV	2	DE LOS ARCOS	NOGALES			(631) 3520149				f		352
353	CAH040319MN3	CENTRO DE APOYO HUMANITARIO IAP	2	AVENIDA SAN FELIPE	HERMOSILLO			2180025				f		353
354	MGO630627M24	MUDANZAS GOU S.A. DE CV	2	ANAXAGORAS	DISTRITO FEDERAL			662 251 08 75		nominashmo@mudanzasgou.com		f		354
355	DFM060426HJ4	DIVINE FLAVOR DE MEXICO S.A. DE C.V.	2	RETORNO MERCEDES	HERMOSILLO			662 261 03 20		vprima@grupoalta.com		f		355
356	EIS430714ER6	ENSEÑANZA E INVESTIGACION SUPERIOR AC	2	BAHIA BACOCHIBAMPO S/N	GUAYMAS			622 22 501 90 ext 4461				f		356
357	OTL020912GW0	OPERADORA TURISTICA LM SA DE CV	2	SERDAN Y ROSALES S/N	HERMOSILLO			2707070				f		357
359	VECL8807072I3	LUIS FERNANDO VEGA CASTILLO	2	BALLARDO 24 SIN	NOGALES			631 313 93 70		vcsandralush@hotmail.com		f		359
360	OERR70091732A	JOSE RAUL ORNELAS RUIZ	2	CALLE LEO SANDOVAL 88	HERMOSILLO			662 297 16 11		jraulornelas@hotmail.com		f		360
361	MAAR8710273G2	JOSE ROBERTO MARTINEZ ANDUJO	2	CALLE DE LOS POZOS 3307 AMPLIACION				6441-154974 y 644-189060		joseroberto270@hotmail.com		f		361
362	TRO120208TX2	TRADING ROGALHER SA DE CV	2	SAN FELIPE #384-A	HERMOSILLO			2180025				f		362
363	GOHJ690822KN5	JULIO MARIO GONZALEZ HERRERA	2	CERRADA SAN BERNARDINO	HERMOSILLO			622 244 91 70				f		363
364	FERC631108G14	MARIA DEL CARMEN FERNANDEZ RODRIGUEZ	2	BLVD. LUIS ENCINAS 114	HERMOSILLO			662 218 28 22 EXT 25		sistemas@acerosmexicosa.com.mx		f		364
365	AME940120TS5	ACEROS MEXICO S.A. DE C.V.	2	BLVD. LOPEZ PORTILLO 60	HERMOSILLO			662 218 28 22 /218 28 02		sistemas@acerosmexicosa.com.mx		f		365
366	CAN9601034P1	CONSTRUCTORA  ANAMARK,S.A. DE C.V.	2	AVE. MICHOACAN #221	HERMOSILLO			662 212 66 33		facturascoanamark@hotmail.com		f		366
367	AMO980528344	AEROPUERTO DE LOS MOCHIS, S.A. DE C.V.	2	KM 12.5 CARRETERA LOS MOCHIS TOPOLOBAMPO	AHOME			662 2610142		gcruz@aeropuertosgap.com.mx		f		367
368	DDA960425Q43	DISTRIBUCIONES DANA, S.A. DE C.V.	2	REFORMA#107	HERMOSILLO			662 215 35 11				f		368
369	JAME4803186F5	EDUARDO JARA MURILLO	2	SAN HIRAM #60	HERMOSILLO			2199464				f		369
370	CATG710120R68	GASTON GERARDO CAMOU TRUJILLO	2	AV. SOSTENES ROCHA	HERMOSILLO			3 01 33 61		gaston_gcc@hotmail.com		f		370
371	DLC100118226	DIAZLAB LABORATORIOS CLINICOS SA DE CV	2	PUEBLA 10 LOCAL A	HERMOSILLO			662 213 15 05		administracion@diazlab.com		f		371
372	ODI0706225X1	OCOTILLO DESARROLLOS INDUSTRIALES Y EXTRACTIVOS SA DE CV	2	BLVD. NAVARRETE 112-5	HERMOSILLO			662 260 07 86				f		372
373	POE9612048Q2	PROVEEDORA DE OFICINAS EXPRESS SA DE CV	2	JOSE S. HEALY	HERMOSILLO			(662)310 7389, 310 7341		oficexpress@live.com.mx		f		373
374	CNC820428674	CONTROLADORA DE NEGOCIOS, COMERCIALES, S.A DE C.V.	2	AVE. ALFONSO REYES NTE. 2202	MONTERREY			(81) 8 328 5000		daniel.dessens@cuamoc.com		f		374
375	CORI641010MDA	IMELDA COTA RENDON	2	AVENIDA 5 No.625				633 3385777				f		375
376	ECA050315T37	ECAM SA DE CV	2	CALLE CEDROS 588	HERMOSILLO			662 218 00 25		compras@pimacero.com		f		376
358	DRE-9906296D0	DISTRIBUCIONES REDAL, S.A. DE C.V.	2	JESUS GARCIA 127				250 84 20  250 95 13		ventas@redal.com.mx		f		358
377	CES-830928-7S2	CENTRO DE ESTUDIOS SUPERIORES DEL ESTADO DE SONORA	2	LEY FEDERAL DEL TRABAJO S/N	HERMOSILLO			632 322 40 85		ricardoflores3@hotmail.com		f		377
378	GOPJ880228N51	JESUS  ANTONIO GONZALEZ PALMA	2	CALLE RETORNO MICENAS	HERMOSILLO			662 1642799		jesus.palma@hotmail.com		f		378
379	STA7612099Y7	STAUS	2	YAÑEZ	HERMOSILLO			662 2172090		rodalcast@eca.uson.mx		f		379
380	RAC870406P40	RODAMIENTOS Y ACCSESORIOS SA DE CV	2	AV NOGALAR SUR	SAN NICOLAS DE LOS G			662 214 8990				f		380
381	MME9805279N6	MEDTRONIC MEXICO S DE RL DE CV	2	PASEO CUCAPAH 10510	TIJUANA			04 662 22 51 621		efactura@mtk.com.mx		f		381
382	VARM4608089E4	MARCO ANTONIO VALENCIA RAMOS	2	CALLE SAN LUIS POTOSI No1238 INT.3	HERMOSILLO			314 03 25		cansino4@hotmail.com		f		382
383	ATU940621PU7	AUTOTRANSPORTES TUFESA SA DE CV	2	GUADALUPE VICTORIA				(644) 410 9444  415 07 89		xmlproveedores@tufesa.com.mx; compras@tufesa.com.mx		f		383
384	VAIG640316BL9	GUSTAVO RAFAEL VALDEZ IBARRA	2	PASEO FONTANA NO. 5				214 7242				f		384
385	FCO920326SU1	FRIGORIFICA CONTRERAS S.A. DE C.V.	2	CARRETERA A SAHUARIPA KM1 S/N	HERMOSILLO			662 1082200		facturaelectronica@jcfriconsa.com		f		385
386	MMA050127LP´1	MAYER MARTINEZ Y ASOCIADOS SC	2	CALLE NAVOJOA No.37				016313115300 EXT 115		raguirrem@mayermartinez.net		f		386
387	CPE110530UZ9	COBRAMENT PEBROTS S.A. DE C.V.	2	AVENIDA ARCOS 687 2 PISO 2 PONIENTE	ALR ZAPOPAN			662 289 89 20		cobrafactura@hotmail.com		f		387
388	CSI020226MV4	CAFE SIRENA S. DE RL. DE C.V.	2	AV. PASEO DE LA REFORMA	MEXICO			(664) 6 27 75 00		mariana.lugo@starbucks.com.mx		f		388
389	CUBJ7107094L3	JULIA ISABEL CRUZ BOJORQUEZ	2	LEOCADIO SALCEDO	HERMOSILLO			662 210 42 74				f		389
390	QUAR470106FJ2	REYES QUINTERO ARVIZU	2	CALLE 7 AV.JUAREZ	CUMPAS			01634 34 6 05 92		nice_8013@hotmail.com		f		390
391	PRO930129P25	PROENDO SC	2	LUIS DONALDO COLOSIO	HERMOSILLO			662 217 54 01		k_amparano@hotmail.com		f		391
392	JAGC7907045GA	MARIA CECILIA JARA GARCIA	2	SAN HIRAM	HERMOSILLO			311 09 72				f		392
393	PIE960308FJ4	P&S INGENIERIA ELECTROMECANICA SA DE CV	2	BOULEVARD SERIS	HERMOSILLO			662 251 09 02		cuentasporpagar@pys.com.mx		f		393
394	GFE080528PM7	GAUTRIN FERRETERIA SC DE RL DE CV	2	ALVARO OBREGON	BAVIACORA			623 233 51 43				f		394
395	LMM6705039Y8	L Y M DE MEXICO SA DE CV	2	PLATA Y NOGALES SN	HERMOSILLO			662 251 04 80		irenemtz@lymm.com.mx		f		395
396	PIM8307047HA	PIMACERO SA DE CV	2	CARRETERA A BAHIA DE KINO KM5.5	HERMOSILLO			662 218 00 25		tesoreria@pimacero.com		f		396
397	CRC1006041EA	CHAIN RISK CONSULTORIA SA DE CV	2	BOULEVARD  MANUEL AVILA CAMACHO	DISTRITO FEDERAL			662 225 04 21		CMTZMORA@HOTMAIL.COM		f		397
398	SECC860530TN2	CARLOS BERNARDO SERRANO CONTRERAS	2	5 DE FEBRERO 89	HERMOSILLO			662 1904289				f		398
399	TEJJ890815DW8	JANETH TYLER JIMENEZ	2	IGNACIO MANUEL BONILLA	CULIACAN DE ROSALES			667 715-68-07		electricatyler@hotmail.com		f		399
400	CES911213AU1	COMITE ESTATAL DE SANIDAD VEGETAL DE SONORA	2	HIDALGO   ENTRE BENITO JUAREZ Y SEVER	VICAM			2127733 / 212 04 09		ivone.taddei@cesavesin.cc		f		400
401	FMM9803095R4	FLEXTRONICS MANUFACTURING MEX,SA DE CV	2	CARR BASE AEREA 5850 4	ZAPOPAN			631 314 05 55		MonicaMaria.Valencia@mx.flextronics.com		f		401
402	RPS880920E12	RECUBRIMIENTOS,PRODUCTOS Y SERVICIOS INDUSTRIALES SA DE CV	2	BACOBAMPO	HERMOSILLO			662 219 76 50				f		402
403	NOCJ661018FWA	JESUS ALBERTO NOLASCO DE LA CRUZ	2	GENERAL BERNARDO REYES 187	HERMOSILLO			662 210 42 74				f		403
404	AME961108E43	AGROPECUARIA LAS MERCEDES S.A. DE C.V.	2	VERACRUZ	HERMOSILLO			662 214 98 76				f		404
26	MTK-861014317	maquilas	2	Parque Industrial Roca Fuerte Carretera Intl. Km. 129 Salida Norte Guaymas, Son. C.P. 85400 EMPALME SONORA	EMPALME	Sonora	(662) 2 21 2982	(662) 2 21 2982	(662) 2 21 2982	efactura@mtk.com.mx	Mike Moreno	f		26
406	NAS940204E7A	NEGOCIO AGRICOLA SAN ENRIQUE S.A. DE C.V.	2	ZACATECAS	HERMOSILLO			662 260 97 62		gp.martinezrodriguez@gmail.com		f		406
407	AAT091016VC4	ACCESS & TI SOLUCIONES ACCESORIOS Y TECNOLOGIA S.A. DE C.V.	2	DIEGO DE VELAZQUEZ No.841				662 2208484				f		407
408	SVJ940930NS3	SERVICIOS VILLA JUAREZ S.A. DE C.V.	2	INDEPENDENCIA ANGOSTURA S/N				644 4107700		compras.tpa@grupogpa.com		f		408
409	PAL711113S40	PEREZ ALVAREZ, S.A. DE C.V.	2	NORMAN E.OURLAUG SUR 6051				644 107700 EXT 107		compras.tpa@grupogpa.com		f		409
410	SACL611103P83	LUIS ALBERTO SANTA CRUZ CAMPOVERDE	2	CALLE TERCERA No, 369 SECTOR RANCHITOS				622 226 14 99				f		410
411	LDE071003TL9	LUZARANI DESIGNS SA DE CV	2	DE LA PLATA	HERMOSILLO					noramena@hotmail.com		f		411
405	AMO0101181VA	AGROPECUARIA MORO S.A. DE C.V.	2	VERACRUZ	HERMOSILLO	SONORA	(662)1676552	(662)2149876	(662)1676552		LUIS LEYVA	f		405
412	FKI8101102LA	FARMACIA KINO SA	2	BLVD NAVARRETE	HERMOSILLO			662 260 40 49		metapia@farmaciakino.com.mx		f		412
413	CBC8807112Q9	CORRUGADOS DE BAJA CALIFORNIA, S. DE R.L. DE C.V.	2	CALLE 6 ORIENTE	TIJUANA			(664) 6078772				f		413
414	HPS9006158YA	HOSPITAL PRIVADO SAN JOSE DE CIUDAD OBREGON SA DE CV	2	COAHUILA SUR 263	CD. OBREGON			(644) 410 95 70		RFACTURASOBR@GRUPOMEDICOSANJOSE.COM		f		414
415	SAS011019K67	SERVIGRUPO ADMINISTRATIVOS DE SERVICIOS INTEGRALES, SA DE CV	2	BLVD. MANUEL AVILA CAMACHO P-14	DEL.MIGUEL HIDALGO			2139682		cstesani@grupoglobalre.com.mx		f		415
416	PIVA680927JDA	MARIA  ANA PICOS VEGA	2	BLVD. NAVARRETE No. 248				(662) 2189803				f		416
417	TPA751223JD9	TRANSPORTES PEREZ ALVAREZ SA DE CV	2	CIRCUITO INTERIOR	CAJEME			(644) 410 7700		compras.tpa@grupogpa.com		f		417
418	ROVH821218TN8	HOMAR DARIO ROBLES VILLANUEVA	2	10 2064				(633) 33 88 208				f		418
419	SER0504046Z8	SERVINDLIZ SA DE CV	2	16 DE SEPTIEMBRE 117	TULA DE ALLENDE			(645) 101 29 57				f		419
420	MEGA681028810	ANA LOURDES JUDITH MEDINA GIL	2	SAN MAURO No 42				(662) 280 14 42		soportexolu@hotmail.com		f		420
421	SLG1007061A2	SZERTEGIA LEGAL GROUP SC	2	AVE ROBERTO ROMERO	HERMOSILLO			(662) 225 26 29		folivas@szertegia.com		f		421
430	MTK861014317	MAQUILAS TETAKAWI, S.A. DE C.V. - 4347 - Parker Hannifin Corporation	2	Parque Industrial Roca Fuerte Carretera Intl. Km. 129 Salida Norte Guaymas, Son. C.P. 85400	EMPALME	SONORA	(622) 225 0200	(622) 225 0200	(622) 225 0234	soporte@compuproveedores.com	Lupita Orduño gorduno@parker.com	f	No Aplica	430
422	JLS970821I45	JUNTA LOCAL DE SANIDAD VEGETAL DE HERMOSILLO	2	BLVD.GARCIA MORALES No 342				(662) 2607046		facturas@cesaveson.com		f		422
423	JLS970412RH7	JUNTA LOCAL DE SANIDAD VEGETAL DE HUATABAMPO	2	OCAMPO Y FERROCARRIL S/N	HUATABAMPO			(662) 112 77 33		facturas@cesaveson.com		f		423
424	ODU021001N79	OBRAS Y DESARROLLOS URBI SA DE CV	2	BLVD. VENUSTIANO CARRANZA	SALTILLO			( 844 ) 415 65 77 ext 233		francisco.torresm@urbi.com		f		424
425	IIM0203195C3	INTEGRA INSTALACIONES Y MANTENIMIENTO S.A. DE C.V.	2	PERIFERICO NORTE	HERMOSILLO			( 662 ) 2108001		ftellez@integrainstalaciones.com.mx; ftellez@integraim.com		f		425
434	MSR010507UF7	MINERA SANTA RITA S DE R.L. DE C.V.	2	LAMBERTO HERNANDEZ	CABORCA	SONORA	(637) 3731070	(637) 3731070		patricia.gonzalez@auricogold.com	PATRICIA GONZALEZ	f		434
426	CACX230828NN6	JOSE AGUSTIN CAMOU Y CAMOU	2	GENERAL JUAN G CABRAL	HERMOSILLO			(662) 211 13 30				f		426
427	EAU8305242V7	EDITORIAL EL AUTENTICO, S.A. DE C.V.	2	REVOLUCION   ENTRE SAN LUIS POTOSI	HERMOSILLO			(662) 1092700		ailicec94@hotmail.com		f		427
428	MCB920925K63	MINERA CORNER BAY S.A DE C.V.	2	AV. FERROCARRIL	DURANGO			6181280709 Ext130 Oscar R		janeth.leyva@panamericansilver.mx		f		428
429	BAAE-660711-5E6	ENRIQUE BRAVO ALVAREZ	2	CALLE REVOLUCION	HERMOSILLO			(662) 2132929				f		429
431	SLA051128QKA	LA SALLE LAB, S.C.	2	PUEBLA ESQ.	HERMOSILLO			(662) 217 0951				f		431
432	CCO981118FA9	COMERCIALIZADORA CORYEP, S.A DE C.V.	2	BLVD.SOLIDARIDAD Y CAMELIA S/N  INT. 41 D	HERMOSILLO			(662) 218 5353				f		432
435	HETJ8210297Z1	JESUS ANTONIO HERNANDEZ TELLEZ	2	ELECTRICISTA	HERMOSILLO			(662) 250 1257				f		435
436	GUSJ690402CF7	MARIA DE JESUS GUTIERREZ SALDIVAR	2	DR. NORIEGA	HERMOSILLO			(662)213 4029,  214 6872				f		436
437	RRE0301076XA	RCR REFRIGERACION, S.A DE C.V.	2	CALLE DE LA PLATA	HERMOSILLO			(662) 251 06 92				f		437
438	MEBV8211146P2	VICENTE IVAN MEDINA BAUTISTA	2	OLIVARES No. 269				(662) 314 2124				f		438
439	CDT990319SR7	CLUB DEPORTIVO TRIPLE A S.A DE C.V.	2	SOLIDARIDAD INT. ESTADIO HECTOR ESPINO	HERMOSILLO			(662) 260 6932		ncastro@naranjeros.com.mx ; ecruz@naranjeros.com.mx		f		439
433	BAUJ820601HM6	JOB DAVID BARRERA URREA	2	MORELIA	HERMOSILLO	SONORA	(662) 261 5464	(662) 261 5464			Lic. Barrera	f		433
440	MMM990412HB4	MINERA MERIDIAN MINERALES S DE RL DE C.V.	2	REYES 126 LOCAL 8	HERMOSILLO			(632) 10 80 000 EXT. 1103		gustavo.machado@yamana.com		f		440
441	RDS9104242U6	RANCHO EL 17, S.A DE C.V.	2	CARRET. ESTACION TORRES KM. 13	HERMOSILLO			(662) 251 0550		jfavela@ranchoel17.com		f		441
442	PPI1107227S4	PIECO PROYECTOS DE INTERMEDIACION ECONOMICA, S.A DE C.V.	2	BLVD. LUIS ENCINAS	HERMOSILLO			(662) 216 4503				f		442
443	TTA920401JD6	TODO PARA LA TAPICERIA S.A DE C.V.	2	VERACURZ   Y NARANJO	HERMOSILLO			(662) 215 8477		surtidor.claudiavega@hotmail.com		f		443
444	SNI960412CP2	SERVICIO NACIONAL DE INSPECCION Y CERTIFICACION DE SEMILLAS	2	PRESIDENTE JUAREZ	TLALNEPANTLA			(662) 2122151				f		444
489	DDC9002195C5	DESARROLLO Y DISEÑO DE CENTROS COMERCIALES Y DE NEGOCIOS SA DE CV	2	OBRERO MUNDIAL	HERMOSILLO	SONORA	(662) 2784523	(662) 2365058	(662) 2784523	sistemas@dynatech.com.mx	HUMBERTO PEÑA	f		489
446	RPH920529I15	RUBIO PHARMA Y ASOCIADOS S.A DE C.V	2	BLVD. GARCIA MORALES KM 6.5 330	HERMOSILLO			(662) 2360101				f		446
447	JLS970829PE6	JUNTA LOCAL DE SANIDAD VEGETAL DE SAN LUIS RIO COLORADO	2	CALZADA CONSTITUCION Y CALLE 2DA. S/N	SAN LUIS RIO COLORAD			(662) 2120499				f		447
448	FME080820LC2	FOURGEA MEXICO, S.A DE C.V	2	BOULEVARD PASEO RIO SONORA SUR	HERMOSILLO			(662) 2207802		martha@fourgea.com		f		448
449	EOAE591129QQ2	EFRAIN ESCOBAR ANAYA	2	EINSTEN No. 141				(662) 3120988				f		449
450	AFN020901KV5	AGENCIAS FUNERARIAS DEL NOROESTE, S.A DE C.V	2	BLVD. LUIS ENCINAS PONIENTE	HERMOSILLO			(662) 2601317		yelitza.s@plansanmartin.com		f		450
451	RMI110324KL6	RASOMANOX METALICA INOXIDABLE, S.A DE C.V	2	AV. VILLA DEL CANAL	HERMOSILLO			(662) 2108600				f		451
452	OME0010235YA	OFFICE MEX, S.A DE C.V	2	MONTEVERDE	HERMOSILLO			(662) 2172884				f		452
454	VAVJ8610074X7	JORGE ENRIQUE VALDIVIA VALENZUELA	2	AV. VERACRUZ	HERMOSILLO			(662) 2670903				f		454
455	EIS001106U33	ESTANCIA INFANTIL SONRISITAS, S.C	2	BLVD. QUIROGA	HERMOSILLO			(662) 2610943				f		455
456	TBI0504167S6	TECNOLOGIAS BIORESPONSABLES, S.A DE C.V.	2	BLVD. RODRIGUEZ	HERMOSILLO			(662) 2138945				f		456
457	MACR670827F32	ROSA AMANDA MACIAS CARREON	2	AVENIDA DEL PASEO No. 187				(662) 2125150				f		457
458	EOBA450804K93	ALEJANDRO RAMON ESCOBOSA BLANCARTE	2	AV. VERACRUZ	HERMOSILLO			(662) 2145555				f		458
459	ATE110407RJ3	ANEXA TELECOMUNICACIONES, S.A DE C.V	2	AVENIDA PASEO RIO SAN MIGUEL	HERMOSILLO			(662) 2598650				f		459
460	HUEA6908173Q5	ALFONSO HURTADO ESTRELLA	2	DR. PALIZA	HERMOSILLO			(662) 2133119				f		460
461	GIDE730205FA0	EDGAR OSWALDO GIRON DOMINGUEZ	2	PASEO GUAYACAN	HERMOSILLO			(662) 2626370				f		461
462	SGP021107DM3	SOLUCIONES GLOBALES DE PERSONAL, S.A DE C.V	2	INSURGENTES SUR	DEL. ALVARO OBREGON			(525) 526240460				f		462
463	HNO790922DZ2	HOTELERA DE NOGALES, S.A DE C.V.	2	BLVD. KINO	HERMOSILLO			(662) 2891600		contraloria@hotelbugambilia.com.mx		f		463
465	CALR720117KG4	RAMON ANTONIO CASTREJON LEMUS	2	AV. SIERRA BLANCA No.15				(662) 2689806				f		465
466	LECP811013HX0	PEDRO EUGENIO LEDEZMA CONS	2	CARRETERA A BAHIA DE KINO KM. 11 70	HERMOSILLO			(662) 2854455		facturashidrotec@hotmail.com		f		466
467	JIN9507107U9	JIRA INDUSTRIAL, S.A DE C.V.	2	CARRETERA A SAHUARIPA KM. 3.3	HERMOSILLO			(662) 2510509		a.contreras@amijira.com		f		467
468	CAGH820906BL6	CARBALLO GALLARDO HECTOR GUILLERMO	2	CUERNAVACA	HERMOSILLO							f		468
469	LUMR900416350	RUBEN ANTONIO LUNA MADRID	2	MONTEVERDE	HERMOSILLO			(662) 2158088		easychoice2@hotmail.com		f		469
470	IDS0401149Y1	INTERNATIONAL DOOR SYSTEMS, S. DE R.L. DE C.V.	2	BLVD. FUSION	HERMOSILLO			(662) 1082000				f		470
471	AURA801112KC8	ANGEL HUMBERTO ANGULO RUELAS	2	PISTILO	CIUDAD OBREGON			(664) 1389749		ar_suministros@hotmail.com		f		471
472	AKI8907079I9	AUTOS KINO, S.A DE C.V	2	BOULEVARD KINO SN	HERMOSILLO			(662) 2892500				f		472
473	ATI1011121E2	ALVAREZ Y TAPIA INGENIERIA Y SERVICIOS, S.A DE C.V	2	CARRETERA A LA COLORADA KM3 BODEGA 5				(662) 2510621				f		473
474	ESA990617N99	ECONOLLANTAS SERVICIOS Y ACCESORIOS, S.A DE C.V	2	AV. VERACRUZ	HERMOSILLO			(662) 2100041		marifer@econollantas.com		f		474
475	MAVJ7212239D1	JESUS MATUZ VERDUGO	2	JUAREZ	HERMOSILLO			(662) 2122606				f		475
476	PRE9207163T7	PEMEX REFINACION	2	AVE. MARINA NACIONAL	MIGUEL HIDALGO			(662) 2510383		amado.lopezr@pemex.com		f		476
477	CUOA8505192K1	ANA GABRIELA CUEVAS ORTIZ	2	NAYARIT	HERMOSILLO			(662) 2151381				f		477
478	SGA830429GE6	SANCHEZ GONZALEZ Y ASOCIADOS QUIMICOS BIOLOGOS SC	2	PUEBLA	HERMOSILLO			(662) 2170701				f		478
479	CVO940712LEA	LA CASA DEL VAQUERO ORIGINAL, S.A DE C.V	2	JUAREZ	HERMOSILLO			(662) 2171533				f		479
480	OPP010927SA5	OPERADORA Y PROCESADORA DE PRODUCTOS DE PANIFICACION SA DECV	2	AV. PASEO DE LA REFORMA 222 TORRE 1	COL. JUAREZ / DISTRI			(664) 6 27 75 00 Y  662 2		mvalenzuelab@dominos.com.mx		f		480
481	CGL930923PB6	CLUB DE GOLF LOS LAGOS A.C.	2	LAGO DEL CISNE	HERMOSILLO			2 60 88 60 EXT 2206				f		481
482	HPU1009116Z9	HERMOLAND PUBLICIDAD S.A DE C.V	2	NIÑOS HEROES	HERMOSILLO			(662) 2134211				f		482
483	LIC9512048P4	LIBRA INGENIEROS CIVILES, S.A DE C.V.	2	PRIV. ACOSTA	TIJUANA			(664) 647160				f		483
484	MELJ480606MV1	JOAQUIN MEXIA LEAL	2	MATAMOROS	HERMOSILLO			(662) 2138434				f		484
485	FAL040105EM8	FUNDACION ALTA IAP	2	RETORNO MERCEDES S/N	HERMOSILLO			(662) 261 03 20				f		485
486	POVG7707267H8	GILDARDO PORTILLA VELASCO	2	LAGUNA	HERMOSILLO			(662) 2801218		gildardo.portilla@gmail.com		f		486
487	CCK930423JA3	CENTRO CULTURAL KINO, SC	2	PROLONGACION BLVD. KINO KM. 2.2	HERMOSILLO			(662) 2850565		shuerta@irlandeshermosillo.com		f		487
488	GACM811021F42	MARTIN FERNANDO GARCIA CAMOU	2	BLVD. MORELOS	HERMOSILLO			(662) 2108863				f		488
490	MFA840312BD6	MOLINO LA FAMA, S.A DE C.V	2	JESUS GARCIA	HERMOSILLO			(662) 2591060		cmendez@molinolafama.com.mx		f		490
445	CES-8309287S2	CENTRO DE ESTUDIOS SUPERIORES DEL EDO. DE SONORA	2	LEY FEDERAL DEL TRABAJO	HERMOSILLO			2 15 85 93		yambezulema@yahoo.com		f		445
464	CAMF590420GSA	FERNANDO CALLES MONTIJO	2	BENITO JUAREZ 249-D	HERMOSILLO	SONORA	(662) 2102525	(662) 2102525		asesoria.integral@prodigy.net.mx	FERNANDO CALLES MONTIJO	f		464
491	MMA0710018H9	MINERA MADERO, S.A DE C.V	2	CARRETERA A FRANCISCO I. MADERO 1	ZACATECAS			(492) 9239330				f		491
492	CAP821208LQ3	CEMENTOS APASCO SA DE CV	2	CAMPOS ELISEOS	MEXICO DISTRITO FEDE			2896300 01 800 112 73 78		alejandra.ramos@holcimapasco.com		f		492
493	VARA711105NY1	AARON VALDEZ RAMIREZ	2	GENERAL BERNARDO REYES				(662) 2100533				f		493
494	HLE010228TIA	HIDROTECNOLOGIA LEDEZMA S.A DE C.V	2	OLIVARES ESQ. TLAXCALA	HERMOSILLO			(662) 218 4868				f		494
495	DAS870501KUA	DESPACHO DE ASESORIAS Y SERVICIOS PROFESIONALES S.A DE C.V	2	OBRERO MUNDIAL				260 1900				f		495
496	SSA100326272	SAOI SERVICIOS ADMVOS DE OBRA DE INGENIERIA SA DE CV	2	AVENIDA MARIANO MATAMOROS	HERMOSILLO			(662) 2900615				f		496
497	GPU960102PG7	GENESIA PUBLICIDAD SC	2	AGUASCALIENTES	HERMOSILLO			210 67 04		genny@genesia.com.mx		f		497
498	ESC080911ELA	ENTRONQUE SANTA CLARA, S.A DE C.V	2	EUSEBIO KINO	HERMOSILLO			(662) 2805070				f		498
499	SFF0110054E2	SERVICIOS FUNERARIOS A FUTURO DE SONORA S.A DE C.V	2	VERACRUZ	HERMOSILLO			(662) 2601317				f		499
500	AMI9705283SA	ACEROS MANUFACTURAS E IMPORTACION DE SONORA S.A DE C.V	2	CARRETERA A SAHUARIPA	HERMOSILLO			(662) 2510509		karyna_amijira@hotmail.com		f		500
501	CAGC331126BB1	CESAR CAMOU GANDARA	2	MORELOS	CD. OBREGON			(644) 4136160				f		501
502	NME031126F18	NUSANTARA DE MEXICO, S.A DE C.V	2	MARIANO ESCOBEDO	HERMOSILLO			(662) 2670182/2670180		christian.jimenez@seop.mx		f		502
503	VAL951211490	VIÑEDOS ALTA, S.A DE C.V	2	RETORNO MERCEDES S/N	HERMOSILLO			(662) 2610320		valta@grupoalta.com		f		503
504	VPR981012U64	VIÑEDOS PRIMA, S.A DE C.V	2	RETORNO MERCEDES S/N	HERMOSILLO			(662) 2610320				f		504
505	SSO100531JV7	SOLVENTA SOLFINAC S.A DE C.V	2	DR. DOMINGO OLIVARES	HERMOSILLO			(662) 2608393				f		505
506	UNO850211F22	UNIVERSIDAD DEL NOROESTE, S.C	2	BLVD. ENRIQUE MAZON	HERMOSILLO			(662) 2891300		miguel.recendizma@uvm.net.edu		f		506
507	HCA721226EE3	HOTELES COSTA ALEGRE, S.A DE C.V.	2	BLVD. EUSEBIO KINO	HERMOSILLO			(662) 109 01 00				f		507
508	PACS880121KU8	SANTA ISABEL PALAFOX CARDENAS	2	BLVD. ADOLFO LOPEZ MATEOS NTE.	LOS MOCHIS			(668) 8123908				f		508
509	TELM780213613	MARCO ANTONIO TERAN LOMBROZO	2	BLVD. SOLIDARIDAD				(662) 1353417				f		509
510	FFS090923T77	FSA FRANQUICIA DE SERVICIOS AEREOS, S.A DE C.V.	2	BENITO JUAREZ	HERMOSILLO			(662) 211 37 35				f		510
512	MNO0608216I9	MOLIMENTALES DEL NOROESTE, S.A DE C.V.	2	BLVD. SOLIDARIDAD	HERMOSILLO			641 32 43 118		facturacion@timminsgold.mx		f		512
513	GGD1104151B8	GDT GRUPO DISEÑO TECNOLOGICO S DE RL DE CV	2	AVE EUGENIO GARZA SADA	MONTERREY			(81) 83582000 Ext 5636				f		513
514	MPI0208133S5	COMPAÑIA MINERA PITALLA, S.A DE C.V.	2	BOULEVARD CARLOS QUINTERO ARCE	HERMOSILLO			136 80 80		humberto.lopez@argonautgoldinc.com		f		514
515	OOOE790117GYA	EFREN MANUEL OCHOA OCHOA	2	SUAQUI GRANDE	HERMOSILLO			(662) 1484639				f		515
516	FOCR800829SV8	JOSE RICARDO FLORES CAJIGAS	2	MASSAROSSA PTE	HERMOSILLO			(662) 2205793				f		516
517	MUOL751123936	MARIA LORENA MUÑIZ OCAMPO	2	AV. GASTON MADRID	HERMOSILLO			(662) 2103424				f		517
518	ICQ040206565	INGENIERIA EN CONSTRUCCIONES QUIJADA, S.A DE C.V.	2	PRIV. BAROLO	HERMOSILLO			(662) 2140907		quijadajc@hotmail.com		f		518
519	SOSM770125PT9	MAURO SOTELO SALGADO	2	AVE. ALMEDA	HERMOSILLO			1 56 09 63		maurosotelo@gmail.com		f		519
520	MAS080522HK5	MAGNA  ASSEMBLY SYSTEMS DE MEXICO SA DE CV	2	CALZADA LA VENTA	CUAMATLA			(662) 1586102 EXT.3115		julio.fimbres@magna.com		f		520
521	CSI040315KN4	CAMIR SERVICIOS INTEGRADOS, S.A DE C.V.	2	GASTON MADRID	HERMOSILLO			(662) 213 42 11				f		521
522	CEC100309JJA	CENTRO DE EVALUACION Y CONTROL DE CONFIANZA DEL ESTADO DE SONORA	2	BLVD. PASEO RIO SONORA	HERMOSILLO			(662) 1083370		icota@c3sonora.gob.mx		f		522
523	DSI020614DA8	DIARTE´S INTERNATIONAL BUSINESS SC	2	PASEO SANTA FE	HERMOSILLO			(662) 2843601				f		523
524	AME100629HN6	AURANET DE MEXICO, S.A DE C.V.	2	PERIFERICO NORTE	HERMOSILLO			(662) 2163701		auranet.mx@gmail.com		f		524
525	TME990923FP2	TWB DE MEXICO, S.A DE C.V.	2	KILOMETRO 117  AUTOPISTA MEXICO-PUEBLO	PUEBLA			108 14 00		f_pequeno@twbmex.com		f		525
526	TNO9703052TA	TRIDEX DEL NOROESTE SA DE CV	2	PASEO BAVISPE	HERMOSILLO			(662) 2598650		compras@anexa.com.mx		f		526
527	RRM110106QNA	RM REGULADORA DE MINISUPER, S.A DE C.V.	2	PLAN DE AYALA	HERMOSILLO			(662) 210 2954		j_bernal@hotmail.com		f		527
528	CUVF860101H77	FRANCISCO JAVIER CRUZ VASQUEZ	2	ANDADOR GALONDRINA				(951) 1446454		fcojavier.cruz@discomoax.com		f		528
529	GAPM740601K56	MONICA BERENICE GAMEZ PEREZ	2	AVE. RAMON ANGEL AMANTE	HERMOSILLO			(662) 3103645		monicagamez_0174@hotmail.com		f		529
530	IMO970225SI5	INMOBILIARIA MONGE, S.A DE C.V.	2	GASTON MADRID	HERMOSILLO			(662) 2134211		yadys_77@hotmail.com		f		530
531	PTA961011NP7	PROMOCIONES TURISTICAS DE ASGAL, S.A. DE C.V.	2	BLVD. GARCIA MORALES	HERMOSILLO			(662) 2899850		lupita@hotelsanangel.com		f		531
532	UFO051011SZ2	UNION FENOSA OPERACION MEXICO, S.A DE C.V.	2	CALLE JAIME BALMES	MEXICO			(633) 3389440 EXT. 78892		nflores@gasnatural.com		f		532
533	ASI091109BI8	ARQUITECTURA+INGENIERIA, S.A DE C.V.	2	CALLE GUANABANA 6 MANZANA 15 LOTE 45	CUNCUN			(998) 880 75 41		romnacamino@gmail.com		f		533
534	VAOG7102211N5	GABRIEL VALDEZ OCHOA	2	AVE. DEL PATRON				2 50 08 37				f		534
535	FIRP710609FH9	PEDRO FIGUEROA RIVERA	2	PASEO DE LA VID				3 21 25 34				f		535
536	GOGM770312CS7	MARTHA JUDITH GOMEZ GONZALEZ	2	VALLE FUERTE	AHOME			668 1 65 44 24				f		536
537	JGU961029D38	JOYERIA GUADALAJARA S.A DE C.V.	2	GASTON MADRID	HERMOSILLO			213 42 11		yadys_777@hotmail.com		f		537
538	ENO990325D99	EMPRESTO DEL NOROESTE S.A DE C.V.	2	GASTON MADRID	HERMOSILLO			213 42 11		maryvalenzuela@montepio.com		f		538
539	BUSJ8602017H6	JUDAS TADEO BUSTAMANTE SALCIDO	2	CONSTITUCION	HERMOSILLO			2 15 21 79				f		539
540	ADU040120181	AGROPECUARIA LA DURAZNILLA S DE P.R. DE R.L.	2	DE LA PLATA	HERMOSILLO			251 08 94, 218 96 78		duraznilla@facturasempresas.com		f		540
541	HTS750115GH8	H. TRIBUNAL SUPERIOR DE JUSTICIA DEL ESTADO DE B.C.S.	2	BLVD. LUIS DONALDO COLOSIO Y ANTONIO				612 123 89 00				f		541
542	LOFA310220DW1	ABELARDO LOPEZ FELIX	2	DIVISADEROS	HERMOSILLO			2 14 00 36		noe918@prodigy.net.mx		f		542
543	AESR540121PZ0	ROBERTO FELIX AMEZQUITA SALGADO	2	COAHUILA	HEROSILLO			6621 460156, 2 17 56 97		rfaso154@gmail.com		f		543
544	GUSL6506251E9	LENIN ALBERTO GUTIERREZ SALDIVAR	2	AMADO NERVO	HERMOSILLO			2 14 68 72		ps_suministros2@hotmail.com		f		544
545	VME050706UUA	VANGTEL MEXICO, S.A DE C.V.	2	BLVD. RIO SONORA	HERMOSILLO			216 60 37 / 212 24 43		proveedores@intugo.co		f		545
546	SSA090508799	SAI, SERVICIOS ARCHIVISTICOS INTEGRALES, S.C.	2	CERRADA MULATOS	HERMOSILLO			662 244 66 22				f		546
547	TTM95072148A	TECMED TECNICAS MEDIOAMBIENTALES DE MEXICO, SA DE CV	2	AVE. HOMERO	MEXICO			55 262 42 365, 217 8330		paulina.franco@tecmedmx.com		f		547
548	TEM090129SY0	TT ENGINEERING MEXICO, S DE R.L DE C.V	2	HEGEL	MEXICO			(55) 58997229		abrisen2@ford.com		f		548
549	AME031107VA2	AUTOTEK MEXICO, S.A DE C.V.	2	PROLONGACION DE LA CALLE F				55 22 82 37 00 EXT. 614		vrebolledo@cosma.com		f		549
550	COVG820107TK1	GUADALUPE CORRALES VALENZUELA	2	LA ESCONDIDA	HERMOSILLO			2 60 42 08		facturas@netofficesolutions.com.mx		f		550
551	POFA6707305F7	ALVARO PONCE FELIX	2	RETORNO DIGENITA	CANANEA			645 34 05274		poncefelixalvaro@hotmail.com		f		551
552	VAPM8801215X6	MANUEL MARTIN FRANCISCO VALENZUELA PORCHAS	2	EVERARDO MONROY	HERMOSILLO			311 3250				f		552
553	CAIY770427198	YOVANY BENIGNO CAMACHO INZUNZA	2	CALLE RETORNO CREPELLO	HERMOSILLO			2 67 86 97				f		553
554	HLU890901H49	COMPAÑIA HOTELERA LUCERNA	2	PASEO RIO SONORA NORTE	HERMOSILLO			2 59 52 00				f		554
555	JUP9805138Q4	JOYEROS UNIDOS DEL PACIFICO, S.A DE C.V.	2	AVE. GASTON MADRID	HERMOSILLO			2 13 42 11/ 217 16 10		yadys_777@hotmail.com		f		555
556	EIVS401218ET9	MARIA DEL SOCORRO BERNARDINA ENCISO VERDUGO	2	VERACRUZ	HERMOSILLO			3 11 32 50, 3 02 38 59				f		556
557	GAMA671108H55	ADRIANA EDITH GASTELUM MENDOZA	2	BENITO JUAREZ	MAGDALENA			2 11 79 94		proliman@hotmail.com		f		557
558	PFP920718FB2	PROCURADURIA FEDERAL DE PROTECCION AL AMBIENTE	2	CAMINO AL AJUSCO	DEL.TLALPAN			217 54 54		aespinoza@profepa.gob.mx		f		558
559	KSC9603286X6	KS COMERCIAL, S.A DE C.V.	2	BLVD. LUIS ENCINAS Y SOYOPA	HERMOSILLO			2 60 56 56				f		559
560	GIS050802B16	GLENDALE INDUSTRIAL SUPPLY MEXICO, S.A DE C.V.	2	RAMON CORRAL	HERMOSILLO			2 51 10 34				f		560
561	AAB060601LT2	AMBIENTE BIOETICA Y CORRESPONSABILIDAD S.A DE C.V.	2	REPUBLICA MEXICANA				(449) 140 50 20		ggrofalco@hotmail.com		f		561
562	CSF020102831	COMITE DE SANIDAD FITOPECUARIA DEL ESTADO DE SONORA SC	2	CALLE LA PALMA	HERMOSILLO			662 2 13 32 84		irma.arballo@cosafisc.com		f		562
563	MASV330123CT1	VLADIMIR MARQUEZ SAENZ	2	AV. DE ANZA	HERMOSILLO			2 14 50 86				f		563
564	DEC970724MY2	DECOPLAS, S.A DE C.V.	2	CALZADA LA VENTA				52 55 5864 99 01		alejandra.torres@magna.com		f		564
565	AME070607MI5	ANDROID DE MEXICO, S DE RL DE C.V.	2	AV. INDEPENDENCIA				52 722 199 77 14				f		565
566	ITS001011RN0	INSTITUTO TECNOLOGICO SUPERIOR DE PUERTO DE PEÑASCO	2	BLVD. TECNOLOGICO				(638) 6383 1100		itsppcompras@hotmail.com		f		566
567	OTV801119HU2	OPERADORA DE TIENDAS VOLUNTARIAS S.A DE C.V.	2	CALLE 99				01 999 930 34 11		rrmay@optivosa.com		f		567
568	SAAC730921556	CESAR ALEJANDRO SALVADOR ALFARO	2	REAL DEL ARCO	HERMOSILLO			2 18 18 30		cesarsalvador2@hotmail.com		f		568
569	MELJ840328BC4	JESUS LORENZO MENDOZA LOPEZ	2	HUATABAMPO	HERMOSILLO			1 35 85 67, 2 19 79 87				f		569
570	SAO100202DB8	SOFTWARE ASSOCIATES OF MEXICO S DE RL DE CV	2	BLVD. JESUS GARCIA MORALES	HERMOSILLO			2 60 96 75		cuentasporpagar@tiempodevelopment.com		f		570
572	KMH091015BZ0	KMH, S.A DE C.V.	2	NAYARIT	HERMOSILLO			267 01 38 - 289 01 74		jose.r.cuevas@gmail.com		f		572
573	DML7905239C3	DHL METROPOLITAN LOGISTICS SC MEXICO SA DE CV	2	AUTOPISTA MEXICO-QUERETARO KM. 34.5	CUAUTITLAN IZCALLI			(662) 2 51 07 73		Gabriela.GutierrezC@dhl.com		f		573
576	SGO8501012H2	SECRETARIA DE GOBERNACION	2	BLVD. GARCIA MORALES	HERMOSILLO			2 36 06 98 EXT. 250		amontoya@inami.gob.mx		f		576
578	SAG051104J82	SAGARPA DELEGACION ESTATAL EN SONORA	2	PASEO DEL CANAL S/N				2 59 98 06		cyntia.madrid@sagarpa.gob.mx		f		578
579	PIC090626UH6	PROCESADORA INTERNACIONAL DE CARNES, S.A DE C.V.	2	CARRETERA A LAREDO KM. 27.5 S/N				667 759 26 00		judith.tyler@sukarne.com		f		579
580	GIV931231AN9	GANADERIA INTEGRAL VIZUR, S.A DE C.V.	2	CARRETERA CULIACAN-VITARUTO KM 14.5				667 713 06 05				f		580
581	PATE6509053A8	ENRIQUETA PACHECO TALAMANTE	2	PEÑA COLORADA	HERMOSILLO			2072905/06 /CASA 2173427		enriquetapacheco@hotmail.com		f		581
582	OOCR640402AZ8	ROBERTO OCHOA CERVANTES	2	AVE. COLOSIO	HERMOSILLO			3 02 03 48		copysolcentro@hotmail.com; copysolhillo@hotmail.com		f		582
583	GOSM440722U83	MARIA MAGDALENA GORTAREZ SAAVEDRA	2	FRANCISCO JAVIER MINA	HERMOSILLO			2 11 20 10				f		583
584	SUK931216N38	SUKARNE S.A DE C.V.	2	CARRETERA CULIACAN - VITARUTO KM. 14.5	CULIACAN			(667) 759 26 00/EXT 2856		judith.tyler@sukarne.com		f		584
585	CANR890530MYA	ROCIO ANAHI CALDERON NAVARRO	2	OCOTILLO	NAVOJOA			(642)422 78 51		gab_parragh@hotmail.com		f		585
586	SSG091107FR7	SN SERVICIOS GASTRONOMICOS DE SONORA, S.A DE C.V	2	CHICAGO NAVE				2 13 30 39, 2 13 30 37		lreyes@superdelnorte.com.mx		f		586
587	UCP030424UA9	URBI CONSTRUCCIONES DEL PACIFICO, SA DE CV	2	BLVD. ANTONIO ROSALES	LOS MOCHIS			01(668) 816 39 10 ext. 19		luis.salcido@urbi.com		f		587
574	UCP030424UA9	URBI CONSTRUCCIONES DEL PACIFICO, S.A DE C.V.	2	AV. LAZARO CARDENAS	CULIACAN			(667) 717 60 62		matias.martin@urbi.com		f		574
571	FAS800325G62	FRIGORIFICO AGROPECUARIA SONORENSE S DE RL DE CV	2	DE LA PLATA	HERMOSILLO			2 89 65 31		felectronica@norson.net		f		571
588	ODU021001N79	OBRAS Y DESARROLLOS URBI, S.A DE C.V.	2	CALLE AUTOCLUB	GOMEZ PALACIO			871 750 09 42		andres.ramirez@urbi.com		f		588
589	CAN060510HLC	CANDYMIN, S.A DE C.V.	2	AV. DE ANZA				2 11 19 58				f		589
590	IME0010122A8	IPTN DE MEXICO, S.A DE C.V.	2	NIÑOS HEROES	HERMOSILLO			2 13 54 05		crodriguez@iptn.com.mx		f		590
575	CMU030424PB2	CONSTRUCTORA METROPOLITANA URBI, S.A DE C.V.	2	ALBERTO COSSIO	SAN LUIS POTOSI			(444) 833 08 60 EXT. 1760		raymundo.guerra@urbi.com		f		575
738	MODC671126AY5	CONRADO ANTONIO MOLINA DURAZO	2	GARMENDIA	HERMOSILLO			210 18 11   2 10 29 25		facturas@teslacomputacion.com		f		738
591	PDU0210019H8	PROMOCION Y DESARROLLO URBI, S.A DE C.V.	2	AVENIDA LOMAS DE MAZATLAN	MAZATLAN			(669) 940 2000 EXT. 19505		sahid.nunez@urbi.com		f		591
592	BOLB770531T97	BRENDA BOJORQUEZ LEON	2	BLVD. MORELOS 245 LOCAL 3	HERMOSILLO			2 10 48 96				f		592
593	ROBF700114JJ2	FRANCISCO ROGEL BLANCO	2	SAHUARIPA				2 62 06 46				f		593
594	RUTD840122CD0	DAVID RUIZ TEROS	2	AV. 4	HERMOSILLO			2 85 44 93		teco_druiz@yahoo.com.mx		f		594
595	AUFN701216TSA	NORAH LETICIA  ANDUAGA FRANCO	2	FRANCISCO VAZQUEZ DE CORONADO	HERMOSILLO			2 10 30 16		pedidos@officestar.com.mx		f		595
596	EFU840730HP9	COMPAÑIA EMBOTELLADORA DEL FUERTE, S. DE R.L. DE C.V.	2	AV. BELISARIO CHAVEZ	CD. CUAUHTEMOC			01 625 5 82 36 36		ygonzalez@cef.com.mx		f		596
597	PDP970514UQ9	PROYECTOS Y DESARROLLOS PRODESA, S.A DE C.V.	2	CALLE DE LA PLATA	HERMOSILLO			2 18 96 78		prodesa@facturasempresas.com		f		597
598	SAL890509UQ1	SALYERI, S.A DE C.V.	2	16 DE SEPTIEMBRE				01 81 81 90 73 99		crendon@salyeri.com.mx		f		598
599	PAB090408CF3	PROMOTORA DE ALIMENTOS DE BAJA CALIFORNIA, S.A DE C.V.	2	CALZADA JUSTO SIERRA	MEXICALI			10 27 17  FAX  10 45 41		comprashmo@araizahoteles.com		f		599
600	SSC040816G99	SUPPLIERS CITY, S.A DE C.V.	2	BLVD. FUTURA	HERMOSILLO			2 37 96 22		elopez@supliercity.com.mx		f		600
601	EIFR5712131B7	RUBEN ELIAS FLORES	2	MISION CABORCA	HERMOSILLO			2 11 02 92		pattysieber@hmo.megared.net.mx		f		601
603	HOC7211276W4	HOTELES DE OCCIDENTE, S.A DE C.V.	2	BLVD. BENITO JUAREZ	MEXICALI			2 10 27 17		jtenias@araizahoteles.com		f		603
604	TAZA611101BU8	ANA ISABEL TAMAYO ZAMORA	2	CALLE TRES	HERMOSILLO			215 71 24		impresionesyequipos@hotmail.com		f		604
606	FIGG78091881A	GUADALUPE MARIA FIGUEROA GALLEGOS	2	CERRADA TONELES	HERMOSILLO			2510692		amedina@rcr.com.mx		f		606
607	POK090327NX7	PROVEEDORA DE OFICINAS KSLEY, S.A DE C.V	2	JOSE S. HEALY #202/ALDAMA Y GPE VICTORIA	HERMOSILLO			(662)310 7389, 310 7341		mrofice1@hotmail.com		f		607
608	YORJ840514A46	JESUS ANTONIO YON REYNA	2	CALLE 1RA.	CABORCA			2 15 75 83		anyore@hotmail.com		f		608
609	NAS080523F37	NIRBBANA ASOCIADOS S.A.P.I. DE C.V.	2	HAMBURGO				5511-19-24				f		609
610	SACJ430616AX3	JULIETA SALDIVAR CASTRO	2	DR. NORIEGA	HERMOSILLO			2 13 40 29		papgtz_mary@hotmail.com		f		610
611	GUSE730606AI2	MARIA EDITH GUTIERREZ SALAZAR	2	AVENIDA PERIFERICO NORTE	HERMOSILLO			2 20 88 84		arellanomvm@hotmail.com		f		611
612	GRA0411123M7	GRANMIN, S.A DE C.V.	2	AV. DE ANZA				2 67 80 73				f		612
613	CEE931230UB4	INSTITUTO ESTATAL ELECTORAL Y DE PARTICIPACION CIUDADANA	2	LUIS DONALDO COLOSIO	HERMOSILLO			2 59 49 00		lorenagiron@ieesonora.org.mx ; eortiz@ieesonora.org.mx		f		613
614	CEA000719U60	CASTILLO ENCINAS Y ASOCIADOS, S.C.	2	COLOSIO	HERMOSILLO			217 01 25		renee@castilloencinas.com.mx		f		614
615	LCO010524JI4	LOGISTIC CONCEPTS, S.A DE C.V.	2	BLVD. MORELOS	HERMOSILLO			2 89 12 20		tesoreria@rshopping.com		f		615
616	GAMP8405294U5	PATRICIA GAITAN MACIEL	2	AV. JUAREZ OTE	ZAMORA			351 51 7 46 07		gaitanramon@hotmail.com		f		616
617	LAAP601108376	PLINIO LLAMAS ASENCIO	2	VERACRUZ	HERMOSILLO			2 10 33 90		llamasper@megared.net.mx		f		617
618	SDI831007RD4	SIST PARA EL DES INT DE LA FAM DEL EDO DE SON	2	BLVD. LUIS ENCINAS	HERMOSILLO			289 26 00 EXT. 161		pagaduria@difson.gob.mx		f		618
619	TPR920625G68	T Y P REFRIGERACION, S.A DE C.V.	2	NAYARIT	HERMOSILLO			2 61 11 10		adessens@typrefrigeracion.com.mx		f		619
620	ESS981112IK6	EQUIPOS, SERVICIOS Y SUMINISTROS, S.A DE C.V.	2	SICOMORO	COL. FUENTES DEL MEZ			2 12 54 42				f		620
621	MAR960628QU0	MEXICANA DEL ARCO, S.A DE C.V.	2	CAMPOS ELISEOS	DEL. MIGUEL H.   MEX			1 09 21 17		Recepcion.FacturaElectronica@gmexico.com		f		621
622	IMM8505281U0	INDUSTRIAL MINERA MEXICO, S.A DE C.V.	2	CAMPOS ELISEOS	DEL. MIGUEL H.    ME			1 09 21 17		silveria.hernandez@mm.gmexico.com		f		622
623	VVS081231SR8	VISION XXI STG S.A DE C.V.	2	CALLE PITIQUITO				01 637 37 3 03 00				f		623
624	MSE950906NM2	MINERA SECOTEC, S.A DE C.V	2	AV. DE ANZA	HERMOSILLO			2 11 19 58		minera_secotecfe@hotmail.com		f		624
625	SEE920518J5A	SERVICIOS EDUCATIVOS DEL EDO.DE SONORA-PREESCOLAR	2	AV. LUIS DONALDO COLOSIO FINAL PTE.				2 89 76 00				f		625
626	AUGJ640714QV4	JOEL ANGULO GUERRERO	2	MATAMOROS	HERMOSILLO							f		626
627	CIC8308165A4	CICOVISA, S.A DE C.V	2	AMORES	MEXICO			01 551 10 70 700		mariagarcia@cicovisa.com		f		627
628	ESC0512228X3	ESCUELA CULINARIA DEL SURESTE, A.C.	2	CALLE 37 No. 300				(999) 948 26 81, 252 05 5		isabel.ramos@culinaria.edu.mx; cobranzaculinaria@hotmail.com		f		628
629	GEB4603194H7	GOBIERNO DEL ESTADO DE BAJA CALIFORNIA SECRETARIA DE TRABAJO	2	VIA ORIENTE Y PREVISION SOCIAL				664 622 02 66				f		629
630	ANX920101UZ8	ALCATEL-LUCENT DE NOGALES, S.A	2	AVENIDA DE LOS NOGALES	SAN CARLOS ORIENTE			631 314 05 55				f		630
631	STA7612099Y7	S T A U S	2	YAÑEZ				2 13 26 42				f		631
632	SEE920518J5A	S.E.E.S - REFORMA EN LA EDUCACION SECUNDARIA	2	AV. LUIS DONALDO COLOSIO FINAL PTE.				2 89 76 00				f		632
633	ICT941215GW8	I.C.A.T.S.O.N.	2	CAMPECHE	HERMOSILLO			2 10 91 08/ 2 10 91 09				f		633
634	GACI630101LV3	IGNACIO GAYTAN CASAS	2	FRANCISCO MONTEVERDE	HERMOSILLO			2 15 80 88		easychoice2@hotmail.com		f		634
635	VEAL530215F87	JOSE LUIS VERA AGUILAR	2	CALLE PINOS	HERMOSILLO			302 66 72		jlvera@hotmail.com		f		635
636	FCA-700310-U9A	FUNDIDORA DE CANANEA,S.A. DE C.V.	2	COLONIA INDUSTRIAL	CANANEA			(645)33 2 84 17 Y 00		calderon@fucasa.com		f		636
637	CMA-911003-HR6	COBRE DEL MAYO SA DE CV	2	LOCALIDAD PIEDRAS VERDES	ALAMOS			647-428-3055		dinora.urbalejo@cobredelmayo.com;		f		637
639	AAU840208MD4	AGRICOLA Y AUTOMOTRIZ S.A. DE C.V	2	BLVD. RODRIGUEZ Y GASTON MADRID	HERMOSILLO			259 8900 EXT 962		cuentasporpagar@agricolavw.com		f		639
640	CSL990305N21	CORPORATIVO DE SERVICIOS LEGAXXI SC	2	BLVD FCO EUSEBIO KINO	SONORA			289 89 20, 280 50 70		legaxxifactura@hotmail.com; auditorhmo@legaxxi.com		f		640
641	SADI661221QP1	IDAENA SWANSON DAVILA	2	GENERAL PIÑA	HERMOSILLO			260 56 23				f		641
638	ISI980330SP5	INSTITUTO SONORENSE DE INFRAESTRUCTURA EDUCATIVA	2	BLVD KINO	HERMOSILLO			214 60 33  214 61 37				f		638
605	AHE980601H96	AEROPUERTO DE HERMOSILLO, S.A DE C.V.	2	CARRETERA A BAHIA DE KINO KM 9.5	HERMOSILLO	SONORA	(662) 2610000	(662) 2610142 		gcruz@aeropuertosgap.com.mx	GERMAN CRUZ	f	114	605
642	GCP800324FJ1	GRUPO CONSTRUCCIONES PLANIFICADAS SA DE CV	2	PERIFERICO PTE.	HERMOSILLO			(662) 108 0500		recepcion@construplan.com.mx		f		642
643	SEC8908244S6	SISTEMAS ELECTRICOS Y CONDUCTORES, S.A DE C.V.	2	MORELOS	NAVOJOA			(642) 42 5 60 00		Almacecilia.borbon@mx.yazaki.com		f		643
602	EIS430714ER6	EISAC	2	EUGENIO GARZA SADA	HERMOSILLO			667 712 00 08		mirna.soria@sorteotec.itesm.mx		f		602
646	AIHF700921UZ0	FRANCISCO JAVIER ARRIOLA HERRERA	2	TAMAULIPAS	HERMOSILLO			2 10 96 91		fjarriola@hotmail.com		f		646
647	PLO9706125X8	PENSKE LOGISTICA SA DE CV	2	CALLE ANTONIO DOVALI JAIME 70 PISO 4	DISTRITO FEDERAL			259 83 50		areli.moreno@penske.com		f		647
649	GAS0712112S0	GRUPO ANTOLIN SALTILLO, S DE R.L. DE C.V.	2	DR.JESUS VALDES SANCHEZ				844 483 18 65				f		649
650	IHE070904PW4	IACNA HERMOSILLO S DE RL DE CV	2	BLVD HENRY FORD	HERMOSILLO			108 12 60/36		OSANDOVAL@IACNA.COM		f		650
651	LOGM6002197J9	MARIO LOPEZ GARCIA	2	JOSE OBREGON	HERMOSILLO			2 18 46 80				f		651
652	EMP071130FG8	EXPLORACIONES MINERAS PEÑOLES SA DE CV	2	CALZADA MANUEL GOMEZ MORIN	TORREON			208 26 35		roman_galaz@penoles.com.mx		f		652
653	ISL011017B7A	ILS SERVICIOS LOGISTICOS, S.A DE C.V.	2	CARR. INT. KM 129 SALIDA NORTE	GUAYMAS			01 622 22 5 40 21		efactura@mtk.com.mx		f		653
654	PCA9908027X8	PROMOTORA COMERCIAL ALPRO S DE RL DE CV	2	CALLE DE LA PLATA	HERMOSILLO			259 58 00, 259 58 42		felectronica@norson.net		f		654
655	MALM591117JT7	MARTHA OLIVIA MARTINEZ LOPEZ	2	12 DE OCTUBRE				2 12 16 51				f		655
656	TEL0109063H8	TELEASESORES, S.C.	2	ADALBERTO TRUQUI	HERMOSILLO			280 50 70, 2 89 89 20		sistemashmo1@legaxxi.com		f		656
657	NME070329EN6	NETMARK MEXICO, S. DE R.L. DE C.V.	2	AV. SANTA FE	MEXICO			0155 59 80 56 42				f		657
658	LWS970725QFA	LEONI WIRING SYSTEMS MEXICANA SA DE CV	2	BLVD. ANTONIO DE QUIROGA	HERMOSILLO			289 71 00  ext. 3415		alma.rios@leoni.com		f		658
659	SALE801126QU3	ERIKA PATRICIA SANCHEZ LOPEZ	2	OBREGON Y ZARAGOZA LOCAL 4	SANTA ANA			01 641 32 41381				f		659
648	CEA990831FI8	COMISION ESTATAL DEL AGUA	2	CALLE 22 Y AV. 13				622 224 08 00				f		648
661	OME881213JG6	OMENCO SA DE CV	2	LIC. PRIMO DE VERDAD	HERMOSILLO			210 22 33		omenco@hmo.megared.net.mx		f		661
662	IMS421231I45	IMSS SONORA ALMACEN DELEGACIONAL	2	5 DE FEBRERO	CD. OBREGON			01 644 4 14 40 27		ana.medina@imss.gob.mx		f		662
664	GOIA7611064SA	ANA SOFIA GONZALEZ IBARRA	2	CID CAMPEADOR	HERMOSILLO			135 25 34				f		664
665	SMA941228Q63	SEMARNAT-CONANP	2	CAMINO AL AJUSCO				213 99 26				f		665
666	ITS620522QH1	INSTITUTO TECNOLOGICO DE SONORA	2	5 DE FEBRERO				01644 410 09 18 Y 19		almacenfe@itson.edu.mx; Jesus.alfaro@itson.mx		f		666
667	TAL980509F88	TURISTICA LOS ALGODONES, S.A. DE C.V.	2	DE LA PLATA	HERMOSILLO			218 96 78		turistica@facturasempresas.com; ofnapesqueira@hotmail.com		f		667
668	GES790913CT0	GOBIERNO DEL ESTADO-CONTRALORIA	2	COMONFORT Y DR. PALIZA S/N	HERMOSILLO			217 20 51		jose.gallardo@sonora.gob.mx		f		668
669	VANJ680629TS4	JESUS ROBERTO VARGAS NAVARRO	2	JESUS SIQUIEROS	HERMOSILLO			2 15 29 70		marciaguadalupe@hotmail.com		f		669
670	ICE850610UY2	INSTITUTO DE CREDITO EDUCATIVO DEL EDO DE SON	2	SINALOA  Y N. BRAVO	CD OBREGON			6444106300/2898723		facturasobr@icees.gob.mx; nelly@icees.gob.mx		f		670
671	IVH700722KR5	INSTITUTO VANGUARDIA DE HERMOSILLO A.C.	2	BLVD NAVARRETE Y REAL DEL ARCO	HERMOSILLO			218 35 08		ANAMARIAVEGA@INSTITUTOVANGUARDIA.COM.MX		f		671
645	SCT051121SM4	SECRETARIA DE COMUNICACIONES Y TRANSPORTES	2	AVENIDA FEDERALISMO	HERMOSILLO			01 667 758 81 33		lortegam@sct.gob.mx		f		645
672	GES790913CT0	GOBIERNO DEL ESTADO DE SONORA - SEC	2	COMONFORT Y DR. PALIZA								f		672
673	UTM0109175F8	UNIVERSIDAD TEC MILENIO AC	2	PASEO DE LA PAZ Y PASEO VALLE GRANDE	HERMOSILLO			285 45 43   285 45 03				f		673
674	SEE920518J5A	SEES-PREPARATORIA ABIERTA	2	LUIS DONALDO COLOSIO FINAL PONIENTE								f		674
675	SEE920518J5A	SERVICIOS EDUCATIVOS DEL ESTADO DE SONORA	2	LUIS DONALDO COLOSIO FINAL PONIENTE S/N	HERMOSILLO			2897695 2897600 EXT. 1695		hurtadoe.lucia@sec.gb.mx		f		675
676	PME050228A77	PEAL MEXICO S.A. DE C.V.	2	ENRIQUE GARCIA SANCHEZ	HERMOSILLO			216 45 00		facturas.mexico@peal.es		f		676
677	OIGR530413J29	ROSA MARIA ORTIZ GASTELUM	2	PERIFERICO	HERMOSILLO			213 39 82				f		677
678	CMS8001215L3	LAS CERVEZAS MODELO EN SONORA SA DE CV	2	BLVD SOLIDARIDAD Y TERCERA	HERMOSILLO			2 50 22 87		crhis.herrera@gmodelo.com.mx		f		678
679	SCI080723AV1	SUMINISTROS Y COMESTIBLES INSTITUCIONALES DEL NORTE SA DE CV	2	BOULEVARD IGNACIO SALAZAR	HERMOSILLO			261 20 49 / 6621023010		josefinaduarte@institucionalesdelnorte.com.mx		f		679
680	CPA840111CD7	CAFE DEL PACIFICO, S.A.P.I. DE C.V.	2	BLVD. ENRIQUE MAZON LOPEZ	HERMOSILLO			2 89 07 40				f		680
681	MON001215JC0	MINAS  DE ORO NACIONAL SA DE CV	2	CALLE DE LOS PIMAS	HERMOSILLO			217 37 07   217 37 16		viridiana.ozuna@minasdeoro.com; ctasxpagar@minasdeoro.com		f		681
682	GAS9403186J1	GRUPO ANTOLIN SILAO SA DE CV	2	AVE  INGENIEROS	SILAO			(472) 722 74 00		carolina.gonzalez@grupoantolin.com		f		682
683	MDO040318R86	MEXICAN DOOR COMPANY S DE RL DE CV	2	BLVD. FUSION	HERMOSILLO			108 20 00		finanzas.gis@grupoantolin.com		f		683
684	VIM970403775	VIMIFOS, S.A. DE C.V.	2	CALLE 4	EL SALTO			016444109500 EXT. 244		gdlopez@vimifos.com		f		684
685	FIMR520402JB6	RAUL ARMANDO FIMBRES MONTIJO	2	ARCO IRIS	HERMOSILLO			216 18 75		raulfimbres@hotmail.com		f		685
687	MOMR620315H63	RAYMUNDO MONTOYA MOLINA	2	12 DE OCTUBRE				212 16 51				f		687
688	MOVR-901015BZ5	RAYMUNDO MONTOYA VALENZUELA	2	GRAL. PIÑA				212 16 51				f		688
660	SSS970311993	SERVICIOS DE SALUD DE SONORA	2	COMONFORT Y PASEO DEL CANAL S/N	HERMOSILLO			1 08 45 00, 108 45 23				f		660
663	GES790913CT0	GOBIERNO DEL ESTADO DE SONORA SUPREMO TRIBUNAL DE JUSTICIA	2	TEHUANTEPEC Y COMONFORT 	HERMOSILLO	SONORA	(662) 3370739	(662) 213 0855			IRENE	f	No Aplica	663
686	AQU-800410-SQ2	AQUAFIM, S. A. DE C.V.	2	VERACRUZ	HERMOSILO	SONORA	6622760567	(6622)760567	(662) 2607080	patypadilla@aquafim.com	PATRICIA PADILLA	f	145	686
644	AOB9102061B8	AUTOCIRCUITOS DE OBREGON, S.A DE C.V.	2	CIRCUITO DEL PARQUE	CD. OBREGON	SONORA	(644) 4105200	(644) 4 10 52 46		melissa.meraz@mx.yazaki.com	MELISSA MERAZ	f	2130	644
689	FHE0406252Z2	FLEX-N-GATE HERMOSILLO S DE RL DE CV	2	MERCURY	HERMOSILLO			108 08 00 ext. 1817		oruiz@fnghmo.com.mx; compas@fnghmo.com.mx		f		689
691	LAEI720622PC6	ISRAEL LABORIN ESTRELLA	2	ISABEL LA CATOLICA	HERMOSILLO			216 43 09				f		691
692	EMP0505028V3	EXPLORACIONES MINERAS PARREÑA SA DE CV	2	CALZ. SALTILLO 400	TORREON			236 12 07   236 12 00		exploracionhmo@fresnilloplc.com		f		692
693	TME990923FP2	TWB DE MEXICO SA DE CV	2	KM. 117 AUTOPISTA MEXICO-PUEBLA				1081400		f_pequeno@twbmex.com; j_solis@twb.com		f		693
694	VGR720821VB4	VALLE GRANDE SA DE CV	2	BLVD. KINO	HERMOSILLO			109 01 00				f		694
695	MMH010511NP6	MEXMATERIAL HANDLING SA DE CV	2	BLVD. LOPEZ PORTILLO				210 78 08				f		695
696	AUFM740625KSO	MARCO ANTONIO AGUILAR FELIX	2	OTHON ALMADA Y AMERICA	HERMOSILLO			2 13 74 43		maarcosa@hotmail.com		f		696
697	FSA980318AL3	FAURECIA SISTEMAS AUTOMOTRICES DE MEXICO S.A. DE C.V.	2	BLVD. HENRY FORD	HERMOSILLO			108 11 00		Exhaust.apinvoices@faurecia.com		f		697
698	NOLG480917CU1	GRACIELA NORIEGA LEON	2	VICENTE GUERRERO	HERMOSILLO			212 56 82 212 56 15				f		698
699	FEN000508IK9	FUERZA Y ENERGIA DE NACO-NOGALES SA DE CV	2	JAIME BALMES	DEL.MUGUEL HIDALGO M			0163333 89440		FacturaDigitalMexico@gasnatural.com		f		699
700	GES790913CT0	GOBIERNO DEL ESTADO DE SONORA (REGISTRO CIVIL)	2	COMONFORT Y DR. PALIZA	HERMOSILLO			2 17 06 08				f		700
701	PAOJ-590925-S34	JAVIER RAMIRO PARRA ORTEGA	2	DESPACHO 7, EDIF. PERALTA	HERMOSILLO			217 19 19		ines_soto@hotmail.com		f		701
702	PIM-920720-JQ3	PROMOTORA INMOBILIARIA DEL MUNICIPIO DE HERMOSILLO	2	VERACRUZ	HERMOSILLO			109 32 00		facturapim@hotmail.com		f		702
703	MPE9906301C6	MINERA PE COBRE SA DE CV	2	BLVD NAVARRETE				2 36 12 00				f		703
704	MPA-850316-1D1	COMPAÑIA MINERA LA PARREÑA SA DE CV	2	CALZADA MANUEL GOMEZ MORIN	TORREON			(632) 108 1873, 108 1872		Adalberto_Sanchez@penoles.com.mx;		f		704
706	OOGD660824314	DIONISIO OTHON GARCIA	2	ORTIZ TIRADO	HERMOSILLO			213 70 24				f		706
707	SFO031014IH2	SONORA FORMING SA DE CV	2	BLVD HENRY FORD				289 55 00		sftpayables@cosma.com		f		707
708	FAN870311EE6	FANOSA SA DE CV	2	BLVD. IGNACIO SOTO Y AVE. ALATORRE	HERMOSILLO			289 03 03		notificaciones.fanosa@ekonom.com.mx; gabriela.carranza@fanos		f		708
710	UFG010425T28	UNION FENOSA GENERACION MEXICO SA DE CV	2	BLVD. MANUEL AVILA CAMACHO				0163333 89445/ 89440				f		710
711	VEM000210H45	VICTOR EQUIPMENT DE MEXICO SA DE CV	2	JESUS SIQUEIROS	HERMOSILLO			236 00 00		facturacion_victordemexico@victortechnologies.com		f		711
713	CME820101LJ4	CEMEX MEXICO, S.A DE C.V.	2	CARRETARA A LA COLORADA KM 17.5	HERMOSILLO			259 01 00		monica.rojas@cemex.com		f		713
714	SUR0112143E5	SURGRAN, S.A DE C.V.	2	NARANJO	HERMOSILLO			2 15 26 10		sugrann@hotmail.com		f		714
715	PFC7512226Y3	PROCURADURIA FEDERAL DEL CONSUMIDOR	2	OAXACA  PTE				2 13 86 16 /2138613				f		715
716	MCL9901258E3	MFC CONSULTORIA LEGAL, S.C.	2	GALEANA	HERMOSILLO			212 60 63   212 60 65		contabilidad@mfcconsultorialegal.com		f		716
717	UCP030424UA9	URBI CONSTRUCCIONES DEL PACIFICO SA DE CV	2	TABASCO				210 68 58				f		717
718	SCA9606244R0	SALAZAR CORNEJO Y ASOCIADOS, S.C.	2	TEHUANTEPEC	HERMOSILLO			2 17 07 84				f		718
719	MPE900801AG9	MINERA PENMONT, S DE R.L. DE C.V.	2	CALZADA SALTILLO 400	TORREON COAHUILA			01637 37 21935		ap_lh@penoles.com.mx		f		719
720	QUMD8001139A6	DEBORA EUNICE QUINTERO MONTAÑO	2	CALLE 7 AV. JUAREZ	CUMPAS			01634 34 6 05 92				f		720
721	TATC4101023Y3	CESAR TRASVIÑA TRASVIÑA	2	BLVD. HIDALGO	HERMOSILLO			2 13 64 08				f		721
722	AEMM480812CV2	MINERVA ABREU MARTINEZ	2	CARRETERA INTERNACIONAL KM.8	NOGALES			01 632 32 2 02 25				f		722
723	GVA7209049N6	GUANTES VARGAS, S.A	2	CALZADA DE GUADALUPE	MEXICO			259 81 98 - 2510952		cesar.romero_dm@vargas-sa.com.mx		f		723
724	MCO860704QQ1	MEXICANA DE COBRE, S.A DE C.V.	2	KM,21 CARR. NACOZARI-AGUA PRIETA	NACOZARI DE GARCIA			2 61 11 468, 109 21 30		recepcion.facturacionelectronica@gmexico.com		f		724
725	RIRJ510523H25	JUAN ANTONIO RIOS RIVERA	2	AV. CONGRESO	HERMOSILLO			210 33 54		juanriosrivera@hotmail.com		f		725
726	SAG511004J82	SAGARPA DDR-002 MAGDALENA	2	CARR DE LIBRAMIENTO DE MAGDALENA KM 188	MAGDALENA			01 632 32 2 36 61				f		726
727	OCA-940530PW5	OOMAPAS DE CAJEME	2	SINALOA	CD. OBREGON			016444 108383		oomapas@repobox.com.mx		f		727
729	MDI020801TD2	MULTICOPY DIGITAL, S.A DE C.V.	2	VERACRUZ	HERMOSILLO			214 76 07   214 75 02		multicopy@hotmail.com		f		729
730	ISB010813HE9	COMPAÑIA INDUSTRIAL SIERRA BLANCA S.A DE.C.V	2	ESTEBAN BACA CALDERON	HERMOSILLO			2 15 24 48, 2 15 50 46				f		730
731	TAN9711121Z0	TIENDAS DE AUTO SERVICIO DEL NORTE SA DE CV	2	CALLE CHICAGO S/N, NAVE 3 ENTRE CALZADA DE LOS ANGELES Y VILLA ALEGRE	HERMOSILLO			213 64 15  213 64 16		ktanori@superdelnorte.com.mx		f		731
732	MAFC771222QX5	CARLOS RANGEL MARTINEZ FIGUEROA	2	ENRIQUE QUIJADA  Y G.  PIÑA	HERMOSILLO. SONORA			2 15 04 08, 214 55 61		papeleriaofimat@gmail.com		f		732
733	SAPA740507M5A	ANA CATALINA SABORI PALMA	2	DOMICILIO CONOCIDO S/N	HUEPAC			2 10 77 32				f		733
734	MCO-860704QQ1	MEXICANA DE COBRE S.A DE C.V.	2	KM. 21 CARR. NACOZARI-AGUAPRIETA				GUAYMAS, SON				f		734
735	AHE020124U84	AGUA DE HERMOSILLO	2	BLVD. LUIS ENCINAS Y AV. UNIVERSIDAD	HERMOSILLO			2896000 EXT 6022, 6087				f		735
736	CSO850809IQ9	EL COLEGIO DE SONORA, OPD	2	AV. OBREGON	HERMOSILLO			259 53 00		gluna@colson.edu.mx; anieblas@colson.edu.mx		f		736
737	CAAA731001S6A	ALAIN DAVID CHAVEZ ALVAREZ	2	MALTEZA  Y AV. ROY	HERMOSILLO			2 13 25 52		adca@hmo.megaret.net.mx		f		737
709	ASO980112369	ABSA SONORA SA DE CV	2	PASEO RIO SONORA SUR	HERMOSILLO	SONORA	662 1090170	(662) 109 01 70	(662)1090177	luisramos@absason.com	GPE AGUIRRE	f	77	709
690	ACS981001UE9	ACS BUSINESS PROCESS SOLUTIONS DE MEXICO S.A DE C.V	2	BLVD. GARCIA MORALES	HERMOSILLO	SONORA	(662) 2760423	(662) 260 65 43		lizeth.contreras@xerox.com	LIZETH CONTRERAS	f	43	690
728	CCS-810209RH5	CELULOSA Y CORRUGADOS DE SONORA, S.A. DE C.V.	2	CARRETERA INTERNACIONAL NAVOJOA-LOS	COL. PARQUE INDUSTRI	SONORA	6621-94-53-83	(642) 42 2 40 40		rmirand@cecso.com.mx	MARCO LAUTERIO	f		728
705	CMU860106H75	COLEGIO MUÑOZ SC	2	PASEO SANTA FE #2 DEPTO. 5-A	HERMOSILLO	SONORA	(662)2184912	(662)2166416		chavez.liz@hotmail.com	LIZBETH ARAUJO CHAVEZ	f		705
739	VIMM-570203LT0	JOSE MANUEL VILLA MENDOZA	2	AVE. S NORTE	H. CABORCA			01 637 372 65 73		josevilla_mendoza@hotmail.com		f		739
740	CCO-7409189M1	CEMEX CONCRETOS, S.A. DE C.V.	2	BLVD. GARCIA MORALES	HERMOSILLO			218 16 50		evelier.sanchez@cemex.com		f		740
741	SCA-970805263	SERVICIOS EN COMPUTACION ADMINISTRATIVOS, S.C.	2	JOSE MARIA MENDOZA ESQ. MANUEL LOAIZA	HERMOSILLO			218 48 48		softrain@hmo.megared.net		f		741
742	DNO-010619953	DEX DEL NOROESTE, S.A. DE C.V.	2	AGUASCALIENTES	HERMOSILLO			215 67 83, 85, 44		Dexdelnoroeste@live.com; compras_dexhillo@hotmail.com		f		742
743	SEP210905778	SECRETARIA DE EDUCACION PUBLICA	2	AVE. CUAUHTEMOC	MEXICO			289 76 00				f		743
744	OOIF630329U10	FRANCISCO MARTIN OCHOA IBARRA	2	AV. DE LOS MONTES	HERMOSILLO			212 51 50		fmochoa@hotmail.com		f		744
745	PRB-940418AYO	PAPELERIA Y REGALOS BETS, S.A. DE C.V.	2	BLVD. LUIS DONALDO COLOSIO	MAGDALENA			632 32 2 20 10  2 36-44				f		745
746	MCA-900621-K92	BUENAVISTA DEL COBRE, S.A. DE C.V.	2	AVENIDA JUAREZ	CANANEA			01645 33 28009  26881				f		746
747	CME820101LJ4	CEMEX MEXICO, S.A. DE C.V.	2	AV. CONSTITUCION	MONTERREY			259 0115				f		747
748	CCM010710UU1	CERVEZAS CUAUHTEMOC MOCTEZUMA, S.A. DE C.V.	2	AV. ALFONSO REYES	MONTERREY			(662) 2 89 96 00		cfdpp@cfm.femsa.com.mx		f		748
749	MOFM-6704201W4	MARTIN IGNACIO MOLINA FORNI	2	MANUEL GONZALEZ	HERMOSILLO			2-13-97-13				f		749
750	PPK-9801205Z2	PROVEEDORA PAPELERA KINO, S.A. DE C.V.	2	ARIZONA	HERMOSILLO			(662) 210 7965		comprobantesdigitales@ppk.com.mx;compras@ppk.com.mx		f		750
751	BMU8605134I8	BEBIDAS MUNDIALES, S DE RL DE C.V.	2	AV. ALFONSO REYES NTE	MONTERREY			289-99-07/ 289-99-00, 2 8		bemusa.cxp@arcacontal.com		f		751
752	VEPG-821102GY8	GRAISY SUZUKI VERDUGO PALAZUELOS	2	WOOLFOLK S/N	MAGDALENA DE KINO			01 632 32 2-11-50		papelerialp1@msn.com		f		752
753	RUFF-660113KQ8	FRANCISCO RUIZ FELIX	2	PETRARCA	HERMOSILLO			2-50-20-35				f		753
754	FPS961003ES0	FUNDACION PRODUCE SONORA, A.C.	2	PRIVADA 2A DE AGUSTINOS 1	HERMOSILLO			214 69 84/214 98 61		ytorua@produce.org.mx		f		754
755	GASA-471007P13	ALICIA GARCIA SANDOVAL	2	CALLE TORIM	GUAYMAS			01 6 22 22 2 69 93		gust-lop@hotmail.com; papelerialogar@hotmail.com		f		755
756	DUFF630215TKA	FRANCISCO DUARTE FELIX	2	REVOLUCION	HERMOSILLO			212 3308		ofi_sistemas@hotmail.com		f		756
758	HPH921116CI1	HOSPITAL PRIVADO DE HERMOSILLO, S.A. DE C.V.	2	PASEO RIO SAN MIGUEL	HERMOSILLO			259 09 00		cfd@cimahermosillo.com		f		758
759	UTH-981009NE1	UNIVERSIDAD TECNOLOGICA DE HERMOSILLO SONORA	2	BLVD. DE LOS SERIS FINAL SUR				2 51 11 01 al 04				f		759
760	SSP-860611GM7	SONORA S. PLAN, S DE R.L. DE C.V.	2	OBRERO MUNDIAL  Y BLV. GARCIA MORALES	HERMOSILLO			216 98 30, 2 89 97 00		hgerman@collectron-int.com		f		760
761	RDI-841003QJ4	RADIOMOVIL DIPSA, S.A. DE C.V.	2	BLVD. ROSALES	HERMOSILLO			259 91 00		jose.dewar@mail.telcel.com		f		761
762	PEAG-610920515	GUILLERMO ARTURO PENNOCK AGUAYO	2	SERDAN	HERMOSILLO			217-20-40		fchillo@prodigy.net.mx		f		762
763	EIVJ430101M61	JESUS ROBERTO ESPINOZA VILLEGAS	2	PASEO DE LA FLORESTA	HERMOSILLO			260 68 96// 2166075		compugrafica@hmo.megared.net.mx		f		763
764	CBE-750713237	COLEGIO DE BACHILLERES DEL EDO. DE SONORA	2	BLVD. AGUSTIN VILDOSOLA FINAL	HERMOSILLO			2 59 29 03, 2 59 29 08 Y				f		764
765	MCO860704QQ1	MEXICANA DE COBRE, S.A. DE C.V.	2	KM. 21 CARR. NACOZARI-A.PRIETA	NACOZARI DE GARCIA			(662) 1092119		mesadeservicios@csc.gmexico.com		f		765
766	ROVE-490125MU2	EDELIA ROBLES VILLA	2	REFORMA   Y VENTURA G. TENA	HERMOSILLO			210 88 22		rv_surtidora@yahoo.com		f		766
146	ITE430714KI0	INSTITUTO TECNOLOGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY	2	EPIGMENIO GONZALEZ	QUERETARO			01 4422 383258		cristina.sanchez@itesm.mx		f		146
767	ICE850610UY2	INSTITUTO DE CREDITO EDUCATIVO DEL EDO DE SON.	2	OLIVARES	HERMOSILLO			289 87 00		cristina.sanchez@itesm.mx		f		767
768	TEDJ-571018-E9	JULIO CESAR TELLEZ DORAME	2	VILLA CONSTITUCION	HERMOSILLO			213 90 15				f		768
769	BPU7901018D4	BEBIDAS PURIFICADAS, S. DE R.L. DE C.V.	2	CALZADA DE LA VIGA				250 88 55				f		769
770	CECD720227671	DANIEL ALBERTO CEBALLOS CABALLERO	2	AVENIDA UNO				215 20 43, 214 88 11		papeleriaceballos@hotmail.com		f		770
771	VEGR-690205-NY5	RAMSES DAVID VELEZ GONZALEZ	2	SAHUARIPA	HERMOSILLO			262 03 04		ra_vel6@hotmail.com		f		771
772	GAAM-440117-5L3	MANUEL GARCIA ACUÑA	2	CLZA. AGUSTIN GARCIA LOPEZ				01 622 22 4-06-25				f		772
773	HUML-8209103W9	LUIS ALFREDO HUGUEZ MENDOZA	2	ENRIQUE B. MICHEL 107 ESQ. ZUB				213 53 36		luisalfredoh@hotmail.com		f		773
775	SMA8901162I7	SEMARNAT CONAGUA ORGANISMOS DE CUENCA NOROESTE	2	PASEO DE LA CULTURA Y COMONFORT				13 04 19   13-39-35		carmen.cano@conagua.gob.mx		f		775
776	CIA-820316TI4	CENTRO DE INVESTIGACION EN ALIMENTACION Y DESARROLLO, A.C.	2	KM. 0.6 CARRETERA A LA VICTORIA				289 24 00  EXT.337/251				f		776
777	VAIE661107L84	ERNESTO ALONSO VALDEZ IBARRA	2	BLVD SOLIDARIDAD ESQ. CON BLVD. NAVARRETE				210 28 05		facturamegacomm@prodigy.net.mx		f		777
778	ROCF521003N48	FRANCISCO ARMANDO RODRIGUEZ CORDOVA	2	JUAN JOSE AGUIRRE				214 19 31		francisco_papeleria@hotmail.com		f		778
779	DSC990218K55	DISTRIBUCIONES Y SERVICIOS COMPUTACIONALES, S.A DE C.V.	2	VERACRUZ				214 90 05,  214 96 38		disc2@prodigy.net.mx		f		779
780	LAR-920429L6A	LARNET, S.A. DE C.V.	2	P. DEL PARQUE  Y P. DEL DES				18-47-63- 18-10-37				f		780
781	SAHG-721029HW7	GABRIELA SALIDO HURTADO	2	NAYARIT	HERMOSILLO			215 5540  210 6979		cxpxtra@hotmail.com		f		781
782	SAT-970701NN3	SERVICIO DE ADMINISTRACION TRIBUTARIA	2	AVENIDA  HIDALGO	DELEGACION CUAHUTEMOC			259 70 19, 259 70 45				f		782
783	JICA520303JF7	ALFREDO JIMENEZ CAMPOS	2	AV. JOSE S HEALY				214 73 77		alfredojimenezc@yahoo.com		f		783
784	GES-790913CTO	SUTSPES	2	AVE. OBREGON				217 0307				f		784
785	SMC970619JQ2	SISTEMAS MODERNOS DE CABORCA, SA DE CV.	2	BLVD. JUAREZ				01 637 3723434 /246 46				f		785
786	JIMJ740904SS5	JESUS ANGEL JIMENEZ MONTAÑO	2	BLVL. LUIS ENCINAS JHONSON  Y JESUS GARCIA				212 3050  213 0702		juanjimenezserviequipos@hotmail.com; serviequipos52@hotmail		f		786
787	ISC-881226FM5	INSTITUTO SONORENSE DE CULTURA	2	OBREGON   Y GARMENDIA				213 44 11				f		787
788	TME-891117F56	TELECOMUNICACIONES DE MEXICO	2	EJE CENTRAL LAZARO CARDENAS				212 67 77		aquisic@telecomm.net.mx		f		788
789	PRP890414HL7	PAPELERIA Y REGALOS PAPIROS, S.A DE C.V.	2	LUIS DONALDO COLOSIO M EDIFICIO CINE SONORA LOCAL 32				2 17 24 58		papeleria_papiros@hotmail.com		f		789
790	OSO081119SG8	OPERAHOTELES DE SONORA S.A. DE C.V.	2	BLVD. FRANCISCO EUSEBIO KINO				210  2717		proveedorhmo@araizahoteles.com; jgonzalez@araizahoteles.com		f		790
791	LOFA480223A42	JOSE ANTONIO LOPEZ FRANCO	2	AV. PRIVADA				214 83 30		stockpapeleria@hotmail.com		f		791
793	FMO8304236C5	FORD MOTOR COMPANY, S.A DE C.V.	2	CALLE GUILLERMO GONZALEZ CAMARENA 50 PISO	MEXICO D.F.			55 5899 7040		jteran1@ford.com; jamaya7@ford.com		f		793
794	CRE631115HG4	COLEGIO REGIS  A.C.	2	JAVIER DE LEON				214 10 50		proveedoresregis@hotmail.com		f		794
795	AAGJ460703FR3	JERONIMO ABASCAL GAXIOLA	2	JUAREZ	HERMOSILLO			212 08 46		ferreteriaabascal@hotmail.com		f		795
796	COM890608EE8	CLIENTE PARA REALIZAR PRUEBAS DE IMPRESION DE FORMATOS	2	ESTA DIRECCION ES UNA DIRECCION CONOCIDA	LA POBLACION ES HERM			1234567890 1234567890 123		SOPORTE@COMPUPROVEEDORES.COM		f		796
792	SAA-920429-7U9	SERVICIOS DE APOYO ADMINISTRATIVO SA DE CV	2	CAMPOS ELISEOS #400 OFICINA 1102	DF	SONORA	(662) 109 21 30	(662) 109 21 30		recepcion.facturacionelectronica@gmexico.com	SOFIA BELTRAN	f		792
797	IMI030514PG5	INSTITUTO MUNICIPAL DE INVESTIGACION Y PLANEACION DE ENSENADA B.C.	1	CALLE TERCERA NO. 1323-16	ENSENADA	BAJA CALIFORNIA		646 152 19 09		mgonzalez@imipens.org		f		797
87	GES790913CT0	GOBIERNO DEL ESTADO DE SONORA	2	COMONFORT Y DR. PALIZA	HERMOSILLO	SONORA	(662) 1084000	(662) 1084000	(662) 1084050	requisiciones.recaudacion@gmail.com	CARLOS PEREYRA	f	NINGUNA	87
800	QUMJ7309018Q8	JESUS ALEJANDRO QUIJADA MONTAÑO	2	AVE. MANUEL M. DIEGUEZ NO. 340	HERMOSILLO	SONORA	(662) 2148964	(662) 2148964	(662) 2148964	soporte@compuproveedores.com	MARIZA MONGE	f	NINGUNA	800
799	GEB4603194H7	GOBIERNO DEL ESTADO DE BAJA CALIFORNIA	1	CALZADA INDEPENDENCIA No. 994, Col. CENTRO CIVICO, MEXICALI	TIJUANA	BAJA CALIFORNIA	(646) 172 30 87	(646) 172 30 87			ERNESTO	f		799
802	ACR030303I87	AUTOMECANICA EL CARBURADOR REFACCIONARIA SA DE CV	2	FRANCISCO MONTEVERDE #274, BALDERRAMA, CP. 83180	HERMOSILLO	SONORA	(662) 2562936	(662) 2104166	(662) 2104166	elcarburador@prodigy.net.mx	JOSE PEÑA	f	NINGUNA	802
801	RALG600113UU4	GUMERCINDO RASCON LOPEZ	2	ENRIQUE QUIJADA #319	HERMOSILLO	SONORA	(662) 215 75 19	(662) 215 75 19	(662) 215 75 19	gm@gummermetal.com	FLOR RASCON	f	NINGUNA	801
812	GAMM8309299A1	MIGUEL GALINDO MARTINE	2	CALIFORNIA 473-3	CIUDAD OBREGON	SONORA		6444135990		galmatech@gmail.com		f		812
814	CAMR490820IQ6	ROSA CRISTINA CABRERA MICHEL	2	AVENIDA OVALO 87 	HERMOSILLO	SONORA		(662)2152315		papelerialma@hotmail.com		f		814
803	FUDM671022N85	MARIO ALBERTO FUENTES DURTE	2	AVE DE LAS VERBENAS No 64, COL. LA VERBENA. CP: 83288, 	HERMOSILLO	SONORA	(662)8483354	(662)2203455	(662)2203455	MARIOFUENTES67@HOTMAIL.COM	MARIO FUENTES	f	NO APLICA	803
804	MOSTRADOR	RAFAELA TOSTADO	2	OVALO CUAHTEMOC SUR. 	HERMOSILLO 	SONORA	(662)2154465	(662)2154465	(662)2154465	RAFATOSTADO@YAHOO.COM.MX	RAFAELA TOSTADO	f	NO APLICA	804
805	FAO740715MZA	Francisco Antonio Orozco s.a. de c.v.	4	Convencion 1914 Norte 129	Aguascalientes	Aguascalientes		4499147076		faosa_ravelo@hotmail.com		f		805
806		CARLOS LOPEZ GAMEZ	2	AVE. DE ANZA 404 PITIC.	HERMOSILLO	SONORA	(662)1902681	(662)2851247	(662)2851247	carloslopezgamez@hotmail.com	CARLOS LOPEZ	f	NO TIENE	806
453	CEE101119I33	CREADORES DE ESPACIOS EXCEPCIONALES MOBER, S.A DE C.V.	2	REFORMA 219, COLONIA PRADOS DEL CENTENARIO.	HERMOSILLO	SONORA	(662)1343970	(662) 2172884	(662) 2172884	GERENCIACOMERCIAL@MOBER.COM.MX	JOSE RAMON BORBON	f	No Aplica	453
808	CEG1110279P9	C3 EG S.A. de C.V.	4	Carretera Panamericana Km 8.5 108-B	Aguascalientes	Aguascalientes		4491747832		adan.maldonado@c3eg.com		f		808
811		ARNOLDO ARVAYO	2	VILLA JUAREZ 177 COL. VILLA SONORA	HERMOSILLO	SONORA	(662)3535382	(662)2840375	(662)2840375	arnoldoarvayo@gmail.com	ARNOLDO ARVAYO	f	NO TIENE	811
810	RURK730629G61	KARINA CECILIA RUBIO REYNA	2	AVENIDA PODER LEGISLATIVO 58	HERMOSILLO	SONORA		*		contacto@thewoofclub.com.mx		f		810
265	TEE041007RI9	TRIBUNAL ESTATAL ELECTORAL	2	BLVD. LUIS ENCINAS JOHNSON 528 ESQ. FCO MONTEVERDE COL. VALLE HERMOSO	HERMOSILLO	SONORA	6623225297	(662)2135139	(662)2135139	molinares@teesonora.org.mx	FRANCISCO MOLINARES	f	127	265
818	DDN091028GL0	COMPUYA	2	MORELIA #81 LOCAL P-10	HERMOSILLO	SONORA	6621044997	(662) 2795211	(662) 2795211	cleofelix@compuproveedores.com	CLEO FELIX	f	202	818
129	IMA0307176G0	INTERDISCIPLINARIO DE MEDIO AMBIENTE Y ECOLOGIA, SC	2	ESTRELLA CEFEIDA	HERMOSILLO	SONORA	(045)5532235881	(55) 5 677 1063	(045)5532235881		RENE DEL CASTILLO	f	NINGUNA	129
815	TSO131007GW3	TETRIX SOLUTIONS SA DE CV	2	SERIS NO. 9, COL. PARQUE INDUSTRIAL, CP. 83299	HERMOSILLO	SONORA	(662)1700688	(662)2000639	(662)2000639	AQUINA@OUTLOOK.COM	JOHN AQUINA	f	NO APLICA	815
817	FOAL880627GD1	LAURA FLORES ALATORRE	2	CONSTITUCION #813	TIJUANA	BAJA CALIFORNIA		6641881431		CODEVTJ@GMAIL.COM		f		817
816	SSP980701MUO	SIERRA SERVICIOS DE PERFORACION S.A. DE C.V.	2	Av. Hércules No. 401 bodega 16, Polígono III	HERMOSILLO	SONORA	(662) 3 53 58 13	(662) 216 07 15	(662) 216 07 15	patriciao@sierrasp.com.mx	PATRICIA OROSCO	f	NINGUNA	816
813	LELC700306GM1	PC PLUS	2	AVENIDA JUAREZ PORVENIR No. 1590, Col. SATELITE, CP: 32543.	CIUDAD JUAREZ	SONORA	(656) 175-1121	(656) 679-6159	(656) 687-0554 	contacto@pc-plus.com.mx	VIVIANA MANCHA	f	No Aplica	813
798	CES790211HK4	COMISION ESTATAL DE SERVICIOS PUBLICOS DE TIJUANA	1	BLVD. FEDERICO BENITEZ No. 4057, Col. 20 DE NOVIEMBRE	TIJUANA	BAJA CALIFORNIA	(664) 1047700	(664) 1047700		rebeca@cespt.gob.mx	REBECA GIL	f	1165	798
4	DDN091028GL0	DN DIFUSA NORTE, S.A DE C.V.	2	MORELIA	HERMOSILLO	SONORA	(662)  2113346	(662)  2113346	(662)  2113346	marionoriega@hpstorehermosillo.com	MARIO NORIEGA	f	(662)  2113346	4
304	CFE370814QI0	34 COMISION FEDERAL DE ELECTRICIDAD	2	JUAREZ Y SAN LUIS POTOSI.	HERMOSILLO	SONORA	(662)1945496	(662)2591100	(662)1945496	LUIS.VALENZUELA@CFE.GOB.MX	LUIS VALENZUELA	f	11212	304
809	GES790913CT0	SAGARPARHPA	2	AVENIDA DE LA CULTURA SIN NUMERO, COLONIA VILLA DE SERIS.	HERMOSILLO	SONORA	(662)1118529	(662)2172650	(662)2172650	syci-sagarparhpa@prodigy.net.mx	ARIEL RAMOS FOX 	f	167	809
757	USO530922NH6	UNIVERSIDAD DE SONORA	2	BLVD LUIS ENCINAS S/N	HERMOSILLO	SONORA	(662) 8484234	(662) 2592124			ROSARIO-IMPRENTA	f	NINGUNA	757
820	SCA130325SR2	SEPRO DE CAJEME, S.A DE C.V	2	CARRETERA A LA COLORADA KM. 4.5	HERMOSILLO	SONORA		251-0972		esmeralda.garcia@ricer.com.mx		f		820
821		JUAN LUIS VELDERRAIN ENRIQUEZ	2	SAGUARIPA ESQUINA PASEO DE LA PAZ NO. 135A COL VALLE GRANDE	HERMOSILLO	SONORA	(662)2903163	(662)2136619	(662)2136619	velderrainjl@yahoo.com.mx	JUAN LUIS	f	NO TIENE	821
822	ROAE520124Q79	Maria Elvira Rojas Avalos	4	Av. Aguascalientes 1206-B 	Aguascalientes	Aguascalientes		996-1412		lapurisima@acuarioimprenta.mx		f		822
839		VICTOR MANUEL VEGA	2	MATAPE 166-A COL. LOMAS DE LINDA VISTA	HERMOSILLO	SONORA	(662)1899293	(662)2116810	(662)2116810	vitorv_f50@hotmail.com	VICTOR VEGA	f	NO TIENE	839
823		VICTOR MERANCIO	2	LACY 3A COL. MARIACHI	HERMOSILLO	SONORA	(662)8483828	(662)8483828	(662)8483828	SOPORTE@COMPUPROVEEDORES.COM	VICTOR MERANCIO 	f	NO TIENE	823
824		JUAN QUINTANILLA	2	CORTIJANA 9 COL. LA RIOJA	HERMOSILLO	SONORA	(662)2762861	(662)2591253	(662)2591253	juanequintanilla@hotmail.com	JUAN QUINTANILLA	f	NO TIENE	824
825	IEM6212039T6	INSTITUTO EDUCATIVO DEL MAYO, A.C.	2	CARRETERA A YAVAROS KM.1	HUATABAMPO	SONORA		6474260525		colegio_sonora@yahoo.com.mx		f		825
827		MARIA GUADALUPERA LARA CAZARES	2	JAZMIN DE LA MONTAÑA 32 LOMAS PITIC	HERMOSILLO	SONORA	(662)3365582	(662)3365582	(662)3012419	glaracaz@hotmail.com	MARIA GPE.	f	NO TIENE	827
852	MOST	LILIANA MARIA NAVARRO VALENCIA	2	SAN DOROTEO #27 FRACC. LAS PLACITAS	HERMOSILLO	SONORA	(662)3437767	(662)3437767	(662)3437767	navarrovalencialm@gmail.com	LILIANA NAVARRO	f	NO TIENE	852
829	SGP0107035I8	SEACON GLOBAL PRODUCTION S DE RL DE CV	1	CALLEJON TERRAZOS #8 Int: 2C, Col. LAS BRISAS 1ra. SECC, CP: 22610	TIJUANA	BAJA CALIFORNIA	664 626 2726	(664) 626 2726		ltorres@seaconglobal.com	LETICIA TORRES	f	110	829
826	RATF780103M7A	FERNANDO JUVENTINO RAMIREZ TORRES	2	PERIFERICO PTE 281	HERMOSILLO	SONORA	.	(662)2181845		mipchermosillo@hotmail.com	.	f		826
840	PPT1410072F5	PC PLUS TODO MEXICO	2	JUAREZ PORVENIR No. 1590	JUAREZ	CHIHUAHUA		656 679 6159		carlos_leon@pc-plus.com.mx		f		840
831		ANDRES MALDONADO	2	ANGEL ARREOLA 8 COL. SAN ISIDRO	HERMOSILLO	SONORA	(662)1390135	(662)1390135	(662)1390135	jesus_andres99@hotmail.com	ANDRES MALDONADO	f	NO TIENE	831
832	OFF0810192I4	OFFIZONE SA DE CV	2	GALEANA 114B	HERMOSILLO	SONORA		01(662)213 91 90		offizone_ventas@live.com.mx		f		832
834	IDD110201FI5	INSTITUTO PARA EL DESARROLLO DE LA SOCIEDAD DEL CONOCIMIENTO DEL ESTADO DE AGUASCALIENTES	4	AVENIDA SAN MIGUEL SIN NUMERO 	AGUASCALIENTES	AGUASCALIENTES		9780338		armandoandradez@hotmail.com		f		834
835	DEP120820EW1	DISEÑO Y EQUIPAMIENTOS PROFESIONALES EN INOXIDABLE SA DE CV	4	ROBERTO DIAZ RODRIGUEZ 129	AGUASCALIENTES	AGUASCALIENTES		9965950		evar67@yahoo.com.mx		f		835
836	CTJ860423AH0	CONDUCTORES TECNOLOGICOS DE JUAREZ SA DE CV	1	AV PARQUE INDUSTRIAL AZTECAS 1550	JUAREZ	CHIHUAHUA		668-816-01-11		alejandra.gonzalez@sewsus.com.mx		f		836
837		JORGE GARCIA RUIZ	2	UNIDAD ABITACIONAL BACHOCO	HERMOSILLO	SONORA	(662)1574630	(662)1574630	(662)1574630	SOPORTE@COMPUPROVEEDORES.COM	JORGE GARCIA	f	NO TIENE	837
838	TMM020430FD1	TOYOTA MOTOR MANUFACTURING DE BAJA CALIFORNIA S DE RL DE CV	1	CARRETERA TIJUANA-TECATE No. 33143, Col. CARR. TIJUANA-TECATE, CP:	TIJUANA	BAJA CALIFORNIA	(664) 969 28 00	(664) 969 28 00		yesenia.acevedo@tema.toyota.com	YESSENIA ACEVEDO	f	1303	838
830		SANDY SALAZAR	2	VIA GARIBALDI 97 PRIVADA VENETO COL.PALERMO	HERMOSILLO	SONORA	(662)1410930	(662)1410930	(662)1410930	SANDY_SALAZAR@HOTMAIL.COM	SANDY SALAZAR	f	NO APLICA	830
841	LOGC800120IF4	CARLOS ALEJANDRO LOAIZA GARCIA	2	CALLLE SANCHO PANZA #75	TIJUANA	BAJA CALIFORNIA		6642600689		alex_loaiza@outlook.com		f		841
842		BETZAIDA VARELA PALMA	2	REPUBLICA DE GUATEMALA #574 COL. MACHI LOPEZ	HERMOSILLO	SONORA	(662)1241719	(662)1241719	(662)2024297	betzaidavp@hotmail.com	BETZAIDA	f	NO TIENE	842
843		RUBI OVIEDO	2	OBLATOS 14 EL CAMPANARIO	HERMOSILLO	SONORA	(22)99011688	(22)99011688	(662)1706783	rubioviedo@hotmail.com	RUBI	f	NO TIENE	843
844		JESUS ANTONIO DELGADILLO SANCHEZ	2	VICTOR MARTINEZ MONTAÑO 83 ALTARES	HERMOSILLO	SONORA	(662)1836636	(662)1836636	(662)1836636	SOPORTE@COMPUPROVEEDORES.COM	JESUS DELGADILLO	f	NO TIENE	844
845	TOUG600907R91	GASTON TORRESCANO URRUTIA	2	MANUEL GONZALEZ 67 NORTE	HERMOSILLO	SONORA	(662) 1 190910	(662) 2890421	(662) 2890421	GTORRESCANO@CIAD.MX	GASTON TORRESCANO URRUTIA	f	NINGUNA	845
846	PATS641103QB6	SALVADOR PADILLA TIZNADO	2	EJE ROSALES 370	HERMOSILLO	SONORA		6622157815		waterdepot01@hotmail.com		f		846
847		MAURICIO DE LOS REYES	2	FARAYON 55 COL. CASA BONITA	HERMOSILLO	SONORA	(662)2310594	(662)2310594	(662)2310594	SOPORTE@COMPUPROVEEDORES.COM	MAURICIO	f	NO TIENE	847
848	MOST	RAMON HUMBERTO MARTINEZ 	2	SAN LUIS POTOSI 21, COLONIA CENTRO, CP: 83000	HERMOSILLO	SONORA	(662) 229 2184	(662) 229 2184	(662) 229 2184	ramonmartinez@compuproveedores.com	RAMON HUMBERTO MARTINEZ 	f	2108	848
849	MOST	BENITO HERNANDEZ HERNANDEZ 	2	SAN LUIS POTOSI 21, COLONIA CENTRO, CP: 83000	HERMOSILLO	SONORA	(662) 229 2971	(662) 229 2971	(662) 229 2971	soporte@compuproveedores.com	BENITO HERNANDEZ HERNANDEZ 	f	2111	849
850		MARIA ELENA NAVARRO PACHECO	2	ALVERTO GUTIERREZ 216 BALDERRAMA	HERMOSILLO	SONORA	(662)3437767	(662)3437767	(662)3437767	SOPORTE@COMPUPROVEEDORES.COM	LILIANA NAVARRO	f	NO TIENE	850
851	IVS110301RL3	INSTITUTO DE VIVIENDA SOCIAL Y ORDENAMIENTO DE LA PROPIEDAD DEL ESTADO AGUASCALIENTES	4	AVENIDA DE LA CONVENCION ORIENTE 104 	AGUASCALIENTES	AGUASCALIENTES		449-910-2560		luis.morales@aguascalientes.gob.mx		f		851
833		IRENE VALDEZ RUIZ	2	SIRIO ELEGANTE 19 COL. NUEVO HERMOSILLO	HERMOSILLO	SONORA	(662)3369126	(662)2670144	(662)2670144	irene-valdez@hotmail.com	IRENE VALDEZ	f	NO TIENE	833
853		ALEJANDRO LOPEZ MIRANDA	2	GARMENDIA NO. 63 ENTRE COLOSIO Y DR. NORIEGA COL. CENTRO	HERMOSILLO	SONORA	6621918382	(01)6621918382		alejandrolomi@hotmail.com	ALEJANDRO LOPEZ MIRANDA	f		853
854		GILBERTO SANTIAGO MORENO URTADO	2	DR. PALIZA 184 COL. LAS GRANJAS	HERMOSILLO	SONORA	(662)9481557	(662)9481557	(662)2133262	santiago4288@gmail.com	santiago	f	NO TIENE	854
855	UAA740224TQ2	UNIVERSIDAD AUTONOMA DE AGUASCALIENTES	4	AV. UNIVERSIDAD #940 EDF 26	AGUASCALIENTES	AGUASCALIENTES		9107484		carevalomx@gmail.com		f		855
819		BERNARDO RIOS	2	QUINTA ELISA 7 COL. LAS QUINTAS	HERMOSILLO	SONORA	(662)1540659	(662)1540659	(662)1540659	masinbule@gmail.com	BERNARDO RIOS	f	NO TIENE	819
856	MEPM770921SW9	MARCO ANTONIO MELENDEZ PIÑON	2	CALLE 21 NUMERO 50	NEZAHUALCOYOTL	DE MEXICO		5558569130		marcoantonio.melendez@power-pc.com.mx		f		856
857	BCO981214SH8	BOSE CORPORATION SA DE CV	1	CHILPANCINGO 52	TIJUANA	BAJA CALIFORNIA		6649794000 		fernandocortez@compuproveedores.com		f		857
871		KAROL CUEN MARTINEZ	2	ROMANO 48 COL. PUERTA REAL	Hermosillo	SONORA	(662)3432395	(662)3432395	(662)3432395	krolcuen@gmail.com	KAROL CUEN	f	NO TIENE	871
872	PAGC371208P53	CONCEPCIÓN PACHECO GARCÍA	2	GUADALUPE VICTORIA 74	HERMOSILLO	SONORA		(662)2147247 / 2 15-77-72		facturas@proveedoradelasartesgraficas.com		f		872
858		CARLOS MENDEZ	2	JUAREZ 105 COL. CENTRO	HERMOSILLO	SONORA	(662)1136119	(662)1136119	(662)2120021	carlosmendezp@hotmail.com	CARLOS MENDEZ	f	NO TIENE	858
859		PATRICIA HINOJOSA	2	JUSTO SIERRA 8 COL. MODELO	HERMOSILLO	SONORA	(662)3159868	(662)3159868	(662)3159868	SOPORTE@COMPUPROVEEDORES.COM	PATRICIA	f	NO TIENE	859
873	UTH981009NE1	UNIVERSIDAD TECNOLOGICA DE HERMOSILLO 	2	BLVD. DE LOS SERIS 	HERMOSILLO 	SONORA		662 251 1101		correofiscal@uthermosillo.edu.mx		f		873
861	CUPJ740405NU2	JORGE ANDRES CUEVAS PONCE	2	MINA #105 PTE.	NAVOJOA	SONORA		(642) 422-7022		coquicuevas@hotmail.com		f		861
862		Plastimarmol, S.A de C.V	2	Carretera Hermosillo-Nogales Kilómetro 6.5	HERMOSILLO	SONORA	(662) 1485178	(662) 280 0254	(662) 280 0254	luis.garibay@plastimarmol.com	LUIS GARIBAY	f	NINGUNA	862
868	GEB4603194H7	PODER JUDICIAL DEL ESTADO DE BAJA CALIFORNIA 	1	CALZADA INDEPENDENCIA No. 994, Col. CENTRO CIVICO, MEXICALI	TIJUANA	BAJA CALIFORNIA	(664) 608 62 00	(664) 608 62 00		enrique.ortiz@pjbc.gob.mx	Ing. Enrique Ortiz 	f	2508	868
863	MOST	JESUS ORDUÑO	2	HORIZONTE AZUL  #23, COLONIA ENCANTO. 	HERMOSILLO	SONORA	(662)9487467	(662)9487467	(662)9487467	jesus.orduno@conagua.gob.mx	Jesus Orduño	f	no aplica	863
774	ESB860603PW7	ESCUELA SECUNDARIA BICULTURAL THOMAS ALVA EDISON, A.C	2	BOULEVARD JUAN NAVARRETE 534, COLONIA NAZAREO RESIDENCIAL , CP: 83224	HERMOSILLO	SONORA	(662) 2 16 91 40	(662) 2 16 91 40	(662) 2 18 33 92	bvaldez@taes.her.itesm.mx	BEATRIZ	f	112	774
864	CTC0301164U2	COMPLEJO TRES CENTURIAS	4	28 DE AGOSTO S/N	AGUASCALIENTES	AGUASCALIENTES		9162216		fernando.paredes@aguascalientes.gob.mx		f		864
865		ALEJANDRO RIVAS	2	CARLOS BALDERRAMA 535 COL. DUNAS	HERMOSILLO	SONORA	(662)2955272	(662)2955272	(662)2208225	buho_56@hotmail.com	ALENADRO RIVAS	f	NO TIENE	865
866	OME021010563	OBARA MEXICO S DE RL DE CV	4	ROBERTO DIAZ RODRIGUEZ 212	AGUASCALIENTES	AGUASCALIENTES		9711524		arturo.correa@obara.com.mx		f		866
511	PES8903173C9	PROVEEDOR ELECTRICO Y DE SERVICIOS S.A DE C.V.	2	ARTURO S.HARO	HERMOSILLO	SONORA	(662) 216 67 19	(662) 216 67 19	(662) 216 67 19	pessa_compras@live.com.mx	LUZ DELIA RIVERA	f	NO TIENE	511
577	IAE841227V49	INSTITUTO DE ACUACULTURA DEL ESTADO DE SONORA O P D	2	COMONFORT	HERMOSILLO	SONORA	(662)2004384	(662)2004384	(662)2004384	belinda.platt@sonora.gob.mx	BELINDA PLATT	f	NO TIENE	577
867		BEATRIZ CADENA GARCIA	2	SAN LUIS POTOSI #10 COL. CENTRO	HERMOSILLO	SONORA	(662)1007579	(662)1007579	(662)1007579	SOPORTE@COMPUPROVEEDORES.COM	BEATRIZ	f	NO TIENE	867
209	QFI120320TP8	QAR FINANCIAL SAPI DE CV  SOFOM ENR	2	CALZADA DE LOS ANGELES	HERMOSILLO	SONORA	(662) 19009444	(662) 210 6001	(662) 19009444	manuel.llerenas@grupoqar.com	MANUEL	f	4021	209
869	RAVU701111PI8	Ubaldo Hiram Ramirez Villegas	2	San Blas 6	Tijuana	Baja California		664 5050 676		plataformascomerciales@gmail.com		f		869
870	MIJJ9011266GA	JULIAN MIGUEL JUAREZ	2	CALLE OLIVO #19013	TIJUANA	BAJA CALIFORNIA		664 627-0913		julian.miguel@outlook.com		f		870
874		HUGO MARQUEZ LEON	2	LEO SANDOVAL 112 COL CORTIJO PIONEROS	HERMOSILLO	SONORA	(662)1836013	(662)1836013	(662)1836013	SOPORTE@COMPUPROVEEDORES.COM	HUGO MARQUEZ	f	NO TIENE	874
875		JOSE ANDRES FLORES	2	LAURELES 4 ENTREL OLIVARES CIPRESES COL. FUENTES DEL MEZQUITAL	HERMOSILLO	SONORA	(662)1206005	(662)1206005	(662)2133661	jafl46@hotmail.com	JOSE ANDRES FLORES	f	NO TIENE	875
876	ASE001115EN2	ACUICOLA SELECTA	2	PEDRO VILLEGAS #12	HERMOSILLO 	SONORA		662 2137058		carlos.okamura@selecta.com.mx		f		876
712	ASE001115EN2	ACUICOLA SELECTA SA DE CV	2	PEDRO VILLEGA	HERMOSILLO	SONORA	662 2173002	(662) 213 70 58  662 59/173002	(662)60	facturacion.selectalabor@selecta.com.mx	CARLOS OKAMURA	f	60	712
877	IME6109213M3	INSTITUTO MEXICANO DE EJECUTIVOS DE FINANZAS AC	2	PATRICIO SANZ No. 1516	DEL. BENITO JUAREZ	DISTRITO FEDERAL		55 9151 5100		jorgegonzalez@compuproveedores.com		f		877
878	ONO120706BE5	OC DEL NOROESTE SA DE CV	3	ALTURAS DEL SUR 5250	CULIACAN 	SINALOA		(667)2609822		ocdelnoroeste2013@hotmail.com		f		878
879		SOCORRO NOPERI 	2	SAN PEDRO 364 ENTREO MONTEVERDE Y 12 OCTUBRE COL. LOMAS DE MADRID	HERMOSILLO	SONORA	(662)1867899	(662)1867899	(662)1867899	SOPORTE@COMPUPROVEEDORES.COM	SOCORRO	f	NO TIENE	879
880		IVON NOPERI	2	TUMACACORI 34 COL. PUEBLITOS	HERMOSILLO	SONORA	(662)1386392	(662)1386392	(662)1386392	SOPORTE@COMPUPROVEEDORES.COM	IVON	f	NO TIENE	880
881	MOMP480405UH5	PATRICIA EUGENIA MORLET MARTINEZ	2	SAN MIGUEL 66 A	HERMOSILLO	SONORA		***		productoscapitannemo@yahoo.com.mx		f		881
882	MEM950621UV5	MULTISERVICIOS ESPECIALIZADOS MORITA SA DE CV	4	JUAN CARLOS #119	AGUASCALIENTES	AGUASCALIENTES		9710080		alejandrofaz@morita.com.mx		f		882
884	CMN130516HI0	CORP MAX DEL NOROESTE SA DE CV 	2	IGNACIO ZARAGOZA SUR 1000 #110	MONTERREY 	NUEVO LEON 		662 2805070		sistemashmo1@legaxxi.com		f		884
885	NOT140401457	911 TELECOM S DE RL DE CV	2	BLVD. DIAZ ORDAZ #12415	TIJUANA	BAJA CALIFORNIA		3806119		CONTACTO@911TELECOM.MX		f		885
886	CAL790123KP1	CIENCIAS ARTES Y LETRAS DE MEXICO PARA LA EDUCACION CONTEMPORANEA AC	1	RAMPA YUMALINDA # 4850	TIJUANA	BAJA CALIFORNIA		621-3550 EXT. 228 Y 108 		avalenzuela@correo.xochicalco.edu.mx		f		886
887	ATI031028ND8	AGRICOLA LOS TITANES SA DE CV 	2	BLVD. JESUS GARCIA MORALES SN 	HERMOSILLO	SONORA		662 1094000		eacosta@superllantas.com.mx		f		887
888	ITE430714KI0	INSTITUTO TECNOLOGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY 	2	DEL PUENTE # 222	TLALPAN 	MEXICO 		01555 4831743		vgriselda@itesm.mx		f		888
142	OTS880129952	OPERADORA TURISTICA DEL SUR SA DE CV	2	BLVD. MAURICIO CASTRO	SAN JOSE DEL CABO	SONORA	(624) 105 84 50	(624) 105 84 50	(624) 105 84 50	soporte@budgetpacifico.com	LEONARDO DANIEL CASTRO  VERGUDO	f	62*167670*6	142
890	ITE430714KI0	NSTITUTO TECNOLOGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY 	2	VIA ATLIXCAYOTL #2301	MONTERREY 	NUEVO LEON 		01222 3032000		compras.csa@itesm.mx		f		890
892	HCE9402206F4	H. CONGRESO DEL ESTADO DE AGUASCALIENTES	4	PLAZA PATRIA OTE 109	AGUASCALIENTES	AGUASCALIENTES		9103210		hcongresoags@congresoags.gob.mx		f		892
913	XAXX010101000	MARGARITA GALLARDO ALVARADO	2	SAN PASCUAL No. 37	HERMOSILLO	SONORA	(662)2050936	(662)2050936	(662)2050936	cesfrajos@hotmail.com	margarita gallardo	f	(662)2050936	913
891	MPM040701P1A	MOTORCAR PARTS DE MEXICO, S.A DE C.V.	1	AVE. LAGUNA MAINAR No. 4951, Col. EL LAGO, CP: 22210	TIJUANA	BAJA CALIFORNIA	(664) 903 19 00 	(664) 903 19 00 		agarcia@motorcarparts.com	Arturo García	f	Ext. 1772	891
893	FAE970220LM0	FIMBRES  ARRENDAMIENTO Y EQUIPOS S.A. DE C.V.	2	OVIACHIC 38 COLONIA IRRIGACION 	HERMOSILLO	SONORA	(662)1930279	(662)2121046	(662)1930279	FIMBRESARRENDAMIENTO@PRODIGY.NET.MX	ING FRANCISCO JAVIER FIMBRES	f		893
894	ISS890219SP8	INSTITUTO DE SEGURIDAD Y SERVICIOS SOCIALES PARA LOS SERVIDORES PUBLICOS DEL ESTADO DE AGUASCALIENTES	4	HERMENEGILDO GALEANA SUR 119	AGUASCALIENTES	AGUASCALIENTES		449-910-2081		alejandro.ibarra@aguascalientes.gob.mx		f		894
895	PPS120308V78	PSM PAYMENT SERVICES MEXICO SA DE CV	2	Paseo de los Jardines No. 47	Hermosillo	Sonora		6623100814		s.apodacac@gmail.com		f		895
896	SMS101217QK8	SOMIN COMPAÑIA MINERA DE SONORA S A P I DE CV	2	NAYARIT 231 C COUNTRY CLUB	HERMOSILLO	SONORA	(662).200.2536	(662).200.2536	(662) 2100431  	pggurrola@somin.com.mx	GABRIELA GURROLA	f	NO TIENE	896
897	MSM1303016C5	MOLITEC STEEL MEXICO SA DE CV	4	CIRCUITO PROGRESO 118	AGUASCALIENTES	AGUASCALIENTES		449-922-7840		shinya.nakao@molitec.mx		f		897
898	MOF130313919	MAS PARA OFICINAS SA DE CV	2	CAMPECHE 80	HERMOSILLO	SONORA		(662) 215 0909		ventas2@oficinasymas.com.mx		f		898
899	MOGM760920JH6	Mario Enrique Mora Garcia	2	Blvd. salinas # 11050 3D	Tijuana	B.C. Nte		9-73-07-57  2-55-52-88		winpcs@gmail.com		f		899
900	JWM980723U1A	JELD WEN DE MEXICO SA DE CV	1	PRIVD COLINAS 11552	TIJUANA	BAJA CALIFORNIA		6646450350		yaell@jeld-wen.com		f		900
901		MARIA EDNA CLARK GOMEZ	2	AVENIDA CALAHORDA 5A COL URBIVILLA DEL PRADO	HERMOSILLO	SONORA	(662)1763094	(662)1763094			MARIA EDNA CLARK GOMEZ	f		901
860		ALEJANDRA ARMENTA	2	ACAPULCO SUR 4 LA CARIDAD	HERMOSILLO	SONORA	(662)6623537764	(662)6623537764		ALE_ARMENTA15@HOTMAIL.COM	ALEJANDRA ARMENTA	f		860
828	HME891211JD9	HYUNDAI DE MEXICO S.A DE C.V	1	LA ENCANTADA No. 7474, Col. PARQUE INDUSTRIAL EL FLORIDO, CP: 22244	TIJUANA	BAJA CALIFORNIA	(664( 645 01 30 	(664) 645 01 30 		ryank@translead.com	RYAN KANG	f	3517	828
902	GGE050811UM9	MEXICO GENERADORA DE ENERGIA S DE RL	2	CAMPOS ELISEOS # 400 OFNA 1102	DISTRITO FEDERAL	MEXICO		01800 062 1331		mesadeservicio@csc.gmexico.com		f		902
904	CDC130624LN8	CROSBY DCN S.C.	2	Reforma 228A	Hermosillo	Sonora		662212 02 46		crosby@dcn.mx		f		904
907	IMM981028ADA	INSTITUTO DE MEDIACION DE MEXICO SC	2	GUADALUPE VICTORIA 39 TERCER PISO	HERMOSILLO	SONORA	****	(662)2105990			sanchezestela@hotmail.com	f		907
903	MEMJ81062748A	JORGE LUIS MEREL MORENO	2	ALCATRACES 28	HERMOSILLO	SONORA		662 1188133		jorge_m27@hotmail.com		f		903
916	ITE430714KI0	INSTITUTO TECNOLOGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY (TEC)	2	EUGENIO GARZA SADA # 2501 SUR	MONTERREY 	NUEVO LEON 		0181 83582000		compras.csa@itesm.mx		f		916
905	LAR900731TL0	LABORATORIO ALFONSO RAMOS S.A DE C.V	2	SINALOA SUR 144 CENTRO GUERRERO E HIDALGO CAJEME SONORA 	OBREGON	SONORA	(662) 2 13 68 66	(662) 2 13 68 66	(644) 4 15 16 92	luisarebecac@gmail.com	DRA. VICTORIA	f	NINGUNA	905
906	CIN750913FP7	CONSTRUCTORA INMOBILIARIA DEL NOROESTE S.A. DE C.V.	2	MIGUEL ALEMAN #655 SUR INT. L-4	OBREGON 	SONORA		01 644 415 29 30		cinsa_01@hotmail.com		f		906
908	CEF000412NT5	CENTRO DE ENSEÑANZA FCO I MADERO AC	4	ALLENDE 103-1	AGUASCALIENTES	AGUASCALIENTES		449-916-8242		luis_chiu72@hotmail.com		f		908
909	PET980216D7A	PETREMEX SA DE CV	1	ANDADOR VECINAL 21837	TIJUANA	BAJA CALIFORNIA		6646450200		PETREMEX@PRODIGY.NET.MX		f		909
917	IES000307NA0	INSTITUTO ESTATAL DE SEGURIDAD PUBLICA	4	AVENIDA LOS CONOS S/N	AGUASCALIENTES	AGUASCALIENTES		449-970-0059		iespa@aguascalientes.gob.mx		f		917
910	MAT080610NX0	SOCIEDAD MEDICA ANGELES DE TIJUANA AC	1	AV. Paseo de los Héroes #10999	Tijuana	Baja California		(664)6351800 ext 5401		magui_alvarez@yahoo.com.mx		f		910
911	most	eva soria	2	SAN LUIS POTPSI #21	HERMOSILLO	SONORA	6622 29 12 71	(662)2142200	(662)2142200	evangelinasoria@compuproveedores.com	EVA	f	220	911
912	ITE430714KI0	INSTITUTO  TECNOLÓGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY	4	CARLOS LAZO 100	MEXICO D.F.	DISTRITO FEDERAL		5591778000		compras.csa@itesm.mx		f		912
924	DIN121011S30	DINAPROT SA DE CV	4	REP DE PERU # 706	Aguascalientes	Aguascalientes		4491407538		facturacion.dinaprot@hotmail.com		f		924
922	TOME790325EV3	ESMERALDA TORRES MOTA	2	AVE. 14 NO. 509	GUAYMAS	SONORA		622-2219405		susecom@yahoo.com.mx		f		922
918	POLM471227110	MANUEL PORTILLO LIZARRAGA	2	AVE. ROBERTO ROMERO # 361	HERMOSILLO	SONORA		662 2167296		manuel@hotmail.com		f		918
919	ITE430714KI0	INSTITUTO TECNOLOGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY (ITE)	2	BLVD. FELIPE ANGELES # 2003	PACHUCA DE SOTO 	HIDALGO 		0181 8850-8500 		compras.csa@itesm.mx		f		919
920	PFN910106K67	PATRONATO DE LA FERIA NACIONAL DE SAN MARCOS	4	PASEO DE LA FERIA 103	AGUASCALIENTES	AGUASCALIENTES		449-915-8620		juanpablogarcia0608@gmail.com		f		920
921	DSM040311TL8	Draci Sports de Mexico S de Rl de CV	1	Blvd. Insurgentes No. 16902	Tijuana	Baja California		(664) 1917389		juanluist@uesports.com		f		921
923	DES141106KG3	DESARROLLOS ESLABON SYSTEMS S.A.P.I. de C.V	2	Calle la Luna 2695	Guadalajara 	Jalisco		4000 0102		marias@eslabon.com.mx		f		923
925	FEVG961104DW0	VICTOR RENE FELIX GASTELUM	2	CR. LANZ # 500 A	MAGDALENA	SONORA		662 3621262		proliman@hotmail.com		f		925
926	CCO970602I36	CRISOL CONSTRUCTORA SA DE CV	1	BLVD LAZARO CARDENAS Y VIA RAPIDA PONIENTE	TIJUANA	BC		6646868990		CRISOLCONTRUCTORA@HOTMAIL.COM		f		926
927	ASM040209PS8	ASAHI SHO-KO-SHA MEXICO SA DE CV	4	AVENIDA AGUASCALIENTES SUR 2623 MANZANA 22 LOTE 9	AGUASCALIENTES	AGUASCALIENTES		449-978-1103		abigail.flores@asahimex.com.mx		f		927
928	MOST	MERCEDES DE LOS REYES	2	SAN LUIS POTOSI #21	HERMOSILLO	SONORA	(662)2142200	(662)2142200	(662)2142200	mercedesdelosreyes@compuproveedores.com	MERCEDES	f	240	928
929	REY111117RS3	REYEGRAN S.A DE C.V.	2	vidriera los reyes 25 1er piso 	TLALNEPANTLA DE BAZ	MEXICO		0155 5361-3182		direcciongeneral@reyegran.com.mx		f		929
931	SCT051121PH1	SECRETARIA DE COMUNICACIONES Y TRANSPORTES CENTRO SCT EN BAJA CALIFORNIA SUR	2	HEROES DEL 47 SN ENTRE IGNACIO ALTAMIRANO Y RAMIREZ	LA PAZ 	BAJA CALIFORNIA SUR		01-612-451-1142		mlopezhi@sct.gob.mx		f		931
932	CSG830527VC9	CENTRO SCT GUANAJUATO	4	CARR. KM 5 GTO S/N	GUANAJUATO	GUANAJUATO		014734541100		xxx@xxx.com		f		932
933	HP00106272A2	HEWLETT-PACKARD OPERATIONS MEXICO S.DE R.L. DE C.V.	2	PROLONGACION REFORMA	MEXICO D.F	DELEGACIÓN ALVARO OBREGON		018005222625		aalvarado@hp-canales.com.mx		f		933
934	JME0304309M7	JATCO DE MEXICO SA DE CV	4	CARRETERA PANAMERICANA KM 75 	AGUASCALIENTES	AGUASCALIENTES		910-6500		fernando.diazdeleonlara@jatco.com.mx		f		934
936	GES8101015I7	SUPREMO TRIBUNAL DE JUSTICIA DEL ESTADO DE SINALOA	3	AVE. LAZARO CARDENAS 891 SUR	CULIACAN ROSALES	SINALOA		667 758 70 00		guillermo.hernandez@stj-sin.gob.mx		f		936
937	DNO980122TF1	DATAPRO DEL NOROESTE SA DE CV	2	LUIS DONALDO COLOSIO 395 - A	HERMOSILLO	SONORA		6622165243 2168295 2180243		jamartinez@datapro.com.mx		f		937
938	API931215JS0	ADMINISTRACION PORTUARIA INTEGRAL DE GUAYMAS S.A. DE C.V.	2	RECINTO PORTUARIO, ZONA FRANCA S/N	GUAYMAS	SONORA		(622) 225 22 50		jdrmateriales@puertodeguaymas.com.mx		f		938
939	HME970227D71	HARMAN DE MEXICO S DE RL DE CV	1	AV DE LAS TORRES 2290	JUAREZ	CHIHUAHUA		(664) 607 00 86		norma.jimenez@harman.com		f		939
940	NA	RODRIGO SAUCEDA MUÑOZ	1	CALLE SIRIO 20190	TIJUANA	BAJA CALIFORNIA		664 235 72 99		rodrigo.sauceda@gmail.com		f		940
941	SIOS741207327	Sergio Silva Osuna	2	Herodotos 80	Hermosillo	Sonora		6621558999		compuflazh@hotmail.com		f		941
942		MARIA LUISA ALESSI GNOATO	2	ADOLFO DE LA HUERTA 914 COL PITIC	HERMOSILLO	SONORA	(662)2740620	(662)2144121	(662)2144121	mluisaalessi@hotmail.com	MARIA LUISA	f	NO TIENE	942
943	TTE141024J42	TACS TECHNOLOGIES S DE RL DE CV	2	Comonfort #35	Hermosillo	Sonora		662 2104930		ernestoreyes@tacstech.com		f		943
944	PPS121009I21	PST PROEASY SOLUCION TOTAL SA DE CV 	2	CABO SAN BLANCO #17	HERMOSILLO	SONORA		662 2164659		compras@proeasy.mx		f		944
945	SCT060306RL8	SECRETARIA DE COMUNICACIONES Y TRANSPORTES CENTRO SCT EN BAJA CALIFORNIA	1	EJERCITO NACIONAL #780	MEXICALI	BAJA CALIFORNIA		686 5689256		jcanorub@sct.gob.mx		f		945
946	PSE820514U28	PROMOCION SOCIAL Y EDUCATIVA DEL NOROESTE AC	2	DOS FINAL SN COLINAS SONORA	HERMOSILLO	SONORA	(662) 2 44 85 84	(662) 2 44 85 84|	(662) 2 44 85 84	SOPORTE@COMPUPROVEEDORES.COM	MAYELA FERNANDEZ	f	NINGUNA	946
935	GTC110329CI0	GARCA TU CASA LIMPIA	2	GANDARA 81	HERMOSILLO	SONORA	(662) 210-40-42	(662) 210-40-42	(662) 210-40-42	rhtucasalimpia@hotmail.com	MAYRA TORRECILLAS	f	*****	935
883	GES790913CT0	GOBIERNO DEL ESTADO DE SONORA SUPREMO TRIBUNAL DE JUSTICIA BICENTENARIO	2	BICENTENARIO, CUARTO PISO, DEPTO SISTEMAS.	HERMOSILLO	SONORA	(662) 213 97 41	(662) 213 97 41	(662) 213 97 41	sergio.dominguez@stjsonora.gob.mx	francisco.llanes@stjsonora.gob.mx	f		883
947	AAMK9006126L9	KARLA ANAIS ALVAREZ MORENO	2	AVE MANUEL M DIEGUEZ 444	HERMOSILLO	SONORA		(662)218 31 24		alejandro_fajardo@hotmail.com		f		947
\.


--
-- Name: core_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_cliente_id_seq', 947, true);


--
-- Data for Name: core_concretarcita; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_concretarcita (id, created, desactivar_email, nombre, empresa, telefono, email, comentarios, solucion) FROM stdin;
1	2015-01-09 13:05:16.852021-05	f	Roberto Cavazos	Nexus MA	(81)81149801	rcavazos@nexus-mexico.com	Buenas tardes, me interesa contactar con ustedes para pedir información sobre un servidor, realizar una cotización y posible compra. Gracias.	servidores
2	2015-03-09 03:47:20.116037-04	f	martin aragon		(644)1168929	alex_cangri01@hotmail.com	hace 6 meses compre mi laptop pero no puedo utilizar el office 365 y vario programas etc. no tengo la clave si me pueden ayudar gracias	office_365
3	2015-04-15 11:47:53.67345-04	f	Jorge Mendoza	Envases Universales	58994992	jorge.mendoza@envasesuniversales.com	Requiero soporte para Data Protector	hp_data_protector
\.


--
-- Name: core_concretarcita_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_concretarcita_id_seq', 3, true);


--
-- Data for Name: core_contacto; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_contacto (id, nombre, email) FROM stdin;
\.


--
-- Name: core_contacto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_contacto_id_seq', 1, false);


--
-- Data for Name: core_distribuidor; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_distribuidor (id, created, distribuidor, clave_modificacion, fecha_clave, tipo_distribuidor, sucursal, no_clientes_interno, clasificacion_interno, dias_credito_interno, limite_credito_interno, vendedor_interno_id, razon_social, nombre_comercial, domicilio, colonia, ciudad, estado, rfc, curp, telefono, fax, cp, pagina_web, representante_apellido_paterno, representante_apellido_materno, representante_nombre, representante_domicilio, representante_colonia, representante_ciudad, representante_estado, representante_telefono, representante_email, desactivar_email, representante_identificacion, vendedor, dias_credito, limite_credito, pagos_banco_1, pagos_no_cuenta_1, pagos_banco_2, pagos_no_cuenta_2, contacto_revision_facturas, dias_revision, horario_revision, telefono_revision, doc_revision, encargado_departamento_pago, encargado_entregas_pago, email_pago, telefono_pago, dias_pago, horario_pago, pagina_web_pago, correo_envio_facturas, documento_revision_pago, almacen_domicilio, almacen_colonia, almacen_telefono, almacen_dias, almacen_horario, almacen_atencion_a, datos_compra_contacto, datos_compra_correo, datos_compra_telefono, lugar, tiempo_residir, giro_principal, no_empleados, titular_cuenta, banco, no_cuenta, ejecutivo, telefono_bancarias, promedio_mensual, antiguedad_bancarias, observaciones, nombre_empresa, ciudad_comerciales, estado_comerciales, atencion_comerciales, telefono_comerciales, nombre_empresa_2, ciudad_comerciales_2, estado_comerciales_2, atencion_comerciales_2, telefono_comerciales_2, nombre_empresa_3, ciudad_comerciales_3, estado_comerciales_3, atencion_comerciales_3, telefono_comerciales_3, antiguedad_comerciales, dias_credito_comerciales, credito_comerciales, forma_pago_comerciales, copia_rfc, copia_alta, copia_identificacion, copia_comprobante_domicilio, no_usar_datos_bancarios) FROM stdin;
1	2014-11-10 15:47:21.702432-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
2	2014-11-10 15:47:21.709863-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
3	2014-11-10 15:47:21.715298-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
5	2014-11-10 15:47:21.725076-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
6	2014-11-10 15:47:21.729987-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
7	2014-11-10 15:47:21.734768-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
8	2014-11-10 15:47:21.739744-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
9	2014-11-10 15:47:21.744729-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
10	2014-11-10 15:47:21.749728-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
12	2014-11-10 15:47:21.763647-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
13	2014-11-10 15:47:21.768789-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
14	2014-11-10 15:47:21.773783-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
15	2014-11-10 15:47:21.778497-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
16	2014-11-10 15:47:21.783474-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
17	2014-11-10 15:47:21.788222-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
18	2014-11-10 15:47:21.792951-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
19	2014-11-10 15:47:21.797778-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
20	2014-11-10 15:47:21.802448-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
21	2014-11-10 15:47:21.807141-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
23	2014-11-10 15:47:21.816632-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
24	2014-11-10 15:47:21.821674-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
25	2014-11-10 15:47:21.82653-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
27	2014-11-10 15:47:21.836671-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
28	2014-11-10 15:47:21.841857-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
29	2014-11-10 15:47:21.846684-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
30	2014-11-10 15:47:21.851491-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
31	2014-11-10 15:47:21.856514-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
32	2014-11-10 15:47:21.861631-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
33	2014-11-10 15:47:21.866781-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
34	2014-11-10 15:47:21.871531-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
35	2014-11-10 15:47:21.877768-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
36	2014-11-10 15:47:21.882505-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
37	2014-11-10 15:47:21.887191-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
38	2014-11-10 15:47:21.892175-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
39	2014-11-10 15:47:21.897091-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
40	2014-11-10 15:47:21.901767-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
41	2014-11-10 15:47:21.906523-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
42	2014-11-10 15:47:21.911347-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
43	2014-11-10 15:47:21.916281-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
44	2014-11-10 15:47:21.921663-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
45	2014-11-10 15:47:21.927005-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
46	2014-11-10 15:47:21.931948-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
47	2014-11-10 15:47:21.93711-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
11	2014-11-10 15:47:21.758595-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
22	2014-11-10 15:47:21.811822-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
26	2014-11-10 15:47:21.831516-05	f		\N	3		\N		\N	\N	12																						f			0																													1																																			f
48	2014-11-10 15:47:21.941958-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
49	2014-11-10 15:47:21.947203-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
50	2014-11-10 15:47:21.951967-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
52	2014-11-10 15:47:21.969137-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
53	2014-11-10 15:47:21.974049-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
54	2014-11-10 15:47:21.979078-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
55	2014-11-10 15:47:21.984338-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
56	2014-11-10 15:47:21.989392-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
57	2014-11-10 15:47:21.994168-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
58	2014-11-10 15:47:21.999187-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
59	2014-11-10 15:47:22.004219-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
60	2014-11-10 15:47:22.009353-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
61	2014-11-10 15:47:22.014328-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
62	2014-11-10 15:47:22.019273-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
63	2014-11-10 15:47:22.024346-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
64	2014-11-10 15:47:22.029447-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
65	2014-11-10 15:47:22.034487-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
67	2014-11-10 15:47:22.045327-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
68	2014-11-10 15:47:22.051652-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
69	2014-11-10 15:47:22.061683-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
70	2014-11-10 15:47:22.067536-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
71	2014-11-10 15:47:22.074143-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
72	2014-11-10 15:47:22.080246-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
73	2014-11-10 15:47:22.086248-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
74	2014-11-10 15:47:22.092478-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
75	2014-11-10 15:47:22.098336-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
76	2014-11-10 15:47:22.104891-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
77	2014-11-10 15:47:22.111825-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
78	2014-11-10 15:47:22.118172-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
79	2014-11-10 15:47:22.124209-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
80	2014-11-10 15:47:22.130047-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
81	2014-11-10 15:47:22.136794-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
82	2014-11-10 15:47:22.14286-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
83	2014-11-10 15:47:22.148255-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
84	2014-11-10 15:47:22.161719-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
85	2014-11-10 15:47:22.166643-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
86	2014-11-10 15:47:22.171564-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
88	2014-11-10 15:47:22.181819-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
89	2014-11-10 15:47:22.187774-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
90	2014-11-10 15:47:22.192937-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
92	2014-11-10 15:47:22.202788-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
93	2014-11-10 15:47:22.207557-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
94	2014-11-10 15:47:22.212814-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
66	2014-11-10 15:47:22.039515-05	f		\N	3		\N		\N	\N	12																						f			0																													1																																			f
91	2014-11-10 15:47:22.19782-05	f		\N	3		\N		\N	\N	14																						f			0																													1																																			f
51	2014-11-10 15:47:21.961013-05	f		\N	3		\N		\N	\N	19																						f			0																													1																																			f
95	2014-11-10 15:47:22.218225-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
96	2014-11-10 15:47:22.223684-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
97	2014-11-10 15:47:22.22871-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
98	2014-11-10 15:47:22.233703-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
99	2014-11-10 15:47:22.238615-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
100	2014-11-10 15:47:22.243551-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
101	2014-11-10 15:47:22.248605-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
102	2014-11-10 15:47:22.262845-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
104	2014-11-10 15:47:22.274222-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
105	2014-11-10 15:47:22.279217-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
106	2014-11-10 15:47:22.284615-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
107	2014-11-10 15:47:22.289916-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
108	2014-11-10 15:47:22.295153-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
109	2014-11-10 15:47:22.300587-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
110	2014-11-10 15:47:22.306396-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
111	2014-11-10 15:47:22.311884-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
112	2014-11-10 15:47:22.317616-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
113	2014-11-10 15:47:22.323136-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
114	2014-11-10 15:47:22.328776-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
115	2014-11-10 15:47:22.33421-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
116	2014-11-10 15:47:22.339544-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
117	2014-11-10 15:47:22.344895-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
118	2014-11-10 15:47:22.350159-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
119	2014-11-10 15:47:22.355159-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
120	2014-11-10 15:47:22.360697-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
121	2014-11-10 15:47:22.365879-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
122	2014-11-10 15:47:22.371201-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
123	2014-11-10 15:47:22.376673-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
124	2014-11-10 15:47:22.382141-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
125	2014-11-10 15:47:22.387306-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
126	2014-11-10 15:47:22.392659-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
127	2014-11-10 15:47:22.398202-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
128	2014-11-10 15:47:22.409854-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
130	2014-11-10 15:47:22.423544-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
131	2014-11-10 15:47:22.430706-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
132	2014-11-10 15:47:22.436501-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
133	2014-11-10 15:47:22.443646-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
134	2014-11-10 15:47:22.452737-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
135	2014-11-10 15:47:22.466696-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
136	2014-11-10 15:47:22.476135-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
137	2014-11-10 15:47:22.533804-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
138	2014-11-10 15:47:22.544018-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
139	2014-11-10 15:47:22.550374-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
140	2014-11-10 15:47:22.56119-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
141	2014-11-10 15:47:22.566364-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
103	2014-11-10 15:47:22.268874-05	f		\N	3		\N		\N	\N	19																						f			0																													1																																			f
143	2014-11-10 15:47:22.576644-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
144	2014-11-10 15:47:22.581836-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
145	2014-11-10 15:47:22.586827-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
146	2014-11-10 15:47:22.592461-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
147	2014-11-10 15:47:22.59755-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
148	2014-11-10 15:47:22.602579-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
149	2014-11-10 15:47:22.607788-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
150	2014-11-10 15:47:22.614921-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
151	2014-11-10 15:47:22.621457-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
152	2014-11-10 15:47:22.627911-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
154	2014-11-10 15:47:22.641268-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
155	2014-11-10 15:47:22.652711-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
156	2014-11-10 15:47:22.66347-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
157	2014-11-10 15:47:22.672911-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
158	2014-11-10 15:47:22.681764-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
159	2014-11-10 15:47:22.690375-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
160	2014-11-10 15:47:22.69927-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
161	2014-11-10 15:47:22.708484-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
162	2014-11-10 15:47:22.715195-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
163	2014-11-10 15:47:22.720741-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
164	2014-11-10 15:47:22.7265-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
165	2014-11-10 15:47:22.731626-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
166	2014-11-10 15:47:22.736787-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
167	2014-11-10 15:47:22.742341-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
168	2014-11-10 15:47:22.760627-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
169	2014-11-10 15:47:22.766891-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
170	2014-11-10 15:47:22.772776-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
171	2014-11-10 15:47:22.777996-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
172	2014-11-10 15:47:22.78319-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
173	2014-11-10 15:47:22.789245-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
174	2014-11-10 15:47:22.797107-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
175	2014-11-10 15:47:22.804756-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
176	2014-11-10 15:47:22.810319-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
177	2014-11-10 15:47:22.816542-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
178	2014-11-10 15:47:22.822137-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
179	2014-11-10 15:47:22.827825-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
180	2014-11-10 15:47:22.833538-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
181	2014-11-10 15:47:22.838965-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
182	2014-11-10 15:47:22.845913-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
183	2014-11-10 15:47:22.861193-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
184	2014-11-10 15:47:22.870368-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
185	2014-11-10 15:47:22.878504-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
186	2014-11-10 15:47:22.883983-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
187	2014-11-10 15:47:22.890038-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
188	2014-11-10 15:47:22.896076-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
189	2014-11-10 15:47:22.902324-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
190	2014-11-10 15:47:22.908806-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
191	2014-11-10 15:47:22.914787-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
192	2014-11-10 15:47:22.920105-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
193	2014-11-10 15:47:22.925766-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
194	2014-11-10 15:47:22.932517-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
195	2014-11-10 15:47:22.938611-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
196	2014-11-10 15:47:22.94551-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
197	2014-11-10 15:47:22.952295-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
198	2014-11-10 15:47:22.961935-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
199	2014-11-10 15:47:22.967757-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
200	2014-11-10 15:47:22.97467-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
201	2014-11-10 15:47:22.981956-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
202	2014-11-10 15:47:22.988368-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
203	2014-11-10 15:47:22.995064-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
204	2014-11-10 15:47:23.001592-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
205	2014-11-10 15:47:23.009366-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
206	2014-11-10 15:47:23.016064-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
207	2014-11-10 15:47:23.022135-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
208	2014-11-10 15:47:23.028298-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
210	2014-11-10 15:47:23.04041-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
211	2014-11-10 15:47:23.046124-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
212	2014-11-10 15:47:23.051797-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
213	2014-11-10 15:47:23.061125-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
214	2014-11-10 15:47:23.06634-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
215	2014-11-10 15:47:23.072207-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
216	2014-11-10 15:47:23.079242-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
217	2014-11-10 15:47:23.085595-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
218	2014-11-10 15:47:23.092447-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
219	2014-11-10 15:47:23.09784-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
220	2014-11-10 15:47:23.103865-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
221	2014-11-10 15:47:23.109343-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
222	2014-11-10 15:47:23.114257-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
223	2014-11-10 15:47:23.119288-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
224	2014-11-10 15:47:23.124439-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
225	2014-11-10 15:47:23.129453-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
226	2014-11-10 15:47:23.134458-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
227	2014-11-10 15:47:23.13923-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
228	2014-11-10 15:47:23.144022-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
229	2014-11-10 15:47:23.148951-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
230	2014-11-10 15:47:23.162234-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
231	2014-11-10 15:47:23.173534-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
232	2014-11-10 15:47:23.178431-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
233	2014-11-10 15:47:23.194215-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
234	2014-11-10 15:47:23.199531-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
235	2014-11-10 15:47:23.204625-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
236	2014-11-10 15:47:23.209914-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
238	2014-11-10 15:47:23.221261-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
239	2014-11-10 15:47:23.226801-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
240	2014-11-10 15:47:23.231728-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
241	2014-11-10 15:47:23.236746-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
242	2014-11-10 15:47:23.241708-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
244	2014-11-10 15:47:23.257541-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
245	2014-11-10 15:47:23.263343-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
246	2014-11-10 15:47:23.268493-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
247	2014-11-10 15:47:23.273765-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
248	2014-11-10 15:47:23.278636-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
249	2014-11-10 15:47:23.283465-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
250	2014-11-10 15:47:23.28999-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
252	2014-11-10 15:47:23.303841-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
253	2014-11-10 15:47:23.310376-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
254	2014-11-10 15:47:23.317169-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
255	2014-11-10 15:47:23.323507-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
256	2014-11-10 15:47:23.329141-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
257	2014-11-10 15:47:23.334273-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
258	2014-11-10 15:47:23.339401-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
259	2014-11-10 15:47:23.344627-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
261	2014-11-10 15:47:23.359425-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
262	2014-11-10 15:47:23.364504-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
263	2014-11-10 15:47:23.36978-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
264	2014-11-10 15:47:23.374597-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
266	2014-11-10 15:47:23.384204-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
267	2014-11-10 15:47:23.389197-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
268	2014-11-10 15:47:23.394163-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
269	2014-11-10 15:47:23.39913-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
270	2014-11-10 15:47:23.404142-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
271	2014-11-10 15:47:23.409035-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
272	2014-11-10 15:47:23.413985-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
273	2014-11-10 15:47:23.419012-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
274	2014-11-10 15:47:23.424313-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
276	2014-11-10 15:47:23.43413-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
277	2014-11-10 15:47:23.438882-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
278	2014-11-10 15:47:23.443735-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
279	2014-11-10 15:47:23.448598-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
280	2014-11-10 15:47:23.453471-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
281	2014-11-10 15:47:23.460541-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
282	2014-11-10 15:47:23.465361-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
265	2014-11-10 15:47:23.379464-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
237	2014-11-10 15:47:23.21579-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
283	2014-11-10 15:47:23.470159-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
284	2014-11-10 15:47:23.475081-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
285	2014-11-10 15:47:23.481542-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
286	2014-11-10 15:47:23.48722-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
287	2014-11-10 15:47:23.494057-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
288	2014-11-10 15:47:23.499901-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
289	2014-11-10 15:47:23.504657-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
290	2014-11-10 15:47:23.509588-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
291	2014-11-10 15:47:23.514308-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
292	2014-11-10 15:47:23.522777-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
293	2014-11-10 15:47:23.528931-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
294	2014-11-10 15:47:23.534437-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
295	2014-11-10 15:47:23.539349-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
296	2014-11-10 15:47:23.544228-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
297	2014-11-10 15:47:23.549527-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
298	2014-11-10 15:47:23.554549-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
299	2014-11-10 15:47:23.56058-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
300	2014-11-10 15:47:23.565546-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
301	2014-11-10 15:47:23.570649-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
302	2014-11-10 15:47:23.581717-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
303	2014-11-10 15:47:23.588411-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
305	2014-11-10 15:47:23.601415-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
306	2014-11-10 15:47:23.607723-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
307	2014-11-10 15:47:23.617942-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
308	2014-11-10 15:47:23.626465-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
309	2014-11-10 15:47:23.633515-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
310	2014-11-10 15:47:23.639197-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
311	2014-11-10 15:47:23.645037-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
312	2014-11-10 15:47:23.651192-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
313	2014-11-10 15:47:23.659634-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
314	2014-11-10 15:47:23.665959-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
315	2014-11-10 15:47:23.671887-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
316	2014-11-10 15:47:23.678332-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
317	2014-11-10 15:47:23.68585-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
318	2014-11-10 15:47:23.692899-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
319	2014-11-10 15:47:23.698963-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
320	2014-11-10 15:47:23.707019-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
321	2014-11-10 15:47:23.714352-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
322	2014-11-10 15:47:23.72686-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
323	2014-11-10 15:47:23.733313-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
324	2014-11-10 15:47:23.741236-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
325	2014-11-10 15:47:23.749006-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
326	2014-11-10 15:47:23.761048-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
327	2014-11-10 15:47:23.766905-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
328	2014-11-10 15:47:23.789725-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
329	2014-11-10 15:47:23.79694-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
330	2014-11-10 15:47:23.80281-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
331	2014-11-10 15:47:23.808377-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
332	2014-11-10 15:47:23.814422-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
333	2014-11-10 15:47:23.821137-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
334	2014-11-10 15:47:23.827243-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
335	2014-11-10 15:47:23.833214-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
337	2014-11-10 15:47:23.846805-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
338	2014-11-10 15:47:23.853134-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
339	2014-11-10 15:47:23.863792-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
340	2014-11-10 15:47:23.87125-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
341	2014-11-10 15:47:23.881146-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
342	2014-11-10 15:47:23.892473-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
344	2014-11-10 15:47:23.907169-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
345	2014-11-10 15:47:23.914866-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
346	2014-11-10 15:47:23.921286-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
347	2014-11-10 15:47:23.930482-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
348	2014-11-10 15:47:23.937669-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
349	2014-11-10 15:47:23.942757-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
350	2014-11-10 15:47:23.947892-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
351	2014-11-10 15:47:23.95757-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
352	2014-11-10 15:47:23.964981-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
353	2014-11-10 15:47:23.97126-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
354	2014-11-10 15:47:23.977478-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
355	2014-11-10 15:47:23.98383-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
356	2014-11-10 15:47:23.990132-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
357	2014-11-10 15:47:23.997509-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
358	2014-11-10 15:47:24.004664-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
359	2014-11-10 15:47:24.01448-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
360	2014-11-10 15:47:24.019545-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
361	2014-11-10 15:47:24.024762-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
362	2014-11-10 15:47:24.03053-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
363	2014-11-10 15:47:24.03581-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
364	2014-11-10 15:47:24.041006-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
365	2014-11-10 15:47:24.045918-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
366	2014-11-10 15:47:24.0508-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
367	2014-11-10 15:47:24.060582-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
368	2014-11-10 15:47:24.065505-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
369	2014-11-10 15:47:24.070466-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
370	2014-11-10 15:47:24.075416-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
371	2014-11-10 15:47:24.080199-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
372	2014-11-10 15:47:24.08532-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
373	2014-11-10 15:47:24.090413-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
374	2014-11-10 15:47:24.095486-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
375	2014-11-10 15:47:24.100285-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
376	2014-11-10 15:47:24.106647-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
336	2014-11-10 15:47:23.839705-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
377	2014-11-10 15:47:24.113555-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
378	2014-11-10 15:47:24.126763-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
379	2014-11-10 15:47:24.131867-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
380	2014-11-10 15:47:24.137463-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
381	2014-11-10 15:47:24.142724-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
382	2014-11-10 15:47:24.147922-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
383	2014-11-10 15:47:24.153135-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
384	2014-11-10 15:47:24.162196-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
385	2014-11-10 15:47:24.167361-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
386	2014-11-10 15:47:24.17264-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
387	2014-11-10 15:47:24.177847-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
388	2014-11-10 15:47:24.182996-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
389	2014-11-10 15:47:24.188217-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
390	2014-11-10 15:47:24.193119-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
391	2014-11-10 15:47:24.198199-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
392	2014-11-10 15:47:24.203163-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
393	2014-11-10 15:47:24.208288-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
394	2014-11-10 15:47:24.213194-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
395	2014-11-10 15:47:24.218053-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
396	2014-11-10 15:47:24.223182-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
397	2014-11-10 15:47:24.227985-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
398	2014-11-10 15:47:24.233098-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
399	2014-11-10 15:47:24.238254-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
400	2014-11-10 15:47:24.243285-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
401	2014-11-10 15:47:24.250921-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
402	2014-11-10 15:47:24.255902-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
403	2014-11-10 15:47:24.265497-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
404	2014-11-10 15:47:24.271846-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
406	2014-11-10 15:47:24.290118-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
407	2014-11-10 15:47:24.295202-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
408	2014-11-10 15:47:24.309805-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
409	2014-11-10 15:47:24.317064-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
410	2014-11-10 15:47:24.33115-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
411	2014-11-10 15:47:24.34511-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
412	2014-11-10 15:47:24.361318-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
413	2014-11-10 15:47:24.367539-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
414	2014-11-10 15:47:24.373244-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
415	2014-11-10 15:47:24.378107-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
416	2014-11-10 15:47:24.382762-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
417	2014-11-10 15:47:24.387399-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
418	2014-11-10 15:47:24.392169-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
419	2014-11-10 15:47:24.396957-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
420	2014-11-10 15:47:24.402062-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
421	2014-11-10 15:47:24.409061-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
422	2014-11-10 15:47:24.42549-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
423	2014-11-10 15:47:24.432176-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
424	2014-11-10 15:47:24.437916-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
425	2014-11-10 15:47:24.445045-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
426	2014-11-10 15:47:24.454095-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
427	2014-11-10 15:47:24.461639-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
428	2014-11-10 15:47:24.466981-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
429	2014-11-10 15:47:24.478513-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
431	2014-11-10 15:47:24.49059-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
432	2014-11-10 15:47:24.495962-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
433	2014-11-10 15:47:24.501009-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
435	2014-11-10 15:47:24.510945-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
436	2014-11-10 15:47:24.516116-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
437	2014-11-10 15:47:24.522806-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
438	2014-11-10 15:47:24.530377-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
439	2014-11-10 15:47:24.535289-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
440	2014-11-10 15:47:24.541265-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
441	2014-11-10 15:47:24.548476-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
442	2014-11-10 15:47:24.563798-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
443	2014-11-10 15:47:24.575085-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
444	2014-11-10 15:47:24.582256-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
445	2014-11-10 15:47:24.588893-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
446	2014-11-10 15:47:24.598582-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
447	2014-11-10 15:47:24.605668-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
448	2014-11-10 15:47:24.615034-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
449	2014-11-10 15:47:24.664538-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
450	2014-11-10 15:47:24.670142-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
451	2014-11-10 15:47:24.676264-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
452	2014-11-10 15:47:24.685809-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
454	2014-11-10 15:47:24.701226-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
455	2014-11-10 15:47:24.712186-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
456	2014-11-10 15:47:24.718786-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
457	2014-11-10 15:47:24.725891-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
458	2014-11-10 15:47:24.73196-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
459	2014-11-10 15:47:24.737955-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
460	2014-11-10 15:47:24.742793-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
461	2014-11-10 15:47:24.748409-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
462	2014-11-10 15:47:24.753288-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
463	2014-11-10 15:47:24.762571-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
464	2014-11-10 15:47:24.769307-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
465	2014-11-10 15:47:24.774254-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
466	2014-11-10 15:47:24.779054-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
467	2014-11-10 15:47:24.786209-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
468	2014-11-10 15:47:24.794236-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
469	2014-11-10 15:47:24.799189-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
470	2014-11-10 15:47:24.804206-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
430	2014-11-10 15:47:24.484084-05	f		\N	3		\N		\N	\N	12																						f			0																													1																																			f
434	2014-11-10 15:47:24.505926-05	f		\N	3		\N		\N	\N	19																						f			0																													1																																			f
471	2014-11-10 15:47:24.809383-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
472	2014-11-10 15:47:24.814797-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
473	2014-11-10 15:47:24.81975-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
474	2014-11-10 15:47:24.824711-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
475	2014-11-10 15:47:24.829554-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
476	2014-11-10 15:47:24.83473-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
477	2014-11-10 15:47:24.83992-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
478	2014-11-10 15:47:24.844992-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
479	2014-11-10 15:47:24.849896-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
480	2014-11-10 15:47:24.854757-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
481	2014-11-10 15:47:24.860532-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
482	2014-11-10 15:47:24.865772-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
483	2014-11-10 15:47:24.873295-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
484	2014-11-10 15:47:24.879361-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
485	2014-11-10 15:47:24.884118-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
486	2014-11-10 15:47:24.888905-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
487	2014-11-10 15:47:24.893684-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
488	2014-11-10 15:47:24.898582-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
489	2014-11-10 15:47:24.903817-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
490	2014-11-10 15:47:24.908806-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
491	2014-11-10 15:47:24.914146-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
492	2014-11-10 15:47:24.919443-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
493	2014-11-10 15:47:24.924801-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
494	2014-11-10 15:47:24.929853-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
495	2014-11-10 15:47:24.934725-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
496	2014-11-10 15:47:24.939878-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
497	2014-11-10 15:47:24.944696-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
498	2014-11-10 15:47:24.950268-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
499	2014-11-10 15:47:24.955674-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
500	2014-11-10 15:47:24.962859-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
501	2014-11-10 15:47:24.967976-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
502	2014-11-10 15:47:24.973015-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
503	2014-11-10 15:47:24.977967-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
504	2014-11-10 15:47:24.983197-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
505	2014-11-10 15:47:24.988242-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
506	2014-11-10 15:47:24.993348-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
507	2014-11-10 15:47:24.998558-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
508	2014-11-10 15:47:25.005036-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
509	2014-11-10 15:47:25.010363-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
510	2014-11-10 15:47:25.016514-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
512	2014-11-10 15:47:25.035528-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
513	2014-11-10 15:47:25.042505-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
514	2014-11-10 15:47:25.048186-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
515	2014-11-10 15:47:25.05945-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
516	2014-11-10 15:47:25.066257-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
517	2014-11-10 15:47:25.071912-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
518	2014-11-10 15:47:25.077052-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
519	2014-11-10 15:47:25.081892-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
520	2014-11-10 15:47:25.086588-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
521	2014-11-10 15:47:25.091379-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
522	2014-11-10 15:47:25.096186-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
523	2014-11-10 15:47:25.106158-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
524	2014-11-10 15:47:25.111055-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
525	2014-11-10 15:47:25.115971-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
526	2014-11-10 15:47:25.120708-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
527	2014-11-10 15:47:25.125447-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
528	2014-11-10 15:47:25.130228-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
529	2014-11-10 15:47:25.135104-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
530	2014-11-10 15:47:25.139824-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
531	2014-11-10 15:47:25.144808-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
532	2014-11-10 15:47:25.151265-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
533	2014-11-10 15:47:25.160048-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
534	2014-11-10 15:47:25.167099-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
535	2014-11-10 15:47:25.173007-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
536	2014-11-10 15:47:25.17866-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
537	2014-11-10 15:47:25.186429-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
538	2014-11-10 15:47:25.194204-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
539	2014-11-10 15:47:25.200297-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
540	2014-11-10 15:47:25.206394-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
541	2014-11-10 15:47:25.212895-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
542	2014-11-10 15:47:25.220147-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
543	2014-11-10 15:47:25.227669-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
544	2014-11-10 15:47:25.23433-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
545	2014-11-10 15:47:25.240032-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
546	2014-11-10 15:47:25.247875-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
547	2014-11-10 15:47:25.253957-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
548	2014-11-10 15:47:25.260524-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
549	2014-11-10 15:47:25.267159-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
550	2014-11-10 15:47:25.273706-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
551	2014-11-10 15:47:25.281361-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
552	2014-11-10 15:47:25.291012-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
553	2014-11-10 15:47:25.300603-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
554	2014-11-10 15:47:25.30803-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
555	2014-11-10 15:47:25.319476-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
556	2014-11-10 15:47:25.32517-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
557	2014-11-10 15:47:25.332056-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
558	2014-11-10 15:47:25.339333-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
559	2014-11-10 15:47:25.345907-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
560	2014-11-10 15:47:25.351619-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
561	2014-11-10 15:47:25.356857-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
562	2014-11-10 15:47:25.362251-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
563	2014-11-10 15:47:25.368018-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
564	2014-11-10 15:47:25.373605-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
565	2014-11-10 15:47:25.379222-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
566	2014-11-10 15:47:25.384553-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
567	2014-11-10 15:47:25.389872-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
568	2014-11-10 15:47:25.395307-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
569	2014-11-10 15:47:25.400449-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
570	2014-11-10 15:47:25.405613-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
571	2014-11-10 15:47:25.410463-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
572	2014-11-10 15:47:25.417203-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
573	2014-11-10 15:47:25.42577-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
574	2014-11-10 15:47:25.43135-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
575	2014-11-10 15:47:25.436559-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
576	2014-11-10 15:47:25.442807-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
578	2014-11-10 15:47:25.462159-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
579	2014-11-10 15:47:25.467942-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
580	2014-11-10 15:47:25.473333-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
581	2014-11-10 15:47:25.478765-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
582	2014-11-10 15:47:25.484937-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
583	2014-11-10 15:47:25.490163-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
584	2014-11-10 15:47:25.495161-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
585	2014-11-10 15:47:25.500007-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
586	2014-11-10 15:47:25.505469-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
587	2014-11-10 15:47:25.510788-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
588	2014-11-10 15:47:25.520977-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
589	2014-11-10 15:47:25.526279-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
590	2014-11-10 15:47:25.531957-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
591	2014-11-10 15:47:25.543702-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
592	2014-11-10 15:47:25.55255-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
593	2014-11-10 15:47:25.568463-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
594	2014-11-10 15:47:25.574094-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
595	2014-11-10 15:47:25.579723-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
596	2014-11-10 15:47:25.585921-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
597	2014-11-10 15:47:25.594817-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
598	2014-11-10 15:47:25.602164-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
599	2014-11-10 15:47:25.608202-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
600	2014-11-10 15:47:25.615715-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
601	2014-11-10 15:47:25.623103-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
602	2014-11-10 15:47:25.631671-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
603	2014-11-10 15:47:25.637556-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
604	2014-11-10 15:47:25.642452-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
606	2014-11-10 15:47:25.658866-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
607	2014-11-10 15:47:25.665456-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
608	2014-11-10 15:47:25.671802-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
609	2014-11-10 15:47:25.680751-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
610	2014-11-10 15:47:25.686446-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
611	2014-11-10 15:47:25.691851-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
605	2014-11-10 15:47:25.647926-05	f		\N	3		\N		\N	\N	19																						f			0																													1																																			f
612	2014-11-10 15:47:25.700245-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
613	2014-11-10 15:47:25.707438-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
614	2014-11-10 15:47:25.714741-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
615	2014-11-10 15:47:25.720566-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
616	2014-11-10 15:47:25.726618-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
617	2014-11-10 15:47:25.733247-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
618	2014-11-10 15:47:25.739909-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
619	2014-11-10 15:47:25.747733-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
620	2014-11-10 15:47:25.766062-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
621	2014-11-10 15:47:25.775391-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
622	2014-11-10 15:47:25.784381-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
623	2014-11-10 15:47:25.793349-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
624	2014-11-10 15:47:25.798447-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
625	2014-11-10 15:47:25.804165-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
626	2014-11-10 15:47:25.810217-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
627	2014-11-10 15:47:25.81628-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
628	2014-11-10 15:47:25.821883-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
629	2014-11-10 15:47:25.827048-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
630	2014-11-10 15:47:25.832084-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
631	2014-11-10 15:47:25.837166-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
632	2014-11-10 15:47:25.844504-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
633	2014-11-10 15:47:25.858219-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
634	2014-11-10 15:47:25.867574-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
635	2014-11-10 15:47:25.876099-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
636	2014-11-10 15:47:25.884852-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
637	2014-11-10 15:47:25.893627-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
638	2014-11-10 15:47:25.901739-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
639	2014-11-10 15:47:25.90893-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
640	2014-11-10 15:47:25.917746-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
641	2014-11-10 15:47:25.935052-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
642	2014-11-10 15:47:25.943619-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
643	2014-11-10 15:47:25.952031-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
645	2014-11-10 15:47:25.976944-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
646	2014-11-10 15:47:25.991102-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
647	2014-11-10 15:47:25.997061-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
648	2014-11-10 15:47:26.004024-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
649	2014-11-10 15:47:26.013603-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
650	2014-11-10 15:47:26.026459-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
651	2014-11-10 15:47:26.032521-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
652	2014-11-10 15:47:26.058324-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
653	2014-11-10 15:47:26.064681-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
654	2014-11-10 15:47:26.073079-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
655	2014-11-10 15:47:26.07822-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
656	2014-11-10 15:47:26.083591-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
657	2014-11-10 15:47:26.088731-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
658	2014-11-10 15:47:26.099605-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
659	2014-11-10 15:47:26.108001-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
660	2014-11-10 15:47:26.113078-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
661	2014-11-10 15:47:26.120734-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
662	2014-11-10 15:47:26.128315-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
664	2014-11-10 15:47:26.138605-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
665	2014-11-10 15:47:26.143534-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
666	2014-11-10 15:47:26.161264-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
667	2014-11-10 15:47:26.166376-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
668	2014-11-10 15:47:26.171747-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
669	2014-11-10 15:47:26.177564-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
670	2014-11-10 15:47:26.182685-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
671	2014-11-10 15:47:26.188207-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
672	2014-11-10 15:47:26.199371-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
673	2014-11-10 15:47:26.204717-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
674	2014-11-10 15:47:26.209888-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
675	2014-11-10 15:47:26.214877-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
676	2014-11-10 15:47:26.220137-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
677	2014-11-10 15:47:26.225442-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
678	2014-11-10 15:47:26.233536-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
679	2014-11-10 15:47:26.241154-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
680	2014-11-10 15:47:26.260658-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
681	2014-11-10 15:47:26.279492-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
682	2014-11-10 15:47:26.294005-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
683	2014-11-10 15:47:26.29926-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
684	2014-11-10 15:47:26.304157-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
685	2014-11-10 15:47:26.309217-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
687	2014-11-10 15:47:26.319267-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
688	2014-11-10 15:47:26.329704-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
689	2014-11-10 15:47:26.335198-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
691	2014-11-10 15:47:26.345527-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
692	2014-11-10 15:47:26.350666-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
693	2014-11-10 15:47:26.368871-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
694	2014-11-10 15:47:26.376853-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
695	2014-11-10 15:47:26.382738-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
696	2014-11-10 15:47:26.388224-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
697	2014-11-10 15:47:26.393773-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
698	2014-11-10 15:47:26.399296-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
699	2014-11-10 15:47:26.404625-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
700	2014-11-10 15:47:26.41024-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
701	2014-11-10 15:47:26.415588-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
702	2014-11-10 15:47:26.421316-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
703	2014-11-10 15:47:26.427052-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
704	2014-11-10 15:47:26.432726-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
705	2014-11-10 15:47:26.441176-05	f		\N	3		\N		\N	\N	19																						f			0																													1																																			f
686	2014-11-10 15:47:26.314327-05	f		\N	3		\N		\N	\N	19																						f			0																													1																																			f
690	2014-11-10 15:47:26.340351-05	f		\N	3		\N		\N	\N	6																						f			0																													1																																			f
706	2014-11-10 15:47:26.448314-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
707	2014-11-10 15:47:26.460969-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
708	2014-11-10 15:47:26.468379-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
710	2014-11-10 15:47:26.486721-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
711	2014-11-10 15:47:26.494405-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
713	2014-11-10 15:47:26.513405-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
714	2014-11-10 15:47:26.520749-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
715	2014-11-10 15:47:26.527737-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
716	2014-11-10 15:47:26.536258-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
717	2014-11-10 15:47:26.542397-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
718	2014-11-10 15:47:26.548044-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
719	2014-11-10 15:47:26.555171-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
720	2014-11-10 15:47:26.562648-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
721	2014-11-10 15:47:26.572543-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
722	2014-11-10 15:47:26.580912-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
723	2014-11-10 15:47:26.587904-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
724	2014-11-10 15:47:26.593766-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
725	2014-11-10 15:47:26.600992-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
726	2014-11-10 15:47:26.609036-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
727	2014-11-10 15:47:26.615557-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
729	2014-11-10 15:47:26.626923-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
730	2014-11-10 15:47:26.632401-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
731	2014-11-10 15:47:26.63777-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
732	2014-11-10 15:47:26.643111-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
733	2014-11-10 15:47:26.648216-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
734	2014-11-10 15:47:26.659977-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
735	2014-11-10 15:47:26.666002-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
736	2014-11-10 15:47:26.671745-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
737	2014-11-10 15:47:26.677131-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
738	2014-11-10 15:47:26.682866-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
739	2014-11-10 15:47:26.690572-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
740	2014-11-10 15:47:26.699516-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
741	2014-11-10 15:47:26.705111-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
742	2014-11-10 15:47:26.713314-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
743	2014-11-10 15:47:26.718444-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
744	2014-11-10 15:47:26.723869-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
745	2014-11-10 15:47:26.728852-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
746	2014-11-10 15:47:26.736832-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
747	2014-11-10 15:47:26.742053-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
748	2014-11-10 15:47:26.747102-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
749	2014-11-10 15:47:26.7525-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
750	2014-11-10 15:47:26.765592-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
751	2014-11-10 15:47:26.776645-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
752	2014-11-10 15:47:26.786975-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
709	2014-11-10 15:47:26.47549-05	f		\N	3		\N		\N	\N	19																						f			0																													1																																			f
728	2014-11-10 15:47:26.621542-05	f		\N	3		\N		\N	\N	12																						f			0																													1																																			f
753	2014-11-10 15:47:26.796669-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
754	2014-11-10 15:47:26.803257-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
755	2014-11-10 15:47:26.809319-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
756	2014-11-10 15:47:26.815687-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
758	2014-11-10 15:47:26.840598-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
759	2014-11-10 15:47:26.85013-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
760	2014-11-10 15:47:26.864309-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
761	2014-11-10 15:47:26.877103-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
762	2014-11-10 15:47:26.884663-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
763	2014-11-10 15:47:26.892661-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
764	2014-11-10 15:47:26.899892-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
765	2014-11-10 15:47:26.90669-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
766	2014-11-10 15:47:26.91405-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
767	2014-11-10 15:47:26.925977-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
768	2014-11-10 15:47:26.932966-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
769	2014-11-10 15:47:26.940362-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
770	2014-11-10 15:47:26.947004-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
771	2014-11-10 15:47:26.961291-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
772	2014-11-10 15:47:26.969646-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
773	2014-11-10 15:47:26.974788-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
775	2014-11-10 15:47:26.988237-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
776	2014-11-10 15:47:26.996142-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
777	2014-11-10 15:47:27.001729-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
778	2014-11-10 15:47:27.010117-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
779	2014-11-10 15:47:27.016808-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
780	2014-11-10 15:47:27.023651-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
781	2014-11-10 15:47:27.044306-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
782	2014-11-10 15:47:27.051163-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
783	2014-11-10 15:47:27.062212-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
784	2014-11-10 15:47:27.068886-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
785	2014-11-10 15:47:27.074391-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
786	2014-11-10 15:47:27.07937-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
787	2014-11-10 15:47:27.08461-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
788	2014-11-10 15:47:27.089513-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
789	2014-11-10 15:47:27.097289-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
790	2014-11-10 15:47:27.102119-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
791	2014-11-10 15:47:27.106903-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
792	2014-11-10 15:47:27.111746-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
793	2014-11-10 15:47:27.116633-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
794	2014-11-10 15:47:27.12166-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
795	2014-11-10 15:47:27.131793-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
796	2014-11-10 15:47:27.136737-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
757	2014-11-10 15:47:26.829929-05	f		\N	3		\N		\N	\N	14																						f			0																													1																																			f
843	2015-01-05 17:17:47.765802-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
847	2015-01-07 10:28:08.26559-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
849	2015-01-07 10:36:01.693089-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
863	2015-01-20 13:07:21.158975-05	f		\N	3		\N		\N	\N	12																						f			0																													1																																			f
797	2014-11-11 15:53:16.753849-05	f		\N	2	1	\N		\N	\N	\N	INSTITUTO MUNICIPAL DE INVESTIGACION Y PLANEACION DE ENSENADA B.C.		CALLE TERCERA NO. 1323-16	ZONA CENTRO TERCERA Y ESPINOZA	ENSENADA	BAJA CALIFORNIA	IMI030514PG5		646 152 19 09	646 152 19 10	22800	www.imipens.org	*************	*******	**************	**************	************	***********	************	*********	mgonzalez@imipens.org	f	**************		0		******	**********	*********	***************	MARGARITA GONZALEZ	A LA ENTREGA	8:00 A 2:00 Y 4:00 A 6:00	646 152 19 09	FACTURA	MARGARITA GONZALEZ		mgonzalez@imipens.org	646 152 19 09	A LA ENTREGA	8:00 A 2:00 Y 4:00 A 6:00		factura@imipens.org	FACTURA	calle tercera y floresta no. 1323-16	PLAZ ELVA ZONA CENTRO	646 152 19 09	LUNES A VIERNES	8:00 A 2:00 Y 4:00 A 6:00	MARGARITA GONZALEZ	MARGARITA GONZALEZ	mgonzalez@imipens.org	646 152 19 09	2	11 años	AYUNTAMIENTO	300									***********	************	************	*********	**************	**************	****************	**************	************	***************	*************	***************	*****************	********	******					rfc/RFC_IMIP.JPG	rfc/RFC_IMIP_Z6hgZPY.JPG	rfc/RFC_IMIP_ctmKcSe.JPG	rfc/RFC_IMIP_odjvRwK.JPG	f
243	2014-11-10 15:47:23.247841-05	f		\N	3		\N		\N	\N	6																						f			0																													1																																			f
798	2014-11-11 18:47:36.598733-05	f		\N	3		\N		\N	\N	7																						f			0																													1																																			f
799	2014-11-11 18:51:24.456517-05	f		\N	3		\N		\N	\N	7																						f			0																													1																																			f
800	2014-11-12 10:21:06.982847-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
87	2014-11-10 15:47:22.176475-05	f		\N	3		\N		\N	\N	14																						f			0																													1																																			f
663	2014-11-10 15:47:26.133428-05	f		\N	3		\N		\N	\N	14																						f			0																													1																																			f
801	2014-11-13 13:58:04.3226-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
802	2014-11-13 14:30:58.808004-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
4	2014-11-10 15:47:21.72004-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
803	2014-11-18 11:09:58.69335-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
304	2014-11-10 15:47:23.594903-05	f		\N	3		\N		\N	\N	15																						f			0																													1																																			f
804	2014-11-18 14:01:34.786064-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
806	2014-11-19 13:44:01.093674-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
453	2014-11-10 15:47:24.691529-05	f		\N	3		\N		\N	\N	9																						f			0																													1																																			f
805	2014-11-19 12:28:57.016001-05	f		\N	2	4	4250	PM	0	0	22	Fco Antonio Orozco s.a. de c.v.	Goodyear Faosa	Convencion 1914 Norte 129	Circunvalacion Norte	Aguascalientes	Aguascalientes	FAO740715MZA	xxx	449 9147076	xxx	20020	xxx	Ravelo	Arceo	Luis	Jesus Consuelo 1513	Morelos	Aguascalientes	Aguascalientes	449 9147128	faosa_ravelo@hotmail.com	f	0092039849261		0		xxx	xxx	xxx	xxx	xxx	xxx	xxx	xxx	xxx	xxx		faosa_ravelo@hotmail.com	xxx	xxx	xxx		faosa_ravelo@hotmail.com	xxx	Convencion 1914 129	Circunvalacion Norte	449 9147076	Lunes	9	Luis Ravelo	Luis Ravelo	faosa_ravelo@hotmail.com	4499147076	1	40	Llantera	45									xxx	xxx	xxx	xxx	xxx	xxx	xxx	xxx	xxx	xxx	xxx	xxx	xxx	xxx	xxx					rfc/Scan_RFC.pdf	rfc/Scan_RFC_fdxcsa0.pdf	rfc/Scan_IFE.pdf	rfc/Scan_Compr_domic.pdf	f
808	2014-11-20 16:35:52.085273-05	f		\N	2	4	4251	PM	0	0	22	C3 EG S.A. de C.V.	C3 Engineering Group	Carretera Panamericana Km 8.5 108-B	Parque Industrial Altec	Aguascalientes	Aguascalientes	CEG1110279P9		4491747832		20290	http://www.c3eg.com/	Maldonado	Moreno	Adan Eduardo	Flor de Noche Buena 98 10	Villa Sur	Aguascalientes	Aguascalientes	4499295506	adan.maldonado@c3eg.com	f	0325055246911		0		xxx	xxx	xxx	xxx	Lourdes Castañeda	Lunes Viernes	10 am	4491747832	Factura	Lourdes Castañeda		lourdes.castaneda@c3eg.com	4491747832	Lunes Viernes	10 am		lourdes.castaneda@c3eg.com	Factura	Carretera Panamericana 8.5 108-B	Parque Industrial Altec	4491747832	Lunes Viernes	10 am	Nancy Puentes	Alain Mina	alain.mina@c3eg.com	4491747832	2	5 años	Fabrica	30									xxx	xxx	xxx	xxx	xxx	xxx	xxx	xxx	xxx	xxx	xxx	xxx	xxx	xxx	xxx					rfc/Scan_RFC_7iKOwtT.pdf	rfc/Scan_RFC_g5mVFNC.pdf	rfc/Scan_IFE_pBwGjEb.pdf	rfc/Scan_COMPR_DOMC.pdf	f
809	2014-11-21 14:24:01.716924-05	f		\N	3		\N		\N	\N	12																						f			0																													1																																			f
810	2014-11-22 13:26:53.616133-05	f		\N	2	2	5314	PF	0	0	21	KARINA CECILIA RUBIO REYNA		AVENIDA PODER LEGISLATIVO 58	MISION DEL SOL	HERMOSILLO	SONORA	RURK730629G61	RURK730629MSRBYR01	*	*	83100		RUBIO	REYNA	KARINA CECILIA	AVENIDA PODER LEGISLATIVO 58	MISION DEL SOL	HERMOSILLO	SONORA	*	contacto@thewoofclub.com.mx	f	0359023646301		0																				AVENIDA PODER LEGISLATIVO 58	MISION DEL SOL	*	L-V	8AM A 5PM	KARINA RUBIO	KARINA RUBIO	contacto@thewoofclub.com.mx	*	1	*	*	*									*	*	*	*	*	*	*	*	*	*	*	*	*	*	*					rfc/IFE_Karina.pdf	rfc/RFC_Karina.pdf	rfc/recibo_luz_oct_2014_001.jpg	rfc/RFC_Karina_mWbcEJa.pdf	f
811	2014-11-24 14:27:16.078911-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
834	2014-12-15 15:50:42.154868-05	f		\N	2	4	4254	PM	0	0	28	INSTITUTO PARA EL DESARROLLO DE LA SOCIEDAD DEL CONOCIMIENTO DEL ESTADO DE AGUASCALIENTES	MUSEO DESCUBRE	AVENIDA SAN MIGUEL SN	JARDINES DEL PARQUE	AGUASCALIENTES	AGUASCALIENTES	IDD110201FI5	XXX	449 9780338	XXX	20276	XXX	URZUA 	MACIAS	RAFAEL	C SIERRA MORENA 307	BOSQUES DEL PRADO 	AGUASCALIENTES	AGUASCALIENTES	449 9780338	armandoandradez@hotmail.com	f	0046014583822		0																				AV SAN MIGUEL SIN NUMERO	JARDINES DEL PARQUE 	449 9780338	LUNES A VIERNES 	9AM A 2PM	MONICA LUEVANO	MONICA LUEVANO	monicaluevano@aguascalientes.gob.mx	449 9638633 113	1	15	EDUCACION	50																												rfc/RFC_Efsjq1t.jpg	rfc/RFC2.jpg	rfc/IFE_aWQfrrR.jpg	rfc/COMPROBANT_DE_DOMICILIO_IDSCEA_001.jpg	f
844	2015-01-05 18:26:11.028515-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
812	2014-11-26 12:04:57.034358-05	t		\N	1	2	5316	DPF	0	0	21	MIGUEL GALINDO MARTINEZ	GALMATECH	CALIFORNIA 473-3	CHAPULTEPEC	CIUDAD OBREGON	SONORA	GAMM8309299A1	GAMM830929HSRLRG07	6444135990		85100		GALINDO	MARTINEZ	MIGUEL	CALIFORNIA 473-3	CHAPULTEPEC	CIUDAD OBREGON	SONORA	4135990	galmatech@gmail.com	f	0777063918072		0		BANCO EL BAJIO	11144805	compuproveedores	11144805	MIGUEL GALINDO MARTINEZ	TODOS	TODO	4135990	factura	MIGUEL GALINDO MARTINEZ		galmatech@gmail.com	4135990	todo	todo		galmatech@gmail.com	factura y xml	california 473-3	chapultepec	4135990	lunes a viernes	8 am - 8pm	MIGUEL GALINDO	MIGUEL GALINDO MARTINEZ	galmatech@gmail.com	4135990	2	30 años	computadora y papeleria	2									CT INTERNACIONAL	CIUDAD OBREGON	SONORA	ADRIANA GONZALEZ	4121501	COPYTONERS	CIUDAD OBREGON	SONORA	FRANCISCO FLORES	6441543368	SERVALL EQUIPOS	CIUDAD OBREGON	SONORA	ALEJANDRO NAVA	6441946456					rfc/CEDULA_FISCAL.pdf	rfc/CEDULA_FISCAL_IGV2dKB.pdf	rfc/Credencial_de_Elector.pdf	rfc/COMPROBANTE_DE_DOMICILIO.pdf	f
129	2014-11-10 15:47:22.416587-05	f		\N	3		\N		\N	\N	14																						f			0																													1																																			f
813	2014-11-28 16:45:31.100403-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
814	2014-11-28 17:48:06.096808-05	f		\N	2	2	5319	PF	0	0	25	ROSA CRISTINA CABRERA MICHEL	ROSA CRISTINA CABRERA MICHEL	AVENIDA OVALO 87-A	MODELO	HERMOSILLO	SONORA	CAMR490820IQ6	-------------	(662)2152315	-------------	83190	------ NO TIENE	CABRERA	MICHEL	ROSA CRISTINA 	AVE OVALO CUAUHTEMOC	MODELO	HERMOSILLO	SONORA 	(662)2152315	papelerialma@hotmail.com	f	0420023236671		0		---------	------------	----------	-------------	-------------	---------------	-----------------	---------------	-------------------	--------------------		-----------------------@hotmail.com	---------------	-------------------	--------------------		papelerialma@hotmail.com	--------------------------	AVE. OVALO CUAUHTEMOC	MODELO	papelerialma@hotmail.com	(662)2152315	------	RUBEN / ROSA CRISTINA	RUBEN 	rreven@hotmail.com	6622 573489	1	--------	PAPELERIA	-----------									----------------	-----------------------	--------------------	-----------------	----------------------	------------------------	--------------------	-----------------------	---------------------	-----------------------	----------------------	------------------------	--------------------	--------------------	------------------------					rfc/scaneo_2014112815341700.pdf	rfc/scaneo_2014112815341700_Rx2UjAb.pdf	rfc/scaneo_2014112815341700_jakG0au.pdf	rfc/scaneo_2014112815341700_gMNtO5Z.pdf	f
815	2014-11-28 19:09:19.017427-05	f		\N	3		\N		\N	\N	25																						f			0																													1																																			f
816	2014-11-29 12:25:26.170589-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
817	2014-12-01 16:38:46.708683-05	t		\N	1	2	4292	PF	0	0	9	LAURA FLORES ALATORRE	CODEV	CONSTITUCION #813	EJIDO MATAMOROS	TIJUANA	BAJA CALIFORNIA	FOAL880627GD1	FOAL880627MBCLLR07	6641881431		22204	WWW.CODEV.MX	FLORES	ALATORRE	LAURA	CONSTITUCION 813	EJIDO MATAMOROS	TIJUANA	BAJA CALIFORNIA	6641881431	CODEVTJ@GMAIL.COM	f	1231105092750		0																				CONSTITUCION 813	EJIDO MATAMOROS	6641881431	INDISTINTO	8AM-5PM	LAURA FLORES	LAURA FLORES ALATORRE	CODEVTJ@GMAIL.COM	6641881431	1	1 AÑO	DESARROLLO DE SOFTWARE, HOSTING Y SOLUCIONES INTEGRADAS	2																												rfc/RFC.jpg	rfc/AcuseAlta.pdf	rfc/IFE.jpg	rfc/ComprobanteDomicilio.pdf	f
818	2014-12-02 10:30:19.556673-05	f		\N	3		\N		\N	\N	21																						f			0																													1																																			f
819	2014-12-02 12:46:28.79067-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
835	2014-12-16 13:32:18.406281-05	f		\N	2	4	4255	PM	0	0	28	DISEÑO Y EQUIPAMIENTOS PROFESIONALES EN INOXIDABLE SA DE CV	DE COCINA	ROBERTO DIAZ RODRIGUEZ 129	CIUDAD INDUSTRIAL	AGUASCALIENTES	AGUASCALIENTES	DEP120820EW1		449 9965950		20290		ALFEREZ	GARCIA	CARLOS	TROJE PABELLON 135	TROJES DE SAN CRISTOBAL	AGUASCALIENTES	AGUASCALIENTES	449 9965950	evar67@yahoo.com.mx	f	0413000609939		0		XXX	XXX	XXX	XXX	EVARISTO GUTIERREZ	LUNES A VIERNES	8AM A 3PM	449 9965950	FACTURA	EVARISTO GUTIERREZ 		evar67@yahoo.com.mx	449 9965950	VIERNES	8AM A 3PM		evar67@yahoo.com.mx	FACTURA	ROBERTO DIAZ RODRIGUEZ 129-C	CIUDAD INDUSTRIAL	449 9965950	LUNES A VIERNES 	8AM A 3PM	EVARISTO GUTIERREZ	EVARISTO GUTIERREZ	evar67@yahoo.com.mx	449 9965950	2	5 años	Cocinas Industriales	40									XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX					rfc/CEDULA_FISCAL_DISEu00D1OS.jpg	rfc/CEDULA_FISCAL_DISEu00D1OS_2.jpg	rfc/IFE_CARLOS.pdf	rfc/2014104499711442_TELMEX_OCT_2014.pdf	f
837	2014-12-16 18:08:54.617401-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
842	2015-01-05 12:02:28.325488-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
845	2015-01-06 14:09:05.729863-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
836	2014-12-16 17:47:49.809021-05	f		\N	2	1	4294	PM	0	0	29	CONDUCTORES TECNOLOGICOS DE JUAREZ SA DE CV	CONDUCTORES TECNOLOGICOS DE JUAREZ SA DE CV	AV PARQUE INDUSTRIAL AZTECAS 1550	PARQUE INDUSTRIAL AZTECA	JUAREZ	CHIHUAHUA	CTJ860423AH0		668-816-01-11		32679		SOTO	LEYVA	MANUEL FRANCISCO	C ABEDULES 1198 PTE	RESIDENCIAL ALAMEDA	AHOME	SINALOA	668-816-01-11	alejandra.gonzalez@sewsus.com.mx	f	0024059559289		0		BANORTE	5019	BANORTE	5019	Alejandra Gonzalez	15-30 dias	9:00-15:00	668-816-01-11	Factura y Orden de Compra	Alejandra Gonzalez		alejandra.gonzalez@sewsus.com.mx	668-816-01-11	Por Calendario	8:00 a 16:00		alejandra.gonzalez@sewsus.com.mx	*	Calle de la Agricultura # 1057	Parque Industrial Ecologico	6688-16-01-07	Lunes a Viernes	8:00 a 16:00	: Alvaro Valenzuela, David Soto, o Alejandra Gonzalez.	Alejandra Gonzalez	alejandra.gonzalez@sewsus.com.mx	668-816-01-11	1	*	MAQUILADORA	*									Compuredes de Los Mochis SA de CV	Los Mochis	Sinaloa	*	(668) 8183433	Cys Computacion 	Los Mochis	Sinaloa	*	668 819 7328	Baleros Bandas y Tornillos SA de CV	Los  Mochis	Sinaloa	*	668 818 5252					rfc/RFC_CONTEC.PDF	rfc/RFC_CONTEC_vNpMHRF.PDF	rfc/Repres._Legal.jpg	rfc/Com_._Domicilio.jpg	f
848	2015-01-07 10:30:17.627041-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
850	2015-01-07 10:53:04.417084-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
820	2014-12-02 14:48:12.852855-05	f		\N	2	2	5320	PM	0	0	25	SEPRO DE CAJEME, S.A DE C.V	SEPRO DE CAJEME, S.A DE C.V	CARRETERA A LA COLORADA KM. 4.5	PARQUE INSDUSTRIAL	HERMOSILLO	SONORA	SCA130325SR2	-------------	251-0972	-------------	83299	------ NO TIENE	PERALTA	TOYOS	IVAN ADOLFO	AV. JESUS GARCIA S/N	LOC. RAYON	RAYON	SONORA 	251-0972	esmeralda.garcia@ricer.com.mx	f	0649054300252		0		---------	------------	----------	-------------	-------------	---------------	-----------------	---------------	-------------------	--------------------		facturacion@ricer.com.mx	---------------	-------------------	--------------------		facturacion@ricer.com.mx	--------------------------	CARRETERA A LA COLORADA KM4.5	PARQUE INDUSTRIAL	2 51-0972	LUNES A SA	------	ESMERALDA GARCÍA 	ESMERALDA GARCIA	esmeralda.garcia@ricer.com.mx	251-0972	1	1 AÑO-	PRESTADORA DE SERVICIOS	15 EMPLEADOS									----------------	-----------------------	--------------------	-----------------	----------------------	------------------------	--------------------	-----------------------	---------------------	-----------------------	----------------------	------------------------	--------------------	--------------------	------------------------					rfc/CEDULA_DE_RFC_SEPRO.pdf	rfc/CEDULA_DE_RFC_SEPRO_LC28KWO.pdf	rfc/IFE_Iván_A__Peralta_Toyos_SEPRO_SA_DE_CV.pdf	rfc/Comprobante_de_Domicilio_SEPRO_SA_DE_CV..jpg	f
821	2014-12-03 11:47:03.414824-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
823	2014-12-03 18:40:01.534858-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
822	2014-12-03 14:24:56.526707-05	f		\N	2	4	4253	PF	0	0	22	Maria Elvira Rojas Avalos	Acuario Imprenta	Av. Aguascalientes 1206-B 	Colinas del Rio	Aguascalientes	Aguascalientes	ROAE520124Q79	ROAE520124MHGJVL01	996-1412		20010		Rojas	Avalos	Maria Elvira	Mitla 120	Piramides	Aguascalientes	Aguascalientes	996-1412	lapurisima@acuarioimprenta.mx	f	0161014554528		0																				Av. Aguascalientes 1206-B	Colinas del Rio	996-1412	Viernes	10 	Miguel Rivera	Vicente Rivera	vrivera@acuarioimprenta.mx	918-0797	2	10	Imprenta	20																												rfc/Scan_RFC_lcSPdPz.pdf	rfc/Scan_REG_FISCAL.pdf	rfc/Scan_IFE_sqtfFT0.pdf	rfc/Scan_Domc.pdf	f
824	2014-12-05 10:26:57.423375-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
142	2014-11-10 15:47:22.571516-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
825	2014-12-08 12:03:33.130222-05	f		\N	2	2	5321	PM	0	0	6	INSTITUTO EDUCATIVO DEL MAYO, A.C.	 	CARRETERA A YAVAROS KM.1	LOS JURIS	HUATABAMPO	SONORA	IEM6212039T6	 	6474260525	 	85977	 	CRUZ	 	CARMEN	 	 	 	 	 	colegio_sonora@yahoo.com.mx	f	 		0		banamex 	72805698	  	 	CARMEN CRUZ	 	 	6474260525	 	CARMEN CRUZ		colegio_sonora@yahoo.com.mx		 	 		colegio_sonora@yahoo.com.mx	 	CARRETERA A YAVAROS KM1	LOS JURIS	6474260525	 	 	CARMEN CRUZ	 CARMEN CRUZ	colegio_sonora@yahoo.com.mx	 	1	 	 	 									 	 	 	 	 	 	 	 	 	 	 	 	 	 	 					rfc/Cu00E9dula_y_datos_facturaciu00F3n_001.jpg	rfc/Cu00E9dula_y_datos_facturaciu00F3n_001_4kN7d2d.jpg	rfc/Cu00E9dula_y_datos_facturaciu00F3n_001_y9HPPXI.jpg	rfc/Cu00E9dula_y_datos_facturaciu00F3n_001_EdKspog.jpg	f
826	2014-12-08 17:00:17.019398-05	t		\N	1	2	5322	DPF	0	0	21	FERNANDO JUVENTINO RAMIREZ TORRES		PERIFERICO PTE 281	RESIDENCIAL DE ANZA	HERMOSILLO	SONORA	RATF780103M7A	RATF780103HSRMRR08	(662)2181845		83248		RAMIREZ	TORRES	FERNANDO JUVENTINO	PERIFERICO PTE 281	RESIDENCIAL DE ANZA	HERMOSILLO	SONORA	(662)2181845	mipchermosillo@hotmail.com	f	0503063449939		0																				*	*	*	*	*	*	FERNANDO JUVENTINO	mipchermosillo@hotmail.com	(662)2181845	1	*	*	*																												rfc/Cedula_Fer.pdf	rfc/ife.docx	rfc/TELMEX090614.jpg	rfc/Cedula_Fer_WfpRtFn.pdf	f
827	2014-12-09 13:20:15.635796-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
828	2014-12-09 13:42:59.545279-05	f		\N	3		\N		\N	\N	7																						f			0																													1																																			f
829	2014-12-09 13:46:43.793263-05	f		\N	3		\N		\N	\N	7																						f			0																													1																																			f
830	2014-12-09 18:20:27.424805-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
343	2014-11-10 15:47:23.899933-05	f		\N	3		\N		\N	\N	19																						f			0																													1																																			f
831	2014-12-11 18:35:52.379357-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
833	2014-12-12 16:53:14.468732-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
832	2014-12-12 13:57:44.937473-05	t		\N	1	2	5324	PM	0	0	21	OFFIZONE SA DE CV	OFFIZONE SA DE CV	GALEANA 114B	CENTENARIO	HERMOSILLO	SONORA	OFF0810192I4	-------------	01(662)213 91 90	217 38 30	83260	------ NO TIENE	MORENO 	RUIZ	ARIEL	C. GALEANA 114	CENTENARIO	HERMOSILLO	SONORA 	2 13 91 91	offizone_ventas@live.com.mx	f	0529023711290		0		---------	------------	----------	-------------	-------------	---------------	-----------------	---------------	-------------------	--------------------		offizone_ventas@live.com.mx	---------------	-------------------	--------------------		offizone_ventas@live.com.mx	--------------------------	GALEANA 114	CENTENARIO	2 13 91 91	LUNES A SA	------	------	------------------------	offizone_ventas@live.com.mx	-----------------------	1	3 AÑOS	-------	-----------									----------------	-----------------------	--------------------	-----------------	----------------------	------------------------	--------------------	-----------------------	---------------------	-----------------------	----------------------	------------------------	--------------------	--------------------	------------------------					rfc/Acta_Constitutiva_OFFIZONE.pdf	rfc/Acta_Constitutiva_OFFIZONE_W2V68j9.pdf	rfc/IFE_OFFIZONE.jpg	rfc/Offizone_comprobante_domicilio.pdf	f
838	2014-12-16 18:24:01.367012-05	f		\N	3		\N		\N	\N	7																						f			0																													1																																			f
839	2014-12-22 17:13:45.445547-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
840	2014-12-22 18:54:57.139463-05	f	jsKJSLBhLHRTDhFeGvUmwFz348qugcFTWgnBJCV6QfZwMmGbUQ	2014-12-22	2	2	5325	PM	0	0	11	PC PLUS TODO MEXICO	*	JUAREZ PORVENIR No. 1590	SATELITE	JUAREZ	CHIHUAHUA	PPT1410072F5	*	656 679 6159	*	32543	*	*	*	*	*	*	*	*	*	carlos_leon@pc-plus.com.mx	f	*		0																				*	*	*	*	*	*	CARLOS LEON	carlos_leon@pc-plus.com.mx	*	1	*	*	*																												rfc/ESTADO_DE_CUENTA_BANCOMER_DLLS.jpg	rfc/CARATUALA_ESTADO_DE_CUENTA_BANCOMER_OCTUBRE_2014.jpg	rfc/CARATULA_ESTADO_DE_CUENTA_BANCOMER_AGOSTO_2014.jpg	rfc/CARATULA_ESTADO_DE_CUENTA_BANCOMER_PESOS_ABRIL_2014.jpg	f
209	2014-11-10 15:47:23.034615-05	f		\N	3		\N		\N	\N	15																						f			0																													1																																			f
862	2015-01-19 16:31:26.231274-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
846	2015-01-06 20:31:50.071111-05	f		\N	2	2	5326	PF	0	0	21	SALVADOR PADILLA TIZNADO	WATER DEPOT HIDROTECNOLOGIA	EJE ROSALES 370	LAS PRADERAS	HERMOSILLO	SONORA	PATS641103QB6	PATS641103HSRDZL02	6622157815	6622157815	83288		PADILLA	TIZNADO	SALVADOR	RTNO DE LOS GRANDES LAGOS 6	VALLE DEL LAGO	HERMOSILLO	SONORA	6623014030	waterdepot01@hotmail.com	f	0524023269136		0																				EJE ROSALES	LAS PRADERAS 	6622157815	15	8-6	GUADALUPE HERNANDEZ	SALVADOR PADILLA	waterdepot01@hotmail.com	6622157815	1	18	VENTA, ASESORIA INSTALACION DE EQUIPO PARA TRATAMIENTO DE AGUA INDUSTRIAL COMERCIAL Y RESIDENCIAL	7																												rfc/RFC_28032011_001.jpg	rfc/RFC_28032011_001_axOjWmO.jpg	rfc/IFE1.pdf	rfc/COMPROBANTE_DOMICILIO.jpg	f
841	2014-12-23 21:16:35.922119-05	t		\N	1	2	4295	PF	0	0	29	CARLOS ALEJANDRO LOAIZA GARCIA	COMPUBROTHER	SANCHO PANZA #75	 LOS ESPAÑOLES	TIJUANA	BAJA CALIFORNIA	LOGC800120IF4	LOGC800120HBCZRR07	664-2600689		22430		LOAIZA	GARCIA	CARLOS	CELESTINO SALCEDO #6	EJIDO MAZATLAN	ROSARITO	BAJA CALIFORNIA	661-6126463	alex_loaiza@outlook.com	f	46551263654		0																				a	a	a	a	a	a	a	alex_loaiza@outlook.com	a	1	6 AÑOS	VENTA DE EQUIPO DE COMPUTO	2																												rfc/IMAG0562.jpg	rfc/IMAG0562_IlJ2YOt.jpg	rfc/IMAG0564.jpg	rfc/IMAG0564_DRRKugQ.jpg	f
852	2015-01-07 16:23:45.627716-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
851	2015-01-07 16:19:58.567252-05	f		\N	3	4	4256	GOB	30	50000	22	INSTITUTO DE VIVIENDA SOCIAL Y ORDENAMIENTO DE LA PROPIEDAD DEL ESTADO AGUASCALIENTES	INSTITUTO DE VIVIENDA	AVE. DE LA CONVENCION ORIENTE 104 	DEL TRABAJO	AGUASCALIENTES	AGUASCALIENTES	IVS110301RL3	XXXX	449-910-2560	XXXX	20180	aguascalientes.gob.mx	MORALES	GALLEGOS	JOSE LUIS	SERVANDO CANALES 11 Y 12	FERRONALES	AGUASCALIENTES	AGUASCALIENTES	XXXX	luis.morales@aguascalientes.gob.mx	f	0110014473215		0		XXXX	XXXX	XXXX	XXXX	JORGE LUIS SAUCEDO FIGUEROA	MARTES	11:00	5558	FACTURA	MARTHA ANGELICA MUÑOZ ELIAS		martha.munoz@aguascalientes.gob.mx	449-910-2560 ext. 5558	MARTES	11:00		martha.munoz@aguascalientes.gob.mx	FACTURA	AVE. DE LA CONVENCION ORIENTE 104	DEL TRABAJO	449-910-2560	LUNES	10:00	TERESA ZARATE	TERESA ZARATE	teresa.zarate@aguascalientes.gob.mx	449-910-2560 ext. 5558	1	15 años	ACTIVIDADES ADMINISTRATIVAS ESTATALES DE INSTITUCIONES DE BIENESTAR SOCIAL	50									XXXX	XXXX	XXXX	XXXX	XXXX	XXXX	XXXX	XXXX	XXXX	XXXX	XXXX	XXXX	XXXX	XXXX	XXXX					rfc/Scan_RFC_8rlItv8.pdf	rfc/Scan_ESCRI.pdf	rfc/Scan_IFE_7daMb5B.pdf	rfc/Scan_COMPR_DOMIC.pdf	f
577	2014-11-10 15:47:25.448067-05	f		\N	3		\N		\N	\N	15																						f			0																													1																																			f
853	2015-01-08 11:43:19.867851-05	f		\N	3		\N		\N	\N	19																						f			0																													1																																			f
854	2015-01-08 14:16:52.512861-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
855	2015-01-09 14:16:07.130343-05	f		\N	2	4	4257	PM	30	100000	28	UNIVERSIDAD AUTONOMA DE AGUASCALIENTES	UAA	AV. UNIVERSIDAD #940 EDF 26	CD. UNIVERSITARIA	AGUASCALIENTES	AGUASCALIENTES	UAA740224TQ2	XXX	449-9107484		20131	www.uaa.mx	xxx	xxx	xxx	xxx	xxx	xxx	xxx	xxx	carevalomx@gmail.com	f	xxx		0		XXX	3701	XXX	XXX	xxx	xxx	xxx	xxx	XXX	CARLOS AREVALO		carevalomx@gmail.com	449- 9107484	VIERNES	9AM A 2PM		carevalomx@gmail.com	FACTURA	AV. UNIVERSIDAD S/N	CD. UNIVERSITARIA	449-9107484	LUNES A VIERNES 	9AM A 2PM	CARLOS AREVALO	MARIA DEL PILAR GUTIERREZ JUAREZ	mpgutier@correo.uaa.mx	9107484	1	40 AÑOS	EDUCACION	500									XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX					rfc/RFC_qBra4Or.jpg	rfc/ALTA_HACIENDA.jpg	rfc/ID.jpg	rfc/COMPROBANTE.jpg	f
856	2015-01-10 12:41:03.993425-05	f		\N	2	2	\N		\N	\N	\N	MARCO ANTONIO MELENDEZ PIÑON	POWER PC	CALLE 21 NUMERO 50	EL SOL	NEZAHUALCOYOTL	DE MEXICO	MEPM770921SW9	MEPM770921HMCLXR06	5558569130	645 3315724	57200	www.power-pc.com.mx	MELENDEZ	PIÑON	MARCO ANTONIO	PRIVADA DE ANZA NUMERO 10 	ESTADIO	CANANEA	SONORA	6453323038	marcoantonio.melendez@power-pc.com.mx	f	0081046914402		0		BANAMEX	9170479871	BANCOMER	27647813	Nohemi 	Jueves	9:00 a 5:00	6453323038	facturas	Nohemi sanchez		power-pc@live.com	6453323038	Martes	10:00		power-pc@live.com	factura	N/A	N/A	N/A	N/A	N/A	N/A	MARCO ANTONIO MELENDEZ	power-pc@live.com	6453323038	1	15 años	Tecnologias Avanzadas	10									SAYERS SELLNOW	Vernon Hills	IL	Luis Gonzales	847-391-4085	INTCOMEX	Progreso # 172 Col. Escandón, México, D. F.  C.P. 11800   	DE MEXICO	Beatriz Quiroz	55-5278-9901  xt. 1139 	SYSCOM	Ave. 20 de Noviembre No. 805, Chihuahua, Chih. 31000 	CHIHUAHUA	Juan Luis Ramírez Martínez	01 (800) 7-11-62-70 EXT 2141					rfc/vARIOS.pdf	rfc/vARIOS_wxTmYIX.pdf	rfc/Elector.pdf	rfc/comprobante.xps	f
857	2015-01-12 19:09:17.705069-05	f		\N	2	1	4296	PM	30	30000	29	BOSE CORPORATION SA DE CV		CHILPANCINGO 52	EJIDO CHILPANCINGO	TIJUANA	BAJA CALIFORNIA	BCO981214SH8		664-979-40-00 		22446		**	**	**	**	**	**	**	**	Sofia_Amavizca@bose.com	f	**		0		SANTANDER	65-5005-56079	SANTANDER	65-5005-56079	Liliana Castañeda	**	**	664-979-4000 ext. 74083	Factura	Liliana Castañeda		Sofia_Amavizca@bose.com	664-979-4000 ext. 74083	VIERNES	TRANSFERENCIA		ap_tijuana@bose.com	Factura	**	**	**	**	**	**	Sofia Amavizca 	Sofia_Amavizca@bose.com	(664)979-4000 EXT 74020	1	**	**	**									OFICLUB	TIJUANA	BAJA CALIFORNIA	MA. ISABEL GASPAR	664-200-2829	ULINE	TIJUANA	BAJA CALIFORNIA	SERVICIO AL CLIENTE	664-647-2045	DLR AUTOTRANSPORTES	TIJUANA	BAJA CALIFORNIA	EDNA ALVAREZ	686-561-9527					rfc/CEDULA_RFC.pdf	rfc/CEDULA_RFC_77FEnH9.pdf	rfc/CEDULA_RFC_2l6HiJK.pdf	rfc/CFE.PDF	f
405	2014-11-10 15:47:24.27812-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
774	2014-11-10 15:47:26.982941-05	f		\N	3		\N		\N	\N	12																						f			0																													1																																			f
858	2015-01-16 13:00:38.393203-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
859	2015-01-19 10:59:28.289801-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
860	2015-01-19 13:11:06.158285-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
861	2015-01-19 14:13:59.610989-05	t		\N	1	2	5329	DPM	0	0	21	JORGE ANDRES CUEVAS PONCE	PC MASTERS	MINA #105 PTE.	REFORMA	NAVOJOA	SONORA	CUPJ740405NU2		(642) 422-7022		85830		CUEVAS	PONCE	JORGE ANDRES	TOLEDO #306	REFORMA	NAVOJOA	SONORA	(642) 422-7022	coquicuevas@hotmail.com	f	1234063427889		0		HSBC	4033567512	SANTANDER SERFIN	60509865613	JORGE CUEVAS	JUEVES	10AM-5PM	(642) 422-7022	FACTURA ORIGINAL	JORGE CUEVAS		coquicuevas@hotmail.com	(642) 422-7022	LUNES-VIERNES	10AM-5PM		facturaspcmasters@hotmail.com	FACTURA ORIGINAL	TOLEDO #306	REFORMA	(642) 422-7022	LUNES A SABADO	10AM-7PM	JORGE CUEVAS	JORGE CUEVAS	coquicuevas@hotmail.com	(642) 422-7022	1	12 AÑOS	COMPUTO Y CCTV	3									CT INTERNACIONAL DEL NOROESTE	OBREGON	SONORA	ADRIANA GONZALEZ	(644) 412-1501	CORPORATIVO INALARM	HERMOSILLO	SONORA	JUAN CARLOS GUTIERREZ	(662) 285-7655	CALCOM DE MEXICO	OBREGON	SONORA	ALICIA ESQUER	(644) 416-9580					rfc/cedula_fiscal.jpg	rfc/Formato_R1-1.jpg	rfc/IFE_XMzP49O.jpg	rfc/CFE_FEB_2014.jpg	f
864	2015-01-21 14:35:33.475189-05	f		\N	3	4	4258	GOB	15	50000	28	COMPLEJO TRES CENTURIAS	FICOTRES	28 DE AGOSTO S/N	BARRIO DE LA ESTACION	AGUASCALIENTES	AGUASCALIENTES	CTC0301164U2	XXX	(449) 9162216	XXX	20289	XXX	ANDRADE	MUÑOZ	JESUS MARTIN	C MONTE EVEREST 504	LOS BOSQUES	AGUASCALIENTES	AGUASCALIENTES	(449) 9162216	fernando.paredes@aguascalientes.gob.mx	f	00450144800328		0		XXX	XXX	XXX	XXX	FERNANDO PAREDES	JUEVES Y VIERNES	8AM A 3PM	(449) 9162216 EXT 115	FACTURA	LIC. RICARDO REYNOSO		ricardo.reynoso@aguascalientes.gob.mx	(449) 9162216	VIERNES	9AM A 2PM		fernando.paredes@aguascalientes.gob.mx	FACTURA	28 DE AGOSTO S/N	BARRIO DE LA ESTACION	(449) 9162216	LUNES A VIERNES 	8AM A 3PM	FERNANDO PARADES	FERNANDO PAREDES	fernando.paredes@aguascalientes.gob.mx	(449) 9162216	1	20 AÑOS	GOBIERNO	100									XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX					rfc/RFC_AEKgGYb.jpg	rfc/ALTA.jpg	rfc/IFE_UdRwuXB.jpg	rfc/COMPROBANTE_DOM.jpg	f
865	2015-01-22 13:27:12.723186-05	f		\N	3		\N		\N	\N	14																						f			0																													1																																			f
866	2015-01-22 16:59:24.738554-05	f		\N	2	4	4259	PM	0	0	28	OBARA MEXICO S DE RL DE CV	OBARA	ROBERTO DIAZ RODRIGUEZ 212	CIUDAD INDUSTRIAL	AGUASCALIENTES	AGUASCALIENTES	OME021010563	XXX	449-9711524	XXX	20290	XXX	xxx	xxx	xxx	xxx	xxx	xxx	xxx	xxx	arturo.correa@obara.com.mx	f	xxx		0		xxx	xxx	xxx	xxx	LUPITA NIEVES DIAZ	LUNES A VIERNES	8AM A 5PM	449-9711524	FACTURA	LUPITA NIEVES DIAZ		lupita.nieves@obara.com.mx	449-9711524  Ext. 111	LUNES A VIERNES	8AM A 5PM		lupita.nieves@obara.com.mx	FACTURA	ROBERTO DIAZ RODRIGUEZ 212	CIUDAD INDUSTRIAL	449-9711524	LUNES A VIERNES 	8AM A 5PM	ANTON ARAUJO, ARTURO CORREA	ARTURO CORREA	arturo.correa@obara.com.mx	449-196-26-77	1	15 AÑOS	PIEZAS DE RESISTENCIA PARA LA INDUSTRIA AUTOMOTRIZ	50									XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX					rfc/RFC_Eta4oB2.jpg	rfc/ALTA_HACIENDA_6SATB6U.jpg	rfc/REP.jpg	rfc/DOM.jpg	f
511	2014-11-10 15:47:25.024477-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
867	2015-01-27 13:07:11.76852-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
868	2015-01-29 19:25:11.21528-05	f		\N	3		\N		\N	\N	7																						f			0																													1																																			f
870	2015-02-03 10:35:19.64608-05	t		\N	1	2	4298	PF	0	0	20	JULIAN MIGUEL JUAREZ		CALLE OLIVO #19013	MIRADOR CAPISTRANO	TIJUANA	BAJA CALIFORNIA	MIJJ9011266GA	MIJJ901126HBCGRL06	664 627-0913	664/389-5955	22223		JULIAN 	MIGUEL 	JUAREZ	CALLE OLIVO #19013	MIRADOR CAPISTRANO	TIJUANA	BAJA CALIFORNIA	664 627-0913	julian.miguel@outlook.com	f	1160118161369		0						JULIAN JUAREZ	.	.	.	.	JULIAN JUAREZ		julian.miguel@outlook.com	.	.	.		julian.miguel@outlook.com	.	.	.	.	.	.	JULIAN JUAREZ	JULIAN JUAREZ	julian.miguel@outlook.com	.	1	.	.	.									.	.	.	.	.	.	.	.	.	.	.	.	.	.	.					rfc/SAT.pdf	rfc/SAT_1.pdf	rfc/CCI15092014_0003.jpg	rfc/CCI15092014_0004.jpg	f
871	2015-02-04 17:50:15.954761-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
869	2015-02-02 19:56:06.325479-05	t		\N	1	2	4299	PF	0	0	9	Ubaldo Hiram Ramirez Villegas	Soluciones Comerciales	San Blas 6	Lomas Hipodromo	Tijuana	Baja California	RAVU701111PI8	RAVU701111HBCMLB07	664 5050 676		22030		Ramirez	Villegas	Ubaldo Hiram	San Blas 6	Lomas Hipodromo	Tijuana	Baja California	664 5050 676	plataformascomerciales@gmail.com	f	0959072431786		0		Banamex	5256 7814 8340 5291	Bancoppel	4008 1902 5196 6936	Ubaldo Hiram Ramirez Villegas	Lunes a Sabado	7.00 AM a 8:00 PM	664 5050 676	Factura	Ubaldo Hiram Ramirez Villegas		plataformascomerciales@gmail.com	664 5050 676	Lunes	7.00 AM a 8:00 PM		plataformascomerciales@gmail.com	Factura	San Blas 6	Lomas Hipodromo	664 5050 676	Lunes a Sabado	7.00 AM a 10:00 PM	Ubaldo Hiram Ramirez Villegas	Ubaldo Hiram Ramirez Villegas	plataformascomerciales@gmail.com	664 5050 676	1	44 Años	Venta de Equipo de Computo y Accesorios.	3									Refrigeracion Baja	Tijuana	Baja California	Manuel Gonzalez Oleta	664  698 7411	PuertaMatica	Tijuana	Baja California	Alberto Ortiz Gonzalez	664 119 6652	Xpress Industrial	Tijuana	Baja California	Sabino Rendon Montaño	664 204 4840					rfc/Cedula_de_Identificacion_Fiscal_-_Ubaldo_Hiram_Ramirez_Villegas.jpg	rfc/Constancia_de_Alta_en_SAT-_Ubaldo_Hiram_Ramirez_Villegas..jpg	rfc/CREDENCIAL_IFE_-_ANVERSO_-_UBALDO_HIRAM_RAMIREZ_VILLEGAS.jpg	rfc/Comprobante_de_Domicilio_-_Ubaldo_Hiram_Ramirez_Villegas.jpg	f
884	2015-02-19 17:41:10.605534-05	f		\N	2	2	5338	PM	20	50000	12	CORP MAX DEL NOROESTE SA DE CV 		IGNACIO ZARAGOZA SUR 1000 #110	CENTRO 	MONTERREY 	NUEVO LEON 	CMN130516HI0	*	662 2805070	*	64000	*	*	*	*	*	*	*	*	*	sistemashmo1@legaxxi.com	f	*		0		*	*	*	*	KAREN MONTAÑO 	LUNES A VIERNES 	9 A 3	662 2895070	FACTURA	ERNESTO MORENO 		emoreno@legaxxi.com	662 2895070 EXT 118	VIERNES	9AM A 2PM		cobrafactura@hotmail.com	FACTURA	*	*	*	*	*	*	KAREN MONTAÑO 	sistemashmo1@legaxxi.com	662 2895070	1	2	COBRANZA	*									*	*	*	*	*	*	*	*	*	*	*	*	*	*	*					rfc/CEDULA_CORP_MAX.pdf	rfc/CEDULA_CORP_MAX_rVdZbG4.pdf	rfc/CEDULA_CORP_MAX_rcTM3Yk.pdf	rfc/CEDULA_CORP_MAX_lypSVVE.pdf	f
885	2015-02-20 13:48:10.210644-05	t		\N	1	2	\N		\N	\N	\N	911 TELECOM S DE RL DE CV	911 TELECOM	BLVD. DIAZ ORDAZ #12415	EL PARAISO	TIJUANA	BAJA CALIFORNIA	NOT140401457	N7A	3806119		22106	WWW.911TELECOM.MX	MONDACA	ARENAS	GRACIELA	C DE LOS FRAILES #7116-J24	RESIDENCIAL AGUA CALIENTE	TIJUANA	BAJA CALIFORNIA	3806119	CONTACTO@911TELECOM.MX	f	0973024658675		0		BANCOMER	0196044697	N/A	N/A	RUBEN HERNANDEZ	LUNES	1:00 -2:00 PM	3806119	FACTURA	GLORIA CARRILLO		gloria.carrillo@911telecom.mx	3806119	viernes	10:00 am - 1:00 pm		gloria.carrillo@911telecom.mx	factura	N/A	N/A	N/A	N/A	N/A	N/A	N/A	CONTACTO@911TELECOM.MX	N/A	2	2 años	telecomunicaciones	6									TVC EN LINEA. COM	TIJUANA	BAJA CALIFORNIA	MARIO ORTIZ	250-01-66 ext. 2700	SYSCOM	TIJUANA	BAJA CALIFORNIA	JESUS MACHUCA	1045421	SAINTBLUE	TIJUANA	BAJA CALIFORNIA	ROBERTO ROMERO	681-71-74 ext. 101					rfc/RFC.doc	rfc/Acta_Constitutiva_y_alta_ante_Hacienda_911Telecom.pdf	rfc/ID_Rep_Legal.pdf	rfc/LUZ_DICIEMBRE.pdf	f
872	2015-02-05 10:47:06.418-05	f		\N	2	2	\N		\N	\N	\N	CONCEPCIÓN PACHECO GARCÍA	PROVEEDORA DE LAS ARTES GRÁFICAS	GUADALUPE VICTORIA 74	SAN BENITO	HERMOSILLO	SONORA	PAGC371208P53	PAGC371208MSRCRN09	(662)2147247 / 2 15-77-72	-------------	83190	www.proveedoradelasartesgraficas.com	PACHECO	GARCIA	MARIA CONCEPCION	AV, JOSE SSANTIAGO HEALY 36	MODELO	HERMOSILLO	SONORA 	(662)2147247 / 2 15-77-72	facturas@proveedoradelasartesgraficas.com	f	0441023265071		0		BANCO NACIONAL DE MEXICO, S.A.	81164-2 SUC. 363	BANCOMER, S.A.	0444115090 SUC 5803	CP ALEJANDRA IBARROLA	---------------	-----------------	215 78 78	-------------------	CP MARIA JESUS IRIQUI		facturas@proveedoradelasartesgraficas.com	2147247	-------------------	--------------------		facturas@proveedoradelasartesgraficas.com	--------------------------	GUADALUPE VICTORIA 74 	SAN BENITO	:  215.78.78, 214.72.47 Y 210.33.68	LUNES A SA	------	MARTHA ISELA ISLAS PACHECO	CP MARTHA ISELA ISLAS PACHECO	facturas@proveedoradelasartesgraficas.com	2157878	1	38 AÑOS	compra venta de equipos y materiales para Imprentas, Serigrafistas y Papelerias	20 EMPLEADPS									ACCO MEXICANA, S.A. DE C.V.	MEXICO	DISTRITO FEDERAL	-----------------	TEL. (55) 15005700 FAX (55) 15005702	COLOR TECHNOLOGY INTERNACIONAL,S.A C.V	MEXICO 	DISTRITO FEDERAL	---------------------	TELS: (55)5649-9738 FAX: 5649-4599	CONVERTIDORA M.G. S.A. DE C.V.	GUADALAJARA	JALISCO	--------------------	TEL: (33) 3618-7094 FAX: 3617-9668					rfc/registro_sat_CPG.jpg	rfc/alta_hacienda_CPG_frente.jpg	rfc/identificaciones_CPCEICLGIPMIIP.jpg	rfc/COMPROBANTE_DOMICILIO_CPG.jpg	f
873	2015-02-06 14:36:04.666736-05	f		\N	2	2	1398	PM	20	20000	12	UNIVERSIDAD TECNOLOGICA DE HERMOSILLO 	*	BLVD. DE LOS SERIS 	PARQUE INDUTRIAL 	HERMOSILLO 	SONORA	UTH981009NE1	*	662 251 1101	*	83299	*	*	*	*	*	*	*	*	*	correofiscal@uthermosillo.edu.mx	f	*		0		*	*	*	*	MARTHA ACOSTA ARVIZU 	LUNES A VIERNES 	9 A 3	662 251 1101 EXT. 112	FACTURA	MARTHA ACOSTA ARVIZU 		contabilidad@uthermosillo.edu.mx	662 251 1101 EXT.112	*	*		correofiscal@uthermosillo.edu.mx	FACTURA	*	*	*	*	*	*	JESUS ABRAHAM TANORI OCHOA	compras@uthermosillo.edu.mx	662 251 1101 EXT.120	1	17 AÑOS	EDUCACION 	*									*	*	*	*	*	*	*	*	*	*	*	*	*	*	*					rfc/cedula_uth.pdf	rfc/cedula_uth_dWFfHcJ.pdf	rfc/recibo_de_luz_uth.pdf	rfc/recibo_de_luz_uth_RJ2oNNc.pdf	f
874	2015-02-06 18:50:23.569458-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
875	2015-02-11 14:50:47.882456-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
712	2014-11-10 15:47:26.505698-05	f		\N	3		\N		\N	\N	19																						f			0																													1																																			f
876	2015-02-11 18:20:28.001752-05	f	GhC7FGnjtQ543B5RmFXyJfzvvhN495CTn4JRq2zbRvUzf5ZvyP	2015-02-11	2	2	\N		\N	\N	\N	ACUICOLA SELECTA	ACUICOLA SELECTA SA DE CV 	PEDRO VILLEGAS #12	CENTRO 	HERMOSILLO 	SONORA	ASE001115EN2		662 2137058		83000	rendon@selecta.com.mx	*	*	*	*	*	*	*	*	carlos.okamura@selecta.com.mx	f	*		0		BANCOMER	9542	BANCOMER	9542	FERNANDO RENDON 	LUNES	3 a5	662 2137058	FACTURA 	CARLOS OKAMURA		carlos.okamura@selecta.com.mx	662 2137058	lunes 	3 a 5		facturacion.selectalabor@selecta.com.mx	FACTURA	PEDRO VILLEGAS # 12	CENTRO 	662 2137058	LUNES A VIERNES	8 A 4	MINERVA 	MINERCA PAYAN 	compras@selecta.com.mx	662 2173002	1	*	*	*									*	*	*	*	*	*	*	*	*	*	*	*	*	*	*					rfc/3211_TWB_DE_MEXICO.pdf	rfc/186376_CH_-_HM13704.pdf	rfc/186376_CH_-_HM13704_OxtBGH0.pdf	rfc/ALTA_AGUASCELIENTES.pdf	f
644	2014-11-10 15:47:25.965543-05	f		\N	3		\N		\N	\N	12																						f			0																													1																																			f
877	2015-02-17 12:19:27.186032-05	f		\N	2	2	5335	PM	15	30000	6	INSTITUTO MEXICANO DE EJECUTIVOS DE FINANZAS AC	IMAF	PATRICIO SANZ No. 1516	DEL CALLE	DEL. BENITO JUAREZ	DISTRITO FEDERAL	IME6109213M3	*	55 9151 5100	*	03100		*	*	*	*	*	*	*	*	jorgegonzalez@compuproveedores.com	f	*		0		SCOTIABANK	2088	*	*	*	*	*	*	*	JORGE GONZALEZ GAITAN		jorgegonzalez@compuproveedores.com	*	AL VENCIMIENTO	AL VENCIMIENTO		jorgegonzalez@compuproveedores.com	ARCHIVOS 	*	*	*	*	*	*	*	jorgegonzalez@compuproveedores.com	*	1	*	*	*									*	*	*	*	*	*	*	*	*	*	*	*	*	*	*					rfc/FACTURA_AS969.pdf	rfc/FACTURA_AS851.pdf	rfc/FACTURA_AS528.pdf	rfc/FACTURA_AS599.pdf	f
879	2015-02-17 13:44:57.193732-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
880	2015-02-17 14:02:38.109119-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
878	2015-02-17 12:59:50.111168-05	f		\N	2	3	5336	PM	0	0	21	OC DEL NOROESTE SA DE CV		ALTURAS DEL SUR 5250	ALTURAS DEL SUR	CULIACAN 	SINALOA	ONO120706BE5		(667)2609822		80295		BOTELLO	CORRAL	DAVID	CONST JUAN DE DIOS BOJORQUEZ 3564	PASEO DE LOS ARCOS	CULIACAN 	SINALOA	(667)2609822	ocdelnoroeste2013@hotmail.com	f	1169063234249		0																				ALTURAS DEL SUR 5250	ALTURAS DEL SUR	(667)2609822	L-V	8AM A 5PM	DAVID BOTELLO	DAVID BOTELLO	ocdelnoroeste2013@hotmail.com	(667)2609822	1	*	*	*									*	*	*	*	*	*	**	*	*	*	*	*	*	*	*					rfc/COMPROBANTE_DE_DOMICILIO.jpg	rfc/ALTAHAC23OCT2014.jpg	rfc/IFE_vdRT1vO.jpg	rfc/rfc-oc_del_noroeste_s.a._de_cv.jpg	f
881	2015-02-17 14:41:36.034038-05	f		\N	2	2	\N		\N	\N	\N	PATRICIA EUGENIA MORLET MARTINEZ		SAN MIGUEL 66 A	SAN ANTONIO	HERMOSILLO	SONORA	MOMP480405UH5		***		83260		NEVAREZ	DEL BOSQUE	JOSE FRANCISCO JAVIER	CENTENARIO NORTE 167	SAN ANTONIO	HERMOSILLO	SONORA	**	productoscapitannemo@yahoo.com.mx	f	0519025040461		0																				SAN MIGUEL 66 A	SAN ANTONIO	**	L-V	8AM A 5PM	NEVAREZ JOSE	JOSE NEVAREZ	productoscapitannemo@yahoo.com.mx	**	1	*	*	*																												rfc/ALTAHAC23OCT2014_5UxPkHg.jpg	rfc/CFE12FEB2015.jpg	rfc/IFE12FEB2015.jpg	rfc/ALTAHAC23OCT2014_xViIACf.jpg	t
882	2015-02-17 15:14:04.155643-05	f		\N	2	4	\N		\N	\N	\N	MULTISERVICIOS ESPECIALIZADOS MORITA SA DE CV	GASOLINERAS MORITA	JUAN CARLOS #119	PARQUE INDUSTRIAL SIGLO XXI	AGUASCALIENTES	AGUASCALIENTES	MEM950621UV5	XXX	9710080	XXX	20290	http://www.morita.com.mx/	xxx	xxx	xxx	xxx	xxx	xxx	xxx	xxx	alejandrofaz@morita.com.mx	f	xxx		0		XXX	XXX	XXX	XXX	ALEJANDRO FAZ	LUNES A VIERNES	9AM A 2PM	9710616	FACTURA	ALEJANDRO FAZ		alejandrofaz@morita.com.mx	449 147 46 90 	LUNES A VIERNES	9AM A 2PM		alejandrofaz@morita.com.mx	XXX	JUAN CARLOS 119	PARQUE INDUSTRIAL SIGLO XXI	449 147 46 90 	LUNES A VIERNES 	9AM A 2PM	ALEJANDRO FAZ	ALEJANDRO FAZ	alejandrofaz@morita.com.mx	9710080	1	10 AÑOS	COMERCIO AL POR MENOR DE GASOLINA Y DISEL	100									XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX					rfc/CEDULA_RFC_MORITA.pdf	rfc/RFC.pdf	rfc/IFE.pdf	rfc/DOMICILIO.pdf	t
883	2015-02-17 16:53:13.027385-05	f		\N	3		\N		\N	\N	14																						f			0																													1																																			f
919	2015-03-26 18:22:09.918397-04	f		\N	2	2	5351	TEC	15	50000	12	INSTITUTO TECNOLOGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY 		BLVD. FELIPE ANGELES # 2003	VENTA PRIETA	PACHUCA DE SOTO 	HIDALGO 	ITE430714KI0	*	0181 8850-8500 	*	42080	*	*	*	*	*	*	*	*	*	compras.csa@itesm.mx	f	*		0		BANCOMER	8878	BANCOMER	8878	PORTAL	LUNES A VIERNES 	9 A 3	0181 88508500 	FACTURA	PORTAL		compras.csa@itesm.mx	0181 88508500	VIERNES	9AM A 2PM		compras.csa@itesm.mx	FACTURA	BLVD. FELIPE ANGELES #2003	VENTA PRIETA	771 7171881	LUNES A VIERNES	9 A 3	OCTAVIO LEAL 	JOSEFINA AURORA DE LA TORRE	josefina@itesm.mx	0181 88508500 Ext. 3533	1	30	EDUCACION 	*									*	*	*	*	*	*	*	*	*	*	*	*	*	*	*					rfc/RFC_cambio_domicilio.pdf	rfc/RFC_ITESM.pdf	rfc/Comprobante_domicilio_Telmex.pdf	rfc/RFC_cambio_domicilio_GesC8V3.pdf	f
886	2015-02-20 14:04:22.143396-05	f		\N	2	1	4300	PM	0	0	29	CIENCIAS ARTES Y LETRAS DE MEXICO PARA LA EDUCACION CONTEMPORANEA AC	UNIVERSIDAD XOCHICALCO	RAMPA YUMALINDA # 4850	CHAPULTEPEC ALAMAR MESA                  	TIJUANA	BAJA CALIFORNIA	CAL790123KP1		621-3550 EXT. 228 Y 108 		22110	www.xochicalco.edu.mx	OJEDA	GASTELUM	ALONSO	RAMPA YUMALINDA 	CHAPULTEPEC ALAMAR MESA 	TIJUANA	BAJA CALIFORNIA	6646213550 EXT 105	avalenzuela@correo.xochicalco.edu.mx	f	N/A		0		SANTANDER	#466	SANTANDER	#466	LIC. DENISSE VALENZUELA	LUNES	9:00 - 14:00	621-3550 EXT. 228 Y 108 	TODAS LAS FACTURAS DEBEN CONTAR CON SU RESPECTIVA ORDEN DE COMPRA CON FIRMAS DE AUTORIZACIÓN	LIC. DENISSE VALENZUELA		avalenzuela@correo.xochicalco.edu.mx	621-3550 EXT. 228 Y 108 	VIERNES	16:00 - 19:00		facturastij@correo.xochicalco.edu.mx	TODAS LAS FACTURAS DEBEN CONTAR CON SU RESPECTIVA ORDEN DE COMPRA CON FIRMAS DE AUTORIZACIÓN	RAMPA YUMALINDA # 4850	CHAPULTEPEC ALAMAR MESA	6213550 EXT.153	LUNES A VIERNES	9:00-14:00 Y 	ALFREDO ARRIASOLA	ALEJANDRO OROZCO	alejandroorozco@correo.xochicalco.edu.mx	6213550 EXT 222	1	3 AÑOS	UNIVERSIDAD	450									Abastecedora Industrial S.A de C.V	TIJUANA	BAJA CALIFORNIA	ELVIRA QUEZADA	(664) 625-89-90 y (664) 625-89-92	Quiacsa de Mexico SA de CV	TIJUANA	BAJA CALIFORNIA	JAVIER GUZMAN	(664)104-85-81 y  664-120-35-30	Jesus Salvador Maciel Hernandez	TIJUANA	BAJA CALIFORNIA	N/A	664634 3500					rfc/RFC_Dirección_Tijuana.doc	rfc/RFC_Dirección_Tijuana_m6OG4St.doc	rfc/R2_XOCHICALCO_Kalmecac.pdf	rfc/CFE_Diciembre_2015.pdf	f
887	2015-02-23 10:54:01.142147-05	f		\N	2	2	5339	PM	30	30000	19	AGRICOLA LOS TITANES SA DE CV 		BLVD. JESUS GARCIA MORALES SN 	SAHUARO 	HERMOSILLO	SONORA	ATI031028ND8	*	662 1094000		83178	*	*	*	*	*	*	*	*	*	eacosta@superllantas.com.mx	f	*		0		BAJIO	3603	BAJIO 	3603	*	*	*	*	*	EDUARDO ACOSTA		eacosta@superllantas.com.mx	662 1094000	VIERNES	*		eacosta@superllantas.com.mx	FACTURA	*	*	*	*	*	*	EDUARDO ACOSTA	eacosta@superllantas.com.mx	662 1090000	1	13	AGRICOLA	*									*	*	*	*	*	*	*	*	*	*	*	*	*	*	*					rfc/RFC_AGRICOLA.pdf	rfc/RFC_AGRICOLA_qhFXlr6.pdf	rfc/RFC_AGRICOLA_7q5HMnU.pdf	rfc/RFC_AGRICOLA_VV1yUS1.pdf	f
889	2015-02-23 11:15:17.736897-05	f		\N	2	2	\N		\N	\N	\N	INSTITUTO TECNOLOGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY 		VIA ATLIXCAYOTL #2301	RESERVA TERRITORIAL ATLIXCAYOTL	MONTERREY 	NUEVO LEON 	ITE430714KI0	*	01222 3032000	*	72453	www.itesm.mx	*	*	*	*	*	*	*	*	compras.csa@itesm.mx	f	*		0		BANCOMER	8878	BANCOMER	8878	ANA GABRIELA NUNGARAY 	LUNES A VIERNES 	9 A 3	01222 3032000 EXT. 2264	FACTURA	PORTAL		compras.csa@itesm.mx	0181 88508500	JUEVES 	*		compras.csa@itesm.mx	FACTURA	VIA ATLIXCAYOTL # 2301	RESERVA TERRITORIAL ATLIXCAYOTL	01222 3032000	LUNES A VIERNES	9 A 3	ALINE CHAVEZ	ANA GABRIELA JUAREZ 	gjuarezn@itesm.mx	01222 3032000 ext. 2264	1	14	EDUCACION 	*									*	*	*	*	*	*	*	*	*	*	*	*	*	*	*					rfc/Pedido_7000650190_Compuproveedores_Campus_Puebla_2.pdf	rfc/Pedido_7000650190_Compuproveedores_Campus_Puebla_2_s0YECEn.pdf	rfc/Pedido_7000650190_Compuproveedores_Campus_Puebla_2_xPHefad.pdf	rfc/Pedido_7000650190_Compuproveedores_Campus_Puebla_2_peemUre.pdf	f
890	2015-02-23 11:17:22.128877-05	f		\N	2	2	\N		\N	\N	\N	NSTITUTO TECNOLOGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY 	INSTITUTO TECNOLOGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY 	VIA ATLIXCAYOTL #2301	RESERVA TERRITORIAL ATLIXCAYOTL	MONTERREY 	NUEVO LEON 	ITE430714KI0	*	01222 3032000	*	72453	www.itesm.mx	*	*	*	*	*	*	*	*	compras.csa@itesm.mx	f	*		0		BANCOMER	8878	BANCOMER	8878	ANA GABRIELA NUNGARAY 	LUNES A VIERNES 	9 A 3	01222 3032000 EXT. 2264	FACTURA	PORTAL		compras.csa@itesm.mx	0181 88508500	JUEVES 	*		compras.csa@itesm.mx	FACTURA	VIA ATLIXCAYOTL # 2301	RESERVA TERRITORIAL ATLIXCAYOTL	01222 3032000	LUNES A VIERNES	9 A 3	ALINE CHAVEZ	ANA GABRIELA JUAREZ 	gjuarezn@itesm.mx	01222 3032000 ext. 2264	1	14	EDUCACION 	*									*	*	*	*	*	*	*	*	*	*	*	*	*	*	*					rfc/Pedido_7000650190_Compuproveedores_Campus_Puebla_2_8aZV5UG.pdf	rfc/Pedido_7000650190_Compuproveedores_Campus_Puebla_2_8mfxwtL.pdf	rfc/Pedido_7000650190_Compuproveedores_Campus_Puebla_2_hOdjIxN.pdf	rfc/Pedido_7000650190_Compuproveedores_Campus_Puebla_2_9UBvghW.pdf	f
888	2015-02-23 11:05:02.153217-05	f		\N	2	2	5334	TEC	15	50000	12	INSTITUTO TECNOLOGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY 		VIA ATLIXCAYOTL #2301	RESERVA TERRITORIAL ATLIXCAYOTL	PUEBLA	MEXICO 	ITE430714KI0	*	01222 3032000	*	72453	www.itesm.mx	*	*	*	*	*	*	*	*	gjuarezn@itesm.com	f	*		0		BANCOMER	8878	BANCOMER	8878	ANA GABRIELA NUNGARAY 	LUNES A VIERNES 	9 A 3	01222 3032000 EXT. 2264	FACTURA	PORTAL		compras.csa@itesm.mx	01222 3032000	JUEVES 	*		compras.csa@itesm.mx	FACTURA	VIA ATLIXCAYOTL # 2301	RESERVA TERRITORIAL ATLIXCAYOTL	01222 3032000	LUNES A VIERNES	9 A 3	ALINE CHAVEZ	ANA GABRIELA JUAREZ 	gjuarezn@itesm.mx	01222 3032000 ext. 2264	1	15	EDUCACION 	*									*	*	*	*	*	*	*	*	*	*	*	*	*	*	*					rfc/PEDIDO_7000648381.pdf	rfc/PEDIDO_7000648381_XfBvB4T.pdf	rfc/PEDIDO_7000648381_urtnAgb.pdf	rfc/PEDIDO_7000648381_kXnwjkt.pdf	f
891	2015-02-23 16:12:53.920958-05	f		\N	3		\N		\N	\N	7																						f			0																													1																																			f
892	2015-02-23 16:25:15.374962-05	f		\N	3	4	4261	GOB	20	50000	28	H. CONGRESO DEL ESTADO DE AGUASCALIENTES	CONGRESO	PLAZA PATRIA OTE 109	CENTRO	AGUASCALIENTES	AGUASCALIENTES	HCE9402206F4	XXX	449 9103210	XXX	20000	www.congresoags.gob.mx	GUEL	SALDIVAR	NORMA ADELA	xxx	xxx	xxx	xxx	xxx	hcongresoags@congresoags.gob.mx	f	xxx		0						ERNESTO REYES 	LUNES A VIERNES 	9 A 3	449 9103210	FACTURA	CELIA JANETH PEREZ REGALADO		janeth.perez@congresoags.com.mx	449 9103210 EXT. 502	VIERNES	9AM A 2PM		janeth.perez@congresoags.com.mx	FACTURA	PLAZA PATRIA 109	CENTRO	449 9103210	LUNES A VIERNES 	9AM A 1PM	ERNESTO REYES	LIC. CELIA JANETH PEREZ	regalado_janeth@yahoo.com.mx	449 9103210 EXT 50291	1	50 AÑOS	GOBIERNO	200																												rfc/RFC_Sunbg4q.pdf	rfc/ALTA_H.pdf	rfc/NOMBRAMIENTO.PDF	rfc/COMPROBANTE.pdf	f
893	2015-02-24 13:38:17.767397-05	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
896	2015-02-25 16:19:04.471808-05	f		\N	3		\N		\N	\N	25																						f			0																													1																																			f
894	2015-02-25 09:57:44.951705-05	f		\N	3	4	4262	GOB	20	50000	22	INSTITUTO DE SEGURIDAD Y SERVICIOS SOCIALES PARA LOS SERVIDORES PUBLICOS DEL ESTADO DE AGUASCALIENTES	ISSSSPEA	HERMENEGILDO GALEANA SUR 119	CENTRO	AGUASCALIENTES	AGUASCALIENTES	ISS890219SP8	XXX	449-910-2081	449-910-2086	20000	www.isssspea.gob.mx	IBARRA	ROMO	ALEJANDRO	FRAY PEDRO DE GANTE 112	RINCONADA LOS BOSQUES	AGUASCALIENTES	AGUASCALIENTES	449-910-2086	alejandro.ibarra@aguascalientes.gob.mx	f	0045014452345		0		XXX	XXX	XXX	XXX	SONIA ESPINOSA	MARTES	11:00	449-910-2081	FACTURA	SONIA ESPINOSA		sonia.espinosa@aguascalientes.gob.mx	449-910-2081 ext. 3816	MARTES	11:00		cesar.celis@aguascalientes.gob.mx	FACTURA	HERMENEGILDO GALEANA SUR 119	CENTRO	449-910-2081	MARTES	11:00	CESAR CELIS	CESAR CELIS	cesar.celis@aguascalientes.gob.mx	449-910-2081	2	15 AÑOS	GOBIERNO	5000									XXX	XXXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX					rfc/RFC_domicilio_fiscal_ISSSSPEA.pdf	rfc/Nombramiento_ISSSSPEA.pdf	rfc/Credencial_Elector_ISSSSPEA.JPG	rfc/Compobante_de_Domicilio_ISSSSPEA.pdf	f
895	2015-02-25 10:31:00.350424-05	f		\N	2	2	5342	PM	0	0	21	PSM PAYMENT SERVICES MEXICO SA DE CV	Prosepago	Paseo de los Jardines No. 47	Valle Grande	Hermosillo	Sonora	PPS120308V78		662 3100814	662 3100814	83205		APODACA 	CERVANTES	SAMUEL	Paseo de los Jardines No. 47	Valle Grande	Hermosillo	Sonora	662 3100814	s.apodacac@gmail.com	f	0476037623859		0						SAMUEL APODACA	.	.	662 3100814	.	SAMUEL APODACA		s.apodacac@gmail.com	662 3100814	.	.		s.apodacac@gmail.com	.	Paseo de los Jardines No. 47	Valle Grande	662 3100814	.	.	SAMUEL APODACA	SAMUEL APODACA	s.apodacac@gmail.com	662 3100814	1	.	.	.									.	.	.	.	.	.	.	.	.	.	.	.	.	.	.					rfc/RFC_PSM_A.pdf	rfc/RFC_PSM_A_7UR0ioQ.pdf	rfc/IFE_SAC_2014b.pdf	rfc/comprobante_de_domicilio_PSM.jpg	f
897	2015-02-25 22:57:03.895373-05	f		\N	2	4	4263	PM	0	0	22	MOLITEC STEEL MEXICO SA DE CV	MOLITEC STEEL MEXICO	CIRCUITO PROGRESO 118	PARQUE INDUSTRIAL DE LOGISTICA AUTOMOTRIZ	AGUASCALIENTES	AGUASCALIENTES	MSM1303016C5	XXX	449-922-7840	XXX	20340	www.molitec.co.jp/spanish/company/office.html	SHINYA	SHINYA	NAKAO	CIRCUITO PROGRESO 118	PARQUE INDUSTRIAL DE LOGISTICA AUTOMOTRIZ	AGUASCALIENTES	AGUASCALIENTES	449-922-7840	shinya.nakao@molitec.mx	f	0000000827522		0		BBVA BANCOMER SA	0829 EMPRESAS	XXX	XXX	MAKI TORRES	LUNES 	10:00	449-922-7840	FACTURA	MAKI TORRES		maki.torres@molitec.mx	449-922-7840	VIERNES	11:00		maki.torres@molitec.mx	FACTURA	CIRCUITO PROGRESO 118	PARQUE INDUSTRIAL DE LOGISTICA AUTOMOTRIZ	449-922-7840	LUNES	10:00	EDUARDO RODRIGUEZ	EDUARDO RODRIGUEZ	eduardo.rodriguez@molitec.mx	449-922-7840	1	2 AÑOS	MANUFACTURA AUTOMOTRIZ	1000									XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX					rfc/RFC_Molitec.jpg	rfc/Acta_Constitutiva_MOLITEC.pdf	rfc/IDENTIFICACION_NAKAO_MOLITEC.pdf	rfc/DOMICILIO_MOLITEC.pdf	f
898	2015-02-26 13:30:45.188745-05	f		\N	2	2	5343	PM	0	0	21	MAS PARA OFICINAS SA DE CV		CAMPECHE 80	SAN BENITO	HERMOSILLO	SONORA	MOF130313919		(662) 215 0909		83190		PEÑA	MARMOLEJO	ALVARO ABRAHAM	AV ETCHOJOA 1033	FRACC MISION DEL ARCO 	HERMOSILLO	SONORA	(662) 215 0909	ventas2@oficinasymas.com.mx	f	0376063302788		0																				**	*	*	*	*	*	ALVARO ABRAHAM PEÑA	ventas2@oficinasymas.com.mx	(662) 215 0909	1	*	*	*																												rfc/OFICINAS_YMAS.pdf	rfc/OFICINASYMAS.pdf	rfc/OFICINASYMAS.jpg	rfc/OFICINASYMAS_gAdI3Hl.pdf	f
899	2015-02-26 19:11:56.38441-05	f		\N	2	2	4301	PF	0	0	29	Mario Enrique Mora Garcia	Winpcs Computadoras	Blvd. salinas # 11050 3D	Aviacion	Tijuana	B.C. Nte	MOGM760920JH6	MOGM760920HBCRRR07	664 9730757  	664 2555288	22260	winpcs@prodigy.net.mx	MORA	GARCIA	MARIO ENRIQUE	Athos # 10060	La Esmeralda	TIJUANA	B.C.	664 2555288	winpcs@gmail.com	f	0880055782967		0		BANAMEX	4175 23744	BANAMEX	41759019731	MARIO / OCTAVIO MORA	L-V	9-6:00 P.M.	664 9730757	FIRMA DE  DCTO.	MARIO / OCTAVIO MORA		winpcs@prodigy.net.mx	664 9730757 664 2555288	al vencimiento	9-6:00 p.m.		winpcs@prodigy.net.mx	envio de factura c/ firma	blvd. salinas	aviacion	9-73-07-57	L-V	9-6:00 p.m.	mario / octavio	Mario / Octavio Mora	winpcs@prodigy.net.mx	664 9730757	2	39 anos tijuana / 10 anos  winpcs	C-V y reparacion de  computadoras , impresoras, CCTV	6									bajasky sa de cv	tijuana	B.C.	Ramon	664 6238888	Smarttechsol, s. de r.l. de c.v.	Tijuana	B.C.	Sr. Martin Chavez	664 3787069	compumicro sa de cv	Tijuana	B.C.	Karina/ Gilberto	664 6232299					rfc/RFC_Blvd._salinas__-_Winpcs.docx	rfc/RFC__Winpcs.pdf	rfc/id_001.jpg	rfc/comprobantes_de_domicio.TIF	f
920	2015-04-01 13:01:49.547781-04	f		\N	3	4	4267	GOB	20	50000	22	PATRONATO DE LA FERIA NACIONAL DE SAN MARCOS	PATRONATO DE LA FERIA	PASEO DE LA FERIA 103	SAN MARCOS	AGUASCALIENTES	AGUASCALIENTES	PFN910106K67	XXXX	449-915-8620	XXXX	20070	www.feriadesanmarcos.gob.mx	ALBA	FELGUEREZ	CARLOS ALEJANDRO	CDA. PASEO DEL JAZMIN 109	RESIDENCIAL JARDINES DEL LAGO	AGUASCALIENTES	AGUASCALIENTES	449-915-8620	juanpablogarcia0608@gmail.com	f	0327055057415		0		XXXX	XXXX	XXXX	XXXX	ANNA ORTIZ	MARTES	11:00	449-915-8620	FACTURA	ANNA ORTIZ		annaortiz.ld@gmail.com	449-915-8620 ext. 112	LUNES	11:00		annaortiz.ld@gmail.com	FACTURA	PASEO DE LA FERIA 103	SAN MARCOS	449-915-8620	MARTES	11:00	JUAN PABLO GARCIA ARELLANO	ANNA ORTIZ	annaortiz.ld@gmail.com	449-915-8620 ext. 112	1	20 AÑOS	PATRONATO	100									XXXX	XXXX	XXXX	XXXX	XXXX	XXXX	XXXXX	XXXXX	XXXXX	XXXXX	XXXXX	XXXX	XXXX	XXXXX	XXXX					rfc/CEDULA_RFC_PATRONATO.pdf	rfc/CEDULA_RFC_PATRONATO_m62cBbV.pdf	rfc/IFE_PATRONATO.pdf	rfc/COMPROBANTE_DOMIC_PATRONATO.pdf	f
921	2015-04-06 12:07:49.517489-04	f		\N	2	1	4305	PM	0	0	29	Draci Sports de Mexico S de RL de CV		Blvd. Insurgentes No. 16902	Los Alamos	Tijuana	Baja California	DSM040311TL8		(664) 1917389		22110		Tellez	Muñoz	Juan Luis	Priv. Oviedo 26126 84 	El Laurel	Tijuana	Baja California	664 625 37 45	juanluist@uesports.com	f	1294102182931		0						Berenice Martinez	Martes	2:30 a 4:30	(664) 1917389	Factura	Berenice Martinez		berenicem@uesports.com	(664) 1917389	Martes	2:30 a 4:30		berenicem@uesports.com	Factura	Blvd. Insurgentes No. 16902	Los Alamos	(664) 1917389	lunes a viernes	8:00 - 17:00	Juan Luis Tellez	Miguel Dominguez 	migueld@uesports.com	(664) 6253752 	1	5 años	maquiladora	100									Casa Diaz  de Maquinas de Coser   	Tijuana	Baja California	Irma Castro   	(01 664) 622-1727	Abastecedora Industrial de Tijuana S.A. de C.V.   	Tijuana	Baja California	Elvira Quezada   	Tel: 625 8990 y 92   	ULINE SHIPPING SUPPLIES S. DE R.L. DE C.V.   	Tijuana 	Baja California	Jose Luis Sanchez  	(664) 647-20-45 x7915   					rfc/RFC_INSURGENTES.pdf	rfc/RFC_INSURGENTES_lzwLFIT.pdf	rfc/ife.pdf	rfc/Factura-AB-80653327.pdf	f
922	2015-04-07 14:06:12.109943-04	t		\N	1	2	5352	DPF	0	0	30	ESMERALDA TORRES MOTA		AVE. 14 NO. 509	SAN VICENTE	GUAYMAS	SONORA	TOME790325EV3	TOME790325MSRRTS06	622-2219405		85465		TORRES	MOTA	ESMERALDA	LOTE 9 MANZ. 54 	ADOLFO LOPEZ MATEOS	GUAYMAS	SONORA	622-2219405	susecom@yahoo.com.mx	f	1076063618790		0		BANAMEX	70006372978			FRANCISCO TORRES MOTA	TODOS LOS DIAS	8-4 PM	6222219405	FACTURA	FRANCISCO TORRES MOTA		susecom@yahoo.com.mx	6222219405	TODOS LOS DIAS	8-4 PM			FACTURA	CALLE 15 ENTRE AVE. 15 Y SERDAN	CENTRO	6222219405	LUNES A SABADO	8:00 AM - 7:00 PM	FRANCISCO TORRES MOTA	FRANCISCO TORRES MOTA	susecom@yahoo.com.mx	6222219405	2	2 AÑOS	COMPRA VENTA DE EQUIPO DE COMPUTO	3									CT INTERNACIONAL DEL NOROESTE S.A. DE C.V.	HERMOSILLO	 SONORA	VALERIA MEDINA	6621090002	CALCOM DE MEXICO S.A. DE C.V.	HERMOSILLO	SONORA	ING. PEREZ	6622105766	CLAUDIO GARCIA RODRIGUEZ	ECATEPEC DE MORELOS	ESTADO DE MEXICO	CORINA	015557703164					rfc/alta.jpg	rfc/alta_f72NOjc.jpg	rfc/ife.jpg	rfc/recibo_luz.jpg	f
900	2015-02-27 17:14:57.994528-05	f		\N	2	1	4302	PM	0	0	29	JELD WEN DE MEXICO SA DE CV		PRIVD COLINAS 11552	PARQUE IND FLORIDO	TIJUANA	BAJA CALIFORNIA	JWM980723U1A		664 6450350		22244		LOMELI	PIERCE	NORMA YAEL	AVE GUANAJUATO 3124	MADERO SUR	TIJUANA	BAJA CALIFORNIA	664 6450350 ext 303 	yaell@jeld-wen.com	f	0888024755577		0		Banamex	774/6564311	Banamex	774/6564311	Maricela Cardenas  	lunes	11 a 12:30	664 6450350	orden de compra y factura	Maricela Cardenas  		maricelac@jeld-wen.com	664 6450350	lunes	11 a 12:30		sergiov@jeld-wen.com	orden de compra y factura	PRIVADA COLINAS  11552 	PARQUE INDUSTRIAL EL FLORIDO	664 6450350 ext. 336	Lunes a Jueves 	9am a 2pm	Sergio Vargas, Renato o Grecia Jaramillo	Grecia Jaramillo 	gjaramillo@jeld-wen.com	664 6450350 ext. 309	1	5 años	maquiladora	100									U-Line 	TIJUANA	BAJA CALIFORNIA	JOSE LUIS SANCHEZ	664 6472045	Industrial Safety de Mexico S.A de C.V.	TIJUANA	BAJA CALIFORNIA	Paulina / Alejandrina Urbina	664 6259003	Iris Chemical	TIJUANA	BAJA CALIFORNIA	ARACELI JUAREZ	664 6607333					rfc/CEDULA_JELD_WEN_2012.pdf	rfc/CEDULA_JELD_WEN_2012_rWN0oPp.pdf	rfc/IFE_YAEL.pdf	rfc/R1_CAMBIO_DE_DOMICILIO.PDF	f
901	2015-03-02 13:08:48.700327-05	f		\N	3		\N		\N	\N	\N																						f			0																													1																																			f
902	2015-03-05 17:41:16.745896-05	f		\N	2	2	5345	GRMEX	30	1500000	6	MEXICO GENERADORA DE ENERGIA S DE RL		CAMPOS ELISEOS # 400 OFNA 1102	LOMAS DE CHAPULTEPEC	DISTRITO FEDERAL	MEXICO	GGE050811UM9	*	01800 062 1331	*	11000	*	*	*	*	*	*	*	*	*	mesadeservicio@csc.gmexico.com	f	*		0		*	*	*	*	PORTAL	LUNES A VIERNES 	*	01800 062 1331	FACTURA	MESA DE SERVICIO		mesadeservicio@csc.gmexico.com	01800 062 1331	MIERCOLES, JUEVES	*		mesadeservicio@csc.gmexico.com	FACTURA	C. FED NACOZARI-AGUAPRIETA KM21	NACOZARI DE GARCIA	01634 3429849	LUNES A VIERNES	9 A 3	BRIANDA MARTINEZ	BRIANDA MARTINES	brianda.martinez@mge.gmexico.com	01 (634) -342 98 49 ext. 12906 	1	10 	ENERGIA ELECTRICA	*									*	*	*	*	*	*	*	*	*	*	*	*	*	*	*					rfc/RFC_GENERADORA.pdf	rfc/RFC_GENERADORA_JIc9W9B.pdf	rfc/RFC_GENERADORA_SRE9sXL.pdf	rfc/RFC_GENERADORA_oacV2cF.pdf	f
903	2015-03-08 20:54:59.927752-04	t	rgKUQcNtywmbTn8f64VbMyyZSVFDa3TbqtQHQkL6bf3djZ8BDy	2015-03-10	1	2	5346	DPF	0	0	31	JORGE LUIS MEREL MORENO	MDCSISTEMAS	ALCATRACES 28	LA FLORESTA	HERMOSILLO	SONORA	MEMJ81062748A	MEMJ810627HSRRRR02	662 1188133		83179		MEREL 	MORENO	JORGE LUIS	ALCATRACES 28	FLORESTA VILLA CIPRCES	HERMOSILLO	SONORA	662 1188133	jorge_m27@hotmail.com	f	0374063730601		0						jorge luis merel moreno	sabados	10:00	1188133	numero de factura	jorge luis merel moreno		mdcsistemas@eninfinitum.com	1188133	sabado	10:00		mdcsistemas@hotmail.com	numero de factura	ALCATRECES 28	FLORESTA VILLA CIPRECES	662 1188133	LUNES A DOMINGO	7:00 A 18:00	JORGE LUIS MEREL MORENO	JORGE LUIS MEREL MORENO	mdcsistemas@eninfinitum.com	6623616984	1	12	compraventa de equipo de computo yservicios	2									CT INTERNACIONAL	HERMOSILLO	SONORA	HILDA SALVADOR	662 109 0000	GRUPO CVA	HERMOSILLO	SONORA	FRANCISCA LORENA JIMENEZ YUQUI	 (662) 236 61 50	CALCOM DE MEXICO	HERMOSILLO	SONORA	PABLO SANCHES	 662 210 5766					rfc/INSCRIPCION_RFC_JORGE_LUIS_MEREL_MORENO.JPG	rfc/ALTA_SAT_JORGE_MEREL.JPG	rfc/doc20150308180059.pdf	rfc/6621188133_201502.pdf	t
905	2015-03-11 11:57:56.716212-04	f		\N	3		\N		\N	\N	19																						f			0																													1																																			f
904	2015-03-09 15:54:28.203992-04	f		\N	2	2	5347	PM	0	0	12	CROSBY DCN SC	CROSBY DCN S.C.	Reforma 228A	Centenario	Hermosillo	Sonora	CDC130624LN8		662 212 02 46		83260	www.dcn.mx	Crosby 	Uribe	Jonathan Federico 	Retorno Nadine  #64	Res. Quiroga Madrigal	Hermosillo	Sonora	0446622758232	crosby@dcn.mx	f	05040440369205		0		Banco del Bajio	98098560201	Banco del Bajío	 94452552101	Patricia Rayas	lunes a viernes	9:00 AM a 1.30 PM	662 2120246	Factura	Patricia Rayas		patyrayas@dcn.mx	662 2120246	15 de mes	9:00 AMa 1.30 PM		patyrayas@dcn.mx	factura	Reforma 228A	Centenario	662 212 02 46	lunes a sábado	9 AM a 7:00 PM	9:00 AM a 7:00 PM	Patricia Rayas	patyrayas@dcn.mx	662 2120246	2	2 años	Agencia de publicidad y mkt	13									MAS MARKETING	Hermosillo	Sonora	Gerardo Marcial	662 2671007	Outdoor Sonnora	Hermosillo	Sonora	Daniel Gastelum	662 1241491	Uniradio Z93	Hermosillo	Sonora	Dagoberto Macias	662 1140904					rfc/COUJ740801HCHRRN08_JONATHAN.pdf	rfc/CIF_Jonathan.jpg	rfc/IFE_JON.jpg	rfc/img046.jpg	f
907	2015-03-12 14:11:12.65218-04	f		\N	3		\N		\N	\N	21																						f			0																													1																																			f
906	2015-03-11 17:30:44.871422-04	f		\N	2	2	5348	PM	0	0	20	CONSTRUCTORA INMOBILIARIA DEL NOROESTE S.A. DE C.V.	CINSA	MIGUEL ALEMAN #655 SUR INT. L-4	CENTRO	OBREGON 	SONORA	CIN750913FP7	.	644 415 29 30	644 114 54 01	85000		SERRANO	SOMBRA	JOSE RAFAEL	C. ARDILLA # 6005 SUR	FRACCIONAMIENTO LOS ENCINOS	CAJEME	SONORA	644 415 29 30	cinsa_01@hotmail.com	f	0910063499899		0		BANAMEX	6140	BANAMEX	6140	JOSE RAFAEL SERRANO SOMBRA	LUNES A VIERNES 	9 A 3	644 415 29 30	FACTURA	JOSE RAFAEL SERRANO SOMBRA		cinsa_01@hotmail.com	01 644 415 29 30	-	9AM A 2PM		cinsa_01@hotmail.com	FACTURA	MIGUEL ALEMAN # 655	CENTRO 	644 4152930	LUNES A VIERNES	9 A 3	JOSE RAFAEL SERRANO SOMBRA	JOSE RAFAEL SERRANO SOMBRA	cinsa_01@hotmail.com	01 644 415 29 30	1	40	CONSTRUCCIONES	.									MADEDERA DE CAJEME SA DE CV  	CD OBREGON 	SONORA 	LAURO ROBLES ZEPEDA 	644 4167141	CONSULTORIA EMPRESARIAL DEL YAQUI 	CD OBREGON 	SONORA 	FRANCISCO MERCADO 	644 1497863	MADERAS Y OTROS SA DE CV 	LOS MOCHIS 	SINALOA 	RENATO MALDONADO 	668 8128989					rfc/RFC_DE_CINSA_11_MARZO_2015.JPG	rfc/RFC_DE_CINSA_11_MARZO_2015_6CPkJmH.JPG	rfc/IFE_REPRESENTANTE_LEGAL.jpg	rfc/COMPROBANTE_DE_DOMICILIO_CINSA11032015.jpg	f
908	2015-03-17 19:03:55.255892-04	f		\N	2	4	4264	PM	0	0	22	CENTRO DE ENSEÑANZA FCO I MADERO AC	PREPA MADERO	ALLENDE 103-1	CENTRO	AGUASCALIENTES	AGUASCALIENTES	CEF000412NT5	XXXX	449-916-8242	XXXX	20000	XXXX	FELIX	CASTAÑON	MARIO	CDA PLOMO 205-40	RESIDENCIAL FUNDICION	AGUASCALIENTES	AGUASCALIENTES	449-916-8242	luis_chiu72@hotmail.com	f	0003055119407		0		XXXX	XXXX	XXXX	XXXX	ROXANA SANTAMARIA	LUNES	10:00	449-916-8242	FACTURA	ROXANA SANTAMARIA		roxx.santa@hotmail.com	449-916-8242	LUNES	10:00		roxx.santa@hotmail.com	FACTURA	RIVERO Y GUTIERREZ 315	CENTRO	449-916-8242	LUNES A VIERNES	8:00 A 13:00	LUIS FERNANDO PEREZ	LUIS FERNANDO PEREZ	luis_chiu72@hotmail.com	449-916-8242	1	20 años	CENTRO EDUCATIVO	30									XXXX	XXXX	XXXX	XXXX	XXXX	XXXX	XXXX	XXXX	XXXX	XXXX	XXXX	XXXX	XXXX	XXXX	XXXX					rfc/Scan_RFC_PREPA_MADERO.pdf	rfc/Scan_RFC_PREPA_MADERO_yqHXjkJ.pdf	rfc/Scan_IFE_PREPA_MADERO.pdf	rfc/Scan_COMPR_DOMIC_PREPA_MADERO.pdf	f
917	2015-03-25 11:43:55.804644-04	f		\N	3	4	4266	GOB	20	50000	22	INSTITUTO ESTATAL DE SEGURIDAD PUBLICA	IESPA	AVE. DE LOS CONOS S/N	OJO CALIENTE	AGUASCALIENTES	AGUASCALIENTES	IES000307NA0	XXXX	449-970-0059	XXXX	20190	www.aguascalientes.gob.mx/iespa/	GONZALEZ	MENDIVIL	OSCAR FIDEL	AV LOS CONOS S/N	OJO CALIENTE	AGUASCALIENTES	AGUASCALIENTES	449-970-0059	iespa@aguascalientes.gob.mx	f	XXXX		0		XXXX	XXXX	XXX	XXXX	MA DE LOURDES GUTIERREZ	DIARIO	8:00-15:00	449-970-0059	FACTURA	C.P. ROSARIO ALEGRIA GARCIA		rosario.alegria@aguascalientes.gob.mx	449-970-0059	DIARIO	8:00-15:00		maria.salas@aguascalientes.gob.mx	CONTRARECIBO	AV LOS CONOS S/N	OJO CALIENTE	449-970-0059	DIARIO	8:00-15:00	MA. DEL REFUGIO GARCIA MONTEJANO	MARIA DEL REFUGIO SALAS ALMANZA	maria.salas@aguascalientes.gob.mx	449-970-0059	1	20 años	INSTITUCIÓN DE GOBIERNO	200									XXXX	XXXX	XXXX	XXXX	XXXX	XXXX	XXXX	XXXX	XXXX	XXX	XXXX	XXXX	XXXXX	XXXXX	XXXX					rfc/Scan_RFC_IESPA.pdf	rfc/Scan_RFC_IESPA_E6KahKG.pdf	rfc/Scan_IESPA.pdf	rfc/Scan_IESPA_qc6w7iL.pdf	f
909	2015-03-19 13:36:41.751485-04	f	uCB26KNEy75RenLLsmAFbd46YPzHWAJTaM9nrHqnWQVNkxPgJ6	2015-03-19	2	1	4303	PM	0	0	32	PETREMEX SA DE CV	PETREMEX	ANDADOR VECINAL 21837	EL REALITO	TIJUANA	BAJA CALIFORNIA	PET980216D7A	N/A	664 6450200	664 9782943	22250	N/A	CONTRERAS	MONTAÑO	ADRIANA	ANDADOR VECINAL 21837	EL REALITO	TIJUANA	BAJA CALIFORNIA	664 6450200	PETREMEX@PRODIGY.NET.MX	f	1279030563304		0		BANORTE	 0220908748 	BANORTE	 0220908748 	CLAUDIA CASTAÑEDA	MARTES	3:00 pm  A  5:00 pm	664 6450200 Ext.101	FACTURA ORIGINAL	CLAUDIA CASTAÑEDA		claudiafact@hotmail.com	664 6450200 Ext. 101	MARTES	8:00 am A 5:00 pm		claudiafact@hotmail.com	FACTURA SELLADA	ANDADOR VECINAL 21837	EL REALITO	664 6450200	LUNES A VIERNES	8:00 am A 5:00 pm	CLAUDIA CASTAÑEDA	CLAUDIA CASTAÑEDA	claudiafact@hotmail.com	664 6450200	1	5 AÑOS	PETREOS	20									DELTA MAQUINADOS SA DE CV   	TIJUANA	BAJA CALIFORNIA	ELIZABETH CONTRERAS	664 6862124  	GASMART COMERCIALIZADORA   	TIJUANA	BAJA CALIFORNIA	RICARDO LOPEZ	 664 6333100 	MEXICANA DE LUBRICANTES 	TIJUANA	BAJA CALIFORNIA	ARACELI ZAVALA	664 6805569/1					rfc/RFC_PETREMEX.jpg	rfc/RFC_PETREMEX_e6J8PbM.jpg	rfc/RFC_PETREMEX_DVrFjBk.jpg	rfc/RFC_EMPRESAS_PETREMEX.jpg	f
910	2015-03-19 15:27:52.077951-04	f		\N	2	1	4304	PM	30	100000	29	SOCIEDAD MEDICA ANGELES DE TIJUANA AC		AV. Paseo de los Héroes #10999	Zona Urbana Rio	Tijuana	Baja California	MAT080610NX0		(664)6351800 ext 5401		22010		ALVAREZ	CERRO	MARGARITA	C FLORES MAGON 618 1 	INDEPENDENCIA	TIJUANA	BAJA CALIFORNIA	(664)635-18-00 ext 5401	magui_alvarez@yahoo.com.mx	f	0785024130344		0		BANAMEX	4247 31012	BANAMEX	4247 31012	Gloria Gpe. Barajas Aguirre	lunes a viernes	9:00 - 17:00	664 635-1800 ext 2305	factura	Gloria Gpe Barajas Aguirre		smedicaangeles@gmail.com	664 635-1800 ext 2305	lunes a viernes	9:00 - 17:00		smedicaangeles@gmail.com	factura	AV. Paseo de los Héroes #10999	Zona Urbana Rio	664 635-1800 ext 2305	Lunes a Viernes	9:00 a 17:00	Gloria Gpe. Barajas Aguirre	Gloria Gpe Barajas Aguirre	smedicaangeles@gmail.com	664 635-1800 ext 2305	1	10 años	Salud	100									sams Club	Tijuana	Baja California	*	*	Hospital Angeles	*	Baja California	*	*	*	*	*	*	*					rfc/DOCUMENTOS_ALTA_PROVEEDOR_SOC_MEDICA.pdf	rfc/DOCUMENTOS_ALTA_PROVEEDOR_SOC_MEDICA_anPELSO.pdf	rfc/DOCUMENTOS_ALTA_PROVEEDOR_SOC_MEDICA_EoQtaj4.pdf	rfc/DOCUMENTOS_ALTA_PROVEEDOR_SOC_MEDICA_uXP4Qnw.pdf	f
911	2015-03-21 15:51:02.827968-04	f		\N	3		\N		\N	\N	21																						f			0																													1																																			f
912	2015-03-23 11:41:32.15959-04	f		\N	2	4	\N		\N	\N	\N	INSTITUTO  TECNOLÓGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY	TEC DE MONTERREY	CARLOS LAZO 100	ALVARO OBREGON	MEXICO D.F.	DISTRITO FEDERAL	ITE430714KI0	XXXX	5591778000	XXXX	01389	www.itesm.mx	CANTÚ	ORTIZ	FRANCISCO JAVIER	AV. EUGENIO GARZA SADA 2501	COLONIA TECNOLOGICO	MONTERREY	NUEVO LEON	5591778000	compras.csa@itesm.mx	f	xxxx		0		XXXX	XXXX	XXXX	XXXX	JOSEFINA AURORA DE LA TORRE	LUNES	11:00	5591778000	FACTURA	JOSEFINA AURORA DE LA TORRE		compras.csa@itesm.mx	5591778000	MARTES	11:00		compras.csa@itesm.mx	FACTURA	CARLOS LAZO 100	ALVARO OBREGON	5591778000	LUNES	10:00	LIZET BERENICE PIÑON VELASCO	JOSEFINA AURORADE LA TORRE	compras.csa@itesm.mx	5591778000	1	40	INSTITUTO EDUCATIVO	2000									XXXX	XXXX	XXX	XXX	XXXX	XXXX	XXX	XXX	XXXX	XXXXX	XXXXX	XXXX	XXX	XXX	XXXX					rfc/Scan_TEC_DE_MTY.pdf	rfc/Scan_TEC_DE_MTY_q2bgMHW.pdf	rfc/Scan_TEC_DE_MTY_IhNPx4K.pdf	rfc/Scan_TEC_DE_MTY_J9NpFll.pdf	f
913	2015-03-23 18:54:25.126121-04	f		\N	3		\N		\N	\N	30																						f			0																													1																																			f
914	2015-03-24 15:39:14.679202-04	f		\N	2	2	\N		\N	\N	\N	INSTITUTO TECNOLOGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY 		EUGENIO GARZA SADA # 2501 SUR	TECNOLOGICO	MONTERREY 	NUEVO LEON 	ITE430714KI0		0181 83582000		64849		*	*	*	*	*	*	*	*	compras.csa@itesm.mx	f	*		0		BANCOMER	8878	*	*	PORTAL	LUNES A VIERNES 	9 A 3	0181 83582000	FACTURA	PORTAL		compras.csa@itesm.mx	0181 88508500	JUEVES 	9AM A 2PM		compras.csa@itesm.mx	FACTURA	PRIVADA NOGALES SN 	CERRO DE LA SILLA	0181 83582000	LUNES A VIERNES	9 AM a 7:00 PM	*	GRISELDA VAZQUEZ	vgriselda@itesm.com	0181 88508500 ext 3568	1	20	EDUCACION 	*									*	*	*	*	*	*	*	*	*	*	*	*	*	*	*					rfc/OC_CAMPUS_MONT.pdf	rfc/OC_CAMPUS_MONT_xR4ZAvz.pdf	rfc/OC_CAMPUS_MONT_gMfLpr2.pdf	rfc/OC_CAMPUS_MONT_jQzcdwu.pdf	f
915	2015-03-24 15:40:22.222737-04	f		\N	2	2	\N		\N	\N	\N	INSTITUTO TECNOLOGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY 	ITESM	EUGENIO GARZA SADA # 2501 SUR	TECNOLOGICO	MONTERREY 	NUEVO LEON 	ITE430714KI0	*	0181 83582000	*	64849	*	*	*	*	*	*	*	*	*	compras.csa@itesm.mx	f	*		0		BANCOMER	8878	*	*	PORTAL	LUNES A VIERNES 	9 A 3	0181 83582000	FACTURA	PORTAL		compras.csa@itesm.mx	0181 88508500	JUEVES 	9AM A 2PM		compras.csa@itesm.mx	FACTURA	PRIVADA NOGALES SN 	CERRO DE LA SILLA	0181 83582000	LUNES A VIERNES	9 AM a 7:00 PM	*	GRISELDA VAZQUEZ	vgriselda@itesm.com	0181 88508500 ext 3568	1	20	EDUCACION 	*									*	*	*	*	*	*	*	*	*	*	*	*	*	*	*					rfc/OC_CAMPUS_MONT_C49I1q1.pdf	rfc/OC_CAMPUS_MONT_FqN0Clv.pdf	rfc/OC_CAMPUS_MONT_zH8VUPT.pdf	rfc/OC_CAMPUS_MONT_rjgRiDQ.pdf	f
916	2015-03-24 15:47:34.477763-04	f		\N	2	2	5349	TEC	15	50000	12	INSTITUTO TECNOLOGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY 		EUGENIO GARZA SADA # 2501 SUR	TECNOLOGICO	MONTERREY 	NUEVO LEON 	ITE430714KI0	*	0181 83582000	*	64849	*	*	*	*	*	*	*	*	*	compras.csa@itesm.mx	f	*		0		BANCOMER	8878	BANCOMER	8878	PORTAL	LUNES A VIERNES 	9 A 3	0181 88508500 EXT 3568	FACTURA	PORTAL		compras.csa@itesm.mx	0181 88508500	VIERNES	9AM A 2PM		compras.csa@itesm.mx	FACTURA	PRIV NOGALES SN 	CERRO DE LA SILLA	0181 83582000	LUNES A VIERNES	9 A 3	GRISELDA VASQUEZ	GRISELDA VAZQUEZ	vgriselda@itesm.com	0181 88508500 ext 3568	1	30	EDUCACION 	*									*	*	*	*	*	*	*	*	*	*	*	*	*	*	*					rfc/OC_CAMPUS_MONT_fxgJe4f.pdf	rfc/OC_CAMPUS_MONT_sRNLDAa.pdf	rfc/OC_CAMPUS_MONT_z0EoXBr.pdf	rfc/OC_CAMPUS_MONT_zEEjAAp.pdf	f
918	2015-03-25 19:00:15.85655-04	t		\N	1	2	5350	DPF	0	0	21	MANUEL PORTILLO LIZARRAGA		AVE. ROBERTO ROMERO # 361	OLIVARES	HERMOSILLO	SONORA	POLM471227110	POLM471227HSLRZN09	662 2167296	*	83180	*	PORTILLO 	LIZARRAGA	MANUEL 	AVE. CONSTITUCIONAL # 29A	COLINAS RESIDENCIAL 	HERMOSILLO 	SONORA	662 2167296	manuel@hotmail.com	f	1127514795		0		*	*	*	*	*	*	*	*	*	*		manuel@hotmail.com	*	*	*		manuel@hotmail.com	*	AVE. ROBERTO ROMERO #361	OLIVARES	662 2167296	LUNES A VIERNES	8 A 5	MANUEL PORTILLO	MANUEL PORTILLO	manuel@hotmail.com	662 2167296	1	29	IMPRENTAS	1									*	*	*	*	*	*	*	*	*	*	*	*	*	*	*					rfc/RFC_2015032511421700.pdf	rfc/IFE_2015032511430700.pdf	rfc/COMP_DOM_2015032511433600.pdf	rfc/RFC_2015032511421700_Cp7cKNP.pdf	f
153	2014-11-10 15:47:22.635039-05	f		\N	2	*	5156	PM	30	20000	6	QAR SUPERMERCADOS S A P I DE CV		CALZADA DE LOS ANGELES #22	MONTEBELLO 	HERMOSILLO	SONORA	QSU1205315Q7		662 1189659		83249	*	ARMENTA 	VALDEZ	JORGE MARIO 	CDA SANTANDER # 21	CASA GRANDE	HERMOSILLO 	SONORA	662 1189659	jorge.armenta@grupoqar.com	f	0499063700276		0		*	*	*	*	MARIA CORONADO 	LUNES Y MARTES	9 A 3	662 1093300	FACTURA 	MARIA CORONADO 		maria.coronado@grupoqar.com	662 1093300	VIERNES	9AM A 2PM		efacturasacreedores@abarrey.com	FACTURA	CALZADA DE LOS ANGELES #22	MONTEBELLO	662 1189659	LUNES A VIERNES	9 AM a 7:00 PM	*	VICTORIA ROBLES	victoria.robles@abarrey.com	662 1189659	1	*	*	*									*	*	*	*	*	*	*	*	*	*	*	*	*	*	*					rfc/RFC_2015040716022200.pdf	rfc/RFC_2015040716022200_3BLbprQ.pdf	rfc/RFC_2015040716022200_9vZenLW.pdf	rfc/RFC_2015040716022200_4f4zbWN.pdf	f
923	2015-04-08 12:23:54.861495-04	t		\N	1	2	\N		\N	\N	\N	DESARROLLOS ESLABON SYSTEMS S.A.P.I. de C.V	DESARROLLOS ESLABON SYSTEM	Calle la Luna 2695	Jardines del Bosque	Guadalajara 	Jalisco	DES141106KG3		4000 0102		44520		Silveyra	Llanderal	Maria Almendra	Paseo Lomas del Bosque #13	Lomas del Bosque	Zapopan	Jalisco	4000 0102	marias@eslabon.com.mx	f	3069109163365		0		Banorte	260465827	Banorte	208832533	Luis Cervantes	Lunes a Viernes	9:00 a 18:00	7311	Comprobante de pago	Eduardo Arenas		eduardoa@eslabon.com.mx	7311	Lunes a Viernes	9:00 a 18:00		eduardoa@eslabon.com.mx	Cuentas bancarias	Arcos 767	Jardines del Bosque 	4000 0102	Lunes a Viernes	8:30 a 18:30	Aurelio Arellano	Aurelio Arellano	aurelioa@eslabon.com.mx	013340000102	1	6 meses	Servicios de consultoría en computación	150									Antar Eslabon Systems SA de CV	Monterrey	Jalisco	Paola Meneses	40000102	KC Rentas SA de CV	Tlanepantla 	Edo de México	Roberto Sanchez Aguirre	30445520	Preciado & Ruiz Consultores SC	Guadalajara	Jalisco	Ivan Preciado	36730020					rfc/CONSTANCIA_RFC_DES.pdf	rfc/ACTA_CONSTITUTITVA_DES.pdf	rfc/IFE_MASL_1.pdf	rfc/comprobante_de_domicilio.pdf	f
925	2015-04-15 15:44:09.76125-04	t		\N	1	2	5353	DPF	15	50000	30	VICTOR RENE FELIX GASTELUM		CR. LANZ # 500 A	CENTRO 	MAGDALENA	SONORA	FEVG961104DW0	FEVG961104HSRLSC09	662 3621262		84160	*	*	*	*	*	*	*	*	**	proliman@hotmail.com	f	*		0		*	*	*	*	VICTOR FELIX	LUNES A VIERNES 	9 A 3	6621050368	FACTURA 	VICTOR FELIX		proliman@hotmail.com	6621050368	VIERNES	9AM A 2PM		proliman@hotmail.com	FACTURA	DR. LANZA # 500 A	CENTRO 	662 3621262	LUNES A VIERNES	9 A 3	VICTOR R.FELIX	VICTOR FELIX	proliman@hotmail.com	6621050368	1	*	PAPELERIA	*									*	*	*	*	*	*	*	*	*	*	*	*	*	*	*					rfc/RFC_VR.pdf	rfc/RFC_VR_zu0ssdt.pdf	rfc/IFE_VRF.pdf	rfc/COMP_DOM_VRF.pdf	f
924	2015-04-15 14:45:31.253308-04	f		\N	2	4	4269	PM	0	0	4	DINAPROT SA DE CV	DINAPROT	REP DE PERU # 706	SANTA ELENA 2DA SECCION	Aguascalientes	Aguascalientes	DIN121011S30		4491407538		20238		MARTINEZ	NAVARRO	CARLOS DANIEL	AV FRANCISCO I MADERO # 444	ZONA CENTRO	AGUASCALIENTES	AGUASCALIENTES	4491407538	facturacion.dinaprot@hotmail.com	f	0075120966338		0		BANCOMER	0192090554	BANAMEX	7910476178	ANA LAURA GONZALEZ VILLALPANDO	MARTES	9 A 4	4491407538	FACTURA	CP ANTONIO BOTELLO REYES		facturacion.dinaprot@hotmail.com	4491407538	VIERNES	3 PM		facturacion.dinaprot@hotmail.com	CONTRARECIBO	REP DE PERU # 706	SANTA ELENA 2DA SECCION	4491407538	7	9 A 6	CP ANTONIO BOTELLO REYES	CRISTINA ARANDA	compras.dinaprot@outlook.com	4491407538	2	5 AÑOS	SEGURIDAD	250									JATCO	AGUASCALIENTES	AGUASCALIENTES	JORGE ALEJANDRO GUTIERREZ ROMO	4499106500	RADIOMOVIL DIPSA SA DE CV	QUERETARO	QUERETARO	CP ERIKA MARIBEL MARTINEZ	4422495419	ITA	AGUASCALIENTES	AGUASCALIENTES	LIC LUIS MANUEL	4499105002					rfc/CEDULA_FISCAL_dinaprot.pdf	rfc/CEDULA_FISCAL_dinaprot_D5aRE6i.pdf	rfc/COMPROBANTE_-_IFE.pdf	rfc/COMPROBANTE_-_IFE_PT0REzY.pdf	f
927	2015-04-17 12:02:43.082502-04	f		\N	2	4	4270	PM	0	0	22	ASAHI SHO-KO-SHA MEXICO SA DE CV	ASAHI SHO-KO-SHA	AVENIDA AGUASCALIENTES SUR 2623 MANZANA 22 LOTE 9	JARDINES DE LAS FUENTES	AGUASCALIENTES	AGUASCALIENTES	ASM040209PS8	XXXX	449-978-1103	XXXX	20278	www.kkamic.co.jp/	SERIZAWA	SERIZAWA	AKIHIKO	AVENIDA AGUASCALIENTES SUR 2623 MANZANA 22 LOTE 9	JARDINES DE LAS FUENTES	AGUASCALIENTES	AGUASCALIENTES	449-978-1103	abigail.flores@asahimex.com.mx	f	0000000377887		0		XXXX	XXXX	XXXX	XXXX	Abigail Flores 	MARTES	8:30	449-978-1103	FACTURA	Abigail Flores 		abigail.flores@asahimex.com.mx	449-978-1103	MARTES	10:00		abigail.flores@asahimex.com.mx	FACTURA	Carretera Panamericana Km.75, 	Col. Los Arellano	449-910-6500	MARTES	10:00	FERNADO DIAZ DE LEON	FERNANDO DIAZ DE LEON	fernando.diazdeleonlara@jatco.com.mx	449-910-6500 ext 1354	1	14 años	FABRICA	5000									XXXX	XXXX	XXXX	XXXX	XXXX	XXXXX	XXX	XXXXXX	XXXX	XXXXX	XXXXX	XXXX	XXXXX	XXXXX	XXXX					rfc/RFC_ASAHI_NUEVO.pdf	rfc/poder_notarial_ASAHI.pdf	rfc/FM3_SERIZAWA_ASAHI.pdf	rfc/COMPR_DOMIC_ASAHI.jpeg	f
926	2015-04-16 17:59:53.913527-04	f		\N	2	1	4307	PM	0	0	32	CRISOL CONSTRUCTORA SA DE CV		BLVD LAZARO CARDENAS Y VIA RAPIDA PONIENTE # 15035	RIO TIJUANA 3RA ETAPA	TIJUANA	BC	CCO970602I36		6646868990		22226		PEREZ	SOTO	JOSE MARTIN	PRIVADA SAN ANTONIO NORTE 8731 20	FRACC COLINAS DE CALIFORNIA	TIJUANA	BC	6646868990	CRISOLCONTRUCTORA@HOTMAIL.COM	f	1205024819320		0		BANAMEX	284-7525676	BANAMEX	284-7525676	BLANCA MORALES	MARTES Y JUEVES	9:00 AM A 1:30 PM	6646868990	FACTURA ORIGINAL	SOFIA JIMENEZ		CRISOLCONTRUCTORA@HOTMAIL.COM	6646868990	VIERNES 	9:00 AM A 1:30 PM		constructora.crisol.facturas@hotmail.com	CONTRARECIBO	BLVD LAZARO CARDENAS Y VIA RAPIDA PONIENTE	RIO TIJUANA 3RA ETAPA	6646868990	DIARIO	9:00 AM  A 5:00 PM	SOFIA JIMENEZ	SOFIA JIMENEZ	CRISOLCONTRUCTORA@HOTMAIL.COM	6646868990	1	5 AÑOS	CONSTRUCCION	30									CEMEX S.A.D DE C.V.	TIJUANA	BC	DIEGO ANDRADE	6643755906	URBANIZADORA Y RIEGO DE BC S.A DE C.V. 	TIJUANA	BC	CESAR PERALTA	6643318945	ABASTECEDORA DE FIERRO Y ACERO S.A DE C.V 	TIJUANA	BC	LUIS PEREZ	6641885303					rfc/DEDULA_IDENT_FISCAL_CCO-970602-I36.pdf	rfc/DEDULA_IDENT_FISCAL_CCO-970602-I36_Ku7Lgmy.pdf	rfc/IFE_MARTIN.JPG	rfc/RECIBO_DE_AGUA.pdf	f
928	2015-04-17 15:11:05.69159-04	f		\N	3		\N		\N	\N	21																						f			0																													1																																			f
929	2015-04-17 17:02:57.46562-04	t		\N	1	2	\N		\N	\N	\N	REYEGRAN S.A DE C.V.	REYEGRAN S.A DE C.V.	vidriera los reyes 25 1er piso 	VISTA HERMOSA	TLALNEPANTLA DE BAZ	MEXICO	REY111117RS3	OOCL580108HGTNZS07	0155 5361-3182		54080		ONOFRE	CAZARES	LUIS ANTONIO	C VALLE DE BRAVO	VALLE DE TULES	TULTITLAN 	MEXICO	015553658969	direcciongeneral@reyegran.com.mx	f	MEX1112225617		0		INBURSA	50022389611	BANORTE	0276490428	RICARDO MILLAN	JUEVES	10 AM A 12 	5553613182	FACTURA ORIGINAL Y COPIA DE LA  ORDEN D COMPRA 	MARIO RICARDO JAVIER MILLAN		contraloria@reyegran.com.mx	5553617542	VIERNES	14:00 A 16:00		facturacion@reyegran.com.mx	CONTRA RECIBO ORIGINAL	VIDRIERA LOS REYES #25 1ER PISO	VISTA HERMOSA	015553613182	LUNES A VIERNES	10 AM A 6 PM	FERNANDO PRIETO	SUSAN PADILLA EMMERT	spadilla@reyegran.com.mx	015553613182	1	3	COMPRA Y VENTA AL POR MAYOR	65									COMERCIALIZADORA PALMIRA S.A DE C.V.	IZTAPALAPA	MEXICO D.F.	GUSTAVO SOLORIO	0155 67135559	ABASTECEDORA ABARROTERA DAVALOS S.A DE C.V	ECATEPEC	MEXICO	NUBIA CAMACHO GUZMAN	0155 66433029	PROVEEDORA STA MARTA S.A DE C.V.	CHALCO MEXICO D.F.	DISTRITO FEDERAL	PAMELA SANCHEZ 	015567159443					rfc/CEDULA_DE_IDENT._REYEGRAN.pdf	rfc/Acta_Const.pdf	rfc/INE_Color.pdf	rfc/C.dom_telmex_Abril.pdf	f
935	2015-05-06 12:18:36.2577-04	f		\N	2	2	5361	PM	0	0	21	GARCA TU CASA LIMPIA	*	GANDARA 81	SAN BENITO	HERMOSILLO	SONORA	GTC110329CI0	*	(662) 210-40-42	*	83190		CAÑEZ	CAÑEZ	OSCAR RENE	CDA SAN DIEGO 1	FRACC CAPISTRANO	HERMOSILLO	SONORA	(662) 210-40-42	rhtucasalimpia@hotmail.com	f	1164808808		0		*	*	*	*	*	*	*	*	*	*		rhtucasalimpia@hotmail.com	*	*	*		rhtucasalimpia@hotmail.com	*	GANDARA 81	SAN BENITO	(662) 210-40-42	L-V	8AM A 5PM	MAYRA TORRESILLAS	MAYRA TORRESILLAS	rhtucasalimpia@hotmail.com	(662) 210-40-42	1	**	*	*									*	*	*	*	*	*	*	*	*	*	*	*	*	**	*					rfc/RFCCASALIMPIA_1.pdf	rfc/RFCCASALIMPIA_2.pdf	rfc/RFCCASALIMPIA_1_wZA4l0A.pdf	rfc/FCATEL_7jPU9o3.pdf	f
931	2015-04-24 13:35:15.537078-04	f		\N	2	2	\N		\N	\N	\N	SECRETARIA DE COMUNICACIONES Y TRANSPORTES CENTRO SCT EN BAJA CALIFORNIA SUR	SECRETARIA DE COMUNICACIONES Y TRANSPORTES CENTRO SCT EN BAJA CALIFORNIA SUR	HEROES DEL 47 SN ENTRE IGNACIO ALTAMIRANO Y RAMIREZ	EL ESTERITO	LA PAZ 	BAJA CALIFORNIA SUR	SCT051121PH1		01-612-451-1142		23020	www.sct.gob.mx	X	X	X	X	X	X	X	X	mlopezhi@sct.gob.mx	f	X       		0		X	X	X	X	MARIA DORA LOPEZ	L-V	9 AM A 20 PM	01-612-451-1142	FACTURAS 	MARIA DORA LOPEZ		mlopezhi@sct.gob.mx	01-612-451-1142	20 DIAS NATURALES DESPUES DE RECIBIDA LA FACTURA	9-2		mlopezhi@sct.gob.mx	FACTURA	Héroes del 47 entre Ignacio Altamirano e Ignacio Ramírez	el Esterito	01-612-451-1142	L-V	9-2	JUAN COTA MARTINEZ	X	mlopezhi@sct.gob.mx	X      	1	X          	X                	X                									X	X	X	X	X	X 	X	X	X	X	X 	X	X      	X	X					rfc/RFC_SCT051121PH1.doc	rfc/RFC_SCT051121PH1_K5B9RGh.doc	rfc/RFC_SCT051121PH1_FWLkRaw.doc	rfc/RFC_SCT051121PH1_7HUo4se.doc	f
932	2015-04-28 14:38:30.504977-04	f		\N	2	4	4271	SCT	20	500000	4	SECRETARIA DE COMUNICACIONES Y TRANSPORTES CENTRO SCT GUANAJUATO		CARR. KM 5 GTO S/N	JUVENTINO ROSAS	GUANAJUATO	GUANAJUATO	CSG830527VC9	XXX	014734541100	014734541100	36250	www.sct.gob.mx	xxx	xxx	xxx	xxx	xxx	xxx	xxx	xxx	xxx@xxx.com	f	xxx		0		NO IDENTIFICADO	NO IDENTIFICADO	NO IDENTIFICADO	NO IDENTIFICADO	ALMA ROSA HERNANDEZ	L-V	MATUTINO	014734541100 48072	REQUISICION, FACTURA PDF XML	PATRICIA CHAGOLLAN		pchagoll@sct.gob.mx	014734541100	L-V	MATUTINO		ahernanr@sct.gob.mx	FACTURA ELECTRONICA	CARR. KM 5 GTO S/N	JUVENTINO ROSAS	014734541100	L-V	9-2	GABRIEL GARCIA GUZMAN	ALMA ROSA HERNANDEZ	ahernanr@sct.gob.mx	014734541100 42078	1	5	SERVICIO PUBLICO	100									XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX	XXX					rfc/SCT_GTO.pdf	rfc/SCT_GTO_0IZswbJ.pdf	rfc/SCT_GTO_1kzxGYf.pdf	rfc/SCT_GTO_4kXbxOy.pdf	f
934	2015-05-05 19:43:33.750763-04	f		\N	2	4	\N		\N	\N	\N	JATCO DE MEXICO SA DE CV	JATCO 	CARRETERA PANAMERICANA KM 75 	LOS ARELLANO	AGUASCALIENTES	AGUASCALIENTES	JME0304309M7	XXXX	910-6500	971-1081	20340	www.jatco.co.jp/ENGLISH/company/.../global/	FRANCO	RAMIREZ	RICARDO	VALLE DEL CAMPANARIO 209	VALLE DEL CAMPANARIO	AGUASCALIENTES	AGUASCALIENTES	910-6500	fernando.diazdeleonlara@jatco.com.mx	f	0041109211128		0		XXXX	XXXX	XXXX	XXXX	TATIANA CAROLINA GUTIERREZ  PADILLA	LUNES	11:00	910-6500	FACTURA	TATIANA CAROLINA GUTIERREZ  PADILLA		tatiana.gutierrezpadilla@jatco.com.mx	910-6500 ext. 1354	VIERNES	10:00		fernando.diazdeleonlara@jatco.com.mx	FACTURA	CARRETERA PANAMERICANA KM 75 	LOS ARELLANO	910-6503	LUNES A VIERNES	9:00	TATIANA GUTIERREZ	FERNANDO DIAZ DE LEON 	fernando.diazdeleonlara@jatco.com.mx	910-6500 ext, 1354	1	12 años	FABRICA	8000									XXX	XXXX	XXXX	XXXXX	XXXXX	XXXXX	XXXX	XXXXX	XXXXX	XXXX	XXXXX	XXXXX	XXXXXXX	XXX	XXX					rfc/RFC_JATCO.pdf	rfc/RFC_JATCO_RhSAE9w.pdf	rfc/IFE_NOTARIO_JATCO.pdf	rfc/CFE_Abr_2015_JATCO.pdf	f
933	2015-05-05 17:42:10.167319-04	f		\N	2	2	5356	PM	30	306435	12	HEWLETT-PACKARD OPERATIONS MEXICO S.DE R.L. DE C.V.		PROLONGACION REFORMA #700	LOMAS DE SANTA FE	MEXICO D.F	DEL.  ALVARO OBREGON	HPO0106272A2	 	018005222625		01210		ALVARADO	X	ARTURO	aalvarado@hp-canales.com.mx	 	 	 	018005222625	aalvarado@hp-canales.com.mx	f	XXXXXXXX		0		XXXXXX	XXXXXXX	XXXXXX	XXXXXXXXXX	XXXXXX	XXXXX	XXXXXXXX	XXXXXXXX	XXXXXXXX	XXXXXX		aalvarado@hp-canales.com.mx	XXXXXXX	XXXXXXXXX	XXXXXXXX		aalvarado@hp-canales.com.mx	XXXXXX	XXXXXXXXXXXX	XXXXXXXXX	XXXXXXXXX	XXXXXXXXX	XXXXXX	XXXXXXXXXXX	ARTURO ALVARADO	aalvarado@hp-canales.com.mx	018005222625	1	XXXXXXXXX	 	 									 	 	XXXXXXXXX	  	 	 	 	 	 	 	 	  	 	 	  					rfc/David_Cruz_Gonzalez.pdf	rfc/David_Cruz_Gonzalez_yPA88X5.pdf	rfc/David_Cruz_Gonzalez_78oh3TV.pdf	rfc/David_Cruz_Gonzalez_sJyTIdg.pdf	f
945	2015-05-22 18:08:17.252149-04	f		\N	3	1	4310	SCT	30	1100370	7	SECRETARIA DE COMUNICACIONES Y TRANSPORTES CENTRO SCT EN BAJA CALIFORNIA		EJERCITO NACIONAL #780	MAESTROS FEDERALES	MEXICALI	BAJA CALIFORNIA	SCT060306RL8	*	686 5689256	*	21370	*	*	*	*	*	*	*	*	*	jcanorub@sct.gob.mx	f	*		0		*	*	*	*	JULIO CESAR CANO	LUNES A VIERNES 	8 A 2	686 5689256	FACTURA 	JULIO CESAR CANO		jcanorub@sct.gob.mx	686 5689256	*	*		jcanorub@sct.gob.mx	FACTURA	AVE. EJERCITO NACIONAL #780	MAESTROS FEDERALES	686 5689256	LUNES A VIERNES	*	*	JULIO CESAR CANO 	jcanorub@sct.gob.mx	686 5689256	1	*	*	*									*	*	*	*	*	*	*	*	*	*	*	*	*	*	*					rfc/INSCRIPCION_EN_EL_RFC_HMO.pdf	rfc/INSCRIPCION_EN_EL_RFC_HMO_w3dUcy1.pdf	rfc/INSCRIPCION_EN_EL_RFC_HMO_1RrOLci.pdf	rfc/INSCRIPCION_EN_EL_RFC_HMO_HmrW2Ex.pdf	f
936	2015-05-06 14:29:00.248528-04	f	2MW6qSVxT43NFxQdb86urgJXPYs57VMTG5a4XUUDSjWs3bebUX	2015-05-06	2	3	4092	PM	30	50000	12	SUPREMO TRIBUNAL DE JUSTICIA DEL ESTADO DE SINALOA		AVE. LAZARO CARDENAS 891 SUR	CENTRO SINALOA	CULIACAN ROSALES	SINALOA	GES8101015I7		667 758 70 00		80129	http://www.stj-sin.gob.mx/	HERNANDEZ	.	GUILLERMO	.	.	.	.	.	guillermo.hernandez@stj-sin.gob.mx	f	.		0						GUILLERMO HERNANDEZ	JUEVES	8:00 A 3:00	(667) 758 72 00 EXT. 3040	FACTURA	GUILLERMO HERNANDEZ		guillermo.hernandez@stj-sin.gob.mx	(667) 758 72 00 EXT. 3040	JUEVES	TRANSFERENCIA		guillermo.hernandez@stj-sin.gob.mx	ARCHIVOS PDF Y XML	AVE. LAZARO CARDENAS 891 SUR	CENTRO SINALOA	667 758 70 00	LUNES A VIERNES	8:00 A 3:00	GUILLERMO HERNANDEZ	ROCIO CAMACHO	rocio.camacho@stj-sin.gob.mx	667 758 72 00 EXT. 3041	1	0	0	0									0	0	0	0	0	0	0	0	0	0	0	0	0	0	0					rfc/FACTURAS_EN_PORTAL_HACIENDA.pdf	rfc/FACTURA_AS851_zPQVBak.pdf	rfc/FACTURA_AS599_ylWOZeX.pdf	rfc/FACTURA_AS851_Fs4AUpG.pdf	f
937	2015-05-08 17:58:36.914409-04	f		\N	2	2	5359	PM	0	0	19	DATAPRO DEL NOROESTE SA DE CV	DATAPRO	LUIS DONALDO COLOSIO 395 - A	VILLA SATELITE	HERMOSILLO	SONORA	DNO980122TF1		6622165243 2168295 2180243		83200	www.datapro.com.mx	MARTINEZ	PRECIADO	JOSE ANTONIO	SUZZARA 6	VILLA BONITA	HERMOSILLO	SONORA	6622165243	jamartinez@datapro.com.mx	f	0475023281426		0		HSBC	4053749164	NA	NA	JOSE ANTONIO MARTINEZ PRECIADO	TODOS LOS DIAS	9 AM A 630 PM	6622165243	FACTURA	CRISTABEL GALAZ 		cgalaz@datapro.com.mx	662 2165243 216529	VIERNES	9AM A 630 PM		cfdi@datapro.com.mx	COTRARECIBO	BLVD. LUIS DONALDO COLOSIO 395	VILLA SATELITE	6622165243	TODOS	9AM A 630PM	CRISTABEL GALAZ	CRISTABEL GALAZ	cgalaz@datapro.com.mx	6622165243 2168295	1	28 años	SERVICIOS Y PRODUCTOS COMPUTACIONALES	10									INGRAM MICRO MEXICO SA DE CV	TIJUANA 	BAJA CALIFORNIA	IRENE RAMIREZ	Irene.Ramirez@ingrammicro.com	COMERCIALIZADORA DE VALOR AGREGADO SA CV	HERMOSILLO	SONORA	GABRIELA RUIZ	(662) 236 61 50	CT INTERNACIONAL DEL NOROESTE SA DE CV	HERMOSILLO	SONORA	HILDA SALVADOR	(662) 109-0000					rfc/RFC_-_DATAPRO_DEL_NOROESTE_SA_DE_CV.pdf	rfc/ALTA_EN_HACIENDA_DATAPRO.pdf	rfc/IFE_JAMP.pdf	rfc/Recibo_CFE..pdf	f
940	2015-05-14 18:18:01.800467-04	f		\N	2	1	\N		\N	\N	\N	RODRIGO SAUCEDA MUÑOZ	NA	CALLE SIRIO 20190	HOROSCOPO	TIJUANA	BAJA CALIFORNIA	NA	SAMR890528HBCCXD00	664 235 72 99	NA	22230	NA	SAUCEDA	MUÑOZ	RODRIGO	CALLE SIRIO NO. 20190	HOROSCOPO	TIJUANA	BAJA CALIFORNIA	664 235 72 99	rodrigo.sauceda@gmail.com	f	1230108362131		0		NA	NA	NA	NA	RODRIGO SAUCEDA	NA	NA	NA	FACTURA	RODRIGO SAUCEDA		rodrigo.sauceda@gmail.com	664 235 72 99	NA	NA		rodrigo.sauceda@gmail.com	FACTURA	NA	NA	NA	NA	NA	NA	NA	rodrigo.sauceda@gmail.com	664 235 72 99	1	NA	NA	NA									NA	NA	NA	NA	NA	NA	NA	NA	NA	NA	NA	NA	NA	NA	NA					rfc/Rodrigo_Sauceda.pdf	rfc/Rodrigo_Sauceda_gEF733C.pdf	rfc/CURP_Rodrigo_Sauceda.pdf	rfc/CURP_Rodrigo_Sauceda_qJxx3a6.pdf	f
939	2015-05-12 11:18:11.048741-04	f		\N	2	1	4309	PM	0	0	29	HARMAN DE MEXICO S DE RL DE CV		AV DE LAS TORRES 2290	LOTE BRAVO	JUAREZ	CHIHUAHUA	HME970227D71		(664) 607 00 86		32575		*	*	*	*	*	*	*	*	norma.jimenez@harman.com	f	*		0		Scotiabank	2565			MARA ESQUIVEL 	LUNES A VIERNES	9:00 A 13:00	(664) 607 00 86 Ext. 1193621		Mara Esquivel 		mara.esquivel@harman.com	(664) 607 00 86 Ext. 1193621	LUNES	2:30pm a 4:00 pm		mara.esquivel@harman.com	FACTURA	Sor Juana Ines de la Cruz# 20043	CD Industrial Tijuana	(664) 607 00 86 Ext 1192551	Lunes a Viernes 	9:30 am a 11:30am y de 1:30pm a 3:30pm	Requisitor, según la orden de compra.	Norma Jiménez	njimenez@harman.com	607 00 86 Ext. 1193601	1	10 AÑOS	MAQUILADORA	500									RS HUGHES	TIJUANA	BAJA CALIFORNIA	Blanca Segoviano	664 623-8221	BAJA TOOL	TIJUANA	BAJA CALIFORNIA	ING. JORGE GARCIA	(664) 607 6232	Klingspor	TIJUANA	BAJA CALIFORNIA	Sergio Martinez	664-404-6986					rfc/RFC_Harman.pdf	rfc/RFC_Harman_6AOLkth.pdf	rfc/RFC_Harman_c57nDxR.pdf	rfc/CFE_DICIEMBRE-_ENERO_2015.pdf	f
942	2015-05-19 15:04:38.197477-04	f		\N	3		\N		\N	\N	11																						f			0																													1																																			f
938	2015-05-11 11:38:26.571933-04	f		\N	2	2	5358	PM	30	213599	12	ADMINISTRACION PORTUARIA INTEGRAL DE GUAYMAS S.A. DE C.V.		RECINTO PORTUARIO, ZONA FRANCA S/N	PUNTA ARENA	GUAYMAS	SONORA	API931215JS0	 	(622) 225 22 50		85430		MORENO	X	JAVIER	X	X	X	X	X	jdrmateriales@puertodeguaymas.com.mx	f	X		0		X	X	X	X	JAVIER MORENO	X	X	(622) 225 22 50	X	JAVIER MORENO		jdrmateriales@puertodeguaymas.com.mx	(622) 225 22 50	X	X		jdrmateriales@puertodeguaymas.com.mx	FACTURA	X	X	X	X	X	X	JAVIER MORENO	jdrmateriales@puertodeguaymas.com.mx	(622) 225 22 50	1	X	X	X									X	X	X	X	X	X	X	X	X	X	X	X	X	X	X					rfc/28-11-14.pdf	rfc/28-11-14_T8BdwIp.pdf	rfc/28-11-14_yPhNJf6.pdf	rfc/28-11-14_m0NWJiB.pdf	f
944	2015-05-22 15:47:27.264049-04	f		\N	2	2	5360	PM	0	0	14	PST PROEASY SOLUCION TOTAL SA DE CV 		CABO SAN BLANCO #17	NUEVO SAHUARO 	HERMOSILLO	SONORA	PPS121009I21		662 2164659		83175	*	*	*	*	*	*	*	*	*	compras@proeasy.mx	f	*		0		*	*	*	*	JESUS VILLELAS	*	*	662 2164659	FACTURA 	*		compras@proeasy.mx	662 2164659	*	*		compras@proeasy.mx	FACTURA	CABO SAN BLANCO #17	NUEVO SAHUARO	662 2164659	LUNES A VIERNES	8 A 4	JESUS VILLELAS	JESUS VILLELAS	compras@proeasy.mx	662 2164659	1	3	PAPELERIA	*									*	*	*	*	*	*	*	*	*	*	*	*	*	*	*					rfc/RFC_PROEASY_NVO.pdf	rfc/RFC_PROEASY_NVO_C5UIg91.pdf	rfc/RFC_PROEASY_NVO_0StGzeh.pdf	rfc/RFC_PROEASY_NVO_NRYJT0k.pdf	f
946	2015-05-26 11:23:38.119901-04	f		\N	3		\N		\N	\N	19																						f			0																													1																																			f
941	2015-05-18 15:06:04.376368-04	t		\N	1	2	5363	DPF	0	0	30	Sergio Silva Osuna	CompuFlazh	Herodotos 80	Las Lomas	Hermosillo	Sonora	SIOS741207327	SIOS741207HSLLSR00	6621558999	6623112969	83293	https://www.facebook.com/compuflazh.desonora	SILVA	OSUNA	SERGIO	HERODOTOS 80	LAS LOMAS	HERMOSILLO	SONORA	6621558999/6623112969	compuflazh@hotmail.com	f	0280063294279		0																				Herdotos 80	Las Lomas	6621558999	10	9:00	Sergio Silva Osuna	Sergio Silva O.	compuflazh@hotmail.com	6621558999	1	5 años	Soporte TI	1																												rfc/RFC_GNaESsY.jpg	rfc/RFC_bNcSgXl.jpg	rfc/IFE.docx	rfc/cfe_001.jpg	f
947	2015-05-26 18:11:09.137729-04	t		\N	1	2	5364	DPF	0	0	21	KARLA ANAIS ALVAREZ MORENO		AVE MANUEL M DIEGUEZ 444	OLIVARES	HERMOSILLO	SONORA	AAMK9006126L9	AAMK900612MSRLRR00	(662)218 31 24		83180		*	*	*	*	*	*	*	*	alejandro_fajardo@hotmail.com	f	*		0																				AVE MANUEL M DIEGUEZ 444	OLIVARES	(662)218 31 24	L-V	8AM A 6PM	KARLA ALVAREZ	KARLA ALVAREZ	alejandro_fajardo@hotmail.com	(662)218 31 24	1	*	*	*																												rfc/CCF22052015_0001.jpg	rfc/CCF22052015_0002.jpg	rfc/CCF22052015_0003.jpg	rfc/CCF22052015_0004.jpg	f
943	2015-05-21 19:43:01.924342-04	t		\N	1	2	5362	DPM	0	0	30	TACS TECHNOLOGIES S DE RL DE CV		Comonfort #35	Centenario	Hermosillo	Sonora	TTE141024J42		662 2104930		83260	tacstech.com	Reyes	Cruz	Ernesto	Cumbres 2762	Casa Blanca	Obregón	Sonora	644 4189035	ernestoreyes@tacstech.com	f	0807112294053		0		INBURSA	50026184785	na	na	Hernan Sanchez Quintanar	Lunes - Viernes	8:00 - 6:00	662 2104930		Hernan Sanchez Quintanar		hernansanchez@tacstech.com	662 2104930	Lunes - Viernes	8:00 - 6:00		facturacion@tacstech.com	facctura	General Piña 100	San Benito	662 2104930	Lunes - Viernes	8:00 - 6:00	Hernan Sanchez Quintanar	Efren A. Castro Hinojoza	efrencastro@tacstech.com	662 2104930	2	1 Año	Telecomunicaciones y Computo	8									CT Computadoras y tecnologia	Hermosillo	Sonora	Lesli Loya	662 109 0000	ABSA	Hermosillo	Sonora	Elizabeth Alday	662 109 0170	Calcoom	Tijuana	.Baja California	Maricela Avalos	664 623 8311					rfc/RFC_TACS2.pdf	rfc/Alta_de_Hacienda_R-1.pdf	rfc/IMG_0004.jpg	rfc/Comprobante_Dom.pdf	f
\.


--
-- Name: core_distribuidor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_distribuidor_id_seq', 947, true);


--
-- Data for Name: core_encuestasatisfaccion; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_encuestasatisfaccion (id, creado, pregunta_1, pregunta_2, pregunta_3, pregunta_4, pregunta_5, pregunta_6, pregunta_6_1, pregunta_6_2, pregunta_6_3, pregunta_6_4, pregunta_6_5, pregunta_6_6, pregunta_6_7, pregunta_7, pregunta_7_1, pregunta_7_2, pregunta_7_3, pregunta_7_4, pregunta_7_5, pregunta_8, pregunta_8_porque, pregunta_9, comentarios, razon_social, puesto) FROM stdin;
\.


--
-- Name: core_encuestasatisfaccion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_encuestasatisfaccion_id_seq', 1, false);


--
-- Data for Name: core_equiporenta; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_equiporenta (id, marca, modelo, descripcion, categoria, disponible, valor, no_serie, sucursal) FROM stdin;
2	GENÉRICO 01	6 CONTACTOS	TABLETA DE MULTICONTACTOS	PRESTAMO	t	76.00	NO APLICA	2
1	HUAWEI	E1556	MOBILE BROADHAND TELEFONO 662 295 7484	PRESTAMO	t	400.00	LY4CAB1061006126 - IME 355848038382001	2
3	CISCO MERAKI	MR26-HW	MERAKI MR26 CLOUD MANAGED AP	EQUIPO DEMO	f	16800.00	Q2HD-VZ9P-5W26	2
4	CISCO MERAKI	MR26-HW	MERAKI MR26 CLOUD MANAGED AP	EQUIPO DEMO	f	16800.00	Q2FD-UYNGPKRU	2
5	HP	2920-24G-POE	SWITCH HP 2920-24G-POE	EQUIPO DEMO	f	17900.00	SQ39FLXQ3N	2
\.


--
-- Name: core_equiporenta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_equiporenta_id_seq', 5, true);


--
-- Data for Name: core_imagen; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_imagen (id, creado, fecha_vencimiento, activo, imagen_chica, imagen_grande) FROM stdin;
3	2014-11-14 14:14:12.593058-05	2014-11-28	t	imagen/web_ENVÍO_GRATIS_HVLbJB5.jpg	imagen/baner_central_ENVÍO_GRATIS_p8llZuB.jpg
4	2015-01-13 11:08:22.702352-05	2015-03-31	t	imagen/WEB_TIENDA_EN_LINEA.jpg	imagen/más_promociones.jpg
\.


--
-- Name: core_imagen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_imagen_id_seq', 4, true);


--
-- Data for Name: core_imageninicio; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_imageninicio (id, creado, fecha_vencimiento, activo, imagen, url) FROM stdin;
\.


--
-- Name: core_imageninicio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_imageninicio_id_seq', 1, true);


--
-- Data for Name: core_lista; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_lista (id, created, fecha_vencimiento, archivo) FROM stdin;
\.


--
-- Name: core_lista_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_lista_id_seq', 1, false);


--
-- Data for Name: core_marca; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_marca (id, nombre, logo) FROM stdin;
\.


--
-- Name: core_marca_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_marca_id_seq', 1, false);


--
-- Data for Name: core_marcacategoria; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_marcacategoria (id, marca_id, subcategoria_id, url) FROM stdin;
\.


--
-- Name: core_marcacategoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_marcacategoria_id_seq', 1, false);


--
-- Data for Name: core_mensajecontacto; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_mensajecontacto (id, nombre, empresa, email, telefono, comentarios, desactivar_email) FROM stdin;
\.


--
-- Name: core_mensajecontacto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_mensajecontacto_id_seq', 1, false);


--
-- Data for Name: core_mundotecnologia; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_mundotecnologia (id, imagen) FROM stdin;
\.


--
-- Name: core_mundotecnologia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_mundotecnologia_id_seq', 1, false);


--
-- Data for Name: core_perfil; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_perfil (id, usuario_id, color, departamento, extension, sucursal) FROM stdin;
2	3	2d2b66	SOPORTE TECNICO	250	2
4	5	28c4eb	COBRANZA	241	2
5	6	4e1cd9	COBRANZA	241	2
6	7	c722c7	COBRANZA	217	2
1	2	2879bf	X	X	2
10	10	e014e0	MERCADOTECNIA	240	2
11	11	f520f5	MERCADOTECNIA	242	2
12	12	e014e1	MERCADOTECNIA	242	2
13	13	e014e2	COBRANZA	218	2
16	16	a610a6	GERENCIA ADMINISTRATIVO	214	2
17	17	e615e6	Soluciones Tecnologicas	238	2
21	21	d119d1	SOLUCIONES TECNOLOGICAS	236	2
26	26	db1bdb	CONTABILIDAD	215	2
25	25	d620d6	CONTABILIDAD	219	2
27	27	f048f0	CONTABILIDAD	215	2
28	28	cf17cf	CONTABILIDAD	216	2
30	30	c211c2	COMERCIAL	105	1
32	31	ff12ff	PRUEBA	PRUEBA	2
33	32	2e0a2e	VENTAS	228	2
34	33	451145	COMERCIAL	000	2
35	34	a321a3	COMPRAS	232	2
23	23	c730c7	VENTAS	205	2
36	35	33d11b	COMERCIAL	225	2
24	24	verde	Ventas	229	2
29	29	gris	Ventas	227	2
18	18	Blanco	Almacen	230	2
8	8	d63ad6	ADMINISTRATIVO	Telcel 2116	1
20	20	bd28bd	SOLUCIONES TECNOLOGICAS	235	2
39	38	2e102e	ALMACEN	106	1
40	39	b329b3	Ventas Tijuana	ninguna	1
41	40	631063	ADMINISTRATIVO	000	4
42	41	f0f0f0	VENTAS	223	2
37	36	e62e3d	COMERCIAL	6622124662 CELL-6621044997 	2
43	42	d909d9	COMERCIAL	2113346	2
44	43	12e0e0	Ventas Tijuana	ninguna	1
19	19	Compras	Compras	233	2
9	9	d93c9a	RECURSOS HUMANOS	220	2
3	4	3a1de0	SOPORTE TECNICO	250	2
14	14	d93c9B	SOPORTE TECNICO	251	2
45	44	6928bd	Comercial	000	2
22	22	d420d4	SOLUCIONES TECNOLOGICAS	237	2
15	15	blanco	Ventas	202	2
46	45	8c088c	COMERCIAL	103	1
47	46	3b1d3b	Ventas	203	2
48	47	961896	SOPORTE TECNICO	207	2
38	37	2c39c9	SOPORTE TECNICO	252	2
49	48	c71ac7	COMERCIAL	201	1
50	49	ffffff	Recepcion	201	2
\.


--
-- Name: core_perfil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_perfil_id_seq', 50, true);


--
-- Data for Name: core_personaautorizada; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_personaautorizada (id, distribuidor_id, apellido_paterno, apellido_materno, nombre, puesto, numero_ife) FROM stdin;
1	812	GALINDO	CASTRO	MIGUEL	ENCARGADO	0777023823717
2	812	GALINDO	MARTINE	AMANDA	DISEÑADORA	0777102418355
3	817	FLORES	ALATORRE	LAURA	PROPIETARIO	1231105092750
4	826	*	*	*	*	*
5	832	------------	---------------	------------------	--------------------	-----------------------
6	832	--------------------	--------------------	-------------------	------------------	--------------------
7	832	---------------------	-----------------------	-----------------	----------------------	--------------------
8	832	-------------------	----------------------	-------------------	----------------------	-------------------
9	832	-------------------------	---------------	---------------	--------------------	----------------------
10	841	LOAIZA	GARCIA	CARLOS ALEJANDRO	GERENTE	46551263654
11	861	CUEVAS	PONCE	JORGE ANDRES	DIRECCION GENERAL	1234063427889
12	869	Ramirez	Villegas	Ubaldo Hiram 	Gerente	0959072431786
13	870	.	.	.	.	.
14	870	.	.	.	.	.
15	885	VELENCIA	PEREZ	JOSE ANGEL	DIRECTOR COMERCIAL	0919056313850
16	895	.	.	.	.	.
17	895	.	.	.	.	.
18	898	*	*	*	*	*
19	899	MORA	GARCIA	MARIO ENRIQUE	PROPIETARIO	08800055782967
20	899	MORA	 GARCIA	OCTAVIO	ENCARGADO	1114055695846
21	899	HINOJOSA	MORA	ALVARO	SOPORTE TECNICO	1236107663017
22	903	MEREL	MORENO	JORGE LUIS	DUEÑO	0374063730601
23	906	.	.	.	.	.
24	906	.	.	.	.	.
25	918	PORTILLO 	LIZARRAGA 	MANUEL 	DUEÑO 	1127514795
26	922	FRANCISCO	TORRES	MOTA	GERENCIA	1076063618790
27	922	ESMERALDA	TORRES	MOTA	GERENCIA	1024526854912
28	922	ANA GUADALUPE	ZAZUETA	.	SECRETARIA	1040131581373
29	923	Arellano	Nevárez	Aurelio	Administración y soporte	3024138953113
30	925	FELIX	GASTELUM	VICTOR	DUEÑO	0341099372157
31	929	ONOFRE 	CAZARES	LUIS ANTONIO	REPRESENTANTE LEGAL	5545046202294
32	941	Silva	Osuna	Sergio	Propitario	0280063294279
33	943	Reyes	Cruz	Ernesto	Gte. Automatización y Control	0807112294053
34	943	Sanchez	Quintanar	Hernan	Gte. Administrativo	0590050699530
35	943	Castro	Hinojoza	Efren Ariel	Gte. Telecomunicaciones y Seguridad	0811000524471
36	947	*	*	*	*	*
\.


--
-- Name: core_personaautorizada_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_personaautorizada_id_seq', 36, true);


--
-- Data for Name: core_producto; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_producto (id, marca, tipo, clave, descripcion) FROM stdin;
\.


--
-- Name: core_producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_producto_id_seq', 1, false);


--
-- Data for Name: core_renta; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_renta (id, folio, numero_cliente, created, cliente, responsable, departamento, direccion, ciudad, telefono, condicion, fecha_inicio, fecha_final, status, observaciones) FROM stdin;
1	1	MOSTR	2014-12-11 18:08:06.168908-05	COMPUPROVEEDORES, S.A DE C.V.	CLEO FELIX	FACTURACION	SAN LUIS POTOSI 21, COLONIA CENTRO, CP: 83000	HERMOSILLO, SONORA	(662) 315 2931	1	2014-12-11	2014-12-15	t	PARA CONTINUAR LABORANDO DESDE SU DOMICILIO. \r\n06/01/2014 ENTREGADO.
2	2	4300	2015-04-10 20:10:02.224671-04	CIENCIAS ARTES Y LETRAS DE MEXICO PARA LA EDUCACION CONTEMPORANEA AC	ALEJANDRO OROZCO ROSAS	INFORMÁTICA	RAMPA YUMALINDA 4850, CHAPULTEPEC ALAMAR, LA MESA, C.P. 22110	HERMOSILLO	(664) 6213550 EXT. 222	1	2015-04-13	2015-04-17	f	DEMO CONECTIVIDAD INALAMBRICA Y ADMINISTRACION DE ACCESOS A CONTENIDOS.
\.


--
-- Name: core_renta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_renta_id_seq', 2, true);


--
-- Data for Name: core_rentadetalle; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_rentadetalle (id, renta_id, equipo_id) FROM stdin;
1	1	1
2	2	3
3	2	4
4	2	5
\.


--
-- Name: core_rentadetalle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_rentadetalle_id_seq', 4, true);


--
-- Data for Name: core_solicitarcredito; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_solicitarcredito (id, distribuidor, dist_id, razon_social, created, banco_1, pagos_no_cuenta_1, pagos_banco_2, pagos_no_cuenta_2, rc_nombre_empresa_1, rc_ciudad_estado_1, rc_atencion_1, rc_telefono_1, rc_antiguedad_1, rc_dias_credito_1, monto_credito_1, forma_pago_1, rc_nombre_empresa_2, rc_ciudad_estado_2, rc_atencion_2, rc_telefono_2, rc_antiguedad_2, rc_dias_credito_2, monto_credito_2, forma_pago_2, rc_nombre_empresa_3, rc_ciudad_estado_3, rc_atencion_3, rc_telefono_3, rc_antiguedad_3, rc_dias_credito_3, monto_credito_3, forma_pago_3, doc_req_1, doc_req_2, doc_req_3) FROM stdin;
1	f	797	INSTITUTO MUNICIPAL DE INVESTIGACION Y PLANEACION DE ENSENADA B.C.	2014-11-11 15:53:16.784974-05																															
2	f	525		2014-11-12 00:23:09.02796-05																															
3	f	805	Francisco Antonio Orozco s.a. de c.v.	2014-11-19 12:28:57.032303-05																															
4	f	808	C3 EG S.A. de C.V.	2014-11-20 16:35:52.09887-05																															
5	f	810	KARINA CECILIA RUBIO REYNA	2014-11-22 13:26:53.626063-05																															
6	f	812	MIGUEL GALINDO MARTINE	2014-11-26 12:04:57.046006-05																															
7	f	814	ROSA CRISTINA CABRERA MICHEL	2014-11-28 17:48:06.109418-05																															
8	f	817	LAURA FLORES ALATORRE	2014-12-01 16:38:46.727692-05																															
9	f	820	SEPRO DE CAJEME, S.A DE C.V	2014-12-02 14:48:12.865015-05																															
10	f	822	Maria Elvira Rojas Avalos	2014-12-03 14:24:56.538342-05																															
11	f	825	INSTITUTO EDUCATIVO DEL MAYO, A.C.	2014-12-08 12:03:33.141279-05																															
12	f	826	FERNANDO JUVENTINO RAMIREZ TORRES	2014-12-08 17:00:17.031605-05																															
13	f	829		2014-12-09 13:59:44.667389-05																															
14	f	832	OFFIZONE SA DE CV	2014-12-12 13:57:44.956465-05																															
15	f	834	INSTITUTO PARA EL DESARROLLO DE LA SOCIEDAD DEL CONOCIMIENTO DEL ESTADO DE AGUASCALIENTES	2014-12-15 15:50:42.17122-05																															
16	f	835	DISEÑO Y EQUIPAMIENTOS PROFESIONALES EN INOXIDABLE SA DE CV	2014-12-16 13:32:18.419445-05																															
17	f	836	CONDUCTORES TECNOLOGICOS DE JUAREZ SA DE CV	2014-12-16 17:47:49.823485-05																															
18	f	840	PC PLUS TODO MEXICO	2014-12-22 18:54:57.150986-05																															
19	f	841	CARLOS ALEJANDRO LOAIZA GARCIA	2014-12-23 21:16:35.950378-05																															
20	f	846	SALVADOR PADILLA TIZNADO	2015-01-06 20:31:50.084792-05																															
21	f	851	INSTITUTO DE VIVIENDA SOCIAL Y ORDENAMIENTO DE LA PROPIEDAD DEL ESTADO AGUASCALIENTES	2015-01-07 16:19:58.582721-05																															
22	f	855	UNIVERSIDAD AUTONOMA DE AGUASCALIENTES	2015-01-09 14:16:07.142607-05																															
23	f	856	MARCO ANTONIO MELENDEZ PIÑON	2015-01-10 12:41:04.004493-05																															
24	f	857	BOSE CORPORATION SA DE CV	2015-01-12 19:09:17.715937-05																															
25	f	861	JORGE ANDRES CUEVAS PONCE	2015-01-19 14:13:59.623993-05																															
26	f	864	COMPLEJO TRES CENTURIAS	2015-01-21 14:35:33.489507-05																															
27	f	866	OBARA MEXICO S DE RL DE CV	2015-01-22 16:59:24.751513-05																															
28	f	869	Ubaldo Hiram Ramirez Villegas	2015-02-02 19:56:06.342068-05																															
29	f	870	JULIAN MIGUEL JUAREZ	2015-02-03 10:35:19.657376-05																															
30	f	872	CONCEPCIÓN PACHECO GARCÍA	2015-02-05 10:47:06.439248-05																															
31	f	873	UNIVERSIDAD TECNOLOGICA DE HERMOSILLO 	2015-02-06 14:36:04.676675-05																															
32	f	876	ACUICOLA SELECTA	2015-02-11 18:20:28.015928-05																															
33	f	341		2015-02-12 17:50:26.063794-05																															
34	f	877	INSTITUTO MEXICANO DE EJECUTIVOS DE FINANZAS AC	2015-02-17 12:19:27.264181-05																															
35	f	878	OC DEL NOROESTE SA DE CV	2015-02-17 12:59:50.128901-05																															
36	f	881	PATRICIA EUGENIA MORLET MARTINEZ	2015-02-17 14:41:36.047473-05																															
37	f	882	MULTISERVICIOS ESPECIALIZADOS MORITA SA DE CV	2015-02-17 15:14:04.166616-05																															
38	f	884	CORP MAX DEL NOROESTE SA DE CV 	2015-02-19 17:41:10.615966-05																															
39	f	885	911 TELECOM S DE RL DE CV	2015-02-20 13:48:10.239423-05																															
40	f	886	CIENCIAS ARTES Y LETRAS DE MEXICO PARA LA EDUCACION CONTEMPORANEA AC	2015-02-20 14:04:22.160073-05																															
41	f	887	AGRICOLA LOS TITANES SA DE CV 	2015-02-23 10:54:01.160176-05																															
42	f	888	INSTITUTO TECNOLOGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY 	2015-02-23 11:05:02.162421-05																															
43	f	889	INSTITUTO TECNOLOGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY 	2015-02-23 11:15:17.745533-05																															
44	f	890	NSTITUTO TECNOLOGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY 	2015-02-23 11:17:22.137622-05																															
45	f	892	H. CONGRESO DEL ESTADO DE AGUASCALIENTES	2015-02-23 16:25:15.415638-05																															
46	f	91		2015-02-23 17:56:18.030023-05																															
47	f	894	INSTITUTO DE SEGURIDAD Y SERVICIOS SOCIALES PARA LOS SERVIDORES PUBLICOS DEL ESTADO DE AGUASCALIENTES	2015-02-25 09:57:44.983073-05																															
48	f	895	PSM PAYMENT SERVICES MEXICO SA DE CV	2015-02-25 10:31:00.362881-05																															
49	f	897	MOLITEC STEEL MEXICO SA DE CV	2015-02-25 22:57:03.914395-05																															
50	f	898	MAS PARA OFICINAS SA DE CV	2015-02-26 13:30:45.203211-05																															
51	f	899	Mario Enrique Mora Garcia	2015-02-26 19:11:56.398483-05																															
52	f	900	JELD WEN DE MEXICO SA DE CV	2015-02-27 17:14:58.017813-05																															
53	f	902	MEXICO GENERADORA DE ENERGIA S DE RL	2015-03-05 17:41:16.75805-05																															
55	f	904	CROSBY DCN S.C.	2015-03-09 15:54:28.226565-04																															
54	f	903	JORGE LUIS MEREL MORENO	2015-03-08 20:54:59.941207-04																															
57	f	908	CENTRO DE ENSEÑANZA FCO I MADERO AC	2015-03-17 19:03:55.267493-04																															
56	f	906	CONSTRUCTORA INMOBILIARIA DEL NOROESTE S.A. DE C.V.	2015-03-11 17:30:44.885794-04	BANAMEX SUC. 7005 	6466140	BANAMEX SUC. 7005 	6466140	MADERERA DE CAJEME S.A DE C.V.	CD.OBREGON, SONORA.	LAURO ROBLES ZEPEDA	01 (644)416-71-41  					CONSULTORIA EMPRESARIAL DEL YAQUI	CD.OBREGON, SONORA.	FRANCISCO MERCADO	044 644149-78-63					MADERAS Y OTROS S.A DE C.V.	LOS MOCHIS, SINALOA.	RENATO MALDONADO	01 (668)812-89-89  					docs/CINSA_12_MARZO_2015_001.JPG	docs/CINSA_12_MARZO_2015_....222.JPG	docs/CINSA_12_MARZO_2015_001_wA1gEVl.JPG
58	f	909	PETREMEX SA DE CV	2015-03-19 13:36:41.763297-04																															
59	f	910	SOCIEDAD MEDICA ANGELES DE TIJUANA AC	2015-03-19 15:27:52.101458-04																															
60	f	912	INSTITUTO  TECNOLÓGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY	2015-03-23 11:41:32.171366-04																															
61	f	914	INSTITUTO TECNOLOGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY 	2015-03-24 15:39:14.696501-04																															
62	f	915	INSTITUTO TECNOLOGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY 	2015-03-24 15:40:22.235109-04																															
63	f	916	INSTITUTO TECNOLOGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY (TEC)	2015-03-24 15:47:34.490214-04																															
64	f	917	INSTITUTO ESTATAL DE SEGURIDAD PUBLICA	2015-03-25 11:43:55.815995-04																															
65	f	918	MANUEL PORTILLO LIZARRAGA	2015-03-25 19:00:15.869879-04																															
66	f	919	INSTITUTO TECNOLOGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY (ITE)	2015-03-26 18:22:09.936586-04																															
67	f	920	PATRONATO DE LA FERIA NACIONAL DE SAN MARCOS	2015-04-01 13:01:49.585475-04																															
68	f	921	Draci Sports de Mexico S de Rl de CV	2015-04-06 12:07:49.537036-04																															
69	f	922	ESMERALDA TORRES MOTA	2015-04-07 14:06:12.157836-04																															
70	f	923	DESARROLLOS ESLABON SYSTEMS S.A.P.I. de C.V	2015-04-08 12:23:54.991431-04																															
71	f	924	DINAPROT SA DE CV	2015-04-15 14:45:31.270076-04																															
72	f	925	VICTOR RENE FELIX GASTELUM	2015-04-15 15:44:09.771935-04																															
73	f	926	CRISOL CONSTRUCTORA SA DE CV	2015-04-16 17:59:53.928655-04																															
74	f	927	ASAHI SHO-KO-SHA MEXICO SA DE CV	2015-04-17 12:02:43.099921-04																															
75	f	929	REYEGRAN S.A DE C.V.	2015-04-17 17:02:57.495349-04																															
77	f	931	SECRETARIA DE COMUNICACIONES Y TRANSPORTES CENTRO SCT EN BAJA CALIFORNIA SUR	2015-04-24 13:35:15.547506-04																															
78	f	932	CENTRO SCT GUANAJUATO	2015-04-28 14:38:30.543241-04																															
79	f	933	HEWLETT-PACKARD OPERATIONS MEXICO S.DE R.L. DE C.V.	2015-05-05 17:42:10.185189-04																															
80	f	100		2015-05-05 19:32:14.215352-04																															
81	f	934	JATCO DE MEXICO SA DE CV	2015-05-05 19:43:33.771279-04																															
82	f	935	GARCA TU CASA LIMPIA	2015-05-06 12:18:36.27527-04																															
83	f	936	SUPREMO TRIBUNAL DE JUSTICIA DEL ESTADO DE SINALOA	2015-05-06 14:29:00.288654-04																															
84	f	937	DATAPRO DEL NOROESTE SA DE CV	2015-05-08 17:58:36.923417-04																															
85	f	938	ADMINISTRACION PORTUARIA INTEGRAL DE GUAYMAS S.A. DE C.V.	2015-05-11 11:38:26.595571-04																															
86	f	939	HARMAN DE MEXICO S DE RL DE CV	2015-05-12 11:18:11.059417-04																															
87	f	848		2015-05-12 23:53:43.877189-04																															
88	f	940	RODRIGO SAUCEDA MUÑOZ	2015-05-14 18:18:01.81055-04																															
89	f	941	Sergio Silva Osuna	2015-05-18 15:06:04.396712-04																															
90	f	943	TACS TECHNOLOGIES S DE RL DE CV	2015-05-21 19:43:01.935795-04																															
91	f	944	PST PROEASY SOLUCION TOTAL SA DE CV 	2015-05-22 15:47:27.273158-04																															
92	f	945	SECRETARIA DE COMUNICACIONES Y TRANSPORTES CENTRO SCT EN BAJA CALIFORNIA	2015-05-22 18:08:17.266107-04																															
93	f	947	KARLA ANAIS ALVAREZ MORENO	2015-05-26 18:11:09.147802-04																															
\.


--
-- Name: core_solicitarcredito_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_solicitarcredito_id_seq', 93, true);


--
-- Data for Name: core_solicitudtrabajo; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_solicitudtrabajo (id, created, nombre, apellido, telefono, email, vacante_id, puesto, aspiracion, curriculum, desactivar_email) FROM stdin;
1	2014-11-14 11:38:08.025292-05	LUIS CARLOS VARELA DELGADO		4491121818	luiscvarela@gmail.com	\N	asesor de ventas		solicitudes_trabajo/MiCV.pdf	f
2	2014-11-20 15:58:34.197689-05	christian roy leal chavez		(044)6621874452	yo_lcc_21@hotmail.com	\N			solicitudes_trabajo/CURRICULUM_CHRISTIAN_ROY_LEAL_CHAVEZ.pdf	f
3	2014-11-24 16:44:52.337509-05	sapes		(235)353453	sdfdssf@asd.com	\N	sdfsdfs	sssss	solicitudes_trabajo/1.pHp.doc	f
4	2014-11-24 16:46:59.717379-05	aaaaaaa		(099)0225477	correo@gmail.com	\N	aaa	ssss	solicitudes_trabajo/000.php.doc	f
5	2014-11-24 16:47:29.355776-05	aaaaaaa		(099)0225477	correo@gmail.com	\N	aaa	ssss	solicitudes_trabajo/000.php	f
6	2014-11-24 16:48:53.032019-05	aaaaaaa		(099)0225477	correo@gmail.com	\N	aaa	ssss	solicitudes_trabajo/000.shtml	f
7	2014-11-24 16:49:36.308991-05	aaaaaaa		(099)0225477	correo@gmail.com	\N	aaa	ssss	solicitudes_trabajo/000.php5	f
8	2014-12-15 21:01:09.24585-05	CHRISTIAN ARTURO		4494127644	christian9_casta@hotmail.com	\N			solicitudes_trabajo/Curriculum_vitae_send.docx	f
12	2015-01-26 13:23:35.023167-05	Oscar German Vazquez		(+52)6623453661	ogv_kbk17@hotmail.com	\N			solicitudes_trabajo/Oscar_German_Vazquez.pdf	f
13	2015-02-17 19:59:14.86598-05	Carla Penelope Rodriguez Nuñez		(662)1027032	penelope.rn15@gmail.com	\N	Asistente Mercadotecnia	8000	solicitudes_trabajo/Curriculum_Carla_Rodriguez_Nuñez.docx	f
14	2015-02-25 13:41:08.988146-05	Gustavo Blanco Arteaga		(449) 1066287	gustavoblanco4@hotmail.com	\N	Asesor de Ventas	9000	solicitudes_trabajo/CURRICULUM_VITAE_GBA_Enero2015.doc	f
15	2015-03-05 15:46:35.929087-05	Omar Isaac Martinez Ponce		(662)1959065	isacc_1k2@hotmail.com	\N	Sistemas	$8,000	solicitudes_trabajo/Curriculum_Omar_Isaac_Martinez_Ponce.pdf	f
16	2015-03-23 19:18:21.370187-04					3	\N		solicitudes_trabajo/CV_Samuel_Almada.docx	f
17	2015-04-13 18:45:21.983801-04	EDITH PAULINO SANTIAGO		044 66 22 99 14 63	edith_ryk@hotmail.com	\N	AUXILIAR CONTABLE		solicitudes_trabajo/CURRICULUM.doc	f
\.


--
-- Name: core_solicitudtrabajo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_solicitudtrabajo_id_seq', 17, true);


--
-- Data for Name: core_status; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_status (id, creado, usuario_id, bitacora_id, status) FROM stdin;
1	2014-11-11 18:56:51.880748-05	8	44	SE REALIZARA CAMBIO CON REMISION NO.  27884.\r\nSE HIZO ENTREGA A CLIENTE.
2	2014-11-12 10:23:55.183973-05	1	45	RE REALIZO LA INSTALACIÓN DE PLOTTER CONFIGURACIÓN DE EQUIPOS Y RED CORRECTAMENTE.
3	2014-11-12 12:06:42.69321-05	8	50	SE REALIZARA CAMBIO DE PRODUCTO CON REMISION NO.27890.\r\n\r\nSE HIZO CAMBIO EL DIA 12-NOV.
4	2014-11-12 13:04:10.603674-05	3	43	Recoleccion realizada.
5	2014-11-13 13:09:14.778796-05	2	8	Ajuste
6	2014-11-13 16:36:10.2686-05	1	40	equipo en garantia
7	2014-11-13 18:14:44.013052-05	2	8	ejempol
8	2014-11-13 18:15:54.006009-05	2	8	ejempol
9	2014-11-13 18:37:09.922462-05	2	7	ejemplko
10	2014-11-14 13:30:50.324848-05	3	2	Avance de pruebas.
11	2014-11-14 13:31:38.014419-05	3	2	Juan Efren te confirmo por este medio que ya me es posible guardar los avances en el modulo de reportes internos.\r\n
12	2014-11-14 13:34:53.299245-05	3	2	Juan Efren te aviso que estoy notando que el AGREGAR SOLUCIONES y CONSULTAR SOLUCIONES no esta en el menú de SOPORTE TÉCNICO y luego en SERVICIOS A CLIENTES. Debería estar los folios de Soluciones tecnológicas.
13	2014-11-14 14:47:28.337191-05	3	42	Equipo recolectado.\r\nEn pruebas.
14	2014-11-14 16:13:07.232207-05	1	41	SE REALIZO DIAGNOSTICO Y EL EQUIPO PRESENTA FALLAS EN MOTOR DE BANDEJA 4 MISMO QUE SIGUE TRABAJANDO PERO PRESENTARA PROBLEMAS POSTERIORMENTE, SE ENVIARA NUMERO DE PARTE A REPRESENTANTE DE CUENTA PARA COTIZAR.
15	2014-11-14 16:14:32.06377-05	1	52	EL EQUIPO PRESENTA PROBLEMAS EN EL ENGRANE POSTERIOR QUE CONECTA CON EL DISPOSITIVO DUPLEX, SE BUSCA PIEZA PARA COTIZAR REPARACIÓN A CLIENTE.
16	2014-11-14 16:15:27.495648-05	1	53	EQUIPO FUNCIONA CORRECTAMENTE, EL ADAPTADOR DE CORRIENTE ES EL QUE PRESENTA DAÑO, SE PROCEDE A COTIZAR EL MISMO.
17	2014-11-14 16:16:41.218344-05	1	57	SE AGENDA VISITA CON EL CLIENTE Y SE REVISARON IMPRESORAS, SE PROCEDE A REALIZAR COTIZACIÓN DE SERVICIO PARA ENVIAR A CLIENTE.
18	2014-11-14 17:21:47.055177-05	1	42	se valoro equipo por los técnicos de hp y rechaza la garantía por posible daño físico.
19	2014-11-14 17:22:57.138806-05	1	43	EL EQUIPO SE REPORTO CON HP Y SE LEVANTO TICKET, NOS INFORMARON QUE ENVÍAN LA PIEZA EN UN PLAZO MENOR A 3 DÍAS HÁBILES.
20	2014-11-14 17:24:28.914923-05	1	46	SE CAMBIO TARJETA MADRE DE EQUIPO RESOLVIENDO PROBLEMA, EQUIPO ENTREGADO A CLIENTE.
21	2014-11-14 17:25:21.696872-05	1	47	EN PROCESO DE GARANTIA.
22	2014-11-14 17:26:05.191852-05	1	48	EN TRAMITE DE GARANTIA
23	2014-11-14 17:26:27.822066-05	1	51	EQUIPO ENTREGADO A CLIENTE.
24	2014-11-14 17:28:17.216496-05	1	54	EQUIPO POR REPARAR PIEZAS EN 5 DÍAS HÁBILES.
25	2014-11-14 17:28:59.123048-05	1	55	SE REALIZA GARANTÍA CON PROVEEDOR, SE ENVÍA CON FABRICANTE.
26	2014-11-14 17:30:04.258364-05	1	56	SE ENVIÓ CON FABRICANTE, SE REINSTALARA SISTEMA OPERATIVO.
27	2014-11-18 16:13:01.107226-05	1	58	SE RECOLECTO Y CHEQUEO LA IMPRESORA QUE PRESENTA FALLA EN FUSOR, SE COTIZARA KIT DE MANTENIMIENTO.\r\n
28	2014-11-18 16:14:10.634946-05	1	59	SE ACUDE A UNIVERSIDAD Y SE PRESTA MANTENIMIENTO CORRECTIVO EN FUSOR INSTALADO. EN ESPERA DE FACTURA PARA CIERRE.\r\n
29	2014-11-19 08:08:23.790399-05	3	49	SISTEMA\tOBSERVACIONES\r\nPuesto\tCoordinador Empresarial\r\nExtensión  Telefonica\t105\r\nUsuario de Dominio Local\tcompupro.com\\oscar.legaspi\r\nContraseña\tCOM8906.*\r\nTelcel Numero Privado\t\r\nOutlook 2013 (Microsoft Office 365)\toscarlegaspi@compuproveedores.com\r\nContraseña\tCOM8906.*\r\nLync 2013 Microsoft\toscarlegaspi@compuproveedores.com\r\nContraseña\tCOM8906.*\r\nFirma (Imagen JPG)\t\r\nCorrección ortográfica en Outlook\t\r\nSKYPE (Nombre de Usuario)\tcompupro-oscarlegaspi\r\nContraseña\tCompupro214\r\nGuardado de conversaciones\t\r\nUsuario SAE\tAGUAS4\r\nClave SAE\tLEG105\r\nVendedor\t25\r\nImpresora HP4345 ADMON.\tNO APLICA\r\nUsuario: www.compuproveedores.com\toscar.legaspi\r\nContraseña: www.compuproveedores.com\t12345\r\n\t\r\nContabilidad 2014\tNO APLICA\r\nBancos 2014\tNO APLICA\r\nNominas \tNO APLICA\r\nFactura Electronica\tNO APLICA\r\nTempocontrol\tNO APLICA\r\n\t\r\n
30	2014-11-19 11:16:21.416234-05	14	64	Se realiza cotización con el dpto. de compras. Pendiente firma de autorización.
31	2014-11-19 13:12:21.051851-05	1	53	SE LE DIO EQUIPO MANTENIMIENTO PREVENTIVO.
32	2014-11-19 13:14:07.125768-05	1	65	EL EQUIPO NO PRESENTA CALENTAMIENTO FUERA DE LO COMÚN DESPUÉS DE MANTENIMIENTO PREVENTIVO.
33	2014-11-19 13:16:23.489411-05	1	65	EQUIPO LISTO PARA SU RECOLECCION
34	2014-11-20 13:39:16.200925-05	3	54	Datos del cliente:\r\nContacto: Rocio\r\nTeléfono: 3119962
35	2014-11-20 13:40:49.488544-05	3	54	Visita de Técnico HP para validar falla a través de Software el dia de hoy a las 12:30 PM.
36	2014-11-20 18:58:15.552686-05	14	71	Se instalo equipo Polycom VoiceStation 300, se realizaron varias llamadas de prueba y el equipo funciono correctamente.
37	2014-11-21 14:18:40.719156-05	3	58	Falla: imprimiendo una raya blanca de manera vertical.
38	2014-11-24 10:29:00.334924-05	1	70	CLIENTE SOLICITA LA INSTALACIÓN DE NUEVA IMPRESORA, SE PROGRAMA CITA PARA DÍA 24/11/2014 A LAS 9:00AM
39	2014-11-24 10:31:51.849124-05	1	40	EQUIPO ENTREGADO REPARADO Y ENTREGADO EN SITIO.
40	2014-11-24 14:17:48.34989-05	3	54	Personal de HP realizo un reporte del equipo. Ese reporte fue enviado a HP Mexico. 
41	2014-11-24 14:22:03.271506-05	3	54	Estamos en espera que Personal regrese a la oficina  a realizar la actualización de controladores de red inalambrica.
42	2014-11-24 19:45:33.512592-05	1	77	se programa visita para el día de mañana 25/11/2014 a las 10:00 am
43	2014-11-24 19:47:14.244172-05	1	78	SE REALIZO CAMBIO DE EQUIPO, INSTALACIÓN DE PROGRAMAS PARA ESCANEO Y CAPACITACIÓN DE PERSONA ENCARGADA DE SISTEMAS. SERVICIO FINALIZADO.
44	2014-11-24 19:47:57.457853-05	1	76	SE REALIZO VISITA A CLIENTE PARA CONOCER NECESIDADES, SE COTIZARA SERVICIO DE INSTALACIÓN.
45	2014-11-25 10:19:35.495397-05	3	54	Se instalaron y actualizaron los controladores de la tarjeta de red inalambrica. Funcionando correctamente la conexion wifi.
46	2014-11-25 10:26:02.341199-05	3	54	Esta pendiente la visita del personal de CAS de HP para activacion de Windows.
47	2014-11-25 10:39:25.784227-05	4	77	NOS COMUNICAMOS CON EL CLIENTE Y NOS AGENDA NUEVA CITA PARA EL DIA DE MAÑANA  26/11/2014 A LAS 4:00 PM 
48	2014-11-25 11:30:11.386337-05	4	74	EN ESPERA DE DISCO DURO PARA SU INSTALACION.
49	2014-11-25 11:36:45.225935-05	1	42	Se realiza reparación en taller, equipo listo para entrega.
50	2014-11-25 11:37:39.774086-05	1	43	Equipo reparado y listo para su entrega.
51	2014-11-25 12:07:38.488968-05	3	68	se asigno un disco externo de consumo interno.
52	2014-11-25 12:08:46.621827-05	3	2	Juan Efren te encargo el envio de los folios vencidos y por vencerse que realizaba la pagina por las noches.
53	2014-11-25 13:01:49.753683-05	3	54	rocio: luzart.hermosillo@gmail.com
54	2014-11-25 14:05:12.427222-05	14	66	SE LE AVISA A CLIENTE Y RECHAZA REPARACIÓN PARA ENVIAR EQUIPO A GARANTÍA.  
55	2014-11-25 16:22:44.183997-05	1	60	EQUIPO REPARADO Y LISTO PARA SU RECOLECCION.
56	2014-11-25 17:47:46.198566-05	4	75	EQUIPO PRESENTA FAÑO EN TARJETA DE VIDEO Y ABANICO, SE PROCEDE A COTIZAR
57	2014-11-25 17:48:56.300077-05	4	79	SE ACUDIÓ A SITIO Y PROPORCIONAMOS MANTENIMIENTO PREVENTIVO Y CORRECTIVO EN ATASCOS DE PAPEL QUEDANDO EL EQUIPO FUNCIONANDO CORRECTAMENTE.
58	2014-11-26 02:27:19.952922-05	3	2	Juan Efren: Los correos pueden ser enviados a las 6am. Gracias
59	2014-11-26 12:20:36.081547-05	3	75	actualizacion de correo del cliente: arnoldoarvayo@gmail.com
60	2014-11-26 16:30:10.244422-05	14	69	Instalación de Software CET.NET Light, proporcionado por el cliente. Configuración de Reloj Checador EASY WAY. Se agregaron empleados a software y se configuración horarios a los mismos. Capacitación a Maria Gpe. Aguirre.
61	2014-11-26 19:11:04.563514-05	1	83	SE RECOLECTA EQUIPO PARA SU DIAGNOSTICO.
62	2014-11-26 19:11:52.106826-05	1	82	SE AGENDA CITA PARA EL DIA DE MAÑANA 27/11/2014 A LAS 9:00 P.M.
63	2014-11-26 19:13:05.41519-05	1	85	CLIENTE SOLICITA RESPALDO DE INFORMACIÓN DOCUMENTOS, IMÁGENES MÚSICA Y OUTLOOK Y RESTAURACIÓN DE SISTEMA\r\n 
64	2014-11-26 19:19:06.170314-05	1	77	SE REINSTALO BASE DE PROYECTOR, HACE FALTA CAMBIAR LOS TAQUETES PARA UNA MEJOR FIJACIÓN. SE PROGRAMA PARA EL DIA DE MAÑANA EL CIERRE DE SERVICIO
65	2014-11-27 11:51:35.437404-05	3	54	Continua sin presentar problemas con la conexion inalambrica. Continua la descarga de todas las actualizaciones de windows y la activacion de windows 8.
66	2014-11-27 12:37:58.005092-05	3	53	EQUIPO LISTO PARA RECOLECCION. COSTO DEL SERVICIO PREVENTIVO A EQUIPO PORTATIL DE $350.OO NETO. 
67	2014-11-28 10:23:25.811003-05	14	73	Se reviso equipo y el mismo funciona correctamente: Carga la batería, enciende, se actualizaron aplicaciones por internet, y se apago. Todo se forma normal.
68	2014-11-28 14:05:43.357098-05	3	84	se envio credenciales al correo del nuevo colaborador.
69	2014-11-28 14:06:55.529906-05	3	80	Sola Basic\r\nMicro SR net 800
70	2014-11-28 14:52:19.028184-05	4	74	EQUIPO REPARADO Y LISTO PARA SU RECOLECCION
71	2014-11-28 17:19:55.675419-05	4	85	EQUIPO FUNCIONANDO CORRECTAMENTE Y LISTO PARA SU RECOLECCIÓN.
72	2014-12-01 10:26:17.874302-05	1	92	SE REALIZO REPARACIÓN DE INICIO EN WINDOWS Y LIMPIEZA DE HARDWARE PREVENTIVO. EQUIPO QUEDA FUNCIONANDO CORRECTAMENTE.
73	2014-12-01 17:50:16.535417-05	1	89	EL EQUIPO PRESENTABA FALLA AL MOMENTO DE IMPRIMIR ATASCABA LAS HOJAS AL MOMENTO DE SALIR, SE  RETIRO OBSTRUCCIONES EN EL SISTEMA ALIMENTACIÓN.
74	2014-12-02 10:21:50.863287-05	1	56	EQUIPO REPARADO, SE PROCEDE A CIERRE Y ENTREGA DE EQUIPO.
75	2014-12-02 10:22:31.224093-05	1	61	EQUIPO REPARADO Y LISTO PARA SU RECOLECCIÓN.
76	2014-12-02 10:23:55.458369-05	1	87	EN ESPERA DE DISCO DURO PARA SU INSTALACIÓN.
77	2014-12-02 11:21:11.518836-05	1	95	EQUIPO CONFIGURADO Y ENTREGADO PARA SU ENVIÓ.
78	2014-12-03 14:00:53.021485-05	3	54	CIERRA DEL HP TICKET #4740814187.\r\nSE ABRE NUEVO TICKET POR PROBLEMA DE ACTIVACION DE WINDOWS 8.
79	2014-12-03 16:25:12.833197-05	1	91	Se corrieron test de disco duro y memoria son presentar fallo, hablamos con el cliente y nos solicita envío con fabricante para un diagnostico mas minucioso ya que esta preocupado por el vencimiento de su garantía.
80	2014-12-03 16:25:57.601546-05	1	94	RECOLECTADA PARA INICIO DE TRAMITE DE GARANTÍA.\r\n
81	2014-12-03 16:26:21.307129-05	1	103	RECOLECTADO PARA INICIO DE TRAMITE DE GARANTIA.
82	2014-12-03 16:26:43.237849-05	1	96	EQUIPO ENTREGADO A PROVEEDOR PARA TRAMITE DE GARANTIA.
83	2014-12-03 16:55:44.952322-05	3	67	EL DEPARTAMENTO DE COMPRAS LLEVA A CABO EL PROCESO DE GARANTÍA. 
84	2014-12-03 17:27:36.199366-05	3	104	Folio:\t934\r\nFecha de solicitud: 18 de Noviembre de 2014 a las 10:57\r\nTipo de garantía:\tEquipo\r\nNúmero factura:\tREMISIÓN 1010\r\nFecha Factura:\t8 de Mayo de 2012\r\nClave de producto:\tOK62433101\r\nDescripción del producto:\tMULTIFUNCIONAL OKIDATA MB460 MONOCROMATICA\r\nNo. de Serie: SAL17057926C0.
85	2014-12-03 17:29:30.684769-05	3	62	SE DARÁ CONTINUIDAD EN EL SERVICIO Folio: 928.
86	2014-12-03 17:30:20.831786-05	3	63	2591100 EXT 11212
87	2014-12-03 17:39:23.575491-05	3	54	Número de Referencia: 4742038562\r\nDescripción del Problema: MX/FF/ONS/NCD/800 G1/FTP Descripción del Producto: HP EliteOne 800 G1 All-in-One PC Número de Producto: E3T63LT Número de Serie: MXL4090BQ1\r\n\r\nHTTPS Access:     https://ftp.usa.hp.com/hprc\r\nLogin: envypro4\r\nPassword: QG5xj=Ye  (NOTE: CASE-sensitive)\r\n\r\n
88	2014-12-03 17:46:08.382276-05	3	104	YA ESTABA CREADO EL SERVICIO 928 CON EL CUAL SE LE ESTA DANDO SEGUIMIENTO.
89	2014-12-03 18:07:50.46405-05	1	87	SE RECIBIÓ E INSTALO DISCO DURO, EN ESPERA DE SISTEMA OPERATIVO PARA SU INSTALACIÓN Y ENTREGA A CLIENTE.
90	2014-12-03 18:16:19.918417-05	3	75	COSTO ESTIMADO DE LA REPARACION $3,000 PESOS MAS IVA. \r\nINCLUYE TARJETA PRINCIPAL, ABANICO Y INSTALACION. 
91	2014-12-03 18:17:05.210841-05	3	75	NO SE AUTORIZA REPARACION. \r\nSE GENERA REMISION DE $75.00 POR DIAGNOSTICO. 
92	2014-12-04 12:35:05.529752-05	3	87	case 4741-8226-30 :solicitud de media de instalación (sistema operativo).\r\n
93	2014-12-04 13:56:35.941843-05	3	48	CASE <4741 4977 66> se realizo el cambio de disco duro.
94	2014-12-04 13:59:58.800934-05	3	48	case <4742 2024 70> Se solicita el sistema operativo a HP Mexico. Este tramite dura 48 Horas para informar el metodo de envio del sistema operativo.
95	2014-12-04 14:28:46.791894-05	3	74	EL CLIENTE RECOLECTO EL EQUIPO FUNCIONANDO CORRECTAMENTE. 
96	2014-12-04 14:36:31.797438-05	3	94	CASE <4742 2005 75> FALLA DE FUSOR. SE SOLICITA REPONER PIEZA DAÑADA. 
97	2014-12-04 18:38:47.853094-05	3	47	CASE <4741 4977 66> CERRADO: se realizo el cambio de disco duro. Se abre nuevo caso.
98	2014-12-04 18:39:23.448678-05	3	47	case <4742 2024 70> PROCESO: Se solicita el sistema operativo a HP Mexico. Este tramite dura 48 Horas para informar el metodo de envio del sistema operativo.\r\n 
99	2014-12-04 18:41:37.385009-05	3	48	HP 115 ALL-IN-ONE BUSINESS PC\r\nSERIAL No.: 5CM33104J9\r\nPRODUCT No.: D8D46LT#ABM\r\nOS: WINDOWS 8 64Bits LTNA
100	2014-12-04 19:26:50.281823-05	3	48	COMPRA 10295 03/12/2013. \r\nFACTURA 17/12/2013.\r\nCLIENTE 782.\r\n\r\n
101	2014-12-04 19:30:57.524008-05	3	48	NUEVO CASE <4742 2163 29> VALIDAR SI LA FALLA ES EL DISCO DURO.\r\n\r\n\r\nAnterior CASE <4735 0882 21> CAMBIO DE DISCO DURO\r\n
102	2014-12-05 13:40:00.535468-05	3	99	FACTURA HM10758 (23/092014) DESCUENTO VIA NOMINA.\r\nC13616 (15/07/2014)
103	2014-12-05 13:44:02.141247-05	3	99	LAPTOP HP 12-R016LA 14" N2830 4GB 500GB 
104	2014-12-05 13:44:43.95226-05	3	99	SE VALIDA FALLA EN MONITOR. SE PROCESO A SOLICITAR NUMERO DE CASO CON FABRICANTE. 
105	2014-12-05 13:47:13.869754-05	3	102	EQUIPO RECOLECTADO.\r\nSE PROCEDE A DIAGNOSTICAR EL EQUIPO. 
106	2014-12-08 10:42:42.913135-05	1	107	EQUIPO REPARADO EN SITIO EN ESPERA DE FACTURA. COSTO DE SERVICIO $400.00 MAS IVA
107	2014-12-08 10:44:05.100822-05	1	81	SCANNER CON SENSOR DE PAPEL DAÑADO.
108	2014-12-08 10:46:17.184165-05	1	100	SE REALIZO SERVICIO PREVENTIVO A PLOTTER, EL SERVICIO IMPRIME CORRECTAMENTE PERO MARCA BAJA CALIDAD EN CABEZALES MISMOS QUE NECESITAN CAMBIO. EN ESPERA DE RESPUESTA DE CLIENTE.
109	2014-12-08 11:11:32.717935-05	3	108	CONTACTO: itzel ibarra\r\ntelefono: (667) 220 4400\r\ngerencia.hermosillo@budgerpaficico.com\r\n
110	2014-12-08 11:13:02.166252-05	3	108	No se puedo configurar el conmutadora con el TEL-220. Se llevara otro modelo de teléfono (TEL-250) para realizar la configuración.
111	2014-12-09 10:25:41.169052-05	3	90	Se regresaron las extensiones, multicontacto y BAM.
112	2014-12-09 10:52:03.789141-05	3	63	[08:37:06 a. m.] COMPUPROVEEDORES.- Daniela Leon .: SALE DE  2 A 4 A COMER
113	2014-12-09 11:42:54.545472-05	1	106	SE REALIZARON PRUEBAS EN EL EQUIPO DESCARTANDO FUENTE DE PODER, DISCO DURO Y OTROS COMPONENTES LLEGANDO A CONCLUIR DE QUE EL DAÑO SE PRESENTA EN LA TARJETA MADRE. 
114	2014-12-09 14:30:35.09453-05	3	86	Se envía carta responsiva al correo de compuya-parian@outlook.com para su firma.
115	2014-12-09 18:56:03.653268-05	3	110	SERVICIO PREVENTIVO DE HARDWARE REALIZADO.. SE ELIMINO EL PROBLEMA QUE EL EQUIPO NO ENCENDÍA. 
116	2014-12-09 18:57:12.113687-05	3	110	SERVICIO TERMINADO.\r\nCOSTO DEL SERVICIO PREVENTIVO DE 350.00 PESOS. \r\nUSUARIO DE EQUIPO ESTEFANIA. 
117	2014-12-09 19:28:18.609234-05	3	109	DIAGNOSTICO DEL EQUIPO DE MARIA EVA. KVR1066D3N7/1G
118	2014-12-09 19:38:07.783374-05	3	109	HP PAVILION P6-2109LA DDR3 1GB
119	2014-12-09 19:43:26.66832-05	3	109	EQUIPO LISTO PARA RECOLECCCION.\r\nQUEDO FUNCIONANDO CORRECTAMENTE DESPUES DEL SERVICIO PREVENTIVO. 
120	2014-12-09 19:43:46.051069-05	3	109	COSTO DEL SERVICIO PREVENTIVO $350.00 
121	2014-12-10 12:48:39.739058-05	1	52	EQUIPO LISTO PARA SU RECOLECCIÓN COSTO POR DIAGNOSTICO. $75.00
122	2014-12-10 12:51:30.088724-05	3	99	Modelo: F4J41LA \r\nNo. Serie: CND4222603 \r\nOrden de Servicio: 4001777283\r\nNúmero de caso: 3010303321 \r\nSistema Operativo: Microsoft Windows 8 (64 bits)
123	2014-12-10 12:52:55.429991-05	3	99	SE ENVIARA A HP MEXICO EL DIA 17 DE DICIEMBRE A TRAVES DE PAQUETERIA DHL: \r\n\r\nDIRECCIÓN DEL CENTRO DE RECOLECCION:\r\nBLVD. LUIS ENCINAS JOHNSON 561 COL. EL TORREON\r\nJUNTO A LA POLICIA ESTATAL CONTRA ESQUINA DE TELMEX.
124	2014-12-10 13:00:29.896222-05	3	94	SE REALIZO CAMBIO DE LA PIEZA DAÑADA.\r\nQUEDO FUNCIONANDO CORRECTAMENTE.
125	2014-12-10 13:00:47.404732-05	3	94	EQUIPO LISTO PARA ENTREGAR AL CLIENTE.
126	2014-12-10 14:16:54.099806-05	19	67	GARANTIA CERRADA, NC POR PARTE DE PROVEEDOR.
127	2014-12-10 14:50:40.290642-05	3	115	RESPALDO REALIZADO \r\nUSUARIO ANA \r\nContraseña de sesión : ab526842
128	2014-12-10 17:38:18.832434-05	15	93	SE INSTALO FUSOR Y ESCANER A MULTIFUNCIONAL LEXMARK M406. EQUIPO QUEDO FUNCIONANDO CORRECTAMENTE.
129	2014-12-10 17:41:16.434288-05	3	112	TRAMITE REALIZADO POR  Isabel Ubaldo.
130	2014-12-10 17:45:35.183466-05	3	54	se entrego el equipo funcionando en el domicilio del cliente. 
131	2014-12-10 17:48:41.252527-05	15	57	SE AGENDA VISITA PARA MAÑANA 11 DE DICIEMBRE DEL 2014, A LAS 2:00 PM EL TÉCNICO RUBEN VALENZUELA. PARA REALIZAR SERVICIO PREVENTIVO A PLOTTER T1100.
132	2014-12-10 17:51:16.012971-05	15	58	EN ESPERA DE CONFIRMACIÓN DE COMPRA DE FUSOR, O DE UN EQUIPO NUEVO, COMENTA SU EJECUTIVO DE CUENTA ARMANDO FELIX.
133	2014-12-10 17:54:37.334231-05	15	63	EQUIPO CONTINUA SIN TÓNER, MOTIVO POR EL CUAL NO SE PUEDE DIAGNOSTICAR. TÉCNICO NO SABE LA FALLA.
134	2014-12-10 19:35:48.55453-05	3	116	Lupita Orduño\r\nPurchasing\r\nParker Hannifin Corporation\r\nParker Aerospace\r\nElectronic System Division\r\nParque Industrial Roca Fuerte\r\nCarretera Intl. Km. 129 Salida Norte\r\nGuaymas, Son. C.P. 85400\r\nPh    011 521 (622) 225 02 00\r\nFax  011 521 (622) 22 5 02 34  \r\ngorduno@parker.com\r\nwww.parker.com \r\n
135	2014-12-11 11:19:57.925355-05	3	106	$5,020.00 MN costo de la pieza \r\n$300.00 MN instalación\r\nPrecio Neto\r\nTiempo de entrega de 15 a días hábiles.  
136	2014-12-11 12:10:55.573846-05	3	47	    Access methods: (NOTE: HTTPS and FTPS are supported encrypted transports)\r\n    HTTPS Access:     https://ftp.usa.hp.com/hprc\r\n    FTP Access  :     ftp://wk_8_1:N9ps+LB7@ftp.usa.hp.com\r\n\r\n    FTP System:       ftp.usa.hp.com  (15.192.89.0, Failover: 15.193.130.0)\r\n    Login:            wk_8_1\r\n    Password:         N9ps+LB7  (NOTE: CASE-sensitive)\r\n    Account Expires:  12/22/2014 6:11:15 PM  (drop box expiry/deletion date)\r\n    Access Type:      read-only\r\n
137	2014-12-11 13:08:48.774625-05	3	91	Se entrega el equipo al cliente.\r\nno fue posible restaurar el sistema operativo por falta de CD de fabrica.
138	2014-12-11 13:10:42.235102-05	3	115	No se tiene los disco de restauracion del sistema.\r\nSe entrega al cliente sin restaurar. 
139	2014-12-11 14:08:35.032355-05	3	118	Inspiron 14R (5437, Mid 2013)\r\nService Tag: DJCWLW1 | Express Service Code: 29468704465
140	2014-12-11 17:51:37.451193-05	4	57	SE REALIZO SERVICIO PREVENTIVO A PLOTTER T1100, NO SE DIAGNOSTICAN FALLAS. SE RECOMIENDA SERVICIO PREVENTIVO CADA 6 MESES.
141	2014-12-12 11:58:17.174024-05	3	103	SE REALIZO CAMBIO DE TARJETA LÓGICA POR PARTE DEL CENTRO DE SERVICIO HP. 
142	2014-12-12 11:58:41.301442-05	3	103	IMPRESORA SE ENTREGO FUNCIONANDO CORRECTAMENTE AL USUARIO.
143	2014-12-12 14:23:46.944014-05	3	83	SE REALIZO CAMBIO DE TARJETA LÓGICA. \r\nQUEDO IMPRIMIENDO CORRECTAMENTE.\r\n
144	2014-12-12 14:23:59.237426-05	1	121	SE INSTALO OFFICE, ES NECESARIA LA ACTIVACIÓN DE OFFICE YA QUE EL SERVIDOR DE MICROSOFT SE ENCUENTRA EN MANTENIMIENTO. NOS COMUNICAMOS CON MICROSOFT Y NOS RECOMIENDAN QUE INTENTEMOS DE NUEVO EN 24 HORAS
145	2014-12-12 14:24:28.502275-05	3	83	SE PROGRAMA ENTREGA DEL EQUIPO EN OFICINA DEL CLIENTE.
146	2014-12-12 14:39:59.260363-05	1	113	SE REALIZO RE INSTALACIÓN DE SISTEMA OPERATIVO Y RECUPERACIÓN DE INFORMACIÓN.\r\n
147	2014-12-12 17:38:42.540705-05	1	77	SE REALIZO SERVICIO Y SE ENTREGARON PRUEBAS PARA FIRMA CON CONTACTO MUÑOZ. SE PROCEDE A FACTURAR
148	2014-12-12 18:05:54.056951-05	1	108	SE REALIZO LA CONFIGURACIÓN DE CONMUTADOR PARA QUE AL MOMENTO DE ENTRAR LA LLAMADA EN ALGUNA DE LAS 3 LINEAS EL TELÉFONO SUENE EN 2 DE LAS EXENCIONES DISPONIBLES COMO SE SOLICITO. SE PROCEDE A FACTURAR
149	2014-12-12 18:15:00.103725-05	3	123	Recolección realizada.
150	2014-12-12 18:15:10.785826-05	3	122	Recolección realizada.
151	2014-12-13 11:19:14.591975-05	3	108	SERVICIO01 POR $400.00
152	2014-12-15 16:42:28.083283-05	3	81	se reviso garantia con hp y comprobamos que la garandia estaba vencida, se procede a localizar sensores dañados para cotizar.\r\n\r\n
153	2014-12-15 18:13:22.118106-05	3	47	en espera del envio por paqueteria de media de instalacion (sistema operativo activado)
154	2014-12-15 18:28:45.216145-05	3	47	No se esta activando la licencia del sistema operativo Windows 8.1.
155	2014-12-15 18:38:41.137228-05	3	87	Numero Orden: HP0013799 ...
156	2014-12-15 19:27:51.357037-05	3	47	Me comunique con Microsoft.\r\n\r\nEstán solicitando 25 números que debe venir pegado en el equipo (no viene) o están en la caja. \r\n\r\nMe solicitaron que nuevamente me comunicara con HP para que me apoyaran con esos 25 números que necesitan para la activación. \r\n\r\nEstaré contacto al cliente para validar si los números de activación están en la caja del equipo.\r\n\r\n\r\nCASE <4742 2024 70> PROCESO.\r\nCASE <4741 4977 66> CERRADO.\r\n
157	2014-12-16 10:28:06.768918-05	1	100	SE AGENDA INSTALACIÓN Y CALIBRACIÓN DE CABEZALES DE IMPRESIÓN PARA DIA 16/12/2014
158	2014-12-16 13:44:12.025603-05	3	102	REINSTALACION DE SISTEMA OPERATIVO CON MEDIA PROPORCIONADO POR HP MEXICO. \r\nNO SE CARGAR LOS CONTROLADORES DE TODOS LOS DISPOSITIVOS Y NO SE ESTAN DESCARGANDO LAS ACTUALIZACION DE MICROSOFT. 
159	2014-12-16 13:48:37.744319-05	3	102	<CASE: 4742 9639 71> Solicitud de disco duro por parte de técnicos de HP.
160	2014-12-16 14:04:00.256493-05	1	120	SE SOLICITA COTIZACIÓN DE TARJETA MADRE.
161	2014-12-16 14:11:07.683099-05	3	87	COMPUTADORA CON SISTEMA OPERATIVO ACTIVADO, SE PROGRAMA PARA ENTREGAR EN DOMICILIO DEL CLIENTE.
162	2014-12-16 14:51:00.839181-05	1	100	SE INSTALARON CABEZALES Y SE RESOLVIERON LAS NECESIDADES DE IMPRESIÓN DE CLIENTE, PLOTTER MUESTRA NUEVA FALLA SE PROCEDE A REVISAR MINUCIOSAMENTE EL DÍA 17/12/2014
163	2014-12-16 17:31:52.883713-05	8	112	SE REALIZO CAMBIO DEL PRODUCTO CON NOTA DE CREDITO NCTJ 9634.
164	2014-12-16 18:45:05.417707-05	3	105	SE REINSTALO EL SISTEMA. SE CORRIGE PROBLEMA. 
165	2014-12-16 18:46:36.966768-05	3	105	TABLET LISTA PARA ENTREGA. \r\nSE PUEDE RECOGER EN HORARIO DE OFICINA CON EL FOLIO DE GARANTIA. 
166	2014-12-16 18:54:44.007296-05	3	105	TABLET ENTREGADA AL CLIENTE. 
167	2014-12-16 19:08:01.339536-05	1	124	SE REINSTALO DISCO DURO Y SISTEMA OPERATIVO, EL EQUIPO FUNCIONA CORRECTAMENTE.
168	2014-12-16 19:09:35.213825-05	1	128	EL EQUIPO PRESENTA NIVEL BAJO EN EL TAMBOR DE IMAGEN, SE SOLICITA A EJECUTIVO DE CUENTA EL CAMBIO DE EQUIPO PARA REALIZAR LA GARANTÍA DE EQUIPO XEROX
169	2014-12-16 19:12:17.242677-05	1	117	EQUIPO PRESENTA ATASCO DE PAPEL Y ERROR 13.01.00, SE REVISA EQUIPO Y NO SE LOCALIZA EL PAPEL EN ATASCO.
170	2014-12-16 19:17:26.790857-05	3	132	SE REINSTALO EL SISTEMA. \r\nTABLET ESTA FUNCIONANDO CORRECTAMENTE. 
171	2014-12-16 19:17:39.018743-05	3	132	GARANTIA LISTA. 
172	2014-12-17 10:47:33.700586-05	1	130	SE SOLICITA COTIZACIÓN DE TARJETA MADRE CON EL FABRICANTE, EN ESPERA DE RESPUESTA PARA PROPORCIONAR COSTO TOTAL DE REPARACIÓN A CLIENTE.
173	2014-12-17 11:39:53.363178-05	3	111	TRAMITE EN TIJUANA
174	2014-12-17 11:40:35.659567-05	3	127	EN PROCESO DE VALIDACION DE FALLA.
175	2014-12-17 11:41:36.902171-05	3	114	EN PROCESO DE VALIDACION DE FALLA.
176	2014-12-17 11:41:46.03762-05	3	126	EN PROCESO DE VALIDACION DE FALLA.
177	2014-12-17 11:41:56.819605-05	3	129	EN PROCESO DE VALIDACION DE FALLA.
178	2014-12-17 11:42:09.254736-05	3	131	EN PROCESO DE VALIDACION DE FALLA.
179	2014-12-17 13:58:19.822183-05	3	118	No presento falla en hardware. \r\nDELL solicito reinstalar el sistema operativo.
180	2014-12-17 13:59:04.239174-05	3	118	Reinstalacion del sistema operativo. Falla corregido. 
181	2014-12-17 13:59:54.410815-05	3	118	Se realizo la prueba de tener encendida varias hora la computadora. No presento la falla reportada. 
182	2014-12-17 14:00:05.082397-05	3	118	Equipo LISTO para recoleccion. 
183	2014-12-17 14:04:42.917547-05	1	120	LA PIEZA SOLICITADA NO SE ENCUENTRA DISPONIBLE CON NINGUNO DE LOS PROVEEDORES.
184	2014-12-17 14:06:00.228132-05	1	58	CLIENTE REALIZO LA COMPRA DE EQUIPO NUEVO, SOLICITA SE ENTREGUE EQUIPO.
185	2014-12-17 14:14:18.188433-05	1	52	SE LE INFORMO A CLIENTE QUE EL EQUIPO ESTA LISTO PARA SU RECOLECCIÓN, EQUIPO PASARA A RECICLAJE MÁXIMO EL DÍA 19 SI NO ES RECOLECTADO. 
186	2014-12-17 14:14:34.616456-05	3	99	FUE ENVIADO A HP MEXICO PARA REPARACION DE LA PANTALLA. 
187	2014-12-17 14:17:45.590524-05	3	102	EN ESPERA DE LA VISITA DE LOS TECNICOS DE HP PARA QUE REALICEN EL CAMBIO DE DISCO DURO. 
188	2014-12-17 14:47:15.661767-05	15	134	EN ESPERA DE AUTORIZACIÓN DE PIEZAS, POR PARTE DEL CLIENTE.
189	2014-12-17 16:48:49.762661-05	3	102	SE RETIRO DISCO DURO CON RUIDO, NUMERO DE SERIE FUE EL W381AMKN. SE INSTALO NUEVO DISCO DURO.
190	2014-12-17 16:58:08.904453-05	3	102	NUEVO SERIAL DE DISCO DURO 2DJCF00837AOLM. 
191	2014-12-17 17:07:00.066181-05	3	102	SE PROCEDE A REINSTALAR EL SISTEMA OPERATIVO EN COMPUTADORA.
192	2014-12-18 10:27:23.44044-05	1	130	NOS COMUNICAMOS CON EL CLIENTE PARA DAR EL COSTO TOTAL DE LA REPARACIÓN, EN ESPERA DE AUTORIZACIÓN.
193	2014-12-18 10:31:51.809516-05	1	130	CLIENTE ACEPTA LA REPARACIÓN, NOS COMENTA QUE EL DÍA 19/12/2014 DARÁ EL ANTICIPO DEL 50%
194	2014-12-18 13:23:49.369761-05	1	124	EQUIPO ENTREGADO A CLIENTE.
195	2014-12-18 13:23:51.398657-05	3	114	Tablet lista para recoleccion.\r\n
196	2014-12-18 13:24:15.560364-05	3	114	Tablet sin rayas en la pantalla.
197	2014-12-18 13:54:13.62257-05	3	116	Especialistas en servicios para oficinas  01 55 5254 2448\r\nGuía 0163145035/60846
198	2014-12-18 13:57:15.618502-05	3	116	ESPECIALISTAS EN SERVICIOS PARA OFICINAS DE MEXICO, S.A. DE C.V.\r\nQuerétaro No. 170-A, Col. Roma Norte, México D.F. C.P.: 06700.\r\nTeléfonos: (55) 5264 2448  Fax: (55) 5584 6706.\r\nDirigido para Trámite de Garantía.\r\n
199	2014-12-18 14:33:28.445553-05	3	116	FOLIO 4505. 
200	2014-12-18 14:47:09.791836-05	3	123	Soporte Think:\r\n001-866-434-2080\r\nHorario de atención: de lunes a viernes de 9 a.m - 6 p.m
201	2014-12-18 14:47:22.669277-05	3	122	Soporte Think:\r\n001-866-434-2080\r\nHorario de atención: de lunes a viernes de 9 a.m - 6 p.m
202	2014-12-18 16:02:04.433861-05	1	100	Se agenda cita para chequeo de funcionamiento de cabezales 18/12/2014 a las 2:30
203	2014-12-18 18:33:36.390749-05	1	100	SE PROBO EL BUEN FUNCIONAMIENTO DEL EQUIPO SIN ERRORES. SE PROCEDE A CERRAR REPORTE
204	2014-12-19 11:46:29.743985-05	1	134	Cliente acepta reparacion, se solicitaron piezas a proveedor.
205	2014-12-19 17:30:13.336433-05	3	135	SE REINSTALA EL SISTEMA ANDROIT EN DISPOSITIVO.
206	2014-12-19 17:35:41.054902-05	3	135	TABLET FUNCIONANDO CORRECTAMENTE.
207	2014-12-19 17:36:37.765853-05	3	135	EQUIPO LISTO PARA SU RECOLECCIÓN EN LA DIRECCION: CALLE SAN LUIS POTOSI NUMERO 21, COLONIA CENTRO, HERMOSILLO, SONORA. 
208	2014-12-19 18:10:41.428864-05	3	136	EN PROCESO DE DIAGNOSTICO.
209	2014-12-19 18:17:54.990542-05	3	127	SE ENVIA AL MAYORISTA. NUMERO DE RECEPCION 4777.
210	2014-12-19 18:35:44.495972-05	3	126	FOLIO DUPLICADO ..\r\nSEGUIMIENTO EN EL FOLIO 955.
211	2014-12-19 18:36:09.257997-05	3	126	SE CIERRA EL FOLIO. \r\n
212	2014-12-22 11:06:08.012323-05	3	99	HP informa que el equipo reparado se envia al DOC asignado con guia DHL 5068142155. 
213	2014-12-22 11:45:01.339977-05	3	111	SE RECIBE MONITOR EN OFICINAS DE HERMOSILLO PARA TRAMITAR GARANTIA.
214	2014-12-22 11:53:39.517294-05	3	111	recepcion sin los tornillos de la base del monitor. 
215	2014-12-22 14:35:41.222491-05	3	131	FOLIO DE REGISTRO SAMSUNG <4128161178>
216	2014-12-22 17:07:00.546693-05	3	123	Numero de cliente 280841. Supremo
217	2014-12-22 19:24:47.655609-05	3	99	Lunes, Diciembre 22, 2014 EN 16:31\r\n \r\nÁrea de Servicio de Origen:\r\n SOR JUANA - TLALNEPLANTLA - MEXICO \r\nÁrea de Servicio de Destino:\r\n HERMOSILLO - HERMOSILLO - MEXICO 
218	2014-12-22 19:29:09.116367-05	3	123	CASO LENOVO <941505> 
219	2014-12-22 19:31:50.782765-05	3	122	CASO LENOVO <941531>
220	2014-12-23 10:31:10.796862-05	3	99	Salida de un centro de tránsito de DHL en MEXICO CITY HUB - MEXICO MEXICO CITY HUB - MEXICO 03:43 1 Pieza JD014010011687079209 
221	2014-12-23 10:33:30.127779-05	3	111	SE HA TENIDO EL MONITOR ENCENDIDO POR 14 HORAS CONTINUAS, SE CONECTO A UN COMPUTADORA POR EL PUERTO VGA Y NO SE HA PAGADO EN ESE TIEMPO.
222	2014-12-23 12:57:56.166703-05	3	122	CAS: Orden de servicio: 231214-2
223	2014-12-23 13:07:40.259284-05	3	123	CAS Orden de servicio: 231214-1
224	2014-12-23 15:03:55.052631-05	3	139	SE ENCUENTRA EN CAS. ORDEN DE SERVICIO 231214-3
225	2014-12-23 16:06:28.57046-05	3	141	SE CORRIGE FALLA REINSTALANDO EL SISTEMA.\r\n
226	2014-12-23 16:06:44.818649-05	3	141	TABLETA QUEDO FUNCIONANDO CORRECTAMENTE.
227	2015-01-05 10:24:18.062197-05	1	140	SE REALIZO SERVICIO PREVENTIVO E INSTALACION DE FUSOR A EQUIPO LASERJET COLOR.
228	2015-01-05 10:49:47.940006-05	1	138	SE INSTALA Y ACTIVA OFFICE. EQUIPO ENTREGADO.
229	2015-01-05 13:32:18.18582-05	1	142	SE INSTALO TONER Y VERIFICO EL CORRECTO FUNCIONAMIENTO DEL EQUIPO.\r\n 
230	2015-01-05 14:03:20.245847-05	3	123	Realizaron cambio de Motherboard.\r\nSe corrige problema con tarjeta de red alambrica. 
231	2015-01-05 14:03:36.724832-05	3	123	Equipo listo para entregar al cliente en su domicilio. 
232	2015-01-05 14:38:49.826992-05	3	143	EQUIPO CON PANTALLA MOVIDA. \r\nTAMBIEN TIENE QUEBRADA LA PANTALLA. 
233	2015-01-05 16:19:36.282139-05	1	134	SE RECIBEN PIEZAS PARA INSTALAR, SE PROCEDE A LA INSTALACIÓN.
234	2015-01-05 16:20:04.538582-05	1	134	EQUIPO REPARADO Y LISTO PARA SU RECOLECCIÓN.
235	2015-01-06 11:08:40.605544-05	4	137	SE SOLICITO LA COTIZACIÓN CON PROVEEDOR, EN ESPERA DE RESPUESTA PARA HACER COTIZACIÓN DE REPARACIÓN COMPLETA.
236	2015-01-06 11:11:43.392252-05	3	147	SE DIAGNOSTICO TABLETA, NO PRESENTA FALLA EN EL SISTEMA, SE ENVIARA CON EL FABRICANTE.
237	2015-01-06 11:45:32.259893-05	3	141	SE ENTREGA TABLETA AL CLIENTE.
238	2015-01-06 12:04:37.34269-05	3	116	EQUIPO REPARADO: 0166369993/61633, Guia: HMO-PA-61633. 05/01/2015 03:14:00 p.m. OCURRE Entregada GYM. 
239	2015-01-06 12:05:30.227118-05	3	116	SOLUCIÓN: CAMBIO DE BANDA DE TIEMPO Y LIMPIEZA. COMENTARIOS: CARTUCHO DAÑADOS, DEBEN SER CAMBIADOS.
240	2015-01-06 12:38:25.490034-05	3	99	EQUIPO PORTATIL REPARADO Y FUNCIONANDO CORRECTAMENTE. \r\nLISTO PARA RECOLECCION EN LAS OFICINAS DE COMPUPROVEEDORES, SA DE CV. 
241	2015-01-06 12:47:05.543109-05	3	111	EL EQUIPO SE ENCUENTRA EN DIAGNOSTICO POR PARTE DEL MAYORISTA. 
242	2015-01-06 12:52:56.293093-05	3	131	EL DIAGNOSTICO POR PERSONAL DE CAS SAMSUNG ES: DAÑO FÍSICO EN MEMBRANA, SE RECHAZA TRAMITE DE GARANTÍA. 
243	2015-01-06 13:09:46.341621-05	3	55	SE ENTREGA TABLET A JONATHAN GARCIA.
244	2015-01-06 13:10:39.477871-05	3	55	GARANTIA DE COMPUYA. 
245	2015-01-06 13:20:09.704356-05	3	96	NUMERO DE RECEPCION 4744 (03/12/2014)
246	2015-01-06 13:50:18.017954-05	3	96	DAÑADA LA MOTHERBOARD, NO PROCEDE GARANTIA. PRECIO COSTO DE 310 + IVA. \r\nPEDIENTE VERIFICAR EL COSTO NETO PARA EL CLIENTE. 
247	2015-01-07 11:16:06.202304-05	1	145	SERVICIO PREVENTIVO REALIZADO, SE PROCEDE A LA ENTREGA E INSTALACIÓN DE SCANNER.
248	2015-01-07 17:01:06.015338-05	3	127	CONTINUA CON EL MAYORISTA EN REPARACIÓN.
249	2015-01-07 17:51:29.613253-05	3	158	SE PROGRAMA RECOLECCIÓN PARA EL DÍA 08 DE ENERO DEL 2015.
250	2015-01-08 10:37:43.340043-05	1	137	CLIENTE ACEPTA REPARACIÓN, EN ESPERA DE ANTICIPO PARA PROCEDER A REALIZAR ORDEN DE COMPRA.
251	2015-01-08 11:07:27.856559-05	3	162	recoleccion realizada. 
252	2015-01-08 11:29:25.788427-05	3	161	recoleccion realizada.
253	2015-01-08 11:30:45.862342-05	3	163	recepción realizada.
254	2015-01-08 11:31:02.225526-05	3	164	recepción realizada.
255	2015-01-08 11:31:38.954198-05	3	166	recepción realizada.
256	2015-01-08 11:56:10.207479-05	3	159	se creo acceso directo en la computadora de Oscar Legaspi. 
257	2015-01-08 12:02:03.037079-05	3	159	Alejandro perez ya tenia creado el acceso a licitaciones por medio de Hamachi.
258	2015-01-08 12:34:53.148191-05	3	159	Fernando Cortez tambien ya contaba con el acceso a hamachi. Usuario confirma acceso correcto.
259	2015-01-08 14:24:47.381175-05	3	159	Oscar legapsi, Fernando cortez y Alejandro perez confirman acceso a la carpeta Licitacion a travez de Logmein.
260	2015-01-08 14:25:18.600648-05	3	159	Reporte finalizado, se procede a imprimir reporte y cerrar solicitud solicitada.\r\n\r\nCualquier duda o comentario quedo a sus órdenes.\r\nSaludos.\r\nTzirahuén Martínez \r\nDepartamento Soporte Técnico\r\nOficina (662) 214 2200 ext. 250.\r\nCelular (662) 229 3979 Directo 2113.\r\n
261	2015-01-08 14:43:31.145704-05	3	122	SE CORRIGIÓ LA FALLA DE AUDIO.\r\nAUDIO DESCONECTADO INTERNAMENTE Y SE REINSTALO EL SISTEMA OPERATIVO. SE PROGRAMA RECOLECCIÓN DEL EQUIPO DEL CENTRO DE SERVICIO AUTORIZADO LENOVO. 
262	2015-01-08 15:06:47.586911-05	3	139	CENTRO DE SERVICIO AUTORIZADO SOLICITA EL CAMBIO DEL MICROPROCESADOR A LA COMPUTADORA, EN ESPERA DE PIEZA. 
263	2015-01-08 19:13:41.574932-05	3	168	GUIA PREPAGADA.\r\nFOLIO EPSON 150 108 0060 75.
264	2015-01-09 10:30:58.283675-05	1	106	EQUIPO LISTO PARA SU ENTREGA, NOS COMUNICAMOS CON EL CLIENTE PARA HACERLE SABER DIJO QUE RECOGE EL EQUIPO EL DÍA DE HOY. 09/01/2015\r\n
265	2015-01-09 11:56:44.948457-05	15	106	EL EQUIPO SE ENTREGO EL DÍA DE HOY Y ESTA FUNCIONANDO CORRECTAMENTE. 
266	2015-01-09 14:24:46.977523-05	3	166	Guía 0163612462/62265  pcp\r\nVamav \r\n
267	2015-01-09 14:25:10.482943-05	3	171	Guía 0163612462/62265  pcp\r\nVamav \r\n
268	2015-01-10 13:40:51.42851-05	3	147	FALLA EN DISPLAY.\r\nCOMPRA 13371\r\nB25
269	2015-01-10 13:53:12.029825-05	3	164	DIAGNOSTICO:\r\nDISPLAY QUEBRADO \r\nBOTON ENCENDIDO APLASTADO.
270	2015-01-12 13:19:28.033874-05	3	102	Equipo funcionando correctamente. \r\nse programa entrega en oficina del cliente. \r\n
271	2015-01-12 14:13:36.341107-05	3	161	REINSTALACIÓN DEL SISTEMA.
272	2015-01-12 14:14:00.133706-05	3	161	TABLET FUNCIONANDO CORRECTAMENTE.\r\n
273	2015-01-12 14:14:29.122612-05	3	161	SE PROGRAMA ENTREGA EN DOMICILIO EN DOMICILIO DEL CLIENTE. \r\nEDIFICIO PARIAN.
274	2015-01-12 14:40:53.330483-05	3	147	RECEPCIÓN: 4845.\r\nCLIENTE: 8554.
275	2015-01-12 16:35:56.162225-05	3	168	COMPRA - 16135\r\nPROVEEDOR - 81\r\nREFERENCIA - 144774 
276	2015-01-12 18:59:11.226947-05	3	122	COMPUTADORA FUNCIONANDO CORRECTAMENTE.\r\nSE PROGRAMA ENTREGA EN OFICINA DEL CLIENTE PARA EL DIA 13 DE ENERO DEL 2015.
277	2015-01-13 10:45:52.176468-05	37	146	Se reinstalaron controladores lector de DVD, teclas de volumen brillo y  funcionan correctamente, se reinstalo lector de huella pero no se encuentra aplicación para su funcionamiento. Observaciones: se requiere realizar respaldo de las imágenes ya que esto provoca lentitud y disco duro se encuentra lleno con poco espacio disponible, recomendación respaldar información. 
278	2015-01-13 11:32:52.840018-05	4	155	SE INSTALO FUSOR DE GARANTÍA EQUIPO QUEDA FUNCIONANDO CORRECTAMENTE.
279	2015-01-13 11:37:36.131322-05	4	176	SE CORRIGE PROBLEMA DE BANDEJAS Y QUEDA EN ESPERA DELA CONFIGURACIÓN. MISMA QUE REALIZARA EMMANUEL LARA.
280	2015-01-13 12:20:27.878542-05	37	150	Se realiza limpieza de equipo y alineación de impresión funciona correctamente. Observaciones: requiere reemplazo de cartucho (Negro).
281	2015-01-13 13:31:54.63104-05	3	48	se instalo sistema operativo para revisar el funcionamiento del equipo.
282	2015-01-13 13:40:30.016007-05	37	151	Se realiza limpieza interna de polvo e inyectores, se ajusta y alinea. Observaciones: presenta letras incompletas por cartucho incompatible (negro).
283	2015-01-13 14:51:11.836425-05	3	48	se programa entrega del equipo en el domicilio.
284	2015-01-13 16:37:10.110143-05	3	158	CASE <474 446 50 70>
285	2015-01-13 18:09:49.790253-05	37	149	Se realiza limpieza interna y de inyectores. Observaciones: requiere reemplazo de cartuchos Cyan, Magenta y Yellow.
286	2015-01-14 11:01:42.083822-05	4	175	SE LE PROPORCIONARON LOS NÚMEROS DE PARTE NECESARIOS AL EJECUTIVO DE CUENTA PARA REALIZAR SU COTIZACIÓN.
287	2015-01-14 11:03:06.020018-05	4	170	CLIENTE SOLICITA LA COTIZACIÓN PARA RESOLVER PROBLEMA CON RED INALAMBRICA
288	2015-01-14 11:03:44.083052-05	4	165	EQUIPO REPARADO Y LISTO PARA SU RECOLECCIÓN.
289	2015-01-15 13:31:06.899972-05	3	192	SE PROGRAMA RECOLECCIÓN CON APOYO DEL PERSONAL DE ALMACÉN.
290	2015-01-15 13:44:32.391539-05	3	191	SE ENVIO FOLIO AL CLIENTE.\r\nEL EQUIPO SE HARA LLEGAR A TRAVEZ DEL CLIENTE AL DOMICILIO DE COMPUPROVEEDORES. 
291	2015-01-15 14:06:09.296473-05	3	111	SE PROGRAMA RECOLECCIÓN DEL EQUIPO EN LAS OFICINAS DEL MAYORISTA. 
292	2015-01-15 15:06:46.218791-05	37	186	Se acude a revisión de equipo y detecto que imprime correctamente. Comentaron se reviso unidad recolectora y quedo operando correctamente. Equipo queda en observación.
293	2015-01-16 10:30:49.510217-05	37	63	Se instala toner y unidad de imagen. Se realiza limpieza de equipo y diagnostico de correcta impresión. Equipo funciona correctamente.
294	2015-01-16 11:12:28.161065-05	37	185	Se acude a revisión de equipo, se detecto equipo comparte impresión como servicio local. Se reinstalaron controladores de impresora verificando la correcta operación e impresión. Se recomendó asignar un nodo e IP para configuración en la red y no presente intermitencia de comunicación.
295	2015-01-16 11:18:07.593086-05	37	181	Se recogió impresora la cual no tiene puerto de comunicación USB.
296	2015-01-16 11:25:41.004653-05	3	47	hp case <4744 7103 02>
297	2015-01-16 17:42:10.341288-05	3	187	recolección realizada.
298	2015-01-16 17:43:03.546228-05	3	188	recolección realizada.
299	2015-01-16 17:43:37.023694-05	3	189	recolección realizada.
300	2015-01-16 17:45:12.973828-05	3	154	RESTAURACION DEL SISTEMA. \r\nTABLET QUEDA FUNCIONANDO CORRECTAMENTE. \r\nSE ENTREGA AL CLIENTE. 
301	2015-01-16 17:45:49.805626-05	3	152	RESTAURACIÓN DEL SISTEMA. \r\nTABLETA QUEDA FUNCIONANDO CORRECTAMENTE. \r\nSE ENTREGA AL CLIENTE. 
302	2015-01-16 18:14:26.290568-05	3	153	NO PROCEDE GARANTÍA.\r\nDAÑO FÍSICO.\r\nPROVEEDOR NO TIENE EL SERVICIO DE REPARACIÓN. 
303	2015-01-16 18:14:37.210806-05	3	153	SE ENTREGA LA TABLETA AL CLIENTE. 
304	2015-01-16 19:26:14.491485-05	3	190	case <30 11 58 60 90>\r\nremplazo de batería.
305	2015-01-16 19:32:10.970859-05	3	190	orden de servicio: 40 01 97 88 76
306	2015-01-17 11:58:47.671485-05	15	151	SE LE INFORMO A CLIENTE QUE REQUIERE CAMBIO DE CARTUCHO ORIGINAL, QUEDO EN VENIR EL DÍA MIÉRCOLES PRÓXIMA SEMANA.  
307	2015-01-17 11:59:14.901415-05	15	149	SE LE INFORMA A CLIENTE QUE REQUIERE CAMBIO DE CARTUCHOS JUEGO COLORES, QUEDO EN VENIR EL DÍA MIÉRCOLES PRÓXIMA SEMANA.\r\n
308	2015-01-17 11:59:39.116502-05	15	150	SE LE INFORMA A CLIENTE QUE REQUIERE CAMBIO DE CARTUCHO ORIGINAL, QUEDA EN VENIR EL DÍA MIÉRCOLES PRÓXIMA SEMANA.\r\n
309	2015-01-17 12:12:06.673154-05	15	137	EL CLIENTE DEJO SU ANTICIPO AQUÍ EN COMPUPROVEEDORES, EN ESPERA DE PIEZA PARA INSTALAR EL DISPLAY.
310	2015-01-17 12:54:11.180598-05	3	156	LENOVO <946013>
311	2015-01-17 12:55:14.044026-05	3	156	RECEPCIÓN 130115-1
312	2015-01-17 13:09:55.62554-05	3	144	HP CASE <30 11 53 44 04> 
313	2015-01-17 13:11:59.079494-05	3	144	SE ENVIARA A REPARACIÓN A HP. \r\nLUNES 19 DE ENERO DEL 2015.\r\nDHL 400 197 01 60.\r\n
314	2015-01-17 13:48:31.193439-05	3	188	RESTAURACIÓN DEL SISTEMA REALIZADA, SE REVISAR SU FUNCIONAMIENTO.
315	2015-01-17 13:55:09.486055-05	3	129	C-14192\r\nP-726\r\nF-34039
316	2015-01-17 13:55:41.058262-05	3	129	TICKET 10194
317	2015-01-17 13:59:54.342432-05	3	129	CONTINUA EN REVISIÓN POR PARTE DEL PROVEEDOR.
318	2015-01-17 14:16:56.411101-05	3	188	EQUIPO FUNCIONANDO CORRECTAMENTE.\r\nLISTO PARA ENTREGA. 
319	2015-01-17 14:23:02.643575-05	3	188	SE PROGRAMA ENTREGA A TRAVÉS DE ALMACÉN.
320	2015-01-17 14:36:25.40038-05	3	152	SE CIERRA GARANTÍA.\r\nTABLETA NO HA PRESENTANDO FALLA.
321	2015-01-19 10:15:54.788942-05	37	194	Se realiza respaldo de información, se detecta problema con disco duro requiere su reemplazo. Observaciones: Cotizar disco duro e informar a cliente.
322	2015-01-19 10:39:52.341818-05	4	184	SE REALIZO MANTENIMIENTO PREVENTIVO, EQUIPO FUNCIONANDO Y LISTO PARA SU RECOLECCIÓN.
323	2015-01-19 10:40:28.293288-05	4	183	EN PROCESO DE MANTENIMIENTO, SE INFORMARA A CLIENTE CUANDO EL EQUIPO SE ENCUENTRE LISTO PARA SU RECOLECCIÓN.
324	2015-01-19 10:43:30.215684-05	3	47	En espera de la respuesta del departamento de HP de segundo nivel.\r\nRespuesta esperada para el dia martes 20 de Enero. 
325	2015-01-19 11:26:44.033527-05	3	156	SE SOLICITA PIEZAS DE MOTHERBOARD Y MICROPROCESADOR.\r\nEN ESPERA DEL FABRICANTE. 
326	2015-01-19 11:28:23.482415-05	3	139	NO SE HA RECIBIDO MICROPROCESADOR SOLICITADO AL FABRICANTE POR MEDIO DE CENTRO DEL SERVICIO (231214-3).
327	2015-01-19 12:05:06.15435-05	37	194	COTIZACIÓN: Disco duro, servicio respaldo informacion y mano de obra = $1500.00 IVA Incluido.
328	2015-01-19 16:48:10.486695-05	37	195	Cargador de batería dañado, se enciende equipo y no se detecta problema con sistema operativo; revisar con cliente compra de cargador o reparación proveedor externo. Observaciones: Presenta lentitud, requiere de memoria RAM. 
329	2015-01-19 18:10:17.161371-05	3	201	SE AUTORIZA ACCESO A LAS EMPRESAS SOLICITADAS.
330	2015-01-19 18:27:19.576092-05	3	201	Se da accesos a la empresas solicitas con el perfil de consulta. \r\n
331	2015-01-19 18:27:57.280081-05	3	201	Reporte finalizado, se procede a imprimir reporte y cerrar solicitud solicitada.\r\n\r\nCualquier duda o comentario quedo a sus órdenes.\r\nSaludos.\r\nTzirahuén Martínez \r\nDepartamento Soporte Técnico\r\nOficina (662) 214 2200 ext. 250.\r\nCelular (662) 229 3979 Directo 2113.\r\n
332	2015-01-19 18:30:10.983799-05	37	198	S
333	2015-01-19 18:31:09.757201-05	37	198	Se realiza el diagnostico de falla en disco duro, se revisa que equipo cuenta con garantia.
334	2015-01-20 10:24:55.89613-05	1	202	SE DIAGNOSTICA FALLA EN SISTEMA DE TINTAS Y SE RECOMIENDA SERVICIO PREVENTIVO.
335	2015-01-20 10:25:41.601706-05	1	183	EQUIPO FUNCIONANDO CORRECTAMENTE Y LISTO PARA SU RECOLECCIÓN.
336	2015-01-20 10:28:27.036869-05	37	150	Cliente entrego cartucho usado, pero no sirve. Requiere de instalación cartucho nuevo.
337	2015-01-20 11:00:15.946531-05	3	47	tiene los 8 GB en Memoria RAM... y esta pendiente la activación de Windows 8.1.
338	2015-01-20 11:13:39.329369-05	37	194	Se informa a cliente sobre el costo de reparación, se indico acuda a realizar el pago de refacción para proceder a la reparación de equipo.
339	2015-01-20 13:55:18.430069-05	8	131	SE CIERRA GARANTIA CON LA ENTREGA DE LA REMISION 28066,SE REPONDRA POR UN EQUIPO SIMILIAR CON CARACTERISTICAS SUPERIORES DEBIDO A QUE EL PROVEEDOR, YA NO TENIA EN EXISTENCIA LA MISMA PANTALLA. 
340	2015-01-20 14:22:22.479024-05	3	191	EQUIPO SE ENCUENTRA EN CENTRO AUTORIZADO DE SERVICIO DE TOSHIBA. FOLIO DE RECEPCION: 200115-1. \r\n
341	2015-01-20 15:01:04.286773-05	8	111	SE CIERRA GARANTIA CON ENTREGA DE EQUIPO, DIAGNOSTICO NO PRESENTO FALLA.
342	2015-01-20 16:57:50.48211-05	37	172	Se reviso equipo encontrando liquido en interior, se enviara cotizacion de refacción (teclado).
343	2015-01-21 10:27:41.992307-05	3	205	RESTAURACIÓN DEL SISTEMA CORRECTAMENTE.
344	2015-01-21 10:33:05.269645-05	3	205	Garantia finalizada, puede acudir a recoger su equipo en la direccion de COMPUPROVEEDORES, en calle San Luis Potosi #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes.
345	2015-01-21 10:46:24.24893-05	15	137	EL EQUIPO ESTA LISTO PARA SU RECOLECCIÓN, YA SE INSTALO DISPLAY Y FUNCIONA PERFECTAMENTE.
346	2015-01-21 12:24:41.227203-05	4	202	SE REALIZO MANTENIMIENTO PREVENTIVO A EQUIPO HP T120 SE ENTREGAN PRUEBAS DE IMPRESIÓN A CLIENTE.
347	2015-01-21 13:23:06.8629-05	3	158	CAMBIO DE MOTHERBOARD.
348	2015-01-21 13:23:24.38856-05	3	158	En espera de la respuesta del departamento de HP de segundo nivel. Respuesta esperada para el dia JUEVES 22 de Enero.
349	2015-01-21 13:24:08.26048-05	3	158	Pendiente la activación de Windows 8.1.\r\nSistema operativo funcionando y Hardware reparado.
350	2015-01-21 14:29:38.50819-05	37	151	Se instala cartucho original, se detecto manchas en la impresión. Pendiente autorización cliente para realizar reparación y limpieza de cabezal. Servicio preventivo: $272.00 IVA Incluido.
351	2015-01-21 14:54:39.531-05	37	150	Se realizo mantenimiento preventivo a equipo, se detecto que el cartucho entregado por cliente no funciono. Requiere de compra de cartucho para su correcta impresión.
352	2015-01-21 15:00:04.511335-05	3	191	SE REQUIERE CONTRASEÑA DEL USUARIO: VIDA ESTUDIANTIL. 
353	2015-01-21 16:33:28.169195-05	3	158	case <4745 0274 60> Activación de windows 8.1.
354	2015-01-22 10:14:13.897458-05	3	210	SE PROGRAMA RECOLECCION EN EL DOMILICIO DEL CLIENTE.
355	2015-01-22 10:24:13.379-05	3	211	C-8406\r\nP-560\r\nREF-560\r\n05/08/2013
356	2015-01-22 10:31:58.010614-05	1	209	SE RECOLECTO PROYECTOR PARA PRUEBAS EN LABORATORIO.
357	2015-01-22 11:37:09.223476-05	3	47	Actualización del BIOS v84.11.\r\nContinua pendiente la activación del Windows 8.1.\r\nTécnicos de segundo nivel se volverán a comunicar para resolver este inconveniente. \r\nHP case <4744 7103 02>\r\n
358	2015-01-22 11:43:50.406293-05	15	137	CLIENTE YA ESTA ENTERADO SOBRE RECOLECCIÓN DE SU EQUIPO, COMENTO QUE PASARÍA AHORA MISMO DES PUES DE LAS 2:00 PM. 
359	2015-01-22 12:20:08.541759-05	37	209	Se reviso equipo enciende correctamente. Se detecto si reconoce los puertos VGA1 y VGA2, sin embargo en el puerto VGA1 se observa daño físico por lo que la imagen no se aprecia correctamente, considerando que puerto VGA2 funciona correctamente para proyectar imagen.
360	2015-01-22 12:29:46.135589-05	3	190	se recibe batería de nueva para portátil.
361	2015-01-22 12:30:44.148931-05	3	190	Funciona la nueva batería correctamente en portátil.\r\n\r\n
362	2015-01-22 12:30:58.773355-05	3	190	Garantia finalizada, puede acudir a recoger su equipo en la direccion de COMPUPROVEEDORES, en calle San Luis Potosi #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes.\r\n
363	2015-01-22 13:09:44.413977-05	3	210	recoleccion realizada
364	2015-01-22 13:11:09.353175-05	3	210	El equipo enciende.\r\nEsta marcando error Primary (internal) battery (error code 601).
365	2015-01-22 13:11:48.397784-05	3	210	Se requiere contraseña de Noe Sierra. 
366	2015-01-22 13:19:39.158198-05	3	208	EN TRAMITE POR DEPARTAMENTO DE COMPRAS.
367	2015-01-22 13:19:52.687907-05	3	180	EN TRAMITE POR DEPARTAMENTO DE COMPRAS.
368	2015-01-22 13:20:01.580886-05	3	178	EN TRAMITE POR DEPARTAMENTO DE COMPRAS.
369	2015-01-22 13:20:09.593259-05	3	177	EN TRAMITE POR DEPARTAMENTO DE COMPRAS.
370	2015-01-22 17:17:29.815014-05	3	196	REPORTES ANTERIOR DE HP <3009 9602 71> CREADO POR RUBEN VALENZUELA. 
371	2015-01-22 17:18:45.887131-05	3	196	NUEVO INTERACCION ES 30 11 8097 57>
372	2015-01-22 17:41:58.421737-05	3	196	ORDEN DE SERVICIO <4002 0150 07> \r\nPARA GENERAR UN NUMERO DE GUIA DE DHL.\r\nPARA REVISAR NUMERO DE ORDEN ES BFJQ838501. CONTRA-ENTREGA EN UN LAPSO DE 15 DIAS, (DEPENDIENTE DE DISPONIBILIDAD). 
373	2015-01-23 11:26:40.633736-05	3	127	SE PROGRAMA RECOLECCIÓN DEL CENTRO AUTORIZADO DE SERVICIO PARA VALIDACIÓN DEL CORRECTO DEL EQUIPO.
374	2015-01-23 12:07:17.057083-05	37	218	Se programa visita viernes 23 Enero 10:00am.
375	2015-01-23 14:25:14.228382-05	37	219	Se realiza servicio preventivo(limpieza de equipo). Costo: $340.00 IVA Incluido.
376	2015-01-23 15:55:53.375679-05	1	218	Se realizo diagnostico, el equipo funciona correctamente.\r\nSe detecto problema en la velocidad de Internet mismo que interfiere con la aplicación asociada a problema. Se recomienda hablar a proveedor de servicio para dar aviso de problema.
377	2015-01-23 16:42:33.958837-05	1	221	VISITAMOS A CLIENTE Y SE DIAGNOSTICA PROBLEMA CON TONER MISMO QUE SE REEMPLAZARA POR UNO NUEVO.
378	2015-01-23 16:44:36.935041-05	1	212	EQUIPO PRESENTA FALLA EN "PUERTO USB B" MISMO QUE PRESENTA FALSO CONTACTO E INTERFIERE CON LA COMUNICACIÓN.
379	2015-01-23 17:48:56.90154-05	3	217	se valida nombre y usuario de carmen mejia, se envia informacion al correo de carmen mejia. 
380	2015-01-23 17:51:22.023737-05	3	217	Reporte finalizado, se procede a imprimir reporte y cerrar solicitud solicitada.
381	2015-01-24 11:20:22.426005-05	1	170	SE ENVIO COTIZACION A CLIENTE, EN ESPERA DE RESPUESTA.
382	2015-01-26 10:35:02.430602-05	3	47	SE PROGRAMA ENTREGA COMPUTADORA FUNCIONANDO CORRECTAMENTE EN OFICINAS DEL CLIENTE. 
383	2015-01-26 14:32:10.177128-05	1	222	SE INSTALAN CONTROLADORES DE IMPRESORA EN EQUIPO DE PRUEBA LOGRANDO IMPRIMIR SIN DIFICULTAD, SE INFORMA A CLIENTE MISMO QUE RECOMIENDA MAS PRUEBAS PARA DESCARTAR FALLOS.
384	2015-01-26 18:30:07.617495-05	3	144	Equipo continua en reparación en HP Mexico.
385	2015-01-26 18:58:52.784875-05	3	196	CAMBIO FISICO DE IMPRESORA POR PARTE DE HP MEXICO.\r\n
386	2015-01-26 18:59:06.036346-05	3	196	SE ENTREGA EQUIPO NUEVO AL CLIENTE.
387	2015-01-26 19:02:25.903342-05	37	172	Se revisa equipo en su interior detectando liquido, se realizo el secado de teclado y limpieza. Equipo funciona correctamente.
388	2015-01-27 10:33:06.889542-05	1	226	EL EQUIPO PRESENTA FALLAS EN EL SISTEMA OPERATIVO, SE PROCEDE A LA RECUPERACIÓN DE INFORMACIÓN PARA POSTERIORMENTE REALIZAR FORMATEO.
389	2015-01-27 10:33:52.779199-05	1	226	SE REALIZARAN PRUEBAS EN DISCO DURO YA QUE APARENTEMENTE PRESENTA FALLA.\r\n
390	2015-01-27 11:44:31.578384-05	3	191	equipo enciende correctamente. \r\n
391	2015-01-27 11:45:18.113007-05	3	191	El Centro Autorizado de Servicio de Toshiba procedió a la reparación. 
392	2015-01-27 11:45:34.313229-05	3	191	Garantia finalizada, puede acudir a recoger su equipo en la direccion de COMPUPROVEEDORES, en calle San Luis Potosi #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes.
393	2015-01-27 11:57:02.812314-05	3	156	Reparación realizada por el Centro de Autorizado. Equipo esta funcionando correctamente. 
394	2015-01-27 11:57:33.863917-05	3	156	Garantia finalizada, puede acudir a recoger su equipo en la direccion de COMPUPROVEEDORES, en calle San Luis Potosi #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes.
451	2015-02-05 16:41:15.643746-05	3	127	NUEVA RECEPCIÓN <4929> ERROR AL CARGAR FALLA DE MB.
395	2015-01-27 12:39:45.388258-05	3	168	Reparación realizada por el Centro de Autorizado. Equipo esta funcionando correctamente. \r\n
396	2015-01-27 12:40:35.292822-05	3	168	Se programa entrega en oficinas del cliente por parte personal de servicio.
397	2015-01-27 13:05:34.25202-05	37	207	No se encontró refacción o proveedor para reparación de pantalla.
398	2015-01-27 13:13:23.273129-05	3	234	SE TRAMITA GARANTIA CON CALL CENTER DE HP.
399	2015-01-27 13:14:14.448216-05	3	234	SE REALIZA CONTRA-ENTREGA DE MULTIFUNCIONAL EN OFICINAS DE PAQUETERIA ASIGNADA PARA ESTE TRAMITE. 
400	2015-01-27 13:18:27.432175-05	3	234	SE PROGRAMA ENTREGA DE MULTIFUNCIONAL AL CLIENTE EN SU DOMICILIO.
401	2015-01-27 14:01:13.235934-05	3	147	Reparación realizada por el Centro de Autorizado. Equipo esta funcionando correctamente. 
402	2015-01-27 14:01:31.456379-05	3	147	Garantia finalizada, puede acudir a recoger su equipo en la direccion de COMPUPROVEEDORES, en calle San Luis Potosi #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes.\r\n
403	2015-01-27 14:05:12.245806-05	37	232	Se programa visita miércoles 28 enero 09:00am.
404	2015-01-27 14:06:39.525731-05	37	230	Se reviso que duplex no funciona, se realizara el cambio de duplex.
405	2015-01-27 14:07:41.743061-05	37	225	Se programa visita para capacitación operativa. Martes 27 enero 16:00 hrs.
406	2015-01-27 14:11:47.19194-05	37	226	No se detecta disco duro, se encuentra dañado. Se verifico que teclado no funciona correctamente aparentemente esta húmedo por algún derrame de liquido.
407	2015-01-27 17:04:28.793208-05	3	233	C-16086\r\n
408	2015-01-27 17:06:45.10055-05	3	233	C-16086\r\nP-81\r\nREF-144521\r\n15/12/2014
409	2015-01-27 17:23:03.085285-05	3	192	SE ENCUENTRA EN EL CENTRO SERVICIO AUTORIZADO DE SONY, ORDEN DE TRABAJO 1467.
410	2015-01-27 17:23:37.537482-05	3	192	CAS ESTA INFORMADO QUE NO ESTA PRESENTANDO LA FALLA, NI RUIDO EN LA ABANICO.
411	2015-01-27 18:09:38.996024-05	1	225	Se re programa visita miércoles 28 enero 11:00am. Cliente solicita confirmación de solución de impresión.
412	2015-01-28 10:21:23.102278-05	3	139	Reparación realizada por el Centro de Autorizado. Equipo esta funcionando correctamente. 
413	2015-01-28 10:23:56.433532-05	3	139	COMPUTADORA SERIE: MJ01JKA9QUEDARA SE ENVIA A ALMACÉN DE COMPUPROVEEDORES, EN CAJA CON NUMERO DE SERIE MJ01JKAH.
414	2015-01-28 10:51:29.62138-05	3	139	Garantia finalizada.
415	2015-01-28 14:15:39.701907-05	37	228	Se inicia proceso de instalación de Office 365.
416	2015-01-28 14:42:32.283385-05	37	235	Se diagnostica problema con tarjeta madre. Pendiente informar cotizacion de refacción y reparación.
417	2015-01-28 18:19:40.805169-05	3	203	EXPRESS SERVICE CODE: 1069 7336 857
418	2015-01-28 18:54:22.721884-05	3	203	FALLA DE SISTEMA OPERATIVO.
419	2015-01-28 18:54:54.017508-05	3	203	DELL ENVIARA EN 5 DIAS HABILES POR PAQUETERIA. 
420	2015-01-28 18:58:25.899232-05	3	203	case 906621969 sobre la solicitud del despacho# 310131116.
421	2015-01-28 18:58:56.258779-05	3	203	Tenga en cuenta que en PROMEDIO este servicio puede demorar 5 días hábiles en concretarse todo dependerá de la disponibilidad de la (s) pieza (s) enviada (s).
422	2015-01-29 10:12:48.892407-05	3	210	PRODUCTO: E3W15LT#ABM
423	2015-01-29 10:21:13.725039-05	3	210	DESCARGAR ASISTENTE DIAGNOSTICOS.\r\nACTUALIZACION DEL BIOS.
424	2015-01-29 10:32:24.560896-05	3	210	computadora con sistema operativo windows 7 professional.
425	2015-01-29 11:37:46.211317-05	3	220	C-10427 11/12/2013\r\nP-57 REF-117001 10/12/2013
426	2015-01-29 13:08:06.747983-05	37	251	Se programa visita para instalación de equipo jueves 29 enero 11:30am.
427	2015-01-29 13:08:51.678143-05	37	252	Se programa visita para instalación de equipo jueves 29 enero 11:30am.
428	2015-01-29 14:04:31.203542-05	3	220	se envia a CAS de SolaBasic para reparación por falla en el voltaje de entrada del equipo.
429	2015-01-29 16:31:28.874041-05	3	192	SE REALIZARON MAS PRUEBAS PARA VALIDAR LA FALLA DEL PROYECTOR.\r\n
430	2015-01-29 17:36:53.167518-05	3	233	De antemano disculpe las molestias que esto le ocasiona. \r\nSe le asigno el numero de FOLIO con VOYAGE: 3880  con el cual se le dará seguimiento al tramite \r\nSe estara enviado por Estafeta prepagada el envió del producto al Centro Autorizado de Servicio para su revisión sin ningún costo. \r\nCodigo de Rastreo 0553076883. \r\n
431	2015-01-29 18:04:38.170929-05	37	252	Cliente solicita la instalación de scanner. Se observa requiere de instalación cable UTP como extensión, así como switch para compartir scanner con 2 equipos computadoras. Pendiente enviar cotizacion de servicio.
432	2015-01-29 18:05:07.414089-05	37	251	Cliente solicita la instalación de scanner. Se observa requiere de instalación cable UTP como extensión, así como switch para compartir scanner con 2 equipos computadoras. Pendiente enviar cotizacion de servicio.
433	2015-01-29 19:33:15.278587-05	8	255	Se prestó equipo de impresión con remisión No. 28081.
434	2015-01-30 16:53:12.604852-05	37	243	Se programa visita para instalación y configuración, viernes 30 enero 15:30 hrs.
435	2015-02-03 10:22:26.522058-05	1	236	PROYECTOR SE INSTALA EN AULA SIN CALIBRAR YA QUE NO SE CONTABA CON ACCESO A CPU EN DONDE ESTA INSTALADO EL SMART BOARD. 
436	2015-02-03 10:22:52.627832-05	1	236	SE AGENDA CITA PARA DÍA 03/02/2015 
437	2015-02-03 10:26:05.055311-05	1	228	EQUIPOS CONFIGURADOS.
438	2015-02-04 10:09:20.467164-05	3	158	EQUIPO FUNCIONANDO CORRECTAMENTE, SE ENVIA AL DOMICILIO DEL CLIENTE.
439	2015-02-04 10:35:09.712269-05	3	220	EQUIPO CONTINUA EN REPARACIÓN EN CENTRO DE SERVICIO AUTORIZADO. 
440	2015-02-04 13:37:59.784572-05	37	226	Se solicita por cliente la reparación de equipo. Cotizar disco duro.
441	2015-02-04 14:31:31.852424-05	37	186	Pendiente cobro de servicio en la venta de unidad recolectora.
442	2015-02-04 17:53:10.748396-05	15	264	SE RECIBE EL EQUIPO CON CABLE USB MINI, CABLE VGA Y CABLE DE CORRIENTE, CON SU CONTROL REMOTO, MALETÍN Y MANUALES.
443	2015-02-05 10:53:20.870208-05	1	265	SE REINSTALO BANDA ANCHA MOVIL Y EL EQUIPO FUNCIONA CORRECTAMENTE.
444	2015-02-05 10:53:32.662065-05	1	265	EQUIPO LISTO PARA SU RECOLECCIÓN.
445	2015-02-05 13:41:19.438844-05	3	189	SE CORRIGE FALLA EN CENTRO AUTORIZADO DE SERVICIO. 
446	2015-02-05 14:08:57.225143-05	3	189	Reparación realizada por el Centro de Autorizado. Equipo esta funcionando correctamente. \r\n\r\nGarantia finalizada, puede acudir a recoger su equipo en la direccion de COMPUPROVEEDORES, en calle San Luis Potosi #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes.
447	2015-02-05 14:39:53.191701-05	3	244	Reparación realizada por el Centro de Autorizado. Equipo esta funcionando correctamente. \r\n
448	2015-02-05 14:40:21.705115-05	3	244	Garantia finalizada, puede acudir a recoger su equipo en la direccion de COMPUPROVEEDORES, en calle San Luis Potosi #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes.
449	2015-02-05 16:24:26.847791-05	4	243	EQUIPO INSTALADO Y  PROBANDO SU CORRECTO FUNCIONAMIENTO EL CONTADOR TOTAL DE IMPRESIONES AL MOMENTO DE LA ENTREGA: 96032 TOTAL DE COPIAS: 95872 TOTAL DE IMPRESIONES: 160
450	2015-02-05 16:39:46.002781-05	3	127	CVA <4777>RECEPCION CERRADA. \r\n
452	2015-02-05 16:43:24.244052-05	3	127	FECHA ESTIMADA DE RETORNO DE TABLETA ES VIERNES 13 DE ENERO. PROBLEMA DE DES-ABASTO DE MATERIAL PARA REALIZAR REPARACIÓN. 
453	2015-02-05 17:00:19.799472-05	4	263	SE REALIZO SERVICIO PREVENTIVO A EQUIPO EN RENTA, EN ESPERA DE FACTURA.
454	2015-02-05 17:02:23.809202-05	3	157	FECHA ESTIMADA DE RETORNO DE TABLETA ES VIERNES 13 DE ENERO. PROBLEMA DE DES-ABASTO DE MATERIAL PARA REALIZAR REPARACIÓN. 
455	2015-02-05 17:11:43.802045-05	3	223	FECHA ESTIMADA DE RETORNO DE TABLETA ES VIERNES 13 DE ENERO. PROBLEMA DE DES-ABASTO DE MATERIAL PARA REALIZAR REPARACIÓN. 
456	2015-02-05 17:15:56.636435-05	3	245	\r\nFECHA ESTIMADA DE RETORNO DE TABLETA ES VIERNES 13 DE ENERO. PROBLEMA DE DES-ABASTO DE MATERIAL PARA REALIZAR 
457	2015-02-05 17:37:54.667504-05	3	237	CON PROVEEDOR EN TRAMITE DE GARANTIA
458	2015-02-05 17:39:03.065004-05	3	253	EN TRAMITE REALIZADO DIRECTAMENTE EN HPSTOREHERMOSILLO.
459	2015-02-05 17:58:45.886828-05	3	192	NO PRESENTO FALLA EN CENTRO AUTORIZADO DE SERVICIO.
460	2015-02-05 17:59:20.986122-05	3	192	SE PROGRAMA RETORNO DE PROYECTO AL CLIENTE.
461	2015-02-05 18:47:51.113604-05	3	220	Reparación realizada por el Centro de Autorizado. No-break esta funcionando correctamente. \r\n
462	2015-02-05 18:49:13.714749-05	3	220	Garantía finalizada, puede acudir a recoger su equipo en la dirección de COMPUPROVEEDORES, en calle San Luis Potosi #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes.
463	2015-02-05 19:07:55.074195-05	3	144	Reparación realizada por el Centro de Autorizado. Equipo esta funcionando correctamente. \r\n
464	2015-02-05 19:08:20.785415-05	3	144	SE VALIDA QUE SE HAYA REALIZADO EL CAMBIO DE PANTALLA.
465	2015-02-05 19:08:40.120734-05	3	144	Garantia finalizada, puede acudir a recoger su equipo en la direccion de COMPUPROVEEDORES, en calle San Luis Potosi #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes.\r\n
466	2015-02-06 13:03:20.401542-05	37	264	Se realizo limpieza interna y externa de equipo proyector. Se realizaron pruebas de diagnostico entradas y salidas correctamente.
467	2015-02-07 14:21:39.148268-05	3	268	Exchange Online (plan 1)\r\nPlan de archivado del correo electrónico, mensajería y calendarios accesibles desde Outlook en PCs, Web y dispositivos móviles. (Plan f30df)\t\r\n49,00 $\r\nPor licencia de usuario, por mes
468	2015-02-07 14:23:29.277285-05	3	268	CORREO ELECTRONICO: \r\nomarsardo@compuproveedores.com 
469	2015-02-07 14:37:06.731952-05	3	238	correo electronico:\r\nmarcocanedo@compuproveedores.com
470	2015-02-07 14:56:40.328599-05	37	264	Equipo listo para su recolección en dirección COMPUPROVEEDORES, calle San Luis Potosi # 2, Col. Centro. Horario: 8am a 1pm y 2pm a 5pm lunes a viernes. 
471	2015-02-09 07:46:47.260888-05	3	260	se configuro el correo en forma exchange. 
472	2015-02-09 07:47:35.25471-05	3	259	se realizo servicio preventivo.
473	2015-02-09 07:48:21.001746-05	3	174	se reparo diadema. 
474	2015-02-09 07:49:06.07065-05	3	193	se asigno multifuncional samsung. 
475	2015-02-09 08:08:58.963993-05	3	239	se configuro el correo de iliana fuente en computadora silvia. 
476	2015-02-09 10:28:15.227383-05	3	256	Lenovo < 955848 > christian \r\nhclevono@ar.ibm.com 
477	2015-02-09 10:55:20.627208-05	37	269	Se realiza el diagnostico de equipo, se determino realizar servicio preventivo a equipo detectando sucio en su interior (Limpieza de tarjetas electrónicas, chasis y lentes). Se detecto tornillos sueltos en su interior. Se verifica el correcto funcionamiento de equipo.
478	2015-02-09 10:56:04.305927-05	37	269	Equipo listo para su recolección en dirección COMPUPROVEEDORES, calle San Luis Potosi # 2, Col. Centro. Horario: 8am a 1pm y 2pm a 5pm lunes a viernes.
479	2015-02-09 11:08:57.151644-05	3	203	NO FUE POSIBLE LA INSTALACIÓN DEL SISTEMA OPERATIVO CON LO ENVIADO.\r\nSE REALIZARA UN NUEVO ENVIÓ.\r\nEl numero de envió es: 310313528
480	2015-02-09 11:13:50.698525-05	3	203	La siguiente información correspondiente al 906621969 1/28/2015 05:25:14 PM sobre la solicitud del despacho# 310313528
481	2015-02-09 12:25:24.644438-05	4	236	Se instalo proyector y revisamos el correcto funcionamiento, cliente firma de conformidad.\r\n\r\n
482	2015-02-09 13:24:08.382623-05	3	210	ID CASE 4746249307
483	2015-02-09 13:41:45.681774-05	3	270	CONTRASEÑA: lorenzomarquez
484	2015-02-09 13:44:04.060643-05	3	270	No carga el sistema operativo. \r\nse reinstalara el sistema operativo. 
485	2015-02-10 12:52:19.531945-05	3	270	ERROR DE DISCO DURO.\r\nEL EQUIPO SERA ENVIADO A HP MEXICO POR PAQUETERIA EL DIA VIERNES 13 DE FEBRERO.\r\n
486	2015-02-10 12:55:16.007546-05	3	233	EQUIPO SE ENVIARA POR ESTAFETA A LA CIUDAD DE JALISCO COMO PARTE DEL PROCESO DE TRAMITE DE GARANTÍA. 
487	2015-02-10 12:56:55.994566-05	3	270	\r\nModelo:     HP 14-R016LA NOTEBOOK PC\r\nNo. Serie:    CND42226N0\r\nOrden de Servicio: 4002128111\r\nCSO:  BFLG9541-01\r\nNúmero de caso:  3012525677\r\n\r\n\r\nHemos iniciado el proceso de Reparación / Intercambio / Intercambio de Accesorios / Envío de Drivers para su equipo, según sea el caso
488	2015-02-10 13:12:34.5397-05	3	210	Las siguientes piezas fueron solicitadas:\r\nPart Number: 708457-001 SPS-BATT 6C 47WHr 2.2AH LI FP06047-CL\r\n\r\nY serán entregadas en:\r\n\r\nAVENIDA SAN LUIS POTOSÍ # 21\r\nCOL. CENTRO\r\nHERMOSILLO, SON 83000\r\n\r\nel número de orden 0630246775 y el número de caso 4746249307.\r\n
489	2015-02-10 14:45:36.205675-05	3	224	SERIAL FT315115\r\nCANON M111121\r\nC-15410 \r\nREF: 1226
490	2015-02-10 16:11:34.739821-05	3	210	Este e-mail es para informarle que las siguientes partes correspondientes al reciente evento de servicios, Customer Self Repair (CSR), 0630246775, han sido enviadas a través de DHL.\r\nA continuación se detalla la lista de los números de guía para seguimiento, y las piezas defectuosas que deben ser regresadas:\r\n\r\n\r\nPart Number: 708457-001 SPS-BATT 6C 47WHr 2.2AH LI FP06047-CL\r\n\r\nDHL Traking number: 8555809544\r\n
491	2015-02-10 17:31:09.396296-05	3	256	Pieza solicitada en transito.\r\nfecha de estimada de entrega viernes 13 de febrero. \r\n
492	2015-02-10 17:34:25.452805-05	3	255	C-3829\r\n13-11-2014\r\nP-436\r\nREF-9077
493	2015-02-11 12:32:16.00208-05	3	169	SE REALIZO INSTALACION Y CONFIGURACION DE MICROSIP EN COMPUTADORA DE COBRANZA01. \r\n
494	2015-02-11 12:38:29.017102-05	3	169	Reporte finalizado, se procede a imprimir reporte y cerrar solicitud solicitada.\r\n
495	2015-02-11 12:40:21.174342-05	3	197	SE RESETEO CONTRASEÑA \r\nQUEDO EL SKYPE CON LA NUEVA CONTRASEÑA PRETERMITIDA AL INICIAR SESSION.
496	2015-02-11 12:40:43.477495-05	3	197	Reporte finalizado, se procede a imprimir reporte y cerrar solicitud solicitada.
497	2015-02-11 12:42:16.747575-05	3	204	SERVICIOS REALIZADOS A LA COMPUTADORA PORTATIL.\r\n
498	2015-02-11 12:42:30.931938-05	3	204	Reporte finalizado, se procede a imprimir reporte y cerrar solicitud solicitada.\r\n
499	2015-02-11 13:05:31.563559-05	4	212	SE REPARA PUERTO Y PRUEBA EQUIPO, LISTO PARA SU ENTREGA.
500	2015-02-11 13:34:48.720437-05	3	215	EQUIPO: HP ENVY 14-K002la\r\nS/N: CND3240D6W
501	2015-02-11 13:35:44.705768-05	3	215	SE ENVIA CARTA RESPONSIVA AL CORREO DE ALEJANDRO PEREZ, EVANGELINA SORIA, CARMEN MEJIA Y RECURSOS HUMANOS. \r\n
502	2015-02-11 13:35:51.089667-05	3	215	Reporte finalizado, se procede a imprimir reporte y cerrar solicitud solicitada.\r\n
503	2015-02-11 13:36:06.250742-05	3	215	Cualquier duda o comentario quedo a sus órdenes.\r\nSaludos.\r\nTzirahuén Martínez \r\nDepartamento Soporte Técnico\r\nOficina (662) 214 2200 ext. 250.\r\nCelular (662) 229 3979 Directo 2113.
504	2015-02-11 13:42:05.469454-05	3	216	USUARIO DE OFFICE 365.\r\nPEDRO.JIMENEZ@COMPUPROVEEDORES.COM\r\n
505	2015-02-11 13:44:58.742085-05	3	227	se configuro por exchange el corrreo de compras@compuproveedores.com en la computadora de  Vianey Yanajara.
506	2015-02-11 13:51:17.261016-05	3	227	se configuro por exchange el correo de ilianafuentes@compuproveedores.com en la computadora de Silvia.
507	2015-02-11 13:51:56.89455-05	3	227	Reporte finalizado, se procede a imprimir reporte y cerrar solicitud solicitada.\r\n
508	2015-02-11 13:52:11.737012-05	3	227	Cualquier duda o comentario quedo a sus órdenes.\r\nSaludos.\r\nTzirahuén Martínez \r\nDepartamento Soporte Técnico\r\nOficina (662) 214 2200 ext. 250.\r\nCelular (662) 229 3979 Directo 2113.
509	2015-02-11 18:35:58.878195-05	4	163	EQUIPO PRESENTA FALLA EN UNO DE LOS PLUG DE CORRIENTE, COSTO DE REPARACIÓN $500.00
510	2015-02-11 18:37:45.545846-05	4	163	SE PROBO TAMBIÉN EL USO DE ADAPTADOR DE CORRIENTE POR EL PUERTO MISCRO USB Y FUNCIONA CORRECTAMENTE, SE RECOMIENDA EL USO DE ESTE PUERTO PARA CARGAR EL EQUIPO.
511	2015-02-11 18:38:40.797839-05	4	164	SE COTIZA REPARACION DE EQUIPO, COSTO TOTAL $500.00
512	2015-02-11 18:39:20.128833-05	4	214	SE COTIZA DISPLAY DE EQUIPO, COSTO DE REPARACIÓN $500.00
513	2015-02-12 13:35:46.685908-05	37	275	Se detecto problemas de inicio en sistema operativo, se realizo la restauración de sistema operativo.
514	2015-02-12 13:38:13.888289-05	4	277	EL EQUIPO YA SE HABÍA DIAGNOSTICADO POR OTRO CENTRO DE SERVICIO Y AL DIAGNOSTICARSE EXTRAJERON INVERTER QUE IMPIDE EL CORRECTO DIAGNOSTICO, SE LE INFORMO A CLIENTE Y NOS PIDE COTIZAR REFACCIÓN. 
515	2015-02-12 14:31:01.239939-05	3	224	jorge.estrada@hermosillo.gob.mx
516	2015-02-12 16:42:29.509602-05	37	275	***Batería dañada*** Se realizo servicio preventivo: $340.00 + IVA. Recoger equipo en oficina Compuproveedores dirección San Luis Potosi #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes.
517	2015-02-13 11:42:40.907039-05	3	258	correo electronico: toner20-ventas30@outlook.com\r\nSkype: toner20-ventas30@outlook.com.
518	2015-02-13 14:54:28.748411-05	37	280	Se acude a realizar de configuración de equipos por IP/Fija, asignando equipo servidor principal (192.168.1.100, 101, 102, 103, 104). Se revisa el acceso de 5 equipos en sistema CONTPAQ.
519	2015-02-13 18:59:32.252788-05	37	278	Se recoge equipo para su revisión en taller COMPUPROVEEDORES.
520	2015-02-16 11:56:45.622876-05	37	284	Se envió cotizacion y se autorizo por cliente la compra de material e instalación de 2 equipos scanner Xerox.
521	2015-02-16 13:31:30.294726-05	3	96	SE SOLICITA STATUS AL PROVEEDOR POR CORREO ELECTRONICO. \r\nESTE EQUIPO EL CLIENTE REALIZADO UN NOTA DE DEVOLUCION.\r\nTABLET ES PROPIEDAD DE COMPUPROVEEDORES.
522	2015-02-16 13:48:56.911605-05	3	129	You can view the ticket here:\r\nhttp://www.centralsoporte.mx/ticket.php?track=YB7-R8Z-1BA8&Refresh=92399\r\n\r\n
523	2015-02-16 13:49:28.936471-05	3	129	En espera de retorno por parte del fabricante del equipo reparado. 
524	2015-02-16 14:03:34.916404-05	3	164	Requiero la confirmación del anticipo por parte del cliente para proceder al envió de la tableta para la reparación. 
525	2015-02-16 14:43:45.876109-05	3	210	SE REALIZO EL CAMBIO FISICO DE LA BATERIA POR PARTE DEL FABRICANTE.
526	2015-02-16 16:46:55.589272-05	4	281	SE DIAGNOSTICA FALLA EN FUENTE DE PODER, SE RECOMIENDA CAMBIO DE GABINETE. SE COTIZA.\r\n
527	2015-02-16 17:52:15.477697-05	3	210	EQUIPO REQUIERO LA REINSTALACION DEL SISTEMA OPERATIVO PARA VALIDAR QUE EL EQUIPO ESTA FUNCIONANDO CORRECTAMENTE. 
528	2015-02-17 16:39:57.986577-05	3	256	Reparación realizada por el Centro de Autorizado. Equipo esta funcionando correctamente. 
529	2015-02-17 16:41:02.321778-05	3	256	se realizo cambio de display en computadora.
530	2015-02-17 17:01:39.858557-05	3	256	SE PROGRAMA ENTREGA A ENRIQUE RUIZ EN COMONFORT Y DR. PALIZA S/N, EN PLANTA BAJA, ENFRENTE DE PLAZA BICENTENARIO.
531	2015-02-17 17:07:58.093721-05	37	288	Se programo visita para restablecer sesión de windows.
532	2015-02-17 18:00:48.571549-05	3	231	Reparación realizada por el Centro de Autorizado. Equipo esta funcionando correctamente. \r\n\r\n
533	2015-02-17 18:01:05.986345-05	3	231	se realiza cambio fisico de proyector.
534	2015-02-17 18:01:26.981078-05	3	231	Cualquier duda o comentario quedo a sus órdenes.\r\nSaludos.\r\nTzirahuén Martínez \r\nDepartamento Soporte Técnico\r\nOficina (662) 214 2200 ext. 250.\r\nCelular (662) 229 3979 Directo 2113.
535	2015-02-17 18:02:52.255965-05	3	231	se programa entrega de equipo en planta ford.
536	2015-02-17 18:09:04.13365-05	3	231	NUEVO EQUIPO: \r\nCN-00MDW9-S0071-11J0-190\r\nSERVICE TAG:\r\n47X15M1\r\nREV A19
537	2015-02-17 18:59:52.305015-05	3	210	reinstalación de sistema operativo que elimino la advertencio de descarga de bateria.\r\n
538	2015-02-17 19:01:53.443423-05	3	210	Reparación realizada por el Centro de Autorizado. Equipo esta funcionando correctamente. 
539	2015-02-17 19:04:14.891105-05	3	210	Reporte finalizado, se procede a imprimir reporte y cerrar solicitud solicitada.
540	2015-02-17 19:15:10.233213-05	3	274	NO SE A PRESENTANDO LA FALLA.\r\n
541	2015-02-17 19:15:43.150339-05	3	274	SE ESTUVO EN USO COMO PUEBAS DEL UPS.\r\nSIN PRESENTAR FALLA.\r\n
542	2015-02-17 19:16:05.888195-05	3	274	SE PROGRAMA ENTREGA CON FOLIO DE SERVICIO PARA REVISAR EL VOLTAJE EN LA OFICINA DEL CLIENTE.
543	2015-02-18 10:28:26.977231-05	3	276	en prueba de laboratorio.\r\nno ha presentando el problema reportado. 
544	2015-02-18 10:28:48.808308-05	3	279	consumible.
545	2015-02-18 10:28:57.60882-05	3	272	consumible.
546	2015-02-18 10:29:10.899621-05	3	271	consumible.
547	2015-02-18 10:30:32.23394-05	3	287	No reconoce los puertos USB.\r\nSe iniciara tramite de garantia con el fabricante.
548	2015-02-18 10:43:03.152557-05	3	262	C-11673\r\nP-57\r\nREF-123332\r\n11/03/2014
549	2015-02-18 10:44:19.87419-05	3	179	REFACCIONES SOLO CUENTAN CON 3 MESES DE GARANTIA.\r\nNO PROCEDE GARANTIA.
550	2015-02-18 10:47:19.587721-05	37	235	Se entrego otro equipo por cliente para realizar el respaldo de informacion en equipo LAPTOP-ASUS. Se realiza el respaldo de informacion de equipo dañado a equipo que entrega cliente, equipos listos para su recoleccion en COMPUPROVEEDORES en calle San Luis Potosi #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes.
551	2015-02-18 10:47:37.91173-05	37	226	COMPUPROVEEDORES en calle San Luis Potosi #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes.
552	2015-02-18 11:09:26.329841-05	37	181	Equipo en espera de autorización para compra de refacción, "Formatter Board" P/N: CE475-60001
553	2015-02-18 11:34:38.312278-05	3	262	FACTURADO AL CLIENTE \r\n11/03/2014.\r\nPEDIDO: 28284.\r\nC-3903
554	2015-02-18 12:01:37.154308-05	3	254	C-15919 02/12/2014\r\nP-57 REF-89783\r\nC-16395 27/01/2015\r\nP-253 REF-368243\r\n
555	2015-02-18 18:27:22.34001-05	3	262	Proyector trae un boton oprimido, se arreglo esa problema del boton. 
556	2015-02-18 18:28:07.640916-05	3	262	Enciende el proyecto pero no esta enviando imagen por la lampara.
557	2015-02-19 10:28:58.220087-05	37	289	No es posible realizar el diagnostico de equipo. Pasar a recoger equipo en COMPUPROVEEDORES en calle San Luis Potosi #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes.
558	2015-02-19 11:03:22.124438-05	37	289	Se confirma que equipo se enviara a garantía de fabricante, tiempo y tipo de envió recolección por paqueteria 3 a 4 días hábiles.
559	2015-02-19 11:26:53.145568-05	37	290	Se detecto daño en tarjeta lógica de equipo con daño físico en botón encendido y entrada de AC.
560	2015-02-19 13:06:37.005307-05	37	290	Pasar a recoger equipo en COMPUPROVEEDORES en calle San Luis Potosi #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes.
561	2015-02-19 13:30:35.064037-05	37	291	Cotización disco duro: $830 IVA Incluido, Servicio instalación de sistema operativo: $500 + IVA. Pasar a realizar el pago de refacción en COMPUPROVEEDORES en calle San Luis Potosí #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes
562	2015-02-21 11:10:35.298091-05	1	296	Se programa visita para recolección lunes 23 febrero 09:00am
563	2015-02-21 13:19:22.102376-05	3	163	SE ENTREGA TABLETA A Luis Enrique Gómez Felix PORQUE SE REQUIERE ANTICIPO Y AUTORIZACION DE REPARACION POR PARTE DEL CLIENTE FINAL.
564	2015-02-21 13:50:06.735323-05	3	164	SE ENTREGA TABLETA A Luis Enrique Gómez Felix PORQUE SE REQUIERE ANTICIPO Y AUTORIZACION DE REPARACION POR PARTE DEL CLIENTE FINAL.\r\n
565	2015-02-21 13:56:35.00694-05	3	214	SE ENTREGA TABLETA A Luis Enrique Gómez Felix PORQUE SE REQUIERE ANTICIPO Y AUTORIZACION DE REPARACION POR PARTE DEL CLIENTE FINAL.\r\n
566	2015-02-23 12:21:49.490107-05	15	289	SE RECOLETO CARGADOR A CLIENTE, YA QUE HABÍA QUEDADO PENDIENTE DE ENTREGARSE. 
567	2015-02-23 13:37:11.288844-05	1	296	Equipo se encuentra en Almacén-Compuproveedores. Listo para ser entregado al fabricante para proceso de garantia.
568	2015-02-23 17:10:16.431033-05	8	255	Se le entregará equipo de impresion al cliente.
569	2015-02-24 10:41:07.298935-05	3	295	se realizo cambio de CPU entre el equipo de Liliana Navarro y Iliana Fuentes.
570	2015-02-24 10:41:46.166689-05	3	295	se instalo un segundo monitor en la lugar de Iliana Fuentes.
571	2015-02-24 10:53:34.233468-05	1	297	Se programa visita de atencion preventiva viernes 27 febrero 11:00am
572	2015-02-24 11:02:02.286082-05	1	277	Se solicita pago de refacción (inversora) $700, realizar pago en COMPUPROVEEDORES en calle San Luis Potosi #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes.
573	2015-02-24 12:02:08.408457-05	3	301	Este e-mail es para confirmar su evento de servicio CSR (Customer Self Repair) con HP Services  2/24/15 6:34:23, para el número de serie SG43FLX5SH - J9727A.  Las siguientes piezas fueron solicitadas:\r\n\r\n\r\nPart Number: J9727-61101 SU 2920-24G-POE+ Switch\r\n
574	2015-02-24 12:04:58.332415-05	3	301	  Este e-mail es para confirmar su evento de servicio CSR (Customer Self Repair) con HP Services  2/24/15 6:36:55, para el número de serie SG43FLX53H - J9727A.  Las siguientes piezas fueron solicitadas:\r\n\r\n\r\nPart Number: J9727-61101 SU 2920-24G-POE+ Switch\r\n
575	2015-02-24 12:13:16.612728-05	3	298	C-16243\r\n09/01/2015\r\nP-57\r\nRef-91365
576	2015-02-24 13:10:08.951371-05	3	302	FOLIO DE SERVICIO 1032.
577	2015-02-24 13:10:46.392099-05	3	293	FOLIO DE SERVICIO 1032.
578	2015-02-24 13:50:35.595519-05	3	129	numero de guía estafeta:\r\n0863982213.\r\nretorno el día de hoy 24 de febrero.
579	2015-02-24 14:02:01.146625-05	3	270	Reparación realizada por el Centro de Autorizado. Equipo esta funcionando correctamente. \r\n
580	2015-02-24 14:02:14.623923-05	3	270	Garantia finalizada, puede acudir a recoger su equipo en la direccion de COMPUPROVEEDORES, en calle San Luis Potosi #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes.\r\n
581	2015-02-24 14:32:55.211246-05	3	301	Part Number: J9727-61101 SU 2920-24G-POE+ Switch\r\n\r\nDHL Traking number: 2092621565\r\n
582	2015-02-24 14:33:37.957408-05	3	301	Part Number: J9727-61101 SU 2920-24G-POE+ Switch\r\n\r\nDHL Traking number: 2092621580\r\n
583	2015-02-24 14:35:18.217098-05	3	136	se autoriza nota de credito por el costo de compra. 
584	2015-02-24 14:35:55.996822-05	3	136	El día de hoy se recibirá el costo exacto de la nota de crédito.
585	2015-02-24 14:42:01.598422-05	3	136	http://www.centralsoporte.mx/ticket.php?track=YB7-R8Z-1BA8&Refresh=29716
586	2015-02-25 10:23:28.67783-05	1	296	Se genera reporte 1264865 con visita de técnico Xerox.
587	2015-02-25 14:39:39.338597-05	3	129	Número de guía\r\n0058599598655781195917\r\nCódigo de rastreo\r\n0863982213\r\nOrigen\r\nMonterrey\r\nDestino\r\nHermosillo\r\nCP Destino\t 83000\r\nEstatus del servicio\r\n\r\nPendiente en transito\r\nRecibió\r\n \r\nServicio\r\nEntrega garantizada al cuarto día hábil\r\nFecha y hora de entrega\r\n \r\nTipo de envío\r\nPAQUETE\r\nFecha programada\r\nde entrega\r\n02/03/2015\r\nNúmero de orden de recolección\r\n10678065\r\nFecha de recolección\r\n24/02/2015 06:49 PM
588	2015-02-25 16:03:44.937096-05	4	300	SE REALIZO LIMPIEZA DE EQUIPO Y CAMBIO DE UNIDAD DE IMAGEN\r\n
589	2015-02-25 16:35:34.744034-05	1	281	Se realiza intercambio de piezas y perifericos en gabinete ACTECK Slim Micro ATX 500W GT55. 
590	2015-02-25 19:10:05.028912-05	3	157	Reparación realizada por el Centro de Autorizado. Equipo esta funcionando correctamente. 
591	2015-02-25 19:10:18.465956-05	3	157	Garantia finalizada, puede acudir a recoger su equipo en la direccion de COMPUPROVEEDORES, en calle San Luis Potosi #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes.\r\n
592	2015-02-25 19:16:31.974229-05	3	223	Reparación realizada por el Centro de Autorizado. Equipo esta funcionando correctamente. 
593	2015-02-25 19:17:04.615762-05	3	223	Garantia finalizada, puede acudir a recoger su equipo en la direccion de COMPUPROVEEDORES, en calle San Luis Potosi #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes.\r\n
594	2015-02-25 19:25:40.966283-05	3	127	Reparación realizada por el Centro de Autorizado. Equipo esta funcionando correctamente. \r\n
595	2015-02-25 19:25:53.126077-05	3	127	Garantia finalizada, puede acudir a recoger su equipo en la direccion de COMPUPROVEEDORES, en calle San Luis Potosi #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes.\r\n
596	2015-02-25 19:28:45.248416-05	1	303	Se detecta cartucho vació (Magenta - 88XL - N/P: C9392A. Se requiere cartucho para realizar pruebas de diagnostico y calibracion de cabezales. Se detecto sucios los cabezales y con derrame de tinta. Pendiente adquirir cartucho magenta para diagnostico.
597	2015-02-26 01:54:11.783974-05	3	233	Le informo que hoy se realizo el envió del Cambio Físico del Producto directo al domicilio indicado.\r\n\r\nLa guia de Retorno de Estafeta es \r\nNúmero de guía\r\n2018618479780601369157\r\nCódigo de rastreo\r\n3279813848\r\n
598	2015-02-26 01:55:11.677507-05	3	233	El envío se encuentra en tiempo para ser entregado el día 26/02/2015, para cualquier duda o comentario favor de comunicarse.
599	2015-02-26 01:57:15.561668-05	3	274	Presento problema al momento de iniciar carga en función de Batería de respaldo. 
600	2015-02-26 10:22:52.93713-05	1	302	Se realizo proceso de garantía para revisión de Hardware, en espera de recolección de equipo.
601	2015-02-26 14:19:04.986482-05	3	233	cambio fisico por parte del fabricante. 
602	2015-02-26 14:19:22.808031-05	3	233	Reporte finalizado, se procede a imprimir reporte y cerrar solicitud solicitada.
603	2015-02-26 17:07:52.778863-05	3	233	REMISIÓN: 10106.\r\n1 VORAU3655858 DIADEMA VORAGO HP-300 AF MIC BLANCO.
604	2015-02-26 17:39:37.848464-05	1	296	Se realizo la visita de técnico, evidenciando el estado y condiciones de equipo, asi como la pagina de contadores e imágenes de condiciones de unidad recolectora, se escala a fabricante para resolución de problema.
605	2015-02-26 18:11:32.019507-05	1	305	Se realizo mantenimiento preventivo a equipo, se realiza calibración de impresión y color. Equipo listo para su recolección en COMPUPROVEEDORES calle San Luis Potosí #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes
606	2015-02-26 18:49:47.286948-05	4	304	SE REALIZO LA INSTALACION Y CONFIGURACION DE IMPRESORA EN 4 DE 5 EQUIPOS SOLICITADOS. SE PROCEDE A CIERRE DE REPORTE\r\n
607	2015-02-27 10:09:49.769714-05	1	130	Se instala tarjeta madre en equipo y verifica el correcto funcionamiento. No se detecta problema en sistema operativo actual. Recolección en COMPUPROVEEDORES calle San Luis Potosí #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes
608	2015-02-27 12:53:51.405755-05	36	283	en diagnostico de falla.
609	2015-02-27 12:54:16.99054-05	36	213	en diagnostico de falla.
610	2015-02-28 12:27:56.83715-05	4	307	SE REALIZA SERVICIO PREVENTIVO Y PRUEBAS DE IMPRESIÓN CORROBORANDO EL CORRECTO FUNCIONAMIENTO DE EL EQUIPO.
611	2015-02-28 12:41:31.829134-05	4	278	SE ENTREGA EQUIPO Y SE REALIZAN PRUEBAS PARA VERIFICAR SU CORRECTO FUNCIONAMIENTO
612	2015-03-02 10:40:48.030886-05	37	308	Se programa visita de instalación lunes 02 marzo 10:00am
613	2015-03-02 16:43:51.1897-05	37	311	Se detecto problema en disco duro de equipo. Se solicita anticipo para la compra de refacción y realizar cambio con la configuración de equipo.
614	2015-03-03 11:20:51.169672-05	3	274	SE ENVIÓ AL FABRICANTE A MÉXICO PARA REPARACIÓN POR PARTE DEL MAYORISTA. FECHA ESTIMADA DE RECEPCION ENTRE 15 Y 20 DE MARZO.
615	2015-03-03 13:14:12.688652-05	37	284	Cliente solicita la instalación de scanner. Se observa requiere de instalación cable UTP como extensión, así como switch para compartir scanner con 2 equipos computadoras. Pendiente enviar cotización de servicio.
616	2015-03-03 16:58:38.09038-05	14	276	Orden de Servicio: BFLZ1125-01 / 4002250913 Número de caso: 3013335309 Sistema Operativo: W8.1-32 
617	2015-03-03 17:01:16.472995-05	14	276	Orden de Servicio: BFLZ1125-01 / 4002250913 Número de caso: 3013335309 Sistema Operativo: W8.1-32 
618	2015-03-03 17:04:28.974212-05	37	289	Equipo reparado y listo para recolección. COMPUPROVEEDORES en calle San Luis Potosi #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes.
619	2015-03-03 17:16:44.670692-05	14	129	El equipo se recibió  y se prueba para su correcto funcionamiento.
620	2015-03-03 17:18:53.88636-05	37	311	Equipo reparado y listo para recolección. COMPUPROVEEDORES en calle San Luis Potosi #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes.
621	2015-03-03 17:39:19.926603-05	14	129	Reparación realizada por el Centro de Autorizado. Equipo esta funcionando correctamente. 
622	2015-03-03 18:33:51.533945-05	37	316	Se programa servicio preventivo martes 03 marzo 17:00hrs.
623	2015-03-03 19:08:00.127579-05	3	318	C- 10588 02/01/2014\r\nP-81 19/12/2013\r\nREF: 118720
624	2015-03-03 19:09:18.680695-05	3	318	TÉCNICO : SERGIO DOMINGUEZ ACUÑA \r\nPUESTO:   COORDINADOR  DE AREA\r\nTELEFONO: 2 13 97 41\r\nDIRECCION : TEHUANTEPEC Y COMONFORT EDIFICIO DEL PODER JUDICIAL\r\n                        COL. CENTENARIO ( FRENTE PLAZA BICENTENARIO )\r\n
625	2015-03-04 10:17:15.212829-05	3	129	Garantia finalizada, puede acudir a recoger su equipo en la direccion de COMPUPROVEEDORES, en calle San Luis Potosi #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes.\r\n
626	2015-03-04 10:33:20.031266-05	14	162	Reparación realizada por el Centro de Autorizado. Equipo esta funcionando correctamente. \r\n\r\nGarantia finalizada, puede acudir a recoger su equipo en la direccion de COMPUPROVEEDORES, en calle San Luis Potosi #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes.
627	2015-03-04 10:51:06.618565-05	14	187	Reparación realizada por el Centro de Autorizado. Equipo esta funcionando correctamente. \r\n\r\nGarantia finalizada, puede acudir a recoger su equipo en la direccion de COMPUPROVEEDORES, en calle San Luis Potosi #21, Colonia Centro. En el Horario de 8am a 1pm y 2pm a 5pm de lunes a viernes.
628	2015-03-04 13:31:07.576616-05	37	306	Se actualiza BIOS y controlador de audio.
629	2015-03-05 11:42:59.576976-05	37	320	Se programa visita en atención a mantenimientos preventivos programados lunes 9 marzo 09:00am
630	2015-03-05 12:46:33.226993-05	14	262	EL EQUIPO CONTINUA EN EL CENTRO DE SERVICIO FOCUS DE LA CIUDAD DE MEXICO. EL NUMERO DE ORDEN ES: 01009140 
631	2015-03-05 12:53:38.43713-05	3	299	CONSUMIBLE
632	2015-03-05 14:27:43.281699-05	14	293	Reparación realizada por el Centro de Autorizado. Equipo esta funcionando correctamente. \r\n\r\n
633	2015-03-05 17:13:48.41956-05	14	315	4650839500\r\nTítulo del caso:\r\nProblemas con la bateria\r\nGravedad\t3-Normal\r\nNúmero de serie de producto:\t5CB42402TJ\r\nNúmero de producto:\tF7W16LT\r\nEnviados:\t05/03/2015 03:11:02 p.m.\r\nÚltima actualización:\t05/03/2015 03:11:02 p.m.\r\nFuente:\tWeb\r\nEstado del caso:\tRecibidos por HP
634	2015-03-06 10:10:22.023392-05	14	211	Se programa recolección del equipo para el día de hoy.\r\n\r\nInside the flipper there is a card guide on a spring and it came out\r\nof its track, so I replaced the flipper.\r\n\r\nAlso it looks like this is used in a dirty environment.  I would\r\nrecommend running a cleaning cycle about every 500 or 600 cards not\r\nthe 1000 Evolis would like it cleaned by.\r\n
635	2015-03-06 11:27:19.7429-05	14	96	Se envía nuevamente con el proveedor porque el equipo no enciende.
636	2015-03-06 11:29:15.053702-05	14	245	se envía nuevamente con el proveedor, por daño en plug USB.
637	2015-03-06 11:30:24.710288-05	14	283	Se envía con proveedor para reparar la falla.
638	2015-03-06 14:12:51.185624-05	14	318	A EL EQUIPO SE LE CARGO EL SISTEMA OPERATIVO, SE LE REALIZO EL RESPALDO Y SE INSTALO LA PAQUETERA DE OFFICE.\r\n\r\nCABE HACER MENCIÓN QUE LO QUE SE LE REALIZO A ESTE EQUIPO NO ESTA DENTRO DE GARANTÍA (RE INSTALACIÓN DEL SISTEMA NI EL RESPALDO), SIN EMBARGO SE REALIZARON LOS TRABAJOS SIN COSTOS ADICIONALES.\r\n\r\nEL EQUIPO QUEDA FUNCIONANDO CORRECTAMENTE.\r\n
639	2015-03-07 11:18:28.196291-05	4	325	SE REALIZAN SERVICIOS EN EQUIPO 2 EQUIPOS HP Y UNO MAS ZEBRA, SE REALIZAN PRUEBAS DE IMPRESIÓN CORROBORANDO EL CORRECTO FUNCIONAMIENTO DEL MISMO. EN ESPERA DE FACTURACIÓN PARA CIERRE DE SERVICIO.
640	2015-03-07 11:20:13.57984-05	4	314	SE INSTALA NUEVA PANTALLA Y NOS PERCATAMOS QUE NO COINCIDE CON NUMERO DE PARTE DE EQUIPO ANTERIOR, EL CLIENTE NOS PROPORCIONO EL DISPLAY NUEVO. EN ESPERA DE RESPUESTA DE CLIENTE.
641	2015-03-07 11:21:33.372618-05	4	312	SE SOLICITA PIEZA CON FABRICANTE EQUIPO LISTO PARA ENVÍO.
642	2015-03-09 11:25:47.818648-04	37	331	Se programa la instalación de unidad recolectora.
643	2015-03-09 14:34:10.29892-04	14	211	Se programa envío con personal de almacén. 
644	2015-03-09 19:36:34.342163-04	14	330	Número de Referencia: 4650866171
645	2015-03-10 12:05:43.191396-04	14	332	  Este e-mail es para confirmar su evento de servicio CSR (Customer Self Repair) con HP Services  3/10/15 9:01:35, para el número de serie CNDCGBX1JT - CE993A.  Las siguientes piezas fueron solicitadas:\r\n\r\n\r\nPart Number: CF062-67901  Duplexer kit\r\n\r\n\r\n\r\n\r\nY serán entregadas a: \r\n\r\nIsabel Ubaldo\r\nCompuproveedores, S.A. de C.V.\r\nCALLE VÍA RÁPIDA ORIENTE 15456-4\r\nRESIDENCIAL RIO TIJUANA 3A ETAPA\r\nTIJUANA, BC 22226\r\nPhone: +52 16646451814 101\r\n\r\n\r\nnúmero de orden 0630583022 y el número de caso 4650873445.
646	2015-03-10 13:59:53.499951-04	14	334	Se programa recolección de equipo con el departamento de almacén.
647	2015-03-10 15:39:36.490024-04	14	330	Se crea reporte 3013619841 y orden de servicio 4002289192, se programa recolección por parte de DHL dentro de 3 a 5 días hábiles para enviarse a reparación. 
648	2015-03-10 18:19:36.917819-04	37	303	Se entrego equipo, no se pudieron realizar pruebas por falta de cabezal y tinta.
649	2015-03-10 19:28:23.608712-04	14	323	Se crea el Reporte 4650877843 
650	2015-03-10 20:21:13.757741-04	3	324	El diagnostico es que tiene una pieza quebrada.\r\nSe esta revisando la posibilidad de realizar un cambio por otra computadora. 
651	2015-03-11 13:12:54.670077-04	14	276	El equipo se encuentra en diagnostico en el centro de servicio de HP México.
652	2015-03-11 14:28:55.30335-04	14	329	se crea Reporte 3013666841 en HP
653	2015-03-11 14:49:53.648557-04	14	317	\r\nJESUS ROBLEDO\r\n\r\nAcepta como cambio en garantía los siguiente equipo:\r\n\r\n\r\nFolio   DOA           38-HHB2015                          \r\nModelo              7500_DN\r\nSerie                RXD139760\r\n
654	2015-03-11 15:24:11.768629-04	14	329	En este caso se le asignará un centro de soporte para la reparación de su equipo. Si usted no recibe ninguna actualización con respecto a la solución de la falla de su equipo entre 24 a 72 horas, por favor contáctese con el centro de soporte de HP nuevamente para el estado de su reporte con el siguiente número: 4650877681
655	2015-03-11 17:20:43.425585-04	14	262	Orden de Servicio: 01009140\r\nTipo de Reparación: Dentro de Garantía\tModelo Fabricante: IN2126\r\nMarca: Infocus\tNúmero de Serie: BKMK34900547\r\nContacto: Tzirahuen Martinez\t\r\nFalla reportada: No envia Imagen\r\nFecha Inicio: 04/03/2015\tEstatus: Esperando Autorización del Cliente\r\nDiagnóstico: Componente / Módulo Eléctrico Defectuoso\t\r\nSolución: Sustitución de Componente\r\n
656	2015-03-11 17:44:32.443595-04	14	237	No se encuentra falla se solicita retorno de la parte envida al proveedor.
657	2015-03-11 19:25:02.049169-04	14	334	Se genera el Reporte: 4650877681 con HP.
658	2015-03-12 11:55:19.873562-04	4	320	SE REALIZAN 20 SERVICIOS PREVENTIVOS DE LOS CUALES 7 EQUIPOS SON LAPTOP Y 13 EQUIPOS DE ESCRITORIO. FINALIZANDO LOS SERVICIOS EL DIA MIERCOLES 11 DE MARZO. 
659	2015-03-12 14:53:04.48168-04	14	323	Acude el técnico de HP a reparar el equipo y se deja funcionando correctamente, se programa envío con personal de almacén.
660	2015-03-12 15:06:02.040414-04	14	334	Acude el tecnico de HP y repara el equipo, deja el equipo funcionando correctamente.
661	2015-03-12 15:59:22.059018-04	14	335	Se le reinstala el sistema (no se pudo hacer respaldo), el equipo queda listo.
662	2015-03-13 05:47:24.283028-04	3	240	correo electronico: toner20-ventas30@outlook.com
663	2015-03-13 12:11:15.007258-04	4	342	SE REALIZA LEVANTAMIENTO DE INSTALACIÓN PARA PROYECTOR EN AULA.
664	2015-03-13 12:20:03.782507-04	4	343	LA BANDA DE TRANSFERENCIA SE ENCUENTRA DAÑADA. LOS CARTUCHOS INSTALADOS SE ENCUENTRAN RELLENADOS Y ESTO IMPIDE UN BUEN FUNCIONAMIENTO.
665	2015-03-13 19:11:02.171163-04	14	333	Se analizaron los componentes del equipo presentando falla en el disco duro, nos ponemos en contacto con el centro de servicio para reportar la falla.
666	2015-03-17 11:07:38.433904-04	14	333	Este e-mail es para confirmar su evento de servicio CSR (Customer Self Repair) con HP Services  3/16/15 5:16:10, para el número de serie MXL4090BQ1 - E3T63LT.  Las siguientes piezas fueron solicitadas:\r\n\r\n\r\nPart Number: 761771-001 SPS-HDD 500GB 7.2K 2.5" SATA-6G ENT-RE\r\n
667	2015-03-17 15:07:44.41807-04	14	315	Se le actualiza el bios y se le actualiza el software de diagnostico sin exito alguno. HP autoriza el cambio de bateria.
668	2015-03-17 17:38:10.303137-04	14	274	Llega equipo del centro de servicio funcionando correctamente, se programa envío con personal de almacén.
669	2015-03-17 17:51:11.367222-04	14	346	Se programa recolección con el área de almacén.
670	2015-03-17 17:52:08.885622-04	14	345	Se programa recolección con el área de almacén.
671	2015-03-18 11:52:10.37077-04	14	310	Se envía equipo con el proveedor para su valoración.
672	2015-03-18 11:58:53.782161-04	14	336	Se borran cookies de google play y el equipo queda funcionando correctamente.
673	2015-03-18 12:20:03.078273-04	14	333	Usted está recibiendo este correo para  informarle que hemos recibido su caso para enviarle la parte que está solicitando en garantía de reemplazo en el caso 4748355191 la cual le será enviada por medio de DHL 5072167310\r\n\r\nDiscos Duros
674	2015-03-18 12:26:58.377127-04	14	276	Se repara el equipo Con fabricante en México y lo envían el día de hoy demorando 3 días hábiles en llegar.
675	2015-03-18 12:54:28.529647-04	3	333	avisarle a:\r\nRosy escalante.\r\nTelefono 311-9962.\r\ncorreo: luzart.hermosillo@gmail.com\r\nsi quedo reparado con el cambio de disco duro. 
676	2015-03-18 14:22:47.232196-04	14	329	Se envía equipo a HP México para su reparación.
677	2015-03-19 13:05:50.191813-04	37	347	Se realiza limpieza de fusor y retira papel atorado.
678	2015-03-19 14:17:47.028284-04	14	333	Se cambia disco duro dañado por uno en buenas condiciones y se le reinstala el sistema, se deja equipo funcionando correctamente.
679	2015-03-19 15:34:35.624408-04	37	349	Se instala memoria 8GB-RAM, tarjeta vídeo 2GB-DDR3. Se instala controlador de tarjeta de vídeo satisfactoriamente.
680	2015-03-19 15:48:16.130773-04	14	345	Nos pusimos en contacto con HP y nos informan lo siguiente:\r\nEn este caso se le asignará un centro de soporte para la reparación de su equipo. Si usted no recibe ninguna actualización con respecto a la solución de la falla de su equipo entre 24 a 72 horas, por favor contáctese con el centro de soporte de HP nuevamente para el estado de su reporte con el siguiente número: 4650959888
681	2015-03-19 16:00:43.592263-04	37	181	En espera de equipo para su reemplazo en sitio. Compra de equipo en proceso.
682	2015-03-19 17:12:43.423521-04	14	276	El equipo llega de Mexico y se checa que la falla se haya corregido.\r\nEl equipo queda listo.
683	2015-03-19 17:14:58.478536-04	37	296	Equipo en proceso de DOA, reemplazo por proveedor.
684	2015-03-20 11:17:10.769067-04	14	276	Se programa entrega con equipo de almacén.
685	2015-03-20 17:03:00.575087-04	14	346	Se reinstala el sistema y el equipo funciona correctamente. Equipo listo.
686	2015-03-20 17:03:59.294462-04	14	345	Le cambian tarjeta madre y el equipo se deja funcionando correctamente. El equipo esta listo.
687	2015-03-20 17:49:22.514787-04	3	351	Se solicito a Elizabeht Velez el retorno del telefono que se envio.
688	2015-03-21 15:41:23.47562-04	3	348	Se remisionar multifuncional como consumo interno 
689	2015-03-21 15:42:52.370469-04	3	339	Los equipos cuentan con antivirus DEFENDER de Microsoft.  \r\n
690	2015-03-21 15:55:54.282954-04	3	327	carta responsiva fue enviado al correo de raymundo vega con copia a recursos humanos.
691	2015-03-21 15:57:20.978152-04	3	326	Se envio carta responsiva al correo de Estefania Fimbres con copia a Recursos Humanos. 
692	2015-03-21 15:58:20.948634-04	3	322	se realizaran pruebas para validar cual de los disco duros que cuenta la portatil es el disco que sera remplazado. 
693	2015-03-21 15:58:58.839723-04	3	319	se reviso el cableado. \r\nLa linea quedo funcionando correctamente. 
694	2015-03-21 15:59:36.478755-04	3	309	Se retiro el equipo en HP Store Hermosillo. 
695	2015-03-21 16:14:06.336516-04	3	286	SE QUITARON LAS CUENTAS BANCARIAS DE LAS FACTURAS DE LA EMPRESAS DE COMPUPROVEEDORES, HERMOSILLO, TIJUANA, CULIACAN Y EN DIFUSA NORTE. 
696	2015-03-21 16:14:42.619674-04	3	282	SE COMPRO UNA  BATERIA QUE SE ADAPTO AL TELEFONO. 
697	2015-03-21 16:15:48.230255-04	3	273	SE REALIZARON CAMBIOS DE PORTATIL A ARMANDO, ALFONSO Y NAZLI. ESTA PENDIENTE REALIZARLO A LILLIAN. 
698	2015-03-23 11:47:09.243725-04	14	344	Se reporta equipo con el proveedor y se crea el numero de caso 4650984982.
699	2015-03-23 12:29:12.094972-04	4	320	COSTO POR EQUIPO PORTÁTIL $400.00, COSTO POR EQUIPO DE ESCRITORIO $270.00 DANDO UN TOTAL DE $6310.00 MAS IVA
700	2015-03-23 12:32:55.245878-04	14	329	Hp informa que el equipo entro a reparación. 
701	2015-03-23 12:34:12.149648-04	4	355	SE REALIZO SERVICIO EN EQUIPO DE ARRENDAMIENTO.\r\n
702	2015-03-23 12:36:17.319965-04	37	312	Se entrego equipo para su reparación con proveedor, se realizo orden de compra refacción.
703	2015-03-23 12:51:27.226093-04	14	350	Se crea el reporte con Lenovo 302MD3D
704	2015-03-23 15:06:03.613252-04	14	356	Se envía mochila con fabricante para la validación de su garantía. 
705	2015-03-23 18:17:27.896184-04	37	357	Se realiza configuración de líneas de teléfono (662-1-622078 y 662-2-610955). Se configuraron 2 teléfonos principales [Extensión 601 y 602 - recepción], se configuran 2 extensiones como 603-Gerente y 604-Oficina. 
706	2015-03-24 14:20:19.081472-04	14	356	CÓDIGO DE RASTREO: 2979879916
707	2015-03-24 14:20:33.426875-04	14	356	ESTAFETA
708	2015-03-24 19:52:04.291998-04	14	287	Se sustituye el equipo HP 1155 con numero de parte D8D46LT#ABM con serie 5CM33104VM\r\nCon la remisión: 10608\r\nEquipo HP 205 G1 con numero de parte: E3T81LT#ABM con numero de serie: 4CE44507V6
709	2015-03-25 14:01:11.066859-04	14	358	4651010091 es el número de caso correspondiente al envió de la parte que requiere, esta se envia por paquetería con DHL modalidad contra entrega, el número de caso le sirve para darle seguimiento 24hrs después de haberse creado, puede verificar el tiempo de resolución, contactando vía telefónica al servicio técnico 1 800 711 2884 opción 2 opción 2 opción 4, eso le contactará con el departamento de status de casos que se encarga de la logística, 
710	2015-03-26 13:11:42.088063-04	37	277	Se informa cliente pase a realizar pago de refacción, para continuar con flujo de reporte.
711	2015-03-26 15:32:25.371418-04	4	355	SERVICIOS FINALIZADOS.
712	2015-03-26 19:03:43.751782-04	14	360	Se reinstala el sistema y el equipo se deja listo.
713	2015-03-26 19:05:21.743636-04	14	361	se reinstala el sistema y el equipo se deja listo.
714	2015-03-26 19:15:45.951658-04	14	338	Se le reinstala el sistema y el equipo queda listo.
715	2015-03-27 11:19:13.894979-04	8	299	SE HACE ENTREGA AL CLIENTE DEL NUEVO KIT DE MANTENIMIENTO.
716	2015-03-27 11:58:28.017618-04	4	277	SE SOLICITA PIEZA EN ESPERA PARA SU INSTALACIÓN 
717	2015-03-27 11:59:33.088359-04	37	314	Se realizo proceso de devolución de pantalla que solicito Mario (Difusa) a proveedor GPARTS. Se solicito refacción a RE-Suministros. En espera de entrega pantalla para realizar servicio.
718	2015-03-27 12:00:14.080321-04	37	342	Cliente nos indica se encuentra en proceso de autorización interna para realizar servicio.
719	2015-03-27 12:09:52.127765-04	37	365	Se realiza limpieza de equipo, restauración de sistema operativo. Reinstalación de software Office y Autocad 2015.
720	2015-03-27 13:16:02.324764-04	14	317	Se reemplaza impresora Xerox Phaser 7500DN con numero de serie: RXD139760F\r\npor impresora Xerox Phaser 7500DN con numero de serie: RXD140556F. Se envía impresora nueva con equipo de almacén. 
721	2015-03-27 13:55:48.210702-04	14	330	Entra a Reparación con el proveedor en México.
722	2015-03-27 14:43:10.61089-04	14	350	Llega el disco duro al centro de servicio, faltan las medias de instalación.
723	2015-03-27 20:08:40.896117-04	14	329	llega equipo de México funcionando correctamente. Equipo listo.
724	2015-03-28 17:53:13.817851-04	8	315	SE CAMBIO LA BATERIA,SE FORMATEO EL SISTEMA OPERATIVO Y SE HIZO CAMBIO DE CARGADOR. SE HACE ENTREGA AL CLIENTE.
725	2015-04-06 11:13:47.853447-04	37	366	Se programa visita para recolección de equipo.
726	2015-04-06 12:16:03.487337-04	14	354	Se envía equipo a Garantía con proveedor.
727	2015-04-06 12:16:52.955553-04	14	337	Se envía equipo a garantía con proveedor
728	2015-04-06 13:21:02.940217-04	14	356	El proveedor realiza cambio físico del equipo, el nuevo esta en buenas condiciones.
729	2015-04-07 11:13:34.353025-04	14	358	Llega el disco duro, se le Reinstala el sistema y el equipo queda listo.
730	2015-04-07 11:25:46.9951-04	14	330	Llega el equipo de México, se le aplican pruebas de rendimiento y funciona correctamente.
731	2015-04-07 11:37:22.504796-04	14	344	A el equipo se le cambia refacción pero sigue presentando la falla. 
732	2015-04-07 12:18:21.67628-04	14	344	Buen día:\r\n\r\nSolo para informar que se está trabajando en su equipo ya que no ha sido solucionado el problema y se está trabajando en ello.\r\n
733	2015-04-07 16:02:54.50407-04	14	337	Se crea el Reporte 5075
734	2015-04-07 16:03:51.134035-04	14	354	Se crea el reporte 5076
735	2015-04-07 17:19:56.313212-04	14	310	Se repara centro de carga con el fabricante, se prueba con cargador y funciona correctamente, el equipo esta listo.
736	2015-04-07 17:29:51.892359-04	14	354	Se repara centro de carga con el fabricante, se realizan pruebas con el cargador de la tablet y el equipo queda listo.
737	2015-04-07 17:40:43.917931-04	14	337	El fabricante arregla el centro de carga, se prueba con cargador de tablet y el equipo funciona correctamente.
738	2015-04-07 18:00:12.334046-04	14	359	En proceso de tramite de garantía.
739	2015-04-07 18:16:29.121854-04	4	312	EQUIPO REPARADO Y LISTA PARA SU ENTREGA.\r\n
740	2015-04-07 18:50:05.588834-04	37	368	Se intenta encender y recuperar información de disco duro, pero no funciona correctamente y no es posible acceso a la información. Se requiere reemplazo de disco duro.
741	2015-04-08 11:26:12.231537-04	14	371	Se programa recolección con equipo de almacén.
742	2015-04-08 11:26:47.138741-04	14	370	Se programa recolección con equipo de almacén.
743	2015-04-08 11:27:14.60048-04	14	369	Se programa recolección con equipo de almacén.
744	2015-04-08 15:02:18.92568-04	37	367	Se realiza reinstalación de sistema operativo, respaldo de información documentos y escritorio. Se agregan archivos de correo, se requieren datos de configuración correo electrónico para su correcto funcionamiento.
745	2015-04-09 12:01:47.313178-04	4	366	EL EQUIPO SE REEMPLAZARA, EN ESPERA DE EQUIPO.
746	2015-04-09 15:23:43.107571-04	3	364	Se realizo cambio de mouse y teclado. \r\n
747	2015-04-09 15:23:47.267939-04	3	364	Reporte finalizado, se procede a imprimir reporte y cerrar solicitud solicitada. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.\r\n
748	2015-04-09 15:27:41.256327-04	3	351	SE ENTREGA TELEFONO STEREN. \r\nNUMERO DE ACTIVO: 1900.100.408.\r\n
749	2015-04-09 15:30:14.068646-04	14	332	Se realiza el reporte nuevamente creando el caso 4651129020.
750	2015-04-09 17:49:52.670101-04	14	369	SE CREA REPORTE 3014919083 Y No DE ORDEN: 4002456522. \r\nPROCESO DEL SERVICIO: \r\n\r\n• Hewlett Packard le llamará para notificarle que puede pasar a recoger su equipo en el centro de recolección en los siguientes 8 días hábiles, después de esta fecha su orden será cancelada, es importante que acuda por su equipo en los tiempos antes mencionados. \r\n• El tiempo de entrega para el equipo depende la disponibilidad, consideramos un tiempo aproximado de 15 días hábiles. \r\n• Por favor, lleve una identificación oficial con fotografía (dependiendo del país de origen y legislaciones locales) y su número de Orden de Servicio (impreso al inicio de este mensaje) \r\n
751	2015-04-09 20:23:42.273347-04	37	372	Se recibe equipo para reparar con proveedor.
752	2015-04-09 20:24:27.91459-04	37	374	Se enviara cotización a cliente por vendedor.
753	2015-04-10 11:12:57.512671-04	4	374	SE PROPORCIONAN NÚMEROS DE PARTE A EJECUTIVO DE CUENTA PARA SU COTIZACIÓN.
754	2015-04-10 11:46:29.494749-04	14	352	Se envía equipo a garantía con fabricante.
755	2015-04-10 11:48:41.743961-04	14	350	Llegan las medias de instalación al centro de servicio, se procede a reinstalar el sistema.
756	2015-04-10 15:36:17.326293-04	14	359	Se envía equipo a centro de servicio autorizado SONY en Obregón Sonora.
757	2015-04-10 17:20:18.243675-04	14	370	Se envía a centro de servicio y se crea el reporte: 100415-5
758	2015-04-13 11:17:05.464992-04	37	375	Se programa visita para realizar atenciones preventivas viernes 10 abril y lunes 13 abril.
759	2015-04-13 11:37:08.590411-04	4	375	SE REALIZA VISITA Y SE REALIZA EL SERVICIO A 4 EQUIPOS DE ESCRITORIO Y 2 IMPRESORAS. 
760	2015-04-13 12:04:50.728263-04	3	376	configuración en portatil correo electronico, Lync, Escritorio Remoto a SAE. Se requiere realizar configuración en computadora de escritorio de manuel castillo.
761	2015-04-13 13:09:26.43795-04	14	371	Se crea el reporte con HP 4002472474
762	2015-04-13 15:18:53.2409-04	14	359	El centro de servicio informa que el equipo se encuentra en proceso de diagnostico de falla.  
763	2015-04-14 12:29:50.380453-04	8	332	SE HIZO CAMBIO DE UNIDAD DUPLEX Y FUSOR. 
764	2015-04-14 13:22:28.688903-04	14	332	se crea caso 4651163206 para solicitar nuevamente la garantía y que acuda un técnico a reparar el equipo.
765	2015-04-14 16:13:41.647407-04	14	370	Se llama al centro de servicio y me informan que se le tiene que reinstalar el sistema 
766	2015-04-14 19:37:39.772529-04	14	369	Se realiza cambio físico del equipo, y el nuevo se encuentra funcionando correctamente.
767	2015-04-15 14:50:30.91865-04	14	371	Se llevan equipo a reparación en HP México, tarda en llegar a México 3 días y tardan 15 días en arreglar el equipo.
768	2015-04-15 16:11:04.60918-04	14	359	El proyector se envió a Obregón Sonora para la reparación en el centro de garantía, en este momento el equipo está en espera de refacción, me informan que la pieza llega el día de mañana o el viernes, y queda listo para la otra semana.
769	2015-04-16 11:39:20.560837-04	14	378	Se llama al Cliente para que acuda a las instalaciones de compuproveedores para la recepción de equipo.
770	2015-04-16 15:38:09.232909-04	3	377	CLAVE CVA TEL-13\r\nTELEFONO PANASONIC KX-T7705 ANALOGO CON IDENTIFICADOR DE LLAMADAS Y ALTAVOZ (NEGRO) PRECIO $487.93 MN + IVA, PRODUCTO SOBRE PEDIDO, REQUIERE ANTICIPO DEL 20% Y ORDEN DE COMPRA CON LA LEYENDA DE NO CANCELACION, NO DEVOLUCION.\r\nel tiempo de entrega es de 3 a 7 dias 6 dias habiles
771	2015-04-16 15:38:58.07887-04	3	353	es necesario cotizar lo solicitado.
772	2015-04-16 15:41:19.422522-04	3	267	Al momento de crear la factura del cliente de mostrador se debe escoger el numero de vendedor para que aparezca en la factura. \r\nEl cliente de mostrador no se predetermina un vendedor. 
773	2015-04-16 15:42:58.415695-04	3	267	Se revisaron varias facturas para validar que si aparezca el numero de vendedor en las facturas que agrego el vendedor al momento de crear el documento. 
774	2015-04-16 15:43:18.787574-04	3	267	Reporte finalizado, se procede a imprimir reporte y cerrar solicitud solicitada. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.\r\n
775	2015-04-16 17:31:39.080256-04	14	378	se reporta equipo  con fabricante, y se envía a garantía a entro de servicio con el # de caso: 302QNCV
776	2015-04-16 19:51:01.630698-04	3	292	se realizo configuracion en outlook de correo solicitado en computadora. 
777	2015-04-16 19:53:23.750586-04	3	261	COTIZAR
778	2015-04-16 19:53:47.382838-04	3	266	REPORTAR A PROVEEDOR.
779	2015-04-16 19:54:13.558592-04	3	257	cambios realizado. \r\n
780	2015-04-16 19:54:22.06551-04	3	257	Reporte finalizado, se procede a imprimir reporte y cerrar solicitud solicitada. 
781	2015-04-16 19:55:16.325388-04	3	250	COTIZAR
782	2015-04-16 19:56:53.662865-04	3	249	Se realizo revisión, la nueva persona ya se encuentra trabajando.
783	2015-04-16 19:57:10.161954-04	3	249	Reporte finalizado, se procede a imprimir reporte y cerrar solicitud solicitada. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.\r\n
784	2015-04-16 19:58:26.771447-04	3	248	se realizo cambio de sistema de facturacion. Se utiliza actualmente ASPEL SAE.
785	2015-04-16 19:59:23.572851-04	3	247	REPORTE REALIZADO CON TELMEX.\r\n
786	2015-04-16 19:59:42.441449-04	3	247	SE RESTAURO EL SERVICIO DE INTERNET.
787	2015-04-16 19:59:59.540969-04	3	247	Reporte finalizado, se procede a imprimir reporte y cerrar solicitud solicitada. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.\r\n
788	2015-04-16 20:01:26.388278-04	3	246	SE INSTALAR UNA TERMINAL PARA QUE REGISTRE LA ASISTENCIA EL PERSONAL. 
789	2015-04-16 20:02:56.458555-04	3	241	SOLICITUD REALIZADA. \r\nEL NUEVO PERSONAL SE ENCUENTRA TRABAJANDO EN LOS NUEVOS EQUIPOS DE COMPUTO. 
790	2015-04-16 20:04:20.972165-04	3	229	SE ASIGNARON LOS EQUIPOS PARA EL NUEVO PERSONAL DE COMERCIAL. 
791	2015-04-16 20:07:18.934755-04	3	160	problema corregido.\r\nReporte finalizado, se procede a imprimir reporte y cerrar solicitud solicitada. 
792	2015-04-17 12:17:41.5908-04	14	371	El equipo llega a Tlalnepantla México, y entra equipo a laboratorio para su reparación durando esta 15 días hábiles.
793	2015-04-17 12:23:48.23403-04	3	242	Que dieron de baja las lineas solicitadas. El personal de MTT trae telefonos con lada de Tijuana. \r\n\r\nAYLEEN  VALENCIA 6641 20 02 83\r\nJOSÉ ADAN MIRANDA GUTIERREZ 6641 88 90 52 \r\n
794	2015-04-17 12:23:59.556287-04	3	242	Reporte finalizado, se procede a imprimir reporte y cerrar solicitud solicitada. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.\r\n
795	2015-04-17 12:25:44.468033-04	3	182	Se corrigió el problema de direccionamiento reportado. 
796	2015-04-17 12:37:42.074654-04	3	351	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.\r\n
797	2015-04-17 12:50:30.033931-04	3	348	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.\r\n
798	2015-04-17 14:42:48.711555-04	3	200	Equipo: servidord\r\nUsuario de acceso remoto: compras04\r\ncontraseña: compras04\r\n
799	2015-04-17 14:53:54.822936-04	3	200	Escritorio Remoto de DN: \r\nusuario: SERVIDORD\\compras04\t\r\ncontraseña: COM8906.*\r\nUsuario SAE en DN:\t\r\nusuario: SILVIA\t\r\ncontraseña: RAMIREZ\r\n
800	2015-04-17 14:54:50.010947-04	3	200	se realizo configuracion de escaner de multifuncional.
801	2015-04-17 14:55:32.06729-04	3	200	usuario no utilizar impresora de termina para realizar etiquetas.
802	2015-04-17 14:55:45.911115-04	3	200	cambio de silla realizado. 
803	2015-04-17 14:56:24.901376-04	3	200	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.\r\n
804	2015-04-17 15:03:33.003466-04	3	229	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.\r\n
805	2015-04-17 15:04:52.278672-04	3	324	se realizo por nuevo multifuncional. 
806	2015-04-17 15:09:18.780382-04	3	292	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.\r\n
807	2015-04-17 17:51:49.870148-04	14	344	Me permito informarle que el equipo ya fue recibido en el laboratorio de HP Santa Fe en la Cd. de México por lo que estaré informándole las actualizaciones correspondientes.
808	2015-04-20 11:57:18.049557-04	4	381	SE AGREGA MEMORIA Y SE ENTREGA A ALMACÉN PARA ENTREGAR A CLIENTE.
809	2015-04-20 12:31:43.332185-04	14	332	Envían nuevamente el Fusor y el equipo sigue presentando la falla. Nos programamos nuevamente para crear un nuevo reporte.
810	2015-04-20 12:33:34.087929-04	14	380	Se programa envío a garantía con el proveedor el día miércoles 22/04/2015\r\nya que este se encuentra de vacaciones. 
811	2015-04-20 12:35:49.230672-04	14	370	El centro de servicio me informa que el equipo se encuentra listo y funcionando correctamente, se programa recolección del mismo.
812	2015-04-20 12:40:14.419137-04	14	344	El equipo fue enviado a HP de la ciudad de México para su diagnóstico y reparación del mismo, el tiempo estimado es de 15 días hábiles, si el equipo técnico de México no puede resolver el problema que este presenta se hará cambio físico, por uno nuevo y funcional.
813	2015-04-20 13:59:50.320114-04	3	49	se envia carta responsiva, firma de correo electronica y credencias de los sistemas de la empresa al correo del usuarios.\r\n\r\nReporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Tzirahuén Martínez Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250. Celular (662) 229 3979 Directo 2113.\r\n
814	2015-04-20 14:18:30.87018-04	3	84	Se envia archivos al correo del usuario.\r\n\r\nReporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. 
815	2015-04-20 15:14:38.994508-04	3	86	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. 
816	2015-04-20 16:10:45.050241-04	3	216	se envio credenciales, carta resposiva y firma electronica al correo del usuario.\r\n\r\nReporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. 
817	2015-04-20 17:41:42.994476-04	3	238	Información enviado al usuario.\r\n\r\nReporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. 
818	2015-04-20 18:02:40.613461-04	3	240	se entrego la información al usuario, reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. 
819	2015-04-20 18:05:11.496124-04	3	258	Usuario trabajando con sus credenciales de sistemas. \r\nReporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. 
820	2015-04-20 19:08:51.231931-04	3	260	El usuario esta trabajando en la computadora asignada. 
821	2015-04-20 19:09:01.110522-04	3	260	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. 
822	2015-04-21 11:24:40.560019-04	14	352	Se realiza cambio físico del equipo.
823	2015-04-21 12:11:36.192573-04	3	326	se envía su información al correo del usuario (firma de correo electrónico, anuncio de privacidad, anuncio de compuescuadron, carta responsiva y credenciales de los sistemas de la empresa).\r\nReporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. \r\n
824	2015-04-21 12:57:04.306407-04	14	359	Me reporta el centro de servicio que llego la refacción pero el equipo sigue presentando la falla, Se pide una nueva refacción y esta se espera llegue en el transcurso de la semana.
825	2015-04-21 15:21:15.553271-04	3	327	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada.
826	2015-04-21 15:36:50.556591-04	3	268	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. 
827	2015-04-21 18:39:12.309127-04	14	384	Se envía a equipo de almacén a recolectar equipo para garantía.
828	2015-04-22 13:24:58.871394-04	14	386	Se envía mouse a garantía con el proveedor. 
829	2015-04-22 18:38:36.346619-04	14	378	El equipo llega funcionando correctamente, se realizaron pruebas de rendimiento sin presentar fallas, equipo listo.
830	2015-04-22 18:51:26.17847-04	14	384	Se crea el reporte con Lenovo: 302RGLB
831	2015-04-23 12:56:50.1355-04	14	380	llega equipo de garantía funcionando correctamente
832	2015-04-23 12:58:14.001067-04	14	383	Lega equipo de garantía funcionando correctamente.
833	2015-04-23 14:38:16.888955-04	37	391	Se realiza la instalación de componentes para ensamblado de CPU. 
834	2015-04-23 15:34:20.1756-04	14	373	Se envía a torreón para Garantía
835	2015-04-23 15:34:42.955085-04	37	392	Fecha entrega Lunes 27 de Abril.
836	2015-04-23 15:35:47.756208-04	37	393	Fecha entrega miércoles 29 de Abril.
837	2015-04-23 15:37:47.365502-04	37	394	Fecha entrega viernes 15 de Mayo.
838	2015-04-23 17:24:23.373265-04	14	359	Llega el equipo del centro de servicio funcionando correctamente el equipo está listo.
839	2015-04-23 18:10:23.105038-04	37	395	Se programa visita viernes 24 abril 10:00am
840	2015-04-23 18:19:59.811788-04	37	396	Se programa visita viernes 24 abril 09:00am
841	2015-04-24 13:52:29.874008-04	14	398	Se programa recolección con el depto de almacén.
842	2015-04-24 13:53:15.283936-04	14	397	se programa recolección con depto de almacén,
843	2015-04-24 17:05:15.723556-04	37	372	Revisar la entrega por proveedor de equipo reparado lunes 04 Mayo.
844	2015-04-24 18:19:25.374102-04	4	396	SE REEMPLAZA UNIDAD DE IMAGEN.
845	2015-04-24 20:20:28.259432-04	8	332	Se presento tecnico para revision del equipo.\r\nSe detectaron pequeños pedazos de rebaba de plastico, en los engranes del motor del fusor, se limpiaron los engranes. Se realizaron pruebas al equipo y quedo funcionando correctamente.
846	2015-04-27 12:59:45.076584-04	14	386	Se realiza cambio físico del mouse.
847	2015-04-28 11:31:15.125737-04	14	397	Se mantiene equipo en observación.\r\n
848	2015-04-28 19:17:29.398146-04	14	384	EL EQUIPO LLEGA DEL CENTRO DE SERVICIO, FUNCIONANDO CORRECTAMENTE.
849	2015-04-28 19:19:25.708636-04	14	403	SE CONSULTA GARANTÍA CON PROVEEDOR, ESTAMOS EN ESPERA DE RESPUESTA POR PARTE DE ELLOS.
850	2015-04-28 19:26:03.915965-04	14	397	EL EQUIPO HASTA EL MOMENTO NO HA PRESENTADO LA FALLA.
851	2015-04-29 11:43:21.394076-04	37	399	Se realiza mantenimiento preventivo a equipo proyector. Limpieza interior y exterior, se elimina error de lámpara. 
852	2015-04-29 13:15:52.81843-04	14	96	El equipo llega de reparación de Guadalajara, y se mantiene en revisión por parte del proveedor.
853	2015-04-29 13:16:10.098368-04	14	283	El equipo llega de reparación de Guadalajara, y se mantiene en revisión por parte del proveedor.
854	2015-04-29 13:16:29.921218-04	14	245	El equipo llega de reparación de Guadalajara, y se mantiene en revisión por parte del proveedor.
855	2015-04-29 13:19:05.029698-04	14	373	Se mantiene en revisión con el fabricante.
856	2015-04-29 13:46:29.2193-04	14	397	El monitor se probo en varios equipos por 2 días seguidos, y este funcionó correctamente, por lo tanto disponemos a hacer entrega de monitor a el usuario correspondiente.
857	2015-04-29 16:58:22.596201-04	8	332	Se hace entrega del equipo al cliente. 
858	2015-04-30 12:26:44.474411-04	37	404	Se realiza instalación de tóner. Requiere reemplazo de fusor.
859	2015-04-30 19:03:27.287269-04	14	387	se crea el caso 4751356229
860	2015-04-30 19:04:22.688175-04	14	405	se creo el caso 4751356217
861	2015-05-04 12:40:20.626733-04	14	407	Se reporta el equipo con HP y se crea el caso\r\n4751473169. Tiempo de respuesta de 42 a 72 horas 
862	2015-05-04 12:42:16.758368-04	14	408	Se Reporta equipo con HP y se crea el caso 4751472926 tiempo de respuesta de 42 a 72 horas.
863	2015-05-04 18:40:53.103367-04	14	398	en Espera de monitor de reemplazo.
864	2015-05-05 12:06:57.685667-04	14	398	Llega monitor de reemplazo
865	2015-05-05 12:45:10.88362-04	14	371	El equipo llega sin reparar a Hermosillo
866	2015-05-06 15:02:31.669212-04	14	408	Llega equipo de reemplazo
867	2015-05-06 15:05:40.278848-04	14	407	LLEGA EQUIPO DE REEMPLAZO
868	2015-05-07 11:16:24.927962-04	14	405	Buenos dias\r\n\r\n Le comento que hemos despachado un nuevo caso para ser atendida en un centro tecnico, el caso es 4751701326, ellos le llamaran paradarle la informacion de la reparacion, \r\n
869	2015-05-07 12:17:14.030605-04	37	399	En espera de confirmación de cliente y ejecutivo de cuenta para instalación de lámpara.
870	2015-05-07 12:42:58.588666-04	3	420	SE ACTUALIZO EL PERFIL DEL USUARIO. \r\nSE ASIGNO EL MISMO PERFIL QUE TENIA ELIZABETH.
871	2015-05-07 12:46:04.883243-04	4	423	INICIO DE CONTRATO GRUPO TERRA.
872	2015-05-07 12:53:42.870063-04	3	418	SE PROGRAMA SERVICIO FOLIO # 1072.
873	2015-05-07 17:54:11.619112-04	37	424	Se programa mantenimiento preventivo jueves 07 abril 16:30 hrs.
874	2015-05-07 18:02:50.529168-04	37	425	Se programa visita viernes 08 Mayo 09:00am.
875	2015-05-08 11:18:52.27026-04	14	413	Se recibe equipo y se mantiene en pruebas.
876	2015-05-08 14:20:13.385073-04	14	373	Se mantiene equipo en pruebas.
877	2015-05-08 15:09:51.648082-04	4	425	SE REEMPLAZO Y CONFIGURO EQUIPO.
878	2015-05-08 17:46:15.629151-04	14	402	Se envía equipo a garantía.
879	2015-05-08 17:47:19.874765-04	14	401	Se envía equipo a garantía.
880	2015-05-08 17:48:59.32127-04	14	421	se crea reporte con HP y se asigna un ingeniero.
881	2015-05-11 14:22:07.580212-04	4	428	RECOLECCION DE EQUIPO PARA SERVICIO EN SITIO. CON NUMERO DE ACTIVO 2341011057
882	2015-05-11 17:44:26.536851-04	14	421	Invalidar comentario del 8 de mayo
883	2015-05-11 19:40:42.404873-04	14	403	llega equipo de reemplazo y se programa envío con equipo de almacen.
884	2015-05-12 13:12:07.068286-04	14	415	Se crea el caso 4752000791.
885	2015-05-12 17:35:20.444053-04	14	415	se envía el fusor de reemplazo.
886	2015-05-13 11:14:16.403602-04	14	405	Ya se cuenta con la refacción y la visita propuesta para reparar su equipo es el 13/05/2015 a las 9:00am
887	2015-05-13 11:29:30.187371-04	4	435	SE INSTALARON IMPRESORAS EN EQUIPOS SOLICITADOS.\r\n
888	2015-05-13 17:09:22.654873-04	14	245	llega equipo de garantía, se reemplaza el cargador dañado.
889	2015-05-13 19:23:26.60156-04	14	433	SE CREA REPORTE CON HP CON EL NUMERO: BFRK2982. SE ENVÍA EQUIPO A DIFUSA PARA QUE EL PERSONAL DE PAQUETERIA LA RECOLECTE PARA SU TRASLADO CON EL FABRCANTE.
890	2015-05-13 19:28:04.622823-04	14	434	SE CREA REPORTE: BFRK3152. SE ENVÍA EQUIPO A DIFUSA PARA QUE EL PERSONAL DE PAQUETERIA LO RECOLECTE PARA ENVIARLO CON EL FABRICANTE.
891	2015-05-14 11:18:48.151263-04	14	429	Se Envía al proveedor para garantía.
892	2015-05-14 13:49:48.196082-04	14	416	se creo el caso 4651411475.
893	2015-05-14 15:11:56.97-04	8	387	SE REEMPLAZO EL EQUIPO.
894	2015-05-14 15:12:24.579076-04	8	387	SE HACE ENTREGA DEL EQUIPO AL CLIENTE DIA 14 DE MAYO.
895	2015-05-14 17:21:47.896988-04	4	438	SE RECOLECTA EQUIPO Y QUEDA RESGUARDADO EN ALMACEN. 
896	2015-05-14 17:22:50.028988-04	4	437	SE LE PROPORCIONA NÚMEROS DE PARTE A EJECUTIVO DE CUENTA PARA LA COTIZACIÓN DE SENSORES DE PAPEL.
897	2015-05-14 18:22:33.802962-04	8	388	SE HIZO CAMBIO FISICO AL CLIENTE Y SE EXTENDIO NOTA DE CREDITO POR PARTE DE NUESTRO PROVEEDOR.
898	2015-05-15 12:05:26.529578-04	37	372	Revisar equipo reparado con proveedor Lunes 18 Mayo.
899	2015-05-15 13:29:48.542709-04	14	444	Se crea el reporte 4752234484
900	2015-05-15 20:23:37.525338-04	37	445	Se diagnostica problema en tarjeta madre de equipo desktop. Se solicita cotización de refacción.
901	2015-05-18 12:38:18.420315-04	14	385	Se ensamblan partes despegadas y se mantienen en pruebas para su buen funcionamiento.\r\n
902	2015-05-18 17:51:14.572099-04	14	413	se hace cambio físico del equipo, se cambia por una HP all in one 205 con numero de serie: 4CE5060JPQ
903	2015-05-20 14:42:31.654875-04	4	449	SE INSTALO SISTEMA OPERATIVO Y REALIZO RESPALDO DE FOTOGRAFÍAS. SERVICIO PAGADO
904	2015-05-20 14:45:07.879313-04	4	445	SE INSTALA TARJETA MADRE Y PRUEBA SU FUNCIONAMIENTO Y CONFIGURACIÓN CON DISTINTO SISTEMA OPERATIVO CORROBORANDO SU CORRECTO FUNCIONAMIENTO, EQUIPO LISTO PARA SU RECOLECCIÓN.
905	2015-05-20 15:06:39.661235-04	37	449	Equipo listo para su recolección en San Luis Potosí #21 entre Matamoros y Guerrero Col. Centro. En horario de 8-1pm y 2-4pm.
906	2015-05-20 15:34:17.042427-04	14	385	Se comprueba el buen funcionamiento de los equipos, están listos.
907	2015-05-20 19:09:15.751556-04	14	415	Se programa entrega de dúplex con el numero de reporte 4651457631
908	2015-05-21 11:24:38.436184-04	4	445	COSTO DE SERVICIO $340.00 MAS IVA
909	2015-05-21 11:47:44.811886-04	4	447	SE DIAGNOSTICA FALLA EN LA TARJETA MADRE, SE REALIZARON PRUEBAS CON DISTINTOS COMPONENTES. SE PROPORCIONA NUMERO DE PARTE PARA EL REEMPLAZO DE LA PIEZA A EJECUTIVO DE CUENTA PARA SI COTIZACIÓN.
910	2015-05-21 12:18:49.193554-04	14	444	Se manda a reparación con el fabricante, se espera entrega para el día de hoy.
911	2015-05-21 12:22:33.912452-04	14	373	se retorna equipo se planea llegue para los días, 27 o 28 del presente mes.
912	2015-05-22 11:13:14.438647-04	37	452	Se programa visita para instalación de memorias viernes 22 Mayo 09:00am.
913	2015-05-22 12:53:26.293841-04	14	446	SE MANDA AL EQUIPO DE ALMACÉN A RECOLECTAR EL EQUIPO.
914	2015-05-22 14:05:04.126463-04	4	428	MANTENIMIENTO TERMINADO EQUIPO LISTO PARA SU ENTREGA.
915	2015-05-22 14:05:29.259071-04	14	446	Se crea el reporte con hp numero: 4651478480
916	2015-05-25 11:12:26.412987-04	14	416	EQUIPO SE MANTIENE EN PRUEBAS YA QUE NO HA PRESENTADO LA FALLA MENCIONADA. 
917	2015-05-25 11:23:07.962313-04	47	441	Ya se realizaron y entregaron los usuarios
918	2015-05-25 11:24:34.748421-04	47	450	Se hace solicitud de toner, se recibe y se coloca en impresora de administracion
919	2015-05-25 11:25:39.301364-04	47	426	se instala escáner y se deja funcionando, instalación realizada por estefania
920	2015-05-25 11:28:27.641913-04	47	422	se revisan cuentas de correo electrónico, se migra a Exchange, se hacen pruebas y todo ok
921	2015-05-25 11:30:06.512429-04	47	427	sistemas configurados por zira, se dejan funcionando ok
922	2015-05-25 11:31:10.924365-04	47	431	Formatos en proceso de modificación y autorización por parte de administración.
923	2015-05-25 11:32:26.147848-04	47	432	Préstamo autorizado, equipo ya regreso
924	2015-05-25 11:33:14.365254-04	47	443	formatos en proceso de modificación y autorización por parte de administración
925	2015-05-25 11:46:37.13958-04	3	439	se valida que el usuario: VENTAS03 y la contraseña: SOLANO, son correctos para ingresar al sae.\r\nEl problema es solamente en su equipo. \r\nposible solucion es copiar el archivo de SERVLIC en la computadora. 
926	2015-05-25 11:52:40.587788-04	3	443	el reporte es de la empresa 07 en SAE. 
927	2015-05-25 12:04:33.869873-04	3	443	Se predeterminan los formatos de la empresa 10 para corregir el falla reportada. 
928	2015-05-25 12:06:23.024556-04	3	443	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. \r\n
929	2015-05-25 12:24:31.409954-04	3	441	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250.\r\n
930	2015-05-25 12:27:52.832838-04	3	439	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. \r\nCualquier duda o comentario quedo a sus órdenes. Saludos. Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250.\r\n
931	2015-05-25 12:37:43.724285-04	3	432	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. 
932	2015-05-25 12:41:30.003239-04	3	427	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. 
933	2015-05-25 12:43:30.77204-04	3	426	No es necesario adquirir software PDF profesional. 
934	2015-05-25 12:43:39.970426-04	3	426	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. 
935	2015-05-25 12:47:05.611851-04	3	420	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. 
936	2015-05-25 12:51:37.65619-04	3	376	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. 
937	2015-05-25 13:03:20.424352-04	3	377	el usuario esta reportando un nuevo problema: " pero ahora se cuelga solo y se me cortan las llamadas " .. \r\n
938	2015-05-25 13:04:45.391852-04	3	418	se le realizo un servicio a la impresora. \r\nReporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. 
939	2015-05-25 13:21:10.033877-04	3	390	se le entrego el cable solicitado a enrique. Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada.
940	2015-05-25 13:24:43.90223-04	3	400	Los cambios solicitados se han realizados. \r\nReporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. \r\n
941	2015-05-25 13:29:25.941865-04	3	411	El conmutador de aguascalientes no es igual al conmutador de hermosillo. \r\nEl conmutador de Aguascalientes es un CPU. 
942	2015-05-25 13:30:13.728796-04	3	389	Las solicitud es para Victor Sanchez. 
943	2015-05-25 13:32:15.10399-04	3	414	El usuario confirma que ya puede filtrar en SAE. 
944	2015-05-25 13:42:47.218254-04	3	412	se agregara la cuenta de tiendavirtual@compuproveedores.com
945	2015-05-25 13:44:26.004027-04	3	450	Se realizo el cambio de toner.\r\nADMINISTRACION / 192.168.1.30\r\nHP LaserJet MSerie 4345 MFP  \r\nCartucho negro  99% Q5945A. \r\n\r\nReporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. 
946	2015-05-25 14:30:01.75611-04	3	431	1. que aparezca mi RFC completo, actualmente la homoclave no sale completa. .. YA QUEDO RESUELTO EN EL NUEVO FORMATO.
947	2015-05-25 14:37:43.749704-04	3	431	 2. Que aparezcan los números de serie porque actualmente, a pesar de estar dados de alta en el sistema no aparecen en la factura. No me permite jalarlos a la hora de facturar. QUEDO RESUELTO ESTE PROBLEMA EN EL NUEVO FORMATO. 
948	2015-05-25 15:08:41.250788-04	3	431	4. Necesito que el formato de factura, aparezca el no. de Pedido del cliente. SE AGREGO UN CAMPO DE "SU PEDIDO" QUE SE CAPTURA AL MOMENTO DE HACER LA FACTURA. 
949	2015-05-25 15:12:06.21116-04	3	431	 5. No me deja jalar las remisiones para facturar. NO SE ENCONTRO PROBLEMA PARA CREAR UNA FACTURA DESDE UNA REMISION. Cualquier duda o comentario quedo a sus órdenes. Saludos. Departamento Soporte Técnico Oficina (662) 214 2200 ext. 250.\r\n
950	2015-05-25 15:43:10.248055-04	14	262	LLEGA  EQUIPO DE MÉXICO SE PRUEBA PARA SU BUEN FUNCIONAMIENTO, PASANDO LAS PRUEBAS SATISFACTORIAMENTE.
951	2015-05-25 17:25:38.654571-04	14	454	Se crea el reporte 4752775685
952	2015-05-25 18:08:02.979081-04	37	455	Equipo requiere realizar limpieza interna y diagnostico de correcto funcionamiento.
953	2015-05-26 12:09:12.745067-04	14	444	Llega equipo de reparación informando que tiene dañado el sistema operativo, se solicitan los recovery´s y se le reinstala el sistema
954	2015-05-26 12:40:23.014124-04	14	444	Se manda con equipo de almacén a Difusa.
955	2015-05-26 13:45:52.981989-04	3	250	No se contratara por el momento a la persona para ese puesto. Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. 
956	2015-05-26 13:51:55.450674-04	3	412	ya quedo configurado el correo de tiendavirtual@compuproveedores.com en la portatil de victor manuel.\r\nReporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. 
957	2015-05-26 13:55:04.913611-04	3	246	era virus, y tenia un cd dentro del reproductor por eso tardaba en entrar por que se ponía a leer el disco que estaba rayado, fui y vacune quite unas cosas del incio y el disco y ya entra normal y puede checar
958	2015-05-26 13:55:16.499219-04	3	246	Reporte finalizado, se procede a imprimir reporte y  cerrar solicitud solicitada. 
959	2015-05-26 14:38:22.717048-04	3	353	Se posterga la contratación del personal para el puesto, Por lo cual se cancela reporte, se procede a imprimir reporte y  cerrar solicitud solicitada.
960	2015-05-26 18:06:00.749068-04	14	458	Se Programa recolección con equipo de almacén.
961	2015-05-26 19:16:35.906635-04	37	456	Se realizo instalación de cable UTP y conectores del Modem (servicio internet) hacia medidor bidireccional.
962	2015-05-26 19:44:33.690311-04	4	459	SE ANALIZO LA POSIBILIDAD DE REEMPLAZAR LOS EQUIPO OKI POR EQUIPOS HP DISPONIBLES EN EL DEPARTAMENTO DE SOPORTE YA QUE AL SER NECESARIO EL CAMBIO DE FUSOR DEL EQUIPO REPRESENTA UN GASTO CONSIDERABLE, EL COSTO DE LOS KIT DE MANTENIMIENTO DE AMBOS EQUIPOS ES APROXIMADAMENTE DE $4000.00 Y EL COSTO POR PAGINA DE CADA EQUIPO ES EL SIGUIENTE: OKI $.20 HP $.13
963	2015-05-27 11:16:15.28522-04	8	415	SE HIZO CAMBIO DE FUSOR Y DUPLEX.
964	2015-05-27 11:17:01.512867-04	8	415	Se hace entrega al cliente. 
965	2015-05-27 11:19:53.198311-04	8	416	Se reviso por tecnico. Se hace entrega al cliente.
966	2015-05-27 12:18:08.903964-04	14	429	El equipo de reemplazo ya se encuentra en transito y se estima recibirlo en el transcurso de la proxima semana.
\.


--
-- Name: core_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_status_id_seq', 966, true);


--
-- Data for Name: core_subcategoria; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_subcategoria (id, categoria_id, nombre) FROM stdin;
\.


--
-- Name: core_subcategoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_subcategoria_id_seq', 1, false);


--
-- Data for Name: core_vacante; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_vacante (id, created, nombre, ciudad, descripcion, sueldo) FROM stdin;
2	2015-03-03 14:59:13.566959-05	Auxiliar Contable	Matriz Hermosillo	REQUISITOS:\r\nExperiencia en el puesto: 1 AÑO EN ADELANTE. \r\nSexo: INDISTINTO.\r\nNivel de Estudios: PASANTE DE CONTADURÍA, Y/O CARRERA TRUNCA EN ADMINISTRATIVA- CONTABLE-  ECONOMICA \r\nEstado Civil: SOLTERO \r\nRango de Edad: 23 y 28 AÑOS. Conocimientos Requeridos: EXPERIENCIA EN DESPACHO CONTABLE, CONOCIMIENTOS BÁSICOS DE CONCILIACIONES BANCARIAS, CONTPAQ, ELABORACIÓN DE IMPUESTOS. \r\nHorario de trabajo: LUNES A VIERNES DE 8:00 A.M. A 1:00PM Y 2:00PM A 5:00PM Y SÁBADO DE 9:00AM A 2:00PM. \r\nSueldo Ofrecido Mensual: En Entrevista \r\nOtras prestaciones: FONDO DE AHORRO Y PLAN VACACIONAL, PLAN DE PREVISIÓN SOCIAL, SERVICIO DE COMEDOR, COMPRAS PRODUCTO, SEGURO DE GASTOS MÉDICOS MENORES.\r\nInteresados favor de enviar su CV con fotografía y en Asunto Aux. contable, al correo electrónico\r\nrecursoshumanos@compuproveedores.com\r\n	En entrevista
3	2015-03-03 15:04:54.328518-05	Ing.Telecomunicaciones	Matriz Hermosillo	REQUISITOS:\r\nExperiencia en el puesto: 3 AÑOS PREFERENTEMENTE. \r\nSexo: INDISTINTO, EXCELENTE PRESENTACIÓN, BUEN TRATO.\r\nNivel de Estudios: ING. SISTEMAS, LIC. INFORMÁTICA.\r\nEstado Civil: SOLTERO \r\nRango de Edad: 23 y 30 AÑOS.\r\nConocimientos Requeridos: TELEFONÍA IP Y CONMUTADORES, SWITCH ADMINISTRADOS, VLANS, QOS, RUTEO (CAPAS),  ROUTERS (EIGRP, EGRP), VPN. \r\n\r\nHorario de trabajo: LUNES A VIERNES DE 8:00 A.M. A 1:00PM Y 2:00PM A 5:00PM Y SÁBADO DE 9:00AM A 2:00PM. DISPONIBILIDAD DE HORARIO DE ACUERDO A LAS NECESIDADES DE PROYECTOS Y DE CLIENTES. \r\nOtras prestaciones: FONDO DE AHORRO Y PLAN VACACIONAL, PLAN DE PREVISIÓN SOCIAL, SERVICIO DE COMEDOR, COMPRAS DE  PRODUCTO,  FONACOT, SEGURO DE GASTOS MÉDICOS MENORES.\r\nInteresados favor de enviar su CV con fotografía y en Asunto el nombre del puesto, al correo electrónico recursoshumanos@compuproveedores.com	En entrevista
5	2015-03-03 17:16:28.569815-05	Coordinador de Ventas	Sucursal Tijuana	REQUISITOS:\r\nExperiencia en el puesto: 3 AÑOS INDISPENSABLES EN VENTA DE PRODUCTOS DE CÓMPUTO Y/O SOLUCIONES DE TI PREFERENTEMENTE. VENTAS DE CUALQUIER PRODUCTO A GOBIERNOS ESTATALES, MAQUILADORAS Y OTROS. \r\nSexo: INDISTINTO.\r\nNivel de Estudios: PREFERENTEMENTE EN CARRERAS EN EL ÁREA DE TECNOLOGÍAS DE INFORMACIÓN INGENIERÍA O LICENCIATURA O INGENIERÍA EN SISTEMAS, TÉCNICO EN SISTEMAS/CARRERAS AFINES.\r\nEstado Civil: indistinto. Soltero de preferencia.\r\nRango de Edad: ENTRE 26 Y 30 AÑOS. Conocimientos Requeridos: MANEJO DE INTERNET Y OFFICE INDISPENSABLE. FACILIDAD DE PALABRA. PREFERENTE ELABORACIÓN Y PRESENTACIÓN DE LICITACIONES.\r\nHorario de trabajo: LUNES A VIERNES DE 8:00 A.M. A 1:00PM Y 2:00PM A 5:00PM Y SÁBADO DE 9:00AM A 2:00PM. \r\nSueldo Mensual MAS ATRACTIVO ESQUEMA DE COMISIONES. \r\nOtras prestaciones: FONDO DE AHORRO Y PLAN VACACIONAL, PLAN DE PREVISIÓN SOCIAL, SERVICIO DE COMEDOR, COMPRAS DE  PRODUCTO A PRECIO DE DISTRIBUIDOR (CRÉDITO DE 1 AÑO, SEGURO DE GASTOS MÉDICOS MENORES, UNIFORMES, FONACOT.\r\n\r\nInteresados favor de enviar su CV con fotografía y en Asunto el nombre del puesto, al correo electrónico recursoshumanos@compuproveedores.com\r\n	En entrevista
4	2015-03-03 17:08:43.051456-05	Coordinador de Ventas	Sucursal Aguascalientes	REQUISITOS\r\nExperiencia en el puesto: 3 AÑOS INDISPENSABLES EN VENTA DE PRODUCTOS DE CÓMPUTO Y/O SOLUCIONES DE TI PREFERENTEMENTE. VENTAS DE CUALQUIER PRODUCTO A GOBIERNO Y/O NISSAN.\r\nSexo: INDISTINTO.\r\nNivel de Estudios: PREFERENTEMENTE EN CARRERAS EN EL ÁREA DE TECNOLOGÍAS DE INFORMACIÓN INGENIERÍA O LICENCIATURA O INGENIERÍA EN SISTEMAS, TÉCNICO EN SISTEMAS/CARRERAS AFINES.\r\nEstado Civil: INDISTINTO. SOLTERO DE PREFERENCIA.\r\nRango de Edad: ENTRE 26 Y 30 AÑOS. Conocimientos Requeridos: MANEJO DE INTERNET Y OFFICE INDISPENSABLE. FACILIDAD DE PALABRA. PREFERENTE ELABORACIÓN Y PRESENTACIÓN DE LICITACIONES.\r\nHorario de trabajo: LUNES A VIERNES DE 8:00 A.M. A 1:00PM Y 2:00PM A 5:00PM Y SÁBADO DE 9:00AM A 2:00PM.\r\nSueldo Base MÁS ATRACTIVO ESQUEMA DE COMISIONES.\r\nOtras prestaciones: FONDO DE AHORRO Y PLAN VACACIONAL, PLAN DE PREVISIÓN SOCIAL, SERVICIO DE COMEDOR, COMPRAS DE  PRODUCTO A PRECIO DE DISTRIBUIDOR (CRÉDITO DE 1 AÑO), SEGURO DE GASTOS MÉDICOS  MENORES. UNIFORMES, FONACOT.\r\n\r\nInteresados favor de enviar su CV con fotografía y en Asunto Coord. Ags., al correo electrónico recursoshumanos@compuproveedores.com	En entrevista
\.


--
-- Name: core_vacante_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_vacante_id_seq', 5, true);


--
-- Data for Name: core_vendedor; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_vendedor (id, nombre, folio) FROM stdin;
1	SOLUCIONES TECNOLOGICAS	2
2	COORDINADOR TIJUANA	3
3	PYMES AGS	4
4	CARMENMEJIA	5
5	FABIAN ACOSTA	6
6	JORGE GONZALEZ	7
7	NAZLI COETO LARA	8
8	PYMES TIJ	9
9	MANUEL CASTILLO	10
10	ATI	11
11	SOPORTE TECNICO	12
12	ARMANDO FELIX	13
13	RAMON LARA KURI	14
14	LILLIAN RIVAS	15
15	DANIELA LEON	16
16	LUZ DEL MAR COETO	17
17	CARLOS IBARRA	18
18	LAURA POZOS	19
19	PYMES HMO	20
20	ELIZABETH VELEZ	21
21	CLEO FELIX	22
22	ALEJANDRO PEREZ	23
23	ISABEL UBALDO	24
24	OMAR RUELAS	25
25	LILIANA NAVARRO	26
26	RUBEN MARQUEZ	27
27	SERSATEX	28
28	OSCAR LEGASPI	25
29	FERNANDO CORTEZ	3
30	ENRIQUE COETO	5246
31	ENRIQUE COETO	1
32	RAYMUNDO  VEGA	0029
\.


--
-- Name: core_vendedor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_vendedor_id_seq', 32, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	permission	auth	permission
2	group	auth	group
3	user	auth	user
4	content type	contenttypes	contenttype
5	session	sessions	session
6	perfil	core	perfil
7	producto	core	producto
8	imagen	core	imagen
9	lista	core	lista
10	contacto	core	contacto
11	concretar cita	core	concretarcita
12	vendedor	core	vendedor
13	distribuidor	core	distribuidor
14	persona autorizada	core	personaautorizada
15	cliente	core	cliente
16	bitacora	core	bitacora
17	vacante	core	vacante
18	solicitud trabajo	core	solicitudtrabajo
19	mensaje contacto	core	mensajecontacto
20	marca	core	marca
21	categoria	core	categoria
22	sub categoria	core	subcategoria
23	marca categoria	core	marcacategoria
24	equipo renta	core	equiporenta
25	renta	core	renta
26	solicitar credito	core	solicitarcredito
27	renta detalle	core	rentadetalle
28	block	core	block
29	status	core	status
30	actividad	core	actividad
31	encuesta satisfaccion	core	encuestasatisfaccion
32	imagen inicio	core	imageninicio
33	mundo tecnologia	core	mundotecnologia
34	bitacora imagen	core	bitacoraimagen
35	aviso privacidad	core	avisoprivacidad
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('django_content_type_id_seq', 35, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2014-11-08 14:56:45.30349-05
2	auth	0001_initial	2014-11-08 14:56:45.774106-05
3	sessions	0001_initial	2014-11-08 14:56:45.963916-05
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('django_migrations_id_seq', 3, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
rfmuxj2bvlstqkns4i1c41h6lzemt7xo	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2014-11-27 14:28:14.780923-05
lu11ix1h54lgemfl02ffrse7wsk72j84	NDAwNmFiMTNkOThjZmFlNTdmZTJiODJkZDY0ZTMyNWMwNzY0YzljZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE1Y2ZlZTBjNGQ2YjE2NTFlYTM3YjMwYTZlZGUwNzEwMTY2YWViMWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9	2014-11-24 15:35:48.257824-05
hwtcxdk840ald6nbfx14hnz8a5sxz4gf	MzA4ZmQ5OGJiY2M4MTExYzM4NTY3ZmY2OTBiOGJkNTk4NDQ2ZjliZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmMWM4YWY4ZTA4Y2FiOWM3Y2QxZTJhMzQ2MGQ4MzMwYTg5ZTQ5MjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2014-11-24 18:46:29.394128-05
uabqu1n5npzf6g6jn8605uuky2ch9oa3	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2014-12-08 19:23:49.687135-05
oi4a1clzti166byv2iyz8wkv7zvwl09y	MzA4ZmQ5OGJiY2M4MTExYzM4NTY3ZmY2OTBiOGJkNTk4NDQ2ZjliZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmMWM4YWY4ZTA4Y2FiOWM3Y2QxZTJhMzQ2MGQ4MzMwYTg5ZTQ5MjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2014-11-25 07:54:03.311963-05
az6y9k2ne1n9vg70ahuuocb7op4pf28f	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2014-12-14 20:04:13.322205-05
2es3ly1s1zms7y8yvsuzp00mf2rzn7fe	MzA4ZmQ5OGJiY2M4MTExYzM4NTY3ZmY2OTBiOGJkNTk4NDQ2ZjliZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmMWM4YWY4ZTA4Y2FiOWM3Y2QxZTJhMzQ2MGQ4MzMwYTg5ZTQ5MjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2014-11-25 10:36:05.858142-05
xmvrh47mhaeytiyyfl9rzp16hm3raffi	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2014-12-10 02:34:24.284363-05
99c9tqc4uazmwfok2rdjlh6k9hmmiwqb	MzA4ZmQ5OGJiY2M4MTExYzM4NTY3ZmY2OTBiOGJkNTk4NDQ2ZjliZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmMWM4YWY4ZTA4Y2FiOWM3Y2QxZTJhMzQ2MGQ4MzMwYTg5ZTQ5MjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2014-11-25 14:30:07.095335-05
2hgvfgbyky8r6p891fjpcsfnmxdhh2dl	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2014-12-10 16:11:38.138762-05
8cl9iauy27tf70afmncnz3hf6pkql4j5	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2014-12-10 18:03:45.530653-05
n4z53xsbbg67v0wpoegsv85r1hbzc5dt	MzA4ZmQ5OGJiY2M4MTExYzM4NTY3ZmY2OTBiOGJkNTk4NDQ2ZjliZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmMWM4YWY4ZTA4Y2FiOWM3Y2QxZTJhMzQ2MGQ4MzMwYTg5ZTQ5MjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2014-11-27 16:35:51.12704-05
r1eedwbj4ia8kwjybf06nilis49asf8g	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2014-12-12 10:46:28.032176-05
6b1r6mkzvz30cpo7sgwd5iiuhbu9hndx	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2014-12-16 11:13:57.036146-05
q96gqh61b27poi7wsq7sp5bztnycouvi	NDAwNmFiMTNkOThjZmFlNTdmZTJiODJkZDY0ZTMyNWMwNzY0YzljZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE1Y2ZlZTBjNGQ2YjE2NTFlYTM3YjMwYTZlZGUwNzEwMTY2YWViMWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9	2014-11-27 18:01:25.230167-05
17p3m4o5o4m7bir5y87fupdi8iipgre5	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2014-12-17 13:43:31.233514-05
87xfr6jqt94tuf8gyhj2mvgmupt89n2c	NDAwNmFiMTNkOThjZmFlNTdmZTJiODJkZDY0ZTMyNWMwNzY0YzljZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE1Y2ZlZTBjNGQ2YjE2NTFlYTM3YjMwYTZlZGUwNzEwMTY2YWViMWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9	2014-11-27 18:36:53.857824-05
e7ll1dewgkeu0xiaeg1oi4uq5cxg15or	MTQwZWI0NTAzYTAzMjc4ZGI3YWMzYTRmNjdmZWFhMDIyMTZlNjkxNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjUyOTFjYzk5MGJjNmNhZjQ2NzBlMGUzZWYwOTIwNDYyYzVkMjk4YjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2014-11-28 10:31:38.864778-05
0n7ij4ugk4nb0vx6eajtp8c016qq7hq3	MzA4ZmQ5OGJiY2M4MTExYzM4NTY3ZmY2OTBiOGJkNTk4NDQ2ZjliZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmMWM4YWY4ZTA4Y2FiOWM3Y2QxZTJhMzQ2MGQ4MzMwYTg5ZTQ5MjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2014-11-28 12:15:26.167165-05
pvuk2d50k7tfpxrxlomrv5zfhk65ym10	NWZmMGJhZjY4ZWZlOTFmY2NhZTI1NjA5MmQ3MDVjOGZjYTA5OWFhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiNzQ0NzlmNjNkYmRmODkwNTc2OGQzMjQwOWIzZGIzOTEyY2MwZDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjExfQ==	2014-11-28 14:13:33.870517-05
1r9j5t5pyjr0ymtltkk7crbo74ka1uc1	MDg3NTliNmJhZWQyYmNkNjk2NGQ4NWJhNjY0YzFkZDI1ODgxNGNjYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImU3OTBiMWMwZmM3Y2JlNjIwOGRmODMzMzg2ZWNjMDlhNTdkMTFhNjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE0fQ==	2014-12-02 10:04:04.682505-05
sar35dz4ckii9lopeb7vi85om2qatvgg	NWE0MDQ3ZWI1ZTg4NmY1OTg0MzMzNTY4NWY1MDEzYzU4ZDZlYjM0Njp7Il9hdXRoX3VzZXJfaGFzaCI6IjMwOThjNjgyMjI0ZTVkMTRmYTRlOWIwNDM1ZjIzMjc2ZTE3NzVlMjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjh9	2014-11-26 11:10:06.517548-05
xlr17uhus0bjik6wwyer64tohwah88jb	MTQwZWI0NTAzYTAzMjc4ZGI3YWMzYTRmNjdmZWFhMDIyMTZlNjkxNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjUyOTFjYzk5MGJjNmNhZjQ2NzBlMGUzZWYwOTIwNDYyYzVkMjk4YjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2014-11-26 12:47:34.184646-05
hzvkptoc01p1xoh4d43zo3u1us0rw8fz	NDAwNmFiMTNkOThjZmFlNTdmZTJiODJkZDY0ZTMyNWMwNzY0YzljZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE1Y2ZlZTBjNGQ2YjE2NTFlYTM3YjMwYTZlZGUwNzEwMTY2YWViMWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9	2014-11-27 13:08:05.318985-05
ipxv0scsl06tppl6zm50bdd4twnh9lu7	NDAwNmFiMTNkOThjZmFlNTdmZTJiODJkZDY0ZTMyNWMwNzY0YzljZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE1Y2ZlZTBjNGQ2YjE2NTFlYTM3YjMwYTZlZGUwNzEwMTY2YWViMWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9	2014-11-27 13:11:48.601528-05
mqvg6szrc3gcn5x1ifz4dv111ybmxr7k	MzA4ZmQ5OGJiY2M4MTExYzM4NTY3ZmY2OTBiOGJkNTk4NDQ2ZjliZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmMWM4YWY4ZTA4Y2FiOWM3Y2QxZTJhMzQ2MGQ4MzMwYTg5ZTQ5MjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2014-11-27 13:55:45.55509-05
ein7r2zd5ae4cyduum2x1rh0fh05r67o	YjdhMGMwZjE0NDcxZWM0MTllYjk3YWY4NDE0MTFiMDk0OTgyMzcyYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlmMDQ0MDM2OTk4ZGEzNjcwYjc5OWQyNjYzMWFiODBkYTM1ZjYzM2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE5fQ==	2014-12-03 17:48:04.061845-05
1u8awfrptr2fslv1sm5d3fes73o9kswy	MmJjMWVhMTE0YTNjNDVlZDhkYzRiYjIzZWI2MjU1MmIyYjJiYjQ5YTp7Il9hdXRoX3VzZXJfaGFzaCI6ImY2OGQwZTIzOWY3ODIxNGQzNjkwZTMyNWM3NjIzMjJkOGIzMzdhNDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE3fQ==	2014-12-04 11:12:19.586095-05
t6uq9bpluzfgc64tuz6eef7evnaqc7kk	MWY5MzhlNjk5NTJiNGJhODg2YmNlZmZkNWRiNDFiNmJkMTdjNDI1NDp7Il9hdXRoX3VzZXJfaGFzaCI6ImUxM2UyMzBmZjgzZGY1ZjM0OWYxNGZjZjNiYjIxMmNmNTE1NDU1OTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-01-28 19:13:38.492585-05
hha8cyoq61f4ga4uyhtnth3qxuyf93db	MWY5MzhlNjk5NTJiNGJhODg2YmNlZmZkNWRiNDFiNmJkMTdjNDI1NDp7Il9hdXRoX3VzZXJfaGFzaCI6ImUxM2UyMzBmZjgzZGY1ZjM0OWYxNGZjZjNiYjIxMmNmNTE1NDU1OTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-01-29 11:45:51.92077-05
qn74e46pdc6gn6plljqnvgb7no12z92l	ZGM4ZjdmNmIwZWFiZGEwMGY0ZWI2NjZhOWNhNzEzYTAxMjlmNjdmMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY1NTNmOTliYTk2NGY2YmI3NzJjMzQ4ZDQwODIyYTllYzA2Zjk0MTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE1fQ==	2015-01-06 10:32:31.494073-05
yq4x114201azxusjxas0hb267nep70v5	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-01-22 14:51:10.635277-05
6hj93wjqqj2l1wt86i1e8hhb44aiaxlb	MWY5MzhlNjk5NTJiNGJhODg2YmNlZmZkNWRiNDFiNmJkMTdjNDI1NDp7Il9hdXRoX3VzZXJfaGFzaCI6ImUxM2UyMzBmZjgzZGY1ZjM0OWYxNGZjZjNiYjIxMmNmNTE1NDU1OTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-01-31 14:02:14.665497-05
5vcug7ushuu1hdxriyxtdgg31yva3pcz	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2014-12-09 10:23:47.98936-05
zouwoa4yxp8woi7shklrgtfbxsecvb6p	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-01-23 11:15:19.509865-05
nhssoksivlwu7zp09akp8ejkbw2n6zrx	YjliZmZjN2JhM2JlNWRmYzFlMmZhNTZkMWEzMDM3NGM5YTExZThjNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImM5ZTIyZjM0YzM0NGNmYjRhYjBiYjE0MWVjYWE4YWJkYjk3YmU3OWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM4fQ==	2015-02-02 13:00:26.325675-05
h2nuaxq71zf8sfp12dywqv35uopqe805	NWIzYjZiMjIzZjRjNDUyNmYzYWRkNzcxOGIyOWMwYTNlMmQ5ZTEyNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjQzODgwZDY3YzM4YjA3OWY2YWVmNzRiNzQwMDNjODk3MzUwOGRhNWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjI5fQ==	2014-12-10 16:16:14.442565-05
4mao8123n0l47hurp0ymhseg25q13ms7	MzA4ZmQ5OGJiY2M4MTExYzM4NTY3ZmY2OTBiOGJkNTk4NDQ2ZjliZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmMWM4YWY4ZTA4Y2FiOWM3Y2QxZTJhMzQ2MGQ4MzMwYTg5ZTQ5MjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-01-12 11:20:03.350542-05
5aktauukhh8iq430new6y6zgax6cmzaz	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2014-12-29 11:28:29.075242-05
f5qaddmtoezjw623xrfs85ugb2a10bzv	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-01-19 13:39:48.939989-05
e878wjusycls3ibug1qzwxp2918k3zr7	YjdhMGMwZjE0NDcxZWM0MTllYjk3YWY4NDE0MTFiMDk0OTgyMzcyYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlmMDQ0MDM2OTk4ZGEzNjcwYjc5OWQyNjYzMWFiODBkYTM1ZjYzM2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE5fQ==	2015-01-23 18:32:34.552618-05
ht6x4l94ou23c9ht6h3hgcfb1lfg8b6n	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2014-12-12 11:46:50.168516-05
emaahyzo805okdwi4sosax6vf21emvur	MWY5MzhlNjk5NTJiNGJhODg2YmNlZmZkNWRiNDFiNmJkMTdjNDI1NDp7Il9hdXRoX3VzZXJfaGFzaCI6ImUxM2UyMzBmZjgzZGY1ZjM0OWYxNGZjZjNiYjIxMmNmNTE1NDU1OTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-02-05 16:57:50.943567-05
yb2qbtowm58lj46uidx3iqnqssrocuf3	MjIwYTRhYjM0MDM1OTFiMzRjYzFjNTViYmU5ODBkMzhiNmJhNjE5YTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNhM2U5ODQzMTU4MDdjODk2NDZmYzhkMzc2ZTNiY2ZmYmZmYWI1MGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEwfQ==	2014-12-12 17:30:32.652382-05
pb46vplv30d8ohkdwm1cb7qzz9vuexrj	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-02-17 10:45:29.849526-05
ehmd53ltp6dgmdnracucgbn75974bl6y	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-01-21 10:24:51.081758-05
oasyy6378kwov0i2qqc6yypj47x6hykl	MDBiYmU4M2E5ZWUzMGJmODYyZWQ3OTQ2MTA2Y2VhY2Y2ZTc0NzFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjUzYWQ5Mzc0NzJkOGE4ODJmODY0MmYwZTdjZDM1NzBjOTcyYTc4NzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE4fQ==	2015-02-02 13:25:51.549091-05
as0a09ora23s499yqo34nhe3hyk64o6g	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2014-12-19 16:37:56.023381-05
1q0bma4gedwkdiatsknypc1n6x935cut	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-01-21 11:57:37.104986-05
2rn2g8dey0fcakbmuer15wx729p223gk	YjdhMGMwZjE0NDcxZWM0MTllYjk3YWY4NDE0MTFiMDk0OTgyMzcyYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlmMDQ0MDM2OTk4ZGEzNjcwYjc5OWQyNjYzMWFiODBkYTM1ZjYzM2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE5fQ==	2014-12-24 14:12:18.676549-05
15cn5k9v5rovmqh06f3t8it2p46njnu7	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-01-21 12:09:07.706456-05
ke2nkscsnhfd3zcqnhb8dx8fi90fqvfs	MmMyZDA1NWNlY2JhMTZiMzdiMDEzMzliMTBhZWVkYjBlNDIzMzhmZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmY2FmY2Y2ZGM1MWM2MjcyNDlhNjk5NTNiOWZhN2FkOWQxMjgzZDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjMyfQ==	2015-01-21 17:25:53.053005-05
p9l95sxpd4oleyp115fr6fy8aydnocr8	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-01-01 14:56:24.602376-05
8iyrtxohum07yqdj2x0mplc66w7sm2rf	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-01-27 13:19:42.899241-05
fx5sq0ysr1ce1rf9erxqorz4pa9kbzmp	MzA4ZmQ5OGJiY2M4MTExYzM4NTY3ZmY2OTBiOGJkNTk4NDQ2ZjliZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmMWM4YWY4ZTA4Y2FiOWM3Y2QxZTJhMzQ2MGQ4MzMwYTg5ZTQ5MjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2014-12-22 10:42:55.06145-05
u6tg0wk0lmp1fg3p9yf70wt0ur8ubjef	MzA4ZmQ5OGJiY2M4MTExYzM4NTY3ZmY2OTBiOGJkNTk4NDQ2ZjliZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmMWM4YWY4ZTA4Y2FiOWM3Y2QxZTJhMzQ2MGQ4MzMwYTg5ZTQ5MjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2014-12-13 12:16:23.719833-05
tscfaj4g5s5nhbptzolbyquow0zmb3wl	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-01-28 21:10:58.377425-05
3joauis7use7wj0owuz9q2vbxbto2wji	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-01-06 10:41:16.168827-05
m0o7229tbaa3s32y8akf7aegfjag5ic0	ZGM4ZjdmNmIwZWFiZGEwMGY0ZWI2NjZhOWNhNzEzYTAxMjlmNjdmMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY1NTNmOTliYTk2NGY2YmI3NzJjMzQ4ZDQwODIyYTllYzA2Zjk0MTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE1fQ==	2014-12-26 14:32:46.681196-05
ty7hlwym5349jrf76yxboxjxoe0bf32a	ZGM4ZjdmNmIwZWFiZGEwMGY0ZWI2NjZhOWNhNzEzYTAxMjlmNjdmMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY1NTNmOTliYTk2NGY2YmI3NzJjMzQ4ZDQwODIyYTllYzA2Zjk0MTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE1fQ==	2014-12-26 17:14:20.819119-05
v8v70jgltcwfagmklatgpltl4f2u1gmt	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-01-22 14:51:10.799504-05
ja3cgdnvgqszy1fzg5z0smcpd46m1trv	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2014-12-16 16:39:23.587947-05
g7syvtrqvt2uec9xasa6j8ltvvulwbgp	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2014-12-11 13:14:22.43938-05
n6lgld6pv4tghqznwa84pie3mvsri3yx	MzA4ZmQ5OGJiY2M4MTExYzM4NTY3ZmY2OTBiOGJkNTk4NDQ2ZjliZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmMWM4YWY4ZTA4Y2FiOWM3Y2QxZTJhMzQ2MGQ4MzMwYTg5ZTQ5MjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2014-12-29 10:49:21.190018-05
8d6e16o4yt48tmdexo37up1h0u4uny8s	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-01-29 13:33:40.092378-05
yhqc9wv8i5razytsqs8znukhy0m0hcme	ZWEwMjI2YzdmNWNiNGIxODdmMDliNDI4YjE3Yjc1YzJlMjg0YTI0Yjp7Il9hdXRoX3VzZXJfaGFzaCI6ImY3ZjA5ZDJmOWY5MTUxMGE3NGNiYjQyZTBlYzUzNTI2NDZmMTY5ODciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjI0fQ==	2014-12-29 10:58:03.21115-05
rjsw8igw9gszh0c90ni5jcgd3lnfx10w	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-01-06 14:55:57.233555-05
9y7e3foisv1fehapqz2nd8p3u2hn05fl	NzQ2Y2Y0OWZkOTk3YjdiYjIzZDA5NzU4ZTJiZGMxMjMzYjdiOGQ5ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ0M2RjMWMzNjZiMzZjZmU1MzBkNjdmYmFhNTI2YmE3YTEyYTFmMDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjMzfQ==	2014-12-29 12:14:06.957058-05
4pz78kgxonude1ylpsc6bw680sa9314f	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-01-12 11:35:06.522488-05
74uzw71bd4la1wfixrfvyw3bus23uyve	ZjQ3ZmQ3NDI4YTcxMjdmYzJkYmY4NjM5ZGIxMmQ1ZDlhNDkxYTQ1Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjdhOTcxMDA1MDE2MjBjYmEyNGIwMzIwNTVjODM2N2NkNDMyNTcyN2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjIyfQ==	2015-02-24 10:52:40.730883-05
ehr93oirzesg6ibbchbo7f87jao79108	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2014-12-24 18:06:33.56698-05
120hlmf7xvvs19q1yw0kuukk5txfn8ev	NWIzYjZiMjIzZjRjNDUyNmYzYWRkNzcxOGIyOWMwYTNlMmQ5ZTEyNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjQzODgwZDY3YzM4YjA3OWY2YWVmNzRiNzQwMDNjODk3MzUwOGRhNWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjI5fQ==	2014-12-30 14:40:32.261733-05
31fhzpo6trk8jthpnxja15byn4spiswn	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-01-24 12:15:34.52656-05
8mq514xg36vci7dst7wuq66atwgp97ut	NWE0MDQ3ZWI1ZTg4NmY1OTg0MzMzNTY4NWY1MDEzYzU4ZDZlYjM0Njp7Il9hdXRoX3VzZXJfaGFzaCI6IjMwOThjNjgyMjI0ZTVkMTRmYTRlOWIwNDM1ZjIzMjc2ZTE3NzVlMjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjh9	2014-12-30 18:19:46.574111-05
sh87218k6vuswzubful5hjcdn74qs1p5	MDBiYmU4M2E5ZWUzMGJmODYyZWQ3OTQ2MTA2Y2VhY2Y2ZTc0NzFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjUzYWQ5Mzc0NzJkOGE4ODJmODY0MmYwZTdjZDM1NzBjOTcyYTc4NzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE4fQ==	2014-12-31 14:14:35.713636-05
y7v9lyx0rm4euvjgb3xgl8p0xuv97ntq	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-01-27 10:51:51.149945-05
f946evlrez7bi8y4w0ea65sszjzj5uxl	YjdhMGMwZjE0NDcxZWM0MTllYjk3YWY4NDE0MTFiMDk0OTgyMzcyYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlmMDQ0MDM2OTk4ZGEzNjcwYjc5OWQyNjYzMWFiODBkYTM1ZjYzM2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE5fQ==	2015-02-07 12:50:40.46017-05
e2fpidpcqm8pa598bgh8o2z8b6wny8bb	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-01-27 11:17:07.466431-05
p9bbvo3js4p1i03mtzdu06gjgtskfcju	MWY5MzhlNjk5NTJiNGJhODg2YmNlZmZkNWRiNDFiNmJkMTdjNDI1NDp7Il9hdXRoX3VzZXJfaGFzaCI6ImUxM2UyMzBmZjgzZGY1ZjM0OWYxNGZjZjNiYjIxMmNmNTE1NDU1OTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-02-10 11:58:17.035019-05
vmkxwrq71he1sdnef2lxufdnsey7unrq	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-01-22 11:28:17.638545-05
hjk5s6j8ri4clfjkjql3jo5o89eggk4t	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2014-12-04 14:09:25.98645-05
r7bzy4rsq22da54ztjxrh2pfavfp1uk7	NWE0MDQ3ZWI1ZTg4NmY1OTg0MzMzNTY4NWY1MDEzYzU4ZDZlYjM0Njp7Il9hdXRoX3VzZXJfaGFzaCI6IjMwOThjNjgyMjI0ZTVkMTRmYTRlOWIwNDM1ZjIzMjc2ZTE3NzVlMjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjh9	2015-02-12 19:04:56.069053-05
oh50tj6eojywa6dpqoqqh27mfdxpgesr	ZGM4ZjdmNmIwZWFiZGEwMGY0ZWI2NjZhOWNhNzEzYTAxMjlmNjdmMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY1NTNmOTliYTk2NGY2YmI3NzJjMzQ4ZDQwODIyYTllYzA2Zjk0MTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE1fQ==	2014-12-08 14:30:49.409959-05
tib5ei7il9ukwram14uqvrzr87dhb5zy	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-01-05 19:01:42.652791-05
dqdddfs109dzlhdoy90hgihz76kq7ii0	NWIzYjZiMjIzZjRjNDUyNmYzYWRkNzcxOGIyOWMwYTNlMmQ5ZTEyNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjQzODgwZDY3YzM4YjA3OWY2YWVmNzRiNzQwMDNjODk3MzUwOGRhNWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjI5fQ==	2014-12-08 16:48:22.162948-05
oagw3izgcszgiw3za5issrm0bs1ngj3n	ZGM4ZjdmNmIwZWFiZGEwMGY0ZWI2NjZhOWNhNzEzYTAxMjlmNjdmMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY1NTNmOTliYTk2NGY2YmI3NzJjMzQ4ZDQwODIyYTllYzA2Zjk0MTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE1fQ==	2014-12-22 18:57:33.655905-05
61mwb2ioa80zestiqi3nti3ph5vsasl3	NDAwNmFiMTNkOThjZmFlNTdmZTJiODJkZDY0ZTMyNWMwNzY0YzljZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE1Y2ZlZTBjNGQ2YjE2NTFlYTM3YjMwYTZlZGUwNzEwMTY2YWViMWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9	2014-12-23 13:34:19.620937-05
rsyknrfk9epswufvb8yllvbug9l47zel	MmMyZDA1NWNlY2JhMTZiMzdiMDEzMzliMTBhZWVkYjBlNDIzMzhmZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmY2FmY2Y2ZGM1MWM2MjcyNDlhNjk5NTNiOWZhN2FkOWQxMjgzZDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjMyfQ==	2014-12-26 18:15:30.733808-05
25bu7106nzrcxot0o9vjykgvtrrhzi6l	ZGM4ZjdmNmIwZWFiZGEwMGY0ZWI2NjZhOWNhNzEzYTAxMjlmNjdmMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY1NTNmOTliYTk2NGY2YmI3NzJjMzQ4ZDQwODIyYTllYzA2Zjk0MTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE1fQ==	2015-01-23 11:54:21.132166-05
szcxcfpmkis2oyjlyki9c60avmk3vaob	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-01-06 16:52:17.071293-05
sojimp7bvz6wppcnlo4bh2j4avpnfljr	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2014-12-12 11:38:26.01647-05
rs7nzs2btcznhlv8ck3qkz9pmrx6swve	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-01-19 13:10:22.535722-05
7pprpx50y5kb98jxvf7pj2cti9x1v33o	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2014-12-23 14:07:25.687932-05
1h95m3pktbzpin7p65jazbb5b8kjlckr	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-01-24 12:54:00.371426-05
heh3u74zf9enr2jr53xt4ed3eo7jf6lg	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2014-12-24 12:46:07.65015-05
py9njmuet8adonkgbd8xxkrlokaj17oh	ZWEwMjI2YzdmNWNiNGIxODdmMDliNDI4YjE3Yjc1YzJlMjg0YTI0Yjp7Il9hdXRoX3VzZXJfaGFzaCI6ImY3ZjA5ZDJmOWY5MTUxMGE3NGNiYjQyZTBlYzUzNTI2NDZmMTY5ODciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjI0fQ==	2014-12-04 17:35:57.294646-05
utgzfsfngt2ig2elep4kj0eyrnbc4pip	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2014-12-29 12:32:52.689006-05
lcprkjgpwzbe3l939qxbuhsomvd944bk	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2014-12-05 16:37:52.76841-05
fqnfdansn5lksap5axd4zjig0ea9dkpn	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-01-26 14:12:41.323532-05
906u1nmqz84hvdiugkyao2vsb0imuhaw	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-02-02 14:25:54.371713-05
urth4r8o1dxlserxh7mq67pw2q8fqosp	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2014-12-25 17:52:35.335193-05
p9mqzqh8c8n3lb4hb0kr5ib2z64u5xlw	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-01-21 11:44:58.627572-05
fk4fog6vd6df4l7mwk9kstmxlkf32iip	MTU1MmIzMDMxMGEzNzdlYzQ5MjFmNDkxNDdhOWNjMjNiZDFmZDlkNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjcxZDM3ZTg4N2E1MzlhNzFmZmJjMWU3NjRlMTI4ODk1ZWRlY2I5ZjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2014-12-30 17:50:41.610902-05
4p2brpgk8zyvgw1f2sidh2b4txjxy7cg	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2014-12-31 11:38:08.978222-05
b6xv58khzewkkrxm0wf0wdac2jumwgfu	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-01-01 10:34:22.610737-05
1wcsy9nhiq6pf5tih813qprqiai4flis	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-01-21 12:09:39.1859-05
fqq2gdd3u11yic1crkcbfax0fhrvn1pr	MDBiYmU4M2E5ZWUzMGJmODYyZWQ3OTQ2MTA2Y2VhY2Y2ZTc0NzFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjUzYWQ5Mzc0NzJkOGE4ODJmODY0MmYwZTdjZDM1NzBjOTcyYTc4NzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE4fQ==	2014-12-06 13:02:47.788961-05
4vi0g8hpuxb94fp6ylio3gy1xzwwzf2u	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-01-27 11:20:39.616515-05
l3j6h1mmdk9hnpwm3csas1epv13pe78w	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-02-19 16:59:17.757542-05
1bmsqiyaclej21uk9blqpcb8lixvxscn	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2014-12-08 13:21:31.067422-05
3vl1efv57dg5y9wlmppmdydl7sbgyp82	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-03-03 12:01:59.081113-05
kagys58r976er60chdxvghuy84kzzh39	ZjU3MzgyZWRjODZjMTc1OGNiOTM0YTgzOTM3ZDUzMDg2Mzc3MDU5ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4MjA2NmQ2MjIxM2RiYmFkOTQ0MTc1ZDI5ZjZjYWMxZDgyMjAyM2YiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM1fQ==	2015-02-13 16:35:58.493411-05
bb5pdu1ddlg8wrzor7yj4tb99nm57gr4	NDAwNmFiMTNkOThjZmFlNTdmZTJiODJkZDY0ZTMyNWMwNzY0YzljZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE1Y2ZlZTBjNGQ2YjE2NTFlYTM3YjMwYTZlZGUwNzEwMTY2YWViMWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9	2015-02-20 18:02:02.351609-05
wobi51yzfj46v2e12uicrol0r1jxr6fc	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-02-23 07:47:01.966127-05
0fr8inkjwjgljp0tdc4qwgia94q1q41x	MmJjMWVhMTE0YTNjNDVlZDhkYzRiYjIzZWI2MjU1MmIyYjJiYjQ5YTp7Il9hdXRoX3VzZXJfaGFzaCI6ImY2OGQwZTIzOWY3ODIxNGQzNjkwZTMyNWM3NjIzMjJkOGIzMzdhNDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE3fQ==	2015-03-13 12:32:55.560309-04
ie4mb0wd08gndmcdad6aheul7sqikol5	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-03-03 12:06:55.294633-05
hinnjgfeh0iv9kem5dmqo4j8xqn7dui5	ZGM4ZjdmNmIwZWFiZGEwMGY0ZWI2NjZhOWNhNzEzYTAxMjlmNjdmMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY1NTNmOTliYTk2NGY2YmI3NzJjMzQ4ZDQwODIyYTllYzA2Zjk0MTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE1fQ==	2015-02-06 13:27:09.437275-05
zfd0ih5esadb808g7w6y8ezr4i3ojfca	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-05-06 20:25:06.858475-04
l3235nobte21uq7n8owwafrf6nr3dqp7	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-02-18 09:27:17.960271-05
9yn3663yid82b9y7uhqmk8pvepnr3vlr	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-02-18 12:19:47.121982-05
bhb1afwvblatlquijaf5600slz67yuxu	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-02-09 10:10:25.963148-05
e3elsmqbnkf2rn0daufksjt0ijufkh0r	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-02-24 18:57:55.858528-05
ixhginrp2lydahkc6kfz138xcy33q8y2	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-02-26 11:03:07.593083-05
6d4fil64ivm4c9o2qauvtbizauq0ew48	ZTlkMmIyNzljNGI0NTk4OWMxMzM5YTE1NDIxMzg1NmM2M2FjMGVjMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImIyZmU5M2I1MzFkMzJmNzIyZGFiZTUzYjExOThlOWRkNzY4MjIxOTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjQxfQ==	2015-02-10 17:21:25.973802-05
5swjfyayfmtp0m8tp83nntplr0gnuqgu	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-02-19 17:38:06.609095-05
cn0ey9bywpdn818xdskmrf2dw552ht1m	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-02-19 18:11:16.939594-05
0icf8104pfemwjqe70wpd4n3iugtd2vh	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-03-04 14:37:35.639159-05
b9e0mdj7yg5bl2j9q7l95odxtzy2zwvf	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-02-11 15:05:58.919008-05
n8xsc3b4z94bkq4jibrbri2v9wlj1yrt	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-02-19 18:17:03.0574-05
rbl3e99ucxktt6bgt2ghf13xuktw8rjt	NzAxNWZmMWIwOTk4Y2UyYWNmOTg3ZWU1NzVlZjhiYmQxMTZhMzljMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImFiY2JkMWQxMDk3MmEwZDMwY2ViM2ViYjE4YTM4NWNhOWExNmIzYjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjQyfQ==	2015-02-12 15:07:38.027696-05
pu1f566n8aq15remof1qdsmcpynpewen	NWIzYjZiMjIzZjRjNDUyNmYzYWRkNzcxOGIyOWMwYTNlMmQ5ZTEyNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjQzODgwZDY3YzM4YjA3OWY2YWVmNzRiNzQwMDNjODk3MzUwOGRhNWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjI5fQ==	2015-02-26 14:34:31.071759-05
swyz5i91hafczstbkej8poty1mb1xbsm	ZWEwMjI2YzdmNWNiNGIxODdmMDliNDI4YjE3Yjc1YzJlMjg0YTI0Yjp7Il9hdXRoX3VzZXJfaGFzaCI6ImY3ZjA5ZDJmOWY5MTUxMGE3NGNiYjQyZTBlYzUzNTI2NDZmMTY5ODciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjI0fQ==	2015-02-20 13:00:17.231469-05
cmrlrvby0lf170tlhe878pm94wwbb0hh	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-02-26 15:15:44.860653-05
a52a3vptqpm3l65hhbxwi2gnkl7cn7lf	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-03-05 18:15:46.722032-05
1q3ueup50upl0bexnn3r8h7ua46kvpid	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-03-03 11:02:59.056515-05
71f623xkoxu6ogcjz2r0idr6nblonz2q	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-03-03 11:53:47.230161-05
837usf4916tpiukcngkhh213jw8e80dv	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-03-03 11:59:28.274438-05
x5qft3xaids088s2qxm5q3nroptts53b	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-02-02 16:21:46.497226-05
i93juhlsfcui23f46uq9dmnyth2i0b69	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-02-02 18:53:53.479096-05
v22slgqat95uifw2v4aycoktt5cty3cy	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-02-13 17:06:28.511352-05
im9wv1izwbb3cq6jaq469t7a6vsdg2i7	ZGM4ZjdmNmIwZWFiZGEwMGY0ZWI2NjZhOWNhNzEzYTAxMjlmNjdmMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY1NTNmOTliYTk2NGY2YmI3NzJjMzQ4ZDQwODIyYTllYzA2Zjk0MTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE1fQ==	2015-02-20 16:19:27.900939-05
2wehod2ujnud83ig2w3f2upyqtwrsb09	MmMyZDA1NWNlY2JhMTZiMzdiMDEzMzliMTBhZWVkYjBlNDIzMzhmZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmY2FmY2Y2ZGM1MWM2MjcyNDlhNjk5NTNiOWZhN2FkOWQxMjgzZDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjMyfQ==	2015-02-17 12:26:27.343409-05
isd81pd60uysswdker7a8gr969zjyx0d	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-02-06 13:38:59.978297-05
p3o3g1kf43xuorbhxnqtqrfi3d9yhi48	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-02-06 14:48:35.275378-05
ww194j8lywzsmq4lgbf46x9dda8t8w2m	YjdhMGMwZjE0NDcxZWM0MTllYjk3YWY4NDE0MTFiMDk0OTgyMzcyYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlmMDQ0MDM2OTk4ZGEzNjcwYjc5OWQyNjYzMWFiODBkYTM1ZjYzM2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE5fQ==	2015-02-07 11:19:20.103809-05
m79vmn5lkzx1e0dszjuxhxwr6j2vwd4v	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-03-03 17:20:35.189575-05
6vsiqcqlgninufztfyfskcvbfpo3qwsz	ZGM4ZjdmNmIwZWFiZGEwMGY0ZWI2NjZhOWNhNzEzYTAxMjlmNjdmMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY1NTNmOTliYTk2NGY2YmI3NzJjMzQ4ZDQwODIyYTllYzA2Zjk0MTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE1fQ==	2015-03-12 15:39:53.186091-04
4vdxtnx70rrp2dffq8ifn8z2a6zmity4	MWY5MzhlNjk5NTJiNGJhODg2YmNlZmZkNWRiNDFiNmJkMTdjNDI1NDp7Il9hdXRoX3VzZXJfaGFzaCI6ImUxM2UyMzBmZjgzZGY1ZjM0OWYxNGZjZjNiYjIxMmNmNTE1NDU1OTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-02-03 16:47:11.417973-05
4w6qnm7bj54zhl5vuo9epohfmnxt8nqh	YjdhMGMwZjE0NDcxZWM0MTllYjk3YWY4NDE0MTFiMDk0OTgyMzcyYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlmMDQ0MDM2OTk4ZGEzNjcwYjc5OWQyNjYzMWFiODBkYTM1ZjYzM2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE5fQ==	2015-02-23 19:07:26.123594-05
u95dvit0tiya9eu506qq0d0l0gogj0y1	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-02-19 04:30:35.19167-05
sdmsqbwa722y7yq14dpkgn6knpwyyn08	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-02-04 10:26:40.060347-05
x8dklygy9kljpqm1yf5q160j431tdfr4	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-02-24 17:38:10.558654-05
uvd9lkjmrrp54o5xb0u1wtsj0fhswfw7	MDAwYzRmYjQ5NzhlODlmY2ViNzIyNWJmMjUxY2M5NzRmNDJkYTBiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjFmNjU4YTNkOWRmNTMyODcwZGY0YTAxNmM5ZGI5NTQzMGM1ZjM4YTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjIzfQ==	2015-02-04 12:22:43.562388-05
vrrklznkfs0nt40fk37r67bd4d8znfs1	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-02-19 11:58:14.450004-05
tf4gna2fjrxu40wcsf165b03kioef52h	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-02-25 12:53:37.343966-05
bf7ij755c25uq8ldk55wipy16qmlfi7c	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-02-26 10:44:49.912229-05
eu6pe8ujqkd8f8ubk4p5979neai76mpj	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-02-04 12:41:32.304874-05
fbi6638ckxaioacp61rpmql3a3nnktuw	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-02-04 13:20:56.792369-05
x34gp3xyfpul5xrj2apd6980uw7pwicw	NWE0MDQ3ZWI1ZTg4NmY1OTg0MzMzNTY4NWY1MDEzYzU4ZDZlYjM0Njp7Il9hdXRoX3VzZXJfaGFzaCI6IjMwOThjNjgyMjI0ZTVkMTRmYTRlOWIwNDM1ZjIzMjc2ZTE3NzVlMjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjh9	2015-02-11 17:09:08.775245-05
0h0esci1ecm47ph9pq43eo6dgql47htu	YjdhMGMwZjE0NDcxZWM0MTllYjk3YWY4NDE0MTFiMDk0OTgyMzcyYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlmMDQ0MDM2OTk4ZGEzNjcwYjc5OWQyNjYzMWFiODBkYTM1ZjYzM2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE5fQ==	2015-02-26 15:00:00.821442-05
zt4es1coo6nhcae80r7hxk09gqj66bk5	ZjU3MzgyZWRjODZjMTc1OGNiOTM0YTgzOTM3ZDUzMDg2Mzc3MDU5ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4MjA2NmQ2MjIxM2RiYmFkOTQ0MTc1ZDI5ZjZjYWMxZDgyMjAyM2YiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM1fQ==	2015-02-04 16:46:51.409007-05
i6kjzh61oxrl5q3etv1iyew64c7w7k2w	MWY5MzhlNjk5NTJiNGJhODg2YmNlZmZkNWRiNDFiNmJkMTdjNDI1NDp7Il9hdXRoX3VzZXJfaGFzaCI6ImUxM2UyMzBmZjgzZGY1ZjM0OWYxNGZjZjNiYjIxMmNmNTE1NDU1OTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-02-04 20:23:48.613389-05
ov86nnu4ap6wxsnt1eqozg8si4ixb5o4	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-02-28 11:19:17.277208-05
335crr7nh1emhw5d66kldhtq8xa97018	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-04-07 14:38:14.198814-04
zmzao3o0kzwjll2m9htr0zss3mal7luf	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-04-01 19:29:31.171534-04
ed4epr3r91cmr7ktytj0f4icmgiullqn	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-04-03 11:07:22.308103-04
0a2fxojfzwrqa5oggzu8w1lpl44y2rhu	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-03-10 16:08:15.288376-04
147qmme7o6ssk75qsns3uknnj83gur7p	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-03-11 18:44:38.443895-04
bvr9dh21ltzwh6mdt03pga6hzwv4d3nz	YjllYjBiMGNiZDRiZTcxZGFjY2ZmMjQ0ZTJiNWY0NWM5ODllZTZkNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImM5NzI0NGVjNmI2NTQ3MjlmMDFkNGNmMmZkZDczMjc1YTA2YmQ0YzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE0fQ==	2015-04-07 19:35:42.347297-04
kwsw3pp5cbwlnbq17annb8fivxwcwhjc	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-04-08 15:25:44.512797-04
liglgziuybduip0i5bxbz174va6c659t	YjllYjBiMGNiZDRiZTcxZGFjY2ZmMjQ0ZTJiNWY0NWM5ODllZTZkNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImM5NzI0NGVjNmI2NTQ3MjlmMDFkNGNmMmZkZDczMjc1YTA2YmQ0YzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE0fQ==	2015-03-18 12:00:34.600144-04
c74vtdnnwf5xcfsdye7n3ww0j1ldtpsa	MDAwYzRmYjQ5NzhlODlmY2ViNzIyNWJmMjUxY2M5NzRmNDJkYTBiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjFmNjU4YTNkOWRmNTMyODcwZGY0YTAxNmM5ZGI5NTQzMGM1ZjM4YTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjIzfQ==	2015-05-20 13:11:38.567033-04
qr0cvm1bqw2xrc8h3r0kf2k2xyifbvuv	NzAxNWZmMWIwOTk4Y2UyYWNmOTg3ZWU1NzVlZjhiYmQxMTZhMzljMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImFiY2JkMWQxMDk3MmEwZDMwY2ViM2ViYjE4YTM4NWNhOWExNmIzYjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjQyfQ==	2015-04-15 15:28:37.562336-04
39zcsf6xxnqxragh6sy1mbmnokxwje85	YTE2YjIzYjA4MjZlZTlkM2ZmNDVhN2JjYTRlM2I4NGJmNDUxYWQzZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ2MDAyMGU5YTVjMzNkZTU0MWI2Y2RkNWI4M2Q0YjFhNDc0YWFkZmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjQ3fQ==	2015-05-20 19:06:57.412103-04
mx6agc3nsr8sosyzhy4zwpjzycn8kdh2	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-05-08 11:28:12.768152-04
c6vjzph21ij7wlovc2v3dx92gbwk4wj7	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-04-22 16:36:28.730516-04
cnjjltuikvg0def4ht40wae7kvgv4g2o	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-04-29 21:46:33.217161-04
c2s8yaeg2v75klc5o3o9cy5dkj1r2ozi	ZWEwMjI2YzdmNWNiNGIxODdmMDliNDI4YjE3Yjc1YzJlMjg0YTI0Yjp7Il9hdXRoX3VzZXJfaGFzaCI6ImY3ZjA5ZDJmOWY5MTUxMGE3NGNiYjQyZTBlYzUzNTI2NDZmMTY5ODciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjI0fQ==	2015-05-13 14:41:48.824002-04
8pbduh8ogxye1u1n0gib48oz0ov310qz	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-05-21 12:29:22.822629-04
y8ubkhswse9ashz30tcar9enoux4rmhe	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-05-14 15:54:34.443514-04
x795rsjkhk12sj19j7xvrf1v6d4bkpfx	YTE2YjIzYjA4MjZlZTlkM2ZmNDVhN2JjYTRlM2I4NGJmNDUxYWQzZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ2MDAyMGU5YTVjMzNkZTU0MWI2Y2RkNWI4M2Q0YjFhNDc0YWFkZmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjQ3fQ==	2015-06-01 12:09:59.365384-04
o8cprnx2mrvag0rzifr2h6qlegcwkuo7	MDAwYzRmYjQ5NzhlODlmY2ViNzIyNWJmMjUxY2M5NzRmNDJkYTBiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjFmNjU4YTNkOWRmNTMyODcwZGY0YTAxNmM5ZGI5NTQzMGM1ZjM4YTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjIzfQ==	2015-05-25 14:04:25.040825-04
drfc8lxx91ac9zx9vuotvaoenrj1bqzu	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-06-02 14:27:38.438871-04
9diivb0b5p8vbececy6fjq0h7uritm8d	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-06-03 13:30:43.646936-04
ibaoat23qohq0hy6mkfpkxrue0s0tc1l	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-06-05 14:03:57.578444-04
8u7dljyjqjy5xtuaax57hla3r7bpko24	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-06-08 11:12:35.984939-04
f92byvvbxpbxp6afpoh8usrekwljaa7o	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-03-31 11:24:46.462525-04
hj6wkj8kfwwq5zokgrctemhr23edwfdd	MTM4OGViNmZlYjZiNzZjODc0MjEzZGUzMzQ0MWZjZDRjNjM2YzMzNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImRkYjI1MjExMGEyYmI5ZTllMjE0YWE2NDkyYjYyZGNjZTQ3NGUzYmYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjl9	2015-04-23 17:49:15.168265-04
1lizsyddsbfgezs3c1fycryu0ivakn7p	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-03-10 13:00:08.328412-04
5lnw2h34bnv84sbf2cae4271ad2jxi4m	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-03-16 11:56:07.574224-04
oqhsbv9a8fvlzpa7e0agl2jfnznbf8p7	YjllYjBiMGNiZDRiZTcxZGFjY2ZmMjQ0ZTJiNWY0NWM5ODllZTZkNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImM5NzI0NGVjNmI2NTQ3MjlmMDFkNGNmMmZkZDczMjc1YTA2YmQ0YzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE0fQ==	2015-05-06 11:26:31.671569-04
svvsg9jgo1wzvoku5h596yfo6rrwwc62	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-04-08 12:25:20.21573-04
yipjr8qluwk7jk8mgtc26kuddklgsv6m	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-03-24 20:15:54.593478-04
mmwujz1rmdjuqy0la9540j8bpgu4utq7	ZjlhM2JkNjRiNmViYzkyOWNjN2JkODJmMDdmMTUwY2Y4N2YyMTU3MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNkMzRjZjY2MzgyMTIzMmQxN2NiYjgxNzAzZGE2ZjNhYzQ1YmY3YWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEwfQ==	2015-05-28 15:05:15.205827-04
ozb96a8kqlvq6duzcw74cv99tj1h5j9i	ZjU3MzgyZWRjODZjMTc1OGNiOTM0YTgzOTM3ZDUzMDg2Mzc3MDU5ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4MjA2NmQ2MjIxM2RiYmFkOTQ0MTc1ZDI5ZjZjYWMxZDgyMjAyM2YiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM1fQ==	2015-03-12 18:11:41.835697-04
yofyojmkpegl52f8dghvnlxvc7prdreu	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-03-25 15:48:20.169533-04
43uq5yftiji2wxkjgxrglvfzgoqq3fta	MTM4OGViNmZlYjZiNzZjODc0MjEzZGUzMzQ0MWZjZDRjNjM2YzMzNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImRkYjI1MjExMGEyYmI5ZTllMjE0YWE2NDkyYjYyZGNjZTQ3NGUzYmYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjl9	2015-05-07 12:50:28.964922-04
7zdrkxykbboojlc3likg6cbn7ryu99hv	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-03-18 15:41:07.296421-04
32rry2qdc67ex7y44vfh6krmijnldmpj	MTM4OGViNmZlYjZiNzZjODc0MjEzZGUzMzQ0MWZjZDRjNjM2YzMzNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImRkYjI1MjExMGEyYmI5ZTllMjE0YWE2NDkyYjYyZGNjZTQ3NGUzYmYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjl9	2015-04-03 12:20:51.913889-04
r2cuesrm1c7bpy42y69qg03eukoyue7v	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-03-19 15:12:33.615974-04
6yi7a7y3l5xj3umxibo5h6h511539qut	ZGM4ZjdmNmIwZWFiZGEwMGY0ZWI2NjZhOWNhNzEzYTAxMjlmNjdmMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY1NTNmOTliYTk2NGY2YmI3NzJjMzQ4ZDQwODIyYTllYzA2Zjk0MTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE1fQ==	2015-04-04 15:54:48.210035-04
j4m37ju0fr7ankwej79daxqverhl0gau	YjllYjBiMGNiZDRiZTcxZGFjY2ZmMjQ0ZTJiNWY0NWM5ODllZTZkNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImM5NzI0NGVjNmI2NTQ3MjlmMDFkNGNmMmZkZDczMjc1YTA2YmQ0YzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE0fQ==	2015-05-08 11:45:01.052482-04
8sifyghwqx289w8rd69fvr2j83byha42	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-06-01 18:01:18.94783-04
w2e45f8jx6n5vhpjuumeh696336zc8np	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-04-21 15:45:41.317181-04
9jnalegvnt7uga8kg1hv1fmx85ax6fgd	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-05-22 12:14:34.108051-04
ykxm5b9qk663lwwdmcdy4azleikqtu2x	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-05-15 15:53:22.503962-04
e984o3npkm22si3ep9qvwtihr4m7623o	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-06-03 14:41:38.812178-04
9t8t8a2t1n2vqvj9ko1v0lz1wnkijdm3	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-05-25 14:20:20.615182-04
5ooa25nhwyx6l8x0v19z9ojhlab5n2tt	NzAxNWZmMWIwOTk4Y2UyYWNmOTg3ZWU1NzVlZjhiYmQxMTZhMzljMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImFiY2JkMWQxMDk3MmEwZDMwY2ViM2ViYjE4YTM4NWNhOWExNmIzYjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjQyfQ==	2015-05-25 19:21:11.451096-04
zl07el1uap1sbdxqactvpoaq34uouuvh	NWIzYjZiMjIzZjRjNDUyNmYzYWRkNzcxOGIyOWMwYTNlMmQ5ZTEyNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjQzODgwZDY3YzM4YjA3OWY2YWVmNzRiNzQwMDNjODk3MzUwOGRhNWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjI5fQ==	2015-05-27 15:59:24.637334-04
xvbn1csyi7uhin71hbeizs59z9dxjcuk	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-03-04 19:13:10.865523-05
ihtiq4gqxxwthqix99oy47s0sg652r05	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-03-13 13:40:19.098659-04
xidwtcw01xkxu747yjnvlrij2jlr7ug7	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-03-20 13:10:00.558587-04
nfy2c9xmzu9101gx3e1rvp5vm7t5q7wx	MjdhYzc3YmI4ODY1MzkzNzY3OWZjNzM2YTMxNDZjN2ExZWJkYTRhMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImM1NjUzNzVjOWRhNDU0ZWJjZDNhNmYyYWMxMTY4Njg4NDQxOTM1YTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-31 11:44:37.606377-04
7y9o9uxmgkelvd2oe4ndudqf2g0t5spc	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-05-06 11:29:11.462136-04
nm1qb8y94p3oq25u6e68orlisk4e809n	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-05-07 12:50:53.545814-04
2z8cah70u474sof4nzkehs0tcgg8sjcv	NWIzYjZiMjIzZjRjNDUyNmYzYWRkNzcxOGIyOWMwYTNlMmQ5ZTEyNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjQzODgwZDY3YzM4YjA3OWY2YWVmNzRiNzQwMDNjODk3MzUwOGRhNWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjI5fQ==	2015-05-08 12:43:04.747065-04
4q0luxej3u6h8qo60hajfw168w57z1kh	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-04-03 12:30:44.493296-04
w53zmb97yapucczbthjfyh7a2iz9ml2y	MjAxZmM0NDdlMzdkZGVlNjZlNGQwNTIwOWI0NDY2Zjc4Yjk0OWU0MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyOTFmMzliMzY2MDczNWQ4MmRjNmE3YTZiN2RkYmE0NzBmZGI1MTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjIxfQ==	2015-03-18 19:06:47.223005-04
3coiobgnygq0eeitzs8lm8f7y43c92pz	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-04-05 13:30:48.417031-04
a298wrhq7ndc1y2xngtr17y9yfcwo80p	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-06-01 19:29:03.904257-04
vjazan0jbf5b1gkfcwi7axq1vd99a44n	ZWEwMjI2YzdmNWNiNGIxODdmMDliNDI4YjE3Yjc1YzJlMjg0YTI0Yjp7Il9hdXRoX3VzZXJfaGFzaCI6ImY3ZjA5ZDJmOWY5MTUxMGE3NGNiYjQyZTBlYzUzNTI2NDZmMTY5ODciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjI0fQ==	2015-04-06 18:15:17.598343-04
lk3v153safmu57415ahxlcduditukmoc	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-05-21 12:34:04.379479-04
3no7zjrk1ha5heligru2ftzljty2pz1i	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-05-05 17:44:14.762701-04
ov3tvnm9uhyz6z8sv60eisjqsm5amk4r	YjllYjBiMGNiZDRiZTcxZGFjY2ZmMjQ0ZTJiNWY0NWM5ODllZTZkNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImM5NzI0NGVjNmI2NTQ3MjlmMDFkNGNmMmZkZDczMjc1YTA2YmQ0YzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE0fQ==	2015-05-22 14:19:18.219512-04
s21l4foesepp7wxbvpu8lg6mtlsdqf9p	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-05-18 11:29:33.054411-04
cl08bzhqczpicjyj4e05aenmql7uc22e	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-05-26 11:09:21.78493-04
rtzv7jpo7o54akfg87qftndt625p5mz5	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-05-27 18:21:35.275694-04
vsdrmrj8j39z1s37inkha2kwqp3vxumt	YjdhMGMwZjE0NDcxZWM0MTllYjk3YWY4NDE0MTFiMDk0OTgyMzcyYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlmMDQ0MDM2OTk4ZGEzNjcwYjc5OWQyNjYzMWFiODBkYTM1ZjYzM2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE5fQ==	2015-06-09 19:13:39.38092-04
yhbagl66yfcoafsf3iuir5zvplqw2xuv	NzAxNWZmMWIwOTk4Y2UyYWNmOTg3ZWU1NzVlZjhiYmQxMTZhMzljMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImFiY2JkMWQxMDk3MmEwZDMwY2ViM2ViYjE4YTM4NWNhOWExNmIzYjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjQyfQ==	2015-03-04 20:14:52.848034-05
a5b8jshzakatwphm6trjj56g3l00o0ul	NzAxNWZmMWIwOTk4Y2UyYWNmOTg3ZWU1NzVlZjhiYmQxMTZhMzljMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImFiY2JkMWQxMDk3MmEwZDMwY2ViM2ViYjE4YTM4NWNhOWExNmIzYjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjQyfQ==	2015-03-20 21:27:36.650932-04
3646jknvzrq8acwuvkv1z4h0jtjejwgn	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-03-31 12:05:12.208184-04
pquqh2hxupyb4grf2p07rezmkpwj235o	NzQ2Y2Y0OWZkOTk3YjdiYjIzZDA5NzU4ZTJiZGMxMjMzYjdiOGQ5ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ0M2RjMWMzNjZiMzZjZmU1MzBkNjdmYmFhNTI2YmE3YTEyYTFmMDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjMzfQ==	2015-03-10 13:14:42.492133-04
jqu5tvg0gxghbp94f8pizdy6u0apxvns	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-03-16 12:52:01.53779-04
dzbg9mnl5om542jgrownst2wujlnysqo	ZWEwMjI2YzdmNWNiNGIxODdmMDliNDI4YjE3Yjc1YzJlMjg0YTI0Yjp7Il9hdXRoX3VzZXJfaGFzaCI6ImY3ZjA5ZDJmOWY5MTUxMGE3NGNiYjQyZTBlYzUzNTI2NDZmMTY5ODciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjI0fQ==	2015-03-11 22:18:36.154069-04
qase54xv9febzrn3sgr8vnuhe62cvxgu	MTIxYzdhYTk1MzM1ZjkzNDYzY2ViM2RjNDk0OGYxNzNlMWM1MGEzOTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4YzNjNTU5ZDcwNTZhNmY4ZWEwMmQwMWFhNjVhZDA0ZDhjYzhkYzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjQxfQ==	2015-03-24 22:06:23.555928-04
vsgwp3zklrpjc1jehe43b4q232zwuvkz	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-05-07 13:31:25.300616-04
eo9odrdqggu54v7qtltktmmnq1fgh16n	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-05-08 14:28:50.292226-04
wwlmr4y2c156swjxhrwn8lnb7vee6rtz	YjllYjBiMGNiZDRiZTcxZGFjY2ZmMjQ0ZTJiNWY0NWM5ODllZTZkNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImM5NzI0NGVjNmI2NTQ3MjlmMDFkNGNmMmZkZDczMjc1YTA2YmQ0YzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE0fQ==	2015-04-03 14:13:04.323512-04
3jnv0dhkvtu0f9bvhncbyov5vg6ucaij	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-06-02 11:25:47.745369-04
etwzxvigdv826ohhfvp64zscmavvl5nd	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-05-05 15:43:05.798604-04
jheubpgfovyxolosbunw3jghafe3mg3h	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-06-02 18:15:57.093539-04
fkucfrb2d6t1qh5h3annduitjnho3ykt	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-05-21 12:53:15.069545-04
gqkcd1fum036ydjjn4jvzwzw59zw5fdq	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-06-08 15:00:44.852174-04
lcd4mwj1jqqve7cjg3ps8oud9zrx7vrh	ODI1YzFkYzIzMTFlZmUxMGVmYTFjZTA0YWRkNjUyODg2YzkyMjYyODp7Il9hdXRoX3VzZXJfaGFzaCI6ImY3M2RjMWJkYTc1NTY4YzE5NjAzNGE2NWIxMDliM2JjM2NmMDY3MmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjQ2fQ==	2015-06-09 15:24:10.113837-04
oul90ylr63csr04t7gk88jwglk3kh0tx	MTU1MmIzMDMxMGEzNzdlYzQ5MjFmNDkxNDdhOWNjMjNiZDFmZDlkNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjcxZDM3ZTg4N2E1MzlhNzFmZmJjMWU3NjRlMTI4ODk1ZWRlY2I5ZjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-09 19:51:00.704745-04
bk2079nj17g5dw0zx8lfq0c8e55zat9l	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-03-05 17:07:59.578907-05
eg524npqulgl93h1uy4mcg7uj5wvl1w8	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-03-21 12:38:33.761138-04
2eccukrgi9zssges1qn0yxmtf7euud4s	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-04-24 17:30:43.939985-04
df9nbae9nj2z80qj5km8jg2btsftnavz	MTU1MmIzMDMxMGEzNzdlYzQ5MjFmNDkxNDdhOWNjMjNiZDFmZDlkNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjcxZDM3ZTg4N2E1MzlhNzFmZmJjMWU3NjRlMTI4ODk1ZWRlY2I5ZjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-05-06 15:26:04.159762-04
325f97vvqfflq56vn3muzv907mcn2fsb	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-04-01 11:35:41.128471-04
axvs6qg4aj4mxh939s02yac5ra0n5qym	ZGM4ZjdmNmIwZWFiZGEwMGY0ZWI2NjZhOWNhNzEzYTAxMjlmNjdmMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY1NTNmOTliYTk2NGY2YmI3NzJjMzQ4ZDQwODIyYTllYzA2Zjk0MTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE1fQ==	2015-03-11 14:02:01.311414-04
q0mrld0sddl51c57fq3291bzxxgui16z	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-04-08 14:06:53.489177-04
x974fzazuin0qjmc5tufi5l3o9tyiwsc	YjllYjBiMGNiZDRiZTcxZGFjY2ZmMjQ0ZTJiNWY0NWM5ODllZTZkNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImM5NzI0NGVjNmI2NTQ3MjlmMDFkNGNmMmZkZDczMjc1YTA2YmQ0YzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE0fQ==	2015-04-08 19:01:42.713344-04
ogq8lv4hx5dhi1z9rc0x6qb4mjyy75pd	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-04-03 15:07:24.814958-04
km1ao316x7n9jslte0kwtbucpktes4gf	NWIzYjZiMjIzZjRjNDUyNmYzYWRkNzcxOGIyOWMwYTNlMmQ5ZTEyNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjQzODgwZDY3YzM4YjA3OWY2YWVmNzRiNzQwMDNjODk3MzUwOGRhNWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjI5fQ==	2015-04-11 12:58:46.101788-04
3q37u3zauh5df0wkrs4h5i8z3dug0qxu	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-05-29 12:04:30.521378-04
uo4fncyg6vv0ganm82xc769f5jg9jhhr	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-05-21 11:31:53.98045-04
khry7fgxu0u0rbiknhvdxhf3yx0ulkgy	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-05-12 12:31:26.139378-04
bbquor51z536nvf2rs614pyfhcujna08	NzAxNWZmMWIwOTk4Y2UyYWNmOTg3ZWU1NzVlZjhiYmQxMTZhMzljMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImFiY2JkMWQxMDk3MmEwZDMwY2ViM2ViYjE4YTM4NWNhOWExNmIzYjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjQyfQ==	2015-04-21 21:52:23.434701-04
zpbyjnzk3ptpztil7v3l0u02inokp55f	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-06-02 11:26:51.308792-04
annjxh5wsdqm5v98lqztdb8h23bx6iyk	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-05-21 12:54:38.04925-04
z3olfh94l5ouq74c9p3lznnwo6bpy100	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-06-02 18:54:34.755318-04
nnb9ke5r47yu3t1mf7fq0aft6grddd1o	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-05-18 13:06:06.22049-04
j39d9kfxbgt41byxm2o7cykky88xyikt	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-05-25 14:27:14.947214-04
zpdm91ew6l3pafvumozv5h5zvvlats2b	YTE2YjIzYjA4MjZlZTlkM2ZmNDVhN2JjYTRlM2I4NGJmNDUxYWQzZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ2MDAyMGU5YTVjMzNkZTU0MWI2Y2RkNWI4M2Q0YjFhNDc0YWFkZmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjQ3fQ==	2015-06-04 11:08:09.472506-04
o2sn1pymzw7kz2zia0uzip52ao41y3jd	MmMyZDA1NWNlY2JhMTZiMzdiMDEzMzliMTBhZWVkYjBlNDIzMzhmZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmY2FmY2Y2ZGM1MWM2MjcyNDlhNjk5NTNiOWZhN2FkOWQxMjgzZDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjMyfQ==	2015-05-27 19:37:22.449751-04
46ce2n587vmm0x3c4whlqw128x590wqg	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-06-05 19:34:54.408164-04
ycraywkyen2ak2udpquw4ld9pf4jlwin	NzAxNWZmMWIwOTk4Y2UyYWNmOTg3ZWU1NzVlZjhiYmQxMTZhMzljMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImFiY2JkMWQxMDk3MmEwZDMwY2ViM2ViYjE4YTM4NWNhOWExNmIzYjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjQyfQ==	2015-06-08 18:07:46.139472-04
zkypgerrviwyjkdfhnq8ie05oakyxgbx	NWE0MDQ3ZWI1ZTg4NmY1OTg0MzMzNTY4NWY1MDEzYzU4ZDZlYjM0Njp7Il9hdXRoX3VzZXJfaGFzaCI6IjMwOThjNjgyMjI0ZTVkMTRmYTRlOWIwNDM1ZjIzMjc2ZTE3NzVlMjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjh9	2015-06-10 11:13:29.027403-04
f6oiesvzb4nybyux6531zmo31ib6tb7r	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-03-05 17:43:52.356396-05
9omqqhbtw6z4khbu4hwrt00efjcrozcn	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-03-13 14:09:31.749049-04
sfva9ju8in0ytxc8mdicevz7yryb7vwk	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-03-21 14:39:32.102562-04
76wt4xahfctwalwrrcjlh6evizkv79c2	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-04-27 13:28:40.462857-04
fberagrkoejoz2sm6xe7q70e6fymm359	NzAxNWZmMWIwOTk4Y2UyYWNmOTg3ZWU1NzVlZjhiYmQxMTZhMzljMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImFiY2JkMWQxMDk3MmEwZDMwY2ViM2ViYjE4YTM4NWNhOWExNmIzYjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjQyfQ==	2015-03-24 13:30:31.812537-04
pbmdb6b23lln9lde2pobq692lgram8hd	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-03-17 13:23:25.083717-04
wgckydwvcbqrth06afnp0gin1jzak3ec	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-05-20 11:17:03.876764-04
45puzs33o7gdkp3uar5cdc0rr768pqie	ZGM4ZjdmNmIwZWFiZGEwMGY0ZWI2NjZhOWNhNzEzYTAxMjlmNjdmMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY1NTNmOTliYTk2NGY2YmI3NzJjMzQ4ZDQwODIyYTllYzA2Zjk0MTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE1fQ==	2015-04-01 13:04:24.628078-04
b40ktcwsjkjkbooym2069ol8fomhf5ag	MTU1MmIzMDMxMGEzNzdlYzQ5MjFmNDkxNDdhOWNjMjNiZDFmZDlkNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjcxZDM3ZTg4N2E1MzlhNzFmZmJjMWU3NjRlMTI4ODk1ZWRlY2I5ZjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-05-28 15:52:54.434611-04
8iipl0ggzfhhga5rlb3mj885csvktucp	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-03-18 19:56:59.59605-04
uej01qmyvm2lteq7wdy58eraxopmnpws	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-04-02 14:30:50.95695-04
jviktc1ad5v115c1n6t682q7gro7qlrl	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-04-03 17:08:42.363747-04
53pd3zl6fd80exra2fcbiid7i75w8yn1	NzAxNWZmMWIwOTk4Y2UyYWNmOTg3ZWU1NzVlZjhiYmQxMTZhMzljMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImFiY2JkMWQxMDk3MmEwZDMwY2ViM2ViYjE4YTM4NWNhOWExNmIzYjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjQyfQ==	2015-05-29 13:15:29.052266-04
iv31xatertx36xsggq9pwu3k32t6pwji	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-05-08 19:31:12.715324-04
r8vyq92f3yqx355zzbfnoay6war6hsfl	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-05-05 11:54:38.648919-04
03aacomsnxw75dqrhzbxeeb8jpcbjceq	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-05-21 11:50:09.565119-04
1viyg5lbkmwxqzzy0pxio4fxks11ygqj	ZWEwMjI2YzdmNWNiNGIxODdmMDliNDI4YjE3Yjc1YzJlMjg0YTI0Yjp7Il9hdXRoX3VzZXJfaGFzaCI6ImY3ZjA5ZDJmOWY5MTUxMGE3NGNiYjQyZTBlYzUzNTI2NDZmMTY5ODciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjI0fQ==	2015-04-20 17:14:20.217533-04
xm5gdg0sefdht2fjxcs7rz5q33kpzabv	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-05-13 10:22:11.064973-04
7zlfi7btob17p4o76t35wk869vlxlw8t	YjllYjBiMGNiZDRiZTcxZGFjY2ZmMjQ0ZTJiNWY0NWM5ODllZTZkNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImM5NzI0NGVjNmI2NTQ3MjlmMDFkNGNmMmZkZDczMjc1YTA2YmQ0YzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE0fQ==	2015-04-22 11:04:27.639778-04
rhmypgjaa4josg59ou946f54uggc508e	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-05-21 15:31:12.761491-04
1jzsgpk7vfxjfnwzvwszivy8la8z6by8	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-06-02 11:27:45.365647-04
xydgui7jmxgdpt0jq2p7bpp6tmbvtala	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-05-14 18:22:56.89713-04
xf56tzj6ks659on7dmaozsuhdgp7ioes	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-05-22 15:11:28.481538-04
rw4fuq7vifmsvo1oabi4tikf1rd22toz	NzAxNWZmMWIwOTk4Y2UyYWNmOTg3ZWU1NzVlZjhiYmQxMTZhMzljMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImFiY2JkMWQxMDk3MmEwZDMwY2ViM2ViYjE4YTM4NWNhOWExNmIzYjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjQyfQ==	2015-05-26 13:15:10.512895-04
q4b30k2uq7qnn19gd775aufoeqx41jut	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-03-06 09:44:41.2457-05
gqu3mdanc4n18724q4jl7a82tml4bij2	MDAwYzRmYjQ5NzhlODlmY2ViNzIyNWJmMjUxY2M5NzRmNDJkYTBiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjFmNjU4YTNkOWRmNTMyODcwZGY0YTAxNmM5ZGI5NTQzMGM1ZjM4YTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjIzfQ==	2015-03-21 14:41:40.791668-04
0qmo6a8hoh7gouzbyil101lwlu1o49kj	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-03-31 15:09:02.585965-04
1829d0rqmb9t78sa3p0ce07z2vkhuj50	YjllYjBiMGNiZDRiZTcxZGFjY2ZmMjQ0ZTJiNWY0NWM5ODllZTZkNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImM5NzI0NGVjNmI2NTQ3MjlmMDFkNGNmMmZkZDczMjc1YTA2YmQ0YzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE0fQ==	2015-04-07 17:08:49.014707-04
tdybkxq5b2v1qy50x67lly811wf71ndn	NWE0MDQ3ZWI1ZTg4NmY1OTg0MzMzNTY4NWY1MDEzYzU4ZDZlYjM0Njp7Il9hdXRoX3VzZXJfaGFzaCI6IjMwOThjNjgyMjI0ZTVkMTRmYTRlOWIwNDM1ZjIzMjc2ZTE3NzVlMjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjh9	2015-05-06 19:03:08.880449-04
l61qkly6yo18g08jpjxq5bcp2qm5b1pc	NzAxNWZmMWIwOTk4Y2UyYWNmOTg3ZWU1NzVlZjhiYmQxMTZhMzljMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImFiY2JkMWQxMDk3MmEwZDMwY2ViM2ViYjE4YTM4NWNhOWExNmIzYjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjQyfQ==	2015-03-17 15:13:55.720224-04
6odpvuwqwkjnjfqhih2dkb56j52yyf2w	YjllYjBiMGNiZDRiZTcxZGFjY2ZmMjQ0ZTJiNWY0NWM5ODllZTZkNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImM5NzI0NGVjNmI2NTQ3MjlmMDFkNGNmMmZkZDczMjc1YTA2YmQ0YzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE0fQ==	2015-03-25 11:45:06.520046-04
3tbuc1t8gtcvukyzjuujhs9zxfhnxifl	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-03-17 19:39:25.384234-04
l0x4f4yz33xsuqawlhzvx4j06qiim6l7	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-04-02 15:46:35.15372-04
cjm4wqisu2t5sda1oja7gfdeiao8cfp4	MTU1MmIzMDMxMGEzNzdlYzQ5MjFmNDkxNDdhOWNjMjNiZDFmZDlkNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjcxZDM3ZTg4N2E1MzlhNzFmZmJjMWU3NjRlMTI4ODk1ZWRlY2I5ZjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-05-28 15:53:14.396846-04
lvsru2vdqmb8ecurxn16qz2a56244nrn	YjdhMGMwZjE0NDcxZWM0MTllYjk3YWY4NDE0MTFiMDk0OTgyMzcyYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlmMDQ0MDM2OTk4ZGEzNjcwYjc5OWQyNjYzMWFiODBkYTM1ZjYzM2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE5fQ==	2015-04-09 11:26:41.746159-04
syy6cwwu0kl5m26quzseiwjohn1b0sxo	ZGM4ZjdmNmIwZWFiZGEwMGY0ZWI2NjZhOWNhNzEzYTAxMjlmNjdmMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY1NTNmOTliYTk2NGY2YmI3NzJjMzQ4ZDQwODIyYTllYzA2Zjk0MTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE1fQ==	2015-04-03 17:25:45.771752-04
nlm9w0jk17fwzlbsxl68j4w2vr93c8u7	NWE0MDQ3ZWI1ZTg4NmY1OTg0MzMzNTY4NWY1MDEzYzU4ZDZlYjM0Njp7Il9hdXRoX3VzZXJfaGFzaCI6IjMwOThjNjgyMjI0ZTVkMTRmYTRlOWIwNDM1ZjIzMjc2ZTE3NzVlMjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjh9	2015-04-11 17:51:52.244861-04
63cdumfqsujfamie5dc1o0yiiff6v5ui	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-05-29 15:02:01.293441-04
ahueuv8porbfckcauwfl6kdlt6qkugyk	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-04-20 19:44:11.065992-04
galitb8mhzv7thria6anzfyikb46qkzp	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-05-05 13:07:11.405494-04
gpsk0smq12n60lfk2lkvfb2upldion94	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-04-22 11:13:33.85831-04
rpxge8ru4wbxiu4onmw6py67cd33j1qy	NWIzYjZiMjIzZjRjNDUyNmYzYWRkNzcxOGIyOWMwYTNlMmQ5ZTEyNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjQzODgwZDY3YzM4YjA3OWY2YWVmNzRiNzQwMDNjODk3MzUwOGRhNWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjI5fQ==	2015-05-13 13:36:13.541162-04
xlqdobhkmemockh2xrgqwi4zk6oeotq2	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-05-05 15:59:59.562274-04
4rbhef3nsv38ebrefypflq8iludrcrts	ZjU3MzgyZWRjODZjMTc1OGNiOTM0YTgzOTM3ZDUzMDg2Mzc3MDU5ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4MjA2NmQ2MjIxM2RiYmFkOTQ0MTc1ZDI5ZjZjYWMxZDgyMjAyM2YiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM1fQ==	2015-05-22 17:50:20.093219-04
v77owz2ktidupyak4a906ax7q0eowi4d	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-06-04 13:03:55.327977-04
pf6fduspxxvcz3ctdtmkwzir8ok9l4uc	ZGM4ZjdmNmIwZWFiZGEwMGY0ZWI2NjZhOWNhNzEzYTAxMjlmNjdmMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY1NTNmOTliYTk2NGY2YmI3NzJjMzQ4ZDQwODIyYTllYzA2Zjk0MTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE1fQ==	2015-05-25 14:30:26.865494-04
a99p0cxqkrox22qv5pi8ckl6crkjy23b	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-05-18 15:46:48.186484-04
aaju169ce0lb5ykoq5yintvzzl9ed3uy	YjllYjBiMGNiZDRiZTcxZGFjY2ZmMjQ0ZTJiNWY0NWM5ODllZTZkNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImM5NzI0NGVjNmI2NTQ3MjlmMDFkNGNmMmZkZDczMjc1YTA2YmQ0YzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE0fQ==	2015-06-08 11:04:02.670756-04
vdzihh3us62kt7d27rx1uu3uf6ggnksf	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-05-26 17:40:00.419541-04
zvqan41omlvbvutsv6sl4qit6f43ffgx	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-03-06 09:45:04.762472-05
db7nup54om3l9hia55g5oaziqz4rgpaf	MzA4ZmQ5OGJiY2M4MTExYzM4NTY3ZmY2OTBiOGJkNTk4NDQ2ZjliZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmMWM4YWY4ZTA4Y2FiOWM3Y2QxZTJhMzQ2MGQ4MzMwYTg5ZTQ5MjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-03-09 18:55:31.490515-04
8pxm112si1opdak4d6vutvqdxvqkyjlj	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-03-31 15:09:02.592829-04
ofp02e8471nb7pz5ua8wf710ri2ns1pg	MzA4ZmQ5OGJiY2M4MTExYzM4NTY3ZmY2OTBiOGJkNTk4NDQ2ZjliZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmMWM4YWY4ZTA4Y2FiOWM3Y2QxZTJhMzQ2MGQ4MzMwYTg5ZTQ5MjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-03-10 14:06:28.05063-04
cd2aiwpdjq60uil9atsqxk7xqgpfjaq8	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-04-07 17:20:29.878139-04
u78vqu1bqgt5kpfhkgl1kbop0zw8ddmt	MDBiYmU4M2E5ZWUzMGJmODYyZWQ3OTQ2MTA2Y2VhY2Y2ZTc0NzFlMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjUzYWQ5Mzc0NzJkOGE4ODJmODY0MmYwZTdjZDM1NzBjOTcyYTc4NzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE4fQ==	2015-03-16 14:09:09.978046-04
26l0b528uepxmrlw30c2c1rjtki655do	NzAxNWZmMWIwOTk4Y2UyYWNmOTg3ZWU1NzVlZjhiYmQxMTZhMzljMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImFiY2JkMWQxMDk3MmEwZDMwY2ViM2ViYjE4YTM4NWNhOWExNmIzYjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjQyfQ==	2015-05-28 18:02:22.81291-04
etzo8jy0g8pfoark3ixv10upepdor2hq	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-03-17 15:29:28.050031-04
uvywxi4eklwy4yckxolwu5z92lwe8dmg	YjdhMGMwZjE0NDcxZWM0MTllYjk3YWY4NDE0MTFiMDk0OTgyMzcyYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlmMDQ0MDM2OTk4ZGEzNjcwYjc5OWQyNjYzMWFiODBkYTM1ZjYzM2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE5fQ==	2015-05-20 15:55:31.089135-04
ybvbupuzablzznfvr6z20sfei84ok65r	NzQ2Y2Y0OWZkOTk3YjdiYjIzZDA5NzU4ZTJiZGMxMjMzYjdiOGQ5ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ0M2RjMWMzNjZiMzZjZmU1MzBkNjdmYmFhNTI2YmE3YTEyYTFmMDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjMzfQ==	2015-03-25 19:22:17.466091-04
ali5iwl26v2ecd6tvaiun64ktjffakv3	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-04-14 13:50:54.875772-04
kvlch2ck0x0trdzd3njllrs8mo7iymir	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-06-02 11:28:44.918983-04
phygjlr3zwqzdn0zl9k891brjf2hw7c3	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-04-21 12:38:12.014693-04
j3gq1uoc7pj6ztpclah0d65w3nj0swcj	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-05-13 14:02:50.24472-04
1x4z0yqcfgkvnx6a8qrw4btft3mb7tnd	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-04-22 11:57:41.231936-04
psw6ljebjy0mdho3ylq1y09hrvues4og	ODI1YzFkYzIzMTFlZmUxMGVmYTFjZTA0YWRkNjUyODg2YzkyMjYyODp7Il9hdXRoX3VzZXJfaGFzaCI6ImY3M2RjMWJkYTc1NTY4YzE5NjAzNGE2NWIxMDliM2JjM2NmMDY3MmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjQ2fQ==	2015-05-05 16:01:44.790679-04
rpxc85ag9ox45wo4590mdwhyk6q0h6mb	ZjU3MzgyZWRjODZjMTc1OGNiOTM0YTgzOTM3ZDUzMDg2Mzc3MDU5ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4MjA2NmQ2MjIxM2RiYmFkOTQ0MTc1ZDI5ZjZjYWMxZDgyMjAyM2YiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM1fQ==	2015-05-21 15:58:47.091901-04
5lhe8ep4h92j3d47me5bfguoh6d3kmh8	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-06-03 12:10:36.62228-04
8zeo8hxjq5k0rk9wdw0soww8qsdcib8d	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-06-04 17:12:45.36716-04
fykntq16ji5czphlzyvde6xom0237760	YjllYjBiMGNiZDRiZTcxZGFjY2ZmMjQ0ZTJiNWY0NWM5ODllZTZkNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImM5NzI0NGVjNmI2NTQ3MjlmMDFkNGNmMmZkZDczMjc1YTA2YmQ0YzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE0fQ==	2015-05-19 11:37:43.098052-04
53segpn513dlt8p2evl6nlcld6wr3ghc	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-05-25 14:48:20.256767-04
6524jiil2yexwjdvz2u09p0xstj3502q	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-05-26 20:29:17.160835-04
d0sq0va712bk7w3k9wrlirw78q6exkcv	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-06-08 11:07:23.926172-04
j4b2a85dooimql5w9n44ln6ilx4lsnrd	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-06-09 11:57:01.002691-04
hugoxdt9letzesd20k6ahvnmjp3cde9o	YTE2YjIzYjA4MjZlZTlkM2ZmNDVhN2JjYTRlM2I4NGJmNDUxYWQzZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ2MDAyMGU5YTVjMzNkZTU0MWI2Y2RkNWI4M2Q0YjFhNDc0YWFkZmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjQ3fQ==	2015-06-09 18:16:47.940584-04
42q9cumzogfr3w5yquy1nkfii19xczgb	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-03-06 09:47:20.526041-05
ckathj7qvjmbwpfwula7l9s4gukjkbde	NDAwNmFiMTNkOThjZmFlNTdmZTJiODJkZDY0ZTMyNWMwNzY0YzljZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE1Y2ZlZTBjNGQ2YjE2NTFlYTM3YjMwYTZlZGUwNzEwMTY2YWViMWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9	2015-03-09 19:23:52.357971-04
pi712xmrilhv6ixmfrzwq69wyl900sd6	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-03-14 12:18:43.974954-04
eu4i4qcx1jzddt6yxq1nrcwyqtplfaef	ZjU3MzgyZWRjODZjMTc1OGNiOTM0YTgzOTM3ZDUzMDg2Mzc3MDU5ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4MjA2NmQ2MjIxM2RiYmFkOTQ0MTc1ZDI5ZjZjYWMxZDgyMjAyM2YiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM1fQ==	2015-03-31 17:54:11.955052-04
9vedxmq1j1zlkoozhhvi0pm0efhf710m	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-04-07 19:23:20.365202-04
txk6r5njpszvl7c9od0eylf59r9l59cf	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-03-24 18:39:36.921832-04
5x0ezovfkanb221b9dzzhkrarxxu6mal	YjllYjBiMGNiZDRiZTcxZGFjY2ZmMjQ0ZTJiNWY0NWM5ODllZTZkNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImM5NzI0NGVjNmI2NTQ3MjlmMDFkNGNmMmZkZDczMjc1YTA2YmQ0YzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE0fQ==	2015-04-28 11:33:31.789876-04
puc1d6cs712cciivja00yv90y2jj9bvi	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-03-12 15:06:29.874805-04
g0b3nk549qg9u5kuq4h6c978b25lcvr6	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-03-25 12:00:24.504612-04
594b5jkjd1n0r3d29xyz9riaeencwwc3	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-05-06 19:59:09.103334-04
zmectdh5ynlejzck3fhoxwzpyix3e7mi	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-04-29 19:32:48.872072-04
4knxa1t4xb80yrev45k2o6kmt60qfmnu	ZjQ3ZmQ3NDI4YTcxMjdmYzJkYmY4NjM5ZGIxMmQ1ZDlhNDkxYTQ1Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjdhOTcxMDA1MDE2MjBjYmEyNGIwMzIwNTVjODM2N2NkNDMyNTcyN2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjIyfQ==	2015-03-19 11:13:10.610549-04
h9fj92tavna46t5v02lcexxk9qsg842g	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-05-20 12:33:23.045943-04
07tj68bt2pabr7sepl2enk051nav7gtd	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-05-07 15:20:00.213249-04
q9q2vxyuaoo93fsqn36t7jz2dguu2b6l	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-04-03 20:17:11.277843-04
070pp59heov2q8r17h6lk4r7ayn50ft9	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-04-14 17:26:41.686714-04
jkgh26l2emn2cjpexszvhi9n2hh6vtk8	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-05-28 18:12:21.869451-04
x271czbobxujxxeg30khi99ro825y360	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-05-10 14:19:41.130015-04
djjsmfixnv45nl8772t9ju1dz0i75dn1	ZTQ5YjNjNjI5NzFmZTA4NDRhNGM1NjQ5N2JmZTRhNGEyMmNhY2M4NTp7fQ==	2015-05-29 17:37:35.95637-04
f07wpl0o5etc44ldohmgvacf27jnviom	ZjU3MzgyZWRjODZjMTc1OGNiOTM0YTgzOTM3ZDUzMDg2Mzc3MDU5ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4MjA2NmQ2MjIxM2RiYmFkOTQ0MTc1ZDI5ZjZjYWMxZDgyMjAyM2YiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM1fQ==	2015-04-22 13:15:21.645587-04
s2xod0rf963dkirslt5rsav6f1l8ocz6	YjllYjBiMGNiZDRiZTcxZGFjY2ZmMjQ0ZTJiNWY0NWM5ODllZTZkNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImM5NzI0NGVjNmI2NTQ3MjlmMDFkNGNmMmZkZDczMjc1YTA2YmQ0YzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE0fQ==	2015-06-02 12:09:56.110193-04
8zla7h05v97zy3lpyl00k5aiicq1s9bg	MzA4ZmQ5OGJiY2M4MTExYzM4NTY3ZmY2OTBiOGJkNTk4NDQ2ZjliZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmMWM4YWY4ZTA4Y2FiOWM3Y2QxZTJhMzQ2MGQ4MzMwYTg5ZTQ5MjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-06-03 13:03:53.709026-04
7jg5n0tjpw4v96z0u7i7dwac5d8dtsue	ODI1YzFkYzIzMTFlZmUxMGVmYTFjZTA0YWRkNjUyODg2YzkyMjYyODp7Il9hdXRoX3VzZXJfaGFzaCI6ImY3M2RjMWJkYTc1NTY4YzE5NjAzNGE2NWIxMDliM2JjM2NmMDY3MmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjQ2fQ==	2015-05-19 15:49:09.298579-04
8mji66ck8llx3j7cpeg0m7mxnrt4lpbd	MDAwYzRmYjQ5NzhlODlmY2ViNzIyNWJmMjUxY2M5NzRmNDJkYTBiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjFmNjU4YTNkOWRmNTMyODcwZGY0YTAxNmM5ZGI5NTQzMGM1ZjM4YTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjIzfQ==	2015-06-04 18:33:12.727458-04
u1ctgr0m245sh8fznqzg0lifq0c869xc	MmJjMWVhMTE0YTNjNDVlZDhkYzRiYjIzZWI2MjU1MmIyYjJiYjQ5YTp7Il9hdXRoX3VzZXJfaGFzaCI6ImY2OGQwZTIzOWY3ODIxNGQzNjkwZTMyNWM3NjIzMjJkOGIzMzdhNDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE3fQ==	2015-05-25 15:56:41.585134-04
nvur3bfoj1za5szulfnvm67zevn5nf6s	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-05-26 23:47:39.001986-04
wjjtltqwurr6q6m2kot8h4viqjjo6szd	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-03-14 13:24:19.288865-04
j27jp1cb8e85tsl8qk5wxjub2w7cicgf	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-03-23 11:29:56.832336-04
rjcwwysezx221d8k3id6jtvhxfq4h0f3	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-03-16 19:44:56.1578-04
m431g7vq64qlobkudrs9ra3prv41euwu	MDAwYzRmYjQ5NzhlODlmY2ViNzIyNWJmMjUxY2M5NzRmNDJkYTBiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjFmNjU4YTNkOWRmNTMyODcwZGY0YTAxNmM5ZGI5NTQzMGM1ZjM4YTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjIzfQ==	2015-03-06 10:42:18.893098-05
2zda37x9hfzrich7y5qeugzjlru5k1e1	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-04-07 19:24:31.462847-04
rh9tf2dcz8oo9k3ulpca4xpu6awpivd7	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-03-17 17:17:14.665156-04
cglytucm61hyb9usg37mscvukelzavm5	MmMyZDA1NWNlY2JhMTZiMzdiMDEzMzliMTBhZWVkYjBlNDIzMzhmZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmY2FmY2Y2ZGM1MWM2MjcyNDlhNjk5NTNiOWZhN2FkOWQxMjgzZDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjMyfQ==	2015-04-01 14:38:39.507272-04
16qp44c0n5sfqamu80v5camj6mltg9ye	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-03-25 13:40:38.306225-04
u01zyonntroqc0wzewxpk3tohiou24gp	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-04-09 18:38:44.215965-04
e3srrrq5dn3mzkirj9vonj95zfahae28	MzA4ZmQ5OGJiY2M4MTExYzM4NTY3ZmY2OTBiOGJkNTk4NDQ2ZjliZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmMWM4YWY4ZTA4Y2FiOWM3Y2QxZTJhMzQ2MGQ4MzMwYTg5ZTQ5MjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-03-27 12:18:56.427618-04
tzsfhif2pcwbefrq76k59h0oxdwc9z3r	M2RhOGI3YThmMjdlY2VmY2JlOGE2ODY3YmQyNzllYmNlYjI0YjM0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlZGNiNDc5Yjc2ZmJkOGU2ODM3MWU0NzYwMTc1NjkxYzEzZTcxZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-03-07 00:27:50.956039-05
qk2myvh6ecqtqnqdyif4yrwozcubirjn	ZGM4ZjdmNmIwZWFiZGEwMGY0ZWI2NjZhOWNhNzEzYTAxMjlmNjdmMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY1NTNmOTliYTk2NGY2YmI3NzJjMzQ4ZDQwODIyYTllYzA2Zjk0MTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE1fQ==	2015-03-07 11:26:17.335673-05
72succdh2h96u0wtin47a6il5vm1i0mr	NzAxNWZmMWIwOTk4Y2UyYWNmOTg3ZWU1NzVlZjhiYmQxMTZhMzljMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImFiY2JkMWQxMDk3MmEwZDMwY2ViM2ViYjE4YTM4NWNhOWExNmIzYjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjQyfQ==	2015-06-02 13:08:13.491791-04
vyvoousr3oliaqqp6q3y8mfc48a5hh8b	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-04-15 14:58:09.712963-04
9mromxya846zbxyiu237wwlrrazyjl7x	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-05-21 12:24:38.595314-04
xz5v4ys3ugb9ttc88njj8gmgily2ovfm	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-04-07 11:50:26.415961-04
eqv0otsyacap6u940i3b28x84bj96l5h	ZGM4ZjdmNmIwZWFiZGEwMGY0ZWI2NjZhOWNhNzEzYTAxMjlmNjdmMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY1NTNmOTliYTk2NGY2YmI3NzJjMzQ4ZDQwODIyYTllYzA2Zjk0MTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE1fQ==	2015-05-05 13:30:00.941681-04
m5byu54lq0cmfr6gnlsdrw05bylz5xtn	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-04-22 13:43:02.247211-04
3ahy6crdbbp57ccn0fgytzss2rjw8qa1	YjJhZTJhYWE0MWM1MzZkOWNhYTUyM2M0NTYwNjlkODc5MGRiYWRlZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI2NjJiOWNlODA3YmNmYzEyZDdkYjZhYzg3ZmU1YTEyZTBkNzUwN2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjQ5fQ==	2015-06-03 13:05:35.025699-04
ymc1f66irqhugladbsuv3zdohlyesohl	Njg0ZWJmZWRjMDU1MmI5NTA4OWQzMzg5ZjdiZDU2OTAxOTgzZDJiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwY2I5ZmM1ODU4Zjg0MzFjMjU4MTExNmE3YWRmZWVmNWM2ZDg3YjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM3fQ==	2015-05-22 11:20:13.986128-04
xmm2wlx2zar20ybf1egsczwgw9j2zco2	ZjU3MzgyZWRjODZjMTc1OGNiOTM0YTgzOTM3ZDUzMDg2Mzc3MDU5ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4MjA2NmQ2MjIxM2RiYmFkOTQ0MTc1ZDI5ZjZjYWMxZDgyMjAyM2YiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM1fQ==	2015-06-04 18:39:34.429098-04
cs6ej4jh6ivhyait77q4vgdmp8s55s10	MmU4ZmQyZDk1YTg5MGY4NWQ5M2EwNzYzOGVjZGQzYzU2NDZkNzRmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNTgzYjI2OWY1Yjg3ZGUwNDViNDJhNWMxZGFkNjIzNmM0MDI4ZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-05-27 15:22:08.091261-04
nttlb50cnnrdlgzqy42uza88amyhmsxk	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-03-07 15:30:54.811223-05
f7awvwcgqkm682vns09i3ojwwr00ic1r	MzM2ZTg2YWQzYjVjYTBlMDRiY2VjNWNjYjM0NTIyNmVjNTE1MjI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwYzA0MWMwZWIwMjcyYTJhZDVlM2E0YTI0NTE2NWU4ODBjNTU0ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjM2fQ==	2015-03-07 18:09:57.151768-05
\.


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: core_actividad_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_actividad
    ADD CONSTRAINT core_actividad_pkey PRIMARY KEY (id);


--
-- Name: core_avisoprivacidad_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_avisoprivacidad
    ADD CONSTRAINT core_avisoprivacidad_pkey PRIMARY KEY (id);


--
-- Name: core_bitacora_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_bitacora
    ADD CONSTRAINT core_bitacora_pkey PRIMARY KEY (id);


--
-- Name: core_bitacora_tipo_folio_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_bitacora
    ADD CONSTRAINT core_bitacora_tipo_folio_key UNIQUE (tipo, folio);


--
-- Name: core_bitacoraimagen_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_bitacoraimagen
    ADD CONSTRAINT core_bitacoraimagen_pkey PRIMARY KEY (id);


--
-- Name: core_block_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_block
    ADD CONSTRAINT core_block_pkey PRIMARY KEY (id);


--
-- Name: core_categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_categoria
    ADD CONSTRAINT core_categoria_pkey PRIMARY KEY (id);


--
-- Name: core_cliente_distribuidor_id_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_cliente
    ADD CONSTRAINT core_cliente_distribuidor_id_key UNIQUE (distribuidor_id);


--
-- Name: core_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_cliente
    ADD CONSTRAINT core_cliente_pkey PRIMARY KEY (id);


--
-- Name: core_cliente_sucursal_nombre_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_cliente
    ADD CONSTRAINT core_cliente_sucursal_nombre_key UNIQUE (sucursal, nombre);


--
-- Name: core_concretarcita_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_concretarcita
    ADD CONSTRAINT core_concretarcita_pkey PRIMARY KEY (id);


--
-- Name: core_contacto_email_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_contacto
    ADD CONSTRAINT core_contacto_email_key UNIQUE (email);


--
-- Name: core_contacto_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_contacto
    ADD CONSTRAINT core_contacto_pkey PRIMARY KEY (id);


--
-- Name: core_distribuidor_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_distribuidor
    ADD CONSTRAINT core_distribuidor_pkey PRIMARY KEY (id);


--
-- Name: core_encuestasatisfaccion_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_encuestasatisfaccion
    ADD CONSTRAINT core_encuestasatisfaccion_pkey PRIMARY KEY (id);


--
-- Name: core_equiporenta_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_equiporenta
    ADD CONSTRAINT core_equiporenta_pkey PRIMARY KEY (id);


--
-- Name: core_imagen_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_imagen
    ADD CONSTRAINT core_imagen_pkey PRIMARY KEY (id);


--
-- Name: core_imageninicio_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_imageninicio
    ADD CONSTRAINT core_imageninicio_pkey PRIMARY KEY (id);


--
-- Name: core_lista_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_lista
    ADD CONSTRAINT core_lista_pkey PRIMARY KEY (id);


--
-- Name: core_marca_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_marca
    ADD CONSTRAINT core_marca_pkey PRIMARY KEY (id);


--
-- Name: core_marcacategoria_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_marcacategoria
    ADD CONSTRAINT core_marcacategoria_pkey PRIMARY KEY (id);


--
-- Name: core_mensajecontacto_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_mensajecontacto
    ADD CONSTRAINT core_mensajecontacto_pkey PRIMARY KEY (id);


--
-- Name: core_mundotecnologia_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_mundotecnologia
    ADD CONSTRAINT core_mundotecnologia_pkey PRIMARY KEY (id);


--
-- Name: core_perfil_color_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_perfil
    ADD CONSTRAINT core_perfil_color_key UNIQUE (color);


--
-- Name: core_perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_perfil
    ADD CONSTRAINT core_perfil_pkey PRIMARY KEY (id);


--
-- Name: core_perfil_usuario_id_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_perfil
    ADD CONSTRAINT core_perfil_usuario_id_key UNIQUE (usuario_id);


--
-- Name: core_personaautorizada_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_personaautorizada
    ADD CONSTRAINT core_personaautorizada_pkey PRIMARY KEY (id);


--
-- Name: core_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_producto
    ADD CONSTRAINT core_producto_pkey PRIMARY KEY (id);


--
-- Name: core_renta_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_renta
    ADD CONSTRAINT core_renta_pkey PRIMARY KEY (id);


--
-- Name: core_rentadetalle_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_rentadetalle
    ADD CONSTRAINT core_rentadetalle_pkey PRIMARY KEY (id);


--
-- Name: core_solicitarcredito_dist_id_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_solicitarcredito
    ADD CONSTRAINT core_solicitarcredito_dist_id_key UNIQUE (dist_id);


--
-- Name: core_solicitarcredito_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_solicitarcredito
    ADD CONSTRAINT core_solicitarcredito_pkey PRIMARY KEY (id);


--
-- Name: core_solicitudtrabajo_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_solicitudtrabajo
    ADD CONSTRAINT core_solicitudtrabajo_pkey PRIMARY KEY (id);


--
-- Name: core_status_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_status
    ADD CONSTRAINT core_status_pkey PRIMARY KEY (id);


--
-- Name: core_subcategoria_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_subcategoria
    ADD CONSTRAINT core_subcategoria_pkey PRIMARY KEY (id);


--
-- Name: core_vacante_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_vacante
    ADD CONSTRAINT core_vacante_pkey PRIMARY KEY (id);


--
-- Name: core_vendedor_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_vendedor
    ADD CONSTRAINT core_vendedor_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: core_actividad_usuario_asignado_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_actividad_usuario_asignado_id ON core_actividad USING btree (usuario_asignado_id);


--
-- Name: core_actividad_usuario_creado_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_actividad_usuario_creado_id ON core_actividad USING btree (usuario_creado_id);


--
-- Name: core_bitacora_cliente_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_bitacora_cliente_id ON core_bitacora USING btree (cliente_id);


--
-- Name: core_bitacora_usuario_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_bitacora_usuario_id ON core_bitacora USING btree (usuario_id);


--
-- Name: core_bitacora_usuario_modificado_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_bitacora_usuario_modificado_id ON core_bitacora USING btree (usuario_modificado_id);


--
-- Name: core_bitacoraimagen_bitacora_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_bitacoraimagen_bitacora_id ON core_bitacoraimagen USING btree (bitacora_id);


--
-- Name: core_contacto_email_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_contacto_email_like ON core_contacto USING btree (email varchar_pattern_ops);


--
-- Name: core_distribuidor_vendedor_interno_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_distribuidor_vendedor_interno_id ON core_distribuidor USING btree (vendedor_interno_id);


--
-- Name: core_marcacategoria_marca_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_marcacategoria_marca_id ON core_marcacategoria USING btree (marca_id);


--
-- Name: core_marcacategoria_subcategoria_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_marcacategoria_subcategoria_id ON core_marcacategoria USING btree (subcategoria_id);


--
-- Name: core_perfil_color_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_perfil_color_like ON core_perfil USING btree (color varchar_pattern_ops);


--
-- Name: core_personaautorizada_distribuidor_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_personaautorizada_distribuidor_id ON core_personaautorizada USING btree (distribuidor_id);


--
-- Name: core_rentadetalle_equipo_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_rentadetalle_equipo_id ON core_rentadetalle USING btree (equipo_id);


--
-- Name: core_rentadetalle_renta_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_rentadetalle_renta_id ON core_rentadetalle USING btree (renta_id);


--
-- Name: core_solicitudtrabajo_vacante_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_solicitudtrabajo_vacante_id ON core_solicitudtrabajo USING btree (vacante_id);


--
-- Name: core_status_bitacora_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_status_bitacora_id ON core_status USING btree (bitacora_id);


--
-- Name: core_status_usuario_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_status_usuario_id ON core_status USING btree (usuario_id);


--
-- Name: core_subcategoria_categoria_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_subcategoria_categoria_id ON core_subcategoria USING btree (categoria_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_bitacora_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_bitacora
    ADD CONSTRAINT core_bitacora_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES core_cliente(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_bitacoraimagen_bitacora_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_bitacoraimagen
    ADD CONSTRAINT core_bitacoraimagen_bitacora_id_fkey FOREIGN KEY (bitacora_id) REFERENCES core_bitacora(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_cliente_distribuidor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_cliente
    ADD CONSTRAINT core_cliente_distribuidor_id_fkey FOREIGN KEY (distribuidor_id) REFERENCES core_distribuidor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_distribuidor_vendedor_interno_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_distribuidor
    ADD CONSTRAINT core_distribuidor_vendedor_interno_id_fkey FOREIGN KEY (vendedor_interno_id) REFERENCES core_vendedor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_marcacategoria_marca_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_marcacategoria
    ADD CONSTRAINT core_marcacategoria_marca_id_fkey FOREIGN KEY (marca_id) REFERENCES core_marca(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_marcacategoria_subcategoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_marcacategoria
    ADD CONSTRAINT core_marcacategoria_subcategoria_id_fkey FOREIGN KEY (subcategoria_id) REFERENCES core_subcategoria(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_personaautorizada_distribuidor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_personaautorizada
    ADD CONSTRAINT core_personaautorizada_distribuidor_id_fkey FOREIGN KEY (distribuidor_id) REFERENCES core_distribuidor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_rentadetalle_equipo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_rentadetalle
    ADD CONSTRAINT core_rentadetalle_equipo_id_fkey FOREIGN KEY (equipo_id) REFERENCES core_equiporenta(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_rentadetalle_renta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_rentadetalle
    ADD CONSTRAINT core_rentadetalle_renta_id_fkey FOREIGN KEY (renta_id) REFERENCES core_renta(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_solicitarcredito_dist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_solicitarcredito
    ADD CONSTRAINT core_solicitarcredito_dist_id_fkey FOREIGN KEY (dist_id) REFERENCES core_distribuidor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_solicitudtrabajo_vacante_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_solicitudtrabajo
    ADD CONSTRAINT core_solicitudtrabajo_vacante_id_fkey FOREIGN KEY (vacante_id) REFERENCES core_vacante(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_status_bitacora_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_status
    ADD CONSTRAINT core_status_bitacora_id_fkey FOREIGN KEY (bitacora_id) REFERENCES core_bitacora(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_subcategoria_categoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_subcategoria
    ADD CONSTRAINT core_subcategoria_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES core_categoria(id) DEFERRABLE INITIALLY DEFERRED;


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

