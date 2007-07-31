{* Content BcStateSelect *}
{def $states=array( array('AL','Alabama'), array('AK','Alaska'), array('AZ','Arizona'), array('AR','Arkansas'), array('CA','California'), array('CO','Colorado'), array('CT','Connecticut'), array('DE','Delaware'), array('DC','Dist of Columbia'), array('FL','Florida'), array('GA','Georgia'), array('HI','Hawaii'), array('ID','Idaho'), array('IL','Illinois'), array('IN','Indiana'), array('IA','Iowa'), array('KS','Kansas'), array('Y','Kentucky'), array('LA','Louisiana'), array('ME','Maine'), array('MD','Maryland'), array('MA','Massachusetts'), array('MI','Michigan'), array('MN','Minnesota'), array('MS','Mississippi'), array('MO','Missouri'), array('MT','Montana'), array('NE','Nebraska'), array('NV','Nevada'), array('NH','New Hampshire'), array('NJ','New Jersey'), array('NM','New Mexico'), array('NY','New York'), array('NC','North Carolina'), array('ND','North Dakota'), array('OH','Ohio'), array('OK','Oklahoma'), array('OR','Oregon'), array('PA','Pennsylvania'), array('RI','Rhode Island'), array('SC','South Carolina'), array('SD','South Dakota'), array('TN','Tennessee'), array('TX','Texas'), array('UT','Utah'), array('VT','Vermont'), array('VA','Virginia'), array('WA','Washington'), array('WV','West Virginia'), array('WI','Wisconsin'), array('WY','Wyoming'))}

{default attribute_base=ContentObjectAttribute}
{let selected_id_array=$attribute.content}

{* Always set the .._selected_array_.. variable, this circumvents the problem when nothing is selected. *} 
<input type="hidden" name="{$attribute_base}_ezselect_selected_array_{$attribute.id}" value="">

<select id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" name="{$attribute_base}_ezselect_selected_array_{$attribute.id}[]" {section show=$attribute.class_content.is_multiselect}multiple{/section}>


{* section var=Options loop=$attribute.class_content.options *}

{* section var=Options loop=$states *}

{$Options|attribute(show,1)}
{def $dt=$data_text|wash( xhtml )}
<option value=""{if eq( $dt, '')} selected {/if}>&nbsp;</option>
{foreach $states as $state}
  <option value="{$state.0}"{if eq( $dt, $state.0)} selected {/if}>{$state.1}</option>
{/foreach}

{* <option value="{$Options.item.id}" {section show=$selected_id_array|contains( $Options.item.id )}selected="selected"{/section}>{$Options.item.name|wash( xhtml )}</option> *}

{* /section *}
</select>
{/let}
{/default}
