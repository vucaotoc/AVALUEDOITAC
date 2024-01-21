<%@page contentType="text/html" pageEncoding="UTF-8"%>




<div class="WordSection1" id="WordSection1" style="display: none;">

    <table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width="665">
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
                <p><span><%=objks.getDt_vitriTS()%></span></p>
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
                <p><span><%=objks.getDt_sothua()%></span></p>
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
                <p><span><%=objks.getDt_soto()%></span></p>
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
            <td><%=objks.getDt_dtnlonnhat()%></td>
        </tr>
        <tr >
            <td>
                <p><span>-</span></p>
            </td>
            <td>
                <p><span>Nhỏ nhất</span></p>
            </td>
            <td><%=objks.getDt_dtnnhonhat()%></td>
        </tr>
        <tr >
            <td>
                <p><span>-</span></p>
            </td>            
            <td>
                <p><span>Trước tài sản</span></p>
            </td>
            <td><%=objks.getDt_dtntruocts()%></td>
        </tr>
        <tr >
            <td>
                <p><span>7</span></p>
            </td>
            <td>
                <p><span>Hướng tài sản</span></p>
            </td>
            <td>
                <p><span><%=objks.getDt_huongnha()%></span></p>
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
                <p><span><%=objks.getDt_tiepgiaptruoc()%></span></p>
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
                <p><span><%=objks.getDt_tiepgiapsau()%></span></p>
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
                <p><span><%=objks.getDt_tiepgiaptrai()%></span></p>
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
                <p><span><%=objks.getDt_tiepgiapphai()%></span></p>
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
                <p><span><%=objks.getDt_dientichtrongqh()%></span></p>
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
                <p><span><%=objks.getDt_dientichngoaiqh()%></span></p>
            </td>
        </tr>
        <tr>
            <td>
                <p><span>10</span></p>
            </td>
            <td>
                 <p><span >Kích thước thửa đất (Rộng * Dài * Rộng(đuôi)</span></p>
            </td>
            <td><%=objks.getDt_kichthuoc()%></td>
        </tr>
        <tr>
            <td>
                <p><span>11</span></p>
            </td>
            <td>
                <p><span>Kích thước mặt tiền(m)</span></p>
            </td>
            <td><%=objks.getDt_chieurongmt()%></td>
        </tr>
        <tr>
            <td>
                <p><span>12</span></p>
            </td>
            <td>
                <p><span>Hình dáng</span></p>
            </td>
            <td>
                <p><span><%=objks.getDt_hinhdang()%></span></p>
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
                <p><span><%=objks.getDt_mucdich()%></span></p>
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
                <p><span><%=objks.getDt_thoigiansd()%></span></p>
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
                <p><span><%=objks.getDt_nguongoc()%></span></p>
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
                <p><span><%=objks.getDt_hinhthucrieng()%></span></p>
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
                <p><span><%=objks.getDt_hinhthucchung()%></span></p>
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
                <p><span ><%=objks.getDt_hientrang()%></span></p>
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
                <p><span><%=objks.getDt_khac()%></span></p>
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
                <p><span><%=objks.getDt_ghichu()%></span></p>
            </td>
        </tr>
       
    </table>


</div>

