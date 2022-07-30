--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

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
-- Name: class; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.class (
    classid integer NOT NULL,
    classname character varying(50),
    text boolean,
    video boolean,
    picture boolean
);


--
-- Name: class_classid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.class_classid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: class_classid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.class_classid_seq OWNED BY public.class.classid;


--
-- Name: course; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.course (
    courseid integer NOT NULL,
    coursetitle character varying(60),
    coursedescription character varying(100),
    courseobjective character varying(60),
    prerequisites character varying(20),
    themeid integer,
    courseduration integer,
    coursevalue integer,
    status character varying(30),
    timespurchased integer,
    lasttimepurchased date
);


--
-- Name: course_courseid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.course_courseid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: course_courseid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.course_courseid_seq OWNED BY public.course.courseid;


--
-- Name: coursesquestions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.coursesquestions (
    qaccounting character varying(200),
    qaccounting2 character varying(200),
    qcomputers character varying(200),
    qbusiness1 character varying(200),
    qbusiness2 character varying(200)
);


--
-- Name: coursetheme; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.coursetheme (
    courseid integer,
    themeid integer
);


--
-- Name: finalquestionnaire; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.finalquestionnaire (
    finquestionnaireid integer NOT NULL,
    listfinalquestionnaire character varying(50)
);


--
-- Name: finalquestionnaire_finquestionnaire_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.finalquestionnaire_finquestionnaire_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: finalquestionnaire_finquestionnaire_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.finalquestionnaire_finquestionnaire_seq OWNED BY public.finalquestionnaire.finquestionnaireid;


--
-- Name: finquecourse; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.finquecourse (
    finquestionnaireid integer,
    courseid integer
);


--
-- Name: questionnaire; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.questionnaire (
    questionnaireid integer NOT NULL,
    listquestionnaire character varying(40)
);


--
-- Name: questionnaire_questionaireid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.questionnaire_questionaireid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: questionnaire_questionaireid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.questionnaire_questionaireid_seq OWNED BY public.questionnaire.questionnaireid;


--
-- Name: questionnairerelationship; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.questionnairerelationship (
    themeid integer,
    questionnaireid integer
);


--
-- Name: studentgrade; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.studentgrade (
    subscriptionid integer,
    userid integer,
    courseid integer,
    finquestionnaireid integer,
    finquestionnairegrade integer
);


--
-- Name: studentgradequestionnaire; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.studentgradequestionnaire (
    subscriptionid integer,
    themeid integer,
    questionnaireid integer,
    questionnairegrade integer
);


--
-- Name: subscription; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subscription (
    subscriptionid integer NOT NULL,
    userid integer,
    courseid integer,
    startdate date,
    enddate date,
    coursestate character varying(30)
);


--
-- Name: subscription_subscription_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subscription_subscription_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subscription_subscription_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subscription_subscription_seq OWNED BY public.subscription.subscriptionid;


--
-- Name: theme; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.theme (
    themeid integer NOT NULL,
    themetitle character varying(30)
);


--
-- Name: theme_themeid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.theme_themeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: theme_themeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.theme_themeid_seq OWNED BY public.theme.themeid;


--
-- Name: themeclasses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.themeclasses (
    themeid integer,
    class character varying(40)
);


--
-- Name: useractivity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.useractivity (
    useractivityid integer NOT NULL,
    userid integer,
    logintime date,
    logouttime date,
    messagesent boolean,
    courseid integer,
    coursestart time without time zone,
    courseend time without time zone
);


--
-- Name: useractivity_useractivityid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.useractivity_useractivityid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: useractivity_useractivityid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.useractivity_useractivityid_seq OWNED BY public.useractivity.useractivityid;


--
-- Name: usercourseoptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usercourseoptions (
    userid integer,
    courseid integer,
    status character varying(30)
);


--
-- Name: userrole; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.userrole (
    userid integer,
    userrole character varying(35)
);


--
-- Name: usertbl; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usertbl (
    userid integer NOT NULL,
    password character varying(40),
    email character varying(40)
);


--
-- Name: usertbl_userid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.usertbl_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: usertbl_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.usertbl_userid_seq OWNED BY public.usertbl.userid;


--
-- Name: class classid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.class ALTER COLUMN classid SET DEFAULT nextval('public.class_classid_seq'::regclass);


--
-- Name: course courseid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course ALTER COLUMN courseid SET DEFAULT nextval('public.course_courseid_seq'::regclass);


--
-- Name: finalquestionnaire finquestionnaireid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finalquestionnaire ALTER COLUMN finquestionnaireid SET DEFAULT nextval('public.finalquestionnaire_finquestionnaire_seq'::regclass);


