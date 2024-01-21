<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-md-12" id='block_DT' >   
    <div class="box box-primary">
        <div class="box-header with-border">           
            <h2>Thông Tin Khảo Sát Dất Trồng</h2>               
        </div>
        <div class="box-body"> 
            <div class="form-group">
                <label>Hình dáng lô đất:</label>
                 <div class="checkbox">
                    <label>
                        <input type="checkbox" name="dt_hinhdang" value="Vuông vức">Vuông vức
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="dt_hinhdang" value="Không vuông vức">Không vuông vức
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="dt_hinhdang" value="Tương đối vuông vức">Tương đối vuông vức
                    </label>
                </div>
                <div class="checkbox">
                    <label>Khác: </label>
                        <input type="text" name="dt_hinhdang" placeholder="Khác" />
                   
                </div>
            </div>
            <div class="form-group">
                <label>Chiều rộng mặt tiền:</label>
                <input type="text" name="dt_dtthongthuy" class="form-control" value="" />
            </div> 
            <div class="form-group">
                <label>Hướng nhà:</label>
               <div class="radio">
                    <label><input type="radio" name="dt_huongnha" value="Hướng Đông"    />Hướng Đông </label>
                </div>
                <div class="radio">
                    <label><input type="radio" name="dt_huongnha" value="Hướng Tây"   />Hướng Tây </label>
                </div>
                <div class="radio">
                    <label> <input type="radio" name="dt_huongnha" value="Hướng Nam"  />Hướng Nam </label>
                </div>       
                <div class="radio">
                    <label><input type="radio" name="dt_huongnha" value="Hướng Bắc"    />Hướng Bắc </label>
                </div>
                <div class="radio">
                    <label><input type="radio" name="dt_huongnha" value="Hướng Đông Nam"   />Hướng Đông Nam </label>
                </div>
                <div class="radio">
                    <label> <input type="radio" name="dt_huongnha" value="Hướng Đông Bắc"  />Hướng Đông Bắc </label>
                </div>       
                <div class="radio">
                    <label><input type="radio" name="dt_huongnha" value="Hướng Tây Nam"    />Hướng Tây Nam </label>
                </div>
                <div class="radio">
                    <label><input type="radio" name="dt_huongnha" value="Hướng Tây Bắc"   />Hướng Tây Bắc </label>
                </div>                       
            </div> 
            <div class="form-group">
                <label>Đường trước nhà (Nếu đường có lề phải đo luôn lề đường bao nhiêu m?):</label>
                <input type="text" name="dt_duongtruocnha" class="form-control" value="" placeholder="" />
            </div>
            <div class="form-group">
                <label>Vị trí:</label>
                <input type="text" name="dt_vitri" class="form-control" value="" placeholder="" />
            </div>  
            <div class="form-group">
                <label>Kiến trúc khác thông tin tài sản so sánh:</label>
                <div class="box-body pad">                       
                    <textarea class="textarea" placeholder="Place some text here" name="dt_khac"
                              style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>

                </div>
            </div> 
        </div>
        <div class="box-footer">     

        </div>
    </div>  
</div>