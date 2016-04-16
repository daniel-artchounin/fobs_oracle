CREATE TABLE fobs_bde_villes(
  ville_id varchar2(10),
  ville_departement varchar2(10),
  ville_slug varchar2(255),
  ville_nom varchar2(45),
  ville_nom_simple varchar2(45) ,
  ville_nom_reel varchar2(45),
  ville_nom_soundex varchar2(20),
  ville_nom_metaphone varchar2(22),
  ville_code_postal varchar2(255),
  ville_commune varchar2(10),
  ville_code_commune varchar2(10),
  ville_arrondissement varchar2(10),
  ville_canton varchar2(10),
  ville_amdi varchar2(10),
  ville_population_2010 varchar2(15),
  ville_population_1999 varchar2(15),
  ville_population_2012 varchar2(15),
  ville_densite_2010 varchar2(15),
  ville_surface varchar2(15),
  ville_longitude_deg varchar2(10),
  ville_latitude_deg varchar2(10),
  ville_longitude_grd varchar2(10),
  ville_latitude_grd varchar2(10),
  ville_longitude_dms varchar2(10),
  ville_latitude_dms varchar2(10),
  ville_zmin varchar(20),
  ville_zmax varchar(20)
)
ORGANIZATION EXTERNAL
(
  TYPE ORACLE_LOADER
  DEFAULT DIRECTORY monRepertoireFobsSrc18
  ACCESS PARAMETERS 
(
RECORDS DELIMITED BY newline
SKIP 1
CHARACTERSET UTF8
BADFILE monRepertoireFobsLog18:'fobs_bde_villes.txt.bad'
LOGFILE monRepertoireFobsLog18:'fobs_bde_villes.txt.log'
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
)
LOCATION ('villes_france.csv'))
REJECT LIMIT 100;

DESCRIBE fobs_bde_villes;
SELECT COUNT(*) FROM fobs_bde_villes;
SELECT TABLE_NAME, TYPE_NAME, DEFAULT_DIRECTORY_NAME FROM USER_EXTERNAL_TABLES;