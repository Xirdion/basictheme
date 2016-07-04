[{assign var="aServices" value=$oView->getServicesList()}]
[{assign var="aServiceItems" value=$oView->getServicesKeys()}]
[{block name="footer_information"}]
    <div class="col-xs-12 col-sm-6 col-lg-3 m-b-2">
        <span class="h4">[{oxmultilang ident="INFORMATION"}]</span>
        <ul class="m-t-1">
            [{foreach from=$aServiceItems item=sItem}]
                [{if isset($aServices.$sItem)}]
                    <li><a href="[{$aServices.$sItem->getLink()}]">[{$aServices.$sItem->oxcontents__oxtitle->value}]</a></li>
                [{/if}]
            [{/foreach}]
            <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=newsletter"}]" rel="nofollow">[{oxmultilang ident="NEWSLETTER"}]</a></li>
        </ul>
    </div>
[{/block}]