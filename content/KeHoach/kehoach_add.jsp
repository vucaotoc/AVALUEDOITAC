<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="NhanVien.objNhanVien"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% if (session.getAttribute("hsedit_hs") != null && session.getAttribute("hsedit_ts") != null) {
        ArrayList<TaiSan.objTaiSan> arrts = (ArrayList<TaiSan.objTaiSan>) session.getAttribute("hsedit_ts");
        KhachHang.objKhachhang objkh = new KhachHang.objKhachhang();
        HoSo.objHoSo objhs = (HoSo.objHoSo) session.getAttribute("hsedit_hs");
        DecimalFormat fmVND = new DecimalFormat("###,###,###");
        SimpleDateFormat dtf = new SimpleDateFormat("dd/MM/yyyy");
        objNhanVien avl_login = (objNhanVien) session.getAttribute("avl_login");
        String tenkh = "", diachi = "";
        if (session.getAttribute("hsedit_kh") != null) {
            objkh = (KhachHang.objKhachhang) session.getAttribute("hsedit_kh");
            diachi = objkh.getFullDiaChi();
            if (objkh.getNhomkh().equals("CN")) {
                tenkh = objkh.getTenkh();
            } else {
                tenkh = objkh.getTencongty();
            }

        }


%>
<section class="content-header">
    <h1>
        <small>THÊM MỚI KẾ HOẠCH THẨM ĐỊNH GIÁ</small> [<%=objhs.getMahs()%>]
        <a href="hoso?id=<%=objhs.getIdhs()%>"  class="btn btn-warning" >Quay về</a>
    </h1>           
</section>

<div class="row">
    <div class="col-md-12">  
        <div class="box-body">   
            <form  role="form"  method="post" id="frmkehadd" > 
                <div class="col-md-6">  
                    <div class="col-md-12">  
                        <div class="box box-success">          
                            <div class="box-body">   
                                <div class="col-lg-4">
                                    <label>Mã hồ sơ: </label>
                                    <input type="text" name="mahs" class="form-control" value="<%=objhs.getMahs()%>" disabled/>
                                </div> 
                                <div class="col-lg-4">
                                    <label>Số chứng thư:</label>
                                    <input type="text" name="soct" class="form-control" value="<%=objhs.getSoct()%>"/>
                                </div>      
                                <div class="col-lg-4">
                                    <label>Ngày Lập <span class="text-red">(*)</span>: </label>
                                    <input type="text" name="ngaylap" class="form-control"  value="<%=dtf.format(new Date())%>" id="datepicker"/>
                                </div>   
                                <div class="col-lg-12">
                                    <label>Tên Khách Hàng:</label>
                                    <input type="text" name="tenkh"  value="<%=tenkh%>" class="form-control" />
                                </div> 
                                <div class="col-lg-12">
                                    <label>Địa Chỉ:</label>
                                    <input type="text" name="diachikh" value="<%=diachi%>" class="form-control" />
                                </div> 
                                <div class="col-lg-12">
                                    <label>Đối tác Ngân Hành/PGD:</label>
                                    <input type="text" name="doitacpgd" class="form-control"  value="<%=objhs.getDoitac()%>" />
                                </div>     
                                <div class="col-lg-12">
                                    <label>Tài sản thẩm định:</label>
                                    <input type="text" name="taisantd" value="<%=arrts.get(0).getLoaits()%>" class="form-control" />
                                </div> 
                                <div class="col-lg-12">
                                    <label>Địa chỉ tài sản:</label>
                                    <input type="text" name="diachits" value="<%=arrts.get(0).getFullDiaChi()%>"  class="form-control"  />
                                </div>

                                <div class="col-lg-12">
                                    <label>Mục đích thẩm định:</label>
                                    <input type="text" name="mucdich" class="form-control" />
                                </div>                                
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">  
                        <div class="box box-success">    
                            <div class="box-header with-border">           
                                <h4>Hồ sơ do:</h4>                    
                            </div>
                            <div class="box-body">   
                                <div class="col-lg-12">
                                    <label class="col-lg-2">Ông (bà):</label>
                                    <input class="col-lg-6"type="text" name="phutrach" class="form-control" />
                                    <label class="col-lg-4">Phụ trách</label>
                                </div>     
                                <div class="col-lg-12">
                                    <label class="col-lg-2">Ông (bà):</label>
                                    <input class="col-lg-6"type="text" name="phoihop1" class="form-control" />
                                    <label class="col-lg-4">Phối hợp thực hiện</label>
                                </div>    
                                <div class="col-lg-12">
                                    <label class="col-lg-2">Ông (bà):</label>
                                    <input class="col-lg-6"type="text" name="phoihop2" class="form-control" />
                                    <label class="col-lg-4">Phối hợp thực hiện</label>
                                </div>    
                            </div>
                        </div>
                    </div>                   
                </div>
                <div class="col-md-6">  
                    <div class="col-md-12">  
                        <div class="box box-success">    
                            <div class="box-header with-border">           

                            </div>
                            <div class="box-body">   
                                <div class="col-lg-12">
                                    <label>Thời gian ký hợp đồng:</label>
                                    <input type="text" name="thoigiankyhd" class="form-control" id="datepicker1" />     

                                </div>     
                                <div class="col-lg-12">
                                    <label>Giá trị hợp đồng:</label>
                                    <div class="col-sm-12">
                                        <div class="col-sm-8">
                                            <input type="text" name="giatrihd" id="giatrihd" class="form-control" /> 
                                        </div>
                                        <div class="col-sm-4">
                                            <select class="form-control" name="giatrivat">
                                                <option value="Gồm VAT">Gồm VAT</option>
                                                <option value="Không VAT">Không VAT</option>
                                            </select> 
                                        </div>
                                    </div>  
                                </div>
                                <div class="col-lg-12">
                                    <label >Tỷ lệ chiết khấu:</label>
                                    <input type="text" name="chietkhau" class="form-control" />                              
                                </div>  
                                <div class="col-lg-12">
                                    <label>Thời gian ký khảo sát hiện trạng:</label>
                                    <input type="text" name="thoigianks" class="form-control" id="datepicker2" />                                
                                </div>    
                                <div class="col-lg-12">
                                    <label>Thời gian dự kiến hoàn thành:</label>
                                    <input type="text" name="thoigianht" class="form-control" id="datepicker3" />                                
                                </div>    

                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">  
                        <div class="box box-success">
                            <div class="box-body">         
                                <div class="col-md-6">  
                                    <label>Vị trí thửa đất:</label>
                                    <div class="checkbox">
                                        <label >
                                            <input type="checkbox" name="vitri" value="Vị trí 1">Vị trí 1
                                        </label>
                                    </div>

                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="vitri" value="Vị trí 2">Vị trí 2
                                        </label>
                                    </div>

                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="vitri" value="Vị trí 3">Vị trí 3
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="vitri" value="Vị trí 4">Vị trí 4
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-6"> 
                                    <label>Giả thiết đặc biệt/loại đất:</label>
                                    <div class="checkbox">
                                        <label >
                                            <input type="checkbox" name="giathiet" value="Hợp thửa">Hợp thửa
                                        </label>
                                    </div>

                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="giathiet" value="Đất SXKD">Đất SXKD
                                        </label>
                                    </div>

                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="giathiet" value="Đất TMDV">Đất TMDV
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="giathiet" value="Đất ở">Đất ở
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label >
                                            <input type="checkbox" name="giathiet" value="Đất ở VPLG">Đất ở VPLG
                                        </label>
                                    </div>

                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="giathiet" value="Đất NN">Đất NN
                                        </label>
                                    </div>

                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="giathiet" value="Đất NN (khung)">Đất NN (khung)
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>Khác</label>
                                        <input type="text" name="giathiet" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12"> 
                    <div class="col-md-6">  
                        <div class="box box-success">    
                            <div class="box-header with-border">           

                            </div>
                            <div class="box-body">   
                                <div class="col-lg-12">
                                    <label>Người liên hệ thu hồi công nợ: Ông (bà):</label>
                                    <input type="text" name="cn_nguoi" id="giatrihd" class="form-control" />
                                </div> 
                                <div class="col-lg-12">
                                    <label>Điện thoại:</label>
                                    <input type="text" name="cn_dienthoai" id="giatrihd" class="form-control" />
                                </div> 
                                <div class="col-lg-12">
                                    <label>Địa chỉ giao hồ sơ:</label>
                                    <input type="text" name="cn_diachi" class="form-control"  />
                                </div>     
                                <div class="col-lg-12">
                                    <label>Email xuất hoá đơn:</label>
                                    <input type="text" name="cn_email" id="giatrihd" class="form-control" />
                                </div>                                 
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">  
                        <div class="box box-success">
                            <div class="box-body">    
                                <label>Người phụ trách:</label>
                                <div class="form-group">
                                    <div id="signature-pad3" class="signature-pad" style="width: 100%;height: 300px;">
                                        <div class="signature-pad--body">
                                            <canvas id="chuky1"></canvas>
                                        </div>
                                        <div class="signature-pad--footer">
                                            <div class="signature-pad--actions">
                                                <div> <button type="button" class="button clear3" data-action="clear3">Xóa</button>  
                                                </div>                           
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <input type="hidden" name="chuky" id="signature1" />
            </form>
        </div>
        <div class="box-footer">
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
                            <button type="button" class="btn bg-green pull-right" onclick="themmoikeh()">Thêm Mới</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>                       
            <button type="button" class="btn bg-green-active btn-flat margin-r-5" data-toggle="modal" data-target="#themmoi" id="btnthemmoi">Thêm Mới</button>
        </div>
    </div>
</div>              

<script type="text/javascript">
    $("#datepicker").datepicker({
        format: "dd/mm/yyyy"
    });
    $("#datepicker1").datepicker({
        format: "dd/mm/yyyy"
    });
    $("#datepicker2").datepicker({
        format: "dd/mm/yyyy"
    });
    $("#datepicker3").datepicker({
        format: "dd/mm/yyyy"
    });
    var currentDate = new Date();
    $("#datepicker").datepicker("setDate", currentDate);
    $("#datepicker1").datepicker("setDate", currentDate);
    $("#datepicker2").datepicker("setDate", currentDate);
    $("#datepicker3").datepicker("setDate", currentDate);

    var _timer, _timeOut = 2000;
    $('#giatrihd').on('input', function (e) {
        $(this).val(formatCurrency(this.value.replace(/[,]/g, '')));
    }).on('keypress', function (e) {
        if (!$.isNumeric(String.fromCharCode(e.which))) {
            e.preventDefault();
        }
    }).on('paste', function (e) {
        var cb = e.originalEvent.clipboardData || window.clipboardData;
        if (!$.isNumeric(cb.getData('text')))
            e.preventDefault();
    }).on('keyup', function (e) {
        clearTimeout(_timer);
        if (e.keyCode === 13) {      // close on ENTER key

        } else {                    // send xhr requests
            _timer = window.setTimeout(function () {
                _onInputChange();
            }, _timeOut);
        }
    }).on('focusout', function (e) {

    });

    function formatCurrency(number) {
        var n = number.split('').reverse().join("");
        var n2 = n.replace(/\d\d\d(?!$)/g, "$&,");
        return  n2.split('').reverse().join('');
    }


    function canvasToString(canvas) {

        var dataString = canvas.toDataURL("image/png");
        var index = dataString.indexOf(",") + 1;
        dataString = dataString.substring(index);
        return dataString;
    }

    function themmoikeh() {
        document.getElementById('tbloi').removeAttribute('h2');
        var signaturePad = document.getElementById("chuky1");
        document.getElementById("signature1").value = canvasToString(signaturePad);
        $.ajax({
            type: "POST",
            url: "kehadd?save",
            data: $("#frmkehadd").serialize(),
            success: function (data) {
                if (data === 'ok') {
                    document.getElementById('tbloi').innerHTML = '<h2 class="success text-success">Thêm mới thông tin thành công !!</h2>';
                    document.getElementById('themmoi').style.display = 'none';
                    $("#btnthemmoi").remove();
                    window.open("hoso?id=" +<%=objhs.getIdhs()%>, "_self");
                } else {
                    document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>' + data + '</em></h2>';
                }
            },
            error: function () {
                document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>Lỗi hệ thống</em></h2>';
            }
        });

        $("#themmoi").modal('hide');
    }

</script>
<script src="dist/css/signature/signature_pad.umd.js" ></script>
<script src="dist/css/signature/app.js"></script>
<%}%>