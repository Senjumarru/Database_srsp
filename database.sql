--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: certificates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.certificates (
    certificate_id integer NOT NULL,
    volunteer_id integer,
    title character varying(100),
    issue_date date,
    expiry_date date
);


ALTER TABLE public.certificates OWNER TO postgres;

--
-- Name: certificates_certificate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.certificates_certificate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.certificates_certificate_id_seq OWNER TO postgres;

--
-- Name: certificates_certificate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.certificates_certificate_id_seq OWNED BY public.certificates.certificate_id;


--
-- Name: donations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.donations (
    donation_id integer NOT NULL,
    amount numeric(10,2),
    donor_name character varying(100),
    project_id integer,
    event_id integer,
    donation_date date
);


ALTER TABLE public.donations OWNER TO postgres;

--
-- Name: donations_donation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.donations_donation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.donations_donation_id_seq OWNER TO postgres;

--
-- Name: donations_donation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.donations_donation_id_seq OWNED BY public.donations.donation_id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    event_id integer NOT NULL,
    name character varying(100),
    date date,
    location text,
    organization_id integer,
    duration integer,
    capacity integer
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.events_event_id_seq OWNER TO postgres;

--
-- Name: events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_event_id_seq OWNED BY public.events.event_id;


--
-- Name: feedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feedback (
    feedback_id integer NOT NULL,
    volunteer_id integer,
    project_id integer,
    rating integer,
    comments text,
    feedback_date date
);


ALTER TABLE public.feedback OWNER TO postgres;

--
-- Name: feedback_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.feedback_feedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.feedback_feedback_id_seq OWNER TO postgres;

--
-- Name: feedback_feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.feedback_feedback_id_seq OWNED BY public.feedback.feedback_id;


--
-- Name: materials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materials (
    material_id integer NOT NULL,
    name character varying(100),
    quantity integer,
    project_id integer,
    supplier character varying(100),
    cost numeric(10,2)
);


ALTER TABLE public.materials OWNER TO postgres;

--
-- Name: materials_material_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materials_material_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.materials_material_id_seq OWNER TO postgres;

--
-- Name: materials_material_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materials_material_id_seq OWNED BY public.materials.material_id;


--
-- Name: organizations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organizations (
    organization_id integer NOT NULL,
    name character varying(100) NOT NULL,
    contact_info text,
    type character varying(50),
    established_date date
);


ALTER TABLE public.organizations OWNER TO postgres;

--
-- Name: organizations_organization_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organizations_organization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.organizations_organization_id_seq OWNER TO postgres;

--
-- Name: organizations_organization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organizations_organization_id_seq OWNED BY public.organizations.organization_id;


--
-- Name: participation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.participation (
    volunteer_id integer NOT NULL,
    project_id integer NOT NULL,
    start_date date,
    end_date date,
    role character varying(100)
);


ALTER TABLE public.participation OWNER TO postgres;

--
-- Name: partnerships; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partnerships (
    partnership_id integer NOT NULL,
    organization_id integer,
    partner_name character varying(100),
    agreement_date date,
    agreement_details text
);


ALTER TABLE public.partnerships OWNER TO postgres;

--
-- Name: partnerships_partnership_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.partnerships_partnership_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.partnerships_partnership_id_seq OWNER TO postgres;

--
-- Name: partnerships_partnership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.partnerships_partnership_id_seq OWNED BY public.partnerships.partnership_id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    project_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    curator character varying(100),
    budget numeric(10,2),
    start_date date,
    end_date date,
    organization_id integer
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- Name: projects_project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.projects_project_id_seq OWNER TO postgres;

--
-- Name: projects_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_project_id_seq OWNED BY public.projects.project_id;


--
-- Name: sponsors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sponsors (
    sponsor_id integer NOT NULL,
    name character varying(100),
    contact_info text,
    donated_amount numeric(10,2),
    sponsorship_type character varying(50),
    event_id integer
);


