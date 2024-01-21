<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="box-body table-responsive no-padding">
                        <table id="example1" class="table table-bordered table-striped">                   
                            <thead>
                                <tr>                                      
                                    <th >Loại Tài Sản</th>
                                    <th >Địa Chỉ</th>
                                    <th >Giá Sơ Bộ</th>  
                                    <th>Ghi chú</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>  
                                <% for (int i = 0; i < arrts.size(); i++) {%>                                
                                <tr>  
                                    <td><%=arrts.get(i).getLoaits()%></td>
                                    <td><%=arrts.get(i).getFullDiaChi()%> </td>
                                    <td><%=arrts.get(i).getNotegia()%></td>
                                    <td><span class="text-red text-"><b> <%=arrts.get(i).getGhichu()%></b></span></td>
                                    <td style="width:10%;">
                                        <a type="submit" href="taisan?id=<%=arrts.get(i).getIdts()%>"><span class="badge bg-info">Chi tiết</span></a>
                                        <% if (arrts.get(i).getDakhaosat() == 0
                                                    && (avl_login.getIdnv() == objhs.getIdnvks()
                                                    || avl_login.getQuyen() == DATA.phanquyen._nhom_per_manager
                                                    || avl_login.getQuyen() == DATA.phanquyen._nhom_per_admin)) {%> 
                                        <a href="ksadd?cre=<%=arrts.get(i).getIdts()%>"><span style="margin-top: 10px;" class="badge bg-yellow">Tạo Phiếu KS</span></a> 
                                        <%} else if (arrts.get(i).getDakhaosat() > 0) {%>
                                        <a href="khaosat?id=<%=arrts.get(i).getDakhaosat()%>" ><span  style="margin-top: 10px;" class="badge bg-green">Xem Phiếu KS</span></a> 
                                        <%}%>
                                        <a href="taisan?tsimage"  ><span  style="margin-top: 10px;" class="badge bg-blue">Hình Ảnh</span></a> 
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>                        
                        </table>
                    </div>