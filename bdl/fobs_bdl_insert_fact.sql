Declare
  nbOfLinesBdtCalls NUMBER(10);
  nbOfLinesBdlCalls NUMBER(10);
BEGIN 
  DBMS_OUTPUT.PUT_LINE('Désactivation des contraintes de fobs_dw_calls...');
  manage_constraints('DISABLE', 'fobs_dw_calls');
    
  INSERT INTO fobs_dw_calls(fkCity, fkCallDate, receiverNumber, fkCustomerNumber, duration)
  SELECT A.getCity(), A.getCallDate(), A.getReceiverNumber(), A.getCustomerNumber(), A.getDuration()
  FROM ro_fobs_bdt_appels A;
  -- WHERE ROWNUM < 5000;

  SELECT COUNT(*) INTO nbOfLinesBdlCalls
  FROM fobs_dw_calls;

  DBMS_OUTPUT.PUT_LINE('Nombre de tuples de fobs_dw_calls après insertion : ' || nbOfLinesBdlCalls);  
  
  DELETE FROM fobs_dw_calls
  WHERE (fkCity IS NOT NULL AND fkCity NOT IN (
    SELECT codeCommune FROM fobs_dw_ville
  ));
  
  SELECT COUNT(*) INTO nbOfLinesBdlCalls
  FROM fobs_dw_calls;

  DBMS_OUTPUT.PUT_LINE('Nombre de tuples de fobs_dw_calls après clean : ' || nbOfLinesBdlCalls);  
  
  DBMS_OUTPUT.PUT_LINE('Activation des contraintes de fobs_dw_calls...');
  manage_constraints('ENABLE', 'fobs_dw_calls');
  
  SELECT COUNT(*) INTO nbOfLinesBdtCalls
  FROM ro_fobs_bdt_appels;

  DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_fobs_bdt_appels : ' || nbOfLinesBdtCalls);
  
  SELECT COUNT(*) INTO nbOfLinesBdlCalls
  FROM fobs_dw_calls;

  DBMS_OUTPUT.PUT_LINE('Nombre de tuples de fobs_dw_calls : ' || nbOfLinesBdlCalls);
END;
/