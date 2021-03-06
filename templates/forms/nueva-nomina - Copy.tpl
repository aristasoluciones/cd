<div id="divForm">
	<form id="nuevaFactura" name="nuevaFactura" method="post">
        <input type="hidden" id="calle" name="calle" value="" />
        <input type="hidden" id="pais" name="pais" value="" />
        <input type="hidden" id="userId" name="userId" value="" />
        <input type="hidden" id="ticketChain" name="ticketChain" value="{$ticketChain}" />
        {if isset($notaVentaId)}
        	<input type="hidden" id="notaVentaId" name="notaVentaId" value="{$notaVentaId}" />
        {/if}
    <fieldset>
				<div>
        	<span id="loadingDivDatosFactura"></span>
        </div>
        <div class="formLine" style="text-align:left;">
        <div style="width:90px;float:left">Busca RFC, Curp o Nombre Empleado:</div> 
        <div style="width:202px;float:left"><input name="rfc" id="rfc" type="text" value="{$post.rfc}" size="20" class="largeInput" autocomplete="off"/>
        <div style="position:relative">
         		<div style="display:none;position:absolute;top:-2px; left:2px; z-index:100" id="suggestionDiv">
        	 	</div>
         </div>
        </div>
        <div style="width:90px;float:left">Datos del Empleado:</div>
        <div style="width:310px;float:left">
        <textarea name="razonSocial" id="razonSocial" disabled="disabled" style="background-color:#eee; overflow:auto;" cols="63" rows="5">{$post.razonSocial}&#10;{$post.calle} {$post.noExt}</textarea>
        </div>
       	<div style="clear:both"></div>
       
      </div>

      <div class="formLine">
          <div style="width:90px;float:left">Metodo de Pago:</div> 
          <div style="width:200px;float:left"><input name="metodoDePago" id="metodoDePago" type="text" value=""  size="20" class="largeInput"/></div>

          <div style="width:90px;float:left">Numero de Cuenta:</div> 
          <div style="width:100px;float:left"><input name="NumCtaPago" id="NumCtaPago" type="text" value=""  size="4" maxlength="4" class="largeInput"/></div>

          <div style="width:250px;float:left; cursor:pointer" onclick="ToggleDiv('facturaOpciones')">[+] Mostrar mas Opciones Generales</div> 

      		<div style="clear:both"></div>
        </div>  

			<div id="facturaOpciones" style="display:none">
        <div class="formLine">
            <div style="width:90px;float:left">% de IVA:</div> 
            <div style="width:120px;float:left">
             <select name="tasaIva" id="tasaIva" class="largeInput" style="width:100px">
            {foreach from=$ivas item=iva}
            <option value="{$iva}">{$iva}</option> <br />
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
            <div style="width:90px;float:left">% Retencion Iva:</div> 
            <div style="width:135px;float:left">
            <select name="porcentajeRetIva" id="porcentajeRetIva"  class="largeInput">
            {foreach from=$retIvas item=iva}
            <option value="{$iva}">{$iva}</option> <br />
            {/foreach}
            </select>
            </div>
            <div style="width:90px;float:left">% Retencion ISR:</div> 
            <div style="width:135px;float:left">
            <select name="porcentajeRetIsr" id="porcentajeRetIsr"  class="largeInput">
            {foreach from=$retIsrs item=isr}
            <option value="{$isr}">{$isr}</option> <br />
            {/foreach}
            </select></div>
            
            <div style="width:62px;float:left">% IEPS:</div> 
            <div style="width:126px;float:left"><input name="porcentajeIEPS" id="porcentajeIEPS" type="text" value="{$post.porcentajeIEPS}"  size="12"  class="largeInput"/></div>
  
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

{*if $version == "auto" && ($info.empresaId == 39 || $info.empresaId == 180)}  
      <div class="formLine">
          <div style="width:90px;float:left">% ISH:</div> 
          <div style="width:126px;float:left"><input name="porcentajeISH" id="porcentajeISH" type="text" value="2"  size="12"  class="largeInput"/></div>
      		<div style="clear:both"></div>
        </div>  
{/if*}
     <div class="formLine">
 					<hr />   
        </div>  

{*percepciones*}
	</form>
