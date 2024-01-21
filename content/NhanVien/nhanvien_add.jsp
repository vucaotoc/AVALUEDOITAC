<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="content-header">
    <h1>
        <small>THÊM MỚI TÀI KHOẢN NHÂN VIÊN </small>
        <a href="nhanvien"  class="btn btn-warning" >Quay về</a>
    </h1>           
</section>

<div class="row">


    <div class="col-md-12">   
        <div class="box box-warning">
            <div class="box-header with-border">           
                <span>Thêm đầy đủ các trường của nhân viên</span>
            </div>
            <div class="box-body">
                <form  role="form"  method="post" id="frmnvadd" >  
                    <div class="form-group">
                        <label>Tên Nhân Viên: </label>
                        <input type="text" name="tennv" class="form-control" required="" />                                
                    </div>  
                    <div class="form-group">
                        <label>Tên Đang Nhập: </label>
                        <input type="text" name="tendn" class="form-control" required="" />                                
                    </div> 
                    <div class="form-group">
                        <label>Mật Khẩu: </label>
                        <input type="text" id="mk" name="mk" class="form-control" required="" />                                
                    </div> 
                    <div class="form-group">
                        <label>Email: </label>
                        <input type="text" name="email" class="form-control" required=""/>
                    </div> 
                    <div class="form-group">
                        <label>Điện thoại: </label>
                        <input type="text" name="sodt" class="form-control"  required=""/>
                    </div>                   
                    <div class="form-group">
                        <label>Quyền: </label>                       
                        <select class="form-control" name="quyen" id="quyen">
                            <option value="2"  selected="">Nhân Viên</option>     
                            <option value="3"  selected="">Quản Lý</option>
                            <option value="4"  selected="">Hỗ Trợ</option>
                            <option value="5"  selected="">Giao Nhận</option>
                        </select>                                                                
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
                                <p>Xác nhận thêm mới thông tin nhân viên ?</p>
                            </div>
                            <div class="modal-footer">                                   
                                <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                                <button type="button" class="btn bg-green pull-right" onclick="themmoinv()">Thêm Mới</button>
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
    $('document').ready(function () {
        var mk = taomatkhau(6);
        document.getElementById("mk").value = mk;

    });

    function themmoinv() {
        document.getElementById('tbloi').removeAttribute('h2');
        $.ajax({
            type: "POST",
            url: "nvadd?themmoinv",
            data: $("#frmnvadd").serialize(),
            success: function (data) {

                if (data === 'ok') {
                    document.getElementById('tbloi').innerHTML = '<h2 class="success text-success">Thêm mới thông tin nhân viên thành công !!</h2>';
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

        $("#themmoi").modal('hide');
    }
</script>