<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if (session.getAttribute("ksedit_ks") != null && session.getAttribute("hsedit_hs") != null) {
        KhaoSat.objKhaoSat objks = (KhaoSat.objKhaoSat) session.getAttribute("ksedit_ks");
        HoSo.objHoSo objhs = (HoSo.objHoSo) session.getAttribute("hsedit_hs");
        DecimalFormat fmVND = new DecimalFormat("###,###,###");
        SimpleDateFormat dtf = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat dtf1 = new SimpleDateFormat("dd/MM/yyyy");
        String title = "PKS_" + objhs.getMahs() + "_" + dtf.format(objks.getNgayks());
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=title%></title>
    </head>
    <body onload="window.print();">
        <table style="border: none; margin: 0xp auto;width:810px;height: 200px;font-family: Cambria;">
            <tr>
                <td><img src="hinhanh/avalue_logo.jpg" alt=""/></td>

                <td></td>
            </tr>
        </table>
        <table style="border: none; margin: 0xp auto;width:810px;height: auto;font-family: Cambria;">
            <tr style="height: 40px;" >
                <td style="width: 50%;"><span style="font-weight: 700;"> Mã Hồ Sơ</span></td>
                <td  style="width: 50%;"><%=objks.getMahs()%></td>
            </tr>
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Thời gian khảo sát</span></td>
                <td><%=dtf1.format(objks.getNgayks())%></td>
            </tr>
            <tr>
                <td><span style="font-weight: 700;">Chử ký người hướng dẫn</span></td>
                <td><img width="300px" height="200px" src="data:image/png;base64,<%=objks.getChukyhsks()%>" /></td>
            </tr>
            <tr>
                <td><span style="font-weight: 700;">Chử ký cán bộ thực hiện</span></td>
                <td> <img width="300px" height="200px" src="data:image/png;base64,<%=objks.getChukynvks()%>" /></td>
            </tr>
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Tọa độ Goole Maps</span></td>
                <td><%=objks.getLocation()%></td>
            </tr>
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Địa chỉ tài sản</span></td>
                <td><%=objks.getDiachits()%></td>
            </tr>            
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Loại tài sản khảo sát</span></td>
                <td><%=objks.getLoaits()%></td>
            </tr>



            <% if (DATA.function.check_string_null(objks.getPt_loaixe())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Loại xe</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getPt_loaixe())%></td>
            </tr>   
            <%}%>
            <% if (DATA.function.check_string_null(objks.getPt_namsanxuat())) {%>   
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Năm sản xuất</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getPt_namsanxuat())%></td>
            </tr>     
            <%}%> 
            <% if (DATA.function.check_string_null(objks.getPt_noisanxuat())) {%>   
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Nơi sản xuất</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getPt_noisanxuat())%></td>
            </tr>
            <%}%>
            <% if (DATA.function.check_string_null(objks.getPt_bienso())) {%>    
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Biển số</span> </td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getPt_bienso())%></td>
            </tr>
            <%}%> 
            <% if (DATA.function.check_string_null(objks.getPt_mausac())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Màu sắc</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getPt_mausac())%></td>
            </tr>     
            <%}%> 
            <% if (DATA.function.check_string_null(objks.getPt_sokmdachay())) {%> 
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Số KM đã chạy</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getPt_sokmdachay())%></td>
            </tr>     
            <%}%>
            <% if (DATA.function.check_string_null(objks.getPt_thanxe())) {%> 
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Thân xe </span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getPt_thanxe())%></td>
            </tr>     
            <%}%>
            <% if (DATA.function.check_string_null(objks.getPt_loainhieulieu())) {%>   
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Loại nhiên liệu sử dụng</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getPt_loainhieulieu())%></td>
            </tr>    
            <%}%> 
            <% if (DATA.function.check_string_null(objks.getPt_dentruoc())) {%>   
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Đèn pha trước</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getPt_dentruoc())%></td>
            </tr>
            <%}%>
            <% if (DATA.function.check_string_null(objks.getPt_densau())) {%> 
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Đèn pha sau</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getPt_densau())%></td>
            </tr>      
            <%}%>
            <% if (DATA.function.check_string_null(objks.getPt_denphanh())) {%>   
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Đèn phanh</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getPt_denphanh())%></td>
            </tr>      
            <%}%> 
            <% if (DATA.function.check_string_null(objks.getPt_dentinhieu())) {%> 
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Đèn tín hiệu</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getPt_dentinhieu())%></td>
            </tr>     
            <%}%>
            <% if (DATA.function.check_string_null(objks.getPt_thungxe())) {%>   
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Chất liệu thùng xe</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getPt_thungxe())%></td>
            </tr>      
            <%}%> 
            <% if (DATA.function.check_string_null(objks.getPt_taitrong())) {%>   
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Tải trọng</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getPt_taitrong())%></td>
            </tr>
            <%}%>
            <% if (DATA.function.check_string_null(objks.getPt_socho())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Số chổ</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getPt_socho())%></td>
            </tr>
            <%}%> 
            <% if (DATA.function.check_string_null(objks.getPt_khac())) {%>   
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Thông tin khác</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getPt_khac())%></td>
            </tr>
            <%}%>
        </table>        
    </body>
</html>
<%}%>