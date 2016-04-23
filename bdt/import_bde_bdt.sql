-- SET SERVEROUTPUT ON
Declare
	nbOfLinesBdeDate NUMBER(10, 0);
	nbOfLinesBdtDate  NUMBER(10, 0);
	nbOfLinesBdeAppelant NUMBER(10, 0);
	nbOfLinesBdtAppelant NUMBER(10, 0);
	nbOfLinesBdeVilles NUMBER(10, 0);
	nbOfLinesBdtVilles NUMBER(10, 0);
	nbOfLinesBdeCalls NUMBER(10, 0);
	nbOfLinesBdtCalls NUMBER(10, 0);
BEGIN
	DBMS_OUTPUT.PUT_LINE('');
	DBMS_OUTPUT.PUT_LINE('********************************** BDE -> BDT **********************************');

	DBMS_OUTPUT.PUT_LINE('');
	DBMS_OUTPUT.PUT_LINE('---------------------------------- Suppression du contenu des tables ----------------------------------');
	DBMS_OUTPUT.PUT_LINE('Suppression des tuples de ro_fobs_bdt_appels...');
	DELETE FROM ro_fobs_bdt_appels;  
	DBMS_OUTPUT.PUT_LINE('Suppression des tuples de ro_fobs_bdt_date...');
	DELETE FROM ro_fobs_bdt_date;
	DBMS_OUTPUT.PUT_LINE('Suppression des tuples de ro_fobs_bdt_appelant...');
	DELETE FROM ro_fobs_bdt_appelant;
	DBMS_OUTPUT.PUT_LINE('Suppression des tuples de ro_fobs_bdt_ville...');
	DELETE FROM ro_fobs_bdt_ville;
	COMMIT;


	DBMS_OUTPUT.PUT_LINE('');
	DBMS_OUTPUT.PUT_LINE('---------------------------------- Désactivation des contraintes ----------------------------------');
	DBMS_OUTPUT.PUT_LINE('Désactivation des contraintes de ro_fobs_bdt_appels...');
	manage_constraints('DISABLE', 'ro_fobs_bdt_appels');
	DBMS_OUTPUT.PUT_LINE('Désactivation des contraintes de ro_fobs_bdt_date...');
	manage_constraints('DISABLE', 'ro_fobs_bdt_date');  
	DBMS_OUTPUT.PUT_LINE('Désactivation des contraintes de ro_fobs_bdt_appelant...');
	manage_constraints('DISABLE', 'ro_fobs_bdt_appelant');
	DBMS_OUTPUT.PUT_LINE('Désactivation des contraintes de ro_fobs_bdt_ville...');
	manage_constraints('DISABLE', 'ro_fobs_bdt_ville');


	DBMS_OUTPUT.PUT_LINE('');
	DBMS_OUTPUT.PUT_LINE('---------------------------------- Insertion dans ro_fobs_bdt_date... ---------------------------------- ');

	INSERT INTO ro_fobs_bdt_date
	SELECT DISTINCT callDate
	FROM fobs_bde_calls;
	-- WHERE ROWNUM <= 1000;

	SELECT COUNT(*) INTO nbOfLinesBdtDate
	FROM ro_fobs_bdt_date;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_fobs_bdt_date : ' || nbOfLinesBdtDate);

	SELECT COUNT(*) INTO nbOfLinesBdeDate 
	FROM (
	SELECT DISTINCT callDate
	FROM fobs_bde_calls
	);

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples dates différentes de fobs_bde_calls : ' || nbOfLinesBdeDate);
	COMMIT;


	DBMS_OUTPUT.PUT_LINE('');
	DBMS_OUTPUT.PUT_LINE('---------------------------------- Insertion dans ro_fobs_bdt_appelant... ---------------------------------- ');
	INSERT INTO ro_fobs_bdt_appelant
	SELECT customerNumber, age, income, gender
	FROM fobs_bde_phones;
	-- AND DPT.ROWNUM <= 1000;

	SELECT COUNT(*) INTO nbOfLinesBdtAppelant
	FROM ro_fobs_bdt_appelant;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_fobs_bdt_appelant : ' || nbOfLinesBdtAppelant);

	SELECT COUNT(*) INTO nbOfLinesBdeAppelant 
	FROM fobs_bde_phones;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de fobs_bde_phones: ' || nbOfLinesBdeAppelant);
	COMMIT;


	DBMS_OUTPUT.PUT_LINE('');
	DBMS_OUTPUT.PUT_LINE('---------------------------------- Insertion dans ro_fobs_bdt_ville... ---------------------------------- ');
	INSERT INTO ro_fobs_bdt_ville
	SELECT ville_code_commune, ville_nom_simple
	FROM fobs_bde_villes;
	-- AND DPT.ROWNUM <= 1000;  

	SELECT COUNT(*) INTO nbOfLinesBdtVilles
	FROM ro_fobs_bdt_ville;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_fobs_bdt_ville : ' || nbOfLinesBdtVilles);

	SELECT COUNT(*) INTO nbOfLinesBdeVilles 
	FROM fobs_bde_villes;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de fobs_bde_villes: ' || nbOfLinesBdeVilles);
	COMMIT;


	DBMS_OUTPUT.PUT_LINE('');
	DBMS_OUTPUT.PUT_LINE('---------------------------------- Insertion dans ro_fobs_bdt_appels... ---------------------------------- ');
	INSERT INTO ro_fobs_bdt_appels
	SELECT city, callDate, receiverNumber, customerNumber, duration
	FROM fobs_bde_calls;
	-- WHERE ROWNUM <= 1000; 

	SELECT COUNT(*) INTO nbOfLinesBdtCalls
	FROM ro_fobs_bdt_appels;

	SELECT COUNT(*) INTO nbOfLinesBdeCalls
	FROM fobs_bde_calls;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_fobs_bdt_appels : ' || nbOfLinesBdtCalls);

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de fobs_bde_calls : ' || nbOfLinesBdeCalls);
	COMMIT;


	DBMS_OUTPUT.PUT_LINE('');
	DBMS_OUTPUT.PUT_LINE('---------------------------------- Ré-activation des contraintes ----------------------------------');
	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_fobs_bdt_date : ' || nbOfLinesBdtDate);
	DBMS_OUTPUT.PUT_LINE('Activation des contraintes de ro_fobs_bdt_date...');
	manage_constraints('ENABLE', 'ro_fobs_bdt_date');
	SELECT COUNT(*) INTO nbOfLinesBdtDate
	FROM ro_fobs_bdt_date;
	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_fobs_bdt_date : ' || nbOfLinesBdtDate);

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_fobs_bdt_appelant : ' || nbOfLinesBdtAppelant);
	DBMS_OUTPUT.PUT_LINE('Activation des contraintes de ro_fobs_bdt_appelant...');
	manage_constraints('ENABLE', 'ro_f_bdt_magasin');
	SELECT COUNT(*) INTO nbOfLinesBdtAppelant
	FROM ro_fobs_bdt_appelant;
	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_fobs_bdt_appelant : ' || nbOfLinesBdtAppelant);

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_fobs_bdt_ville : ' || nbOfLinesBdtVilles);
	DBMS_OUTPUT.PUT_LINE('Activation des contraintes de ro_fobs_bdt_ville...');
	manage_constraints('ENABLE', 'ro_fobs_bdt_ville');

	SELECT COUNT(*) INTO nbOfLinesBdtVilles
	FROM ro_fobs_bdt_ville;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_fobs_bdt_ville : ' || nbOfLinesBdtVilles);

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_fobs_bdt_appels : ' || nbOfLinesBdtCalls);
	DBMS_OUTPUT.PUT_LINE('Activation des contraintes de ro_fobs_bdt_appels...');
	manage_constraints('ENABLE', 'ro_fobs_bdt_appels');  
	SELECT COUNT(*) INTO nbOfLinesBdtCalls
	FROM ro_fobs_bdt_appels;
	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_fobs_bdt_appels : ' || nbOfLinesBdtCalls);
	COMMIT;
END;
/
-- spool off;

ANALYZE TABLE ro_fobs_bdt_appels COMPUTE STATISTICS;
ANALYZE TABLE ro_fobs_bdt_date COMPUTE STATISTICS;
ANALYZE TABLE ro_fobs_bdt_appelant COMPUTE STATISTICS;
ANALYZE TABLE ro_fobs_bdt_ville COMPUTE STATISTICS;