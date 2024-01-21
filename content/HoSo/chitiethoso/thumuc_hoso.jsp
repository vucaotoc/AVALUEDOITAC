<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="box box-success">
    <div class="box-header with-border">           
        <h4>Thư Mục <a href="thumucrieng"><span class="badge bg-aqua">quản lý</span> </a> </h4>                    
        <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
            </button>
        </div>
    </div>                
    <div class="box-body table-responsive no-padding">  
      
            <table  class="table table-hover">                 
                <thead>
                    <tr>
                        <th></th>
                        <th></th>                       
                    </tr>
                </thead>
                <tbody> 
                    <%
                        if (session.getAttribute("thumuc_rieng") != null) {
                            ArrayList<objHAPhapLy> arrHA = (ArrayList<objHAPhapLy>) session.getAttribute("thumuc_rieng");
                            if (arrHA.size() > 0) {
                                for (objHAPhapLy obj : arrHA) {
                    %>

                    <tr>                             
                        
                        <td><a href="data/<%=obj.getfullPath()%>" target="_blank"><%=obj.getTenha()%> </a><br/> </td>                  
                        <td> 
                            <a href="upfhoso?down=<%=obj.getIdha()%>" ><span class="badge bg-blue">Tải về</span></a>
                        </td>
                    </tr>

                    <%}
                            }
                        }%>
                </tbody>
            </table>
        </form>
    </div>
</div>
           