ALTER TABLE public.sponsors OWNER TO postgres;

--
-- Name: sponsors_sponsor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sponsors_sponsor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sponsors_sponsor_id_seq OWNER TO postgres;

--
-- Name: sponsors_sponsor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sponsors_sponsor_id_seq OWNED BY public.sponsors.sponsor_id;


--
-- Name: volunteer_attendance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.volunteer_attendance (
    volunteer_id integer NOT NULL,
    event_id integer NOT NULL,
    attended boolean,
    check_in_time timestamp without time zone,
    check_out_time timestamp without time zone
);


ALTER TABLE public.volunteer_attendance OWNER TO postgres;

--
-- Name: volunteer_availability; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.volunteer_availability (
    volunteer_id integer NOT NULL,
    available_from date,
    available_to date,
    preferred_days character varying(50),
    event_id integer
);


ALTER TABLE public.volunteer_availability OWNER TO postgres;

--
-- Name: volunteer_service_rating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.volunteer_service_rating (
    rating_id integer NOT NULL,
    volunteer_id integer,
    event_id integer,
    rating integer,
    comments text
);


ALTER TABLE public.volunteer_service_rating OWNER TO postgres;

--
-- Name: volunteer_service_rating_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.volunteer_service_rating_rating_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.volunteer_service_rating_rating_id_seq OWNER TO postgres;

--
-- Name: volunteer_service_rating_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.volunteer_service_rating_rating_id_seq OWNED BY public.volunteer_service_rating.rating_id;


--
-- Name: volunteer_skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.volunteer_skills (
    volunteer_id integer NOT NULL,
    skill character varying(100) NOT NULL,
    level character varying(50),
    event_id integer
);


ALTER TABLE public.volunteer_skills OWNER TO postgres;

--
-- Name: volunteers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.volunteers (
    volunteer_id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    age integer,
    phone character varying(20),
    address text,
    university character varying(100),
    email character varying(100),
    gender character varying(10),
    experience text
);


ALTER TABLE public.volunteers OWNER TO postgres;

--
-- Name: volunteers_volunteer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.volunteers_volunteer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.volunteers_volunteer_id_seq OWNER TO postgres;

--
-- Name: volunteers_volunteer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.volunteers_volunteer_id_seq OWNED BY public.volunteers.volunteer_id;


--
-- Name: certificates certificate_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificates ALTER COLUMN certificate_id SET DEFAULT nextval('public.certificates_certificate_id_seq'::regclass);


--
-- Name: donations donation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations ALTER COLUMN donation_id SET DEFAULT nextval('public.donations_donation_id_seq'::regclass);


--
-- Name: events event_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN event_id SET DEFAULT nextval('public.events_event_id_seq'::regclass);


--
-- Name: feedback feedback_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback ALTER COLUMN feedback_id SET DEFAULT nextval('public.feedback_feedback_id_seq'::regclass);


--
-- Name: materials material_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials ALTER COLUMN material_id SET DEFAULT nextval('public.materials_material_id_seq'::regclass);


--
-- Name: organizations organization_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organizations ALTER COLUMN organization_id SET DEFAULT nextval('public.organizations_organization_id_seq'::regclass);


--
-- Name: partnerships partnership_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partnerships ALTER COLUMN partnership_id SET DEFAULT nextval('public.partnerships_partnership_id_seq'::regclass);


--
-- Name: projects project_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN project_id SET DEFAULT nextval('public.projects_project_id_seq'::regclass);


--
-- Name: sponsors sponsor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sponsors ALTER COLUMN sponsor_id SET DEFAULT nextval('public.sponsors_sponsor_id_seq'::regclass);


--
-- Name: volunteer_service_rating rating_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteer_service_rating ALTER COLUMN rating_id SET DEFAULT nextval('public.volunteer_service_rating_rating_id_seq'::regclass);