--
-- Name: questionnaire questionnaireid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.questionnaire ALTER COLUMN questionnaireid SET DEFAULT nextval('public.questionnaire_questionaireid_seq'::regclass);


--
-- Name: subscription subscriptionid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscription ALTER COLUMN subscriptionid SET DEFAULT nextval('public.subscription_subscription_seq'::regclass);


--
-- Name: theme themeid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.theme ALTER COLUMN themeid SET DEFAULT nextval('public.theme_themeid_seq'::regclass);


--
-- Name: useractivity useractivityid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.useractivity ALTER COLUMN useractivityid SET DEFAULT nextval('public.useractivity_useractivityid_seq'::regclass);


--
-- Name: usertbl userid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usertbl ALTER COLUMN userid SET DEFAULT nextval('public.usertbl_userid_seq'::regclass);


--
-- Data for Name: class; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.class (classid, classname, text, video, picture) FROM stdin;
1	Accounting Asset	t	f	t
2	Accounting Management	f	f	t
3	Accounting Liability	t	f	f
4	Finance Capital	f	f	t
5	Finance Candle Stick	t	f	f
6	Finance Equity	f	t	t
7	Finance Taxation	t	t	f
8	Math Statistics	f	t	t
9	Math Algebra	t	f	f
10	Math Geometry	f	f	t
11	IT Programming	t	f	f
12	IT Databases	f	f	t
13	IT Netowrks	t	t	f
14	Tech Networks	f	t	t
15	Tech Social Media	t	t	f
16	Tech Multimedia	f	t	t
\.


--
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.course (courseid, coursetitle, coursedescription, courseobjective, prerequisites, themeid, courseduration, coursevalue, status, timespurchased, lasttimepurchased) FROM stdin;
1	Introduction to Accounting	First course for accounting students	Understand accounting	0	3	180	20	Active	2	2021-01-01
2	Intermediate Accounting	Second course for accounting students	Master accounting	1	3	180	20	Active	2	2021-04-15
3	Introduction to Computer	First course for computer students	Understand computer	1	4	180	30	Active	2	2021-04-01
4	Business 1	Business Management Course	Understanding Business rules	0	3	180	15	Active	2	2021-11-01
5	Business 2	2nd Business Management Course	Become a business man	1	3	180	45	Active	3	2021-10-15
\.


--
-- Data for Name: coursesquestions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.coursesquestions (qaccounting, qaccounting2, qcomputers, qbusiness1, qbusiness2) FROM stdin;
1	1	1	1	1
2	2	2	2	2
3	3	3	3	3
4	4	4	4	4
5	5	5	5	5
6	6	6	6	6
7	7	7	7	7
8	8	8	8	8
9	9	9	9	9
10	10	10	10	10
11	11	11	11	11
12	12	12	12	12
13	13	13	13	13
14	14	14	14	14
15	15	15	15	15
\.


--
-- Data for Name: coursetheme; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.coursetheme (courseid, themeid) FROM stdin;
1	1
1	2
1	3
2	1
2	2
2	3
3	4
3	5
\.


--
-- Data for Name: finalquestionnaire; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.finalquestionnaire (finquestionnaireid, listfinalquestionnaire) FROM stdin;
1	FinQueAccounting
2	FinQueFinance
3	FinQueEconomics
4	FinQueIT
5	FinQueTechnology
6	FinQueDatabases
7	FinQueMoney
8	FinQueBook
9	FinQueTaxes
10	FinQueCompanies
11	FinQueStartup
\.


--
-- Data for Name: finquecourse; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.finquecourse (finquestionnaireid, courseid) FROM stdin;
1	1
2	2
3	3
\.


--
-- Data for Name: questionnaire; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.questionnaire (questionnaireid, listquestionnaire) FROM stdin;
1	QuestionnaireAccounting
2	QuestionnaireFinance
3	QuestionnaireEconomics
4	QuestionnaireIT
5	QuestionnaireTechnology
\.


--
-- Data for Name: questionnairerelationship; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.questionnairerelationship (themeid, questionnaireid) FROM stdin;
1	1
2	2
3	3
4	4
5	5
\.


--
-- Data for Name: studentgrade; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.studentgrade (subscriptionid, userid, courseid, finquestionnaireid, finquestionnairegrade) FROM stdin;
1	1	1	1	80
2	1	2	2	62
3	1	3	3	80
4	3	1	4	83
5	3	2	5	60
6	2	3	6	63
7	1	4	7	100
8	2	5	8	95
9	3	4	9	24
10	1	5	10	76
11	3	5	11	80
\.


