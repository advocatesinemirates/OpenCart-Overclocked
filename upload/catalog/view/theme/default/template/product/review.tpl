<?php if ($reviews) { ?>
  <?php foreach ($reviews as $review) { ?>
    <h2><?php echo $text_latest; ?></h2>
    <div class="review-list">
      <div class="author"><b><?php echo $review['author']; ?></b> <?php echo $text_on; ?> <?php echo $review['date_added']; ?></div>
      <div class="rating"><img src="catalog/view/theme/<?php echo $template; ?>/image/stars-<?php echo $review['rating'] . '.png'; ?>" alt="<?php echo $review['reviews']; ?>" /></div>
      <div class="text"><?php echo $review['text']; ?></div>
    </div>
  <?php } ?>
  <div class="pagination"><?php echo $pagination; ?></div>
<?php } else { ?>
  <h2><?php echo $text_latest; ?></h2>
  <div class="content"><?php echo $text_no_reviews; ?></div>
<?php } ?>