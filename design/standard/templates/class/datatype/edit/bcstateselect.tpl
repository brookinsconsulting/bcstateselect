{* Class BcStateSelect *}

{* Default value. *}
<div class="block">
    <label>{'Default value'|i18n( 'design/standard/class/datatype' )}:</label>
    <input class="box" type="text" name="ContentClass_bcstateselect_default_value_{$class_attribute.id}" value="{$class_attribute.data_text1|wash}" size="30" maxlength="60" />
</div>

{* Maximum string length. *}
<div class="block">
    <label>{'Max string length'|i18n( 'design/standard/class/datatype' )}:</label>
    <input type="text" name="ContentClass_bcstateselect_max_string_length_{$class_attribute.id}" value="{$class_attribute.data_int1}" size="5" maxlength="5" />&nbsp;{'characters'|i18n( 'design/standard/class/datatype' )}
</div>
