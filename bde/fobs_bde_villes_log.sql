DECLARE
	nbOfLinesBdeVilles NUMBER(10);
BEGIN
	DBMS_OUTPUT.PUT_LINE('Création de la table externe fobs_bde_villes');
	SELECT COUNT(*) INTO nbOfLinesBdeVilles FROM fobs_bde_villes;
	DBMS_OUTPUT.PUT_LINE('Nombre de lignes de fobs_bde_villes : ' || nbOfLinesBdeVilles);
END;
/