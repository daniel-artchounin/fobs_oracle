CREATE OR REPLACE TYPE fobs_bdt_appels AS OBJECT (
    city VARCHAR2(30),
    callDate VARCHAR2(20),
    receiverNumber VARCHAR2(30),
    customerNumber VARCHAR2(10),
    duration VARCHAR2(20),
    MEMBER FUNCTION getCity RETURN VARCHAR2,
    MEMBER FUNCTION getCallDate RETURN date,
    MEMBER FUNCTION getReceiverNumber RETURN NUMBER,
    MEMBER FUNCTION getCustomerNumber RETURN NUMBER,
    MEMBER FUNCTION getDuration RETURN NUMBER
);-- [NOT FINAL];
/

CREATE OR REPLACE TYPE BODY fobs_bdt_appels
IS 
  MEMBER FUNCTION getCity RETURN VARCHAR2
  IS
  BEGIN
    IF LENGTH(city) <= 5 THEN 
      RETURN (city);
    ELSE  
     RETURN NULL;
    END IF;    
  END;
  MEMBER FUNCTION getCallDate RETURN date
  IS
    regexResult NUMBER(1);
  BEGIN
    SELECT REGEXP_INSTR(callDate, '\d{4}-\d{2}-\d{2}') INTO regexResult FROM DUAL;
    IF regexResult = 0 THEN 
     RETURN NULL;
    ELSE
     RETURN TO_DATE(callDate, 'YYYY-MM-DD');
    END IF;
  END;
  MEMBER FUNCTION getReceiverNumber RETURN NUMBER
  IS
  BEGIN
    IF LENGTH(receiverNumber) = 10 THEN 
      RETURN TO_NUMBER(receiverNumber);
    ELSE  
     RETURN NULL;
    END IF;    
  END;
  MEMBER FUNCTION getCustomerNumber RETURN NUMBER
  IS
  BEGIN
    IF LENGTH(customerNumber) = 10 THEN 
      RETURN TO_NUMBER(customerNumber);
    ELSE  
     RETURN NULL;
    END IF;    
  END;
  MEMBER FUNCTION getDuration RETURN NUMBER
  IS
  BEGIN
    IF LENGTH(duration) <= 6 THEN 
      RETURN TO_NUMBER(duration);
    ELSE  
     RETURN NULL;
    END IF;    
  END;  
END ;
/

--DROP TABLE ro_fobs_bdt_appels;
CREATE TABLE ro_fobs_bdt_appels OF fobs_bdt_appels(
  receiverNumber NOT NULL
);