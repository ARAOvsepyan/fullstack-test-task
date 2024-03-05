CREATE DATABASE "fullstack-test-task"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE TABLE IF NOT EXISTS public.professors
(
    id uuid NOT NULL,
    last_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    first_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    patronymic character varying(255) COLLATE pg_catalog."default" NOT NULL,
    email character varying(255) COLLATE pg_catalog."default" NOT NULL,
    phone character varying(255) COLLATE pg_catalog."default" NOT NULL,
    num_of_thesis integer DEFAULT 0,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    CONSTRAINT professors_pkey PRIMARY KEY (id),
    CONSTRAINT professors_email_key UNIQUE (email),
    CONSTRAINT professors_phone_key UNIQUE (phone)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.professors
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS public.students
(
    id uuid NOT NULL,
    last_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    first_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    patronymic character varying(255) COLLATE pg_catalog."default" NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    CONSTRAINT students_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.students
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS public.theses
(
    id uuid NOT NULL,
    title character varying(255) COLLATE pg_catalog."default" NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "professorId" uuid,
    "studentId" uuid,
    CONSTRAINT theses_pkey PRIMARY KEY (id),
    CONSTRAINT "theses_professorId_fkey" FOREIGN KEY ("professorId")
        REFERENCES public.professors (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT "theses_studentId_fkey" FOREIGN KEY ("studentId")
        REFERENCES public.students (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.theses
    OWNER to postgres;

INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('a3c8c92b-ed6d-479b-9333-b8aa1bfd0dd8', 'Thurman', 'Miller', 'Meekova', 'thurman70ub@yandex.ru', '82031060646', '2024-02-04 00:14:45', '2024-02-04 00:14:45');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('f3f3eafd-78d2-4ebd-b132-71a32117fe70', 'Twanna', 'Ogle', 'Summerlinova', 'twanna1s0l@yandex.ru', '88968848776', '2024-02-29 16:29:02', '2024-02-29 16:29:02');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('5754903f-9261-48ef-8f3e-e87f96e9130d', 'Max', 'Karins', 'Santillanova', 'maxjbp@yandex.ru', '89496461215', '2024-01-24 13:48:59', '2024-01-24 13:48:59');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('f75cbe1f-a5da-4da0-a54c-c5dff37a8d02', 'Patsy', 'Bonner', 'Rissellova', 'patsydopelo@yandex.ru', '84268916335', '2024-01-23 18:50:31', '2024-01-23 18:50:31');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('17568bba-5383-47be-8071-0c0d145bf551', 'Lori', 'Gonzales', 'Carrollova', 'lori8lmlr@yandex.ru', '83769210311', '2024-02-13 19:47:00', '2024-02-13 19:47:00');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('ff383d84-b087-4712-a687-f7b93216df82', 'Sylvia', 'Sanchez', 'Mcarthurova', 'sylviaku82u@icloud.com', '87562630942', '2024-01-24 15:26:54', '2024-01-24 15:26:54');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('79a47514-e559-4e76-a200-a5a36c96f79a', 'Richard', 'Benitez', 'Plunkova', 'richardm1zz1@gmail.ru', '83478443754', '2024-01-15 12:17:32', '2024-01-15 12:17:32');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('2f22326e-7c72-49c6-b7cc-2ab7d9ff1716', 'Andrea', 'Harper', 'Knowlesova', 'andreax969st@icloud.com', '88124519901', '2024-02-08 03:18:00', '2024-02-08 03:18:00');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('a3540e55-f990-4e20-9e52-f5fd3136678c', 'Barbara', 'Woodard', 'Kellyova', 'barbaralak1e@icloud.com', '84623667871', '2024-01-06 21:54:03', '2024-01-06 21:54:03');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('11db1988-6f0a-459e-ab84-60518c633090', 'Willie', 'Streller', 'Cowerova', 'williekmfosi@mail.ru', '82837134217', '2024-02-17 08:37:34', '2024-02-17 08:37:34');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('abddd372-6493-401c-b554-fb70209e155d', 'Nathan', 'Moulton', 'Schepensova', 'nathanw04e98@mail.ru', '87261171413', '2024-01-08 02:41:33', '2024-01-08 02:41:33');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('bda70299-5092-40ed-822b-4c86e82ea292', 'Herbert', 'Bratton', 'Clarkova', 'herbertt5ejj@icloud.com', '83811940163', '2024-01-13 07:29:35', '2024-01-13 07:29:35');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('aeb7d500-642e-4e4c-b0d9-bd0f6a57cd3b', 'Kenneth', 'Martin', 'Mealerova', 'kennethtbze@icloud.com', '80594743950', '2024-03-01 17:42:54', '2024-03-01 17:42:54');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('b525666f-b925-4a57-b6fe-ac343325f233', 'Darrel', 'Wong', 'Ohova', 'darrelrx9hqa@icloud.com', '80492806841', '2024-02-22 01:21:44', '2024-02-22 01:21:44');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('38a60499-ce0e-4c78-8298-f6a2c626970a', 'Kevin', 'Walling', 'Lambertonova', 'kevin377u@mail.ru', '84778657068', '2024-02-24 03:12:47', '2024-02-24 03:12:47');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('5b890e6a-6bcd-41d2-b798-eca15692e3f5', 'Stanley', 'Larue', 'Mcconnellova', 'stanleytiwxy@mail.ru', '86122802336', '2024-01-06 07:47:01', '2024-01-06 07:47:01');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('1778ba0d-21e5-420b-acb6-e1b4e0223855', 'Diane', 'Berger', 'Fayova', 'dianelj2@mail.ru', '83249988160', '2024-02-01 09:14:57', '2024-02-01 09:14:57');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('b7094468-5e6b-4435-96e7-035c4d9fde0a', 'Charles', 'Johnson', 'Smithova', 'charlescl7nym@gmail.ru', '82849282144', '2024-02-14 06:37:35', '2024-02-14 06:37:35');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('c336299d-aa7e-4c0c-921c-290d852caeeb', 'Richard', 'Hammond', 'Naborsova', 'richardo0xsbn@yandex.ru', '87313840282', '2024-01-10 04:28:54', '2024-01-10 04:28:54');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('ce2b4329-1e07-4ad3-9b8a-477eba59db14', 'Pa', 'Combs', 'Voskampova', 'pa1nyhug@yandex.ru', '86264674101', '2024-01-19 00:43:14', '2024-01-19 00:43:14');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('3f34b199-4a07-4cc8-8d5d-34fe8f545a8b', 'Peter', 'Morrison', 'Daltonova', 'peterp66@yandex.ru', '82944964201', '2024-01-28 14:43:27', '2024-01-28 14:43:27');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('ea56e16f-1ab2-4e50-8151-3fb77b2b891a', 'Daryl', 'Achee', 'Daigleova', 'darylhy55@gmail.ru', '85652706398', '2024-01-02 18:24:10', '2024-01-02 18:24:10');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('a8ad70de-66f4-4769-b7d0-3e45fa5aff43', 'Krystal', 'Torres', 'Woodfordova', 'krystalo0p@yandex.ru', '85063783229', '2024-01-14 03:18:44', '2024-01-14 03:18:44');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('af07bfd3-4a2a-4ca2-bf15-c442b3f6acd9', 'David', 'Morris', 'Hamelova', 'david8akqe4@gmail.ru', '86030493308', '2024-02-12 01:08:06', '2024-02-12 01:08:06');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('39ec2c89-4b5b-45cb-86c5-74555455af20', 'Marshall', 'David', 'Cooperova', 'marshallo34ya@gmail.ru', '80052029319', '2024-01-20 23:48:43', '2024-01-20 23:48:43');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('3947aedf-5699-402b-9c7e-3a0f3474b536', 'Rhonda', 'Brock', 'Overturfova', 'rhonda8zsa@mail.ru', '85846058667', '2024-01-14 01:28:58', '2024-01-14 01:28:58');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('13fa2f2b-1bae-4900-84aa-d3bdb3b10de8', 'Patricia', 'Silvia', 'Allenova', 'patricia2r7rr@yandex.ru', '89451439430', '2024-02-16 14:03:02', '2024-02-16 14:03:02');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('ebe5fefc-973f-48a1-ae02-9b3a094ed8a0', 'Theresa', 'Callaghan', 'Brookova', 'theresavw8@icloud.com', '83715486102', '2024-01-07 19:37:28', '2024-01-07 19:37:28');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('fcbeb8bf-bf63-4b23-9dbd-079376bfee7e', 'John', 'Andrews', 'Patrickova', 'johncob@gmail.ru', '88621468865', '2024-02-24 04:50:18', '2024-02-24 04:50:18');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('eec4d1d7-2250-4ce6-b365-5befd4fac4cf', 'Susan', 'Tate', 'Sumterova', 'susando0@gmail.ru', '89942874344', '2024-02-21 20:08:39', '2024-02-21 20:08:39');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('9b138edd-3cec-469a-a518-9c18113eea92', 'Colleen', 'Taylor', 'Johnsonova', 'colleendrtu@mail.ru', '88675637944', '2024-02-24 01:15:45', '2024-02-24 01:15:45');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('9a4e4e11-821a-410d-a284-a092b8bc5d46', 'Bradley', 'Bensman', 'Viramontesova', 'bradleyatd@yandex.ru', '83037247696', '2024-02-29 17:04:12', '2024-02-29 17:04:12');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('ed606835-01c2-4a4d-a5ca-a837935e827f', 'Ruby', 'Ngo', 'Graberova', 'rubyrqkk@mail.ru', '89596871803', '2024-02-01 02:05:49', '2024-02-01 02:05:49');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('57ccb403-f0e1-42a3-b68c-f92724da13fb', 'Constance', 'Marshall', 'Hessova', 'constancepbk@mail.ru', '85124973913', '2024-01-27 01:45:37', '2024-01-27 01:45:37');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('61bcbf5f-4aed-4fb2-b038-049b110d74c7', 'Larry', 'Holmes', 'Vaughnova', 'larrytsco@yandex.ru', '88781808675', '2024-02-11 20:59:26', '2024-02-11 20:59:26');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('d9c9926b-f7c0-4cf1-aead-71cb07e92826', 'Janet', 'Godinho', 'Herreraova', 'janet61nb7h@yandex.ru', '88584439194', '2024-03-03 08:49:41', '2024-03-03 08:49:41');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('de2fbe4d-3832-4b9f-b82d-71d1b8c8d7ff', 'Amanda', 'King', 'Yoderova', 'amandan87j0@gmail.ru', '88371590169', '2024-02-19 16:12:08', '2024-02-19 16:12:08');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('f5cfaf63-1b1c-44f1-a33c-eb88597d4243', 'Nicole', 'Sinha', 'Leeova', 'nicoleblw@yandex.ru', '84745369584', '2024-02-02 14:38:32', '2024-02-02 14:38:32');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('cad83f2d-8d30-494e-a566-a56359b633a4', 'Alvin', 'Tornow', 'Fratesova', 'alvinqlm3@gmail.ru', '88267370879', '2024-02-10 10:19:48', '2024-02-10 10:19:48');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('efbb4934-7ef6-46d1-8354-94c4bfb651dd', 'Robert', 'Drake', 'Mckinleyova', 'robertodwfw@gmail.ru', '80395140871', '2024-03-03 18:49:03', '2024-03-03 18:49:03');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('4dce55f5-4f33-4f9c-b945-af028fb72587', 'Neva', 'Redford', 'Moralesova', 'neva0d3cf@icloud.com', '89377230464', '2024-01-03 17:26:31', '2024-01-03 17:26:31');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('5756276f-5bdd-4c3e-b04e-6fed7bb67b95', 'Mary', 'Cha', 'Mohmedova', 'maryl9nd0@mail.ru', '87124386146', '2024-01-06 15:23:11', '2024-01-06 15:23:11');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('213faf01-9c33-46fe-9e5c-6efb456c5f2a', 'Jane', 'Teague', 'Lozaova', 'janeu6v@gmail.ru', '83393316025', '2024-01-28 23:55:26', '2024-01-28 23:55:26');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('18d09ca4-f133-4159-ad20-3bb664a4b18f', 'Sherilyn', 'Shanks', 'Stanfillova', 'sherilynk6azj@yandex.ru', '80565189002', '2024-03-01 19:17:52', '2024-03-01 19:17:52');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('8ab34037-9796-4fb8-80c7-33f33f937a8c', 'Robert', 'Holtsclaw', 'Connorsova', 'robert5g0yy@icloud.com', '81566581821', '2024-02-05 23:35:59', '2024-02-05 23:35:59');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('08a10d6f-3802-4ae0-9a65-6943def364a5', 'William', 'Diaz', 'Pitchfordova', 'william87y@yandex.ru', '85980664386', '2024-02-16 11:20:41', '2024-02-16 11:20:41');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('e3c2a6da-8e15-4c65-892a-3d1ce0577ec6', 'Freddie', 'Haugabrook', 'Odomsova', 'freddiebscpd2@icloud.com', '80829122395', '2024-02-02 00:15:54', '2024-02-02 00:15:54');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('ef34d317-5527-41a9-86be-27d86706e1d7', 'Stephen', 'Meek', 'Culbrethova', 'stephennkcw2@mail.ru', '81571570119', '2024-02-10 22:35:26', '2024-02-10 22:35:26');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('4665be4c-16b5-4797-bd7a-9657da7c5fb7', 'Dean', 'Lee', 'Alconcelova', 'deanpiva2j@mail.ru', '82388589657', '2024-02-04 16:58:56', '2024-02-04 16:58:56');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('7ae4be4e-bc19-4052-8c46-5dc1b76f8f08', 'Vicki', 'Edward', 'Grayova', 'vickiesirg@icloud.com', '84211415940', '2024-01-15 03:45:53', '2024-01-15 03:45:53');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('8da66afc-50b8-4ef0-86d7-693b92b0592e', 'Krista', 'Maddox', 'Gaddyova', 'kristapit0@icloud.com', '89980558590', '2024-02-20 15:27:46', '2024-02-20 15:27:46');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('66989952-fad0-4c94-8675-a8c41d7579b2', 'Sammie', 'Harbison', 'Hooperova', 'sammiemyue9@icloud.com', '85230051512', '2024-02-26 14:48:49', '2024-02-26 14:48:49');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('ca63e091-70ce-46e1-9375-e23b1da8218e', 'Charles', 'Tavares', 'Rosalesova', 'charles4qe@mail.ru', '81341483989', '2024-01-30 16:03:36', '2024-01-30 16:03:36');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('94997f97-b0a5-495b-af1d-0932b4a73e4f', 'Glenda', 'Collins', 'Sloanova', 'glenda8ostn6@icloud.com', '84619570358', '2024-02-08 15:24:04', '2024-02-08 15:24:04');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('22b1935e-a467-4a24-9cf7-9017b3395cbb', 'Inez', 'Johnson', 'Berryova', 'inezhdy@icloud.com', '87314597482', '2024-01-23 17:09:13', '2024-01-23 17:09:13');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('369d6b69-00e9-44ef-a342-7bd2c6d330c0', 'Vanessa', 'Taylor', 'Franklinova', 'vanessatz2n@gmail.ru', '81121027729', '2024-02-29 07:27:48', '2024-02-29 07:27:48');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('8daae137-98df-4825-9c1f-7152ed2a0f1a', 'Clark', 'Ellsworth', 'Buddova', 'clarkwlxy8i@gmail.ru', '80761276692', '2024-02-11 07:51:21', '2024-02-11 07:51:21');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('0e4506a7-987d-477f-96fc-801e8c9c5b59', 'Meghan', 'Delgado', 'Armstrongova', 'meghann2167c@gmail.ru', '80678872271', '2024-01-12 18:52:42', '2024-01-12 18:52:42');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('fc96aea0-26ff-4a6c-9e95-de186df7afc0', 'Clarence', 'Henderson', 'Jonesova', 'clarencel93w5j@yandex.ru', '88154584378', '2024-02-15 20:09:48', '2024-02-15 20:09:48');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('1fc9fedd-2be4-4845-adc1-c79c854eedf5', 'Jack', 'Brodowski', 'Nastova', 'jacktzhqt@mail.ru', '86498760659', '2024-01-19 15:33:39', '2024-01-19 15:33:39');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('d040dd98-7950-4409-96d6-93235f616b86', 'Aaron', 'Tappen', 'Sadlerova', 'aaronvhnliz@yandex.ru', '87997175969', '2024-01-01 09:53:01', '2024-01-01 09:53:01');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('9a7b0e77-0494-41c2-b97b-9eb5fc8cae28', 'Ashley', 'Ford', 'Roseova', 'ashleyxznt1e@mail.ru', '89562805057', '2024-01-16 00:17:28', '2024-01-16 00:17:28');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('143cfbd9-85d0-4313-a17a-9d68712492c8', 'Kelly', 'Marion', 'Bentonova', 'kellyq2sd@yandex.ru', '84813468576', '2024-02-28 06:38:47', '2024-02-28 06:38:47');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('14af3e5e-e1b7-48f5-a1ed-1750499f328f', 'Chad', 'Branch', 'Sykoraova', 'chadha28t@yandex.ru', '89413068374', '2024-02-19 00:24:17', '2024-02-19 00:24:17');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('52d06eda-1eb2-4707-b694-557e29ed2ade', 'Sonia', 'Burton', 'Turbevilleova', 'sonia75g8gu@mail.ru', '85960895402', '2024-01-07 01:58:12', '2024-01-07 01:58:12');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('c02347c4-916a-46fd-9f89-0f3a63dff31a', 'Sandy', 'Hazel', 'Tuckerova', 'sandyuplixe@yandex.ru', '86556223591', '2024-02-26 06:54:56', '2024-02-26 06:54:56');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('d68d49f0-2d01-494a-bb45-e7aade01d3eb', 'William', 'Copland', 'Russellova', 'william9ch8n@mail.ru', '83826630681', '2024-01-13 07:18:26', '2024-01-13 07:18:26');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('39cb3ea9-0eb6-435c-9646-15a85db827d0', 'Richard', 'Malveaux', 'Leishmanova', 'richardtrd@yandex.ru', '84313190218', '2024-02-03 04:47:06', '2024-02-03 04:47:06');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('e0420d90-103f-4f92-a7ed-7c8380441600', 'Alice', 'Rozek', 'Hillova', 'alicetxgs@icloud.com', '88369927595', '2024-03-02 16:14:23', '2024-03-02 16:14:23');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('588b248f-1b77-42f9-854e-6e67592b0033', 'Jose', 'Snow', 'Hanselmanova', 'joseex24@yandex.ru', '87858688759', '2024-02-04 02:19:05', '2024-02-04 02:19:05');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('bdcd2998-c50d-4214-8d43-c07be5fb0edd', 'Kelly', 'Varner', 'Wilsonova', 'kelly0slw@icloud.com', '82035924112', '2024-02-26 23:04:17', '2024-02-26 23:04:17');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('34237c87-070d-4576-aa9d-a1b69c9d633c', 'John', 'Zavala', 'Bransonova', 'johnbz3rsb@gmail.ru', '89576037525', '2024-02-21 02:31:51', '2024-02-21 02:31:51');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('2eb540a4-dbd7-4ff1-a247-14e528392a66', 'Wendy', 'Smathers', 'Moonova', 'wendym13agk@yandex.ru', '88801909520', '2024-02-05 10:14:12', '2024-02-05 10:14:12');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('6c14c1f4-10bc-4fc0-a761-2b54a077ab0e', 'Edward', 'Bowlin', 'Allenova', 'edwardj30p@gmail.ru', '88756461092', '2024-02-29 06:57:29', '2024-02-29 06:57:29');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('3960d0b6-cc81-4427-8cc4-7133b3390a2f', 'Adam', 'Woodham', 'Stormsova', 'adamvnz9h2@gmail.ru', '80417127321', '2024-01-15 14:01:49', '2024-01-15 14:01:49');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('128b545e-3b91-46bc-9e16-f87ab1fc062b', 'Jerry', 'Mclaurin', 'Smithova', 'jerryqxihjl@yandex.ru', '89446318793', '2024-02-03 21:55:59', '2024-02-03 21:55:59');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('da7d29e7-bca8-4c9e-b3bd-9c1699f736fe', 'Norman', 'Rinderer', 'Cifuentesova', 'normanvzj2bt@icloud.com', '84945261308', '2024-01-20 00:40:34', '2024-01-20 00:40:34');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('66cbb792-0477-4cd3-a7ca-780db19aecb4', 'Judy', 'Long', 'Wrightova', 'judyuj56sr@mail.ru', '87119797382', '2024-02-12 05:38:59', '2024-02-12 05:38:59');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('c674acbb-e246-4503-b8dd-1d3f4bda6878', 'Cindy', 'Donald', 'Obergova', 'cindya14@yandex.ru', '87514010125', '2024-01-16 17:03:28', '2024-01-16 17:03:28');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('0640c5d1-3daa-4cb2-8170-2743abff7962', 'Thomas', 'Linn', 'Newtonova', 'thomas2mbgr2@yandex.ru', '89957825247', '2024-01-05 21:39:32', '2024-01-05 21:39:32');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('0830a21d-548c-4b1e-846c-3e628a816a41', 'Jeffery', 'Bratcher', 'Carmodyova', 'jefferyr5g6m@icloud.com', '80015864344', '2024-01-25 12:50:55', '2024-01-25 12:50:55');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('d369e293-2123-4b39-b317-bab456982835', 'Rosemary', 'Bergquist', 'Canaleova', 'rosemaryypd3@gmail.ru', '81993177143', '2024-02-23 03:54:49', '2024-02-23 03:54:49');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('f50bf1be-22f7-4716-a60b-a6910871c19c', 'Leeanne', 'Joshua', 'Talleyova', 'leeannerl7@yandex.ru', '80492064661', '2024-02-25 09:09:49', '2024-02-25 09:09:49');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('66bd9afe-fe82-4ee1-9ff4-6c94a4830dab', 'Carmen', 'Hill', 'Andersonova', 'carmenkck@icloud.com', '88522387597', '2024-03-02 22:44:56', '2024-03-02 22:44:56');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('0177d7e0-092d-41de-948d-9cfed3cbed62', 'Thomas', 'Scott', 'Westbrookova', 'thomas1feor@icloud.com', '87269287348', '2024-01-13 18:36:15', '2024-01-13 18:36:15');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('2607c164-537b-4af9-a66d-35b1b63e3035', 'Donald', 'Mcmillan', 'Estesova', 'donald0399rv@mail.ru', '88854014079', '2024-02-01 00:07:16', '2024-02-01 00:07:16');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('b1e8a5ad-30bc-4bca-88f7-faefd23a8b3d', 'Paul', 'Jacobs', 'Raileyova', 'paul8msb@gmail.ru', '83483782409', '2024-01-08 04:56:51', '2024-01-08 04:56:51');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('22c7275e-aeb8-41dc-af24-596f65d37a93', 'Harold', 'Collins', 'Katzova', 'harold477@icloud.com', '89855939213', '2024-01-28 06:58:39', '2024-01-28 06:58:39');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('2125ee7b-a123-437a-af6f-e5252a67edf0', 'Lana', 'Coral', 'Brownova', 'lana3up0@mail.ru', '87356774048', '2024-02-05 21:37:27', '2024-02-05 21:37:27');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('3fcf61a9-0c58-446c-a965-001d48bf433d', 'Frances', 'Hubbard', 'Serranoova', 'francesdsgqi@mail.ru', '85330966693', '2024-01-02 17:21:56', '2024-01-02 17:21:56');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('f9f9b756-6c56-4884-819c-92f4e30b75a1', 'Chris', 'Ogorman', 'Bodakova', 'christ68oq@mail.ru', '88023393094', '2024-01-11 06:38:24', '2024-01-11 06:38:24');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('6574b528-d587-4393-8c84-2eb67461b44d', 'Florencio', 'Poole', 'Hernandesova', 'florencio86gbq@mail.ru', '84950359468', '2024-02-13 05:08:00', '2024-02-13 05:08:00');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('a13dbf98-b2ea-4dc2-bfc4-bdb61590a041', 'Aimee', 'Salazar', 'Valadezova', 'aimeeu5nz@mail.ru', '83130373703', '2024-02-22 20:34:55', '2024-02-22 20:34:55');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('ace4b5b0-76d9-411d-8031-a0c30973d81c', 'Leo', 'Lopez', 'Hernandezova', 'leo9tumd@gmail.ru', '89825743759', '2024-02-03 14:50:24', '2024-02-03 14:50:24');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('b08d2039-bcc3-4d0f-9468-cad5230ee07a', 'Frances', 'Davis', 'Spanoova', 'franceshoqcmw@yandex.ru', '84407826766', '2024-02-02 07:57:14', '2024-02-02 07:57:14');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('572d132e-a065-48de-9ff2-87f657fade9f', 'David', 'Ovellette', 'Priesterova', 'davidgwde@gmail.ru', '88748778239', '2024-02-18 00:29:48', '2024-02-18 00:29:48');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('fdda9893-c4ef-4476-8caa-fb37784cc204', 'Candace', 'Edmunds', 'Blackova', 'candacerylyi@icloud.com', '84904875925', '2024-02-10 05:04:33', '2024-02-10 05:04:33');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('6ba38622-8142-4fca-b9ab-5e6ace1582a2', 'Alex', 'Jones', 'Schoeppova', 'alexl4v@gmail.ru', '85253446811', '2024-02-24 17:01:36', '2024-02-24 17:01:36');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('514b1d41-3c31-4996-8813-581d024a9d50', 'Robert', 'Pitts', 'Smallova', 'robertdk4d@gmail.ru', '85596485288', '2024-03-02 18:20:42', '2024-03-02 18:20:42');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('5130d1ee-fc1a-4e8c-8e40-f712415c3d15', 'Harold', 'Cormier', 'Pearceova', 'haroldeyo@icloud.com', '84500377060', '2024-01-28 08:13:37', '2024-01-28 08:13:37');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('d1e7d47c-c2f0-484a-b9c2-a5e657cd287f', 'Jeffrey', 'Potter', 'Toppinova', 'jeffreymcx5@gmail.ru', '85865543703', '2024-02-14 23:31:25', '2024-02-14 23:31:25');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('e76c38fe-7abb-4f31-b623-5c93fa41df4e', 'Maricruz', 'Peterson', 'Blandingova', 'maricruz6td3@icloud.com', '80805113152', '2024-02-21 13:17:26', '2024-02-21 13:17:26');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('d2ed2920-71e3-4089-9802-832f1336fb16', 'Janice', 'Creighton', 'Ellingtonova', 'janiceetz3p@gmail.ru', '84239139539', '2024-01-23 18:28:38', '2024-01-23 18:28:38');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('4762c179-f770-4d66-93e9-dffb48b9f59d', 'Gwyneth', 'Barredo', 'Mackeyova', 'gwynethh4vx@yandex.ru', '87615028487', '2024-01-03 18:16:08', '2024-01-03 18:16:08');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('186c7bf5-2ef8-42ed-8f76-d78c9da3a1b7', 'Leona', 'Smith', 'Berndtova', 'leonafgp4j6@icloud.com', '87338955799', '2024-02-29 11:02:00', '2024-02-29 11:02:00');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('4522b44e-dfc1-4f9d-9934-45711e2b843b', 'Allen', 'Ramos', 'Rayova', 'allenlh836@gmail.ru', '88830203391', '2024-02-08 02:05:52', '2024-02-08 02:05:52');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('f1710f44-8744-494e-a2be-75f0c6d4cc43', 'Alvin', 'Willner', 'Bishopova', 'alvinqy0@mail.ru', '82447467483', '2024-02-05 14:34:37', '2024-02-05 14:34:37');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('9972a40e-6502-49f0-b531-a4bf9e56ca7a', 'Dean', 'Schultz', 'Wycheova', 'deanq2f1@icloud.com', '82062444422', '2024-02-28 12:45:47', '2024-02-28 12:45:47');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('c38d2f2c-ecca-4df4-96c1-4a5addb12991', 'Liberty', 'Roe', 'Inmanova', 'libertymqp3o9@yandex.ru', '80780071565', '2024-01-01 08:41:52', '2024-01-01 08:41:52');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('f2c7a843-20fa-4f0a-81a0-b974ee89f72e', 'Herman', 'Makinen', 'Hansenova', 'hermanb7ca@gmail.ru', '89128674271', '2024-01-06 16:10:28', '2024-01-06 16:10:28');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('79fa4497-e94b-4b10-bcdc-77c0344b2ac9', 'Katherine', 'Boatwright', 'Stevensova', 'katherineo9n4@gmail.ru', '84784032215', '2024-01-05 02:09:52', '2024-01-05 02:09:52');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('20d89f15-c5ec-41f1-ab4d-06b09d2af253', 'Cindy', 'Trautman', 'Larkinova', 'cindy1e1@yandex.ru', '88359979707', '2024-02-13 04:03:43', '2024-02-13 04:03:43');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('89351c7f-1b93-4704-8de4-0e80f5d6d4fd', 'Steve', 'Godsey', 'Wallaceova', 'stevenyy96@gmail.ru', '80614224090', '2024-02-22 17:39:02', '2024-02-22 17:39:02');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('44a3c610-71ba-44f5-aedf-5a346b2bcbe1', 'Helena', 'Yohe', 'Sturgisova', 'helenaum08@icloud.com', '82666399777', '2024-01-31 11:26:12', '2024-01-31 11:26:12');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('c9d92d29-50c2-4da3-9fa4-11924a1212b3', 'Brian', 'Hooten', 'Worthyova', 'brian6ajop@gmail.ru', '87236678636', '2024-02-28 11:18:40', '2024-02-28 11:18:40');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('9e4907ef-8e29-4f7d-93cd-d5eca7d8ab85', 'Doris', 'Lake', 'Barkerova', 'doriszx2o@yandex.ru', '80101057257', '2024-01-22 21:49:11', '2024-01-22 21:49:11');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('1bd78ba6-0a14-4493-b0e1-b199d9d7dbd4', 'Manuel', 'Camacho', 'Jonesova', 'manuellsi0sk@mail.ru', '80872898027', '2024-01-17 15:23:38', '2024-01-17 15:23:38');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('29c1f303-4ddf-4754-a156-0ef5054630fb', 'Terrance', 'Sharp', 'Seguraova', 'terrancetf356q@icloud.com', '81732972927', '2024-03-01 05:16:57', '2024-03-01 05:16:57');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('7e119971-cd0a-46db-9585-d895d46f785e', 'Lisa', 'Rink', 'Fifieldova', 'lisa3r9@yandex.ru', '81725658028', '2024-02-06 09:17:23', '2024-02-06 09:17:23');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('67071f57-ce30-4f86-950c-9f93c1331663', 'Samuel', 'Laws', 'Carpenterova', 'samuelf31@icloud.com', '80717044396', '2024-01-31 12:10:14', '2024-01-31 12:10:14');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('1b944152-c642-4b77-995a-6fe62fce66a1', 'James', 'Ivory', 'Grahamova', 'jamest08@gmail.ru', '85000936608', '2024-02-27 17:31:49', '2024-02-27 17:31:49');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('425f83fd-16e8-48ae-ae0c-0f4772da1601', 'Jeanette', 'Lamb', 'Andersonova', 'jeanettejga@icloud.com', '89953296365', '2024-01-27 06:27:46', '2024-01-27 06:27:46');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('658825b3-fd54-4dbf-9a70-0b7a3eee1cd5', 'Dennis', 'Hall', 'Bordersova', 'dennisc01w@icloud.com', '82323663259', '2024-01-07 00:50:33', '2024-01-07 00:50:33');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('f93a7959-62a1-4081-a21d-71310fc0e7d7', 'Charles', 'Wiltfong', 'Hagstromova', 'charlesyvep@mail.ru', '81632134875', '2024-02-13 00:09:47', '2024-02-13 00:09:47');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('2356dbc4-6734-4062-a585-a45f845220b6', 'Marla', 'Dean', 'Vowellova', 'marlap9th5g@gmail.ru', '86063471838', '2024-02-05 14:29:58', '2024-02-05 14:29:58');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('858cad16-81dc-40f5-b76c-0adb9b14c03f', 'Kyle', 'Noblitt', 'Wagonerova', 'kyle9ayrzy@mail.ru', '84466212762', '2024-01-31 03:37:18', '2024-01-31 03:37:18');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('20c74d58-9a04-4d6a-95e0-2569e22d679f', 'Alice', 'Shetler', 'Wyssova', 'alice8c53e@icloud.com', '89209130259', '2024-01-01 11:16:23', '2024-01-01 11:16:23');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('0dcf686d-7d1d-4870-be81-67727fc1cce5', 'William', 'Kinter', 'Plottsova', 'williamb0ydu6@yandex.ru', '85954415345', '2024-02-11 13:20:11', '2024-02-11 13:20:11');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('cef312ab-7a04-4efe-9463-3d265cdcaf7e', 'Mattie', 'Carter', 'Wingetova', 'mattie8k8w@yandex.ru', '83497974765', '2024-02-28 03:11:38', '2024-02-28 03:11:38');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('debd1f6d-0b96-4702-8842-41cff229e8db', 'Heather', 'Rodriguez', 'Huffmanova', 'heather2gg2@mail.ru', '85997145180', '2024-02-20 03:52:19', '2024-02-20 03:52:19');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('65a0bbb6-18f5-4fa8-9d10-bc6eddc21a77', 'Dovie', 'Ochoa', 'Hillova', 'dovie4g5sa@mail.ru', '83480341824', '2024-01-25 13:11:11', '2024-01-25 13:11:11');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('53b5ffa3-cc68-41d9-8b56-5715741764b1', 'Robert', 'Peco', 'Bradfordova', 'robert0oq6o@icloud.com', '81219591193', '2024-02-01 10:30:53', '2024-02-01 10:30:53');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('1961300e-bb98-4ecc-86be-191b1b2c1dca', 'Joshua', 'Ott', 'Godfreyova', 'joshuayyixv@mail.ru', '81744463830', '2024-03-02 15:15:54', '2024-03-02 15:15:54');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('2d7d9f42-b5e3-46bc-a21f-d81e81545cf7', 'Juanita', 'Johnson', 'Campbellova', 'juanitaux8m4t@mail.ru', '81734778690', '2024-03-02 10:53:14', '2024-03-02 10:53:14');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('2df8e6b0-3a1a-487f-a0f4-979f0a9a81c8', 'Debra', 'Fields', 'Eisenhowerova', 'debraautzd@yandex.ru', '86395918742', '2024-01-19 17:36:49', '2024-01-19 17:36:49');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('052cce56-1772-454f-8609-2a6ea808a321', 'Sherlene', 'Kelley', 'Salbergova', 'sherlenebsxm@yandex.ru', '82473175585', '2024-02-19 10:48:16', '2024-02-19 10:48:16');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('ed9f3428-7a65-4e73-b8b0-f5777c364dba', 'Jackie', 'Gross', 'Resnickova', 'jackieellay@icloud.com', '88095288941', '2024-02-03 12:41:02', '2024-02-03 12:41:02');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('46639d42-5234-4044-807a-59d85c4f1249', 'Freddie', 'Kimbro', 'Smithova', 'freddie9sm@gmail.ru', '84983536371', '2024-01-09 06:26:10', '2024-01-09 06:26:10');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('9511f3b4-1433-440d-923e-b5c30bc15684', 'Teresa', 'Wittner', 'Cashova', 'teresa1c6dr@gmail.ru', '89107458335', '2024-02-22 11:01:51', '2024-02-22 11:01:51');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('b55f91da-d06c-412d-ad6a-6cb9375a670a', 'Robert', 'Stehlik', 'Cahillova', 'robert215t@icloud.com', '80128241775', '2024-02-15 07:03:48', '2024-02-15 07:03:48');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('d5c5c499-f015-428b-b907-3e6f4f184058', 'Irene', 'Klinger', 'Horstmannova', 'irenep68@gmail.ru', '86379644261', '2024-02-21 08:43:28', '2024-02-21 08:43:28');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('7498224e-2589-47e1-a9cf-ca2ec62bfbc5', 'Beverly', 'Riojas', 'Wlodarekova', 'beverlyiro@icloud.com', '81498898576', '2024-02-24 17:50:46', '2024-02-24 17:50:46');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('9513feea-f7d7-4216-b5a8-78d46a956f1b', 'Roberto', 'Hooper', 'Pickardova', 'robertohn08@mail.ru', '81607868580', '2024-02-28 00:23:43', '2024-02-28 00:23:43');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('8ca396fb-3bbb-4125-abc7-a429b24f3a32', 'Phillip', 'Pierce', 'Hinojosaova', 'philliptla@yandex.ru', '89914853381', '2024-02-03 13:44:24', '2024-02-03 13:44:24');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('607da2e6-280c-4f12-b290-3c236e902805', 'John', 'Thomas', 'Gayova', 'johnjj4ba0@icloud.com', '83382710316', '2024-03-03 02:15:11', '2024-03-03 02:15:11');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('9590fe48-479e-4582-9c67-265c2face088', 'Hilda', 'Pierson', 'Araujoova', 'hildawcg@gmail.ru', '81134437000', '2024-02-26 21:55:08', '2024-02-26 21:55:08');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('c666f9a2-ff9a-44b8-bb39-9aefbdb24d3f', 'Kelly', 'Kelly', 'Robinsonova', 'kelly1dvtnx@mail.ru', '86554397063', '2024-03-01 08:04:17', '2024-03-01 08:04:17');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('25f598ec-df85-4de8-81cc-5049c9013487', 'Patrick', 'Windish', 'Daviesova', 'patrick5m3@mail.ru', '82087198439', '2024-03-02 23:43:13', '2024-03-02 23:43:13');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('1e8ca225-cd1e-4bae-99c8-714c7e0b6f0f', 'Edward', 'Miller', 'Moralesova', 'edward63t@icloud.com', '84090174260', '2024-02-11 18:32:40', '2024-02-11 18:32:40');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('13d6c059-d884-4d6e-828d-9a16520e00c2', 'Betty', 'Ochoa', 'Smithova', 'bettytcz@gmail.ru', '83105009590', '2024-01-24 07:09:01', '2024-01-24 07:09:01');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('33b5de0e-0898-4457-957e-b021ed758273', 'Melinda', 'Reed', 'Prattova', 'melinda0la@gmail.ru', '80649813807', '2024-02-01 01:49:58', '2024-02-01 01:49:58');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('5b87a38b-f277-4be5-9cf4-4324d4703e95', 'Michael', 'Mays', 'Oliveroova', 'michael8ql7@icloud.com', '89510512810', '2024-01-31 11:47:09', '2024-01-31 11:47:09');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('e0993c48-8899-48ad-80e3-d518b10c7b63', 'Doris', 'Fields', 'Frederickova', 'doris4dqgyc@gmail.ru', '81053593886', '2024-01-10 08:53:57', '2024-01-10 08:53:57');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('1c4247e4-89bd-45b6-8147-e82d091b8890', 'Orlando', 'Walsh', 'Mitchellova', 'orlando9nom3g@gmail.ru', '86056736128', '2024-01-18 11:10:46', '2024-01-18 11:10:46');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('a4cf7dfe-7ef3-462a-a222-46991d7f2cdc', 'Eric', 'Navarez', 'Bertheletteova', 'eric5mm@mail.ru', '81294277167', '2024-02-03 08:36:27', '2024-02-03 08:36:27');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('64fb479e-51b2-4545-9525-e5f28c7f48e2', 'Curtis', 'Davidson', 'Duranova', 'curtis03n@mail.ru', '84971136469', '2024-02-26 01:23:25', '2024-02-26 01:23:25');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('dd7b4102-bf3b-45bd-9294-cb3ffc0fd2c6', 'Lee', 'Putzier', 'Riosova', 'leeg16@gmail.ru', '81132287602', '2024-02-07 21:04:32', '2024-02-07 21:04:32');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('9c40f382-323a-466d-af5b-8c32e3ef5e4e', 'Bradley', 'Williams', 'Jamesova', 'bradleyjdv87n@mail.ru', '80919350158', '2024-02-09 20:01:44', '2024-02-09 20:01:44');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('bf53e575-e11a-4ab8-b7b6-4c1cb777c64f', 'Lisa', 'Loureiro', 'Justova', 'lisalrel@yandex.ru', '87817943448', '2024-01-29 17:14:04', '2024-01-29 17:14:04');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('bb7d91c4-5561-4d4c-8cb6-1a0095712152', 'Lincoln', 'Middleton', 'Carltonova', 'lincoln5k00pf@mail.ru', '89076131194', '2024-01-26 09:17:38', '2024-01-26 09:17:38');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('9b5ecf19-972d-4e1a-826d-2c4f2b696b1d', 'Derrick', 'Brown', 'Langowskiova', 'derrick0tx6@mail.ru', '80082424890', '2024-01-25 07:10:54', '2024-01-25 07:10:54');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('e098eef0-0ec2-47ad-a902-9c99cc847242', 'Jody', 'Smith', 'Swangerova', 'jodyr9j@yandex.ru', '89140107845', '2024-01-12 06:10:02', '2024-01-12 06:10:02');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('15dd1488-0b75-485d-80c1-b35e6ab66a7e', 'Marion', 'High', 'Hinsonova', 'marionj1w@mail.ru', '83557399672', '2024-02-10 21:34:06', '2024-02-10 21:34:06');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('da20befc-b46e-4446-878d-8fe3cc121d12', 'Becky', 'Stoker', 'Marcumova', 'becky9m5@gmail.ru', '89302628971', '2024-02-14 05:04:17', '2024-02-14 05:04:17');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('e530b1e3-4517-4f03-9e8c-3dc546757d5c', 'Robert', 'Cusack', 'Stephensova', 'robertt9j@yandex.ru', '85038844392', '2024-02-01 01:36:10', '2024-02-01 01:36:10');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('3158a202-bbd9-4dfb-8cde-aea4ad71eed1', 'Jose', 'Cook', 'Villarrealova', 'joseg134@mail.ru', '87285545898', '2024-01-31 17:33:28', '2024-01-31 17:33:28');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('e39c4c8d-9f58-46cd-8428-44b60ca9e0b7', 'Alex', 'Robinson', 'Mcgowanova', 'alexcq8z@gmail.ru', '84925011060', '2024-02-01 09:27:35', '2024-02-01 09:27:35');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('8268bd6f-4540-4d11-a250-6e05e509039a', 'Grace', 'Carbajal', 'Montgomeryova', 'gracez9v0m@yandex.ru', '85390180972', '2024-01-15 05:10:50', '2024-01-15 05:10:50');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('62998dac-3663-45f3-9338-b814ca85468c', 'Lynn', 'Salgado', 'Finleyova', 'lynn4wxuog@icloud.com', '84710211959', '2024-02-05 08:48:25', '2024-02-05 08:48:25');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('6e26cdb2-3a3b-474e-8002-d1d2dbe35ab3', 'Delsie', 'Heil', 'Ottoova', 'delsiemqfpz@mail.ru', '83454637049', '2024-02-29 11:57:57', '2024-02-29 11:57:57');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('50ea9c44-8487-472b-87c3-9762efc966ba', 'Nell', 'Kauffman', 'Bolenova', 'nell1401@icloud.com', '81276118120', '2024-01-03 02:04:11', '2024-01-03 02:04:11');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('5bb2b69c-6383-42d1-8737-469980949d4a', 'Margaret', 'Fabela', 'Hueyova', 'margaretl0kyk@mail.ru', '82257845556', '2024-02-18 15:55:45', '2024-02-18 15:55:45');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('319693b0-3a8e-41e1-8de5-e61d0f97bebe', 'Daniel', 'Bittner', 'Agnewova', 'danielplou@gmail.ru', '85731640726', '2024-02-21 20:51:24', '2024-02-21 20:51:24');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('c9db1f16-f5d7-4b9a-b514-c6155a7a7239', 'Larry', 'Marchant', 'Romanova', 'larrysj786k@icloud.com', '82426645419', '2024-02-09 04:08:12', '2024-02-09 04:08:12');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('35f402b3-27e4-4138-b49d-38e48bbb5762', 'Malissa', 'Fletcher', 'Howardova', 'malissak09@gmail.ru', '82311767159', '2024-02-07 03:09:18', '2024-02-07 03:09:18');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('1146a8b8-5a49-4007-bb0f-19d77d4d1eae', 'Ann', 'Spearman', 'Coleova', 'ann39kfhy@icloud.com', '81796019066', '2024-01-01 21:14:44', '2024-01-01 21:14:44');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('0a0ae12c-3079-4ddb-a78a-6e93b3ade791', 'Lisa', 'Pete', 'Paceova', 'lisarbdau@yandex.ru', '89063001602', '2024-02-16 23:52:46', '2024-02-16 23:52:46');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('b1d107c9-def6-413b-b94e-889e8409995e', 'Heather', 'Godinez', 'Cardenasova', 'heatherewaf9@gmail.ru', '86452837973', '2024-01-17 18:53:47', '2024-01-17 18:53:47');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('686925df-4ead-4ab8-96a2-87d6e8a8b8cc', 'Harold', 'Johnson', 'Littleova', 'harold18i@gmail.ru', '82419277238', '2024-02-07 10:10:16', '2024-02-07 10:10:16');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('32fe9d0f-33db-471c-b51d-f81bc465d8c9', 'Andrea', 'Phillips', 'Spanova', 'andreac9fhy@yandex.ru', '83716810328', '2024-01-10 23:23:02', '2024-01-10 23:23:02');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('a4ac132d-1008-4148-8b46-705fbf7635fb', 'Elizabeth', 'Heston', 'Lockettova', 'elizabethek7y@mail.ru', '84546911515', '2024-01-07 06:25:58', '2024-01-07 06:25:58');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('bf8c9fb9-beb9-41c9-abe3-06cb8db81401', 'Benjamin', 'Reck', 'Shelstadova', 'benjaminp3rr@mail.ru', '89277181972', '2024-01-23 22:28:30', '2024-01-23 22:28:30');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('5da0a20a-1a15-4ef7-bc5c-9de659dcf717', 'Keith', 'Sipple', 'Moncayoova', 'keithon9qp@icloud.com', '85277228274', '2024-02-12 13:58:51', '2024-02-12 13:58:51');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('52c9710e-306f-41ea-a12a-736e3668c424', 'Amy', 'Holmes', 'Fleemanova', 'amy9inov@icloud.com', '86577169373', '2024-02-22 06:00:18', '2024-02-22 06:00:18');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('7f1a23de-b777-4044-a35b-b280b2aa288c', 'Wanda', 'Lampron', 'Pennaova', 'wandapj7x@mail.ru', '80249202187', '2024-01-01 21:38:53', '2024-01-01 21:38:53');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('81246d19-730c-48ee-b175-a22d9192b147', 'Wendy', 'Tribble', 'Guerreroova', 'wendyord@icloud.com', '80069720833', '2024-01-27 17:41:02', '2024-01-27 17:41:02');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('386a77f8-1ea1-4945-a9d4-5ee39051db1f', 'Nora', 'Smith', 'Rollinsova', 'nora5jby@mail.ru', '88422019283', '2024-01-02 03:02:21', '2024-01-02 03:02:21');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('b86f03c9-6262-4c8c-9724-9a4190680820', 'Clayton', 'Brown', 'Lebrunova', 'claytonwgh9@yandex.ru', '86489366763', '2024-01-03 10:00:05', '2024-01-03 10:00:05');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('39469e77-7ccd-4a90-9afe-4d12052ebcf3', 'Theresa', 'Gray', 'Corbittova', 'theresaym5i2@gmail.ru', '85176550496', '2024-01-09 04:43:59', '2024-01-09 04:43:59');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('f0eec7c3-9c12-4507-86ea-052b6eb8c2cc', 'Irene', 'Johnson', 'Hutchesonova', 'ireneg9rqh@icloud.com', '89931089199', '2024-02-04 16:36:47', '2024-02-04 16:36:47');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('b261f774-2b85-4f84-b3f3-defc09e3c106', 'Marion', 'Cremer', 'Coleova', 'marionaufad@mail.ru', '87497339815', '2024-01-24 19:54:18', '2024-01-24 19:54:18');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('7b104a22-298d-4898-a192-3f01e0245f4d', 'Richard', 'Sperling', 'Coreyova', 'richardumo@icloud.com', '86013486581', '2024-03-01 10:04:08', '2024-03-01 10:04:08');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('41ea3f49-0a84-46c6-b22a-5fb5cd62ed7d', 'Bobby', 'Edmunds', 'Ohmenova', 'bobbyrz593@icloud.com', '87442566781', '2024-02-28 23:24:26', '2024-02-28 23:24:26');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('55606e82-feb6-47d7-9e6c-0e93348ae117', 'Mathew', 'Willard', 'Stavisova', 'mathewqo0i@icloud.com', '84284474732', '2024-01-24 21:09:30', '2024-01-24 21:09:30');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('43a3d37d-d9e8-40dc-8b3e-4a579783692a', 'John', 'Jacobson', 'Palmerova', 'john58m@mail.ru', '86893855670', '2024-01-25 00:18:05', '2024-01-25 00:18:05');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('8f5726dc-9d9c-4d81-b05b-80b89121e537', 'Eric', 'Rupp', 'Gomezova', 'eric4tq3j@gmail.ru', '81411639043', '2024-01-04 12:33:03', '2024-01-04 12:33:03');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('2179c6a7-8af4-405f-860c-9c2fc3dea8cc', 'Jose', 'Edie', 'Girtonova', 'joseisaz8@yandex.ru', '81136579761', '2024-01-21 22:18:14', '2024-01-21 22:18:14');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('fa3050a9-6749-436d-ad39-831981321cb2', 'Debra', 'Ball', 'Wamplerova', 'debra8a89a9@gmail.ru', '85881011685', '2024-01-31 23:39:28', '2024-01-31 23:39:28');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('4393ba4d-5156-418f-ab0d-7e75200eb7ac', 'John', 'Province', 'Soaresova', 'johntkwa2@yandex.ru', '80842258029', '2024-01-13 10:41:15', '2024-01-13 10:41:15');
INSERT INTO public.professors(
    id, last_name, first_name, patronymic, email, phone, "createdAt", "updatedAt")
    VALUES ('98f07d94-20b5-4635-94c4-bd98138a09e8', 'Orval', 'Hancock', 'Jacksonova', 'orval9mr26@gmail.ru', '87369613362', '2024-03-01 05:50:53', '2024-03-01 05:50:53');

INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('e9df5b25-42fe-4684-8099-6b12ed64d679', 'Corinne', 'Maha', 'Bethelova', '2024-02-02 00:18:36', '2024-02-02 00:18:36');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('73b822b7-74a9-4505-814e-8bba9c7714d8', 'Dora', 'Hill', 'Hayesova', '2024-02-03 03:15:03', '2024-02-03 03:15:03');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('bcc0e11f-70ff-40cc-8b48-188dec77b605', 'Christopher', 'Castro', 'Swilleyova', '2024-01-16 00:52:21', '2024-01-16 00:52:21');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('70044aa3-6f50-4fb5-a151-d78f09feb5f6', 'Marianne', 'Janczewski', 'Smithova', '2024-02-02 17:31:30', '2024-02-02 17:31:30');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('818a8df6-ea44-407f-a94b-863b6b8d0bb9', 'Yesenia', 'Cox', 'Dixonova', '2024-02-19 04:46:05', '2024-02-19 04:46:05');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('92c4240e-18fa-43f0-8079-96a97499329b', 'Latosha', 'Dewey', 'Tallmanova', '2024-02-11 17:25:28', '2024-02-11 17:25:28');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('89e68b6f-40b2-4e3e-b5e1-0eddc63a6c62', 'Lilly', 'Chatterton', 'Ashova', '2024-02-25 22:35:17', '2024-02-25 22:35:17');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('abf84f8d-7cf1-47e5-84e0-21a9bad18254', 'Tam', 'Serna', 'Beesonova', '2024-02-29 07:24:22', '2024-02-29 07:24:22');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('3aedd3b2-3391-47a6-b33b-694f8ba803f6', 'Georgette', 'Graban', 'Carringtonova', '2024-01-14 22:28:37', '2024-01-14 22:28:37');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('2582b305-5214-4fbb-bfcb-0e7cca6819e7', 'Shelia', 'Simmer', 'Fouseova', '2024-01-12 06:28:13', '2024-01-12 06:28:13');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('724b9054-0fec-43d2-9d8c-af41bffc06f0', 'Norah', 'Lavigne', 'Oldhamova', '2024-02-14 07:56:22', '2024-02-14 07:56:22');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('a0019f2b-b545-47b2-b56e-4e8786366b73', 'Albert', 'Louie', 'Curtisova', '2024-02-24 04:09:29', '2024-02-24 04:09:29');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('807e786a-7c04-43c7-80e5-47b1d2687c93', 'Wanda', 'Kilcrease', 'Grantova', '2024-01-28 10:04:14', '2024-01-28 10:04:14');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('5d15812d-f027-4071-8cb8-4d387b4f18bf', 'Shelley', 'Graf', 'Rooksova', '2024-02-14 23:18:59', '2024-02-14 23:18:59');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('049bf158-eb98-4626-b648-2b5012b7b54e', 'Frances', 'Mabry', 'Perezova', '2024-01-04 17:58:25', '2024-01-04 17:58:25');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('44d0002f-e91d-4a56-89b2-9b9a8d7bcbaa', 'Daniel', 'Ogle', 'Weaverova', '2024-01-03 14:48:10', '2024-01-03 14:48:10');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('831326fc-7457-4eef-a17e-57366a40eabb', 'Ronda', 'Thacker', 'Jacobsova', '2024-01-04 02:31:06', '2024-01-04 02:31:06');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('2f6cf9b9-b995-4c54-9c64-5baba86d6899', 'Nancy', 'Bussey', 'Boveova', '2024-02-12 15:08:02', '2024-02-12 15:08:02');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('51d3e626-64c7-4e79-9a8b-fc84a1d36722', 'Lisa', 'Sanderson', 'Joinerova', '2024-01-12 20:41:11', '2024-01-12 20:41:11');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('92a148a1-353e-48ba-ab62-fcf06af955bd', 'Steven', 'Robinson', 'Danielova', '2024-01-22 12:03:11', '2024-01-22 12:03:11');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('21b3c4c3-4a0b-495f-ab94-53a375732d88', 'Lucy', 'Pale', 'Fischerova', '2024-02-04 13:24:37', '2024-02-04 13:24:37');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('5dbdb0e2-5b90-4817-949a-c055b348b6b1', 'Donald', 'Noonan', 'Oconnellova', '2024-01-18 01:06:57', '2024-01-18 01:06:57');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('9bab920f-ad57-40d8-bb2d-0698f5d070d3', 'Debra', 'Freeman', 'Crawfordova', '2024-01-10 18:08:47', '2024-01-10 18:08:47');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('f2199c63-52ae-496e-9822-7e8478b811ec', 'Christina', 'Minnerly', 'Booreova', '2024-02-08 17:37:45', '2024-02-08 17:37:45');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('9f971192-4d10-4d77-9b13-343ac3483a73', 'Harold', 'Coleman', 'Giordanoova', '2024-01-18 11:09:19', '2024-01-18 11:09:19');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('f3f47011-1023-4a7b-a35e-cc5dbe551f44', 'Marty', 'Nelson', 'Steedova', '2024-02-14 18:54:19', '2024-02-14 18:54:19');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('cb014e20-91ca-4d15-b39d-8b0a735eb5b7', 'Melvin', 'Stacy', 'Jacksonova', '2024-02-29 10:09:07', '2024-02-29 10:09:07');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('82cef770-15e3-4057-820d-2fe726d985b5', 'Eugene', 'Southwell', 'Bonnova', '2024-01-05 22:15:07', '2024-01-05 22:15:07');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('4a453b7a-2742-4f07-86e9-5c02c18e951d', 'Sarah', 'Londo', 'Villegasova', '2024-02-05 08:55:27', '2024-02-05 08:55:27');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('382254f2-7c62-4160-9df9-ca89f5137ac7', 'Jeanette', 'Lawrence', 'Galleova', '2024-02-25 23:29:01', '2024-02-25 23:29:01');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('f6368b55-0182-4056-bc8a-35f69b8f2af2', 'James', 'Bowman', 'Sweeova', '2024-01-05 10:42:08', '2024-01-05 10:42:08');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('36344275-fd46-4938-af83-7927b3f6ce8d', 'Lori', 'Follansbee', 'Ringoova', '2024-02-23 18:50:50', '2024-02-23 18:50:50');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('11eba459-9dca-4fae-b888-012110ca72cf', 'Cory', 'Rivera', 'Baergaova', '2024-01-10 19:10:52', '2024-01-10 19:10:52');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('c9081579-cd9d-4651-9b37-cf3169620c75', 'June', 'Wylie', 'Martinova', '2024-02-27 19:11:16', '2024-02-27 19:11:16');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('4f986a2a-4425-4c05-afbd-efac0e3d5299', 'Jacob', 'Reeves', 'Christensenova', '2024-02-09 07:10:14', '2024-02-09 07:10:14');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('2427ae09-ccc8-4ea7-a311-ec5406400262', 'Larry', 'Carney', 'Sturmova', '2024-02-03 02:27:22', '2024-02-03 02:27:22');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('fb2b44bf-bf22-4cb7-bd52-437c83e473b0', 'Lydia', 'Mason', 'Leeova', '2024-02-17 15:06:37', '2024-02-17 15:06:37');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('1a2ca349-1432-4938-8b38-3165f075170e', 'Rosario', 'Boykin', 'Connellova', '2024-01-07 05:36:16', '2024-01-07 05:36:16');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('e080b204-854b-4f7d-883d-2b7565af0d62', 'Denise', 'Saez', 'Dillardova', '2024-01-11 14:35:15', '2024-01-11 14:35:15');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('724ca532-2d0f-4389-856a-6868ee138c74', 'Robert', 'Brown', 'Paschallova', '2024-01-05 07:35:31', '2024-01-05 07:35:31');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('3b306b79-cebe-4a8c-a343-5cb148f03775', 'Kasey', 'Blunt', 'Hareova', '2024-02-16 04:46:19', '2024-02-16 04:46:19');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('2f4bed2b-a4a0-431d-95a6-4cb8d4428e6e', 'Doris', 'Moran', 'Sotoova', '2024-02-10 20:39:39', '2024-02-10 20:39:39');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('723842ab-9169-4c84-a8d1-97e384ef0c2a', 'Jessica', 'Kim', 'Bushova', '2024-01-19 20:12:09', '2024-01-19 20:12:09');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('ef7aac2c-bd1d-4061-bff5-a4935774fd73', 'Jeffery', 'Dupont', 'Gilbertova', '2024-01-26 05:08:20', '2024-01-26 05:08:20');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('ac774ef0-53f3-454a-9605-86b73ac95184', 'Kelly', 'Armstrong', 'Bosleyova', '2024-01-02 22:08:43', '2024-01-02 22:08:43');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('11c89f8f-d498-468f-94cc-d3256a1b73ad', 'Steven', 'Andrews', 'Winemanova', '2024-02-07 21:03:37', '2024-02-07 21:03:37');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('8ce826b1-2c1b-411a-b758-7506ff392d39', 'Stephaine', 'Bowers', 'Webbova', '2024-03-02 21:55:51', '2024-03-02 21:55:51');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('a43d5b4d-246d-45c0-9ab5-3ba0d99e2198', 'Sandra', 'Wagner', 'Hacherova', '2024-01-07 21:32:03', '2024-01-07 21:32:03');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('a85a1e07-0a32-4148-a241-d1d35b0f44b3', 'Jorge', 'Marbury', 'Smithova', '2024-01-15 05:55:28', '2024-01-15 05:55:28');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('2a451494-5658-443a-92ab-8f83da613641', 'Rachel', 'Fisher', 'Williamsova', '2024-02-17 12:44:41', '2024-02-17 12:44:41');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('ce612a58-570d-4599-bac9-0061faa4752b', 'Ralph', 'Coleman', 'Estesova', '2024-01-16 05:27:58', '2024-01-16 05:27:58');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('c2c1da75-ae24-4681-9c61-797834d163db', 'Karla', 'Desir', 'Woodova', '2024-02-22 02:53:07', '2024-02-22 02:53:07');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('dc992efd-933e-4f85-89e7-c47e89200e2f', 'Ralph', 'Lasalle', 'Farrisova', '2024-02-23 08:28:48', '2024-02-23 08:28:48');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('ba11e1f8-a123-4f41-a963-2d237c494da2', 'James', 'Lynch', 'Ellettova', '2024-02-11 19:11:51', '2024-02-11 19:11:51');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('5238c4f1-fa71-4086-9f6d-8d73ae3feb56', 'Teresa', 'Young', 'Shieldsova', '2024-01-17 04:42:27', '2024-01-17 04:42:27');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('e8a76495-1d76-4721-9b3f-0dd15e0a2eac', 'Robert', 'Frost', 'Laneova', '2024-02-13 20:24:36', '2024-02-13 20:24:36');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('409d875d-9adb-462d-a910-cd999e693d38', 'Jessica', 'Hamilton', 'Goldova', '2024-01-26 15:59:14', '2024-01-26 15:59:14');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('395748d0-96a4-47da-a372-cadce1e05eec', 'Mary', 'Hoehn', 'Mclavrinova', '2024-01-14 10:22:13', '2024-01-14 10:22:13');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('4de2443b-c351-43b5-84e3-bacda1eab3cb', 'Janice', 'Gold', 'Williamsova', '2024-03-02 23:29:13', '2024-03-02 23:29:13');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('9bb603b9-715e-4ee2-93ce-af7308da7d23', 'Rafael', 'Buford', 'Solisova', '2024-01-16 15:10:16', '2024-01-16 15:10:16');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('3017ca78-c17f-4ac0-8133-157bfe0b1986', 'Scott', 'Richardson', 'Leeova', '2024-01-24 09:58:03', '2024-01-24 09:58:03');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('6e8522b9-7148-4c76-abf4-7894fb223328', 'Thanh', 'Smith', 'Mckayova', '2024-02-01 08:53:53', '2024-02-01 08:53:53');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('bd85294d-c6d7-49e8-aec2-fb734c7ccc2c', 'Amanda', 'Maugeri', 'Bradfordova', '2024-02-18 03:46:54', '2024-02-18 03:46:54');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('43d4543d-336e-4dfa-818e-73ee71e08d85', 'Richard', 'Leonberger', 'Chisolmova', '2024-01-22 19:39:56', '2024-01-22 19:39:56');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('ad2b3642-61f5-4de9-874d-9bb121788607', 'Hilda', 'Powell', 'Neelova', '2024-01-26 09:07:56', '2024-01-26 09:07:56');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('d5e76aa0-5217-4cb3-aba0-d3484df46b3a', 'Consuelo', 'Black', 'Robertsova', '2024-01-29 04:42:12', '2024-01-29 04:42:12');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('5ac7ee43-0a26-47a9-b388-56371a7f7106', 'Jack', 'Lake', 'Middletonova', '2024-01-08 03:56:36', '2024-01-08 03:56:36');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('26dc46f4-914b-43c6-a10e-ce3c80f7034a', 'William', 'Wayne', 'Gomezova', '2024-01-02 18:54:19', '2024-01-02 18:54:19');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('624a8d4b-77af-4366-9d4d-32a7383365e3', 'Tijuana', 'Atkins', 'Pierceova', '2024-01-04 17:36:57', '2024-01-04 17:36:57');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('e186e1d0-6f92-49e6-8727-95d8066de11a', 'John', 'Stone', 'Canevaova', '2024-02-03 12:04:21', '2024-02-03 12:04:21');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('eab5de5a-2f02-43d4-929e-ee214cb4ef3a', 'Jean', 'Granstrom', 'Schammelova', '2024-01-29 14:07:50', '2024-01-29 14:07:50');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('6578f0dd-9941-4c41-bcee-6cb6878366bf', 'David', 'Mull', 'Porterova', '2024-02-08 16:58:31', '2024-02-08 16:58:31');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('b09c90f3-03d2-4f00-a7c3-184df34948f3', 'Latanya', 'Schiller', 'Warrenova', '2024-01-17 12:41:14', '2024-01-17 12:41:14');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('91b6b094-795b-4fd4-99a3-62b99078e9ff', 'Bennett', 'Swalley', 'Phamova', '2024-02-26 10:25:59', '2024-02-26 10:25:59');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('4f296d68-74cf-4b7a-90f8-254a9c116cb2', 'Brandon', 'Pulliam', 'Husbandova', '2024-01-25 05:37:44', '2024-01-25 05:37:44');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('bf698461-63ed-4880-aea9-4dd35a427f2d', 'Brian', 'Mitchell', 'Waltersova', '2024-01-02 21:10:24', '2024-01-02 21:10:24');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('4854fa03-9315-4d49-8000-fb4063e91549', 'Michael', 'Van', 'Snokeova', '2024-01-04 21:13:14', '2024-01-04 21:13:14');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('f15b3a8a-8755-48cc-b24a-1a56f4d24a88', 'Donte', 'Lucas', 'Lyova', '2024-01-19 09:16:34', '2024-01-19 09:16:34');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('590bc630-2d5a-41c4-a945-67bebbbd7647', 'Allen', 'Vernon', 'Sergentova', '2024-02-07 09:12:16', '2024-02-07 09:12:16');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('f918ff5b-1d08-4430-81db-b5ecd968eb1f', 'Deanna', 'Poole', 'Taylorova', '2024-01-17 11:27:12', '2024-01-17 11:27:12');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('076f0c68-3cde-4f0c-8e79-f70f8f16c710', 'Sheila', 'Singer', 'Braunova', '2024-02-14 21:40:18', '2024-02-14 21:40:18');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('e648e10b-9155-4455-a649-18102c646c4c', 'Janet', 'Cantwell', 'Sheafferova', '2024-02-10 14:00:36', '2024-02-10 14:00:36');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('43b99a3a-ddfc-49dd-ae66-d23ed153f062', 'Katie', 'Hall', 'Montielova', '2024-01-11 00:28:20', '2024-01-11 00:28:20');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('6ad482fd-60cc-41e8-a48c-cd512e733d2c', 'Joyce', 'Badman', 'Marreroova', '2024-01-17 00:46:46', '2024-01-17 00:46:46');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('2199c129-86e1-42d4-9727-76f8b1df7a85', 'Vincent', 'Madera', 'Garciaova', '2024-01-31 03:51:45', '2024-01-31 03:51:45');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('a8342648-08ff-4ac3-926f-2589c2d6f67e', 'Ralph', 'Perez', 'Brownova', '2024-02-13 14:26:58', '2024-02-13 14:26:58');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('9b4518f2-70eb-4fe1-bece-fe8f3dbc4eda', 'Jan', 'Lovejoy', 'Bellova', '2024-01-08 19:54:00', '2024-01-08 19:54:00');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('02727958-eaa7-48a5-ad62-e720741483da', 'Glen', 'Johnson', 'Solorioova', '2024-01-11 01:01:27', '2024-01-11 01:01:27');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('3251f04e-00b6-43ea-8eb7-22677fe38fca', 'William', 'Dion', 'Cordovaova', '2024-02-01 11:35:24', '2024-02-01 11:35:24');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('90ef64c6-638d-4de2-9382-97255be60bbf', 'Erin', 'Taylor', 'Berndova', '2024-01-12 18:44:41', '2024-01-12 18:44:41');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('1724d07c-1910-4b3e-ad38-39a64987a144', 'Catherine', 'Mathis', 'Williamsova', '2024-01-03 04:48:54', '2024-01-03 04:48:54');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('ac960179-a4d3-4f88-812a-b9db60d37a49', 'Jennie', 'Mackson', 'Elliottova', '2024-02-06 19:22:37', '2024-02-06 19:22:37');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('f6ccb04f-bdf3-4037-8279-ca2dd77f99a1', 'Lisa', 'Sasso', 'Mcneilova', '2024-02-14 22:03:25', '2024-02-14 22:03:25');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('da6d1cc3-3fc2-4972-a5e2-ee0af78f3995', 'Marcia', 'Merritt', 'Leblancova', '2024-03-03 20:23:28', '2024-03-03 20:23:28');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('0f34e70e-0e70-4965-b00a-6124e840d134', 'Roger', 'Bordeaux', 'Kennerova', '2024-02-06 12:29:34', '2024-02-06 12:29:34');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('f6d95e8f-a675-42b9-ac87-afaa5593a36c', 'Joel', 'Jackson', 'Andersonova', '2024-01-09 15:06:13', '2024-01-09 15:06:13');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('be2c4af6-6188-4817-b36a-cdef8d7af4bb', 'Douglas', 'Smith', 'Vanaukenova', '2024-02-21 14:23:36', '2024-02-21 14:23:36');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('97944242-db3f-4ea4-9399-6ece2879571c', 'Manuel', 'Mullane', 'Ziolaova', '2024-02-12 06:37:08', '2024-02-12 06:37:08');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('c515647d-a0eb-477d-a62a-b5dedbade17b', 'Ralph', 'Gibbs', 'Harrisova', '2024-01-10 22:35:51', '2024-01-10 22:35:51');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('cc341bb1-0029-4c72-b5cf-8f608a9430d3', 'Lida', 'Hamilton', 'Schreyerova', '2024-02-09 18:29:25', '2024-02-09 18:29:25');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('f7e8229d-9791-4458-a087-27b06a543fdc', 'Kevin', 'Staples', 'Lupienova', '2024-02-04 03:09:06', '2024-02-04 03:09:06');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('d3d7ab8b-294b-4522-80a0-6a3a42f4a49f', 'Jim', 'Hartley', 'Alexanderova', '2024-02-02 06:58:37', '2024-02-02 06:58:37');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('f0bb7645-9fdb-4fb6-87c4-a2de6c5d996c', 'Loren', 'Barnett', 'Grayova', '2024-01-19 05:57:33', '2024-01-19 05:57:33');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('4c526bec-7ddb-40a3-b3ad-c8fa1f4bbcdd', 'Karen', 'Patterson', 'Boughtonova', '2024-01-09 11:07:22', '2024-01-09 11:07:22');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('3e866f38-29ee-4007-9b24-85a6967ff039', 'Rosaria', 'Hutchins', 'Rebuldelaova', '2024-02-18 10:53:14', '2024-02-18 10:53:14');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('d8851603-0c49-4967-840b-2eae8b479087', 'Maria', 'Smith', 'Sheldonova', '2024-01-08 11:01:05', '2024-01-08 11:01:05');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('57351092-5ade-4926-a04c-f60a56114ac7', 'Kristine', 'Wark', 'Condraova', '2024-02-14 19:40:47', '2024-02-14 19:40:47');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('e72f3d61-1243-4657-9f17-b941a2a231e1', 'Roberta', 'Cummings', 'Martinova', '2024-02-23 17:54:55', '2024-02-23 17:54:55');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('8bf4ff6f-3511-4d53-8927-72d20e06e137', 'Darnell', 'Yates', 'Harveyova', '2024-01-19 07:22:57', '2024-01-19 07:22:57');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('3c29c7da-2449-4eff-92ca-2f94974f3caa', 'Julius', 'Shasteen', 'Barnesova', '2024-02-02 02:02:58', '2024-02-02 02:02:58');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('596f8854-bcb1-45bc-9436-22fc039b6d05', 'Paula', 'Randolph', 'Tibbettsova', '2024-02-29 22:44:23', '2024-02-29 22:44:23');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('c2a41497-20ae-4fe4-9b60-d429900f9e07', 'Christa', 'Ryan', 'Rogersova', '2024-02-12 06:38:18', '2024-02-12 06:38:18');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('106273d2-3ca0-4239-847e-722994128ce1', 'Terry', 'Zimmer', 'Kephartova', '2024-01-31 00:35:05', '2024-01-31 00:35:05');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('0dbbf4b6-92ca-4429-9b7d-ba25a99f11be', 'Anita', 'Krasley', 'Normanova', '2024-02-26 06:39:59', '2024-02-26 06:39:59');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('25eb52f4-f22e-4fab-b0f2-0137a13183e1', 'Allen', 'Benton', 'Dacostaova', '2024-02-10 05:18:48', '2024-02-10 05:18:48');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('280a38b2-1d02-4a24-9015-0b9851916ad9', 'Jung', 'Orcutt', 'Valdezova', '2024-02-01 20:32:53', '2024-02-01 20:32:53');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('b76210ba-76a2-493b-a5ce-7d0d11a9dce6', 'Roger', 'Dewall', 'Evansova', '2024-01-17 10:58:32', '2024-01-17 10:58:32');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('c3e1ea44-ab00-4766-a1a6-cb41cf90cc0c', 'Kathy', 'Robertson', 'Rossonova', '2024-01-11 03:25:10', '2024-01-11 03:25:10');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('e38f8aa9-3191-4e17-ae9c-a39f84df425f', 'Michael', 'Powell', 'Harneyova', '2024-01-24 11:00:35', '2024-01-24 11:00:35');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('08c6e0bd-6c66-48c7-8840-f72a743e1c85', 'George', 'Baker', 'Midkiffova', '2024-02-21 07:07:26', '2024-02-21 07:07:26');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('54aa50c2-c4e1-4afc-a417-b6dd991ad726', 'Kristin', 'Mathewson', 'Gillova', '2024-02-09 05:05:11', '2024-02-09 05:05:11');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('83d10173-a9ef-4c53-be74-bd1fdeb51fe0', 'Sylvia', 'Barnes', 'Johnsonova', '2024-02-19 11:37:46', '2024-02-19 11:37:46');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('51abed14-986e-43ec-9cf1-cf6f4069fae2', 'Beverly', 'Johnson', 'Bartleyova', '2024-02-20 06:34:19', '2024-02-20 06:34:19');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('6daa93d1-8147-4c9e-a398-41fa35da563c', 'Charlotte', 'Morgan', 'Riversova', '2024-01-03 19:53:05', '2024-01-03 19:53:05');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('7e39fe9b-a22f-46c0-a376-faf3d510f785', 'Stephen', 'Mccandless', 'Bensonova', '2024-02-03 09:58:16', '2024-02-03 09:58:16');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('76dd3cd8-631d-48b8-87a9-3567de857c1a', 'Easter', 'Highsmith', 'Prewittova', '2024-01-03 16:19:23', '2024-01-03 16:19:23');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('189f603f-c2fa-4527-9f97-fefdd32156f6', 'Joseph', 'Marcotte', 'Hiattova', '2024-01-07 03:36:55', '2024-01-07 03:36:55');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('0a0447ab-891d-4555-b842-b222d5e92173', 'Irene', 'Bailey', 'Roppova', '2024-02-03 03:30:44', '2024-02-03 03:30:44');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('e27291cd-48fe-4cca-b4c5-90de368db1a6', 'Glen', 'Brewer', 'Boydova', '2024-02-05 10:16:00', '2024-02-05 10:16:00');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('47ceab5f-0c03-403f-b322-04b4323eb1e9', 'Annabell', 'Ripley', 'Gaunceova', '2024-02-17 23:05:44', '2024-02-17 23:05:44');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('5085f02f-03a8-4501-afe1-936864ee391f', 'Monica', 'Smiechowski', 'Ohlerova', '2024-01-19 01:11:44', '2024-01-19 01:11:44');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('c5a9af3e-2e14-4c71-9704-084f2e1ae49f', 'Viola', 'Ward', 'Harmanova', '2024-02-12 22:05:04', '2024-02-12 22:05:04');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('d1178108-6db5-47c9-b296-9b214540e21b', 'Maria', 'Gardner', 'Wessonova', '2024-03-01 14:57:15', '2024-03-01 14:57:15');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('7df9973a-87f1-4d80-a879-262c4bc57602', 'Jesse', 'Melton', 'Morrisonova', '2024-02-28 18:57:30', '2024-02-28 18:57:30');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('404b2a80-f2b2-4e23-8a06-133b78f022e0', 'Renee', 'Brush', 'Sessomsova', '2024-02-25 02:13:53', '2024-02-25 02:13:53');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('d0a00828-2fd5-4951-9655-2499b3a05bd6', 'Sean', 'Bonilla', 'Lafondova', '2024-02-11 14:07:43', '2024-02-11 14:07:43');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('87eb2fe5-a18b-4e5f-9638-c2ed7e86a997', 'Walter', 'Cork', 'Harveyova', '2024-01-12 19:31:50', '2024-01-12 19:31:50');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('f5ba33a7-27c8-4346-8a2d-cc8d4623fba4', 'Barry', 'King', 'Croweova', '2024-02-07 15:26:58', '2024-02-07 15:26:58');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('6825ebe3-3fcb-4b40-98a9-487a28881575', 'Ronald', 'Blackaby', 'Southwickova', '2024-02-14 08:37:46', '2024-02-14 08:37:46');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('ad21deaa-574b-4f88-9158-98c7c946a17e', 'Anita', 'Smith', 'Fortuneova', '2024-02-12 09:10:38', '2024-02-12 09:10:38');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('5d6e561c-a903-4cfc-928b-ec353f280bfb', 'Daphne', 'Landeros', 'Calhounova', '2024-01-15 18:35:50', '2024-01-15 18:35:50');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('203db655-bfae-4910-961e-38e8c1caacf7', 'Dorothy', 'Green', 'Raymondova', '2024-01-29 18:31:57', '2024-01-29 18:31:57');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('5e19506b-e179-48d6-a7a4-b11d9483fa69', 'Amos', 'Hoskins', 'Jonesova', '2024-02-06 03:28:55', '2024-02-06 03:28:55');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('8b10964c-f96a-4e20-9bc8-1079e2c47169', 'Harry', 'Weinberger', 'Salaova', '2024-02-20 05:42:32', '2024-02-20 05:42:32');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('e3084a71-45c3-404c-bd70-dd61826b0ade', 'Judith', 'Murphy', 'Bednarczykova', '2024-02-29 21:31:21', '2024-02-29 21:31:21');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('158283b7-52a8-4b0f-aebb-038f21c545a5', 'Francine', 'Meeker', 'Fairbanksova', '2024-01-25 17:12:15', '2024-01-25 17:12:15');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('43e2372b-1f2e-4c79-938c-141b44e8fa57', 'Glenda', 'Dunkley', 'Harrisonova', '2024-03-03 17:57:24', '2024-03-03 17:57:24');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('d1e10346-28c0-471b-a6fb-113353efabad', 'Edwin', 'Hedden', 'Groomova', '2024-02-04 19:21:03', '2024-02-04 19:21:03');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('62ff813e-bc9a-4e5b-8e11-e3912f22e668', 'Mei', 'Proulx', 'Arellanoova', '2024-02-23 13:13:18', '2024-02-23 13:13:18');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('011ef6ad-9d5d-4506-9820-fa0d3568a111', 'Christine', 'Hernandez', 'Rousseauova', '2024-01-10 14:32:54', '2024-01-10 14:32:54');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('07022a48-2067-409a-8471-165969a9a34b', 'Joseph', 'Armstrong', 'Cruzova', '2024-02-05 06:01:53', '2024-02-05 06:01:53');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('66276dd1-a276-45d5-ab76-920de62c7e18', 'Frank', 'Day', 'Hoskinsova', '2024-02-20 11:48:25', '2024-02-20 11:48:25');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('192ef4dd-9ea3-4d05-96b5-9d09011d1030', 'Lillian', 'Commings', 'Plantova', '2024-02-12 07:22:56', '2024-02-12 07:22:56');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('5cec37bb-376b-4d72-8a29-8149ca922d3c', 'Mike', 'Stackhouse', 'Marquisova', '2024-01-27 15:26:27', '2024-01-27 15:26:27');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('f6ca234a-2324-46ee-a4e1-e27402836408', 'Charles', 'Whiting', 'Cowleyova', '2024-02-23 01:07:29', '2024-02-23 01:07:29');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('77b74afe-a658-426e-b013-a536487ff83d', 'Daniel', 'Cooper', 'Aldermanova', '2024-02-20 19:13:56', '2024-02-20 19:13:56');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('be551b67-3da7-4052-8e4f-59c140199ed5', 'Essie', 'Santana', 'Loeschova', '2024-01-06 21:06:50', '2024-01-06 21:06:50');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('96e4c413-8811-4d5a-a738-351e30a7b05f', 'Justin', 'Hannon', 'Riveraova', '2024-02-18 09:20:38', '2024-02-18 09:20:38');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('78050638-b3c9-4122-a6f6-bbdaa68b880c', 'Sarah', 'Durham', 'Johnsonova', '2024-02-04 06:27:32', '2024-02-04 06:27:32');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('d6c6274a-d46a-46ca-955d-cbb6d82bdebd', 'Bobby', 'Gill', 'Personova', '2024-01-26 21:40:42', '2024-01-26 21:40:42');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('b0d0cecc-8eac-494a-8045-2ca00d4b1350', 'Lori', 'Gonzalez', 'Kaelkerova', '2024-02-19 05:58:34', '2024-02-19 05:58:34');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('30365ac6-71ef-4873-b137-1c01b79624d2', 'Robert', 'Demoss', 'Buckmanova', '2024-01-09 02:42:56', '2024-01-09 02:42:56');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('e70f7ca0-daee-425f-98cb-7133be1869d7', 'Christopher', 'Crespo', 'Mooreova', '2024-02-04 05:55:40', '2024-02-04 05:55:40');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('3518ddb5-fc9b-4929-b780-e23c904400aa', 'Emmett', 'Mestad', 'Moserova', '2024-02-22 22:39:04', '2024-02-22 22:39:04');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('d728a398-3e3d-466f-bd62-07a52c265dc7', 'Cheryl', 'Gilmore', 'Selbyova', '2024-01-23 08:08:12', '2024-01-23 08:08:12');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('2945e770-8867-4f0e-8ce0-c69f6e882314', 'Jessie', 'Sapp', 'Fishburnova', '2024-01-31 06:18:08', '2024-01-31 06:18:08');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('da4e291c-ee7d-4ff2-b3f7-92e4fc309aa6', 'James', 'Forbes', 'Chauvinova', '2024-01-13 01:46:50', '2024-01-13 01:46:50');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('0762163f-84b2-48d1-903c-3ce3c224a5c7', 'Jacqueline', 'Forbes', 'Goldenova', '2024-01-27 01:00:54', '2024-01-27 01:00:54');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('5435f551-e920-4883-b6fb-118cf83d6899', 'Margaret', 'Roop', 'Colquittova', '2024-02-18 02:52:06', '2024-02-18 02:52:06');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('e11282ec-916a-4162-8890-68c2763d25b1', 'Jill', 'Lott', 'Moskovitzova', '2024-02-01 14:39:56', '2024-02-01 14:39:56');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('905f36ed-5b3b-4abb-ab8f-1027e930015e', 'Thomas', 'Lerner', 'Parkerova', '2024-02-05 05:36:24', '2024-02-05 05:36:24');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('96165f14-1c53-427e-a0e0-a42f2587ebca', 'Daniel', 'Kenkel', 'Lanclosova', '2024-02-16 04:40:40', '2024-02-16 04:40:40');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('1b924ef1-6cdb-4215-961c-db73d21218da', 'Robert', 'Wade', 'Savageova', '2024-01-31 10:00:43', '2024-01-31 10:00:43');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('33696499-5411-4f95-aec9-872683fc97a6', 'Loretta', 'Bingham', 'Torresova', '2024-02-07 23:49:19', '2024-02-07 23:49:19');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('9b5cbd98-1faa-48c3-a391-860557d1e2b7', 'Cody', 'Rybka', 'Gloverova', '2024-01-22 21:38:01', '2024-01-22 21:38:01');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('9397d175-fc86-495d-b009-8811fb46d160', 'John', 'Moten', 'Mauroova', '2024-02-16 08:39:17', '2024-02-16 08:39:17');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('8869049d-b9e7-43a1-a221-afbe057401d2', 'Keith', 'Stjohn', 'Rollefsonova', '2024-02-18 18:54:21', '2024-02-18 18:54:21');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('36063d21-7b09-4471-a91b-a4fe921902f9', 'John', 'Otis', 'Baileyova', '2024-02-13 01:55:39', '2024-02-13 01:55:39');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('400d4276-50dd-4bbd-af76-f700e03c30e8', 'Alma', 'White', 'Hayesova', '2024-02-18 20:38:43', '2024-02-18 20:38:43');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('1e56d4bc-2dd9-4d16-ac52-2f5a0c1414c8', 'Isabel', 'Loree', 'Garciaova', '2024-02-25 12:19:07', '2024-02-25 12:19:07');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('0257b5f7-9405-4572-aff8-ee074084d849', 'George', 'Dierking', 'Bahrova', '2024-02-15 07:07:40', '2024-02-15 07:07:40');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('2c310b5a-e727-47cb-94aa-de7ab62372f2', 'Ralph', 'Newell', 'Davisova', '2024-01-25 12:35:10', '2024-01-25 12:35:10');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('53d610a6-3a2c-4947-8e50-c329bb92cac2', 'Stephen', 'Stevenson', 'Patroneova', '2024-01-30 19:51:44', '2024-01-30 19:51:44');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('4e3e8b56-e9a2-4b32-a37a-ae13b9e5a634', 'Starr', 'Hayton', 'Lehmanova', '2024-02-11 11:14:03', '2024-02-11 11:14:03');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('732cf168-7c6a-4c74-a400-89cc2f1e213f', 'Gail', 'Walker', 'Mclaughlinova', '2024-01-10 03:21:41', '2024-01-10 03:21:41');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('98fb5cb8-dfcf-4c52-83d5-f8bf5c9f7441', 'Donna', 'Gardner', 'Chavezova', '2024-02-29 15:32:16', '2024-02-29 15:32:16');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('63a8d144-575e-4bf7-a862-1e011e92480e', 'Annie', 'Myers', 'Beversova', '2024-02-08 20:11:19', '2024-02-08 20:11:19');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('67d8c4b8-594a-4c95-ab4f-36ab6b4f365d', 'Abel', 'Eskola', 'Nelsonova', '2024-01-28 12:16:42', '2024-01-28 12:16:42');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('470f6e8f-4bef-463e-ae47-fac1240738b5', 'Irene', 'Sheridan', 'Vichidvongsaova', '2024-02-29 03:50:48', '2024-02-29 03:50:48');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('e74a2454-07c5-4d9f-9c6f-14dfb89380b8', 'Jeremiah', 'Kieser', 'Bettsova', '2024-02-07 00:30:57', '2024-02-07 00:30:57');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('15f2ada4-3dc5-44df-bc3c-8c9eceb64236', 'Charlie', 'Edwards', 'Phillipsova', '2024-01-11 16:15:32', '2024-01-11 16:15:32');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('1deeec57-49fe-46ac-a250-fc289383085e', 'Monica', 'Harrison', 'Smithova', '2024-01-16 11:38:13', '2024-01-16 11:38:13');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('217169ba-bc55-47bd-8143-4b43abacb81e', 'Matthew', 'Warren', 'Clarkova', '2024-01-17 01:51:06', '2024-01-17 01:51:06');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('a13a76f5-4453-44bc-9b7d-46b29ac58d31', 'Chadwick', 'Babcock', 'Mccullarova', '2024-03-02 10:41:05', '2024-03-02 10:41:05');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('70fdd7e8-f008-4d1b-9576-39be3b162c42', 'Charlie', 'Taylor', 'Reichertova', '2024-01-08 21:16:46', '2024-01-08 21:16:46');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('4290b2eb-ac01-43d0-b595-fb3474027cf4', 'Noah', 'Owen', 'Deleonova', '2024-01-01 13:18:54', '2024-01-01 13:18:54');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('7cffeb65-db19-45fb-a56d-00526c594184', 'John', 'Lovelady', 'Clarkova', '2024-02-18 00:24:05', '2024-02-18 00:24:05');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('a33dcfcd-10b0-46e7-b6f6-e8191df9c771', 'Bonnie', 'Rivera', 'Rogersova', '2024-01-07 05:06:26', '2024-01-07 05:06:26');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('6a4bc168-a8bc-4d50-9dce-64883732babb', 'Orlando', 'Doonan', 'Steffesova', '2024-01-04 03:35:36', '2024-01-04 03:35:36');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('39e69e2a-5f01-46db-a50c-9ba3b6cb80c8', 'Pearl', 'Bitto', 'Colemanova', '2024-02-19 17:48:08', '2024-02-19 17:48:08');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('f83d003a-3b52-42c3-a177-4810e958187f', 'Ruth', 'Faulk', 'Yorkova', '2024-02-13 14:10:34', '2024-02-13 14:10:34');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('b4c81593-52d6-421f-9764-52efb567b234', 'Joann', 'Yeager', 'Gonzalesova', '2024-01-12 00:53:50', '2024-01-12 00:53:50');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('7d607ab2-7633-4774-90a7-e6e88825d083', 'Eddie', 'Helgeson', 'Comstockova', '2024-02-09 08:36:06', '2024-02-09 08:36:06');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('d88950d2-5794-4db3-9a1b-584d12180e5a', 'Raquel', 'Flowers', 'Armijoova', '2024-01-29 10:15:57', '2024-01-29 10:15:57');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('4a7d9246-de47-4e97-946d-c1cf199881fc', 'Annie', 'Ervin', 'Nasworthyova', '2024-03-02 00:13:24', '2024-03-02 00:13:24');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('dba8f7b2-fbaf-4100-818c-cf71598f2db5', 'William', 'Wu', 'Marshallova', '2024-02-12 14:13:01', '2024-02-12 14:13:01');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('ab304971-83e2-4deb-b384-8c78123b2839', 'Robert', 'Banks', 'Kozakova', '2024-02-05 05:03:02', '2024-02-05 05:03:02');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('cb239a8d-39eb-454c-8d82-620d2bfb2fcf', 'Melissa', 'Cope', 'Manningova', '2024-02-03 15:51:46', '2024-02-03 15:51:46');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('f470131d-4009-4cee-af97-30d8406f451c', 'John', 'Sequra', 'Williamsova', '2024-01-16 22:04:54', '2024-01-16 22:04:54');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('7271dbbb-9d76-4c95-9a11-22439d7ac50b', 'June', 'Phillips', 'Sundermanova', '2024-01-25 12:10:48', '2024-01-25 12:10:48');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('8a04600f-a2d1-42e6-a8b1-3901f23d2dbd', 'Misty', 'Jordan', 'Valdezova', '2024-02-24 00:51:47', '2024-02-24 00:51:47');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('437cc361-d502-4667-b1a5-feaf86a626bd', 'Edward', 'Maurer', 'Harperova', '2024-02-01 00:57:11', '2024-02-01 00:57:11');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('b30bf923-24fe-402c-9506-599fc2671cdd', 'Andres', 'Self', 'Robbova', '2024-01-26 09:06:50', '2024-01-26 09:06:50');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('cb4856cb-c17e-46a1-9358-8744e41007da', 'Margie', 'Lorenzen', 'Whiteova', '2024-02-06 21:44:57', '2024-02-06 21:44:57');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('18619107-3c3f-418a-8783-de7c0a219ce6', 'Pedro', 'Herrera', 'Mcquaidova', '2024-01-29 18:52:36', '2024-01-29 18:52:36');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('3c2ee961-0e4b-420d-b00a-0c6b2d9e4b16', 'Amber', 'Shirk', 'Mewbornova', '2024-02-24 14:52:45', '2024-02-24 14:52:45');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('671492ff-7078-4beb-b89d-ba5b7f2df414', 'Monica', 'Rodriguez', 'Kayova', '2024-01-03 15:40:41', '2024-01-03 15:40:41');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('14c21685-b1c5-4fdb-8c36-df07b0f20483', 'Cheryl', 'Vizcarrondo', 'Gambleova', '2024-02-21 14:55:08', '2024-02-21 14:55:08');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('76069254-4730-485a-917b-53dc07de5408', 'Theodore', 'Reader', 'Bobekova', '2024-02-20 07:03:15', '2024-02-20 07:03:15');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('df7aeb20-60b8-4a17-a866-bc73a2a53adc', 'Sue', 'Farrow', 'Mccannaova', '2024-02-04 18:24:31', '2024-02-04 18:24:31');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('638d9c1a-37c8-4a8d-ab18-8e8e284b683a', 'Robert', 'Hampton', 'Crimova', '2024-02-07 02:03:41', '2024-02-07 02:03:41');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('4b7a130c-361d-4b0a-b43a-fa825d567cb5', 'Maura', 'Rousseau', 'Kleistova', '2024-01-21 10:36:35', '2024-01-21 10:36:35');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('a6091953-f920-446f-b56a-871b0a15aa3f', 'Marti', 'Carmona', 'Oberryova', '2024-02-27 19:17:33', '2024-02-27 19:17:33');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('def25232-c6a4-4760-80da-0bc0b51b879b', 'Jodi', 'Archuleta', 'Brownova', '2024-01-27 13:56:51', '2024-01-27 13:56:51');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('efeefde3-2338-4309-a03d-a2f08a6cb05a', 'Linda', 'Dale', 'Murilloova', '2024-01-04 23:27:52', '2024-01-04 23:27:52');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('2f3e82be-93f1-4fae-a2d7-ee391441c1dd', 'Candice', 'Rutherford', 'Callawayova', '2024-02-09 21:24:42', '2024-02-09 21:24:42');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('3ddb0aca-54e5-4946-b8cd-c16b6d33e7e7', 'Aldo', 'Clancy', 'Demarcoova', '2024-01-01 04:55:48', '2024-01-01 04:55:48');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('1295c4d9-f5a5-4543-ae77-448aeb142153', 'Steven', 'James', 'Goldfarbova', '2024-01-31 13:29:17', '2024-01-31 13:29:17');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('d2998b31-96b2-4bb5-8e83-285b7fd6561e', 'Cheryl', 'Ragland', 'Nelsonova', '2024-01-09 16:24:36', '2024-01-09 16:24:36');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('68c28aa3-7721-482a-ac4b-dea4d59e13fa', 'Mary', 'Costello', 'Aldermanova', '2024-02-27 11:19:39', '2024-02-27 11:19:39');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('5439e39d-6f94-4e42-acb4-65c8c638dd79', 'Keith', 'Lamb', 'Gravesova', '2024-02-10 16:09:44', '2024-02-10 16:09:44');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('9b503908-2da3-4261-90d2-dc61631de8a5', 'Victor', 'Tatum', 'Kishova', '2024-01-29 13:35:52', '2024-01-29 13:35:52');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('7070802d-90c1-4d21-a767-38d27356231a', 'Brent', 'Shepard', 'Guidryova', '2024-01-08 17:27:16', '2024-01-08 17:27:16');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('286b26b0-9d3d-4c4b-8820-f53af832bb46', 'John', 'Vannostrand', 'Maderaova', '2024-02-23 14:18:44', '2024-02-23 14:18:44');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('6fa5a50d-99e2-4bb6-939e-acc788516eb3', 'Dave', 'Perez', 'Hunterova', '2024-02-21 11:29:37', '2024-02-21 11:29:37');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('bca1aa26-b00a-4406-b60b-ecc7385f3c3c', 'Shirley', 'Smith', 'Joyceova', '2024-01-25 07:00:51', '2024-01-25 07:00:51');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('00a68132-bf39-464d-9e88-2449875b2ccb', 'Daniel', 'Oneill', 'Nelsonova', '2024-02-01 02:00:47', '2024-02-01 02:00:47');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('26e4e6cb-2505-4bba-ada9-95f01828a59d', 'James', 'Roberts', 'Hoffmanova', '2024-02-17 04:06:33', '2024-02-17 04:06:33');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('465df3cc-a36a-4402-87d0-892fcc5a7d5c', 'Lois', 'Newsome', 'Hollandova', '2024-01-23 07:14:33', '2024-01-23 07:14:33');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('14dc820b-dbe8-44de-907e-d88f7207a1e9', 'Anne', 'Roper', 'Davisova', '2024-03-02 16:54:20', '2024-03-02 16:54:20');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('31761be3-d00a-4648-9a10-292cafb69e75', 'Jaime', 'Maryland', 'Crosbyova', '2024-01-21 02:54:30', '2024-01-21 02:54:30');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('a3f62ee2-6e17-4d61-a099-9d03eb8eb802', 'Richard', 'Drew', 'Medinaova', '2024-02-09 19:20:01', '2024-02-09 19:20:01');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('9c83d75b-0c5e-4d7a-8889-7214f5c228a5', 'Mary', 'Salvas', 'Salinasova', '2024-02-12 15:00:29', '2024-02-12 15:00:29');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('990c9992-f553-4e1a-9592-d4acbb37d87f', 'Bertha', 'Hernandez', 'Wilsonova', '2024-02-26 01:58:12', '2024-02-26 01:58:12');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('dd3f92e8-0ff8-43b0-8fa0-96be8c440646', 'Marjorie', 'Smith', 'Borosova', '2024-01-22 01:53:10', '2024-01-22 01:53:10');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('d06e166d-e72e-4a28-9127-c9ca2e85334a', 'Renee', 'Moore', 'Diazova', '2024-02-07 05:19:07', '2024-02-07 05:19:07');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('8563ea14-1dcc-49ce-9806-ad6e7e2a3a25', 'Robert', 'Alston', 'Jonesova', '2024-01-11 01:29:18', '2024-01-11 01:29:18');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('b2a03873-de25-4c62-bd3e-9fa896783c3b', 'Lee', 'Baeza', 'Finleyova', '2024-02-18 01:26:53', '2024-02-18 01:26:53');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('ed3258ec-65ed-46ee-9a3f-dc34b0cf9f25', 'Kate', 'Biron', 'Sanchezova', '2024-02-11 21:35:49', '2024-02-11 21:35:49');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('0b600fcf-baf3-4195-b845-fc1cf53899e0', 'Delma', 'Landreth', 'Kempova', '2024-02-04 07:04:24', '2024-02-04 07:04:24');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('27d06b7d-6ca0-48bf-bfc7-86e3514856f9', 'Lisa', 'Menchaca', 'Draneova', '2024-01-19 20:37:48', '2024-01-19 20:37:48');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('5652730e-0637-4153-8aa2-4a1396916cc3', 'Marty', 'Mcfadden', 'Wileyova', '2024-02-01 14:43:09', '2024-02-01 14:43:09');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('0a205b26-50bd-4f46-a5a5-73b1ffe17150', 'Jessie', 'Curran', 'Walkerova', '2024-01-22 12:24:39', '2024-01-22 12:24:39');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('551532ba-0c2e-4c41-b8a6-d75e34bf496b', 'Michael', 'Gonzalez', 'Pottsova', '2024-02-06 15:29:07', '2024-02-06 15:29:07');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('c7dd1d2c-2655-405c-987c-2ddd854b7425', 'Clarence', 'Lizotte', 'Staffordova', '2024-02-10 15:51:52', '2024-02-10 15:51:52');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('0dc732f9-60d6-43d5-aedb-3f007eaec2ec', 'Patty', 'Jefferson', 'Blanchardova', '2024-01-31 00:41:32', '2024-01-31 00:41:32');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('f7eab0c5-6de3-4920-8464-a84b7b9edc9a', 'Evelyn', 'Cantu', 'Welterova', '2024-02-26 23:22:09', '2024-02-26 23:22:09');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('22751cf7-29a0-43bf-8616-82634c3c96c6', 'Erika', 'Blanks', 'Mewbornova', '2024-02-07 21:03:06', '2024-02-07 21:03:06');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('d6f4ee79-b1a6-4696-b353-1b101696fc8b', 'Steven', 'Davis', 'Isbellova', '2024-01-05 06:27:25', '2024-01-05 06:27:25');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('005b41ab-fdc6-4b1b-a3ca-868220548233', 'Adam', 'Peck', 'Travisova', '2024-01-18 19:30:11', '2024-01-18 19:30:11');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('96be8642-d82d-4790-a673-ccb81d8abea5', 'Hayley', 'Greene', 'Garciaova', '2024-02-12 06:26:39', '2024-02-12 06:26:39');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('15ae0e47-768a-49f8-a2b5-cc4659a4c0ee', 'Cruz', 'Graham', 'Goldsmithova', '2024-01-31 19:55:49', '2024-01-31 19:55:49');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('e7bce5d2-27f8-4e51-a054-41a147114252', 'Jo', 'Larson', 'Hoyerova', '2024-01-31 06:03:19', '2024-01-31 06:03:19');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('1540da39-79cf-47c0-b3ac-413896813b63', 'Hugo', 'Bush', 'Shankerova', '2024-02-07 03:59:49', '2024-02-07 03:59:49');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('600314ba-fed1-486d-b64c-3e425ff5e958', 'Albert', 'Hillman', 'Lewisova', '2024-02-24 11:24:36', '2024-02-24 11:24:36');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('70647407-4ed4-4ee6-8ad2-f74fa3c184ed', 'Shirley', 'Kellum', 'Fordova', '2024-02-14 14:07:55', '2024-02-14 14:07:55');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('ee61fffd-1333-4523-9499-998b061b019b', 'Vicky', 'Chalmers', 'Burgettova', '2024-01-29 20:46:39', '2024-01-29 20:46:39');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('46ee12b3-752d-4714-b29f-7de157163643', 'Eugene', 'Hancock', 'Mulrooneyova', '2024-02-02 22:19:15', '2024-02-02 22:19:15');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('e5bc04ac-13fa-4200-8dd1-897497f94f73', 'Tina', 'Rojas', 'Giannakopouloova', '2024-01-19 03:32:14', '2024-01-19 03:32:14');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('4cc1cf79-3e41-475d-b234-69e9c125fada', 'Donald', 'Marshall', 'Forbesova', '2024-01-05 20:18:35', '2024-01-05 20:18:35');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('79b99eee-9809-4756-b9c1-82c625ed4b8b', 'Beverly', 'Smallwood', 'Greshamova', '2024-01-20 07:32:00', '2024-01-20 07:32:00');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('ef150ba1-f266-4f81-b76b-c177c282ccb5', 'Sherry', 'Jones', 'Jamesova', '2024-02-23 16:08:31', '2024-02-23 16:08:31');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('3b0fe009-5080-4177-b5d6-466347421ac5', 'Charlie', 'Smith', 'Flinchumova', '2024-01-14 08:59:04', '2024-01-14 08:59:04');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('1f26f730-5387-4c99-8dc6-d21bdbdae97e', 'Eileen', 'Pelter', 'Binghamova', '2024-02-04 13:30:14', '2024-02-04 13:30:14');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('c61df9cf-ff78-4e5a-93fe-096b9a9aac82', 'Stanley', 'Lambert', 'Fordeova', '2024-02-18 13:32:37', '2024-02-18 13:32:37');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('41d1125c-cd58-4cdf-bb82-b00d9e7a6aff', 'Linda', 'Williams', 'Dixonova', '2024-02-15 11:33:36', '2024-02-15 11:33:36');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('ffdc2a1d-fc87-4f94-a01f-78dd5a23d61f', 'Jennifer', 'Russell', 'Gentryova', '2024-02-28 04:22:28', '2024-02-28 04:22:28');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('df35c5e8-c26d-4be6-9ef3-62eb1a52b59b', 'Jennifer', 'Morton', 'Delgadoova', '2024-02-24 11:17:00', '2024-02-24 11:17:00');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('73a01e31-3d4a-46ad-87ec-c8c120078e0f', 'Rachel', 'Ruiz', 'Luciaova', '2024-01-14 14:58:06', '2024-01-14 14:58:06');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('6084b86a-0cd0-4732-9d09-4e318ef273ce', 'Marsha', 'Robinson', 'Koehlerova', '2024-01-03 01:48:27', '2024-01-03 01:48:27');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('5d77f103-8950-4906-abdd-2599d2a9dfc9', 'Pamela', 'Hardin', 'Bassova', '2024-02-27 00:23:56', '2024-02-27 00:23:56');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('71897c64-c48a-41b6-9f5f-2a71ae357c8c', 'Julia', 'Swee', 'Normanova', '2024-02-17 10:59:51', '2024-02-17 10:59:51');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('81f2fba8-47e8-4e16-978d-b3b7e6832e95', 'Donna', 'White', 'Coleova', '2024-01-30 06:38:28', '2024-01-30 06:38:28');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('fd501d44-f7c2-4e7c-a333-4e9d587253db', 'Soledad', 'Frandsen', 'Telloova', '2024-02-05 19:34:42', '2024-02-05 19:34:42');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('ef808aed-94dc-43e0-a055-2ce756e71dce', 'Jack', 'Alverez', 'Blakeova', '2024-01-24 18:06:30', '2024-01-24 18:06:30');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('53c6d393-2f36-4828-be86-cf1b855df8f1', 'Travis', 'Doll', 'Donaldsonova', '2024-02-03 12:43:08', '2024-02-03 12:43:08');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('cd360139-8f9f-4156-983f-71bf314e816c', 'Sheila', 'Morris', 'Edelsteinova', '2024-02-22 21:49:53', '2024-02-22 21:49:53');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('33d05928-419f-4abe-820b-d47293d30242', 'Katherine', 'Samuels', 'Daileyova', '2024-03-02 02:55:48', '2024-03-02 02:55:48');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('c5cf8a8f-beb2-4adf-92e4-1079b2fbf6f2', 'Frances', 'Gilchrist', 'Burchardova', '2024-01-03 02:15:03', '2024-01-03 02:15:03');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('c5533cc2-f9bf-4070-9c76-39b37acd9d55', 'Peggy', 'Luskey', 'Grayova', '2024-02-24 14:04:52', '2024-02-24 14:04:52');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('3806665c-6658-4459-bee4-be066ab20c23', 'Joshua', 'Hernandez', 'Palaciosova', '2024-02-14 21:49:12', '2024-02-14 21:49:12');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('e930e637-7a28-48ef-84ee-78f97bfc6b52', 'Timothy', 'Coleman', 'Ayalaova', '2024-01-25 13:15:47', '2024-01-25 13:15:47');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('a2a13535-2777-404d-9933-1c2f77643e6a', 'Irene', 'Archer', 'Smittleova', '2024-01-20 03:08:03', '2024-01-20 03:08:03');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('14288819-8648-4f85-ab14-0eef0e4e5a96', 'Tina', 'Izzi', 'Staplinsova', '2024-01-02 22:52:17', '2024-01-02 22:52:17');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('5ea23137-be6a-4b58-bffd-29ff6f9cd0da', 'Shayna', 'Chesnut', 'Smetanaova', '2024-01-21 22:30:10', '2024-01-21 22:30:10');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('563347c3-b0b9-4835-adc6-5820f6afc96a', 'Stefanie', 'Pasley', 'Olsenova', '2024-01-02 09:26:35', '2024-01-02 09:26:35');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('17973d3b-c41e-4c93-86e2-7349dd09d0f9', 'Alan', 'Manser', 'Lamonsova', '2024-01-31 20:54:45', '2024-01-31 20:54:45');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('80dd3b1c-0f38-4017-98c3-2e49fe9a4424', 'John', 'Adams', 'Fordova', '2024-01-14 12:43:16', '2024-01-14 12:43:16');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('eff3dfbd-b1fc-4139-a38c-812c990729c3', 'Roger', 'Fadel', 'Stillwellova', '2024-01-03 13:07:59', '2024-01-03 13:07:59');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('9f0973d9-0a44-48f1-9054-d75525a87e15', 'Michael', 'Pearson', 'Doughtyova', '2024-02-18 09:49:56', '2024-02-18 09:49:56');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('48b241d0-2264-4e23-a46e-3b8c4017fd9c', 'James', 'Robbins', 'Longova', '2024-01-27 20:04:10', '2024-01-27 20:04:10');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('81af3c26-1e6b-4710-805f-211f28c64f88', 'Betty', 'Sweeney', 'Jarrellova', '2024-02-28 22:56:15', '2024-02-28 22:56:15');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('ce2de01e-4632-4ae7-98ed-8e5f436be8be', 'Joseph', 'Kochevar', 'Alvarezova', '2024-02-20 19:37:54', '2024-02-20 19:37:54');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('0f79aab8-3da4-45a0-9820-382aa204eba0', 'Renee', 'Isaman', 'Martinova', '2024-02-13 07:44:24', '2024-02-13 07:44:24');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('5f0ed24e-eb65-494f-9d74-00bdf6d846d4', 'Mary', 'Collins', 'Petersonova', '2024-02-16 08:15:54', '2024-02-16 08:15:54');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('6b94ffa8-da7a-40d4-a24e-b8fe4fe58fcd', 'Lorie', 'Quigley', 'Acquavivaova', '2024-01-19 16:55:40', '2024-01-19 16:55:40');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('9c06d681-0da3-4b24-872d-529d157ae1cb', 'William', 'Wolff', 'Schneiderova', '2024-02-21 04:38:05', '2024-02-21 04:38:05');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('1b391b60-ed7c-412e-a29e-49bac868cdaa', 'Anthony', 'Baltazar', 'Morrisonova', '2024-01-21 08:14:12', '2024-01-21 08:14:12');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('5ba53d8a-5b56-4a73-b3a5-4c9a0a2e1fed', 'Willie', 'Gonzalez', 'Chouova', '2024-01-06 10:12:32', '2024-01-06 10:12:32');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('92b4d196-2acd-4ed6-a913-ceb2113e3623', 'Thelma', 'Furnace', 'Bordenova', '2024-01-21 00:39:17', '2024-01-21 00:39:17');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('b898708a-43f8-4aed-acd0-5bdf08988855', 'Edith', 'Quinonez', 'Howardova', '2024-01-04 11:49:01', '2024-01-04 11:49:01');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('f63667ff-b8dc-44f4-85e3-b3e595ba5a6a', 'Arthur', 'Thompson', 'Batesova', '2024-01-03 12:26:40', '2024-01-03 12:26:40');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('3ab27d3f-4c77-42e2-8800-4b2db7bf3290', 'Donna', 'Vance', 'Davisova', '2024-01-04 19:31:12', '2024-01-04 19:31:12');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('c0a209b0-ac12-43ae-98d8-5d0ee0951202', 'Donna', 'Morell', 'Morrisova', '2024-01-17 23:45:18', '2024-01-17 23:45:18');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('3f137029-55e3-4e62-b24f-186744af0730', 'Irma', 'Rodriquez', 'Archieova', '2024-03-02 02:35:51', '2024-03-02 02:35:51');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('a8d06faf-7551-4e1a-b9b7-025b820590c2', 'Thomasina', 'Barrow', 'Pleasantova', '2024-01-22 11:37:51', '2024-01-22 11:37:51');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('a733e3a6-0074-4b7d-8659-3122a365d93e', 'Elizabeth', 'Woodley', 'Alexanderova', '2024-01-15 03:23:29', '2024-01-15 03:23:29');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('701de531-ffed-4c16-a428-19db67ac0840', 'Eunice', 'Ryan', 'Tubbsova', '2024-02-28 10:14:34', '2024-02-28 10:14:34');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('263e9904-bc5d-451b-a270-b5c560ce4cd2', 'Preston', 'Noel', 'Harleyova', '2024-01-08 11:26:10', '2024-01-08 11:26:10');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('15f66041-c578-4f5d-8962-efeec79167be', 'Michael', 'Grothe', 'Dunningova', '2024-01-13 04:54:34', '2024-01-13 04:54:34');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('e78fc0ad-84f3-4a96-bc85-463370f0a312', 'Nolan', 'Oberst', 'Kumanova', '2024-03-04 00:18:31', '2024-03-04 00:18:31');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('33692696-51b6-4f12-b8f5-fe4bd8eb8053', 'Janet', 'Gustafson', 'Arthurova', '2024-03-03 12:29:32', '2024-03-03 12:29:32');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('724c5758-89ac-4675-87ff-3639c3733624', 'James', 'Weiss', 'Bonillaova', '2024-01-25 12:44:36', '2024-01-25 12:44:36');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('0c2c9f77-ba5e-4fce-845b-02012caa2245', 'Guadalupe', 'Brown', 'Whiteova', '2024-01-02 13:20:15', '2024-01-02 13:20:15');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('b87cdc50-d809-461d-b6c0-578a1aadf82d', 'Julio', 'Burton', 'Callawayova', '2024-02-01 22:55:51', '2024-02-01 22:55:51');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('adcabf15-bef3-44cb-b8d3-4b02715832e2', 'Betty', 'Nixon', 'Dellova', '2024-01-29 23:50:49', '2024-01-29 23:50:49');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('43945053-d716-4b44-8738-792b70486a3f', 'Richard', 'Davis', 'Aslamova', '2024-02-04 10:53:33', '2024-02-04 10:53:33');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('8b98e33f-b072-4e2c-9aac-a80b9133d8c2', 'Lizzie', 'Hernandez', 'Kleinschmidtova', '2024-02-06 03:05:06', '2024-02-06 03:05:06');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('224920a7-db2a-49ae-a080-7c4faef83ce5', 'Leo', 'Smith', 'Lussierova', '2024-01-21 12:35:03', '2024-01-21 12:35:03');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('7468f258-bcf4-4b6a-9e6e-095cd9a18aa4', 'Annette', 'Peterson', 'Brassilova', '2024-01-19 01:29:45', '2024-01-19 01:29:45');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('69b550c4-4532-4b5e-9b1a-9abf9fa1ad46', 'Lena', 'Gaddis', 'Ruskoova', '2024-01-15 12:21:26', '2024-01-15 12:21:26');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('86ad8523-2e41-4d4c-9442-9216aa085527', 'Robert', 'Culver', 'Macklinova', '2024-01-05 06:26:24', '2024-01-05 06:26:24');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('041afcdf-a979-463e-bf92-ea868b5f6e70', 'Sherry', 'Mcdonald', 'Freemanova', '2024-01-02 20:55:21', '2024-01-02 20:55:21');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('c8379721-73b5-494d-a853-3efa5dcd7b1e', 'Tracy', 'Schneider', 'Bestova', '2024-02-20 10:14:48', '2024-02-20 10:14:48');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('2fb17f0b-5381-4a53-bfb5-23a05f5e1d74', 'Melody', 'Johnson', 'Kilgoreova', '2024-02-04 06:20:11', '2024-02-04 06:20:11');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('97620a22-f03d-4ec7-b79d-cd5943d5acf1', 'Fred', 'Hennessey', 'Desiletsova', '2024-01-13 23:06:31', '2024-01-13 23:06:31');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('ff2e5d97-57f5-49af-a9ae-6d69f60791f8', 'Sadie', 'Wright', 'Hanusova', '2024-01-01 12:51:30', '2024-01-01 12:51:30');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('c5a8aa32-2d01-4799-9f6d-0eb326abfed8', 'Lorenzo', 'Anderson', 'Rosalesova', '2024-02-03 10:02:49', '2024-02-03 10:02:49');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('5d1d1be5-7a82-4249-98e7-308ca13c820e', 'Gerard', 'Roberts', 'Nguyenova', '2024-01-31 08:31:12', '2024-01-31 08:31:12');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('ac792a38-7476-4bf9-8d6f-8941973266c6', 'Steve', 'Turek', 'Millerova', '2024-02-26 17:24:50', '2024-02-26 17:24:50');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('52fabfaa-1176-4269-b0cf-c4e358bca3dc', 'Nancy', 'Jurgens', 'Sanchezova', '2024-02-27 23:35:46', '2024-02-27 23:35:46');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('44294129-9d35-4566-a448-021645e89a5d', 'Melissa', 'Molina', 'Collierova', '2024-01-31 02:35:47', '2024-01-31 02:35:47');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('79037656-20c1-4df5-a79a-6340c7e640b3', 'Misty', 'Gomez', 'Stoddardova', '2024-02-19 18:43:23', '2024-02-19 18:43:23');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('4d11510e-db86-4997-9821-a2ac88544d3b', 'Anthony', 'Mccoggle', 'Pattersonova', '2024-01-19 06:15:22', '2024-01-19 06:15:22');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('2c2e3437-53c8-4dd4-a147-d593541732c5', 'Nancie', 'Barnhart', 'Esparzaova', '2024-01-31 10:13:27', '2024-01-31 10:13:27');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('2792dea0-be81-4000-9b88-7d9d53bd77cd', 'Troy', 'Gahan', 'Niederkornova', '2024-02-06 01:45:25', '2024-02-06 01:45:25');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('067195fb-38a2-4eea-81e0-1c0aee91423d', 'Jason', 'Canales', 'Horneova', '2024-01-07 21:18:02', '2024-01-07 21:18:02');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('49e280fe-b4da-40ee-b4d5-11d0f7c6c007', 'Kendall', 'Kimble', 'Pierceova', '2024-01-04 23:21:01', '2024-01-04 23:21:01');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('ae4985bd-2304-4547-b783-1babaf1fde5f', 'Nicholas', 'Burgess', 'Rolandova', '2024-01-20 05:44:37', '2024-01-20 05:44:37');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('268c7a25-ace8-460b-878b-eca6ea1e93d4', 'Melissa', 'Hornbeck', 'Phillipsova', '2024-02-12 03:25:36', '2024-02-12 03:25:36');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('06e2f22c-3966-4ef5-94b5-8f83aead1ca6', 'Hattie', 'Curtin', 'Laugharyova', '2024-01-17 18:12:08', '2024-01-17 18:12:08');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('1d79262d-1ee4-4d67-9ec6-6cb8fbdf4355', 'Monty', 'Gott', 'Griffinova', '2024-01-29 17:23:47', '2024-01-29 17:23:47');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('51b5f883-e1ed-4d73-b3fe-ea7c2b2db1bb', 'Virginia', 'Chambers', 'Sneedova', '2024-02-11 09:12:47', '2024-02-11 09:12:47');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('25a25319-e9b4-456d-a419-62118563909c', 'Christopher', 'Czachorowski', 'Laddova', '2024-02-27 18:13:31', '2024-02-27 18:13:31');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('9622913c-6987-4145-b5c1-d7652267b27e', 'Elizabeth', 'Campbell', 'Clineova', '2024-01-14 00:32:37', '2024-01-14 00:32:37');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('f4f1b4f3-a239-402a-bdc8-43aec5c3d7f9', 'Michael', 'Callahan', 'Strattonova', '2024-02-18 10:14:32', '2024-02-18 10:14:32');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('63742dc1-ff8e-4024-bb2e-4e176024c193', 'William', 'Williamson', 'Massaova', '2024-01-29 23:51:41', '2024-01-29 23:51:41');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('efe83fc7-1806-4296-8c16-095967af893a', 'William', 'Gandy', 'Lewisova', '2024-02-01 05:14:48', '2024-02-01 05:14:48');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('6c9fb513-5859-4319-838a-2c7c355eab73', 'Jeannie', 'Thomas', 'Ibachova', '2024-01-09 15:31:17', '2024-01-09 15:31:17');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('e2c44e36-0646-49c2-aa65-060bd491c258', 'Martin', 'Perkins', 'Dooleyova', '2024-01-29 03:39:48', '2024-01-29 03:39:48');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('0c3e0146-08a1-4944-a459-59dbf50b3183', 'Monroe', 'Seiber', 'Douglasova', '2024-03-02 11:47:59', '2024-03-02 11:47:59');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('99ad2cbc-b3e7-4d53-a0b0-7c1ab283b3b2', 'Janice', 'Davis', 'Ramseyova', '2024-02-13 02:45:12', '2024-02-13 02:45:12');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('6b8fbe92-9a00-4c11-b5d4-ab29763bc5b2', 'Anthony', 'Rotunda', 'Nisbettova', '2024-02-03 01:19:55', '2024-02-03 01:19:55');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('69583f57-4269-4d86-954a-7f8bd1e19970', 'Judy', 'Smith', 'Knellova', '2024-01-22 05:49:06', '2024-01-22 05:49:06');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('20bcd220-e544-41fd-bb69-b33c5b382d32', 'Jerry', 'Bilodeau', 'Perryova', '2024-02-01 11:14:08', '2024-02-01 11:14:08');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('b4650cd5-9947-4057-bc9a-288fc284b8ec', 'Andrew', 'Lowe', 'Williamsova', '2024-02-09 01:47:17', '2024-02-09 01:47:17');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('7c7dad41-b3ee-47f9-ae1d-f383fd5286b1', 'James', 'Woods', 'Blockerova', '2024-02-08 19:15:31', '2024-02-08 19:15:31');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('bb793484-114b-433e-b5c4-703a4711417a', 'Sandra', 'Beaupre', 'Pierceova', '2024-01-27 06:17:19', '2024-01-27 06:17:19');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('a9ce8778-5eab-453f-8184-4561a821bee2', 'Craig', 'Moore', 'Beelerova', '2024-01-23 08:54:06', '2024-01-23 08:54:06');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('5342ae53-1192-44e9-ae28-b3a731acbeb0', 'Sandra', 'Raymond', 'Keyserova', '2024-01-20 18:57:24', '2024-01-20 18:57:24');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('66c6e444-bb16-4c0e-bed7-1f5003a76fdd', 'Debra', 'Hoeck', 'Bookerova', '2024-02-08 13:10:04', '2024-02-08 13:10:04');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('8cbf5bd1-71e1-4946-9a28-bac73b2c289f', 'Michele', 'Westfall', 'Blakeova', '2024-01-17 01:14:08', '2024-01-17 01:14:08');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('1ff6ed72-1a03-4d81-9e51-f49ca5d9d2d0', 'Sook', 'Cottingham', 'Puckettova', '2024-02-02 01:12:27', '2024-02-02 01:12:27');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('8c5a6ab6-88f3-4061-8efe-757b16025fed', 'James', 'Francis', 'Garveyova', '2024-02-06 12:00:00', '2024-02-06 12:00:00');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('2daf51e9-d022-4bd3-92f9-dd979cce10f6', 'Stacy', 'Butler', 'Cohoonova', '2024-02-20 00:17:49', '2024-02-20 00:17:49');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('aa1d5f78-fef9-4a66-a317-abcbb132e798', 'Martha', 'Vogelpohl', 'Smithova', '2024-01-28 11:59:26', '2024-01-28 11:59:26');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('b95b139f-1521-4fc2-a991-e199abb9c666', 'John', 'Tucker', 'Sinclairova', '2024-01-09 22:18:04', '2024-01-09 22:18:04');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('44c0b318-679d-4682-9dd4-a171d102bec9', 'Jessie', 'Davis', 'Hillova', '2024-01-31 14:53:05', '2024-01-31 14:53:05');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('e58aeb13-075c-4037-ac5c-239627bfd288', 'Louise', 'Walters', 'Lehnorttova', '2024-02-10 08:57:58', '2024-02-10 08:57:58');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('4a23d095-8b9f-424b-8acc-5aeb2d4cb856', 'Marquita', 'Brain', 'Ludkowskiova', '2024-02-05 09:38:25', '2024-02-05 09:38:25');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('1cb1da7f-0b22-4663-880b-cc8960348626', 'Jaime', 'Garcia', 'Bargerova', '2024-01-30 19:58:00', '2024-01-30 19:58:00');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('2a620ab0-b976-455f-a082-ecd035409aa6', 'Danielle', 'House', 'Suskiova', '2024-01-25 14:46:32', '2024-01-25 14:46:32');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('3a79c08f-38a2-4c41-9e6d-68825b5bbe13', 'Sandra', 'Reid', 'Henkeova', '2024-02-25 21:09:26', '2024-02-25 21:09:26');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('3a4699e4-9dc3-44d9-b4c4-3acdc52cbbd3', 'Robert', 'Labine', 'Martinova', '2024-02-21 21:33:13', '2024-02-21 21:33:13');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('80714c70-2500-4be1-969f-7d1449a1fce2', 'Patrice', 'Moreno', 'Stonesova', '2024-02-05 07:09:39', '2024-02-05 07:09:39');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('89712d63-b4b9-4ea4-895e-d63bde5c4f13', 'Constance', 'Mccree', 'Headova', '2024-01-19 05:39:13', '2024-01-19 05:39:13');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('700015e6-409b-436c-94d2-5a88b8df8536', 'Agnes', 'Rimbey', 'Griffinova', '2024-01-01 08:26:27', '2024-01-01 08:26:27');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('72835d6a-3745-4085-b3e9-01a5d3653ed8', 'Betty', 'Holland', 'Joelova', '2024-01-24 23:01:19', '2024-01-24 23:01:19');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('098f6e55-7c44-4b67-a06a-eb4c70c10f4c', 'John', 'King', 'Debernardiova', '2024-02-11 01:09:01', '2024-02-11 01:09:01');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('d563e03b-c1b8-402e-b365-ba4f632dc207', 'Chris', 'Waite', 'Rayova', '2024-01-17 23:03:40', '2024-01-17 23:03:40');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('fae32727-4cef-4233-8ed0-bf768fd7ba23', 'Matthew', 'Saenz', 'Cichowskiova', '2024-01-11 03:18:54', '2024-01-11 03:18:54');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('936d71b2-0230-44db-9c36-73f698e6f27e', 'Vera', 'Alvarez', 'Loganova', '2024-02-18 05:04:13', '2024-02-18 05:04:13');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('8a2e86ee-b5af-469e-9677-b5497a97280f', 'Joseph', 'Rogers', 'Walstonova', '2024-03-02 16:48:39', '2024-03-02 16:48:39');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('ea506a5f-fd19-480d-ac38-a19d9292a529', 'Jeffry', 'Zywiec', 'Funkeova', '2024-01-22 23:46:28', '2024-01-22 23:46:28');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('1190b395-b10f-430d-ae89-80737d9255fc', 'Danielle', 'Spector', 'Zunigaova', '2024-01-18 05:33:32', '2024-01-18 05:33:32');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('47fde55e-8597-4b55-8ebc-6ee5fc079864', 'Peter', 'Dobbs', 'Waltonova', '2024-01-09 03:07:29', '2024-01-09 03:07:29');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('8a48793a-fb69-4705-a921-5737d45c2102', 'John', 'Gambrell', 'Marsova', '2024-02-01 21:18:40', '2024-02-01 21:18:40');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('7f59819c-a787-4e56-9d44-877df8db5eab', 'Dawn', 'Oneal', 'Brownova', '2024-01-25 10:54:33', '2024-01-25 10:54:33');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('7bb1c548-8739-4b05-a99f-600b6af1a8c5', 'Micheal', 'Ramirez', 'Alvaradoova', '2024-02-20 18:11:30', '2024-02-20 18:11:30');
INSERT INTO public.students(
    id, last_name, first_name, patronymic, "createdAt", "updatedAt")
    VALUES ('877e2107-09f0-4770-b75c-0e0440c31954', 'Jean', 'Nguyen', 'Brothersova', '2024-02-26 18:34:45', '2024-02-26 18:34:45');

INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('6ccc3cef-9a5e-4c7b-8f30-d5afb92057da', 'History of Western Philosophy', '2024-02-10 02:43:58', '2024-02-10 02:43:58', '34237c87-070d-4576-aa9d-a1b69c9d633c', '90ef64c6-638d-4de2-9382-97255be60bbf');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('85acf05d-927f-41ef-8556-d424be774fad', 'Age of Wrath', '2024-01-01 10:45:59', '2024-01-01 10:45:59', '81246d19-730c-48ee-b175-a22d9192b147', '69583f57-4269-4d86-954a-7f8bd1e19970');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('ae2e1f9b-c088-4907-9624-95d673f5f377', 'All the Presidents Men', '2024-01-01 13:50:33', '2024-01-01 13:50:33', '3158a202-bbd9-4dfb-8cde-aea4ad71eed1', '724b9054-0fec-43d2-9d8c-af41bffc06f0');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('bd5b39ac-998b-464e-bfaf-eff88ce28e11', 'Superman Earth One - 1', '2024-02-18 10:28:48', '2024-02-18 10:28:48', '2f22326e-7c72-49c6-b7cc-2ab7d9ff1716', '700015e6-409b-436c-94d2-5a88b8df8536');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('ef1f51dc-201b-450b-bdfe-89f8cc73eeab', 'Bookless in Baghdad', '2024-01-30 13:22:08', '2024-01-30 13:22:08', 'c9d92d29-50c2-4da3-9fa4-11924a1212b3', 'e72f3d61-1243-4657-9f17-b941a2a231e1');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('fbd4dd4d-7eba-448c-b907-e693959e094a', 'Uncommon Wisdom', '2024-02-01 22:31:17', '2024-02-01 22:31:17', 'c666f9a2-ff9a-44b8-bb39-9aefbdb24d3f', '563347c3-b0b9-4835-adc6-5820f6afc96a');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('e146c482-08ed-4363-9e6a-8d54690b2710', 'Vyakti ani Valli', '2024-02-02 15:40:49', '2024-02-02 15:40:49', '62998dac-3663-45f3-9338-b814ca85468c', 'bca1aa26-b00a-4406-b60b-ecc7385f3c3c');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('bc5bca06-f9af-448a-b560-aec583294bcd', 'Apulki', '2024-01-05 05:21:35', '2024-01-05 05:21:35', '39469e77-7ccd-4a90-9afe-4d12052ebcf3', '596f8854-bcb1-45bc-9436-22fc039b6d05');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('8126de53-6129-4794-a44e-d0a22bc75dfe', 'Age of the Warrior', '2024-02-02 16:56:17', '2024-02-02 16:56:17', '39469e77-7ccd-4a90-9afe-4d12052ebcf3', '11c89f8f-d498-468f-94cc-d3256a1b73ad');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('645f2e7a-0d58-4b77-93c6-ce4a51df5273', 'Last Mughal', '2024-03-01 19:30:21', '2024-03-01 19:30:21', 'ace4b5b0-76d9-411d-8031-a0c30973d81c', '1cb1da7f-0b22-4663-880b-cc8960348626');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('fa618593-33cc-4f34-ad69-7d6ab0247724', 'Hidden Connections', '2024-03-02 09:28:54', '2024-03-02 09:28:54', '1e8ca225-cd1e-4bae-99c8-714c7e0b6f0f', 'd88950d2-5794-4db3-9a1b-584d12180e5a');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('14b815e9-41c7-44f6-8702-3b9495ad792c', 'Last Lecture', '2024-02-26 06:59:56', '2024-02-26 06:59:56', 'bf53e575-e11a-4ab8-b7b6-4c1cb777c64f', '624a8d4b-77af-4366-9d4d-32a7383365e3');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('887a1f31-0707-4256-89a2-170a91a43999', 'Introduction to Algorithms', '2024-03-03 18:32:14', '2024-03-03 18:32:14', 'c9db1f16-f5d7-4b9a-b514-c6155a7a7239', 'f4f1b4f3-a239-402a-bdc8-43aec5c3d7f9');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('7413243c-410f-404d-9d0e-a36d70cf1fb2', 'Surely Youre Joking Mr Feynman', '2024-01-19 04:16:03', '2024-01-19 04:16:03', '3158a202-bbd9-4dfb-8cde-aea4ad71eed1', '2fb17f0b-5381-4a53-bfb5-23a05f5e1d74');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('fbe4354f-104e-4d18-88ab-d15e645297f2', 'Idea of Justice', '2024-02-22 10:56:34', '2024-02-22 10:56:34', 'f1710f44-8744-494e-a2be-75f0c6d4cc43', '22751cf7-29a0-43bf-8616-82634c3c96c6');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('30d0fa73-a54c-4dcc-a9fc-1e201fdc82d7', 'Principles of Communication Systems', '2024-01-19 17:28:51', '2024-01-19 17:28:51', '128b545e-3b91-46bc-9e16-f87ab1fc062b', 'efeefde3-2338-4309-a03d-a2f08a6cb05a');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('aa782fa6-42b5-4699-aa1b-b257ec1299a3', 'Jim Corbett Omnibus', '2024-01-06 06:51:58', '2024-01-06 06:51:58', 'f1710f44-8744-494e-a2be-75f0c6d4cc43', '43e2372b-1f2e-4c79-938c-141b44e8fa57');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('52b9e65d-03fb-4d02-9c7a-2498a2cf0f87', 'Nature of Statistical Learning Theory', '2024-02-23 08:41:54', '2024-02-23 08:41:54', '319693b0-3a8e-41e1-8de5-e61d0f97bebe', '4b7a130c-361d-4b0a-b43a-fa825d567cb5');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('5b7c2834-e058-4f06-81de-b780daeae11e', 'Gun Gayin Awadi', '2024-01-23 23:44:44', '2024-01-23 23:44:44', 'e39c4c8d-9f58-46cd-8428-44b60ca9e0b7', 'f918ff5b-1d08-4430-81db-b5ecd968eb1f');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('97f7df1b-207d-4118-aa5e-0b6fd091f7b0', 'Argumentative Indian', '2024-01-24 16:49:22', '2024-01-24 16:49:22', '08a10d6f-3802-4ae0-9a65-6943def364a5', '3c29c7da-2449-4eff-92ca-2f94974f3caa');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('b72dd2f4-dc87-421a-9cef-34ec34ab47ef', 'Signal and the Noise', '2024-01-23 09:43:58', '2024-01-23 09:43:58', '5b87a38b-f277-4be5-9cf4-4324d4703e95', '2c310b5a-e727-47cb-94aa-de7ab62372f2');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('3d84a64c-6aff-472b-9434-133ae9fbaa22', 'Maqta-e-Ghalib', '2024-02-24 19:09:42', '2024-02-24 19:09:42', '2356dbc4-6734-4062-a585-a45f845220b6', '437cc361-d502-4667-b1a5-feaf86a626bd');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('43cc10ba-1e4e-44ef-9418-c7d29934c981', 'Uncommon Wisdom', '2024-01-05 23:32:31', '2024-01-05 23:32:31', '386a77f8-1ea1-4945-a9d4-5ee39051db1f', 'adcabf15-bef3-44cb-b8d3-4b02715832e2');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('d606b558-724c-418e-b9a9-25f719f1b233', 'Mossad', '2024-02-04 09:42:18', '2024-02-04 09:42:18', '38a60499-ce0e-4c78-8298-f6a2c626970a', 'f2199c63-52ae-496e-9822-7e8478b811ec');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('5d5f5d19-2519-40da-a2dd-964e2c5f20c8', 'Life in Letters', '2024-02-06 05:31:00', '2024-02-06 05:31:00', 'aeb7d500-642e-4e4c-b0d9-bd0f6a57cd3b', '4a23d095-8b9f-424b-8acc-5aeb2d4cb856');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('4cd73780-d54c-412d-a834-69ba9cd2cd4e', 'Wealth of Nations', '2024-01-06 23:39:34', '2024-01-06 23:39:34', 'e76c38fe-7abb-4f31-b623-5c93fa41df4e', '1f26f730-5387-4c99-8dc6-d21bdbdae97e');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('b1397163-8fdf-4845-9233-357ed59fdf9c', 'Textbook of Economic Theory', '2024-01-19 12:41:30', '2024-01-19 12:41:30', 'b55f91da-d06c-412d-ad6a-6cb9375a670a', '4290b2eb-ac01-43d0-b595-fb3474027cf4');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('11c07853-cc3c-4d54-a5f8-f32cdfa494e4', 'Discovery of India', '2024-02-17 15:30:42', '2024-02-17 15:30:42', '3158a202-bbd9-4dfb-8cde-aea4ad71eed1', '224920a7-db2a-49ae-a080-7c4faef83ce5');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('2f861c97-c397-4a9f-988c-21fdd68fe467', 'Making Software', '2024-02-05 07:21:11', '2024-02-05 07:21:11', '52d06eda-1eb2-4707-b694-557e29ed2ade', 'cd360139-8f9f-4156-983f-71bf314e816c');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('4d63cc0a-453b-4ce4-a9b7-a0bc73606bfb', 'Numbers Behind Numb3rs', '2024-02-21 00:24:14', '2024-02-21 00:24:14', '52d06eda-1eb2-4707-b694-557e29ed2ade', 'c7dd1d2c-2655-405c-987c-2ddd854b7425');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('36b29b89-5fd6-4b1a-8263-4f3b329249ac', 'Brocas Brain', '2024-01-03 15:02:17', '2024-01-03 15:02:17', 'bb7d91c4-5561-4d4c-8cb6-1a0095712152', '99ad2cbc-b3e7-4d53-a0b0-7c1ab283b3b2');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('881b2d4a-fc13-4459-94d7-018721f320f8', 'Girl who kicked the Hornets Nest', '2024-02-12 03:19:52', '2024-02-12 03:19:52', 'da7d29e7-bca8-4c9e-b3bd-9c1699f736fe', 'c5a8aa32-2d01-4799-9f6d-0eb326abfed8');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('7ae95772-423c-4b9f-a870-e3fd69e3ec85', 'Artist and the Mathematician', '2024-02-21 19:45:09', '2024-02-21 19:45:09', '14af3e5e-e1b7-48f5-a1ed-1750499f328f', '15ae0e47-768a-49f8-a2b5-cc4659a4c0ee');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('23e180ff-8f6c-484e-a254-11d25d4352a9', 'Power Electronics - Rashid', '2024-02-27 19:46:59', '2024-02-27 19:46:59', '29c1f303-4ddf-4754-a156-0ef5054630fb', '25eb52f4-f22e-4fab-b0f2-0137a13183e1');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('b7c7612c-d1d6-4f0e-a41b-d353b2d4d503', 'Selected Short Stories', '2024-01-14 12:38:06', '2024-01-14 12:38:06', '2df8e6b0-3a1a-487f-a0f4-979f0a9a81c8', 'bf698461-63ed-4880-aea9-4dd35a427f2d');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('fb27ca6b-f8d8-4c3c-ab9c-a40d9e662867', 'Girl who played with Fire', '2024-02-20 14:31:04', '2024-02-20 14:31:04', '9513feea-f7d7-4216-b5a8-78d46a956f1b', '6fa5a50d-99e2-4bb6-939e-acc788516eb3');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('c4020982-f685-47ec-87c6-dd04de8d99b5', 'Cathedral and the Bazaar', '2024-02-16 05:12:32', '2024-02-16 05:12:32', '8268bd6f-4540-4d11-a250-6e05e509039a', 'c0a209b0-ac12-43ae-98d8-5d0ee0951202');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('dbf8d40f-a887-401f-ae1b-6e5a842dfe33', 'Veil: Secret Wars of the CIA', '2024-02-25 08:50:55', '2024-02-25 08:50:55', 'ebe5fefc-973f-48a1-ae02-9b3a094ed8a0', 'a6091953-f920-446f-b56a-871b0a15aa3f');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('6202c4d8-acfd-4d5b-a2f5-a8206984176a', 'Rosy is My Relative', '2024-01-02 23:42:58', '2024-01-02 23:42:58', '658825b3-fd54-4dbf-9a70-0b7a3eee1cd5', '78050638-b3c9-4122-a6f6-bbdaa68b880c');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('43cc776a-ef72-4571-b1a0-9478ae7bc337', 'Hidden Connections', '2024-02-14 21:54:47', '2024-02-14 21:54:47', 'a3540e55-f990-4e20-9e52-f5fd3136678c', '44294129-9d35-4566-a448-021645e89a5d');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('367b8851-e8a2-4506-b408-b077532cf2f5', 'Return of the Primitive', '2024-02-10 01:19:02', '2024-02-10 01:19:02', 'd68d49f0-2d01-494a-bb45-e7aade01d3eb', 'd728a398-3e3d-466f-bd62-07a52c265dc7');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('6c0d4b4c-7c73-4fe9-8da2-9aefffae1a24', 'Drunkards Walk', '2024-03-03 18:34:29', '2024-03-03 18:34:29', 'de2fbe4d-3832-4b9f-b82d-71d1b8c8d7ff', '52fabfaa-1176-4269-b0cf-c4e358bca3dc');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('7d3b7325-d86e-4e2b-a010-a34548dbbef7', 'Half A Life', '2024-01-30 02:42:07', '2024-01-30 02:42:07', 'cad83f2d-8d30-494e-a566-a56359b633a4', 'ab304971-83e2-4deb-b384-8c78123b2839');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('912fac19-bcb3-410e-a6ec-d7a1908c3bf6', 'Deceiver', '2024-01-16 16:09:04', '2024-01-16 16:09:04', '3960d0b6-cc81-4427-8cc4-7133b3390a2f', 'e2c44e36-0646-49c2-aa65-060bd491c258');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('3c3064f1-aef3-4b70-bcc9-ea4f08b7baa9', 'Dongri to Dubai', '2024-01-11 04:56:43', '2024-01-11 04:56:43', '20d89f15-c5ec-41f1-ab4d-06b09d2af253', '3518ddb5-fc9b-4929-b780-e23c904400aa');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('6af56abe-1896-4f5f-9c9e-7925c6a6bc35', 'Burning Bright', '2024-01-30 16:28:53', '2024-01-30 16:28:53', 'b1d107c9-def6-413b-b94e-889e8409995e', '3ddb0aca-54e5-4946-b8cd-c16b6d33e7e7');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('694d16de-38c0-404a-8bca-035687c48ed8', 'Batman Earth One', '2024-02-16 00:36:43', '2024-02-16 00:36:43', '62998dac-3663-45f3-9338-b814ca85468c', '3a4699e4-9dc3-44d9-b4c4-3acdc52cbbd3');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('a60291ae-afa4-4ff1-afdb-eb413f3d8ad6', 'Physics & Philosophy', '2024-01-04 17:31:25', '2024-01-04 17:31:25', '4dce55f5-4f33-4f9c-b945-af028fb72587', '6daa93d1-8147-4c9e-a398-41fa35da563c');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('1588dbcb-4df9-48f7-9d00-eae90bfc99db', 'Nature of Statistical Learning Theory', '2024-03-03 17:07:39', '2024-03-03 17:07:39', 'ca63e091-70ce-46e1-9375-e23b1da8218e', '9c83d75b-0c5e-4d7a-8889-7214f5c228a5');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('dda6f89b-a562-40e6-b571-448c38fa4102', 'Hidden Connections', '2024-02-18 03:17:02', '2024-02-18 03:17:02', '8ab34037-9796-4fb8-80c7-33f33f937a8c', '97620a22-f03d-4ec7-b79d-cd5943d5acf1');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('f590eed3-a9a2-493e-a1f7-22cda9a81b02', 'Superman Earth One - 2', '2024-02-27 16:20:42', '2024-02-27 16:20:42', '81246d19-730c-48ee-b175-a22d9192b147', 'df35c5e8-c26d-4be6-9ef3-62eb1a52b59b');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('a3a66227-582d-47e9-96e1-5a2f166a7d48', 'Structure & Interpretation of Computer Programs', '2024-01-14 20:07:57', '2024-01-14 20:07:57', '2356dbc4-6734-4062-a585-a45f845220b6', '76069254-4730-485a-917b-53dc07de5408');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('3ec17ff2-f610-4ea9-a8ff-10df5f2f157c', 'Structure and Randomness', '2024-02-17 23:09:50', '2024-02-17 23:09:50', 'ace4b5b0-76d9-411d-8031-a0c30973d81c', '6a4bc168-a8bc-4d50-9dce-64883732babb');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('45f68614-bbab-408f-9b17-bbb6080bf6f5', 'Courtroom Genius', '2024-02-19 01:01:07', '2024-02-19 01:01:07', 'f0eec7c3-9c12-4507-86ea-052b6eb8c2cc', '409d875d-9adb-462d-a910-cd999e693d38');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('8df842a6-716f-4101-8c5b-1da204731c26', 'Short History of the World', '2024-01-03 17:56:41', '2024-01-03 17:56:41', 'c666f9a2-ff9a-44b8-bb39-9aefbdb24d3f', '81f2fba8-47e8-4e16-978d-b3b7e6832e95');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('90fbb4c5-e3f1-4bc2-ac4a-f01e7062dcb1', 'Econometric Analysis', '2024-02-16 23:56:25', '2024-02-16 23:56:25', '858cad16-81dc-40f5-b76c-0adb9b14c03f', '39e69e2a-5f01-46db-a50c-9ba3b6cb80c8');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('7b9beffe-764a-4b56-905a-f6f30046661d', 'Free Will', '2024-02-20 19:56:51', '2024-02-20 19:56:51', '53b5ffa3-cc68-41d9-8b56-5715741764b1', '8563ea14-1dcc-49ce-9806-ad6e7e2a3a25');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('d5b4ed05-7ff4-41b0-92f7-9cfb447b187f', 'We the Living', '2024-02-20 08:58:04', '2024-02-20 08:58:04', '213faf01-9c33-46fe-9e5c-6efb456c5f2a', '217169ba-bc55-47bd-8143-4b43abacb81e');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('ca2e7d5f-a443-4401-86bc-b7fb60b361d4', 'Case of the Lame Canary', '2024-01-14 22:27:40', '2024-01-14 22:27:40', 'ace4b5b0-76d9-411d-8031-a0c30973d81c', 'f6ccb04f-bdf3-4037-8279-ca2dd77f99a1');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('e08d12fb-06f7-47f9-aa85-39bc189d6491', 'Identity & Violence', '2024-02-03 10:28:10', '2024-02-03 10:28:10', '1fc9fedd-2be4-4845-adc1-c79c854eedf5', '06e2f22c-3966-4ef5-94b5-8f83aead1ca6');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('5b3a3e28-df2f-4dcb-9400-caf6969e21b1', 'Zen & The Art of Motorcycle Maintenance', '2024-02-02 12:58:12', '2024-02-02 12:58:12', 'd5c5c499-f015-428b-b907-3e6f4f184058', '049bf158-eb98-4626-b648-2b5012b7b54e');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('db55e395-9c58-4f07-a76b-64a386bc5b3a', 'Hunchback of Notre Dame', '2024-01-11 04:00:00', '2024-01-11 04:00:00', '62998dac-3663-45f3-9338-b814ca85468c', '1a2ca349-1432-4938-8b38-3165f075170e');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('8991858e-14d8-4722-ab21-3482bebce4b6', 'Trembling of a Leaf', '2024-02-17 11:25:04', '2024-02-17 11:25:04', '94997f97-b0a5-495b-af1d-0932b4a73e4f', 'c61df9cf-ff78-4e5a-93fe-096b9a9aac82');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('40db8dcb-44fe-4afe-8f7b-68ed671fcebc', 'Artist and the Mathematician', '2024-01-15 19:55:34', '2024-01-15 19:55:34', '13d6c059-d884-4d6e-828d-9a16520e00c2', 'e70f7ca0-daee-425f-98cb-7133be1869d7');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('be60f70e-12f4-4e0e-a638-3e8ddb9eb7f4', 'Hafasavnuk', '2024-02-01 04:48:10', '2024-02-01 04:48:10', '20d89f15-c5ec-41f1-ab4d-06b09d2af253', '404b2a80-f2b2-4e23-8a06-133b78f022e0');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('38f903ae-2a6d-41cc-a4f5-d0e31d24bbe2', 'On Education', '2024-02-19 13:45:58', '2024-02-19 13:45:58', 'e098eef0-0ec2-47ad-a902-9c99cc847242', '43d4543d-336e-4dfa-818e-73ee71e08d85');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('8aa19eb6-1e6f-45d6-a1f3-21b108fa7c37', 'Short History of the World', '2024-01-31 23:24:18', '2024-01-31 23:24:18', '64fb479e-51b2-4545-9525-e5f28c7f48e2', 'ce2de01e-4632-4ae7-98ed-8e5f436be8be');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('9f9a585d-ad84-4a02-bf8f-6295c1dcac30', 'Textbook of Economic Theory', '2024-02-25 09:58:00', '2024-02-25 09:58:00', '65a0bbb6-18f5-4fa8-9d10-bc6eddc21a77', 'f63667ff-b8dc-44f4-85e3-b3e595ba5a6a');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('bd78ee3c-4d5d-43a9-b611-361bebe4e47f', 'Animal Farm', '2024-01-09 00:10:35', '2024-01-09 00:10:35', 'f9f9b756-6c56-4884-819c-92f4e30b75a1', '905f36ed-5b3b-4abb-ab8f-1027e930015e');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('34574ddc-765c-4e8d-a071-ddd531f47293', 'Birth of a Theorem', '2024-01-05 05:42:21', '2024-01-05 05:42:21', 'c02347c4-916a-46fd-9f89-0f3a63dff31a', '400d4276-50dd-4bbd-af76-f700e03c30e8');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('84497631-d358-4da6-83f5-1b0ac9967339', 'Christmas Carol', '2024-02-25 06:08:28', '2024-02-25 06:08:28', 'da7d29e7-bca8-4c9e-b3bd-9c1699f736fe', '2199c129-86e1-42d4-9727-76f8b1df7a85');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('44972318-f41d-40fd-afe0-004165d8becf', 'Cathedral and the Bazaar', '2024-01-29 20:43:20', '2024-01-29 20:43:20', 'bf53e575-e11a-4ab8-b7b6-4c1cb777c64f', 'f83d003a-3b52-42c3-a177-4810e958187f');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('9bb16aa6-4350-495a-9dbd-cc4ccd2f3eba', 'Phantom of Manhattan', '2024-02-15 11:36:13', '2024-02-15 11:36:13', '5b890e6a-6bcd-41d2-b798-eca15692e3f5', '79037656-20c1-4df5-a79a-6340c7e640b3');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('0e2875e1-4fd9-474b-ab31-7574a1c9cccc', 'Power Electronics - Rashid', '2024-02-11 10:51:01', '2024-02-11 10:51:01', 'da7d29e7-bca8-4c9e-b3bd-9c1699f736fe', 'dd3f92e8-0ff8-43b0-8fa0-96be8c440646');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('0e1a87ec-1aff-459a-ada2-8fa4142666db', 'Power Electronics - Rashid', '2024-01-05 06:50:46', '2024-01-05 06:50:46', 'd9c9926b-f7c0-4cf1-aead-71cb07e92826', 'e9df5b25-42fe-4684-8099-6b12ed64d679');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('0f4a554b-62a6-449b-b284-17877e636ab8', 'Nature of Statistical Learning Theory', '2024-02-23 15:55:50', '2024-02-23 15:55:50', '43a3d37d-d9e8-40dc-8b3e-4a579783692a', '382254f2-7c62-4160-9df9-ca89f5137ac7');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('abb77876-7d11-498a-bf85-b0f8f77e6171', 'Moon and Sixpence', '2024-02-07 22:12:17', '2024-02-07 22:12:17', '6574b528-d587-4393-8c84-2eb67461b44d', 'ff2e5d97-57f5-49af-a9ae-6d69f60791f8');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('679fc398-f242-4cf5-98cb-2e1a0447b914', 'Computer Vision', '2024-02-25 02:36:38', '2024-02-25 02:36:38', '128b545e-3b91-46bc-9e16-f87ab1fc062b', '3aedd3b2-3391-47a6-b33b-694f8ba803f6');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('0a4f4567-6edf-47cf-a16d-6426228ad5d2', 'Structure and Randomness', '2024-01-09 08:23:43', '2024-01-09 08:23:43', '8ab34037-9796-4fb8-80c7-33f33f937a8c', 'e27291cd-48fe-4cca-b4c5-90de368db1a6');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('6584b9f7-a961-4681-b286-695d342d4d9e', 'Devils Advocate', '2024-01-27 23:11:43', '2024-01-27 23:11:43', 'e0993c48-8899-48ad-80e3-d518b10c7b63', '0b600fcf-baf3-4195-b845-fc1cf53899e0');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('2c519927-388b-450d-8103-03a747768ae3', 'Murphys Law', '2024-02-10 01:51:14', '2024-02-10 01:51:14', 'f9f9b756-6c56-4884-819c-92f4e30b75a1', '470f6e8f-4bef-463e-ae47-fac1240738b5');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('0e636629-924d-4a29-b94c-5897347fa69e', 'Arthashastra', '2024-02-20 14:18:11', '2024-02-20 14:18:11', '6e26cdb2-3a3b-474e-8002-d1d2dbe35ab3', '203db655-bfae-4910-961e-38e8c1caacf7');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('e307a708-bc8b-4ad7-a437-1d1d066406b1', 'Justice League: The Villains Journey', '2024-01-31 02:47:01', '2024-01-31 02:47:01', '369d6b69-00e9-44ef-a342-7bd2c6d330c0', 'b0d0cecc-8eac-494a-8045-2ca00d4b1350');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('33887cca-a508-492d-86a1-abd0209dda31', 'Image Processing with MATLAB', '2024-02-24 11:39:31', '2024-02-24 11:39:31', 'e530b1e3-4517-4f03-9e8c-3dc546757d5c', 'ba11e1f8-a123-4f41-a963-2d237c494da2');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('ac9e2ad5-da3b-42b8-80bc-f6c0dcbc29c5', 'To Sir With Love', '2024-01-01 19:24:41', '2024-01-01 19:24:41', '08a10d6f-3802-4ae0-9a65-6943def364a5', '44d0002f-e91d-4a56-89b2-9b9a8d7bcbaa');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('a05d0a05-8bfb-4f97-988d-ccdead330b5c', 'Ahe Manohar Tari', '2024-02-10 10:48:35', '2024-02-10 10:48:35', '8daae137-98df-4825-9c1f-7152ed2a0f1a', '96be8642-d82d-4790-a673-ccb81d8abea5');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('54522bf0-2432-4113-a5e3-016300330525', 'Discovery of India', '2024-02-15 00:34:41', '2024-02-15 00:34:41', '3947aedf-5699-402b-9c7e-3a0f3474b536', 'a2a13535-2777-404d-9933-1c2f77643e6a');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('ee2b22c8-64fd-46ff-a194-6be79b21b109', 'One', '2024-01-09 16:22:59', '2024-01-09 16:22:59', '8268bd6f-4540-4d11-a250-6e05e509039a', '83d10173-a9ef-4c53-be74-bd1fdeb51fe0');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('cd40bb0c-3d27-422d-8634-9dd9f28502c6', 'Discovery of India', '2024-01-22 18:19:23', '2024-01-22 18:19:23', '5b87a38b-f277-4be5-9cf4-4324d4703e95', '8b10964c-f96a-4e20-9bc8-1079e2c47169');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('285fbb79-2095-4401-a16b-f51c37af6c7f', 'Down and Out in Paris & London', '2024-01-02 13:52:43', '2024-01-02 13:52:43', '5b87a38b-f277-4be5-9cf4-4324d4703e95', '7df9973a-87f1-4d80-a879-262c4bc57602');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('be4ad38b-2c9c-4b9a-af00-d1e2248691fa', 'Neural Networks', '2024-01-13 04:01:46', '2024-01-13 04:01:46', '9513feea-f7d7-4216-b5a8-78d46a956f1b', 'ef808aed-94dc-43e0-a055-2ce756e71dce');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('e9571aeb-05c0-457d-bb76-f584877798a8', 'Theory of Everything', '2024-01-14 20:25:42', '2024-01-14 20:25:42', '9972a40e-6502-49f0-b531-a4bf9e56ca7a', '701de531-ffed-4c16-a428-19db67ac0840');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('1ae69271-9375-4ba4-9741-4b9d29c2df66', 'More Tears to Cry', '2024-02-19 23:38:32', '2024-02-19 23:38:32', 'a3540e55-f990-4e20-9e52-f5fd3136678c', 'b4c81593-52d6-421f-9764-52efb567b234');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('13c193ee-7e00-4a8c-89e6-fbbdfd389471', 'Bookless in Baghdad', '2024-02-07 20:42:11', '2024-02-07 20:42:11', 'f9f9b756-6c56-4884-819c-92f4e30b75a1', '70044aa3-6f50-4fb5-a151-d78f09feb5f6');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('4271b109-04f0-492f-be58-69596f0e1d01', 'Courtroom Genius', '2024-01-13 09:13:20', '2024-01-13 09:13:20', '35f402b3-27e4-4138-b49d-38e48bbb5762', 'ea506a5f-fd19-480d-ac38-a19d9292a529');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('582de5d1-7d42-4f5b-ac88-65371da6017c', 'Superman Earth One - 1', '2024-01-02 11:53:52', '2024-01-02 11:53:52', 'd5c5c499-f015-428b-b907-3e6f4f184058', '4de2443b-c351-43b5-84e3-bacda1eab3cb');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('4696a13a-40d8-42e7-898b-e93db3882ddf', 'Electric Universe', '2024-02-05 16:25:20', '2024-02-05 16:25:20', '1146a8b8-5a49-4007-bb0f-19d77d4d1eae', '18619107-3c3f-418a-8783-de7c0a219ce6');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('35b11677-ad8c-415b-b41d-f01b70712552', 'Superfreakonomics', '2024-01-04 17:11:00', '2024-01-04 17:11:00', '22c7275e-aeb8-41dc-af24-596f65d37a93', '9bb603b9-715e-4ee2-93ce-af7308da7d23');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('bddca94b-20cd-4e12-9297-f9e80aa375d4', 'Sea of Poppies', '2024-02-05 01:10:25', '2024-02-05 01:10:25', 'f50bf1be-22f7-4716-a60b-a6910871c19c', 'be2c4af6-6188-4817-b36a-cdef8d7af4bb');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('2ea8c13e-ef39-4c8c-8563-35c2d559e621', 'Case of the Lame Canary', '2024-02-01 04:17:10', '2024-02-01 04:17:10', '61bcbf5f-4aed-4fb2-b038-049b110d74c7', '14288819-8648-4f85-ab14-0eef0e4e5a96');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('b118657f-1b26-4ef5-b964-dd9eb57090c0', 'Uncommon Wisdom', '2024-02-21 06:30:01', '2024-02-21 06:30:01', '1fc9fedd-2be4-4845-adc1-c79c854eedf5', 'a13a76f5-4453-44bc-9b7d-46b29ac58d31');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('a27a9f4d-915b-4df2-ab03-e436a7d5d5af', 'Winter of Our Discontent', '2024-01-20 04:01:38', '2024-01-20 04:01:38', '7498224e-2589-47e1-a9cf-ca2ec62bfbc5', '6e8522b9-7148-4c76-abf4-7894fb223328');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('8b80c83f-dce4-42e0-8651-28aa42aab453', 'Beyond Degrees', '2024-02-22 23:02:36', '2024-02-22 23:02:36', '7ae4be4e-bc19-4052-8c46-5dc1b76f8f08', '6825ebe3-3fcb-4b40-98a9-487a28881575');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('555d13a6-56fc-4894-92fe-37b5fe727c73', 'Death of Superman', '2024-01-19 12:30:01', '2024-01-19 12:30:01', 'f1710f44-8744-494e-a2be-75f0c6d4cc43', 'e8a76495-1d76-4721-9b3f-0dd15e0a2eac');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('649f3648-f226-4915-a090-76174fd8b5f2', 'Superman Earth One - 1', '2024-01-24 19:04:06', '2024-01-24 19:04:06', '6c14c1f4-10bc-4fc0-a761-2b54a077ab0e', '9c06d681-0da3-4b24-872d-529d157ae1cb');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('0cf6e70d-31ff-4c94-934d-c42a5a294f17', 'Slaughterhouse Five', '2024-01-14 06:45:12', '2024-01-14 06:45:12', '7f1a23de-b777-4044-a35b-b280b2aa288c', '1b924ef1-6cdb-4215-961c-db73d21218da');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('5ccd95eb-a07d-480e-a9f6-1b540490aedd', 'Raisin in the Sun', '2024-02-04 00:07:22', '2024-02-04 00:07:22', '319693b0-3a8e-41e1-8de5-e61d0f97bebe', '6084b86a-0cd0-4732-9d09-4e318ef273ce');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('38d9019b-df38-4611-9a52-a91215ffe46e', 'Unpopular Essays', '2024-02-10 17:13:32', '2024-02-10 17:13:32', 'e098eef0-0ec2-47ad-a902-9c99cc847242', '92c4240e-18fa-43f0-8079-96a97499329b');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('5cd04645-625c-4243-b9bb-4d516c721450', 'Justice League: Throne of Atlantis', '2024-01-25 10:28:08', '2024-01-25 10:28:08', '15dd1488-0b75-485d-80c1-b35e6ab66a7e', '1deeec57-49fe-46ac-a250-fc289383085e');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('754ab305-a06c-4381-ad91-c686c53423bb', 'Learning OpenCV', '2024-01-09 05:56:34', '2024-01-09 05:56:34', '3f34b199-4a07-4cc8-8d5d-34fe8f545a8b', '2945e770-8867-4f0e-8ce0-c69f6e882314');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('a49922e6-9be3-43c9-ba8d-42a1073e05d6', 'Mossad', '2024-01-03 19:12:03', '2024-01-03 19:12:03', '8268bd6f-4540-4d11-a250-6e05e509039a', 'da4e291c-ee7d-4ff2-b3f7-92e4fc309aa6');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('e5f5c8d3-512a-4820-be7b-d49a5c58e706', 'Machine Learning for Hackers', '2024-01-20 23:29:44', '2024-01-20 23:29:44', '3960d0b6-cc81-4427-8cc4-7133b3390a2f', 'fd501d44-f7c2-4e7c-a333-4e9d587253db');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('5a90a9ae-65a8-4d83-88f9-a35c476b71cb', 'We the Nation', '2024-02-24 20:30:30', '2024-02-24 20:30:30', '8f5726dc-9d9c-4d81-b05b-80b89121e537', '4a7d9246-de47-4e97-946d-c1cf199881fc');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('34b50bcd-ac97-4695-86ea-698c30daea5e', 'All the Presidents Men', '2024-01-21 10:31:54', '2024-01-21 10:31:54', 'cad83f2d-8d30-494e-a566-a56359b633a4', '53c6d393-2f36-4828-be86-cf1b855df8f1');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('9c4fc27b-5499-44e6-ba2d-eee38a241e6e', 'In a Free State', '2024-01-28 23:04:00', '2024-01-28 23:04:00', '89351c7f-1b93-4704-8de4-0e80f5d6d4fd', '5dbdb0e2-5b90-4817-949a-c055b348b6b1');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('cef39d56-765c-4abc-80a0-8d49ae76da57', 'Fundamentals of Wavelets', '2024-02-06 07:47:27', '2024-02-06 07:47:27', '62998dac-3663-45f3-9338-b814ca85468c', '53d610a6-3a2c-4947-8e50-c329bb92cac2');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('a4d0a8a5-a7fa-44df-961a-75cd1b71de56', 'Analysis', '2024-02-27 01:49:43', '2024-02-27 01:49:43', '34237c87-070d-4576-aa9d-a1b69c9d633c', 'df7aeb20-60b8-4a17-a866-bc73a2a53adc');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('4ee5ce3e-1a08-4bf0-894a-0646943e3c74', 'Think Complexity', '2024-01-06 12:25:06', '2024-01-06 12:25:06', '2125ee7b-a123-437a-af6f-e5252a67edf0', 'a33dcfcd-10b0-46e7-b6f6-e8191df9c771');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('ab14c3ed-bf0d-4679-aa8e-742d88154dea', 'Maqta-e-Ghalib', '2024-02-02 13:56:45', '2024-02-02 13:56:45', 'aeb7d500-642e-4e4c-b0d9-bd0f6a57cd3b', '6b8fbe92-9a00-4c11-b5d4-ab29763bc5b2');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('a56554f8-a753-40a7-8ed8-67fd913af9a7', 'Orientalism', '2024-01-23 09:42:51', '2024-01-23 09:42:51', 'ebe5fefc-973f-48a1-ae02-9b3a094ed8a0', '671492ff-7078-4beb-b89d-ba5b7f2df414');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('1d61c582-9d92-4796-888d-a03f7213826f', 'Making Software', '2024-01-10 04:54:05', '2024-01-10 04:54:05', 'e39c4c8d-9f58-46cd-8428-44b60ca9e0b7', '5439e39d-6f94-4e42-acb4-65c8c638dd79');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('93fae6aa-f90b-4f75-be75-12cb1f837b60', 'Crisis on Infinite Earths', '2024-02-14 00:50:56', '2024-02-14 00:50:56', '67071f57-ce30-4f86-950c-9f93c1331663', 'f6368b55-0182-4056-bc8a-35f69b8f2af2');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('d280816a-70f4-47f1-ba3e-ee171d4e1d95', 'Neural Networks', '2024-03-03 04:26:44', '2024-03-03 04:26:44', 'da20befc-b46e-4446-878d-8fe3cc121d12', '81af3c26-1e6b-4710-805f-211f28c64f88');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('3c828774-1903-41d2-b839-2d5ce4e84283', 'Age of Wrath', '2024-01-10 14:58:36', '2024-01-10 14:58:36', 'debd1f6d-0b96-4702-8842-41cff229e8db', 'da6d1cc3-3fc2-4972-a5e2-ee0af78f3995');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('00c70b46-0548-461b-842c-82fe394672c7', 'We the People', '2024-01-11 23:32:33', '2024-01-11 23:32:33', 'ebe5fefc-973f-48a1-ae02-9b3a094ed8a0', 'fae32727-4cef-4233-8ed0-bf768fd7ba23');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('33da7382-d5e1-4f9b-87de-2a7013e204a1', 'Prisoner of Birth', '2024-02-01 01:57:01', '2024-02-01 01:57:01', 'a8ad70de-66f4-4769-b7d0-3e45fa5aff43', '54aa50c2-c4e1-4afc-a417-b6dd991ad726');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('e1906663-36c9-4a08-83b1-076ee5e7111b', 'Radiowaril Bhashane & Shrutika', '2024-02-13 18:24:56', '2024-02-13 18:24:56', '2125ee7b-a123-437a-af6f-e5252a67edf0', '818a8df6-ea44-407f-a94b-863b6b8d0bb9');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('3767df7e-54c3-41fe-b40e-664db27afdb6', 'Social Choice & Welfare', '2024-01-01 21:32:02', '2024-01-01 21:32:02', '0dcf686d-7d1d-4870-be81-67727fc1cce5', 'cb014e20-91ca-4d15-b39d-8b0a735eb5b7');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('10526399-dd86-48cf-89ed-daaaf3b2d4f2', 'Making Software', '2024-02-12 04:46:05', '2024-02-12 04:46:05', '6ba38622-8142-4fca-b9ab-5e6ace1582a2', '5ac7ee43-0a26-47a9-b388-56371a7f7106');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('8272d936-6273-4068-8de2-aeb93e4f8aed', 'Ahe Manohar Tari', '2024-01-09 17:50:11', '2024-01-09 17:50:11', 'ce2b4329-1e07-4ad3-9b8a-477eba59db14', '43945053-d716-4b44-8738-792b70486a3f');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('2bf67669-8162-4c1e-af27-48ad41f3ce1e', 'Python for Data Analysis', '2024-01-09 21:45:54', '2024-01-09 21:45:54', 'ed9f3428-7a65-4e73-b8b0-f5777c364dba', '8ce826b1-2c1b-411a-b758-7506ff392d39');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('4e2ddd03-49d8-44a3-8554-16dfcfd7d663', 'Complete Mastermind', '2024-02-27 06:59:56', '2024-02-27 06:59:56', '66989952-fad0-4c94-8675-a8c41d7579b2', '80714c70-2500-4be1-969f-7d1449a1fce2');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('313a7a88-b029-4177-b475-a3b0f3158804', 'Scoop!', '2024-02-07 18:11:00', '2024-02-07 18:11:00', '15dd1488-0b75-485d-80c1-b35e6ab66a7e', '79b99eee-9809-4756-b9c1-82c625ed4b8b');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('12ff68e6-8273-4bd0-b95c-7accedb7d823', 'Argumentative Indian', '2024-02-02 18:56:09', '2024-02-02 18:56:09', 'bf8c9fb9-beb9-41c9-abe3-06cb8db81401', '7e39fe9b-a22f-46c0-a376-faf3d510f785');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('49376545-6226-42b9-a8a3-744ea20cac7f', 'Attorney', '2024-01-05 03:23:49', '2024-01-05 03:23:49', '5da0a20a-1a15-4ef7-bc5c-9de659dcf717', '8b98e33f-b072-4e2c-9aac-a80b9133d8c2');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('8b1a0323-aa0f-476d-9326-f76c68903801', 'Wealth of Nations', '2024-01-31 04:23:25', '2024-01-31 04:23:25', 'c666f9a2-ff9a-44b8-bb39-9aefbdb24d3f', '2a451494-5658-443a-92ab-8f83da613641');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('145ddf83-4ee3-4373-bb63-e484becdf42f', 'Zen & The Art of Motorcycle Maintenance', '2024-01-23 05:33:28', '2024-01-23 05:33:28', '1961300e-bb98-4ecc-86be-191b1b2c1dca', 'a3f62ee2-6e17-4d61-a099-9d03eb8eb802');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('27b2782a-c174-487a-9fdb-2cd1a5351cec', 'Half A Life', '2024-02-07 18:00:37', '2024-02-07 18:00:37', 'f75cbe1f-a5da-4da0-a54c-c5dff37a8d02', 'c2c1da75-ae24-4681-9c61-797834d163db');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('aa1f9998-f4c3-42c6-b868-5f95e4ccbcc0', 'Making Software', '2024-02-25 04:37:57', '2024-02-25 04:37:57', 'e530b1e3-4517-4f03-9e8c-3dc546757d5c', '551532ba-0c2e-4c41-b8a6-d75e34bf496b');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('ad641e98-2052-4390-bae2-19f87caa227c', 'Empire of the Mughal - The Tainted Throne', '2024-01-05 12:19:18', '2024-01-05 12:19:18', '3fcf61a9-0c58-446c-a965-001d48bf433d', '067195fb-38a2-4eea-81e0-1c0aee91423d');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('908c542a-5e43-4cf6-83ff-bdf80414cf39', 'Phantom of Manhattan', '2024-02-06 16:01:20', '2024-02-06 16:01:20', '858cad16-81dc-40f5-b76c-0adb9b14c03f', '48b241d0-2264-4e23-a46e-3b8c4017fd9c');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('cea8b140-1b01-4a59-a6d0-8f28884a7d26', 'Maughams Collected Short Stories', '2024-02-17 19:19:51', '2024-02-17 19:19:51', 'b55f91da-d06c-412d-ad6a-6cb9375a670a', 'b95b139f-1521-4fc2-a991-e199abb9c666');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('2be6eb84-9ec6-4195-8628-ffe91920b535', 'Power Electronics - Mohan', '2024-01-09 22:10:06', '2024-01-09 22:10:06', 'af07bfd3-4a2a-4ca2-bf15-c442b3f6acd9', '263e9904-bc5d-451b-a270-b5c560ce4cd2');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('efbae1d2-87a8-4d12-9c1e-a7f21892a680', 'Crime and Punishment', '2024-02-20 15:14:14', '2024-02-20 15:14:14', 'a3540e55-f990-4e20-9e52-f5fd3136678c', '20bcd220-e544-41fd-bb69-b33c5b382d32');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('f9fbdd4d-21a2-4ed9-8c11-ac5ab683de41', 'Complete Mastermind', '2024-02-16 12:18:27', '2024-02-16 12:18:27', '5756276f-5bdd-4c3e-b04e-6fed7bb67b95', '732cf168-7c6a-4c74-a400-89cc2f1e213f');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('375b1ec2-6471-46c4-8beb-092fb2927129', 'Story of Philosophy', '2024-01-16 00:06:21', '2024-01-16 00:06:21', '2f22326e-7c72-49c6-b7cc-2ab7d9ff1716', 'e930e637-7a28-48ef-84ee-78f97bfc6b52');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('d8e6e16d-2fa3-454b-8cc2-bc9e8e55dcf0', 'Down and Out in Paris & London', '2024-02-09 16:55:01', '2024-02-09 16:55:01', '4522b44e-dfc1-4f9d-9934-45711e2b843b', '89712d63-b4b9-4ea4-895e-d63bde5c4f13');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('f0085a40-8392-45d8-9d6f-8b4c8585a6d5', 'Neural Networks', '2024-01-14 07:50:24', '2024-01-14 07:50:24', '7ae4be4e-bc19-4052-8c46-5dc1b76f8f08', '041afcdf-a979-463e-bf92-ea868b5f6e70');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('fdbffff6-a0c0-420f-9192-9e49501e13d5', 'Analysis', '2024-01-09 18:44:15', '2024-01-09 18:44:15', 'b08d2039-bcc3-4d0f-9468-cad5230ee07a', '877e2107-09f0-4770-b75c-0e0440c31954');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('bd0fd2dc-abcd-45c7-8f60-ef972dca1ee6', 'Pillars of the Earth', '2024-02-08 02:57:11', '2024-02-08 02:57:11', '7b104a22-298d-4898-a192-3f01e0245f4d', '98fb5cb8-dfcf-4c52-83d5-f8bf5c9f7441');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('26e06ff3-c2b7-4657-afe8-505c8e9ad2ba', 'Empire of the Mughal - Raiders from the North', '2024-02-02 09:48:23', '2024-02-02 09:48:23', '5bb2b69c-6383-42d1-8737-469980949d4a', '2a620ab0-b976-455f-a082-ecd035409aa6');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('a8d4a3ee-5348-46f3-ab3c-a34417d64156', 'City of Djinns', '2024-02-04 11:38:02', '2024-02-04 11:38:02', '128b545e-3b91-46bc-9e16-f87ab1fc062b', 'd6c6274a-d46a-46ca-955d-cbb6d82bdebd');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('0899260f-6454-4734-9be1-51251b3a96b8', 'Girl who played with Fire', '2024-02-02 01:28:40', '2024-02-02 01:28:40', 'd2ed2920-71e3-4089-9802-832f1336fb16', '51b5f883-e1ed-4d73-b3fe-ea7c2b2db1bb');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('853d19bc-685a-435e-865b-97a57115810d', 'Learning OpenCV', '2024-01-09 17:48:54', '2024-01-09 17:48:54', '53b5ffa3-cc68-41d9-8b56-5715741764b1', 'a733e3a6-0074-4b7d-8659-3122a365d93e');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('917e8462-378e-4baa-ae18-597bb1ca59d8', 'Deceiver', '2024-01-10 20:49:16', '2024-01-10 20:49:16', 'd2ed2920-71e3-4089-9802-832f1336fb16', 'eff3dfbd-b1fc-4139-a38c-812c990729c3');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('b3f591fb-ba96-41d8-a5ac-0be5ad14b44f', 'Drunkards Walk', '2024-01-02 00:57:25', '2024-01-02 00:57:25', '25f598ec-df85-4de8-81cc-5049c9013487', 'e648e10b-9155-4455-a649-18102c646c4c');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('ef8a6742-904b-4df5-b755-03d7b20ef479', 'Slaughterhouse Five', '2024-01-17 02:21:46', '2024-01-17 02:21:46', '11db1988-6f0a-459e-ab84-60518c633090', 'f5ba33a7-27c8-4346-8a2d-cc8d4623fba4');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('96e1db02-76e1-4743-8d81-133fddd591c2', 'Statistical Learning Theory', '2024-02-08 16:28:02', '2024-02-08 16:28:02', 'ace4b5b0-76d9-411d-8031-a0c30973d81c', '89e68b6f-40b2-4e3e-b5e1-0eddc63a6c62');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('7de11532-d98a-4d04-a4ee-f62f406a291b', 'Manasa', '2024-01-29 14:59:14', '2024-01-29 14:59:14', 'efbb4934-7ef6-46d1-8354-94c4bfb651dd', 'a43d5b4d-246d-45c0-9ab5-3ba0d99e2198');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('898ce41e-163a-403c-99bd-dbcf4cbaa519', 'Worlds Greatest Trials', '2024-01-28 16:34:21', '2024-01-28 16:34:21', '4dce55f5-4f33-4f9c-b945-af028fb72587', 'ef7aac2c-bd1d-4061-bff5-a4935774fd73');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('81637e43-f809-477b-892b-04e8bae9ae0a', 'History of the DC Universe', '2024-01-27 12:35:57', '2024-01-27 12:35:57', 'd2ed2920-71e3-4089-9802-832f1336fb16', '011ef6ad-9d5d-4506-9820-fa0d3568a111');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('5eb691fc-66a6-432c-8503-1bc69070a64f', 'Maqta-e-Ghalib', '2024-01-29 20:13:38', '2024-01-29 20:13:38', '8daae137-98df-4825-9c1f-7152ed2a0f1a', '5d15812d-f027-4071-8cb8-4d387b4f18bf');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('597850fd-8268-49f9-bc09-a318009636af', 'Birth of a Theorem', '2024-02-04 21:32:49', '2024-02-04 21:32:49', 'c38d2f2c-ecca-4df4-96c1-4a5addb12991', '106273d2-3ca0-4239-847e-722994128ce1');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('9ce4d6da-a3e0-4f71-b28e-fb2c0c75caa6', 'All the Presidents Men', '2024-02-01 02:42:06', '2024-02-01 02:42:06', '6ba38622-8142-4fca-b9ab-5e6ace1582a2', '1540da39-79cf-47c0-b3ac-413896813b63');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('f587239b-b4a8-4210-9f5e-dd83df1cc0da', 'Batman Earth One', '2024-02-21 18:34:44', '2024-02-21 18:34:44', '66989952-fad0-4c94-8675-a8c41d7579b2', '4a453b7a-2742-4f07-86e9-5c02c18e951d');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('b73e256f-6e26-4957-a943-ede096267905', 'Birth of a Theorem', '2024-01-10 23:34:42', '2024-01-10 23:34:42', '5b87a38b-f277-4be5-9cf4-4324d4703e95', '8bf4ff6f-3511-4d53-8927-72d20e06e137');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('f1ce7206-e13d-4f47-821e-6c99d70963b6', 'Rosy is My Relative', '2024-01-10 07:37:08', '2024-01-10 07:37:08', '2eb540a4-dbd7-4ff1-a247-14e528392a66', '97944242-db3f-4ea4-9399-6ece2879571c');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('be64f9e9-ad2d-4b18-a893-b72d05272f07', 'Farewell to Arms', '2024-01-30 21:34:30', '2024-01-30 21:34:30', '7ae4be4e-bc19-4052-8c46-5dc1b76f8f08', '724ca532-2d0f-4389-856a-6868ee138c74');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('a8fcc76a-9503-44ab-abbf-6ae49281454c', 'Uncommon Wisdom', '2024-01-28 02:53:34', '2024-01-28 02:53:34', '32fe9d0f-33db-471c-b51d-f81bc465d8c9', '6ad482fd-60cc-41e8-a48c-cd512e733d2c');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('ea34dfd8-5200-4e3f-b60d-378bf328f7b5', 'Superman Earth One - 1', '2024-02-07 11:04:30', '2024-02-07 11:04:30', 'f2c7a843-20fa-4f0a-81a0-b974ee89f72e', '47fde55e-8597-4b55-8ebc-6ee5fc079864');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('8921d3e6-496d-4e4a-a5b7-de987e68de66', 'Tales of Mystery and Imagination', '2024-02-25 09:32:52', '2024-02-25 09:32:52', '9513feea-f7d7-4216-b5a8-78d46a956f1b', 'e74a2454-07c5-4d9f-9c6f-14dfb89380b8');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('4242e5d5-bb2a-4590-9215-151d0b06e9ec', 'Maqta-e-Ghalib', '2024-02-05 20:41:36', '2024-02-05 20:41:36', '1146a8b8-5a49-4007-bb0f-19d77d4d1eae', '4f296d68-74cf-4b7a-90f8-254a9c116cb2');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('a204aa30-620b-4b19-92af-33cac1fd2313', 'Doctor on the Brain', '2024-02-14 07:34:12', '2024-02-14 07:34:12', 'a8ad70de-66f4-4769-b7d0-3e45fa5aff43', 'c5a9af3e-2e14-4c71-9704-084f2e1ae49f');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('febcc29e-e481-41c9-a542-119dd72ac88f', 'Men of Mathematics', '2024-03-02 06:30:06', '2024-03-02 06:30:06', '7b104a22-298d-4898-a192-3f01e0245f4d', 'b87cdc50-d809-461d-b6c0-578a1aadf82d');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('dcc6b44e-e0c6-4841-bf68-d6875a84c202', 'Cathedral and the Bazaar', '2024-02-27 01:25:22', '2024-02-27 01:25:22', '57ccb403-f0e1-42a3-b68c-f92724da13fb', '5ea23137-be6a-4b58-bffd-29ff6f9cd0da');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('13abd87e-d319-4c48-b452-2ccbac18cff8', 'Maqta-e-Ghalib', '2024-02-18 07:38:44', '2024-02-18 07:38:44', '39ec2c89-4b5b-45cb-86c5-74555455af20', '4f986a2a-4425-4c05-afbd-efac0e3d5299');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('6d00c179-52dc-4cd2-8d9c-ac05cf664fa5', 'Data Structures Using C & C++', '2024-01-05 11:17:16', '2024-01-05 11:17:16', 'ff383d84-b087-4712-a687-f7b93216df82', 'ee61fffd-1333-4523-9499-998b061b019b');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('80ab3011-f159-41da-9480-c35a24d44736', 'Bookless in Baghdad', '2024-02-07 16:29:39', '2024-02-07 16:29:39', '20c74d58-9a04-4d6a-95e0-2569e22d679f', '36063d21-7b09-4471-a91b-a4fe921902f9');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('3b90b8a1-d3f1-4d48-b53e-8be841621723', 'Burning Bright', '2024-02-08 00:24:40', '2024-02-08 00:24:40', '7ae4be4e-bc19-4052-8c46-5dc1b76f8f08', 'ce612a58-570d-4599-bac9-0061faa4752b');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('9d8945cc-fc85-4d39-ada9-ef30b3fdad5c', 'Argumentative Indian', '2024-02-17 20:19:45', '2024-02-17 20:19:45', 'c666f9a2-ff9a-44b8-bb39-9aefbdb24d3f', 'f7e8229d-9791-4458-a087-27b06a543fdc');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('c8bb048d-5d29-42e7-ae66-5e8086891db4', 'Sea of Poppies', '2024-01-11 05:09:13', '2024-01-11 05:09:13', '9c40f382-323a-466d-af5b-8c32e3ef5e4e', '63742dc1-ff8e-4024-bb2e-4e176024c193');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('067276ed-2bf8-4fdc-b302-5d95d63ece00', 'Angels & Demons', '2024-01-16 23:24:14', '2024-01-16 23:24:14', '1c4247e4-89bd-45b6-8147-e82d091b8890', '7c7dad41-b3ee-47f9-ae1d-f383fd5286b1');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('b98e9b89-1e6e-44b6-a18d-01ba9a31156b', 'New Machiavelli', '2024-02-24 02:55:32', '2024-02-24 02:55:32', 'b08d2039-bcc3-4d0f-9468-cad5230ee07a', '69b550c4-4532-4b5e-9b1a-9abf9fa1ad46');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('45a2df5f-299c-4ccf-b127-459a4e6c8799', 'Batman Handbook', '2024-01-01 02:42:33', '2024-01-01 02:42:33', 'f3f3eafd-78d2-4ebd-b132-71a32117fe70', '1ff6ed72-1a03-4d81-9e51-f49ca5d9d2d0');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('cb4d1a16-97cb-47b4-9f17-719beae572fa', 'Discovery of India', '2024-01-26 18:00:42', '2024-01-26 18:00:42', 'fcbeb8bf-bf63-4b23-9dbd-079376bfee7e', '49e280fe-b4da-40ee-b4d5-11d0f7c6c007');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('2fb2e296-8498-454f-b24f-25e59205d968', 'Power Electronics - Rashid', '2024-03-01 06:16:32', '2024-03-01 06:16:32', '2d7d9f42-b5e3-46bc-a21f-d81e81545cf7', '0257b5f7-9405-4572-aff8-ee074084d849');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('6383afb4-308c-4537-995f-7ab395d2b989', 'Winter of Our Discontent', '2024-02-22 15:54:36', '2024-02-22 15:54:36', '186c7bf5-2ef8-42ed-8f76-d78c9da3a1b7', '66276dd1-a276-45d5-ab76-920de62c7e18');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('5938193e-055d-45a6-a28d-918b7b614bee', 'Christmas Carol', '2024-01-13 10:57:04', '2024-01-13 10:57:04', '53b5ffa3-cc68-41d9-8b56-5715741764b1', '68c28aa3-7721-482a-ac4b-dea4d59e13fa');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('fa9cd0e4-62db-4462-ad53-4928094d55f5', 'Identity & Violence', '2024-01-23 06:00:51', '2024-01-23 06:00:51', 'c9d92d29-50c2-4da3-9fa4-11924a1212b3', '395748d0-96a4-47da-a372-cadce1e05eec');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('01c00f66-a785-4fcc-910c-9c81ab6086fb', 'New Machiavelli', '2024-01-27 08:35:38', '2024-01-27 08:35:38', '8268bd6f-4540-4d11-a250-6e05e509039a', 'dc992efd-933e-4f85-89e7-c47e89200e2f');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('cf5cfa4c-f236-40d2-9ee1-db95b99c1014', 'Theory of Everything', '2024-01-18 03:45:38', '2024-01-18 03:45:38', 'ce2b4329-1e07-4ad3-9b8a-477eba59db14', '66c6e444-bb16-4c0e-bed7-1f5003a76fdd');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('3c3a9fc0-9851-4224-bf04-262eb87161f3', 'Surely Youre Joking Mr Feynman', '2024-02-19 23:52:22', '2024-02-19 23:52:22', '94997f97-b0a5-495b-af1d-0932b4a73e4f', '5342ae53-1192-44e9-ae28-b3a731acbeb0');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('b9b47cfb-a114-4472-83ad-21a8a72e3f6c', 'Tao of Physics', '2024-02-27 10:20:09', '2024-02-27 10:20:09', '79fa4497-e94b-4b10-bcdc-77c0344b2ac9', 'c2a41497-20ae-4fe4-9b60-d429900f9e07');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('b9fe724c-3e4a-46f7-9637-e99d83a88f4b', 'Mein Kampf', '2024-02-13 18:07:37', '2024-02-13 18:07:37', '8daae137-98df-4825-9c1f-7152ed2a0f1a', '5cec37bb-376b-4d72-8a29-8149ca922d3c');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('faf025e3-65cf-4fde-9bc1-d65126c533a8', 'Complete Sherlock Holmes', '2024-02-11 08:26:23', '2024-02-11 08:26:23', '29c1f303-4ddf-4754-a156-0ef5054630fb', '1724d07c-1910-4b3e-ad38-39a64987a144');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('b4c13fe2-dc53-4d82-8ca6-611a449a97e7', 'Catch 22', '2024-01-24 11:16:33', '2024-01-24 11:16:33', '3960d0b6-cc81-4427-8cc4-7133b3390a2f', '2f6cf9b9-b995-4c54-9c64-5baba86d6899');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('0a1774da-b0be-461d-a7c1-b0010f7311ad', 'Doctor in the Nude', '2024-01-21 22:08:25', '2024-01-21 22:08:25', '658825b3-fd54-4dbf-9a70-0b7a3eee1cd5', 'e78fc0ad-84f3-4a96-bc85-463370f0a312');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('58ba6248-e97c-48f9-80a6-811eb6050ff4', 'Superman Earth One - 2', '2024-02-17 20:32:49', '2024-02-17 20:32:49', 'c336299d-aa7e-4c0c-921c-290d852caeeb', '0a0447ab-891d-4555-b842-b222d5e92173');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('fc43dab9-4f34-4583-8f9c-c657bd484436', 'Judge', '2024-01-08 06:51:10', '2024-01-08 06:51:10', '186c7bf5-2ef8-42ed-8f76-d78c9da3a1b7', '0a205b26-50bd-4f46-a5a5-73b1ffe17150');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('d4f06761-b275-4662-b50a-af870c94dd80', 'City of Joy', '2024-01-07 15:52:38', '2024-01-07 15:52:38', '4dce55f5-4f33-4f9c-b945-af028fb72587', 'ef150ba1-f266-4f81-b76b-c177c282ccb5');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('dfd80929-4e09-4c4d-a484-d4a83859c354', 'Maughams Collected Short Stories', '2024-02-26 18:37:55', '2024-02-26 18:37:55', '22c7275e-aeb8-41dc-af24-596f65d37a93', 'e11282ec-916a-4162-8890-68c2763d25b1');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('cf5d5120-6594-4ee3-a284-f9dfc32f14bb', 'Econometric Analysis', '2024-01-31 21:42:31', '2024-01-31 21:42:31', '4762c179-f770-4d66-93e9-dffb48b9f59d', '26e4e6cb-2505-4bba-ada9-95f01828a59d');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('9d7761bc-d06d-4814-b137-d7d1e7b78d5b', 'Empire of the Mughal - Ruler of the World', '2024-01-22 12:40:28', '2024-01-22 12:40:28', '1778ba0d-21e5-420b-acb6-e1b4e0223855', '005b41ab-fdc6-4b1b-a3ca-868220548233');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('898bbb32-d0ee-485b-ab5e-06655e514ba2', 'Talking Straight', '2024-02-13 20:31:44', '2024-02-13 20:31:44', '2356dbc4-6734-4062-a585-a45f845220b6', '0c3e0146-08a1-4944-a459-59dbf50b3183');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('65d6905c-3c4d-4561-a3b7-ba4b9a9af626', 'Hunchback of Notre Dame', '2024-01-28 14:01:20', '2024-01-28 14:01:20', 'f5cfaf63-1b1c-44f1-a33c-eb88597d4243', '8869049d-b9e7-43a1-a221-afbe057401d2');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('2fe6d522-f68d-4083-af43-5fc6f916ee1c', 'Power Electronics - Mohan', '2024-02-27 06:07:19', '2024-02-27 06:07:19', 'd1e7d47c-c2f0-484a-b9c2-a5e657cd287f', '2582b305-5214-4fbb-bfcb-0e7cca6819e7');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('b5f74e03-8f66-4609-a9ae-ccd071c8fd9b', 'Death of Superman', '2024-01-09 06:04:08', '2024-01-09 06:04:08', 'e530b1e3-4517-4f03-9e8c-3dc546757d5c', '5238c4f1-fa71-4086-9f6d-8d73ae3feb56');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('2e0bcb2c-73c5-4356-9cf5-a809665b8066', 'Great War for Civilization', '2024-01-23 02:48:34', '2024-01-23 02:48:34', '7e119971-cd0a-46db-9585-d895d46f785e', '1e56d4bc-2dd9-4d16-ac52-2f5a0c1414c8');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('bb1bafb3-6f26-4db0-b600-08760623b8e3', 'Radiowaril Bhashane & Shrutika', '2024-01-09 14:24:48', '2024-01-09 14:24:48', 'd2ed2920-71e3-4089-9802-832f1336fb16', 'eab5de5a-2f02-43d4-929e-ee214cb4ef3a');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('694a41f2-b931-4738-9495-61d9a6db3998', 'Journal of a Novel', '2024-02-08 03:49:34', '2024-02-08 03:49:34', 'a8ad70de-66f4-4769-b7d0-3e45fa5aff43', 'bcc0e11f-70ff-40cc-8b48-188dec77b605');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('461be189-d8da-4d78-8cb7-d24682079b10', 'Ahe Manohar Tari', '2024-01-23 20:11:58', '2024-01-23 20:11:58', '9511f3b4-1433-440d-923e-b5c30bc15684', 'd2998b31-96b2-4bb5-8e83-285b7fd6561e');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('a5d5a412-a835-4385-b6ca-553c9c78ebec', 'Empire of the Mughal - Brothers at War', '2024-01-17 04:24:56', '2024-01-17 04:24:56', '0830a21d-548c-4b1e-846c-3e628a816a41', '936d71b2-0230-44db-9c36-73f698e6f27e');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('0cd461f3-3976-4400-9cd7-047ed4e55c04', 'Age of Wrath', '2024-01-24 18:27:30', '2024-01-24 18:27:30', '2df8e6b0-3a1a-487f-a0f4-979f0a9a81c8', '00a68132-bf39-464d-9e88-2449875b2ccb');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('d50640d2-7c98-453c-9e6f-ddb6b66cb5b0', 'Crime and Punishment', '2024-01-18 09:04:58', '2024-01-18 09:04:58', '8f5726dc-9d9c-4d81-b05b-80b89121e537', 'bd85294d-c6d7-49e8-aec2-fb734c7ccc2c');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('30a72d20-87e7-4bc5-93e4-9b815b340f87', 'India from Midnight to Milennium', '2024-02-16 06:56:35', '2024-02-16 06:56:35', '11db1988-6f0a-459e-ab84-60518c633090', 'f3f47011-1023-4a7b-a35e-cc5dbe551f44');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('52f5d1e1-d404-438b-9c04-0e0ade55f108', 'We the People', '2024-01-28 09:09:43', '2024-01-28 09:09:43', 'd5c5c499-f015-428b-b907-3e6f4f184058', '1295c4d9-f5a5-4543-ae77-448aeb142153');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('78343e44-4bca-4448-9459-17765366025b', 'Complete Sherlock Holmes', '2024-01-07 23:25:53', '2024-01-07 23:25:53', 'f50bf1be-22f7-4716-a60b-a6910871c19c', 'def25232-c6a4-4760-80da-0bc0b51b879b');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('bc030cf7-c2dd-40b8-a59f-99c486e10f7a', 'Batman: The Long Halloween', '2024-01-25 07:26:32', '2024-01-25 07:26:32', '2eb540a4-dbd7-4ff1-a247-14e528392a66', 'ad21deaa-574b-4f88-9158-98c7c946a17e');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('2d467c10-4ef9-41cb-970b-2e17094188f1', 'Let Us C', '2024-02-20 01:03:09', '2024-02-20 01:03:09', '1fc9fedd-2be4-4845-adc1-c79c854eedf5', 'ac960179-a4d3-4f88-812a-b9db60d37a49');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('e8104b99-8184-46a3-ad69-421c2139de19', 'Free Will', '2024-01-28 23:14:36', '2024-01-28 23:14:36', '1c4247e4-89bd-45b6-8147-e82d091b8890', '5d77f103-8950-4906-abdd-2599d2a9dfc9');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('0c72de00-ee60-404e-a824-cff10ae685de', 'Prince', '2024-02-15 08:06:17', '2024-02-15 08:06:17', '2356dbc4-6734-4062-a585-a45f845220b6', '076f0c68-3cde-4f0c-8e79-f70f8f16c710');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('decb7146-4664-4ffd-bb8c-a794d0906494', 'Idiot', '2024-01-15 21:25:14', '2024-01-15 21:25:14', 'ff383d84-b087-4712-a687-f7b93216df82', '33696499-5411-4f95-aec9-872683fc97a6');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('a1811988-fc54-4c59-bbec-2d6117bcafcb', 'Beyond Degrees', '2024-02-02 01:12:30', '2024-02-02 01:12:30', '6e26cdb2-3a3b-474e-8002-d1d2dbe35ab3', 'b898708a-43f8-4aed-acd0-5bdf08988855');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('65249bf1-d13c-42d7-8c69-16c674561546', 'Crime and Punishment', '2024-01-29 10:00:18', '2024-01-29 10:00:18', '686925df-4ead-4ab8-96a2-87d6e8a8b8cc', 'ad2b3642-61f5-4de9-874d-9bb121788607');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('ef1ebf8d-9b68-42fb-8343-93567d79fc77', 'From Beirut to Jerusalem', '2024-01-07 18:13:02', '2024-01-07 18:13:02', '5b890e6a-6bcd-41d2-b798-eca15692e3f5', '9bab920f-ad57-40d8-bb2d-0698f5d070d3');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('a147e388-15f8-4632-8a34-69624fecd043', 'Moon is Down', '2024-01-29 18:40:44', '2024-01-29 18:40:44', '39cb3ea9-0eb6-435c-9646-15a85db827d0', '723842ab-9169-4c84-a8d1-97e384ef0c2a');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('f52fac08-c528-4dce-affc-bbbda0fa761b', 'Data Scientists at Work', '2024-02-20 21:01:31', '2024-02-20 21:01:31', '8ca396fb-3bbb-4125-abc7-a429b24f3a32', '15f66041-c578-4f5d-8962-efeec79167be');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('a8574218-d3d9-40dd-9d4c-84a9ea516d8d', 'Empire of the Mughal - The Serpents Tooth', '2024-02-17 10:32:16', '2024-02-17 10:32:16', '89351c7f-1b93-4704-8de4-0e80f5d6d4fd', '5e19506b-e179-48d6-a7a4-b11d9483fa69');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('7c163f7f-d50f-4a9b-925f-d2cb7392dba1', 'Integration of the Indian States', '2024-01-19 00:01:22', '2024-01-19 00:01:22', '44a3c610-71ba-44f5-aedf-5a346b2bcbe1', 'a8342648-08ff-4ac3-926f-2589c2d6f67e');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('b76d516e-a62d-468a-9a37-443199bb81c3', 'Talking Straight', '2024-02-24 09:14:22', '2024-02-24 09:14:22', 'd9c9926b-f7c0-4cf1-aead-71cb07e92826', '96165f14-1c53-427e-a0e0-a42f2587ebca');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('ec8382ab-2462-424d-b07e-8d53096e6a5f', 'Analysis', '2024-02-22 03:29:39', '2024-02-22 03:29:39', '15dd1488-0b75-485d-80c1-b35e6ab66a7e', '0f79aab8-3da4-45a0-9820-382aa204eba0');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('f0738225-ef20-4d58-b6e2-c5956fef67f3', 'How to Think Like Sherlock Holmes', '2024-01-02 19:30:05', '2024-01-02 19:30:05', '5da0a20a-1a15-4ef7-bc5c-9de659dcf717', '831326fc-7457-4eef-a17e-57366a40eabb');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('f547a154-c26c-4f59-933d-e8b989a32b56', 'We the People', '2024-01-28 11:40:00', '2024-01-28 11:40:00', 'bdcd2998-c50d-4214-8d43-c07be5fb0edd', '9b4518f2-70eb-4fe1-bece-fe8f3dbc4eda');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('5fca003c-ffe7-4ad1-8a5e-4ed67f19b760', 'Complete Sherlock Holmes', '2024-02-02 02:28:48', '2024-02-02 02:28:48', '29c1f303-4ddf-4754-a156-0ef5054630fb', '14c21685-b1c5-4fdb-8c36-df07b0f20483');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('d36cce14-71cd-4421-be39-59110b617840', 'Age of the Warrior', '2024-02-13 21:10:26', '2024-02-13 21:10:26', '658825b3-fd54-4dbf-9a70-0b7a3eee1cd5', 'f0bb7645-9fdb-4fb6-87c4-a2de6c5d996c');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('6a07b3c5-b7a3-42e7-86cd-193617a10ce8', 'Data Smart', '2024-01-03 17:26:39', '2024-01-03 17:26:39', 'b08d2039-bcc3-4d0f-9468-cad5230ee07a', 'efe83fc7-1806-4296-8c16-095967af893a');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('ca4da35d-85ca-4f1a-9b60-d25a058597bc', 'Great Indian Novel', '2024-03-02 14:06:37', '2024-03-02 14:06:37', 'af07bfd3-4a2a-4ca2-bf15-c442b3f6acd9', '158283b7-52a8-4b0f-aebb-038f21c545a5');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('a0323bf2-223e-40d4-adc8-a5b543ce9574', 'Trembling of a Leaf', '2024-03-01 08:58:10', '2024-03-01 08:58:10', '50ea9c44-8487-472b-87c3-9762efc966ba', 'ffdc2a1d-fc87-4f94-a01f-78dd5a23d61f');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('e124be00-9502-4305-907f-55a955b275f3', 'We the Nation', '2024-01-24 09:41:31', '2024-01-24 09:41:31', '64fb479e-51b2-4545-9525-e5f28c7f48e2', '27d06b7d-6ca0-48bf-bfc7-86e3514856f9');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('7b795305-bb1e-4915-8e5b-33c64ec92636', 'Ashenden of The British Agent', '2024-03-02 07:15:00', '2024-03-02 07:15:00', 'b1d107c9-def6-413b-b94e-889e8409995e', 'c515647d-a0eb-477d-a62a-b5dedbade17b');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('480305e3-aef7-46b9-8601-dd2ac0002f7e', 'Ahe Manohar Tari', '2024-02-05 09:49:33', '2024-02-05 09:49:33', 'bf53e575-e11a-4ab8-b7b6-4c1cb777c64f', '46ee12b3-752d-4714-b29f-7de157163643');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('97e1acb5-84c5-4198-aa0b-f7b80d14d1a1', 'Political Philosophers', '2024-02-28 16:11:23', '2024-02-28 16:11:23', '588b248f-1b77-42f9-854e-6e67592b0033', '70647407-4ed4-4ee6-8ad2-f74fa3c184ed');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('07a9ffc8-02c2-497a-bccc-e790086350a9', 'Phantom of Manhattan', '2024-02-01 15:36:13', '2024-02-01 15:36:13', 'da7d29e7-bca8-4c9e-b3bd-9c1699f736fe', '57351092-5ade-4926-a04c-f60a56114ac7');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('eb17fcf2-4732-42d8-b3a3-912b3ae4a8a7', 'Maughams Collected Short Stories', '2024-01-13 10:35:07', '2024-01-13 10:35:07', '3947aedf-5699-402b-9c7e-3a0f3474b536', '098f6e55-7c44-4b67-a06a-eb4c70c10f4c');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('1f51cdac-a7a9-4476-a1c6-27824af18a0f', 'Surely Youre Joking Mr Feynman', '2024-02-18 08:18:35', '2024-02-18 08:18:35', '8ab34037-9796-4fb8-80c7-33f33f937a8c', '33d05928-419f-4abe-820b-d47293d30242');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('deece8ef-34b4-459a-990a-195f1e2ef25c', 'Manasa', '2024-02-12 10:45:42', '2024-02-12 10:45:42', 'e76c38fe-7abb-4f31-b623-5c93fa41df4e', '8cbf5bd1-71e1-4946-9a28-bac73b2c289f');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('d250c2dc-0bac-47eb-a6de-4195b13d38c1', 'Hunchback of Notre Dame', '2024-01-27 20:39:16', '2024-01-27 20:39:16', '5754903f-9261-48ef-8f3e-e87f96e9130d', '2f3e82be-93f1-4fae-a2d7-ee391441c1dd');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('5cdc075b-c6cc-4584-8656-562dab2f8f0e', 'Design with OpAmps', '2024-02-19 13:14:42', '2024-02-19 13:14:42', '3f34b199-4a07-4cc8-8d5d-34fe8f545a8b', 'a9ce8778-5eab-453f-8184-4561a821bee2');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('71bee1ca-306d-4312-a904-8a4ad136f1be', 'Empire of the Mughal - Brothers at War', '2024-01-03 09:59:46', '2024-01-03 09:59:46', '213faf01-9c33-46fe-9e5c-6efb456c5f2a', '8a2e86ee-b5af-469e-9677-b5497a97280f');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('32491996-c447-48ac-b3c7-514a5e96e2f4', 'Half A Life', '2024-01-03 10:36:22', '2024-01-03 10:36:22', '39469e77-7ccd-4a90-9afe-4d12052ebcf3', '7070802d-90c1-4d21-a767-38d27356231a');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('7f5549b0-65b5-474a-9d56-4fbf80171205', 'Trial', '2024-03-03 11:58:08', '2024-03-03 11:58:08', '4522b44e-dfc1-4f9d-9934-45711e2b843b', 'd5e76aa0-5217-4cb3-aba0-d3484df46b3a');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('682d3095-50e8-4e15-8c18-2c52f9997dd6', 'Physics & Philosophy', '2024-02-07 10:14:30', '2024-02-07 10:14:30', '514b1d41-3c31-4996-8813-581d024a9d50', '96e4c413-8811-4d5a-a738-351e30a7b05f');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('e6ac3d5e-ae4c-4703-9899-05e4018a7e00', 'Data Structures Using C & C++', '2024-02-16 20:13:13', '2024-02-16 20:13:13', '607da2e6-280c-4f12-b290-3c236e902805', '44c0b318-679d-4682-9dd4-a171d102bec9');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('dcb342b0-c085-4517-abc9-fabc3d4ce9b2', 'Batman Handbook', '2024-01-19 02:01:57', '2024-01-19 02:01:57', 'e76c38fe-7abb-4f31-b623-5c93fa41df4e', '14dc820b-dbe8-44de-907e-d88f7207a1e9');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('8832da75-810d-49d2-852e-62519b23428c', 'Batman: The Long Halloween', '2024-02-05 21:05:58', '2024-02-05 21:05:58', '143cfbd9-85d0-4313-a17a-9d68712492c8', '67d8c4b8-594a-4c95-ab4f-36ab6b4f365d');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('658b4ff7-0aa6-480c-ac7b-09fdee62602d', 'Justice League: Throne of Atlantis', '2024-02-11 16:54:21', '2024-02-11 16:54:21', '186c7bf5-2ef8-42ed-8f76-d78c9da3a1b7', '63a8d144-575e-4bf7-a862-1e011e92480e');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('de16acc2-740a-4679-beda-8b29e65a26a5', 'Political Philosophers', '2024-02-27 23:21:05', '2024-02-27 23:21:05', '686925df-4ead-4ab8-96a2-87d6e8a8b8cc', '5f0ed24e-eb65-494f-9d74-00bdf6d846d4');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('1956a924-73e2-4220-a640-f82febdf6ec5', 'Empire of the Mughal - The Serpents Tooth', '2024-01-17 01:06:26', '2024-01-17 01:06:26', '7ae4be4e-bc19-4052-8c46-5dc1b76f8f08', 'aa1d5f78-fef9-4a66-a317-abcbb132e798');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('a087b139-3455-4360-9fb8-12d51d25d162', 'Trembling of a Leaf', '2024-02-06 02:35:05', '2024-02-06 02:35:05', 'f9f9b756-6c56-4884-819c-92f4e30b75a1', '590bc630-2d5a-41c4-a945-67bebbbd7647');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('ab47c513-9015-47c5-b372-91f1cb9c2b87', 'All the Presidents Men', '2024-02-15 11:58:04', '2024-02-15 11:58:04', 'bb7d91c4-5561-4d4c-8cb6-1a0095712152', '192ef4dd-9ea3-4d05-96b5-9d09011d1030');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('63cc26b6-6a82-4914-8ac2-ff71a2fcad0e', 'Empire of the Mughal - Ruler of the World', '2024-01-15 05:38:57', '2024-01-15 05:38:57', '8268bd6f-4540-4d11-a250-6e05e509039a', '2792dea0-be81-4000-9b88-7d9d53bd77cd');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('ce3a84f4-77a7-444f-832a-ab94fc91e6a9', 'Philosophy: Who Needs It', '2024-02-07 00:03:40', '2024-02-07 00:03:40', '18d09ca4-f133-4159-ad20-3bb664a4b18f', '77b74afe-a658-426e-b013-a536487ff83d');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('37d5e719-4fe6-4ce9-a228-c5e952f6b05f', 'Outsider', '2024-01-27 02:37:09', '2024-01-27 02:37:09', 'b86f03c9-6262-4c8c-9724-9a4190680820', '3ab27d3f-4c77-42e2-8800-4b2db7bf3290');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('04f8fcd8-a672-4cdd-b9d7-fbe62a3992ab', 'Numbers Behind Numb3rs', '2024-02-14 00:26:36', '2024-02-14 00:26:36', 'f5cfaf63-1b1c-44f1-a33c-eb88597d4243', '73a01e31-3d4a-46ad-87ec-c8c120078e0f');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('23b27012-1381-4c78-9696-ef378b4578d5', 'Elements of Information Theory', '2024-01-15 12:09:44', '2024-01-15 12:09:44', '3960d0b6-cc81-4427-8cc4-7133b3390a2f', 'ed3258ec-65ed-46ee-9a3f-dc34b0cf9f25');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('5bb1fd8c-6d47-41a1-a395-7855ac5515eb', 'Rosy is My Relative', '2024-03-02 15:25:00', '2024-03-02 15:25:00', '20c74d58-9a04-4d6a-95e0-2569e22d679f', '6b94ffa8-da7a-40d4-a24e-b8fe4fe58fcd');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('b4ced7a6-0ab5-46ff-a18a-d678b46b4cc3', 'God Created the Integers', '2024-02-08 23:41:37', '2024-02-08 23:41:37', 'f5cfaf63-1b1c-44f1-a33c-eb88597d4243', 'c5cf8a8f-beb2-4adf-92e4-1079b2fbf6f2');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('5f6ed12d-ea9b-46c6-a2ad-89cf407a1d2c', 'Girl with the Dragon Tattoo', '2024-02-13 23:04:59', '2024-02-13 23:04:59', '67071f57-ce30-4f86-950c-9f93c1331663', '2427ae09-ccc8-4ea7-a311-ec5406400262');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('17fa51e1-e26d-4e06-9d4a-02e149f28d83', 'Design with OpAmps', '2024-02-17 21:50:15', '2024-02-17 21:50:15', 'f9f9b756-6c56-4884-819c-92f4e30b75a1', '3c2ee961-0e4b-420d-b00a-0c6b2d9e4b16');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('57b8870e-d7e1-4cc5-8cfe-52b0738d5a15', 'Char Shabda', '2024-01-29 22:31:39', '2024-01-29 22:31:39', 'b261f774-2b85-4f84-b3f3-defc09e3c106', 'ae4985bd-2304-4547-b783-1babaf1fde5f');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('3e83f1ef-392e-4b61-bdb7-62f6a052b881', 'Structure and Randomness', '2024-02-08 18:06:33', '2024-02-08 18:06:33', '25f598ec-df85-4de8-81cc-5049c9013487', '5085f02f-03a8-4501-afe1-936864ee391f');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('bd73cb19-e471-494c-addf-ba3785b0a2c9', 'Beyond the Three Seas', '2024-02-18 07:04:43', '2024-02-18 07:04:43', 'eec4d1d7-2250-4ce6-b365-5befd4fac4cf', '15f2ada4-3dc5-44df-bc3c-8c9eceb64236');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('a5764d4a-9007-4ac7-a279-425e545057c3', 'Statistical Decision Theory', '2024-01-02 07:46:02', '2024-01-02 07:46:02', '3947aedf-5699-402b-9c7e-3a0f3474b536', 'c8379721-73b5-494d-a853-3efa5dcd7b1e');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('f5843f4d-1b72-4b10-887d-0f9b7ab76075', 'Batman: The Long Halloween', '2024-01-24 17:51:12', '2024-01-24 17:51:12', '2607c164-537b-4af9-a66d-35b1b63e3035', 'e080b204-854b-4f7d-883d-2b7565af0d62');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('0b9a2023-8c0e-43ce-8a17-135739271e7a', 'Courtroom Genius', '2024-02-08 23:12:49', '2024-02-08 23:12:49', 'bf8c9fb9-beb9-41c9-abe3-06cb8db81401', '33692696-51b6-4f12-b8f5-fe4bd8eb8053');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('459a32ad-06bd-4076-9ad5-b0f8dd502b9e', 'More Tears to Cry', '2024-01-20 12:11:38', '2024-01-20 12:11:38', '66989952-fad0-4c94-8675-a8c41d7579b2', '286b26b0-9d3d-4c4b-8820-f53af832bb46');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('90756e0d-fdf8-4aa2-9562-a1b7ee69f862', 'Elements of Information Theory', '2024-01-17 12:17:04', '2024-01-17 12:17:04', '50ea9c44-8487-472b-87c3-9762efc966ba', '4d11510e-db86-4997-9821-a2ac88544d3b');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('3bc275ff-dc6d-420e-a174-49813e78116d', 'History of Western Philosophy', '2024-02-17 00:23:39', '2024-02-17 00:23:39', '186c7bf5-2ef8-42ed-8f76-d78c9da3a1b7', '8a04600f-a2d1-42e6-a8b1-3901f23d2dbd');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('78964080-d4e5-4228-8eca-a556297ea357', 'Tao of Physics', '2024-01-17 06:45:12', '2024-01-17 06:45:12', '94997f97-b0a5-495b-af1d-0932b4a73e4f', '2f4bed2b-a4a0-431d-95a6-4cb8d4428e6e');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('6e0ce6ef-0d1d-434f-bdb9-8956c593d66d', 'Trembling of a Leaf', '2024-01-12 10:54:45', '2024-01-12 10:54:45', '18d09ca4-f133-4159-ad20-3bb664a4b18f', '465df3cc-a36a-4402-87d0-892fcc5a7d5c');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('60bc5e18-5617-4ded-9639-aac4e848a703', 'Physics & Philosophy', '2024-02-11 08:11:41', '2024-02-11 08:11:41', '5756276f-5bdd-4c3e-b04e-6fed7bb67b95', '0f34e70e-0e70-4965-b00a-6124e840d134');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('12e93159-65b6-40b1-b767-6f051df2f7ec', 'Data Structures Using C & C++', '2024-01-06 21:46:45', '2024-01-06 21:46:45', '11db1988-6f0a-459e-ab84-60518c633090', '25a25319-e9b4-456d-a419-62118563909c');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('84269eef-493e-4668-89be-aafcb092e942', 'Complete Sherlock Holmes', '2024-03-02 18:29:35', '2024-03-02 18:29:35', '79fa4497-e94b-4b10-bcdc-77c0344b2ac9', '17973d3b-c41e-4c93-86e2-7349dd09d0f9');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('b73f8ada-0008-4a8a-907f-5d24fd3b7aee', 'Talking Straight', '2024-02-21 02:46:34', '2024-02-21 02:46:34', '50ea9c44-8487-472b-87c3-9762efc966ba', 'e7bce5d2-27f8-4e51-a054-41a147114252');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('991e41b3-bb34-4ce8-ae03-b50defd29682', 'Machine Learning for Hackers', '2024-01-19 00:36:07', '2024-01-19 00:36:07', '14af3e5e-e1b7-48f5-a1ed-1750499f328f', '92b4d196-2acd-4ed6-a913-ceb2113e3623');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('7f9134b9-e0e2-4f14-a475-1c4ed754bcf0', 'In a Free State', '2024-01-05 05:09:37', '2024-01-05 05:09:37', 'a3540e55-f990-4e20-9e52-f5fd3136678c', 'a85a1e07-0a32-4148-a241-d1d35b0f44b3');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('e50213a2-3f66-47ec-aa7b-87dfc47dbe54', 'Neural Networks', '2024-03-01 22:19:56', '2024-03-01 22:19:56', 'f0eec7c3-9c12-4507-86ea-052b6eb8c2cc', '31761be3-d00a-4648-9a10-292cafb69e75');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('b2f9d355-61e5-4679-87b3-fb16550ebfe6', 'Code Book', '2024-01-07 06:43:02', '2024-01-07 06:43:02', '67071f57-ce30-4f86-950c-9f93c1331663', '21b3c4c3-4a0b-495f-ab94-53a375732d88');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('c78b2751-b27f-42eb-b8b1-906004fe0eff', 'Empire of the Mughal - The Serpents Tooth', '2024-01-14 06:37:18', '2024-01-14 06:37:18', 'ea56e16f-1ab2-4e50-8151-3fb77b2b891a', 'dba8f7b2-fbaf-4100-818c-cf71598f2db5');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('dc29316a-6158-4384-9a8b-d711b33edc92', 'Last Lecture', '2024-01-05 21:10:33', '2024-01-05 21:10:33', '7ae4be4e-bc19-4052-8c46-5dc1b76f8f08', '62ff813e-bc9a-4e5b-8e11-e3912f22e668');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('707abbb5-a810-4412-8f4b-07ddf886bd89', 'Prisoner of Birth', '2024-01-17 18:34:15', '2024-01-17 18:34:15', 'd5c5c499-f015-428b-b907-3e6f4f184058', 'be551b67-3da7-4052-8e4f-59c140199ed5');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('0886b8c1-67fd-47df-a3b8-19389b8c51ca', 'On Education', '2024-01-06 15:38:28', '2024-01-06 15:38:28', '9511f3b4-1433-440d-923e-b5c30bc15684', 'd563e03b-c1b8-402e-b365-ba4f632dc207');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('49e9db1e-39f0-4a61-a364-ef0c284bf8c6', 'Batman Earth One', '2024-01-12 21:10:10', '2024-01-12 21:10:10', 'f75cbe1f-a5da-4da0-a54c-c5dff37a8d02', '990c9992-f553-4e1a-9592-d4acbb37d87f');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('b8e3664e-e4fd-49a9-b291-f6d2aaf5ba4b', 'Flashpoint', '2024-02-03 16:08:46', '2024-02-03 16:08:46', '1778ba0d-21e5-420b-acb6-e1b4e0223855', 'abf84f8d-7cf1-47e5-84e0-21a9bad18254');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('239be67e-5c5d-4032-8be4-a7b6866f405b', 'Data Smart', '2024-02-15 10:29:37', '2024-02-15 10:29:37', '3947aedf-5699-402b-9c7e-3a0f3474b536', '08c6e0bd-6c66-48c7-8840-f72a743e1c85');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('594b3ca2-7bc4-4996-8ed3-23c6dd76121b', 'Empire of the Mughal - Raiders from the North', '2024-02-05 01:40:11', '2024-02-05 01:40:11', '52d06eda-1eb2-4707-b694-557e29ed2ade', '9397d175-fc86-495d-b009-8811fb46d160');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('79aa4abc-21e0-4e61-b911-0dcb0249472e', 'Tales of Beedle the Bard', '2024-01-09 22:48:02', '2024-01-09 22:48:02', 'e0420d90-103f-4f92-a7ed-7c8380441600', 'd1e10346-28c0-471b-a6fb-113353efabad');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('a941b989-d492-4620-ba81-99b44737a9e5', 'Batman Handbook', '2024-01-17 16:47:56', '2024-01-17 16:47:56', '57ccb403-f0e1-42a3-b68c-f92724da13fb', '0c2c9f77-ba5e-4fce-845b-02012caa2245');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('30b4fdfa-8461-46e4-a25e-d78611b95729', 'Data Structures Using C & C++', '2024-02-27 12:23:17', '2024-02-27 12:23:17', 'f5cfaf63-1b1c-44f1-a33c-eb88597d4243', '1190b395-b10f-430d-ae89-80737d9255fc');
INSERT INTO public.theses(
	id, title, "createdAt", "updatedAt", "professorId", "studentId")
	VALUES ('7dad9896-9dd5-4ece-adcc-6a8313524bab', 'Great Indian Novel', '2024-02-27 14:47:08', '2024-02-27 14:47:08', '8da66afc-50b8-4ef0-86d7-693b92b0592e', '3017ca78-c17f-4ac0-8133-157bfe0b1986');
