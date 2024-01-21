<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //KhaoSat.objKhaoSat objks = (KhaoSat.objKhaoSat) session.getAttribute("ksedit_ks");
%>

<div class="WordSection1" id="WordSection1" style="display: none;">
<p>
        <b> 2.1 Quyền sử dụng đất:</b>
    </p> 
    <table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width="665">
        <thead>
            <tr>
                <td width="20" class="title_box">
                    <p class=MsoNormal align=center><b><span class=text_title>STT</span></b></p>
                </td>
                <td width="145" class="title_box">
                    <p class=MsoNormal align=center><b><span  class=text_title>HẠNG MỤC</span></b></p>
                </td>
                <td width="500" class="title_box">
                    <p class=MsoNormal align=center><b><span  class=text_title>MÔ TẢ CHI TIẾT</span></b></p>
                </td>
            </tr>
        </thead>


        <tr>
            <td>
                <span >1</span>
            </td>
            <td><p><span>Địa chỉ</span></p>
            </td>
            <td ><p><span><%=objks.getDiachits()%></span></p>
            </td>
        </tr>
        <tr >
            <td>
                <span >2</span>
            </td>
            <td>
                <p><span>Vịtrí thửa đất/tòa nhà</span></p>
            </td>
            <td>
                <p><span><%=objks.getNp_vitriTS()%></span></p>
            </td>
        </tr>
        <tr>
            <td>
                <p><span>3</span></p>
            </td>
            <td>
                <p><span>Tọa độ định vị</span></p>
            </td>
            <td><%=objks.getToadomaps()%></td>
        </tr>
        <tr >
            <td>
                <p><span>4</span></p>
            </td>
            <td>
                <p><span>Thửa đất số</span></p>
            </td>
            <td>
                <p><span><%=objks.getNp_sothua()%></span></p>
            </td>
        </tr>
        <tr>
            <td>
                <p><span>5</span></p>
            </td>
            <td>
                <p><span>Tờ bản đồ số</span></p>
            </td>
            <td>
                <p><span><%=objks.getNp_soto()%></span></p>
            </td>
        </tr>
        <tr>
            <td>
                <p><span>6</span></p>
            </td>
            <td>
                <p><span>Mặt cắt đường vào thửa đất/tòa nhà</span></p>
            </td>
            <td>
                <p><span>&nbsp;</span></p>
            </td>
        </tr>
        <tr>
            <td>
                <p><span>-</span></p>
            </td>
            <td>
                <p><span>Lớn nhất</span></p>
            </td>
            <td><%=objks.getNp_dtnlonnhat()%></td>
        </tr>
        <tr >
            <td>
                <p><span>-</span></p>
            </td>
            <td>
                <p><span>Nhỏ nhất</span></p>
            </td>
            <td><%=objks.getNp_dtnnhonhat()%></td>
        </tr>
        <tr >
            <td>
                <p><span>-</span></p>
            </td>            
            <td>
                <p><span>Trước tài sản</span></p>
            </td>
            <td><%=objks.getNp_dtntruocts()%></td>
        </tr>
        <tr >
            <td>
                <p><span>7</span></p>
            </td>
            <td>
                <p><span>Hướng tài sản</span></p>
            </td>
            <td>
                <p><span><%=objks.getNp_huongnha()%></span></p>
            </td>
        </tr>
        <tr >
            <td>
                <p>8</span></p>
            </td>
            <td>
                <p>Các mặt tiếp giáp</span></p>
            </td>
            <td>
                <p><span>&nbsp;</span></p>
            </td>
        </tr>
        <tr >
            <td>
                <p><span>-</span></p>
            </td>
            <td>
                <p><span>Phía trước</span></p>
            </td>
            <td>
                <p><span><%=objks.getNp_tiepgiaptruoc()%></span></p>
            </td>
        </tr>
        <tr >
            <td>
                <p><span>-</span></p>
            </td>
            <td>
                <p><span>Phía sau</span></p>
            </td>
            <td>
                <p><span><%=objks.getNp_tiepgiapsau()%></span></p>
            </td>
        </tr>
        <tr >
            <td>
                <p><span>-</span></p>
            </td>
            <td>
                <p><span>Bên trái</span></p>
            </td>
            <td>
                <p><span><%=objks.getNp_tiepgiaptrai()%></span></p>
            </td>
        </tr>
        <tr >
            <td>
                <p><span>-</span></p>
            </td>
            <td>
                <p><span>Bên phải</span></p>
            </td>
            <td>
                <p><span><%=objks.getNp_tiepgiapphai()%></span></p>
            </td>
        </tr>
        <tr >
            <td>
                <p><span>9</span></p>
            </td>
            <td>
                <p><span>Diện tích thửa đất(m<sup>2</sup>)</span></p>
            </td>
            <td>
                <p><span>&nbsp;</span></p>
            </td>
        </tr>
        <tr >
            <td>
                <p><span>-</span></p>
            </td>
            <td>
                <p><span >Diện tích đất trong quy hoạch (m<sup>2</sup>)</span></p>
            </td>
            <td>
                <p><span><%=objks.getNp_dientichtrongqh()%></span></p>
            </td>
        </tr>
        <tr>
            <td>
                <p><span>-</span></p>
            </td>
            <td>
                <p ><span>Diện tích đất ngoài quy hoạch (m<sup>2</sup>)</span></p>
            </td>
            <td>
                <p><span><%=objks.getNp_dientichngoaiqh()%></span></p>
            </td>
        </tr>
        <tr>
            <td>
                <p><span>10</span></p>
            </td>
            <td>
                <p><span >Kích thước thửa đất (Rộng * Dài * Rộng(đuôi)</span></p>
            </td>
            <td><%=objks.getNp_kichthuoc()%></td>
        </tr>
        <tr>
            <td>
                <p><span>11</span></p>
            </td>
            <td>
                <p><span>Kích thước mặt tiền(m)</span></p>
            </td>
            <td><%=objks.getNp_chieurongmt()%></td>
        </tr>
        <tr>
            <td>
                <p><span>12</span></p>
            </td>
            <td>
                <p><span>Hình dáng</span></p>
            </td>
            <td>
                <p><span><%=objks.getNp_hinhdang()%></span></p>
            </td>
        </tr>
        <tr >
            <td>
                <p><span>13</span></p>
            </td>
            <td

                >
                <p><span>Mục
                        đích sử dụng</span></p>
            </td>
            <td>
                <p><span><%=objks.getNp_mucdich()%></span></p>
            </td>
        </tr>
         <tr >
            <td>
                <p><span>14</span></p>
            </td>
            <td>
                <p><span>Thời
                        hạn sử dụng</span></p>
            </td>
            <td>
                <p><span><%=objks.getNp_thoigiansd()%></span></p>
            </td>
        </tr>
        <tr >
            <td>
                <p><span>15</span></p>
            </td>
            <td>
                <p><span>Nguồn
                        gốc sử dụng đất</span></p>
            </td>
            <td>
                <p><span><%=objks.getNp_nguongoc()%></span></p>
            </td>
        </tr>
        <tr >
            <td>
                <p><span>16</span></p>
            </td>
            <td>
                <p><span>Hình thức sử dụng</span></p>
            </td>
            <td>
                <p><span>&nbsp;</span></p>
            </td>
        </tr>
        <tr >
            <td>
                <p><span>-</span></p>
            </td>
            <td>
                <p><span >Diện tích sử dụng riêng(m<sup>2</sup>)</span></p>
            </td>
            <td>
                <p><span><%=objks.getNp_hinhthucrieng()%></span></p>
            </td>
        </tr>
        <tr >
            <td>
                <p><span>-</span></p>
            </td>
            <td>
                <p><span>Diện tích sử dụng chung(m<sup>2</sup>)</span></p>
            </td>
            <td>
                <p><span><%=objks.getNp_hinhthucchung()%></span></p>
            </td>
        </tr>       
        <tr >
            <td >
                <p><span>17</span></p>
            </td>
            <td>
                <p ><span >Hiện trạng sử dụng</span></p>
            </td>
            <td>
                <p><span ><%=objks.getNp_hientrang()%></span></p>
            </td>
        </tr>
        <tr>
            <td>
                <p><span>18</span></p>
            </td>
            <td>
                <p><span>Thông tin khác</span></p>
            </td>
            <td>
                <p><span><%=objks.getNp_khac()%></span></p>
            </td>
        </tr>
        <tr>
            <td>
                <p><span>19</span></p>
            </td>
            <td>
                <p><span>Hạn chế thửa đất</span></p>
            </td>
            <td>
                <p><span><%=objks.getNp_ghichu()%></span></p>
            </td>
        </tr>        
    </table>
            <p>
        <b> 2.2 Hiện trạng căn hộ chung cư:</b>
    </p>  
            <table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0  width=665>
        <thead>
            <tr>
                <td width="150" class="title_box">
                    <p class=MsoNormal align=center><b><span class=text_title>HẠNG MỤC</span></b></p>
                </td>
                <td width="515" class="title_box">
                    <p class=MsoNormal align=center><b><span  class=text_title>MÔ TẢ CHI TIẾT</span></b></p>
                </td>               
            </tr>
        </thead>  

        <tr >           
            <td colspan="2">
                <P>- Thông tin về công trình xây dựng do Avalue khao sát thực tế tại hiện trường dưới sự hướng dẫn của chủ tài sản.</P>
                <P>- Tại thời điểm thẩm định hiện trạng công trình như sau:</P>
            </td>
        </tr>
        <tr >           
            <td>
                <p><span>NHÀ PHỐ</span></p>
            </td>
            <td>
                <p>
                    <span>
- Nhà: <%=objks.getNp_loaict()%><br/>
- Hiện trạng công trình xây dựng:<%=objks.getNp_hientrang()%> <br/>
- Diện tích xây dựng:<br/>
- Diện tích sàn:<br/>
- Kết cấu:<br/>
    + Móng: <%=objks.getNp_loaimong()%><br/>
    + Tường:<%=objks.getNp_tuong()%><br/>
    + Trần:<%=objks.getNp_tran()%><br/>
    + Sàn:<%=objks.getNp_san()%><br/>
    + Mái:<%=objks.getNp_mai()%><br/>
    + Cửa chính:<%=objks.getNp_cuachinh()%><br/>
    + Cửa phòng:<%=objks.getNp_cuaphong()%><br/>
    + Cửa sổ:<%=objks.getNp_cuaso()%><br/>
    + Cầu thang:<%=objks.getNp_cauthang()%><br/>
    + Nhà vệ sinh:<%=objks.getNp_nhavesinh()%><br/>
    + Tình trạng: Ngoại quan căn hộ còn sử dụng tốt, các kết cấu chính đảm bảo công năng thiết kế kỹ thuật, công trình chưa có dấu hiệu xuống cấp. Công trình hiện đang được sử dụng bình thường.
                    </span>
                </p>
            </td>
        </tr>
       
    </table>


</div>

