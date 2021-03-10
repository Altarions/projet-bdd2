spool insert_tables_Projet.log

prompt *************************************************************
prompt ******************** DELETE TABLE *****************************
prompt *************************************************************

DELETE FROM CLES;
DELETE FROM VISIONNAGE;
DELETE FROM SOUS_COMPTE;
DELETE FROM COMPTE;
DELETE FROM OEUVRE;
DELETE FROM NOM_OEUVRE;
DROP SEQUENCE num;

prompt *************************************************************
prompt ******************** INSERT TUPLES **************************
prompt *************************************************************


CREATE SEQUENCE num START WITH 1 INCREMENT BY 1 ;
INSERT INTO NOM_OEUVRE VALUES(num.nextval,'Lupin');
INSERT INTO OEUVRE VALUES(num.currval,1,1,'Chapitre 1',47,2021,'omar sy, ludivine sagnier, chlotilde hesme...',13,'Hanté par l injustice qui a frappé sa famille, Assane veut régler ses comptes en volant un collier de diamants. Mais rien ne se passe comme prévu.','français,séries inspirées de livres, séries d intrigues..','palpitant');
INSERT INTO OEUVRE VALUES(num.currval,1,2,'Chapitre 2',52,2021,'omar sy, ludivine sagnier, chlotilde hesme...',13,'Assane élabore un scénario pour entrer en contact avec un détenu qui peut le renseigner sur la mort de Babakar. Anne Pellegrini avoue un lourd secret.','français,séries inspirées de livres, séries d intrigues..','palpitant');

INSERT INTO NOM_OEUVRE VALUES(num.nextval,'Le jeu de la dame');
INSERT INTO OEUVRE VALUES(num.currval,1,2,' Echanges',35,2020,'anya taylor-joy, ..',16,'D abord déroutée par sa nouvelle vie en banlieue, la jeune Beth étudie ses camarades de lycée tout en élaborant un plan pour participer à un tournoi d échecs.','séries inspirées de livres, séries us','psychologique, intime, émotion');

INSERT INTO NOM_OEUVRE VALUES(num.nextval,'Stranger Things');
INSERT INTO OEUVRE VALUES(num.currval,1,2,'Le barjot de Marble Street',55,2019,'Winona Ryder, David Harbour, Finn Wolfhard',16,'Lucas, Mike et Dustin tentent de communiquer avec la fille qu ils ont découverte dans les bois. Hopper interroge Joyce à propos d un étrange appel téléphonique','Series SF, Séries pour ados, Thrillers TV','Effrayant, palpitant');
INSERT INTO OEUVRE VALUES(num.currval,1,1,'La disparition de Will Byers',48,2019,'Winona Ryder, David Harbour, Finn Wolfhard',16,'Tandis qu il rentre chez lui, le jeune Will est témoin d une scène terrifiante. Non loin de là, un sinistre secret hante les sous-sols d un laboratoire du gouvernement.','Series SF, Séries pour ados, Thrillers TV','Effrayant, palpitant');

INSERT INTO NOM_OEUVRE VALUES(num.nextval,'Black Mirror');
INSERT INTO OEUVRE VALUES(num.currval,1,1,'LHymne national',40,2011,'Bryce Dallas Howard, Daniel Kaluuya, Cristin Milioti...',16,'Le Premier Ministre Michael Callow fait face à un terrible dilemme après le kidnapping de la bien-aimée Princesse Susannah.','SF, Horreur, Drame','Sombre, palpitant');

INSERT INTO NOM_OEUVRE VALUES(num.nextval,'Vikings');
INSERT INTO OEUVRE VALUES(num.currval,3,3,'le destin du guerrier',45,2018,'Travis Fimmel , Katheryn Winnick ...',16,'Le roi Ecbert rend visite aux Vikings du Wessex, dont les forces se lancent dans une lutte avec la Mercie. Le charme de Harbard ne trompe pas Siggy.','Séries politiques , Films d époques , US , Action ...','Violent , Palpitant');

INSERT INTO NOM_OEUVRE VALUES(num.nextval,'Alice in Borderland');
INSERT INTO OEUVRE VALUES(num.currval,1,3,'Episode 3',42,2020,'Kento Yamazaki, Tao Tsuchiya ...',16,'Les visas de Chota et de Shibuki expirant bientôt, le quatuor pénètre dans un vaste jardin botanique à Shinjuku, où il participe à un jeu de trahison','Science Fictions , Séries inspirées de mangas,Action ...','sombre , suspense');

