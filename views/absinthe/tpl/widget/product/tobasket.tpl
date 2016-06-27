<div class="input-group pull-sm-right abs-to-basket m-b-2">
    <input type="number" min="1" class="form-control" name="am" value="1">
    <span class="input-group-btn">
        <button [{if !$blCanBuy}]disabled[{/if}] class="btn btn-secondary" type="submit" title="[{oxmultilang ident="TO_CART"}]"><i class="fa fa-shopping-cart"></i></button>
    </span>
</div>