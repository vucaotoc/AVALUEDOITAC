<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="changepassword_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">               
                <h4 class="modal-title" id="myModalLabel">ĐỔI MẬT KHẨU</h4>
            </div>
            <!--/.modal-header-->

            <div class="modal-body">
                <form method="post" id="changeFormSubmit" action="">   
                    <div class="form-group" id="currentPass-group">
                        <label for="current_pass">Mật Khẩu Hiện Tại:</label> <span class="pull-right"> <input  type="checkbox" onclick="showpasswordchange();"  />Hiển thị mật khẩu</span>
                        <input class="form-control" type="password" name="current_pass" id="current_pass">
                    </div>

                    <div class="form-group">
                        <label for="new_pass">Mật Khẩu Mới :</label>
                        <input class="form-control" type="password" name="new_pass" id="new_pass">
                    </div>

                    <div class="form-group">
                        <label for="confirm_pass">Nhập Lại Mật Khẩu:</label>
                        <input class="form-control" type="password" name="confirm_pass" id="confirm_pass">
                    </div>

                    <div class="modal-footer">          
                        <label for="success"></label>
                        <button type="submit" name="submit" class="btn bg-green  pull-right" id="submitForm" value="Save changes">Xác Nhận</button>
                        <a href="logout" id="btnlogout" style="display:none;" class="btn btn-danger btn-flat">Đang Xuất</a>
                        <button type="button" class="btn bg-navy  pull-left" id="btnClose2" data-dismiss="modal">Đóng</button>
                       
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="changeavata_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">               
                <h4 class="modal-title" id="myModalLabel">ĐỔI HÌNH ĐẠI DIỆN</h4>
            </div>
            <!--/.modal-header-->

            <div class="modal-body">
                <form method="post" id="changeavataFormSubmit" action="changeavata" enctype="multipart/form-data" >
                      <div class="form-group">
                        <img src="data/DATADT/avata/<%=avl_login.getAvatar()%>" id="viewavata" width="400" height="400" />

                    </div>
                     <div class="form-group">           
                         <label>Chọn hình đại diện</label>
                        <input type="file" id="fileavatachon" class="form-control" name="avata" onchange="loadFile(event)" accept=".jpg, .png, .jpeg |image/*" />
                    </div>


                    <div class="modal-footer">          
                        <label for="success"></label>
                        <button type="submit" name="submit" class="btn bg-green  pull-right" value="Save changes" onclick="javascript:alert('Xác nhận đổi avata ?');">Xác Nhận</button>                      
                        <button type="button" class="btn bg-navy  pull-left" id="btnClose2" data-dismiss="modal">Đóng</button>
                       
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>



<% if (request.getParameter("hoso") != null) {%>
<jsp:include page="content/HoSo/hoso.jsp" />
<%}else if (request.getParameter("hsct") != null) {%>
<jsp:include page="content/HoSo/hoso_ct.jsp" />
<%}else if (request.getParameter("hssobo") != null) {%>
<jsp:include page="content/DTHoso/hososobo.jsp" />
<%}else if (request.getParameter("hosoks") != null) {%>
<jsp:include page="content/DTHoso/hosokhaosat.jsp" />
<%}else if (request.getParameter("data") != null) {%>
<jsp:include page="datagiabds.jsp" />

<%} else if (request.getParameter("tinraobds") != null) {%>
<jsp:include page="content/TinraoBDS/tinbds.jsp" />
<%} else if (request.getParameter("tinraobdsedit") != null) {%>
<jsp:include page="content/TinraoBDS/tinbds_edit.jsp" />

<%} else if (request.getParameter("doitoado") != null) {%>
<jsp:include page="content/bando/vn2000.jsp" />


<%} else if (request.getParameter("dubaogia") != null) {%>
<jsp:include page="content/dubaogia/dubaogia.jsp" />
<%} else if (request.getParameter("datada") != null) {%>
<jsp:include page="content/dubaogia/datagiaDA.jsp" />
<%} else if (request.getParameter("datacc") != null) {%>
<jsp:include page="content/dubaogia/datagiaCC.jsp" />

<%} else {%>
<jsp:include  page="content/HoSo/hoso.jsp" />
<%}%>