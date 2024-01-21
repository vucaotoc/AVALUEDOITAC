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
                        <input type="checkbox" name="dt_hinhdang" value="<%=objks.getDt_hinhdang()%>" ><%=objks.getDt_hinhdang()%>
                    </label>
                </div>

            </div>
            <div class="form-group">
                <label>Chiều rộng mặt tiền:</label>
                <input type="text" name="dt_dtthongthuy" class="form-control" value="<%=objks.getDt_chieurongmattien()%>" />
            </div> 
            <div class="form-group">
                <label>Hướng nhà:</label>
               <div class="radio">
                    <label><input type="radio" name="dt_huongnha" value="<%=objks.getDt_huongnha()%>"    /><%=objks.getDt_huongnha()%> </label>
                </div>
               
            </div> 
            <div class="form-group">
                <label>Đường trước nhà (Nếu đường có lề phải đo luôn lề đường bao nhiêu m?):</label>
                <input type="text" name="dt_duongtruocnha" class="form-control" value="<%=objks.getDt_duongtruocnha()%>" placeholder="" />
            </div>
            <div class="form-group">
                <label>Vị trí:</label>
                <input type="text" name="dt_vitri" class="form-control" value="<%=objks.getDt_vitri()%>" placeholder="" />
            </div>  
            <div class="form-group">
                <label>Kiến trúc khác thông tin tài sản so sánh:</label>
                <div class="box-body pad">                       
                    <textarea class="textarea" placeholder="Place some text here" name="dt_khac"
                              style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"><%=objks.getDt_khac()%></textarea>

                </div>
            </div> 
        </div>
        <div class="box-footer">     

        </div>
    </div>  
</div>