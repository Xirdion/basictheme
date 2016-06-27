[{block name="account_menu"}]
    <div class="list-group">
        <a class="list-group-item [{if $active_link == "billship"}]active[{/if}]" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account"}]">
            [{oxmultilang ident="MY_DATA"}]
        </a>
        <a class="list-group-item [{if $active_link == "password"}]active[{/if}]" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_password"}]">
            [{oxmultilang ident="CHANGE_PASSWORD"}]
        </a>
        <a class="list-group-item [{if $active_link == "newsletter"}]active[{/if}]" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_newsletter"}]">
            [{oxmultilang ident="NEWSLETTER_SETTINGS"}]
        </a>
        <a class="list-group-item [{if $active_link == "orderhistory"}]active[{/if}]" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_order"}]">
            [{oxmultilang ident="ORDER_HISTORY"}]
        </a>
        <a class="list-group-item [{if $active_link == "wishlist"}]active[{/if}]" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist"}]">
            [{oxmultilang ident="MY_GIFT_REGISTRY"}]
        </a>
        <a class="list-group-item [{if $active_link == "downloads"}]active[{/if}]" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_downloads"}]">
            [{oxmultilang ident="MY_DOWNLOADS"}]
        </a>
    </div>
[{/block}]