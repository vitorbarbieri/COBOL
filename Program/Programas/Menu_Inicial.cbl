      $set preprocess (htmlpp) endp
      $set sourceformat"free"

      *>===================================================================================
       identification division.
       program-id. MenuInicial.
       author. Vitor Barbieri.

      *>===================================================================================

      *>
      *>            --------------------------------------------------------
      *>                                Menú Principal
      *>            --------------------------------------------------------
      *>

      *>===================================================================================
       environment division.

       input-output section.
       file-control.

      *>===================================================================================
       data division.

      *>===================================================================================
       working-storage section.
       78   espaços                                value "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".

      *>===================================================================================
       procedure division.
       0000-controle section.
       0000.
            perform 1000-inicializacao
            perform 2000-processamento
            perform 3000-finalizacao
            .

       0000-saida.
          stop run.

      *>===================================================================================
       1000-inicializacao section.
       1000.
            perform 1100-abrir-arquivos
            .

       1000-exit.
            exit.

      *>===================================================================================
       1100-abrir-arquivos section.
       1100.
            .

       1100-exit.
            exit.

      *>===================================================================================
       2000-processamento section.
       2000.
            perform 8000-tela
            .

       2000-exit.
            exit.

      *>===================================================================================
       3000-finalizacao section.
       3000.
            .

       3000-exit.
            exit.

      *>===================================================================================
       8000-style section.
       8000.
            exec html
               <style>
                  #menu-titulo {
                     background: black;
                  }
                  .titulo-principal {
                     font-size: 30px;
                  }

                  .botao-fim {
                     margin: 0 2px 0 2px;
                  }

                  .titulo-campo {
                     text-align: right;
                  }

                  .fieldset {
                     margin: 15px 0 15px 0;
                  }

                  a {
                     text-decoration: none;
                     color: black;
                     cursor: pointer;
                  }
               </style>
            end-exec
            .

       8000-exit.
            exit.

      *>===================================================================================
       8000-tela section.
       8000.
            perform 8000-scripts-tela
            perform 8000-style
            exec html
               <body bgcolor=#D3D3D3>
               <table border=0>
                  <tr>
                     <td colspan= 4 class="titulo-principal">Ideal Venda
                  <tr>
                     <td>&nbsp;
                  <tr>
                     <td colspan=2><strong>1 - Cadastramentos</strong>
                  <tr>
                     <td><a onclick="novaJanela('Cliente.exe?opcao=0','top=0, left=0, width=800, height=600');"><label>:espaços</label>1.1 - Cliente</a>
             end-exec
            .

       8000-exit.
            exit.

      *>===================================================================================
       8000-scripts-tela section.
       8000.
            exec html
                <script>
                    function novaJanela(programa, tamanho) {
                        var myWindow = window.open(programa, "", tamanho);
                        return myWindow;
                    }
                </script>
            end-exec.
            .

       8000-exit.
            exit.

      *>===================================================================================
       8000-mensagem section.
       8000.
            .

       8000-exit.
            exit.

