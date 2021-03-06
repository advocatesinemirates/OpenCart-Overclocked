<?php echo $header; ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <?php echo $breadcrumb['separator']; ?>
      <div itemscope itemtype="http://data-vocabulary.org/Breadcrumb" style="display:inline;">
        <a href="<?php echo $breadcrumb['href']; ?>" itemprop="url"><span itemprop="title"><?php echo $breadcrumb['text']; ?></span></a>
      </div>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <div class="product-info">
    <?php if ($thumb || $images) { ?>
      <div class="left">
      <?php if ($lightbox == 'magnific') { ?>
        <?php if ($thumb) { ?>
          <?php if (!$label && $offers) { ?>
            <div class="promo-large"><img src="catalog/view/theme/<?php echo $template; ?>/image/labels/offer-75x75.png" alt="" /></div>
          <?php } ?>
          <div class="image">
            <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="magnific"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a>
          </div>
        <?php } ?>
        <?php if ($images) { ?>
          <div class="image-additional" style="width:<?php echo $images_offset; ?>px;">
            <?php foreach ($images as $image) { ?>
              <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="magnific"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
            <?php } ?>
          </div>
        <?php } ?>
      <?php } ?>
      <?php if ($lightbox == 'zoomlens') { ?>
        <?php if ($thumb) { ?>
          <?php if (!$label && $offers) { ?>
            <div class="promo-large"><img src="catalog/view/theme/<?php echo $template; ?>/image/labels/offer-75x75.png" alt="" /></div>
          <?php } ?>
          <div class="simpleLens-gallery-container" id="zoom">
            <div class="simpleLens-container">
              <div class="simpleLens-big-image-container">
                <a class="simpleLens-lens-image" data-lens-image="<?php echo $zoom; ?>"><img src="<?php echo $thumb; ?>" class="simpleLens-big-image" alt="" /></a>
              </div>
            </div>
            <div class="simpleLens-thumbnails-container">
              <a href="#" class="simpleLens-thumbnail-wrapper" data-lens-image="<?php echo $zoom; ?>" data-big-image="<?php echo $popup; ?>"><img src="<?php echo $gallery_thumb; ?>" alt="" /></a>
              <?php foreach ($images as $image) { ?>
                <a href="#" class="simpleLens-thumbnail-wrapper" data-lens-image="<?php echo $image['zoom']; ?>" data-big-image="<?php echo $image['popup']; ?>"><img src="<?php echo $image['thumb']; ?>" alt="" /></a>
              <?php } ?>
            </div>
          </div>
        <?php } ?>
      <?php } ?>
      </div>
    <?php } ?>
    <div class="right" style="margin-left:<?php echo $column_offset; ?>px;">
      <div class="description">
        <?php if ($manufacturer) { ?>
          <span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
        <?php } ?>
        <span><?php echo $text_model; ?></span> <?php echo $model; ?><br />
        <?php if ($reward) { ?>
          <span><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
        <?php } ?>
        <span><?php echo $text_stock; ?></span> <?php echo $stock; ?><br />
		<?php if ($locations) { ?>
          <span><?php echo $text_location; ?></span>&nbsp;
          <?php for ($i = 0; $i < count($locations); $i++) { ?>
            <?php if ($i < (count($locations) - 1)) { ?>
              <?php if (isset($locations[$i]['name'])) { ?>
                <?php echo $locations[$i]['name']; ?>,&nbsp;
              <?php } ?>
            <?php } else { ?>
              <?php if (isset($locations[$i]['name'])) { ?>
                <?php echo $locations[$i]['name']; ?>
              <?php } ?>
            <?php } ?>
          <?php } ?>
        <?php } ?>
        <?php if ($colors) { ?>
          <?php foreach ($colors as $color) { ?>
            <span class="color" style="background-color:#<?php echo $color['color']; ?>;"></span>
          <?php } ?><br />
        <?php } ?>
      </div>
      <?php if ($price) { ?>
        <div class="price"><?php echo $text_price; ?>
          <?php if (!$special) { ?>
            <?php echo $price; ?>
          <?php } else { ?>
            <span class="price-old"><?php echo $price; ?></span> <span class="price-new"><?php echo $special; ?></span>
          <?php } ?>
          <br />
          <?php if ($tax) { ?>
            <span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span><br />
          <?php } ?>
          <?php if ($points) { ?>
            <span class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></span><br />
          <?php } ?>
          <?php if ($discounts) { ?>
            <br />
            <div class="discount">
              <?php foreach ($discounts as $discount) { ?>
                <?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
              <?php } ?>
            </div>
          <?php } ?>
        </div>
      <?php } ?>
      <?php if ($profiles) { ?>
        <div class="option">
          <h2><span class="required">*</span> <?php echo $text_payment_profile; ?></h2>
          <br />
          <select name="profile_id">
            <option value=""><?php echo $text_select; ?></option>
            <?php foreach ($profiles as $profile) { ?>
              <option value="<?php echo $profile['profile_id']; ?>"><?php echo $profile['name']; ?></option>
            <?php } ?>
          </select>
          <br />
          <br />
          <span id="profile-description"></span>
          <br />
          <br />
        </div>
      <?php } ?>
      <?php if ($options) { ?>
        <div class="options">
          <h2><?php echo $text_option; ?></h2>
          <br />
          <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
              <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                  <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br />
                <select name="option[<?php echo $option['product_option_id']; ?>]">
                  <option value=""><?php echo $text_select; ?></option>
                  <?php foreach ($option['option_value'] as $option_value) { ?>
                    <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                      (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                    </option>
                  <?php } ?>
                </select>
              </div>
              <br />
            <?php } ?>
            <?php if ($option['type'] == 'radio') { ?>
              <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                  <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br />
                <?php foreach ($option['option_value'] as $option_value) { ?>
                  <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                  <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                  <?php } ?>
                  </label>
                  <br />
                <?php } ?>
              </div>
              <br />
            <?php } ?>
            <?php if ($option['type'] == 'checkbox') { ?>
              <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                  <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br />
                <?php foreach ($option['option_value'] as $option_value) { ?>
                  <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                  <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                  <?php } ?>
                  </label>
                  <br />
                <?php } ?>
              </div>
              <br />
            <?php } ?>
            <?php if ($option['type'] == 'image') { ?>
              <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                  <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br />
                <table class="option-image">
                  <?php foreach ($option['option_value'] as $option_value) { ?>
                    <tr>
                      <td style="width:1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
                      <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price']) ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''; ?>" /></label></td>
                      <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                        <?php if ($option_value['price']) { ?>
                          (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                        <?php } ?>
                      </label></td>
                    </tr>
                  <?php } ?>
                </table>
              </div>
              <br />
            <?php } ?>
            <?php if ($option['type'] == 'text') { ?>
              <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                  <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br />
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
              </div>
              <br />
            <?php } ?>
            <?php if ($option['type'] == 'textarea') { ?>
              <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                  <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br />
                <textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
              </div>
              <br />
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
              <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                  <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br />
                <input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="button">
                <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
              </div>
              <br />
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
              <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                  <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br />
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
              </div>
              <br />
            <?php } ?>
            <?php if ($option['type'] == 'datetime') { ?>
              <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                  <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br />
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
              </div>
              <br />
            <?php } ?>
            <?php if ($option['type'] == 'time') { ?>
              <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                  <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br />
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
              </div>
              <br />
            <?php } ?>
          <?php } ?>
        </div>
      <?php } ?>
      <div class="cart">
        <div>
          <img src="catalog/view/theme/<?php echo $template; ?>/image/quantity-minus.png" alt="" style="cursor:pointer;" onclick="buttonminus(<?php echo $minimum; ?>);" />
          <input type="text" name="quantity" id="quantity" size="2" value="<?php echo $minimum; ?>" />
          <img src="catalog/view/theme/<?php echo $template; ?>/image/quantity-plus.png" alt="" style="cursor:pointer;" onclick="buttonplus();" />
          <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
          &nbsp;
          <input type="button" value="<?php echo $button_cart; ?>" id="button-cart" class="button-cart" />
          <span class="links">
            <a onclick="addToWishList('<?php echo $product_id; ?>');" class="button-add"><img src="catalog/view/theme/<?php echo $template; ?>/image/add-wishlist.png" alt="<?php echo $button_wishlist; ?>" title="<?php echo $button_wishlist; ?>" /></a>
            <a onclick="addToCompare('<?php echo $product_id; ?>');" class="button-add"><img src="catalog/view/theme/<?php echo $template; ?>/image/add-compare.png" alt="<?php echo $button_compare; ?>" title="<?php echo $button_compare; ?>" /></a>
          </span>
        </div>
        <?php if ($minimum > 1) { ?>
          <div class="minimum"><?php echo $text_minimum; ?></div>
        <?php } ?>
      </div>
      <?php if ($review_status) { ?>
        <div class="review">
          <div class="rating">
            <img src="catalog/view/theme/<?php echo $template; ?>/image/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" />&nbsp;&nbsp;&nbsp;
            <a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $reviews; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $text_write; ?></a>
          </div>
          <div class="share">
            <div class="addthis_toolbox addthis_default_style">
              <a class="addthis_button_print"></a>
              <a class="addthis_button_email"></a>
              <a class="addthis_button_preferred_1"></a>
              <a class="addthis_button_preferred_2"></a>
              <a class="addthis_button_preferred_3"></a>
              <a class="addthis_button_compact"><?php echo $text_share; ?></a> 
            </div>
            <?php if ($addthis) { ?>
              <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=<?php echo $addthis; ?>"></script>
            <?php } else { ?>
              <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js"></script> 
            <?php } ?>
          </div>
        </div>
      <?php } ?>
    </div>
  </div>
  <div id="tabs" class="htabs">
    <a href="#tab-description"><?php echo $tab_description; ?></a>
    <?php if ($attribute_groups) { ?>
      <a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
    <?php } ?>
    <?php if ($offers) { ?>
      <a href="#tab-offer"><?php echo $tab_offer; ?> (<?php echo count($offers); ?>)</a>
    <?php } ?>
    <?php if ($review_status) { ?>
      <a href="#tab-review"><?php echo $tab_review; ?></a>
    <?php } ?>
    <?php if ($products) { ?>
      <a href="#tab-related"><?php echo $tab_related; ?> (<?php echo count($products); ?>)</a>
    <?php } ?>
  </div>
  <div id="tab-description" class="tab-content"><?php echo $description; ?></div>
  <?php if ($attribute_groups) { ?>
    <div id="tab-attribute" class="tab-content">
      <table class="attribute">
        <?php foreach ($attribute_groups as $attribute_group) { ?>
          <thead>
            <tr>
              <td colspan="2"><?php echo $attribute_group['name']; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
              <tr>
                <td><?php echo $attribute['name']; ?></td>
                <td><?php echo $attribute['text']; ?></td>
              </tr>
            <?php } ?>
          </tbody>
        <?php } ?>
      </table>
    </div>
  <?php } ?>
  <?php if ($offers) { ?>
    <div id="tab-offer" class="tab-content">
      <div class="box-product">
      <?php foreach ($offers as $offer) { ?>
        <div>
          <?php if (!$label) { ?>
            <div class="promo-medium"><img src="catalog/view/theme/<?php echo $template; ?>/image/labels/offer-45x45.png" alt="" /></div>
          <?php } ?>
          <?php if ($offer['thumb']) { ?>
            <div class="image"><a href="<?php echo $offer['href']; ?>"><img src="<?php echo $offer['thumb']; ?>" alt="<?php echo $offer['name']; ?>" /></a></div>
          <?php } ?>
          <div class="name"><a href="<?php echo $offer['href']; ?>"><?php echo $offer['name']; ?></a></div>
          <div class="offer"><a href="<?php echo $offer['href']; ?>"><?php echo $offer['group']; ?></a></div>
        </div>
      <?php } ?>
      </div>
    </div>
  <?php } ?>
  <?php if ($review_status) { ?>
    <div id="tab-review" class="tab-content">
      <div id="review"></div>
      <div id="add-review">
        <h2 id="review-title"><?php echo $text_write; ?></h2>
        <div>
          <input type="text" name="name" value="" placeholder="<?php echo $entry_name; ?>" size="30" />
        </div>
        <div>
          <textarea name="text" cols="40" rows="3" placeholder="<?php echo $entry_review; ?>"></textarea>
          <br /><?php echo $text_note; ?>
        </div>
        <div class="review-rating">
          <b><?php echo $entry_rating; ?></b>
          <?php echo $entry_bad; ?>
          <input type="radio" name="rating" value="1" />
          <input type="radio" name="rating" value="2" />
          <input type="radio" name="rating" value="3" />
          <input type="radio" name="rating" value="4" />
          <input type="radio" name="rating" value="5" />
          <?php echo $entry_good; ?>
        </div>
        <div class="captcha">
          <b><?php echo $entry_captcha; ?></b><br />
          <input type="text" name="captcha" value="" autocomplete="off" />
          <br />
          <img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
        </div>
        <div><a id="button-review" class="button"><?php echo $button_continue; ?></a></div>
      </div>
    </div>
  <?php } ?>
  <?php if ($products) { ?>
    <div id="tab-related" class="tab-content">
      <div class="box-product">
      <?php foreach ($products as $product) { ?>
        <div>
          <?php if (!$label && $product['offer']) { ?>
            <div class="promo-medium"><img src="catalog/view/theme/<?php echo $template; ?>/image/labels/offer-45x45.png" alt="" /></div>
          <?php } ?>
          <?php if ($product['thumb']) { ?>
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
          <?php } ?>
          <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
          <?php if ($product['price']) { ?>
            <div class="price">
              <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
              <?php } else { ?>
                <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
              <?php } ?>
            </div>
          <?php } ?>
          <?php if ($product['rating']) { ?>
            <div class="rating"><img src="catalog/view/theme/<?php echo $template; ?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
          <?php } ?>
          <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button"><?php echo $button_cart; ?></a>
	    </div>
      <?php } ?>
      </div>
    </div>
  <?php } ?>
  <?php if ($tags) { ?>
    <div class="tags"><b><?php echo $text_tags; ?></b>
    <?php for ($i = 0; $i < count($tags); $i++) { ?>
      <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
      <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
      <?php } ?>
    <?php } ?>
   </div>
  <?php } ?>
  <?php echo $content_bottom; ?>
