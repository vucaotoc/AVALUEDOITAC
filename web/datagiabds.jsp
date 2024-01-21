<%@page import="DoiTacNH.objDoiTacNH"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="content-wrapper" style="height: auto;">
    <%
        String req = (String) request.getParameter("data");
        objDoiTacNH avl_login = (objDoiTacNH) session.getAttribute("avl_dangnhap");
    %>
    <% if (req.equals("duan") && avl_login.getCumchucnang().contains("dataduan")) { %>
    <iframe src="https://datastudio.google.com/embed/reporting/cb9aba37-949c-4bcf-a78d-a8884d344d71/page/SaosC" width="100%" height="100%"></iframe>
        <%} else if (req.equals("tuyenduong") && avl_login.getCumchucnang().contains("datatuyenduong")) { %>
    <iframe src="https://datastudio.google.com/embed/reporting/d61dc523-a24f-4551-9559-6e905e9e54bf/page/SaosC" width="100%" height="100%"></iframe>
        <%} else if (req.equals("canho") && avl_login.getCumchucnang().contains("datacanho")) { %>
    <iframe src="https://datastudio.google.com/embed/reporting/a21b3577-404e-453a-a0b6-4cb8cb439427/page/SaosC" width="100%" height="100%"></iframe>
        <%} else {%>
    <section class="content">
        <div class="container-fluid">
            <div class="row">   
                <div class="col-md-12 ">  
                    <div class="card card-warning card-outline-tabs">
                        <div class="card-header">
                            <h3 class="card-title">KHÔNG TIM THẤY</h3> 
                            <div class="card-tools">                     
                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                    <i class="fas fa-minus"></i>
                                </button>                      
                            </div>
                        </div>

                    </div></div></div></div></section>
                    <%}%>
</div>