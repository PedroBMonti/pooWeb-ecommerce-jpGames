--
-- PostgreSQL database dump
--

\restrict GAcuGerCP4HknVPy6nplJFS8SsxwV0zTBsXN3LbYzfg5fv1H0piBhp1d9AS0N6d

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-06-24 17:38:47

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
-- TOC entry 219 (class 1259 OID 16457)
-- Name: biblioteca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.biblioteca (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    jogo_id integer NOT NULL,
    data_compra timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.biblioteca OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16464)
-- Name: biblioteca_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.biblioteca_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.biblioteca_id_seq OWNER TO postgres;

--
-- TOC entry 5053 (class 0 OID 0)
-- Dependencies: 220
-- Name: biblioteca_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.biblioteca_id_seq OWNED BY public.biblioteca.id;


--
-- TOC entry 221 (class 1259 OID 16465)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    id integer NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16470)
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categoria_id_seq OWNER TO postgres;

--
-- TOC entry 5054 (class 0 OID 0)
-- Dependencies: 222
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_id_seq OWNED BY public.categoria.id;


--
-- TOC entry 223 (class 1259 OID 16471)
-- Name: jogo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jogo (
    id integer NOT NULL,
    titulo character varying(150) NOT NULL,
    descricao text,
    preco numeric(10,2) NOT NULL,
    categoria_id integer NOT NULL,
    url_imagem character varying(255),
    desenvolvedora character varying(100),
    requisitos_minimos text,
    requisitos_recomendados text
);


ALTER TABLE public.jogo OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16480)
-- Name: jogo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jogo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jogo_id_seq OWNER TO postgres;

--
-- TOC entry 5055 (class 0 OID 0)
-- Dependencies: 224
-- Name: jogo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jogo_id_seq OWNED BY public.jogo.id;


--
-- TOC entry 225 (class 1259 OID 16481)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    senha character varying(100) NOT NULL,
    perfil character varying(20) NOT NULL,
    apelido character varying(50),
    foto_url character varying(255)
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16491)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_seq OWNER TO postgres;

--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 226
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- TOC entry 4871 (class 2604 OID 16492)
-- Name: biblioteca id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biblioteca ALTER COLUMN id SET DEFAULT nextval('public.biblioteca_id_seq'::regclass);


--
-- TOC entry 4873 (class 2604 OID 16493)
-- Name: categoria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria ALTER COLUMN id SET DEFAULT nextval('public.categoria_id_seq'::regclass);


--
-- TOC entry 4874 (class 2604 OID 16494)
-- Name: jogo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogo ALTER COLUMN id SET DEFAULT nextval('public.jogo_id_seq'::regclass);


--
-- TOC entry 4875 (class 2604 OID 16495)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- TOC entry 5040 (class 0 OID 16457)
-- Dependencies: 219
-- Data for Name: biblioteca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.biblioteca (id, usuario_id, jogo_id, data_compra) FROM stdin;
1	2	1	2026-05-28 09:47:40.835179
2	2	3	2026-05-28 09:47:40.957844
3	2	11	2026-05-28 19:57:27.711502
4	3	11	2026-05-28 20:18:02.421261
5	4	14	2026-05-28 20:53:02.048303
6	2	4	2026-06-24 10:55:07.977692
\.


--
-- TOC entry 5042 (class 0 OID 16465)
-- Dependencies: 221
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria (id, nome) FROM stdin;
1	Ação
2	RPG
3	Esportes
4	FPS
5	Terror
6	Fantasia
7	Corrida
8	Luta
10	teste1
\.


