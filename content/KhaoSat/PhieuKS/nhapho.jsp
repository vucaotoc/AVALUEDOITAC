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
                <td style="width: 30%;"><img src="hinhanh/avalue_logo.jpg" alt=""/></td>

                <td style="text-align: center;font-weight: 700; font-size: 40px;"><p>BIÊN BẢN KHẢO SÁT</p></td>
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




            <% if (DATA.function.check_string_null(objks.getNp_chieurongmattien())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Chiều rộng mặt tiền</span></td>
                <td><%=objks.getNp_chieurongmattien()%></td>
            </tr>  
            <%}%>
            <% if (DATA.function.check_string_null(objks.getNp_duongtruocnha())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Đường trước nhà</span> </td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getNp_duongtruocnha())%></td>
            </tr>
            <%}%>
            <% if (DATA.function.check_string_null(objks.getNp_vitri())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Vị trí</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getNp_vitri())%></td>
            </tr> 
            <%}%>
            <% if (DATA.function.check_string_null(objks.getNp_loaict())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Loại công trình</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getNp_loaict())%></td>
            </tr> 
            <%}%>
            <% if (DATA.function.check_string_null(objks.getNp_san())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Sân nhà </span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getNp_san())%></td>
            </tr> 
            <%}%>
            <% if (DATA.function.check_string_null(objks.getNp_hinhdang())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Hình dáng lô đất</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getNp_hinhdang())%></td>
            </tr> 
            <%}%> <% if (DATA.function.check_string_null(objks.getNp_huongnha())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Hướng nhà</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getNp_huongnha())%></td>
            </tr>
            <%}%>     

            <% if (DATA.function.check_string_null(objks.getNp_loaimong())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Móng </span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getNp_loaimong())%></td>
            </tr> 
            <%}%>
            <% if (DATA.function.check_string_null(objks.getNp_cong())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Cổng</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getNp_cong())%></td>
            </tr> 
            <%}%>
            <% if (DATA.function.check_string_null(objks.getNp_tuong())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Tường </span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getNp_tuong())%></td>
            </tr>
            <%}%>
            <% if (DATA.function.check_string_null(objks.getNp_tran())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Trần</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getNp_tran())%></td>
            </tr>
            <%}%>
            <% if (DATA.function.check_string_null(objks.getNp_sannha())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Sàn nhà</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getNp_sannha())%></td>
            </tr> 
            <%}%>
            <% if (DATA.function.check_string_null(objks.getNp_cuachinh())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Cửa chính</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getNp_cuachinh())%></td>
            </tr> 
            <%}%>
            <% if (DATA.function.check_string_null(objks.getNp_cuaphong())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Cửa phòng</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getNp_cuaphong())%></td>
            </tr> 
            <%}%>
            <% if (DATA.function.check_string_null(objks.getNp_cuaso())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Cửa sổ</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getNp_cuaso())%></td>
            </tr> 
            <%}%>

            <% if (DATA.function.check_string_null(objks.getNp_mai())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Mái</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getNp_mai())%></td>
            </tr> 
            <%}%>
            <% if (DATA.function.check_string_null(objks.getNp_cauthang())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Cầu thang</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getNp_cauthang())%></td>
            </tr> 
            <%}%>
            <% if (DATA.function.check_string_null(objks.getNp_santhuong())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Sân thượng</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getNp_santhuong())%></td>
            </tr>
            <%}%>
            <% if (DATA.function.check_string_null(objks.getNp_nhavesinh())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Nhà vệ sinh</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getNp_nhavesinh())%></td>
            </tr>
            <%}%>
            <% if (DATA.function.check_string_null(objks.getNp_chatluongconlai())) {%>  
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Chất lượng còn lại</span></td>
                <td><%=DATA.function.xuly_hienthi_truongKS(objks.getNp_chatluongconlai())%></td>
            </tr>
            <%}%>

        </table>        
    </body>
</html>
<%}%>