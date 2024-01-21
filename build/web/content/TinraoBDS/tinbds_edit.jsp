<%@page import="NhanVien.objNhanVien"%>
<%@page import="TinraoBDS.objTinraoBDS"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="content-wrapper" style="height: auto;">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">

                </div>          
            </div>          
        </div><!-- /.container-fluid -->
    </section>
    <%
        if (session.getAttribute("objTinraoBDS") != null) {
            objTinraoBDS obj = (objTinraoBDS) session.getAttribute("objTinraoBDS");
            String[] arrHA = obj.getHinhanh().split(";");

    %>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">   
                    <div class="card">
                        <div class="card-header with-border">           
                            <h3>Thông tin chi tiết tin đăng <span class="badge bg-green"><%=obj.getIdtin()%></span></h3>
                        </div>

                        <div class="card-body">   
                            <div class="row">  
                                <div class="col-lg-6" >
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="card card-solid">
                                                <div class="card-header with-border">
                                                    <h3 class="card-title">Hình ảnh 

                                                    </h3>
                                                </div>
                                                <!-- /.card-header -->
                                                <div class="card-body">
                                                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                                        <ol class="carousel-indicators">
                                                            <% for (int i = 0; i < arrHA.length; i++) {%>
                                                            <li data-target="#carousel-example-generic" data-slide-to="<%=i%>" class="active"></li>
                                                                <%}%>
                                                        </ol>
                                                        <div class="carousel-inner">
                                                            <% for (int i = 0; i < arrHA.length; i++) { %>
                                                            <div class="carousel-item <% if (i == 0) {%> active<%}%>">                                                            
                                                                <img style="max-height: 600px;" src="data/TINBDS/<%=obj.getChinhanh()%><%=obj.getIdtin()%>/<%=arrHA[i]%>" alt="<%=arrHA[i]%>">
                                                            </div>  
                                                            <% }%>
                                                            <span class="badge bg-white" style="position: absolute;  top: 8px;  left: 16px;font-size:10px;"> ID: <%=obj.getIdtin()%> </span>
                                        
                                        <span class="badge bg-red" style="position: absolute;  top: 8px;  right: 16px;font-size:18px;"> Giá bán: <%=obj.getShowgiaban()%></span>
                                        <span class="badge bg-blue" style="position: absolute;  bottom: 8px;  right: 16px;font-size:18px;" > Điện tích: <%=obj.getDientich()%>m2</span> 
                                                        </div>
                                                        <!-- Left and right controls -->
                                                        <a class="carousel-control-prev" href="#carousel-example-generic" data-slide="prev">
                                                            <span class="carousel-control-prev-icon"></span>
                                                        </a>
                                                        <a class="carousel-control-next" href="#carousel-example-generic" data-slide="next">
                                                            <span class="carousel-control-next-icon"></span>
                                                        </a>
                                                    </div>
                                                </div>
                                                <!-- /.card-body -->
                                            </div>
                                        </div>
                                    </div>
                                </div>  
                                <div class="col-lg-6" >
                                    <div class="row">        
                                        <div class="col-lg-12" >
                                            <div class="card card-solid">
                                                <div class="card-header with-border">
                                                    <h3 class="card-title">Bản đồ</h3>
                                                </div>
                                                <div class="card-body">
                                                    <iframe src="https://avalueapp.com/AVLAPP/tracuuquyhoach?toado=<%=obj.getToadomap()%>" width="100%" height="250px">
                                                    </iframe>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12" >
                                            <div class="card card-solid">
                                                <div class="card-header with-border">
                                                    <h3 class="card-title">
                                                        Mô tả chi tiết
                                                    </h3>
                                                </div>
                                                <div class="card-body">
                                                     <div class="col-lg-12">
                                                        Loại tài sản: <label><%=obj.getLoaihinhbds()%></label>   
                                                    </div>
                                                    <div class="col-lg-12">
                                                        Địa chỉ: <label><%=obj.getFulldiachi()%></label>
                                                    </div>
                                                    <div class="col-lg-12">
                                                        Diện tích: <label><%=obj.getDientich()%></label> m2
                                                    </div>
                                                    <div class="col-lg-12">
                                                        Giá bán: <label><%=obj.getShowgiaban()%></label>
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <%=obj.getMota()%>
                                                    </div>                                                   
                                                    <div class="col-lg-12">
                                                        Người liên hệ: <label><%=obj.getNguoilienhe()%> <%=obj.getSodienthoai()%></label>  

                                                    </div> 
                                                </div>
                                            </div>
                                        </div>  
                                        <input type="hidden" name="idtin" id="idtin" value="<%=obj.getIdtin()%>"/>

                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="card-footer"> 
                        </div>


                    </div>
                </div>        
            </div>
        </div>
    </section>
    <%}%>
</div>



<script type="text/javascript">
    
    
</script>