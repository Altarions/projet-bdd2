CREATE OR REPLACE VIEW AfficheEssentiel
AS
Select abonnement, COUNT(*) as NombreCompteEssentiel
From Compte
Where abonnement = 'Essentiel'
GROUP BY abonnement;

CREATE OR REPLACE VIEW AfficheStandard
AS
Select abonnement, COUNT(*) as NombreCompteStandard
From Compte
Where abonnement = 'Standard'
GROUP BY abonnement;

CREATE OR REPLACE VIEW AffichePremium
AS
Select abonnement, COUNT(*) as NombreComptePremium
From Compte
Where abonnement = 'Premium'
GROUP BY abonnement;

CREATE OR REPLACE VIEW AfficheTotal
AS
Select COUNT(*) as NombreCompte
From Compte;

CREATE OR REPLACE VIEW NombreVueOeuvre
AS
Select id_oeuvre, COUNT(id_sousCompte) as nombrevues
From VISIONNAGE
GROUP BY id_oeuvre
ORDER BY id_oeuvre ASC;