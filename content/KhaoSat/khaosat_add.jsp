<%@page import="TaiSan.objTaiSan"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if (session.getAttribute("khaosat_add") != null && session.getAttribute("hsedit_hs") != null) {
        KhaoSat.objKhaoSat objks = (KhaoSat.objKhaoSat) session.getAttribute("khaosat_add");
        HoSo.objHoSo objhs = (HoSo.objHoSo) session.getAttribute("hsedit_hs");
%>
<section class="content-header">
    <h1>
        <h2>THÊM MỚI PHIẾU KHẢO SÁT</h2>
        <a href="hoso?id=<%=objhs.getIdhs()%>"  class="btn btn-warning" >Quay về</a>
    </h1>           
</section>
<div class="row">
    <form  role="form"  method="post" id="frmtsedit" > 

        <div class="col-md-12">   
            <div class="box box-success">
                <div class="box-header with-border">           
                    <h2>Thông Tin Tài Sản Khảo Sát</h2>
                </div>
                <div class="box-body">  
                    <div class="form-group col-lg-4">
                        <label>Mã Hồ Sơ:</label>
                        <input type="text" name="mahs" class="form-control" value="<%=objks.getMahs()%>" disabled=""/>
                    </div> 
                    <div class="form-group col-lg-4">
                        <label>Nhân viên khảo sát:</label>
                        <input type="text" name="tennvks" class="form-control" value="<%=objks.getTennvks()%>" disabled=""/>
                    </div>      
                    <div class="form-group col-lg-4">
                        <label>Loại tài sản khảo sát:</label>
                        <input type="text" id="loaits" name="loaits" class="form-control" value="<%=objks.getLoaits()%>" disabled="" />
                    </div>
                    <div class="form-group col-lg-8">
                        <label>Địa chỉ tài sản:</label>
                        <input type="text" name="diachits" class="form-control" value="<%=objks.getDiachits()%>" disabled=""/>
                    </div> 

                    <div class="form-group col-lg-4">
                        <label>Tọa độ Goole Maps (X , Y):</label>
                        <input type="text" name="toadolocation" id="toadomaps" class="form-control" />                     
                    </div> 

                    <div class="form-group col-lg-4">
                        <label>Thời gian khảo sát(DD/MM/YYYY): </label>
                        <input type="text" name="ngayks"  class="form-control" id="datepicker" />
                    </div> 

                    <div class="form-group col-lg-4">
                        <label>Chí phí khảo sát:</label>
                        <input type="text" name="chiphiks" value="0" class="form-control" id="chiphiks" value="<%=objks.getChiphiks()%>" />
                    </div>  
                    <div class="form-group col-lg-4">
                        <label>Phí tạm ứng:</label>
                        <input type="text" name="phitamung" value="0" id="phitamung" class="form-control" value="<%=objks.getChiphitamung()%>" />
                    </div> 


                </div> 
                <div class="box-footer">   

                </div>
            </div>
        </div>
        <% if (objks.getLoaits().startsWith("Phương Tiện Vận Tải")) { %>
        <%@include  file="ksphuongtienvanchuyen.jsp" %>
        <%} else if (objks.getLoaits().startsWith("Chung Cư")) {%>
        <%@include  file="kschungcu.jsp" %>
        <%} else if (objks.getLoaits().startsWith("Nhà Phố") || objks.getLoaits().startsWith("Biệt Thự") || objks.getLoaits().startsWith("Văn Phòng")) {%>
        <%@include  file="ksnhapho.jsp" %>
        <%} else if (objks.getLoaits().startsWith("Đất Trống")) {%>
        <%@include  file="ksdattrong.jsp" %>    
        <%} else if (objks.getLoaits().startsWith("Máy Móc")) {%>
        <%@include  file="ksmaymoc.jsp" %>  
        <%} else if (objks.getLoaits().startsWith("Nhà Xưởng")) {%>
        <%@include  file="ksnhaxuong.jsp" %>  
        <%}%>             
        <jsp:include page="kschuky.jsp" />



        <div class="col-md-12">   
            <div class="box box-success">
                <div id="tbloi">

                </div>
                <div class="modal modal-default fade" id="themmoi">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span></button>
                                <h4 class="modal-title">Thêm Mới</h4>
                            </div>
                            <div class="modal-body">                                    
                                <p>Xác nhận thêm mới thông tin  ?</p>

                            </div>
                            <div class="modal-footer">                                   
                                <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                                <button type="button" class="btn bg-green pull-right" onclick="themmoikh()">Thêm Mới</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>                       
                <button type="button" class="btn bg-green-active btn-flat margin-r-5" data-toggle="modal" data-target="#themmoi" id="btnthemmoi">Thêm Mới</button>
            </div>
            <div class="box-footer">   
                <input type="hidden" name="chukynguoihd" id="signature1" />
                <input type="hidden" name="chukynvks" id="signature2" />
                <input type="hidden" name="toadolocation" id="toadolocation" />
            </div>

        </div>
    </form>

</div>
<script src="bower_components/ckeditor/ckeditor.js"></script>
<script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script type="text/javascript">





                                    var ckeditor1 = null;
                                    var ckNXtuongbao = null;
                                    $('#ckNXtuongbao').wysihtml5();
                                    $('#ckNXtuongbao').html('<table style="border-collapse: collapse; width: 38.6364%; height: 96px;" border="0px">'
                                            + '<tbody>'
                                            + '   <tr>'
                                            + '    <td style="width: 50%;">Chất liệu:</td>'
                                            + '    <td style="width: 50%;">'
                                            + '    <p><input type="text" value="" /></p>'
                                            + '    </td>'
                                            + '    </tr>'
                                            + '    <tr>'
                                            + '    <td style="width: 50%;">Chiều cao:</td>'
                                            + '    <td style="width: 50%;">'
                                            + '    <p><input type="text" value="" /></p>'
                                            + '    </td>'
                                            + '    </tr>'
                                            + '    </tbody>'
                                            + '    </table>');
                                    $('#ckNXcongvao').wysihtml5();
                                    $('#ckNXcongvao').html('<p>- Loại cổng:</p>');

                                    $('#ckNXbaove').wysihtml5();
                                    $('#ckNXbaove').html('<p>- Diện tích xây dựng(m2):</p>'
                                            + '<p>- Diện tích sàn (m2):</p>'
                                            + '<p>- Kết cấu:</p>'
                                            + '<p>+ Tường:</p>'
                                            + '<p>+ Trần:</p>'
                                            + '<p>+ Sàn:</p>'
                                            + '<p>+ Mái:</p>'
                                            + '<p>+ Cửa chính:</p>'
                                            + '<p>+ Cửa sổ:</p>'
                                            );

                                    $('#ckNXtramcan').wysihtml5();
                                    $('#ckNXtramcan').html('<p>- Nhãn hiệu:</p> '
                                            + '<p>- Nước sản xuất: '
                                            + '<p>- Đặc điểm kỹ thuật:'
                                            + '<p>+ Tải trọng(Tấn):'
                                            + '<p>+ Kích thước bàn cân: '
                                            + '<p>+ Bộ xử lý trung tâm: '
                                            + '<p>+ Loadcell: Con');
                                    $('#ckNXvanphong').wysihtml5();
                                    $('#ckNXvanphong').html('<p>- Nhà:       tầng</p>'
                                            + '<p>- Diện tích xây dựng:     m2</p>'
                                            + '<p>- Diện tích sàn:       m2</p>'
                                            + '<p>- Kết cấu:</p>'
                                            + '<p>+ Móng:     </p>'
                                            + '<p>+ Tường:  </p> '
                                            + '<p>+ Sân:   </p>'
                                            + '<p>+ Trần:   </p> '
                                            + '<p>+ Sàn:  </p> '
                                            + '<p>+ Mái:   </p> '
                                            + '<p>+ Cửa chính:   </p> '
                                            + '<p>+ Cửa sổ:    </p>'
                                            + '<p>+ Cửa phòng:   </p> '
                                            + '<p>+ Cầu thang:  </p>'
                                            + '<p>+ Nhà vệ sinh: </p>');
                                    $('#ckNXnhaxuong').wysihtml5();
                                    $('#ckNXnhaxuong').html('<p>LOẠI NHÀ XƯỞNG:</p>'
                                            + '<p>- Số tầng: </p>'
                                            + '<p>- Khẩu độ(m):</p>'
                                            + '<p>- Bước cột(m):</p>'
                                            + '<p>- Cao đỉnh cột(m): </p>'
                                            + '<p>- Độ dốc mái (%): </p>'
                                            + '<p>- Móng:</p> '
                                            + '<p>- Tường: </p>'
                                            + '<p>- Cột, kèo: </p>'
                                            + '<p>- Cửa chính: </p>');


                                    $("#datepicker").datepicker({
                                        format: "dd/mm/yyyy"
                                    });
                                    var currentDate = new Date();
                                    $("#datepicker").datepicker("setDate", currentDate);

                                    var x = document.getElementById("toadolocation");
                                    function getLocation() {
                                        if (navigator.geolocation) {
                                            navigator.geolocation.getCurrentPosition(showPosition);
                                        } else {
                                            x.innerHTML = "Geolocation is not supported by this browser.";
                                        }
                                    }

                                    function showPosition(position) {
                                        x.value = position.coords.latitude + "," + position.coords.longitude;
                                        document.getElementById("toadomaps").value = position.coords.latitude + "," + position.coords.longitude;
                                    }

                                    getLocation();

                                    function canvasToString(canvas) {

                                        var dataString = canvas.toDataURL("image/png");
                                        var index = dataString.indexOf(",") + 1;
                                        dataString = dataString.substring(index);
                                        return dataString;
                                    }

                                    var _timer, _timeOut = 2000;
                                    $('#phitamung').on('input', function (e) {
                                        $(this).val(formatCurrency(this.value.replace(/[,]/g, '')));
                                    }).on('keypress', function (e) {
                                        if (!$.isNumeric(String.fromCharCode(e.which))) {
                                            e.preventDefault();
                                        }
                                    }).on('paste', function (e) {
                                        var cb = e.originalEvent.clipboardData || window.clipboardData;
                                        if (!$.isNumeric(cb.getData('text')))
                                            e.preventDefault();
                                    });
                                    $('#chiphiks').on('input', function (e) {
                                        $(this).val(formatCurrency(this.value.replace(/[,]/g, '')));
                                    }).on('keypress', function (e) {
                                        if (!$.isNumeric(String.fromCharCode(e.which))) {
                                            e.preventDefault();
                                        }
                                    }).on('paste', function (e) {
                                        var cb = e.originalEvent.clipboardData || window.clipboardData;
                                        if (!$.isNumeric(cb.getData('text')))
                                            e.preventDefault();
                                    });
                                    function formatCurrency(number) {
                                        var n = number.split('').reverse().join("");
                                        var n2 = n.replace(/\d\d\d(?!$)/g, "$&,");
                                        return  n2.split('').reverse().join('');
                                    }

                                    var element = document.getElementById('ckeditorMM_thongso');
                                    if (typeof element !== "undefined") {
                                        ckeditor1 = CKEDITOR.replace('ckeditorMM_thongso');
                                    }
                                    function themmoikh() {
                                        document.getElementById('tbloi').removeAttribute('h2');
                                        var signaturePad = document.getElementById("chuky1");
                                        document.getElementById("signature1").value = canvasToString(signaturePad);
                                        var signaturePad2 = document.getElementById("chuky2");
                                        document.getElementById("signature2").value = canvasToString(signaturePad2);
                                        //document.getElementById("img1").src="data:image/jpeg;base64,"+canvasToString(signaturePad);  

                                        var loaits = document.getElementById('loaits').value;
                                        var d = $("#datepicker").datepicker("getDate");

                                        var toadomaps = document.getElementById('toadomaps').value;
                                        var aa = toadomaps.split(',');

                                        if (d === null) {
                                            document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>Lỗi thời gian khảo sát chưa đúng! vui lòng chọn.</em></h2>';
                                        } else if (aa.length !== 2 && loaits !== "Máy Móc") {
                                            document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>Lỗi tọa độ google map. Vui lòng nhập đúng định dạng( X,Y ) của tọa độ.</em></h2>';
                                        } else {

                                            if (loaits === "Máy Móc") {
                                                if (ckeditor1 !== null) {
                                                    document.getElementById('mm_thongso').value = ckeditor1.getData();
                                                }
                                            } else if (loaits === "Nhà Xưởng") {
                                                document.getElementById('nxcong').value = $('#ckNXcongvao').val();
                                                document.getElementById('nxtuongbao').value = $('#ckNXtuongbao').val();
                                                document.getElementById('nxbaove').value = $('#ckNXbaove').val();
                                                document.getElementById('nxtramcan').value = $('#ckNXtramcan').val();
                                                document.getElementById('nxvanphong').value = $('#ckNXvanphong').val();
                                                document.getElementById('nxnhaxuong').value = $('#ckNXnhaxuong').val();
                                                //var aaa = document.getElementById('nxcong').value;
                                                //console.log(aaa);
                                            }



                                            $.ajax({
                                                type: "POST",
                                                url: "ksadd?themmoiks",
                                                data: $("#frmtsedit").serialize(),
                                                success: function (data) {
                                                    if (data === 'ok') {
                                                        document.getElementById('tbloi').innerHTML = '<h2 class="success text-success">Thêm mới thông tin thành công !!</h2>';
                                                        document.getElementById('themmoi').style.display = 'none';
                                                        $("#btnthemmoi").remove();
                                                        window.open("hoso?id=" +<%=objks.getIdhs()%>, "_self");
                                                    } else {
                                                        document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>' + data + '</em></h2>';
                                                    }
                                                },
                                                error: function () {
                                                    document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>Lỗi hệ thống</em></h2>';
                                                }
                                            });
                                        }
                                        $("#themmoi").modal('hide');
                                    }


</script>
<script src="dist/css/signature/signature_pad.umd.js" ></script>
<script src="dist/css/signature/app.js"></script>
<script src="dist/css/signature/app_1.js"></script>

<%}%>