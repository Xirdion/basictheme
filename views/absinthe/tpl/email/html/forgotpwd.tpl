[{assign var="shop"      value=$oEmailView->getShop()}]
[{assign var="oViewConf" value=$oEmailView->getViewConfig()}]
[{assign var="user"      value=$oEmailView->getUser()}]

[{include file="email/html/header.tpl" title=$shop->oxshops__oxname->value}]

    <p style="text-align:left;font-family:Helvetica,Arial,sans-serif;font-size:14px;margin-bottom:0;color:#777777;line-height:135%;">
        [{oxcontent ident="oxupdatepassinfoemail"}]
    </p>

[{include file="email/html/footer.tpl"}]
