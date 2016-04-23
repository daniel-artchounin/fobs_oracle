CREATE TABLE fobs_dw_date(
	dateCall date,
	jDS NUMBER(1),
	jDA NUMBER(3),
	mois NUMBER(2),
	trimestre NUMBER(1),
	semaine NUMBER(2)
);

CREATE UNIQUE INDEX idxDateCall
	ON fobs_dw_date(dateCall);
ALTER TABLE fobs_dw_date 
	ADD CONSTRAINT cstrDateCall PRIMARY KEY(dateCall);