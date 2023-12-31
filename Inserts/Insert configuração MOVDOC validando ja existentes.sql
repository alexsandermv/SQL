-- INSERT FLUXO DE DOCUMENTO
INSERT INTO DBAMV.FLUXO_DOCUMENTO
SELECT SEQ_FLUXO_DOCUMENTO.NEXTVAL            CD_FLUXO_DOCUMENTO
      ,DOCUMENTO_PROT.CD_DOCUMENTO_PROT       CD_DOCUMENTO
      ,SETOR_ORIGEM.CD_SETOR                  CD_SETOR_ORIG
      ,SETOR_DESTINO.CD_SETOR                 CD_SETOR_DEST
      ,'N'                                    SN_MOV_AMB_FECHADA
      ,'N'                                    SN_MOV_INT_FECHADA
  FROM DBAMV.SETOR SETOR_ORIGEM
      ,DBAMV.SETOR SETOR_DESTINO
      ,DBAMV.DOCUMENTO_PROT
  WHERE SETOR_ORIGEM.CD_SETOR != SETOR_DESTINO.CD_SETOR
    AND (CD_DOCUMENTO_PROT,SETOR_ORIGEM.CD_SETOR,SETOR_DESTINO.CD_SETOR) NOT IN (SELECT DISTINCT CD_DOCUMENTO, CD_SETOR_ORIG, CD_SETOR_DEST
                                                                                  FROM DBAMV.FLUXO_DOCUMENTO
                                                                                )


-- INSERT DOCUMENTO POR SETOR
INSERT INTO DBAMV.DOCUMENTO_SET
SELECT DOCUMENTO_PROT.CD_DOCUMENTO_PROT
      ,SETOR.CD_SETOR
  FROM DBAMV.DOCUMENTO_PROT
      ,DBAMV.SETOR
  WHERE (setor.cd_setor, documento_prot.cd_documento_prot) NOT IN (SELECT cd_setor, cd_documento_prot FROM documento_set)
ORDER BY 1,2




