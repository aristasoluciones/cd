<div class="clear"></div>
<div id="portlets">
<!--THIS IS A WIDE PORTLET-->
<div class="portlet">
    <div class="portlet-header fixed" align="center">Filtros de B&uacute;squeda</div>
    <div class="portlet-content nopadding">
    <form name="frmBusqueda" id="frmBusqueda" method="post" action="">
    <input type="hidden" name="type" id="type" value="buscar" />
      <table width="100%" cellpadding="0" cellspacing="0" id="box-table-a" summary="Employee Pay Sheet">
        <thead>
          <tr>
            <th width="129" scope="col">RFC</th>
            <th width="129" scope="col">Nombre</th>
            <th width="129" scope="col">Mes</th>
            <th width="79" scope="col">A&ntilde;o</th>
            <th width="123" scope="col">Estatus</th>
            <th width="120" scope="col">Sucursal</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><input type="text" size="5" name="rfc" id="rfc" class="largeInput" /></td>
            <td><input type="text" size="7" name="nombre" id="nombre" class="largeInput" /></td>
            <td><select name="mes" id="mes"  class="largeInput" style="position:relative;top:-12px" >
                <option value="0">Todos</option>
                {foreach from=$meses item=item key=key}
                    <option value="{$item.id}">{$item.nombre}</option>
                {/foreach}
            </select></td>
            <td><input type="text" size="3" name="anio" id="anio"  class="largeInput"  /></td>
            <td><select name="status_activo" id="status_activo"  class="largeInput" style="position:relative;top:-12px" >
                <option value="">Todos</option>
                <option value="1">Activos</option>
                <option value="0">Cancelados</option>
            </select></td>
            <td width="90"><select name="sucursal" id="sucursal"  class="largeInput" style="position:relative;top:-12px" >
                <option value="0">Todos</option>
                {foreach from=$sucursales item=item key=key}
                    <option value="{$item.sucursalId}">{$item.identificador|urldecode}</option>
                {/foreach}
            </select></td>
          </tr>
        </tbody>
      </table>
      <div style="margin-left:400px">
    	<a class="button" name="btnBuscar" id="btnBuscar" onclick="Buscar()"><span>Buscar</span></a>
      </div>
    </form>
    </div>
 </div>

<div class="folioRowOff" style="width:910px"></div>
<div align="center">	
	<div style="clear:both"></div>    
    <br />
    {if in_array("create",$nuevosPermisos.consultar_facturas)}
    <img title="Generar Reporte de Ventas" src="{$WEB_ROOT}/images/excel.PNG" width="30" height="30" />
    <br />
    <a style="cursor:pointer" name="btnExportar" id="btnExportar" onclick="Exportar()">Generar Reporte</a>
    <br /><br />
    <a href="{$WEB_ROOT}/download.php?file=empresas/{$info.empresaId}_reporte_ventas.csv&id={$info.empresaId}">Descargar Reporte</a>
	<br /><br />
    <div id="loadBusqueda" style="display:none">
        <img src="https://www.comprobantedigital.mx/images/loading.gif" width="16" height="16" />Cargando...
    </div>
    {/if}
</div>