<%@page import="NhanVien.objNhanVien"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    objNhanVien avl_login = null;
    String ti = "";
    if (session.getAttribute("avl_login") != null) {
        avl_login = (objNhanVien) session.getAttribute("avl_login");

%>
<section class="content-header">
    <h1>
        DANH SÁCH HỒ SƠ   
    </h1>     
</section>
<div class="row">
    <div class="col-xs-12">   
        <div class="box">
            <div class="box-header">
                <div class="box-header with-border">
                    <div class="col-lg-3">              
                        <form  role="form"  method="post" id="frmgetdata" > 
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" name="ngayxem" class="form-control pull-right" id="reservation">
                            </div>
                        </form>
                    </div>             
                    <div class="col-lg-2">
                        <button type="button" class="btn btn-microsoft" data-toggle="modal" data-target="#capnhat" onclick="getdata();" id="btnthemmoi">Xem Chứng Thư</button>  
                    </div>
                    <div class="col-lg-2">
                        <a href="chungthu?export" class="btn btn-github" id="btnexport" style="display: none;">Xuất Excel</a> 
                    </div>
                </div>      
            </div>
            <div class="box-body ">
                <div class="box-body table-responsive no-padding">
                    <table id="example1" class="table table-bordered table-striped">                   
                        <thead>
                            <tr>                                 
                                <th>Mã HS</th>
                                <th>Số CT</th>                                
                                <th>Ngày Phát Hành</th>
                                <th>Tên Khách Hàng</th>                               
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
    $('#reservation').daterangepicker({
        showDropdowns: true,
        autoUpdateInput: true,
        applyClass: 'btn-sm btn-primary',
        cancelClass: 'btn-sm btn-default',
        locale: {
            format: 'DD/MM/YYYY',
            applyLabel: 'Đồng Ý',
            cancelLabel: 'Đóng',
            fromLabel: 'Desde',
            toLabel: 'Hasta',
            customRangeLabel: 'Seleccionar rango',
            daysOfWeek: ['CN', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7'],
            monthNames: ['Tháng 1', 'Tháng 12', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6',
                'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11',
                'Tháng 12'],
            firstDay: 1
        }, function (start, end, label) {
            startDate = start.format('YYYY-MM-DD');
            endDate = end.format('YYYY-MM-DD');
        }
    });
    var startDate;
    var endDate;
    $(function () {
        $('#reservation').daterangepicker({
            autoApply: false,
            opens: 'left',
            startDate: moment().subtract(30, 'days'),
            endDate: moment(),
            showDropdowns: true,
            autoUpdateInput: true,
            applyClass: 'btn-sm btn-primary',
            cancelClass: 'btn-sm btn-default',
            locale: {
                format: 'DD/MM/YYYY',
                applyLabel: 'Đồng Ý',
                cancelLabel: 'Đóng',
                fromLabel: 'Desde',
                toLabel: 'Hasta',
                customRangeLabel: 'Seleccionar rango',
                daysOfWeek: ['CN', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7'],
                monthNames: ['Tháng 1', 'Tháng 12', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6',
                    'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11',
                    'Tháng 12'],
                firstDay: 1
            }
        }, function (start, end, label) {
            startDate = start.format('YYYY-MM-DD');
            endDate = end.format('YYYY-MM-DD');
        });
    });
    function getdata() {
        $("#example1").dataTable().fnDestroy();
        if (startDate && endDate) {

            var table = $('#example1').dataTable({
                'processing': true,
                'searching': true,
                'ordering': false,
                'ajax': {
                    "url": "chungthu?getlist",
                    "data": {day: startDate, to: endDate},
                    "dataSrc": "chungthu",
                    "type": "post"
                },
                'columns': [
                    {"data": "mahs"},
                    {"data": "soct"},
                    {"data": "ngayphathanh", render: function (data, type, row) {
                            return (moment(data).format("DD/MM/YYYY"));
                        }},
                    {"data": "cnpgd"}
                ]
            });
            document.getElementById("btnexport").style.display = "block";
        }
    }
</script>

<%}%>