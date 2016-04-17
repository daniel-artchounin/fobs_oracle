CREATE TABLE fobs_dw_appelant(
    customerNumber NUMBER(10),
    age NUMBER(3),
    income NUMBER(5),
    gender VARCHAR2(1)
);
  
CREATE UNIQUE INDEX idxCustomerNumber
  ON fobs_dw_appelant(customerNumber);
ALTER TABLE fobs_dw_appelant 
  ADD CONSTRAINT cstrCustomerNumber PRIMARY KEY(customerNumber);
ALTER TABLE fobs_dw_appelant 
  ADD CONSTRAINT cstrAppelantGender CHECK (gender IN ('M', 'F', 'U')); 