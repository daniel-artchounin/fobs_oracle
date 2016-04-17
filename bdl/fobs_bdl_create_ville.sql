CREATE TABLE fobs_dw_ville(
  codeCommune VARCHAR2(5),
  villeNomSimple VARCHAR2(45)
);

CREATE UNIQUE INDEX idxVilles
  ON fobs_dw_ville(codeCommune);
ALTER TABLE fobs_dw_ville 
  ADD CONSTRAINT cstrVilles PRIMARY KEY (codeCommune);