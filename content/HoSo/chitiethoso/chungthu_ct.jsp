<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ChungThu.objChungThu objct = (ChungThu.objChungThu) session.getAttribute("hsedit_ct");
%>
<div class="box"> 
    <div class="box-body">   
        <div class="col-md-6">
            <div class="col-lg-6">
                <label>Số Chứng Thư:</label>
                <input type="text" id="1" name="soct" class="form-control" value="<%=objct.getSoct()%>"  required="" readonly=""/>
            </div>  
            <div class="col-lg-6">
                <label>Ngày phát hành:</label>
                <input type="text" id="2" name="ngayphathanh" class="form-control" value="<%=dtf.format(objct.getNgayphathanh())%>"  required="" readonly=""/>
            </div>
            <div class="col-lg-12">
                <label>Tên khách hàng:</label>
                <input type="text" id="3" name="ngayphathanh" class="form-control" value="<%=objct.getTenkh()%>"  required="" readonly=""/>
            </div>
            <div class="col-lg-12">
                <label>Chi nhánh/PGD (thực hiện khoản vay cho KH):</label>
                <input type="text" id="4" name="ngayphathanh" class="form-control" value="<%=objct.getCnpgd()%>"  required="" readonly=""/>
            </div>
            <div class="col-lg-12">
                <label>Địa chỉ BĐS Thẩm định giá :</label>
                <input type="text" id="5" name="ngayphathanh" class="form-control" value="<%=objct.getFulldiachi()%>"  required="" readonly=""/>
            </div>   
        </div>
        <div class="col-md-6">               
            <div class="col-md-12">
                <label>Vị trí:</label>
                <input type="text" id="10"  name="vitri" value="<%=objct.getVitri()%>" class="form-control"  required="" readonly=""/>
            </div>                   
            <div class="col-lg-12">
                <label>Mô tả BĐS:</label>
                <textarea id="10" name="ngayphathanh" class="form-control"  col="5" rows="10" required="" readonly=""><%=objct.getMotaBDS()%></textarea>
            </div>
        </div>
    </div>
</div>

<div class="col-md-6">                
    <div class="box box-primary"> 
        <div class="box-header with-border">           
            <h4>QSD Đất ở</h4> 
        </div>    
        <div class="box-body">    
            <div class="col-lg-12">
                <label>Loại đất:</label>
                <input type="text" id="11" name="ngayphathanh" class="form-control" value="<%=objct.getLoaidat()%>"  required="" readonly=""/>
            </div>
            <div class="col-lg-4">
                <label>Diện tích (m2):</label>
                <input type="text" id="12" name="ngayphathanh" class="form-control" value="<%=objct.getDato_dientich()%>"  required="" readonly=""/>
            </div>
            <div class="col-lg-4">
                <label>Đơn giá (đồng/m2):</label>
                <input type="text" id="13" name="ngayphathanh" class="form-control" value="<%=fmVND.format(objct.getDato_dongia())%>"  required="" readonly=""/>
            </div>

            <div class="col-lg-4">
                <label>Giá trị (đồng):</label>
                <input type="text" id="14" name="ngayphathanh" class="form-control" value="<%=fmVND.format(objct.getDato_giatri())%>"  required="" readonly=""/>
            </div>

        </div>
    </div>
</div>
<div class="col-md-6">      
    <div class="box box-primary">
        <div class="box-header with-border">           
            <h4>QSD đất khác:</h4> 
        </div> 
        <div class="box-body">  
            <div class="col-lg-4">
                <label>Diện tích (m2):</label>
                <input type="text" id="15" name="ngayphathanh" class="form-control" value="<%=objct.getDatkhac_dientich()%>"  required="" readonly=""/>
            </div>
            <div class="col-lg-4">
                <label>Đơn giá (đồng/m2):</label>
                <input type="text" id="16" name="ngayphathanh" class="form-control" value="<%=fmVND.format(objct.getDatkhac_dongia())%>"  required="" readonly=""/>
            </div>
            <div class="col-lg-4">
                <label>Giá trị(đồng):</label>
                <input type="text" id="17" name="ngayphathanh" class="form-control" value="<%=fmVND.format(objct.getDatkhac_giatri())%>"  required="" readonly=""/>
            </div>

        </div>
    </div>
