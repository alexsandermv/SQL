SELECT CPF_VALIDACAO(NUMR_CPF) FROM PESSOAS


CREATE OR REPLACE FUNCTION CPF_VALIDACAO
      (p_cpf     IN CHAR)
       RETURN    BOOLEAN
IS
     m_total     NUMBER   :=  0;
     m_digito    NUMBER   :=  0;
BEGIN
     FOR i IN 1..9 LOOP
         m_total := m_total + substr(p_cpf,i,1) * (11 - i);
     END LOOP;

     m_digito := 11 - mod(m_total,11);

     IF m_digito > 9 THEN
        m_digito := 0;
     END IF;

     IF m_digito != substr(p_cpf,10,1) THEN
        RETURN FALSE;
     END IF;

     m_digito := 0;
     m_total  := 0;

     FOR i IN 1..10 LOOP
         m_total := m_total + substr(p_cpf,i,1) * (12 - i);
     END LOOP;

     m_digito := 11 - mod(m_total,11);

     IF m_digito > 9 THEN
        m_digito := 0;
     END IF;

     IF m_digito != substr(p_cpf,11,1) THEN
        RETURN FALSE;
     END IF;

     RETURN TRUE;

end;