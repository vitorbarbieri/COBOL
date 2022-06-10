      $set sourceformat"free"

      *>============================================================================================
       identification division.
       program-id. Programa_1.
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
           03 ws-peso                              pic x(20)       value "11100908070605040302".
           03 ws-index                             pic 9(05)       value zeros.
           03 ws-resultado                         pic 9(09)       value zeros.
           03 ws-digito-verificador.
              05 ws-cpf-peso                       pic x(20)       value zero.
              05 ws-cfp-peso-r redefines ws-cpf-peso.
                 07 ws-cpf-peso-cd                 pic 9(02)       occurs 10.
              05 ws-cpf                            pic 9(11)       value zeros.
              05 ws-cpf-r redefines ws-cpf.
                 07 ws-cpf-cd                      pic 9(01)       occurs 11.
              05 ws-cpf-z.
                 07 ws-cpf-z-1                     pic 9(03)       value zeros.
                 07 filler                         pic x(01)       value ".".
                 07 ws-cpf-z-2                     pic 9(03)       value zeros.
                 07 filler                         pic x(01)       value ".".
                 07 ws-cpf-z-3                     pic 9(03)       value zeros.
                 07 filler                         pic x(01)       value "-".
                 07 ws-cpf-z-4                     pic 9(02)       value zeros.
              05 ws-cpf-soma-1                     pic 9(05)       value zeros.
              05 ws-cpf-soma-2                     pic 9(05)       value zeros.
              05 ws-cpf-dv-1                       pic 9(03)       value zeros.
              05 ws-cpf-dv-2                       pic 9(03)       value zeros.
              05 ws-dv-cpf                         pic 9(02)       value zeros.

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
           move 1                                  to ws-index
           move 123456789                          to ws-cpf(1:9)
           move ws-peso                            to ws-cpf-peso

      *>   Calcular o primeiro digito verificador
           perform varying ws-index from 1 by 1 until ws-index > 9
               compute ws-resultado = ws-cpf-cd(ws-index) * ws-cpf-peso-cd(ws-index + 1)
               add ws-resultado                    to ws-cpf-soma-1
           end-perform
           divide ws-cpf-soma-1 by 11 giving ws-resultado remainder ws-cpf-dv-1
           compute ws-cpf-dv-1 = 11 - ws-cpf-dv-1
           if   ws-cpf-dv-1 > 9
                move zeros                         to ws-cpf-dv-1
           end-if
           move ws-cpf-dv-1(3:1)                   to ws-cpf(10:1)

      *>   Calcular o segundo digito verificador
           perform varying ws-index from 1 by 1 until ws-index > 10
               compute ws-resultado = ws-cpf-cd(ws-index) * ws-cpf-peso-cd(ws-index)
               add ws-resultado                    to ws-cpf-soma-2
           end-perform
           divide ws-cpf-soma-2 by 11 giving ws-resultado remainder ws-cpf-dv-2
           compute ws-cpf-dv-2 = 11 - ws-cpf-dv-2
           if   ws-cpf-dv-2 > 9
                move zeros                         to ws-cpf-dv-2
           end-if
           move ws-cpf-dv-2(3:1)                   to ws-cpf(11:1)

           move ws-cpf(1:3)                        to ws-cpf-z-1
           move ws-cpf(4:3)                        to ws-cpf-z-2
           move ws-cpf(7:3)                        to ws-cpf-z-3
           move ws-cpf(10:2)                       to ws-cpf-z-4

           display "O CPF completo = " ws-cpf-z
           .
       2000-exit.
           exit.

      *>============================================================================================
       3000-finalizar section.
           .
       3000-exit.
           exit.

