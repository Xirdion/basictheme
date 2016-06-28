# basictheme

module nötig für:
- anzeigen, dass der Artikel bereits auf dem Wunschzettel ist (anpassen von oxwarticledetails.php)
  public function isArticleInWishlist() {
      if ($oUser = $this->getUser()) {
          $oProduct = $this->getProduct();
          $aArticles = $oUser->getBasket("wishlist")->getArticles();
          foreach ($aArticles as $oArticle) {
              if ($oArticle->oxarticles__oxid->value === $oProduct->oxarticles__oxid->value) {
                  return true;
              }
          }
      }
      return false;
  }

- ändern der Adressen mit account-controller (anpassen vom account-controllern mit function aus account-user (showShipAddress())
- abändern von oxcmp_user (changeuser_testvalues()) damit 'account' returnd wird und nicht 'account_user'
