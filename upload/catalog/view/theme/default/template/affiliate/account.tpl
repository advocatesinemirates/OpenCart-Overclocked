<?php echo $header; ?>
<?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
<?php } ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <h2><?php echo $text_my_account; ?></h2>
  <div class="content">
    <div class="box-account">
      <ul>
        <li><a href="<?php echo $edit; ?>"><img src="catalog/view/theme/<?php echo $template; ?>/image/account/account.png" alt="" /><?php echo $text_edit; ?></a></li>
        <li><a href="<?php echo $password; ?>"><img src="catalog/view/theme/<?php echo $template; ?>/image/account/password.png" alt="" /><?php echo $text_password; ?></a></li>
        <li><a href="<?php echo $payment; ?>"><img src="catalog/view/theme/<?php echo $template; ?>/image/account/payment.png" alt="" /><?php echo $text_payment; ?></a></li>
      </ul>
    </div>
  </div>
  <h2><?php echo $text_my_tracking; ?></h2>
  <div class="content">
    <div class="box-account">
      <ul>
        <li><a href="<?php echo $tracking; ?>"><img src="catalog/view/theme/<?php echo $template; ?>/image/account/tracking.png" alt="" /><?php echo $text_tracking; ?></a></li>
      </ul>
    </div>
  </div>
  <h2><?php echo $text_my_transactions; ?></h2>
  <div class="content">
    <div class="box-account">
      <ul>
        <li><a href="<?php echo $transaction; ?>"><img src="catalog/view/theme/<?php echo $template; ?>/image/account/transaction.png" alt="" /><?php echo $text_transaction; ?></a></li>
      </ul>
    </div>
  </div>
  <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>