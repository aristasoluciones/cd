<?php /* Smarty version Smarty3-b7, created on 2016-02-24 09:44:26
         compiled from "/var/www/vhosts/comprobantedigital.mx/httpdocs/sistema/admin/templates/boxes/status.tpl" */ ?>
<?php /*%%SmartyHeaderCode:209672886056cdebfa14a024-96307321%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'dba8512c30921241c7e43910701253e335d81477' => 
    array (
      0 => '/var/www/vhosts/comprobantedigital.mx/httpdocs/sistema/admin/templates/boxes/status.tpl',
      1 => 1455433623,
    ),
  ),
  'nocache_hash' => '209672886056cdebfa14a024-96307321',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
			<?php $_template = new Smarty_Internal_Template("{$_smarty_tpl->getVariable('DOC_ROOT')->value}/templates/boxes/status_open.tpl", $_smarty_tpl->smarty, $_smarty_tpl, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null);
 echo $_template->getRenderedTemplate();?><?php $_template->updateParentVariables(0);?><?php unset($_template);?>
 
			<?php if (!empty($_smarty_tpl->getVariable('errors')->value)){?>
      	<h3>
    			<?php if ($_smarty_tpl->getVariable('errors')->value['complete']){?>
			    	<img src="<?php echo $_smarty_tpl->getVariable('WEB_ROOT')->value;?>
/images/ok.gif" style="cursor:pointer" onclick="ToogleStatusDiv()"/>
    			<?php }else{ ?>
	       		<img src="<?php echo $_smarty_tpl->getVariable('WEB_ROOT')->value;?>
/images/error.gif" style="cursor:pointer" onclick="ToogleStatusDiv()"/>
    			<?php }?>  
       	</h3>
        <div style="position:relative;top:-50px;left:50px">
        <?php  $_smarty_tpl->tpl_vars["error"] = new Smarty_Variable;
 $_smarty_tpl->tpl_vars["key"] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('errors')->value['value']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if (count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars["error"]->key => $_smarty_tpl->tpl_vars["error"]->value){
 $_smarty_tpl->tpl_vars["key"]->value = $_smarty_tpl->tpl_vars["error"]->key;
?>
    			<?php echo $_smarty_tpl->getVariable('error')->value;?>

    			<?php if ($_smarty_tpl->getVariable('errors')->value['field'][$_smarty_tpl->getVariable('key')->value]){?>
       			Campo: <?php echo $_smarty_tpl->getVariable('errors')->value['field'][$_smarty_tpl->getVariable('key')->value];?>

    			<?php }?> 
     			<br />
  			<?php }} ?>

        </div>
      <?php }?>  
			<?php $_template = new Smarty_Internal_Template("{$_smarty_tpl->getVariable('DOC_ROOT')->value}/templates/boxes/status_close.tpl", $_smarty_tpl->smarty, $_smarty_tpl, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null);
 echo $_template->getRenderedTemplate();?><?php $_template->updateParentVariables(0);?><?php unset($_template);?>
 
