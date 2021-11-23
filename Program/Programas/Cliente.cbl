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
                    .combo
                    {
                        font-size: 8pt;
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
                    function ClickPaleta(paleta) {
                        switch( paleta ) {
                            case 1:
                                document.all.paletaA.className = "botPaleta";
                                document.all.telaA.style.display = "";
                                document.all.paletaB.className = "botPaletaFundo";
                                document.all.telaB.style.display = "none";
                                document.all.paletaC.className = "botPaletaFundo";
                                document.all.telaC.style.display = "none";
                                break;
                            case 2:
                                document.all.paletaA.className = "botPaletaFundo";
                                document.all.telaA.style.display = "none";
                                document.all.paletaB.className = "botPaleta";
                                document.all.telaB.style.display = "";
                                document.all.paletaC.className = "botPaletaFundo";
                                document.all.telaC.style.display = "none";
                                break;
                            case 3:
                                document.all.paletaA.className = "botPaletaFundo";
                                document.all.telaA.style.display = "none";
                                document.all.paletaB.className = "botPaletaFundo";
                                document.all.telaB.style.display = "none";
                                document.all.paletaC.className = "botPaleta";
                                document.all.telaC.style.display = "";
                                break;
                        }
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
                                                <td><button id=paletaA class="botPaleta"      tabIndex=1 onClick="ClickPaleta(1);" accessKey="I" style="width:100px;"><u>I</u>dentificação</button></td>
                                                <td><button id=paletaB class="botPaletaFundo" tabIndex=1 onClick="ClickPaleta(2);" accessKey="N" style="width:100px;">Co<u>n</u>tato</button></td>
                                                <td><button id=paletaC class="botPaletaFundo" tabindex=1 onclick="ClickPaleta(3);" accesskey="R" style="width:100px;">Ta<u>r</u>efas</button></td>
                                                <td class="Paleta" width=100%>&nbsp;</td>
                                            </tr>
                                        </table>

        <!-- TelaA - Dados Pessoais -->
                                        <div id=telaA style="display: '';">
                                            <table border=0 cellPadding=0 cellSpacing=0 width="100%">
                                                <tr>
                                                    <td width=15%>&nbsp;</td>
                                                    <td width=30%>&nbsp;</td>
                                                    <td width=5%>&nbsp;</td>
                                                    <td width=15%>&nbsp;</td>
                                                    <td width=30%>&nbsp;</td>
                                                    <td width=5%>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class=titulocampo>Código&nbsp;</td>
                                                    <td colspan = 2>
                                                        <input name=cdCliente size=5 maxlength=5 value="" class="campo" tabIndex=1>
                                                        <img title="Pesquisar Cliente" style="cursor:hand; width:16; height:16;" onClick="PesquisaCliente();" src="Icones/busca.gif" tabIndex=2>
                                                        <img title="Carregar Cliente" style="cursor:hand; width:16; height:16;" onClick="CarregarCliente();" src="Icones/check.gif" tabIndex=3>
                                                    </td>
                                                    <td class=titulocampo>
                                                        <input type="radio" name=tipoPessoa value=1 class="radio" tabIndex=4 checked>CNPJ
                                                        <input type="radio" name=tipoPessoa value=2 class="radio" tabIndex=5>CPF&nbsp;
                                                    </td>
                                                    <td colspan=2>
                                                        <input name=cpfCnpj size=15 maxlength=18 value="" class="campo" tabIndex=6>
                                                        <img title="Verificar CPF/CNPJ" style="cursor:hand; width:16; height:16;" onclick="ValidaCpfCnpj(1);" src="Icones/receita.gif" tabIndex=7>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class=titulocampo>Razão Social&nbsp;</td>
                                                    <td colspan=2><input name=razaoSocial style="width:270px;" maxlength=40 value="" class="campo" obrigatorio=1 tabIndex=7>
                                                    <td class=titulocampo>Insc. Estadual&nbsp;</td>
                                                    <td colspan=2><input name=inscEstadual size=15 maxlength=18 value="" onChange="ValidaInscEstadual();" class="campo" tabIndex=8></td>
                                                </tr>
                                                <tr>
                                                    <td class=titulocampo>Nome Fantasia&nbsp;</td>
                                                    <td colspan=2><input name=nomeFantasia style="width:270px;" maxlength=30 value="" class="campo" tabIndex=9>
                                                    <td class=titulocampo>Categoria&nbsp;</td>
                                                    <td colspan=2><select name=categoria class="combo" style="width: 183" tabIndex=10>
                                                                      <option value='0'>-- Selecionar --</option>
                                                                      <option value='1'>Mercado</option>
                                                                      <option value='2'>Padaria</option>
                                                                      <option value='3'>Mercearia</option>
                                                                      <option value='4'>Bar</option>
                                                                      <option value='5'>Night Club</option>
                                                                      <option value='6'>Tabacaria</option>
                                                                  </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan=6>
                                                        <fieldset style="margin: 15;">
                                                            <legend class=titulocampo>&nbsp;Contato&nbsp;</legend>
                                                            <table border=0 width=100% cellspacing=0 cellpadding=0 style="margin: 5px 0px 7px">
                                                                <tr>
                                                                    <td class=titulocampo style="width:95px">Contato&nbsp;</td>
                                                                    <td width=27%><input name=nmContato style="width:270px;" class="campo" tabIndex=11></td>
                                                                    <td class=titulocampo style="width:115px;">Telefone&nbsp;</td>
                                                                    <td>
                                                                        <input name=nrTelefoneDdd style="width:35px;" class="campo" tabIndex=12>
                                                                        <input name=nrTelefoneNumero style="width:80px;" class="campo" tabIndex=13>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class=titulocampo style="width:95px;">E-mail&nbsp;</td>
                                                                    <td width=27%><input name=dsEmailCli style="width:270px;" class="campo" tabIndex=14></td>
                                                                    <td class=titulocampo style="width:115px;">Celular&nbsp;</td>
                                                                    <td>
                                                                        <input name=nrTelefoneDdd style="width:35px;" class="campo" tabIndex=15>
                                                                        <input name=nrTelefoneNumero style="width:80px;" class="campo" tabIndex=16>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </fieldset>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan=6>
                                                        <fieldset style="margin-left:15; margin-right:15; margin-bottom:15;">
                                                            <legend class=titulocampo>&nbsp;Endereço&nbsp;</legend>
                                                            <table border=0 width=100% cellspacing=0 cellpadding=0 style="margin:5px 0px 7px">
                                                                <tr>
                                                                    <td class="titulocampo" style="width:90px">CEP&nbsp</td>
                                                                    <td style="width:335px">
                                                                        <input name=cep size=12 maxlength=10 value="" class="campo" tabIndex=17>
                                                                        <img title="Pesquisar CEP" style="cursor:hand; width:16; height:16;" onClick="PesquisaCEP();" src="Icones/busca.gif" tabIndex=18>
                                                                        <img title="Verificar CEP" style="cursor:hand; width:16; height:16;" onClick="VerificaCEP( 1 );" src="Icones/check.gif" tabIndex=19>
                                                                    </td>
                                                                    <td class=titulocampo width=70px>Número&nbsp;</td>
                                                                    <td><input name=numero size=12 maxlength=6 value="" class="campo" tabIndex=20></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class=titulocampo style="width:90px">Endereço&nbsp;</td>
                                                                    <td><select name=tpLogradouro style="width:115px" class="combo" tabIndex=21>
                                                                            <option value='0'>-- Selecionar --</option>
                                                                            <option value='1'>Av - Avenida</option>
                                                                            <option value='2'>Lot - Loteamento</option>
                                                                            <option value='3'>R - Rua</option>
                                                                        </select>
                                                                        <input name=logradouro style="width:220px" maxlength=30 value="" class="campo" obrigatorio=1 tabIndex=22>
                                                                    </td>
                                                                    <td class=titulocampo style="width:70px">Município&nbsp;</td>
                                                                    <td><input name=dscMunicipio style="width:208px" value="" class="campo" tabIndex=23></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class=titulocampo style="width:90px">Complemento&nbsp;</td>
                                                                    <td><select name=tpComplemento style="width:115px" class="combo" tabIndex=24>
                                                                            <option value='0'>-- Selecionar --</option>
                                                                            <option value='1'>Feira</option>
                                                                            <option value='2'>Galeria</option>
                                                                            <option value='3'>Praça</option>
                                                                            <option value='4'>Shopping</option>
                                                                        </select>
                                                                        <input name=complemento style="width:220px" maxlength=30 value="" class="campo" tabIndex=25>
                                                                    </td>
                                                                    <td class=titulocampo style="width:70px">Bairro&nbsp;</td>
                                                                    <td><input name=dscBairro style="width:208px" value="" class="campo" tabIndex=26></td>
                                                                </tr>
                                                            </table>
                                                        </fieldset>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class=titulocampo>Situação&nbsp;</td>
                                                    <td><select name=situacao class="combo" tabIndex=27 onChange="StatusSituacao();">
                                                            <option value="A">Ativo</option>
                                                            <option value="B">Bloqueado</option>
                                                            <option value="I">Inativo</option>
                                                        </select>
                                                        <input name=dataSituacao size=10 value="" class="clsDisabled" disabled>
                                                    </td>
                                                    <td class=titulocampo colspan=2>Inclusão&nbsp;</td>
                                                    <td><input name=dataInclusao size=10 value="" class="clsDisabled" disabled></td>
                                                </tr>
                                                <tr>
                                                    <td id="idMotivo" class=titulocampo></td>
                                                    <td colspan=5><select name=motivo class="combo" style="width: 110;" tabIndex=28 style="display: none;" onChange="MotivoInativacao();">
                                                            <option value='0'>-- Selecionar --</option>
                                                            <option value='1'>Inadiplente</option>
                                                            <option value='2'>Outro</option>
                                                        </select>
                                                        <input name=dsMotivo size=30 value="" class="clsDisabled" style="display: none;" tabIndex=29>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan=8>&nbsp;</td>
                                                </tr>
                                            </table>
                                        </div>

        <!-- TelaB - Contato -->
                                        <div id=telaB style="display: none;">
                                            <table border=0 cellPadding=0 cellSpacing=0 width="100%">
                                                <tr>
                                                    <td width=05%>
                                                    <td width=20%>
                                                    <td width=20%>
                                                    <td width=10%>
                                                    <td width=5%>
                                                    <td width=10%>
                                                    <td width=20%>
                                                    <td width=5%>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td class=titulocampo><div align=center>Prioridade</div></td>
                                                    <td class=titulocampo><div align=center>Telefone</div></td>
                                                    <td class=titulocampo><div align=center>Celular</div></td>
                                                    <td>&nbsp;</td>
                                                    <td class=titulocampo>E-mail&nbsp;</td>
                                                    <td>
                                                        <input name=dsEmail size=49 maxlength=40 value="" class="campo" tabindex=17>&nbsp;
                                                        <button valign=top name=BotAdic style="width:20; height:20;" tabIndex=20 onClick="AdicionaItem();" title="Adiciona E-mail">
                                                            <label>&nbsp;>&nbsp;</label>
                                                        </button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td align=center><select name=idPrioridade1 class="combo" tabindex=2>
                                                            <option value="1">Primeiro</option>
                                                            <option value="2">Segundo</option>
                                                            <option value="3">Terceiro</option>
                                                        </select>
                                                    </td>
                                                    <td colspan=2>&nbsp;
                                                        <input name=nrTelefone1Ddd style="width: 30px;" maxlength=2 value="" class="campo" tabindex=3>
                                                        <input name=nrTelefone1Numero style="width: 75px;" maxlength=10 value="" class="campo" tabindex=4>
                                                    </td>
                                                    <td align=center><input name=idTelefoneCelular1 type="checkbox" value="S" tabindex=5></td>
                                                    <td>&nbsp;</td>
                                                    <td rowspan=4 valign=top>
                                                        <select name=dsEmailLista class=combo tabIndex=19 multiple size=4 style="width:298; height=70px"></select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td align=center><select name=idPrioridade2 class="combo" tabindex=6>
                                                            <option value="1">Primeiro</option>
                                                            <option value="2">Segundo</option>
                                                            <option value="3">Terceiro</option>
                                                        </select>
                                                    </td>
                                                    <td>&nbsp;
                                                        <input name=nrTelefone2Ddd style="width: 30px;" maxlength=2 value="" class="campo" tabindex=7>
                                                        <input name=nrTelefone2Numero style="width: 75px;" maxlength=10 value="" class="campo" tabindex=8>
                                                    </td>
                                                    <td align=center><input name=idTelefoneCelular2 type="checkbox" value="S" tabindex=9></td>
                                                </tr>
                                                <tr>
                                                    <td align=center>&nbsp;</td>
                                                    <td align=center><select name=idPrioridade3 class="combo" tabindex=10>
                                                            <option value="1">Primeiro</option>
                                                            <option value="2">Segundo</option>
                                                            <option value="3">Terceiro</option>
                                                        </select>
                                                    </td>
                                                    <td>&nbsp;
                                                        <input name=nrTelefone3Ddd style="width: 30px;" maxlength=2 value="" class="campo" tabindex=11>
                                                        <input name=nrTelefone3Numero style="width: 75px;" maxlength=10 value="" class="campo" tabindex=12>
                                                    </td>
                                                    <td align=center><input name=idTelefoneCelular3 type="checkbox" value="S" tabindex=13></td>
                                                </tr>
                                                <tr>
                                                    <td colspan=2>&nbsp;</td>
                                                    <td class=titulocampo><div align=center>Inicial</div></td>
                                                    <td class=titulocampo><div align=center>Final</div></td>
                                                    <td colspan=3>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td class=titulocampo>Horário para Contato&nbsp;</td>
                                                    <td><input name=hrContatoInicial size=6 maxlength=5 class="campo" tabindex=14></td>
                                                    <td>&nbsp;<input name=hrContatoFinal size=6 maxlength=5 class="campo" tabindex=15></td>
                                                    <td colspan=3>&nbsp;</td>
                                                </tr>
                                            </table>
                                        </div>

        <!-- TelaC - Tarefas -->
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
                    function StatusSituacao() {
                        if( document.all.situacao.value == "B" || document.all.situacao.value == "I" ) {
                            document.all.idMotivo.innerHTML = "Motivo&nbsp;";
                            document.all.motivo.style.display = '';
                            document.all.dsMotivo.style.display = '';
                        }
                        else {
                            document.all.idMotivo.innerHTML = " ";
                            document.all.motivo.style.display = "none";
                            document.all.dsMotivo.style.display = "none";
                        }
                    }
                    function MotivoInativacao() {
                        if( parseInt( document.all.motivo.value, 10) == 2 ) {
                            document.all.dsMotivo.disabled = false;
                            document.all.dsMotivo.className = "campo";
                        }
                        else {
                            document.all.dsMotivo.disabled = true;
                            document.all.dsMotivo.className = "clsDisabled";
                        }
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


