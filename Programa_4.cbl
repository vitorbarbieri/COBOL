      $set sourceformat"free"

      *>============================================================================================
       identification division.
       program-id. Programa_4.
       author. Vitor Barbieri.

      *>============================================================================================
      *>
      *>          ------------------------------------------------------------------------
      *>                             Descrição do mês e dia da semana
      *>          ------------------------------------------------------------------------
      *>
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
           03 ws-resto                             pic 9(09)       value zeros.
           03 ws-dt-8-inv                          pic 9(08)       value zeros.
           03 ws-data.
              05 ws-data-dia                       pic 9(02)       value zeros.
              05 ws-data-mes                       pic 9(02)       value zeros.
              05 ws-data-ano                       pic 9(04)       value zeros.
           03 ws-dt-dia-mes-ano.
              05 ws-dt-dia-3                       pic 9(02)       value zeros.
              05 filler                            pic x(01).
              05 ws-dt-mes-3                       pic 9(02)       value zeros.
              05 filler                            pic x(01).
              05 ws-dt-ano-3                       pic 9(04)       value zeros.
           03 ws-data-inv.
              05 ws-data-ano-inv                   pic 9(04)       value zeros.
              05 ws-data-mes-inv                   pic 9(02)       value zeros.
              05 ws-data-dia-inv                   pic 9(02)       value zeros.

       01  ws-tabela-mes-ano.
           03 ws-mes-ano.
              05 filler                            pic x(09)       value "Janeiro".
              05 filler                            pic x(09)       value "Feveriero".
              05 filler                            pic x(09)       value "Marco".
              05 filler                            pic x(09)       value "Abril".
              05 filler                            pic x(09)       value "Maio".
              05 filler                            pic x(09)       value "Junho".
              05 filler                            pic x(09)       value "Julho".
              05 filler                            pic x(09)       value "Agosto".
              05 filler                            pic x(09)       value "Setembro".
              05 filler                            pic x(09)       value "Outubro".
              05 filler                            pic x(09)       value "Novembro".
              05 filler                            pic x(09)       value "Dezembro".
           03 ws-rmes-ano redefines ws-mes-ano.
              05 ws-campo-mes occurs 12 times.
                 07 ws-mes                         pic x(09).

       01  ws-tabela-ult-dia-mes.
           03 ws-ult-dia-meses                                     value "312831303130313130313031".
              05 ws-ult-dia                        pic 9(02)       occurs 12.

       01  ws-tabela-dia-semana.
           03 ws-dia-semana.
              05 filler                            pic x(15)       value "Segunda-Feira".
              05 filler                            pic x(15)       value "Terca-Feira".
              05 filler                            pic x(15)       value "Quarta-Feira".
              05 filler                            pic x(15)       value "Quinta-Feira".
              05 filler                            pic x(15)       value "Sexta-Feira".
              05 filler                            pic x(15)       value "Sabado".
              05 filler                            pic x(15)       value "Domingo".
           03 ws-rdia-semana redefines ws-dia-semana occurs 7.
              05 ws-dia                            pic x(15).

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
      *>   Descrição do mês
           move 10                                 to ws-data-mes

           if   ws-data-mes < 1
           or   ws-data-mes > 12
                display "Mes invalido"
           else
                display "O mes " ws-data-mes " eh: " ws-campo-mes(ws-data-mes)
           end-if

      *>   Descrição do dia da semana
           move "25/03/2023"                       to ws-dt-dia-mes-ano

           if   ws-dt-mes-3 < 1
           or   ws-dt-mes-3 > 12
                display "Mes invalido"
                exit section
           end-if
           if   ws-dt-dia-3 < 1
           or   ws-dt-dia-3 > ws-ult-dia(ws-dt-mes-3)
                display "Dia invalido"
                exit section
           end-if

           move ws-dt-dia-3                        to ws-data-dia-inv
           move ws-dt-mes-3                        to ws-data-mes-inv
           move ws-dt-ano-3                        to ws-data-ano-inv
           move ws-data-inv                        to ws-dt-8-inv

           compute ws-resto = function rem(function integer-of-date(ws-dt-8-inv), 7)

           display "O dia " ws-dt-dia-3 " eh: " ws-rdia-semana(ws-resto)
           .
       2000-exit.
           exit.

      *>============================================================================================
       3000-finalizar section.
           .
       3000-exit.
           exit.

