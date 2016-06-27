[{assign var="invadr" value=$oView->getInvoiceAddress()}]
[{assign var="blBirthdayRequired" value=$oView->isFieldRequired(oxuser__oxbirthdate)}]
[{if isset( $invadr.oxuser__oxbirthdate.month )}]
    [{assign var="iBirthdayMonth" value=$invadr.oxuser__oxbirthdate.month}]
[{elseif $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00"}]
    [{assign var="iBirthdayMonth" value=$oxcmp_user->oxuser__oxbirthdate->value|regex_replace:"/^([0-9]{4})[-]/":""|regex_replace:"/[-]([0-9]{1,2})$/":""}]
[{else}]
    [{assign var="iBirthdayMonth" value=0}]
[{/if}]
[{if isset( $invadr.oxuser__oxbirthdate.day )}]
    [{assign var="iBirthdayDay" value=$invadr.oxuser__oxbirthdate.day}]
[{elseif $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00"}]
    [{assign var="iBirthdayDay" value=$oxcmp_user->oxuser__oxbirthdate->value|regex_replace:"/^([0-9]{4})[-]([0-9]{1,2})[-]/":""}]
[{else}]
    [{assign var="iBirthdayDay" value=0}]
[{/if}]
[{if isset( $invadr.oxuser__oxbirthdate.year )}]
    [{assign var="iBirthdayYear" value=$invadr.oxuser__oxbirthdate.year}]
[{elseif $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00"}]
    [{assign var="iBirthdayYear" value=$oxcmp_user->oxuser__oxbirthdate->value|regex_replace:"/[-]([0-9]{1,2})[-]([0-9]{1,2})$/":""}]
[{else}]
    [{assign var="iBirthdayYear" value=0}]
[{/if}]
<div class="row">
    <div class="col-lg-6 col-sm-8 col-xs-12">
        [{include file="form/fieldset/salutation.tpl" name="invadr[oxuser__oxsal]" value=$oxcmp_user->oxuser__oxsal->value value2=$invadr.oxuser__oxsal}]
        <fieldset class="form-group">
            <label for="abs-user-oxfname">[{oxmultilang ident="FIRST_NAME" suffix="COLON"}]</label>
            <input [{if $oView->isFieldRequired(oxuser__oxfname)}]required[{/if}] type="text" class="form-control" id="abs-user-oxfname" name="invadr[oxuser__oxfname]" placeholder="[{oxmultilang ident="FIRST_NAME"}]" value="[{if isset( $invadr.oxuser__oxfname )}][{$invadr.oxuser__oxfname}][{else}][{$oxcmp_user->oxuser__oxfname->value}][{/if}]" />
        </fieldset>

        <fieldset class="form-group">
            <label for="abs-user-oxlname">[{oxmultilang ident="LAST_NAME" suffix="COLON"}]</label>
            <input [{if $oView->isFieldRequired(oxuser__oxlname)}]required[{/if}] type="text" class="form-control" id="abs-user-oxlname" name="invadr[oxuser__oxlname]"  placeholder="[{oxmultilang ident="LAST_NAME"}]" value="[{if isset( $invadr.oxuser__oxlname )}][{$invadr.oxuser__oxlname}][{else}][{$oxcmp_user->oxuser__oxlname->value}][{/if}]" />
        </fieldset>

        <fieldset class="form-group">
            <label for="abs-user-oxstreet">[{oxmultilang ident="STREET_AND_STREETNO" suffix="COLON"}]</label>
            <div class="row">
                <div class="col-xs-12 col-sm-8">
                    <input [{if $oView->isFieldRequired(oxuser__oxstreet)}]required[{/if}] type="text" class="form-control" id="abs-user-oxstreet" name="invadr[oxuser__oxstreet]" placeholder="[{oxmultilang ident="STREET"}]" value="[{if isset( $invadr.oxuser__oxstreet )}][{$invadr.oxuser__oxstreet}][{else}][{$oxcmp_user->oxuser__oxstreet->value}][{/if}]" />
                </div>
                <div class="col-xs-12 col-sm-4">
                    <input [{if $oView->isFieldRequired(oxuser__oxstreetnr)}]required[{/if}] type="text" class="form-control" id="abs-user-oxstreetnr" name="invadr[oxuser__oxstreetnr]" placeholder="[{oxmultilang ident="STREETNR"}]" value="[{if isset( $invadr.oxuser__oxstreetnr )}][{$invadr.oxuser__oxstreetnr}][{else}][{$oxcmp_user->oxuser__oxstreetnr->value}][{/if}]" />
                </div>
            </div>
        </fieldset>

        <fieldset class="form-group">
            <label for="abs-user-oxzip">[{oxmultilang ident="POSTAL_CODE_AND_CITY" suffix="COLON"}]</label>
            <div class="row">
                <div class="col-xs-12 col-sm-4">
                    <input [{if $oView->isFieldRequired(oxuser__oxzip)}]required[{/if}] type="text" class="form-control" id="abs-user-oxzip" name="invadr[oxuser__oxzip]" placeholder="[{oxmultilang ident="POSTAL_CODE"}]" value="[{if isset( $invadr.oxuser__oxzip )}][{$invadr.oxuser__oxzip}][{else}][{$oxcmp_user->oxuser__oxzip->value}][{/if}]" />
                </div>
                <div class="col-xs-12 col-sm-8">
                    <input [{if $oView->isFieldRequired(oxuser__oxcity)}]required[{/if}] type="text" class="form-control" id="abs-user-oxcity" name="invadr[oxuser__oxcity]" placeholder="[{oxmultilang ident="CITY"}]" value="[{if isset( $invadr.oxuser__oxcity )}][{$invadr.oxuser__oxcity}][{else}][{$oxcmp_user->oxuser__oxcity->value}][{/if}]" />
                </div>
            </div>
        </fieldset>

        [{block name="form_user_billing_country"}]
            <fieldset class="form-group">
                <label for="abs-user-country">[{oxmultilang ident="COUNTRY" suffix="COLON"}]</label>
                <select class="form-control" [{if $oView->isFieldRequired(oxuser__oxcountryid)}]required[{/if}] id="abs-user-country" name="invadr[oxuser__oxcountryid]">
                    [{assign var="blCountrySelected" value=false}]
                    [{foreach from=$oViewConf->getCountryList() item=country key=country_id}]
                        [{assign var="sCountrySelect" value=""}]
                        [{if !$blCountrySelected}]
                            [{if (isset($invadr.oxuser__oxcountryid) && $invadr.oxuser__oxcountryid == $country->oxcountry__oxid->value) ||
                                 (!isset($invadr.oxuser__oxcountryid) && ($oxcmp_user->oxuser__oxcountry->value == $country->oxcountry__oxtitle->value or
                                 $oxcmp_user->oxuser__oxcountry->value == $country->oxcountry__oxid->value or
                                 $oxcmp_user->oxuser__oxcountryid->value == $country->oxcountry__oxid->value))}]
                                [{assign var="blCountrySelected" value=true}]
                                [{assign var="sCountrySelect" value="selected"}]
                            [{/if}]
                        [{/if}]
                        <option value="[{$country->oxcountry__oxid->value}]" [{$sCountrySelect}]>[{$country->oxcountry__oxtitle->value}]</option>
                    [{/foreach}]
                </select>
            </fieldset> 
        [{/block}]

    </div>
    <div class="col-lg-6 col-sm-8 col-xs-12">
        <fieldset class="form-group">
            <label for="abs-user-oxcompany">[{oxmultilang ident="COMPANY" suffix="COLON"}]</label>
            <input [{if $oView->isFieldRequired(oxuser__oxcompany)}]required[{/if}] type="text" class="form-control" id="abs-user-oxcompany" name="invadr[oxuser__oxcompany]" placeholder="[{oxmultilang ident="COMPANY"}]" value="[{if isset( $invadr.oxuser__oxcompany )}][{$invadr.oxuser__oxcompany}][{else}][{$oxcmp_user->oxuser__oxcompany->value}][{/if}]" />
        </fieldset>
        [{*<fieldset class="form-group">
            <label for="abs-user-oxaddinfo">[{oxmultilang ident="ADDITIONAL_INFO" suffix='COLON'}]</label>
            <input [{if $oView->isFieldRequired(oxuser__oxaddinfo)}]required[{/if}] type="text" class="form-control" id="abs-user-oxaddinfo" name="invadr[oxuser__oxaddinfo]" value="[{if isset( $invadr.oxuser__oxaddinfo )}][{$invadr.oxuser__oxaddinfo}][{else}][{$oxcmp_user->oxuser__oxaddinfo->value}][{/if}]" />
        </fieldset>*}]
        <fieldset class="form-group">
            <label for="abs-user-oxustid">[{oxmultilang ident="VAT_ID_NUMBER" suffix="COLON"}]</label>
            <input [{if $oView->isFieldRequired(oxuser__oxustid)}]required[{/if}] type="text" class="form-control" id="abs-user-oxustid" name="invadr[oxuser__oxustid]" placeholder="[{oxmultilang ident="VAT_ID_NUMBER"}]" value="[{if isset( $invadr.oxuser__oxustid )}][{$invadr.oxuser__oxustid}][{else}][{$oxcmp_user->oxuser__oxustid->value}][{/if}]" />
        </fieldset>
        
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxustid}]
        
        <fieldset class="form-group">
            <label for="abs-user-oxfon">[{oxmultilang ident="PHONE" suffix="COLON"}]</label>
            <input [{if $oView->isFieldRequired(oxuser__oxfon)}]required[{/if}] type="text" class="form-control" id="abs-user-oxfon" name="invadr[oxuser__oxfon]" placeholder="[{oxmultilang ident="PHONE"}]" value="[{if isset( $invadr.oxuser__oxfon )}][{$invadr.oxuser__oxfon}][{else}][{$oxcmp_user->oxuser__oxfon->value}][{/if}]" />
        </fieldset>
        [{*<fieldset class="form-group">
            <label for="abs-user-oxfax">[{oxmultilang ident="FAX" suffix="COLON"}]</label>
            <input [{if $oView->isFieldRequired(oxuser__oxfax)}]required[{/if}] type="text" class="form-control" id="abs-user-oxfax" name="invadr[oxuser__oxfax]" value="[{if isset( $invadr.oxuser__oxfax )}][{$invadr.oxuser__oxfax}][{else}][{$oxcmp_user->oxuser__oxfax->value}][{/if}]" />
        </fieldset>*}]
        <fieldset class="form-group">
            <label for="abs-user-oxmobfon">[{oxmultilang ident="CELLUAR_PHONE" suffix="COLON"}]</label>
            <input [{if $oView->isFieldRequired(oxuser__oxmobfon)}]required[{/if}] type="text" class="form-control" id="abs-user-oxmobfon" name="invadr[oxuser__oxmobfon]" placeholder="[{oxmultilang ident="CELLUAR_PHONE"}]" value="[{if isset( $invadr.oxuser__oxmobfon )}][{$invadr.oxuser__oxfax}][{else}][{$oxcmp_user->oxuser__oxmobfon->value}][{/if}]" />
        </fieldset>
        [{*<fieldset class="form-group">
            <label for="abs-user-oxprivfon">[{oxmultilang ident="PERSONAL_PHONE" suffix="COLON"}]</label>
            <input [{if $oView->isFieldRequired(oxuser__oxprivfon)}]required[{/if}] type="text" class="form-control" id="abs-user-oxprivfon" name="invadr[oxuser__oxprivfon]" value="[{if isset( $invadr.oxuser__oxprivfon )}][{$invadr.oxuser__oxprivfon}][{else}][{$oxcmp_user->oxuser__oxprivfon->value}][{/if}]" />
        </fieldset>*}]
        [{if $oViewConf->showBirthdayFields()}]
            <fieldset class="form-group">
                <label for="abs-user-birthday">[{oxmultilang ident="BIRTHDATE" suffix="COLON"}]</label>
                <div class="input-group absjs-choose-date">
                    <input id="abs-user-birthday" [{if $oView->isFieldRequired(oxuser__oxbirthdate)}]required[{/if}] type="text" class="form-control" placeholder="[{oxmultilang ident="BIRTHDATE"}]" value="[{if $iBirthdayDay > 0 }][{$iBirthdayDay}].[{/if}][{if $iBirthdayMonth > 0 }][{$iBirthdayMonth}].[{/if}][{if $iBirthdayYear > 0 }][{$iBirthdayYear}].[{/if}]">
                    <span class="input-group-addon btn"><i class="fa fa-calendar"></i></span>
                </div>
                <input class="abs-date-day" type="hidden" name="invadr[oxuser__oxbirthdate][day]" value="[{if $iBirthdayDay > 0}][{$iBirthdayDay}][{/if}]"/>
                <input class="abs-date-month" type="hidden" name="invadr[oxuser__oxbirthdate][month]" value="[{if $iBirthdayMonth > 0}][{$iBirthdayMonth}][{/if}]"/>
                <input class="abs-date-year" type="hidden" name="invadr[oxuser__oxbirthdate][year]" value="[{if $iBirthdayYear > 0}][{$iBirthdayYear}][{/if}]"/>    
            </fieldset>
        [{/if}]
    </div>
</div>