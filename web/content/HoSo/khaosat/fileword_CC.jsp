<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    //KhaoSat.objKhaoSat objks = (KhaoSat.objKhaoSat) session.getAttribute("ksedit_ks");
%>

<div class="WordSection1" id="WordSection1" style="display: none;">
<p>
        <b> 2.1 Quyền sử dụng đất:</b>
    </p> 
    <table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0  width=665>
        <thead>
            <tr>
                <td width="20" class="title_box">
                    <p class=MsoNormal align=center><b><span class=text_title>STT</span></b></p>
                </td>
                <td width="145" class="title_box">
                    <p class=MsoNormal align=center><b><span  class=text_title>Hạng mục</span></b></p>
                </td>
                <td width="500" class="title_box">
                    <p class=MsoNormal align=center><b><span  class=text_title>Thông tin chi tiết</span></b></p>
                </td>
            </tr>
        </thead>


        <tr>
            <td>
                <span >1</span>
            </td>
            <td><p><span>Mô tả chi tiết địa chỉ tài sản</span></p>
            </td>
            <td ><p><span><%=objks.getCc_mota()%></span></p>
            </td>
        </tr>
        <tr >
            <td>
                <span >2</span>
            </td>
            <td>
                <p><span>Vị trí thửa đất/tòa nhà</span></p>
            </td>
            <td>
                <p><span><%=objks.getCc_vitri()%></span></p>
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
                <p><span><%=objks.getCc_sothua()%></span></p>
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
                <p><span><%=objks.getCc_soto()%></span></p>
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
            <td><%=objks.getCc_dtnlonnhat()%></td>
        </tr>
        <tr >
            <td>
                <p><span>-</span></p>
            </td>
            <td>
                <p><span>Nhỏ nhất</span></p>
            </td>
            <td><%=objks.getCc_dtnnhonhat()%></td>
        </tr>
        <tr >
            <td>
                <p><span>-</span></p>
            </td>            
            <td>
                <p><span>Trước tài sản</span></p>
            </td>
            <td><%=objks.getCc_dtntruocts()%></td>
        </tr>
        <tr >
            <td>
                <p><span>7</span></p>
            </td>
            <td>
                <p><span>Diện tích thửa đất (m<sup>2</sup>)</span></p>
            </td>
            <td>
                <p><span><%=objks.getCc_dientichthua()%></span></p>
            </td>
        </tr>
        <tr >
            <td>
                <p>8</span></p>
            </td>
            <td>
                <p>Mục đích sử dụng</span></p>
            </td>
            <td>
                <p><span><%=objks.getCc_mucdichsd()%></span></p>
            </td>
        </tr>
        <tr >
            <td>
                <p><span>9</span></p>
            </td>
            <td>
                <p><span>Hình thức sử dụng</span></p>
            </td>
            <td>
                <p><span><%=objks.getCc_hinhthucsd()%></span></p>
            </td>
        </tr>
        <tr >
            <td>
                <p><span>10</span></p>
            </td>
            <td>
                <p><span>Thời hạn sử dụng</span></p>
            </td>
            <td>
                <p><span><%=objks.getCc_thoigiansd()%></span></p>
            </td>
        </tr>
        <tr >
            <td>
                <p><span>11</span></p>
            </td>
            <td>
                <p><span>Nguồn gốc sử dụng đất</span></p>
            </td>
            <td>
                <p><span><%=objks.getCc_nguongocsdd()%></span></p>
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
                <p><span>Tên tòa nhà/Chung cư</span></p>
            </td>
            <td>
                <p><span><%=objks.getCc_tentoanha()%></span></p>
            </td>
        </tr>
        <tr>
           
            <td>
                <p><span>Tổng số tầng</span></p>
            </td>
            <td>
                <p><span><%=objks.getCc_tongsotang()%></span></p>
            </td>
        </tr>
        <tr>
           
            <td>
                <p ><span>Tổng số tầng căn hộ</span></p>
            </td>
            <td>
                <p><span><%=objks.getCc_tongsotangcanho()%></span></p>
            </td>
        </tr>
        <tr>            
            <td>
                <p><span >Tổng số tầng hầm</span></p>
            </td>
            <td><%=objks.getCc_tongsoham()%></td>
        </tr>
        <tr>
           
            <td>
                <p><span>Mã căn hộ</span></p>
            </td>
            <td><%=objks.getCc_macanho()%></td>
        </tr>
        <tr>           
            <td>
                <p><span>Tầng căn hộ</span></p>
            </td>
            <td>
                <p><span><%=objks.getCc_tangcanho()%></span></p>
            </td>
        </tr>
        <tr >        
            <td>
                <p><span>Hướng căn hộ</span></p>
            </td>
            <td>
                <p><span><%=objks.getCc_huongview()%></span></p>
            </td>
        </tr>
        <tr>          
            <td>
                <p><span>Diện tích sàn (thông thủy) (m<sub>2</sub>)</span></p>
            </td>
            <td>
                <p><span><%=objks.getCc_dtthongthuy()%></span></p>
            </td>
        </tr>
        <tr >          
            <td>
                <p><span>Diện tích sàn (tim tường)(m<sub>2</sub>)</span></p>
            </td>
            <td>
                <p><span><%=objks.getCc_dttimtuong()%></span></p>
            </td>
        </tr>
        <tr >           
            <td>
                <p><span>Diện tích chổ đậu xe ôtô (m<sub>2</sub>)(nếu có)</span></p>
            </td>
            <td>
                <p><span><%=objks.getCc_dtdauxeoto()%></span></p>
            </td>
        </tr>
       
        <tr >            
            <td>
                <p><span>Hình dáng</span></p>
            </td>
            <td>
                <p><span><%=objks.getCc_hinhdang()%></span></p>
            </td>
        </tr>       
       <tr >           
            <td>
                <p>Các mặt tiếp giáp</span></p>
            </td>
            <td>
                <p><span>&nbsp;</span></p>
            </td>
        </tr>
        <tr >
           
            <td>
                <p><span>Phía trước</span></p>
            </td>
            <td>
                <p><span><%=objks.getCc_tiepgiaptruoc()%></span></p>
            </td>
        </tr>
        <tr >
            
            <td>
                <p><span>Phía sau</span></p>
            </td>
            <td>
                <p><span><%=objks.getCc_tiepgiapsau()%></span></p>
            </td>
        </tr>
        <tr >
           
            <td>
                <p><span>Bên trái</span></p>
            </td>
            <td>
                <p><span><%=objks.getCc_tiepgiaptrai()%></span></p>
            </td>
        </tr>
        <tr >
           
            <td>
                <p><span>Bên phải</span></p>
            </td>
            <td>
                <p><span><%=objks.getCc_tiepgiapphai()%></span></p>
            </td>
        </tr>
        <tr>           
            <td>
                <p><span>Trang thiết bị nội thất</span></p>
            </td>
            <td>
                <p><span><%=objks.getCc_khac()%></span></p>
            </td>
        </tr>
        <tr>           
            <td>
                <p><span>Tình trạng căn hộ</span></p>
            </td>
            <td>
                <p><span><%=objks.getCc_tinhtrang()%></span></p>
            </td>
        </tr>
    </table>


</div>

