SELECT ESPECIE.CD_ESPECIE
      ,ESPECIE.DS_ESPECIE
      ,PRODUTO.CD_PRODUTO
      ,PRODUTO.DS_PRODUTO
      ,TIP_PRESC.CD_TIP_PRESC
      ,TIP_PRESC.DS_TIP_PRESC
      ,PRO_FAT.CD_PRO_FAT
      ,PRO_FAT.DS_PRO_FAT
  FROM DBAMV.PRODUTO
  LEFT JOIN DBAMV.TIP_PRESC
    ON PRODUTO.CD_PRODUTO = TIP_PRESC.CD_PRODUTO
  LEFT JOIN DBAMV.PRO_FAT
    ON PRODUTO.CD_PRO_FAT = PRO_FAT.CD_PRO_FAT
  JOIN DBAMV.ESPECIE
    ON PRODUTO.CD_ESPECIE = ESPECIE.CD_ESPECIE
ORDER BY 1,3,5,7