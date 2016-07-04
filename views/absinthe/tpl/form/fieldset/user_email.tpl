
[{* TODO: add inline check *}]

[{oxscript include="js/widgets/abs-oxenterpassword.js" priority=10 }]

[{* TODO: include in js *}]
[{* TODO: why do we need this? *}]
[{*oxscript add="$('.oxValidate_enterPass').oxEnterPassword();"*}]

<div class="row">
    <div class="col-lg-6 col-sm-8 col-xs-12">
        <fieldset class="form-group req">
            <label for="abs-user-oxusername">[{oxmultilang ident="EMAIL_ADDRESS" suffix="COLON"}]</label>
            <input required type="email" class="form-control oxValidate_enterPass oxValidate_enterPassTarget[oxValidate_pwd]" id="abs-user-oxusername" name="invadr[oxuser__oxusername]" placeholder="your@mail.com" value="[{if isset( $invadr.oxuser__oxusername )}][{$invadr.oxuser__oxusername}][{else}][{$oxcmp_user->oxuser__oxusername->value}][{/if}]" />
        </fieldset>

        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxpassword}]

        <fieldset class="form-group oxValidate_pwd req" [{if !$aErrors.oxuser__oxpassword}]style="display:none;"[{/if}]>
            <label for="abs-user-pwd">[{oxmultilang ident="PASSWORD" suffix="COLON"}]</label>
            [{* currently disabled field *}]
            <input disabled required type="password" class="form-control" id="abs-user-pwd" name="user_password" />
        </fieldset>
    </div>
</div>