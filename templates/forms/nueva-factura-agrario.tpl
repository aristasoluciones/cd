<div id="divForm">
	<form id="nuevaFactura" name="nuevaFactura" method="post">
        <input type="hidden" id="calle" name="calle" value="" />
        <input type="hidden" id="pais" name="pais" value="" />
        <input type="hidden" id="userId" name="userId" value="" />
        <input type="hidden" id="fromAgrario" name="fromAgrario" value="Si" />
        <input type="hidden" id="ticketChain" name="ticketChain" value="{$ticketChain}" />
        {if isset($notaVentaId)}
        	<input type="hidden" id="notaVentaId" name="notaVentaId" value="{$notaVentaId}" />
        {/if}
    <fieldset>
{if $version == "auto" && ($info.usuarioId == 272 || $info.empresaId == 165 || $info.empresaId == 180)}  
				<div>
        	Sobreescribir Fecha y Folio
        </div>
        <div class="formLine" style="text-align:left;">
        <div style="width:90px;float:left">Fecha:</div> 
        <div style="width:40px;float:left">D&iacute;a:</div> 
        <div style="width:60px;float:left"><input name="fechaSobreDia" id="fechaSobreDia" type="text" value="{$post.rfc}" size="2" class="largeInput" placeholder="dd" maxlength="2"/> 
        </div>

        <div style="width:40px;float:left">Mes:</div> 
        <div style="width:60px;float:left"><input name="fechaSobreMes" id="fechaSobreMes" type="text" value="{$post.rfc}" size="2" class="largeInput" placeholder="mm" maxlength="2"/> 
        </div>

        <div style="width:40px;float:left">A&ntilde;o:</div> 
        <div style="width:80px;float:left"><input name="fechaSobreAnio" id="fechaSobreAnio" type="text" value="{$post.rfc}" size="4" class="largeInput" placeholder="aaaa" maxlength="4"/> 
        </div>
        <div style="width:90px;float:left">Folio:</div> 
        <div style="width:172px;float:left">
        <input name="folioSobre" id="folioSobre" type="text" value="{$post.rfc}" size="20" class="largeInput"/>
        </div>
        <div style="clear:both"></div>
        <br />
				</div>        
{/if}    
				<div>
        	<span id="loadingDivDatosFactura"></span>
        </div>
        <div class="formLine" style="text-align:left;">
        <div style="width:90px;float:left">B&uacute;sca RFC o Raz&oacute;n Social:</div> 
        <div style="width:202px;float:left"><input name="rfc" id="rfc" type="text" value="{$post.rfc}" size="20" class="largeInput" autocomplete="off"/>
        <div style="position:relative">
         		<div style="display:none;position:absolute;top:-2px; left:2px; z-index:100" id="suggestionDiv">
        	 	</div>
         </div>
        </div>
        <div style="width:90px;float:left">Raz&oacute;n Social:</div>
        <div style="width:310px;float:left">
        <textarea name="razonSocial" id="razonSocial" disabled="disabled" style="background-color:#eee; overflow:auto;" cols="63" rows="5">{$post.razonSocial}&#10;{$post.calle} {$post.noExt}</textarea>
        </div>
       	<div style="clear:both"></div>
       
      </div>

      <div class="formLine">
          <div style="width:90px;float:left">M&eacute;todo de Pago:(*)</div> 
          <div style="width:200px;float:left"><select name="metodoDePago" id="metodoDePago" class="largeInput">
                  <option value="01">Efectivo</option>
                  <option value="02">Cheque</option>
                  <option value="03">Transferencia</option>
                  <option value="04">Tarjetas de Credito</option>
                  <option value="05">Monederos electrónicos</option>
                  <option value="06">Dinero electrónico</option>
                  <option value="08">Vales de despensa</option>
                  <option value="28">Tarjeta de Debito</option>
                  <option value="29">Tarjeta de Servicio</option>
                  <option value="99">Otros</option>
                  <option value="NA" selected="selected">NA</option>

              </select></div>

          <div style="width:90px;float:left">N&uacute;mero de Cuenta:</div> 
          <div style="width:100px;float:left"><input name="NumCtaPago" id="NumCtaPago" type="text" value=""  size="4" maxlength="4" class="largeInput"/></div>

          <div style="width:250px;float:left; cursor:pointer" onclick="ToggleDiv('facturaOpciones')">[+] Mostrar m&aacute;s Opciones Generales</div> 

      		<div style="clear:both"></div>
        </div>  

			<div id="facturaOpciones" style="display:none">
        <div class="formLine">
            <div style="width:90px;float:left">% de IVA:</div> 
            <div style="width:120px;float:left">
             <select name="tasaIva" id="tasaIva" class="largeInput" style="width:100px">
            {foreach from=$ivas item=iva}
            <option value="0" selected="selected">0</option>
            {/foreach}
            </select></div>
  
            <div style="width:90px;float:left">Tipo de Moneda:</div>
            <div style="width:120px;float:left">
             <select name="tiposDeMoneda" id="tiposDeMoneda"  class="largeInput" style="width:100px">
            {foreach from=$tiposDeMoneda item=moneda}
            <option value="{$moneda.tipo}">{$moneda.moneda}</option>
            {/foreach}
            </select></div>
            
            <div style="width:90px;float:left">Tipo de Cambio:</div>
            <div style="width:165px;float:left"><input name="tipoDeCambio" id="tipoDeCambio" type="text" value="{$post.tipoDeCambio}" maxlength="5"  class="largeInput" style="width:140px"/></div>
  
            <div style="width:85px;float:left">% de Descuento:</div> 
            <div style="width:135px;float:left"><input name="porcentajeDescuento" id="porcentajeDescuento" type="text" value="{$post.porcentajeDescuento}" maxlength="3"  class="largeInput"  style="width:140px"/></div>
            
            <div style="clear:both"></div>
          </div>  
  
        <div class="formLine">
            <div style="width:90px;float:left">Forma de Pago:</div> 
            <div style="width:320px;float:left"><input name="formaDePago" id="formaDePago" type="text" value="Pago en Una Sola Exhibicion" class="largeInput" style="width:295px"/></div>
            <div style="width:100px;float:left">Condiciones de Pago:</div> 
            <div style="width:390px;float:left"><input name="condicionesDePago" id="condicionesDePago" type="text" value="{$post.condicionesDePago}" class="largeInput" style="width:390px"/></div>
            <div style="clear:both"></div>
          </div>  
          
  
        <div class="formLine">
            <div style="width:90px;float:left">% Retenci&oacute;n Iva:</div> 
            <div style="width:135px;float:left">
            <select name="porcentajeRetIva" id="porcentajeRetIva"  class="largeInput">
            {foreach from=$retIvas item=iva}
            <option value="{$iva}">{$iva}</option> <br />
            {/foreach}
            </select>
            </div>
            <div style="width:90px;float:left">% Retenci&oacute;n ISR:</div> 
            <div style="width:135px;float:left">
            <select name="porcentajeRetIsr" id="porcentajeRetIsr"  class="largeInput">
            {foreach from=$retIsrs item=isr}
            <option value="{$isr}">{$isr}</option> <br />
            {/foreach}
            </select></div>
            
            <div style="width:62px;float:left">% IEPS:</div> 
            <div style="width:126px;float:left"><input name="porcentajeIEPS" id="porcentajeIEPS" type="text" value="{$post.porcentajeIEPS}" size="12"  class="largeInput"  onblur="UpdateIepsConcepto()"/></div>
  
            <div style="width:90px;float:left">Sucursal:</div>
            <div style="width:155px;float:left">
            <select name="sucursalId" id="sucursalId"  class="largeInput" style="width:185px">
            {foreach from=$sucursales item=sucursal}
            <option value="{$sucursal.sucursalId}">{$sucursal.identificador}</option>
            {/foreach}
            </select></div>
  
            <div style="clear:both"></div>
          </div>  
			</div>
      
      <div class="formLine">
          <div style="width:90px;float:left">Seleccionar Serie:</div> 
          <div style="width:340px;float:left">
          <select name="tiposComprobanteId" id="tiposComprobanteId"  class="largeInput" style="width:315px">
         	{foreach from=$comprobantes item=comprobante}
          <option value="{$comprobante.tiposComprobanteId}-{$comprobante.serieId}">{$comprobante.nombre} - {$comprobante.serie}{$comprobante.consecutivo}</option>
          {/foreach}
          </select></div>
          
        <div style="width:190px;float:left">Generar Cuenta por Pagar?:</div> 
        <div style="width:40px;float:left">
        	<input checked="checked" name="cuentaPorPagar" id="cuentaPorPagar" type="checkbox" value="yes" class="largeInput"/>
		</div>
        <div style="width:90px;float:left"><label for="cuentaPorPagar">Si</label></div>
				{if $info.empresaId == 249}
        <div style="width:50px;float:left">Formato normal?:</div> 
        <div style="width:40px;float:left">
        	<input name="formatoNormal" id="formatoNormal" type="checkbox" value="1" class="largeInput"/>
			</div>
    		{/if}

      		<div style="clear:both"></div>
        </div>
        
        {if $info.empresaId == 113}
        <div class="formLine">
        	<div style="width:90px;float:left">Tiempo Limite:</div> 
          	<div style="width:135px;float:left">
            <input name="tiempoLimite" id="tiempoLimite" type="text" value="" size="18"  class="largeInput"/>
            </div>
        </div>
        {/if}