--
-- Name: volunteers volunteer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteers ALTER COLUMN volunteer_id SET DEFAULT nextval('public.volunteers_volunteer_id_seq'::regclass);


--
-- Data for Name: certificates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.certificates (certificate_id, volunteer_id, title, issue_date, expiry_date) FROM stdin;
1	1	Экологический активист	2024-04-15	2025-04-15
2	2	Лучший преподаватель	2024-05-10	2025-05-10
3	3	Социальный работник года	2024-06-20	2025-06-20
4	4	Образовательный наставник	2024-07-15	2025-07-15
5	5	За помощь приюту	2024-08-25	2025-08-25
\.


--
-- Data for Name: donations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.donations (donation_id, amount, donor_name, project_id, event_id, donation_date) FROM stdin;
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (event_id, name, date, location, organization_id, duration, capacity) FROM stdin;
1	Чистый город	2024-04-10	Центральный парк	1	4	100
2	Хакатон Добра	2024-05-05	TechHub Алматы	2	6	50
3	День заботы о пожилых	2024-06-15	Дом престарелых №1	3	5	30
4	Наука детям	2024-07-10	Городская библиотека	4	3	40
5	Помощь приюту	2024-08-20	Приют "Доброе сердце"	5	4	25
\.


--
-- Data for Name: feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feedback (feedback_id, volunteer_id, project_id, rating, comments, feedback_date) FROM stdin;
1	1	1	5	Отличный проект, рад был участвовать!	2024-03-02
2	2	2	4	Полезный опыт, но можно улучшить организацию.	2024-02-20
3	3	3	5	Очень важное дело, спасибо организаторам.	2024-04-05
4	4	4	3	Хороший проект, но не хватило материалов.	2024-05-10
5	5	5	5	Все прошло отлично, готов участвовать снова.	2024-03-12
\.


--
-- Data for Name: materials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materials (material_id, name, quantity, project_id, supplier, cost) FROM stdin;
6	Лопаты	10	1	СтройМаркет	5000.00
7	Ноутбуки	5	2	IT-Центр	250000.00
8	Продукты	20	3	Супермаркет	15000.00
9	Книги	50	4	Издательство "Білім"	20000.00
10	Корма для животных	30	5	Зоомагазин	10000.00
\.


--
-- Data for Name: organizations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.organizations (organization_id, name, contact_info, type, established_date) FROM stdin;
1	Green Earth	greenearth@mail.com	Экологическая	2015-06-12
2	Future Tech	futuretech@mail.com	Образовательная	2018-09-25
3	Hope Foundation	hopefund@mail.com	Социальная	2010-11-03
4	Edu Support	edusupport@mail.com	Образовательная	2016-05-18
5	Animal Care	animalcare@mail.com	Зоозащитная	2019-08-22
\.


--
-- Data for Name: participation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.participation (volunteer_id, project_id, start_date, end_date, role) FROM stdin;
\.


--
-- Data for Name: partnerships; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partnerships (partnership_id, organization_id, partner_name, agreement_date, agreement_details) FROM stdin;
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (project_id, name, description, curator, budget, start_date, end_date, organization_id) FROM stdin;
1	EcoLife	Проект по озеленению города	Жанна Касенова	1000000.00	2024-03-01	2024-06-30	1
2	Tech4Good	Программа по обучению IT	Бекзат Махмутов	500000.00	2024-02-15	2024-07-20	2
3	HelpTheElderly	Помощь пожилым людям	Асель Ахметова	300000.00	2024-04-01	2024-09-01	3
4	EducationFirst	Поддержка школьников из малообеспеченных семей	Марат Алимов	700000.00	2024-05-01	2024-10-01	1
5	AnimalRescue	Помощь бездомным животным	Гульмира Куаныш	400000.00	2024-03-10	2024-08-15	2
6	Проект помощи	Описание проекта	Арман Жунисов	50000.00	2024-03-01	2024-12-31	1
\.


