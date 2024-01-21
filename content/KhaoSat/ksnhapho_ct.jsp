<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="col-md-12" id='block_NP'>   
    <div class="box box-primary">
        <div class="box-header with-border">           
            <h2>Thông Tin Khảo Sát Nhà Phố</h2>               
        </div>
        <div class="box-body">   

            <div class="col-lg-3">
                <label>Chiều rộng mặt tiền:</label>
                <input type="text" name="np_chieurongmattien" class="form-control"  checked="" value="<%=objks.getNp_chieurongmattien()%>" />
            </div>           
            <div class="col-lg-5">
                <label>Đường trước nhà (Nếu đường có lề phải đo luôn lề đường bao nhiêu m?):</label>
                <input type="text" name="np_duongtruocnha" class="form-control" value="<%=objks.getNp_duongtruocnha()%>" />
            </div> 
            <div class="col-lg-4">
                <label>Vị trí:</label>
                <input type="text" name="np_vitri" class="form-control" value="<%=objks.getNp_vitri()%>" />
            </div> 
            <div class="col-lg-4">
                <label>Loại công trình:</label>
                <input type="text" name="np_loaicongtrinh" class="form-control" value="<%=objks.getNp_loaict()%>"  />
            </div>        
            <div class="col-lg-4">
                <label>Sân</label>
                <input type="text" name="np_san" class="form-control" value="<%=objks.getNp_san()%>"/>
            </div> 
        </div>
    </div>
    <div class="box">  
        <div class="box-body">  

            <div class="col-lg-4">
                <label>Hướng nhà:</label>
                <div class="radio">
                    <label><input type="radio" name="np_huongnha"  checked="" value="<%=objks.getNp_huongnha()%>"    /><%=objks.getNp_huongnha()%></label>
                </div>               
            </div>
            <div class="col-lg-4">
                <label>Hình dáng lô đất:</label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="np_hinhdang" value="<%=objks.getNp_hinhdang()%>" checked="" ><%=objks.getNp_hinhdang()%>
                    </label>
                </div>
            </div>
            <div class="col-lg-4">
                <label>Móng :</label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="np_mong"  checked=""  value="<%=objks.getNp_loaimong()%>"><%=objks.getNp_loaimong()%>
                    </label>
                </div>               
            </div>
        </div>
    </div>
    <div class="box">  
        <div class="box-body">  
            <div class="col-lg-4">
                <label>Cổng:</label>
                <div class="radio">
                    <label><input type="radio" name="np_cong"  checked="" value="<%=objks.getNp_cong()%>"    /> <%=objks.getNp_cong()%> </label>
                </div>                
            </div>
            <div class="col-lg-4">
                <label>Tường:</label>
                <div class="radio">
                    <label><input type="radio"  name="np_tuong"  checked="" value="<%=objks.getNp_tuong()%>"    /> <%=objks.getNp_tuong()%> </label>
                </div>                
            </div>
            <div class="col-lg-4">
                <label>Trần:</label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="np_tran"  checked="" value="<%=objks.getNp_tran()%>"><%=objks.getNp_tran()%>
                    </label>
                </div>
            </div>
        </div>
    </div>
    <div class="box">  
        <div class="box-body">  
            <div class="col-lg-4">
                <label>Sàn :</label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="np_sannha"  checked="" value="<%=objks.getNp_sannha()%>"><%=objks.getNp_sannha()%>
                    </label>
                </div>
            </div>
            <div class="col-lg-4">
                <label>Cửa chính :</label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="np_cuachinh"  checked="" value="<%=objks.getNp_cuachinh()%>"><%=objks.getNp_cuachinh()%>
                    </label>
                </div>
            </div>

            <div class="col-lg-4">
                <label>Cửa phòng :</label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="np_cuaphong"  checked="" value="<%=objks.getNp_cuaphong()%>"><%=objks.getNp_cuaphong()%>
                    </label>
                </div>
            </div>
        </div>
    </div>
    <div class="box">  
        <div class="box-body">  
            <div class="col-lg-4">
                <label>Cửa sổ :</label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="np_cuaso"  checked="" value="<%=objks.getNp_cuaso()%>"><%=objks.getNp_cuaso()%>
                    </label>
                </div>
            </div>

            <div class="col-lg-4">
                <label>Mái :</label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="np_mai"  checked="" value="<%=objks.getNp_mai()%>"><%=objks.getNp_mai()%>
                    </label>
                </div>
            </div>
            <div class="col-lg-4">
                <label>Cầu thang :</label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="np_cauthang"  checked="" value="<%=objks.getNp_cauthang()%>"><%=objks.getNp_cauthang()%>
                    </label>
                </div>
            </div>
        </div>
    </div>
    <div class="box">  
        <div class="box-body">  
            <div class="col-lg-4">
                <label>Sân thượng :</label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="np_santhuong"  checked="" value="<%=objks.getNp_santhuong()%>"><%=objks.getNp_santhuong()%>
                    </label>
                </div>
            </div>
            <div class="col-lg-4">
                <label>Nhà vệ sinh:</label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="np_nhavesinh"  checked="" value="<%=objks.getNp_nhavesinh()%>"><%=objks.getNp_nhavesinh()%>
                    </label>
                </div>
            </div>
            <div class="col-lg-4">
                <label>Chất lượng còn lại:</label>
                <input type="text" name="np_chatluongconlai" class="form-control" value="<%=objks.getNp_chatluongconlai()%>" />
            </div> 
            <div class="col-lg-4">
                <label>Kiến trúc khác thông tin tài sản so sánh:</label>
                <div class="box-body pad">                       
                    <textarea class="textarea" placeholder="Place some text here" name="np_khac"
                              style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"><%=objks.getNp_khac()%></textarea>

                </div>
            </div> 

        </div>       
    </div> 
</div>   