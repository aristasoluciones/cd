 <!-- Form -->
     
     <div class="m">

		<form name="frmCancelar" id="frmCancelar" method="post" action="">
        <input type="hidden" name="type" value="cancelar_venta" />
        <input type="hidden" name="id_comprobante" id="id_comprobante" value="{$id_venta}" />
		<fieldset>
  

						<div class="a">
            	<div class="l">Motivo de la cancelaci&oacute;n *</div>
                <div class="r"><textarea name="motivo" id="motivo" class="largeInput wide2"></textarea>
              </div>
            </div>
                
						<div class="a">
            	<div class="l"></div>
                <div class="r" style="margin-left:250px">
                	<a class="button" id="btnCancelar" name="btnCancelar"><span>Cancelar Venta</span></a>
                </div>
              </div>
            </div>

          

             <div class="a">
            	<div class="l">* Campos requeridos</div>               
            	<div class="l">* El proceso puede llevar varios segundos. Favor de ser paciente y no dar click 2 veces en el bot&oacute;n.</div>
            </div>
            <div class="a">
            	<div id="txtMsg"></div>
            </div>	
			<div class="a"></div>
		</fieldset>
		</form>
    
	</div>
     
<!-- End Form -->