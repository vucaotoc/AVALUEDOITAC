<%@page contentType="text/html" pageEncoding="UTF-8"%>
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="home" class="brand-link">
        <img src="hinhanh/logo.png" alt="AVLAUE" class="brand-image img-circle elevation-3" style="opacity: 0.8">
        <span class="brand-text font-weight-light">AVALUE APP</span>
    </a>
    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="data/DATADT/avata/<%=avl_login.getAvatar()%>" class="img-circle elevation-2" alt="">
            </div>
            <div class="info">
                <a href="#"  data-toggle="modal"  data-backdrop="static" data-keyboard="false" data-target="#changenvdetail_modal">Xin chào <%=avl_login.getTencanbo()%></a>
            </div>
        </div>

        <nav class="mt-2">                   
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">      
                <li class="nav-item">
                    <a href="hoso"  class="nav-link  <% if (request.getParameter("hoso") != null || request.getParameter("home") != null) {%>active<%}%>">
                        <i class="nav-icon fa fa-folder"></i>
                        <p>Hồ Sơ</p>
                    </a>
                </li>       
                <li class="nav-item">
                    <a href="hosodt"  class="nav-link  <% if (request.getParameter("hssobo") != null) {%>active<%}%>">
                        <i class="nav-icon fa fa-flag"></i>
                        <p>Yêu Cầu Sơ Bộ</p>
                    </a>
                </li>    
                <li class="nav-item">
                    <a href="hosoks"  class="nav-link  <% if (request.getParameter("hosoks") != null) {%>active<%}%>">
                        <i class="nav-icon fa fa-flag-checkered"></i>
                        <p>Yêu Cầu Khảo Sát</p>
                    </a>
                </li>  
                <li class="nav-item">
                    <a href="tinraobds" class="nav-link <% if (request.getParameter("tinraobds") != null) {%>active<%}%>">
                        <i class="nav-icon fa fa-newspaper"></i>
                        <p>Tin Rao BĐS</p>
                    </a>
                </li>
               
                <li class="nav-item">
                    <a href="TraCuuKhungGia.html"  target="_blank" class="nav-link" >
                        <i class="nav-icon fa fa-credit-card" aria-hidden="true"></i>
                        <p>Khung Giá Đất</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="https://thongtinquyhoach.hochiminhcity.gov.vn"  target="_blank" class="nav-link" >
                        <i class="nav-icon fa fa-map"></i><p>Quy Hoạch HCM</p>
                    </a>
                </li>
                 <% if(avl_login.getCumchucnang () 
                        .contains("avaluemaps")){ %>
                <li class="nav-item">
                    <a href="maps"  target="_blank" class="nav-link" >
                        <i class="nav-icon fa fa-map"></i><p>AVALUE Maps</p>
                    </a>
                </li>
                 <%}%>
                <li class="nav-item">
                    <a href="home?xemtrang=doitoado"   class="nav-link ">
                        <i  class="nav-icon fa fa-map-marker"></i><p>Chuyển hệ tọa độ VN2000</p>
                    </a>
                </li>

                <% if(avl_login.getCumchucnang () 
                        .contains("dataduan")){ %>
                <li class="nav-item">
                    <a href="datada"   class="nav-link <% if (request.getParameter("datada") != null) {%>active<%}%>">
                        <i  class="nav-icon fa fa-database"></i><p>Data Dự Án</p>
                    </a>
                </li>
                <%}%>
                <% if(avl_login.getCumchucnang () 
                        .contains("datatuyenduong")){ %>
                <li class="nav-item">
                    <a href="dubaogia"   class="nav-link <% if (request.getParameter("dubaogia") != null) {%>active<%}%>">
                        <i  class="nav-icon fa fa-database"></i><p>Data Tuyến Đường</p>
                    </a>
                </li>
                <%}%>
                <% if(avl_login.getCumchucnang () 
                        .contains("datacanho")){ %>
                <li class="nav-item">
                     <a href="datacc"   class="nav-link <% if (request.getParameter("datacc") != null) {%>active<%}%>">
                        <i  class="nav-icon fa fa-database"></i><p>Data Căn Hộ</p>
                    </a>
                </li>               
                <%}%>
                 <li class="nav-item">
                    <a href="taolienket.html"  class="nav-link">
                        <i  class="nav-icon fa fa-arrow-down"></i><p>Hướng Dẫn Truy Cập Nhanh</p>
                    </a>
                </li>
               
            </ul>
        </nav>        
    </div>
</aside>