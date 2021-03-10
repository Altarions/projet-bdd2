set serveroutput on format wrapped;

CREATE OR REPLACE PROCEDURE TempsVisionnagePourCompte(newMail IN VARCHAR2) is
    actuel NUMBER :=0;
    nombretotal NUMBER :=0;
    Cursor cursor1 is
    SELECT TEMPS_VISIONNAGE
    FROM VISIONNAGE
    WHERE VISIONNAGE.MAIL = newMail;

BEGIN
      open Cursor1;
     IF (cursor1%ROWCOUNT =0)
                 THEN
         RAISE_APPLICATION_ERROR(-20001, 'Le compte nexiste pas voyons');
     end if;
      loop
        fetch cursor1 into actuel;
        exit when cursor1%NOTFOUND;
        nombretotal := nombretotal + actuel;
      end loop;
      DBMS_OUTPUT.NEW_LINE();
      DBMS_OUTPUT.put_line('Le temps total de visionnage du compte : ' || newMail || ' est : ' ||nombretotal);
      CLOSE cursor1;
end;
/
show err;
