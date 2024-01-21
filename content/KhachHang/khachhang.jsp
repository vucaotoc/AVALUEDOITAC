<%@page import="NhanVien.objNhanVien"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    if (session.getAttribute("avl_login") != null) {
        objNhanVien avl_login = (objNhanVien) session.getAttribute("avl_login");

%>
<section class="content-header">
    <h1>
        DANH SÁCH KHÁCH HÀNG     
    </h1>     
</section>
<div class="row">
    <div class="col-xs-12">   
        <div class="box">
            <div class="box-header">
                <div class="box-header with-border">
                    <h3 class="box-title"></h3>
                    <%    if (DATA.phanquyen.check_permission(avl_login.getQuyen(), DATA.phanquyen._Per_ThemMoiKH)) { %>
                    <a href="khadd"  class="btn btn-success" >Thêm Mới Khách Hàng</a>
                    <%}%>
                </div>      
            </div>
            <div class="box-body">
                <div class="box-body table-responsive no-padding">
                    <table id="example1" class="table table-bordered table-striped">                   
                        <thead>
                            <tr>        
                                <th></th>
                                <th>Mã KH</th>
                                <th>Nhóm KH</th>
                                <th>Tên KH</th>
                                <th>Tên Công Ty</th>
                                <th>Tỉnh/TP</th>
                                <th>Quận/Huyện</th>
                                <th>Phường/Xã</th>
                                <th>Địa Chỉ</th>
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
<%}%>
<script>
    $(document).ready(function () {
        $('#example1 thead tr').clone(true).appendTo('#example1 thead');
        $('#example1 thead tr:eq(1) th').each(function (i) {
            if (i >= 0) {
                $(this).html('<input type="text" style="width:100%;" />');
            }
            $('input', this).on('keyup change', function () {
                if (table.api().column(i).search() !== this.value) {
                    table.api().column(i).search(this.value, true, false).draw();
                }
            });
        });
        var table = $('#example1').dataTable({
            'processing': false,
            'searching': true,
            'ordering': false,
             'aLengthMenu': [[100,,200,300,-1],[100,200,300,'All']],
            'ajax': {
                "url": "khachhang?getlist",
                "dataSrc": "khachhang",
                "type": "post"
            },
             "columnDefs": [{              
                "defaultContent": ""
            }],
            'columns': [
                {"data": "idkh", fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                        var str = '';
    <% if (session.getAttribute("hsadd") != null) {%>
                        str += '<a type="submit" class="btn btn-success" href="hsadd?addkh=' + oData.idkh + '">ADD HS</a>';
    <%}
                if (session.getAttribute("addkh") != null) {%>
                        str += '<a type="submit" class="btn btn-primary" href="addkh?addkh=' + oData.idkh + '">ADD HS</a>';
    <% }%>
                        $(nTd).html(str);
                    }},
                {"data": "makh"},
                {"data": "nhomkh"},
                {"data": "tenkh"},
                {"data": "tencongty"},
                {"data": "dc_tinhtp","defaultContent": ""},
                {"data": "dc_quanhuyen","defaultContent": ""},
                {"data": "dc_phuongxa","defaultContent": ""},
                {"data": "dc_diachi","defaultContent": ""},
                {"data": "idkh", fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                        var str = '';
                        str += '<a type="submit" class="btn btn-primary" href="khachhang?id=' + oData.idkh + '">Chi tiết</a>';
                        $(nTd).html(str);
                    }}
            ]
        });
    });
</script>
