{include file="{$DOC_ROOT}/templates/items/compras_header.tpl" clase="Off"}
{if count($comprobantes.items)}
	{foreach from=$comprobantes.items item=fact key=key}
    	{if $key%2 == 0}
			{include file="{$DOC_ROOT}/templates/items/compras_base.tpl" clase="Off"}
        {else}
			{include file="{$DOC_ROOT}/templates/items/compras_base.tpl" clase="On"}
        {/if}
	{/foreach}
 	{if count($comprobantes.pages)}
    {include file="{$DOC_ROOT}/templates/lists/pages_new.tpl" pages=$comprobantes.pages colspan=6}
  {/if}
  
{else}
<div align="center">No existen compras en estos momentos.</div>
{/if}