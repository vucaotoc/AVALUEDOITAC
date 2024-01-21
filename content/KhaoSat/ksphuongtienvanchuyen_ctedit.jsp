<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-md-12" id='block_PTVT'>   
    <div class="box box-primary">
        <div class="box-header with-border">           
            <h2>Thông Tin Khảo Sát Phương Tiện Vận Chuyển</h2>               
        </div>
        <div class="box-body">
            <div class="col-lg-4">
                <label>Loại xe:</label>
                <input type="text" name="ptvc_loaixe" class="form-control" value="<%=objks.getPt_loaixe()%>" />
            </div> 
            <div class="col-lg-4">
                <label>Năm sản xuất:</label>
                <input type="text" name="ptvc_namsx" class="form-control" value="<%=objks.getPt_namsanxuat()%>" />
            </div> 
            <div class="col-lg-4">
                <label>Nơi sản xuất:</label>
                <input type="text" name="ptvc_noisx" class="form-control" value="<%=objks.getPt_noisanxuat()%>" />
            </div> 
            <div class="col-lg-4">
                <label>Biển số</label>
                <input type="text" name="ptvc_bienso" class="form-control" value="<%=objks.getPt_bienso()%>" />
            </div> 
            <div class="col-lg-4">
                <label>Màu sắc:</label>
                <input type="text" name="ptvc_mausac" class="form-control"value="<%=objks.getPt_mausac()%>" />
            </div> 
            <div class="col-lg-4">
                <label>Số KM đã chạy tính đến thời điểm định giá:</label>
                <input type="text" name="ptvc_sokm" class="form-control" value="<%=objks.getPt_sokmdachay()%>" />
            </div> 

        </div>
    </div>
    <div class="box">  
        <div class="box-body"> 
            <div class="col-lg-4">
                <label>Thân xe:<input type="radio" name="none" value="<%=objks.getPt_thanxe()%>"  checked=""   /><%=objks.getPt_thanxe()%></label>

                <div class="radio">
                    <label><input type="radio" name="ptvc_thanxe" value="Tốt, chưa thấy có hiện tượng xuống cấp"    />Tốt, chưa thấy có hiện tượng xuống cấp </label>
                </div>
                <div class="radio">
                    <label><input type="radio"  name="ptvc_thanxe" value="Xe có vài chổ trầy xước"   />Xe có vài chổ trầy xước </label>
                </div>
                <div class="radio">
                    <label> <input type="radio" name="ptvc_thanxe" value="Xe bị cong múp"  />Xe bị cong múp </label>
                </div>       
                <div class="radio">
                    <label><input type="radio" name="ptvc_thanxe" value="Xe xuống cấp có hiện tượng gỉ sét thân xe "    />Xe xuống cấp có hiện tượng gỉ sét thân xe </label>
                </div>
                <div class="radio">
                    <label><input type="radio" name="ptvc_thanxe" value="Khác"   />Khác </label>
                </div>
            </div> 
            <div class="col-lg-4">
                <label>Loại nhiên liệu sử dụng:<input type="radio" name="none" value="<%=objks.getPt_loainhieulieu()%>"  checked=""    /><%=objks.getPt_loainhieulieu()%></label>

                <div class="radio">
                    <label><input type="radio" name="ptvc_nhienlieu" value="Xăng"    />Xăng </label>
                </div>
                <div class="radio">
                    <label><input type="radio" name="ptvc_nhienlieu" value="Diesel"   />Diesel</label>
                </div>

            </div> 
        </div>
    </div>
    <div class="box">  
        <div class="box-body"> 
            <div class="col-lg-4">
                <label>Đèn pha trước:<input type="radio" name="none" value="<%=objks.getPt_dentruoc()%>"  checked=""    /><%=objks.getPt_dentruoc()%></label>                
                <div class="radio">
                    <label><input type="radio" name="ptvc_dentruoc" value="Hoạt động"    />Hoạt động </label>
                </div>
                <div class="radio">
                    <label><input type="radio" name="ptvc_dentruoc" value="Chập chờn"   />Chập chờn</label>
                </div>
                <div class="radio">
                    <label> <input type="radio" name="ptvc_dentruoc" value="Không hoạt động"  />Không hoạt động</label>
                </div>        
            </div> 
            <div class="col-lg-4">
                <label>Đèn pha sau: <input type="radio" name="none" value="<%=objks.getPt_densau()%>"   checked=""   /><%=objks.getPt_densau()%></label>                
                <div class="radio">
                    <label><input type="radio" name="ptvc_densau" value="Hoạt động"    />Hoạt động </label>
                </div>
                <div class="radio">
                    <label><input type="radio" name="ptvc_densau" value="Chập chờn"   />Chập chờn</label>
                </div>
                <div class="radio">
                    <label> <input type="radio" name="ptvc_densau" value="Không hoạt động"  />Không hoạt động</label>
                </div>    
            </div> 
            <div class="col-lg-4">
                <label>Đèn phanh:<input type="radio" name="none" value="<%=objks.getPt_denphanh()%>" checked=""     /><%=objks.getPt_denphanh()%></label>
               
                <div class="radio">
                    <label><input type="radio" name="ptvc_phanh" value="Hoạt động"    />Hoạt động </label>
                </div>
                <div class="radio">
                    <label><input type="radio" name="ptvc_phanh" value="Chập chờn"   />Chập chờn</label>
                </div>
                <div class="radio">
                    <label> <input type="radio" name="ptvc_phanh" value="Không hoạt động"  />Không hoạt động</label>
                </div>  
            </div> 
            <div class="col-lg-4">
                <label>Đèn tín hiệu:<input type="radio" name="none" value="<%=objks.getPt_dentinhieu()%>"  checked=""    /><%=objks.getPt_dentinhieu()%></label>                                        
                <div class="radio">
                    <label><input type="radio" name="ptvc_tinhieu" value="Hoạt động"    />Hoạt động </label>
                </div>
                <div class="radio">
                    <label><input type="radio" name="ptvc_tinhieu" value="Chập chờn"   />Chập chờn</label>
                </div>
                <div class="radio">
                    <label> <input type="radio" name="ptvc_tinhieu" value="Không hoạt động"  />Không hoạt động</label>
                </div> 
            </div>
        </div>
        <div class="box">  
            <div class="box-body"> 
                <div class="col-lg-4">
                    <label>Chất liệu thùng xe:<input type="radio" name="none" value="<%=objks.getPt_thungxe()%>"  checked=""  /><%=objks.getPt_thungxe()%> </label>
                    <div class="radio">
                        <label><input type="radio" name="ptvc_thungxe" value="Inox 430"    />Inox 430 </label>
                    </div>
                    <div class="radio">
                        <label><input type="radio" name="ptvc_thungxe" value="Inox 304"   />Inox 304</label>
                    </div>
                    <div class="radio">
                        <label> <input type="radio" name="ptvc_thungxe" value="Composite"  />Composite</label>
                    </div>          
                    <div class="radio">
                        <label><input type="radio" name="ptvc_thungxe" value="Sắt hộp"   />Sắt hộp</label>
                    </div>
                    <div class="radio">
                        <label> <input type="radio" name="ptvc_thungxe" value="Sắt mạ kẻm"  />Sắt mạ kẻm</label>
                    </div>   
                </div>
                <div class="col-lg-4">
                    <label>Tải trọng:</label>
                    <input type="text" name="ptvc_taitrong" class="form-control" value="<%=objks.getPt_taitrong()%>" />
                </div> 
                <div class="col-lg-4">
                    <label>Số chổ:</label>
                    <input type="text" name="ptvc_socho" class="form-control" value="<%=objks.getPt_socho()%>" />
                </div> 

                <div class="col-lg-4">
                    <label>Khác:</label>
                    <div class="box-body pad">                       
                        <textarea class="textarea" placeholder="Place some text here" name="ptvc_khac"
                                  style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"><%=objks.getPt_khac()%></textarea>

                    </div>
                </div> 
            </div>      
        </div>   
    </div>