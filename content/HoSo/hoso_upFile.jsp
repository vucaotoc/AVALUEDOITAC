<%@page import="java.util.ArrayList"%>
<%@page import="HoSo.objHAPhapLy"%>
<%@page import="HoSo.objHoSo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if (session.getAttribute("listfile_hs") != null && session.getAttribute("hsedit_hs") != null) {
        objHoSo objhs = (objHoSo) session.getAttribute("hsedit_hs");
        ArrayList<objHAPhapLy> arrFile = (ArrayList<objHAPhapLy>) session.getAttribute("listfile_hs");
%>
<section class="content-header">
    <h1>
        <h2>NHẬP THÔNG TIN CHỨNG THƯ</h2>
        <a href="hoso?id=<%=objhs.getIdhs()%>"  class="btn btn-warning" >Quay về</a>
    </h1>           
</section>

<div class="row">   
    <div class="col-md-12">   
        <form  role="form"  method="post" id="frmkhadd" enctype="multipart/form-data" action="upfhoso" onsubmit="return(validate());"> 
            <div class="box box-success">
                <div class="box-header with-border">     
                    <h2>Chọn file upload</h2>  
                    <input id='uploadkem' type="file"  name="filekem" size="10"  multiple="true"  title="chọn hồ sơ" />
                    <div id="showfilename"></div>
                </div> 
                <div class="box-body">
                    <input type="submit" class="btn btn-success" name="upfilehoso" value="Upload Hồ Sơ"/>
                </div>
            </div>

        </form>
    </div>

    <div class="col-md-6">   
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">Danh Sách File Hồ Sơ Upload</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
                <table class="table table-striped">
                    <tr>                  
                        <th>Files</th>  
                        <th style="width: 40px"></th>
                        <th style="width: 40px"></th>
                    </tr>
                    <%
                        if (arrFile.size() > 0) {
                            for (objHAPhapLy obj : arrFile) {%>

                    <tr>                  
                        <td><a href="#"><%=obj.getTenha()%></a><br/> </td>                  
                        <td> <a href="upfhoso?down=<%=obj.getIdha()%>" ><span class="badge bg-blue">Tải về</span></a></td>
                        <td> <a href="upfhoso?del=<%=obj.getIdha()%>" ><span class="badge bg-red">Xóa</span></a></td>
                    </tr>

                    <%}
                        }%>
                </table>
            </div>
            <!-- /.box-body -->
        </div>
    </div>
</div>
<script type="text/javascript">
    $('#uploadkem').on('change', function () {
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