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

             <tr>
                <td><span style="font-weight: 700;">Thông số kỷ thuật</span></td>
                <td><%=objks.getMm_thongso()%></td>
            </tr>

            
           

        </table>        
    </body>
</html>
<%}%>