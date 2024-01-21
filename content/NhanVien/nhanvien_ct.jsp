<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if (session.getAttribute("nvedit") != null) {
        NhanVien.objNhanVien objnv = (NhanVien.objNhanVien) session.getAttribute("nvedit");

%>
<section class="content-header">
    <h1>
       THÔNG TIN NHÂN VIÊN  <small>[<%=objnv.getManv()%>] </small>
        <a href="nhanvien"  class="btn btn-warning" >Quay về</a>
    </h1>           
</section>

<div class="row">
    <form  role="form" action="nvedit" method="post" >
        <input type="hidden" value="<%=objnv.getIdnv()%> " name="idnv"/>
        <div class="col-md-12">   
            <div class="box box-warning">
                <div class="box-header with-border">           
                  
                </div>
                <div class="box-body">
                    <div class="form-group">
                        <label>Tên Nhân Viên: </label>
                        <input type="text" name="tennv" class="form-control" value="<%=objnv.getTennv()%> "  />                                
                    </div>  
                    <div class="form-group">
                        <label>Email: </label>
                        <input type="text" name="email" class="form-control" value="<%=objnv.getEmail()%> " />
                    </div> 
                    <div class="form-group">
                        <label>Điện thoại: </label>
                        <input type="text" name="sodt" class="form-control" value="<%=objnv.getSodt()%> " />
                    </div>                   
                    <div class="form-group">
                        <label>Quyền: </label>                       
                        <select class="form-control" name="quyen" id="quyen">
                            <option value="1" <%if (objnv.getQuyen() == 1) {%>selected="" <%}%>>AD</option>
                            <option value="3" <%if (objnv.getQuyen() == 3) {%>selected="" <%}%>>Nhân Viên</option>
                            <option value="2" <%if (objnv.getQuyen() == 2) {%>selected="" <%}%>>Quản Lý</option> 
                            <option value="4" <%if (objnv.getQuyen() == 4) {%>selected="" <%}%>>Hỗ Trợ</option>
                            <option value="5" <%if (objnv.getQuyen() == 5) {%>selected="" <%}%>>Giao Nhận</option>
                        </select>                                                                
                    </div>
                    <div class="form-group">
                        <label>Tên Đang Nhập: </label>
                        <input type="text" name="tendn" class="form-control" value="<%=objnv.getTendn()%> " />                                
                    </div>  
                     <div class="form-group">
                        <label>Link Profile GG Data Studio Embed: </label>
                        <input type="text" name="proembed" class="form-control" value="<%=objnv.getProfile_embed()%> " />
                    </div>     
                    <div class="form-group">
                        <label>Tình Trạng:</label>                       
                        <% if (objnv.getTinhtrang() == 0) {%>
                        <div class="modal modal-default fade" id="lock">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">×</span></button>
                                        <h4 class="modal-title">Cập Nhật</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>Khóa tài khoản nhân viên <%=objnv.getManv()%>-<%=objnv.getTennv()%> ?</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                                        <input type="submit" class="btn bg-maroon" name="lock" value="Khóa Tài Khoản" />
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <span class="text-green">Đang hoạt động</span>
                        <button type="button" class="btn bg-maroon btn-flat margin"  data-toggle="modal" data-target="#lock">Khóa Tài Khoản</button>

                        <%  } else {%>
                        <div class="modal modal-default fade" id="unlock">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">×</span></button>
                                        <h4 class="modal-title">Cập Nhật</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>Mở khóa tài khoản nhân viên <%=objnv.getManv()%>-<%=objnv.getTennv()%> ?</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                                        <input type="submit" class="btn bg-olive" name="unlock" value="Mở Khóa Tài Khoản" />
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <span class="text-red">Đang Khóa</span>
                        <button type="button" class="btn bg-olive btn-flat margin" data-toggle="modal" data-target="#unlock">Mở Khóa Tài Khoản</button>
                        <%  }%>
                    </div>

                </div>

                <div class="box-footer">
                    <div class="modal modal-default fade" id="update">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span></button>
                                    <h4 class="modal-title">Cập Nhật</h4>
                                </div>
                                <div class="modal-body">
                                    <p>Cập nhật thông tin nhân viên <%=objnv.getManv()%>-<%=objnv.getTennv()%> ?</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                                    <input type="submit" class="btn bg-olive" name="capnhat" value="Cập Nhật Thông Tin" />
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>                       
                    <div class="modal modal-default fade" id="matkhau">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span></button>
                                    <h4 class="modal-title">Cập Nhật</h4>
                                </div>
                                <div class="modal-body">
                                    <p>Khởi tạo lại mật khẩu cho nhân viên <%=objnv.getManv()%>-<%=objnv.getTennv()%> ?</p>
                                    <p>Mật khẩu mới là: <input type="text" class="text-red" id="matkhaumoi"></p>
                                </div>
                                <div class="modal-footer">
                                    <input type="hidden" name="mkm" id="mkm"/>
                                    <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                                    <input type="submit" class="btn bg-orange" name="matkhau" value="Reset Mật Khẩu" />
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>                       
                    <button type="button" class="btn bg-green-active btn-flat margin-r-5" data-toggle="modal" data-target="#update">Cập Nhật Thông Tin</button>
                    <button type="button" class="btn bg-orange pull-right" data-toggle="modal" data-target="#matkhau">Reset Mật Khẩu</button>
                </div>
            </div>
        </div>
    </form>



</div>
<script type="text/javascript">
    $('document').ready(function(){
       var mk=taomatkhau(6);
       document.getElementById("mkm").value=mk;
       document.getElementById("matkhaumoi").value=mk;
    });
</script>






<%
    }
%>