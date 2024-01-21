<%@page import="DoiTacNH.objDoiTacNH"%>
<%
  objDoiTacNH avl_login = (objDoiTacNH) session.getAttribute("avl_dangnhap");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="content-wrapper" style="height: auto;">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h1>HỒ SƠ KHẢO SÁT</h1>
                </div>          
            </div>
            <button  href="#" id="btnchangeavata" class="btn btn-flat bg-green" data-toggle="modal"  data-backdrop="static" data-keyboard="false" data-target="#themhssobo_modal" >
                <span >Thêm khảo sát</span>
            </button>
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
                                        <th>#</th>
                                        <th>Ngày gửi</th>                                    
                                        <th>Ngày nhận</th>  
                                        <th>Cán bộ nhận</th>
                                        <th>Tình trạng</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody> 
                                </tbody>
                                <tfoot>
                                    <tr>                                 
                                        <th>#</th>
                                        <th>Ngày gửi</th>                                    
                                        <th>Ngày nhận</th>  
                                        <th>Cán bộ nhận</th>
                                        <th>Tình trạng</th>
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
<div class="modal fade" id="themhssobo_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">               
                <h4 class="modal-title" id="myModalLabel">THÊM HỒ SƠ KHẢO SÁT</h4>
            </div>
            <!--/.modal-header-->

            <div class="modal-body">
                <form method="post" id="changeFormSubmit" action="themhsks" enctype="multipart/form-data">                      
                    <div class="form-group">
                        <label >Ghi chú:</label>
                        <textarea class="form-control" name="ghichu" id="aaaghichu" maxlength="800"></textarea>
                        <label >Người liên hệ:</label>
                        <textarea class="form-control" name="nguoilienhe" id="aaaghichu" maxlength="150"></textarea>
                        <label >Số điện thoại:</label>
                        <textarea class="form-control" name="sodienthoai" id="aaaghichu" maxlength="150"></textarea>

                        <div class="form-group">
                            <label>Chọn file upload (<span class="text-red">Tối da 50MB 1 file và 1 lần upload tối đa 10 file.</span>):</label>
                        </div>
                        <div class="col-lg-12 col-md-12">                       
                            <input type="file" name="file" size="10" multiple="true" max="10" class="form-control" id="fileupload" accept="*" />  
                        </div>        
                        <div class="col-lg-12 col-md-12">
                            <div >
                                <table id="showfilename" class=" table table-hover table-striped">
                                </table>
                            </div>  
                        </div> 
                    </div>
            </div>
            <div class="modal-footer">          
                <label for="success"></label>
                <input type="submit" name="submit" class="btn bg-green  pull-right" id="submitFormsobo" value="Xác Nhận"/>

                <button type="button" class="btn bg-navy  pull-left" id="btnClose3W" data-dismiss="modal">Đóng</button>

            </div>
            </form>
        </div>

    </div>
</div>

<div class="modal fade" id="chitiethssobo_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">               
                <h4 class="modal-title" id="myModalLabel">CHI TIẾT KHẢO SÁT <span id="mahsdt" class="badge bg-navy"></span></h4>
            </div>
            <!--/.modal-header-->

            <div class="modal-body">

                <div class="form-group">
                    <label>Tình Trạng : </label>
                    <span id="tinhtranghs"></span>
                </div>
                <div class="form-group">
                    <label>Ngày gửi:</label>
                    <input type="text" name="ngaygui"  id="ngaygui"  class="form-control"  disabled="" />  
                </div>
                <div class="form-group">
                    <label>Ngày nhận:</label>
                    <input type="text" name="ngaynhan"  id="ngaynhan"class="form-control" disabled="" /> 
                </div>
                <div class="form-group">
                    <label>Cán bộ nhận:</label>
                    <input type="text" name="cbnhan"  id="cbnhan" class="form-control" disabled="" /> 
                </div>
                <div class="form-group">
                    <label>Ghi chú:</label>
                    <textarea class="form-control" name="ghichu" id="ghichu" disabled=""></textarea> 
                </div>
                <label >Người liên hệ:</label>
                <textarea class="form-control" name="nguoilienhe" id="nguoilienhe" maxlength="150"></textarea>
                <label >Số điện thoại:</label>
                <textarea class="form-control" name="sodienthoai" id="sodienthoai" maxlength="150"></textarea>
                <div class="form-group">
                    <table id="dsfilename" class=" table table-hover table-striped">                                   
                    </table>
                </div>
            </div>
            <div class="modal-footer">          
                <label for="success"></label>

                <a href="#" id="xnhuyhsdt" class="btn bg-red  pull-right" style="display: none;" onclick="javascript:alert('Xác nhận hủy hồ sơ khảo sát ?');">Hủy Hồ Sơ</a>

                <button type="button" class="btn bg-navy  pull-left" id="btnClose3W" data-dismiss="modal">Đóng</button>

            </div>

        </div>

    </div>
</div>


