[{capture append="oxidBlock_content"}]
    <button id="absjs-acc-backbtn" class="btn btn-primary abs-account-backbtn m-b-1">[{oxmultilang ident="BACK"}]</button>
    <h1 id="newsletterSettingsHeader" class="h1">[{$oView->getTitle()}]</h1>
    [{if $oView->getSubscriptionStatus() != 0}]
        [{if $oView->getSubscriptionStatus() == 1}]
          <div class="alert alert-success" role="alert">[{oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION_SUCCESS"}]</div>
        [{else }]
          <div class="alert alert-success" role="alert">[{oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION_CANCELED"}]</div>
        [{/if}]
    [{/if}]
    [{include file="form/account_newsletter.tpl"}]
[{/capture}]
[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl" active_link="newsletter"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]