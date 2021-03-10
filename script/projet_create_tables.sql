prompt *************************************************************
prompt ******************** DROP TABLE *****************************
prompt *************************************************************

DROP TABLE NOM_OEUVRE CASCADE CONSTRAINTS;
DROP TABLE OEUVRE CASCADE CONSTRAINTS;
DROP TABLE VISIONNAGE CASCADE CONSTRAINTS;
DROP TABLE COMPTE CASCADE CONSTRAINTS;
DROP TABLE SOUS_COMPTE CASCADE CONSTRAINTS;
DROP TABLE CLES CASCADE CONSTRAINTS;

prompt *************************************************************
prompt ******************** CREATE TABLE ***************************
prompt *************************************************************

CREATE TABLE NOM_OEUVRE (
    id_oeuvre NUMBER,
    nom_oeuvre VARCHAR(50),
    CONSTRAINT pk_nom_oeuvre PRIMARY KEY (id_oeuvre)
);

CREATE TABLE OEUVRE (
    id_oeuvre NUMBER,
    num_saison NUMBER,
    num_episode NUMBER,
    nom_episode VARCHAR(50),
    duree NUMBER,
    date_sortie NUMBER,
    distribution VARCHAR(300),
    categorie_age NUMBER,
    descriptif VARCHAR(300),
    genres VARCHAR(300),
    adjectif VARCHAR(100),
    CONSTRAINT pk_oeuvre PRIMARY KEY(id_oeuvre,num_saison,num_episode),
    CONSTRAINT fk_oeuvre FOREIGN KEY(id_oeuvre) REFERENCES NOM_OEUVRE(id_oeuvre),
    CONSTRAINT duree_oeuvre_check CHECK (duree > 0),
    CONSTRAINT Categorie_age_oeuvre_check CHECK ((categorie_age = 0) or (categorie_age = 13) or (categorie_age = 16) or (categorie_age = 18))
);
--Categorie age = 0 représente tous publics

CREATE TABLE COMPTE (
    mail VARCHAR(50),
    abonnement VARCHAR(50),
    telephone NUMBER,
    mdp VARCHAR(50),
    CONSTRAINT pk_compte PRIMARY KEY(mail)
);

CREATE TABLE SOUS_COMPTE (
    mail VARCHAR(50),
    id_sousCompte NUMBER,
    profil VARCHAR(50),
    CONSTRAINT pk_sous_compte PRIMARY KEY(id_sousCompte,mail),
    CONSTRAINT fk_sous_compte FOREIGN KEY (mail) REFERENCES COMPTE (mail)
);

CREATE TABLE VISIONNAGE (
    mail VARCHAR(50),
    id_sousCompte NUMBER,
    id_oeuvre NUMBER,
    num_saison NUMBER,
    num_episode NUMBER,
    temps_visionnage NUMBER,
    liste NUMBER(1) NOT NULL CHECK (liste in (0,1)),
    like_oeuvre VARCHAR(50),
    CONSTRAINT pk_visionnage PRIMARY KEY(mail,id_sousCompte,id_oeuvre,num_saison,num_episode),
    CONSTRAINT fk_visionnage_Oeuvre FOREIGN KEY (id_oeuvre, num_saison, num_episode) REFERENCES OEUVRE(id_oeuvre, num_saison, num_episode),
    CONSTRAINT fk_visionnage_sousCompte FOREIGN KEY (mail, id_sousCompte) REFERENCES SOUS_COMPTE(mail, id_sousCompte)
);

CREATE TABLE CLES
(
    mail          VARCHAR(50),
    id_SousCompte NUMBER,
    id_oeuvre     NUMBER,
    num_Saison    NUMBER,
    num_Episode   NUMBER,
    CONSTRAINT pk_cles PRIMARY KEY (mail, id_SousCompte, id_oeuvre, num_Saison, num_Episode),
    CONSTRAINT fk_cles_Oeuvre FOREIGN KEY (id_oeuvre, num_Saison, num_Episode) REFERENCES OEUVRE(id_oeuvre, num_saison, num_episode),
    CONSTRAINT fk_cles_sousCompte FOREIGN KEY (mail, id_SousCompte) REFERENCES SOUS_COMPTE(mail, id_SousCompte)
) ;

