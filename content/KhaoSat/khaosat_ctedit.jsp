<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if (session.getAttribute("ksedit_ks") != null) {
        KhaoSat.objKhaoSat objks = (KhaoSat.objKhaoSat) session.getAttribute("ksedit_ks");
        DecimalFormat fmVND = new DecimalFormat("###,###,###");
%>
<section class="content-header">
    <h1>
        <h2>CHI TIẾT PHIẾU KHẢO SÁT</h2>
         <a href="hoso?id=<%=objks.getIdhs()%>"  class="btn btn-warning" >Quay về</a>
    </h1>           
</section>
<div class="row">
    <form  role="form"  method="post" id="frmkhedit" > 
        <div class="col-md-12">   
            <div class="box box-success">
                <div class="box-header with-border">           
                    <h2>Thông Tin Tài Sản Khảo Sát</h2>
                     <a href="ksedit?id=<%=objks.getIdhs()%>"  class="btn btn-primary pull-right" >Cập Nhật</a>
                </div>
                <div class="box-body">  
                    <div class="form-group">
                        <label>Mã Hồ Sơ:</label>
                        <input type="text" name="mahs" class="form-control" value="<%=objks.getMahs()%>" disabled=""/>
                    </div> 

                    <div class="form-group">
                        <label>Địa chỉ tài sản:</label>
                        <input type="text" name="diachits" class="form-control" value="<%=objks.getDiachits()%>" disabled=""/>
                    </div> 

                    <div class="form-group">
                        <label>Tọa độ Goole Maps:</label>
                        <input type="text" name="toadomaps" class="form-control" value="<%=objks.getLocation()%>" disabled=""/>           
                    </div> 

                    <div class="form-group">
                        <label>Thời gian khảo sát: </label>
                        <input type="text" name="ngayks" class="form-control" id="datepicker" value="<%=objks.getNgayks()%>"  disabled=""/>
                    </div> 
                    <div class="form-group">
                        <label>Nhân viên khảo sát:</label>
                        <input type="text" name="tennvks" class="form-control" value="<%=objks.getTennvks()%>" disabled=""/>
                    </div>      
                    <div class="form-group">
                        <label>Chí phí khảo sát:</label>
                        <input type="text" name="chiphiks" class="form-control" value="<%=fmVND.format(objks.getChiphiks())%>" />
                    </div>  
                    <div class="form-group">
                        <label>Phí tạm ứng:</label>
                        <input type="text" name="phitamung" class="form-control" value="<%=fmVND.format(objks.getChiphitamung())%>" />
                    </div> 

                    <div class="form-group">
                        <label>Loại tài sản khảo sát:</label>
                        <input type="text" name="loaits" class="form-control" value="<%=objks.getLoaits()%>" disabled="" />
                    </div>
                </div> 
                <div class="box-footer">   

                </div>
            </div>
        </div>

        <% if (objks.getLoaits().startsWith("Phương Tiện Vận Tải")) { %>
        <%@include  file="ksphuongtienvanchuyen_ctedit.jsp" %>
        <%} else if (objks.getLoaits().startsWith("Chung Cư")) {%>
        <%@include  file="kschungcu_ctedit.jsp" %>
        <%} else if (objks.getLoaits().startsWith("Nhà Phố") || objks.getLoaits().startsWith("Biệt Thự") || objks.getLoaits().startsWith("Văn Phòng")) {%>
        <%@include  file="ksnhapho_ctedit.jsp" %>
        <%} else if (objks.getLoaits().startsWith("Đất Trống")) {%>
        <%@include  file="ksdattrong_ctedit.jsp" %>      
        <%}%>     
       


        <div class="col-md-12">   
            <div class="box box-primary">
                <div class="box-header with-border">    
                    <h2>Chử ký người hướng dẫn</h2>               
                </div>
                <div class="box-body">
                    <div class="form-group">
                        <div id="signature-pad3" class="signature-pad">
                            <div class="signature-pad--body">
                                <img width="100%" min-height="100px" src="data:image/png;base64,<%=objks.getChukyhsks()%>" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box-footer">   
                </div>
            </div>   
        </div>
        <div class="col-md-12">   
            <div class="box box-primary">
                <div class="box-header with-border">    
                    <h2>Chử ký cán bộ thực hiện</h2>               
                </div>
                <div class="box-body">
                    <div class="form-group">
                        <div  id="signature-pad2" class="signature-pad">
                            <div class="signature-pad--body">
                                <img width="100%" min-height="100px" src="data:image/png;base64,<%=objks.getChukynvks()%>" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box-footer">   
                </div>
            </div>   
        </div>
    </form>
</div>
<%}%>