--
-- TOC entry 5044 (class 0 OID 16471)
-- Dependencies: 223
-- Data for Name: jogo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jogo (id, titulo, descricao, preco, categoria_id, url_imagem, desenvolvedora, requisitos_minimos, requisitos_recomendados) FROM stdin;
4	baldurs gate 3	Reúna seu grupo e retorne aos Reinos Esquecidos em uma história de companheirismo e traição, sacrifício e sobrevivência, e da tentação pelo poder absoluto.	134.00	2	img/baldurs.png	Larian Studios	Requer um processador e sistema operacional de 64 bits\r\nSO: Windows 10 64-bit\r\nPROCESSADOR: Intel I5 4690 / AMD FX 8350 / Snapdragon X Elite\r\nMEMÓRIA: 8 GB de RAM\r\nPLACA DE VÍDEO: Nvidia GTX 970 / RX 480 / Intel Arc A380 / Qualcomm Adreno X1 (4 GB+ of VRAM)\r\nDIRECTX: Versão 11\r\nARMAZENAMENTO: 150 GB de espaço disponível\r\nOUTRAS OBSERVAÇÕES: SSD required	Requer um processador e sistema operacional de 64 bits\r\nSO: Windows 10 64-bit\r\nPROCESSADOR: Intel i7 8700K / AMD r5 3600\r\nMEMÓRIA: 16 GB de RAM\r\nPLACA DE VÍDEO: Nvidia 2060 Super / RX 5700 XT / Intel Arc A580 (8 GB+ of VRAM)\r\nDIRECTX: Versão 11\r\nARMAZENAMENTO: 150 GB de espaço disponível\r\nOUTRAS OBSERVAÇÕES: SSD required
5	Harry Potter Mistery	Hogwarts Legacy é um fantasia de ação imersivo de mundo aberto. Agora você pode assumir o controle da ação e estar no centro de sua própria aventura no mundo bruxo	78.90	6	img/harry.png	Avalanche Software	Requer um processador e sistema operacional de 64 bits\r\nSO: 64-bit Windows 10\r\nPROCESSADOR: Intel Core i5-6600 (3.3 GHz) or AMD Ryzen 5 1400 (3.2 GHz)\r\nMEMÓRIA: 16 GB de RAM\r\nPLACA DE VÍDEO: NVIDIA GeForce GTX 960 4 GB or AMD Radeon RX 470 4 GB\r\nDIRECTX: Versão 12\r\nARMAZENAMENTO: 85 GB de espaço disponível\r\nOUTRAS OBSERVAÇÕES: SSD (Preferred), HDD (Supported), 720p/30 fps, Low Quality Settings	Requer um processador e sistema operacional de 64 bits\r\nSO: 64-bit Windows 10\r\nPROCESSADOR: Intel Core i7-8700 (3.2 GHz) or AMD Ryzen 5 3600 (3.6 GHz)\r\nMEMÓRIA: 16 GB de RAM\r\nPLACA DE VÍDEO: NVIDIA GeForce 1080 Ti or AMD Radeon RX 5700 XT or INTEL Arc A770\r\nDIRECTX: Versão 12\r\nARMAZENAMENTO: 85 GB de espaço disponível\r\nOUTRAS OBSERVAÇÕES: SSD, 1080p/60 fps, High Quality Settings
1	Helldovares 2	Aliste-se nos Helldivers e junte-se à luta pela liberdade numa galáxia hostil em um jogo de tiro em terceira pessoa rápido, frenético e feroz. Como um soldado de elite da Superterra, a tua missão é espalhar a Paz, a Liberdade e a Democracia Gerenciada usando o maior, mais durão e mais explosivo arsenal do universo. Junte-se a até três amigos e enfrente forças alienígenas implacáveis que ameaçam a segurança do teu planeta natal. Foco total em espalhar a democracia gerenciada. \r\nDEMOCRACIAAAA	199.90	1	img/helldivers2.png	Arrowhead Game Studios	Requer um processador e sistema operacional de 64 bits\r\nSO: Windows 10\r\nPROCESSADOR: Intel Core i7-4790K or AMD Ryzen 5 1500X\r\nMEMÓRIA: 8 GB de RAM\r\nPLACA DE VÍDEO: NVIDIA GeForce GTX 1050 Ti or AMD Radeon RX 470\r\nARMAZENAMENTO: 135 GB de espaço disponível	Requer um processador e sistema operacional de 64 bits\r\nSO: Windows 10\r\nPROCESSADOR: Intel Core i7-9700K or AMD Ryzen 7 3700X\r\nMEMÓRIA: 16 GB de RAM\r\nPLACA DE VÍDEO: NVIDIA GeForce RTX 2060 or AMD Radeon RX 6600XT\r\nARMAZENAMENTO: 40 GB de espaço disponível\r\nOUTRAS OBSERVAÇÕES: SSD Recommended
6	Diablo 4	Diablo® IV é a experiência de RPG de ação suprema, com infinitos seres malignos para massacrar, incontáveis habilidades para dominar, masmorras aterrorizantes e saques lendários.. Embarque na campanha épica sozinho ou com amigos e conheça personagens memoráveis em uma história eletrizante situada em um mundo sombrio ou explore um fim de jogo vasto: encare chefes marcantes com grandes saques, reaja ao ataque do Inferno nas Marés Infernais, domine a Forja para criar suas armas supremas e crie personagens poderosos, com jogo e progressão multiplataforma em todas as plataformas disponíveis.	234.49	2	img/diablo4.png	Blizzard Entertainment, Inc.	Requer um processador e sistema operacional de 64 bits\r\nSO: Windows® 10 de 64 bits versão 1909 ou mais recente\r\nPROCESSADOR: Intel® Core™ i5-2500K ou AMD™ FX-8350\r\nMEMÓRIA: 8 GB de RAM\r\nPLACA DE VÍDEO: NVIDIA® GeForce® GTX 660 ou Intel® Arc™ A380 ou AMD Radeon™ R9 280\r\nDIRECTX: Versão 12\r\nREDE: Conexão de internet banda larga\r\nARMAZENAMENTO: 90 GB de espaço disponível\r\nOUTRAS OBSERVAÇÕES: *Resolução nativa de 1080 pixels/resolução de renderização de 720 pixels, configurações gráficas baixas, 30 FPS, requer SSD	Requer um processador e sistema operacional de 64 bits\r\nSO: Windows® 10 de 64 bits versão 1909 ou mais recente\r\nPROCESSADOR: Intel® Core™ i5-4670K ou AMD Ryzen™ 1300X\r\nMEMÓRIA: 16 GB de RAM\r\nPLACA DE VÍDEO: NVIDIA® GeForce® GTX 970 ou Intel® Arc™ A750 ou AMD Radeon™ RX 470\r\nDIRECTX: Versão 12\r\nREDE: Conexão de internet banda larga\r\nARMAZENAMENTO: 90 GB de espaço disponível\r\nOUTRAS OBSERVAÇÕES: *Resolução de 1080 pixels, configurações gráficas médias, 60 FPS, requer SSD
8	YAPYAP	Um jogo com os temas de mágica, cooperativo e horror, em que você e mais 5 amigos são mini lacaios invocados por um mago para destruir a torre rival e causar o caos. Tente completar seu vandalismo usando todas as suas magias enquanto evita as bestas mágicas e monstros que protegem a torre.	35.99	6	img/yap.png	 Maison Bap	MÍNIMOS:\r\nSO: Windows® 10\r\nPROCESSADOR: Core i5 6600\r\nMEMÓRIA: 8 GB de RAM\r\nPLACA DE VÍDEO: GTX 970\r\nDIRECTX: Versão 10\r\nREDE: Conexão de internet banda larga\r\nARMAZENAMENTO: 2 GB de espaço disponível	MÍNIMOS:\r\nSO: Windows® 10\r\nPROCESSADOR: Core i5 6600\r\nMEMÓRIA: 8 GB de RAM\r\nPLACA DE VÍDEO: GTX 970\r\nDIRECTX: Versão 10\r\nREDE: Conexão de internet banda larga\r\nARMAZENAMENTO: 2 GB de espaço disponível
7	Backrooms: Scape Together	Um co-op de horror visualmente realista para 1-6 jogadores. Atravesse 10 nÃÂ­veis gerados proceduralmente, usando o que houver para sobreviver nos Backrooms.\r\n	32.44	5	img/backroom.png	Triiodide Studios	Requer um processador e sistema operacional de 64 bits\r\nSO: Windows 10 de 64 bits, versão 1909, revisão .1350\r\nPROCESSADOR: Intel Core i5-4430\r\nMEMÓRIA: 4 GB de RAM\r\nPLACA DE VÍDEO: NVIDIA GeForce GTX 960 2 GB\r\nDIRECTX: Versão 11\r\nARMAZENAMENTO: 15 GB de espaço disponível\r\nOUTRAS OBSERVAÇÕES: São necessários os drivers mais recentes para as GPUs AMD e NVIDIA. Para a AMD, você precisa ter os últimos drivers OPCIONAIS.	Requer um processador e sistema operacional de 64 bits\r\nSO: 64-bit Windows 11 (Latest Feature Update)\r\nPROCESSADOR: Intel Core i5-6600K / AMD Ryzen 5 1600\r\nMEMÓRIA: 16 GB de RAM\r\nPLACA DE VÍDEO: NVIDIA GeForce RTX 2070 8 GB / Radeon RX 6600 XT\r\nDIRECTX: Versão 12\r\nREDE: Conexão de internet banda larga\r\nARMAZENAMENTO: 15 GB de espaço disponível
11	Call of Duty®	A experiência Call of Duty® é compatível com Modern Warfare® 4, Black Ops 7, Black Ops 6 e Call of Duty®: Warzone™.\r\n\r\nCall of Duty®: Modern Warfare® 4 traz aos jogadores uma guerra sem limites.\r\n\r\nEm Call of Duty®: Black Ops 7, a Treyarch e a Raven Software trazem aos jogadores o maior Black Ops já feito.\r\n\r\nCall of Duty®: Black Ops 6 é a assinatura Black Ops em uma Campanha cinemática para um jogador, a melhor experiência Multijogador da categoria e o retorno épico do modo Zumbis por Rodada.\r\n\r\nO Call of Duty®: Warzone™ é uma enorme arena de combate gratuita, com Battle Royale, Ressurgência e, agora, a chegada de Black Ops Royale, um novo modo gratuito inspirado em Blecaute e reimaginado para o Warzone™ atual.\r\n\r\nOs Pontos Call of Duty® (PC)* são a moeda do jogo que pode ser usada no Black Ops 7, Black Ops 6, Modern Warfare® III, Modern Warfare® II ou no Call of Duty®: Warzone™ para obter conteúdo novo.\r\n\r\nÉ necessário ter o Call of Duty®: Black Ops 7, Call of Duty®: Black Ops 6, Call of Duty®: Modern Warfare® III, Call of Duty®: Modern Warfare® II or Call of Duty®: Warzone™ para efetuar o resgate. Jogos vendidos / baixados separadamente.	299.00	4	img/cod.png	 Activision	Requer um processador e sistema operacional de 64 bits\r\nSO: Windows® 10 64 Bit (atualização mais recente)\r\nPROCESSADOR: AMD Ryzen™ 5 1400 ou Intel® Core™ i5-6600\r\nMEMÓRIA: 8 GB de RAM\r\nPLACA DE VÍDEO: AMD Radeon™ RX 470, NVIDIA® GeForce® GTX 970 / 1060 ou Intel® Arc™ A580\r\nDIRECTX: Versão 12\r\nREDE: Conexão de internet banda larga\r\nOUTRAS OBSERVAÇÕES: SSD com 161 GB de espaço disponível no lançamento	Requer um processador e sistema operacional de 64 bits\r\nSO: Windows® 11 64 Bit (atualização mais recente)\r\nPROCESSADOR: AMD Ryzen™ 5 1600X ou Intel® Core™ i7-6700K\r\nMEMÓRIA: 12 GB de RAM\r\nPLACA DE VÍDEO: AMD Radeon™ RX 6600XT ou NVIDIA® GeForce® RTX 3060 ou Intel® Arc™ B580\r\nDIRECTX: Versão 12\r\nREDE: Conexão de internet banda larga\r\nOUTRAS OBSERVAÇÕES: SSD com 161 GB de espaço disponível no lançamento
9	Squad Criminal Tatics	Squad é um jogo em primeira pessoa de 50 jogadores contra 50 que tem como objetivo capturar o realismo em combate através da comunicação e equipe. As principais características incluem jogabilidade de armas combinadas com veículos, mapas em larga escala, construção de base e comunicação por voz (VoIP).	188.67	4	img/squad.png	Offworld	Requer um processador e sistema operacional de 64 bits\r\nSO: Windows 10 (x64)\r\nPROCESSADOR: Intel Core i5-8400, AMD Ryzen 3600\r\nMEMÓRIA: 8 GB de RAM\r\nPLACA DE VÍDEO: Nvidia GTX 1060 6 GB, AMD Radeon RX 580 with at least 6 GB of VRAM\r\nDIRECTX: Versão 12\r\nREDE: Conexão de internet banda larga\r\nARMAZENAMENTO: 65 GB de espaço disponível\r\nOUTRAS OBSERVAÇÕES: A teamwork oriented mindset	Requer um processador e sistema operacional de 64 bits\r\nSO: Windows 11\r\nPROCESSADOR: Intel Core i5-12400, AMD Ryzen 5600\r\nMEMÓRIA: 16 GB de RAM\r\nPLACA DE VÍDEO: Nvidia GeForce RTX 3060, AMD Radeon RX 6600 XT\r\nDIRECTX: Versão 12\r\nREDE: Conexão de internet banda larga\r\nARMAZENAMENTO: 65 GB de espaço disponível\r\nOUTRAS OBSERVAÇÕES: A microphone
10	Lost Ark	Embarque numa odisseia pela Arca Perdida num mundo vasto e vibrante: explore novas terras, procure tesouros perdidos e teste-se num combate de ação emocionante. Defina seu estilo de luta com sua classe e classe avançada e personalize suas habilidade, armas e equipamento para fazer seu poder suportar enquanto luta contra hordas de inimigos, chefes colossais e forças do mal que buscam o poder da Arca nesse RPG cheio de ação e grátis para jogar.\r\n	10.43	2	img/lost.png	 Smilegate RPGS	Requer um processador e sistema operacional de 64 bits\r\nSO: Windows 10 (64-bit)\r\nPROCESSADOR: Intel i3 ou AMD Ryzen 3\r\nMEMÓRIA: 16 GB de RAM\r\nPLACA DE VÍDEO: NVIDIA GeForce GTX 460 / AMD HD6850\r\nDIRECTX: Versão 11\r\nREDE: Conexão de internet banda larga\r\nARMAZENAMENTO: 110 GB de espaço disponível\r\nOUTRAS OBSERVAÇÕES: Necessária conexão de internet para jogar, oferece compras no jogo. Os requisitos de sistema para este jogo podem mudar ao longo do tempo.	Requer um processador e sistema operacional de 64 bits\r\nSO: Windows 10 (64-bit)\r\nPROCESSADOR: Intel i5 ou AMD Ryzen 5\r\nMEMÓRIA: 16 GB de RAM\r\nPLACA DE VÍDEO: NVIDIA GeForce GTX 1050 / AMD Radeon RX560 2G\r\nDIRECTX: Versão 11\r\nREDE: Conexão de internet banda larga\r\nARMAZENAMENTO: 110 GB de espaço disponível\r\nOUTRAS OBSERVAÇÕES: Necessária conexão de internet para jogar, oferece compras no jogo. Os requisitos de sistema para este jogo podem mudar ao longo do tempo.
12	Bomba Patch 2026	Bomba Patch é uma série de modificações da série de jogos eletrônicos de futebol Pro Evolution Soccer, criada pelo brasileiro Allan Jefferson. Originou-se em 2007 a partir de um campeonato do sexto título da série, organizado por ele em sua locadora.\r\n	12.00	3	img/bomba.png	Allan Jefferson Games	\r\nPlayStation 2, Xbox 360, PlayStation Portable, PlayStation 3, PlayStation 4. PlayStation Vita, PlayStation 5 e Android	\r\nPlayStation 2, Xbox 360, PlayStation Portable, PlayStation 3, PlayStation 4. PlayStation Vita, PlayStation 5 e Android
13	Super Ground Parkour	Ground Parkour: First Mission é um jogo em que você compete consigo mesmo para alcançar o ponto mais alto da pista usando diferentes personagens e habilidades em um canteiro de obras na cidade. Cada personagem possui habilidades diferentes, e você avança por uma pista cheia de obstáculos. Aproveite!	29.99	3	img/parkur.png	 OxygenStudio	Requer um processador e sistema operacional de 64 bits\r\nSO: Windows 10\r\nProcessador: Intel Core i3\r\nMemória: 2000 MB de RAM\r\nPlaca de vídeo: GT 730\r\nDirectX: Versão 10\r\nRede: Conexão de internet banda larga\r\nArmazenamento: 700 MB de espaço disponível	Requer um processador e sistema operacional de 64 bits\r\nSO: Windows 11\r\nProcessador: AMD Ryzen 3\r\nMemória: 4000 MB de RAM\r\nPlaca de vídeo: GTX 1660\r\nDirectX: Versão 12\r\nArmazenamento: 1 GB de espaço disponível
14	Need for Speedo	Fica em primeiro	89.99	7	img/need.png	Electronic Arts	Requer um sistema operativo e processador de 64 bits\r\nSistema Operativo *: 64-bit Windows 7 or later\r\nProcessador: Intel Core i3-4130 or equivalent with 4 hardware threads\r\nMemória: 6 GB de RAM\r\nPlaca gráfica: NVIDIA GeForce GTX 750 Ti 2GB, AMD Radeon HD 7850 2GB, or equivalent DX11 compatible GPU with 2GB of memory\r\nDirectX: Versão 11\r\nEspaço no disco: Requer 30 GB de espaço livre	Requer um sistema operativo e processador de 64 bits\r\nSistema Operativo *: 64-bit Windows 7 or later\r\nProcessador: Intel Core i5-4690 or equivalent with 4 hardware threads\r\nMemória: 8 GB de RAM\r\nPlaca gráfica: NVIDIA GeForce GTX 970 4GB, AMD Radeon R9 290 4GB, or equivalent DX11 compatible GPU with 4GB of memory\r\nDirectX: Versão 11\r\nEspaço no disco: Requer 30 GB de espaço livre
3	Outlaest	O inferno é um experimento ao qual você não consegue sobreviver em Outlast, um jogo de terror de sobrevivência em primeira pessoa desenvolvido por veteranos de algumas das maiores franquias de jogos da história. Como o jornalista investigativo Miles Upshur, explore o Asilo Mount Massive e tente sobreviver tempo suficiente para descobrir seu terrível segredo... se tiver coragem.	100.98	5	img/outlast.png	Red Barrels	Requer um processador e sistema operacional de 64 bits\r\nSO: Windows 10\r\nPROCESSADOR: Intel Core i7-3770 or AMD Ryzen 5 1400\r\nMEMÓRIA: 8 GB de RAM\r\nPLACA DE VÍDEO: NVIDIA GeForce GTX 650 Ti, 2 GB or Radeon R7 360, 2 GB or Intel Arc A310, 4 GB\r\nDIRECTX: Versão 11\r\nREDE: Conexão de internet banda larga\r\nARMAZENAMENTO: 40 GB de espaço disponível\r\nOUTRAS OBSERVAÇÕES: Low 720p @ 30 FPS, DX11, Ray Tracing OFF	Requer um processador e sistema operacional de 64 bits\r\nSO: Windows 10\r\nPROCESSADOR: Intel Core i7-6700K or AMD Ryzen 5 2600X\r\nMEMÓRIA: 16 GB de RAM\r\nPLACA DE VÍDEO: NVIDIA GeForce GTX 1660, 6 GB or AMD Radeon RX Vega 56, 8 GB or Intel Arc A580, 8 GB\r\nDIRECTX: Versão 12\r\nREDE: Conexão de internet banda larga\r\nARMAZENAMENTO: 40 GB de espaço disponível\r\nOUTRAS OBSERVAÇÕES: High 1080p @ 60 FPS, DX12, Ray Tracing OFF
\.


