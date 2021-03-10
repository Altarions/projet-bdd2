set serveroutput on format wrapped;

CREATE OR REPLACE PROCEDURE TempsVisionnagePourCompte(mail1 IN VARCHAR2) is
    actuel NUMBER :=0;
    nombretotal NUMBER :=0;
    Cursor cursor1 is
    SELECT TEMPS_VISIONNAGE
    FROM VISIONNAGE
    WHERE VISIONNAGE.MAIL = mail1;

BEGIN
      open Cursor1;
      loop
        fetch cursor1 into actuel;
        exit when cursor1%NOTFOUND;
        nombretotal := nombretotal + actuel;
      end loop;
      DBMS_OUTPUT.put_line(nombretotal);
      CLOSE cursor1;
end;
/
show err;
