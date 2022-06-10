      $set sourceformat"free"

      *>============================================================================================
       identification division.
       program-id. Programa_3.
       author. Vitor Barbieri.

      *>============================================================================================
      *>
      *>          ------------------------------------------------------------------------
      *>                                 Validar placa MERCOSUL
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

       78  caracteres                              value "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".
       78  caracteres-i                            value "AAAAAAAAAAAAAAAAAAAAAAAAAA9999999999".

       01  ws-campos-trabalho.
           03 ws-placa                             pic x(07)           value spaces.

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
           move "ABC9X87"                          to ws-placa

           inspect ws-placa converting caracteres to caracteres-i

           if   ws-placa equal "AAA9A99"
                display "Placa valida"
           else
                display "Placa invalida"
           end-if
           .
       2000-exit.
           exit.

      *>============================================================================================
       3000-finalizar section.
           .
       3000-exit.
           exit.

