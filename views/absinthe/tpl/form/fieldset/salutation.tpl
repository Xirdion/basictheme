<fieldset class="form-group">
    <label for="abs-salutation">[{oxmultilang ident="TITLE" suffix="COLON"}]</label>
    <select class="form-control" id="abs-salutation" name="[{$name}]">
        <option value="MR"  [{if $value|lower  == "mr"  or $value2|lower == "mr" }]selected[{/if}]>[{oxmultilang ident="MR"}]</option>
        <option value="MRS" [{if $value|lower  == "mrs" or $value2|lower == "mrs"}]selected[{/if}]>[{oxmultilang ident="MRS"}]</option>
    </select>
</fieldset>

[{*
<select name="[{$name}]" class="[{if $class}][{$class}][{/if}] form-group">
    <option value="MR"  [{if $value|lower  == "mr"  or $value2|lower == "mr" }]SELECTED[{/if}]>[{ oxmultilang ident="MR"  }]</option>
    <option value="MRS" [{if $value|lower  == "mrs" or $value2|lower == "mrs"}]SELECTED[{/if}]>[{ oxmultilang ident="MRS" }]</option>
</select>
*}]