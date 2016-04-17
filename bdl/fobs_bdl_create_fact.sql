CREATE TABLE fobs_dw_calls(
	fkCity VARCHAR2(5),
	fkCallDate date,
	receiverNumber NUMBER(10),
	fkCustomerNumber NUMBER(10),
	duration NUMBER(6)
);

ALTER TABLE fobs_dw_calls 
 ADD CONSTRAINT cstrFkCity FOREIGN KEY(fkCity) REFERENCES fobs_dw_ville(codeCommune) ;
ALTER TABLE fobs_dw_calls 
  ADD CONSTRAINT cstrFkCallDate FOREIGN KEY(fkCallDate) REFERENCES fobs_dw_date(dateCall);
ALTER TABLE fobs_dw_calls 
  ADD CONSTRAINT cstrFkCustomerNumber FOREIGN KEY(fkCustomerNumber) REFERENCES fobs_dw_appelant(customerNumber);