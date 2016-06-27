[{assign var="vendors" value=$oView->getVendorlist()}]
[{if $vendors->count()}]
    [{block name="footer_vendors"}]
    <div class="col-xs-12 col-sm-6 col-lg-3 m-b-2">
        <span class="h4">[{oxmultilang ident="DISTRIBUTORS" }]</span>
            <ul class="m-t-1">
              [{foreach from=$vendors item=_vnd}]
              <li><a href="[{$_vnd->getLink()}]" [{if $_vnd->expanded}]class="exp"[{/if}]>[{$_vnd->oxvendor__oxtitle->value}]</a></li>
              [{/foreach}]
            </ul>
    </div>
    [{/block}]
[{/if}]