			{include file="{$DOC_ROOT}/templates/boxes/status_open.tpl"} 
			{if !empty($errors)}
      	<h3>
    			{if $errors.complete}
			    	<img src="{$WEB_ROOT}/images/ok.gif" style="cursor:pointer" onclick="ToogleStatusDiv()"/>
    			{else}
	       		<img src="{$WEB_ROOT}/images/error.gif" style="cursor:pointer" onclick="ToogleStatusDiv()"/>
    			{/if}  
       	</h3>
        <div style="position:relative;top:-30px;left:50px; font-size:16px; color:#000">
        {foreach from=$errors.value item="error" key="key"}
    			{$error}
    			{if $errors.field.$key}: {$errors.field.$key}
    			{/if} 
     			<br />
  			{/foreach}

    			{if $errors.complete}
          <a href="{$WEB_ROOT}/login"><b>Haz click aqui para entrar a la aplicacion</b></a>
          {/if}

        </div>
      {/if}  
			{include file="{$DOC_ROOT}/templates/boxes/status_close.tpl"} 