--
-- Data for Name: studentgradequestionnaire; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.studentgradequestionnaire (subscriptionid, themeid, questionnaireid, questionnairegrade) FROM stdin;
1	1	1	86
1	2	2	43
1	3	3	94
2	1	1	17
2	2	2	39
2	3	3	11
3	4	4	49
3	5	5	66
4	1	1	75
4	2	2	21
4	3	3	16
5	1	1	44
5	2	2	16
5	3	3	10
6	4	4	34
6	5	5	79
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.subscription (subscriptionid, userid, courseid, startdate, enddate, coursestate) FROM stdin;
1	1	1	2021-01-01	2021-06-30	Finished
2	1	2	2021-01-01	2021-06-30	InProgress
3	1	3	2021-04-01	2021-09-28	InProgress
4	3	1	2021-01-01	2021-06-30	InProgress
5	3	2	2021-04-01	2021-09-28	InProgress
6	2	3	2021-01-01	2021-06-30	InProgress
7	1	4	2021-11-01	2021-11-20	InProgress
8	2	5	2021-10-10	2021-10-30	Finished
9	3	4	2021-08-15	2021-09-01	Finished
10	1	5	2021-08-15	2021-09-25	Finished
11	3	5	2021-05-15	2021-05-30	Finished
\.


--
-- Data for Name: theme; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.theme (themeid, themetitle) FROM stdin;
1	Accounting
2	Finance
3	Economics
4	IT
5	Technology
\.


--
-- Data for Name: themeclasses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.themeclasses (themeid, class) FROM stdin;
1	Accounting Asset
1	Accounting Management
1	Accounting Liability
2	Finance Capital
2	Finance Candle Stick
2	Finance Equity
2	Finance Taxation
3	Math Statistics
3	Math Algebra
3	Math Geometry
4	IT Programming
4	IT Databases
4	IT Netowrks
5	Tech Networks
5	Tech Social Media
5	Tech Multimedia
\.


--
-- Data for Name: useractivity; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.useractivity (useractivityid, userid, logintime, logouttime, messagesent, courseid, coursestart, courseend) FROM stdin;
1	1	2021-01-20	2021-01-23	t	1	01:00:00	12:00:00
2	1	2021-03-21	2021-03-24	f	2	01:00:00	11:00:00
3	1	2021-05-20	2021-05-23	f	3	01:00:00	20:00:00
4	2	2021-07-19	2021-07-22	f	1	01:00:00	18:00:00
5	2	2021-09-17	2021-09-20	f	2	01:00:00	21:00:00
6	3	2021-11-16	2021-11-19	t	3	01:00:00	09:00:00
7	3	2021-01-15	2022-01-18	t	2	01:00:00	10:00:00
\.


--
-- Data for Name: usercourseoptions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.usercourseoptions (userid, courseid, status) FROM stdin;
1	1	Enroled
1	2	Enroled
1	3	Enroled
2	1	Enroled
2	2	Enroled
2	3	Not enroled
3	1	Not enroled
3	2	Not enroled
3	3	Enroled
\.


--
-- Data for Name: userrole; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.userrole (userid, userrole) FROM stdin;
1	Manager
2	Student
3	Administrator
\.


--
-- Data for Name: usertbl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.usertbl (userid, password, email) FROM stdin;
1	A12	a@a.com
2	L45	b@b.com
3	K46	c@c.com
4	\N	\N
5	\N	\N
6	\N	\N
7	\N	\N
\.


--
-- Name: class_classid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.class_classid_seq', 1, false);


--
-- Name: course_courseid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.course_courseid_seq', 1, true);


--
-- Name: finalquestionnaire_finquestionnaire_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.finalquestionnaire_finquestionnaire_seq', 1, false);


--
-- Name: questionnaire_questionaireid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.questionnaire_questionaireid_seq', 1, false);


--
-- Name: subscription_subscription_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subscription_subscription_seq', 1, false);


--
-- Name: theme_themeid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.theme_themeid_seq', 1, false);


--
-- Name: useractivity_useractivityid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.useractivity_useractivityid_seq', 1, false);


--
-- Name: usertbl_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.usertbl_userid_seq', 1, false);


--
-- Name: class class_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_pkey PRIMARY KEY (classid);


--
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (courseid);


--
-- Name: finalquestionnaire finalquestionnaire_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finalquestionnaire
    ADD CONSTRAINT finalquestionnaire_pkey PRIMARY KEY (finquestionnaireid);


--
-- Name: questionnaire questionnaire_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_pkey PRIMARY KEY (questionnaireid);


--
-- Name: subscription subscription_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscription
    ADD CONSTRAINT subscription_pkey PRIMARY KEY (subscriptionid);


--
-- Name: theme theme_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.theme
    ADD CONSTRAINT theme_pkey PRIMARY KEY (themeid);


--
-- Name: useractivity useractivity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.useractivity
    ADD CONSTRAINT useractivity_pkey PRIMARY KEY (useractivityid);


