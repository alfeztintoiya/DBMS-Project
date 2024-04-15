PGDMP      4                |            movies    15.4    16.0 3    =           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            >           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            @           1262    16446    movies    DATABASE     h   CREATE DATABASE movies WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE movies;
                postgres    false            �            1259    16500    admin    TABLE     �   CREATE TABLE public.admin (
    id integer NOT NULL,
    username character varying(255),
    password character varying(255)
);
    DROP TABLE public.admin;
       public         heap    postgres    false            �            1259    16499    admin_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.admin_id_seq;
       public          postgres    false    217            A           0    0    admin_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.admin_id_seq OWNED BY public.admin.id;
          public          postgres    false    216            �            1259    16594    bookings    TABLE     �   CREATE TABLE public.bookings (
    booking_id integer NOT NULL,
    show_id integer,
    user_id integer,
    booking_time timestamp without time zone,
    num_tickets integer
);
    DROP TABLE public.bookings;
       public         heap    postgres    false            �            1259    16593    bookings_booking_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bookings_booking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.bookings_booking_id_seq;
       public          postgres    false    225            B           0    0    bookings_booking_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.bookings_booking_id_seq OWNED BY public.bookings.booking_id;
          public          postgres    false    224            �            1259    16551    movies    TABLE     �   CREATE TABLE public.movies (
    id integer NOT NULL,
    title character varying(255),
    description text,
    poster_url character varying(255)
);
    DROP TABLE public.movies;
       public         heap    postgres    false            �            1259    16550    movies_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.movies_id_seq;
       public          postgres    false    219            C           0    0    movies_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.movies_id_seq OWNED BY public.movies.id;
          public          postgres    false    218            �            1259    16576    shows    TABLE     �   CREATE TABLE public.shows (
    show_id integer NOT NULL,
    movie_id integer,
    theater_id integer,
    show_time timestamp without time zone,
    available_seats integer
);
    DROP TABLE public.shows;
       public         heap    postgres    false            �            1259    16575    shows_show_id_seq    SEQUENCE     �   CREATE SEQUENCE public.shows_show_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.shows_show_id_seq;
       public          postgres    false    223            D           0    0    shows_show_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.shows_show_id_seq OWNED BY public.shows.show_id;
          public          postgres    false    222            �            1259    16560    theaters    TABLE     �   CREATE TABLE public.theaters (
    theater_id integer NOT NULL,
    name character varying(255) NOT NULL,
    location character varying(255),
    capacity integer
);
    DROP TABLE public.theaters;
       public         heap    postgres    false            �            1259    16559    theaters_theater_id_seq    SEQUENCE     �   CREATE SEQUENCE public.theaters_theater_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.theaters_theater_id_seq;
       public          postgres    false    221            E           0    0    theaters_theater_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.theaters_theater_id_seq OWNED BY public.theaters.theater_id;
          public          postgres    false    220            �            1259    16448    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16447    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    215            F           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    214            �           2604    16503    admin id    DEFAULT     d   ALTER TABLE ONLY public.admin ALTER COLUMN id SET DEFAULT nextval('public.admin_id_seq'::regclass);
 7   ALTER TABLE public.admin ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    16597    bookings booking_id    DEFAULT     z   ALTER TABLE ONLY public.bookings ALTER COLUMN booking_id SET DEFAULT nextval('public.bookings_booking_id_seq'::regclass);
 B   ALTER TABLE public.bookings ALTER COLUMN booking_id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    16554 	   movies id    DEFAULT     f   ALTER TABLE ONLY public.movies ALTER COLUMN id SET DEFAULT nextval('public.movies_id_seq'::regclass);
 8   ALTER TABLE public.movies ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    16579    shows show_id    DEFAULT     n   ALTER TABLE ONLY public.shows ALTER COLUMN show_id SET DEFAULT nextval('public.shows_show_id_seq'::regclass);
 <   ALTER TABLE public.shows ALTER COLUMN show_id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    16563    theaters theater_id    DEFAULT     z   ALTER TABLE ONLY public.theaters ALTER COLUMN theater_id SET DEFAULT nextval('public.theaters_theater_id_seq'::regclass);
 B   ALTER TABLE public.theaters ALTER COLUMN theater_id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    16451    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            2          0    16500    admin 
   TABLE DATA           7   COPY public.admin (id, username, password) FROM stdin;
    public          postgres    false    217   �6       :          0    16594    bookings 
   TABLE DATA           [   COPY public.bookings (booking_id, show_id, user_id, booking_time, num_tickets) FROM stdin;
    public          postgres    false    225   &7       4          0    16551    movies 
   TABLE DATA           D   COPY public.movies (id, title, description, poster_url) FROM stdin;
    public          postgres    false    219   f7       8          0    16576    shows 
   TABLE DATA           Z   COPY public.shows (show_id, movie_id, theater_id, show_time, available_seats) FROM stdin;
    public          postgres    false    223   �:       6          0    16560    theaters 
   TABLE DATA           H   COPY public.theaters (theater_id, name, location, capacity) FROM stdin;
    public          postgres    false    221   ;       0          0    16448    users 
   TABLE DATA           >   COPY public.users (id, username, email, password) FROM stdin;
    public          postgres    false    215   �;       G           0    0    admin_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.admin_id_seq', 1, true);
          public          postgres    false    216            H           0    0    bookings_booking_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.bookings_booking_id_seq', 2, true);
          public          postgres    false    224            I           0    0    movies_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.movies_id_seq', 3, true);
          public          postgres    false    218            J           0    0    shows_show_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.shows_show_id_seq', 3, true);
          public          postgres    false    222            K           0    0    theaters_theater_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.theaters_theater_id_seq', 5, true);
          public          postgres    false    220            L           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 2, true);
          public          postgres    false    214            �           2606    16507    admin admin_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_pkey;
       public            postgres    false    217            �           2606    16509    admin admin_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_username_key;
       public            postgres    false    217            �           2606    16599    bookings bookings_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (booking_id);
 @   ALTER TABLE ONLY public.bookings DROP CONSTRAINT bookings_pkey;
       public            postgres    false    225            �           2606    16558    movies movies_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.movies DROP CONSTRAINT movies_pkey;
       public            postgres    false    219            �           2606    16581    shows shows_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.shows
    ADD CONSTRAINT shows_pkey PRIMARY KEY (show_id);
 :   ALTER TABLE ONLY public.shows DROP CONSTRAINT shows_pkey;
       public            postgres    false    223            �           2606    16567    theaters theaters_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.theaters
    ADD CONSTRAINT theaters_pkey PRIMARY KEY (theater_id);
 @   ALTER TABLE ONLY public.theaters DROP CONSTRAINT theaters_pkey;
       public            postgres    false    221            �           2606    16455    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    215            �           2606    16453    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    215            �           2606    16600    bookings bookings_show_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_show_id_fkey FOREIGN KEY (show_id) REFERENCES public.shows(show_id);
 H   ALTER TABLE ONLY public.bookings DROP CONSTRAINT bookings_show_id_fkey;
       public          postgres    false    223    225    3483            �           2606    16582    shows shows_movie_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.shows
    ADD CONSTRAINT shows_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(id);
 C   ALTER TABLE ONLY public.shows DROP CONSTRAINT shows_movie_id_fkey;
       public          postgres    false    219    3479    223            �           2606    16587    shows shows_theater_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shows
    ADD CONSTRAINT shows_theater_id_fkey FOREIGN KEY (theater_id) REFERENCES public.theaters(theater_id);
 E   ALTER TABLE ONLY public.shows DROP CONSTRAINT shows_theater_id_fkey;
       public          postgres    false    3481    223    221            2      x�3�LL��̃��F�&\1z\\\ Wx      :   0   x�3�4B##]]CS+ �4�2�C$93��1W� 4�	�      4   F  x��T�r�6}��b?@�(ٞ�~�����<id��t�^+. Z&��ZI<}���۹ �A�J"��5�]�-��XI>�,l[@ʖ����B>E����I-��,Ċ�n|hTLG\ƹ���>�bTΎ��4�y��7!:ߦ¹�
