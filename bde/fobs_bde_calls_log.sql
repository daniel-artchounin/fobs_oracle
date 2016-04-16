DECLARE 
	nbOfLinesBdeCalls NUMBER(10);
BEGIN
	SELECT count(*) INTO nbOfLinesBdeCalls FROM fobs_bde_calls;
	DBMS_OUTPUT.PUT_LINE('Nombre de lignes de fobs_bde_calls : ' || nbOfLinesBdeCalls);
END;
/