<%@page import="ThongBao.objThongBao"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="main-header navbar navbar-expand navbar-white navbar-light">


    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>      
    </ul>        


    <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
            <a class="nav-link" data-toggle="dropdown" href="#" onclick="getlisttb();">
                <i class="far fa-comments"></i>
                <span class="badge badge-danger navbar-badge" id="counttongtn"> </span>
            </a>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right" id="listtbtopmenu">
                <a href="#" class="dropdown-item"><div class="media"><div class="media-body">
                        </div>
                    </div>
                </a>
            </div>
        </li>

        <li class="nav-item">

        </li>
        <li class="dropdown user user-menu">  
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <img src="data/DATADT/avata/<%=avl_login.getAvatar()%>" class="user-image" alt="User Image">
                <span class="hidden-xs"><%=avl_login.getTencanbo()%></span>
            </a>
            <ul class="dropdown-menu">                    
                <li class="user-body">
                    <a  href="#" id="btnchangepassword" data-toggle="modal"  data-backdrop="static" data-keyboard="false" data-target="#changepassword_modal" >
                        <i class="fas fa-key"></i><span >Mật Khẩu</span>
                    </a>
                </li>
                 <li class="user-body">
                    <a  href="#" id="btnchangeavata" data-toggle="modal"  data-backdrop="static" data-keyboard="false" data-target="#changeavata_modal" >
                        <i class="fas fa-user-circle"></i><span >Đổi Hình Đại Diện</span>
                    </a>
                </li>
                <li class="user-body">
                    <a href="logout">
                        <i class="fas fa-users"></i> <span >Đăng Xuất</span>
                    </a>

                </li>

            </ul>
        </li>

        <li class="nav-item">
            <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                <i class="fas fa-expand-arrows-alt"></i>
            </a>
        </li>
    </ul>
</nav>