<span id="loadingDivPercepciones"></span>
      <div class="formLine">
          <div style="width:430px;float:left">Tipo de Percepcion:</div> 
          <div style="width:160px;float:left">Importe Gravado:</div> 
          <div style="width:160px;float:left">Importe Excento:</div>
      		<div style="clear:both"></div>
        </div>  

      <form id="percepcionesForm" name="percepcionesForm">
            <input type="hidden" id="type" name="type" value="agregarPercepcion" />

      <div class="formLine">
          <div style="width:430px;float:left">
          <select name="tipoPercepcion" id="tipoPercepcion" class="largeInput" style="width:400px">
          {foreach from=$tiposPercepcion item=item}
          	<option value="{$item.clavePercepcion}">{$item.nombrePercepcion}</option>
          {/foreach}
          </select></div>
          <div style="width:160px;float:left">
          <input name="importeGravado" id="importeGravado" type="text" value="{$post.importeGravado}"  size="15" class="largeInput"  placeholder="Importe Gravado"/></div>
          <div style="width:160px;float:left">
          <input name="importeExcento" id="importeExcento" type="text" value="{$post.importeExcento}"  size="15" class="largeInput"  placeholder="Importe Excento"/></div>
          <div style="width:132px;float:left; cursor:pointer" id="agregarPercepcionDiv" class="button"><span>Agregar</span></div>
      		<div style="clear:both"></div>
        </div>  
			</form>

      <b>Percepciones Cargadas:</b>
			<div id="percepciones">
            {if $percepciones|count > 0}
            	{include file="{$DOC_ROOT}/templates/lists/percepciones.tpl"}
            {else}
				Ninguna (Has click en Agregar para agregar una percepcion)
			{/if}
      		</div>
      <br /><br />     
{*percepciones*}

{*deducciones*}
	</form>
<span id="loadingDivPercepciones"></span>
      <div class="formLine">
          <div style="width:430px;float:left">Tipo de Deduccion:</div> 
          <div style="width:160px;float:left">Importe Gravado:</div> 
          <div style="width:160px;float:left">Importe Excento:</div>
      		<div style="clear:both"></div>
        </div>  

      <form id="deduccionesForm" name="deduccionesForm">
            <input type="hidden" id="type" name="type" value="agregarDeduccion" />

      <div class="formLine">
          <div style="width:430px;float:left">
          <select name="tipoDeduccion" id="tipoDeduccion" class="largeInput" style="width:400px">
          {foreach from=$tiposDeduccion item=item}
          	<option value="{$item.claveDeduccion}">{$item.nombreDeduccion}</option>
          {/foreach}
          </select></div>
          <div style="width:160px;float:left">
          <input name="importeGravado" id="importeGravado" type="text" value="{$post.importeGravado}"  size="15" class="largeInput"  placeholder="Importe Gravado"/></div>
          <div style="width:160px;float:left">
          <input name="importeExcento" id="importeExcento" type="text" value="{$post.importeExcento}"  size="15" class="largeInput"  placeholder="Importe Excento"/></div>
          <div style="width:132px;float:left; cursor:pointer" id="agregarDeduccionDiv" class="button"><span>Agregar</span></div>
      		<div style="clear:both"></div>
        </div>  
			</form>

      <b>Deducciones Cargadas:</b>
			<div id="deducciones">
            {if $deducciones|count > 0}
            	{include file="{$DOC_ROOT}/templates/lists/deducciones.tpl"}
            {else}
				Ninguna (Has click en Agregar para agregar una deduccion)
			{/if}
      		</div>
      <br /><br />     
{*deducciones*}
	</form>

{*incapacidades*}
<span id="loadingDivIncapacidades"></span>
      <div class="formLine">
          <div style="width:430px;float:left">Tipo de Incapacidad:</div> 
          <div style="width:160px;float:left">Dias Incapacidad:</div> 
          <div style="width:160px;float:left">Descuento:</div>
      		<div style="clear:both"></div>
        </div>  

      <form id="incapacidadesForm" name="incapacidadesForm">
            <input type="hidden" id="type" name="type" value="agregarIncapacidad" />

      <div class="formLine">
          <div style="width:430px;float:left">
          <select name="tipoIncapacidad" id="tipoIncapacidad" class="largeInput" style="width:400px">
          {foreach from=$tiposIncapacidad item=item}
          	<option value="{$item.claveIncapacidad}">{$item.nombreIncapacidad}</option>
          {/foreach}
          </select></div>
          <div style="width:160px;float:left">
          <input name="diasIncapacidad" id="diasIncapacidad" type="text" value="{$post.diasIncapacidad}"  size="15" class="largeInput"  placeholder="Dias Incapacidad"/></div>
          <div style="width:160px;float:left">
          <input name="descuento" id="descuento" type="text" value="{$post.descuento}"  size="15" class="largeInput"  placeholder="Descuento"/></div>
          <div style="width:132px;float:left; cursor:pointer" id="agregarIncapacidadDiv" class="button"><span>Agregar</span></div>
      		<div style="clear:both"></div>
        </div>  
			</form>

      <b>Incapacidades Cargadas:</b>
			<div id="incapacidades">
            {if $incapacidades|count > 0}
            	{include file="{$DOC_ROOT}/templates/lists/incapacidades.tpl"}
            {else}
				Ninguna (Has click en Agregar para agregar una incapacidades)
			{/if}
      		</div>
      <br /><br />     
{*incapacidades*}

