spool log.txt
	@utlexcpt.sql
	@utlxplan.sql
	@manage_constraints.sql
	@./bde/fobs_bde.sql
	@./bdt/fobs_bdt.sql
	@./bdl/fobs_bdl.sql
spool off;

-- SELECT ville_code_commune FROM 
--   (SELECT ville_code_commune, rownum AS rnum FROM fobs_bde_villes)
-- WHERE rnum BETWEEN 36000 AND 36500;