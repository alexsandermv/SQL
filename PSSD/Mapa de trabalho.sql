--SELECT PARA BUSCAR SE A JOB EXISTE NO BANCO  *************CONFERIR SE ESTÁ ATIVA****************
SELECT * FROM DBA_SCHEDULER_JOBS 
WHERE job_name = 'PSSD_PROCESSA_MAPA_AUTOMATICO'; 

--CRIA JOB NO BANCO
BEGIN    
  DBMS_SCHEDULER.CREATE_JOB ( JOB_NAME => 'PSSD_PROCESSA_MAPA_AUTOMATICO',
  JOB_TYPE => 'PLSQL_BLOCK',
  JOB_ACTION => 'BEGIN dbamv.PRC_PSSD_PROCESSA_LOTE_AUTO(); END;',
  START_DATE => TRUNC(SYSDATE),
  REPEAT_INTERVAL => 'freq=minutely; interval=1',
  END_DATE => NULL,
  ENABLED => TRUE,
  COMMENTS => 'Processa amostras e gera mapas de trabalho.'
  ); 
END;

--DELETA A JOB SE ELA JÁ ESTIVER CRIADA
BEGIN
  dbms_scheduler.drop_job(job_name => 'PSSD_PROCESSA_MAPA_AUTOMATICO');
END;