���0R�\����PTC�ڒ��l4���2���4��iɻ�<��g���%���&��7F+�c�nm�!�UU�u����w��`�q��X,)��q���)�>�ow�c�q7�Oզ���̺��y�1�X��b�2���,����0k��ŝ�/���~9-�/��{�s���<��uy6ܠ$(T�>T.���!"�LY2-x(�Q����C0���n!�/)&mR�QZq�MJ�H����[�8A�-ɻ��֩���%�Jde�J�&��n�;%:&�+�G�J�K�vޙ>��*�t�Q=�Wp㝓i�w��BC����+L�vG�a�+�>�9u7E�	���Wt��x0��e��W/�/�)Y�`߄�@� I�O+U	OV3=��(�}ϴ��d��Ս�S���B	��:ͷ������~��_�y\Lgy�5��?�.>/�}�,c�ͦ��"�f�������U�R�������]u[���'y��Y�|p�d��Fx���-�`ɔ,�3��ip����,GP���s�o�6��b�7��H�]z�IW�4KT����v!�Nύ
"�,��ҵgk�t�OVf��輖CoB�<�Tyຖ�U�^f6K�S�;���|�)�L���!�x�1��FԮS���_��e>���?�1�<?��}r�[���w_w�G�*��3:;;��q߆      8   A   x�Uɱ�0���"8�(��g��s�@���bg��jD_�%��핟JL$���������~      6   �   x�m��
�@E�3_�>@dL��!�YD�6�/��L��g�)hw�=p��*�{OTa
�Q��EpB;,=8V�1:S�'B?�F�E���T����ޟ�(��n��x���6�c�=���D�$˟�9�+:����-K��*�O\b����>$      0   ?   x�3�L�IK�*��+�ϬL���s3s���s�|CC.#�Ғ��2���76*����� �y     