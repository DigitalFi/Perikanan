function Populate(){
  var favorite = [];
  $.each($("input[name='id_content']:checked"), function(){
       favorite.push($(this).val());
  });
  $('#tags').val(favorite.join("|"));
}


$('document').ready(function()
{


    $('.select-all').click(function(){
        if(this.checked){
            $(".chk-box").prop("checked", true);
        }else{
            $(".chk-box").prop("checked", false);
        }

        if($(".chk-box:checked").length>0){
           $('#btndelete').prop("disabled",false);
         }else{
           $('#btndelete').prop("disabled",true);
         }
    });
        
    $(".chk-box").click(function()
    {

        if($(".chk-box").length == $(".chk-box:checked").length)
        {
            $(".select-all").prop("checked", true);
        }
        else
        {
            $(".select-all").removeAttr("checked");
        }

        if($(".chk-box:checked").length>0){
           $('#btndelete').prop("disabled",false);
         }else{
           $('#btndelete').prop("disabled",true);
         }
    });

});


function init_grid_data_manipulation(){
  $('.select-all').click(function(){
        if(this.checked){
            $(".chk-box").prop("checked", true);
        }else{
            $(".chk-box").prop("checked", false);
        }

        if($(".chk-box:checked").length>0){
           $('#btndelete').prop("disabled",false);
         }else{
           $('#btndelete').prop("disabled",true);
         }
    });
        
    $(".chk-box").click(function()
    {
        if($(".chk-box").length == $(".chk-box:checked").length)
        {
            $(".select-all").prop("checked", true);
        }
        else
        {
            $(".select-all").removeAttr("checked");
        }

        if($(".chk-box:checked").length>0){
           $('#btndelete').prop("disabled",false);
         }else{
           $('#btndelete').prop("disabled",true);
         }
    });
}

function delete_record (url, frmname) {
  var data = $("#"+frmname+"").serialize(); 
    $.ajax({
        url: url, // link of your "whatever" php
        type: "POST",
        async: true,
        cache: false,
        data: data, // all data will be passed here
        error : function(xhr, ajaxOptions, thrownError){
            console.log(xhr.status);
            console.log(xhr.responseText);
            console.log(thrownError);
            //doModal('Error Info', xhr.responseText);
        },
        success : function(response){
              toastr.options = {
                          timeOut: 3000,
                          positionClass:"toast-bottom-right"
                       };                            
              toastr["info"](response);
              searchFilter(document.getElementById('page_pos').value);
              $('#confirm_del').modal('hide');
        }

    });
 }

function edit_record(id, url, list_container, form_container, tbl_name=''){
   url= url;
   $('#'+list_container+'').hide('slow'); 
   $('#'+form_container+'').show('slow');

   $.ajax({
      type: "POST",
      url: url,
      data: { the_id: id, tblname: tbl_name}, 
      error : function(xhr, ajaxOptions, thrownError){
          console.log(xhr.status);
          console.log(xhr.responseText);
          console.log(thrownError);
      },
      success : function(data){
           $('#'+form_container+'').html(data);
      }
  });
}

function editdata_popup(id, url, edit_container, modal_id, tbl_name){
   $('.loading').show();
   $.ajax({
      type: "POST",
      url: url,
      data: { the_id: id, tblname: tbl_name}, 
      error : function(xhr, ajaxOptions, thrownError){
          console.log(xhr.status);
          console.log(xhr.responseText);
          console.log(thrownError);
      },
      success : function(data){
           $('#'+edit_container+'').html(data);
           $('#'+edit_container+'').show();
           $('#'+modal_id+'').modal('show'); 
           $('.loading').hide();
      }
  });
}

function cascade_dropdown(url, triger_object, impacted_object, single_selection=true){
      $("#"+triger_object+"").change(function() {
          $("#"+impacted_object+"").empty();
          $('#loading_mini').show();
          $.ajax({
              type: 'POST',
              url: url,
              dataType: 'json',
              data: {
                  kodex: $("#"+triger_object+"").val()
              },
              success: function(data) {
                if(single_selection==false){
                  $("#"+impacted_object+"").prepend("<option value=''>-Please Select-</option>").val('');
                }
                  $.each(data, function(index, val) {
                      $("#"+impacted_object+"").append('<option value="' + val.kd + '">'+val.nm + '</option>');
                  });
                  $("#"+impacted_object+"").trigger("chosen:updated");
                  $("#"+impacted_object+"").trigger("liszt:updated");
                  $('#loading_mini').hide();
              },
              error: function(ex) {
                 $("#"+impacted_object+"").empty();
                 $("#"+impacted_object+"").trigger("chosen:updated");
                 $("#"+impacted_object+"").trigger("liszt:updated");
                 $('#loading_mini').hide();
              }
          });
      })
}

function load_content(url_page, container_id, id='', method_name=''){
  alert(method_name);
   $('.loading').show();  
   $.ajax({
      type: "POST",
      url: url_page,
      data: {the_id: id, mtd_name:method_name}, 
      error : function(xhr, ajaxOptions, thrownError){
          console.log(xhr.status);
          console.log(xhr.responseText);
          console.log(thrownError);
      },
      success : function(data){
           $('.loading').hide();
           $("#"+container_id+"").html(data);
      }
  });
}