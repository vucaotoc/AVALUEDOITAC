<%@page import="TraCuuHS.objTraCuuHS"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("objtc") != null) {
        objTraCuuHS objtc = (objTraCuuHS) session.getAttribute("objtc");

%>
<style>
    .formHS{
        width: 960px;
        background: #fff;
        border-radius: 10px;
        overflow: hidden;
        display: -webkit-box;
        display: -webkit-flex;
        display: -moz-box;
        display: -ms-flexbox;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        padding: 20px 20px 20px 20px
    }
    .formHS .title{
        width: 100%;
        padding-bottom: 50px;
    }
    .titleimg{
        display: block;
        margin: 0 auto;
    }
    .textTit{
        font-weight: 700;
        color: #0a5e48;        
        margin-left: auto;
        margin-right: auto;
        display: table;
        font-size: 36px;   
        text-align: center;
    }
    .textfooter{ 
        padding:0px 50px;
        width: 100%;
        font-weight: 700;
        color: #0a5e48;
        background: #99d1bd;
        margin-left: auto;
        margin-right: auto;
        display: table;
        font-size: 18px;   
        text-align: center;
    }
    .textfooter span{
        display: block;
        margin: 0 auto;
    }
    .formHS .colTT{
        width: 100%;
        padding-bottom: 10px;
        font-size: 20px;  
        height: 50px;
    }
    .formHS .colTT .colIcon{       
        float: left;
        position: relative;
        top: -10px;
        right: 10px;
        z-index: 0;
        font-size: 90px;
        zoom: 1.0;

    }
    .formHS .colTT .colLable{
        width: 30%;
        float: left;
        line-height: 30px;
    }
    .formHS .colTT .colText{
        width: 40%;
        float: left;
        margin-left: 10px;        
    }


    @media(max-width:992px) {  
        .textTit{            
            font-size: 25px;
        }
    }

    @media(max-width:768px) {

        .formHS .title .textTit{            
            font-size: 25px;
        }
    }

    @media(max-width:576px) {
        .textTit{            
            font-size: 25px;            

        }
    }
</style>


<div class="formHS">

    <div class="col-md-2 col-xs-12">
        <img class="titleimg" src="hinhanh/logo.png" width="100px"  />
    </div>
    <div class="col-md-10 col-xs-12">
        <div class="text-center"> <span class="textTit"> TRA CỨU THÔNG TIN TIẾN ĐỘ HỒ SƠ</span></div>
    </div>               
    <div class="col-md-12 col-xs-12">
        <br/>        
    </div>
    <div class="col-md-6 col-xs-12">
        <label>MÃ HỒ SƠ:</label>
        <input type="text" name="tenkh" class="form-control" value="<%=objtc.getMahs()%>" />                                
    </div>  
    <div class="col-md-6 col-xs-12">
        <label>CHỨNG THƯ:</label>
        <input type="text" name="tenkh" class="form-control" value="<%=objtc.getSoct()%>"  />                                
    </div>  
    <div class="col-md-12 col-xs-12">
        <label>TÀI SẢN:</label>
        <textarea type="text" name="tenkh" class="form-control" cols="2" rows="4"><%=objtc.getTaisan()%></textarea>                                
    </div>  

    <div class="col-md-12 col-xs-12">

        <div class="box-body table-responsive">
            <table id="example1" class="table table-striped">                   
                <thead>
                    <tr>     
                        <th>STT</th>
                        <th>Mục</th>
                        <th>Tình Trạng</th>
                        <th>Thời gian</th>                                
                    </tr>
                </thead>
                <tbody> 
                    <tr>        
                        <th>1</th>
                        <th>KHẢO SÁT</th>                                                   
                        <th><%=objtc.getKs_tt()%></th>
                        <th><%=objtc.getKs_tg()%></th>                                
                    </tr>
                    <tr>        
                        <th>2</th>
                        <th>THẨM ĐỊNH</th>                                                   
                        <th><%=objtc.getTd_tt()%></th>
                        <th><%=objtc.getTd_tg()%></th>                               
                    </tr>
                    <tr>        
                        <th>3</th>
                        <th>CHỨNG THƯ</th>                                                   
                        <th><%=objtc.getCt_tt()%></th>
                        <th><%=objtc.getCt_tg()%></th>                               
                    </tr>
                    <tr>        
                        <th>4</th>
                        <th>GIAO CHỨNG THƯ</th>                                                   
                        <th><%=objtc.getGiaoct_tt()%></th>
                        <th><%=objtc.getGiaoct_tg()%></th>                             
                    </tr>
                </tbody>

            </table>
        </div>
    </div>
    <div class="col-md-12 col-xs-12">
        <div class="textfooter"> 
            <span> 
                Mọi thắc mắc xin vui lòng liên hệ với chúng tôi qua số
                0903082978 - Duy
            </span>
        </div>
    </div>      
    <div class="col-md-12 col-xs-12">
        <br/>
        <a href="tracuuhs" class="btn bg-red-active pull-right" >Quay về</a>           
    </div>
</div>




<%}%>