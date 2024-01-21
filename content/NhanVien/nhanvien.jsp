<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="content-header">
    <h1>
        DANH SÁCH TÀI KHOẢN NHÂN VIÊN       
    </h1>     
</section>
<div class="row">
    <div class="col-xs-12">   
        <div class="box">
            <div class="box-header">
                <div class="box-header with-border">
                    <h3 class="box-title"></h3>
                    <a href="nvadd"  class="btn btn-success" >Thêm Mới Nhân Viên</a>
                </div>      
            </div>
            <div class="box-body">
                <div class="box-body table-responsive no-padding">
                    <table id="example1" class="table table-bordered table-striped">                   
                        <thead>
                            <tr>                                 
                                <th >Mã NV</th>
                                <th>Tên NV</th>
                                <th >Email</th>
                                <th >Điện Thoại</th>
                                <th >Tên Đăng Nhập</th>
                                <th>Quyền</th>
                                <th>Tình Trạng</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>  
                        </tbody>

                    </table>
                </div>

                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</div> 

<script>
    $(document).ready(function () {

        var table = $('#example1').dataTable({
            'processing': false,
            'searching': false,
            'ordering': false,

            'ajax': {
                "url": "nhanvien?getlist",
                "dataSrc": "nhanvien",
                "type": "post"
            },
            'columns': [
                {"data": "manv"},
                {"data": "tennv"},
                {"data": "email"},
                {"data": "sodt"},
                {"data": "tendn"},
                {"data": "quyen", fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                        var str = '';
                        switch (oData.quyen) {
                            case 1:
                                str = '<span class="badge">AD</span>';
                                break;
                            case 2:
                                str = '<span class="badge">manager</span>';
                                break;
                            case 3:
                                str = '<span class="badge">user</span>';
                                break;
                            case 4:
                                str = '<span class="badge">support</span>';
                                break;
                            case 5:
                                str = '<span class="badge">deliver</span>';
                                break;
                        }
                        $(nTd).html(str);
                    }
                },
                {"data": "tinhtrang", fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                        var str = '';

                        if (oData.tinhtrang != 0) {
                            str = '<span class="badge bg-black">đã khóa</span>';
                        }

                        $(nTd).html(str);
                    }
                },
                {"data": "idnv", fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                        var str = '';
                        str += '<a type="submit" class="btn btn-primary" href="nhanvien?id=' + oData.idnv + '">Chi tiết</a>';
                        $(nTd).html(str);
                    }}

            ]
        });
    });
</script>
