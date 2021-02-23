prompt *************************************************************
prompt ******************** DROP TABLE *****************************
prompt *************************************************************

DROP TABLE NOM_OEUVRE CASCADE CONSTRAINTS;
DROP TABLE OEUVRE CASCADE CONSTRAINTS;
DROP TABLE VISIONNAGE CASCADE CONSTRAINTS;
DROP TABLE COMPTE CASCADE CONSTRAINTS;
DROP TABLE SOUS_COMPTE CASCADE CONSTRAINTS;

prompt *************************************************************
prompt ******************** CREATE TABLE ***************************
prompt *************************************************************


CREATE TABLE OEUVRE (
    id_oeuvre NUMBER,
    num_saison NUMBER,
    num_episode NUMBER,
    nom_episode VARCHAR(50),
    duree NUMBER,
    date_sortie NUMBER,
    distribution VARCHAR(50),
    categorie_age NUMBER,
    descriptif VARCHAR(50),
    genres VARCHAR(50),
    adjectif VARCHAR(50),
    CONSTRAINT pk_oeuvre PRIMARY KEY(id_oeuvre,num_saison,num_episode)
);

CREATE TABLE NOM_OEUVRE (
    id_oeuvre NUMBER,
    nom_oeuvre VARCHAR(50),
    CONSTRAINT pk_nom_oeuvre PRIMARY KEY (id_oeuvre),
    CONSTRAINT fk_nom_oeuvre FOREIGN KEY(id_oeuvre) REFERENCES OEUVRE(id_oeuvre)
);

CREATE TABLE COMPTE (
    mail VARCHAR(50),
    abonnement VARCHAR(50),
    telephone NUMBER,
    mdp VARCHAR(50),
    CONSTRAINT pk_compte PRIMARY KEY(mail)
);

CREATE TABLE VISIONNAGE (
    mail VARCHAR(50),
    id_sousCompte NUMBER,
    id_oeuvre NUMBER,
    num_saison NUMBER,
    num_episode NUMBER,
    temps_visionnage NUMBER,
    CONSTRAINT pk_visionnage PRIMARY KEY(mail,id_sousCompte,id_oeuvre,num_saison,num_episode),
    CONSTRAINT fk_visionnage_Oeuvre FOREIGN KEY (id_oeuvre, num_saison, num_episode) REFERENCES OEUVRE(id_oeuvre, num_saison, num_episode),
    CONSTRAINT fk_visionnage_compte FOREIGN KEY (mail) REFERENCES COMPTE(mail),
    CONSTRAINT fk_visionnage_sousCompte FOREIGN KEY (id_sousCompte) REFERENCES SOUS_COMPTE(id_sousCompte)
);

CREATE TABLE SOUS_COMPTE (
    mail VARCHAR(50),
    id_sousCompte NUMBER,
    profil VARCHAR(50),
    liste VARCHAR(50),
    like_oeuvre VARCHAR(50),
    CONSTRAINT pk_sous_compte PRIMARY KEY(id_sousCompte,mail),
    CONSTRAINT fk_sous_compte FOREIGN KEY (mail) REFERENCES COMPTE (mail)
);

CREATE TABLE CLES
(
    mail          VARCHAR(50),
    id_SousCompte NUMBER,
    id_Oeuvre     NUMBER,
    num_Saison    NUMBER,
    num_Episode   NUMBER,
    CONSTRAINT pk_cles PRIMARY KEY (mail, id_SousCompte, id_Oeuvre, num_Saison, num_Episode),
    CONSTRAINT fk_cles_Oeuvre FOREIGN KEY (id_Oeuvre, num_Saison, num_Episode) REFERENCES OEUVRE(id_oeuvre, num_saison, num_episode),
    CONSTRAINT fk_cles_Compte FOREIGN KEY (mail) REFERENCES COMPTE(mail),
    CONSTRAINT fk_cles_sousCompte FOREIGN KEY (id_SousCompte) REFERENCES SOUS_COMPTE(id_SousCompte)
) ;

