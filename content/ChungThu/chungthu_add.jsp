<%@page import="NhanVien.objNhanVien"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if (session.getAttribute("hsedit_hs") != null) {
        HoSo.objHoSo objhs = (HoSo.objHoSo) session.getAttribute("hsedit_hs");
        objNhanVien avl_login = (objNhanVien) session.getAttribute("avl_login");
        if (objhs.getTinhtrang() == DATA.danhsachBIEN._hs_daBaoGia && (objhs.getIdnvgia() == avl_login.getIdnv() || avl_login.getQuyen() == DATA.phanquyen._nhom_per_admin)) {
%>
<section class="content-header">
    <h1>
        <h2>NHẬP THÔNG TIN CHỨNG THƯ</h2>
        <a href="hoso?id=<%=objhs.getIdhs()%>"  class="btn btn-warning" >Quay về</a>
    </h1>           
</section>

<div class="row">   
    <div class="col-md-12">   
        <form  role="form"  method="post" id="frmkhadd" enctype="multipart/form-data" action="ctadd?themmoict"> 
            <div class="box box-success">
                <div class="box-header with-border">           
                    <h2>Chọn file dữ liệu chứng thư [File Excel] cho Hồ Sơ [<%=objhs.getMahs()%>]</h2>  
                    <input id='upload' type="file"  name="files" size="10" accept="Excel/xlsx,Excel/xls"   title="chọn chứng thư" />
                </div> 
            </div>          
            <div class="box-body">                      
                <div class="col-md-12">
                    <div class="box box-primary">                        
                        <div class="box-body">    
                            <div class="col-md-6">
                                <div class="col-md-6">
                                    <label>Số Chứng Thư:</label>
                                    <input type="text" id="1" name="soct" class="form-control"  required="" readonly="" readonly=""/>
                                </div>  
                                <div class="col-md-6">
                                    <label>Ngày phát hành(DD/MM/YYYY):</label>
                                    <input type="text" id="2"  name="ngayphathanh" class="form-control"  required=""  id="datepicker"/>
                                    <input style="transform: scale(1.3);" type="checkbox" name="checkbox" value="value" id="ckkiemtradate">
                                    <label class="text-red" >Check kiểm tra ngày tháng</label>
                                </div>
                                <div class="col-md-12">
                                    <label>Tên khách hàng:</label>
                                    <input type="text" id="3"  name="tenkh" class="form-control"  required="" readonly=""/>
                                </div>
                                <div class="col-md-12">
                                    <label>Chi nhánh/PGD (thực hiện khoản vay cho KH):</label>
                                    <input type="text" id="4"  name="cnpgd" class="form-control"  required="" readonly=""/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="col-md-12">
                                    <label>Địa chỉ BĐS Thẩm định giá (ghi chi tiết số nhà, ngõ, ngách, thôn xóm,…):</label>
                                    <input type="text" id="5"  name="diachits" class="form-control"  required="" readonly=""/>
                                </div>
                                <div class="col-md-4">
                                    <label>Tỉnh/ Thành phố:</label>
                                    <input type="text" id="6"   name="tinhtp" class="form-control"  required="" readonly=""/>
                                </div>
                                <div class="col-md-4">
                                    <label>Quận/ Huyện:</label>
                                    <input type="text" id="7"  name="quanhuyen" class="form-control"  required="" readonly=""/>
                                </div>
                                <div class="col-md-4">
                                    <label>Phường/Xã</label>
                                    <input type="text" id="8"  name="phuongxa" class="form-control"  required="" readonly=""/>
                                </div>
                                <div class="col-md-12">
                                    <label>Đường/phố:</label>
                                    <input type="text" id="9"  name="duongpho" class="form-control"  required="" readonly=""/>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="col-md-12">
                                    <label>Vị trí:</label>
                                    <input type="text" id="10"  name="vitri" class="form-control"  required="" readonly=""/>
                                </div>
                                <div class="col-md-12">
                                    <label>Mô tả BĐS (vị trí, chiều rộng ngõ/ ngách chỗ nhỏ nhất,…..):</label>
                                    <textarea type="text" id="11"  name="mota" class="form-control" cols="5" rows="10"  required="" readonly=""></textarea>
                                </div>                               
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="box box-primary"> 
                        <div class="box-header with-border">           
                            <h4>QSD Đất ở</h4> 
                        </div>      
                        <div class="box-body">    
                            <div class="col-md-12">
                                <label>Loại đất:</label>
                                <input type="text" id="12"  name="ld5-1" class="form-control"  required="" readonly=""/>  
                            </div>
                            <div class="col-md-4">

                                <label>Diện tích (m2):</label>
                                <input type="text" id="13" name="ld5-2" name="soct" class="form-control"  required="" readonly=""/>
                            </div>
                            <div class="col-md-4">
                                <label>Đơn giá (đồng/m2):</label>
                                <input type="text" id="14" name="ld5-3" class="form-control"  required="" readonly=""/>
                            </div>
                            <div class="col-md-4">
                                <label>Giá trị (đồng):</label>
                                <input type="text" id="15" name="ld5-4" class="form-control"  required="" readonly=""/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6"> 
                    <div class="box box-success"> 
                        <div class="box-header with-border">           
                            <h4>QSD đất khác:</h4> 
                        </div>      
                        <div class="box-body">     
                            <div class="col-md-4">
                                <label>Diện tích (m2):</label>
                                <input type="text" id="16" name="ldkhac-1" class="form-control"  required="" readonly=""/>
                            </div>
                            <div class="col-md-4">
                                <label>Đơn giá (đồng/m2):</label>
                                <input type="text" id="17" name="ldkhac-2" class="form-control"  required="" readonly=""/>
                            </div>
                            <div class="col-md-4">
                                <label>Giá trị (đồng):</label>
                                <input type="text" id="18" name="ldkhac-3" class="form-control"  required="" readonly=""/>
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-md-12">      
                    <div class="box ">
                        <div class="box-body">   
                            <div class="col-lg-6">
                                <label>Giá trị QSD đất:</label>
                                <input type="text" id="19" name="ldkhac-4" class="form-control"  required="" readonly=""/>            </div>
                        </div>
                    </div>
                </div> 
                <div class="col-md-6" id="tiepnoi">
                    <div class="box box-warning"> 
                        <div class="box-header with-border">           
                            <h4>CTXD TRÊN ĐẤT</h4> 
                        </div>      
                        <div class="box-body">     
                            <div class="col-md-4">
                                <label>Loại CTXD:</label>
                                <input type="text" id="20" name="ctxd-1" class="form-control"  required="" readonly=""/>
                            </div>
                            <div class="col-md-4">
                                <label>Diện tích:</label>
                                <input type="text" id="21" name="ctxd-2" class="form-control"  required="" readonly=""/>
                            </div>
                            <div class="col-md-4">
                                <label>Đơn giá XD:</label>
                                <input type="text" id="22" name="ctxd-3" class="form-control"  required="" readonly=""/>
                            </div>
                            <div class="col-md-4">
                                <label>CLCL:</label>
                                <input type="text" id="23" name="ctxd-4" class="form-control"  required="" readonly=""/>
                            </div>
                            <div class="col-md-4">
                                <label>Giá trị CTXD khác:</label>
                                <input type="text" id="24" name="ctxd-5" class="form-control"  required="" readonly=""/>
                            </div>
                            <div class="col-md-4">
                                <label>Giá trị CTXD:</label>
                                <input type="text"id="25" name="ctxd-6" class="form-control"  required="" readonly=""/>
                            </div>
                        </div>
                    </div>
                </div>  

                <div class="col-md-12">
                    <div class="box box-success"> 
                        <div class="box-body">     
                            <div class="col-md-4">
                                <label>Tổng giá trị định giá (đồng):</label>
                                <input type="text" id="26" name="tonggiatri" class="form-control"  required="" readonly=""/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="box box-info"> 
                <div class="box-body">     
                </div>
                <div class="box-footer">
                    <div id="tbloi">

                    </div>
                    <div class="modal modal-default fade" id="themmoiM">
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
                                    <input type="hidden" id="loaidatkhac" name="loaidatkhac" value="" />
                                    <input type="hidden" id="jsonstr" name="jsonstr" value="" />
                                    <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                                    <button type="button" class="btn bg-green pull-right" id="btnthemmoiclick">Thêm Mới</button>

                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>                       
                    <button type="button" class="btn bg-green-active btn-flat margin-r-5" data-toggle="modal" data-target="#themmoiM" id="btnthemmoi">Thêm Mới</button>

                </div>


        </form>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.8.0/jszip.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.8.0/xlsx.js"></script>

<script>
    var ExcelToJSON = function () {
        this.parseExcel = function (file) {
            var reader = new FileReader();
            reader.onload = function (e) {
                var data = e.target.result;
                var workbook = XLSX.read(data, {
                    type: 'binary'
                });
                //var str = stox(workbook);

                var json_object = JSON.parse(JSON.stringify(XLSX.utils.sheet_to_json(workbook.Sheets['CẬP NHẬT CHO PM'], {raw: false, header: 1, defval: ""})));
                console.log(json_object);
                var json_up = '{';
                var i;
                var loai = 1;
                var loaidatkhac = 0;
                var hang_bd=4;
                if(json_object.length >9)
                    hang_bd=5;
                for (i = 1; i < json_object.length; i++)
                {
                    var json_object2 = json_object[i]; //JSON.parse(json_object[i]);

                    if (i === hang_bd) {
                        json_up += "" + JSON.stringify(json_object2) + '';
                        //console.log(json_object2);
                        for (ii = 1; ii < json_object2.length; ii++)
                        {
                            if (json_object2[ii] !== undefined) {
                                document.getElementById(ii).value = json_object2[ii];
                            }
                        }
                        var diachi = json_object2[5].split(',');
                        document.getElementById('6').value = diachi[diachi.length - 1];
                        document.getElementById('7').value = diachi[diachi.length - 2];
                        document.getElementById('8').value = diachi[diachi.length - 3];
                        var dc = json_object2[5];
                        dc = dc.replace(diachi[diachi.length - 1], "").replace(diachi[diachi.length - 2], "").replace(diachi[diachi.length - 3], "");
                        document.getElementById('9').value = dc.substring(0, dc.length - 3);

                    }
                    if (i > hang_bd) {
                        if (json_object2[12] !== undefined && json_object2[12].trim().length > 0) { //
                            console.log('loai: ' + json_object2[12] + ':');
                            loaidatkhac++;
                            json_up += ',' + JSON.stringify(json_object2) + '';
                            //console.log(json_object2);
                            var html = "";
                            html += '<div class="col-md-6"><div class="box box-danger"><div class="box-header with-border"><h4>Loại Đất ' + (loaidatkhac + 1) + '</h4></div> <div class="box-body"> ';
                            html += '<div class="col-md-12">';
                            html += '<label>Loại đất :</label>';
                            html += '<input type="text"  class="form-control" name="ld' + loai + '-1" value="' + json_object2[12] + '"  required="" readonly=""/>';
                            html += '</div>';
                            html += '<div class="col-md-4">';
                            html += '<label>QSD đất khác - Diện tích (m2):</label>';
                            html += '<input type="text"   class="form-control"  name="ld' + loai + '-2" value="' + json_object2[16] + '" required="" readonly=""/>';
                            html += '</div>';
                            html += '<div class="col-md-4">';
                            html += '<label>QSD đất khác - Đơn giá (đồng/m2):</label>';
                            html += '<input type="text"   class="form-control"  name="ld' + loai + '-3" value="' + json_object2[17] + '" required="" readonly=""/>';
                            html += '</div>';
                            html += '<div class="col-md-4">';
                            html += '<label>QSD đất khác - Giá trị (đồng):</label>';
                            html += '<input type="text"  class="form-control"  name="ld' + loai + '-4" value="' + json_object2[18] + '" required="" readonly=""/>';
                            html += '</div>';
                            html += '<div class="col-md-12">';
                            html += '<label>Giá trị QSD đất:</label>';
                            html += '<input type="text" value="' + json_object2[19] + '"  name="ld' + loai + '-5" class="form-control"  required="" readonly=""/>';
                            html += '</div></div></div></div>';
                            document.getElementById('tiepnoi').insertAdjacentHTML('beforebegin', html);

                            loai++;
                        }
                    }
                }
                json_up += "}";
                document.getElementById('loaidatkhac').value = loaidatkhac;
                document.getElementById('jsonstr').value = JSON.stringify($("#frmkhadd").serializeArray());

            };

            reader.onerror = function (ex) {
                console.log(ex);
            };

            reader.readAsBinaryString(file);
        };
    };
    function stox(wb) {
        var ws = wb.Sheets['CẬP NHẬT CHO PM'];
        var aoa = XLSX.utils.sheet_to_json(ws, {raw: false, header: 1});
        var cells = {};
        var xx = 0;
        var yy = 0;
        aoa.forEach(function (r, i) {
            console.log(i);
            xx = 1;
            if (i > 4) {
                r.forEach(function (c, j) {
                    cells[j] = c;
                    console.log(i + "_" + xx + "_" + c);
                    xx++;
                });

            }
        })
        //console.log(aoa);
        return cells;
    }
    function handleFileSelect(evt) {

        var files = evt.target.files; // FileList object
        var xl2json = new ExcelToJSON();
        xl2json.parseExcel(files[0]);
        document.getElementById('upload').style.display = 'none';
    }

</script>
<script type="text/javascript">

    document.getElementById('upload').addEventListener('change', handleFileSelect, false);
    $(document).ready(function () {
        $("#btnthemmoiclick").click(function (event) {
            event.preventDefault();
            if ($("#ckkiemtradate").is(':checked')) {

                var form = $('#frmkhadd')[0];
                var data = new FormData(form);
                $.ajax({
                    type: "POST",
                    enctype: 'multipart/form-data',
                    url: "ctadd?themmoict",
                    data: data,
                    processData: false,
                    contentType: false,
                    cache: false,
                    timeout: 600000,
                    success: function (data) {
                        if (data === 'ok') {
                            document.getElementById('tbloi').innerHTML = '<h2 class="success text-success">Thêm mới thông tin thành công !!</h2>';
                            document.getElementById('themmoiM').style.display = 'none';
                            $("#btnthemmoi").remove();
                            window.open("hoso?id=" +<%=objhs.getIdhs()%>, "_self");
                        } else {
                            document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>' + data + '</em></h2>';
                        }
                    },
                    error: function (e) {
                        document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>Lỗi hệ thống</em></h2>';
                    }
                });

            } else {
                document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>Kiểm tra ngày tháng chứng thư.</em></h2>';
            }
            $("#themmoiM").modal('hide');
        });


    });
</script>
<%}
    }%>