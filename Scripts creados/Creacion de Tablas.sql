CREATE TABLE IF NOT EXISTS movie(
	idMovie varchar(16) NOT NULL,
    index_ int(5000) NOT NULL,
    budget int(5000),
    homepage varchar(200),
    keywords varchar(300),
    original_title varchar(100) NOT NULL,
    overview varchar(500) DEFAULT NULL,
    popularity decimal(25,6) NOT NULL,
    release_date date NOT NULL,
    revenue int(10) NOT NULL,
    runtime decimal(4,1) NOT NULL,
    status_ varchar(8) NOT NULL,
    tagline varchar(200) DEFAULT NULL,
    titlemovie varchar(100) NOT NULL,
    vote_average decimal(2,1) NOT NULL,
    votecount int(10) NOT NULL,
    PRIMARY KEY (idMovie)
);

CREATE TABLE IF NOT EXISTS gender(
	idgenre Varchar(20) NOT NULL,
    genrename Varchar(10) NOT NULL,
    PRIMARY KEY (idgenre)
);

CREATE TABLE IF NOT EXISTS originallanguage(
	id_originallanguage Varchar(20) NOT NULL,
    origlanguagename Varchar(5) NOT NULL,
    PRIMARY KEY (id_originallanguage)
);

CREATE TABLE IF NOT EXISTS productioncompany(
	id_productioncompany Varchar(20) NOT NULL,
    prodcompanyname Varchar(10) NOT NULL,
    PRIMARY KEY (id_originallanguage)
);

CREATE TABLE IF NOT EXISTS productioncountry(
	id_productioncountry Varchar(20) NOT NULL,
    ISO_3466_1 Varchar(0) NOT NULL,
    prodcountryname Varchar(50) NOT NULL,
    PRIMARY KEY (id_productioncountry)
);

CREATE TABLE IF NOT EXISTS spokenlanguage(
	id_spokenlanguage Varchar(20) NOT NULL,
    ISO_639_1 Varchar(0) NOT NULL,
    spokenlangname Varchar(50) NOT NULL,
    PRIMARY KEY (id_spokenlanguage)
);

CREATE TABLE IF NOT EXISTS statusn(
	idstatus Varchar(20) NOT NULL,
    statusname Varchar(0) NOT NULL,
    PRIMARY KEY (idstatus)
);

CREATE TABLE IF NOT EXISTS castn(
	idcast Varchar(20) NOT NULL,
    castname Varchar(50) NOT NULL,
    PRIMARY KEY (idcast)
);

CREATE TABLE IF NOT EXISTS crew(
	idcrew Varchar(20) NOT NULL,
    gendercrew INT NOT NULL,
    credit_idCrew Varchar(30) NOT NULL,
    crewname Varchar(100) NOT NULL,
    PRIMARY KEY (idcrew)
);

CREATE TABLE IF NOT EXISTS departmentcrew(
	iddepartment Varchar(20) NOT NULL,
    departcrewName Varchar(15) NOT NULL,
    PRIMARY KEY (iddepartment)
);

CREATE TABLE IF NOT EXISTS jobcrew(
	idjob Varchar(20) NOT NULL,
    jobcrewname Varchar(30) NOT NULL,
    PRIMARY KEY (iddepartment)
);

CREATE TABLE IF NOT EXISTS director(
	iddirector Varchar(20) NOT NULL,
    directorname Varchar(30) NOT NULL,
    PRIMARY KEY (iddirector)
);