--
-- Data for Name: sponsors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sponsors (sponsor_id, name, contact_info, donated_amount, sponsorship_type, event_id) FROM stdin;
1	КазЭко	eco@mail.com	200000.00	Экологический фонд	1
2	Tech Corp	techcorp@mail.com	500000.00	IT-развитие	2
3	Фонд Надежды	hope@mail.com	100000.00	Социальная поддержка	3
4	Наука и Образование	edu@mail.com	300000.00	Образовательный проект	4
5	Animal Help	animals@mail.com	150000.00	Помощь животным	5
\.


--
-- Data for Name: volunteer_attendance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.volunteer_attendance (volunteer_id, event_id, attended, check_in_time, check_out_time) FROM stdin;
1	1	t	2024-04-10 09:00:00	2024-04-10 13:00:00
2	2	t	2024-05-05 10:00:00	2024-05-05 16:00:00
3	3	t	2024-06-15 08:30:00	2024-06-15 12:30:00
4	4	t	2024-07-10 09:15:00	2024-07-10 12:45:00
5	5	t	2024-08-20 10:30:00	2024-08-20 14:30:00
\.


--
-- Data for Name: volunteer_availability; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.volunteer_availability (volunteer_id, available_from, available_to, preferred_days, event_id) FROM stdin;
1	2024-03-01	2024-06-30	Пн, Ср, Пт	1
2	2024-02-15	2024-07-20	Вт, Чт, Сб	2
3	2024-04-01	2024-09-01	Ср, Пт, Вс	3
4	2024-05-01	2024-10-01	Пн, Чт, Сб	4
5	2024-03-10	2024-08-15	Вт, Ср, Сб	5
\.


--
-- Data for Name: volunteer_service_rating; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.volunteer_service_rating (rating_id, volunteer_id, event_id, rating, comments) FROM stdin;
1	1	1	5	Прекрасная работа, много энтузиазма
2	2	2	4	Требует больше практики, но старается
3	3	3	5	Чувствуется искреннее желание помочь
4	4	4	5	Прекрасный педагог, умеет мотивировать
5	5	5	4	Очень добрый и заботливый, но немного стесняется
\.


--
-- Data for Name: volunteer_skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.volunteer_skills (volunteer_id, skill, level, event_id) FROM stdin;
1	Посадка деревьев	Эксперт	1
2	Программирование	Продвинутый	2
3	Социальные навыки	Средний	3
4	Преподавание	Эксперт	4
5	Уход за животными	Начинающий	5
\.


--
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.volunteers (volunteer_id, first_name, last_name, age, phone, address, university, email, gender, experience) FROM stdin;
1	Алихан	Нурланов	22	87011234567	Алматы, ул. Абай 10	КазНУ	alihan@mail.com	М	2 года
2	Айжан	Серикова	20	87025678901	Нур-Султан, ул. Тауелсиздик 15	ENU	aizhan@mail.com	Ж	1 год
3	Ерасыл	Муханов	25	87031239876	Шымкент, ул. Кунаева 5	МУИТ	erasyl@mail.com	М	3 года
4	Диана	Касымова	23	87045673219	Караганда, ул. Бейбитшилик 20	КарГУ	diana@mail.com	Ж	2 года
5	Куат	Бекенов	21	87058901234	Актобе, ул. Сарыарка 7	КазАТК	kuat@mail.com	М	1.5 года
\.


--
-- Name: certificates_certificate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.certificates_certificate_id_seq', 5, true);


--
-- Name: donations_donation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.donations_donation_id_seq', 20, true);


--
-- Name: events_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_event_id_seq', 5, true);


--
-- Name: feedback_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feedback_feedback_id_seq', 5, true);


--
-- Name: materials_material_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materials_material_id_seq', 10, true);


--
-- Name: organizations_organization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.organizations_organization_id_seq', 5, true);


--
-- Name: partnerships_partnership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.partnerships_partnership_id_seq', 1, false);