--
-- TOC entry 5046 (class 0 OID 16481)
-- Dependencies: 225
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id, nome, email, senha, perfil, apelido, foto_url) FROM stdin;
3	Alencar Machado	ale.machado@ufsm.com	12345	cliente	machadogames	img/avatar3.png
4	eduarda maieski	duda.teste@ufsm.com	du1234	cliente	dudinha20	img/avatar2.png
2	Pedro Monti	pedro.teste@gmail.com	1234	cliente	pbmonti	img/avatar3.png
5	teste	teste@gmail.com	1234	cliente	testtetetete	img/avatar3.png
1	Admin Master	admin@jpgames.com	1234	admin	Admin Master	img/avatar1.png
\.


--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 220
-- Name: biblioteca_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.biblioteca_id_seq', 6, true);


--
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 222
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_id_seq', 10, true);


--
-- TOC entry 5059 (class 0 OID 0)
-- Dependencies: 224
-- Name: jogo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jogo_id_seq', 15, true);


--
-- TOC entry 5060 (class 0 OID 0)
-- Dependencies: 226
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_seq', 5, true);


--
-- TOC entry 4877 (class 2606 OID 16497)
-- Name: biblioteca biblioteca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biblioteca
    ADD CONSTRAINT biblioteca_pkey PRIMARY KEY (id);


