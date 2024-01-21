<%@page import="DoiTacNH.objDoiTacNH"%>
<%

    request.setCharacterEncoding("UTF-8");
    objDoiTacNH avl_login = null;
    String ti = "";
    if (session.getAttribute("avl_dangnhap") != null) {
        avl_login = (objDoiTacNH) session.getAttribute("avl_dangnhap");
    } else {
        response.sendRedirect("./home");
    }
    ti = (String) request.getAttribute("title_page");
    String title = avl_login.getTencanbo() + " | AVALUE ĐỐI TÁC | " + ti;


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8" />
        <title><%=title%></title>
        <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no" />
        <link rel="apple-touch-icon" sizes="57x57" href="favicon/apple-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="favicon/apple-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="favicon/apple-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="favicon/apple-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="favicon/apple-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="favicon/apple-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="favicon/apple-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="favicon/apple-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-icon-180x180.png">
        <link rel="icon" type="image/png" sizes="192x192"  href="favicon/android-icon-192x192.png">
        <link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="favicon/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
        <link rel="manifest" href="favicon/manifest.json">
        <meta name="msapplication-TileColor" content="#ffffff">
        <meta name="msapplication-TileImage" content="favicon/ms-icon-144x144.png">
        <meta name="theme-color" content="#ffffff">

        <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">


        <link href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" rel="stylesheet" type="text/css"> 
        <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js" type="text/javascript"></script>
        <!-- Load Esri Leaflet from CDN -->
        <script src="https://unpkg.com/esri-leaflet@3.0.2/dist/esri-leaflet.js"
                integrity="sha512-myckXhaJsP7Q7MZva03Tfme/MSF5a6HC2xryjAM4FxPLHGqlh5VALCbywHnzs2uPoF/4G/QVXyYDDSkp5nPfig=="
        crossorigin=""></script>
        <!-- Load Esri Leaflet Geocoder from CDN -->
        <link rel="stylesheet" href="https://unpkg.com/esri-leaflet-geocoder@3.1.1/dist/esri-leaflet-geocoder.css"
              integrity="sha512-IM3Hs+feyi40yZhDH6kV8vQMg4Fh20s9OzInIIAc4nx7aMYMfo+IenRUekoYsHZqGkREUgx0VvlEsgm7nCDW9g=="
              crossorigin="">
        <script src="https://unpkg.com/esri-leaflet-geocoder@3.1.1/dist/esri-leaflet-geocoder.js"
                integrity="sha512-enHceDibjfw6LYtgWU03hke20nVTm+X5CRi9ity06lGQNtC9GkBNl/6LoER6XzSudGiXy++avi1EbIg9Ip4L1w=="
        crossorigin=""></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/leaflet.draw/1.0.4/leaflet.draw.css"/>



        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <link href="dist/css/leaflet-search.css" rel="stylesheet" type="text/css"/>
        <link href="dist/leaflet-measure/leaflet-measure.css" rel="stylesheet" type="text/css"/>

        <link href="dist/leaflet/Leaflet.Control.Opacity/dist/L.Control.Opacity.css" rel="stylesheet" type="text/css"/>
        <script src="dist/leaflet/Leaflet.Control.Opacity/dist/L.Control.Opacity.js" type="text/javascript"></script>

        <script src="bower_components/jquery/dist/jquery.min.js"></script>
        <!-- jQuery UI 1.11.4 -->
        <script src="bower_components/jquery-ui/jquery-ui.min.js"></script>               
        <!-- Bootstrap 3.3.7 -->
        <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="bower_components/fastclick/lib/fastclick.js"></script>
        <!-- AdminLTE App -->
        <script src="dist/js/adminlte.min.js"></script>

        <script src="dist/js/MapsKML.js" type="text/javascript"></script>
        <script src="dist/js/leaflet-search.js" type="text/javascript"></script>
 <script src="https://avalueapp.com/AVLAPP/mymaps/linelongshould.js" type="text/javascript"></script>

        <script src="plugins/vn2000/src/proj4.js" type="text/javascript"></script>
        <script src="plugins/vn2000/src/vn2000.js" type="text/javascript"></script>

        <style>
            body { margin:0; padding:0; z-index: 99;}
            #map { position: absolute; top:0px; bottom:0; right:0; left:0; }

            * {box-sizing: border-box;}

            /* Button used to open the contact form - fixed at the bottom of the page */
            .open-button {
                background-color: #555;
                color: white;
                padding: 16px 20px;
                border: none;
                cursor: pointer;
                opacity: 0.8;
                position: fixed;
                bottom: 23px;
                right: 28px;
                width: 280px;
            }

            /* The popup form - hidden by default */
            .form-popup {
                display: none;
                position: absolute;
                bottom: 0;
                right: 15px;
                border: 3px solid #f1f1f1;
                z-index: 999;
                background: white;
                margin-bottom: 120px;
                height: 100px;
            }

            /* Add styles to the form container */
            .form-container {
                max-width: 300px;
                padding: 10px;
                background-color: white;
            }

            /* Full-width input fields */
            .form-container input[type=text], .form-container input[type=password] {
                width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                border: none;
                background: #f1f1f1;
            }

            /* When the inputs get focus, do something */
            .form-container input[type=text]:focus, .form-container input[type=password]:focus {
                background-color: #ddd;
                outline: none;
            }

            /* Set a style for the submit/login button */
            .form-container .btn {
                background-color: #04AA6D;
                color: white;
                padding: 16px 20px;
                border: none;
                cursor: pointer;
                width: 100%;
                margin-bottom:10px;
                opacity: 0.8;
            }

            /* Add a red background color to the cancel button */
            .form-container .cancel {
                background-color: red;
            }

            /* Add some hover effects to buttons */
            .form-container .btn:hover, .open-button:hover {
                opacity: 1;
            }
        </style>

    </head>
    <body>       
        <div id="map"></div>        
        <div class="form-popup" id="popupright">    
            <label id="thongtintothua"></label>   
        </div>

        <script src="dist/leaflet-measure/leaflet-measure.js" type="text/javascript"></script>   
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAxhsYiWFWuifN-FnDiKZMOcXkNd3YZ4ZY&callback=initMap&libraries=&v=weekly" async></script>
        <script>

            var LeafIcon = L.Icon.extend({options: {
                    iconSize: [40, 40]
                }});
            var Icon2022 = new LeafIcon({iconUrl: 'hinhanh/DL2022.png'}),
                    Icon2021 = new LeafIcon({iconUrl: 'hinhanh/DL2021.png'}),
                    Icon2020 = new LeafIcon({iconUrl: 'hinhanh/DL2020.png'}),
                    Icon2019 = new LeafIcon({iconUrl: 'hinhanh/DL2019.png'}),
                    Icon2018 = new LeafIcon({iconUrl: 'hinhanh/DL2018.png'}),
                    Icon2017 = new LeafIcon({iconUrl: 'hinhanh/DL2017.png'});

            var latitude = <%=request.getAttribute("toadolng")%>;
            var longitude = <%=request.getAttribute("toadolon")%>;
            var Vzoom =<%=request.getAttribute("zoom")%>;
            var map = null;
            var apiarcgis = _apikeyeris;
            function displayLocation(latitude, longitude, strlable) {
                var gg_map_vt = L.tileLayer('http://{s}.google.com/vt/lyrs=s,h,p&x={x}&y={y}&z={z}', {maxZoom: 22, subdomains: ['mt0', 'mt1', 'mt2', 'mt3']}),
                        remap_land = L.tileLayer('https://cdn.remaps.vn/land/{z}/{x}/{y}.png', {maxZoom: 22, maxNativeZoom: 20, opacity: 1, attribution: '', transparent: false}),
                        remap_qg = L.tileLayer('https://tile.remaps.vn/qh/{z}/{x}/{y}.png', {maxZoom: 22, maxNativeZoom: 18, opacity: 0.5, attribution: '', transparent: false}),
                        remap_pro = L.tileLayer('https://cdn.remaps.vn/project/{z}/{x}/{y}.png', {maxZoom: 22, opacity: 1, attribution: '', transparent: false}),
                        gg_map_gt = L.tileLayer('http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}', {maxZoom: 22, subdomains: ['mt0', 'mt1', 'mt2', 'mt3']});



                var baseMaps = {
                    "Vệ Tinh": gg_map_vt,
                    "Giao Thông": gg_map_gt
                };
                var OpacityMaps = {
                    "Quy Hoạch": remap_qg,
                    "Số Thửa": remap_land,
                    "Dự Án": remap_pro
                };
                map = L.map('map', {center: [latitude, longitude], zoom: Vzoom, maxZoom: 22, layers: [gg_map_vt, remap_land, remap_qg, remap_pro]});


                map.doubleClickZoom.disable();

                var searchControl = L.esri.Geocoding.geosearch({
                    position: 'topleft',
                    placeholder: 'Nhập tọa độ google',
                    useMapBounds: false,
                    providers: [L.esri.Geocoding.arcgisOnlineProvider({
                            apikey: apiarcgis, // replace with your api key - https://developers.arcgis.com
                            nearby: {
                                lat: -33.8688,
                                lng: 151.2093
                            }
                        })]
                }).addTo(map);

            <% if (request.getParameter("title") != null) {%>
                L.marker([latitude, longitude]).addTo(map).bindPopup('<%=(String) request.getParameter("title")%>').openPopup();
            <%}%>

                // get geo from click
                var geocodeService2 = L.esri.Geocoding.geocodeService({
                    apikey: apiarcgis
                });

                map.on('dblclick', function (e) {
                    geocodeService2.reverse().latlng(e.latlng).run((err, res) => {
                        if (err)
                        {
                            document.getElementById("popupright").style.display = "none";
                            return;
                        }
                        $.ajax({
                            url: 'tracuuRemap?lat=' + e.latlng,
                            type: 'post',
                            success: function (data) {
                                //console.log(data);
                                var items = [];
                                $.each(data, function (i, item) {
                                    //console.log(item);                                   
                                    //L.polygon(item.polygons[0][0], {color: 'red'}).addTo(map);
                                    var vn2000 = wgs84_to_vn2000(item.polygons[0][0][0][0], item.polygons[0][0][0][1], 0, 'VN2000_TP_HCM');
                                    var lnglon = swaplatlon(item.polygons[0][0]);
                                    //console.log(vn2000);
                                    L.marker(e.latlng, {name: '' + lnglon + ''}).addTo(map).bindPopup(item.address
                                            + "<br/>Tọa độ: "
                                            + item.polygons[0][0][0]
                                            + "<br/>VN2000: "
                                            + vn2000.x
                                            + ","
                                            + vn2000.y
                                            + "<br/>Diện tích: "
                                            + item.area
                                            + "m"
                                            + "<br\><a href=\"#\" onclick=\"xoapolygon('" + lnglon + "');\" >Xóa</a>").openPopup();
                                    var poly = L.polygon(lnglon, {name: '' + lnglon + '', color: 'red', opacity: 0.8}).addTo(map);
                                });
                            },
                            error: function () {

                            }
                        });

                    });
                });

                map.on('click', function (e) {

                    const url = new URL(window.location.href);
                    url.searchParams.set('zoom', map.getZoom());
                    url.searchParams.set('toado', e.latlng.toString().replace("LatLng(", "").replace(")", ""));
                    window.history.replaceState(null, null, url); // or pushState

                });
                map.on('mouseup', function (e) {
                    
                    const url = new URL(window.location.href);
                    url.searchParams.set('zoom', map.getZoom());
                    url.searchParams.set('toado', e.latlng.toString().replace("LatLng(", "").replace(")", ""));
                    window.history.replaceState(null, null, url); // or pushState
                });
                map.on('mousedown', function (e) {
                   
                    const url = new URL(window.location.href);
                    url.searchParams.set('zoom', map.getZoom());
                    url.searchParams.set('toado', e.latlng.toString().replace("LatLng(", "").replace(")", ""));
                    window.history.replaceState(null, null, url); // or pushState
                });
                map.on('mouseover', function (e) {
                    
                    const url = new URL(window.location.href);
                    url.searchParams.set('zoom', map.getZoom());
                    url.searchParams.set('toado', e.latlng.toString().replace("LatLng(", "").replace(")", ""));
                    window.history.replaceState(null, null, url); // or pushState
                });
                map.on('mouseout', function (e) {
                   
                    const url = new URL(window.location.href);
                    url.searchParams.set('zoom', map.getZoom());
                    url.searchParams.set('toado', e.latlng.toString().replace("LatLng(", "").replace(")", ""));
                    window.history.replaceState(null, null, url); // or pushState
                });
                map.on('contextmenu', function (e) {
                  
                    const url = new URL(window.location.href);
                    url.searchParams.set('zoom', map.getZoom());
                    url.searchParams.set('toado', e.latlng.toString().replace("LatLng(", "").replace(")", ""));
                    window.history.replaceState(null, null, url); // or pushState
                });


                map.on("zoomend", function (e) {
                    const url = new URL(window.location.href);
                    url.searchParams.set('zoom', map.getZoom());
                    window.history.replaceState(null, null, url);

                });

                map.doubleClickZoom.disable();

                var results = L.layerGroup().addTo(map);
                searchControl.on('results', function (data) {
                    results.clearLayers();
                    for (var i = data.results.length - 1; i >= 0; i--) {
                        //console.log('ac: ' + data.results[i].latlng);
                        results.addLayer(L.marker(data.results[i].latlng));
                    }
                });
                //thuoc do               
                var measureControl = new L.Control.Measure({position: 'topleft',
                    primaryLengthUnit: 'meters', secondaryLengthUnit: 'kilometers',
                    primaryAreaUnit: 'meters'});
                measureControl.addTo(map);
                L.control.layers(baseMaps, OpacityMaps).addTo(map);
                L.control.opacity(OpacityMaps, {position: 'bottomright', label: '', collapsed: false}).addTo(map);
                //console.log('lnt: '+strlable);
                if (strlable.length > 0) {
                    L.marker([latitude, longitude]).addTo(map)
                            .bindPopup(strlable)
                            .openPopup();
                }

            }
            ; //display end


            displayLocation(latitude, longitude, "");


            function swaplatlon(array) {
                var result = [];
                for (var ii = 0; ii < array.length; ii++) {
                    result.push([array[ii][1], array[ii][0]]);
                }
                return result;
            }
            function xoapolygon(lnglon) {
                map.eachLayer(function (layer) {
                    if (layer instanceof L.Polygon && layer.options.name === lnglon) {
                        map.removeLayer(layer);
                    }
                    if (layer instanceof L.Marker && layer.options.name === lnglon) {
                        map.removeLayer(layer);
                    }
                });
            }
            function check_undefined(str) {
                if (typeof (str) === 'undefined')
                {
                    return '';
                } else {
                    return str;
                }
            }
        </script>
        <!-- End script -->

    </body>
</html>