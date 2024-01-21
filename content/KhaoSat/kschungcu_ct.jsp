<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="col-md-12" id='block_CC' >   
    <div class="box box-primary">
        <div class="box-header with-border">           
            <h2>Thông Tin Khảo Sát Chung Cư</h2>               
        </div>
        <div class="box-body">   
            <div class="col-lg-4">
                <label>Diện tích thông thủy</label>
                <input type="text" name="cc_dtthongthuy" class="form-control" value="<%=objks.getCc_dtthongthuy()%>" />
            </div> 
            <div class="col-lg-4">
                <label>Diện tích tim tường:</label>
                <input type="text" name="cc_dttimtuong" class="form-control" value="<%=objks.getCc_dttimtuong()%>" />
            </div> 
            <div class="col-lg-4">
                <label>Vị trí tầng</label>
                <input type="text" name="cc_vitritang" class="form-control"  value="<%=objks.getCc_vitritang()%>" />
            </div> 
            
            <div class="col-lg-4">
                <label>Loại căn hộ:</label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="cc_loaich" checked="" value="<%=objks.getCc_loai()%>"><%=objks.getCc_loai()%>
                    </label>
                </div>

            </div>
            <div class="col-lg-4">
                <label>Số phòng ngủ:</label>
                <div class="radio">
                    <label><input type="radio" name="cc_sophongngu"  checked="" value="<%=objks.getCc_sophongngu()%>"/> <%=objks.getCc_sophongngu()%> </label>
                </div>                                  
            </div>

            <div class="col-lg-4">
                <label>Sàn căn hộ:</label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="cc_sancanho"  checked="" value="<%=objks.getCc_matsan()%>"><%=objks.getCc_matsan()%>
                    </label>
                </div>               
            </div>
            <div class="col-lg-4">
                <label>Cửa chính căn hộ:</label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="cc_cuachinh" checked="" value="<%=objks.getCc_cuachinh()%>"><%=objks.getCc_cuachinh()%>
                    </label>
                </div>               
            </div>

            <div class="col-lg-4">
                <label>Cửa phòng căn hộ:</label>

                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="cc_cuaphong" checked="" value="<%=objks.getCc_cuaphong()%>" /><%=objks.getCc_cuaphong()%>
                    </label>
                </div>    
            </div>
            <div class="col-lg-4">
                <label>Cửa sổ căn hộ:</label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="cc_cuaso" checked="" value="<%=objks.getCc_cuaso()%>"><%=objks.getCc_cuaso()%>
                    </label>
                </div>

            </div>

            <div class="col-lg-4">
                <label>Có khu phơi đồ riêng</label>
                <div class="radio">
                    <label><input type="radio"  name="cc_cokhuphoido" checked="" value="<%=objks.getCc_cokhuphoido()%>"    /> <%=objks.getCc_cokhuphoido()%> </label>
                </div>               

            </div>

            <div class="col-lg-4">
                <label>Hướng view:</label>
                <input type="text" name="cc_huongview" class="form-control" value="<%=objks.getCc_huongview()%>" />
            </div> 
            <div class="col-lg-4">
                <label>Nhà vệ sinh:</label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="cc_nhavesinh" checked="" value="<%=objks.getCc_nhavesinh()%>"><%=objks.getCc_nhavesinh()%>
                    </label>
                </div>
            </div>
            <div class="col-lg-4">
                <label>Chất lượng còn lại:</label>
                <input type="text" name="cc_chatluongconlai" class="form-control" value="<%=objks.getCc_chatluongconlai()%>"  />
            </div> 
            <div class="col-lg-4">
                <label>Kiến trúc khác thông tin tài sản so sánh:</label>
                <div class="box-body pad">                       
                    <textarea class="textarea" placeholder="Place some text here" name="cc_khac"
                              style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"><%=objks.getCc_khac()%></textarea>

                </div>
            </div> 

        </div>
        <div class="box-footer">     

        </div>
    </div>   
</div>