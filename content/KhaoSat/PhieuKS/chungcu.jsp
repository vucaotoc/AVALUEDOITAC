<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("ksedit_ks") != null && session.getAttribute("hsedit_hs") != null) {
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


            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Diện tích thông thủy</span></td>
                <td><%=objks.getCc_dtthongthuy()%></td>
            </tr>

            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Diện tích tim tường:</span></td>
                <td><%=objks.getCc_dttimtuong()%></td>
            </tr>
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Vị trí tầng</span></td>
                <td><%=objks.getCc_vitritang()%></td>
            </tr>
            <% if (DATA.function.check_string_null(objks.getCc_loai())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Loại căn hộ:</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getCc_loai())%></td>
            </tr>
            <%}%>
            <% if (DATA.function.check_string_null(objks.getCc_sophongngu())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Số phòng ngủ:</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getCc_sophongngu())%></td>
            </tr>
            <%}%>
            <% if (DATA.function.check_string_null(objks.getCc_matsan())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Sàn căn hộ:</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getCc_matsan())%></td>
            </tr>
            <%}%>
            <% if (DATA.function.check_string_null(objks.getCc_cuachinh())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Cửa chính căn hộ:</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getCc_cuachinh())%></td>
            </tr>
            <%}%>
            <% if (DATA.function.check_string_null(objks.getCc_cuaphong())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Cửa phòng căn hộ</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getCc_cuaphong())%></td>
            </tr>
            <%}%>
            <% if (DATA.function.check_string_null(objks.getCc_cuaso())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Cửa sổ căn hộ</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getCc_cuaso())%></td>
            </tr>
            <%}%>
            <% if (DATA.function.check_string_null(objks.getCc_cokhuphoido())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Có khu phơi đồ riêng</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getCc_cokhuphoido())%></td>
            </tr>
            <%}%>
            <% if (DATA.function.check_string_null(objks.getCc_huongview())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Hướng view</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getCc_huongview())%></td>
            </tr>
            <%}%>
            <% if (DATA.function.check_string_null(objks.getCc_nhavesinh())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Nhà vệ sinh</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getCc_nhavesinh())%></td>
            </tr>
            <%}%>
            <% if (DATA.function.check_string_null(objks.getCc_chatluongconlai())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Chất lượng còn lại</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getCc_chatluongconlai())%></td>
            </tr>
            <%}%>
            <% if (DATA.function.check_string_null(objks.getCc_khac())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Kiến trúc khác thông tin tài sản so sánh</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getCc_khac())%></td>
            </tr>
            <%}%>

        </table>        
    </body>
</html>
<%}%>