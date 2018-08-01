<script src="<?php echo base_url()?>assets/js/ckeditor/ckeditor.js"></script>
<script type='text/javascript'>//<![CDATA[
$( document ).ready(function() {
$('[data-toggle="tabajax"]').click(function(e) {
    var $this = $(this),
        loadurl = $this.attr('href'),
        targ = $this.attr('data-target');

    $.get(loadurl, function(data) {
        $(targ).html(data);
    });

    $this.tab('show');
    return false;
});
});//]]> 

</script>

<ul class="nav nav-tabs tabs-up" id="friends">
      <li><a href="wbadmin/slider" data-target="#contacts" class="media_node active span" id="contacts_tab" data-toggle="tabajax" rel="tooltip"> Create slider </a></li>
      <li><a href="wbadmin/article3" data-target="#friends_list" class="media_node span" id="friends_list_tab" data-toggle="tabajax" rel="tooltip"> Friends list</a></li>
      <li><a href="/gh/gist/response.html/3843306/" data-target="#awaiting_request" class="media_node span" id="awaiting_request_tab" data-toggle="tabajax" rel="tooltip">Awaiting request</a></li>
</ul>

<div class="tab-content">
<div class="tab-pane active" id="contacts">

      </div>
      <div class="tab-pane" id="friends_list">

      </div>
      <div class="tab-pane  urlbox span8" id="awaiting_request">

      </div>
    </div>

