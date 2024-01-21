<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-md-12" id='block_CC' >   
    <div class="box box-primary">
        <div class="box-header with-border">           
            <h2>Thông Tin Khảo Sát Chung Cư</h2>               
        </div>
        <div class="box-body">   

            <div class="col-lg-4">
                <label>Diện tích thông thủy</label>
                <input type="text" name="cc_dtthongthuy" class="form-control" value="" />
            </div> 
            <div class="col-lg-4">
                <label>Diện tích tim tường:</label>
                <input type="text" name="cc_dttimtuong" class="form-control" value="" />
            </div> 
            <div class="col-lg-4">
                <label>Vị trí tầng</label>
                <input type="text" name="cc_vitritang" class="form-control" value="" />
            </div> 

        </div>
    </div>
    <div class="box">  
        <div class="box-body">  
            <div class="col-lg-4">
                <label>Loại căn hộ:</label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="cc_loaich" value="Penthouse">Penthouse
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="cc_loaich" value="Duplex">Duplex
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_loaich" value="Sky Vila">Sky Vila
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_loaich" value="Shophouse">Shophouse
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_loaich" value="Officetel">Officetel
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_loaich" value="Studio">Studio
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_loaich" value="Dual key">Dual key
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_loaich" value="Thông Thường">Thông Thường
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_loaich" value="Căn Góc">Căn Góc
                    </label>
                </div>
            </div>

            <div class="col-lg-4">
                <label>Số phòng ngủ:</label>
                <div class="radio">
                    <label><input type="radio" name="cc_sophongngu" value="1 Phòng"    /> 1 Phòng </label>
                </div>
                <div class="radio">
                    <label><input type="radio" name="cc_sophongngu" value="2 Phòng"   /> 2 Phòng </label>
                </div>
                <div class="radio">
                    <label> <input type="radio"  name="cc_sophongngu" value="3 Phòng"  /> 3 Phòng </label>
                </div>                        
            </div>

            <div class="col-lg-4">
                <label>Sàn căn hộ:</label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="cc_sancanho" value="Gạch ceramic">Gạch ceramic
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_sancanho" value="Đá Granite">Đá Granite
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_sancanho" value="Sàn gỗ">Sàn gỗ
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_sancanho" value="Sàn nhựa giả gỗ">Sàn nhựa giả gỗ
                    </label>
                </div>                    
            </div>
        </div>
    </div>
    <div class="box">  
        <div class="box-body">  
            <div class="col-lg-4">
                <label>Cửa chính căn hộ:</label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="cc_cuachinh" value="Cửa gỗ">Cửa gỗ
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_cuachinh" value="Cửa nhôm">Cửa nhôm
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_cuachinh" value="Cửa nhôm kính">Cửa nhôm kính
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_cuachinh" value="Cửa nhựa lõi thép">Cửa nhựa lõi thép
                    </label>
                </div>     
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_cuachinh" value="Cửa thép vân gổ">Cửa thép vân gổ
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_cuachinh" value="Cửa sắt">Cửa sắt
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_cuachinh" value="Cửa sắt cuốn tự động">Cửa sắt cuốn tự động
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_cuachinh" value="Cửa nhựa lõi thép">Cửa nhựa lõi thép
                    </label>
                </div>     
                <div class="checkbox">
                    <label>
                        <input type="text" name="cc_cuachinh" value="Khác" placeholder="khác...."/>
                    </label>
                </div>    
            </div>

            <div class="col-lg-4">
                <label>Cửa phòng căn hộ:</label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="cc_cuaphong" value="Cửa gỗ">Cửa gỗ
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_cuaphong" value="Cửa nhôm">Cửa nhôm
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_cuaphong" value="Cửa nhôm kính">Cửa nhôm kính
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_cuaphong" value="Cửa nhựa lõi thép">Cửa nhựa lõi thép
                    </label>
                </div>     
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_cuaphong" value="Cửa thép vân gổ">Cửa thép vân gổ
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_cuaphong" value="Cửa sắt">Cửa sắt
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_cuaphong" value="Cửa sắt cuốn tự động">Cửa sắt cuốn tự động
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_cuaphong" value="Cửa nhựa lõi thép">Cửa nhựa lõi thép
                    </label>
                </div>     
                <div class="checkbox">
                    <label>
                        <input type="text" name="cc_cuaphong" value="Khác" placeholder="khác...."/>
                    </label>
                </div>    
            </div>
            <div class="col-lg-4">
                <label>Cửa sổ căn hộ:</label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="cc_cuaso" value="Cửa gỗ">Cửa gỗ
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_cuaso" value="Cửa nhôm">Cửa nhôm
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_cuaso" value="Cửa nhôm kính">Cửa nhôm kính
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_cuaso" value="Cửa nhựa lõi thép">Cửa nhựa lõi thép
                    </label>
                </div>     
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_cuaso" value="Cửa thép vân gổ">Cửa thép vân gổ
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_cuaso" value="Cửa sắt">Cửa sắt
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_cuaso" value="Cửa sắt cuốn tự động">Cửa sắt cuốn tự động
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_cuaso" value="Cửa nhựa lõi thép">Cửa nhựa lõi thép
                    </label>
                </div>     
                <div class="checkbox">
                    <label>
                        <input type="text" name="cc_cuaso" placeholder="khác...."/>
                    </label>
                </div>   
            </div>
        </div>
    </div>
    <div class="box">  
        <div class="box-body">  
            <div class="col-lg-4">
                <label>Có khu phơi đồ riêng</label>
                <div class="radio">
                    <label><input type="radio"  name="cc_cokhuphoido" value="Có"    /> Có </label>
                </div>
                <div class="radio">
                    <label><input type="radio"  name="cc_cokhuphoido" value="Không"   /> Không </label>
                </div>

            </div>

            <div class="col-lg-4">
                <label>Hướng view:</label>
                <input type="text" name="cc_huongview" class="form-control" value="" />
            </div> 
            <div class="col-lg-4">
                <label>Nhà vệ sinh:</label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="cc_nhavesinh" value="Gạch ceramic">Gạch ceramic
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_nhavesinh" value="Đá Granite">Đá Granite
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_nhavesinh" value="Sàn gỗ">Sàn gỗ
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="cc_nhavesinh" value="Sàn nhựa giả gỗ">Sàn nhựa giả gỗ
                    </label>
                </div>            
                <div class="checkbox">
                    <label>
                        <input type="text" name="cc_nhavesinh" placeholder="khác...."/>
                    </label>
                </div>   
            </div>
        </div>
    </div>
    <div class="box">  
        <div class="box-body">  
            <div class="col-lg-4">
                <label>Chất lượng còn lại:</label>
                <input type="text" name="cc_chatluongconlai" class="form-control" value="" />
            </div> 
            <div class="col-lg-4">
                <label>Kiến trúc khác thông tin tài sản so sánh:</label>
                <div class="box-body pad">                       
                    <textarea class="textarea" placeholder="Place some text here" name="cc_khac"
                              style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>

                </div>
            </div> 

        </div>        
    </div>   
</div>