--
-- Name: usertbl usertbl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usertbl
    ADD CONSTRAINT usertbl_pkey PRIMARY KEY (userid);


--
-- Name: course course_themeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_themeid_fkey FOREIGN KEY (themeid) REFERENCES public.theme(themeid);


--
-- Name: coursetheme coursetheme_courseid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coursetheme
    ADD CONSTRAINT coursetheme_courseid_fkey FOREIGN KEY (courseid) REFERENCES public.course(courseid);


--
-- Name: coursetheme coursetheme_themeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coursetheme
    ADD CONSTRAINT coursetheme_themeid_fkey FOREIGN KEY (themeid) REFERENCES public.theme(themeid);


--
-- Name: finquecourse finquecourse_courseid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finquecourse
    ADD CONSTRAINT finquecourse_courseid_fkey FOREIGN KEY (courseid) REFERENCES public.course(courseid);


--
-- Name: finquecourse finquecourse_finquestionnaireid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finquecourse
    ADD CONSTRAINT finquecourse_finquestionnaireid_fkey FOREIGN KEY (finquestionnaireid) REFERENCES public.finalquestionnaire(finquestionnaireid);


--
-- Name: questionnairerelationship questionnairerelationship_questionnaireid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.questionnairerelationship
    ADD CONSTRAINT questionnairerelationship_questionnaireid_fkey FOREIGN KEY (questionnaireid) REFERENCES public.questionnaire(questionnaireid);


--
-- Name: questionnairerelationship questionnairerelationship_themeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.questionnairerelationship
    ADD CONSTRAINT questionnairerelationship_themeid_fkey FOREIGN KEY (themeid) REFERENCES public.theme(themeid);


--
-- Name: studentgrade studentgrade_finquestionnaireid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.studentgrade
    ADD CONSTRAINT studentgrade_finquestionnaireid_fkey FOREIGN KEY (finquestionnaireid) REFERENCES public.finalquestionnaire(finquestionnaireid);


--
-- Name: studentgrade studentgrade_subscriptionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.studentgrade
    ADD CONSTRAINT studentgrade_subscriptionid_fkey FOREIGN KEY (subscriptionid) REFERENCES public.subscription(subscriptionid);


--
-- Name: studentgradequestionnaire studentgradequestionnaire_questionnaireid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.studentgradequestionnaire
    ADD CONSTRAINT studentgradequestionnaire_questionnaireid_fkey FOREIGN KEY (questionnaireid) REFERENCES public.questionnaire(questionnaireid);


--
-- Name: studentgradequestionnaire studentgradequestionnaire_subscriptionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.studentgradequestionnaire
    ADD CONSTRAINT studentgradequestionnaire_subscriptionid_fkey FOREIGN KEY (subscriptionid) REFERENCES public.subscription(subscriptionid);


--
-- Name: studentgradequestionnaire studentgradequestionnaire_themeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.studentgradequestionnaire
    ADD CONSTRAINT studentgradequestionnaire_themeid_fkey FOREIGN KEY (themeid) REFERENCES public.theme(themeid);


--
-- Name: subscription subscription_courseid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscription
    ADD CONSTRAINT subscription_courseid_fkey FOREIGN KEY (courseid) REFERENCES public.course(courseid);


--
-- Name: subscription subscription_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscription
    ADD CONSTRAINT subscription_userid_fkey FOREIGN KEY (userid) REFERENCES public.course(courseid);


--
-- Name: themeclasses themeclasses_themeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.themeclasses
    ADD CONSTRAINT themeclasses_themeid_fkey FOREIGN KEY (themeid) REFERENCES public.theme(themeid);


--
-- Name: useractivity useractivity_courseid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.useractivity
    ADD CONSTRAINT useractivity_courseid_fkey FOREIGN KEY (courseid) REFERENCES public.course(courseid);


--
-- Name: useractivity useractivity_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.useractivity
    ADD CONSTRAINT useractivity_userid_fkey FOREIGN KEY (userid) REFERENCES public.usertbl(userid);


--
-- Name: usercourseoptions usercourseoptions_courseid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usercourseoptions
    ADD CONSTRAINT usercourseoptions_courseid_fkey FOREIGN KEY (courseid) REFERENCES public.course(courseid);


--
-- Name: usercourseoptions usercourseoptions_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usercourseoptions
    ADD CONSTRAINT usercourseoptions_userid_fkey FOREIGN KEY (userid) REFERENCES public.usertbl(userid);


--
-- Name: userrole userrole_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.userrole
    ADD CONSTRAINT userrole_userid_fkey FOREIGN KEY (userid) REFERENCES public.usertbl(userid);


--
-- PostgreSQL database dump complete
--

