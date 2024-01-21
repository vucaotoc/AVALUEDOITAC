<%@page import="HoSo.objHAPhapLy"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if (session.getAttribute("hsedit_hs") != null) {
       TaiSan.objTaiSan objts = (TaiSan.objTaiSan) session.getAttribute("tsedit");
        ArrayList<objHAPhapLy> arrHA = (ArrayList<objHAPhapLy>) session.getAttribute("hsedit_HAPL");        
%>
<section class="content-header">
    <h1>
        <h2>PHÁP LÝ TÀI SẢN [<%=objts.getIdts()%>]</h2>
        <a href="taisan?id=<%=objts.getIdts()%>"  class="btn btn-warning" >Quay về</a>
    </h1>           
</section>

<div class="row">
    <div class="col-md-12">   
        <div class="box box-warning">
            <div class="box-header with-border">
                
                <div class="form-group">
                    <label>Chọn file upload</label>
                </div>
                
                <form method="post" action="phaply" enctype="multipart/form-data" onsubmit="return(validate());" >
                    <div class="col-lg-6">                        
                        <input type="file" name="file" size="10" multiple="true" class="form-control" id="fileupload" />
                        <div id="showfilename"></div>
                    </div>                    
                    <div class="col-lg-6">
                        <input type="submit" value="Upload" name="upload" class="btn bg-green-active btn-flat margin-r-5" />
                    </div>
                </form>
            </div>
            <div class="box-body">  
                <table class="table table-striped">
                    <tr>                  
                        <th>Files</th>  
                        <th style="width: 40px"></th>
                        <th style="width: 40px"></th>
                    </tr>
                    <%
                        if (arrHA.size() > 0) {
                            for (objHAPhapLy obj : arrHA) {
                    %>

                    <tr>                  
                        <td><a href="data/<%=obj.getfullPath()%>" target="_blank"><%=obj.getTenha()%> </a><br/> </td>                  
                        <td> <a href="upfhoso?down=<%=obj.getIdha()%>" ><span class="badge bg-blue">Tải về</span></a></td>
                        <td> <a href="upfhoso?del=<%=obj.getIdha()%>" ><span class="badge bg-red">Xóa</span></a></td>
                    </tr>

                    <%}
                        }%>
                </table>

             
            </div>
        </div>
    </div>
</div>
<script>

   
    $('#fileupload').on('change', function () {
        var files = '';
        for (var i = 0; i < $(this)[0].files.length; i++) {
            files += "<a href=\"#\" >" + $(this)[0].files[i].name + "</a><br/>";
        }
        document.getElementById('showfilename').innerHTML = files;
    });

    function validate() {
        var inputField = document.getElementById('uploadkem');
        if (inputField.files.length === 0) {
            alert("Vui lòng chọn file để upload");
            inputField.focus();
            return false;
        }
    }
</script>
<%}%>