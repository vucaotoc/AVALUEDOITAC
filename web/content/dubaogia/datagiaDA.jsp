<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="content-wrapper" style="height: auto;">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">  
                <h1>XEM GIÁ DỰ ÁN</h1>
                <a href="hoso"  class="btn btn-warning" >Quay về</a>             
            </div>          
        </div>
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="row">             
                <div class="col-md-5">  
                    <div class="card card-info">
                        <div class="card-header with-border">
                            <h3 class="card-title">Nhập tên dự án </h3>
                        </div>
                        <div class="card-body"> 
                            <div class="form-group">
                                <textarea  class="form-control input-lg"  onkeyup="searchText();"  id="diachixem" placeholder="Vui lòng tên dự án muốn xem"></textarea> 
                            </div>  

                            <div class="form-group">
                                <table id="tbdubaosajax" class="table table-hover" style="cursor: pointer; display:none;width:100%;">                       
                                    <tbody></tbody>
                                </table>
                            </div>

                            <div class="form-group">
                                <button type="button" class="btn btn-block bg-gradient-primary btn-lg center-block" onclick="dubao();">Xem biểu đồ giá</button>
                            </div>
                            <label id="loi_bieudogia" class="text-red"></label>
                        </div>    
                    </div>
                </div>
                <div class="col-md-7"> 
                    <div class="card card-success">
                        <div class="card-header with-border">
                            <h3 class="card-title"><span id="title_bdg"></span></h3>
                            <div class="card-tools pull-right">
                                <button type="button" class="btn btn-card-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                </button>              
                            </div>
                        </div>
                        <div class="card-body chart-responsive">                           
                            <div class="chart" id="line-chart" style="height: 300px;"></div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>
    </section>
</div>

<script src="bower_components/raphael/raphael.min.js"></script>
<script src="bower_components/morris.js/morris.min.js"></script>

<script>
                                        var morrisLine;
                                        $(document).ready(function () {
                                            //getdubao();
                                            morrisLine = Morris.Line({
                                                element: 'line-chart',
                                                xkey: 'fulldate',
                                                ykeys: ['gia'],
                                                labels: ['Giá (triệu đồng/m2):'],
                                                hideHover: 'auto',
                                                lineColors: ['blue'],
                                                xLabelFormat: d => moment(d).format('MM-YYYY')

                                            });
                                        });

                                        function getdubao(diachi) {
                                            //console.log('data');
                                            //var diachi = document.getElementById("diachixem").value;
                                            if (diachi.length > 0) {
                                                $.ajax({
                                                    url: 'datada?getdubao=' + diachi,
                                                    type: 'post',
                                                    success: function (data) {
                                                        //console.log(typeof (data) + ' ' + data.dubao.length);
                                                        if (data.dubao.length > 0) {
                                                            var link = '';
                                                            if (data.dubao[0].lng > 0 && data.dubao[0].lon > 0) {
                                                                link = '<a href="maps?title='+data.dubao[0].fulldiachi+'&zoom=17&toado=' + data.dubao[0].lng + ',' + data.dubao[0].lon + '" target="_blank" ><span class="badge bg-blue" >Xem bản đồ</span></a>'
                                                            }
                                                            document.getElementById("title_bdg").innerHTML = data.dubao[0].fulldiachi + ' ' + link;
                                                            morrisLine.setData(data.dubao);
                                                            morrisLine.redraw();
                                                        } else {

                                                            document.getElementById("loi_bieudogia").innerHTML = 'Không tìm thấy địa chỉ';
                                                        }
                                                    }
                                                });
                                            } else {
                                                document.getElementById("loi_bieudogia").innerHTML = 'Vui lòng nhập địa chỉ';
                                            }
                                        }
                                        function searchText() {

                                            document.getElementById("tbdubaosajax").style.display = "block";
                                            document.getElementById("tbdubaosajax").innerHTML = "";
                                            if (this.timer) {
                                                window.clearTimeout(this.timer);
                                            }
                                            this.timer = window.setTimeout(function () {
                                                var search = document.getElementById("diachixem").value;
                                                if (search.length > 0) {
                                                    $('#tbdubaosajax').dataTable({
                                                        'processing': true,
                                                        'searching': true,
                                                        'ordering': true,
                                                        'retrieve': false,
                                                        'paging': true,
                                                        'serverSide': false,
                                                        'destroy': true,
                                                        "infoFiltered": "",
                                                        "info": false,
                                                        "columnDefs": [
                                                            {"width": "20%", "targets": 0},
                                                             {"width": "20%", "targets": 1},
                                                            {"width": "60%", "targets": 2}
                                                        ],
                                                        'ajax': {
                                                            "url": "datada?getdiachi=" + search,
                                                            "dataSrc": "diachi",
                                                            "type": "post"
                                                        },
                                                        'columns': [
                                                            {"data": "id", fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
                                                                    $(nTd).html('<button type="submit" class="btn btn-primary" onclick="set_timkiem_text(\'' + oData.fulldiachi + '\');">Chọn</button>');
                                                                }, "title": "#"},
                                                             {"data": "duan", "title": "Tên", "defaultContent": ""},
                                                            {"data": "fulldiachi", "title": "Địa chỉ", "defaultContent": ""}

                                                        ]
                                                    });
                                                }
                                            }, 500);

                                        }
                                        function dubao() {
                                            var str = document.getElementById("diachixem").value;
                                            getdubao(str);
                                        }
                                        function set_timkiem_text(str) {
                                            document.getElementById("diachixem").value = str;
                                            getdubao(str);
                                        }
</script>