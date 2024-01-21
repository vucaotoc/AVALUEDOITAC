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
        width: 20%;
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


<div class="box box-success">
    <div class="box-header with-border">           
        <h4>Thông Tin Pháp Lý  
            <button type="button" class="badge bg-aqua" data-toggle="modal" data-target="#xemplaply" id="btnxempl">
                xem
            </button>

              <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
            </button>
        </div>
        </h4>  
    
        <%   if (session.getAttribute("hsedit_HAPL") != null) {
                ArrayList<objHAPhapLy> arrHA = (ArrayList<objHAPhapLy>) session.getAttribute("hsedit_HAPL");
        %>
        <div class="modal modal-open fade" id="xemplaply">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span></button>
                        <h4 class="modal-title">hình ảnh pháp lý tài sản</h4>
                    </div>
                    <div class="modal-body">                    
                        <%
                            int dem = 0;
                            if (arrHA.size() > 0) {

                                for (objHAPhapLy obj : arrHA) {
                                    if (obj.getTenha().toLowerCase().endsWith(".png")
                                            || obj.getTenha().toLowerCase().endsWith(".jpg")
                                            || obj.getTenha().toLowerCase().endsWith(".jpeg")) {
                                        dem++;
                        %>
                        <div class="mySlides">
                            <div class="numbertext"><%=dem%> / <%=arrHA.size()%></div>
                            <img src="data/<%=obj.getfullPath()%>" style="width:100%;max-height: 400px;">
                        </div>
                        <%}
                                }
                            }%>

                        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                        <a class="next" onclick="plusSlides(1)">&#10095;</a>


                    </div>  
                    <div class="modal-footer">       
                        <div class="caption-container">
                            <p id="caption"></p>
                        </div>
                        <% dem = 1;
                            for (objHAPhapLy obj : arrHA) {
                                if (obj.getTenha().toLowerCase().endsWith(".png")
                                        || obj.getTenha().toLowerCase().endsWith(".jpg")
                                        || obj.getTenha().toLowerCase().endsWith(".jpeg")) {

                        %>
                        <div class="column">
                            <img class="demo cursor" src="data/<%=obj.getfullPath()%>" style="width:100px;max-height: 80px;" onclick="currentSlide(<%=dem%>)" alt="">
                        </div>
                        <% dem++;
                                }
                            }%>

                    </div>
                </div>                   
            </div>
            <!-- /.modal-content -->
        </div>
        <%

            }%>
        <!-- /.modal-dialog -->
    </div>  
    
        <div class="box-body table-responsive no-padding">  
            <form method="post" id="frmthumucring" role="form"  action="downall" >
            <table  class="table table-hover">               
                <thead>
                    <tr>
                        <th> <input type="checkbox"  name="select-all"  id="select-all" style="transform: scale(1.1);margin: 0px auto;"/></th>
                        <th><input type="submit" value="Tải Chọn" name="HAPL"  class="btn bg-yellow-gradient" style="padding:5px 3px;"  /></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody> 
                    <%
                        if (session.getAttribute("hsedit_HAPL") != null) {
                            ArrayList<objHAPhapLy> arrHA = (ArrayList<objHAPhapLy>) session.getAttribute("hsedit_HAPL");
                            if (arrHA.size() > 0) {
                                for (objHAPhapLy obj : arrHA) {
                    %>

                    <tr>                  
                        <td><input type="checkbox" name="idimage" value="<%=obj.getIdha()%>" style="transform: scale(1.1);margin: 0px auto;"/></td>
                        <td><a href="data/<%=obj.getfullPath()%>" target="_blank"><%=obj.getTenha()%> </a></td>                  
                        <td> 
                            <a href="upfhoso?down=<%=obj.getIdha()%>" ><span class="badge bg-blue">Tải về</span></a>
                        </td>
                    </tr>

                    <%}
                            }
                        }%>
                </tbody>
            </table>
                 </form>
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
    $('#select-all').click(function (event) {

        var selected = this.checked;
        // Iterate each checkbox
        $(':checkbox').each(function () {
            this.checked = selected;
        });

    });
</script>

<div class="modal modal-default fade" id="trmalltaive">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">Thư mục</h4>
            </div>
            <div class="modal-body">             
                <label>Tải về tất cã file đã chọn. </label>
                <div id="tbtrmalltaive"></div>                                           
            </div>
            <div class="modal-footer">                                   
                <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn bg-red pull-right" onclick="taiveall();">Tải về</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>         
<script>
    function taiveall() {
        document.getElementById('tbtrmalltaive').removeAttribute('h4');
        $.ajax({
            type: "POST",
            url: "downall?HAPL",
            data: $("#frmthumucring").serialize(),
            success: function (data) {
                $("#trmalltaive").modal('hide');
            },
            error: function () {
                document.getElementById('tbtrmalltaive').innerHTML = '<h4 class="error text-danger"><em>Lỗi hệ thống</em></h4>';
            }
        });
    }
</script>