--
-- Name: projects_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_project_id_seq', 10, true);


--
-- Name: sponsors_sponsor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sponsors_sponsor_id_seq', 5, true);


--
-- Name: volunteer_service_rating_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.volunteer_service_rating_rating_id_seq', 5, true);


--
-- Name: volunteers_volunteer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.volunteers_volunteer_id_seq', 5, true);


--
-- Name: certificates certificates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT certificates_pkey PRIMARY KEY (certificate_id);


--
-- Name: donations donations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations
    ADD CONSTRAINT donations_pkey PRIMARY KEY (donation_id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (event_id);


--
-- Name: feedback feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (feedback_id);


--
-- Name: materials materials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_pkey PRIMARY KEY (material_id);


--
-- Name: organizations organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (organization_id);


--
-- Name: participation participation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participation
    ADD CONSTRAINT participation_pkey PRIMARY KEY (volunteer_id, project_id);


--
-- Name: partnerships partnerships_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partnerships
    ADD CONSTRAINT partnerships_pkey PRIMARY KEY (partnership_id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (project_id);


--
-- Name: sponsors sponsors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sponsors
    ADD CONSTRAINT sponsors_pkey PRIMARY KEY (sponsor_id);


--
-- Name: volunteer_attendance volunteer_attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteer_attendance
    ADD CONSTRAINT volunteer_attendance_pkey PRIMARY KEY (volunteer_id, event_id);


--
-- Name: volunteer_availability volunteer_availability_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteer_availability
    ADD CONSTRAINT volunteer_availability_pkey PRIMARY KEY (volunteer_id);


--
-- Name: volunteer_service_rating volunteer_service_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteer_service_rating
    ADD CONSTRAINT volunteer_service_rating_pkey PRIMARY KEY (rating_id);


--
-- Name: volunteer_skills volunteer_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteer_skills
    ADD CONSTRAINT volunteer_skills_pkey PRIMARY KEY (volunteer_id, skill);


--
-- Name: volunteers volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (volunteer_id);


--
-- Name: certificates certificates_volunteer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT certificates_volunteer_id_fkey FOREIGN KEY (volunteer_id) REFERENCES public.volunteers(volunteer_id);


--
-- Name: donations donations_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations
    ADD CONSTRAINT donations_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(event_id);


--
-- Name: donations donations_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations
    ADD CONSTRAINT donations_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(project_id);


--
-- Name: events events_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organizations(organization_id);


--
-- Name: feedback feedback_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(project_id);


--
-- Name: feedback feedback_volunteer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_volunteer_id_fkey FOREIGN KEY (volunteer_id) REFERENCES public.volunteers(volunteer_id);


--
-- Name: materials materials_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(project_id);


--
-- Name: participation participation_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participation
    ADD CONSTRAINT participation_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(project_id);


--
-- Name: participation participation_volunteer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participation
    ADD CONSTRAINT participation_volunteer_id_fkey FOREIGN KEY (volunteer_id) REFERENCES public.volunteers(volunteer_id);


--
-- Name: partnerships partnerships_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partnerships
    ADD CONSTRAINT partnerships_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organizations(organization_id);


--
-- Name: projects projects_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organizations(organization_id);


--
-- Name: sponsors sponsors_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sponsors
    ADD CONSTRAINT sponsors_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(event_id);


--
-- Name: volunteer_attendance volunteer_attendance_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteer_attendance
    ADD CONSTRAINT volunteer_attendance_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(event_id);


--
-- Name: volunteer_attendance volunteer_attendance_volunteer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteer_attendance
    ADD CONSTRAINT volunteer_attendance_volunteer_id_fkey FOREIGN KEY (volunteer_id) REFERENCES public.volunteers(volunteer_id);


--
-- Name: volunteer_availability volunteer_availability_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteer_availability
    ADD CONSTRAINT volunteer_availability_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(event_id);


--
-- Name: volunteer_availability volunteer_availability_volunteer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteer_availability
    ADD CONSTRAINT volunteer_availability_volunteer_id_fkey FOREIGN KEY (volunteer_id) REFERENCES public.volunteers(volunteer_id);


--
-- Name: volunteer_service_rating volunteer_service_rating_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteer_service_rating
    ADD CONSTRAINT volunteer_service_rating_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(event_id);


--
-- Name: volunteer_service_rating volunteer_service_rating_volunteer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteer_service_rating
    ADD CONSTRAINT volunteer_service_rating_volunteer_id_fkey FOREIGN KEY (volunteer_id) REFERENCES public.volunteers(volunteer_id);


--
-- Name: volunteer_skills volunteer_skills_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteer_skills
    ADD CONSTRAINT volunteer_skills_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(event_id);


--
-- Name: volunteer_skills volunteer_skills_volunteer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteer_skills
    ADD CONSTRAINT volunteer_skills_volunteer_id_fkey FOREIGN KEY (volunteer_id) REFERENCES public.volunteers(volunteer_id);


--
-- Name: TABLE certificates; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.certificates TO admin;
GRANT SELECT ON TABLE public.certificates TO viewer;


--
-- Name: TABLE donations; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.donations TO admin;
GRANT SELECT ON TABLE public.donations TO viewer;


--
-- Name: TABLE events; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.events TO admin;
GRANT SELECT,INSERT,UPDATE ON TABLE public.events TO manager;
GRANT SELECT ON TABLE public.events TO viewer;
GRANT SELECT ON TABLE public.events TO volunteer;


--
-- Name: TABLE feedback; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.feedback TO admin;
GRANT SELECT ON TABLE public.feedback TO viewer;


--
-- Name: TABLE materials; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.materials TO admin;
GRANT SELECT ON TABLE public.materials TO viewer;


--
-- Name: TABLE organizations; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.organizations TO admin;
GRANT SELECT ON TABLE public.organizations TO viewer;


--
-- Name: TABLE participation; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.participation TO admin;
GRANT SELECT,INSERT,UPDATE ON TABLE public.participation TO manager;
GRANT SELECT ON TABLE public.participation TO viewer;


--
-- Name: TABLE partnerships; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.partnerships TO admin;
GRANT SELECT ON TABLE public.partnerships TO viewer;


--
-- Name: TABLE projects; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.projects TO admin;
GRANT SELECT,INSERT,UPDATE ON TABLE public.projects TO manager;
GRANT SELECT ON TABLE public.projects TO viewer;


--
-- Name: TABLE sponsors; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.sponsors TO admin;
GRANT SELECT ON TABLE public.sponsors TO viewer;


--
-- Name: TABLE volunteer_attendance; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.volunteer_attendance TO admin;
GRANT SELECT ON TABLE public.volunteer_attendance TO viewer;


--
-- Name: TABLE volunteer_availability; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.volunteer_availability TO admin;
GRANT SELECT,INSERT,UPDATE ON TABLE public.volunteer_availability TO manager;
GRANT SELECT ON TABLE public.volunteer_availability TO viewer;


--
-- Name: TABLE volunteer_service_rating; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.volunteer_service_rating TO admin;
GRANT SELECT ON TABLE public.volunteer_service_rating TO viewer;


--
-- Name: TABLE volunteer_skills; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.volunteer_skills TO admin;
GRANT SELECT,INSERT,UPDATE ON TABLE public.volunteer_skills TO manager;
GRANT SELECT ON TABLE public.volunteer_skills TO viewer;


--
-- Name: TABLE volunteers; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.volunteers TO admin;
GRANT SELECT,INSERT,UPDATE ON TABLE public.volunteers TO manager;
GRANT SELECT ON TABLE public.volunteers TO viewer;
GRANT SELECT,UPDATE ON TABLE public.volunteers TO volunteer;


--
-- PostgreSQL database dump complete
--

