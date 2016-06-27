[{oxscript include="js/widgets/abs-oxdropdown.js" priority=10}]
[{assign var="oSelections" value=$oSelectionList->getSelections()}]
[{if $oSelections}]
<div class="[{$sJsAction}]">

    <label>[{$oSelectionList->getLabel()}]:</label>
    [{assign var="oActiveSelection" value=$oSelectionList->getActiveSelection()}]
    [{if $oActiveSelection}]
    <span>[{$oActiveSelection->getName()}]</span>
    [{elseif !$blHideDefault}]
    <span [{if $blInDetails}]class="text-danger"[{/if}]>
        [{if $sFieldName == "sel" }]
        [{oxmultilang ident="PLEASE_CHOOSE"}]
        [{else}]
        [{oxmultilang ident="CHOOSE_VARIANT"}]
        [{/if}]
    </span>
    [{/if}]
    [{if $editable !== false}]
    <select class="absjs-dropdown form-control m-b-1" name="[{$sFieldName|default:"varselid"}][[{$iKey}]]" value="[{if $oActiveSelection }][{$oActiveSelection->getValue()}][{/if}]" aria-labelledby="TODO: fill this">
        <option value="0" [{if !$oActiveSelection}]selected[{/if}]>
            [{if $sFieldName == "sel" }]
            [{oxmultilang ident="PLEASE_CHOOSE"}]
            [{else}]
            [{oxmultilang ident="CHOOSE_VARIANT"}]
            [{/if}]
        </option>
        
        [{foreach from=$oSelections item=oSelection}]
        <option [{if $oSelection->isActive()}]selected[{/if}] [{if $oSelection->isDisabled()}]disabled[{/if}] value="[{$oSelection->getValue()}]">
            [{$oSelection->getName()}]
        </option>
        [{*<li class="[{if $oSelection->isDisabled()}]js-disabled disabled[{/if}]">
        <a data-selection-id="[{$oSelection->getValue()}]" href="[{$oSelection->getLink()}]" class="[{if $oSelection->isActive()}]selected[{/if}]">[{$oSelection->getName()}]</a>
        </li>*}]
        [{/foreach}]
    </select>
    [{/if}]
</div>
[{else}]
<a href="[{ $_productLink }]" class="variantMessage">
    [{if $sFieldName == "sel" }]
    [{oxmultilang ident="PLEASE_CHOOSE"}]
    [{else}]
    [{oxmultilang ident="CHOOSE_VARIANT"}]
    [{/if}]
</a>
[{/if}]