{*horasextra*}
<span id="loadingDivHorasExtra"></span>
      <div class="formLine">
          <div style="width:270px;float:left">Tipo de Horas:</div> 
          <div style="width:160px;float:left"># Dias:</div> 
          <div style="width:160px;float:left">Horas Extra:</div>
          <div style="width:160px;float:left">Importe Pagado:</div>
      		<div style="clear:both"></div>
        </div>  

      <form id="horasExtrasForm" name="horasExtrasForm">
            <input type="hidden" id="type" name="type" value="agregarHoraExtra" />

      <div class="formLine">
          <div style="width:270px;float:left">
          <select name="tipoHorasExtra" id="tipoHorasExtra" class="largeInput" style="width:240px">
          	<option value="Dobles">DOBLES</option>
          	<option value="Triples">TRIPLES</option>
          </select></div>
          <div style="width:160px;float:left">
          <input name="dias" id="dias" type="text" value="{$post.dias}"  size="15" class="largeInput"  placeholder="Dias"/></div>
          <div style="width:160px;float:left">
          <input name="horasExtra" id="horasExtra" type="text" value="{$post.horasExtra}"  size="15" class="largeInput"  placeholder="Horas Extra"/></div>

          <div style="width:160px;float:left">
          <input name="importePagado" id="importePagado" type="text" value="{$post.importePagado}"  size="15" class="largeInput"  placeholder="Importe Pagado"/></div>
          <div style="width:132px;float:left; cursor:pointer" id="agregarHorasExtraDiv" class="button"><span>Agregar</span></div>
      		<div style="clear:both"></div>
        </div>  
			</form>

      <b>Horas Extra Cargadas:</b>
			<div id="horasExtras">
            {if $horasExtras|count > 0}
            	{include file="{$DOC_ROOT}/templates/lists/horasExtras.tpl"}
            {else}
				Ninguna (Has click en Agregar para agregar una hora Extra)
			{/if}
      		</div>
      <br /><br />     
{*deducciones*}

<span id="loadingDivConcepto"></span>
      <div class="formLine">
          <div style="width:150px;float:left">Cantidad:</div> 
          <div style="width:150px;float:left">No. Ident:</div> 
          <div style="width:150px;float:left">Unidad:</div>
          <div style="width:150px;float:left">Valor Unitario:</div>
          <div style="width:150px;float:left">Excento Iva:</div>
      		<div style="clear:both"></div>
        </div>  

      <form id="conceptoForm" name="conceptoForm">
            <input type="hidden" id="type" name="type" value="agregarConcepto" />

      <div class="formLine">
          <div style="width:150px;float:left">
          <input name="cantidad" id="cantidad" type="text" value="{$post.cantidad}"  size="15" class="largeInput" placeholder="Cantidad"/></div>
          <div style="width:150px;float:left">
          <input name="noIdentificacion" id="noIdentificacion" type="text" value="{$post.noIdentificacion}"  size="15"  class="largeInput" placeholder="No. Identificacion"/>
          <div style="position:relative">
         		<div style="display:none;position:absolute;top:-2px; left:2px; z-index:100" id="suggestionProductDiv">
        	 	</div>
         </div>
          </div>
          <div style="width:150px;float:left">
          <input name="unidad" id="unidad" type="text" value="{$post.unidad}"  size="15" class="largeInput"  placeholder="Unidad"/></div>
          <div style="width:150px;float:left">
          <input name="valorUnitario" id="valorUnitario" type="text" value="{$post.valorUnitario}"  size="15" class="largeInput"  placeholder="Valor Unitario"/></div>
          <div style="width:150px;float:left">
          <select name="excentoIva" id="excentoIva" class="largeInput" style="width:120px">
         	{foreach from=$excentoIva item=iva}
          <option value="{$iva}">{$iva}</option> <br />
          {/foreach}
          </select></div>
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

