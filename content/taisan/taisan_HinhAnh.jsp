<%@page import="NhanVien.objNhanVien"%>
<%@page import="HoSo.objHAPhapLy"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    * {
        box-sizing: border-box;
    }

    .row_img > .column {
        padding: 0 8px;
    }

    .row_img:after {
        content: "";
        display: table;
        clear: both;
    }

    .column {
        float: left;
        width: 25%;
    }

    /* The Modal (background) */
    .modalHA {
        display: none;
        position: fixed;
        z-index: 1;
        padding-top: 100px;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: black;
    }

    /* Modal Content */
    .modalHA-content {
        position: relative;
        background-color: #fefefe;
        margin: auto;
        padding: 0;
        width: 90%;
        max-width: 1200px;
    }

    /* The Close Button */
    .close {
        color: white;
        position: absolute;
        top: 10px;
        right: 25px;
        font-size: 35px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: #999;
        text-decoration: none;
        cursor: pointer;
    }

    .mySlides {
        display: none;
    }

    .cursor {
        cursor: pointer;
    }

    /* Next & previous buttons */
    .prev,
    .next {
        cursor: pointer;
        position: absolute;
        top: 50%;
        width: auto;
        padding: 16px;
        margin-top: -50px;
        color: white;
        font-weight: bold;
        font-size: 20px;
        transition: 0.6s ease;
        border-radius: 0 3px 3px 0;
        user-select: none;
        -webkit-user-select: none;
    }

    /* Position the "next button" to the right */
    .next {
        right: 0;
        border-radius: 3px 0 0 3px;
    }

    /* On hover, add a black background color with a little bit see-through */
    .prev:hover,
    .next:hover {
        background-color: rgba(0, 0, 0, 0.8);
    }

    /* Number text (1/3 etc) */
    .numbertext {
        color: #f2f2f2;
        font-size: 12px;
        padding: 8px 12px;
        position: absolute;
        top: 0;
    }

    img {
        margin-bottom: -4px;
    }

    .caption-container {
        text-align: center;
        background-color: black;
        padding: 2px 16px;
        color: white;
    }

    .demo {
        opacity: 0.6;
    }

    .active,
    .demo:hover {
        opacity: 1;
    }

    img.hover-shadow {
        transition: 0.3s;
    }

    .hover-shadow:hover {
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    }
    input[type=checkbox]
    {
        /* Double-sized Checkboxes */
        -ms-transform: scale(2); /* IE */
        -moz-transform: scale(2); /* FF */
        -webkit-transform: scale(2); /* Safari and Chrome */
        -o-transform: scale(2); /* Opera */
        transform: scale(2);
        margin-top: -20px;
        margin-right: 10px;
    }