</div>
<div class="col-md-12">      
    <div class="box ">
        <div class="box-body">   
            <div class="col-lg-6">
                <label>Giá trị QSD đất ở và đất khác:</label>
                <input type="text" id="18" name="ngayphathanh" class="form-control" value="<%=fmVND.format(objct.getGiatriQSDdat())%>"  required="" readonly=""/>
            </div>
        </div>
    </div>
</div> 
<% if (objct.getLoaidat1() != null) {%>
<div class="col-md-6">      
    <div class="box box-danger"> 
        <div class="box-header with-border">           
            <h4>Loại Đất 2</h4> 
        </div> 
        <div class="box-body">    
            <div class="col-lg-8">
                <label>Loại đất:</label>
                <input type="text" id="11" name="ngayphathanh" class="form-control" value="<%=objct.getLoaidat1()%>"  required="" readonly=""/>
            </div>
            <div class="col-lg-4">
                <label>Diện tích (m2):</label>
                <input type="text" id="12" name="ngayphathanh" class="form-control" value="<%=objct.getLoaidat1_s()%>"  required="" readonly=""/>
            </div>
            <div class="col-lg-4">
                <label>Đơn giá (đồng/m2):</label>
                <input type="text" id="13" name="ngayphathanh" class="form-control" value="<%=fmVND.format(objct.getLoaidat1_dg())%>"  required="" readonly=""/>
            </div>

            <div class="col-lg-4">
                <label>Giá trị (đồng):</label>
                <input type="text" id="14" name="ngayphathanh" class="form-control" value="<%=fmVND.format(objct.getLoaidat1_gt())%>"  required="" readonly=""/>
            </div>
            <div class="col-lg-4">
                <label>Giá trị QSD đất (đồng):</label>
                <input type="text" id="14" name="ngayphathanh" class="form-control" value="<%=fmVND.format(objct.getLoaidat1_gtqsd())%>"  required="" readonly=""/>
            </div>
        </div>
    </div>
</div>
<%}%>
<% if (objct.getLoaidat2() != null) {%>
<div class="col-md-6">      
    <div class="box box-danger"> 
        <div class="box-header with-border">           
            <h4>Loại Đất 3</h4> 
        </div> 
        <div class="box-body">    
            <div class="col-lg-8">
                <label>Loại đất:</label>
                <input type="text" id="11" name="ngayphathanh" class="form-control" value="<%=objct.getLoaidat2()%>"  required="" readonly=""/>
            </div>
            <div class="col-lg-4">
                <label>Diện tích (m2):</label>
                <input type="text" id="12" name="ngayphathanh" class="form-control" value="<%=objct.getLoaidat2_s()%>"  required="" readonly=""/>
            </div>
            <div class="col-lg-4">
                <label>Đơn giá (đồng/m2):</label>
                <input type="text" id="13" name="ngayphathanh" class="form-control" value="<%=fmVND.format(objct.getLoaidat2_dg())%>"  required="" readonly=""/>
            </div>

            <div class="col-lg-4">
                <label>Giá trị (đồng):</label>
                <input type="text" id="14" name="ngayphathanh" class="form-control" value="<%=fmVND.format(objct.getLoaidat2_gt())%>"  required="" readonly=""/>
            </div>
            <div class="col-lg-4">
                <label>Giá trị QSD đất (đồng):</label>
                <input type="text" id="14" name="ngayphathanh" class="form-control" value="<%=fmVND.format(objct.getLoaidat2_gtqsd())%>"  required="" readonly=""/>
            </div>
        </div>
    </div>
</div>
<%}%>
<% if (objct.getLoaidat3() != null) {%>
<div class="col-md-6">      
    <div class="box box-danger"> 
        <div class="box-header with-border"><h4>Loại Đất 4</h4></div> 
        <div class="box-body">    
            <div class="col-lg-8">
                <label>Loại đất:</label>
                <input type="text" id="11" name="ngayphathanh" class="form-control" value="<%=objct.getLoaidat3()%>"  required="" readonly=""/>
            </div>
            <div class="col-lg-4">
                <label>Diện tích (m2):</label>
                <input type="text" id="12" name="ngayphathanh" class="form-control" value="<%=objct.getLoaidat3_s()%>"  required="" readonly=""/>
            </div>
            <div class="col-lg-4">
                <label>Đơn giá (đồng/m2):</label>
                <input type="text" id="13" name="ngayphathanh" class="form-control" value="<%=fmVND.format(objct.getLoaidat3_dg())%>"  required="" readonly=""/>
            </div>

            <div class="col-lg-4">
                <label>Giá trị (đồng):</label>
                <input type="text" id="14" name="ngayphathanh" class="form-control" value="<%=fmVND.format(objct.getLoaidat3_gt())%>"  required="" readonly=""/>
            </div>
            <div class="col-lg-4">
                <label>Giá trị QSD đất (đồng):</label>
                <input type="text" id="14" name="ngayphathanh" class="form-control" value="<%=fmVND.format(objct.getLoaidat3_gtqsd())%>"  required="" readonly=""/>
            </div>
        </div>
    </div>
</div>
<%}%>
<% if (objct.getLoaidat4() != null) {%>
<div class="col-md-6">      
    <div class="box box-danger"> 
        <div class="box-header with-border">           
            <h4>Loại Đất 5</h4> 
        </div> 
        <div class="box-body">    
            <div class="col-lg-8">
                <label>Loại đất:</label>
                <input type="text" id="11" name="ngayphathanh" class="form-control" value="<%=objct.getLoaidat4()%>"  required="" readonly=""/>
            </div>
            <div class="col-lg-4">
                <label>Diện tích (m2):</label>
                <input type="text" id="12" name="ngayphathanh" class="form-control" value="<%=objct.getLoaidat4_s()%>"  required="" readonly=""/>
            </div>
            <div class="col-lg-4">
                <label>Đơn giá (đồng/m2):</label>
                <input type="text" id="13" name="ngayphathanh" class="form-control" value="<%=fmVND.format(objct.getLoaidat4_dg())%>"  required="" readonly=""/>
            </div>

            <div class="col-lg-4">
                <label>Giá trị (đồng):</label>
                <input type="text" id="14" name="ngayphathanh" class="form-control" value="<%=fmVND.format(objct.getLoaidat4_gt())%>"  required="" readonly=""/>
            </div>
            <div class="col-lg-4">
                <label>Giá trị QSD đất (đồng):</label>
                <input type="text" id="14" name="ngayphathanh" class="form-control" value="<%=fmVND.format(objct.getLoaidat4_gtqsd())%>"  required="" readonly=""/>
            </div>
        </div>
    </div>
</div>
<%}%>



