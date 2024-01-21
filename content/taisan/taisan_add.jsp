<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="content-header">
    <h1>
        <small>THÊM MỚI TÀI SẢN THẨM ĐỊNH</small>
        <a href="taisan"  class="btn btn-warning" >Quay về</a>
    </h1>           
</section>

<div class="row">
    <div class="col-md-12">   
        <div class="box box-warning">
            <div class="box-header with-border">           
                <span>Thêm đầy đủ các trường của của tài sản.</span>
            </div>
            <div class="box-body">               
                <form  role="form"  method="post" id="frmkhadd" > 
                    <div class="col-lg-6" >
                        <div class="col-lg-12">
                            <label>Loại tài sản: </label>
                            <select name= "loaits" id="loaits" class="form-control">
                                <jsp:include page="../dungchung/loaits.jsp"/>                     
                            </select>
                        </div>        


                        <div class="col-lg-4" id="divtinhtp">
                            <label>Tỉnh / Thành Phố : </label>
                            <select class="form-control" name="tinhtp" required="" id="dcprovince">
                                <jsp:include page="../DiaChi/getProvince.jsp" />
                            </select>                             
                        </div> 
                        <div class="col-lg-4" id="divquanhuyen">
                            <label  id="lablequanhuyen">Quận / Huyện : </label>
                            <select class="form-control" name="quanhuyen" required="" id="dcdistrict">   
                            </select>                                
                        </div> 
                        <div class="col-lg-4" id="divphuongxa">
                            <label  id="lablephuongxa" >Phường / Xã : </label>
                            <select name="phuongxa" class="form-control" required="" id="dcward" > </select>     
                        </div> 
                        <div class="col-lg-12">
                            <label id="lablediachi">Địa chỉ:</label>
                            <input type="text" name="diachi" id="diachits" class="form-control"  required=""/>
                        </div>      

                        <div class="col-lg-6">
                            <label>Đối tác ngân hàng/Phòng giao dịch:</label>
                            <input type="text" name="doitacnh" class="form-control"  required=""/>
                        </div> 
                        <div class="col-lg-6">
                            <label>Cán bộ ngân hàng:</label>
                            <input type="text" name="canbonh" class="form-control"  required=""/>
                        </div> 
                    </div>
                    <div class="col-lg-6" id="ptvtinfo" style="display:none;">
                        <div class="col-lg-6">
                            <label>Loại xe:<span class="text-red" >(*)</span> :</label>
                            <input type="text" name="loaixe" class="form-control"  />                           
                        </div>  
                        <div class="col-lg-6">
                            <label>Biển số xe:<span class="text-red" >(*)</span> :</label>
                            <input type="text" name="bienso" class="form-control"  />                           
                        </div> 
                        <div class="col-lg-6">
                            <label>Model:<span class="text-red" >(*)</span> :</label>
                            <input type="text" name="model" class="form-control"  />                           
                        </div>                        
                        <div class="col-lg-6">
                            <label>Năm SX:<span class="text-red" >(*)</span> :</label>
                            <input type="text" name="namsx" class="form-control"  />                           
                        </div> 
                        <div class="col-lg-6">
                            <label>Màu sơn:<span class="text-red" >(*)</span> :</label>
                            <input type="text" name="mauson" class="form-control"  />                           
                        </div> 
                    </div>
                    <div class="col-lg-6" id="mminfo" style="display:none;">
                        <div class="col-lg-12">
                            <label>Loại máy móc:</label>
                            <input type="text" name="loaimaymoc" class="form-control"  />                           
                        </div>  
                    </div>
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
                                <button type="button" class="btn bg-green pull-right" onclick="themmoikh()">Thêm Mới</button>
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

</div>
<script type="text/javascript">
    function themmoikh() {
        document.getElementById('tbloi').removeAttribute('h2');
        $.ajax({
            type: "POST",
            url: "tsadd?themmoits",
            data: $("#frmkhadd").serialize(),
            success: function (data) {
                console.log(data);
                if (data.startsWith('ok')) {
                    
                    document.getElementById('tbloi').innerHTML = '<h2 class="success text-success">Thêm mới thông tin thành công !!</h2>';
                    document.getElementById('themmoi').style.display = 'none';
                    $("#btnthemmoi").remove();
                    window.open("taisan?id="+data.split(';')[1], "_self");

                } else {
                    if (data.startsWith("Tài sản vừa thêm mới")) {
                        document.getElementById('tbloi').innerHTML = '<h2 class="success text-success">Thêm mới thông tin thành công !!</h2>\n\
                            <h2 class="error text-danger"><em>' + data + '</em></h2>';
                        document.getElementById('themmoi').style.display = 'none';
                        $("#btnthemmoi").remove();
                        //window.open("taisan", "_self");
                    } else {
                        document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>' + data + '</em></h2>';
                    }
                }
            },
            error: function () {
                document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>Lỗi hệ thống</em></h2>';
            }
        });

        $("#themmoi").modal('hide');
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
                document.getElementById('mminfo').style.display = 'none';
            } else if ($pro === 'Máy Móc') {
                document.getElementById('mminfo').style.display = 'block';
                document.getElementById('ptvtinfo').style.display = 'none';
            } else {
                document.getElementById('ptvtinfo').style.display = 'none';
                document.getElementById('mminfo').style.display = 'none';
            }
            //console.log($pro);

        });



    });
</script>