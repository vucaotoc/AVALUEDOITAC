<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="wrap-login100">
    <div class="login100-pic js-tilt" data-tilt="">
        <img src="dist/login/login.png">
    </div>
    <form class="login100-form validate-form" method="post" id="frmtracuu">                       
        <span class="login100-form-logo">
            <img src="hinhanh/logo.png">
        </span>
        <span class="login100-form-title">
            HỒ SƠ
        </span>                       
        <div class="wrap-input100 validate-input" data-validate="vui lòng nhập mã tra cứu">
            <input class="input100" type="text" name="hoso" placeholder="Mã tra cứu" value="<% if (request.getParameter("mahs") != null) {%><%=request.getParameter("mahs")%> <%}%>" >
            <span class="focus-input100"></span>
            <span class="symbol-input100">
                <i class="fas fa-user"></i>
            </span>
        </div>                      
        <p>
        <div class="g-recaptcha" data-sitekey="6LexaRAcAAAAAKQp2ifjlaETC4WsU2YsLT0BcRWq"></div>
        </p>
        <div class="container-login100-form-btn">
            <button type="button" class="login100-form-btn" id="btndangnhap" onclick="tracuu();">
                TRA CỨU
            </button>
        </div>
        <div class="text-center p-t-12" id="tbloihtbg"> 
        </div>
    </form>
</div>
<script type type="text/javascript">
    function tracuu() {
        document.getElementById('tbloihtbg').removeAttribute('h4');
        $.ajax({
            type: "POST",
            url: "tracuuhs",
            data: $("#frmtracuu").serialize(),
            success: function (data) {
                if (data === 'ok') {
                    document.getElementById('tbloihtbg').innerHTML = '<h4 class="success text-success">Đang chuyển hướng !!</h4>';
                    document.getElementById('btndangnhap').style.display = 'none';
                    window.open("xemhs", "_self");
                } else {
                    document.getElementById('tbloihtbg').innerHTML = '<h4 class="error text-danger"><em>' + data + '</em></h4>';
                }
            },
            error: function () {
                document.getElementById('tbloihtbg').innerHTML = '<h4 class="error text-danger"><em>Lỗi hệ thống</em></h4>';
            }
        });
    }
</script>
