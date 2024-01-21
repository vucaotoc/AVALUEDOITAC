
<%@page import="DoiTacNH.objDoiTacNH"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    objDoiTacNH avl_login = null;
    String ti = "";
    if (session.getAttribute("avl_dangnhap") != null) {
        avl_login = (objDoiTacNH) session.getAttribute("avl_dangnhap");
%>
<div class="content-wrapper" style="height: auto;">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h1>DANH SÁCH HỒ SƠ</h1>
                </div>          
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">   
                    <div class="card">                   
                        <div class="card-body table-responsive no-padding">
                            <table id="example1" class="table table-bordered table-striped">                   
                                <thead>
                                    <tr>                                 
                                        <th>Mã HS</th>
                                        <th>Số CT</th>                                    
                                        <th>Ngày Lập HS</th>  
                                        <th>Địa chỉ tài sản</th>
                                        <th>Khách liên hệ</th>
                                        <th>Cán bộ</th>
                                        <th>CRC</th>
                                        <th>Giá Thẩm Định</th>
                                        <th>Giai Đoạn</th>                                
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody> 
                                </tbody>
                                <tfoot>
                                    <tr>                                 
                                        <th>Mã HS</th>
                                        <th>Số CT</th>                                    
                                        <th>Ngày Lập HS</th>  
                                        <th>Địa chỉ tài sản</th>
                                          <th>Khách liên hệ</th>
                                        <th>Cán bộ</th>
                                         <th>CRC</th>
                                        <th>Giá Thẩm Định</th>
                                        <th>Giai Đoạn</th>                                
                                        <th></th>
                                    </tr>
                                </tfoot>
                            </table>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div> 
        </div>                        
    </section>
</div>          



<script type="text/javascript">
    $(function () {

        var table = $('#example1').dataTable({
            "paging": true,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            'aLengthMenu': [[50, 200, 300, -1], [50, 200, 300, 'All']],
            "fixedHeader": {
                "header": false,
                "footer": false
            },
            "scrollY": "1000px",
            "scrollX": true,
            'order': [[0, "desc"]],
            'ajax': {
                "url": "hoso?getlist",
                "dataSrc": "hoso",
                "type": "post"
            },
            'columns': [
                {"data": "mahs", fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                        $(nTd).html('<a type="submit" href="hoso?id=' + oData.idhs + '">' + oData.mahs + '</a>');
                    }},
                {"data": "soct","defaultContent": ""},
                {"data": "ngaylaphs", render: function (data, type, row) {
                        return (moment(data).format("DD/MM/YYYY"));
                    }},
                {"data": "fulldiachi","defaultContent": ""},
                {"data": "nguoilienheks","defaultContent": ""},
                {"data": "cbthuchien", fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                        var gia = oData.cbthuchien;
                        $(nTd).html(gia);
                    }},
                {"data": "cbcrc","defaultContent": ""},
                {"data": "giatd", render: function (data, type, row) {
                        return formatCurrency(data + '');
                    }},
                {"data": "trangthaihs", fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                        var str = oData.trangthaihs;                         
                        $(nTd).html(str);
                    }},
                {"data": "idhs", fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                        $(nTd).html('<a type="submit" class="badge bg-blue" href="hoso?id=' + oData.idhs + '">Chi tiết</a>');
                    }}
            ]
        });



    });


</script>
<%}%>