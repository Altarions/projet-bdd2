Create OR REPLACE TRIGGER VerifTempsVisionnage
    BEFORE INSERT OR UPDATE ON VISIONNAGE
    FOR EACH ROW
Declare
    yauneligne NUMBER;
    newID_sc NUMBER;
    newMail VARCHAR2(50);
    newID_Oeuvre NUMBER;
    newSaison NUMBER;
    newEpisode NUMBER;
BEGIN
    newID_sc := :new.ID_SOUSCOMPTE;
    newMail := :new.mail;
    newID_Oeuvre := :new.id_oeuvre;
    newSaison := :new.num_saison;
    newEpisode := :new.num_episode;

    SELECT Count(*) into yauneligne
    From VISIONNAGE
    WHERE ID_SOUSCOMPTE = newID_sc AND MAIL = newMail AND ID_OEUVRE = newID_Oeuvre AND NUM_SAISON = newSaison AND NUM_EPISODE = newEpisode;

    if yauneligne > 0 then
        DELETE FROM VISIONNAGE WHERE ID_SOUSCOMPTE = newID_sc AND MAIL = newMail AND ID_OEUVRE = newID_Oeuvre AND NUM_SAISON = newSaison AND NUM_EPISODE = newEpisode;
    end if;
end;
/
show err;