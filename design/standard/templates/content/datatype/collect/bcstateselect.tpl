{default attribute_base='ContentObjectAttribute' html_class='full'}
{let data_text=cond( is_set( $#collection_attributes[$attribute.id] ), $#collection_attributes[$attribute.id].data_text, $attribute.content )}

{def $err=false
     $is_required=eq( $attribute.is_required, 1)
     $is_empty=eq( $data_text, '' )
     $from_hp=not( ezhttp( 'from_little_form' ) )}
{if and( $from_hp, $is_required, $is_empty )}{def $err=true}{/if}
{if ne( ezhttp('dovalidate'), 1)} {def $supress_validation=true} {/if}
	<div id="{$attribute.id}optionsection" class="{if and(ne($supress_validation, true), eq( $err, true))}option_error{/if}"><label id="{$attribute.id}optionlabel" class="{if and(ne($supress_validation, true), eq( $err, true))}option_text_error{/if}">{if $attribute.is_required}<span class="field_error_message">*&nbsp;</span>{/if}{$attribute.contentclass_attribute_name}</label>

            <select name="{$attribute_base}_bcstateselect_data_text_{$attribute.id}" {if eq($attribute.is_required, 1)} class="validate_required"{/if} style="width: 92%;">
            <option value=""></option>
  	    {def $states=array( array('AL','Alabama'), array('AK','Alaska'), array('AZ','Arizona'), array('AR','Arkansas'), array('CA','California'), array('CO','Colorado'), array('CT','Connecticut'), array('DE','Delaware'), array('DC','Dist of Columbia'), array('FL','Florida'), array('GA','Georgia'), array('HI','Hawaii'), array('ID','Idaho'), array('IL','Illinois'), array('IN','Indiana'), array('IA','Iowa'), array('KS','Kansas'), array('KY','Kentucky'), array('LA','Louisiana'), array('ME','Maine'), array('MD','Maryland'), array('MA','Massachusetts'), array('MI','Michigan'), array('MN','Minnesota'), array('MS','Mississippi'), array('MO','Missouri'), array('MT','Montana'), array('NE','Nebraska'), array('NV','Nevada'), array('NH','New Hampshire'), array('NJ','New Jersey'), array('NM','New Mexico'), array('NY','New York'), array('NC','North Carolina'), array('ND','North Dakota'), array('OH','Ohio'), array('OK','Oklahoma'), array('OR','Oregon'), array('PA','Pennsylvania'), array('RI','Rhode Island'), array('SC','South Carolina'), array('SD','South Dakota'), array('TN','Tennessee'), array('TX','Texas'), array('UT','Utah'), array('VT','Vermont'), array('VA','Virginia'), array('WA','Washington'), array('WV','West Virginia'), array('WI','Wisconsin'), array('WY','Wyoming'))}

                {def $dt=$data_text|wash( xhtml )}
		{foreach $states as $state}
		  <option value="{$state.0}"{if eq( $dt, $state.0)} selected {/if}>{$state.1}</option>
		{/foreach}
		</select>
 	     <div class="form_field_error_message" id="{$attribute_base}_bcstateselect_data_text_{$attribute.id}_error" {if or(eq( $supress_validation, true ),ne( $err, true))} style="display: none"{/if}>Please make a state selection{* Selection is required *}</div>{* /if *}
</div>
{/let}
{/default}
