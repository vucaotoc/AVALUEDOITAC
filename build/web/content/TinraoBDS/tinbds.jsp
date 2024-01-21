<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="content-wrapper" style="height: auto;">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h1>TIN RAO BẤT ĐỘNG SẢN</h1>
                </div>          
            </div>          
        </div><!-- /.container-fluid -->
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">   
                    <div class="card">
                         <div class="card-body table-responsive padding">
                            <table id="example1" class="table table-bordered table-striped">                     
                                <thead>
                                    <tr>     
                                        <th></th>                                
                                    </tr>
                                </thead>
                                <tbody>  
                                </tbody>
                            </table>
                            <!-- /.card -->
                        </div>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div> 
        </div>
    </section>    
</div> 
<script type="text/javascript">
    var table = null;
    $(document).ready(function () {
        table = $('#example1').DataTable({
            'processing': false,
            'searching': true,
            'ordering': false,
            'aLengthMenu': [[100, , 200, 300, -1], [100, 200, 300, 'All']],
            "autoWidth": false,
            "fixedHeader": {
                "header": false,
                "footer": false
            },
            'ajax': {
                "url": "tinraobds?getlist",
                "dataSrc": "tinraobds",
                "type": "post"
            },
            'columns': [
                {"data": "mota", fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                        var str = '';
                        var arrHA = oData.hinhanh.split(';');
                        var ttshow = '';
                        if (oData.tinhtrang === 1) {
                            ttshow = 'Tin Đã Đóng';
                        } else if (oData.tinhtrang === 2)
                        {
                            ttshow = 'Tin Đã Hủy';
                        }
                        str = '' +
                                '<div class="row">' +
                                '    <div class="col-md-4">' +
                                '        <div style="text-align:center;position: relative;"> <img style="position:relative;max-height: 250px; width: 100%;" src="data/TINBDS/' + oData.chinhanh + oData.idtin + '/' + arrHA[0] + '" alt="' + arrHA[0] + '">' +
                                '        <span class="badge bg-white" style="position: absolute;  top: 8px;  left: 16px;font-size:10px;"> ID: ' + oData.idtin + '</span>' +
                                '        <span class="badge bg-red-gradient" style="position: absolute;  bottom: 8px;  left: 16px;font-size:10px;">' + ttshow + '</span>' +
                                '        <span class="badge bg-red" style="position: absolute;  top: 8px;  right: 16px;font-size:18px;"> Giá bán: ' + formatCash(oData.giaban) + '</span>' +
                                '        <span class="badge bg-blue" style="position: absolute;  bottom: 8px;  right: 16px;font-size:18px;" > Điện tích: ' + oData.dientich + 'm2</span> </div>' +
                                '    </div>' +
                                '    <div class="col-md-8">' +
                                '        <div class="row">' +
                                '            <div class="col-md-12">' +
                                '                <div class="card card-solid">' +
                                '                    <div class="card-header with-border">' +
                                '                        <h3 class="card-title">' +
                                '                            <span class="text-info">Địa chỉ: ' + oData.diachibds + ', ' + oData.phuongxa + ', ' + oData.quanhuyen + ', ' + oData.tinhtp + '</span>' +
                                '                            <span class="badge bg-gray pull-right">Ngày đăng: ' + moment(oData.ngaydang).format("DD/MM/YYYY") + '</span>' +
                                '                        </h3>' +
                                '                    </div>' +
                                '                    <div class="card-body">' +
                                '                        <div class="text-gray">' + oData.mota.substring(0, 400) +
                                '                        </div><br/><a class="badge bg-green-gradient" href="tinraobds?idtin=' + oData.idtin + '"> ' +
                                '                           Xem Chi tiết' +
                                '                        </a>' +
                                '                    </div>' +
                                '                    <div class="card-footer">' +
                                '                    </div>' +
                                '                </div>' +
                                '            </div>' +
                                '        </div>' +
                                '    </div>' +
                                '</div>' +
                                '';
                        $(nTd).html(str);
                    }}
            ]
        });
    });
    function getTinreload() {
        $.ajax({
            "url": "tinraobds?getlist",
            "dataSrc": "tinraobds",
            "type": "post"
        }).done(function (result) {
            table.clear().draw();   // You can remove this draw() as it is a wasted call since you use it in the next line
            table.rows.add(result.tinraobds).draw();
        }).fail(function (jqXHR, textStatus, errorThrown) {
            // needs to implement if it fails
        });
    }
    ;
    function getTincuaban() {
        $.ajax({
            "url": "tinraobds?yourtin",
            "dataSrc": "tinraobds",
            "type": "post"
        }).done(function (result) {
            table.clear().draw();   // You can remove this draw() as it is a wasted call since you use it in the next line
            table.rows.add(result.tinraobds).draw();
        }).fail(function (jqXHR, textStatus, errorThrown) {
            // needs to implement if it fails
        });
    }
    ;
    function formatCash(str) {
        var so_trieu = str % 1000;
        var so_ty = (str - (str % 1000)) / 1000;
        var kq = '';
        if (so_ty > 0)
            kq += so_ty + 'tỷ';
        if (so_trieu > 0)
            kq += so_trieu + 'triệu';
        return kq;
    }
    ;
</script>