INSERT INTO NOM_OEUVRE VALUES(num.nextval,'Inception');
INSERT INTO OEUVRE VALUES(num.currval,-1,-1,-1, 125,2010,'leonardo dicaprio, ..' ,13,'Un voleur spécialisé dans l extraction des secrets enfouis dans les rêves accepte une dernière mission dangereuse : semer une idée dans le subconscient d un homme.', 'action, action et fantastique, cyberpunk ..','halluciant, suspence, palpitant');
INSERT INTO NOM_OEUVRE VALUES(num.nextval,'Matrix');
INSERT INTO OEUVRE VALUES(num.currval,-1,-1,-1,136,1999,'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss',16,'Un hacker informatique découvre qu il vit dans un monde virtuel créé par des machines et rejoint un groupe de rebelles pour s en libérer.','Action, SF, fantatisque','Sombre, palpitant');

INSERT INTO NOM_OEUVRE VALUES(num.nextval,'Chucky la poupée de sang');
INSERT INTO OEUVRE VALUES(num.currval,-1,-1,-1,83,1990,'Alex Vincent , Jenny Agutter , Brad Dourif ...',18,'Un fabricant de jouets ressuscite sans le vouloir la pire poupée tueuse de tous les temps, Chucky, qui reprend immédiatement ses activités mortifères.','Horreur , Films d horreur gore , Horreur et surnaturel','Suspense');



INSERT INTO COMPTE VALUES('cyprien@wanado.fr','Premium',33710891389,'**');
INSERT INTO COMPTE VALUES('hugzer@xyz.net','Standard',33746567890,'**');
INSERT INTO COMPTE VALUES('jm@gmail.com','Essentiel',33710290987,'**');
INSERT INTO COMPTE VALUES('weshlesbg@gmail.com','Premium',33780366982,'****');
INSERT INTO COMPTE VALUES('isma@gmail.com','Standard',33712894753,'******');

INSERT INTO SOUS_COMPTE VALUES('cyprien@wanado.fr',1,'cyprien');
INSERT INTO SOUS_COMPTE VALUES('hugzer@xyz.net',1,'hugo');
INSERT INTO SOUS_COMPTE VALUES('jm@gmail.com',1,'jean-mael');
INSERT INTO SOUS_COMPTE VALUES('weshlesbg@gmail.com',1,'romain');
INSERT INTO SOUS_COMPTE VALUES('weshlesbg@gmail.com',2,'bastien');
INSERT INTO SOUS_COMPTE VALUES('weshlesbg@gmail.com',3,'hugo');
INSERT INTO SOUS_COMPTE VALUES('isma@gmail.com',1,'Ismael');

INSERT INTO VISIONNAGE VALUES('cyprien@wanado.fr',1,1,1,1,44,1,'oui');
INSERT INTO VISIONNAGE VALUES('hugzer@xyz.net',1,1,1,2,32,0,'rien');
INSERT INTO VISIONNAGE VALUES('cyprien@wanado.fr',1,2,1,2,10,0,'oui');
INSERT INTO VISIONNAGE VALUES('jm@gmail.com',1,7,-1,-1,120,0,'non');
INSERT INTO VISIONNAGE VALUES('weshlesbg@gmail.com',1,3,1,1,46,1,'oui');
INSERT INTO VISIONNAGE VALUES('weshlesbg@gmail.com',2,3,1,2,34,1,'oui');
INSERT INTO VISIONNAGE VALUES('weshlesbg@gmail.com',3,3,1,2,46,1,'oui');
INSERT INTO VISIONNAGE VALUES('hugzer@xyz.net',1,4,1,1,5,1,'oui');
INSERT INTO VISIONNAGE VALUES('hugzer@xyz.net',1,8,-1,-1,14,0,'oui');
INSERT INTO VISIONNAGE VALUES('isma@gmail.com',1,9,-1,-1,0,0,'non');
INSERT INTO VISIONNAGE VALUES('isma@gmail.com',1,5,3,3,40,0,'oui');
INSERT INTO VISIONNAGE VALUES('isma@gmail.com',1,6,1,3,15,1,'oui');

INSERT INTO CLES VALUES('cyprien@wanado.fr',1,1,1,1);
INSERT INTO CLES VALUES('cyprien@wanado.fr',1,2,1,2);
INSERT INTO CLES VALUES('jm@gmail.com',1,7,-1,-1);
INSERT INTO CLES VALUES('hugzer@xyz.net',1,1,1,2);
INSERT INTO CLES VALUES('hugzer@xyz.net',1,4,1,1);
INSERT INTO CLES VALUES('hugzer@xyz.net',1,8,-1,-1);
INSERT INTO CLES VALUES('weshlesbg@gmail.com',1,3,1,1);
INSERT INTO CLES VALUES('weshlesbg@gmail.com',2,3,1,2);
INSERT INTO CLES VALUES('weshlesbg@gmail.com',3,3,1,2);
INSERT INTO CLES VALUES('isma@gmail.com',1,9,-1,-1);
INSERT INTO CLES VALUES('isma@gmail.com',1,5,3,3);
INSERT INTO CLES VALUES('isma@gmail.com',1,6,1,3);

spool off