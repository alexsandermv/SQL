SELECT EXA_RX.CD_EXA_RX
      ,EXA_RX.DS_EXA_RX
      ,EXA_RX.CD_GED_DOCUMENTO
      ,VC2CLOB_FROM_BLOB(BLOB_CONTEUDO)
      ,BLOB_CONTEUDO
  FROM DBAMV.EXA_RX
  LEFT JOIN DBAMV.GED_DOCUMENTO
    ON EXA_RX.CD_GED_DOCUMENTO = GED_DOCUMENTO.CD_DOCUMENTO
  LEFT JOIN DBAMV.GED_CONTEUDO 
    ON GED_DOCUMENTO.CD_DOCUMENTO = GED_CONTEUDO.CD_DOCUMENTO