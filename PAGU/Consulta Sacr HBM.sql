


SELECT PACIENTE.CD_PACIENTE
      ,PACIENTE.NM_PACIENTE
      ,ATENDIME.CD_ATENDIMENTO
      ,To_Char(ATENDIME.DT_ATENDIMENTO,'DD/MM/YYYY') || ' ' || To_Char(ATENDIME.HR_ATENDIMENTO, 'HH24:MI') HR_ATENDIMENTO
      ,ATENDIME.HR_ATENDIMENTO
      ,ATENDIME.DT_ATENDIMENTO
      ,SACR_PERGUNTA_ABORDAGEM.DS_PERGUNTA_ABORDAGEM
      ,SACR_RESPOSTA_ABORDAGEM.CD_RESPOSTA_ABORDAGEM
      ,SACR_RESPOSTA_ABORDAGEM.DS_RESPOSTA_ABORDAGEM
  FROM DBAMV.ATENDIME
       JOIN DBAMV.PACIENTE
         ON ATENDIME.CD_PACIENTE = PACIENTE.CD_PACIENTE
  LEFT JOIN DBAMV.TRIAGEM_ATENDIMENTO
         ON ATENDIME.CD_ATENDIMENTO = TRIAGEM_ATENDIMENTO.CD_ATENDIMENTO
  LEFT JOIN DBAMV.SACR_PERG_RESP_ABORDAGEM
         ON TRIAGEM_ATENDIMENTO.CD_TRIAGEM_ATENDIMENTO = SACR_PERG_RESP_ABORDAGEM.CD_TRIAGEM_ATENDIMENTO
  LEFT JOIN DBAMV.SACR_PERGUNTA_ABORDAGEM
         ON SACR_PERG_RESP_ABORDAGEM.CD_PERGUNTA_ABORDAGEM = SACR_PERGUNTA_ABORDAGEM.CD_PERGUNTA_ABORDAGEM
  LEFT JOIN DBAMV.SACR_RESPOSTA_ABORDAGEM
         ON SACR_PERGUNTA_ABORDAGEM.CD_PERGUNTA_ABORDAGEM = SACR_RESPOSTA_ABORDAGEM.CD_PERGUNTA_ABORDAGEM
        AND SACR_PERG_RESP_ABORDAGEM.CD_PERGUNTA_ABORDAGEM = SACR_RESPOSTA_ABORDAGEM.CD_PERGUNTA_ABORDAGEM
        AND SACR_PERG_RESP_ABORDAGEM.CD_RESPOSTA_ABORDAGEM = SACR_RESPOSTA_ABORDAGEM.CD_RESPOSTA_ABORDAGEM
  WHERE ATENDIME.DT_ATENDIMENTO BETWEEN '31/10/2022' AND '31/10/2022'
    AND SACR_PERG_RESP_ABORDAGEM.CD_PERGUNTA_ABORDAGEM = 1
    AND SACR_PERG_RESP_ABORDAGEM.CD_RESPOSTA_ABORDAGEM = 1


 --SELECT * FROM SACR_PERG_RESP_ABORDAGEM

                   --SELECT * FROM SACR_RESPOSTA_ABORDAGEM.CD_RESPOSTA_ABORDAGEM