{if $version == "auto" && ($info.empresaId == 39 || $info.empresaId == 180)}  
      <div class="formLine">
          <div style="width:90px;float:left">% ISH:</div> 
          <div style="width:126px;float:left"><input name="porcentajeISH" id="porcentajeISH" type="text" value="2"  size="12"  class="largeInput"/></div>
      		<div style="clear:both"></div>
        </div>  
{/if}
     <div class="formLine">
 					<hr />   
        </div>  

<span id="loadingDivConcepto"></span>
      <div class="formLine">
          <div style="width:60px;float:left">Cantidad:</div> 
          <div style="width:80px;float:left">No. Ident:</div> 
          <div style="width:80px;float:left">Unidad:</div>
          <div style="width:80px;float:left">V.U S/IVA:</div>
          <div style="width:80px;float:left">V.U C/IVA:</div>
          <div style="width:100px;float:left">Exento Iva:</div>
          <div style="width:80px;float:left">% IEPS:</div>
          <div style="width:80px;float:left">Tipo Ganado:</div>
          <div style="width:80px;float:left">Peso:</div>
      		<div style="clear:both"></div>
        </div>  
	</form>

      <form id="conceptoForm" name="conceptoForm">
            <input type="hidden" id="type" name="type" value="agregarConcepto" />
            <input type="hidden" id="fromAgrario" name="fromAgrario" value="Si" />

      <div class="formLine">
          <div style="width:80px;float:left">
            <input name="peso" id="peso" type="text" value="{$post.cantidad}"  size="6" class="largeInput"  placeholder="Cantidad"/>
          </div>
          <div style="width:80px;float:left">
          <input name="noIdentificacion" id="noIdentificacion" type="text" value="{$post.noIdentificacion}"  size="6"  class="largeInput" placeholder="# Id"/>
          <div style="position:relative">
         		<div style="display:none;position:absolute;top:-2px; left:2px; z-index:100" id="suggestionProductDiv">
        	 	</div>
         </div>
          </div>
          <div style="width:80px;float:left">
          <input name="unidad" id="unidad" type="text" value="{$post.unidad}"  size="6" class="largeInput"  placeholder="Unidad"/></div>
          <div style="width:80px;float:left">
          <input name="valorUnitario" id="valorUnitario" type="text" value="{$post.valorUnitario}"  size="6" class="largeInput"  placeholder="Valor S/I"  onblur="UpdateValorUnitarioConIva()"/></div>
          <div style="width:80px;float:left">
          <input name="valorUnitarioCI" id="valorUnitarioCI" type="text" value="{$post.valorUnitarioCI}"  size="8" class="largeInput"  placeholder="Valor C/I" onblur="UpdateValorUnitarioSinIva()"/></div>
          <div style="width:100px;float:left">
          <select name="excentoIva" id="excentoIva" class="largeInput" style="width:80px">
         	{foreach from=$excentoIva item=iva}
          	<option value="no">No</option>
          	<option value="si" selected="selected">Si</option>
          {/foreach}
          </select></div>
          <div style="width:80px;float:left">
            <input name="iepsConcepto" id="iepsConcepto" type="text" value="{$post.ieps}"  size="6" class="largeInput"  placeholder="% IEPS"/>
          </div>

          <div style="width:80px;float:left">
            <input name="tipoGanado" id="tipoGanado" type="text" value="{$post.tipoGanado}"  size="6" class="largeInput"  placeholder="Tipo"/>
          </div>

          <div style="width:60px;float:left">
          <input name="cantidad" id="cantidad" type="text" value="{$post.peso}"  size="3" class="largeInput" placeholder="Peso"/></div>

          
          <div style="width:132px;float:left; cursor:pointer" id="agregarConceptoDiv" class="button"><span>Agregar</span></div>
      		<div style="clear:both"></div>
        </div>  
      <div class="formLine">
          <div style="width:30%;float:left">
          <textarea placeholder="Escribe tu concepto aqui" name="descripcion" id="descripcion" cols="33" rows="5" class="largeInput wide">{$post.descripcion}</textarea>