</style>
<% if (session.getAttribute("hsedit_hs") != null) {
        HoSo.objHoSo objhs = (HoSo.objHoSo) session.getAttribute("hsedit_hs");
        ArrayList<objHAPhapLy> arrHA = (ArrayList<objHAPhapLy>) session.getAttribute("hsedit_HATS");
        int dem = 1;
        objNhanVien avl_login = (objNhanVien) session.getAttribute("avl_login");
%>
<section class="content-header">
    <h1>
        <h2>HÌNH ẢNH KHẢO SÁT TÀI SẢN <%=objhs.getIdhs()%> CỦA HỒ SƠ [<%=objhs.getMahs()%>]</h2>
        <a href="hoso?id=<%=objhs.getIdhs()%>"  class="btn btn-warning" >Quay về</a>
    </h1>           
</section>

<div class="row">
    <div class="col-md-12">   
        <div class="box box-warning">
            <div class="box-header with-border">  
				<div class="form-group">
                    <label>Chọn file upload (<span class="text-red">Tối da 50MB 1 file và 1 lần upload tối đa 20 file.</span>):</label>
                </div>
                <% if (avl_login.getQuyen() == DATA.phanquyen._nhom_per_admin || avl_login.getQuyen() == DATA.phanquyen._nhom_per_manager || objhs.getIdnvks() == avl_login.getIdnv()) {%>
                <form method="post" action="tsimage" enctype="multipart/form-data" accept="image/png, image/jpeg">
                    <div class="col-lg-6">                       
                        <input type="file" name="file" size="10" multiple="true" class="form-control" id="fileupload" accept="image/*" />
                        <div id="showfilename"></div>                            
                    </div>                  
                    <div class="col-lg-6">
                        <input type="submit" value="Upload" name="upload" class="btn bg-green-active btn-flat margin-r-5" />
                    </div>
                </form>
                <%}%>
            </div>
            <form method="post" id="frmhinhanh" role="form"  action="downall" >
                <div class="box-body">  

                    <div class="form-group">
                        <%
                            for (objHAPhapLy obj : arrHA) {
                        %>
                        <div class="col-md-3">
                            <img src="data/<%=obj.getfullPath()%>" alt="<%=obj.getTenha()%>" style="width:100%;max-height: 200px;" data-toggle="modal" data-target="#myModalHinhANh" class="hover-shadow cursor">    

                            <label class="pull-right">
                                <input type="checkbox"  name="idimage" value="<%=obj.getIdha()%>"/>  
                            </label>
                        </div>                   
                        <%}%>
                    </div>

                </div>

                <div class="box-footer">
                    <label class="text-aqua  pull-left">
                        <input type="checkbox"  name="select-all"  id="select-all" />&nbsp &nbspChọn Hết
                    </label>
                    <button type="button" class="btn bg-red-active pull-right" data-toggle="modal" data-target="#xoaall" id="btnxall">Xóa mục đã chọn</button>
                    <input type="submit" class="btn bg-aqua-active pull-right" value="Tải mục đã chọn"/>
                    <div class="modal modal-default fade" id="xoaall">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span></button>
                                    <h4 class="modal-title">Hình ảnh tài sản</h4>
                                </div>
                                <div class="modal-body">             
                                    <label>Xóa tất cã hình đã chọn </label>
                                    <div id="tbloixoaall"></div>                                           
                                </div>
                                <div class="modal-footer">                                   
                                    <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                                    <button type="button" class="btn bg-red pull-right" onclick="btnxoaall();">Xóa Hình</button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>   


                    <div class="modal modal-default fade" id="taive">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span></button>
                                    <h4 class="modal-title">Hình ảnh tài sản</h4>
                                </div>
                                <div class="modal-body">             
                                    <label>Tải tất cã hình đã chọn </label>
                                    <div id="tblloitaive"></div>                                           
                                </div>
                                <div class="modal-footer">                                   
                                    <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                                    <button type="button" class="btn bg-aqua-active pull-right" onclick="taiveall();">Tải Hình</button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>   



                    <div id="myModalHinhANh" class="modal modal-open fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span></button>
                                    <h4 class="modal-title"></h4>
                                </div>
                                <div class="modal-body">    
                                    <% dem = 1;
                                        for (objHAPhapLy obj : arrHA) {%>
                                    <div class="mySlides">
                                        <div class="numbertext"><%=dem%> / <%=arrHA.size()%></div>
                                        <img src="data/<%=obj.getfullPath()%>" style="width:100%;">
                                    </div>
                                    <%}%>

                                    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                                    <a class="next" onclick="plusSlides(1)">&#10095;</a>
                                </div>
                                <div class="modal-footer">       
                                    <div class="caption-container">
                                        <p id="caption"></p>
                                    </div>
                                    <% dem = 1;
                                        for (objHAPhapLy obj : arrHA) {%>
                                    <div class="column">
                                        <img class="demo cursor" src="data/<%=obj.getfullPath()%>" style="width:100%;max-height: 200px;" onclick="currentSlide(<%=dem%>)" alt="">
                                    </div>
                                    <% dem++;
                                        }%>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

</div>
<script>

    var slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    function currentSlide(n) {
        showSlides(slideIndex = n);
    }

    function showSlides(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("demo");
        var captionText = document.getElementById("caption");
        if (n > slides.length) {
            slideIndex = 1
        }
        if (n < 1) {
            slideIndex = slides.length
        }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " active";
        captionText.innerHTML = dots[slideIndex - 1].alt;
    }
    $('#fileupload').on('change', function () {
        var files = '';
        for (var i = 0; i < $(this)[0].files.length; i++) {
            files += "<a href=\"#\" >" + $(this)[0].files[i].name + "</a><br/>";
        }
        document.getElementById('showfilename').innerHTML = files;
    });


    $('#select-all').click(function (event) {

        var selected = this.checked;
        // Iterate each checkbox
        $(':checkbox').each(function () {
            this.checked = selected;
        });

    });

    function btnxoaall() {
        document.getElementById('tbloixoaall').removeAttribute('h4');
        $.ajax({
            type: "POST",
            url: "imageall?xoall",
            data: $("#frmhinhanh").serialize(),
            success: function (data) {
                if (data === 'ok') {
                    document.getElementById('tbloixoaall').innerHTML = '<h4 class="success text-success">Cập nhật thành công !!</h4>';
                    $("#xoaall").modal('hide');
                    window.open("taisan?tsimage", "_self");
                } else {
                    document.getElementById('tbloixoaall').innerHTML = '<h4 class="error text-danger"><em>' + data + '</em></h4>';
                }
            },
            error: function () {
                document.getElementById('tbloixoaall').innerHTML = '<h4 class="error text-danger"><em>Lỗi hệ thống</em></h4>';
            }
        });
    }
    function taiveall() {
        document.getElementById('tblloitaive').removeAttribute('h4');
        $.ajax({
            type: "POST",
            url: "downall",
            data: $("#frmhinhanh").serialize(),
            success: function (data) {
                $("#taive").modal('hide');
            },
            error: function () {
                document.getElementById('tblloitaive').innerHTML = '<h4 class="error text-danger"><em>Lỗi hệ thống</em></h4>';
            }
        });
    }

</script>
<%}%>