      ************************************************************************************
      * Author.: JOSAFA SOARES FERNANDES
      * Date...:  27/07/2025
      * Purpose: SIMULADOR DE CAIXA REGISTRADORA
      * NOME...: CAIXAREG -- 28MIN
      ************************************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CAIXAREG.
      *==================================================================================*
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WRK-VALOR-ITEM1              PIC 9(05)V99 VALUE ZEROS.
       01 WRK-VALOR-ITEM2              PIC 9(05)V99 VALUE ZEROS.
       01 WRK-VALOR-ITEM3              PIC 9(05)V99 VALUE ZEROS.
       01 WRK-DESCONTO                 PIC 9(05)V99 VALUE ZEROS.
       01 WRK-TOTAL-COMPRA             PIC 9(06)V99 VALUE ZEROS.
       01 WRK-TOTAL-FINAL              PIC 9(06)V99 VALUE ZEROS.

      *==================================================================================*
       PROCEDURE DIVISION.
      *==================================================================================*

      *----------------------------------------------------------------------------------*
      *    PROCESSAMENTO PRINCIPAL
      *----------------------------------------------------------------------------------*
      *> cobol-lint CL002 0000-processar
       0000-PROCESSAR                SECTION.
      *----------------------------------------------------------------------------------*

            .
      *----------------------------------------------------------------------------------*
      *> cobol-lint CL002 0000-end
       0000-END                EXIT.
      *----------------------------------------------------------------------------------*

      *----------------------------------------------------------------------------------*
      *    INSERE DADOS ATRAVES DA TELA
      *----------------------------------------------------------------------------------*
       0001-INSERIR-VALOR      SECTION.
      *----------------------------------------------------------------------------------*

           DISPLAY 'DIGITE O VALOR DO ITEM 1'.
           ACCEPT WRK-VALOR-ITEM2

           DISPLAY 'DIGITE O VALOR DO ITEM 2'.
           ACCEPT WRK-VALOR-ITEM2

           DISPLAY 'DIGITE O VALOR DO ITEM 3'.
           ACCEPT WRK-VALOR-ITEM3

           IF WRK-VALOR-ITEM1 EQUAL ZEROS
               DISPLAY 'VALOR DO ITEM 1 ZERADO'
           ELSE
               IF WRK-VALOR-ITEM2 EQUAL ZEROS
                   DISPLAY 'VALOR DO ITEM 2 ZERADO'
               ELSE
                   IF WRK-VALOR-ITEM3 EQUAL ZEROS
                       DISPLAY 'VALOR DO ITEM 3 ZERADO'
                   END-IF
               END-IF
           END-IF
           .
      *----------------------------------------------------------------------------------*
      *> cobol-lint CL002 0001-end
       0001-END.              EXIT.
      *----------------------------------------------------------------------------------*

      *----------------------------------------------------------------------------------*
      *    CALCULA TOTAL COMPRA    SECTION
      *----------------------------------------------------------------------------------*
       0002-CALCULA-COMPRA     SECTION.
      *----------------------------------------------------------------------------------*

        ADD WRK-VALOR-ITEM1 TO WRK-TOTAL-COMPRA
        ADD WRK-VALOR-ITEM2 TO WRK-TOTAL-COMPRA
        ADD WRK-VALOR-ITEM3 TO WRK-TOTAL-COMPRA

        DISPLAY 'VALOR TOTAL DA COMPRA: ' WRK-TOTAL-COMPRA
        .
      *----------------------------------------------------------------------------------*
      *> cobol-lint CL002 0002-end
       0002-END.              EXIT.
      *----------------------------------------------------------------------------------*

      *----------------------------------------------------------------------------------*
      *    VALIDA E CALCULA DESCONTO
      *----------------------------------------------------------------------------------*
       0003-CALCULA-DESCONTO    SECTION.
      *----------------------------------------------------------------------------------*

        DISPLAY ''
        .
      *----------------------------------------------------------------------------------*
      *> cobol-lint CL002 0003-end
       0003-END.              EXIT.
      *----------------------------------------------------------------------------------*
