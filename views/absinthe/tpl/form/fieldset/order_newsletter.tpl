[{if $blSubscribeNews}]
[{block name="user_billing_newsletter"}]
<input type="hidden" name="blnewssubscribed" value="0">

<label class="c-input c-checkbox">
    <input type="checkbox" name="blnewssubscribed" id="subscribeNewsletter" value="1" [{if $oView->isNewsSubscribed()}]checked[{/if}]>
    <span class="c-indicator"></span>
    [{oxmultilang ident="NEWSLETTER_SUBSCRIPTION"}]
</label>
[{/block}]
[{/if}]