{if $info.moduloImpuestos == "Si"}  

      <div class="formLine">
				<div style="width:300px;float:left; cursor:pointer" onclick="ToggleDiv('impuestosOpciones')">[+] Mostrar Formulario de Impuestos<br /><br /></div> 
			</div>
			<span id="loadingDivImpuesto"></span>
      
      <div id="impuestosOpciones" style="display:none">
        <div class="formLine">
            <div style="width:80px;float:left">Tasa %:</div> 
            <div style="width:350px;float:left">Impuesto</div> 
            <div style="width:80px;float:left">IVA%</div> 
            <div style="width:80px;float:left">Importe</div> 
            <div style="clear:both"></div>
          </div>  
  
        <form id="impuestoForm" name="impuestoForm">
        <div class="formLine">
            <div style="width:80px;float:left">
            <input name="tasa" id="tasa" type="text" value="{$post.tasa}"  size="5" class="largeInput"/></div>
            <div style="width:350px;float:left">
            <input name="impuestoId" id="impuestoId" type="text" value="{$post.impuestoId}"  size="44" class="largeInput"/>
            <div style="position:relative">
              <div style="display:none;position:absolute;top:-2px; left:2px; z-index:100" id="suggestionImpuestoDiv">
              </div>
           </div>
            </div>
            <div style="width:80px;float:left">
            <input name="iva" id="iva" type="text" value="0"  size="5" class="largeInput"/></div>
            <div style="width:80px;float:left">
            <input name="importe" id="importe" type="text" value="0"  size="5" class="largeInput"/></div>
            <div style="width:146px;float:left">
            <select name="tipo" id="tipo" class="largeInput">
          <option value="retencion">Retencion</option>
          <option value="deduccion">Deduccion</option>
          <option value="impuesto">Impuesto</option>
          <option value="amortizacion">Amortizacion</option>
          </select>
          </div>
            <div style="width:145px;float:left; cursor:pointer" id="agregarImpuestoDiv" class="button"><span>Agregar Impuesto</span></div>
            <div style="clear:both"></div>
            <hr />   
          </div>  
        </form>
        Impuestos Cargados:
        <div id="impuestos">
        Ninguno (Has click en Agregar Impuesto o Retencion para agregar)
        </div>
        <br /><br />     
  
  {if $info.empresaId == 86}
       <div class="formLine">
            <div>menos-2% I.S.N:</div> 
            <div><input name="isn" id="isn" /></div>
        </div>        
       <div class="formLine">
            <div>menos-5% al millar S.F.P</div> 
            <div><input name="spf" id="spf" /></div>
        </div>        
  {/if}
  
       <div class="formLine" style="float:left; width:180px">
            <div>Autorizo:</div> 
            <div><textarea name="autorizo" id="autorizo" class="largeInput" style="text-align:center"></textarea></div>
        </div>        
       <div class="formLine"  style="float:left; width:180px">
            <div>Recibio:</div> 
            <div><textarea name="recibio" id="recibio" class="largeInput" style="text-align:center"></textarea></div>
        </div>        
       <div class="formLine"  style="float:left; width:180px">
            <div>VoBo:</div> 
            <div><textarea name="vobo" id="vobo" class="largeInput" style="text-align:center"></textarea></div>
        </div>
       <div class="formLine"  style="float:left; width:180px">
            <div>Reviso:</div> 
            <div><textarea name="reviso" id="reviso" class="largeInput" style="text-align:center"></textarea></div>
        </div>        
       <div class="formLine"  style="float:left; width:180px">
            <div>Pago:</div> 
            <div><textarea name="pago" id="pago" class="largeInput" style="text-align:center"></textarea></div>
            <hr />   
        </div>
        <div style="clear:both"></div>     
			</div>
{/if}
            <div style="clear:both"></div>

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


	    	<div class="formLine" style="text-align:center" id ="reemplazarBoton">
        <a class="button" id="generarFactura" name="generarFactura"><span>Generar Comprobante</span></a>
        <a class="button" id="vistaPrevia" name="vistaPrevia"><span>Vista Previa</span></a>
        
     	</div>
         
  	</fieldset>
    
 
</div>