</div>

<?php if ($lightbox == 'magnific') { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.magnific').magnificPopup({
		type: 'image',
		gallery: {enabled:true},
		retina: {
			ratio: 2,
			replaceSrc: function(item, ratio) {
				return item.src.replace(/\.\w+$/, function(m) {return '@2x' + m;});
			}
		}
	});
});
//--></script>
<?php } ?>

<?php if ($lightbox == 'zoomlens') { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#zoom .simpleLens-thumbnails-container img').click(function(event) {
        event.preventDefault();
        return false;
	});
	$('#zoom .simpleLens-thumbnails-container img').simpleGallery();
	$('#zoom .simpleLens-big-image').simpleLens();
});
//--></script>
<?php } ?>

<script type="text/javascript"><!--
$('#quantity').parent().children().css('vertical-align', 'middle');

function buttonminus(a) {
	var b = document.getElementById("quantity");
	if (b.value > a) {
		document.getElementById("quantity").value--;
	} else {
		document.getElementById("quantity").value=a;
	}
}

function buttonplus() {
	document.getElementById("quantity").value++;
}
//--></script>

<script type="text/javascript"><!--
$('select[name="profile_id"], input[name="quantity"]').change(function() {
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name="product_id"], input[name="quantity"], select[name="profile_id"]'),
		dataType: 'json',
		beforeSend: function() {
			$('#profile-description').html('');
		},
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();

			if (json['success']) {
				$('#profile-description').html(json['success']);
			}
		}
	});
});

