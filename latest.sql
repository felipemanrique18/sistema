PGDMP     6    8                y            dbo4gbgs5v5i0u     12.6 (Ubuntu 12.6-1.pgdg16.04+1)    12.1 o    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    12581503    dbo4gbgs5v5i0u    DATABASE     �   CREATE DATABASE "dbo4gbgs5v5i0u" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
     DROP DATABASE "dbo4gbgs5v5i0u";
                czjnstjfvwmtep    false            �            1259    12667986 	   articulos    TABLE     �  CREATE TABLE "public"."articulos" (
    "id" bigint NOT NULL,
    "categoria_id" bigint NOT NULL,
    "codigo" character varying(50),
    "nombre" character varying(100) NOT NULL,
    "precio_venta" numeric(11,2) NOT NULL,
    "stock" integer NOT NULL,
    "descripcion" character varying(256),
    "condicion" boolean DEFAULT true NOT NULL,
    "created_at" timestamp(0) without time zone,
    "updated_at" timestamp(0) without time zone
);
 !   DROP TABLE "public"."articulos";
       public         heap    czjnstjfvwmtep    false            �            1259    12667984    articulos_id_seq    SEQUENCE     }   CREATE SEQUENCE "public"."articulos_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE "public"."articulos_id_seq";
       public          czjnstjfvwmtep    false    210            �           0    0    articulos_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE "public"."articulos_id_seq" OWNED BY "public"."articulos"."id";
          public          czjnstjfvwmtep    false    209            �            1259    12667977 
   categorias    TABLE     )  CREATE TABLE "public"."categorias" (
    "id" bigint NOT NULL,
    "nombre" character varying(50) NOT NULL,
    "descripcion" character varying(255),
    "condicion" boolean DEFAULT true NOT NULL,
    "created_at" timestamp(0) without time zone,
    "updated_at" timestamp(0) without time zone
);
 "   DROP TABLE "public"."categorias";
       public         heap    czjnstjfvwmtep    false            �            1259    12667975    categorias_id_seq    SEQUENCE     ~   CREATE SEQUENCE "public"."categorias_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE "public"."categorias_id_seq";
       public          czjnstjfvwmtep    false    208            �           0    0    categorias_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE "public"."categorias_id_seq" OWNED BY "public"."categorias"."id";
          public          czjnstjfvwmtep    false    207            �            1259    12668078    detalle_ingresos    TABLE     �   CREATE TABLE "public"."detalle_ingresos" (
    "id" bigint NOT NULL,
    "ingreso_id" bigint NOT NULL,
    "articulo_id" bigint NOT NULL,
    "cantidad" integer NOT NULL,
    "precio" numeric(11,2) NOT NULL
);
 (   DROP TABLE "public"."detalle_ingresos";
       public         heap    czjnstjfvwmtep    false            �            1259    12668076    detalle_ingresos_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."detalle_ingresos_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE "public"."detalle_ingresos_id_seq";
       public          czjnstjfvwmtep    false    222            �           0    0    detalle_ingresos_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE "public"."detalle_ingresos_id_seq" OWNED BY "public"."detalle_ingresos"."id";
          public          czjnstjfvwmtep    false    221            �            1259    12668114    detalle_ventas    TABLE     �   CREATE TABLE "public"."detalle_ventas" (
    "id" bigint NOT NULL,
    "venta_id" bigint NOT NULL,
    "articulo_id" bigint NOT NULL,
    "cantidad" integer NOT NULL,
    "precio" numeric(11,2) NOT NULL,
    "descuento" numeric(11,2) NOT NULL
);
 &   DROP TABLE "public"."detalle_ventas";
       public         heap    czjnstjfvwmtep    false            �            1259    12668112    detalle_ventas_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."detalle_ventas_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE "public"."detalle_ventas_id_seq";
       public          czjnstjfvwmtep    false    226            �           0    0    detalle_ventas_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE "public"."detalle_ventas_id_seq" OWNED BY "public"."detalle_ventas"."id";
          public          czjnstjfvwmtep    false    225            �            1259    12667965    failed_jobs    TABLE       CREATE TABLE "public"."failed_jobs" (
    "id" bigint NOT NULL,
    "connection" "text" NOT NULL,
    "queue" "text" NOT NULL,
    "payload" "text" NOT NULL,
    "exception" "text" NOT NULL,
    "failed_at" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
 #   DROP TABLE "public"."failed_jobs";
       public         heap    czjnstjfvwmtep    false            �            1259    12667963    failed_jobs_id_seq    SEQUENCE        CREATE SEQUENCE "public"."failed_jobs_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE "public"."failed_jobs_id_seq";
       public          czjnstjfvwmtep    false    206            �           0    0    failed_jobs_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE "public"."failed_jobs_id_seq" OWNED BY "public"."failed_jobs"."id";
          public          czjnstjfvwmtep    false    205            �            1259    12668060    ingresos    TABLE     3  CREATE TABLE "public"."ingresos" (
    "id" bigint NOT NULL,
    "proveedor_id" bigint NOT NULL,
    "usuario_id" bigint NOT NULL,
    "tipo_comprobante" character varying(20) NOT NULL,
    "serie_comprobante" character varying(7),
    "num_comprobante" character varying(10) NOT NULL,
    "fecha_hora" timestamp(0) without time zone NOT NULL,
    "impuesto" numeric(4,2) NOT NULL,
    "total" numeric(11,2) NOT NULL,
    "estado" character varying(20) NOT NULL,
    "created_at" timestamp(0) without time zone,
    "updated_at" timestamp(0) without time zone
);
     DROP TABLE "public"."ingresos";
       public         heap    czjnstjfvwmtep    false            �            1259    12668058    ingresos_id_seq    SEQUENCE     |   CREATE SEQUENCE "public"."ingresos_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE "public"."ingresos_id_seq";
       public          czjnstjfvwmtep    false    220            �           0    0    ingresos_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE "public"."ingresos_id_seq" OWNED BY "public"."ingresos"."id";
          public          czjnstjfvwmtep    false    219            �            1259    12667950 
   migrations    TABLE     �   CREATE TABLE "public"."migrations" (
    "id" integer NOT NULL,
    "migration" character varying(255) NOT NULL,
    "batch" integer NOT NULL
);
 "   DROP TABLE "public"."migrations";
       public         heap    czjnstjfvwmtep    false            �            1259    12667948    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."migrations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE "public"."migrations_id_seq";
       public          czjnstjfvwmtep    false    203            �           0    0    migrations_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE "public"."migrations_id_seq" OWNED BY "public"."migrations"."id";
          public          czjnstjfvwmtep    false    202            �            1259    12668130    notifications    TABLE     x  CREATE TABLE "public"."notifications" (
    "id" "uuid" NOT NULL,
    "type" character varying(255) NOT NULL,
    "notifiable_type" character varying(255) NOT NULL,
    "notifiable_id" bigint NOT NULL,
    "data" "text" NOT NULL,
    "read_at" timestamp(0) without time zone,
    "created_at" timestamp(0) without time zone,
    "updated_at" timestamp(0) without time zone
);
 %   DROP TABLE "public"."notifications";
       public         heap    czjnstjfvwmtep    false            �            1259    12667956    password_resets    TABLE     �   CREATE TABLE "public"."password_resets" (
    "email" character varying(255) NOT NULL,
    "token" character varying(255) NOT NULL,
    "created_at" timestamp(0) without time zone
);
 '   DROP TABLE "public"."password_resets";
       public         heap    czjnstjfvwmtep    false            �            1259    12668002    personas    TABLE     �  CREATE TABLE "public"."personas" (
    "id" bigint NOT NULL,
    "nombre" character varying(100) NOT NULL,
    "tipo_documento" character varying(20),
    "num_documento" character varying(20),
    "direccion" character varying(70),
    "telefono" character varying(20),
    "email" character varying(50),
    "created_at" timestamp(0) without time zone,
    "updated_at" timestamp(0) without time zone
);
     DROP TABLE "public"."personas";
       public         heap    czjnstjfvwmtep    false            �            1259    12668000    personas_id_seq    SEQUENCE     |   CREATE SEQUENCE "public"."personas_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE "public"."personas_id_seq";
       public          czjnstjfvwmtep    false    212            �           0    0    personas_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE "public"."personas_id_seq" OWNED BY "public"."personas"."id";
          public          czjnstjfvwmtep    false    211            �            1259    12668012    proveedores    TABLE     �   CREATE TABLE "public"."proveedores" (
    "id" bigint NOT NULL,
    "persona_id" bigint NOT NULL,
    "contacto" character varying(50),
    "telefono_contacto" character varying(50)
);
 #   DROP TABLE "public"."proveedores";
       public         heap    czjnstjfvwmtep    false            �            1259    12668010    proveedores_id_seq    SEQUENCE        CREATE SEQUENCE "public"."proveedores_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE "public"."proveedores_id_seq";
       public          czjnstjfvwmtep    false    214            �           0    0    proveedores_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE "public"."proveedores_id_seq" OWNED BY "public"."proveedores"."id";
          public          czjnstjfvwmtep    false    213            �            1259    12668025    roles    TABLE     �   CREATE TABLE "public"."roles" (
    "id" bigint NOT NULL,
    "nombre_rol" character varying(30) NOT NULL,
    "descripcion" character varying(100),
    "condicion" boolean DEFAULT true NOT NULL
);
    DROP TABLE "public"."roles";
       public         heap    czjnstjfvwmtep    false            �            1259    12668023    roles_id_seq    SEQUENCE     y   CREATE SEQUENCE "public"."roles_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE "public"."roles_id_seq";
       public          czjnstjfvwmtep    false    216            �           0    0    roles_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE "public"."roles_id_seq" OWNED BY "public"."roles"."id";
          public          czjnstjfvwmtep    false    215            �            1259    12668036    users    TABLE     <  CREATE TABLE "public"."users" (
    "id" bigint NOT NULL,
    "persona_id" bigint NOT NULL,
    "rol_id" bigint NOT NULL,
    "usuario" character varying(255) NOT NULL,
    "password" character varying(255) NOT NULL,
    "condicion_user" boolean DEFAULT true NOT NULL,
    "remember_token" character varying(100)
);
    DROP TABLE "public"."users";
       public         heap    czjnstjfvwmtep    false            �            1259    12668034    users_id_seq    SEQUENCE     y   CREATE SEQUENCE "public"."users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE "public"."users_id_seq";
       public          czjnstjfvwmtep    false    218            �           0    0    users_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE "public"."users_id_seq" OWNED BY "public"."users"."id";
          public          czjnstjfvwmtep    false    217            �            1259    12668096    ventas    TABLE     /  CREATE TABLE "public"."ventas" (
    "id" bigint NOT NULL,
    "cliente_id" bigint NOT NULL,
    "usuario_id" bigint NOT NULL,
    "tipo_comprobante" character varying(20) NOT NULL,
    "serie_comprobante" character varying(7),
    "num_comprobante" character varying(10) NOT NULL,
    "fecha_hora" timestamp(0) without time zone NOT NULL,
    "impuesto" numeric(4,2) NOT NULL,
    "total" numeric(11,2) NOT NULL,
    "estado" character varying(20) NOT NULL,
    "created_at" timestamp(0) without time zone,
    "updated_at" timestamp(0) without time zone
);
    DROP TABLE "public"."ventas";
       public         heap    czjnstjfvwmtep    false            �            1259    12668094    ventas_id_seq    SEQUENCE     z   CREATE SEQUENCE "public"."ventas_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE "public"."ventas_id_seq";
       public          czjnstjfvwmtep    false    224            �           0    0    ventas_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE "public"."ventas_id_seq" OWNED BY "public"."ventas"."id";
          public          czjnstjfvwmtep    false    223            �           2604    12667989    articulos id    DEFAULT     z   ALTER TABLE ONLY "public"."articulos" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."articulos_id_seq"'::"regclass");
 A   ALTER TABLE "public"."articulos" ALTER COLUMN "id" DROP DEFAULT;
       public          czjnstjfvwmtep    false    209    210    210            �           2604    12667980    categorias id    DEFAULT     |   ALTER TABLE ONLY "public"."categorias" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."categorias_id_seq"'::"regclass");
 B   ALTER TABLE "public"."categorias" ALTER COLUMN "id" DROP DEFAULT;
       public          czjnstjfvwmtep    false    208    207    208            �           2604    12668081    detalle_ingresos id    DEFAULT     �   ALTER TABLE ONLY "public"."detalle_ingresos" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."detalle_ingresos_id_seq"'::"regclass");
 H   ALTER TABLE "public"."detalle_ingresos" ALTER COLUMN "id" DROP DEFAULT;
       public          czjnstjfvwmtep    false    221    222    222            �           2604    12668117    detalle_ventas id    DEFAULT     �   ALTER TABLE ONLY "public"."detalle_ventas" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."detalle_ventas_id_seq"'::"regclass");
 F   ALTER TABLE "public"."detalle_ventas" ALTER COLUMN "id" DROP DEFAULT;
       public          czjnstjfvwmtep    false    225    226    226            �           2604    12667968    failed_jobs id    DEFAULT     ~   ALTER TABLE ONLY "public"."failed_jobs" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."failed_jobs_id_seq"'::"regclass");
 C   ALTER TABLE "public"."failed_jobs" ALTER COLUMN "id" DROP DEFAULT;
       public          czjnstjfvwmtep    false    205    206    206            �           2604    12668063    ingresos id    DEFAULT     x   ALTER TABLE ONLY "public"."ingresos" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."ingresos_id_seq"'::"regclass");
 @   ALTER TABLE "public"."ingresos" ALTER COLUMN "id" DROP DEFAULT;
       public          czjnstjfvwmtep    false    220    219    220            �           2604    12667953    migrations id    DEFAULT     |   ALTER TABLE ONLY "public"."migrations" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."migrations_id_seq"'::"regclass");
 B   ALTER TABLE "public"."migrations" ALTER COLUMN "id" DROP DEFAULT;
       public          czjnstjfvwmtep    false    203    202    203            �           2604    12668005    personas id    DEFAULT     x   ALTER TABLE ONLY "public"."personas" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."personas_id_seq"'::"regclass");
 @   ALTER TABLE "public"."personas" ALTER COLUMN "id" DROP DEFAULT;
       public          czjnstjfvwmtep    false    212    211    212            �           2604    12668015    proveedores id    DEFAULT     ~   ALTER TABLE ONLY "public"."proveedores" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."proveedores_id_seq"'::"regclass");
 C   ALTER TABLE "public"."proveedores" ALTER COLUMN "id" DROP DEFAULT;
       public          czjnstjfvwmtep    false    213    214    214            �           2604    12668028    roles id    DEFAULT     r   ALTER TABLE ONLY "public"."roles" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."roles_id_seq"'::"regclass");
 =   ALTER TABLE "public"."roles" ALTER COLUMN "id" DROP DEFAULT;
       public          czjnstjfvwmtep    false    216    215    216            �           2604    12668039    users id    DEFAULT     r   ALTER TABLE ONLY "public"."users" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."users_id_seq"'::"regclass");
 =   ALTER TABLE "public"."users" ALTER COLUMN "id" DROP DEFAULT;
       public          czjnstjfvwmtep    false    217    218    218            �           2604    12668099 	   ventas id    DEFAULT     t   ALTER TABLE ONLY "public"."ventas" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."ventas_id_seq"'::"regclass");
 >   ALTER TABLE "public"."ventas" ALTER COLUMN "id" DROP DEFAULT;
       public          czjnstjfvwmtep    false    224    223    224            �          0    12667986 	   articulos 
   TABLE DATA           �   COPY "public"."articulos" ("id", "categoria_id", "codigo", "nombre", "precio_venta", "stock", "descripcion", "condicion", "created_at", "updated_at") FROM stdin;
    public          czjnstjfvwmtep    false    210            �          0    12667977 
   categorias 
   TABLE DATA           p   COPY "public"."categorias" ("id", "nombre", "descripcion", "condicion", "created_at", "updated_at") FROM stdin;
    public          czjnstjfvwmtep    false    208            �          0    12668078    detalle_ingresos 
   TABLE DATA           g   COPY "public"."detalle_ingresos" ("id", "ingreso_id", "articulo_id", "cantidad", "precio") FROM stdin;
    public          czjnstjfvwmtep    false    222            �          0    12668114    detalle_ventas 
   TABLE DATA           p   COPY "public"."detalle_ventas" ("id", "venta_id", "articulo_id", "cantidad", "precio", "descuento") FROM stdin;
    public          czjnstjfvwmtep    false    226            �          0    12667965    failed_jobs 
   TABLE DATA           k   COPY "public"."failed_jobs" ("id", "connection", "queue", "payload", "exception", "failed_at") FROM stdin;
    public          czjnstjfvwmtep    false    206            �          0    12668060    ingresos 
   TABLE DATA           �   COPY "public"."ingresos" ("id", "proveedor_id", "usuario_id", "tipo_comprobante", "serie_comprobante", "num_comprobante", "fecha_hora", "impuesto", "total", "estado", "created_at", "updated_at") FROM stdin;
    public          czjnstjfvwmtep    false    220            �          0    12667950 
   migrations 
   TABLE DATA           D   COPY "public"."migrations" ("id", "migration", "batch") FROM stdin;
    public          czjnstjfvwmtep    false    203            �          0    12668130    notifications 
   TABLE DATA           �   COPY "public"."notifications" ("id", "type", "notifiable_type", "notifiable_id", "data", "read_at", "created_at", "updated_at") FROM stdin;
    public          czjnstjfvwmtep    false    227            �          0    12667956    password_resets 
   TABLE DATA           M   COPY "public"."password_resets" ("email", "token", "created_at") FROM stdin;
    public          czjnstjfvwmtep    false    204            �          0    12668002    personas 
   TABLE DATA           �   COPY "public"."personas" ("id", "nombre", "tipo_documento", "num_documento", "direccion", "telefono", "email", "created_at", "updated_at") FROM stdin;
    public          czjnstjfvwmtep    false    212            �          0    12668012    proveedores 
   TABLE DATA           ^   COPY "public"."proveedores" ("id", "persona_id", "contacto", "telefono_contacto") FROM stdin;
    public          czjnstjfvwmtep    false    214            �          0    12668025    roles 
   TABLE DATA           S   COPY "public"."roles" ("id", "nombre_rol", "descripcion", "condicion") FROM stdin;
    public          czjnstjfvwmtep    false    216            �          0    12668036    users 
   TABLE DATA           |   COPY "public"."users" ("id", "persona_id", "rol_id", "usuario", "password", "condicion_user", "remember_token") FROM stdin;
    public          czjnstjfvwmtep    false    218            �          0    12668096    ventas 
   TABLE DATA           �   COPY "public"."ventas" ("id", "cliente_id", "usuario_id", "tipo_comprobante", "serie_comprobante", "num_comprobante", "fecha_hora", "impuesto", "total", "estado", "created_at", "updated_at") FROM stdin;
    public          czjnstjfvwmtep    false    224            �           0    0    articulos_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('"public"."articulos_id_seq"', 98, true);
          public          czjnstjfvwmtep    false    209            �           0    0    categorias_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('"public"."categorias_id_seq"', 4, true);
          public          czjnstjfvwmtep    false    207            �           0    0    detalle_ingresos_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('"public"."detalle_ingresos_id_seq"', 7, true);
          public          czjnstjfvwmtep    false    221            �           0    0    detalle_ventas_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('"public"."detalle_ventas_id_seq"', 605, true);
          public          czjnstjfvwmtep    false    225            �           0    0    failed_jobs_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('"public"."failed_jobs_id_seq"', 1, false);
          public          czjnstjfvwmtep    false    205            �           0    0    ingresos_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('"public"."ingresos_id_seq"', 84, true);
          public          czjnstjfvwmtep    false    219            �           0    0    migrations_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('"public"."migrations_id_seq"', 13, true);
          public          czjnstjfvwmtep    false    202            �           0    0    personas_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('"public"."personas_id_seq"', 15, true);
          public          czjnstjfvwmtep    false    211            �           0    0    proveedores_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('"public"."proveedores_id_seq"', 7, true);
          public          czjnstjfvwmtep    false    213            �           0    0    roles_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('"public"."roles_id_seq"', 1, true);
          public          czjnstjfvwmtep    false    215            �           0    0    users_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('"public"."users_id_seq"', 5, true);
          public          czjnstjfvwmtep    false    217            �           0    0    ventas_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('"public"."ventas_id_seq"', 410, true);
          public          czjnstjfvwmtep    false    223            �           2606    12667999 !   articulos articulos_nombre_unique 
   CONSTRAINT     f   ALTER TABLE ONLY "public"."articulos"
    ADD CONSTRAINT "articulos_nombre_unique" UNIQUE ("nombre");
 Q   ALTER TABLE ONLY "public"."articulos" DROP CONSTRAINT "articulos_nombre_unique";
       public            czjnstjfvwmtep    false    210            �           2606    12667992    articulos articulos_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY "public"."articulos"
    ADD CONSTRAINT "articulos_pkey" PRIMARY KEY ("id");
 H   ALTER TABLE ONLY "public"."articulos" DROP CONSTRAINT "articulos_pkey";
       public            czjnstjfvwmtep    false    210            �           2606    12667983    categorias categorias_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY "public"."categorias"
    ADD CONSTRAINT "categorias_pkey" PRIMARY KEY ("id");
 J   ALTER TABLE ONLY "public"."categorias" DROP CONSTRAINT "categorias_pkey";
       public            czjnstjfvwmtep    false    208            �           2606    12668083 &   detalle_ingresos detalle_ingresos_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY "public"."detalle_ingresos"
    ADD CONSTRAINT "detalle_ingresos_pkey" PRIMARY KEY ("id");
 V   ALTER TABLE ONLY "public"."detalle_ingresos" DROP CONSTRAINT "detalle_ingresos_pkey";
       public            czjnstjfvwmtep    false    222            �           2606    12668119 "   detalle_ventas detalle_ventas_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY "public"."detalle_ventas"
    ADD CONSTRAINT "detalle_ventas_pkey" PRIMARY KEY ("id");
 R   ALTER TABLE ONLY "public"."detalle_ventas" DROP CONSTRAINT "detalle_ventas_pkey";
       public            czjnstjfvwmtep    false    226            �           2606    12667974    failed_jobs failed_jobs_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY "public"."failed_jobs"
    ADD CONSTRAINT "failed_jobs_pkey" PRIMARY KEY ("id");
 L   ALTER TABLE ONLY "public"."failed_jobs" DROP CONSTRAINT "failed_jobs_pkey";
       public            czjnstjfvwmtep    false    206            �           2606    12668065    ingresos ingresos_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY "public"."ingresos"
    ADD CONSTRAINT "ingresos_pkey" PRIMARY KEY ("id");
 F   ALTER TABLE ONLY "public"."ingresos" DROP CONSTRAINT "ingresos_pkey";
       public            czjnstjfvwmtep    false    220            �           2606    12667955    migrations migrations_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY "public"."migrations"
    ADD CONSTRAINT "migrations_pkey" PRIMARY KEY ("id");
 J   ALTER TABLE ONLY "public"."migrations" DROP CONSTRAINT "migrations_pkey";
       public            czjnstjfvwmtep    false    203            �           2606    12668138     notifications notifications_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY "public"."notifications"
    ADD CONSTRAINT "notifications_pkey" PRIMARY KEY ("id");
 P   ALTER TABLE ONLY "public"."notifications" DROP CONSTRAINT "notifications_pkey";
       public            czjnstjfvwmtep    false    227            �           2606    12668009    personas personas_nombre_unique 
   CONSTRAINT     d   ALTER TABLE ONLY "public"."personas"
    ADD CONSTRAINT "personas_nombre_unique" UNIQUE ("nombre");
 O   ALTER TABLE ONLY "public"."personas" DROP CONSTRAINT "personas_nombre_unique";
       public            czjnstjfvwmtep    false    212            �           2606    12668007    personas personas_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY "public"."personas"
    ADD CONSTRAINT "personas_pkey" PRIMARY KEY ("id");
 F   ALTER TABLE ONLY "public"."personas" DROP CONSTRAINT "personas_pkey";
       public            czjnstjfvwmtep    false    212            �           2606    12668017    proveedores proveedores_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY "public"."proveedores"
    ADD CONSTRAINT "proveedores_pkey" PRIMARY KEY ("id");
 L   ALTER TABLE ONLY "public"."proveedores" DROP CONSTRAINT "proveedores_pkey";
       public            czjnstjfvwmtep    false    214            �           2606    12668033    roles roles_nombre_rol_unique 
   CONSTRAINT     f   ALTER TABLE ONLY "public"."roles"
    ADD CONSTRAINT "roles_nombre_rol_unique" UNIQUE ("nombre_rol");
 M   ALTER TABLE ONLY "public"."roles" DROP CONSTRAINT "roles_nombre_rol_unique";
       public            czjnstjfvwmtep    false    216            �           2606    12668031    roles roles_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY "public"."roles"
    ADD CONSTRAINT "roles_pkey" PRIMARY KEY ("id");
 @   ALTER TABLE ONLY "public"."roles" DROP CONSTRAINT "roles_pkey";
       public            czjnstjfvwmtep    false    216            �           2606    12668045    users users_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");
 @   ALTER TABLE ONLY "public"."users" DROP CONSTRAINT "users_pkey";
       public            czjnstjfvwmtep    false    218            �           2606    12668057    users users_usuario_unique 
   CONSTRAINT     `   ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_usuario_unique" UNIQUE ("usuario");
 J   ALTER TABLE ONLY "public"."users" DROP CONSTRAINT "users_usuario_unique";
       public            czjnstjfvwmtep    false    218            �           2606    12668101    ventas ventas_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY "public"."ventas"
    ADD CONSTRAINT "ventas_pkey" PRIMARY KEY ("id");
 B   ALTER TABLE ONLY "public"."ventas" DROP CONSTRAINT "ventas_pkey";
       public            czjnstjfvwmtep    false    224            �           1259    12668136 1   notifications_notifiable_type_notifiable_id_index    INDEX     �   CREATE INDEX "notifications_notifiable_type_notifiable_id_index" ON "public"."notifications" USING "btree" ("notifiable_type", "notifiable_id");
 I   DROP INDEX "public"."notifications_notifiable_type_notifiable_id_index";
       public            czjnstjfvwmtep    false    227    227            �           1259    12667962    password_resets_email_index    INDEX     b   CREATE INDEX "password_resets_email_index" ON "public"."password_resets" USING "btree" ("email");
 3   DROP INDEX "public"."password_resets_email_index";
       public            czjnstjfvwmtep    false    204            �           2606    12667993 (   articulos articulos_categoria_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."articulos"
    ADD CONSTRAINT "articulos_categoria_id_foreign" FOREIGN KEY ("categoria_id") REFERENCES "public"."categorias"("id");
 X   ALTER TABLE ONLY "public"."articulos" DROP CONSTRAINT "articulos_categoria_id_foreign";
       public          czjnstjfvwmtep    false    210    3804    208                       2606    12668089 5   detalle_ingresos detalle_ingresos_articulo_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."detalle_ingresos"
    ADD CONSTRAINT "detalle_ingresos_articulo_id_foreign" FOREIGN KEY ("articulo_id") REFERENCES "public"."articulos"("id");
 e   ALTER TABLE ONLY "public"."detalle_ingresos" DROP CONSTRAINT "detalle_ingresos_articulo_id_foreign";
       public          czjnstjfvwmtep    false    222    3808    210                        2606    12668084 4   detalle_ingresos detalle_ingresos_ingreso_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."detalle_ingresos"
    ADD CONSTRAINT "detalle_ingresos_ingreso_id_foreign" FOREIGN KEY ("ingreso_id") REFERENCES "public"."ingresos"("id") ON DELETE CASCADE;
 d   ALTER TABLE ONLY "public"."detalle_ingresos" DROP CONSTRAINT "detalle_ingresos_ingreso_id_foreign";
       public          czjnstjfvwmtep    false    220    3824    222                       2606    12668125 1   detalle_ventas detalle_ventas_articulo_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."detalle_ventas"
    ADD CONSTRAINT "detalle_ventas_articulo_id_foreign" FOREIGN KEY ("articulo_id") REFERENCES "public"."articulos"("id");
 a   ALTER TABLE ONLY "public"."detalle_ventas" DROP CONSTRAINT "detalle_ventas_articulo_id_foreign";
       public          czjnstjfvwmtep    false    3808    226    210                       2606    12668120 .   detalle_ventas detalle_ventas_venta_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."detalle_ventas"
    ADD CONSTRAINT "detalle_ventas_venta_id_foreign" FOREIGN KEY ("venta_id") REFERENCES "public"."ventas"("id") ON DELETE CASCADE;
 ^   ALTER TABLE ONLY "public"."detalle_ventas" DROP CONSTRAINT "detalle_ventas_venta_id_foreign";
       public          czjnstjfvwmtep    false    226    224    3828            �           2606    12668066 &   ingresos ingresos_proveedor_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."ingresos"
    ADD CONSTRAINT "ingresos_proveedor_id_foreign" FOREIGN KEY ("proveedor_id") REFERENCES "public"."proveedores"("id");
 V   ALTER TABLE ONLY "public"."ingresos" DROP CONSTRAINT "ingresos_proveedor_id_foreign";
       public          czjnstjfvwmtep    false    220    214    3814            �           2606    12668071 $   ingresos ingresos_usuario_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."ingresos"
    ADD CONSTRAINT "ingresos_usuario_id_foreign" FOREIGN KEY ("usuario_id") REFERENCES "public"."users"("id");
 T   ALTER TABLE ONLY "public"."ingresos" DROP CONSTRAINT "ingresos_usuario_id_foreign";
       public          czjnstjfvwmtep    false    220    218    3820            �           2606    12668018 *   proveedores proveedores_persona_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."proveedores"
    ADD CONSTRAINT "proveedores_persona_id_foreign" FOREIGN KEY ("persona_id") REFERENCES "public"."personas"("id");
 Z   ALTER TABLE ONLY "public"."proveedores" DROP CONSTRAINT "proveedores_persona_id_foreign";
       public          czjnstjfvwmtep    false    212    3812    214            �           2606    12668046    users users_persona_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_persona_id_foreign" FOREIGN KEY ("persona_id") REFERENCES "public"."personas"("id");
 N   ALTER TABLE ONLY "public"."users" DROP CONSTRAINT "users_persona_id_foreign";
       public          czjnstjfvwmtep    false    3812    218    212            �           2606    12668051    users users_rol_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_rol_id_foreign" FOREIGN KEY ("rol_id") REFERENCES "public"."roles"("id");
 J   ALTER TABLE ONLY "public"."users" DROP CONSTRAINT "users_rol_id_foreign";
       public          czjnstjfvwmtep    false    218    216    3818                       2606    12668102     ventas ventas_cliente_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."ventas"
    ADD CONSTRAINT "ventas_cliente_id_foreign" FOREIGN KEY ("cliente_id") REFERENCES "public"."personas"("id");
 P   ALTER TABLE ONLY "public"."ventas" DROP CONSTRAINT "ventas_cliente_id_foreign";
       public          czjnstjfvwmtep    false    224    3812    212                       2606    12668107     ventas ventas_usuario_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."ventas"
    ADD CONSTRAINT "ventas_usuario_id_foreign" FOREIGN KEY ("usuario_id") REFERENCES "public"."users"("id");
 P   ALTER TABLE ONLY "public"."ventas" DROP CONSTRAINT "ventas_usuario_id_foreign";
       public          czjnstjfvwmtep    false    218    3820    224            �   �  x��XIr�F<w���W4��HGPvhaH<�A64�13[���1g���3>9�k���j�	#�6�C�W�Z)��W|�(��(��h�F�D���B��7��o�PJZMq��m�$_ڧr�d��B��s$|�����R眑��@Z]�	v��)���p�TP:�m�j�)��Ʋ�U�R�,ק�x�r*������c�ҵ��C�xzv�2����Z�$�����l���z�GѮ��a�-+�.,�T��[$��ǩ�\��T�:/��3��yq�Իߧ��&
�r��&S�Q�x��'$��u������y$}���tJܴ�c�ON�Z�k��^&Ѿ0�\&]&�P։���f� ��}NI�� n��JjFf{���N�m�UǶۗ�M�|��C�/��+;�FQ�3�4p��,CY*��ۮ�V�]9V�o��O~��b��pJf�#qW6Mu,�mW�^��OyCns���.6�
����)q��h��2��&������]�e�DE�*�Z!��[&sKI'n��v��oG,�a��|H�o�0n�:�(�>1����Α3�˥a��|����Z ��]
���u�;�>�b ��Ǵ_�l�]�f=U('�b/޵MC�A�h"� 6�f�W9'�N[z_�q:Z݅�藒��L��R3O*�o��k����MN���k����(���s��ݷ�~.�i��b4�����qϱ0|��e��.�m���q���8�^A�,
�ӧC��RΠ����gB
�Q4_ge�xkЫ�J�}��%/=����躧s�h�%�/5o�
���K����A�y˞����P�9u� -NZd�8���q����`y�4eex��
�U�g��d).Y�(��{Թ��@�`ˡlOi;��9r�+):H�]!�Є��<9�m��Y6�D��x�o�׀�9�k$�ĖB����A{	���n�)��@�������sK�vM�Q���<I�e*B����;N���j��7ϑR�߽�SF�����C��x����}8��(-��k�u	5̞���v�Sy}�f�o9r˙!���i%�i����H�����U4�XM؅�|��]WU{a��̑Y�-��q4G � ,�X�ąh�0g���0l �_�W�SBF~p�fƥ�/T`�O���~����S�̩]\}�4�Tڋ�f�t���N��K���t��ؿp��k�\�\F�d��2���ZQ��Q����XK�j�F��V�B"�0�mH���G�Oe�E�9���Y��A7�{����G��2E��9��c�dS�"&\j!�T����`HҲ"�|fK�ǥ��#��}��f\k��;V��vf�P��D)��"ua�W��}��b���/����ص7�}D0\T`#��M���:��5�q��"-9w;Ҕ��*��y��QH��/��)�ݖJ=sW:.�>x
*�tLe�h�y���2́Wz_W�yq�e�m<t9�5ƈ��xl���(l�w���<�G9\w����(�ːr�'��i�%�C� �A �9�v�-���!�r�r��2 ެ�M�:������SW�#�m��gj#�#h7KYI�x���v҄�^:mՂ�5�LedΘ� ș�w��
�z��>�h6���b�و��3Q����`A�a"�V�-=�nr7��q��5F8$��XL� ���HNm8(ns��Ȝg��:N�es	n�/�v��9�&�M���6���K��qQ���Y��?Ɓ��_�0���������6)G��o�F�7�R�^��a�6z�8Η��B9t/�M6,u9�D��h���Ɛ[mXЅ��ŇH���gZ<��������\��K���x�U&P5��8�f����p�����s���CV!.mh���Ҽ9����i�>��Dt�\�~��PI��w���j�~��*PN��X�Ҵg�1��_�����g����ߥ`��ñj��\�<A�xu���?I)�r	�a      �   �   x�u�A
�0F���)r��?��	��kO�M�E�B��ׅ��~�x���v�7Nt'��<�A-��X�_n�2~U���h1�L���J�<���|,8C1$��븮��eۥ�I1��۲Gqҙ���Á��l�/�      �   P   x�]�A�0D��p3P
�.���6.ܾ�E.�aq�b(�md�@i�"�8��w�����q��|1P��'�t"r�~�      �   �  x�m�[��E�]��� �}I��Mq��F�#���y!MdNy�xV������}��?�������S{�~J{�)����?i�~�m��ٯ?.���������O��=��.��/ڳ�����>��{�O�t[^>���c�W�v��,�}�m�T�����V��ߎ��{��GT?o�L����B��c��g������/>i�f�����{Y��wL�g�����wL�H/iL������z�%�ǰ��y�����j��ӻ�7���Ȼ1ܮ}��m��{|��x�sy��!�qY����l��<Y�.}X���A�E��������Ĭ7-]��Y~��y!���R��aݮ��w>oV�z������a�7��1��;�����݄y�5o�MXw��gm�p� C6���{�'���z*��^ �ޖp�Τw�f۔��u��V��K.�}ҭ�!W=������7�+��6��{��}�r��`��m���E"NĖ�Q���9��
���	ƌ�y%����;v<����7��Y�~����*����|w�<S|]�Lo������#��gvs���$���a'�&C0�O;���z�yjh1��:\�w1�%z`���h��<�̔7���R�0"��fk"�;g���N����'�ͤ,�|����}CŬ��7�Yo�)ޜ��n!���������۽�����w���yG6(߭2�*7��!��څo	���$��N x�~�5���d����Tf�w���mB�;ċ��h%�?0j
D�2:GMs�2�p=H�x ȫKwI����-0�XOh*�ėД�و�SEp�̞�<�@����p<�� U()�BT� �W+�b%��C#!dw�%�%`%��ߣ�x��K�%c�K��"���C�W�?
�5��sE��"\���y�F�+�()]�(��a�����[
����/d��r�}��K��+f��2��
��w/#O��%tX!��p*��} J��	ӹ �'�/�1���
����c�^K�#y��;��G��l�I.Q<��,��$P�D9���\UI���x;�2?��U�����/��<k*eE��?�*.y[�Er��z��L���G]"/?��<�Z6�w%���(y��QO��1p���muP$*�؛+��	őb��f0�#�k�#���.'( y�,��C56B�^N������ϡ��Ĉ뇐��^O��Nr�E�SC�so�oS��QDc=��L����dXz�N�bV��2.�\�#ۿ�&1q(i`�PR��� ��awc�(��e&!D-���%Ey�FHO�?7��m1�-����TQ���#v۷E��9�T�?�nIhG�7��>��t^o��p�
(S���V��Ug?z�a�RL+��X)���q�RL+��Q+��Jy��J-�l�zu��ο��#$�u���ڄ��=�%��+Q*�V��ʒ�}XL���S-�T�0����'�<!+�~(yQ(%U��j����N������Qҹ��z��W��~�h"�׆�T�� �J�HUTk� Sm�%�r� �jg8�W{=Bv7Q���L |ŅN5��J�5��Y=x�gb��_L�x��b2"8����� BU��r�1Q�BT��R�0�Iu0{u~��ً#W3��߲-
���ġ^�|g����� �+B�H�j�*�VG>�������:�=S�rRFn*�O ��zC�K��LN�0�T�f��d� �|c�!�*Mm=��-��%�?��{\l���b��|�([����J`�����W���`62��϶�@�ӟ�F(��k��V��eV��P���:��Qw���Ā>Uy6�����}]}�����`�CIhe0_��о9��>�t�1�ϕ|�2���`��?����g����6�a��qT�kԀ_{� ?����'���m�PD[n���_��;���ӤO��cp��>Z�}��uuO��$�������l_��Fˈc�B^e�o�/��B��l���Nf��$,2�O��Q��Ҏ���c���AC�0��G�L�o,�m��!.�7�3�7VfI����x�����M�d�)��`���N��"�ɠ�Y���qć����r���*߀��������Z|��� b�2G� @
Ib��(铤A�S��0"�)� �>- 8U�� @��	N�C��J��4ٗ!�����<C��ק��l|>Zʖ ���s+\#y�g�����ǀ�UT����U�T�eA�0�Rߖ\�۽���Ro�R�<��f ����k��Tu��c�8O�PV&$�)B��P��\��d�ڢVb ���	�2ʀ����g�* n��A�m"�@���}���`S O�:���7 ��	�A�[��ʺo�p�`���=��R����;�2s/�4�,�aڴ3E�76�u���F�[�9��/7@{���-�V0�� �
A��?Efje%���!�P������ee��d���Gȳ�\UT�lܤ+�2� ܢV��#��S���U���Re��(y�΀VTɪ9ZQ7��3`(i6*3E�Rjn��U�m6��Ͱ�_~�����1��G����lL�ssk5ˑ�1{U�iN�6rI�9�1$G�6B����o}�*hx��k���@U�9�q'_䓳;{vM'�8�W�}�u�Js3�WiGɶ� ZU�S�J��ϣ�ư�Zξ��@��Q�"ީ��˗v^I���}�&���ALl&g@bJ��+2ms�&���G�&s%��f΀���C��x֜9��w�(��v�l͉	F.�5nʘ\�����Ky��G���w��%W���[M�1К�w�蚃��h�B�|��&h� ����ԝ�c4�!|�Z�y�1�s�0�c`�`��5u1��z�&PU��1����1�*��=BQ�a��mc����9�q�M�'��#�+�o	!_-v☜��|����Bȷ��@�|u�~����|�]1U�O)��>B��Nf�j);�Ն�p`W	�����^�{|�7�t8��z�v�DI��������!��ՠɵT	sk�TU&� E�T����	�&J^�-1ĭ�	z.�q���\��� tHP�:$8�5!�!RW���W�: 8�� ���!�yȮiB���j��8�w����	Φ�Id����<>�[`��~�]��*luPpʿ� U1�C��tHpN9d毾uPp.5���$�.zv@p.�3 �)]\���!�%�$D��P�Ҁ���F}[[���O�h�(��s��K\v��R���K��:(��U�
r�r������
���Rk	��ϼǵ���J\[��.EAܯ8�w@p�#o�8�v8p�8��.�w0P^��`�ա@yӲC�[;�nZv p��nq��7uѱ*�b�nq���VW�:��&� ���V� :6.�۱��mGɁ��Hq-���Em�����kgC8S�I�z�������(�i���}"!�p'y��8^��<^�n͏׎"Z� �?����âǟ�<�f��?���/��p�      �      x������ � �      �   �   x���A�0EםSp�̴�i�\�!j�+��;�JT!��}�cJ�3d�y|����dd�	k�
1~��&mp����z�?ǡ�<�0��و�ԁ��+�q^�Z����lbɕ:��8��P�D/�îNY=zb�v��9������t^��>��Bb7㹜_�1�G!z�;��:��:����3���	���S�g�����71��p      �   �   x�m��n� �s�06���2ɢ�[1�0�^�� ������6�̤FBC����Į0}��bZ)q撩�[��G��f��?���W���ƵpT�	�@P3��Y1y״��$���.�<Clxl������9�u�f')�`gS|1�Q��|�5���LO1tpnМ���RD��e�����rv��36�W..��B�B2=*SOx�V�a �(8���{Dy/P�}G�X���m������0�#8�      �      x�̽ˮ,;�8.���7>�H�iؓ���O!)�P�)�%��{���;^��'£���M�����h\�h��K�n(����K2�G���6���?�ۿ�������e�����o������S�����/��/�_���z�����������1���������o����;������3��_���/��������/�zkl4��f��.ܮ�ﶾ[z����VC���ѽI#0K��]9��V�2o}�p�3�gӒK�
���'S8���>�i���������������������?�_��_��o����"d��`�-�%;(Wc+᧴f�t�����;Wg�O�)��ρ��_N���9�w�s��p���>�]��-Y�K�ŐH���fr�����(�sK�H��B��M��u+6e�4��Y�d'���l%V�;��W�1�ֶ�1�.Ӆ�r����#.��2�b�6pc�����9�����/=(�����o	���6p��?��wK���lj�0��?R��Њ����;fX0�=������b�5�N�%k�8x��ӏ�l��n�8a}�D��l*@}qFf��Sop�qwYx��o��Fq뻥�p�F3�9�L֚�q'I�y����o֫=S�Y���>��Hd�j�3�L������%�c�?>���_�뿏�_9#������w��༵��T�h]L�	p�/���d����ʓ����p]��p�<;��b�V��c�9e��f�^�� 8�'��-�U�)���D#�zS��^��؎� �7���R���̘Q���F"���Q�);�@wINk�Ke�%J�ə�
[��������Q�ߎ>�_�@?S����m��d�d|���c����3$���0�*�>ެ9�pv뻅k�e�n��[+�����*�>Cx2��� ��@~�+�z�[kK�90��X!#㨦$�C�\�:� Ԏt��7tSC�Z[8��'�3H~s��*�Li��4&��a�7�~�n��Z� p�_!����F;�.��T{��u��d�f�����E�4!�ܱ�]��Mm�Y�r+ݖQ��t�Ϡ�s�C�W��wK���%2�����Xo�o��=�=��5���M��7HM.��Z�I)7ǣ����V�ON[kˬ�e%�>d��7��i�}r�C�>O���A�����y��P�7q��Dܲ���C�p��<f�{���f����w���J
�t��5,dr��S�@y8�����K��xH��o֘T2bC7�!9j������UD�}h��Yee%U#����t���Xُ�?�{"�v�δ95��`9iV�l
�@�A������ך�X��ΡO�
�jc�sX0b*�p.��"��X��B.p��8�߈}jf��(���bG#Cv{�4�i�8(�ѐ@�]s�5[�-1�<�o�3��PISk��i���=���ߒ&���CX��'���ݛ@��H�l�cU?�-�V�u�:`s�/+��֖�-��v���Yk�/�}�X���X}��\
�Ӷ�U����퀑��7�^\�XNl�M��v�኷]�w�=����
HC6����<A2Kw�#;�������ϡ2�d��J9�Q����Pe�.������!B������B`��g�T�eCe8��q��:����򇵗�^@���wK�,>a�q���'�-�L���Ӻ��Hqk]�{��-���S�p=�Qㄽw�Ltbk	~&ڃ����������y-~��^�th��q�yWԡBxՁ_�(G�+e���z���}A��]�����-��]��S؜��[0���<C٣^�~ˎ��[j%Ω@�����v �H�.�=���n^�06���1�֖i�p��	Ezz/�j��8y��U�{bS�L4n�?�l�-�����_C��XA�F"� �uq�i��/�����.�2��-ΧDq:�p�E�3B2F�0u����E�6�˰���I��Kn��
Xq�އ���W����J���̬%u�C��^��B�0������/�����&Vd�H���Ͱb<c��P�a�1�f����^hqh;�h5!ǌ���4*.��HG����q��Ҵ����xjD��u��,�>�G����W����?����NW�������U`�⎚��dܫ#�P�:��8���5����� ��ї�]���u����=D?w����-:��o�x��t�[|l��k��5�\���|ĕ0ܜ{^�_�?�g�V��]�C� i�f���S��0,�]OC�Bs���Hjm�SB�)�Iﴁ?��Q�ѷ=q×���_�3w.���L�Z�0ؐ�E\����^���O|�O<)!m}�O��\2���Q���7��(�;>�~p�n�T\8��������bm��aC�F�@��w�0�X��#��%�\'�J���N�n�@O=����zwyMe��\稰�^�q����m��>X����<��,8R?�����������yL�na�g��+л6 ��i-9����{������w�Y�&��{ԌR��5��*�C��Q�@�4i�߱�;���-.�4�E
���7Ѕ�y��])��W����,����	�8�G��2E_w�O����T[���H\+~ ���9�q6B �("�����ǫz�/�䶾[j��>d5���x][��������8H.��5H�j.�3J��:���h..��E����Y%�_�{�Z[b��#'3sO��P��c� �lx���T+w�rF�[kK(�>��\����+��jL���Kߗh�k	1_[z-�o=ۅ���S��C����Vİ��d�Yx�����Bo�"s�D�{�T�F�� ���\(M�-Q�{NQT��w�����-��"�����q�����`���^E�o���]��}�]����[|��G;A��Ǭ�ʥl�!� ��*��>��_�	��9.&���Z]飁(�G�c�\�C��Q���^[$�i�>Y ]�@�&�<���e�QT ��N�Er�����-�������A���i��P������o��7��]�^C� aF4��"v����<�T����ڂ�6*Ğ���R��W�)���|�q��5��w�i�ʍ:��M3A���8����G��{(�]��נ��ړ�m6x�ɚB��7�d��8��{JG�ߥOJr��pZ�+�n)�`:5�����߂3-Irܽ����-��>�����iή��w��8x���>)6�h��tD.��i�B��v�n�0��7�4J�[7��R�08�����d�(*����;˹�n�����UX�F��d&��}�5�#^�~����i�]I�eӊR��:l��E&������z��BoK�Y�� ���xJ��^ٺ������N\�J�M��w���x:k�ݩ�m��$*5H��O�����Y��<{mQ`/�U}eƩ� �-��s�/>�7�@V��!�B�������g�a�^�<�C��r����Ӛ�
���[R�ɉXȉ��#�A;�(�)��@�k2��"�d�h�Z[��>Su����q �P�4�◦�\��A��p���#9�&��Z��LU�8�*-��|���(�����ʥD�Z���m�F*�F�j`�d������ �*��etg(���u<p��d��I_�|�<��:8��ϋX��6�������EӶǰ�4�9����ɌR���.e�k�A����I��Z	���5^�T�L�|Ǵ� ���5��Ӝ�k���wK��(AH'�	fA�Q�yZ�<{���6��ū����Er��4�9��wl��91'��/uϋ���@����$C�b���~<��0[{u�ɍ���S���M�{�ך"XAMN�m�����[?CpZ�Xsq��46�ɮT\�=�
R<	n8�_�-�+���}/�ࠩ��&&�:�s��zDT��o��x�]���n�S+Z�]�YJT��TZg����G�~���#(~-j�t�o�ep��p`�%4�Z[�ྋ����g��B�Ky����*֧����K�k����� ���~KI    ��X�Z.��*Z}��Nհ���st�j�������o�����6p6�1h?��ֈ��9���=�'����W\[S�s������������HӲ�D֤/�B��Uy/������p��/�}����i���q���!���#G#�5���:yk�l��'6@�%�a���GWq>]�B[@E�3�j�u$�yl��%͐:��礑���$�Q�L�歍����U]�/���W:k�V~�i}�
�U�C�ç��&M�*P��@���N�C���x^���o0��+ �� ��5&�Ϛ�H��)���x�֖�a .û4��*WӸ��N� ���@��t���Ջ�����2� 3�k�c����*X|�ۗ���������Rr͞]3J�ȫ�%�ib�.Z)��QQ����_��_�}��_}�$��h���/gS���lC:͠z����e�7�wX��S*$� -�ԗ�΂��@��gs����n��̙pH{ōں��+إ��U`���=7o�FJW����B�F1��357H#e����J'�+o���	��~o�-�Sp�n�80i�E�5�����������s�{�~��:�����C�3��j�*��M���r�c��S�/_����Z ��h�5�/�K-;�f�����쩱x�+��|���_\��1SwN^\2�#%����#r?~�~��ЧY%f��{��t�j
kC.���pxb��?�~��B[���q��/&GF��,��r�yE��`����6�^r0���qZY�����I֞�E㏢���/���"��0]x��A]�6T�����D�_����Ѓ)�l��^��N�����\���hW���o��z�fk�=�X��c�e"���F�#�	8=�V\��;-�@J�7�^�o�${:-������Y{���H�X�ӄ�PNm�$u�
�#݄���h�IϻmO���٪�r���`(>Oq�S�l�ȗ
±�һ˼+���y������Dl���c)��4±m��#�YG��k^��Y�O�^[���e��މ����X�8��3��	���a����{��J��[ӷĦ͗��\����V�ϑƲ��A�r���7��)ڕt4�:���ktmWOԧfR~�񷟼���J��2&��/g���;9|�R���^��߭�赞B'�èֺj6ː�����yO�X�lZ��Ƶ!}2�U쾷ʂ;~Np������Kv��OY�q��r��	�Z�:L��S�����e
?�~����"3����v�K�����$�E���[�V�����Yy0�
�AIs[zv�Mc��#ߎ~#�wB�����$��	�C��`� �t����o��>O�^{���Ƃ;�T�g�^z ���햳�����l/>��ǷA���s�B�J����x�~+�>k�6M��������u�Gf����o��[O���}i��*W�p=��w����y=�?����.U���*��J5T�WǡB����%y�>l"_�4���AN�z3�W&b��~B��?l߹��f3�h�R��T۝a�T���v�o=qM�1�y�a���SZu� ����%�5�ܳ�_��G����1�o��J�8��I߹+Ժ>O	��� �?(����Ol&����U�&����O������FLnW�ѳo���K�`��r6~h�K c�d��p�I���/{v��]��5z�cx[�G;�h�!g�\n��3Ү�O���ҁ�9��,N�hO��C��:J�s�g�A���~JZ�T�����Ҭ��K���g�_y�e�<i:�jx�۪���^�h;cڳ$i{0�
�rD�Ѯq�FW�{s�3��ђ��������ydC�iWv��_��P.�5�>�4P�#OVG����?�^6+�0���[���9do�:��dT��v5yz��7�V�}��Mw�`坘��[��ir��7�签7�/SräYm��h�dH��--;����_􋹕^�j�L�2��Qq��,���;��]���c���i�H�?g7�Y2��ŤO��e�����8�v�(Vsu'<P�`onv���\v=:�`���<������|j���Ŵm�pO޵V�Oo�l5������&���D:pe�f\�\����CZB~�ʛ�~��j�rqPV�� ˷�T�����S����ԑUV�3Jg�����E�aդ�i��a!�R51�Q-{�Qi���_?]�g�F˸jsYS��Zj�i�֛Y����A�<t�>�l�_{�ε����{ۊ+�'5��鬎c�Nײ�涾[��	��K�Q�4a�' qrB�=(�w��>�y��5��		�@�I�̍��Pp�js�����mǯ�5��~�d]�-#g;���H89��(�e���\�Q�nD��Kt�5�ߦ�Ҁ���Q�a�i���k��3';|vlw�1<���_��Vb*�u-M���88L����y�M3�@��rrjmBc�̽/���e�i�zE�j��'4w��r��p��{lv�^�j~������Ծ��*nwv��"|v���dʹ�T�jWML��?f���=�A}�~�������`����C&8��[�d�LQ��z�g��c7sB�[ny�h�:MN:�疬v�&��xP�������m�o��+��n@i�����})�2���ʘ�xqZ�O��:+z�������'f/�Y�n�i��G4�܉��"V��=�c����� ��m�K�9̙�DD~�}���-���n�r�����Ƭ�����Q҆a֖n!A�j��O��qN֜�|���l���Wl���mjsXY��͑U�v�D�#z��r��V-�`�-�6��ZmUd��J���v�T��#�#�V�m��ѧ�f�ԍ+V�M6�2���}�k�5{��?l�5�ϵ�r��;ǌ�����b뼖�NA���a)�ם����v��#�D�ڍ��VL*�������z�G�o�K6 o2���~;:c�ER�;.���C�A?D�t�L_��fM��d���hg�{n�#����x��>^q&����M�-�#P��m�	t����O�$��J�um�G)�c�����s�MԌ�l��M]�me�6�����􅺞����c�dMɽs����j>���%�K&�b�: &���k0���X�Xs)�]E��l��N���iOܛ>��vwW����������B�0厛Gg�'WN��=�D.�:���]���ڒ��i�=s�:d���@�ƗѻM\Ʈ��O+�)q�kP����aJ�r �í��0��������A!���2X�Vm?�����,���w���v��rB_f�P�8s1���	��l5sڬ��\ݕ��g�>P袃�t�nt�[ �x��c{ y�~��}�o"C�9�4l�Ygf#V�9���᾿i��O7�t��omUVz65�f�ʳ��<��ԭ���(��L���vH���LyR�l_<��������-)9�6�'M�%e�:=$¢k�Q�k��t3}���?�[�@P�4ah��hO/��m�L���lj� ���|��hg���ҧH�Н���З���)�%��[{*0��Fߘ�g�k�:�mľ�_�~6(���o��	}�&p��qd=l���u:K�ͷ]7�k
��x�wk�a;������u�N4w�j�I�uO$�5��n�3zm�������v���:'��U���w7�z�#7��w����a�Y��ƲkH�K��ߤ�{�%�l���k$�@�֚`� �^ʁ�#An��>h�~�H<���mPƭ0~LJS���C��[��~��^[HZkB�4�T�e��݌�u�\��]��?��F�]D�lvq���8s�Jm�lM�R��A�T(6w(��.���owv][���*�O���'�Y\I��]-~͈O�B�	�X�[�/��i���Y�FJ�A��49���H��D�9�7�96���;�̑��r,�g]ͱ�����SK�K��\�k{�����d�S+j�H�Ȍ���l|;�{��B_��Sm�X��C"��C߃@r����Gj�V����m��k��b&�$������/�;��E���պ�T����c�����	�?u"J���x,�=�    p3��km�&��Cau*a3�����kҶ�G����ִ��dK�8V�G:J��
���؏�j����um�.ͥ!����!�Z�Up��m����ـ���xֵ�߶-��um4�\��)��·?�>`�m��ֵ%M_�k��� lwM�՚�U�
H��w�;�t���^[F�:�LK��l�$u��\���+��܍��KQc��5X��KV��Ԋ����+��S�x��?�%�ƙ@�TQ#�됇��/I� V�˂���2�:�����TM�ެ��"��� �v���W�	�Ţ�=��9��U�髽�<�
�����|�u��
�!^�hR^�9��uN�q^?�w*��C��c&m���_*���'�[��z���Kv��c��ҩ67�>c�BV !�$}��l�UQ��w��w���r�	~n���s1�Wβ��H�	��/��C�:)�ש.i�ak��:�JJ��y�;����I�-{�E�� �����J���-�X�1�;v��3SA��&;�'I�Z�:XصK������9?2എ��f��Y_,ɀ��9AƮ��/	�n�W�azQ�����#h6�4,%��pEvݶ�A�q_��W���ur#��@ȝJ�}����?u_m�߸�N�-,α�B�$���
�R�����%��u_}�>�Ց�3��-訳*��x��z��נ߸�N�t6�|(�����v{�g�z�o�ٺ�N�W�pb,X<����1���馝u��|����붏�u�p���9�f���[	���T[����,�:����M����B�蠅)Ʈy��A�q_}���S�S������b|l=� �io~ߚ����ɶ������J����S,����}���-�S;�j\�9����@��������0�p1���ާ$�J�m.h�s��o�i��#i���F7Я�-��4| ��^t�ň�/�8!�������,l]�3��&i������rbG!ɫ�Y܁ew����B-ƨE���к�b
�nT ��$���f���{���-��.AE6�J%E���(�f:����{C�B�̇v��ME�ڷ��iC�;+'��p���{�.��p����29thU�6K� ?2�c��ޟ����c␲�+��8;�!
���ލ����^����,���c`J��t�9�����.&�ܼd~�-����d��V��̓�f�*���	��c���@���[�gH4��v%�A��&�Q��a��k�t�@��\�(c�*�>i�҂��k�.�����������r�_x)��J����;cIG�X�xV��l�����[߭s���ZD��t�JMͱ�>��5�i6���kw>!�A��H�i��xc#n���t�
�_�f�e9_i6�k��9������o�Aݴrt�2�����-�>]3.N[O��9����30.�]�^��q��_�VZ`�o�N�� )�p~�pCU��}Y�/I�z�^�	ZvV���C���ݵ���9-A�y��'A��:�'�3�23x��n���f�N�k���B帰׃S{�$�[��2}�_m1�7���f��5U`��մ:�ọ����Aή�7��.�s��z�x
��A�����kk����r���0[!���"��y����:�ָ��Uı�ZWP5M�y��r�gM��7�¯��U�\"�j�)�ַ��՚���ɂ�ꋵ�g+�i�[/��lU%���T���Z���j�d�Z[��L��CW��,T}?��ԫ�����6o��O�`.)qa��I8��8:���jjcb��跬���`1� L�7
�ukŃ\������r _��5��.k^��@ʠ(d?���Q�����N�f;�F�I���R��%e�i^|�3�;������D_�04�L��m ��q4H�/hW��?�����mV=l}�d	��k$�
��S;�zfMd{츋jQs�V�)��Z[��!2Ԫ��,�b��xx��q��	|�� ����B�C_p"��V�sg3�ŕôOlQ�C����e���k��w��"�W1�5�fj�E��zO���k_�q8m�t��弶�9}�V�՛�X�W�v@U�E�4�u��u��=���%��t2E4�삶��C���;�ׇ����#�-ۨ��5E����f��9�
}WIɓ���ήk*�fa87Zz� ���R���<�����	X�Y��Hq8HL+��<�/=��{|u�;�ti=�-Қ�e�~-��j?�`|�!�J������NL���$m�3�V6��ȯ	��6܄�x�(�����U��ym�g��Ұ:ZUV� <Ɇ8j�U2��������/�7��[�][Y��Sp-O�9����Wy �E����
��À��8��"f���q�k9j^���`~w�?�[�&�VRKԇ��FZ���S�9OwT�������޺��q��{(���Gt3um�ߏ
�=DЃ|��g5�5g�D�-~�)�!�xT��c����&��b_K�e*%��p 6ݖ>����}}�F_��A��h�r��%`�}�ݦ8�ʰ{����}�}�}�c^��id�NW�Z��[�qW%ǳ�o�F.��i�t��m��=iq��Dե[��C���B#��=48���������\���J��k��K�߄F.гMu+��4�0��ɱ�Z�Q�Ae�<������ۿ�M*:��AG�ӵt����a����ٹ�[�`뻥ږJJ�Z��L��N�'�Y[x^H���-�p�ogO6��u�Ǘ��K4�J+yD��U�?@��N�U�)U3^�Ht�����-��H-|��^}�~�ɚٵ��Aؗ	'$�F2���ݖ��tN�c)��2��*Zl��j�p�)��C�G��{��N��8�)������H�a�2|i�"��$�?����зP\u��(W(ZK�5%_@/�ݹ=�E�C�[L��{+�bQ'GhNu�Fj�O*��>��� �V��=��1fӊ&r���ڢ3�D5�0W��R�<n�zmaZ[�ӵބ���p7��x�8'��G��|��꼶��R㬕mZ��F���l&��K��K;�:XZ����ō:�6k%�k�F���^�m/��w����kKv�\�!C�U����v�n9�d�՘�`}���w���7s���3I�:��oF�M�Ӿ��������a��kK$}�����,9v]��~��cW���ou���V�|�-ڢr���XH����չ�����Ȝ�X����'8o�FPm����@��P���Ӯ����u�����b+�s݌��r�\�B��Q�/,���}X����um� S�e#Y���r��,Z�C����Nw~M�Ϸf� X#�{�y Y�zH�ܛ@�FH�k��3����[��ڒZ'[�7vj����aM��:2�ٚ���_+Z�v��>ז ����aj�^sFl���ٔ�-�O!U|^[&����i��Ks��j*Z�;���QE��}П�Z!FMLϚ?4�$55Ҕ!�&�~�ʏ{�-C�B/>h ۛd�jI'�k�0G��ݛ�~�L~��C�e���U�J-
���+g_zx��Ȗ��r�N��jfՆ�>0O�/Nq���o�4_�)��k&�Nk��&�T �B�dS��棼����m��p��b.����|N�&���>��ݛ�G������c��v��vD����>v�7�Hv�$ꗠ���ߧV#�������ԡc�� :r'zb�?�~K�|�}��M$Ue����H53�r�^��^>~?ɂZ�1�m̚���yq~�������~K���])@?J�S��7șوR��͖��~�o����	�_ςs6�PI��w����ӷ�t�W�Ⱥf�NP_	�@9ߛH����~�q�>W����1� �iB�h��cNo}|����������5P9���ж!С��Y��������o�Y?-�F�u�j�UO����`5X����y�%��7i�����I��p7�r��C��;�Mގ��J���xv�n�H1t�$56�)�{��ʱ�Be�W-
�kK̬���֞V�3�7N&��	u    ����-O�	9[[*�fj����O�Y��6�]�^�~[~��͘f��l�p1I�&E�Ѳ���z�>@�-?߾�Hų�#V%=i�Z1c��?��ԗ����o�%��M!r�@_�v�J��)�q�o~=����CZ���Z�FԊ�,'���/��B���~&K��Ɉ|�w�5 8&�7���<��L��25��8��)�3gu��:�����kΥ�L&4}�p��&�rfIC������跥ԧϱ$C{.�o���{�s`:D`����Ur��R��r�H&8�6���f���I5���5�E)_���!�>�&bv6��:ߩ��7"�p�id�BG5�x�~CJ}fM4�j�H��N��� ��.����81���=#�R���'�K�t4�]�h�Q����t��}���c~����FͰ\��f�V�S55�p�V?��L��꯵�Q�6Xh���k����e���{;!�B2�)u�?!,K���j7s-����Ŝe�r��y|�١Z:"%���u���R�/q�[Q�OR& \�i^k��Ft�Ĥ�Fau��g�9��݊�umq}�$k�����ܲ��G�K�殁�����^No����i���Zi)�E�`��m���
-}X����Ukt��t:�J����g�XR�>���B��z^[F`���L����a$e�1�y�������D�u�4;��.��5�e�4�tB������إ�^���P���;�N5��\M%f��A������;����l|wZ�m-�q��Lq�,�_7s���vkmq3p^{W��v8�bC��P�PB��j��k��T���O�_�[�֧�V��\��-�÷T;B���i��(���7�0dX��Qu�K�ZkC�囶�~�k
�����=I,Iee-x����J�dw��}���ۻ�kmQ��C$�4�c%���Φs�j�c���q�;�����>2Yxkˢ�ڼcV6\��fO��o=Q|�I�c�@ {E'�jL��nA
�I�9o��~km�>�A^U�N9�lʚ/� {Uy�VT��c�q=�ط�i��O�p����2؈=.�� ������R��o0}hQp�:��&㣈�X�<B�q&O�u�_a�(Iթ�ڃ@�PH���D�����gK0�=h�� ���;��jЮ���~�-���k�ymɣM��-Ng�8�u�L�I�ˮ*�_��*�j���~��D�f��C+9��!���]+���Э�xkmq.����JU7M���a�f��Z����,�j)���뻥vG�y1���E'��D�R�Ǭ���!�'��A���R୥$u�N;��b���4筃O�Џ
�>@�a���s�Y� 0Y�k8��/5��3ّS;Jo�ߺI/�;� '0���.�:$��ꁘH:�čyT�C�77�z���:׮�V�W�I��ʘ�?�P�1����mM��	T�b�Ģ�Y$�ŷ�ڭ��r�3�K1�rf(p4�|����f,�Xy��F/_�O������J;qC�㴯$�(ث.h�҇�[k�l)@!{Z�+aaS��	�V�圎lR�[�������_kzٯS6������&���O]��]�^�-sZʪ�skid�����E��ȩ��.js�[3Xז�Yn���ћF�^J �N�e?@�qW@�kK���4	B��̦P�f����M1��Bu�@�#���PuBmڱ,�l���@��J�{>�-C�F�B-!�Z��������^p���a����9�o�8�%�6L�~�ԓz;������(�������|�y�3�͞d�\��k����ϣ+A#���vo���w9�LozԞ��\��G�J���=*k�������hAa��"@?�Π��fp8N��w	����Մ`��n#:������G��F���i��2W�������f��#v�{���4,��lm'�z黊�^����|�����a�%j�$[q��0��u�ϡW�[������ď�9�G��� �U�6��؜�(&��ڛF��p�e�*3ÛW�/�A�姶�v�<j8���L&<�-	z�t���T�d�Ɉ��dr=�]�5� ��*�伶@*6^��M�9T�q�:>̓����؝%��^���-(h�5bVJ2` �F}[��v������ .�#�kˬ5�8d�7���Eӛf���J8���z����BE���h�����U�I "d7{d.	N���k��г������a����kiW������������������������
���?���|w��:҄���(�ѹ��rK:��Z��T웲�OW��k��.��97�@��8�槴�g��y����k}�,�F/�7�X�:�`o���sG3�\z��Ӯ�����q�r��֖V:���&]�-�|0��4��C�V-T�֖���t��뚋����.�
Ք�p��|�+r^[b�])�a�NU;([7��������Yͪ���B�=�_�-��}T��Aur��^B�q��S;*4� ���|�g:`�O:��Li�&�:0O��"7�ߝ�o���9��5B��L�`D�ԾZֶ���� ����F`7:�Z��i�"�k��[z=H�qTK����n�o�n��A,��Q35�dx�taL��a����%R��{����ͨA�J�F��=�2�(�f���g�	��I���Z�M����i?�}�C�w��}�ަQ��I��m�������b�=���%v�;p����5�0  �Sn]�Jǿ��n��o��%r�2��j�P��P}��I���v#�p��Ũ]������:]B�����~+�si� ����X�mh��'Kj-$ێ��zFW���.Q�YD3kV�)��]4�{�	;94��-${5?ἶ�<��J��>��=ܤ)���J�����bE�ϡigBw`M�n�hO�b�������6/�o��T��KIU>.�ܴ�A�6�ޕ߫Y3p��Z[J��$%�{Ѧj(��V�Z�=Ew�:j�W!�-���h{�@�W�ڱ�L�xU	��h���@%�.k�������+�F�d@Opً�0��j�8 =���!�@�a�c1��:�
���3뼥jkɇ�?@wH/���B,���X��n�ѵ�Wl��u�����K��RX���v*=���{�ڋ��D/@'�/ЇԳ03�a	 )&W���}�]%ģF�>D#�/Ѓ�û���5�7�0�u�2󨐩�����ɼK�cS'�/PE[�x}�,���N�Nܭ���� ��̻�9��L˄���W����Q��
�?`���y�GqF��r���qm=����Ǯ��/@'��>Q���x5:VrMZ%}���f�y'�.ѓLP��_���'��K�u\d��v<@'�.�[h�E�y{�\3�)݇ZϽ�s�d��]�}��:VI�x����n\O3f7�P�N&��r^[��T�Pp�̛SG�2.Y�.:f>2'2�]8��v^[4b7J�&M�A��Z��}'g�N�X�wE��k�l�r���բC۾�iR�\}c)Gv�_Uܵ�5�ͬmu�q���$0���CO��7r�B|�2h][����.@�Eh����)j�T(���%��?�8n����2��ve�[�?j,�:�a�����PN��N���I��@��'�+�.yߏ�6}�~�L~�����h��Vd���˳�s���y����\#ͨf�ƉB��i�-D�B��<^��4�;�n)�϶�y�Ԋ���taWc�g�����|][쬎�c8��j2��:w��$�?��7MXf�Z[��&U�������7;X�T�C��]�n�sm��$v6�-ri�J�Г]tey��3�_�M�kK�~�/=�`�krt�4��>��9�iq}N�W�)�kK�5�j��Ɵ]�Ū�k�f7*��g�E� ��t뻥��[�|��	�ߵ�,E�8����� ���|��û&�N�i�V�:�,i+��8yu�k�F&��~�1��V�_	ES�On��|`T|����Bϩř5%�iw�Rj���\\>    ՟���M�^�m����=p�T;4g2�L����.&��n�֚f�wYSm���F� exF��wS������ym����eJA#�t���ͷ�|?�EK\kq������8j<(f���6$��y�p��Ii"�ЛF�%�U����"�&8k2Y��i�14���saWv�E������:uW>�~o�~�
t�^�*�R!8W���s�G��u�C��.�ז����>u��ũu�_���s$>0��V�EW�r^[j�!M�\�К�a�66q�c_�<���V ok�/������Q�M}-�WŢ�}8k�ꄞ�~ˣ\�!�;�Tv\���|FW�6�E���ڬm��wޗ�S���i��hCGW���~һ����{�hV\�I�a���\�Ek{�-�<����;*~�^�*k�U��I9S�+&t�{�^�yj���zo�裟I*�X���K!�L)�y���|�ٮyF���U�M#�����e�	����Q������b��a#Q;}w#R�8�)����c�S���}��5vZ�1t����ȸ��`����`�W��9�iq��lZ����WK�鴕q�ժ�G��}OӶ��d��rF �Jnd���T���]\�}��m�V�a����u4]�MPي+_>�z���6a@j�p7�jY{Y��67��Aj�]\�r�)psC��5��pt��co����]��~E�g�W9_���b���Jrd�i�i2�Y�:Z#Dۺ���QA����z�Țb+fN�� �M�op�Yx�w5�}6�-{��K6LgJ�qR���UcqB鰦V����K�iO^X���WS�O�A�buT�n�=��@<��y�1u�V�Cý�L�#��ģ1��%��@OP�}}��S��F45�5h�c�s�_;�ټ��@g;v�@$�����l�1Q^���_\�PN�4gV�rj�R0��\{���ཅT��~^[�Zm_IG:�QL��`1�2��H�z����`o/7�A���lC���2�9����Z���,�%�%�]����ٸ�o�I�k��gC�h��N��C��$׽;6N���Kq^�{��$a�A/\�s�&p{�݈��Ni��Cx���R}.v2i�Wt�]����s@�=1������2c��V�����g:bܵ�Z����f��?����r˃j6p�I�"��p!U�Ʉi��?����"Yj�B�T3��i2+���%Ǚڮ��_{jhf����rp��B׀�T5��4$~�NnW�����_F~km	4S����ę�T�Qc��]g�ڮ����J��&�󵶸ɔ��1i�E��Z�ge �����lqo�-3{?,$�g���hJ�PS�I>�����;��ׯ��u���I��� ����HC�k�3�j�\�Z[\XĲ�Т��@u0K_A$H���
�)��Z[@�#@�Z�Tpk�Z��hlݘ��Ƕ��ykm�V����6[�6p]�B�9�Fw��~
X���%097UpւKJΈ�&L=b�F�m+޼f|�-�Aw�s�u."�љAu��bm�eW}곣[�vqY<G�3��o�Z0ٌ�,��ȼ���K���sT�����2�a��d��A8��v�~gdq�۝�����v5�ir1�õU[M�*��+/�%��.�o�����͠��΄��M�&e��[c��w��r�PҞ2um�/NXuor��j��woӥsL:}pfh_Q�\X�6'�"AV�����L/}����@��# {���Xc�>������߉��S�c�} ЙgSs��7ӕ�c�"�^��z��-F{y7�Lz[ͨϏd�v���:l��?B��^f����8贱��?�␭����%�[!��|�9�L֨�+�gU+'�h~D�wf�lE�.���f��tBg*O��d�u��l��@��Ge�=�>H�uh���۬|�ս}�oB�Wvo�'Kf�|��L�5�N&n5Dۣ�׿_)�o�;�|�n	��b}3�i�VM@�Q��H��F͇���1dm����C�u�8s^�8�r��8��g�G�z�^�m��^� �NY�j@��u<6��O	��
�������;؈�7m�<���9 ��$
s�Ձߧ������@<�ø��x���&��H���η�-~��;�Ŕ��'C��L�[�0w�������m*�5��,'em0���^_��l�w��}�����S�U����s�Ճ��7k��_�Op�o�6r�Q5S��Q����Q�n�����]�Ŧ^�s�c6���3�����Q��d��1�K��bNM�����G� ���*��a3���{'�@��;A�<���N:�9��v<��������eֆ+Ѓ�X���PN�!.�\�.�ە1�%<�u�������@��`�3EMN�n(��ֆ�f5>l�W�.�k��kGV��8X�l��L���x���
��孵e��[���H@w���BS8`�epH|,ب9jי�_kK��N��(�gO4/����@�ݱ�CQ��^���-�B�Ҝc����1�i�r$�p���^�\[Pu.㳙̨b��N�"����;�h��aW�57���A'�k]���RUM�.��?+�n�}�i��.i��Y(w\p������u��:جT�:�����p���ͬ]ʚ�S�f�VB��w%��2Xp���Y�ז܄��l|��H�1��-����n9tg�>@|�-�&�b��N]Ug+�zcg��a��X�5�b�I㺶�\2k�� ��sZwӪ�򏊓��v�@���� ��k�<{���[e2���?ny����R�i(ߍ�3u�'z�Ŕ� �ɂ���G��ݙ�F_s`�Մ��%������sb�@��;#�����Zb�N�wN3����	8�VF�0*�5T��7n�o�ՇQKVؕ�g�Z��g��lS����ƥ~~%S�)���Zg��*ym������wVlm�s���|�����oY�eɍ��W�q��!���֖�x�h&��4�F_/��~dUe����ʔ$^�	�(�l�@ �\Y5�/�>��6����w�����o�-�U,xp)�=uE���@�,@����)+������Z+(�G�Φ�r1���{��:?Bh0�V�"R@gQ���t,����wr�MWH��IT!;�m���7���G��⎜����g��h��N�b���4�������~���{B7{S��l?f��Q;qR�%hS��/��;ms����$ax5t��.\w�߃�~���s�����.n8e�ʺzr��DT�%H	s��_h��,���5L>��#G�J(l��V؍��v��M*n�}���p�Η*�o$r�	��2�O{���0��L��#;0�JU�*��L�whw�{$��+	��<V���z���`��ӚI\�}^��g��A�ﳥ�y.)�璅��Y��٘r��b�t��.��/.O�J�E�1�*k�
�3D�i�m_���O��sJ���	4���7��f�E{z��c�|�l��\��0��)ooٙ�"�R�:<cN����b��X���83<ʪ�9/у
ad8�8ŝ�{�5������(Ƅ�T�3��	6+�ʛS&w����������krJ���b�h��f��SC����b��-�����V"�~�t8ȈkP����R��ǿ�l�}-�׉՚��1���d[�
�PG�[�?�����4���[j�T�u��/����{�>>�.�p�>g8Q6:�Voq����=��[��	�׊B�ǡS�}mN�����k�I�F��so���dUk=�*�K5��uE��Cν���;��~�̪8_U	��"p��B���j���c��)�<g�s`
e:����l�o���j�lӇ:���RڿpO����b�)�Mv����g\�]l>�(�1�	��^���l�vJ���Dh)2����g�Aի>�~,��i�8[J�ƯW��Ƌ��J�G�a�v���w��l�Cb�5��m�7=��$k�zߋn'�x���]���ْ}������/:eBuv���`����?ΖӨ!r���s��0Ոwo    ��C�7'v�WE��$�Q�qv��<̀��L�����+�gE$�-��b�A(����5QBV�M�Y�,�z�l�i���c����*��)����ZsN�劣Ϛv�?���\-��%�c��S:� k:[��`�)������#G7�R���5�펯�=�Dꡑ�7�M^�ɵ��v���bC��άGS6a5�h��7~�o��'zP� �M,�H�A-��	������t-��4_��:$v䆽��-%u�°=�C��ނ�9��/��	�o����8�C0�! ]l�{��}�!�5���J���G��mm�����[�?Sկb'�� )A��/���Zf4 ��Sf�j��Y�'z�E7-���Ԕ�c�e�w��-��{�{e�O���
��Y5�Z�<+9LD*uվ��s�&�I~�)���8��Y��jHc�x��3�~׸���:���ߞX9���f�81�<�+�Ә=�25+�I)�CV]��\��F���&��	��fg�ف������Қ��CV�#����>=���l�hFF�G�5�)c���f|t�gKr��$ԫ�K\�I%��QZ �/�i'��W|(#�-� �w��$�32TxJY��k�?���?�g�/���-!䠋8ḍ�VNW�?�z��NQ�s�d�*����S}DTq
�s��TS	8�) �a����q��~G�O{g�aAOu.�s�R3�]M�����}(	��/��6r�-mX���t\��˺�.�j�����^�Ĺn�{g�w	��Ul�D��l� g#�C�>����Go��X����UE�c{}�����ÿ���
�cie��J/- ����#G(	�5�D8��Y}��w[����g�j��*\^j�4;��'���}x��sK�Ԡ ��o5 L��u��p�E�X��C���zU��u
����L��s�g�/y���8�E?Z+�N�z^':.lZ��Rwj���I�����'���,Es\7O�/����gJie��������З)�BU_�E�Bg�T��H)���}q����bD���,T�3��+2��\���C�oA_���{�<f��>��� �HU�<k~������Z\�]�Η6N�g�lTM�v�s?�9�A�T��澴��s6?�Ӧd�Pu���}�0g���v�����Q�-z3)����N{R5rv��}�1����@�jlя�pjpn��]�*M�1�<�8�x\��1	ݢ/Q[W@/+eWn!l5U4��)w�.�������)�!����׺��z�z���+H��	VC���y�lA�<q�9%�~�l@�i*\]�b�Ij��c�F��v_��<[��58;�;�%������J=�����/����e�ß��ƱM�C�]#�V}6Xr��w�ȐX"��W��	�"΁����S�q�@f��;[�(��n��L�9�%����%��F}^�'�wt�đ�f�������7Qj$G>�('d�B�h(w�
�K�57�ȸĺ�ᆵ��ɣ�m�{��w߾�����v!�f��Є/��o����]��Hd�|��Gj��z���l�"xEf#�]�cjQh��P�b ��CJ�]�UN�~����~S�ǐ�)��7Z$D9	�|�R|0�k}���F�C�jxv�H��R�UnË���x�Cf�Ћ7Q{�,{M
`	8����H鱫�OdvS��Ē��HZ$y�6y5p\H�:}^!�<UVC�{g�wf�o��5:
?�<�}�l�1���Sn����;[���u�d7��]P���)Z��8,����ْ<n Eoʜ�'F��/0FL�]��M�?��=�}�-ɂTe6ⶱ��6����ؕb�������z��9��S2��w�#DVkT4%{���Z'[����z��d�9�j�%���"�2�eL�'��݀�yy�w��K�(�����D�$<����-����	x�^���ْ��IjS:��#<l�����IR�{e�W�?�Ѹ�-(E��s*������ �ٵ���}��Z�`w���q�Gګ�`5S�ya��՝�*��[vC���.�J.�|Z������蟽����%p���̹g��֔c��v��=��'z����Ljp:'9r`�)o�:�>#_��3�D/HڛZ�Z��b_yHUsZ�~�c�}���B�<e�"<f����=˜F�~���g��(��UR���=v��vJU0AP*�i�9���My��J�7�V[��(m�1[DnY��/ÜҥY·���|�O����PSS�<u���#[��`;s�CʞoA�TI�B?[Hڐ+v�4�RtVR�7HuF�����o�0sa��군�RXYF����Hp���ߒ2�nR������MH���pI���>u��F���V��T��V�����t ���-�`)]mE�v�v;u�9[�C�S��΅����R���G���(�/f����6z��g������H�[A֡�xk�u�Ŵ��m罒�>�����٢g��h��������m*r��y�,�k��}�l�
~��ҧ��!��5��{Xg�J|�u�R䴶�/T�\�)/���%�)2lQ������wS�����Z�
�S^�A_W��j�=Y��������~���h���.4�CeȳjQ�Ү�w��>���gf��>h��y�Rv:F�%>��8����B巠�,6���lz��D�N���'�n�M�_�����5���b��K7q��9mـRfW��آ����_N�(�����iG�΁��Uܕ�2!���L
H��h%��P�ϖ�K��4�+��I"��m��<�����/�Ζ�D�-�U�Lq1g�����u�Y'o��V�ps� 7��p�v����j�N�`�柃5�+Y�;[��0���9K��X����X
:���'�R1T�-Y�P�k��E�l9#b|ݏz^���S����mΖ��o�	#���(���rP�0Xku8$���`ݺw/�9�ﳥ�)��K4�@�� @�f�0���5��m����bj@�j�j���b)҃|kN=z�ٟ9�E`�*_۴��lAH��;�c�^�E��!۞�J��<���udn^���;09f�A���d�
U�B�<�#��Q�-���%�9%�4��� �EjI1"<�i�1`;�}n0��%Rzv��$n�E���`!��no��_Z�Ζ�|߳��j�q}(x�!EN Fw^��o�qo �X\A������?�Ԡ��ҡ<���&�3a�l��Z�eYu�q�TT�C�Sh:�����x��FP��=[p����\bzU��Jk����f�?{K:��-2��2:e����i�v��[�a��$��س�-�쐅��-)�����L�e$�ypM�?�9$	g5�핊�eS*��Ĵ�[�sٜPE��}j��\߀�Ɂl�;j������O���i9^#�������_����-��{s)R��4P��qI��nR�)��Z��}Xܠ�A�9VX���+]��'Q;Ě��?0�z��~���ܹm��
c�X�s�}v������}뽈CR=<g�:RARv��ڦ>Խ��O�z�~�ԭq��R�|Q&�e����jעJa6�7A���K�V���s�Y��}�K��lq{k%�kU�<��P4�}FO0�K�~�>�As�.FG�hpU;�� UK�z��+=�^)l��OɉZ��\�>���T�nsH?m��%����)x.i�n6|GG���n�x��ôg��|{x���� "i�q�Q�O(Z����C'�'>�;~j�V�;[<r�b@
[�]�Y_TM��:�<����O�?��J������������������1����Cd��O����_��������0>��ۏ��� �l,�*T��㳃2���2��p��̷���~,�|�!۫�7�T����s�P�͸W�����o��ݢ���"�5|B�x�9��U۰�6�{dR:��������4�>[fJ	)\Ȉi�D�ikcn��''��+0�Ž�����;�Wv�N�ǜe�"�άW���n���R������<�$������e����s������	�;U    _�O!�Jё�fn'V���9�w��d���F�=��6;%�l�St-'F���Cnf�Ζ4*���2���#gЌ�Tվ�<*��s��:��m��>��J�d q�	�z�Osr:֑D|gG�u�?o��lΖ����QE�Y�ՖA"d�٦���,�O��_]����S]peO�L�6l�y@>�]ȳ���`gK�v�i&Ϋ��O��(��<�6�1'�߀��ﳅ+׃��@��pTU:�AM�����[��w���IG h�h�V����\���fO|��<v�l��8\��|����?�0���"�G��\?��<p�ϳE��S�pB䔪t
�Ŭ�a���H�[���v�-[Gr�Ǎ8[ބSfRj���p���t:��ܶ�vv��b���y�)�o/9L}~��#��8�-�e	�0��w���yZ5���=g{֚�W�B�}�;�%*N����T	�+$`p�����;��j
d�J���T'�R���$�>ƕO{Dtk�ɖ�#s�4o���[5���!�K�0{�[�)��q��a_M�Ǥu�}�	�����{�O��}I%�n8�@�bҫFQBgt��W�N�2�z�*Rp*�A.�ܘ6\QEO;�dE�r�E�mѽ�imw�6n"s6���Όтv]Zt��lom�J�ʹ�Mf�?@��gaI�2��¶�����Ma�ʊ��b�s��8���﹖�}��9��3g�:7��0�� ���
��n�ޜ-��](򞱶t��Gp4PI�H���T���r���}��Zf�г�s��N7`�⽤C�V?��e��l��3�['d$����T�*�n�z����s��/�w���g�,�͆-%I�B�P%�j}����=�Dj���n�ϖJu��O�����u�*�C�rY��l`A2���?�`�Q��A�Nm��^>PVVp�f;N�`��ø��ْF	0�Jׅ�Wl�`"��9ƹ_ְ%�����2ӛҕ��5�zSQzj�ל�����ҷ���R�u (�uL����g�!��ծ���@x���w�pBN�&�/b���M{F�g����|�/� �*�r����1 �,���á�oA�|'���ؐu��)��{���\�}�z�=���޶l�%�\ǝ%f�!8�9�Du�n�+�����~��;����I8��U	Ѫ:r��xAs-�������%�B#�t�)Lo���!%W�i[@^��O[����N��}���ϱp� ����?K��5�{��M~��hU�XUᵪ2��P�܉?�.�蟲�m�͚:"��-��e��\�� ���\\.|.���*�ȸ�F���1�	I�O>ÜڌKG��^$�z���ȼ�i+=�v�(��o2� ���^��=[���ڌ_��2�r2n-��(�Ī����&.�±Fǹb���L�gѡ{m���Tö\�Rp��������&\�Om��.�M�v��Zd�>W��r�~���٪�Ev�a�Ν.!q߫�4m��9�ᣃ^���%P����$ۚb��D�_��ݠ�#��l1\v�Pk�,��K|s�J��R���-�)��U ׸�!�����Ҫ���IB¼��1�N!IXݦ��P�7?|�\~b��
l�����|��睔2U�eJ�hc��)�S�zZ�C����̰�ۋ*�ed��Y/�w-њC�F?��-�]�������6���Pzh�6�CmIhā��~����b&�@E;�FT�z�֓�֞�İ����|��S�'�?j�+�o�\X�L�.��C��o@�w'?я�cmPP��3��9GKH���k?�*�H�D[>���$��O��`#���#�����`�<���gK�Sz@��"�$P��XnD�]�E>�v`k(�;[bֈ`�|��t����<f�����vp�)��قD�%�R5�Ն'ɞufr>��e�*nv�L�ϖl3��� 68�c��s��{wbU|����}��X��
�\Y���^�e(��r���`-�s�d{s�p�T����
}�#BǕf^��e�O�+0g���3g=+_�g��ʿ�bDp��Lٓ�6�G��8����0�!�f��a���R:�&�O���ْ�z�nS�H��^k�B (WD`_♣R+0��mk���b��)��zD�dsJ��m�Gsc�U�#I��w//���-RQ�H7�4f�Z�Y9�krv��|V��%�gC�D_G�u���%�[�N�W0i�a�J:�/ނ��N~�O&:�3�Z��A��V�����kHg5D�@�����}(Qb,�$����(3	+
b�>+Ay��9�|�׭�I}�Y�Ư�ڶ�=��ɗ�-g/�}{$�]k�l����=�UH[f0����j�|���?}���N�|�F.�p��B)s���� r۳��{�����۷Pt��I3 	�a�R8�u/MҔCo@��l�˴w�($,�{��#O��n�Eܕ�v/۠7�Ƣ��]�#�wF��1]�CmIoA���nc����5(��s�vߢ�����3�é�&�Ry�lɶ'ƭ��a( 9`��U�&��x�����{gK/�($%�Q��R�f2�\D�xb�Z\���_��-���,=�%aH��5vc���!	�?{�א��e��jDlׁ;\kU �!��2f;�����l�q��y�J�v����"�(�0�$I�!�����y�-��X[�5%b���QvD3G��ŉ�jq�/q{g������]\eO��@{�e�ۗ���Ǜ�&�	;�����f�9 Iϭ���Sb5dT�g�9�r���*�k��s�D�;���9���5Q��A��K�!�J0��?��-�6��`�q�[5f�,r��RJ�uP����G�����䦾9���A���#̰#�Z����/δ)��rX�d�/9�j
�cO{Cz}k����7�`�����L5k�7����O=�e�7�v����+�����é��R`��kn`���������ew��4�U���6��)�j�ё�]�����.�d�7�֤��[��@ZoL��[�=�{{7ΰ�kg�Ʃj�g�c`�s}���g9��介�}���<��p�\A6��HneZ��C��?�)�je�l�3���b��̶6A�`Y=L ��9�*�#`��3��ْt�bu���e�V�ȶڬ�!�=,�E�;[���T`s5�Xc�����C��]X�����?~n�`�ޏ����v��~|�پ�}�W�6�O��1ut�x��`�k^a���͢��]���N~��=�P�������{�|z4Rؽ�������'zf2���p@��|�r�$#�������o�>���q�C�U��sݯYk�av!�s7` X�{��>[���A�-���=XBtњ�\ֶs�/y����R��HYx=:v]��\>YX��1�6�����i϶��FZ�@��Мb���mC�y.��l���X��-��}Uv.�|.5k�]Ϝ�]�d��G>�-`k��y�K=�w"q)�8]MN��䶭��-�o�SF�l#�_uM��J����@�	���;{g>_4nrVv]
Ϛ���ktI�,��`��(���l���uE�>��]�����S��S������6��Q�Q3��d�XS���:��`^C�5�}f�jH�hJ�b��:�lUέ�ъ�>Z�*{o@�����K�!��;Ɛ<y���(;���������̷������Ty4MT�:)�l��������G�rg9�'�kP���U-<
�f�n�,>
{�{�Eo��9�I�1]�i
	�I|�Ї�V߀�1N�-,�����#u�Ld�NT�Q��炜�Z��}��R6ڳk�!Â�4�J��R�=������r��C� �]x�KLqD��¡��[����o?��Iz1�nnFD�f�Ep#Rҧ����9[@Pj�#(ϑS�m�[�dFc��zL��'�z���w���P�{52��5_Qk�J_l�6%jՑ} ��lai�k����*��܅��-�/)�x�z�0�P��<[Z�;1*])O�CE�U�25pe^��85�擑}(h|�-A[[i ��!��j)�I��͂�rX#��Dܶ n�?g2    d5d���
�WAC��&	��p�5����w��fSuV�(�AOv�rUWrv�>l8/��ß|�Q�9C���^T��H���l�����2҉��0��6�9[�"����,���*�!�����Q�sw(��E��;���	ܔ�*��g�I��+����������?����{p-�Ty�w��{p���eT�(Sՙ�j�"^�
�|�̛�"�2ن:��R]�׈�j�S�$�C��n
$�w���}�ǶNYs�:w��&���0��<O`�{R.��B.7~�5S
��yp���2�-��d���{gKY���j���PRsR��q���'�R�2�-^�`ي��r��퐉"0�Q�u69��k[���;["ȷ-�*�\�K�+�wQr=R�����鋂�vٯ{���V�L�wv9D�<�9�>���O~�8�s$<��	����o����v�!�����T7�����E
�rLVy�������]��Aߛ1����+����ِc̘�-��CӴoA�༷I?2�ZT"B�b�i��G�kJ��#������r�3���)9HI��쫦����ܭ}�A~����l��ާO�*=�H�.�� �6���ơ�7|�9�/'\��9���2�̇�jMk���[�?���%W��U����+ѳ� ��7ǡ��oA���m�m�q�p5!Rt�B+�(��:k��b����n�#����6��'S�O4��}�Ć=�"�蟊[�ߓz:~�+��3�^�)�m��~���E?���A'M���.kt���j��%�;˱�9?����1M%�N��>���F�����N������÷>ΰ,��Q��N��+��R��%�VzB\J�2!~j�SW�S�N'j�| �[Y�����(�#�r��a���J)��7j{b����J����"s��V딴�#^F+d�UwĥΓ���V�G��u ��'���`SJ��.j�V2��ϜM�f��٢��z�ʓ�*��W��!%>+�	���i�u�9[�]Ș;��2MU\c�'�L��:�u��RQn�l��D=�(3�}�\a#�/	�����o�\���x�~��%1u��↙����D���c�oA�g(7�F�b�Ypk{V��*:�*�F��,������z���.v] /R	C+����C��߅���}��� LϤ�Mao����`L|2?D�ނ�)�|�o:�	*7���07�i��Ff2��o�Կ��<�F�Ϣ�A�T��}|�<'u���#��{�u��l�E�F���K,��t���k=�^9��rd�6*�6ej��H��W�x�]�޶���Tο�������p�G���Fu#ێx{�,�k�O�_��6ӸÙ33ѩ:g��$��4㤹���ރ�Џ�g��C��ƒ�L����]�sv�޾o-gc��F�d�4*'?U��1�U�]I�%��w�/��bHz/�>���K'ii����;o��_�
5D�j|�t,��T���@B���]l�;��>�5�s��B�tB���Em������:;��(r��9�7)�U���آ�L{��&�/�1��*���?y�
7�k[��E�ӯ���8P5̈́��LGd�y��v"M����7�%c_}�m`���Ӯk,�%��Iru��?�7�ˈȶ�oB�\�h;
~8Lc��|�:�_��/)n}�AX;�P��^52�vא����9{��[�5%PK���i��J��5���\aw�d�s4Y�E�JU���}G�LB�+�E�4c�A荒-�L��KF�RA<մ���=���}�	��{��j���}e��.;��b��1�ڽ���A�R���SI6j�fW�3&[�=N������=�߇�)&.��;c�A��2����YL��B���xPг��~S�����j�G�`i�r���CR�b|��!���J���0z��gw��5��V�R�ъ9���7��z0aP�����vD���6~7���������y|�)T�=�3��ǳI��|�:x�!�~w+���Ӿ�+��su��π3����[��nz_��>�������D�ɗ�\Ivjj	�_ː��ڶLA��M�*h�&U���A'_�4�����ڶ�aɄҔ�Y9%Ò�T��hZKrh��[�?̵m��z�ի^��r��Ɋ�ݖ�=4o���Zw�݆ɩ.����V�5�mI���s/�r��VOUa�C]�[���)�5����N~��a���9[���]�o�&�c9� ��Y3��T�}M�β�z�����|@��w~=[3�f�O���D�X3k�${g��^���X��KiH�kr���q��`�]�;[�YY�j�J�8�Ո�^M�L�
I:Qw�i�C���l1$|1L>G���9��d��1쩍0�ō��ֳ�g���Y��i1�>1ῡ��~V�Q�M��#y����?��lu)��2��nK��j����H��8_�0�zn{bg���=����$�!��eλ"g���F�p'��>�V螵B�F�յ�b����PW�[�?��zd
����']ɬ��a���݋-�)�l�'�p=�qw�'%�EJ��:_���D/�?���վ�U���=ȗ���P�����~�s��e/�e%�e��8zA�����������BO���Teb�|�ᨠi>��J=?�D��s���C�0�:�3V�Y�t��q�z~�'����;�dI�V�ʕepBW�=}�>|-���>��ktQ�fa��*�?�^�U~��ktO>�}�9��^E���!+Eo��ir>�яD���~=�(m*-�Rp����do��\ J�iG�<��ߢb�/o9C͆���c=^���ߗ�|c��1�7=��wc=V��\��j  �F����op����]�1ő���
�h)���Ռ��A�:�b������0^JZ�P��""i ��\���H6ʵ��I�w��O����tnS�� �E�ܨ�����~�*�p�R�p֝�S��O�-s����];����n��&n�n��)�i8�,Y�9��ZZ��C�7�l9ܿ�}H�F���	:qY�Q�F"�2���[��3y�yK���ℛ�kP�F�u��^l=�� ��@n���k"����6�����r��� �l?r1A�H�9�7h;����^Z,�P��o� �_�:k�\��3FS����\��%��4wL-���VN\s��ՈX\~�¬a��˅/z{;h��h�{�m�������)��=z�
q�Z��ޫ�o��0�����6L���ڏQB�~\ow�^�1��l�KLk,tS�4���"�_Y����ޫ{��8g	l���8�c�+��j-�_ʒw�^�q�3h8�O�PB�*k�)Mʆ�����q����4)�!�M��@��qQ#�֋�&�+�Ý��w�fHn>��(�2��WN��0�3�s�*��R�;���ظ*B�%n�.�X%��̜�Z�K���+=Ls��{=+�M��q���LW
��-��ʙ�ZJL�Heb�X�܀�s�z���>.���@)�ˠ�5�l�(|vg�-����[��/���9H˳�6�F�ߎ�6���k�h��݅B3{K���w`�2���D+¦%)joC�#�~%K�Yj}WW��.Zu��9I�[ f*�:L�Ӹy�"��R�;����f��b�r�ݔ$p8M����Z�1�uL�jL���Ł�gnq����5R��c/�Q�-U��ٮ:qka?
�Au�hs�D�z�R�k� �i��L�n���G���e\{kk�Zf���F����Mk��
�#RݴZ�~z�z�ߏ�#Voc�<�Q�NT
�{��5���]��W�.���Zcy <��M��{	YE܃�m�l�Foܫ�/\��Z��\�9�q5b ����m��Z���|?Zc�n"'Ѹ����AU�E����^�ޓ)�߿����Ii�1�Jm*O$�E�$ӧ[���f��/�9M�u $�J���6~(�Y#�
�ʕ��Y�Y�w�K>�l�������]�?um�������լ���p2vr"���
w��\v�_YK�kG0����    �i����y"��)�qXK�����^^��rV%�Zq��\P�&�k+�+zj�����Z�-Az};��0����b��\��st��tpK��OU�����N?�s*<Έ`��ZѧW�l�5>�m>g )L�L���ȶ��rev��]��/���p0>��T�zWqr�B!�:m��V�����a9/����6�EjM�o�oY������4Vހ~}�}a9e��)��iJS���W�����lM�����%���vj]Q���]
diŨ��P��W
~�嫛y�&#���u"Ǩԇ�㙾��L��K�#���ak��n��~�J��W�Z����f��k�cmA8�U><��� a�硠Y�����E6����'�dVN�9#5+g� m�^�^��7�[�눵6r����׎�R��(>�K�2Xڋw���\�8԰�FM�6{�x�15}H��-�ƶ���~�S�߮Zr��Ez��u�ͥ���3��G�2�Z]���� ��P����ц+_����_���?Cr�a҃�]T��&!ժ|G8 q)z�d�W5�1�Ls��܋�L��P�i��]�Z�-��DU�/?��i�ifm�q6U&��8'~��7_�_��^�VTZ�;��r�ÿ8�B�m�[oӕ5�O�/n�?��m��[��P��ѣ�+��=|���;]+�M5Z�fHvvE���:����jE�_�f���}��������Z�9K��������he]�n��:�i9Hf���ƺV���Z��ȫ���9b��C����q�T�[E����W��"��!��91��ĉ��0��pȎ�/��+�U�^f�EW����dv�"U���ǔ&~����{Q�)Wk�S&q�g�9�PF�Υ_i9+z��ܷ�4�3ueS[ך PY�إq��y�ϱ��R~��Ӻ��9�Q�m:��ϡ�zi7��˝�� s�|�s�^��:�s�1_m9��/��]n)k�KलPER����E9>���W�s��^�^���-5g'���T�1�O����.+z���v�O��Q:�����G?	��C��oA�ëy�Z�8��rn��y�r�X�0��3��|�K�,�6��vF����젔��ʟ�Oy6ش�Qx�����"6L�E\r�J��<�!��u>7`{�p���=עZci��E��q��1���ōK��6?Ζɕ��bv�U����`���8Z)�V��X871{g� ��ƈ��Baa��ڡ�8B'�鵲�;�>Ζ!zA���1�36��H������^zMr����̠ *�f�\1���)VF0��������\��8[��6[��ԩĐq�R��Rߥ'�.G�?�>	t~��d�J�
�ޠЉ0�
�pj����  T=�@�-Ӹ0��$}s�T
 �
