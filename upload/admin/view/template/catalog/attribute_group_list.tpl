<?php echo $header; ?>
<div id="content">
	<div class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php } ?>
	</div>
	<?php if ($error_warning) { ?>
		<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>
	<?php if ($success) { ?>
		<div class="success"><?php echo $success; ?></div>
	<?php } ?>
	<div class="box">
	<div class="heading">
		<h1><img src="view/image/product-add.png" alt="" /> <?php echo $heading_title; ?></h1>
		<div class="buttons">
			<a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a>
			<a onclick="$('form').submit();" class="button-delete"><?php echo $button_delete; ?></a>
		</div>
	</div>
	<div class="content">
	<?php if ($navigation_hi) { ?>
      <div class="pagination" style="margin-bottom:10px;"><?php echo $pagination; ?></div>
    <?php } ?>
	<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
		<table class="list">
          <thead>
			<tr>
				<td width="1" style="text-align:center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
				<td class="left"><?php if ($sort == 'agd.name') { ?>
					<a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
				<?php } else { ?>
					<a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?>&nbsp;&nbsp;<img src="view/image/asc.png" alt="" /></a>
				<?php } ?></td>
				<td class="right"><?php if ($sort == 'ag.sort_order') { ?>
					<a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
				<?php } else { ?>
					<a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?>&nbsp;&nbsp;<img src="view/image/asc.png" alt="" /></a>
				<?php } ?></td>
				<td class="right"><?php echo $column_action; ?></td>
			</tr>
          </thead>
          <tbody>
		<?php if ($attribute_groups) { ?>
			<?php foreach ($attribute_groups as $attribute_group) { ?>
			<tr>
				<td style="text-align:center;"><?php if ($attribute_group['selected']) { ?>
					<input type="checkbox" name="selected[]" value="<?php echo $attribute_group['attribute_group_id']; ?>" checked="checked" />
				<?php } else { ?>
					<input type="checkbox" name="selected[]" value="<?php echo $attribute_group['attribute_group_id']; ?>" />
				<?php } ?></td>
				<td class="left"><?php echo $attribute_group['name']; ?></td>
				<td class="right"><?php echo $attribute_group['sort_order']; ?></td>
				<td class="right"><?php foreach ($attribute_group['action'] as $action) { ?>
					<a href="<?php echo $action['href']; ?>" class="button-form"><?php echo $action['text']; ?></a>
				<?php } ?></td>
			</tr>
			<?php } ?>
		<?php } else { ?>
			<tr>
				<td class="center" colspan="4"><?php echo $text_no_results; ?></td>
			</tr>
		<?php } ?>
          </tbody>
		</table>
	</form>
	<?php if ($navigation_lo) { ?>
      <div class="pagination"><?php echo $pagination; ?></div>
	<?php } ?>
	</div>
	</div>
</div>
<?php echo $footer; ?>