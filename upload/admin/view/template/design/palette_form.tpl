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
      <h1><img src="view/image/palette.png" alt="" /> <?php echo $heading_title; ?></h1>
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
      </table>
      <br />
      <table id="color" class="list">
      <thead>
        <tr>
          <td class="left"><span class="required">*</span> <?php echo $entry_title; ?></td>
          <td class="left"><span class="required">*</span> <?php echo $entry_color; ?></td>
          <td></td>
        </tr>
      </thead>
      <?php $color_row = 0; ?>
      <?php foreach ($palette_colors as $palette_color) { ?>
      <tbody id="color-row<?php echo $color_row; ?>">
        <tr>
          <td class="left"><input type="text" name="palette_color[<?php echo $color_row; ?>][title]" value="<?php echo $palette_color['title']; ?>" size="30" />
          <?php if (isset($error_title[$color_row])) { ?>
            <span class="error"><?php echo $error_title[$color_row]; ?></span>
          <?php } ?></td>
          <td class="left">#<input type="text" name="palette_color[<?php echo $color_row; ?>][color]" value="<?php echo $palette_color['color']; ?>" size="7" maxlength="6" /><span class="color" style="background-color:#<?php echo $palette_color['color']; ?>;"></span>
          <?php if (isset($error_color[$color_row])) { ?>
            <span class="error"><?php echo $error_color[$color_row]; ?></span>
          <?php } ?></td>
          <td class="center"><a onclick="$('#color-row<?php echo $color_row; ?>').remove();" class="button-delete"><?php echo $button_remove; ?></a></td>
        </tr>
      </tbody>
      <?php $color_row++; ?>
      <?php } ?>
      <tfoot>
        <tr>
          <td colspan="2"></td>
          <td class="center"><a onclick="addColor();" class="button"><?php echo $button_add_color; ?></a></td>
        </tr>
      </tfoot>
      </table>
    </form>
    </div>
  </div>
</div>

<script type="text/javascript"><!--
var color_row = <?php echo $color_row; ?>;

function addColor() {
	html  = '<tbody id="color-row' + color_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><input type="text" name="palette_color[' + color_row + '][title]" value="" size="30" /></td>';
	html += '    <td class="left">#<input type="text" name="palette_color[' + color_row + '][color]" value="" size="7" maxlength="6" /><span class="color" style="background-color:#F8F8F8;">?</span></td>';
	html += '    <td class="center"><a onclick="$(\'#color-row' + color_row + '\').remove();" class="button-delete"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';

	$('#color > tfoot').before(html);

	color_row++;
}
//--></script>

<?php echo $footer; ?>