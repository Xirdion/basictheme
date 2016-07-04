<div class="row">
    <div class="col-lg-6 col-sm-8 col-xs-12">
        <fieldset class="form-group req">
            <label for="abs-user-oxusername">[{oxmultilang ident="EMAIL_ADDRESS" suffix="COLON"}]</label>
            <input required type="email" class="form-control" id="abs-user-oxusername" name="lgn_usr" value="[{$oView->getActiveUsername()}]" />
        </fieldset>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxusername}]
        <div class="m-b-1">
            <input type="hidden" name="blnewssubscribed" value="0">
            <label class="c-input c-checkbox">
                <input type="checkbox" name="blnewssubscribed" value="1" [{if $oView->isNewsSubscribed()}]checked[{/if}]>
                <span class="c-indicator"></span>
                [{oxmultilang ident="NEWSLETTER_SUBSCRIPTION"}]
            </label>
        </div>  
    </div>
</div>