</div>
      		<div style="clear:both"></div>
 					<hr />   
        </div>  
      {if $info.empresaId == 86}  
      <div class="formLine">
          <div style="width:30%;float:left">
          Categoria: <input name="categoriaConcepto" id="categoriaConcepto" type="text" value="{$post.categoriaConcepto}"  size="100" class="largeInput"  placeholder="Categoria: Cambiar Si desea Crear una nueva categoria de Concepto."/>
</div>
      		<div style="clear:both"></div>
 					<hr />   
        </div>
      {/if}    
			</form>
      <b>Conceptos Cargados:</b>
			<div id="conceptos">
            {if $conceptos|count > 0}
            	{include file="{$DOC_ROOT}/templates/lists/conceptos.tpl"}
            {else}
				Ninguno (Has click en Agregar para agregar un concepto)
			{/if}
      		</div>
      <br /><br />     


     <div class="formLine">
          <div>Observaciones</div> 
          <div><textarea placeholder="Observaciones" name="observaciones" cols="33" rows="5" id="observaciones" class="largeInput wide"></textarea></div>
 					<hr />   
  		</div>      

     <div class="formLine">
          <div>Campos Agrarios</div> 
  		</div>      
      
      <div class="formLine">
          <div style="width:90px;float:left"># Registro:</div> 
          <div style="width:110px;float:left">
         <input type="text" id="idPedido" name="idPedido"  class="largeInput" style="width:90px" /></div>
          
          <div style="width:90px;float:left"># Gu&iacute;a Traslado:</div> 
          <div style="width:110px;float:left">
         <input type="text" id="idSolicitudDePago" name="idSolicitudDePago"  class="largeInput" style="width:90px" /></div>

          <div style="width:90px;float:left">Upp Origen:</div> 
          <div style="width:110px;float:left">
         <input type="text" id="referencia" name="referencia"  class="largeInput" style="width:90px" /></div>
         
          <div style="width:90px;float:left">Patente Vendedor:</div> 
          <div style="width:110px;float:left">
         <input type="text" id="idProveedor" name="idProveedor"  class="largeInput" style="width:90px" /></div>
         
        <div style="clear:both"></div>
        </div>
      <div class="formLine">
          <div style="width:90px;float:left">Finalidad del Ganado:</div> 
          <div style="width:110px;float:left">
         <input type="text" id="finalidad" name="finalidad"  class="largeInput" style="width:90px" /></div>

          <div style="width:90px;float:left">Upp Destino:</div> 
          <div style="width:110px;float:left">
         <input type="text" id="uppDestino" name="uppDestino"  class="largeInput" style="width:90px" /></div>


            <div style="clear:both"></div>
			</div>

     	<div class="formLine">
          <div>Totales Desglosados</div> 
          <div id="totalesDesglosadosDiv">
			{if $totalDesglosado|count > 0}
            	{include file="{$DOC_ROOT}/templates/boxes/total-desglosado.tpl"}
            {else}
				<b>Para poder generar un Comprobante necesitas Agregar al menos un concepto</b>
			{/if}
          </div>
 					<hr />   
  		</div>        


      	<div style="clear:both"></div>


	   	<div class="formLine" style="margin-left:300px" id ="reemplazarBoton">
        	<a class="button" id="generarFactura" name="generarFactura"><span>Generar Comprobantex</span></a>
        	<a class="button" id="vistaPrevia" name="vistaPrevia"><span>Vista Previa</span></a>        
     	</div>
         
  	</fieldset>
    
 
</div>
