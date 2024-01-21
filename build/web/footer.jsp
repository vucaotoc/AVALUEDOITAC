<%@page contentType="text/html" pageEncoding="UTF-8"%>

<footer class="main-footer">
    <div class="float-right d-none d-sm-block">
        <b>Version</b> 2.0
    </div>
    <strong>Copyright &copy; AVALUE 2021 </strong>
</footer>

<script type="text/javascript">

    var loadFile = function (event) {
        var output = document.getElementById('viewavata');
        output.src = URL.createObjectURL(event.target.files[0]);
        output.onload = function () {
            URL.revokeObjectURL(output.src) // free memory
        }
    };

    function goBack() {
        window.history.back();
    }
    function hide() {
        document.getElementById('myModal').style.display = "none";
    }
    function xacnhan(msg) {
        if (confirm(msg))
            return false;
        else
            event.preventDefault();
    }
    var myBtnTopPage = document.getElementById("myBtnTopPage");

    window.onscroll = function () {
        scrollFunction()
    };

    function scrollFunction() {
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            myBtnTopPage.style.display = "block";
        } else {
            myBtnTopPage.style.display = "none";
        }
    }

    function topFunction() {
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
    }



    function formatCurrency(number) {
        var n = number.split('').reverse().join("");
        var n2 = n.replace(/\d\d\d(?!$)/g, "$&,");
        return  n2.split('').reverse().join('');
    }

    $(document).ready(function () {
        setTimeout(getcounttb, 5000);
    });
    function getcounttb() {
        console.log('abc');
        $.ajax({
            url: 'showtb?getcount',
            type: 'post',
            dataType: "json",
            success: function (data) {
                $.each(data, function (index, element) {
                    document.getElementById("counttongtn").innerHTML = element.tinnhan;
                });
            },
            complete: function (data) {
                setTimeout(getcounttb, 20000);
            }
        });
    }
    function getlisttb() {
        var list = $('#listtbtopmenu'); //caching      
        list.empty();
        $.ajax({
            url: 'showtb?getlisttn',
            type: 'post',
            dataType: "json",
            success: function (data) {
                var items = [];
                //console.log(data);
                //Misplaced variable here: data instead of response
                $.each(data.thongbao, function (i, item) {
                    var date = new Date(item.ngaylap);
                    var formattedDate = moment(date).format('YYYY-MM-DD HH:mm:ss');
                    if (item.daxem === 0) {
                        list.append("<a href=\"" + item.loai + "\" onclick=\"updaxemtb(" + item.idtb + "," + item.daxem + ");\" class=\"dropdown-item\"><div class=\"media\"><div class=\"media-body\"><p class=\"text-sm\">" + item.thongbao + "</p><p class=\"text-sm text-muted\"><i class=\"far fa-clock mr-1\"></i>" + formattedDate + "</p></div></div></a></div> <div class=\"dropdown-divider\"></div>");
                    }
                });
            }
        });
    }
    function updaxemtb(x, y) {
        //console.log(index);
        if (y === 0) {
            $.ajax({
                url: 'showtb?daxem=' + x,
                type: 'post',
                success: function (data) {
                    //console.log(data);
                }
            });
            getcounttb();
        }
    }
    ;
    function showpasswordchange() {
        var x = document.getElementById("current_pass");
        var y = document.getElementById("new_pass");
        var z = document.getElementById("confirm_pass");
        if (x.type === "password") {
            y.type = "text";
            x.type = "text";
            z.type = "text";
        } else {
            x.type = "password";
            y.type = "password";
            z.type = "password";

        }
    }
    ;
    $('#changepassword_modal').on('hidden.bs.modal', function () {
        location.reload();
    });
    $('#changenvdetail_modal').on('hidden.bs.modal', function () {
        location.reload();
    });
    /* must apply only after HTML has loaded */
    $('document').ready(function () {
        $("#changeFormSubmit").on("submit", function (e) {
            $(".error").hide();
            var hasError = false;
            var currentpass = $("#current_pass").val();
            var newpass = $("#new_pass").val();
            var cnfpass = $("#confirm_pass").val();

            if (currentpass === '') {
                $("#current_pass").after('<span class="error text-danger"><em>Nhập mật khẩu hiện tại</em></span>');
                hasError = true;
            } else if (newpass === '') {
                $("#new_pass").after('<span class="error text-danger"><em>Nhập mật khẩu mới</em></span>');
                hasError = true;
            } else if (cnfpass === '') {
                $("#confirm_pass").after('<span class="error text-danger"><em>Nhập lại mật khẩu mới.</em></span>');
                hasError = true;
            } else if (newpass !== cnfpass) {
                $("#confirm_pass").after('<span class="error text-danger"><em>Mật khẩu mới chưa giống nhau.</em></span>');
                hasError = true;
            }

            if (hasError === true) {
                return false;
            }
            if (hasError === false) {

                var postData = $(this).serializeArray();
                $.ajax({
                    url: "doimatkhau?doimk",
                    type: "POST",
                    data: postData,
                    success: function (data) {
                        if (data === 'ok') {
                            $("#confirm_pass").after('<span class="success text-success">ĐỔI MẬT KHẨU THÀNH CÔNG !! <br/>Vui lòng đăng xuất để đăng nhập lại hệ thống.</span>');
                            $("#submitForm").remove();
                            $("#btnClose2").remove();
                            $("#btnlogout").show();
                        } else {
                            $("#confirm_pass").after('<span class="error text-danger"><em>' + data + '</em></span>');
                        }
                    }
                });
                e.preventDefault();
            }
        });

       
    });
</script>
