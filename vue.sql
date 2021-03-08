CREATE VIEW AfficheEssentiel
AS
Select abonnement, COUNT(*) as NombreCompteEssentiel
From Compte
Where abonnement = 'Essentiel'
GROUP BY abonnement;

CREATE VIEW AfficheStandard
AS
Select abonnement, COUNT(*) as NombreCompteStandard
From Compte
Where abonnement = 'Standard'
GROUP BY abonnement;

CREATE VIEW AffichePremium
AS
Select abonnement, COUNT(*) as NombreComptePremium
From Compte
Where abonnement = 'Premium'
GROUP BY abonnement;

CREATE VIEW AfficheTotal
AS
Select COUNT(*) as NombreCompte
From Compte
GROUP BY abonnement;