<div class="col-md-6">      
    <div class="box box-warning"> 
        <div class="box-header with-border">           
            <h4>CTXD TRÊN ĐẤT</h4> 
        </div> 
        <div class="box-body">     
            <div class="col-lg-4">
                <label>Loại:</label>
                <input type="text" id="19" name="ngayphathanh" class="form-control" value="<%=objct.getLoaiCTXD()%>"  required="" readonly=""/>
            </div>
            <div class="col-lg-4">
                <label>Diện tích:</label>
                <input type="text" id="20" name="ngayphathanh" class="form-control" value="<%=objct.getCTXDdientich()%>"   required="" readonly=""/>
            </div>
            <div class="col-lg-4">
                <label>Đơn giá XD:</label>
                <input type="text" id="21" name="ngayphathanh" class="form-control" value="<%=fmVND.format(objct.getCTXDdongia())%>"  required="" readonly=""/>
            </div>
            <div class="col-lg-4">
                <label>CLCL:</label>
                <input type="text" id="22" name="ngayphathanh" class="form-control" value="<%=objct.getCTXDCLCL()%>"   required="" readonly=""/>
            </div>
            <div class="col-lg-4">
                <label>Giá trị CTXD khác:</label>
                <input type="text" id="23" name="ngayphathanh" class="form-control" value="<%=fmVND.format(objct.getCTXDkhac())%>"  required="" readonly=""/>
            </div>
            <div class="col-lg-4">
                <label>Giá trị CTXD:</label>
                <input type="text"id="24" name="ngayphathanh" class="form-control" value="<%=fmVND.format(objct.getCTXDgiatri())%>"  required="" readonly=""/>
            </div>
        </div>
    </div>
</div>
<div class="col-md-12">      
    <div class="box box-success"> 
        <div class="box-body">     
            <div class="col-lg-4">
                <label>Tổng giá trị định giá (đồng):</label>
                <input type="text" id="25" name="ngayphathanh" class="form-control" value="<%=fmVND.format(objct.getTonggiatri())%>"   required="" readonly=""/>
            </div>
        </div>
    </div>
</div>

