<%@page import="NhanVien.objNhanVien"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    objNhanVien avl_login = null;
    String ti = "";
    if (session.getAttribute("avl_login") != null) {
        avl_login = (objNhanVien) session.getAttribute("avl_login");
        session.removeAttribute("backhscn");
%>

<div class="row">
    <div class="col-md-4 col-sm-12 col-xs-12">
        <div class="small-box bg-green">
            <div class="inner">
                <h3 id="demtonghs">0</h3>
                <p>Tổng Hồ Sơ</p>
            </div>
            <div class="icon">
                <i class="ion ion-stats-bars"></i>
            </div>          
        </div>
    </div>
    <div class="col-md-4 col-sm-12 col-xs-12">
        <div class="small-box bg-red">
            <div class="inner">
                <h3 id="demhsdangthuchien">0</h3>

                <p>Đang Thực Hiện</p>
            </div>           
            <div class="icon">
                <i class="ion ion-pie-graph"></i>
            </div>            
        </div>
    </div>
    <div class="col-md-4 col-sm-12 col-xs-12">
        <div class="small-box bg-yellow">
            <div class="inner">
                <h3 id="demhshoanthanh">0</h3>
                <p>Hoàn Thành</p>
            </div>
            <div class="icon">
                <i class="fa fa-thumbs-o-up"></i>
            </div>            
        </div>
    </div>  
</div>
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
                    <h3 class="box-title"></h3>                    
                    <%    if (DATA.phanquyen.check_permission(avl_login.getQuyen(), DATA.phanquyen._Per_ThemMoiHS)) { %>
                    <a href="hsadd"  class="btn btn-success" >Thêm Mới Hồ Sơ</a>
                    <%}%>
                    <a href="chungthu"  class="btn btn-microsoft" >Xem Chứng Thư</a>
                </div>      
            </div>
            <div class="box-body ">
                <div class="box-body table-responsive no-padding">
                    <table id="example1" class="table table-bordered table-striped">                   
                        <thead>
                            <tr>                                 
                                <th>Mã HS</th>
                                <th>Số CT</th>
                                <th>DT - CB</th>
                                <th>Ngày Lập HS</th>
                                <th>NV Thực Hiện</th>
                                <th>Giá Sơ Bộ</th>
                                <th>Giá Thẩm Định</th>
                                <th>Giai Đoạn</th>                                
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

<div class="modal modal-default fade" id="molEditgsb">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">cập nhật giá sơ bộ 

            </div>
            <div class="modal-body">      
                <form  role="form"  method="post" id="frmgiasoboa" > 
                    <input type="hidden" id="idhs" name="mahs" value="" />
                    <input type="text" id="giasobo" class="form-control"  name="giasobo" value="" maxlength="400" style="font-size: 18px;" /></h4>
                </form>
                <div id="tbloi"></div>
            </div>
            <div class="modal-footer">                                   
                <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>   
                <button type="button" class="btn bg-red-gradient pull-right" onclick="capnhatgiasobo();">Cập nhật</button>   
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>        
<%}%>
<script type="text/javascript">
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
                {"width": "5%", "targets": 0},
                {"width": "5%", "targets": 1},
                {"width": "15%", "targets": 2},
                {"width": "7%", "targets": 3},
                {"width": "8%", "targets": 4},
                {"width": "15%", "targets": 5},
                {"width": "5%", "targets": 6},
                {"width": "5%", "targets": 7},
                {"width": "5%", "targets": 8}
            ],
            'order': [[0, "desc"]],
            'ajax': {
                "url": "hoso?getlist",
                "dataSrc": "hoso",
                "type": "post"
            },
            'columns': [
                {"data": "mahs"},
                {"data": "soct"},
                {"data": "doitac", fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                        var str = '';
                        str += oData.doitac + ' - ' + oData.cbthuchien;
                        $(nTd).html(str);
                    }},
                {"data": "ngaylaphs", render: function (data, type, row) {
                        return (moment(data).format("DD/MM/YYYY"));
                    }},
                {"data": "nvthuchien"},

                {"data": "giasobo", fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                        var gia = oData.giasobo;
    <% if (avl_login.getQuyen() == DATA.phanquyen._nhom_per_admin || avl_login.getQuyen() == DATA.phanquyen._nhom_per_manager || avl_login.getChinhanh().equals("NAN")) { %>
                        $(nTd).html(gia + '<span class="badge bg-gray" onclick="editgiasobo(' + oData.idhs + ',\'' + gia + '\');">edit</span>');
    <%} else {%>
                        $(nTd).html(gia);
    <%}%>
                    }},
                {"data": "giatd", render: function (data, type, row) {
                        return formatCurrency(data + '');
                    }},
                {"data": "trangthaihs", fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                        var str = '';
                        switch (oData.tinhtrang) {
                            case 1:
                                str = '<span class="badge bg-gray">KHỞI TẠO</span>';
                                break;
                            case 2:
                                str = '<span class="badge bg-red">ĐANG</span><span class="badge bg-blue">KHẢO SÁT</span>';
                                break;
                            case 3:
                                str = '<span class="badge bg-blue">ĐÃ KHẢO SÁT</span>';
                                break;
                            case 4:
                                str = '<span class="badge bg-red">ĐANG </span><span class="badge bg-green">BÁO GIÁ</span>';
                                break;
                            case 5:
                                str = '<span class="badge bg-green">ĐÃ BÁO GIÁ</span>';
                                break;
                            case 7:
                                str = '<span class="badge bg-yellow">CHỨNG THƯ</span>';
                                break;
                            case 9:
                                str = '<span class="badge bg-purple">HOÀN THÀNH</span>';
                                break;
                            case 10:
                                str = '<span class="badge bg-black">ĐÃ HỦY</span>';
                                break;
                            default:
                                str = '';
                                break;
                        }
                        if (oData.in_idnv > 0)
                        {
                            str += '<i class=\"fa fa-fw fa-print\"></i>';
                        }
                        if (oData.tinhtrang>2 && oData.tinhtrang <10 && oData.sohats <2)
                        {
                            str += '<span class="badge bg-red"><i class=\"fa fa-fw fa-image\"></i></span>';
                        }
                        $(nTd).html(str);
                    }},
                {"data": "idhs", fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                        $(nTd).html('<a type="submit" class="pull-right btn btn-primary" href="hoso?id=' + oData.idhs + '">Chi tiết</a>');
                    }}
            ]
        });



    });


    $(document).ready(function () {
        setTimeout(counthstong, 1000);
    });
    function counthstong() {
        $.ajax({
            url: 'tkhs',
            type: 'post',
            dataType: "json",
            success: function (data) {
                var items = [];
                //console.log(data);
                //Misplaced variable here: data instead of response
                $.each(data.demhoso, function (i, item) {
                    document.getElementById("demtonghs").innerHTML = item.tonghs;
                    document.getElementById("demhsdangthuchien").innerHTML = item.dangthuchien;
                    document.getElementById("demhshoanthanh").innerHTML = item.hoanthanh;
                });
            },
            complete: function (data) {
                setTimeout(counthstong, 5000);
            }
        });
    }
    function editgiasobo(a, b) {
        document.getElementById("idhs").value = a;
        document.getElementById("giasobo").value = b;
        document.getElementById('tbloi').innerHTML = '';
        $("#molEditgsb").modal('show');
    }
    var row_index = 0;
    $('#example1').on('click', 'td', function () {
        var table1 = $(this).closest('table').DataTable();
        row_index = table1.cell(this).index().row;
        //console.log(row_index);
    });

    function capnhatgiasobo() {
        var idhs = document.getElementById("idhs").value;
        var gsb = document.getElementById("giasobo").value;
        //console.log(idhs + '  ' + gsb);
        $.ajax({
            url: 'tsedit?upgiasobo',
            type: 'post',
            data: $("#frmgiasoboa").serialize(),
            success: function (data) {
                if (data === 'ok') {
                    document.getElementById('tbloi').innerHTML = '<h2 class="success text-success">cập nhật thông tin thành công !!</h2>';
                    var table = $('#example1').DataTable();
                    table.cell(row_index, 5).data(gsb + '<span class="badge bg-gray" onclick="editgiasobo(' + idhs + ',\'' + gsb + '\');">edit</span>');
                    $("#molEditgsb").modal('hide');

                } else {
                    document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>' + data + '</em></h2>';
                }
            },
            error: function () {
                document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>Lỗi hệ thống</em></h2>';
            }
        });
    }
</script>