<script type="text/javascript">
    $(function () {

        var table = $('#example1').dataTable({
            "paging": true,
            "searching": true,
            "ordering": false,
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
                "url": "hosoks?getlist",
                "dataSrc": "hoso",
                "type": "post"
            },
            "columnDefs": [{
                    "targets": '_all',
                    "defaultContent": ""
                }],
            'columns': [
                {"data": "iddths", fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                        $(nTd).html(oData.iddths);
                    }},

                {"data": "ngaygui", render: function (data, type, row) {
                        return (moment(data).format("DD/MM/YYYY"));
                    }},
                {"data": "ngaynhan", fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                        var str = '';
                        if (oData.tinhtrang === 1) {
                            str = moment(oData.ngaynhan).format("DD/MM/YYYY");
                        }
                        $(nTd).html(str);
                    }},
                {"data": "tennvxn"},
                {"data": "tinhtrang", fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                        var str = '';
                        switch (oData.tinhtrang) {
                            case 0:
                                str = '<span class="badge bg-green">Chờ xác nhận</span>';
                                break;
                            case 1:
                                str = '';
                                break;
                            default:
                                str = '<span class="badge bg-black">hủy</span>';
                                break;
                        }
                        $(nTd).html(str);
                    }},
                {"data": "idhs", fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                        $(nTd).html('<span class="badge bg-blue" onclick="xemchitiet(' + oData.iddths + ')">Chi tiết</span>');
                    }}
            ]
        });




    });


</script>   
<script>
    function xemchitiet(a) {
        //console.log(a);
        document.getElementById("xnhuyhsdt").style.display = "none";
        $.ajax({
            url: 'hosoks?id=' + a,
            type: 'post',
            success: function (data) {
                //console.log(data);
                var items = [];
                $.each(data.cths, function (i, item) {
                    switch (item.tinhtrang) {
                        case 0:
                            document.getElementById('tinhtranghs').innerHTML = 'Chờ xác nhận';
                            break;
                        case 1:
                            document.getElementById('tinhtranghs').innerHTML = 'Đã nhận hồ sơ';
                            break;
                        default:
                            document.getElementById('tinhtranghs').innerHTML = 'Đã hủy';
                            break;
                    }
                    document.getElementById('ngaygui').value = moment(item.ngaygui).format("DD/MM/YYYY");
                    document.getElementById('ghichu').innerHTML = item.ghichu;
                    document.getElementById('mahsdt').innerHTML = item.iddths;
                    document.getElementById('nguoilienhe').innerHTML = item.nguoilienhe;
                    document.getElementById('sodienthoai').innerHTML = item.sodienthoai;
                    if (item.tinhtrang === 1) {
                        document.getElementById('ngaynhan').value = moment(item.ngaynhan).format("DD/MM/YYYY");
                        document.getElementById('cbnhan').value = item.tennvxn;
                    } else if (item.tinhtrang === 0) {
                        document.getElementById("xnhuyhsdt").style.display = "block";
                        document.getElementById("xnhuyhsdt").href = "hosoks?huyhs=" + item.iddths;
                    }
                    const myArray = item.dsfile.split(";");
                    if (myArray.length > 0) {
                        var files = '<tr><th>File đã gửi</th></tr>';
                        for (var i = 0; i < myArray.length; i++) {
                            if (myArray[i].trim().length > 0) {
                                files += "<tr> <td><a target=\"_blank\" href=\"data/DATADT/<%=avl_login.getDbname()%>/" + item.iddths + "/" + myArray[i] + "\" >" + myArray[i] + "</a></td> </tr>";
                            }
                        }
                        document.getElementById('dsfilename').innerHTML = files;
                    }

                });
                $("#chitiethssobo_modal").modal('show');
            },
            error: function () {

            }
        });
    }
    function bytesToSize(x) {
        units = ['bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
        let l = 0, n = parseInt(x, 10) || 0;
        while (n >= 1024 && ++l) {
            n = n / 1024;
        }
        return(n.toFixed(n < 10 && l > 0 ? 1 : 0) + ' ' + units[l]);
    }
    $('#fileupload').on('change', function () {
        document.getElementById('showfilename').innerHTML = "";
        var files = '';
        var tong_byte = 0;
        for (var i = 0; i < $(this)[0].files.length; i++) {
            tong_byte += $(this)[0].files[i].size;
            files += "<tr> <td><a href=\"#\" >" + $(this)[0].files[i].name + "</a></td> <td><a href=\"#\" >" + bytesToSize($(this)[0].files[i].size) + "</a></td> </tr>";
        }
        files += "<tr class=\"text-red\"> <td >Tổng dung lượng file:</td> <td>" + bytesToSize(tong_byte) + "</td> </tr>";


        console.log(tong_byte + ' ' + $(this)[0].files.length)
        if ((tong_byte / (1024 * 1024)) > 50 || $(this)[0].files.length > 10)
        {
            document.getElementById('submitFormsobo').style.display = "none";
            alert('Tổng dung lượng file vượt quá hạn mức cho phép 50MB hoặc Nhiều hơn 10 file. Vui lòng thử lại.');
        } else {
            document.getElementById('showfilename').innerHTML = files;
            document.getElementById('submitFormsobo').style.display = "block";
        }

    });
</script>