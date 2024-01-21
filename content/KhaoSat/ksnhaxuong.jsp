<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-md-12" id='block_NX'>   
    <div class="box box-primary">
        <div class="box-header with-border">           
            <h2>Thông tin chi thiết nhà xưởng</h2>         
            <div class="pull-right box-tools">
                <button type="button" class="btn btn-info btn-sm" data-widget="collapse" data-toggle="tooltip"
                        title="Collapse">
                    <i class="fa fa-minus"></i></button>
                <button type="button" class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip"
                        title="Remove">
                    <i class="fa fa-times"></i></button>
            </div>
        </div>
        <div class="box-body">  
            <div class="form-group col-lg-6">
                <label>Loại công trình:</label>
                <div class="checkbox" style="transform: scale(1.0);">
                    
                    <div class="col-lg-6" style=" padding: 5px 10px;">  
                        <p><input type="checkbox" name="nxloaict" id="nxbv"  value="Nhà bảo vệ"    />Nhà bảo vệ</p>
                        <p><input type="checkbox" name="nxloaict" id="nxtc"value="Trạm cân"   />Trạm cân</p>
                        <p> <input type="checkbox" name="nxloaict" id="nxnx"value="Nhà xưởng"  />Nhà xưởng</p>
                    </div>
                    <div class="col-lg-6" style="padding: 5px 10px;">   
                        <p><input type="checkbox" name="nxloaict" id="nxc" value="Cổng vào"    />Cổng vào</p>
                        <p><input type="checkbox" name="nxloaict" id="nxtb"  value="Tường Bao"   />Tường Bao</p>
                        <p> <input type="checkbox" name="nxloaict" id="nxvp" value="Nhà văn phòng"  />Nhà văn phòng</p>
                    </div>
                </div> 
            </div>
            <div class="form-group col-lg-6" >    
                <label class="text-red"> Ghi chú:</label>
                <div class="box-body pad">                       
                    <textarea class="textarea" placeholder="thông tin ghi chú" name="nxghichu" 
                              style="width: 100%; height: 100px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>

                </div>
            </div>  
            <div class="form-group col-lg-6" id="blnxtuongbao" style="display: none;">      
                <h3 class="text-red">Tường Bao</h3>
                <textarea id="ckNXtuongbao" class="textarea"   rows="50" cols="80" 
                          style="width: 100%; height: 100px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                <input type="hidden" name="nxtuongbao" id="nxtuongbao" value=""/>
            </div>      
            <div class="form-group col-lg-6" id="blnxcong"style="display: none;">      
                <h3 class="text-red">Cổng vào</h3>
                <textarea id="ckNXcongvao" class="textarea"   rows="50" cols="80" 
                          style="width: 100%; height: 100px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                <input type="hidden" name="nxcong" id="nxcong" value=""/>
            </div> 
            <div class="form-group col-lg-6" id="blnxbaove"style="display: none;">      
                <h3 class="text-red">Bảo Vệ</h3>
                <textarea id="ckNXbaove" class="textarea"   rows="50" cols="80" 
                          style="width: 100%; height: 300px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                <input type="hidden" name="nxbaove" id="nxbaove" value=""/>
            </div> 
            <div class="form-group col-lg-6" id="blnxtramcan"style="display: none;">      
                <h3 class="text-red">Trạm Cân</h3>
                <textarea id="ckNXtramcan" class="textarea"   rows="50" cols="80" 
                          style="width: 100%; height: 300px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                <input type="hidden" name="nxtramcan" id="nxtramcan" value=""/>
            </div> 

            <div class="form-group col-lg-6" id="blnxvanphong"style="display: none;">      
                <h3 class="text-red">Văn Phòng</h3>
                <textarea id="ckNXvanphong" class="textarea"   rows="50" cols="80"
                          style="width: 100%; height: 400px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                <input type="hidden" name="nxvanphong" id="nxvanphong" value=""/>
            </div> 
            <div class="form-group col-lg-6" id="blnxnhaxuong"style="display: none;">      
                <h3 class="text-red">Nhà Xưởng</h3>
                <textarea id="ckNXnhaxuong" class="textarea"   rows="50" cols="80"
                          style="width: 100%; height: 400px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                <input type="hidden" name="nxnhaxuong" id="nxnhaxuong" value=""/>
            </div> 
        </div>
    </div>
</div>


<script type="text/javascript">
    $('#nxbv').click(function () {
        if ($(this).is(':checked')) {
            document.getElementById("blnxbaove").style.display = "block";
        } else {
            document.getElementById("blnxbaove").style.display = "none";
        }
    });

    $('#nxtb').click(function () {
        if ($(this).is(':checked')) {
            document.getElementById("blnxtuongbao").style.display = "block";
        } else {
            document.getElementById("blnxtuongbao").style.display = "none";
        }
    });

    $('#nxnx').click(function () {
        if ($(this).is(':checked')) {
            document.getElementById("blnxnhaxuong").style.display = "block";
        } else {
            document.getElementById("blnxnhaxuong").style.display = "none";
        }
    });

    $('#nxvp').click(function () {
        if ($(this).is(':checked')) {
            document.getElementById("blnxvanphong").style.display = "block";
        } else {
            document.getElementById("blnxvanphong").style.display = "none";
        }
    });

    $('#nxtc').click(function () {
        if ($(this).is(':checked')) {
            document.getElementById("blnxtramcan").style.display = "block";
        } else {
            document.getElementById("blnxtramcan").style.display = "none";
        }
    });

    $('#nxc').click(function () {
        if ($(this).is(':checked')) {
            document.getElementById("blnxcong").style.display = "block";
        } else {
            document.getElementById("blnxcong").style.display = "none";
        }
    });

</script>