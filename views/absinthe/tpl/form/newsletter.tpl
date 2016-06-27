[{assign var="aRegParams" value=$oView->getRegParams()}]
[{*oxscript include="js/widgets/oxinputvalidator.js" priority=10 }]
[{oxscript add="$('form.js-oxValidate').oxInputValidator();"*}]
<form action="[{$oViewConf->getSslSelfLink()}]" method="post">
    <div>
        [{$oViewConf->getHiddenSid()}]
        <input type="hidden" name="fnc" value="send">
        <input type="hidden" name="cl" value="newsletter">
        <input type="hidden" name="editval[oxuser__oxcountryid]" value="[{$oView->getHomeCountryId()}]">
    </div>
    <div class="row">
        <div class="col-lg-6 col-sm-8 col-xs-12">
            [{include file="form/fieldset/salutation.tpl" name="editval[oxuser__oxsal]" value=$aRegParams.oxuser__oxsal}]
            <fieldset class="form-group">
                <label for="abs-newsletter-firstname">[{oxmultilang ident="FIRST_NAME" suffix="COLON"}]</label>
                <input type="text" class="form-control" id="abs-newsletter-firstname" name="editval[oxuser__oxfname]" placeholder="[{oxmultilang ident="FIRST_NAME"}]" value="[{if $aRegParams.oxuser__oxfname}][{$aRegParams.oxuser__oxfname}][{/if}]" />
            </fieldset>
            <fieldset class="form-group">
                <label for="abs-newsletter-lastname">[{oxmultilang ident="LAST_NAME" suffix="COLON"}]</label>
                <input type="text" class="form-control" id="abs-newsletter-lastname" name="editval[oxuser__oxlname]" placeholder="[{oxmultilang ident="LAST_NAME"}]" value="[{if $aRegParams.oxuser__oxlname}][{$aRegParams.oxuser__oxlname}][{/if}]" />
            </fieldset>
            [{if $aErrors}][{/if}]
            <fieldset class="form-group">
                <label for="abs-newsletter-email">[{oxmultilang ident="EMAIL" suffix="COLON"}]</label>
                <input required type="email" class="form-control" id="abs-newsletter-email" name="editval[oxuser__oxusername]" placeholder="your@mail.com" value="[{if $aRegParams.oxuser__oxusername}][{$aRegParams.oxuser__oxusername}][{/if}]" />
            </fieldset>
            <fieldset class="form-group">
                <label for="newsletterSubscribeOn" class="c-input c-radio">
                    <input id="newsletterSubscribeOn" type="radio" name="subscribeStatus" value="1" checked>
                    <span class="c-indicator"></span>
                    [{oxmultilang ident="SUBSCRIBE"}]
                </label>
                <label for="newsletterSubscribeOff" class="c-input c-radio">
                    <input id="newsletterSubscribeOff" type="radio" name="subscribeStatus" value="0">
                    <span class="c-indicator"></span>
                    [{oxmultilang ident="UNSUBSCRIBE"}]
                </label>
            </fieldset>
            <button type="submit" class="btn btn-primary">[{oxmultilang ident="SUBMIT"}]</button>
        </div>
    </div>
</form>