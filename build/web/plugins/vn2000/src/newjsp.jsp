
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

   <script src="proj4.js" type="text/javascript"></script>
        <script src="vn2000.js" type="text/javascript"></script>
    </head>
    <body>
        <h1>Hello World!</h1>


        <script type="text/javascript">


            console.log(vn2000_to_wgs84(608570.58,1180852.48, 0, 'VN2000_TP_HCM'));
             console.log(wgs84_to_vn2000(106.74421011,10.67650815, 0, 'VN2000_TP_HCM'));

        </script>
    </body>
</html>
