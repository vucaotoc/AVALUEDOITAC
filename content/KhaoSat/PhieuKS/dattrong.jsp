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
           
            <% if (DATA.function.check_string_null(objks.getDt_hinhdang())) {%>  
             <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Hình dáng lô đất</span></td>
                <td><%=objks.getDt_hinhdang()%></td>
            </tr>          
            <%}%>
            <% if (DATA.function.check_string_null(objks.getDt_chieurongmattien())) {%>  
             <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Chiều rộng mặt tiền</span></td>
                <td><%=objks.getDt_chieurongmattien()%></td>
            </tr>         
            <%}%>
            <% if (DATA.function.check_string_null(objks.getDt_huongnha())) {%>  
             <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Hướng nhà</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getDt_huongnha())%></td>
            </tr>         
            <%}%>
            <% if (DATA.function.check_string_null(objks.getDt_duongtruocnha())) {%>  
             <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Đường trước nhà</span></td>
                <td><%=objks.getDt_duongtruocnha()%></td>
            </tr>           
            <%}%>
            <% if (DATA.function.check_string_null(objks.getDt_vitri())) {%>  
             <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Vị trí</span></td>
                <td><%=objks.getDt_vitri()%></td>
            </tr>            
            <%}%>
            <% if (DATA.function.check_string_null(objks.getDt_khac())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Kiến trúc khác thông tin tài sản so sánh</span></td>
                <td><%=objks.getDt_khac()%></td>
            </tr>        
            <%}%>          
        </table>        
    </body>
</html>
<%}%>