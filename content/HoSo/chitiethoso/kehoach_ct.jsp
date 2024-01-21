<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
    <form  role="form"  method="post" id="frmkehadd" > 
        <div class="col-md-6">  
            <div class="col-md-12">  
                <div class="box box-success">          
                    <div class="box-body">   
                        <div class="col-lg-4">
                            <label>Mã hồ sơ: </label>
                            <input type="text" name="mahs" class="form-control" value="<%=objkeh.getMahs()%>" disabled/>
                        </div> 
                        <div class="col-lg-4">
                            <label>Số chứng thư:</label>
                            <input type="text" name="soct" class="form-control" value="<%=objkeh.getSoct()%>" disabled />
                        </div>      
                        <div class="col-lg-4">
                            <label>Ngày Lập <span class="text-red">(*)</span>: </label>
                            <input type="text" name="ngaylap" class="form-control"  value="<%=dtf.format(objkeh.getNgaylap())%>" id="datepicker"/>
                        </div>   
                        <div class="col-lg-12">
                            <label>Tên Khách Hàng:</label>
                            <input type="text" name="tenkh"  value="<%=objkeh.getTenkh()%>" class="form-control" />
                        </div> 
                        <div class="col-lg-12">
                            <label>Địa Chỉ:</label>
                            <input type="text" name="diachikh" value="<%=objkeh.getDiachikh()%>" class="form-control" />
                        </div> 
                        <div class="col-lg-12">
                            <label>Đối tác Ngân Hành/PGD:</label>
                            <input type="text" name="doitacpgd" class="form-control"  value="<%=objkeh.getDoitacpgd()%>" />
                        </div>     
                        <div class="col-lg-12">
                            <label>Tài sản thẩm định:</label>
                            <input type="text" name="taisantd" value="<%=objkeh.getTaisantd()%>" class="form-control" />
                        </div> 
                        <div class="col-lg-12">
                            <label>Địa chỉ tài sản:</label>
                            <input type="text" name="diachits" value="<%=objkeh.getDiachits()%>"  class="form-control"  />
                        </div>

                        <div class="col-lg-12">
                            <label>Mục đích thẩm định:</label>
                            <input type="text" name="mucdich" value="<%=objkeh.getMucdich()%>" class="form-control" />
                        </div>                                
                    </div>
                </div>
            </div>
            <div class="col-md-12">  
                <div class="box box-success">    
                    <div class="box-header with-border">           
                        <h4>Hồ sơ do:</h4>                    
                    </div>
                    <div class="box-body">   
                        <div class="col-lg-12">
                            <label class="col-lg-2">Ông (bà):</label>
                            <input class="col-lg-6"type="text" name="phutrach" value="<%=objkeh.getPhutrach()%>" class="form-control" />
                            <label class="col-lg-4">Phụ trách</label>
                        </div>     
                        <div class="col-lg-12">
                            <label class="col-lg-2">Ông (bà):</label>
                            <input class="col-lg-6"type="text" name="phoihop1" value="<%=objkeh.getPhoihop1()%>"  class="form-control" />
                            <label class="col-lg-4">Phối hợp thực hiện</label>
                        </div>    
                        <div class="col-lg-12">
                            <label class="col-lg-2">Ông (bà):</label>
                            <input class="col-lg-6"type="text" name="phoihop2" value="<%=objkeh.getPhoihop2()%>" class="form-control" />
                            <label class="col-lg-4">Phối hợp thực hiện</label>
                        </div>    
                    </div>
                </div>
            </div>                   
        </div>
        <div class="col-md-6">  
            <div class="col-md-12">  
                <div class="box box-success">    
                    <div class="box-header with-border">           

                    </div>
                    <div class="box-body">   
                        <div class="col-lg-12">
                            <label>Thời gian ký hợp đồng:</label>
                            <input type="text" name="thoigiankyhd" value="<%=dtf.format(objkeh.getThoigiankyhd())%>" class="form-control" id="datepicker1" />    
                        </div>     
                        <div class="col-lg-12">
                            <label>Giá trị hợp đồng:</label>
                            <div class="col-sm-12">
                                <div class="col-sm-8">
                                    <input type="text" name="giatrihd" value="<%=fmVND.format(objkeh.getGiatrihd())%>" class="form-control" /> 
                                </div>
                                <div class="col-sm-4">
                                   <input type="text" name="viatrivat" value="<%=objkeh.getGiatrivat()%>" class="form-control" />
                                </div>
                            </div>  
                        </div>
                        <div class="col-lg-12">
                            <label >Tỷ lệ chiết khấu:</label>
                            <input type="text" name="chietkhau" value="<%=objkeh.getChietkhau()%>" class="form-control" />                              
                        </div>  
                        <div class="col-lg-12">
                            <label>Thời gian ký khảo sát hiện trạng:</label>
                            <input type="text" name="thoigianks" class="form-control" value="<%=dtf.format(objkeh.getThoigianks())%>" id="datepicker2" />                                
                        </div>    
                        <div class="col-lg-12">
                            <label>Thời gian dự kiến hoàn thành:</label>
                            <input type="text" name="thoigianht" class="form-control" value="<%=dtf.format(objkeh.getThoigianht())%>" id="datepicker3" />                                
                        </div>    

                    </div>
                </div>
            </div>
            <div class="col-md-12">  
                <div class="box box-success">
                    <div class="box-body">         
                        <div class="col-md-6">  
                            <label>Vị trí thửa đất:</label>
                            <div class="checkbox">
                                <label >
                                    <span class="text-red"><%=DATA.function.xuly_hienthi_truongKS(objkeh.getVitri())%></span>
                                </label>
                            </div>
                        </div>
                        <div class="col-md-6"> 
                            <label>Giả thiết đặc biệt/loại đất:</label>
                            <div class="checkbox">
                                <label >
                                   <span class="text-red"><%=DATA.function.xuly_hienthi_truongKS(objkeh.getGiathiet())%></span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12"> 
            <div class="col-md-6">  
                <div class="box box-success">    
                    <div class="box-header with-border">           

                    </div>
                    <div class="box-body">   
                        <div class="col-lg-12">
                            <label>Người liên hệ thu hồi công nợ: Ông (bà):</label>
                            <input type="text" name="cn_nguoi" class="form-control" value="<%=objkeh.getCn_nguoi()%>" />
                        </div> 
                        <div class="col-lg-12">
                            <label>Điện thoại:</label>
                            <input type="text" name="cn_dienthoai"  class="form-control"  value="<%=objkeh.getCn_dienthoai()%>" />
                        </div> 
                        <div class="col-lg-12">
                            <label>Địa chỉ giao hồ sơ:</label>
                            <input type="text" name="cn_diachi" class="form-control" value="<%=objkeh.getCn_diachi()%>"  />
                        </div>     
                        <div class="col-lg-12">
                            <label>Email xuất hoá đơn:</label>
                            <input type="text" name="cn_email" class="form-control" value="<%=objkeh.getCn_email()%>" />
                        </div>                                 
                    </div>
                </div>
            </div>

            <div class="col-md-6">  
                <div class="box box-success">
                    <div class="box-body">    
                        <label>Người phụ trách:</label>
                        <img src="data:image/png;base64,<%=objkeh.getChuky()%>" />
                    </div>
                </div>
            </div>

        </div>   
             
        
        
    </form>


