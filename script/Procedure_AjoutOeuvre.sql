set serveroutput on format wrapped;
CREATE OR REPLACE PROCEDURE procedure_ajoutOeuvre(NVnom_oeuvre VARCHAR,
                                                  NVnum_saison NUMBER,
                                                  NVnum_episode NUMBER,
                                                  NVnom_episode VARCHAR,
                                                  NVduree NUMBER,
                                                  NVdate_sortie NUMBER,
                                                  NVdistribution VARCHAR,
                                                  NVcategorie_age NUMBER,
                                                  NVdescriptif VARCHAR,
                                                  NVgenres VARCHAR,
                                                  NVadjectif VARCHAR) IS
    estDejaUneOeuvre NUMBER;
    idOeuvre NUMBER;
BEGIN
    SELECT COUNT (*) INTO estDejaUneOeuvre
    FROM NOM_OEUVRE
    WHERE nom_oeuvre = NVnom_oeuvre;

    if estDejaUneOeuvre > 0 then
        DBMS_OUTPUT.PUT_LINE('Loeuvre existe deja');
        SELECT ID_OEUVRE into idOeuvre
        FROM NOM_OEUVRE
        Where NOM_OEUVRE = NVnom_oeuvre;
        Insert into OEUVRE VALUES (idOeuvre, NVnum_saison, NVnum_episode, NVnom_episode, NVduree, NVdate_sortie,
                                   NVdistribution, NVcategorie_age, NVdescriptif, NVgenres, NVadjectif);

    else
        DBMS_OUTPUT.PUT_LINE('il sagit dune nouvelle oeuvre');
        Insert into NOM_OEUVRE VALUES (num.nextval, NVnom_oeuvre);
        INSERT into Oeuvre VALUES (num.currval, NVnum_saison, NVnum_episode, NVnom_episode, NVduree, NVdate_sortie,
                                   NVdistribution, NVcategorie_age, NVdescriptif, NVgenres, NVadjectif);
    end if;
end;
/
show err;