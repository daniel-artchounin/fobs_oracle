CREATE OR REPLACE TYPE fobs_bdt_appelant AS OBJECT (
	customerNumber VARCHAR2(30),
	age VARCHAR2(200),
	income VARCHAR2(100),
	gender VARCHAR2(5),
	MEMBER FUNCTION getCustomerNumber RETURN NUMBER,
	MEMBER FUNCTION getAge RETURN NUMBER,
	MEMBER FUNCTION getIncome RETURN NUMBER,
	MEMBER FUNCTION getGender RETURN VARCHAR2
);-- [NOT FINAL];
/

CREATE OR REPLACE TYPE BODY fobs_bdt_appelant
IS 
	MEMBER FUNCTION getCustomerNumber RETURN NUMBER
	IS
	BEGIN
		IF LENGTH(customerNumber) = 10 THEN 
			RETURN TO_NUMBER(customerNumber);
		ELSE  
			RETURN NULL;
		END IF;    
	END;

	MEMBER FUNCTION getAge RETURN NUMBER
	IS
	BEGIN
		IF LENGTH(age) <= 3 THEN 
			RETURN TO_NUMBER(age);
		ELSE
			RETURN NULL;
		END IF;      
	END;  

	MEMBER FUNCTION getIncome RETURN NUMBER
	IS
	BEGIN
		IF LENGTH(income) <= 5 THEN 
			RETURN TO_NUMBER(income);
		ELSE
			RETURN NULL;
		END IF;      
	END; 

	MEMBER FUNCTION getGender RETURN VARCHAR2
	IS
	BEGIN
		IF gender = 'M' or gender = 'F'  or gender = 'U' THEN 
			RETURN gender;
		ELSE
			RETURN NULL;
		END IF; 
	END; 
END;
/

-- DROP TABLE ro_fobs_bdt_appelant ;
CREATE TABLE ro_fobs_bdt_appelant OF fobs_bdt_appelant(
	age NOT NULL,
	income NOT NULL,
	gender NOT NULL,
	CHECK (gender IN ('M', 'F', 'U'))
);