--
-- TOC entry 4881 (class 2606 OID 16499)
-- Name: categoria categoria_nome_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_nome_key UNIQUE (nome);


--
-- TOC entry 4883 (class 2606 OID 16501)
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- TOC entry 4885 (class 2606 OID 16503)
-- Name: jogo jogo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogo
    ADD CONSTRAINT jogo_pkey PRIMARY KEY (id);


--
-- TOC entry 4879 (class 2606 OID 16505)
-- Name: biblioteca uk_usuario_jogo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biblioteca
    ADD CONSTRAINT uk_usuario_jogo UNIQUE (usuario_id, jogo_id);


--
-- TOC entry 4887 (class 2606 OID 16507)
-- Name: usuario usuario_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_email_key UNIQUE (email);


--
-- TOC entry 4889 (class 2606 OID 16509)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 4890 (class 2606 OID 16510)
-- Name: biblioteca fk_biblioteca_jogo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biblioteca
    ADD CONSTRAINT fk_biblioteca_jogo FOREIGN KEY (jogo_id) REFERENCES public.jogo(id);


--
-- TOC entry 4891 (class 2606 OID 16515)
-- Name: biblioteca fk_biblioteca_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biblioteca
    ADD CONSTRAINT fk_biblioteca_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- TOC entry 4892 (class 2606 OID 16520)
-- Name: jogo fk_categoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogo
    ADD CONSTRAINT fk_categoria FOREIGN KEY (categoria_id) REFERENCES public.categoria(id) ON DELETE RESTRICT;


-- Completed on 2026-06-24 17:38:47

--
-- PostgreSQL database dump complete
--

\unrestrict GAcuGerCP4HknVPy6nplJFS8SsxwV0zTBsXN3LbYzfg5fv1H0piBhp1d9AS0N6d

