      $set sourceformat"free"

      *>============================================================================================
       identification division.
       program-id. Programa_2.
       author. Vitor Barbieri.

      *>============================================================================================
       environment division.

      *>============================================================================================
       configuration section.
       special-names.
           decimal-point is comma.

      *>============================================================================================
       input-output section.
       file-control.

      *>============================================================================================
       data division.

      *>============================================================================================
       working-storage section.

       78  versao                                  value "a".

       01  ws-campos-trabalho.
           03 ws-resultado                         pic 9(09)       value zeros.
           03 ws-resto                             pic 9(09)       value zeros.
           03 ws-ultimo-dia                        pic 9(02)       value zeros.
           03 ws-dt-mes-ano.
              05 ws-dt-mes-2                       pic 9(02)       value zeros.
              05 filler                            pic x(01).
              05 ws-dt-ano-2                       pic 9(04)       value zeros.
           03 ws-data.
              05 ws-data-dia                       pic 9(02)       value zeros.
              05 filler                            pic x(01)       value "/".
              05 ws-data-mes                       pic 9(02)       value zeros.
              05 filler                            pic x(01)       value "/".
              05 ws-data-ano                       pic 9(04)       value zeros.
           03 ws-id-bissexto                       pic x(01)       value space.
              88 ws-bissexto                                       value "S".
              88 ws-nao-bissexto                                   value "N".
           01 ws-tabela-ult-dia-mes.
              03 ws-ult-dia-meses                                  value "312831303130313130313031".
                 05 ws-ult-dia                     pic 9(02)       occurs 12.


      *>============================================================================================
       procedure division.

      *>============================================================================================
       0000-controle section.
           perform 1000-iniciar
           perform 2000-processar
           perform 3000-finalizar
           .
       0000-saida.
           stop run.

      *>============================================================================================
       1000-iniciar section.
           .
       1000-exit.
           exit.

      *>============================================================================================
       2000-processar section.
           move "05/2022"                          to ws-dt-mes-ano

           if   ws-dt-mes-2 < 1
           or   ws-dt-mes-2 > 12
                display "Mes invalido"
                exit section
           end-if

           divide ws-dt-ano-2 by 4 giving ws-resultado remainder ws-resto
           if   ws-resto = 0
                divide ws-dt-ano-2 by 100 giving ws-resultado remainder ws-resto
                if   ws-resto = 0
                     divide ws-dt-ano-2 by 400 giving ws-resultado remainder ws-resto
                     if   ws-resto = 0
                          move 29                  to ws-ultimo-dia
                          set ws-bissexto          to true
                     else
                          move 28                  to ws-ultimo-dia
                          set ws-nao-bissexto      to true
                     end-if
                else
                     move 29                       to ws-ultimo-dia
                     set ws-bissexto               to true
                end-if
           else
                move 28                            to ws-ultimo-dia
                set ws-nao-bissexto                to true
           end-if

           if   ws-dt-mes-2 equal 2 *> Somente altera o último dia se for Fevereiro.
                move ws-ultimo-dia                 to ws-ult-dia(ws-dt-mes-2)
           end-if

           move ws-ult-dia(ws-dt-mes-2)            to ws-data-dia
           move ws-dt-mes-2                        to ws-data-mes
           move ws-dt-ano-2                        to ws-data-ano

           display "Ultimo dia do mes: " ws-data
           if   ws-bissexto
                display "O ano de " ws-data-ano " eh Bissexto"
           else
                display "O ano de " ws-data-ano " nao eh Bissexto"
           end-if
           .
       2000-exit.
           exit.

      *>============================================================================================
       3000-finalizar section.
           .
       3000-exit.
           exit.

