<%@page import="NhanVien.objNhanVien"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    objNhanVien avl_login = null;
    String ti = "";
    if (session.getAttribute("avl_login") != null) {
        avl_login = (objNhanVien) session.getAttribute("avl_login");
        session.setAttribute("backhscn", "yes");
%>

<div class="row">
    <div class="col-md-3 col-sm-12 col-xs-12">
        <div class="small-box bg-green">
            <div class="inner">
                <h3 id="demhsdangkhaosat">0</h3>
                <p>Đang Khảo Sát</p>
            </div>
            <div class="icon">
                <i class="fa fa-camera"></i>
            </div>          
        </div>
    </div>
    <div class="col-md-3 col-sm-12 col-xs-12">
        <div class="small-box bg-red">
            <div class="inner">
                <h3 id="demhsdangbaogia">0</h3>

                <p>Đang Báo Giá</p>
            </div>           
            <div class="icon">
                <i class="fa fa-edit"></i>
            </div>            
        </div>
    </div>
    <div class="col-md-3 col-sm-12 col-xs-12">
        <div class="small-box bg-blue">
            <div class="inner">
                <h3 id="demhsdabaogia">0</h3>
                <p>Đã Báo Giá</p>
            </div>
            <div class="icon">
                <i class="fa fa-check-square-o"></i>
            </div>            
        </div>
    </div>  
    <div class="col-md-3 col-sm-12 col-xs-12">
        <div class="small-box bg-yellow">
            <div class="inner">
                <h3 id="demhschungthu">0</h3>
                <p>Chứng Thư</p>
            </div>
            <div class="icon">
                <i class="fa fa-envelope-o"></i>
            </div>            
        </div>
    </div>  
</div>

<section class="content-header">
    <h1>
        DANH SÁCH HỒ SƠ CÁ NHÂN  
    </h1>     
</section>
<div class="row">
    <div class="col-xs-12">   
        <div class="box">
            <div class="box-header">
                <div class="box-header with-border">                    
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
            'order': [[0, "desc"]],
            'ajax': {
                "url": "hosocn?getlist",
                "dataSrc": "hosocn",
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
                {"data": "giasobo"},

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
                        if(oData.in_idnv>0)
                        {
                            str+='<i class=\"fa fa-fw fa-print\"></i>';
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
            url: 'tkhscn',
            type: 'post',
            dataType: "json",
            success: function (data) {
                var items = [];
                //console.log(data);
                //Misplaced variable here: data instead of response
                $.each(data.demhosocn, function (i, item) {
                    document.getElementById("demhsdangkhaosat").innerHTML = item.dangkhaosat;
                    document.getElementById("demhsdangbaogia").innerHTML = item.dangbaogia;
                    document.getElementById("demhsdabaogia").innerHTML = item.dabaogia;
                    document.getElementById("demhschungthu").innerHTML = item.chungthu;
                });
            },
            complete: function (data) {
                setTimeout(counthstong, 5000);
            }
        });
    }

</script>
