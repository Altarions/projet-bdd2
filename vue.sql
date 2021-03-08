CREATE VIEW AfficheEssentiel 
AS
Select COUNT (abonnement)
From Compte 
Where abonnement='Essentiel' ;

CREATE VIEW AfficheStandard 
AS
Select COUNT (abonnement)
From Compte 
Where abonnement='Standard' ;

CREATE VIEW AffichePremium
AS
Select COUNT (abonnement)
From Compte 
Where abonnement='Premium' ;

CREATE VIEW AfficheTotal
AS
Select COUNT (*)
From Compte 
;