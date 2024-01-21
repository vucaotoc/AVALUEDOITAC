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
                <label>Biển số:</label>
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
                <label>Thân xe:</label>
                <div class="radio">
                    <label><input type="radio" name="ptvc_thanxe" value="<%=objks.getPt_thanxe()%>"  checked=""   /><%=objks.getPt_thanxe()%> </label>
                </div>     
            </div> 
            <div class="col-lg-4">
                <label>Loại nhiên liệu sử dụng:</label>
                <div class="radio">
                    <label><input type="radio" name="ptvc_nhienlieu" value="<%=objks.getPt_loainhieulieu()%>"  checked=""    /><%=objks.getPt_loainhieulieu()%> </label>
                </div>               
            </div> 
        </div>
    </div>
    <div class="box">  
        <div class="box-body"> 
            <div class="col-lg-4">
                <label>Đèn pha trước:</label>
                <div class="radio">
                    <label><input type="radio" name="ptvc_dentruoc" value="<%=objks.getPt_dentruoc()%>"  checked=""    /><%=objks.getPt_dentruoc()%> </label>
                </div>

            </div> <div class="col-lg-4">
                <label>Đèn pha sau</label>
                <div class="radio">
                    <label><input type="radio" name="ptvc_densau" value="<%=objks.getPt_densau()%>"   checked=""   /><%=objks.getPt_densau()%> </label>
                </div>
            </div> <div class="col-lg-4">
                <label>Đèn phanh:</label>
                <div class="radio">
                    <label><input type="radio" name="ptvc_phanh" value="<%=objks.getPt_denphanh()%>" checked=""     /><%=objks.getPt_denphanh()%> </label>
                </div>    
            </div> <div class="col-lg-4">
                <label>Đèn tín hiệu:</label>
                <div class="radio">
                    <label><input type="radio" name="ptvc_tinhieu" value="<%=objks.getPt_dentinhieu()%>"  checked=""    /><%=objks.getPt_dentinhieu()%> </label>
                </div>                          

            </div>
        </div>
        <div class="box">  
            <div class="box-body"> 
                <div class="col-lg-4">
                    <label>Chất liệu thùng xe:</label>
                    <div class="radio">
                        <label><input type="radio" name="ptvc_thungxe" value="<%=objks.getPt_thungxe()%>"  checked=""  /><%=objks.getPt_thungxe()%> </label>
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