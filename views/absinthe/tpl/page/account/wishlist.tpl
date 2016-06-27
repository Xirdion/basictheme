[{capture append="oxidBlock_content"}]
    <button id="absjs-acc-backbtn" class="btn btn-primary abs-account-backbtn m-b-1">[{oxmultilang ident="BACK"}]</button>
    [{if !$oView->getWishListUsers() && $oView->getWishListSearchParam()}]
        [{assign var="_statusMessage" value="MESSAGE_SORRY_NO_GIFT_REGISTRY"|oxmultilangassign}]
        [{include file="message/error.tpl" statusMessage=$_statusMessage}]
    [{/if}]
    [{assign var="editval" value=$oView->getEnteredData()}]
    [{if $oView->isWishListEmailSent()}]
        [{assign var="_statusMessage" value="GIFT_REGISTRY_SENT_SUCCESSFULLY"|oxmultilangassign:$editval->rec_email}]
        [{include file="message/notice.tpl" statusMessage=$_statusMessage}]
    [{/if}]
    <h1 class="h1">[{$oView->getTitle()}]</h1>
    [{include file="form/wishlist_search.tpl" searchClass="account_wishlist"}]
    [{if $oView->getWishList()}]
        [{include file="form/wishlist_publish.tpl"}]
        [{include file="form/wishlist_suggest.tpl"}]
        [{include file="widget/product/list.tpl" type="line" listId="wishlistProductList" title="" products=$oView->getWishProductList() removeFunction="towishlist" toBasketFunction="tobasket" owishid=$oxcmp_user->oxuser__oxid->value}]
    [{else}]
        <div class="alert alert-info" role="alert">
            [{oxmultilang ident="GIFT_REGISTRY_EMPTY"}]
        </div>
    [{/if}]
[{/capture}]
[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl" active_link="wishlist"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]