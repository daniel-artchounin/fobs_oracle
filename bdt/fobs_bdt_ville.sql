CREATE OR REPLACE TYPE fobs_bdt_ville AS OBJECT (
	codeCommune VARCHAR2(5),
	villeNomSimple VARCHAR2(45),
	MEMBER FUNCTION getCommune RETURN VARCHAR2,
	MEMBER FUNCTION getNomVille RETURN VARCHAR2
);-- [NOT FINAL];
/

CREATE OR REPLACE TYPE BODY fobs_bdt_ville
IS 
	MEMBER FUNCTION getCommune RETURN VARCHAR2
	IS
	BEGIN
		IF LENGTH(SELF.codeCommune) <= 5 THEN 
			RETURN SELF.codeCommune;
		ELSE  
			RETURN NULL;
		END IF;    
	END;
	MEMBER FUNCTION getNomVille RETURN VARCHAR2
	IS
	BEGIN
		RETURN SELF.villeNomSimple;
	END;  
END;
/

-- DROP TABLE ro_fobs_bdt_ville;
CREATE TABLE ro_fobs_bdt_ville OF fobs_bdt_ville(
	PRIMARY KEY(codeCommune),
	villeNomSimple NOT NULL
);