�Mӑ��C;��0��ex�3��e?�d��葱����������Oз3+�{����'z�t��"�,�&�����T��:t'��@��?ѧ�~� �X�,#�ZJs+3�v"����}�/�_�U�p��ج
)s��d�Ӹ�v赆����n���-��d�T���)4�L��������]�mN���T��e�C�L5goBl㬭N/�?ǢO����>�f�=x�s�L��Z��`{���-g/��/R�"%]�������a9-�C����'zg�`��i��5/��꤅-��b��#�_v_\���{5��%r� �RRF���~֮���c�'�s��4�������.���<T�z��X��1{�ses�ή��#Z��C�փ]l9{��}�p��jZ��N5,*e|�����=��?��/��3�N���YFf\�HJ|�g#��?A�-w������)���r!IG��l�kP�s�_����l�nĢSV���ԣ/�˄���%[|<�u|���@�r0G���9L{{��.�R�"a������#�{dpy'��Wa)=7�,��Ğ�}�{y�=�$)�Wa���5���T�E�j���ķ�=�{)�'�Њ�]#��bIq]ـ�BQ�%�:����A~�}3�ĢXs�Dm��Aj���8V5~�=��ދ)��I3sᗃo,����b�+u�k������ܻSto*P|�YDR������7w�]^�xf�_���$r1�g�s�M���t�����s�v����r�gw�
��}җ�J6��k#�C�~,�B�-�U1�TU�qs#�hWW������Cz8o`X��o��Jf�����M�t�1X*�z�]N�����|ps�4��)��L�WR)Q�A_/f�{,����6
�݇>�K��i>G����ڢ��3�����J���f����k��.�`\�C���/i�ˤǖ����;�G(�A9i(5�D�ڧ�݊;$a��`�wk��ϳ�#.EC��Z���iv7cʁ�d�OBr�gK��v�^CJ�+�'2�r3�B�ݟ֬�Yz�lII�6���%�O�W��b�)��x���G�ƇF��3�|̡L^��M�"w/xJ�Fs�p�!X�N����������DP6�p�'���lѭ��R:T��s��/�!�w��.NS�ѣPΪ�j��a�:�Ӛ��Ǹ�v`��������nm�3|B�3�*�s� e��D�_��3�O���Ļ)ͲmW0�nZ�Q��ig5W�߻��ѻ��5�f����:��J8k��5�{��Ar�L̸�����$`V�k����~hu��?E�-z�<bDh��p�I|�+b.;6v\��!�oѻVJC�2�T�ՙ���EP%9V꾏��?m�O�Xޡ�L�4@U�1�x���W���$�}��N��Y�kBR�C��IB:m��%��$g�st�"����p�fӍ�I�?�Z���tIy��l4U�k_����B!/[[iy���z
�=Ģ���GWb�Yu����9���$SqYs?���B�����ﳥNoêo_���V���))ko��>�_狿S+7tN�z�_���9��a�ϠL��y��N5�����gUJ^�2�O�����
'2y��W�t��\Z��w�OT��Y?�ˏ�[�;��"� �3��7�X+������Q�O��x)�
�=���{rE�f�-(�=��������N�w(����f�)�4F�gU��п����u1>��ե�{��[yk���&^��^�_���_��cK�t�T��ŤÝ��so���s����DZl�B	Mf�7(�"_�G��rH��-�)�'��[*�"�s��X�x��|	�T9����~��~���tc�T���6�CA	]�1�i�L`�^���N7�_JaÊ�����8�_��2���}� k�ݲ¹��`�	.���I�vr�!!�k갋t��[F�>Ʋ��n��ʏZ�I�ϡ�O�}�4�������ƺ[��.U���2Lu��ɩ��wH�����*�r� �<�ܑ�:�̥��a_���a_��ҌJO�p�.�j��1�\���|�蟮��w��gK��\[�����@U�.�Z]���>�5�>s�.�va�s7��-�>����S��"��G�^ϖ��5�ٯ+צ��u�G��=�\�+�#+���rXg�+;~�j�������uх�-�jX�,M��LئlA�5�K/!�[��XD;;Kfo)�F�S�E'�a��0�;�f%i�Pg���We[a��&�L���'�،���iW����7�.���6Ԝ��-�*����]�������)OX@�u�����0+	)�\C����/�+�-vKmZ,�� ?Q�J�F7cI	���/˅�q�f  �T��f@i�Q*Z�qD�C�?�e_��D�
�E֠�a��ׁ�Y����~�U���}�-�#���T�s��;��?]�{8k�!Y�?���[�Ufd��f:
��J��T��޽'���${gKocH�Iu�g�k�S����m��k;$��_�����b��9U���'YLғa&��L�s��t���j�C�.bT�\�tUrA���H�}�=�����UKV�xֶ8�%*�g��&,����=o��ᚑXp��&KT �  5��LH:jmL8���-蟣�'�G\�,H��QbjZ���1F�9��7��cG��u>�q�&;X� *��s��d���Ϭ�}D��'���q�NPg]c��$�N�H?�#=gS�>�'|z�O,!9�x��T�&��b>�ނ�9��D�_��S!���Ϊp@��E�N�C�oA�\��D߇��!���D;�q{K-��1�NeXF�`�뽳%'?�p��\�AՊ��R6L�&�yf��o�"���-��@��!4�?$�G9�a�u��ǽ�%qW�u
F�<Y �@L�1�1�8�v����X)��%%�� =I`���D��ޭ� ֬+A��(�����L�w��U�q�i�Z��5�_��ȫb�ϭCCWU���u�H�onz{����lєEu�U�������9X�A���^�?;�1�^�kc�w
���`b���z�u�Ϣ7O��������_����X�{��it�qtĈΝ�(��OV��>��:�F*��Pg�AF��bCx�;�W���v����)��"�44=U�q*�T]�&#���^�Do}b�f�T5W���m�5h�F�G�-����>[���rI\�kV.��cDZ,��y�߀]��)��
}K�&�j��Bɺ�s�B+Y�5����'�w?���_����)
=      �      x������ � �      �   i  x���Mn�0��3���f��Ļ*U�*�ظ�VA)�����@%��VJ6�2��	�8ể߅/ X�Ϗ$I�B� rT:R9�
�;��}�f� �Ӱ�UP�1�NJ�����W��㒜���9�L໰�G�N��1m�T�ch�k��~����������*�h�!C�!��ٵ�1��H$�)+#������<T���T�z���ڱvLX�S��>��UB�I�e�!3<��o�Դ��0�~�r��u:u\�V�
�2n�]�|u?�t&ƞ�l&F%��ϣ��>=��,�I�9���a�o{��S�Z�U����1d�1�Oqj�/\0d�no��e���eU_	qA�����.Md.f����0      �   u   x��A
�@Ͻ�����,
�K��q���8��ur�C-��н0����Xi)����n[X5�S���"��J�c���y�gH���_�t�!-.˖���?%�O!���$.      �   X   x�3�tL����,.)JL�/B�+��*^X���Y�e�����
Rc@��R�J@*�9sr�S�R��PU���E��@u1z\\\ ��+P      �   A  x�=�ˎ�0 @�u��;��T Ձ�)H(�8�׏�h���΀<2��!K��q"K��TI�B�m���;����]�-<�v:��6E��ξF�ZW\�a-�@� �e�K��P���e��:�V��]/6ñ�Hg��ٞ����W�~R��ڶ�� �qG3Vtٛ�"���L�!X�p/��.I�2��D���j���4$�w����A�<����[�O{������.ZSk��qqgy��q��y��uژ���RTЧ&�gi�x[��/���Q+�{�{V���˺-���(G�d��p�B;'vB�z<�� �M�w�      �      x�����(���+��^�GD 6������޴vW��F3����Ǒi p8+�U��#����ñ�n?�������_����?B�OK~��[��!<��G��9௿�����?�������}U�O�'�J{�"�4�H�K�\�'������X�K\����0��?�yQ��û;�9=�̃&<2���%o�oC�m�	�/k��|=����n��G��rk`��p�����L�|6Mx�����x�KϘV��6ëZ^��r��s�SMx�̣��%/�����҄g�H�o���]�d�gӄg��X�o�l{rx��D�_(jy}��[ =cXi4CI��Lw<�T5������s˓�f��i�3C��_�~�tz���	���Z~�۟<�4��yl�������l�Єg�T��������&<c/����Lr�f;�&<c/LZz��W�<4�{a�������.�<�/�=�^����?S��O5�w������ofz���/Mx�]8k�O� e ���+M��^x����>s���	���Z~9�����{i�3�.Z^������g�+Mxf��U�/����y�	�LZ^�O�r{z�m�	�L$-����������	�Ld-��O��I���Ec01j���)m�g�+Mx�`b����%���|�҄g&f-�����I�u�O�4����_��m
�q��҄g�%�Z~{>c|�����Ģ�>����?I�2ĕ&<�/�j�-�۳e*+Mx�_R����w��&c�J��DZ�!^^�r�I��%�'ӕ��250���%�[�A�)=)�4�{II�����_�v�'��҄g�%e-/y�� mG�dz�҄g�%mZ~y�b;�+Mp�]Ү�%nwFۣ��ﶗ&<�.�h������ާ����������oOi;k��&<�.9h麙�v�V� ��d���MwϲuNMx�^2ky}B��H�Óg��t%ËZ^ߠw8�G#�g�%'-�������Ã&<c/9ky}:���|y>��	��K޴����O��m�]T��ky=<���<���]�&<�/�hy�sf�ܞ��h�+Mx�_r���ߟ�B�ӧ&<�/[����ʁ�Ñj�3����ߟϴ?9�4�{�X�K^q�O�d�JuXiq&ËZ~���my�3����lI����߱��Ǘ�&<�/[����Ó�&<�/ۦ�������^����l�����>�'��҄g�e+Z~9�����%�4��ݭjy;�������3P���\b�g���
&g-�J�v��q������͹r��HH�>�	�8��Z^�RunM4���J{�n�e�Z^�3Ԣ�<nl������I�K�wkF�$=�G�S���=ky��J�6aѣ�4�k�7-����pkҫ�J�q�}�����C�7JNMx�Y���5��h;����Ԅgf.{����\2Jƍ�S������%��v�QOMx�_
iy}|��%#Q�é	��Ka-������(�]J���=��mއm�S�q�����7���t�Qn_i4�R����ϱO���>�J����iy��\\�a�yj�3�Rv-�o�D��0�>5)E���-����)�&@c0�j���6�°�rj�3S���g� ����҄g������|B���f�+��&<c0����9~��#ӉS{P5S�����^l�d!�4���I�K�7�x�y�	��K�Z^��F�q����T5�R7-���q��Ԅg��Z^ߞ��m��8�/�	��K-Z~�Ky�S���Z����n��0_:5���Ғ�Gy��_m{���4���B��R���?�h{:>Մ7�!�K��v�K�Rpj��r��=[z�Y6��&��_�]�W.����[�uxZ95���B��Ro3λ|;�9�wj텐ۥ�qx�yO�;�rF�S�l/��.�ӹ��ńѶ<*ж҄7�!�K}lלO�vA�1��S5���B���x>~��ڞ�҄g��]��Ag^r7�f�9��S���v����<��.P��X��h��]�W�x�v�WڃMn��ۥ~'��wg����G+Mx�_�%r��[��1�L�N�	�b���m���
�+ӉS���v��3���vC.�Ԅg��]����-\̤Ǎ�S���v����<o�Y4C��J���v�OϿ~�(�1�S���v��s>�xX_i�3���.�Oo3ϱ���<��OMp�]ۥ>�7�6�i���c���O��&�K���?�k�k�J�q�v���5����h;�P�J�q�v��v�� k]i�3��.��.�g�7�Ҷ�h��]b�^����/p���	��R�Ğ����a��Ԅg��]b�^�y:*�
@��'4�{Aj��c/7ׯ�=�i8RMx�^�ڥ�؋��R�$����Ԅg��]������	�aw��lR���.E�_��ٚ��Z֩	��B�{�w����<5�{Ah���Q�ٮs:+f�b֩	��B��k�7�V$�Z~j�3���.����9ݽ��kf/�&<c/�R��=��6��g�&<c/�R�5<�|�v����҄g��]�g;�ww>Ӿ����B�ԇv��h;����Ԅg��]J���'RQ+��&�KH�R��:�7��OYi4��.��t�[޶�m�b������@���	�b��<��o�a;u@Մg�]J���ܠ[��r^i�3��.%�`n�_�FJ^i�3��.%�`n�gi;�L+Mx�`�ۥ��o�o�ĕ&<c0��Rv���G�r�F~i�3��.e�`���vi�/��&�K��RvƛPT�Ѝ��	��r��=�����4�An���/���ɑxeL+Mx�_�ۥ.�K��\��m+W���&<�/��R��fx�9�G�ms�V� �� �K����~4�s��&@�0H�R�?b���j���:Mx��#IK9x�˵O�w��L�G���$��9�c�m�bR^i�3�d2u��K�<$��dޒ��3�]Bl���.�����.u�J��/�t���� �K]l��{�Ѵ<�u�Y�	θR�ԥvλ7�v�a�4�wAj���9��[��^k�V� �� �K]l� ��m˳^�V���� �K]lמPg{Erޝ&@�.���V�����tS]i�3��]ڃs�n��7�i�	ϸһԥw)�;�z�X*���!X�i4v��.u�]t&��{�<���.!�K{tx���v��I?��4��Az������NLX]����&<c1H�Ҟ�yބ"�^2�W���� �K]z����v��&<�0��Ҿ{7�/��v���� �K{���D�������� �K{ux��,m/���&<c0��R	�<'.��n7F��i�3��.�`��R���&<�/��R�����Ű�l��.�_nysi�3���.�_��m7&<�/��R�%��t�Cn�����N���w�������v{Is_i�3���.�������c�+Mx�_ߥ.�ky� �W°��i�3���.��\�;^۬��&<�/H�R��5<g��*@^�4�Az�*}}��%�W���� �K]z���!���;��&�K��R�������+Mx�_ߥ.�kx�3�xu���u���� �K���׾�2,����� �K��o�ͯ���҄g��]�����w|Bj���&<�/��Ru��Y�Ӷ��|�	���Tq^'�y�V?h�	o��@=���yˣ~G�ӄ7�#���ki{�W;Mx��0�q�nt��0��u�#��_�]��i���wC�,~vj����.�kxN�Û<�i;Mp��0���wns��v�NMx��0��Ͽ����v�K�&��^�]��L����yz}j���.����/�=TZi��݅���P� n�HP�	Θ»L�9�ٙ]o���v\�	иһL��.��s����҄g��]&v��{����~{��фw�]&�]���b�4�~�&<�.�r�� ��vF$�i|�>5�{Ax���/�s�ڞ�VNMx�^��eڮy�l�H���N���w��k�������S���w�_2�k�|"��y�	��һL�����O�ݾi��4��Az�{�5��?�GԓV�   ��� ��L�����]��J���w�ߏ���so{E]\����w�]�x��V?�"@��W���� ����Kq�3��҄g��]f�_���hz\�:5�{A|�ٳ�tr[i�	��һ�/�ԟ�}`���Ñ3٭��v�;Mx�^���.��x�����<�{e�랚��� ��]x���g�x�����Qw�	ϸ»�OV��6bZ�����H��>��i�3��.�n^�m��8���LZw�	ϸ»y�Wg�˗��B{D��edw9���5>;�yx��ӄg��]��怯�|��Zw�	Ϙ»�?*�Ҟn{��v�NMx�]��~�
^���q|�`�����~j�3��.��]ڣ)���� B�n�"t�	ϸ»�����l��۴�B���w9։��]�O�M�.4�{Ax�����`��eӺMx�^��4�Ǘ~����<�U�UX��i�	��»l콽�߾@��u�#��.#��)N���}�X���&<�/��rJ�����mt�B��Qw�	�������_�l�����;�.4�Av�������V^m�҄g��]��5����w&��Єg��]����*���i�W���� �˩N���ۭ � i��M�	����������'׏��B��dw9��;~�����t���� ������3��~��� u���w����dw�]�*oǻ�����6k݅&<�/��rw?<|�C�Qw�	�������k_�	�~v�}�]h�3���.w[M��y;�<�>�.4�{At�����+��ڋ����u���� ��y��-���O���jm'��Єg��]�B|�Vw�}�]h�3��`+oaⵤ�v��zzv�}�]h�3���0o4�����c�rmg�nѺMx�^�-�5�9v�n{�N/�Mv����-�<j�w�%m����N��dwyK��o�#���V]h�3��.oyµ`c��tV��Єg��]��۹%S?sϪu���� ���`/m�T�OG�w�����4�{At��2��]�.�4M��;Mp�]��N8y�gug'�h���Єg��]�G����V���z嚑�?�.4�wAp���]���ON'kՅ&8c.�����}��|2waֺ�Ml���=N<�ι�k�m�Ms��&<c.���&^L�Z���<�.4�wAl���.S���̼�#��J�+Mx�]��.����~�t�ҥm��Y�ӄg��]�b��;��7�٩	ϸb���voo�9x�.���B�q�v�K��Tޏ���B�G�h�i�3��.w���k?}��.n�J�=���st���� ��]j��Z��By�/i݅&<c/H�r����
�^����&��H�r�/���M��Zw�	��R�\�t;c@ҥHg4�/]u���� ��e��������6��Єg��].�»�9K�G�G݅&<c/H�r٧���&�������0w�g��].e�}轍�⎪Mp�]���R������V]h�3��.�0��)��"�\Z<0Nc�K�1Dv���k�v�\�6�����g��]��7{��o�7g{���}�N{D�eDv����ב�Mwm{��`�	Ϙ"��Ev���?٧b�l�Qw�	Ϙ"��Ev��o^�z�b`���Qw�	Ϙ"��Evۚ!�?��nav�N�1Dv�����MVoC(�nֺMx�]��.�{�x����e��Єg��]�u�o��u֣���B��/-tz�#O:,���Qw�	o����n��E���uA�Y���j&"�����2_���1=�>�.���ËZ��'�_;���݊CD�ӄ7�KDd7�4�ڣ����Y��B��/����_C7��yU�.4����ٍa���?�����M��j�%"��>�Ci1�ۅV�.�Qw�	o����ne��2^+�}Xa�� t��f���0���_�]o�ߥJ� :Mx�_�ڍfޙ+�^���\A�	��B������|v���ȫ���&��/4�XK�O��oM~k�?-_�:�.�GBf7���Q?�(���n.��%�\U~=J���?��x<��
�\     