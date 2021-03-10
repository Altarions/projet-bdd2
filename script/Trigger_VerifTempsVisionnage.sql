CREATE OR REPLACE TRIGGER verifTempsVisionnage_Trigger
    BEFORE INSERT OR UPDATE ON VISIONNAGE
    FOR EACH ROW
    DECLARE
        idOeuvreAcheck NUMBER;
        numEpisode NUMBER;
        numSaison NUMBER;
        newDuree NUMBER;
    BEGIN
        idOeuvreAcheck := :new.id_oeuvre;
        numEpisode := :new.num_episode;
        numSaison := :new.num_saison;
        SELECT duree into newDuree
        FROM OEUVRE
        WHERE OEUVRE.ID_OEUVRE = idOeuvreAcheck AND OEUVRE.NUM_EPISODE = numEpisode AND OEUVRE.NUM_SAISON = numSaison;

        if(:new.temps_visionnage > newDuree OR :new.temps_visionnage < 0)
            then RAISE_APPLICATION_ERROR(-20001, 'Le temps de visionnage est incorrect !');
        end if;
    end;
    /
show err;