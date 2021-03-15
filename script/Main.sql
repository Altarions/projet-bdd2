--Benbrik--kerhamon Ismaël, Dupont Romain, Leguillier hugo, Garnier Cyprien
--684J

--Fichier main qui lance tous les fichiers de création de :
--Creation de tables
--Insertions dans les tables
--Triggers de notre table
--Vues de notre table
--Index de notre table
--Différentes fonctions de notre table



--Appel du script de création de la table
@projet_create_tables.sql


--Appel des scripts de création des triggers
@Trigger_UniciteVisionnage.sql
@Trigger_VerifTempsVisionnage.sql
@Trigger_VerifAbonnement.sql

--Appel du script d'insertion de la table
@projet_insert_tables.sql


--Appel du script de création de l'index
@Index.sql

--Appel du script de création des vues
@vue.sql

--Appel des scripts de création des procédures
@Procedure_PourcentageCategorieCompte.sql
@Procedure_TempsVisionnage.sql


------------------------------------TESTS------------------------------------

--Tests des Vues :
SELECT * FROM NOMBREVUEOEUVRE;
--Ici, on ne test pas les autres vues car elles sont déjà utilisés pour une procédure

--Tests des Procedure/fonction :
EXECUTE CALCULMOYENNE;

--Cas fonctionnel :
EXECUTE TempsVisionnagePourCompte('isma@gmail.com');
EXECUTE TempsVisionnagePourCompte('weshlesbg@gmail.com');

--Cas d'erreur :
EXECUTE TempsVisionnagePourCompte('jenevaispasmarcher@gmail.com');
EXECUTE TempsVisionnagePourCompte(12);

--Tests des contraintes check:
--Cas fonctionnel :
INSERT INTO OEUVRE VALUES(1,1,3,'Chapitre 3',45,2021,'omar sy, ludivine sagnier, chlotilde hesme...',13,'Hanté par l injustice qui a frappé sa famille, Assane veut régler ses comptes en volant un collier de diamants. Mais rien ne se passe comme prévu.','français,séries inspirées de livres, séries d intrigues..','palpitant');

--Cas d'erreur :
--Ajout d'une durée d'épisode = -4
INSERT INTO OEUVRE VALUES(1,1,4,'Chapitre 4',-4,2021,'omar sy, ludivine sagnier, chlotilde hesme...',13,'Hanté par l injustice qui a frappé sa famille, Assane veut régler ses comptes en volant un collier de diamants. Mais rien ne se passe comme prévu.','français,séries inspirées de livres, séries d intrigues..','palpitant');
--Ajout d'une restriction d'age = 3an
INSERT INTO OEUVRE VALUES(1,1,4,'Chapitre 4',-4,2021,'omar sy, ludivine sagnier, chlotilde hesme...',3,'Hanté par l injustice qui a frappé sa famille, Assane veut régler ses comptes en volant un collier de diamants. Mais rien ne se passe comme prévu.','français,séries inspirées de livres, séries d intrigues..','palpitant');


--Tests des Triggers :
--Trigger unicité de visionnage:
--isma@gmail.com regarde la saison 3 ep 3 de vikings et s'arrète à 13 min
INSERT INTO VISIONNAGE VALUES('isma@gmail.com',1,5,3,3,13,0,'oui');
--isma@gmail.com regarde la saison 3 ep 3 de vikings et s'arrète à 44 min
INSERT INTO VISIONNAGE VALUES('isma@gmail.com',1,5,3,3,44,0,'oui');
--isma@gmail.com regarde la saison 3 ep 3 de vikings et s'arrète à 42 min
INSERT INTO VISIONNAGE VALUES('isma@gmail.com',1,5,3,3,42,0,'oui');
SELECT nom_oeuvre, NUM_SAISON, NUM_EPISODE, TEMPS_VISIONNAGE FROM VISIONNAGE NATURAL JOIN NOM_OEUVRE WHERE MAIL = 'isma@gmail.com' AND ID_OEUVRE = 5;
--A la fin, le seul tuple entre isma@gmail.com et la saison 3 ep 3 de vikings devrait être le dernier


--Trigger verif temps visionnage:
--Cas fonctionnel :
--Insertion standard, on ajoute un tuple avec un temps de visionnage > 0 et < temps de l'oeuvre
INSERT INTO VISIONNAGE VALUES('isma@gmail.com',1,5,3,3,40,0,'oui');

--Cas d'erreur :
--Insertion de temps de visionnage incorrects
INSERT INTO VISIONNAGE VALUES('isma@gmail.com',1,5,3,3,150,0,'oui');
INSERT INTO VISIONNAGE VALUES('isma@gmail.com',1,5,3,3,-12,0,'oui');

--Trigger verif abonnement:
--Cas fonctionnel :
--ajout d'un 2 eme sous compte a un compte standard = possible
INSERT INTO SOUS_COMPTE VALUES('hugzer@xyz.net',2,'John DEUF');
INSERT INTO SOUS_COMPTE VALUES('weshlesbg@gmail.com',4,'Gérard Menvussat');

--Cas d'erreur :
--Essentiel
--ajout d'un 2 eme sous compte avec un abonnement essentiel = Impossible
INSERT INTO SOUS_COMPTE VALUES('jm@gmail.com',2,'Anna Tomie');
--Standard
--ajout d'un 3 eme sous compte avec un abonnement standard = Impossible
INSERT INTO SOUS_COMPTE VALUES('hugzer@xyz.net',3,'Ray Ponse');
--Premium
--ajout d'un 5 eme sous compte avec un abonnement premium = Impossible
INSERT INTO SOUS_COMPTE VALUES('weshlesbg@gmail.com',5,'Alonzo Balmaské');
--ajout d'un sous compte négatif avec un abonnement = Impossible
INSERT INTO SOUS_COMPTE VALUES('weshlesbg@gmail.com',-1,'Alonzo Balmaské');

--Procedure AjoutOeuvre
--Oeuvre deja existante
EXECUTE procedure_ajoutOeuvre('Lupin',1,4,'Chapitre 4',55,2021,'omar sy, ludivine sagnier, chlotilde hesme...',13,'Assane élabore un scénario pour entrer en contact avec un détenu qui peut le renseigner sur la mort de Babakar. Anne Pellegrini avoue un lourd secret.','français,séries inspirées de livres, séries d intrigues..','palpitant');
EXECUTE procedure_ajoutOeuvre('Lupin',1,5,'Chapitre 5',60,2021,'omar sy, ludivine sagnier, chlotilde hesme...',13,'Assane élabore un scénario pour entrer en contact avec un détenu qui peut le renseigner sur la mort de Babakar. Anne Pellegrini avoue un lourd secret.','français,séries inspirées de livres, séries d intrigues..','palpitant');

--nouvelles oeuvre
EXECUTE procedure_ajoutOeuvre('La casa de papel',1,1,'Episode 1',48,2020,'ursula Corbero, alvaro Morte, itziar Ituno...',16,'Huit voleurs font une prise dotages dans la maison royale de la monnaie despagne...','Espagnol, Thrillers TV','palpitant, suspense');
EXECUTE procedure_ajoutOeuvre('La casa de papel',1,2,'Episode 2',58,2020,'ursula Corbero, alvaro Morte, itziar Ituno...',16,'Huit voleurs font une prise dotages dans la maison royale de la monnaie despagne...','Espagnol, Thrillers TV','palpitant, suspense');
