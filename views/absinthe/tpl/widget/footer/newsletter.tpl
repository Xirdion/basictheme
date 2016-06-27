<form action="[{$oViewConf->getSslSelfLink()}]" method="post">
    [{$oViewConf->getHiddenSid()}]
    <input type="hidden" name="fnc" value="fill">
    <input type="hidden" name="cl" value="newsletter">
    [{if $oView->getProduct()}]
    [{assign var="product" value=$oView->getProduct() }]
    <input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">
    [{/if}]
    <div class="input-group">
        <span class="input-group-addon" id="abs-newsletter-label">[{oxmultilang ident="NEWSLETTER"}]</span>
        <input required type="email" class="form-control" placeholder="E-Mail Adresse" name="editval[oxuser__oxusername]" aria-describedby="abs-newsletter-label">
        <span class="input-group-btn">
            <button class="btn btn-secondary" type="submit"><i class="fa fa-envelope-o"></i></button>
        </span>
    </div>
</form>