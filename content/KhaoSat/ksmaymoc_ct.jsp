<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-md-12" id='block_NP'>   
    <div class="box box-primary">
         <div class="box-header with-border">           
            <h2>Thông tin chi thiết máy móc</h2>         
             <div class="pull-right box-tools">
                <button type="button" class="btn btn-info btn-sm" data-widget="collapse" data-toggle="tooltip"
                        title="Collapse">
                  <i class="fa fa-minus"></i></button>
                <button type="button" class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip"
                        title="Remove">
                  <i class="fa fa-times"></i></button>
              </div>
        </div>
        <div class="box-body">   
            <div class="col-lg-12">              
                  <textarea id="editor1" name="mm_thongso" rows="20" cols="80"><%=objks.getMm_thongso()%> </textarea>
            </div>            
        </div>
    </div>
</div>

<script src="bower_components/ckeditor/ckeditor.js"></script>
<script>
  $(function () {
    // Replace the <textarea id="editor1"> with a CKEditor
    // instance, using default configuration.
    CKEDITOR.replace('editor1');
    //bootstrap WYSIHTML5 - text editor
  
  })
</script>