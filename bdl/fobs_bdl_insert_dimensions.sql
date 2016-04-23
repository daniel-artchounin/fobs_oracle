Declare
	nbOfLinesBdtVille NUMBER(10);
	nbOfLinesBdtDate NUMBER(10);
	nbOfLinesBdtAppelant NUMBER(10);
	nbOfLinesBdlVille NUMBER(10);
	nbOfLinesBdlDate NUMBER(10);
	nbOfLinesBdlAppelant NUMBER(10);
BEGIN  
	DBMS_OUTPUT.PUT_LINE('');
	DBMS_OUTPUT.PUT_LINE('********************************** Import des données des dimensions **********************************');


	DBMS_OUTPUT.PUT_LINE('Désactivation des contraintes de fobs_dw_ville...');
	manage_constraints('DISABLE', 'fobs_dw_ville'); 

	dropIndex('idxVilles');

	INSERT INTO fobs_dw_ville(codeCommune, villeNomSimple)
	SELECT V.getCommune(), V.getNomVille()
	FROM ro_fobs_bdt_ville V;

	COMMIT;

	SELECT COUNT(*) INTO nbOfLinesBdlVille
	FROM fobs_dw_ville;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de fobs_dw_ville après insertion : ' || nbOfLinesBdlVille);

	DELETE FROM fobs_dw_ville
	WHERE codeCommune IS NULL;

	COMMIT;

	SELECT COUNT(*) INTO nbOfLinesBdlVille
	FROM fobs_dw_ville;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de fobs_dw_ville après clean : ' || nbOfLinesBdlVille);  

	DBMS_OUTPUT.PUT_LINE('Activation des contraintes de fobs_dw_ville...');
	createIndex('idxVilles', 'fobs_dw_ville', 'codeCommune');  
	manage_constraints('ENABLE', 'fobs_dw_ville');

	SELECT COUNT(*) INTO nbOfLinesBdtVille
	FROM ro_fobs_bdt_ville;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_fobs_bdt_ville : ' || nbOfLinesBdtVille);

	SELECT COUNT(*) INTO nbOfLinesBdlVille
	FROM fobs_dw_ville;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de fobs_dw_ville : ' || nbOfLinesBdlVille);


	DBMS_OUTPUT.PUT_LINE('Désactivation des contraintes de fobs_dw_date...');
	manage_constraints('DISABLE', 'fobs_dw_date');

	dropIndex('idxDateCall');

	INSERT INTO fobs_dw_date(dateCall, jDS, jDA, mois, trimestre, semaine)
	SELECT D.getDate(), D.getJDS(), D.getJDA(), D.getMois(), D.getTrimestre(), D.getSemaine()
	FROM ro_fobs_bdt_date D;

	COMMIT;

	SELECT COUNT(*) INTO nbOfLinesBdlDate
	FROM fobs_dw_date;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de fobs_dw_date après insertion : ' || nbOfLinesBdlDate);

	DELETE FROM fobs_dw_date
	WHERE dateCall IS NULL;

	COMMIT;

	SELECT COUNT(*) INTO nbOfLinesBdlDate
	FROM fobs_dw_date;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de fobs_dw_date après clean : ' || nbOfLinesBdlDate);

	DBMS_OUTPUT.PUT_LINE('Activation des contraintes de fobs_dw_date...');  

	createIndex('idxDateCall', 'fobs_dw_date', 'dateCall');

	manage_constraints('ENABLE', 'fobs_dw_date');

	SELECT COUNT(*) INTO nbOfLinesBdtDate
	FROM ro_fobs_bdt_date;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_fobs_bdt_date : ' || nbOfLinesBdtDate);

	SELECT COUNT(*) INTO nbOfLinesBdlDate
	FROM fobs_dw_date;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de fobs_dw_date : ' || nbOfLinesBdlDate);



	DBMS_OUTPUT.PUT_LINE('Désactivation des contraintes de fobs_dw_appelant...');
	manage_constraints('DISABLE', 'fobs_dw_appelant');

	dropIndex('idxCustomerNumber');

	INSERT INTO fobs_dw_appelant(customerNumber, age, income, gender)
	SELECT A.getCustomerNumber(), A.getAge(), A.getIncome(), A.getGender()
	FROM ro_fobs_bdt_appelant A;

	COMMIT;

	SELECT COUNT(*) INTO nbOfLinesBdlAppelant
	FROM fobs_dw_appelant;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de fobs_dw_appelant après insertion : ' || nbOfLinesBdlAppelant);

	DELETE FROM fobs_dw_appelant
	WHERE customerNumber IS NULL;

	COMMIT;

	SELECT COUNT(*) INTO nbOfLinesBdlAppelant
	FROM fobs_dw_appelant;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de fobs_dw_appelant après clean : ' || nbOfLinesBdlAppelant);

	DBMS_OUTPUT.PUT_LINE('Activation des contraintes de fobs_dw_appelant...');

	createIndex('idxCustomerNumber', 'fobs_dw_appelant', 'customerNumber');

	manage_constraints('ENABLE', 'fobs_dw_appelant');

	SELECT COUNT(*) INTO nbOfLinesBdtAppelant
	FROM ro_fobs_bdt_appelant;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_fobs_bdt_appelant : ' || nbOfLinesBdtAppelant);

	SELECT COUNT(*) INTO nbOfLinesBdlAppelant
	FROM fobs_dw_appelant;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de fobs_dw_appelant : ' || nbOfLinesBdlAppelant);
END;
/
