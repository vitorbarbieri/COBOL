      $set sourceformat"free"

      *>============================================================================================
       identification division.
       program-id. Programa_4.
       author. Vitor Barbieri.

      *>============================================================================================
      *>
      *>          ------------------------------------------------------------------------
      *>                                    Comando UNSTRING
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
           03 ws-texto                             pic x(100)      value spaces.
           03 ws-texto-1                           pic x(20)       value spaces.
           03 ws-texto-2                           pic x(20)       value spaces.
           03 ws-texto-3                           pic x(20)       value spaces.
           03 ws-texto-4                           pic x(20)       value spaces.
           03 ws-texto-5                           pic x(20)       value spaces.
           03 ws-contador                          pic 9(10)       value zeros.
           03 ws-contador-1                        pic 9(10)       value zeros.
           03 ws-contador-2                        pic 9(10)       value zeros.
           03 ws-contador-3                        pic 9(10)       value zeros.
           03 ws-contador-4                        pic 9(10)       value zeros.
           03 ws-contador-5                        pic 9(10)       value zeros.
           03 ws-delimitador-1                     pic x(03)       value spaces.
           03 ws-delimitador-2                     pic x(03)       value spaces.
           03 ws-delimitador-3                     pic x(03)       value spaces.
           03 ws-delimitador-4                     pic x(03)       value spaces.
           03 ws-delimitador-5                     pic x(03)       value spaces.
           03 ws-ponteiro                          pic 9(10)       value zeros.

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
           move "Joao Pereira da Silva"            to ws-texto
           unstring ws-texto delimited by " " into ws-texto-1 *> ws-texto-1 = Joao
                                                   ws-texto-2 *> ws-texto-2 = Pereira
                                                   ws-texto-3 *> ws-texto-3 = da
                                                   ws-texto-4 *> ws-texto-4 = Silva

           initialize                              ws-campos-trabalho
           move "Joao/Pereira/Sao Paulo/SP"        to ws-texto
           unstring ws-texto delimited by "/" into ws-texto-1 *> ws-texto-1 = Joao
                                                   ws-texto-2 *> ws-texto-2 = Pereira
                                                   ws-texto-3 *> ws-texto-3 = Sao Paulo
                                                   ws-texto-4 *> ws-texto-4 = SP

           initialize                              ws-campos-trabalho
           move "AB*CDJKL*MNS*TUV"                 to ws-texto
           unstring ws-texto delimited by "*" into ws-texto-1 *> ws-texto-1 = AB
                                                   ws-texto-2 *> ws-texto-2 = CDJKL
                                                   ws-texto-3 *> ws-texto-3 = MNS
                                                   ws-texto-4 *> ws-texto-4 = TUV

           initialize                              ws-campos-trabalho
           move "AB*CDJKL*MNS*TUV"                 to ws-texto
           unstring ws-texto delimited by "*" into ws-texto-1 count in ws-contador-1 *> ws-texto-1 = AB        ws-contador-1 = 2
                                                   ws-texto-2 count in ws-contador-2 *> ws-texto-2 = CDJKL     ws-contador-2 = 5
                                                   ws-texto-3 count in ws-contador-3 *> ws-texto-3 = MNS       ws-contador-3 = 3
                                                   ws-texto-4 count in ws-contador-4 *> ws-texto-4 = TUV       ws-contador-4 = 87 (conta os espaços em brancos finais)
           end-unstring

           initialize                              ws-campos-trabalho
           move 1                                  to ws-ponteiro
           move "AB*CDJKL*MNS*TUV"                 to ws-texto
           unstring ws-texto delimited by "*" into ws-texto-1 count in ws-contador-1 *> ws-texto-1 = AB        ws-contador-1 = 2
                                                   ws-texto-2 count in ws-contador-2 *> ws-texto-2 = CDJKL     ws-contador-2 = 5
                                                   ws-texto-3 count in ws-contador-3 *> ws-texto-3 = MNS       ws-contador-3 = 3
                                                   ws-texto-4 count in ws-contador-4 *> ws-texto-4 = TUV       ws-contador-4 = 87 (conta os espaços em brancos finais = 3 + 84)
                                      with pointer ws-ponteiro *> ws-ponteiro = 101 (conta os espaços em brancos finais = 16 + 85)
                                       tallying in ws-contador *> ws-contador-1 = 4

           initialize                              ws-campos-trabalho
           move "XYZ/ABC*DEF"                      to ws-texto
           unstring ws-texto delimited by "/" or "*" into ws-texto-1 delimiter in ws-delimitador-1 *> ws-texto-1 = XYZ     ws-delimitador-1 = /
                                                          ws-texto-2 delimiter in ws-delimitador-2 *> ws-texto-2 = ABC     ws-delimitador-2 = *

           initialize                              ws-campos-trabalho
           move "XYZ/ABC*DEF"                      to ws-texto
           unstring ws-texto delimited by "/" or "*" into ws-texto-1 delimiter in ws-delimitador-1 *> ws-texto-1 = XYZ     ws-delimitador-1 = /

           initialize                              ws-campos-trabalho
           move "JKLMN****STUV"                    to ws-texto
           unstring ws-texto delimited by all "*" into ws-texto-1 *> ws-texto-1 = JKLMN
                                                       ws-texto-2 *> ws-texto-2 = STUV
           .
       2000-exit.
           exit.

      *>============================================================================================
       3000-finalizar section.
           .
       3000-exit.
           exit.

