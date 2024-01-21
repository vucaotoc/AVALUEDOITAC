<%@page import="NhanVien.objNhanVien"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("kehedit") != null) {
        KeHoachPAK.objKeHoach objks = (KeHoachPAK.objKeHoach) session.getAttribute("kehedit");
        DecimalFormat fmVND = new DecimalFormat("###,###,### VNĐ");
        SimpleDateFormat dtf = new SimpleDateFormat("dd/MM/yyyy");
        objNhanVien avl_login = (objNhanVien) session.getAttribute("avl_login");
        SimpleDateFormat dtf1 = new SimpleDateFormat("dd/MM/yyyy");
        String title = "KeHoach_" + objks.getMahs() + "_" + dtf.format(objks.getNgaylap());
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=title%></title>
    </head>
    <body  onload="window.print();">
        <table style="border: none; margin: 0xp auto;width:810px;height: 200px;font-family: Cambria;">
            <tr>
                <td><img src="../../hinhanh/avalue_logo.jpg" alt=""/></td>

                <td style="text-align: center;font-weight: 700; font-size: 30px;"><p>KẾ HOẠCH THẨM ĐỊNH GIÁ(WFH)</p></td>
            </tr>
        </table>
        <table style="border: none; margin: 0xp auto;width:810px;height: auto;font-family: Cambria;">
            <tr style="height: 40px;" >
                <td style="width: 50%;"><span style="font-weight: 700;"> Mã Hồ Sơ</span></td>
                <td  style="width: 50%;"><%=objks.getMahs()%></td>
            </tr>
            <tr style="height: 40px;" >
                <td style="width: 50%;"><span style="font-weight: 700;"> Số Chứng Thư</span></td>
                <td  style="width: 50%;"><%=objks.getSoct()%></td>
            </tr>
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Ngày Lập</span></td>
                <td><%=dtf.format(objks.getNgaylap())%></td>
            </tr>
            <tr style="height: 20px;">
                <td><span style="font-weight: 700;"></span></td>
                <td>                   
                </td>
            </tr>
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;"></span></td>
                <td>
                    <p>Tên khách hàng:</p>
                    <p style="font-weight: 700; font-size: 16px;text-decoration: underline; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=objks.getTenkh()%></p>
                </td>
            </tr>
            <tr style="height: 20px;">
                <td><span style="font-weight: 700;"></span></td>
                <td>                   
                </td>
            </tr>
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;"></span></td>
                <td>
                    <p>Địa chỉ:</p>
                    <p style="font-weight: 700; font-size: 16px;text-decoration: underline;"> <%=objks.getDiachikh()%></p>
                </td>
            </tr>
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;"></span></td>
                <td>
                    <p>Đối tác ngân hàng/PGD:<span style="font-weight: 700; font-size: 16px;text-decoration: underline;"> <%=objks.getDoitacpgd()%></span></p>                    
                </td>
            </tr>
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;"></span></td>
                <td>
                    <p>Tài sản thẩm định:<span style="font-weight: 700; font-size: 16px;text-decoration: underline;"> <%=objks.getTaisantd()%></span></p>        

                </td>
            </tr>
            <tr style="height: 20px;">
                <td><span style="font-weight: 700;"></span></td>
                <td>                   
                </td>
            </tr>
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;"></span></td>
                <td>
                    <p>Địa chỉ tài sản:</p>
                    <p style="font-weight: 700; font-size: 16px;text-decoration: underline;"><%=objks.getDiachits()%></p>
                </td>
            </tr>
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;"></span></td>
                <td>
                    <p>Mục đích thẩm định:<span style="font-weight: 700; font-size: 16px;text-decoration: underline;"><%=objks.getMucdich()%></span></p>     
                </td>
            </tr>
            <tr style="height: 20px;">
                <td><span style="font-weight: 700;"></span></td>
                <td>                   
                </td>
            </tr>
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;"></span></td>
                <td>
                    <p>Hồ sơ do:</p>
                    <p> Ông (bà): <span style="font-weight: 700; font-size: 16px;text-decoration: underline;"> <%=objks.getPhutrach()%></span> Phụ trách</p>
                    <% if (objks.getPhoihop1().trim().length() > 0) {%>
                    <p> Ông (bà): <span style="font-weight: 700; font-size: 16px;text-decoration: underline;"> <%=objks.getPhoihop1()%></span> Phối hợp thực hiện</p>
                    <%}%>
                    <% if (objks.getPhoihop2().trim().length() > 0) {%>
                    <p> Ông (bà): <span style="font-weight: 700; font-size: 16px;text-decoration: underline;"> <%=objks.getPhoihop2()%></span> Phối hợp thực hiện</p>
                    <%}%>
                </td>
            </tr>
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;"></span></td>
                <td>
                    <p>Thời gian ký hợp đồng:<span style="font-weight: 700; font-size: 16px;text-decoration: underline;"> <%=dtf.format(objks.getThoigiankyhd())%></span></p>     
                </td>
            </tr>
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;"></span></td>
                <td>
                    <p>Giá trị hợp đồng(<%=objks.getGiatrivat()%>):<span style="font-weight: 700; font-size: 16px;text-decoration: underline;"> <%=fmVND.format(objks.getGiatrihd())%></span></p>     
                </td>
            </tr>
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;"></span></td>
                <td>
                    <p>Tỷ lệ chiết khấu:<span style="font-weight: 700; font-size: 16px;text-decoration: underline;"> <%=objks.getChietkhau()%></span></p>     
                </td>
            </tr>
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;"></span></td>
                <td>
                    <p>Thời gian khảo sát hiện trạng:<span style="font-weight: 700; font-size: 16px;text-decoration: underline;"> <%=dtf.format(objks.getThoigianks())%></span></p>     
                </td>
            </tr>
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;"></span></td>
                <td>
                    <p>Thời gian hoàn thành dự kiến:<span style="font-weight: 700; font-size: 16px;text-decoration: underline;"> <%=dtf.format(objks.getThoigianht())%></span></p>     
                </td>
            </tr>

            <tr style="height: 40px;">
                <td><span style="font-weight: 700;"></span></td>
                <td>
                    <p>Vị trí thửa đất:
                        <% if (DATA.function.check_string_null(objks.getVitri())) {%> 
                        <span style="font-weight: 700; font-size: 16px;text-decoration: underline;"> <%=DATA.function.xuly_hienthi_truongKS(objks.getVitri())%></span>
                        <%}%>
                    </p>     
                </td>
            </tr>

            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Giả thiết đặc biệt/loại đất</span></td>
                <td>
                    <p>
                        <% if (DATA.function.check_string_null(objks.getGiathiet())) {%> 
                        <span style="font-weight: 700; font-size: 16px;text-decoration: underline;"> <%=DATA.function.xuly_hienthi_truongKS(objks.getGiathiet())%></span>
                        <%}%>
                    </p>     
                </td>
            </tr>
            <tr style="height: 100px;">
                <td><span style="font-weight: 700;"></span></td>
                <td>                   
                </td>
            </tr>
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;"></span></td>
                <td>
                    <p>Người liên hệ thu hồi công nợ:</p>
                    <p>Ông (bà):<span style="font-weight: 700; font-size: 16px;text-decoration: underline;"><%=objks.getCn_nguoi()%></span></p>  
                    <p>Địa chỉ:<span style="font-weight: 700; font-size: 16px;text-decoration: underline;"><%=objks.getCn_diachi()%></span></p>  
                    <p>Điện thoại:<span style="font-weight: 700; font-size: 16px;text-decoration: underline;"><%=objks.getCn_dienthoai()%></span></p>  
                    <p>Email xuất hóa đơn:<span style="font-weight: 700; font-size: 16px;text-decoration: underline;"><%=objks.getCn_email()%></span></p>  
                </td>
            </tr>
            <tr style="height: 40px;">
                <td><span style="font-weight: 700;">Người phụ trách</span></td>
                <td>
                    <img width="300px" height="200px" src="data:image/png;base64,<%=objks.getChuky()%>" />  
                </td>
            </tr>
        </table>        
    </body>
</html>
<%}%>