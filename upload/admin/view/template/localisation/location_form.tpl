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
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/country.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
        <a onclick="$('#form').submit();" class="button-save"><?php echo $button_save; ?></a>
        <a onclick="apply();" class="button-save"><?php echo $button_apply; ?></a>
        <a href="<?php echo $cancel; ?>" class="button-cancel"><?php echo $button_cancel; ?></a>
      </div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <table class="form">
        <tr>
          <td><span class="required">*</span> <?php echo $entry_name; ?></td>
          <td><input type="text" name="name" value="<?php echo $name; ?>" size="30" />
          <?php if ($error_name) { ?>
            <span class="error"><?php echo $error_name; ?></span>
          <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_address; ?></td>
          <td><textarea name="address" cols="40" rows="5"><?php echo $address; ?></textarea>
          <?php if ($error_address) { ?>
            <span class="error"><?php echo $error_address; ?></span>
          <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_telephone; ?></td>
          <td><input type="text" name="telephone" value="<?php echo $telephone; ?>" />
          <?php if ($error_telephone) { ?>
            <span class="error"><?php echo $error_telephone; ?></span>
          <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_image; ?></td>
          <td style="vertical-align:top;"><div class="image"><img src="<?php echo $thumb; ?>" alt="" id="thumb" />
            <input type="hidden" name="image" value="<?php echo $image; ?>" id="image" /><br />
            <a onclick="image_upload('image', 'thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb').attr('src', '<?php echo $no_image; ?>'); $('#image').attr('value', '');"><?php echo $text_clear; ?></a>
          </div></td>
        </tr>
		<tr>
          <td><?php echo $entry_latitude; ?></td>
          <td><input type="text" name="latitude" value="<?php echo $latitude; ?>" /> &deg; N</td>
        </tr>
        <tr>
          <td><?php echo $entry_longitude; ?></td>
          <td><input type="text" name="longitude" value="<?php echo $longitude; ?>" /> &deg; E</td>
        </tr>
        <tr>
          <td><?php echo $entry_open; ?></td>
          <td><textarea name="open" cols="40" rows="5"><?php echo $open; ?></textarea></td>
        </tr>
        <tr>
          <td><?php echo $entry_comment; ?></td>
          <td><textarea name="comment" cols="40" rows="5"><?php echo $comment; ?></textarea></td>
        </tr>
      </table>
      </form>
	</div>
  </div>
</div>

<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();

	$('#content').prepend('<div id="dialog" style="padding:3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin:0; display:block; width:100%; height:100%;" frameborder="no" scrolling="auto"></iframe></div>');

	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script>

<?php echo $footer; ?>