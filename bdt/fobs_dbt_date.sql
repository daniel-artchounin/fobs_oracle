CREATE OR REPLACE TYPE fobs_bdt_date AS OBJECT (
	dateCall VARCHAR(20),
	MEMBER FUNCTION getDate RETURN date,
	MEMBER FUNCTION getJDS RETURN NUMBER,
	MEMBER FUNCTION getJDA RETURN NUMBER,
	MEMBER FUNCTION getMois RETURN NUMBER,
	MEMBER FUNCTION getTrimestre RETURN NUMBER,
	MEMBER FUNCTION getSemaine RETURN NUMBER
);
/

CREATE OR REPLACE TYPE BODY fobs_bdt_date
IS 
	MEMBER FUNCTION getDate RETURN date
	IS
	regexResult NUMBER(1);
	BEGIN
		SELECT REGEXP_INSTR(dateCall, '\d{4}-\d{2}-\d{2}') INTO regexResult FROM DUAL;
		IF regexResult = 0 THEN 
			RETURN NULL;
		ELSE
			RETURN TO_DATE(dateCall, 'YYYY-MM-DD');
		END IF;
	END;

	MEMBER FUNCTION getJDS RETURN NUMBER
	IS
		regexResult NUMBER(1);
		dayWeek NUMBER(1);
	BEGIN
		SELECT REGEXP_INSTR(dateCall, '\d{4}-\d{2}-\d{2}') INTO regexResult FROM DUAL;
		IF regexResult = 0 THEN 
			RETURN NULL;
		ELSE
			dayWeek := TO_CHAR(TO_DATE(dateCall, 'YYYY-MM-DD'), 'D');
			RETURN TO_NUMBER(dayWeek);
		END IF;
	END;

	MEMBER FUNCTION getJDA RETURN NUMBER
	IS
		regexResult NUMBER(1);
	BEGIN
	SELECT REGEXP_INSTR(dateCall, '\d{4}-\d{2}-\d{2}') INTO regexResult FROM DUAL;
		IF regexResult = 0 THEN 
			RETURN NULL;
		ELSE
			RETURN TO_NUMBER(TO_CHAR(TO_DATE(dateCall, 'YYYY-MM-DD'), 'DDD'));
		END IF;
	END;

	MEMBER FUNCTION getMois RETURN NUMBER
	IS
		regexResult NUMBER(1);
	BEGIN
		SELECT REGEXP_INSTR(dateCall, '\d{4}-\d{2}-\d{2}') INTO regexResult FROM DUAL;
		IF regexResult = 0 THEN 
			RETURN NULL;
		ELSE
			RETURN TO_NUMBER(TO_CHAR(TO_DATE(dateCall, 'YYYY-MM-DD'), 'MM'));
		END IF;
	END;

	MEMBER FUNCTION getTrimestre RETURN NUMBER
	IS
		regexResult NUMBER(1);
		monthOfYear NUMBER(2);
	BEGIN
		SELECT REGEXP_INSTR(dateCall, '\d{4}-\d{2}-\d{2}') INTO regexResult FROM DUAL;
		IF regexResult = 0 THEN 
			RETURN NULL;
		ELSE
		monthOfYear := TO_NUMBER(TO_CHAR(TO_DATE(dateCall, 'YYYY-MM-DD'), 'MM'));
			IF  monthOfYear <= 3 THEN 
				RETURN TO_NUMBER('1');
			ELSIF monthOfYear <= 6 THEN 
				RETURN TO_NUMBER('2');
			ELSIF monthOfYear <= 9 THEN 
				RETURN TO_NUMBER('3');
			ELSE 
				RETURN TO_NUMBER('4');
			END IF;
		END IF;
	END;

	MEMBER FUNCTION getSemaine RETURN NUMBER
	IS
		regexResult NUMBER(1);
	BEGIN
		SELECT REGEXP_INSTR(dateCall, '\d{4}-\d{2}-\d{2}') INTO regexResult FROM DUAL;
		IF regexResult = 0 THEN 
			RETURN NULL;
		ELSE
			RETURN TO_NUMBER(TO_CHAR(TO_DATE(dateCall, 'YYYY-MM-DD'), 'IW'));
		END IF;
	END; 
END;
/

CREATE TABLE ro_fobs_bdt_date OF fobs_bdt_date;