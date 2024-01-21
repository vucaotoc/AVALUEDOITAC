<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="content-header">
    <h1>
        <small>THÊM MỚI THÔNG TIN KHÁCH HÀNG</small>
        <a href="khachhang"  class="btn btn-warning" >Quay về</a>
    </h1>           
</section>
<div class="row">
    <div class="col-md-12">   
        <div class="box">
            <div class="box-header with-border">           
                <span>Thêm đầy đủ các trường của khách hàng</span>

            </div>
            <div class="box-body">               
                <form  role="form"  method="post" id="frmkhadd" >  
                    <div class="form-group">
                        <label>Vui lòng chọn nhóm Khách Hàng : </label>
                        <input type="radio" id="CN" name="nhomkh" value="CN"   onclick="CheckCNDN();" />Cá Nhân
                        <input type="radio" id="DN" name="nhomkh" value="DN"   onclick="CheckCNDN();"/>Doanh Nghiệp
                    </div>
                    <div id="KHCN" style="display:none">
                        <div class="col-lg-8">
                            <label>Tên khách hàng <span class="text-red" >(*)</span> </label>
                            <input type="text" name="tenkh" class="form-control" required="" />                                
                        </div>  
                        <div class="col-lg-4">
                            <label>Giới tính: </label>
                            <select name= "gioitinh" class="form-control">
                                <option value="Ông">Ông</option>
                                <option value="Bà">Bà</option>
                            </select>
                        </div> 
                        <div class="col-lg-6">
                            <label>Số điện thoại: </label>
                            <input type="text" name="sodt" class="form-control" required="" />                                
                        </div> 
                        <div class="col-lg-6">
                            <label>Email: </label>
                            <input type="email" name="email" class="form-control" required=""/>
                        </div> 
                        <div class="col-lg-4">
                            <label>CMND/CCCD Số <span class="text-red" >(*)</span>:</label>
                            <input type="number" name="cmndso" id="cmndso" class="form-control"  required=""/>
                        </div>                   
                        <div class="col-lg-4">
                            <label>CMND Nơi Cấp:</label>      

                            <select name= "cmndnoicap" class="form-control" id="cmndprovince">
                                <jsp:include page="../DiaChi/getProvince.jsp" />
                            </select>    
                            
                        </div>
                        <div class="col-lg-4">
                            <label>CMND ngày cấp: </label>
                            <input type="text" name="cmndngaycap" class="form-control" required="" id="datepicker"/>                                
                        </div>  
                    </div>
                    <div id="KHDN" style="display:none">
                        <div class="col-lg-2">
                            <label>Mã số thuế<span class="text-red" >(*)</span> :</label>                       
                            <input type="text" name="masothue" class="form-control"  required=""/>                                       

                        </div>
                        <div class="col-lg-10">
                            <label>Tên công ty<span class="text-red" >(*)</span> :</label>                       
                            <input type="text" name="tencongty" class="form-control"  required=""/>                                     

                        </div>                       
                        <div class="col-lg-6">
                            <label>Đại diện:</label>                       
                            <input type="text" name="daidien" class="form-control"  required=""/>                                     

                        </div>
                        <div class="col-lg-6">
                            <label>Chức vụ:</label>                       
                            <input type="text" name="chucvu" class="form-control"  required=""/>                                      

                        </div>
                    </div>
                    <div class="col-lg-4">
                        <label>Tỉnh / Thành Phố: </label>
                        <select class="form-control" name="tinhtp" required="" id="dcprovince">
                            <jsp:include page="../DiaChi/getProvince.jsp" />
                        </select>                             
                    </div> 
                    <div class="col-lg-4">
                        <label>Quận / Huyện: </label>
                        <select class="form-control" name="quanhuyen"  required="" id="dcdistrict">

                        </select>                                
                    </div> 
                    <div class="col-lg-4">
                        <label>Phường / Xã: </label>
                        <select class="form-control" name="phuongxa" required="" id="dcward"/> </select>          
                    </div> 
                    <div class="col-lg-12">
                        <label>Địa chỉ:</label>
                        <input type="text" name="diachi" class="form-control"  required=""id="dcdiachi" />
                    </div>                  


                </form>
            </div>           
        </div>
        <div class="box">           
            <div class="box-body">   
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
                                <p>Xác nhận thêm mới thông tin khách hàng ?</p>
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
    $("#datepicker").datepicker({
        format: "dd/mm/yyyy"
    });
    function CheckCNDN() {

        if (document.getElementById("CN").checked) {
            document.getElementById('KHCN').style.display = 'block';
            document.getElementById('KHDN').style.display = 'none';

        }
        if (document.getElementById("DN").checked) {
            document.getElementById('KHDN').style.display = 'block';
            document.getElementById('KHCN').style.display = 'none';

        }
    }
    

    function themmoikh() {
        document.getElementById('tbloi').removeAttribute('h2');
        if (document.getElementById("CN").checked || document.getElementById("DN").checked) {
            $.ajax({
                type: "POST",
                url: "khadd?themmoikh",
                data: $("#frmkhadd").serialize(),
                success: function (data) {

                    if (data === 'ok') {
                        document.getElementById('tbloi').innerHTML = '<h2 class="success text-success">Thêm mới thông tin khách hàng thành công !!</h2>';
                        document.getElementById('themmoi').style.display = 'none';
                        $("#btnthemmoi").remove();
                    } else {
                        document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>' + data + '</em></h2>';
                    }
                },
                error: function () {
                    document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>Lỗi hệ thống</em></h2>';
                }
            });


        } else {
            document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>Vui lòng chọn nhóm khách hàng</em></h2>';
        }
        $("#themmoi").modal('hide');
    }


</script>

<script type="text/javascript">

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


    });

</script>