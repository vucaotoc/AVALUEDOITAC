<%@page import="NhanVien.objNhanVien"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    if (session.getAttribute("avl_login") != null) {
        objNhanVien avl_login = (objNhanVien) session.getAttribute("avl_login");

%>
<section class="content-header">
    <h1>
        DANH SÁCH TÀI SẢN   
    </h1>     
</section>
<div class="row">
    <div class="col-xs-12">   
        <div class="box">
            <div class="box-header">
                <div class="box-header with-border">
                    <h3 class="box-title"></h3>
                    <%    if (DATA.phanquyen.check_permission(avl_login.getQuyen(), DATA.phanquyen._Per_ThemMoiTS)) { %>
                    <a href="tsadd"  class="btn btn-success" >Thêm Mới Tài Sản</a>
                    <%}%>
                </div>      
            </div>
            <div class="box-body">
                <div class="box-body table-responsive no-padding">
                    <table id="example1" class="table table-bordered table-striped">                   
                        <thead>
                            <tr>      
                                <th></th>
                                <th>Mã HS</th> 
                                <th>Ngày Lập HS</th> 
                                <th>Loại TS</th>
                                <th>NV Tạo</th> 
                                <th>Thông Tin</th>
                                <th>Giá Sơ Bộ</th>
                                <th>Giá TĐ</th>
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
            'ordering': true,
            'aLengthMenu': [[100, , 200, 300, -1], [100, 200, 300, 'All']],
            "autoWidth": false,
            "fixedHeader": {
                "header": false,
                "footer": false
            },
            "scrollY": "1000px",
            "scrollX": true,
            "columnDefs": [
                {"width": "10%", "targets": 0},
                {"width": "10%", "targets": 1},
                {"width": "15%", "targets": 2},
                {"width": "15%", "targets": 3},
                {"width": "10%", "targets": 4},
                {"width": "10%", "targets": 5},
                {"width": "5%", "targets": 6},
                {"width": "10%", "targets": 7},
                {"width": "10%", "targets": 8}
            ],
            'order': [[0, "desc"]],      
            'ajax': {
                "url": "taisan?getlist",
                "dataSrc": "taisan",
                "type": "post"
            },
            'columns': [
                {"data": "idts", fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                        var str = oData.idts;
                        if (oData.idhs === 0) {
                        <% if (session.getAttribute("hsadd") != null) {%>
                            str = '<a type="submit" class="btn btn-success" href="hsadd?addts=' + oData.idts + '">ADD HS</a>';
                        <%}%>
                        }
                        $(nTd).html(str);
                    }},
                {"data": "mahs", fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                        var str = '';
                        str += '<a href="hoso?id=' + oData.idhs + '">' + oData.mahs + '</a>';
                        $(nTd).html(str);
                    }},
                {"data": "ngaylaphs", fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                        var str = '';
                        if (oData.idhs > 0) {
                            str = moment(oData.ngaylaphs).format("DD/MM/YYYY");
                        }
                        $(nTd).html(str);
                    }},
                {"data": "loaits"},
                {"data": "tennvtao"},
                {"data": "thongtints"},
                {"data": "notegia"},
                {"data": "giatd", render: function (data, type, row) {
                        return formatCurrency(data + '');
                    }},
                {"data": "idts", fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                        var str = '';
                        str += '<a type="submit" class="btn btn-primary" href="taisan?id=' + oData.idts + '">Chi tiết</a>';
                        $(nTd).html(str);
                    }}

            ]
        });
    });
</script>
