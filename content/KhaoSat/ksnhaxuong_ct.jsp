

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    String strVN=DATA.function.xuly_hienthi_truongKS(objks.getNx_loaict());
%>
<div class="col-md-12" id='block_NX'>   
    <div class="box box-primary">
        <div class="box-header with-border">           
            <h2>Thông tin chi thiết nhà xưởng</h2>         
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
            <div class="form-group col-lg-6">
                <label>Loại công trình:</label>
                <div class="radio">
                    <label><h3 class="text-blue"><%=strVN%></h3></label>
                </div> 
            </div>
            <div class="form-group col-lg-6">    
                <label> Ghi chú:</label>               
                <div class="box-body pad">                       
                    <textarea class="textarea" placeholder="thông tin ghi chú" name="nxghichu"
                              style="width: 100%; height: 100px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"><%=objks.getNx_ghichu()%></textarea>
                </div>
            </div>  
            <% if (strVN.contains("Tường bao")) {%>                  
            <div class="form-group col-lg-6">      
                <label>Tường Bao</label>
                <textarea id="ckNXtuongbao" class="textarea"   rows="50" cols="80"
                          style="width: 100%; height:400px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"><%=objks.getNx_tuongbao()%></textarea>
            </div>      
            <%}%>
            <% if (strVN.contains("Cổng vào")) {%>            
            <div class="form-group col-lg-6">      
                <label>Cổng vào</label>
                <textarea id="ckNXcongvao" class="textarea"   rows="50" cols="80" 
                          style="width: 100%; height: 400px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"><%=objks.getNx_cong()%></textarea>
            </div> 
            <%}%>
            <% if (strVN.contains("Nhà bảo vệ")) {%>       
            <div class="form-group col-lg-6">      
                <label>Nhà Bảo Vệ</label>
                <textarea id="ckNXbaove" class="textarea"   rows="50" cols="80" 
                          style="width: 100%; height: 400px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"><%=objks.getNx_baove()%></textarea>
            </div> 
            <%}%>
            <% if (strVN.contains("Trạm cân")) {%>       
            <div class="form-group col-lg-6">      
                <label>Trạm Cân</label>
                <textarea id="ckNXtramcan" class="textarea"   rows="50" cols="80"
                          style="width: 100%; height: 400px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"><%=objks.getNx_tramcan()%></textarea>

            </div> 
            <%}%>
            <% if (strVN.contains("Văn phòng")) {%>       
            <div class="form-group col-lg-6">      
                <label>Văn Phòng</label>
                <textarea id="ckNXvanphong" class="textarea"   rows="50" cols="80" 
                          style="width: 100%; height: 400px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"><%=objks.getNx_vanphong()%></textarea>

            </div> 
            <%}%>
            <% if (strVN.contains("Nhà xưởng")) {%>       
            <div class="form-group col-lg-6">      
                <label>Nhà Xưởng</label>
                <textarea id="ckNXnhaxuong" class="textarea"   rows="50" cols="80" 
                          style="width: 100%; height: 400px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"><%=objks.getNx_nhaxuong()%></textarea>

            </div>          
            <%}%>

        </div>
    </div>
</div>
<script src="bower_components/ckeditor/ckeditor.js"></script>
<script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script>
    $(function () {
        // Replace the <textarea id="editor1"> with a CKEditor
        // instance, using default configuration.

        //bootstrap WYSIHTML5 - text editor
        $('#ckNXtuongbao').wysihtml5();
        $('#ckNXcongvao').wysihtml5();
        $('#ckNXbaove').wysihtml5();
        $('#ckNXtramcan').wysihtml5();
        $('#ckNXvanphong').wysihtml5();
        $('#ckNXnhaxuong').wysihtml5();
    })
</script>

