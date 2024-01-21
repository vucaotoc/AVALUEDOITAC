<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form  role="form"  method="post" id="frmnguoilienhe"  action="hsedit?upkhachlienhe"> 
                <div class="box box-warning">
                    <div class="box-header with-border">           
                        <h4>Thông Tin Người Liên Hệ Khảo Sát</h4>                    
                    </div>
                    <div class="box-body">  
                        <div class="col-lg-4">
                            <label>Họ tên người liên hệ: </label>
                            <input type="text" name="nlhks" maxlength="150" class="form-control" value="<%=objhs.getNguoilienheks()%>" />
                        </div> 
                        <div class="col-lg-4">
                            <label>Số điện thoại:</label>
                            <input type="text" name="nlhsdt" maxlength="49" class="form-control" value="<%=objhs.getNguoilienhesdt()%>"  />
                        </div>     
                        <% if (objhs.getTinhtrang() < DATA.danhsachBIEN._hs_hsDaHuy) {%>
                        <div class="col-lg-2">
                            <label>.</label>
                            <input type="submit"  class="form-control btn btn-success" id="btnttksadd" value="Cập Nhật" >
                            <div class="modal modal-default fade" id="upkhachlienhe">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                            <h4 class="modal-title">Cập nhật báo giá</h4>
                                        </div>
                                        <div class="modal-body">             
                                            <label>Xác nhận đã báo giá cho khách hàng hồ sơ <%=objhs.getMahs()%> </label>
                                            <div id="tbloihtbg"></div>                                           
                                        </div>
                                        <div class="modal-footer">                                   
                                            <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                                            <button type="button" class="btn bg-red pull-right" onclick="uphtbaogia();">Xác Nhận</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>   
                        </div>
                        <%}%>
                    </div>

                </div>
            </form>