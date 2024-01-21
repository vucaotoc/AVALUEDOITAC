<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<option value="">Vui lòng chọn Tỉnh/TP</option>
<option value="Cục Cảnh Sát quản lý hành chính về TTXH">Cục Cảnh Sát quản lý hành chính về TTXH</option>
<option value="Cục Cảnh Sát ĐKQLCT và DLQG về dân cư">Cục Cảnh Sát ĐKQLCT và DLQG về dân cư</option>
<% if(session.getAttribute("all_province")!=null) {    
    ArrayList<DiaChi.objDiaChi> arr= (ArrayList<DiaChi.objDiaChi>)session.getAttribute("all_province");
    for(DiaChi.objDiaChi dc: arr)
    {%>
    <option value="<%=dc.getNamepro()%>" alt="<%=dc.getProvince_id()%>" ><%=dc.getNamepro()%></option>
   <%}
}%>