<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="ChungThu.objChungThu"%>
<%@page import="java.util.ArrayList"%>

<%
    if (session.getAttribute("arrCT") != null) {
        request.setCharacterEncoding("UTF-8");
        String content_title = "Danh Sách Chứng Thư";

       
        ArrayList<objChungThu> arrCT = (ArrayList<objChungThu>) session.getAttribute("arrCT");
        DecimalFormat fmVND = new DecimalFormat("###,###,###");
        SimpleDateFormat dtf = new SimpleDateFormat("dd/MM/yyyy");

        String filename = "AVL_CT_" + new SimpleDateFormat("dd_MM_yyyy").format(new Date());

        response.setDateHeader("Last-Modified", System.currentTimeMillis());
        response.setHeader("Pragma", "no-cache");
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "inline; filename=" + filename + ".xls");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns:v="urn:schemas-microsoft-com:vml"
      xmlns:o="urn:schemas-microsoft-com:office:office"
      xmlns:x="urn:schemas-microsoft-com:office:excel"
      xmlns="http://www.w3.org/TR/REC-html40">

    <head>
        <meta http-equiv=Content-Type content="text/html; charset=UTF-8">
            <meta name=ProgId content=Excel.Sheet>
                <meta name=Generator content="Microsoft Excel 14">
                    <link rel=File-List href="FILE%20M&#7850;U%20moi%20_files/filelist.xml">                        
                        <style id="FILE M&#7850;U moi _5223_Styles">
                            <!--table
                            {mso-displayed-decimal-separator:"\.";
                             mso-displayed-thousand-separator:"\,";}
                            .font55223
                            {color:black;
                             font-size:11.0pt;
                             font-weight:400;
                             font-style:normal;
                             text-decoration:none;
                             font-family:"Times New Roman", serif;
                             mso-font-charset:0;}
                            .xl155223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:11.0pt;
                             font-weight:400;
                             font-style:normal;
                             text-decoration:none;
                             font-family:Calibri, sans-serif;
                             mso-font-charset:163;
                             mso-number-format:General;
                             text-align:general;
                             vertical-align:bottom;
                             mso-background-source:auto;
                             mso-pattern:auto;
                             white-space:nowrap;}
                            .xl715223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:11.0pt;
                             font-weight:400;
                             font-style:normal;
                             text-decoration:none;
                             font-family:Calibri, sans-serif;
                             mso-font-charset:163;
                             mso-number-format:General;
                             text-align:general;
                             vertical-align:bottom;
                             background:#FCE4D6;
                             mso-pattern:black none;
                             white-space:nowrap;}
                            .xl725223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:11.0pt;
                             font-weight:400;
                             font-style:normal;
                             text-decoration:none;
                             font-family:"Times New Roman", serif;
                             mso-font-charset:0;
                             mso-number-format:General;
                             text-align:center;
                             vertical-align:middle;
                             border-top:1.0pt solid #CCCCCC;
                             border-right:1.0pt solid black;
                             border-bottom:none;
                             border-left:1.0pt solid #CCCCCC;
                             background:#FCE4D6;
                             mso-pattern:black none;
                             white-space:normal;}
                            .xl735223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:11.0pt;
                             font-weight:400;
                             font-style:normal;
                             text-decoration:none;
                             font-family:Calibri, sans-serif;
                             mso-font-charset:163;
                             mso-number-format:General;
                             text-align:general;
                             vertical-align:bottom;
                             border:.5pt solid windowtext;
                             background:#F2F2F2;
                             mso-pattern:black none;
                             white-space:nowrap;}
                            .xl745223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:11.0pt;
                             font-weight:400;
                             font-style:normal;
                             text-decoration:none;
                             font-family:Calibri, sans-serif;
                             mso-font-charset:163;
                             mso-number-format:"\@";
                             text-align:general;
                             vertical-align:bottom;
                             border:.5pt solid windowtext;
                             background:#F2F2F2;
                             mso-pattern:black none;
                             white-space:nowrap;}
                            .xl755223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:11.0pt;
                             font-weight:400;
                             font-style:normal;
                             text-decoration:none;
                             font-family:Calibri, sans-serif;
                             mso-font-charset:163;
                             mso-number-format:"Short Date";
                             text-align:general;
                             vertical-align:bottom;
                             border:.5pt solid windowtext;
                             background:#F2F2F2;
                             mso-pattern:black none;
                             white-space:nowrap;}
                            .xl765223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:11.0pt;
                             font-weight:400;
                             font-style:normal;
                             text-decoration:none;
                             font-family:Calibri, sans-serif;
                             mso-font-charset:163;
                             mso-number-format:General;
                             text-align:general;
                             vertical-align:middle;
                             border:.5pt solid windowtext;
                             background:#F2F2F2;
                             mso-pattern:black none;
                             white-space:normal;}
                            .xl775223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:11.0pt;
                             font-weight:400;
                             font-style:normal;
                             text-decoration:none;
                             font-family:Calibri, sans-serif;
                             mso-font-charset:163;
                             mso-number-format:Fixed;
                             text-align:general;
                             vertical-align:bottom;
                             border:.5pt solid windowtext;
                             background:#F2F2F2;
                             mso-pattern:black none;
                             white-space:nowrap;}
                            .xl785223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:11.0pt;
                             font-weight:400;
                             font-style:normal;
                             text-decoration:none;
                             font-family:Calibri, sans-serif;
                             mso-font-charset:163;
                             mso-number-format:"\#\,\#\#0";
                             text-align:general;
                             vertical-align:bottom;
                             border:.5pt solid windowtext;
                             background:#F2F2F2;
                             mso-pattern:black none;
                             white-space:nowrap;}
                            .xl795223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:11.0pt;
                             font-weight:400;
                             font-style:normal;
                             text-decoration:none;
                             font-family:Calibri, sans-serif;
                             mso-font-charset:163;
                             mso-number-format:Percent;
                             text-align:general;
                             vertical-align:bottom;
                             border:.5pt solid windowtext;
                             background:#F2F2F2;
                             mso-pattern:black none;
                             white-space:nowrap;}
                            .xl805223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:11.0pt;
                             font-weight:400;
                             font-style:normal;
                             text-decoration:none;
                             font-family:Calibri, sans-serif;
                             mso-font-charset:163;
                             mso-number-format:General;
                             text-align:general;
                             vertical-align:bottom;
                             border:.5pt solid windowtext;
                             background:yellow;
                             mso-pattern:black none;
                             white-space:nowrap;}
                            .xl815223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:11.0pt;
                             font-weight:400;
                             font-style:normal;
                             text-decoration:none;
                             font-family:Calibri, sans-serif;
                             mso-font-charset:163;
                             mso-number-format:Fixed;
                             text-align:general;
                             vertical-align:bottom;
                             border:.5pt solid windowtext;
                             background:yellow;
                             mso-pattern:black none;
                             white-space:nowrap;}
                            .xl825223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:11.0pt;
                             font-weight:400;
                             font-style:normal;
                             text-decoration:none;
                             font-family:Calibri, sans-serif;
                             mso-font-charset:163;
                             mso-number-format:"\#\,\#\#0";
                             text-align:general;
                             vertical-align:bottom;
                             border:.5pt solid windowtext;
                             background:yellow;
                             mso-pattern:black none;
                             white-space:nowrap;}
                            .xl835223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:11.0pt;
                             font-weight:700;
                             font-style:normal;
                             text-decoration:none;
                             font-family:"Times New Roman", serif;
                             mso-font-charset:0;
                             mso-number-format:General;
                             text-align:center;
                             vertical-align:middle;
                             border-top:1.0pt solid black;
                             border-right:1.0pt solid black;
                             border-bottom:none;
                             border-left:1.0pt solid black;
                             background:#FCE4D6;
                             mso-pattern:black none;
                             white-space:normal;}
                            .xl845223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:11.0pt;
                             font-weight:700;
                             font-style:normal;
                             text-decoration:none;
                             font-family:"Times New Roman", serif;
                             mso-font-charset:0;
                             mso-number-format:General;
                             text-align:center;
                             vertical-align:middle;
                             border-top:none;
                             border-right:1.0pt solid black;
                             border-bottom:none;
                             border-left:1.0pt solid black;
                             background:#FCE4D6;
                             mso-pattern:black none;
                             white-space:normal;}
                            .xl855223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:11.0pt;
                             font-weight:700;
                             font-style:normal;
                             text-decoration:none;
                             font-family:"Times New Roman", serif;
                             mso-font-charset:0;
                             mso-number-format:General;
                             text-align:center;
                             vertical-align:middle;
                             border-top:1.0pt solid black;
                             border-right:none;
                             border-bottom:none;
                             border-left:1.0pt solid black;
                             background:#FCE4D6;
                             mso-pattern:black none;
                             white-space:normal;}
                            .xl865223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:11.0pt;
                             font-weight:700;
                             font-style:normal;
                             text-decoration:none;
                             font-family:"Times New Roman", serif;
                             mso-font-charset:0;
                             mso-number-format:General;
                             text-align:center;
                             vertical-align:middle;
                             border-top:none;
                             border-right:none;
                             border-bottom:none;
                             border-left:1.0pt solid black;
                             background:#FCE4D6;
                             mso-pattern:black none;
                             white-space:normal;}
                            .xl875223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:11.0pt;
                             font-weight:700;
                             font-style:normal;
                             text-decoration:none;
                             font-family:"Times New Roman", serif;
                             mso-font-charset:0;
                             mso-number-format:General;
                             text-align:center;
                             vertical-align:middle;
                             border-top:1.0pt solid black;
                             border-right:none;
                             border-bottom:1.0pt solid black;
                             border-left:1.0pt solid #CCCCCC;
                             background:#FCE4D6;
                             mso-pattern:black none;
                             white-space:normal;}
                            .xl885223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:11.0pt;
                             font-weight:700;
                             font-style:normal;
                             text-decoration:none;
                             font-family:"Times New Roman", serif;
                             mso-font-charset:0;
                             mso-number-format:General;
                             text-align:center;
                             vertical-align:middle;
                             border-top:1.0pt solid black;
                             border-right:none;
                             border-bottom:1.0pt solid black;
                             border-left:none;
                             background:#FCE4D6;
                             mso-pattern:black none;
                             white-space:normal;}
                            .xl895223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:11.0pt;
                             font-weight:700;
                             font-style:normal;
                             text-decoration:none;
                             font-family:"Times New Roman", serif;
                             mso-font-charset:0;
                             mso-number-format:General;
                             text-align:center;
                             vertical-align:middle;
                             border-top:1.0pt solid black;
                             border-right:1.0pt solid #CCCCCC;
                             border-bottom:1.0pt solid black;
                             border-left:none;
                             background:#FCE4D6;
                             mso-pattern:black none;
                             white-space:normal;}
                            .xl905223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:10.0pt;
                             font-weight:400;
                             font-style:normal;
                             text-decoration:none;
                             font-family:Calibri, sans-serif;
                             mso-font-charset:0;
                             mso-number-format:General;
                             text-align:general;
                             vertical-align:middle;
                             border-top:1.0pt solid black;
                             border-right:none;
                             border-bottom:1.0pt solid #CCCCCC;
                             border-left:1.0pt solid black;
                             background:#FCE4D6;
                             mso-pattern:black none;
                             white-space:normal;}
                            .xl915223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:10.0pt;
                             font-weight:400;
                             font-style:normal;
                             text-decoration:none;
                             font-family:Calibri, sans-serif;
                             mso-font-charset:0;
                             mso-number-format:General;
                             text-align:general;
                             vertical-align:middle;
                             border-top:1.0pt solid black;
                             border-right:none;
                             border-bottom:1.0pt solid #CCCCCC;
                             border-left:none;
                             background:#FCE4D6;
                             mso-pattern:black none;
                             white-space:normal;}
                            .xl925223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:10.0pt;
                             font-weight:400;
                             font-style:normal;
                             text-decoration:none;
                             font-family:Calibri, sans-serif;
                             mso-font-charset:0;
                             mso-number-format:General;
                             text-align:general;
                             vertical-align:middle;
                             border-top:1.0pt solid black;
                             border-right:1.0pt solid black;
                             border-bottom:1.0pt solid #CCCCCC;
                             border-left:none;
                             background:#FCE4D6;
                             mso-pattern:black none;
                             white-space:normal;}
                            .xl935223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:11.0pt;
                             font-weight:700;
                             font-style:normal;
                             text-decoration:none;
                             font-family:"Times New Roman", serif;
                             mso-font-charset:0;
                             mso-number-format:General;
                             text-align:center;
                             vertical-align:middle;
                             border-top:1.0pt solid black;
                             border-right:none;
                             border-bottom:1.0pt solid black;
                             border-left:1.0pt solid black;
                             background:#FCE4D6;
                             mso-pattern:black none;
                             white-space:normal;}
                            .xl945223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:11.0pt;
                             font-weight:700;
                             font-style:normal;
                             text-decoration:none;
                             font-family:"Times New Roman", serif;
                             mso-font-charset:0;
                             mso-number-format:General;
                             text-align:center;
                             vertical-align:middle;
                             border-top:1.0pt solid black;
                             border-right:1.0pt solid black;
                             border-bottom:1.0pt solid black;
                             border-left:none;
                             background:#FCE4D6;
                             mso-pattern:black none;
                             white-space:normal;}
                            .xl955223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:10.0pt;
                             font-weight:700;
                             font-style:normal;
                             text-decoration:none;
                             font-family:"Times New Roman", serif;
                             mso-font-charset:0;
                             mso-number-format:General;
                             text-align:center;
                             vertical-align:middle;
                             border-top:1.0pt solid black;
                             border-right:1.0pt solid black;
                             border-bottom:none;
                             border-left:1.0pt solid black;
                             background:#FCE4D6;
                             mso-pattern:black none;
                             white-space:normal;}
                            .xl965223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:10.0pt;
                             font-weight:700;
                             font-style:normal;
                             text-decoration:none;
                             font-family:"Times New Roman", serif;
                             mso-font-charset:0;
                             mso-number-format:General;
                             text-align:center;
                             vertical-align:middle;
                             border-top:none;
                             border-right:1.0pt solid black;
                             border-bottom:none;
                             border-left:1.0pt solid black;
                             background:#FCE4D6;
                             mso-pattern:black none;
                             white-space:normal;}
                            .xl975223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:11.0pt;
                             font-weight:700;
                             font-style:normal;
                             text-decoration:none;
                             font-family:"Times New Roman", serif;
                             mso-font-charset:0;
                             mso-number-format:General;
                             text-align:center;
                             vertical-align:middle;
                             border-top:1.0pt solid #CCCCCC;
                             border-right:1.0pt solid black;
                             border-bottom:none;
                             border-left:1.0pt solid black;
                             background:#FCE4D6;
                             mso-pattern:black none;
                             white-space:normal;}
                            .xl985223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:11.0pt;
                             font-weight:700;
                             font-style:normal;
                             text-decoration:none;
                             font-family:"Times New Roman", serif;
                             mso-font-charset:0;
                             mso-number-format:General;
                             text-align:center;
                             vertical-align:middle;
                             border-top:1.0pt solid #CCCCCC;
                             border-right:none;
                             border-bottom:1.0pt solid black;
                             border-left:1.0pt solid black;
                             background:#FCE4D6;
                             mso-pattern:black none;
                             white-space:normal;}
                            .xl995223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:11.0pt;
                             font-weight:700;
                             font-style:normal;
                             text-decoration:none;
                             font-family:"Times New Roman", serif;
                             mso-font-charset:0;
                             mso-number-format:General;
                             text-align:center;
                             vertical-align:middle;
                             border-top:1.0pt solid #CCCCCC;
                             border-right:none;
                             border-bottom:1.0pt solid black;
                             border-left:none;
                             background:#FCE4D6;
                             mso-pattern:black none;
                             white-space:normal;}
                            .xl1005223
                            {padding:0px;
                             mso-ignore:padding;
                             color:black;
                             font-size:11.0pt;
                             font-weight:700;
                             font-style:normal;
                             text-decoration:none;
                             font-family:"Times New Roman", serif;
                             mso-font-charset:0;
                             mso-number-format:General;
                             text-align:center;
                             vertical-align:middle;
                             border-top:1.0pt solid #CCCCCC;
                             border-right:1.0pt solid black;
                             border-bottom:1.0pt solid black;
                             border-left:none;
                             background:#FCE4D6;
                             mso-pattern:black none;
                             white-space:normal;}
                            -->
                        </style>
                        
                        </head>

                        <body>
                            <!--[if !excel]>&nbsp;&nbsp;<![endif]-->
                            <!--The following information was generated by Microsoft Excel's Publish as Web
                            Page wizard.-->
                            <!--If the same item is republished from Excel, all information between the DIV
                            tags will be replaced.-->
                            <!----------------------------->
                            <!--START OF OUTPUT FROM EXCEL PUBLISH AS WEB PAGE WIZARD -->
                            <!----------------------------->

                            <div id="FILE M&#7850;U moi _5223" align=center x:publishsource="Excel">

                                <table border=0 cellpadding=0 cellspacing=0 width=3177 style='border-collapse:
                                       collapse;table-layout:fixed;width:2384pt'>
                                    <col width=64 span=2 style='width:48pt'>
                                        <col width=69 style='mso-width-source:userset;mso-width-alt:2523;width:52pt'>
                                            <col width=152 style='mso-width-source:userset;mso-width-alt:5558;width:114pt'>
                                                <col width=64 style='width:48pt'>
                                                    <col width=771 style='mso-width-source:userset;mso-width-alt:28196;width:578pt'>
                                                        <col width=64 span=5 style='width:48pt'>
                                                            <col width=421 style='mso-width-source:userset;mso-width-alt:15396;width:316pt'>
                                                                <col width=145 style='mso-width-source:userset;mso-width-alt:5302;width:109pt'>
                                                                    <col width=64 style='width:48pt'>
                                                                        <col width=69 style='mso-width-source:userset;mso-width-alt:2523;width:52pt'>
                                                                            <col width=76 style='mso-width-source:userset;mso-width-alt:2779;width:57pt'>
                                                                                <col width=64 style='width:48pt'>
                                                                                    <col width=114 style='mso-width-source:userset;mso-width-alt:4169;width:86pt'>
                                                                                        <col width=173 style='mso-width-source:userset;mso-width-alt:6326;width:130pt'>
                                                                                            <col width=76 style='mso-width-source:userset;mso-width-alt:2779;width:57pt'>
                                                                                                <col width=64 span=6 style='width:48pt'>
                                                                                                    <col width=87 style='mso-width-source:userset;mso-width-alt:3181;width:65pt'>
                                                                                                        <tr height=20 style='height:15.0pt'>
                                                                                                            <td height=20 class=xl155223 width=64 style='height:15.0pt;width:48pt'></td>
                                                                                                            <td class=xl155223 width=64 style='width:48pt'></td>
                                                                                                            <td class=xl155223 width=69 style='width:52pt'></td>
                                                                                                            <td class=xl155223 width=152 style='width:114pt'></td>
                                                                                                            <td class=xl155223 width=64 style='width:48pt'></td>
                                                                                                            <td width=771 style='width:578pt' align=left valign=top></td>
                                                                                                            <td class=xl155223 width=64 style='width:48pt'></td>
                                                                                                            <td class=xl155223 width=64 style='width:48pt'></td>
                                                                                                            <td class=xl155223 width=64 style='width:48pt'></td>
                                                                                                            <td class=xl155223 width=64 style='width:48pt'></td>
                                                                                                            <td class=xl155223 width=64 style='width:48pt'></td>
                                                                                                            <td class=xl155223 width=421 style='width:316pt'></td>
                                                                                                            <td class=xl155223 width=145 style='width:109pt'></td>
                                                                                                            <td class=xl155223 width=64 style='width:48pt'></td>
                                                                                                            <td class=xl155223 width=69 style='width:52pt'></td>
                                                                                                            <td class=xl155223 width=76 style='width:57pt'></td>
                                                                                                            <td class=xl155223 width=64 style='width:48pt'></td>
                                                                                                            <td class=xl155223 width=114 style='width:86pt'></td>
                                                                                                            <td class=xl155223 width=173 style='width:130pt'></td>
                                                                                                            <td class=xl155223 width=76 style='width:57pt'></td>
                                                                                                            <td class=xl155223 width=64 style='width:48pt'></td>
                                                                                                            <td class=xl155223 width=64 style='width:48pt'></td>
                                                                                                            <td class=xl155223 width=64 style='width:48pt'></td>
                                                                                                            <td class=xl155223 width=64 style='width:48pt'></td>
                                                                                                            <td class=xl155223 width=64 style='width:48pt'></td>
                                                                                                            <td class=xl155223 width=64 style='width:48pt'></td>
                                                                                                            <td class=xl155223 width=87 style='width:65pt'></td>
                                                                                                        </tr>
                                                                                                        <tr height=20 style='height:15.0pt'>
                                                                                                            <td height=20 class=xl155223 style='height:15.0pt'></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                        </tr>
                                                                                                        <tr height=20 style='height:15.0pt'>
                                                                                                            <td height=20 class=xl155223 style='height:15.0pt'></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                        </tr>
                                                                                                        <tr height=20 style='height:15.0pt'>
                                                                                                            <td height=20 class=xl155223 style='height:15.0pt'></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                        </tr>
                                                                                                        <tr height=20 style='height:15.0pt'>
                                                                                                            <td height=20 class=xl155223 style='height:15.0pt'></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                        </tr>
                                                                                                        <tr height=21 style='height:15.75pt'>
                                                                                                            <td height=21 class=xl155223 style='height:15.75pt'></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                            <td class=xl155223></td>
                                                                                                        </tr>
                                                                                                        <tr class=xl715223 height=95 style='mso-height-source:userset;height:71.25pt'>
                                                                                                            <td rowspan=4 height=234 class=xl835223 width=64 style='height:175.5pt;
                                                                                                                width:48pt'>Stt</td>
                                                                                                            <td rowspan=4 class=xl835223 width=64 style='width:48pt'>Mã s&#7889;
                                                                                                                ch&#7913;ng th&#432;</td>
                                                                                                            <td rowspan=4 class=xl835223 width=69 style='width:52pt'>Ngày phát hành
                                                                                                                ch&#7913;ng th&#432;</td>
                                                                                                            <td rowspan=4 class=xl835223 width=152 style='width:114pt'>Tên Khách hàng</td>
                                                                                                            <td rowspan=4 class=xl835223 width=64 style='width:48pt'>Chi nhánh/PGD <br>
                                                                                                                    <font class="font55223">(th&#7921;c hi&#7879;n kho&#7843;n vay cho KH)</font></td>
                                                                                                            <td rowspan=4 class=xl835223 width=771 style='width:578pt'>&#272;&#7883;a
                                                                                                                ch&#7881; B&#272;S Th&#7849;m &#273;&#7883;nh giá <font class="font55223">(ghi
                                                                                                                    chi ti&#7871;t s&#7889; nhà, ngõ, ngách, thôn xóm,…)</font></td>
                                                                                                            <td rowspan=4 class=xl835223 width=64 style='width:48pt'>T&#7881;nh/ Thành
                                                                                                                ph&#7889; <br>
                                                                                                            </td>
                                                                                                            <td rowspan=4 class=xl835223 width=64 style='width:48pt'>Qu&#7853;n/
                                                                                                                Huy&#7879;n</td>
                                                                                                            <td rowspan=4 class=xl835223 width=64 style='width:48pt'>Ph&#432;&#7901;ng/Xã</td>
                                                                                                            <td rowspan=4 class=xl835223 width=64 style='width:48pt'>&#272;&#432;&#7901;ng/ph&#7889;</td>
                                                                                                            <td rowspan=4 class=xl855223 width=64 style='width:48pt'>V&#7883; trí</td>
                                                                                                            <td colspan=16 class=xl875223 width=1673 style='border-right:1.0pt solid #CCCCCC;
                                                                                                                width:1256pt'>K&#7871;t qu&#7843; Th&#7849;m &#273;&#7883;nh giá</td>
                                                                                                        </tr>
                                                                                                        <tr class=xl715223 height=78 style='mso-height-source:userset;height:58.5pt'>
                                                                                                            <td rowspan=3 height=139 class=xl835223 width=421 style='height:104.25pt;
                                                                                                                border-top:none;width:316pt'>Mô t&#7843; B&#272;S<font class="font55223"><br>
                                                                                                                        (v&#7883; trí, chi&#7873;u r&#7897;ng ngõ/ ngách ch&#7895; nh&#7887;
                                                                                                                        nh&#7845;t,…..)</font></td>
                                                                                                            <td colspan=8 class=xl905223 width=781 style='border-right:1.0pt solid black;
                                                                                                                border-left:none;width:587pt'>&nbsp;</td>
                                                                                                            <td colspan=6 class=xl935223 width=384 style='border-right:1.0pt solid black;
                                                                                                                border-left:none;width:288pt'>CTXD TRÊN &#272;&#7844;T</td>
                                                                                                            <td rowspan=3 class=xl835223 width=87 style='border-top:none;width:65pt'>T&#7893;ng
                                                                                                                giá tr&#7883; &#273;&#7883;nh giá (&#273;&#7891;ng)</td>
                                                                                                        </tr>
                                                                                                        <tr class=xl715223 height=21 style='height:15.75pt'>
                                                                                                            <td rowspan=2 height=61 class=xl975223 width=145 style='height:45.75pt;
                                                                                                                border-top:none;width:109pt'>Lo&#7841;i &#273;&#7845;t</td>
                                                                                                            <td colspan=3 class=xl985223 width=209 style='border-right:1.0pt solid black;
                                                                                                                border-left:none;width:157pt'>QSD &#273;&#7845;t &#7903;</td>
                                                                                                            <td colspan=3 class=xl985223 width=351 style='border-right:1.0pt solid black;
                                                                                                                border-left:none;width:264pt'>QSD &#273;&#7845;t khác</td>
                                                                                                            <td rowspan=2 class=xl975223 width=76 style='border-top:none;width:57pt'>Giá
                                                                                                                tr&#7883; QSD &#273;&#7845;t</td>
                                                                                                            <td rowspan=2 class=xl955223 width=64 style='border-top:none;width:48pt'>Lo&#7841;i
                                                                                                                CTXD</td>
                                                                                                            <td rowspan=2 class=xl955223 width=64 style='border-top:none;width:48pt'>Di&#7879;n
                                                                                                                tích</td>
                                                                                                            <td rowspan=2 class=xl955223 width=64 style='border-top:none;width:48pt'>&#272;&#417;n
                                                                                                                giá XD</td>
                                                                                                            <td rowspan=2 class=xl955223 width=64 style='border-top:none;width:48pt'>CLCL</td>
                                                                                                            <td rowspan=2 class=xl955223 width=64 style='border-top:none;width:48pt'>Giá
                                                                                                                tr&#7883; CTXD khác</td>
                                                                                                            <td rowspan=2 class=xl955223 width=64 style='border-top:none;width:48pt'>Giá
                                                                                                                tr&#7883; CTXD</td>
                                                                                                        </tr>
                                                                                                        <tr class=xl715223 height=40 style='height:30.0pt'>
                                                                                                            <td height=40 class=xl725223 width=64 style='height:30.0pt;width:48pt'>Di&#7879;n
                                                                                                                tích (m2)</td>
                                                                                                            <td class=xl725223 width=69 style='width:52pt'>&#272;&#417;n giá
                                                                                                                (&#273;&#7891;ng/m2)</td>
                                                                                                            <td class=xl725223 width=76 style='width:57pt'>Giá tr&#7883;
                                                                                                                (&#273;&#7891;ng)</td>
                                                                                                            <td class=xl725223 width=64 style='width:48pt'>Di&#7879;n tích (m2)</td>
                                                                                                            <td class=xl725223 width=114 style='width:86pt'>&#272;&#417;n giá
                                                                                                                (&#273;&#7891;ng/m2)</td>
                                                                                                            <td class=xl725223 width=173 style='width:130pt'>Giá tr&#7883;
                                                                                                                (&#273;&#7891;ng)</td>
                                                                                                        </tr>
                                                                                                        <!-- bd tu day -->
                                                                                                        <%
                                                                                                            for (int i = 0; i < arrCT.size(); i++) {
                                                                                                                
                                                                                                            System.out.println(i);
                                                                                                        %>

                                                                                                        <tr height=185 style='mso-height-source:userset;height:138.75pt'>
                                                                                                            <td height=185 class=xl735223 align=right style='height:138.75pt;text-align: center;'><%=(i + 1)%></td>
                                                                                                            <td class=xl745223 style='border-left:none'><%=arrCT.get(i).getSoct()%></td>
                                                                                                            <td class=xl755223 align=right style='border-left:none'><%=dtf.format(arrCT.get(i).getNgayphathanh())%></td>
                                                                                                            <td class=xl735223 style='border-left:none'><%=arrCT.get(i).getTenkh()%></td>
                                                                                                            <td class=xl735223 style='border-left:none'><%=arrCT.get(i).getCnpgd()%></td>
                                                                                                            <td class=xl765223 width=771 style='border-left:none;width:578pt'><%=arrCT.get(i).getFulldiachi()%></td>
                                                                                                            <td class=xl735223 style='border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-left:none'><%=arrCT.get(i).getVitri()%></td>
                                                                                                            <td class=xl765223 width=421 style='border-left:none;width:316pt'><%=arrCT.get(i).getMotaBDS()%></td>
                                                                                                            <td class=xl735223 style='border-left:none'><%=arrCT.get(i).getLoaidat()%></td>
                                                                                                            <td class=xl775223 align=right style='border-left:none'><%=arrCT.get(i).getDato_dientich()%></td>
                                                                                                            <td class=xl785223 align=right style='border-left:none'><%=arrCT.get(i).getDato_dongia()%></td>
                                                                                                            <td class=xl735223 align=right style='border-left:none'><%=arrCT.get(i).getDato_giatri()%></td>
                                                                                                            <td class=xl775223 align=right style='border-left:none'><%=arrCT.get(i).getDatkhac_dientich()%></td>
                                                                                                            <td class=xl785223 align=right style='border-left:none'><%=arrCT.get(i).getDatkhac_dongia()%></td>
                                                                                                            <td class=xl735223 align=right style='border-left:none'><%=arrCT.get(i).getDatkhac_giatri()%></td>
                                                                                                            <td class=xl735223 align=right style='border-left:none'><%=arrCT.get(i).getGiatriQSDdat()%></td>
                                                                                                            <td class=xl735223 style='border-left:none'><%=arrCT.get(i).getLoaiCTXD()%></td>
                                                                                                            <td class=xl775223 align=right style='border-left:none'><%=arrCT.get(i).getCTXDdientich()%></td>
                                                                                                            <td class=xl785223 align=right style='border-left:none'><%=arrCT.get(i).getCTXDdongia()%></td>
                                                                                                            <td class=xl795223 align=right style='border-left:none'><%=arrCT.get(i).getCTXDCLCL()%></td>
                                                                                                            <td class=xl735223 align=right style='border-left:none'><%=arrCT.get(i).getCTXDkhac()%></td>
                                                                                                            <td class=xl785223 align=right style='border-left:none'><%=arrCT.get(i).getCTXDgiatri()%></td>
                                                                                                            <td class=xl785223 align=right style='border-left:none'><%=arrCT.get(i).getTonggiatri()%></td>
                                                                                                        </tr>
                                                                                                        <% if (arrCT.get(i).getLoaidat1() != null) {%>
                                                                                                        <tr height=333 style='mso-height-source:userset;height:249.75pt'>
                                                                                                            <td height=333 class=xl735223 style='height:249.75pt;border-top:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'><%=arrCT.get(i).getFulldiachi()%></td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'><%=arrCT.get(i).getMotaBDS()%></td>
                                                                                                            <td class=xl805223 style='border-top:none;border-left:none'><%=arrCT.get(i).getLoaidat1()%></td>
                                                                                                            <td class=xl775223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl785223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl815223 align=right style='border-top:none;border-left:none'><%=arrCT.get(i).getLoaidat1_s()%></td>
                                                                                                            <td class=xl825223 align=right style='border-top:none;border-left:none'><%=arrCT.get(i).getLoaidat1_dg()%></td>
                                                                                                            <td class=xl805223 align=right style='border-top:none;border-left:none'><%=arrCT.get(i).getLoaidat1_gt()%></td>
                                                                                                            <td class=xl805223 align=right style='border-top:none;border-left:none'><%=arrCT.get(i).getLoaidat1_gtqsd()%></td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                        </tr>
                                                                                                        <%}%>       
                                                                                                        <% if (arrCT.get(i).getLoaidat2()!= null) {%>
                                                                                                        <tr height=333 style='mso-height-source:userset;height:249.75pt'>
                                                                                                            <td height=333 class=xl735223 style='height:249.75pt;border-top:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'><%=arrCT.get(i).getFulldiachi()%></td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'><%=arrCT.get(i).getMotaBDS()%></td>
                                                                                                            <td class=xl805223 style='border-top:none;border-left:none'><%=arrCT.get(i).getLoaidat2()%></td>
                                                                                                            <td class=xl775223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl785223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl815223 align=right style='border-top:none;border-left:none'><%=arrCT.get(i).getLoaidat2_s()%></td>
                                                                                                            <td class=xl825223 align=right style='border-top:none;border-left:none'><%=arrCT.get(i).getLoaidat2_dg()%></td>
                                                                                                            <td class=xl805223 align=right style='border-top:none;border-left:none'><%=arrCT.get(i).getLoaidat2_gt()%></td>
                                                                                                            <td class=xl805223 align=right style='border-top:none;border-left:none'><%=arrCT.get(i).getLoaidat2_gtqsd()%></td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                        </tr>
                                                                                                        <%}%>      
                                                                                                        <% if (arrCT.get(i).getLoaidat3()!= null) {%>
                                                                                                        <tr height=333 style='mso-height-source:userset;height:249.75pt'>
                                                                                                            <td height=333 class=xl735223 style='height:249.75pt;border-top:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'><%=arrCT.get(i).getFulldiachi()%></td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'><%=arrCT.get(i).getMotaBDS()%></td>
                                                                                                            <td class=xl805223 style='border-top:none;border-left:none'><%=arrCT.get(i).getLoaidat3()%></td>
                                                                                                            <td class=xl775223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl785223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl815223 align=right style='border-top:none;border-left:none'><%=arrCT.get(i).getLoaidat3_s()%></td>
                                                                                                            <td class=xl825223 align=right style='border-top:none;border-left:none'><%=arrCT.get(i).getLoaidat3_dg()%></td>
                                                                                                            <td class=xl805223 align=right style='border-top:none;border-left:none'><%=arrCT.get(i).getLoaidat3_gt()%></td>
                                                                                                            <td class=xl805223 align=right style='border-top:none;border-left:none'><%=arrCT.get(i).getLoaidat3_gtqsd()%></td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                        </tr>
                                                                                                        <%}%>   
                                                                                                        <% if (arrCT.get(i).getLoaidat1()!= null) {%>
                                                                                                        <tr height=333 style='mso-height-source:userset;height:249.75pt'>
                                                                                                            <td height=333 class=xl735223 style='height:249.75pt;border-top:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'><%=arrCT.get(i).getFulldiachi()%></td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'><%=arrCT.get(i).getMotaBDS()%></td>
                                                                                                            <td class=xl805223 style='border-top:none;border-left:none'><%=arrCT.get(i).getLoaidat4()%></td>
                                                                                                            <td class=xl775223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl785223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl815223 align=right style='border-top:none;border-left:none'><%=arrCT.get(i).getLoaidat4_s()%></td>
                                                                                                            <td class=xl825223 align=right style='border-top:none;border-left:none'><%=arrCT.get(i).getLoaidat4_dg()%></td>
                                                                                                            <td class=xl805223 align=right style='border-top:none;border-left:none'><%=arrCT.get(i).getLoaidat4_gt()%></td>
                                                                                                            <td class=xl805223 align=right style='border-top:none;border-left:none'><%=arrCT.get(i).getLoaidat4_gtqsd()%></td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                            <td class=xl735223 style='border-top:none;border-left:none'>&nbsp;</td>
                                                                                                        </tr>
                                                                                                        <%}%>      
                                                                                                        
                                                                                                        <%}%>
                                                                                                       
                                                                                                        </table>

                                                                                                        </div>


                                                                                                        <!----------------------------->
                                                                                                        <!--END OF OUTPUT FROM EXCEL PUBLISH AS WEB PAGE WIZARD-->
                                                                                                        <!----------------------------->
                                                                                                        </body>

                                                                                                        </html>
                                                                                                        <%}%>