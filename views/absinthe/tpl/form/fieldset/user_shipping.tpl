[{* TODO: add if inline check for the following *}]

[{oxscript include="js/widgets/abs-oxusershippingaddressselect.js" priority=10}]
<input type="hidden" name="changeClass" value="[{$onChangeClass|default:'account'}]">

<div class="m-b-2">
<label>[{oxmultilang ident="ADDRESSES"}]</label>
[{block name="form_user_shipping_address_select"}]
    <div class="row">
        <div class="col-lg-6 col-sm-8 col-xs-12">
            <select id="addressId" name="oxaddressid" class="form-control">
                <option value="-1">[{oxmultilang ident="NEW_ADDRESS"}]</option>
                [{if $oxcmp_user}]
                    [{foreach from=$oxcmp_user->getUserAddresses() item=address}]
                        <option value="[{$address->oxaddress__oxid->value}]" [{if $address->isSelected()}]SELECTED[{/if}]>[{$address}]</option>
                    [{/foreach}]
                [{/if}]
            </select>
        </div>
    </div>
[{/block}]
</div>
<div id="shippingAddressForm" class="m-t-1">
    <div class="row">
        <div class="col-lg-6 col-sm-8 col-xs-12">
            [{include file="form/fieldset/salutation.tpl" name="deladr[oxaddress__oxsal]" value=$delivadr->oxaddress__oxsal->value value2=$deladr.oxaddress__oxsal}]

            <fieldset class="form-group">
                <label for="abs-del-oxfname">[{oxmultilang ident="FIRST_NAME" suffix="COLON"}]</label>
                <input [{if $oView->isFieldRequired(oxaddress__oxfname)}]required [{if !$oView->showShipAddress()}]disabled[{/if}][{/if}] type="text" class="form-control" id="abs-del-oxfname" name="deladr[oxaddress__oxfname]" placeholder="[{oxmultilang ident="FIRST_NAME"}]" value="[{if isset( $deladr.oxaddress__oxfname )}][{$deladr.oxaddress__oxfname}][{else}][{$delivadr->oxaddress__oxfname->value}][{/if}]" />
            </fieldset>

            <fieldset class="form-group">
                <label for="abs-del-oxlname">[{oxmultilang ident="LAST_NAME" suffix="COLON"}]</label>
                <input [{if $oView->isFieldRequired(oxaddress__oxlname)}]required [{if !$oView->showShipAddress()}]disabled[{/if}][{/if}] type="text" class="form-control" id="abs-del-oxlname" name="deladr[oxaddress__oxlname]" placeholder="[{oxmultilang ident="LAST_NAME"}]"  value="[{if isset( $deladr.oxaddress__oxlname )}][{$deladr.oxaddress__oxlname}][{else}][{$delivadr->oxaddress__oxlname->value}][{/if}]" />
            </fieldset>

            [{*<fieldset class="form-group">
            <label for="abs-del-oxaddinfo">[{oxmultilang ident="ADDITIONAL_INFO" suffix='COLON'}]</label>
            <input [{if $delivadr}]disabled[{/if}] [{if $oView->isFieldRequired(oxaddress__oxaddinfo)}]required[{/if}] type="text" class="form-control" id="abs-del-oxaddinfo" name="deladr[oxaddress__oxaddinfo]" value="[{if isset( $deladr.oxaddress__oxaddinfo )}][{$deladr.oxaddress__oxaddinfo}][{else}][{$delivadr->oxaddress__oxaddinfo->value}][{/if}]" />
            </fieldset>*}]

            <fieldset class="form-group">
                <label for="abs-del-oxstreet">[{oxmultilang ident="STREET_AND_STREETNO" suffix="COLON"}]</label>
                <div class="row">
                    <div class="col-xs-12 col-sm-8">
                        <input [{if $oView->isFieldRequired(oxaddress__oxstreet)}]required [{if !$oView->showShipAddress()}]disabled[{/if}][{/if}] type="text" class="form-control" id="abs-del-oxstreet" name="deladr[oxaddress__oxstreet]" placeholder="[{oxmultilang ident="STREET"}]" value="[{if isset( $deladr.oxaddress__oxstreet )}][{$deladr.oxaddress__oxstreet}][{else}][{$delivadr->oxaddress__oxstreet->value}][{/if}]" />
                    </div>
                    <div class="col-xs-12 col-sm-4">
                        <input [{if $oView->isFieldRequired(oxaddress__oxstreetnr)}]required [{if !$oView->showShipAddress()}]disabled[{/if}][{/if}] type="text" class="form-control" id="abs-del-oxstreetnr" name="deladr[oxaddress__oxstreetnr]" placeholder="[{oxmultilang ident="STREETNR"}]" value="[{if isset( $deladr.oxaddress__oxstreetnr )}][{$deladr.oxaddress__oxstreetnr}][{else}][{$delivadr->oxaddress__oxstreetnr->value}][{/if}]" />
                    </div>
                </div>
            </fieldset>

            <fieldset class="form-group">
                <label for="abs-del-oxzip">[{oxmultilang ident="POSTAL_CODE_AND_CITY" suffix="COLON"}]</label>
                <div class="row">
                    <div class="col-xs-12 col-sm-4">
                        <input [{if $oView->isFieldRequired(oxaddress__oxzip)}]required [{if !$oView->showShipAddress()}]disabled[{/if}][{/if}] type="text" class="form-control" id="abs-del-oxzip" name="deladr[oxaddress__oxzip]" placeholder="[{oxmultilang ident="POSTAL_CODE"}]" value="[{if isset( $deladr.oxaddress__oxzip )}][{$deladr.oxaddress__oxzip}][{else}][{$delivadr->oxaddress__oxzip->value}][{/if}]" />
                    </div>
                    <div class="col-xs-12 col-sm-8">
                        <input [{if $oView->isFieldRequired(oxaddress__oxcity)}]required [{if !$oView->showShipAddress()}]disabled[{/if}][{/if}] type="text" class="form-control" id="abs-del-oxcity" name="deladr[oxaddress__oxcity]" placeholder="[{oxmultilang ident="CITY"}]" value="[{if isset( $deladr.oxaddress__oxcity )}][{$deladr.oxaddress__oxcity}][{else}][{$delivadr->oxaddress__oxcity->value}][{/if}]" />
                    </div>
                </div>
            </fieldset>

            [{block name="form_user_shipping_country"}]
                <fieldset class="form-group">
                    <label for="abs-del-country">[{oxmultilang ident="COUNTRY" suffix="COLON"}]</label>
                    <select class="form-control" [{if $oView->isFieldRequired(oxaddress__oxcountryid)}]required [{if !$oView->showShipAddress()}]disabled[{/if}][{/if}] id="abs-del-country" name="deladr[oxaddress__oxcountryid]">
                        [{assign var="blCountrySelected" value=false}]
                        [{foreach from=$oViewConf->getCountryList() item=country key=country_id}]
                            [{assign var="sCountrySelect" value=""}]
                            [{if !$blCountrySelected}]
                                [{if (isset($deladr.oxaddress__oxcountryid) && $deladr.oxaddress__oxcountryid == $country->oxcountry__oxid->value) ||
                                        (!isset($deladr.oxaddress__oxcountryid) && ($delivadr->oxaddress__oxcountry->value == $country->oxcountry__oxtitle->value or
                                        $delivadr->oxaddress__oxcountry->value == $country->oxcountry__oxid->value or
                                        $delivadr->oxaddress__oxcountryid->value == $country->oxcountry__oxid->value))}]
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
                <label for="abs-del-oxcompany">[{oxmultilang ident="COMPANY" suffix="COLON"}]</label>
                <input [{if $oView->isFieldRequired(oxaddress__oxcompany)}]required [{if !$oView->showShipAddress()}]disabled[{/if}][{/if}] type="text" class="form-control" id="abs-del-oxcompany" name="deladr[oxaddress__oxcompany]" placeholder="[{oxmultilang ident="COMPANY"}]" value="[{if isset( $deladr.oxaddress__oxcompany )}][{$deladr.oxaddress__oxcompany}][{else}][{$delivadr->oxaddress__oxcompany->value}][{/if}]" />
            </fieldset>

            <fieldset class="form-group">
                <label for="abs-del-oxfon">[{oxmultilang ident="PHONE" suffix="COLON"}]</label>
                <input [{if $oView->isFieldRequired(oxaddress__oxfon)}]required [{if !$oView->showShipAddress()}]disabled[{/if}][{/if}] type="text" class="form-control" id="abs-del-oxfon" name="deladr[oxaddress__oxfon]" placeholder="[{oxmultilang ident="PHONE"}]" value="[{if isset( $deladr.oxaddress__oxfon )}][{$deladr.oxaddress__oxfon}][{else}][{$delivadr->oxaddress__oxfon->value}][{/if}]" />
            </fieldset>

            [{*<fieldset class="form-group">
            <label for="abs-del-oxfax">[{oxmultilang ident="FAX" suffix="COLON"}]</label>
            <input [{if $delivadr}]disabled[{/if}] [{if $oView->isFieldRequired(oxaddress__oxfax)}]required[{/if}] type="text" class="form-control" id="abs-del-oxfax" name="deladr[oxaddress__oxfax]" value="[{if isset( $deladr.oxaddress__oxfax )}][{$deladr.oxaddress__oxfax}][{else}][{$delivadr->oxaddress__oxfax->value}][{/if}]" />
            </fieldset>*}]
        </div>
    </div>

</div>