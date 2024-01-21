<%@page import="NhanVien.objNhanVien"%>
<%@page import="HoSo.objHAPhapLy"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if (session.getAttribute("tsedit") != null) {
        TaiSan.objTaiSan objts = (TaiSan.objTaiSan) session.getAttribute("tsedit");
        DecimalFormat fmVND = new DecimalFormat("###,###,###");
        SimpleDateFormat dtf = new SimpleDateFormat("dd/MM/yyyy");
        objNhanVien avl_login = (objNhanVien) session.getAttribute("avl_login");

%>
<section class="content-header">
    <h1>
        <small>THÔNG TIN TÀI SẢN THẨM ĐỊNH </small>
        <%  if (objts.getIdhs() > 0) {%>
        <a href="hoso?id=<%=objts.getIdhs()%>"  class="btn btn-warning" >Quay về</a>
        <%} else {%>   
        <a href="taisan"  class="btn btn-warning" >Quay về</a>
        <%}%>
    </h1>           
</section>

<div class="row">
    <div class="col-md-7">   
        <div class="box box-success">
            <div class="box-header">      
                <h2 class="text-green">
                    <% if (objts.getIdhs() == 0) {%>  
                    Tài sản [<%=objts.getIdts()%>] chưa lập hồ sơ
                    <% if (session.getAttribute("hsadd") != null) {%>
                    <a type="submit" class="btn btn-success" href="hsadd?addts=<%=objts.getIdts()%>">ADD HS</a>
                    <%}%>
                    <%} else {%>
                    Tài sản [<%=objts.getIdts()%>] Đã lập Hồ Sơ
                    <%}%>                     
                </h2>
            </div>
            <div class="box-body">               
                <form  role="form"  method="post"  id="frmtsedit" > 
                    <input type="hidden" name="idts" value="<%=objts.getIdts()%>" />
                    <div class="col-lg-12">
                        <div class="col-lg-6">
                            <label>NV Tạo: </label>
                            <input type="text" name="nvtao" class="form-control" value="<%=objts.getTennvtao()%>" disabled/>                         
                        </div> 
                        <div class="col-lg-6">
                            <label>Loại tài sản: </label>
                            <% if (avl_login.getQuyen() == DATA.phanquyen._nhom_per_admin || avl_login.getQuyen() == DATA.phanquyen._nhom_per_manager) {%>
                            <select name= "loaits" id="loaits" class="form-control">
                                <option value="<%=objts.getLoaits()%>" selected=""><%=objts.getLoaits()%></option>
                                <jsp:include page="../dungchung/loaits.jsp"/>                     
                            </select>
                            <%} else {%>
                            <input type="text"  name= "loaits" id="loaits" class="form-control" value="<%=objts.getLoaits()%>" disabled/>                    
                            <%}%>
                        </div>    
                        <div class="col-lg-6">
                            <label>Giá sơ bộ: </label>
                            <input type="text" name="notegia"   class="form-control" value="<%=objts.getNotegia()%>" />  
                        </div> 
                        <div class="col-lg-6">
                            <label>Giá đã TĐ(VNĐ): </label>
                            <input type="text" name="giatd" class="form-control" value="<%=fmVND.format(objts.getGiatd())%>" disabled=""/>
                            <span class="help-block" id="giatd_bangchu"></span>
                        </div>
                        <div class="col-lg-4">
                            <label>Tỉnh / Thành Phố: </label>
                            <select class="form-control" name="tinhtp" required="" id="dcprovince">
                                <option value="<%=objts.getTinhtp()%>"><%=objts.getTinhtp()%></option>
                                <jsp:include page="../DiaChi/getProvince.jsp" />
                            </select>                             
                        </div> 
                        <div class="col-lg-4">
                            <label>Quận / Huyện: </label>
                            <select class="form-control" name="quanhuyen" required="" id="dcdistrict">                            
                                <option value="<%=objts.getQuanhuyen()%>"><%=objts.getQuanhuyen()%></option>
                            </select>                           
                        </div> 
                        <div class="col-lg-4">
                            <label>Phường / Xã: </label>
                            <select name="phuongxa" class="form-control" required="" id="dcward" >
                                <option value="<%=objts.getPhuongxa()%>"><%=objts.getPhuongxa()%></option>
                            </select>   
                        </div> 
                        <div class="col-lg-12">
                            <label>Địa chỉ:</label>
                            <input type="text" name="diachi" class="form-control"  value="<%=objts.getDiachi()%>" required=""/>
                        </div>  

                    </div>


                    <div class="col-lg-12" id="ptvtinfo"  <% if (objts.getLoaits().endsWith("Phương Tiện Vận Tải")) {%> style="display:block;" <%} else {%>style="display:none;"<%}%>>
                        <div class="col-lg-6">
                            <label>Loại xe:<span class="text-red" >(*)</span> :</label>
                            <input type="text" name="loaixe" class="form-control" value="<%=objts.getPtvt_loaixe()%>" />                           
                        </div> 
                        <div class="col-lg-6">
                            <label>Biển số:<span class="text-red" >(*)</span> :</label>
                            <input type="text" name="bienso" class="form-control" value="<%=objts.getPtvt_bienso()%>" />                           
                        </div> 
                        <div class="col-lg-6">
                            <label>Model:<span class="text-red" >(*)</span> :</label>
                            <input type="text" name="model" class="form-control" value="<%=objts.getPtvt_model()%>" />                           
                        </div> 
                        <div class="col-lg-6">
                            <label>Màu sơn:<span class="text-red" >(*)</span> :</label>
                            <input type="text" name="mauson" class="form-control" value="<%=objts.getPtvt_mauson()%>" />                           
                        </div> 
                        <div class="col-lg-6">
                            <label>Năm SX:<span class="text-red" >(*)</span> :</label>
                            <input type="text" name="namsx" class="form-control" value="<%=objts.getPtvt_namsx()%>" />                           
                        </div> 
                    </div>
                    <div class="col-lg-6" id="mminfo"  <% if (objts.getLoaits().endsWith("Máy Móc")) {%> style="display:block;" <%} else {%>style="display:none;"<%}%>>
                        <div class="col-lg-12">
                            <label>Loại máy móc:<span class="text-red" >(*)</span> :</label>
                            <input type="text" name="loaimaymoc" class="form-control" value="<%=objts.getMm_loaimm()%>" />                           
                        </div> 
                    </div>

                    <div class="col-lg-12">
                        <div class="col-lg-12">
                            <label>Đối tác ngân hàng/PGD(nhập theo mẫu):<span class="text-red">[ngân hàng]_[Chi nhánh]_[PGD]</span></label>
                            <input type="text" name="doitacnh" class="form-control" value="<%=objts.getDoitacnh()%>"  required=""/>
                        </div> 
                        <div class="col-lg-12">
                            <label>Cán bộ ngân hàng(nhập theo mẫu):<span class="text-red">[địa chỉ mail] or [Tên]_[Số điện thoại]</span> </label>
                            <input type="text" name="canbonh" class="form-control" value="<%=objts.getCanbonh()%>" required=""/>
                        </div>          
                        <div class="col-lg-12">
                            <label>Ghi chú thông tin tài sản:</label>
                            <textarea class="textarea" placeholder="ghí chú thông tin tài sản" name="ghichu" maxlength="400" 
                                      style="width: 100%; height: 100px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"><%=objts.getGhichu()%></textarea>

                            <button type="button" class="btn bg-blue-active btn-flat margin-r-5" data-toggle="modal" data-target="#capnhatghichu" >cập nhật ghi chú</button>
                        </div>
                        <div class="modal modal-default fade" id="capnhatghichu">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">×</span></button>
                                        <h4 class="modal-title">Cập nhật</h4>
                                    </div>
                                    <div class="modal-body">                                    
                                        <p>Xác nhận cập nhật thông tin  ?</p>
                                        <p id="tbloighichu"> </p>
                                    </div>
                                    <div class="modal-footer">                                   
                                        <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                                        <button type="button" class="btn bg-green pull-right" onclick="capnhatghichu();">Cập Nhật</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>   
                    </div>
                </form>
            </div>
            <div class="box-footer">
                <% if (avl_login.getQuyen() == DATA.phanquyen._nhom_per_admin || avl_login.getQuyen() == DATA.phanquyen._nhom_per_manager) { %>
                <div id="tbloi">

                </div>
                <div class="modal modal-default fade" id="capnhat">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span></button>
                                <h4 class="modal-title">Cập nhật</h4>
                            </div>
                            <div class="modal-body">                                    
                                <p>Xác nhận cập nhật thông tin  ?</p>
                            </div>
                            <div class="modal-footer">                                   
                                <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                                <button type="button" class="btn bg-green pull-right" onclick="capnhatkh()">Cập Nhật</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>   
                <button type="button" class="btn bg-green-active btn-flat margin-r-5" data-toggle="modal" data-target="#capnhat" id="btnthemmoi">Cập Nhật</button>
                <% if (objts.getTinhtrang() == 0 && objts.getIdhs() == 0) { %>
                <div class="modal modal-default fade" id="huyts">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span></button>
                                <h4 class="modal-title">Xóa</h4>
                            </div>
                            <div class="modal-body">                                    
                                <p>Xác nhận hủy thông tin  tài sản?</p>
                            </div>
                            <div class="modal-footer">                                   
                                <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                                <button type="button" class="btn bg-green pull-right" onclick="capnhatts()">Cập Nhật</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>                          
                <button type="button" class="btn bg-black-active btn-flat pull-right" data-toggle="modal" data-target="#huyts" id="btnhuyts">Xóa TS</button>
                <%}
                    }%>

            </div>
        </div>
    </div>

    <div class="col-md-5">   
        <div class="box box-warning">
            <div class="box-header with-border">
                <h2>Thông tin pháp lý</h2>                
                <% if (avl_login.getQuyen() == DATA.phanquyen._nhom_per_admin || avl_login.getQuyen() == DATA.phanquyen._nhom_per_manager || objts.getIdnvtao() == avl_login.getIdnv()) {%>
                <div class="form-group">
                    <label>Chọn file upload (<span class="text-red">Tối da 50MB 1 file</span>):</label>
                </div>
                <form method="post" action="phaplyts" enctype="multipart/form-data" onsubmit="return(validate());" >
                    <div class="col-lg-9">                        
                        <input type="file" name="file" size="10" multiple="true" class="form-control" id="fileupload" />
                        <div id="showfilename"></div>
                    </div>                    
                    <div class="col-lg-3">
                        <input type="submit" value="Upload" name="upload" class="btn bg-green-active btn-flat margin-r-5" />
                    </div>
                </form>
                <%}%>
            </div>
           
            <div class="box-body table-responsive no-padding">  
                <table class="table table-hover">
                    <tr>            
                       
                        <th>Files</th>  
                        <th style="width: 10%;"></th>
                        <th style="width: 10%;"></th>
                    </tr>
                    <%
                        if (session.getAttribute("tsedit_HAPL") != null) {
                            ArrayList<objHAPhapLy> arrHA = (ArrayList<objHAPhapLy>) session.getAttribute("tsedit_HAPL");

                            if (arrHA.size() > 0) {
                                for (objHAPhapLy obj : arrHA) {
                    %>

                    <tr>             
                        
                        <td><a href="data/<%=obj.getfullPath()%>" target="_blank"><%=obj.getTenha()%> </a><br/> </td>                  
                        <td> <a href="upfhoso?down=<%=obj.getIdha()%>" ><span class="badge bg-blue">Tải về</span></a></td>
                        <% if (avl_login.getQuyen() == DATA.phanquyen._nhom_per_admin || avl_login.getQuyen() == DATA.phanquyen._nhom_per_manager || objts.getIdnvtao() == avl_login.getIdnv()) {%>
                        <td> <a href="phaplyts?del=<%=obj.getIdha()%>" ><span class="badge bg-red">Xóa</span></a></td>
                        <%}%>

                    </tr>

                    <%}
                            }
                        }%>
                </table>
            </div>
        
        </div>
    </div>

    <%
        if (objts.getIdhs() > 0) {
            if (session.getAttribute("hsedit_hs") != null) {
                HoSo.objHoSo objhs = (HoSo.objHoSo) session.getAttribute("hsedit_hs");
    %>   
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header"> 
                <h2>Thông tin hồ sơ <%=objhs.getMahs()%></h2>
            </div>
            <div class="box-body">    
                <div class="col-lg-4">
                    <label>Mã hồ sơ: </label>
                    <input type="text" name="mahs" class="form-control" value="<%=objhs.getMahs()%>" disabled/>
                </div> 
                <div class="col-lg-4">
                    <label>Số chứng thư:</label>
                    <input type="text" name="soct" class="form-control" value="<%=objhs.getSoct()%>" disabled />
                </div>      
                <div class="col-lg-4">
                    <label>Ngày Lập <span class="text-red">(*)</span>: </label>
                    <input type="text" name="ngahd" class="form-control"  value="<%=dtf.format(objhs.getNgaylaphs())%>" id="datepicker"/>
                </div>                      
                <div class="col-lg-6">
                    <label>Đối tác ngân hàng/Phòng giao dịch<span class="text-red">(*)</span>:</label>
                    <input type="text" name="doitac" class="form-control"  value="<%=objhs.getDoitac()%>"/>
                </div>     
                <div class="col-lg-6">
                    <label>Cán bộ ngân hàng<span class="text-red">(*)</span>:</label>
                    <input type="text" name="canbo" class="form-control"  value="<%=objhs.getCbthuchien()%>"/>
                </div>     
                <div class="col-lg-12">
                    <label>Giá trị HĐ [Bằng tiền]:</label>
                    <input type="text" name="giatrihd" id="giatrihd" class="form-control" value="<%=fmVND.format(objhs.getGiatrihd())%>"/>
                </div> 
                <div class="col-lg-12">
                    <label>Giá trị HĐ [Bằng chữ]:</label>
                    <input type="text" name="giatrihdbangchu" id="giatrihd_bangchu" class="form-control" value="<%=objhs.getGiatrihdbangchu()%>" readonly="" />
                </div>


            </div>
        </div>
    </div>

    <%}
        }%>

</div>
<script src="dist/js/jsavl_currency.js" type="text/javascript"></script>
<script type='text/javascript'>

                    var _timer, _timeOut = 2000;
                    $('#giats').on('input', function (e) {
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
                            document.getElementById("giats_bangchu").innerHTML = DocTienBangChu(this.value.replace(/[,]/g, ''));
                        } else {                    // send xhr requests
                            _timer = window.setTimeout(function () {
                                _onInputChange();
                            }, _timeOut);
                        }
                    }).on('focusout', function (e) {
                        document.getElementById("giats_bangchu").innerHTML = DocTienBangChu(this.value.replace(/[,]/g, ''));
                    });

                    function formatCurrency(number) {
                        var n = number.split('').reverse().join("");
                        var n2 = n.replace(/\d\d\d(?!$)/g, "$&,");
                        return  n2.split('').reverse().join('');
                    }
                    function capnhatkh() {
                        document.getElementById('tbloi').removeAttribute('h2');
                        $.ajax({
                            type: "POST",
                            url: "tsedit?capnhat",
                            data: $("#frmtsedit").serialize(),
                            success: function (data) {
                                if (data === 'ok') {
                                    document.getElementById('tbloi').innerHTML = '<h2 class="success text-success">Cập nhật thông tin  thành công !!</h2>';
                                    window.open("taisan?id=" +<%=objts.getIdts()%>, "_self");
                                } else {
                                    document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>' + data + '</em></h2>';
                                }
                            },
                            error: function () {
                                document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>Lỗi hệ thống</em></h2>';
                            }
                        });

                        $("#capnhat").modal('hide');
                    }
                    function capnhatghichu() {
                        document.getElementById('tbloighichu').removeAttribute('h2');
                        $.ajax({
                            type: "POST",
                            url: "tsedit?upghichu",
                            data: $("#frmtsedit").serialize(),
                            success: function (data) {
                                if (data === 'ok') {
                                    document.getElementById('tbloighichu').innerHTML = '<h2 class="success text-success">Cập nhật thông tin  thành công !!</h2>';
                                    $("#capnhatghichu").modal('hide');
                                } else {
                                    document.getElementById('tbloighichu').innerHTML = '<h2 class="error text-danger"><em>' + data + '</em></h2>';
                                }
                            },
                            error: function () {
                                document.getElementById('tbloighichu').innerHTML = '<h2 class="error text-danger"><em>Lỗi hệ thống</em></h2>';
                            }
                        });


                    }
                    function capnhatts() {
                        document.getElementById('tbloi').removeAttribute('h2');
                        $.ajax({
                            type: "POST",
                            url: "tsdel",
                            data: $("#frmtsedit").serialize(),
                            success: function (data) {
                                if (data === 'ok') {
                                    document.getElementById('tbloi').innerHTML = '<h2 class="success text-success">Cập nhật thông tin  thành công !!</h2>';

                                } else {
                                    document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>' + data + '</em></h2>';
                                }
                            },
                            error: function () {
                                document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>Lỗi hệ thống</em></h2>';
                            }
                        });

                        $("#huyts").modal('hide');
                    }

                    $(document).ready(function () {
                        $('#dcprovince').change(function (event) {
                            var $element = $(this).find('option:selected');
                            var $pro = $element.attr("alt");
                            //console.log($pro);
                            $.get('diachi', {jdis: "aka", provinceid: $pro}, function (responseJson) {
                                var $select = $('#dcdistrict');
                                var html;
                                $.each(responseJson.Province, function (index, options) {
                                    html += '<option value="' + options._prefixdis + ' ' + options._namedis + '" alt="' + options._district_id + '">' + options._prefixdis + ' ' + options._namedis + '</option>';
                                });
                                $select.html(html);
                            }, 'json');
                        });
                        $('#dcdistrict').change(function (event) {
                            var $pro = $("select#dcprovince").find('option:selected').attr('alt');
                            var $dis = $("select#dcdistrict").find('option:selected').attr('alt');
                            //console.log($pro+' '+$dis);
                            $.get('diachi', {jward: "aka", provinceid: $pro, districtid: $dis}, function (responseJson) {
                                var $select = $('#dcward');
                                var html;
                                $.each(responseJson.ward, function (index, options) {
                                    html += '<option value="' + options._prefixwa + ' ' + options._namewa + '" alt="' + options.ward_id + '" >' + options._prefixwa + ' ' + options._namewa + '</option>';
                                });
                                $select.html(html);
                            }, 'json');
                        });



                        $('#loaits').change(function (event) {
                            var $element = $(this).find('option:selected');
                            var $pro = $element.attr('value');
                            if ($pro === 'Phương Tiện Vận Tải')
                            {
                                document.getElementById('ptvtinfo').style.display = 'block';
                            } else {
                                document.getElementById('ptvtinfo').style.display = 'none';
                            }
                            console.log($pro);

                        });
                    });
                    $('#fileupload').on('change', function () {
                        var files = '';
                        for (var i = 0; i < $(this)[0].files.length; i++) {
                            files += "<a href=\"#\" >" + $(this)[0].files[i].name + "</a><br/>";
                        }
                        document.getElementById('showfilename').innerHTML = files;
                    });
                    function validate() {
                        var inputField = document.getElementById('uploadkem');
                        if (inputField.files.length === 0) {
                            alert("Vui lòng chọn file để upload");
                            inputField.focus();
                            return false;
                        }
                    }


</script>


<%}%>