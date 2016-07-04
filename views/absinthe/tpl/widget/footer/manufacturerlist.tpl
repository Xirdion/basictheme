[{assign var="iManufacturerLimit" value="20"}]
[{assign var="manufacturers" value=$oView->getManufacturerlist()}]
[{if $manufacturers|count}]
    [{block name="footer_manufacturers"}]
        <div class="col-xs-12 col-sm-6 col-lg-3 m-b-2">
            <span class="h4">[{oxmultilang ident="MANUFACTURERS"}]</span>
            <ul class="m-t-1">
                [{assign var="rootManufacturer" value=$oView->getRootManufacturer()}]
                <li><a href="[{$rootManufacturer->getLink()}]">[{oxmultilang ident="ALL_BRANDS"}]</a></li>
                [{foreach from=$manufacturers item=_mnf name=manufacturers}]
                    [{if $smarty.foreach.manufacturers.index < $iManufacturerLimit}]
                        <li><a href="[{$_mnf->getLink()}]" [{if $_mnf->expanded}]class="exp"[{/if}]>[{$_mnf->oxmanufacturers__oxtitle->value}]</a></li>
                    [{elseif $smarty.foreach.manufacturers.index == $iManufacturerLimit}]
                        <li><a href="[{$rootManufacturer->getLink()}]">[{oxmultilang ident="MORE"}]</a></li>
                    [{/if}]
                [{/foreach}]
            </ul>
        </div>
    [{/block}]
[{/if}]