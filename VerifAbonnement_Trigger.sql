Create or replace TRIGGER verifAbonnement_Trigger
    BEFORE INSERT ON SOUS_COMPTE
    FOR EACH ROW
DECLARE
    abonnementActuel Varchar2(50);
    newMail VARCHAR(50);
    newSousCompte NUMBER;
BEGIN
    newMail := :new.mail;
    newSousCompte := :new.id_souscompte;

    SELECT ABONNEMENT into abonnementActuel
    FROM SOUS_COMPTE NATURAL JOIN COMPTE
    WHERE MAIL = newMail
    GROUP BY ABONNEMENT;

    if ((abonnementActuel = 'Essentiel') AND newSousCompte > 1) then
        RAISE_APPLICATION_ERROR(-20001, 'pas le droit a plus de 1 sous compte dans un abonnement essentiel');
    else
        if ((abonnementActuel = 'Standard') AND newSousCompte > 2) then
            RAISE_APPLICATION_ERROR(-20001, 'pas le droit a plus de 2 sous compte dans un abonnement standard');
        else
            if ((abonnementActuel = 'Premium') AND newSousCompte > 4) then
                RAISE_APPLICATION_ERROR(-20001, 'pas le droit a plus de 4 sous compte dans un abonnement premium');
            end if;
        end if;
    end if;
end;
/
show err;