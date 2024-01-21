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
                <label>Hình dáng lô đất: <input type="checkbox" name="none" value="" checked="" ><%=objks.getNp_hinhdang()%></label>     

                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="np_hinhdang" value="Vuông vức" >Vuông vức
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_hinhdang" value="Không vuông vức">Không vuông vức
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_hinhdang" value="Tương đối vuông vức">Tương đối vuông vức
                    </label>
                </div>
                <div class="checkbox">
                    <label>Khác: </label>
                    <input type="text" name="np_hinhdang" placeholder="Khác" />
                </div>
            </div>

            <div class="col-lg-4">
                <label>Hướng nhà: <input type="radio" name="none"  checked="" value="<%=objks.getNp_huongnha()%>"    /><%=objks.getNp_huongnha()%></label></label>
                <div class="radio">
                    <label><input type="radio" name="np_huongnha" value="Hướng Đông"    />Hướng Đông </label>
                </div>
                <div class="radio">
                    <label><input type="radio" name="np_huongnha" value="Hướng Tây"   />Hướng Tây </label>
                </div>
                <div class="radio">
                    <label> <input type="radio" name="np_huongnha" value="Hướng Nam"  />Hướng Nam </label>
                </div>       
                <div class="radio">
                    <label><input type="radio" name="np_huongnha" value="Hướng Bắc"    />Hướng Bắc </label>
                </div>
                <div class="radio">
                    <label><input type="radio" name="np_huongnha" value="Hướng Đông Nam"   />Hướng Đông Nam </label>
                </div>
                <div class="radio">
                    <label> <input type="radio" name="np_huongnha" value="Hướng Đông Bắc"  />Hướng Đông Bắc </label>
                </div>       
                <div class="radio">
                    <label><input type="radio" name="np_huongnha" value="Hướng Tây Nam"    />Hướng Tây Nam </label>
                </div>
                <div class="radio">
                    <label><input type="radio" name="np_huongnha" value="Hướng Tây Bắc"   />Hướng Tây Bắc </label>
                </div>                                   
            </div>

            <div class="col-lg-4">
                <label>Móng :<input type="checkbox" name="none"  checked=""  value="<%=objks.getNp_loaimong()%>"><%=objks.getNp_loaimong()%></label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="np_mong" value="Móng đơn">Móng đơn
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="np_mong" value="Móng băng">Móng băng
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="np_mong" value="Móng BTCT">Móng BTCT
                    </label>
                </div>
                <div class="checkbox">
                    <label>Khác:</label>
                    <input type="text" name="np_mong" placeholder="Khác"/>

                </div>              
            </div>
        </div>
    </div>
    <div class="box">  
        <div class="box-body">  
            <div class="col-lg-4">
                <label>Cổng: <input type="radio" name="none"  checked="" value="<%=objks.getNp_cong()%>" /> <%=objks.getNp_cong()%> </label>
                <div class="radio">
                    <label><input type="radio" name="np_cong" value="Không"    /> Không </label>
                </div>
                <div class="radio">
                    <label><input type="radio"name="np_cong" value="Cổng sắt hoa 2 cánh , bổ trụ"   /> Cổng sắt hoa 2 cánh , bổ trụ</label>
                </div>
                <div class="radio">
                    <label> <input type="radio" name="np_cong" value="Cổng sắt kéo"  /> Cổng sắt kéo </label>
                </div>    
                <div class="radio">
                    <label><input type="radio" name="np_cong" value="Cổng sắt kéo tự động"   />Cổng sắt kéo tự động</label>
                </div>
                <div class="checkbox">
                    <label>Khác :</label>
                    <input type="text" name="np_cong"  placeholder="Khác"/>
                </div>             
            </div>
            <div class="col-lg-4">
                <label>Tường: <input type="radio"  name="none"  checked="" value="<%=objks.getNp_tuong()%>"    /> <%=objks.getNp_tuong()%> </label>
                <div class="radio">
                    <label><input type="radio"  name="np_tuong" value="Tường xây gạch 110 bổ trụ BTCT, sơn nước"    /> Tường xây gạch 110 bổ trụ BTCT, sơn nước </label>
                </div>
                <div class="radio">
                    <label><input type="radio" name="np_tuong"  value=" Tường xây gạch 220 bổ trụ BTCT, sơn nước"   /> Tường xây gạch 220 bổ trụ BTCT, sơn nước</label>
                </div>             
                <div class="checkbox">
                    <label>Khác :</label>
                    <input type="text" name="np_tuong" placeholder="Khác"/>
                </div>            
            </div>
            <div class="col-lg-4">
                <label>Trần: <input type="checkbox" name="none"  checked="" value="<%=objks.getNp_tran()%>"><%=objks.getNp_tran()%></label>                
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="np_tran" value="Trần thạch cao, đèn âm trần">Trần thạch cao, đèn âm trần
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_tran" value="Trần nhựa PVC">Trần nhựa PVC
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_tran" value="Trần gổ, đèn âm trần">Trần gổ, đèn âm trần
                    </label>
                </div>
                <div class="checkbox">
                    <label>Khác :</label>
                    <input type="text" name="np_tran"  placeholder="Khác"/>
                </div>        
            </div>
        </div>
    </div>
    <div class="box">  
        <div class="box-body">  
            <div class="col-lg-4">
                <label>Sàn :<input type="checkbox" name="none"  checked="" value="<%=objks.getNp_sannha()%>"><%=objks.getNp_sannha()%></label>                                    
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="np_sannha" value="Gạch ceramic">Gạch ceramic
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_sannha" value="Đá Granite">Đá Granite
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_sannha" value="Sàn gỗ">Sàn gỗ
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_sannha" value="Sàn nhựa giả gỗ">Sàn nhựa giả gỗ
                    </label>
                </div>        
            </div>
            <div class="col-lg-4">
                <label>Cửa chính : <input type="checkbox" name="none"  checked="" value="<%=objks.getNp_cuachinh()%>"><%=objks.getNp_cuachinh()%></label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="np_cuachinh" value="Cửa gỗ">Cửa gỗ
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_cuachinh" value="Cửa nhôm">Cửa nhôm
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_cuachinh" value="Cửa nhôm kính">Cửa nhôm kính
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_cuachinh" value="Cửa nhựa lõi thép">Cửa nhựa lõi thép
                    </label>
                </div>     
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_cuachinh" value="Cửa thép vân gổ">Cửa thép vân gổ
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_cuachinh" value="Cửa sắt">Cửa sắt
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_cuachinh" value="Cửa sắt cuốn tự động">Cửa sắt cuốn tự động
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_cuachinh" value="Cửa nhựa lõi thép">Cửa nhựa lõi thép
                    </label>
                </div>     
                <div class="checkbox">
                    <label>Khác: </label>
                    <input type="text" name="np_cuachinh" value="Khác" placeholder="khác...."/>

                </div>    
            </div>

            <div class="col-lg-4">
                <label>Cửa phòng : <input type="checkbox" name="none"  checked="" value="<%=objks.getNp_cuaphong()%>"><%=objks.getNp_cuaphong()%></label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="np_cuaphong" value="Cửa gỗ">Cửa gỗ
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_cuaphong" value="Cửa nhôm">Cửa nhôm
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_cuaphong" value="Cửa nhôm kính">Cửa nhôm kính
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_cuaphong" value="Cửa nhựa lõi thép">Cửa nhựa lõi thép
                    </label>
                </div>     
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_cuaphong" value="Cửa thép vân gổ">Cửa thép vân gổ
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_cuaphong" value="Cửa sắt">Cửa sắt
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_cuaphong" value="Cửa sắt cuốn tự động">Cửa sắt cuốn tự động
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_cuaphong" value="Cửa nhựa lõi thép">Cửa nhựa lõi thép
                    </label>
                </div>     
                <div class="checkbox">
                    <label>Khác: </label>
                    <input type="text" name="np_cuaphong" value="Khác" placeholder="khác...."/>

                </div>    
            </div>
        </div>
    </div>
    <div class="box">  
        <div class="box-body">  
            <div class="col-lg-4">
                <label>Cửa sổ : <input type="checkbox" name="none"  checked="" value="<%=objks.getNp_cuaso()%>"><%=objks.getNp_cuaso()%></label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="np_cuaso" value="Cửa gỗ">Cửa gỗ
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_cuaso" value="Cửa nhôm">Cửa nhôm
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_cuaso" value="Cửa nhôm kính">Cửa nhôm kính
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_cuaso" value="Cửa nhựa lõi thép">Cửa nhựa lõi thép
                    </label>
                </div>     
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_cuaso" value="Cửa thép vân gổ">Cửa thép vân gổ
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_cuaso" value="Cửa sắt">Cửa sắt
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_cuaso" value="Cửa sắt cuốn tự động">Cửa sắt cuốn tự động
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_cuaso" value="Cửa nhựa lõi thép">Cửa nhựa lõi thép
                    </label>
                </div>     
                <div class="checkbox">
                    <label>Khác: </label>
                    <input type="text" name="np_cuaso" value="Khác" placeholder="khác...."/>

                </div>    
            </div>

            <div class="col-lg-4">
                <label>Mái : <input type="checkbox" name="none"  checked="" value="<%=objks.getNp_mai()%>"><%=objks.getNp_mai()%></label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="np_mai" value="Tole">Tole
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_mai" value="BTCT">BTCT
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_mai" value="Mái ngói">Mái ngói
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_mai" value="Mái bê tông dàn ngói">Mái bê tông dàn ngói
                    </label>
                </div>     
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_mai" value="Mái kính">Mái kính
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_mai" value="Mái lợp bằng tấm nhựa trong suốt">Mái lợp bằng tấm nhựa trong suốt
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_mai" value="Tấm lợp sinh thái">Tấm lợp sinh thái
                    </label>
                </div>                
                <div class="checkbox">
                    <label>Khác: </label>
                    <input type="text" name="np_mai" value="Khác" placeholder="khác...."/>
                </div>    
            </div>
            <div class="col-lg-4">
                <label>Cầu thang :<input type="checkbox" name="none"  checked="" value="<%=objks.getNp_cauthang()%>"><%=objks.getNp_cauthang()%></label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="np_cauthang" value="Cầu thang gổ">Cầu thang gổ
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_cauthang" value="Cầu thang thép">Cầu thang thép
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_cauthang" value="Cầu thang BTCT">Cầu thang BTCT
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_cauthang" value="Tay vịn gổ">Tay vịn gổ
                    </label>
                </div>     
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_cauthang" value="Tay vịn sắt">Tay vịn sắt
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_cauthang" value="Tay vịn nhôm">Tay vịn nhôm
                    </label>
                </div>
            </div>
        </div>
    </div>
    <div class="box">  
        <div class="box-body">  
            <div class="col-lg-4">
                <label>Sân thượng : <input type="checkbox" name="none"  checked="" value="<%=objks.getNp_santhuong()%>"><%=objks.getNp_santhuong()%></label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="np_santhuong" value="Gạch ceramic">Gạch ceramic
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_santhuong" value="Đá Granite">Đá Granite
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_santhuong" value="Sàn gỗ">Sàn gỗ
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_santhuong" value="Sàn nhựa giả gỗ">Sàn nhựa giả gỗ
                    </label>
                </div>   
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_santhuong" value="Gạch ngói">Gạch ngói
                    </label>
                </div>  
                <div class="checkbox">      
                    <label>Khác: </label>
                    <input type="text" name="np_santhuong" value="Khác" placeholder="khác...."/>
                </div>
            </div>
            <div class="col-lg-4">
                <label>Nhà vệ sinh:  <input type="checkbox" name="none"  checked="" value="<%=objks.getNp_nhavesinh()%>"><%=objks.getNp_nhavesinh()%></label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="np_nhavesinh" value="Gạch ceramic">Gạch ceramic
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_nhavesinh" value="Đá Granite">Đá Granite
                    </label>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_nhavesinh" value="Sàn gỗ">Sàn gỗ
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"name="np_nhavesinh" value="Sàn nhựa giả gỗ">Sàn nhựa giả gỗ
                    </label>
                </div>        
                <div class="checkbox">      
                    <label>Khác: </label>
                    <input type="text" name="np_nhavesinh" value="Khác" placeholder="khác...."/>
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