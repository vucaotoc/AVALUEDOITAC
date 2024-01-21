<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="content-wrapper" style="height: auto;">
    <section class="content-header">
        <h1>
            CHUYỂN HỆ TỌA ĐỘ VN2000 - WGS84
        </h1> 
    </section>

    <section class="content">
        <div class="container-fluid">

            <div class="row">
                <div class="col-md-12">   
                    <div class="card">                        
                        <div class="card-body"> 
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Chọn tỉnh Thành Phố:</label>
                                        <select class="form-control" name="tinhtp" id="tinhtp">
                                            <option value="VN2000_LAI_CHAU">LAI CHAU</option>
                                            <option value="VN2000_DIEN_BIEN">DIEN BIEN</option>
                                            <option value="VN2000_SON_LA">SON LA</option>
                                            <option value="VN2000_LAO_CAI">LAO CAI</option>
                                            <option value="VN2000_YEN_BAI">YEN BAI</option>
                                            <option value="VN2000_HA_GIANG">HA GIANG</option>
                                            <option value="VN2000_TUYEN_QUANG">TUYEN QUANG</option>
                                            <option value="VN2000_PHU_THO">PHU THO</option>
                                            <option value="VN2000_VINH_PHUC">VINH PHUC</option>
                                            <option value="VN2000_CAO_BANG">CAO BANG</option>
                                            <option value="VN2000_LANG_SON">LANG SON</option>
                                            <option value="VN2000_BAC_CAN">BAC CAN</option>
                                            <option value="VN2000_THAI_NGUYEN">THAI NGUYEN</option>
                                            <option value="VN2000_BAC_GIANG">BAC GIANG</option>
                                            <option value="VN2000_BAC_NINH">BAC NINH</option>
                                            <option value="VN2000_QUANG_NINH">QUANG NINH</option>
                                            <option value="VN2000_HAI_PHONG">HAI PHONG</option>
                                            <option value="VN2000_HAI_DUONG">HAI DUONG</option>
                                            <option value="VN2000_HUNG_YEN">HUNG YEN</option>
                                            <option value="VN2000_HA_NOI">HA NOI</option>
                                            <option value="VN2000_HOA_BINH">HOA BINH</option>
                                            <option value="VN2000_HA_NAM">HA NAM</option>
                                            <option value="VN2000_NAM_DINH">NAM DINH</option>
                                            <option value="VN2000_THAI_BINH">THAI BINH</option>
                                            <option value="VN2000_NINH_BINH">NINH BINH</option>
                                            <option value="VN2000_THANH_HOA">THANH HOA</option>
                                            <option value="VN2000_NGHE_AN">NGHE AN</option>
                                            <option value="VN2000_HA_TINH">HA TINH</option>
                                            <option value="VN2000_QUANG_BINH">QUANG BINH</option>
                                            <option value="VN2000_QUANG_TRI">QUANG TRI</option>
                                            <option value="VN2000_THUA_THIEN_HUE">THUA THIEN HUE</option>
                                            <option value="VN2000_DA_NANG">DA NANG</option>
                                            <option value="VN2000_QUANG_NAM">QUANG NAM</option>
                                            <option value="VN2000_QUANG_NGAI">QUANG NGAI</option>
                                            <option value="VN2000_BINH_DINH">BINH DINH</option>
                                            <option value="VN2000_KON_TUM">KON TUM</option>
                                            <option value="VN2000_GIA_LAI">GIA LAI</option>
                                            <option value="VN2000_DAK_LAK">DAK LAK</option>
                                            <option value="VN2000_DAK_NONG">DAK NONG</option>
                                            <option value="VN2000_PHU_YEN">PHU YEN</option>
                                            <option value="VN2000_KHANH_HOA">KHANH HOA</option>
                                            <option value="VN2000_NINH_THUAN">NINH THUAN</option>
                                            <option value="VN2000_BINH_THUAN">BINH THUAN</option>
                                            <option value="VN2000_LAM_DONG">LAM DONG</option>
                                            <option value="VN2000_TP_HCM" selected="">TP HCM</option> 
                                            <option value="VN2000_BINH_DUONG">BINH DUONG</option>
                                            <option value="VN2000_BINH_PHUOC">BINH PHUOC</option>
                                            <option value="VN2000_DONG_NAI">DONG NAI</option>
                                            <option value="VN2000_BA_RIA_VUNG_TAU">BA RIA VUNG TAU</option>
                                            <option value="VN2000_TAY_NINH">TAY NINH</option>
                                            <option value="VN2000_LONG_AN">LONG AN</option>
                                            <option value="VN2000_TIEN_GIANG">TIEN GIANG</option>
                                            <option value="VN2000_BEN_TRE">BEN TRE</option>
                                            <option value="VN2000_DONG_THAP">DONG THAP</option>
                                            <option value="VN2000_VINH_LONG">VINH LONG</option>
                                            <option value="VN2000_TRA_VINH">TRA VINH</option>
                                            <option value="VN2000_AN_GIANG">AN GIANG</option>
                                            <option value="VN2000_KIEN_GIANG">KIEN GIANG</option>
                                            <option value="VN2000_CAN_THO">CAN THO</option>
                                            <option value="VN2000_HAU_GIANG">HAU GIANG</option>
                                            <option value="VN2000_SOC_TRANG">SOC TRANG</option>
                                            <option value="VN2000_BAC_LIEU">BAC LIEU</option>
                                            <option value="VN2000_CA_MAU">CA MAU</option>

                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Chọn kiểu tọa độ muốn chuyển </label>
                                        <select class="form-control" name="kieudoi" id="kieudoi" onchange="chonkieu(this);">
                                            <option value="1" selected="">VN2000 >>> WGS84</option>
                                            <option value="2">WGS84 >>> VN2000</option>                    
                                        </select>
                                    </div>                    
                                    <div class="form-group">
                                        <div class="row">                        
                                            <div class="col-md-6">                               
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <label id="lblkieuhuongdan">Nhập tọa độ VN2000(X,Y):</label>
                                                    </div>
                                                    <div class="col-md-12">                                                       
                                                            <input type="text" placeholder="Nhập X" class="form-control" id="nguondoi_X" style="font-size: 18px;" >                                                        
                                                    </div>
                                                    <div class="col-md-12">                                                       
                                                            <input type="text" placeholder="Nhập Y" class="form-control" id="nguondoi_Y"  style="font-size: 18px;" >                                                       
                                                    </div>
                                                </div>

                                            </div>               
                                            <div class="col-md-6">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <label id="lblkieuhuongdan">Kết quả:</label>
                                                    </div>
                                                    <div class="col-md-12">
                                                                                                          
                                                        <input type="text" class="form-control" id="ketquadoi_X" style="font-size: 18px;text-decoration: 700;"  >
                                                       
                                                    </div>
                                                    <div class="col-md-12">
                                                        
                                                            <input type="text" class="form-control" id="ketquadoi_Y" style="font-size: 18px;text-decoration: 700;"  >
                                                        
                                                    </div>
                                                </div>
                                            </div>                          

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <button class="btn btn-primary" onclick="doitoado();">Chuyển đổi</button> 
                                        <button class="btn bg-success" onclick="copyketqua();">Copy kết quả</button>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <iframe src="https://avalueapp.com/AVLAPP/tracuuquyhoach" width="100%" height="530px" id="mapview">

                                    </iframe>
                                </div>
                            </div>
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
        </div>
    </section>
