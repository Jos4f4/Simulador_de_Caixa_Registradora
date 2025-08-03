      ***************************************************************************************
      * Author.: JOSAFA SOARES FERNANDES
      * Date...:  27/07/2025
      * Purpose: CASH REGISTER SIMULATION
      * NOME...: CAIXAREG
      ***************************************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CAIXAREG.
      *=====================================================================================*
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
      *-------------------------------------------------------------------------------------*
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *-------------------------------------------------------------------------------------*

       01 WRK-VALUE-ITEM1 PIC 9(05)V99 VALUE ZEROS.
       01 WRK-VALUE-ITEM2 PIC 9(05)V99 VALUE ZEROS.
       01 WRK-VALUE-ITEM3 PIC 9(05)V99 VALUE ZEROS.
       01 WRK-DISCOUNT PIC 9(05)V99 VALUE ZEROS.
       01 WRK-TOTAL-BUY PIC 9(06)V99 VALUE ZEROS.
       01 WRK-TOTAL-FINAL PIC 9(06)V99 VALUE ZEROS.

       01 WRK-VALIDATE-DISCOUNT PIC X(01)  VALUE 'N'.

      *=====================================================================================*
       PROCEDURE DIVISION.
      *=====================================================================================*

      *-------------------------------------------------------------------------------------*
      *    PROCESSMENT MAIN
      *-------------------------------------------------------------------------------------*
      *> cobol-lint CL002 0000-processar
       0000-PROCESS                                SECTION.
      *-------------------------------------------------------------------------------------*
           PERFORM 0001-INSERT-VALUE
           PERFORM 0002-CALCULATION-BUY
           PERFORM 0003-CALCULATION-DISCOUNT
           PERFORM 0004-TOTALIZATION
           PERFORM 9999-FINISH
           .

      *-------------------------------------------------------------------------------------*
      *> cobol-lint CL002 0000-end
       0000-END.                                   EXIT.
      *-------------------------------------------------------------------------------------*

      *-------------------------------------------------------------------------------------*
      *    INSERE DADOS ATRAVES DA TELA
      *-------------------------------------------------------------------------------------*
       0001-INSERT-VALUE                          SECTION.
      *-------------------------------------------------------------------------------------*

           DISPLAY 'ENTER THE VALUE OF ITEM 1'.
           ACCEPT WRK-VALUE-ITEM1

           DISPLAY 'ENTER THE VALUE OF ITEM 2'.
           ACCEPT WRK-VALUE-ITEM2

           DISPLAY 'ENTER THE VALUE OF ITEM 3'.
           ACCEPT WRK-VALUE-ITEM3

           IF WRK-VALUE-ITEM1 EQUAL ZEROS
               DISPLAY 'VALUE OF ITEM 1 IS ZERO'

           ELSE
               IF WRK-VALUE-ITEM2 EQUAL ZEROS
                   DISPLAY 'VALUE OF ITEM 2 IS ZERO'

               ELSE
                   IF WRK-VALUE-ITEM3 EQUAL ZEROS
                       DISPLAY 'VALUE OF ITEM 3 IS ZERO'

                   END-IF

               END-IF

           END-IF
           .
      *-------------------------------------------------------------------------------------*
      *> cobol-lint CL002 0001-end
       0001-END.                                   EXIT.
      *-------------------------------------------------------------------------------------*

      *-------------------------------------------------------------------------------------*
      *    CALCULATION TOTAL BUY
      *-------------------------------------------------------------------------------------*
       0002-CALCULATION-BUY                        SECTION.
      *-------------------------------------------------------------------------------------*

        ADD WRK-VALUE-ITEM1 TO WRK-TOTAL-BUY
        ADD WRK-VALUE-ITEM2 TO WRK-TOTAL-BUY
        ADD WRK-VALUE-ITEM3 TO WRK-TOTAL-BUY

        DISPLAY 'VALUE TOTAL OF BUY: ' WRK-TOTAL-BUY
        .
      *-------------------------------------------------------------------------------------*
      *> cobol-lint CL002 0002-end
       0002-END.                                   EXIT.
      *-------------------------------------------------------------------------------------*

      *-------------------------------------------------------------------------------------*
      *    VALIDATE AND CALCULATION DISCOUNT
      *-------------------------------------------------------------------------------------*
       0003-CALCULATION-DISCOUNT                   SECTION.
      *-------------------------------------------------------------------------------------*

        DISPLAY 'DO YOU WANT TO GIVE A DISCOUNT? (Y) YES OU (N) NO'
        ACCEPT WRK-VALIDATE-DISCOUNT

        IF WRK-VALIDATE-DISCOUNT EQUAL 'Y'
            DISPLAY 'ENTER THE VALUE OF DISCOUNT'
            ACCEPT WRK-DISCOUNT

             COMPUTE WRK-TOTAL-FINAL =
                                       (WRK-TOTAL-BUY - WRK-DISCOUNT)

        ELSE
            MOVE WRK-TOTAL-BUY TO WRK-TOTAL-FINAL

        END-IF
        .
      *-------------------------------------------------------------------------------------*
      *> cobol-lint CL002 0003-end
       0003-END.              EXIT.
      *-------------------------------------------------------------------------------------*

      *-------------------------------------------------------------------------------------*
      *    PRINT TOTAL VALUES
      *-------------------------------------------------------------------------------------*
      *> cobol-lint CL002 0004-TOTALIZADOR
       0004-TOTALIZATION                           SECTION.
      *-------------------------------------------------------------------------------------*
           DISPLAY '**-------------------------------**'
           DISPLAY '**VALUE OF ITEM 1.......: ' WRK-VALUE-ITEM1
           DISPLAY '**VALUE OF ITEM 1.......: ' WRK-VALUE-ITEM2
           DISPLAY '**VALUE OF ITEM 1.......: ' WRK-VALUE-ITEM3
           DISPLAY '**------------------------'
           DISPLAY '**VALUE TOTAL OF BUY....: ' WRK-TOTAL-BUY
           DISPLAY '**VALUE OF DISCOUNT.....: ' WRK-DISCOUNT
           DISPLAY '**------------------------'
           DISPLAY '**VALUE TOTAL FINAL.....: ' WRK-TOTAL-FINAL
           DISPLAY '**------------------------'
           .

      *-------------------------------------------------------------------------------------*
      *> cobol-lint CL002 0004-end
       0004-END.                                 EXIT.
      *-------------------------------------------------------------------------------------*

      *-------------------------------------------------------------------------------------*
      *    FINISH THE PROGRAM
      *-------------------------------------------------------------------------------------*
      *> cobol-lint CL002 0004-TOTALIZADOR
       9999-FINISH   SECTION.
      *-------------------------------------------------------------------------------------*
           DISPLAY 'END THE PROGRAM'
           STOP RUN
           .

      *-------------------------------------------------------------------------------------*
      *> cobol-lint CL002 0004-end
       9999-END.                                EXIT.
      *-------------------------------------------------------------------------------------*