$('#button-cart').bind('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}

				if (json['error']['profile']) {
					$('select[name="profile_id"]').after('<span class="error">' + json['error']['profile'] + '</span>');
				}
			}

			if (json['success']) {
				$('#notification').html('<div class="success" style="display:none;">' + json['success'] + '<img src="catalog/view/theme/<?php echo $template; ?>/image/close.png" alt="" class="close" /></div>');

				$('.success').fadeIn('slow');

				$('#cart-total').html(json['total']);

				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}
		}
	});
});
//--></script>

<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>

<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
	action: 'index.php?route=product/product/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/<?php echo $template; ?>/image/loading.gif" alt="" class="loading" style="padding-left:5px;" />');
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);

		$('.error').remove();

		if (json['success']) {
			alert(json['success']);

			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
		}

		if (json['error']) {
			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
		}

		$('.loading').remove();
	}
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>

<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').fadeOut('slow');
	$('#review').load(this.href);
	$('#review').fadeIn('slow');

	return false;
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/<?php echo $template; ?>/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
			$('#captcha').attr('src', 'index.php?route=product/product/captcha');
			$('input[name=\'captcha\']').val('');
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
			}

			if (data['success']) {
				$('#review-title').after('<div class="success">' + data['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script>

<script type="text/javascript"><!--
$(document).ready(function() {
	$('#tabs a').tabs();
});
//--></script>

<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script>

<script type="text/javascript"><!--
$(document).ready(function() {
	if ($.browser.msie && $.browser.version == 6) {
		$('.date, .datetime, .time').bgIframe();
	}

	$('.date').datepicker({dateFormat: 'yy-mm-dd'});

	$('.datetime').datetimepicker({
		dateFormat: 'yy-mm-dd',
		timeFormat: 'h:m'
	});

	$('.time').timepicker({timeFormat: 'h:m'});
});
//--></script>

<?php echo $footer; ?>