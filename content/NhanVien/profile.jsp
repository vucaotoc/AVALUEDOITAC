<%@page import="NhanVien.objNhanVien"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="content-header">
    <h1>
        THÔNG TIN TỔNG HỢP NHÂN VIÊN
        <a href="#"  class="btn btn-warning" onclick="goBack();" >Quay về</a>
    </h1>           
</section>
<%
    objNhanVien profilenv = (objNhanVien) session.getAttribute("profilenv");
    if (profilenv.getProfile_embed().length() > 0) {%>
<iframe src="<%=profilenv.getProfile_embed()%>" 
        frameborder="0" style="overflow:hidden;overflow-x:hidden;overflow-y:hidden;height:100%;width:100%;top:0px;left:0px;right:0px;bottom:0px" 
        height="150%" width="150%"></iframe>
    <% } else {%>
<h2>Không tìm thấy bảng tổng hợp của bạn.</h2>
<% }%>