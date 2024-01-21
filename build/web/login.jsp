<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>AVALUE APP | Đăng Nhập</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" sizes="57x57" href="favicon/apple-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="favicon/apple-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="favicon/apple-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="favicon/apple-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="favicon/apple-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="favicon/apple-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="favicon/apple-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="favicon/apple-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-icon-180x180.png">
        <link rel="icon" type="image/png" sizes="192x192"  href="favicon/android-icon-192x192.png">
        <link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="favicon/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
        <link rel="manifest" href="favicon/manifest.json">
        <meta name="msapplication-TileColor" content="#ffffff">
        <meta name="msapplication-TileImage" content="favicon/ms-icon-144x144.png">
        <meta name="theme-color" content="#ffffff">
        <!-- Theme style -->
        <link rel="stylesheet" href="dist/css/adminlte.min.css">
        <link rel="stylesheet" type="text/css" href="dist/login/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="dist/login/font-awesome.min.css">

        <link rel="stylesheet" type="text/css" href="dist/login/animate.css">

        <link rel="stylesheet" type="text/css" href="dist/login/hamburgers.min.css">

        <link rel="stylesheet" type="text/css" href="dist/login/select2.min.css">

        <link rel="stylesheet" type="text/css" href="dist/login/util.css">
        <link rel="stylesheet" type="text/css" href="dist/login/main.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
        <meta name="robots" content="noindex, follow">
        <script src='https://www.google.com/recaptcha/api.js'></script>
        <script src="plugins/jquery/jquery.min.js"></script>       
        <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>  
        <script src="plugins/moment/moment.min.js"></script>       
        <script src="dist/js/adminlte.min.js"></script>        
        <script src="dist/js/demo.js"></script> 
    </head>
    <body>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div class="login100-pic js-tilt" data-tilt="">
                        <img src="dist/login/login.png">
                    </div>
                    <form class="login100-form validate-form" method="post" id="frmlogin">                       
                        <span class="login100-form-logo">
                            <img src="hinhanh/logo.png">
                        </span>
                        <span class="login100-form-title">
                            ĐỐI TÁC
                        </span>                       
                        <div class="wrap-input100 validate-input" data-validate="vui lòng nhập đầy đủ">
                            <input class="input100" type="text" name="u" id="tendangnhap"  placeholder="Email">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fas fa-user"></i>
                            </span>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate="Password is required">
                            <input class="input100" type="password" name="p" id="yourpasscode" placeholder="Password">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fas fa-key"></i>
                            </span>
                        </div>
<div class="input-group form-group">
                            <div style="margin:0px auto;">
                                <input type="checkbox" onclick="showpassword()">Hiển thị mật khẩu
                            </div>
                        </div>
                        
                        <p>
                        <div class="g-recaptcha" data-sitekey="6LexaRAcAAAAAKQp2ifjlaETC4WsU2YsLT0BcRWq" id="ggcaptcha" 
                             <%if(session.getAttribute("isNewLogin")!=null){%> style="display:block;"<%}else{%>style="display:none;"<%}%>>
                                 
                        </div>
                        </p>

                        <div class="container-login100-form-btn">
                            <button type="button" class="login100-form-btn" id="btndangnhap" onclick="dangnhap();">
                                ĐĂNG NHẬP
                            </button>
                        </div>
                        <div class="text-center p-t-12">
                            <span class="txt1">                               
                            </span>
                            <a class="txt2" href="#" data-toggle="modal" data-target="#mquenmatkhau" >
                                Quên mật khẩu ?
                            </a>
                        </div>
                        <div class="text-center p-t-12" id="tbloihtbg"> 
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal modal-default fade" id="mquenmatkhau">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Quên mật khẩu</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span></button>                            
                        </div>
                        <div class="modal-body">                                    
                            <h6>Vui lòng liên hệ số điện thoại <span class="badge bg-green">0903 082 978</span> 
                                hoặc email <span class="badge bg-gray">duyht@avalue.vn</span>
                                để được hổ trợ về vấn đề tài khoản. Cám ơn ! 
                            </h6>
                        </div>
                        <div class="modal-footer">                                   
                            <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>                                
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>                       

        </div>



        <script type type="text/javascript">
            function dangnhap() {
                document.getElementById('tbloihtbg').removeAttribute('h4');
                $.ajax({
                    type: "POST",
                    url: "login",
                    data: $("#frmlogin").serialize(),
                    success: function (data) {
                        if (data === 'ok') {
                            document.getElementById('tbloihtbg').innerHTML = '<h4 class="success text-success">Đăng nhập thành công !!</h4>';
                            document.getElementById('btndangnhap').style.display = 'none';
                            setCookie("emaillogin", document.getElementById('tendangnhap').value,100);
                            window.open("home", "_self");
                        } else {
                            document.getElementById('ggcaptcha').style.display = 'block';
                            document.getElementById('tbloihtbg').innerHTML = '<h4 class="error text-danger"><em>' + data + '</em></h4>';
                        }
                    },
                    error: function () {
                        document.getElementById('tbloihtbg').innerHTML = '<h4 class="error text-danger"><em>Lỗi hệ thống</em></h4>';
                    }
                });
            }
            function setCookie(c_name, value, exdays)
            {
                var exdate = new Date();
                exdate.setDate(exdate.getDate() + exdays);
                var c_value = escape(value) + ((exdays === null) ? "" : "; expires=" + exdate.toUTCString());
                document.cookie = c_name + "=" + c_value + "; path=/";
            }
            function showpassword() {
                    var x = document.getElementById("yourpasscode");
                    if (x.type === "password") {
                        x.type = "text";
                    } else {
                        x.type = "password";
                    }
                }
            function getCookie(cname, elmID) {
                let name = cname + "=";
                let decodedCookie = decodeURIComponent(document.cookie);
                let ca = decodedCookie.split(';');
                var kq = "";
                for (let i = 0; i < ca.length; i++) {
                    let c = ca[i];
                    while (c.charAt(0) === ' ') {
                        c = c.substring(1);
                    }
                    if (c.indexOf(name) === 0) {
                        kq = c.substring(name.length, c.length);
                    }
                }
                document.getElementById(elmID).value = kq;
            }
            getCookie("emaillogin","tendangnhap");
        </script>


        <!-- jQuery 3 -->
        <script src="bower_components/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap 3.3.7 -->
        <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- iCheck -->
        <script src="plugins/iCheck/icheck.min.js"></script>
    </body>
</html>