DECLARE 
	nbOfLinesBdePhones NUMBER(10);
BEGIN
	SELECT COUNT(*) INTO nbOfLinesBdePhones FROM fobs_bde_phones;
	DBMS_OUTPUT.PUT_LINE('Nombre de lignes de fobs_bde_phones : ' || nbOfLinesBdePhones);
END;
/