set serveroutput on format wrapped;
CREATE OR REPLACE PROCEDURE CalculMoyenne
is
    nombreCPTEssentiel NUMBER :=0;
    nombreCPTStandard NUMBER :=0;
    nombreCPTPremium NUMBER :=0;
    nombreCPTTotal NUMBER :=0;
BEGIN
    SELECT NOMBRECOMPTEESSENTIEL into nombreCPTEssentiel FROM AFFICHEESSENTIEL;
    SELECT NOMBRECOMPTESTANDARD into nombreCPTStandard FROM AFFICHESTANDARD;
    SELECT NOMBRECOMPTEPREMIUM into nombreCPTPremium FROM AFFICHEPREMIUM;
    SELECT NOMBRECOMPTE into nombreCPTTotal FROM AFFICHETOTAL;

    DBMS_OUTPUT.put_line('Pourcentage de comptes Essentiel :' || (nombreCPTEssentiel/nombreCPTTotal)*100 || '%');
    DBMS_OUTPUT.put_line('Pourcentage de comptes Standard :' || (nombreCPTStandard/nombreCPTTotal)*100 || '%');
    DBMS_OUTPUT.put_line('Pourcentage de comptes Premium :' || (nombreCPTPremium/nombreCPTTotal)*100 || '%');
    DBMS_OUTPUT.put_line('Pour un total de : ' || (nombreCPTTotal) || ' Comptes');
end;
/
show err;