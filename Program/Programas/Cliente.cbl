      $set preprocess (htmlpp) endp webserver(isapi) case reentrant(2)
      $set sourceformat"free"

      *>===================================================================================
       identification division.
       program-id. Cliente.
       author. Vitor Barbieri.

      *>===================================================================================

      *>
      *>            --------------------------------------------------------
      *>                                    Cliente
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
       78  tabela-padrao                           value "border=1 cellspacing=1 cellpadding=0 bordercolor=White bordercolordark=White bordercolorlight=DimGray class=WindowScreen".

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
            perform 8000-cabecalho-padrao
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
       8000-cabecalho-padrao section.
       8000.
            exec html
                <html>
                <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
                <head>
                    <title>Cliente</title>
                </head>
            end-exec
            .
       8000-exit.
            exit.

      *>===================================================================================
       8000-classes-paleta section.
       8000.
            exec html
               <style>
                   .paleta
                   {
                       background-color: #999999;
                       border-top: 1px solid #d4d0c8;
                       border-left: 1px solid #d4d0c8;
                       border-right: 1px solid #FFFFFF;
                       border-bottom: 1px solid #FFFFFF;
                   }
                   .botPaleta
                   {
                       background-color: #d4d0c8;
                       font-weight: 'bold';
                       color: black;
                       cursor: hand;
                       height: 25px;
                       font-size: 11px;
                       border: 0;
                       border-top: 1px solid #d4d0c8;
                       border-left: 1px solid #d4d0c8;
                       border-right: 1px solid #000000;
                       border-bottom: 1px solid #d4d0c8;
                   }
                   .botPaletaFundo
                   {
                       background-color: #999999;
                       font-weight: 'bold';
                       color: black;
                       cursor: hand;
                       height: 25px;
                       font-size: 11px;
                       border-top: 1px solid #d4d0c8;
                       border-left: 1px solid #d4d0c8;
                       border-right: 1px solid #FFFFFF;
                       border-bottom: 1px solid #FFFFFF;
                   }
                   .botpaletaDesabilitada
                   {
                       background-color: #999999;
                       font-weight: 'bold';
                       color: #444444;
                       height: 25px;
                       font-size: 11px;
                       border-top: 1px solid #d4d0c8;
                       border-left: 1px solid #d4d0c8;
                       border-right: 1px solid #FFFFFF;
                       border-bottom: 1px solid #FFFFFF;
                   }
               </style>
            end-exec
            .
       8000-exit.
            exit.

      *>===================================================================================
       8000-style section.
       8000.
            exec html
                <style>
                    input
                    {
                        font-size: 8pt;
                        color: black;
                        font-family: Arial;
                    }
                    img
                    {

                    }
                    .campo
                    {
                        BACKGROUND-COLOR: white
                    }
                    .clsDisabled
                    {
                        background-color: #e6e6e6
                    }
                    .tituloCampo
                    {
                        font-weight: bolder;
                        font-size: 8pt;
                        color: navy;
                        font-family: arial;
                        text-align: right
                    }
                    .windowScreen
                    {
                        background-color: #d4d0c8
                    }
                </style>
            end-exec
            .
       8000-exit.
            exit.

      *>===================================================================================
       8000-script-paleta section.
       8000.
            exec html
                <script>
                    function ClickPaletaA() {
                        document.all.paletaA.className = "botPaleta";
                        document.all.telaA.style.display = "";
                        document.all.paletaB.className = "botPaletaFundo";
                        document.all.telaB.style.display = "none";
                        document.all.paletaC.className = "botPaletaFundo";
                        document.all.telaC.style.display = "none";
                    }

                    function ClickPaletaB() {
                        document.all.paletaA.className = "botPaletaFundo";
                        document.all.telaA.style.display = "none";
                        document.all.paletaB.className = "botPaleta";
                        document.all.telaB.style.display = "";
                        document.all.paletaC.className = "botPaletaFundo";
                        document.all.telaC.style.display = "none";
                    }

                    function ClickPaletaC() {
                        document.all.paletaA.className = "botPaletaFundo";
                        document.all.telaA.style.display = "none";
                        document.all.paletaB.className = "botPaletaFundo";
                        document.all.telaB.style.display = "none";
                        document.all.paletaC.className = "botPaleta";
                        document.all.telaC.style.display = "";
                    }
                </script>
            end-exec
            .
       8000-exit.
            exit.

      *>===================================================================================
       8000-tela section.
       8000.
            perform 8000-classes-paleta
            perform 8000-script-paleta
            perform 8000-scripts-tela
            perform 8000-style
            exec html
                <body bgcolor=#D3D3D3>
                <table width=100%>
                    <tr>
                        <td>
                            <table rules=none width=100% :tabela-padrao id=telaItens>
                                <tr>
                                    <td>
                                        <table border=0 cellPadding=0 cellSpacing=0 width="100%">
                                            <tr>
                                                <td>
                                                    <button id=paletaA class="botPaleta"      tabIndex=1 onClick="ClickPaletaA();" accessKey="P" style="width:120px;">Dados <u>P</u>essoais</button></td>
                                                <td>
                                                    <button id=paletaB class="botPaletaFundo" tabIndex=1 onClick="ClickPaletaB();" accessKey="R" style="width:130px;">Dados P<u>r</u>ofissionais</button></td>
                                                <td>
                                                    <button id=paletaC class="botPaletaFundo" tabindex=1 onclick="ClickPaletaC();" accesskey="U" style="width:130px;">Dados Ed<u>u</u>cacionais</button></td>
                                                <td class="Paleta" width=100%>&nbsp;</td>
                                            </tr>
                                        </table>

        <!-- TelaA - Dados Pessoais -->
                                        <div id=telaA style="display:'';">
                                            <table border=0 cellPadding=0 cellSpacing=0 width="100%">
                                                <tr>
                                                    <td width=14%>&nbsp;</td>
                                                    <td width=20%>&nbsp;</td>
                                                    <td width=4%>&nbsp;</td>
                                                    <td width=14%>&nbsp;</td>
                                                    <td width=20%>&nbsp;</td>
                                                    <td width=5%>&nbsp;</td>
                                                    <td width=8%>&nbsp;</td>
                                                    <td width=15%>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class=titulocampo>
                                                        Código&nbsp;
                                                    </td>
                                                    <td colspan = 2>
                                                        <input name=cdCliente size=5 maxlength=5 value="" class="campo" tabindex=1>
                                                        <img title="Pesquisar Cliente" style="cursor:hand;" onClick="PesquisaCliente();" src="Icones/busca.gif" tabindex=2>
                                                        <img title="Carregar Cliente" style="cursor:hand;" onClick="CarregarCliente();" src="Icones/check.gif" tabindex=3>
                                                    </td>
                                                    <td class=titulocampo>
                                                        <input type="radio" name=tipoPessoa value=1 class="radio" tabindex=4 checked>CNPJ
                                                        <input type="radio" name=tipoPessoa value=2 class="radio" tabindex=5>CPF&nbsp;
                                                    </td>
                                                    <td colspan=2>
                                                        <input name=cpfCnpj size=15 maxlength=18 value="" class="campo" tabindex=6>
                                                        <img title="Verificar CPF/CNPJ" style="cursor:hand;" onclick="ValidaCpfCnpj(1);" src="Icones/receita.gif" tabIndex=7>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class=titulocampo>
                                                        Insc. Estadual&nbsp;
                                                    </td>
                                                    <td colspan=2>
                                                        <input name=inscEstadual size=15 maxlength=18 value="" onChange="ValidaInscEstadual();" class="campo" tabIndex=8>
                                                    </td>
                                                    <td class=titulocampo>Categoria&nbsp;
                                                    <td colspan=2><select name=categoria class="combo" style="width: 183" tabindex=9>
                                                                      <option value='0'>-- Selecionar --</option>
                                                                      <option value='1'>Mercado</option>
                                                                      <option value='1'>Padaria</option>
                                                                      <option value='1'>Mercearia</option>
                                                                      <option value='1'>Bar</option>
                                                                      <option value='1'>Night Club</option>
                                                                      <option value='1'>Tabacaria</option>
                                                                  </select>
                                                </tr>
                                                <tr>
                                                    <td class=titulocampo>
                                                        Razão Social&nbsp;
                                                    </td>
                                                    <td colspan=2>
                                                        <input name=inscEstadual size=15 maxlength=18 value="" onChange="ValidaInscEstadual();" class="campo" tabIndex=8>
                                                    </td>
                                                    <td class=titulocampo>
                                                        Nome Fantasia&nbsp;
                                                    </td>
                                                    <td colspan=2>
                                                        <input name=inscEstadual size=15 maxlength=18 value="" onChange="ValidaInscEstadual();" class="campo" tabIndex=8>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan=8>&nbsp;</td>
                                                </tr>
                                            </table>
                                        </div>

        <!-- TelaB - Dados Profissionais -->
                                        <div id=telaB style="display: none;">
                                            <table rules=none border=0 width=100% :tabela-padrao>

                                            </table>
                                        </div>

        <!-- TelaC - Dados Educacionais -->
                                        <div id=telaC style="display: none;">
                                            <table border=0 cellPadding=0 cellSpacing=0 width="100%">

                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table border=0 width="100%">
                    <tr>
                        <td align=right>
                            <button class=botao AccessKEY="N" name=BotNovo    onclick='Novo();'               style="width:70px;" tabindex=100><label>&nbsp;<U>N</U>ovo&nbsp;   </label></button>&nbsp;
                            <button class=botao AccessKEY="X" name=BotExcluir onclick='Excluir();'   disabled style="width:70px;" tabindex=101><label>&nbsp;E<U>x</U>cluir&nbsp;</label></button>&nbsp;
                            <button class=botao AccessKEY="S" name=BotSalvar  onclick='TelSalvar();'          style="width:70px;" tabindex=102><label>&nbsp;<U>S</U>alvar&nbsp; </label></button>&nbsp;
                    </tr>
                </table>
            end-exec
            .
       8000-exit.
            exit.

      *>===================================================================================
       8000-scripts-tela section.
       8000.
            exec html
                <script>
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


