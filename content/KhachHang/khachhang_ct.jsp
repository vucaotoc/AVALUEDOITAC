<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if (session.getAttribute("khedit") != null) {
        KhachHang.objKhachhang objkh = (KhachHang.objKhachhang) session.getAttribute("khedit");

%>
<section class="content-header">
    <h1>
        THÔNG TIN KHÁCH HÀNG<small>[<%=objkh.getIdkh()%>]</small>
         <a href="khachhang"  class="btn btn-warning" >Quay về</a>
    </h1>           
</section>

<div class="row">
    <div class="col-lg-12">   
        <form  role="form"  method="post" id="frmkhedit" >  
            <div class="box box-warning">            
                <div class="box-header with-border">           
                    <span>nhập đầy đủ các trường của thông tin khách hàng</span>
                </div>
                <div class="box-body">               


                    <% if (objkh.getNhomkh().equals("CN")) {%>
                    <div class="form-group">
                        <label>Nhóm KH: CÁ NHÂN </label>                       
                    </div>

                    <div id="KHCN">
                        <div class="col-lg-8">
                            <label>Tên khách hàng<span class="text-red" >(*)</span> : </label>
                            <input type="text" name="tenkh" class="form-control" value="<%=objkh.getTenkh()%>" required="" />                                
                        </div>  
                        <div class="col-lg-4">
                            <label>Giới tính: </label>
                            <select name= "gioitinh" class="form-control" >
                                <option value="<%=objkh.getGioitinh()%>" ><%=objkh.getGioitinh()%></option>
                                <option value="Ông">Ông</option>
                                <option value="Bà">Bà</option>
                            </select>
                        </div> 
                        <div class="col-lg-6">
                            <label>Số điện thoại: </label>
                            <input type="text" name="sodt" class="form-control" required=""value="<%=objkh.getSodt()%>" />                                
                        </div> 
                        <div class="col-lg-6">
                            <label>Email: </label>
                            <input type="text" name="email" class="form-control" required=""value="<%=objkh.getEmail()%>"/>
                        </div> 
                        <div class="col-lg-4">
                            <label>CMND Số:</label>
                            <input type="text" name="cmndso" class="form-control"  required=""value="<%=objkh.getCmnd_so()%>"/>
                        </div>                   
                        <div class="col-lg-4">
                            <label>CMND Nơi Cấp:</label>                       
                            <select name= "cmndnoicap" class="form-control">
                                <option value="<%=objkh.getCmnd_noicap()%>"><%=objkh.getCmnd_noicap()%></option>
                                <jsp:include page="../DiaChi/getProvince.jsp" />
                            </select>                                                              
                        </div>
                        <div class="col-lg-4">
                            <label>CMND ngày cấp: </label>
                            <input type="text" name="cmndngaycap" class="form-control" required="" value="<%=objkh.getCmnd_ngaycap()%>"/>                                
                        </div>  
                    </div>
                    <%} else {%>
                    <div class="form-group">
                        <label>Nhóm KH: DOANH NGHIỆP </label>                       
                    </div>
                    <div id="KHDN">
                        <div class="col-lg-2">
                            <label>Mã số thuế<span class="text-red" >(*)</span> :</label>                       
                            <input type="text" name="masothue" class="form-control"  required=""value="<%=objkh.getMasothue()%>"/>                                       

                        </div>
                        <div class="col-lg-10">
                            <label>Tên công ty<span class="text-red" >(*)</span> :</label>                       
                            <input type="text" name="tencongty" class="form-control"  required=""value="<%=objkh.getTencongty()%>"/>                                     

                        </div>                        
                        <div class="col-lg-6">
                            <label>Đại diện:</label>                       
                            <input type="text" name="daidien" class="form-control"  required=""value="<%=objkh.getDaidien()%>"/>                                     

                        </div>
                        <div class="col-lg-6">
                            <label>Chức vụ:</label>                       
                            <input type="text" name="chucvu" class="form-control"  required=""value="<%=objkh.getChucvu()%>"/>                                     

                        </div>
                    </div>
                    <%}%>

                    <div class="col-lg-4">
                        <label>Tỉnh / Thành Phố: </label>
                        <select class="form-control" name="tinhtp" required="" id="dcprovince">
                            <option value="<%=objkh.getDc_tinhtp()%>"><%=objkh.getDc_tinhtp()%></option>
                            <jsp:include page="../DiaChi/getProvince.jsp" />
                        </select>                             
                    </div> 
                    <div class="col-lg-4">
                        <label>Quận / Huyện : </label>
                        <select class="form-control" name="quanhuyen" required=""  id="dcdistrict">
                            <option value="<%=objkh.getDc_quanhuyen()%>"><%=objkh.getDc_quanhuyen()%></option>                            
                        </select>                                
                    </div> 
                    <div class="col-lg-4">
                        <label>Phường / Xã: </label>
                        <select class="form-control" name="phuongxa" required="" id="dcward" /> 
                        <option value="<%=objkh.getDc_phuongxa()%>"><%=objkh.getDc_phuongxa()%></option>
                        </select>        
                    </div> 
                    <div class="col-lg-12">
                        <label>Địa chỉ:</label>
                        <input type="text" name="diachi" class="form-control"  required=""value="<%=objkh.getDc_diachi()%>"/>
                    </div>                  


                </div>
                <div class="box-footer">
                    <div id="tbloi">

                    </div>
                    <div class="modal modal-default fade" id="capnhat">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span></button>
                                    <h4 class="modal-title">Thêm Mới</h4>
                                </div>
                                <div class="modal-body">                                    
                                    <p>Xác nhận cập nhật thông tin khách hàng ?</p>
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
                    <button type="button" class="btn bg-green-active btn-flat margin-r-5" data-toggle="modal" data-target="#capnhat" id="btnthemmoi">Cập nhật</button>
                </div>
            </div>

        </form>
    </div>    

</div>

<script type="text/javascript">

    function capnhatkh() {
        document.getElementById('tbloi').removeAttribute('h2');
        $.ajax({
            type: "POST",
            url: "khedit?capnhat",
            data: $("#frmkhedit").serialize(),
            success: function (data) {
                if (data === 'ok') {
                    document.getElementById('tbloi').innerHTML = '<h2 class="success text-success">Cập nhật thông tin khách hàng thành công !!</h2>';
                    document.getElementById('capnhat').style.display = 'none';
                    $("#btnthemmoi").remove();
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
<%}%>