</div>
<script src="plugins/vn2000/src/proj4.js" type="text/javascript"></script>
<script src="plugins/vn2000/src/vn2000.js" type="text/javascript"></script>
<script type="text/javascript">
                                        function copyketqua() {
                                            var copyText = document.getElementById("ketquadoi_X").value;
                                            copyText = copyText + ',' + document.getElementById("ketquadoi_Y").value;
                                            navigator.clipboard.writeText(copyText);
                                        }
                                        function chonkieu(sel)
                                        {
                                            var kieu = sel.value;
                                            if (kieu === '1') {
                                                document.getElementById("lblkieuhuongdan").innerHTML = 'Nhập tọa độ VN2000(X,Y):';
                                                document.getElementById("nguondoi_X").placeholder  = "X:";
                                                document.getElementById("nguondoi_Y").placeholder  = "Y:";
                                                document.getElementById("lblkqX").innerHTML = "Lat:";
                                                document.getElementById("lblkqY").innerHTML = "Lon:";
                                            } else if (kieu === '2') {
                                                document.getElementById("lblkieuhuongdan").innerHTML = 'Nhập tọa độ gmaps(Lat,Lon):';
                                               document.getElementById("nguondoi_X").placeholder  = "Lat:";
                                                document.getElementById("nguondoi_Y").placeholder  = "Lon:";
                                                document.getElementById("lblkqX").innerHTML = "X:";
                                                document.getElementById("lblkqY").innerHTML = "Y:";
                                            }
                                        }
                                        function doitoado() {
                                            var kieu = document.getElementById("kieudoi").value;
                                            var tinhtp = document.getElementById("tinhtp").value;
                                            var giatri_X = document.getElementById("nguondoi_X").value;
                                            var giatri_Y = document.getElementById("nguondoi_Y").value;
                                            //console.log(kieu + '  ' + nguondoi + ' ' + tinhtp);
                                            if (kieu === '1') {
                                                var vn2000 = vn2000_to_wgs84(giatri_Y, giatri_X, 0, tinhtp);
                                                document.getElementById("ketquadoi_X").value = vn2000.y;
                                                document.getElementById("ketquadoi_Y").value = vn2000.x;
                                                document.getElementById('mapview').src = 'https://avalueapp.com/AVLAPP/tracuuquyhoach?toado=' + vn2000.y + ',' + vn2000.x;
                                                document.getElementById('mapview').location.href.reload();
                                                document.getElementById('mapview').contentWindow.location.reload();
                                            } else if (kieu === '2') {
                                                var vn2000 = wgs84_to_vn2000(giatri_Y, giatri_X, 0, tinhtp);
                                                document.getElementById("ketquadoi_X").value = vn2000.y;
                                                document.getElementById("ketquadoi_Y").value = vn2000.x;
                                                document.getElementById('mapview').src = 'https://avalueapp.com/AVLAPP/tracuuquyhoach?toado=' + giatri_X + ',' + giatri_Y;
                                                document.getElementById('mapview').location.href.reload();
                                                document.getElementById('mapview').contentWindow.location.reload();
                                            }
                                        }

</script>