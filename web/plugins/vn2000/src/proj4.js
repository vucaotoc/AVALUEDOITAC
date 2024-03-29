(function(B, w) {
    "object" === typeof exports && "undefined" !== typeof module ? module.exports = w() : "function" === typeof define && define.amd ? define(w) : B.proj4 = w()
})(this, function() {
    function B(a, b) {
        if (a[b]) return a[b];
        for (var c = Object.keys(a), d = b.toLowerCase().replace(na, ""), e = -1, f, g; ++e < c.length;)
            if (f = c[e], g = f.toLowerCase().replace(na, ""), g === d) return a[f]
    }

    function w(a) {
        if ("string" !== typeof a) throw Error("not a string");
        this.text = a.trim();
        this.place = this.level = 0;
        this.root = null;
        this.stack = [];
        this.currentObject =
            null;
        this.state = 1
    }

    function oa(a, b, c) {
        Array.isArray(b) && (c.unshift(b), b = null);
        c = c.reduce(function(d, e) {
            H(e, d);
            return d
        }, b ? {} : a);
        b && (a[b] = c)
    }

    function H(a, b) {
        if (Array.isArray(a)) {
            var c = a.shift();
            "PARAMETER" === c && (c = a.shift());
            if (1 === a.length) Array.isArray(a[0]) ? (b[c] = {}, H(a[0], b[c])) : b[c] = a[0];
            else if (a.length)
                if ("TOWGS84" === c) b[c] = a;
                else if ("AXIS" === c) c in b || (b[c] = []), b[c].push(a);
            else {
                Array.isArray(c) || (b[c] = {});
                var d;
                switch (c) {
                    case "UNIT":
                    case "PRIMEM":
                    case "VERT_DATUM":
                        b[c] = {
                            name: a[0].toLowerCase(),
                            convert: a[1]
                        };
                        3 === a.length && H(a[2], b[c]);
                        break;
                    case "SPHEROID":
                    case "ELLIPSOID":
                        b[c] = {
                            name: a[0],
                            a: a[1],
                            rf: a[2]
                        };
                        4 === a.length && H(a[3], b[c]);
                        break;
                    case "PROJECTEDCRS":
                    case "PROJCRS":
                    case "GEOGCS":
                    case "GEOCCS":
                    case "PROJCS":
                    case "LOCAL_CS":
                    case "GEODCRS":
                    case "GEODETICCRS":
                    case "GEODETICDATUM":
                    case "EDATUM":
                    case "ENGINEERINGDATUM":
                    case "VERT_CS":
                    case "VERTCRS":
                    case "VERTICALCRS":
                    case "COMPD_CS":
                    case "COMPOUNDCRS":
                    case "ENGINEERINGCRS":
                    case "ENGCRS":
                    case "FITTED_CS":
                    case "LOCAL_DATUM":
                    case "DATUM":
                        a[0] = ["name", a[0]];
                        oa(b, c, a);
                        break;
                    default:
                        for (d = -1; ++d < a.length;)
                            if (!Array.isArray(a[d])) return H(a, b[c]);
                        return oa(b, c, a)
                }
            } else b[c] = !0
        } else b[a] = !0
    }

    function E(a) {
        return .017453292519943295 * a
    }

    function Ja(a) {
        function b(g) {
            return g * (a.to_meter || 1)
        }
        "GEOGCS" === a.type ? a.projName = "longlat" : "LOCAL_CS" === a.type ? (a.projName = "identity", a.local = !0) : a.projName = "object" === typeof a.PROJECTION ? Object.keys(a.PROJECTION)[0] : a.PROJECTION;
        if (a.AXIS) {
            for (var c = "", d = 0, e = a.AXIS.length; d < e; ++d) {
                var f = a.AXIS[d][0].toLowerCase(); -
                1 !== f.indexOf("north") ? c += "n" : -1 !== f.indexOf("south") ? c += "s" : -1 !== f.indexOf("east") ? c += "e" : -1 !== f.indexOf("west") && (c += "w")
            }
            2 === c.length && (c += "u");
            3 === c.length && (a.axis = c)
        }
        a.UNIT && (a.units = a.UNIT.name.toLowerCase(), "metre" === a.units && (a.units = "meter"), a.UNIT.convert && ("GEOGCS" === a.type ? a.DATUM && a.DATUM.SPHEROID && (a.to_meter = a.UNIT.convert * a.DATUM.SPHEROID.a) : a.to_meter = a.UNIT.convert));
        c = a.GEOGCS;
        "GEOGCS" === a.type && (c = a);
        if (c) {
            a.datumCode = c.DATUM ? c.DATUM.name.toLowerCase() : c.name.toLowerCase();
            "d_" ===
            a.datumCode.slice(0, 2) && (a.datumCode = a.datumCode.slice(2));
            if ("new_zealand_geodetic_datum_1949" === a.datumCode || "new_zealand_1949" === a.datumCode) a.datumCode = "nzgd49";
            if ("wgs_1984" === a.datumCode || "world_geodetic_system_1984" === a.datumCode) "Mercator_Auxiliary_Sphere" === a.PROJECTION && (a.sphere = !0), a.datumCode = "wgs84";
            "_ferro" === a.datumCode.slice(-6) && (a.datumCode = a.datumCode.slice(0, -6));
            "_jakarta" === a.datumCode.slice(-8) && (a.datumCode = a.datumCode.slice(0, -8));
            ~a.datumCode.indexOf("belge") && (a.datumCode =
                "rnb72");
            c.DATUM && c.DATUM.SPHEROID && (a.ellps = c.DATUM.SPHEROID.name.replace("_19", "").replace(/[Cc]larke_18/, "clrk"), "international" === a.ellps.toLowerCase().slice(0, 13) && (a.ellps = "intl"), a.a = c.DATUM.SPHEROID.a, a.rf = parseFloat(c.DATUM.SPHEROID.rf, 10));
            c.DATUM && c.DATUM.TOWGS84 && (a.datum_params = c.DATUM.TOWGS84);
            ~a.datumCode.indexOf("osgb_1936") && (a.datumCode = "osgb36");
            ~a.datumCode.indexOf("osni_1952") && (a.datumCode = "osni52");
            if (~a.datumCode.indexOf("tm65") || ~a.datumCode.indexOf("geodetic_datum_of_1965")) a.datumCode =
                "ire65";
            "ch1903+" === a.datumCode && (a.datumCode = "ch1903");
            ~a.datumCode.indexOf("israel") && (a.datumCode = "isr93")
        }
        a.b && !isFinite(a.b) && (a.b = a.a);
        [
            ["standard_parallel_1", "Standard_Parallel_1"],
            ["standard_parallel_2", "Standard_Parallel_2"],
            ["false_easting", "False_Easting"],
            ["false_northing", "False_Northing"],
            ["central_meridian", "Central_Meridian"],
            ["latitude_of_origin", "Latitude_Of_Origin"],
            ["latitude_of_origin", "Central_Parallel"],
            ["scale_factor", "Scale_Factor"],
            ["k0", "scale_factor"],
            ["latitude_of_center",
                "Latitude_Of_Center"
            ],
            ["latitude_of_center", "Latitude_of_center"],
            ["lat0", "latitude_of_center", E],
            ["longitude_of_center", "Longitude_Of_Center"],
            ["longitude_of_center", "Longitude_of_center"],
            ["longc", "longitude_of_center", E],
            ["x0", "false_easting", b],
            ["y0", "false_northing", b],
            ["long0", "central_meridian", E],
            ["lat0", "latitude_of_origin", E],
            ["lat0", "standard_parallel_1", E],
            ["lat1", "standard_parallel_1", E],
            ["lat2", "standard_parallel_2", E],
            ["azimuth", "Azimuth"],
            ["alpha", "azimuth", E],
            ["srsCode", "name"]
        ].forEach(function(g) {
            var h =
                g[0],
                k = g[1];
            !(h in a) && k in a && (a[h] = a[k], 3 === g.length && (a[h] = g[2](a[h])))
        });
        a.long0 || !a.longc || "Albers_Conic_Equal_Area" !== a.projName && "Lambert_Azimuthal_Equal_Area" !== a.projName || (a.long0 = a.longc);
        a.lat_ts || !a.lat1 || "Stereographic_South_Pole" !== a.projName && "Polar Stereographic (variant B)" !== a.projName || (a.lat0 = .017453292519943295 * (0 < a.lat1 ? 90 : -90), a.lat_ts = a.lat1)
    }

    function u(a) {
        var b = this;
        if (2 === arguments.length) {
            var c = arguments[1];
            "string" === typeof c ? "+" === c.charAt(0) ? u[a] = ea(arguments[1]) : u[a] =
                pa(arguments[1]) : u[a] = c
        } else if (1 === arguments.length) {
            if (Array.isArray(a)) return a.map(function(d) {
                Array.isArray(d) ? u.apply(b, d) : u(d)
            });
            if ("string" === typeof a) {
                if (a in u) return u[a]
            } else "EPSG" in a ? u["EPSG:" + a.EPSG] = a : "ESRI" in a ? u["ESRI:" + a.ESRI] = a : "IAU2000" in a ? u["IAU2000:" + a.IAU2000] = a : console.log(a)
        }
    }

    function Ka(a) {
        return La.some(function(b) {
            return -1 < a.indexOf(b)
        })
    }

    function Ma(a) {
        if ("string" === typeof a) {
            if (a in u) return u[a];
            if (Ka(a)) {
                a = pa(a);
                var b;
                b = (b = B(a, "authority")) ? (b = B(b, "epsg")) && -1 < Na.indexOf(b) :
                    void 0;
                if (b) return u["EPSG:3857"];
                b = (b = B(a, "extension")) ? B(b, "proj4") : void 0;
                return b ? ea(b) : a
            }
            if ("+" === a[0]) return ea(a)
        } else return a
    }

    function qa(a) {
        return a
    }

    function ra(a, b) {
        var c = T.length;
        if (!a.names) return console.log(b), !0;
        T[c] = a;
        a.names.forEach(function(d) {
            U[d.toLowerCase()] = c
        });
        return this
    }

    function Oa(a, b, c, d) {
        c = a * a;
        b *= b;
        var e = (c - b) / c,
            f = 0;
        d ? (a *= 1 - e * (.16666666666666666 + e * (.04722222222222222 + .022156084656084655 * e)), c = a * a, e = 0) : f = Math.sqrt(e);
        return {
            es: e,
            e: f,
            ep2: (c - b) / b
        }
    }

    function Pa(a, b, c, d, e) {
        a ||
            ((c = B(fa, d)) || (c = Qa), a = c.a, b = c.b, c = c.rf);
        c && !b && (b = (1 - 1 / c) * a);
        if (0 === c || 1E-10 > Math.abs(a - b)) e = !0, b = a;
        return {
            a: a,
            b: b,
            rf: c,
            sphere: e
        }
    }

    function Ra(a, b, c, d, e, f) {
        var g = {};
        g.datum_type = void 0 === a || "none" === a ? 5 : 4;
        if (b) {
            g.datum_params = b.map(parseFloat);
            if (0 !== g.datum_params[0] || 0 !== g.datum_params[1] || 0 !== g.datum_params[2]) g.datum_type = 1;
            3 < g.datum_params.length && (0 !== g.datum_params[3] || 0 !== g.datum_params[4] || 0 !== g.datum_params[5] || 0 !== g.datum_params[6]) && (g.datum_type = 2, g.datum_params[3] *= 4.84813681109536E-6,
                g.datum_params[4] *= 4.84813681109536E-6, g.datum_params[5] *= 4.84813681109536E-6, g.datum_params[6] = g.datum_params[6] / 1E6 + 1)
        }
        g.a = c;
        g.b = d;
        g.es = e;
        g.ep2 = f;
        return g
    }

    function C(a, b) {
        if (!(this instanceof C)) return new C(a);
        b = b || function(h) {
            if (h) throw h;
        };
        var c = Ma(a);
        if ("object" !== typeof c) b(a);
        else {
            var d = C.projections.get(c.projName);
            if (d) {
                if (c.datumCode && "none" !== c.datumCode) {
                    var e = B(Sa, c.datumCode);
                    e && (c.datum_params = e.towgs84 ? e.towgs84.split(",") : null, c.ellps = e.ellipse, c.datumName = e.datumName ? e.datumName :
                        c.datumCode)
                }
                c.k0 = c.k0 || 1;
                c.axis = c.axis || "enu";
                c.ellps = c.ellps || "wgs84";
                e = Pa(c.a, c.b, c.rf, c.ellps, c.sphere);
                var f = Oa(e.a, e.b, e.rf, c.R_A),
                    g = c.datum || Ra(c.datumCode, c.datum_params, e.a, e.b, f.es, f.ep2);
                sa(this, c);
                sa(this, d);
                this.a = e.a;
                this.b = e.b;
                this.rf = e.rf;
                this.sphere = e.sphere;
                this.es = f.es;
                this.e = f.e;
                this.ep2 = f.ep2;
                this.datum = g;
                this.init();
                b(null, this)
            } else b(a)
        }
    }

    function ta(a, b, c) {
        var d = a.x,
            e = a.y,
            f = a.z ? a.z : 0;
        if (e < -m && e > -1.001 * m) e = -m;
        else if (e > m && e < 1.001 * m) e = m;
        else {
            if (e < -m) return {
                x: -Infinity,
                y: -Infinity,
                z: a.z
            };
            if (e > m) return {
                x: Infinity,
                y: Infinity,
                z: a.z
            }
        }
        d > Math.PI && (d -= 2 * Math.PI);
        a = Math.sin(e);
        e = Math.cos(e);
        c /= Math.sqrt(1 - b * a * a);
        return {
            x: (c + f) * e * Math.cos(d),
            y: (c + f) * e * Math.sin(d),
            z: (c * (1 - b) + f) * a
        }
    }

    function ua(a, b, c, d) {
        var e = a.x;
        var f = a.y;
        var g = a.z ? a.z : 0;
        d = Math.sqrt(e * e + f * f);
        var h = Math.sqrt(e * e + f * f + g * g);
        if (1E-12 > d / c) {
            if (e = 0, 1E-12 > h / c) return {
                x: a.x,
                y: a.y,
                z: a.z
            }
        } else e = Math.atan2(f, e);
        a = g / h;
        h = d / h;
        var k = 1 / Math.sqrt(1 - b * (2 - b) * h * h);
        f = h * (1 - b) * k;
        var l = a * k;
        var p = 0;
        do {
            p++;
            var r = c / Math.sqrt(1 - b * l * l);
            var y = d * f + g *
                l - r * (1 - b * l * l);
            r = b * r / (r + y);
            k = 1 / Math.sqrt(1 - r * (2 - r) * h * h);
            r = h * (1 - r) * k;
            k *= a;
            var z = k * f - r * l;
            f = r;
            l = k
        } while (1E-24 < z * z && 30 > p);
        return {
            x: e,
            y: Math.atan(k / Math.abs(r)),
            z: y
        }
    }

    function V(a) {
        return 1 === a || 2 === a
    }

    function va(a) {
        if ("function" === typeof Number.isFinite) {
            if (Number.isFinite(a)) return;
            throw new TypeError("coordinates must be finite numbers");
        }
        if ("number" !== typeof a || a !== a || !isFinite(a)) throw new TypeError("coordinates must be finite numbers");
    }

    function W(a, b, c) {
        Array.isArray(c) && (c = wa(c));
        var d = c;
        va(d.x);
        va(d.y);
        a.datum && b.datum && ((1 === a.datum.datum_type || 2 === a.datum.datum_type) && "WGS84" !== b.datumCode || (1 === b.datum.datum_type || 2 === b.datum.datum_type) && "WGS84" !== a.datumCode) && (d = new C("WGS84"), c = W(a, d, c), a = d);
        "enu" !== a.axis && (c = xa(a, !1, c));
        if ("longlat" === a.projName) c = {
            x: .017453292519943295 * c.x,
            y: .017453292519943295 * c.y,
            z: c.z || 0
        };
        else if (a.to_meter && (c = {
                x: c.x * a.to_meter,
                y: c.y * a.to_meter,
                z: c.z || 0
            }), c = a.inverse(c), !c) return;
        a.from_greenwich && (c.x += a.from_greenwich);
        d = a.datum;
        a = b.datum;
        if (!((d.datum_type !==
                    a.datum_type ? 0 : d.a !== a.a || 5E-11 < Math.abs(d.es - a.es) ? 0 : 1 === d.datum_type ? d.datum_params[0] === a.datum_params[0] && d.datum_params[1] === a.datum_params[1] && d.datum_params[2] === a.datum_params[2] : 2 === d.datum_type ? d.datum_params[0] === a.datum_params[0] && d.datum_params[1] === a.datum_params[1] && d.datum_params[2] === a.datum_params[2] && d.datum_params[3] === a.datum_params[3] && d.datum_params[4] === a.datum_params[4] && d.datum_params[5] === a.datum_params[5] && d.datum_params[6] === a.datum_params[6] : 1) || 5 === d.datum_type || 5 ===
                a.datum_type || d.es === a.es && d.a === a.a && !V(d.datum_type) && !V(a.datum_type))) {
            c = ta(c, d.es, d.a);
            if (V(d.datum_type)) {
                var e = d.datum_type;
                d = d.datum_params;
                if (1 === e) c = {
                    x: c.x + d[0],
                    y: c.y + d[1],
                    z: c.z + d[2]
                };
                else if (2 === e) {
                    e = d[3];
                    var f = d[4],
                        g = d[5],
                        h = d[6];
                    c = {
                        x: h * (c.x - g * c.y + f * c.z) + d[0],
                        y: h * (g * c.x + c.y - e * c.z) + d[1],
                        z: h * (-f * c.x + e * c.y + c.z) + d[2]
                    }
                } else c = void 0
            }
            if (V(a.datum_type))
                if (e = a.datum_type, d = a.datum_params, 1 === e) c = {
                    x: c.x - d[0],
                    y: c.y - d[1],
                    z: c.z - d[2]
                };
                else if (2 === e) {
                e = d[3];
                f = d[4];
                g = d[5];
                var k = d[6];
                h = (c.x - d[0]) / k;
                var l =
                    (c.y - d[1]) / k;
                c = (c.z - d[2]) / k;
                c = {
                    x: h + g * l - f * c,
                    y: -g * h + l + e * c,
                    z: f * h - e * l + c
                }
            } else c = void 0;
            c = ua(c, a.es, a.a, a.b)
        }
        b.from_greenwich && (c = {
            x: c.x - b.from_greenwich,
            y: c.y,
            z: c.z || 0
        });
        "longlat" === b.projName ? c = {
            x: 57.29577951308232 * c.x,
            y: 57.29577951308232 * c.y,
            z: c.z || 0
        } : (c = b.forward(c), b.to_meter && (c = {
            x: c.x / b.to_meter,
            y: c.y / b.to_meter,
            z: c.z || 0
        }));
        return "enu" !== b.axis ? xa(b, !0, c) : c
    }

    function ha(a, b, c) {
        if (Array.isArray(c)) {
            var d = W(a, b, c) || {
                x: NaN,
                y: NaN
            };
            return 2 < c.length ? "undefined" !== typeof a.name && "geocent" === a.name || "undefined" !==
                typeof b.name && "geocent" === b.name ? "number" === typeof d.z ? [d.x, d.y, d.z].concat(c.splice(3)) : [d.x, d.y, c[2]].concat(c.splice(3)) : [d.x, d.y].concat(c.splice(2)) : [d.x, d.y]
        }
        var e = W(a, b, c);
        a = Object.keys(c);
        if (2 === a.length) return e;
        a.forEach(function(f) {
            "x" !== f && "y" !== f && "z" !== f && (e[f] = c[f])
        });
        return e
    }

    function ya(a) {
        return a instanceof C ? a : a.oProj ? a.oProj : C(a)
    }

    function x(a, b, c) {
        a = ya(a);
        var d = !1;
        if ("undefined" === typeof b) b = a, a = za, d = !0;
        else if ("undefined" !== typeof b.x || Array.isArray(b)) c = b, b = a, a = za, d = !0;
        b = ya(b);
        if (c) return ha(a, b, c);
        c = {
            forward: function(e) {
                return ha(a, b, e)
            },
            inverse: function(e) {
                return ha(b, a, e)
            }
        };
        d && (c.oProj = b);
        return c
    }

    function Aa(a, b) {
        var c = a[1],
            d = a[0];
        var e = Math.PI / 180 * c;
        var f = Math.PI / 180 * d;
        var g = Math.floor((d + 180) / 6) + 1;
        180 === d && (g = 60);
        56 <= c && 64 > c && 3 <= d && 12 > d && (g = 32);
        72 <= c && 84 > c && (0 <= d && 9 > d ? g = 31 : 9 <= d && 21 > d ? g = 33 : 21 <= d && 33 > d ? g = 35 : 33 <= d && 42 > d && (g = 37));
        var h = Math.PI / 180 * (6 * (g - 1) - 180 + 3);
        d = 6378137 / Math.sqrt(1 - .00669438 * Math.sin(e) * Math.sin(e));
        var k = Math.tan(e) * Math.tan(e);
        var l = .006739496752268451 *
            Math.cos(e) * Math.cos(e);
        f = Math.cos(e) * (f - h);
        e = .9996 * (6378137 * (.9983242984503243 * e - .002514607064228144 * Math.sin(2 * e) + 2.639046602129982E-6 * Math.sin(4 * e) - 3.4180461016968582E-9 * Math.sin(6 * e)) + d * Math.tan(e) * (f * f / 2 + (5 - k + 9 * l + 4 * l * l) * f * f * f * f / 24 + (61 - 58 * k + k * k + 600 * l - 2.2240339282485886) * f * f * f * f * f * f / 720));
        0 > c && (e += 1E7);
        e = Math.round(e);
        l = Math.round(.9996 * d * (f + (1 - k + l) * f * f * f / 6 + (5 - 18 * k + k * k + 72 * l - .39089081163157013) * f * f * f * f * f / 120) + 5E5);
        f = g;
        k = "Z";
        84 >= c && 72 <= c ? k = "X" : 72 > c && 64 <= c ? k = "W" : 64 > c && 56 <= c ? k = "V" : 56 > c && 48 <= c ? k = "U" :
            48 > c && 40 <= c ? k = "T" : 40 > c && 32 <= c ? k = "S" : 32 > c && 24 <= c ? k = "R" : 24 > c && 16 <= c ? k = "Q" : 16 > c && 8 <= c ? k = "P" : 8 > c && 0 <= c ? k = "N" : 0 > c && -8 <= c ? k = "M" : -8 > c && -16 <= c ? k = "L" : -16 > c && -24 <= c ? k = "K" : -24 > c && -32 <= c ? k = "J" : -32 > c && -40 <= c ? k = "H" : -40 > c && -48 <= c ? k = "G" : -48 > c && -56 <= c ? k = "F" : -56 > c && -64 <= c ? k = "E" : -64 > c && -72 <= c ? k = "D" : -72 > c && -80 <= c && (k = "C");
        c = b || 5;
        g = "00000" + l;
        d = "00000" + e;
        k = f + k;
        h = Ba(f);
        l = Math.floor(l / 1E5);
        f = Math.floor(e / 1E5) % 20;
        --h;
        e = "AJSAJS".charCodeAt(h);
        h = "AFAFAF".charCodeAt(h);
        l = e + l - 1;
        f = h + f;
        var p = !1;
        90 < l && (l = l - 90 + 65 - 1, p = !0);
        (73 === l ||
            73 > e && 73 < l || (73 < l || 73 > e) && p) && l++;
        if (79 === l || 79 > e && 79 < l || (79 < l || 79 > e) && p) l++, 73 === l && l++;
        90 < l && (l = l - 90 + 65 - 1);
        86 < f ? (f = f - 86 + 65 - 1, p = !0) : p = !1;
        (73 === f || 73 > h && 73 < f || (73 < f || 73 > h) && p) && f++;
        if (79 === f || 79 > h && 79 < f || (79 < f || 79 > h) && p) f++, 73 === f && f++;
        86 < f && (f = f - 86 + 65 - 1);
        e = String.fromCharCode(l) + String.fromCharCode(f);
        return k + e + g.substr(g.length - 5, c) + d.substr(d.length - 5, c)
    }

    function Ca(a) {
        a = ia(Da(a.toUpperCase()));
        return a.lat && a.lon ? [a.lon, a.lat] : [(a.left + a.right) / 2, (a.top + a.bottom) / 2]
    }

    function ia(a) {
        var b = a.easting,
            c = a.zoneNumber;
        if (0 > c || 60 < c) return null;
        var d = (1 - Math.sqrt(.99330562)) / (1 + Math.sqrt(.99330562));
        var e = a.northing;
        "N" > a.zoneLetter && (e -= 1E7);
        e = e / .9996 / 6367449.145945056;
        var f = e + (3 * d / 2 - 27 * d * d * d / 32) * Math.sin(2 * e) + (21 * d * d / 16 - 55 * d * d * d * d / 32) * Math.sin(4 * e) + 151 * d * d * d / 96 * Math.sin(6 * e);
        var g = 6378137 / Math.sqrt(1 - .00669438 * Math.sin(f) * Math.sin(f));
        d = Math.tan(f) * Math.tan(f);
        e = .006739496752268451 * Math.cos(f) * Math.cos(f);
        var h = 6335439.32722994 / Math.pow(1 - .00669438 * Math.sin(f) * Math.sin(f), 1.5);
        b = (b - 5E5) / (.9996 * g);
        g = f - g * Math.tan(f) / h * (b * b / 2 - (5 + 3 * d + 10 * e - 4 * e * e - .06065547077041606) * b * b * b * b / 24 + (61 + 90 * d + 298 * e + 45 * d * d - 1.6983531815716497 - 3 * e * e) * b * b * b * b * b * b / 720);
        g = g / Math.PI * 180;
        b = (b - (1 + 2 * d + e) * b * b * b / 6 + (5 - 2 * e + 28 * d - 3 * e * e + .05391597401814761 + 24 * d * d) * b * b * b * b * b / 120) / Math.cos(f);
        b = 6 * (c - 1) - 180 + 3 + b / Math.PI * 180;
        a.accuracy ? (a = ia({
            northing: a.northing + a.accuracy,
            easting: a.easting + a.accuracy,
            zoneLetter: a.zoneLetter,
            zoneNumber: a.zoneNumber
        }), a = {
            top: a.lat,
            right: a.lon,
            bottom: g,
            left: b
        }) : a = {
            lat: g,
            lon: b
        };
        return a
    }

    function Ba(a) {
        a %= 6;
        0 ===
            a && (a = 6);
        return a
    }

    function Da(a) {
        if (a && 0 === a.length) throw "MGRSPoint coverting from nothing";
        for (var b = a.length, c, d = "", e, f = 0; !/[A-Z]/.test(e = a.charAt(f));) {
            if (2 <= f) throw "MGRSPoint bad conversion from: " + a;
            d += e;
            f++
        }
        d = parseInt(d, 10);
        if (0 === f || f + 3 > b) throw "MGRSPoint bad conversion from: " + a;
        e = a.charAt(f++);
        if ("A" >= e || "B" === e || "Y" === e || "Z" <= e || "I" === e || "O" === e) throw "MGRSPoint zone letter " + e + " not handled: " + a;
        c = a.substring(f, f += 2);
        var g = Ba(d);
        var h = c.charAt(0);
        for (var k = "AJSAJS".charCodeAt(g - 1), l = 1E5,
                p = !1; k !== h.charCodeAt(0);) {
            k++;
            73 === k && k++;
            79 === k && k++;
            if (90 < k) {
                if (p) throw "Bad character: " + h;
                k = 65;
                p = !0
            }
            l += 1E5
        }
        h = l;
        c = c.charAt(1);
        if ("V" < c) throw "MGRSPoint given invalid Northing " + c;
        g = "AFAFAF".charCodeAt(g - 1);
        k = 0;
        for (l = !1; g !== c.charCodeAt(0);) {
            g++;
            73 === g && g++;
            79 === g && g++;
            if (86 < g) {
                if (l) throw "Bad character: " + c;
                g = 65;
                l = !0
            }
            k += 1E5
        }
        for (g = k; g < Ta(e);) g += 2E6;
        b -= f;
        if (0 !== b % 2) throw "MGRSPoint has to have an even number \nof digits after the zone letter and two 100km letters - front \nhalf for easting meters, second half for \nnorthing meters" +
            a;
        b /= 2;
        k = c = 0;
        if (0 < b) {
            var r = 1E5 / Math.pow(10, b);
            c = a.substring(f, f + b);
            c = parseFloat(c) * r;
            a = a.substring(f + b);
            k = parseFloat(a) * r
        }
        return {
            easting: c + h,
            northing: k + g,
            zoneLetter: e,
            zoneNumber: d,
            accuracy: r
        }
    }

    function Ta(a) {
        switch (a) {
            case "C":
                var b = 11E5;
                break;
            case "D":
                b = 2E6;
                break;
            case "E":
                b = 28E5;
                break;
            case "F":
                b = 37E5;
                break;
            case "G":
                b = 46E5;
                break;
            case "H":
                b = 55E5;
                break;
            case "J":
                b = 64E5;
                break;
            case "K":
                b = 73E5;
                break;
            case "L":
                b = 82E5;
                break;
            case "M":
                b = 91E5;
                break;
            case "N":
                b = 0;
                break;
            case "P":
                b = 8E5;
                break;
            case "Q":
                b = 17E5;
                break;
            case "R":
                b = 26E5;
                break;
            case "S":
                b = 35E5;
                break;
            case "T":
                b = 44E5;
                break;
            case "U":
                b = 53E5;
                break;
            case "V":
                b = 62E5;
                break;
            case "W":
                b = 7E6;
                break;
            case "X":
                b = 79E5;
                break;
            default:
                b = -1
        }
        if (0 <= b) return b;
        throw "Invalid zone letter: " + a;
    }

    function I(a, b, c) {
        if (!(this instanceof I)) return new I(a, b, c);
        Array.isArray(a) ? (this.x = a[0], this.y = a[1], this.z = a[2] || 0) : "object" === typeof a ? (this.x = a.x, this.y = a.y, this.z = a.z || 0) : "string" === typeof a && "undefined" === typeof b ? (a = a.split(","), this.x = parseFloat(a[0], 10), this.y = parseFloat(a[1],
            10), this.z = parseFloat(a[2], 10) || 0) : (this.x = a, this.y = b, this.z = c || 0);
        console.warn("proj4.Point will be removed in version 3, use proj4.toPoint")
    }

    function X(a, b, c, d) {
        1E-10 > a ? (d.value = q.AREA_0, a = 0) : (a = Math.atan2(b, c), Math.abs(a) <= t ? d.value = q.AREA_0 : a > t && a <= m + t ? (d.value = q.AREA_1, a -= m) : a > m + t || a <= -(m + t) ? (d.value = q.AREA_2, a = 0 <= a ? a - 3.14159265359 : a + 3.14159265359) : (d.value = q.AREA_3, a += m));
        return a
    }

    function J(a, b) {
        var c = a + b; - 3.14159265359 > c ? c += ja : 3.14159265359 < c && (c -= ja);
        return c
    }

    function Ua(a, b, c, d) {
        for (; d; --d) {
            var e =
                a(b);
            b -= e;
            if (Math.abs(e) < c) break
        }
        return b
    }
    var m = Math.PI / 2,
        t = Math.PI / 4,
        ja = 2 * Math.PI,
        Va = {
            greenwich: 0,
            lisbon: -9.131906111111,
            paris: 2.337229166667,
            bogota: -74.080916666667,
            madrid: -3.687938888889,
            rome: 12.452333333333,
            bern: 7.439583333333,
            jakarta: 106.807719444444,
            ferro: -17.666666666667,
            brussels: 4.367975,
            stockholm: 18.058277777778,
            athens: 23.7163375,
            oslo: 10.722916666667
        },
        Wa = {
            ft: {
                to_meter: .3048
            },
            "us-ft": {
                to_meter: 1200 / 3937
            }
        },
        na = /[\s_\-\/\(\)]/g,
        ea = function(a) {
            var b = {};
            a = a.split("+").map(function(g) {
                return g.trim()
            }).filter(function(g) {
                return g
            }).reduce(function(g,
                h) {
                var k = h.split("=");
                k.push(!0);
                g[k[0].toLowerCase()] = k[1];
                return g
            }, {});
            var c, d = {
                proj: "projName",
                datum: "datumCode",
                rf: function(g) {
                    b.rf = parseFloat(g)
                },
                lat_0: function(g) {
                    b.lat0 = .017453292519943295 * g
                },
                lat_1: function(g) {
                    b.lat1 = .017453292519943295 * g
                },
                lat_2: function(g) {
                    b.lat2 = .017453292519943295 * g
                },
                lat_ts: function(g) {
                    b.lat_ts = .017453292519943295 * g
                },
                lon_0: function(g) {
                    b.long0 = .017453292519943295 * g
                },
                lon_1: function(g) {
                    b.long1 = .017453292519943295 * g
                },
                lon_2: function(g) {
                    b.long2 = .017453292519943295 * g
                },
                alpha: function(g) {
                    b.alpha =
                        .017453292519943295 * parseFloat(g)
                },
                lonc: function(g) {
                    b.longc = .017453292519943295 * g
                },
                x_0: function(g) {
                    b.x0 = parseFloat(g)
                },
                y_0: function(g) {
                    b.y0 = parseFloat(g)
                },
                k_0: function(g) {
                    b.k0 = parseFloat(g)
                },
                k: function(g) {
                    b.k0 = parseFloat(g)
                },
                a: function(g) {
                    b.a = parseFloat(g)
                },
                b: function(g) {
                    b.b = parseFloat(g)
                },
                r_a: function() {
                    b.R_A = !0
                },
                zone: function(g) {
                    b.zone = parseInt(g, 10)
                },
                south: function() {
                    b.utmSouth = !0
                },
                towgs84: function(g) {
                    b.datum_params = g.split(",").map(function(h) {
                        return parseFloat(h)
                    })
                },
                to_meter: function(g) {
                    b.to_meter =
                        parseFloat(g)
                },
                units: function(g) {
                    b.units = g;
                    if (g = B(Wa, g)) b.to_meter = g.to_meter
                },
                from_greenwich: function(g) {
                    b.from_greenwich = .017453292519943295 * g
                },
                pm: function(g) {
                    var h = B(Va, g);
                    b.from_greenwich = .017453292519943295 * (h ? h : parseFloat(g))
                },
                nadgrids: function(g) {
                    "@null" === g ? b.datumCode = "none" : b.nadgrids = g
                },
                axis: function(g) {
                    3 === g.length && -1 !== "ewnsud".indexOf(g.substr(0, 1)) && -1 !== "ewnsud".indexOf(g.substr(1, 1)) && -1 !== "ewnsud".indexOf(g.substr(2, 1)) && (b.axis = g)
                }
            };
            for (c in a) {
                var e = a[c];
                if (c in d) {
                    var f = d[c];
                    "function" === typeof f ? f(e) : b[f] = e
                } else b[c] = e
            }
            "string" === typeof b.datumCode && "WGS84" !== b.datumCode && (b.datumCode = b.datumCode.toLowerCase());
            return b
        },
        Xa = /\s/,
        Ya = /[A-Za-z]/,
        Za = /[A-Za-z84]/,
        Y = /[,\]]/,
        Ea = /[\d\.E\-\+]/;
    w.prototype.readCharicter = function() {
        var a = this.text[this.place++];
        if (4 !== this.state)
            for (; Xa.test(a);) {
                if (this.place >= this.text.length) return;
                a = this.text[this.place++]
            }
        switch (this.state) {
            case 1:
                return this.neutral(a);
            case 2:
                return this.keyword(a);
            case 4:
                return this.quoted(a);
            case 5:
                return this.afterquote(a);
            case 3:
                return this.number(a)
        }
    };
    w.prototype.afterquote = function(a) {
        if ('"' === a) this.word += '"', this.state = 4;
        else if (Y.test(a)) this.word = this.word.trim(), this.afterItem(a);
        else throw Error("havn't handled \"" + a + '" in afterquote yet, index ' + this.place);
    };
    w.prototype.afterItem = function(a) {
        "," === a ? (null !== this.word && this.currentObject.push(this.word), this.word = null, this.state = 1) : "]" === a && (this.level--, null !== this.word && (this.currentObject.push(this.word), this.word = null), this.state = 1, this.currentObject =
            this.stack.pop(), this.currentObject || (this.state = -1))
    };
    w.prototype.number = function(a) {
        if (Ea.test(a)) this.word += a;
        else if (Y.test(a)) this.word = parseFloat(this.word), this.afterItem(a);
        else throw Error("havn't handled \"" + a + '" in number yet, index ' + this.place);
    };
    w.prototype.quoted = function(a) {
        '"' === a ? this.state = 5 : this.word += a
    };
    w.prototype.keyword = function(a) {
        if (Za.test(a)) this.word += a;
        else if ("[" === a) a = [], a.push(this.word), this.level++, null === this.root ? this.root = a : this.currentObject.push(a), this.stack.push(this.currentObject),
            this.currentObject = a, this.state = 1;
        else if (Y.test(a)) this.afterItem(a);
        else throw Error("havn't handled \"" + a + '" in keyword yet, index ' + this.place);
    };
    w.prototype.neutral = function(a) {
        if (Ya.test(a)) this.word = a, this.state = 2;
        else if ('"' === a) this.word = "", this.state = 4;
        else if (Ea.test(a)) this.word = a, this.state = 3;
        else if (Y.test(a)) this.afterItem(a);
        else throw Error("havn't handled \"" + a + '" in neutral yet, index ' + this.place);
    };
    w.prototype.output = function() {
        for (; this.place < this.text.length;) this.readCharicter();
        if (-1 === this.state) return this.root;
        throw Error('unable to parse string "' + this.text + '". State is ' + this.state);
    };
    var pa = function(a) {
        a = (new w(a)).output();
        var b = a.shift(),
            c = a.shift();
        a.unshift(["name", c]);
        a.unshift(["type", b]);
        b = {};
        H(a, b);
        Ja(b);
        return b
    };
    (function(a) {
        a("EPSG:4326", "+title=WGS 84 (long/lat) +proj=longlat +ellps=WGS84 +datum=WGS84 +units=degrees");
        a("EPSG:4269", "+title=NAD83 (long/lat) +proj=longlat +a=6378137.0 +b=6356752.31414036 +ellps=GRS80 +datum=NAD83 +units=degrees");
        a("EPSG:3857",
            "+title=WGS 84 / Pseudo-Mercator +proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +no_defs");
        a.WGS84 = a["EPSG:4326"];
        a["EPSG:3785"] = a["EPSG:3857"];
        a.GOOGLE = a["EPSG:3857"];
        a["EPSG:900913"] = a["EPSG:3857"];
        a["EPSG:102113"] = a["EPSG:3857"]
    })(u);
    var La = "PROJECTEDCRS PROJCRS GEOGCS GEOCCS PROJCS LOCAL_CS GEODCRS GEODETICCRS GEODETICDATUM ENGCRS ENGINEERINGCRS".split(" "),
        Na = ["3857", "900913", "3785", "102113"],
        sa = function(a, b) {
            a = a || {};
            var c;
            if (!b) return a;
            for (c in b) {
                var d = b[c];
                void 0 !== d && (a[c] = d)
            }
            return a
        },
        D = function(a, b, c) {
            a *= b;
            return c / Math.sqrt(1 - a * a)
        },
        n = function(a) {
            return 3.14159265359 >= Math.abs(a) ? a : a - (0 > a ? -1 : 1) * ja
        },
        A = function(a, b, c) {
            c *= a;
            c = Math.pow((1 - c) / (1 + c), .5 * a);
            return Math.tan(.5 * (m - b)) / c
        },
        M = function(a, b) {
            for (var c = .5 * a, d, e = m - 2 * Math.atan(b), f = 0; 15 >= f; f++)
                if (d = a * Math.sin(e), d = m - 2 * Math.atan(b * Math.pow((1 - d) / (1 + d), c)) - e, e += d, 1E-10 >= Math.abs(d)) return e;
            return -9999
        },
        $a = [{
            init: function() {
                var a = this.b / this.a;
                this.es = 1 - a * a;
                "x0" in this || (this.x0 =
                    0);
                "y0" in this || (this.y0 = 0);
                this.e = Math.sqrt(this.es);
                this.lat_ts ? this.k0 = this.sphere ? Math.cos(this.lat_ts) : D(this.e, Math.sin(this.lat_ts), Math.cos(this.lat_ts)) : this.k0 || (this.k0 = this.k ? this.k : 1)
            },
            forward: function(a) {
                var b = a.x,
                    c = a.y;
                if (90 < 57.29577951308232 * c && -90 > 57.29577951308232 * c && 180 < 57.29577951308232 * b && -180 > 57.29577951308232 * b || 1E-10 >= Math.abs(Math.abs(c) - m)) return null;
                this.sphere ? (b = this.x0 + this.a * this.k0 * n(b - this.long0), c = this.y0 + this.a * this.k0 * Math.log(Math.tan(t + .5 * c))) : (c = A(this.e, c,
                    Math.sin(c)), b = this.x0 + this.a * this.k0 * n(b - this.long0), c = this.y0 - this.a * this.k0 * Math.log(c));
                a.x = b;
                a.y = c;
                return a
            },
            inverse: function(a) {
                var b = a.x - this.x0,
                    c = a.y - this.y0;
                if (this.sphere) c = m - 2 * Math.atan(Math.exp(-c / (this.a * this.k0)));
                else if (c = M(this.e, Math.exp(-c / (this.a * this.k0))), -9999 === c) return null;
                b = n(this.long0 + b / (this.a * this.k0));
                a.x = b;
                a.y = c;
                return a
            },
            names: ["Mercator", "Popular Visualisation Pseudo Mercator", "Mercator_1SP", "Mercator_Auxiliary_Sphere", "merc"]
        }, {
            init: function() {},
            forward: qa,
            inverse: qa,
            names: ["longlat", "identity"]
        }],
        U = {},
        T = [],
        ab = {
            start: function() {
                $a.forEach(ra)
            },
            add: ra,
            get: function(a) {
                if (!a) return !1;
                a = a.toLowerCase();
                if ("undefined" !== typeof U[a] && T[U[a]]) return T[U[a]]
            }
        },
        fa = {
            MERIT: {
                a: 6378137,
                rf: 298.257,
                ellipseName: "MERIT 1983"
            },
            SGS85: {
                a: 6378136,
                rf: 298.257,
                ellipseName: "Soviet Geodetic System 85"
            },
            GRS80: {
                a: 6378137,
                rf: 298.257222101,
                ellipseName: "GRS 1980(IUGG, 1980)"
            },
            IAU76: {
                a: 6378140,
                rf: 298.257,
                ellipseName: "IAU 1976"
            },
            airy: {
                a: 6377563.396,
                b: 6356256.91,
                ellipseName: "Airy 1830"
            },
            APL4: {
                a: 6378137,
                rf: 298.25,
                ellipseName: "Appl. Physics. 1965"
            },
            NWL9D: {
                a: 6378145,
                rf: 298.25,
                ellipseName: "Naval Weapons Lab., 1965"
            },
            mod_airy: {
                a: 6377340.189,
                b: 6356034.446,
                ellipseName: "Modified Airy"
            },
            andrae: {
                a: 6377104.43,
                rf: 300,
                ellipseName: "Andrae 1876 (Den., Iclnd.)"
            },
            aust_SA: {
                a: 6378160,
                rf: 298.25,
                ellipseName: "Australian Natl & S. Amer. 1969"
            },
            GRS67: {
                a: 6378160,
                rf: 298.247167427,
                ellipseName: "GRS 67(IUGG 1967)"
            },
            bessel: {
                a: 6377397.155,
                rf: 299.1528128,
                ellipseName: "Bessel 1841"
            },
            bess_nam: {
                a: 6377483.865,
                rf: 299.1528128,
                ellipseName: "Bessel 1841 (Namibia)"
            },
            clrk66: {
                a: 6378206.4,
                b: 6356583.8,
                ellipseName: "Clarke 1866"
            },
            clrk80: {
                a: 6378249.145,
                rf: 293.4663,
                ellipseName: "Clarke 1880 mod."
            },
            clrk58: {
                a: 6378293.645208759,
                rf: 294.2606763692654,
                ellipseName: "Clarke 1858"
            },
            CPM: {
                a: 6375738.7,
                rf: 334.29,
                ellipseName: "Comm. des Poids et Mesures 1799"
            },
            delmbr: {
                a: 6376428,
                rf: 311.5,
                ellipseName: "Delambre 1810 (Belgium)"
            },
            engelis: {
                a: 6378136.05,
                rf: 298.2566,
                ellipseName: "Engelis 1985"
            },
            evrst30: {
                a: 6377276.345,
                rf: 300.8017,
                ellipseName: "Everest 1830"
            },
            evrst48: {
                a: 6377304.063,
                rf: 300.8017,
                ellipseName: "Everest 1948"
            },
            evrst56: {
                a: 6377301.243,
                rf: 300.8017,
                ellipseName: "Everest 1956"
            },
            evrst69: {
                a: 6377295.664,
                rf: 300.8017,
                ellipseName: "Everest 1969"
            },
            evrstSS: {
                a: 6377298.556,
                rf: 300.8017,
                ellipseName: "Everest (Sabah & Sarawak)"
            },
            fschr60: {
                a: 6378166,
                rf: 298.3,
                ellipseName: "Fischer (Mercury Datum) 1960"
            },
            fschr60m: {
                a: 6378155,
                rf: 298.3,
                ellipseName: "Fischer 1960"
            },
            fschr68: {
                a: 6378150,
                rf: 298.3,
                ellipseName: "Fischer 1968"
            },
            helmert: {
                a: 6378200,
                rf: 298.3,
                ellipseName: "Helmert 1906"
            },
            hough: {
                a: 6378270,
                rf: 297,
                ellipseName: "Hough"
            },
            intl: {
                a: 6378388,
                rf: 297,
                ellipseName: "International 1909 (Hayford)"
            },
            kaula: {
                a: 6378163,
                rf: 298.24,
                ellipseName: "Kaula 1961"
            },
            lerch: {
                a: 6378139,
                rf: 298.257,
                ellipseName: "Lerch 1979"
            },
            mprts: {
                a: 6397300,
                rf: 191,
                ellipseName: "Maupertius 1738"
            },
            new_intl: {
                a: 6378157.5,
                b: 6356772.2,
                ellipseName: "New International 1967"
            },
            plessis: {
                a: 6376523,
                rf: 6355863,
                ellipseName: "Plessis 1817 (France)"
            },
            krass: {
                a: 6378245,
                rf: 298.3,
                ellipseName: "Krassovsky, 1942"
            },
            SEasia: {
                a: 6378155,
                b: 6356773.3205,
                ellipseName: "Southeast Asia"
            },
            walbeck: {
                a: 6376896,
                b: 6355834.8467,
                ellipseName: "Walbeck"
            },
            WGS60: {
                a: 6378165,
                rf: 298.3,
                ellipseName: "WGS 60"
            },
            WGS66: {
                a: 6378145,
                rf: 298.25,
                ellipseName: "WGS 66"
            },
            WGS7: {
                a: 6378135,
                rf: 298.26,
                ellipseName: "WGS 72"
            }
        },
        Qa = fa.WGS84 = {
            a: 6378137,
            rf: 298.257223563,
            ellipseName: "WGS 84"
        };
    fa.sphere = {
        a: 6370997,
        b: 6370997,
        ellipseName: "Normal Sphere (r=6370997)"
    };
    var Sa = {
        wgs84: {
            towgs84: "0,0,0",
            ellipse: "WGS84",
            datumName: "WGS84"
        },
        ch1903: {
            towgs84: "674.374,15.056,405.346",
            ellipse: "bessel",
            datumName: "swiss"
        },
        ggrs87: {
            towgs84: "-199.87,74.79,246.62",
            ellipse: "GRS80",
            datumName: "Greek_Geodetic_Reference_System_1987"
        },
        nad83: {
            towgs84: "0,0,0",
            ellipse: "GRS80",
            datumName: "North_American_Datum_1983"
        },
        nad27: {
            nadgrids: "@conus,@alaska,@ntv2_0.gsb,@ntv1_can.dat",
            ellipse: "clrk66",
            datumName: "North_American_Datum_1927"
        },
        potsdam: {
            towgs84: "606.0,23.0,413.0",
            ellipse: "bessel",
            datumName: "Potsdam Rauenberg 1950 DHDN"
        },
        carthage: {
            towgs84: "-263.0,6.0,431.0",
            ellipse: "clark80",
            datumName: "Carthage 1934 Tunisia"
        },
        hermannskogel: {
            towgs84: "653.0,-212.0,449.0",
            ellipse: "bessel",
            datumName: "Hermannskogel"
        },
        osni52: {
            towgs84: "482.530,-130.596,564.557,-1.042,-0.214,-0.631,8.15",
            ellipse: "airy",
            datumName: "Irish National"
        },
        ire65: {
            towgs84: "482.530,-130.596,564.557,-1.042,-0.214,-0.631,8.15",
            ellipse: "mod_airy",
            datumName: "Ireland 1965"
        },
        rassadiran: {
            towgs84: "-133.63,-157.5,-158.62",
            ellipse: "intl",
            datumName: "Rassadiran"
        },
        nzgd49: {
            towgs84: "59.47,-5.04,187.44,0.47,-0.1,1.024,-4.5993",
            ellipse: "intl",
            datumName: "New Zealand Geodetic Datum 1949"
        },
        osgb36: {
            towgs84: "446.448,-125.157,542.060,0.1502,0.2470,0.8421,-20.4894",
            ellipse: "airy",
            datumName: "Airy 1830"
        },
        s_jtsk: {
            towgs84: "589,76,480",
            ellipse: "bessel",
            datumName: "S-JTSK (Ferro)"
        },
        beduaram: {
            towgs84: "-106,-87,188",
            ellipse: "clrk80",
            datumName: "Beduaram"
        },
        gunung_segara: {
            towgs84: "-403,684,41",
            ellipse: "bessel",
            datumName: "Gunung Segara Jakarta"
        },
        rnb72: {
            towgs84: "106.869,-52.2978,103.724,-0.33657,0.456955,-1.84218,1",
            ellipse: "intl",
            datumName: "Reseau National Belge 1972"
        }
    };
    C.projections = ab;
    C.projections.start();
    "use strict";
    var xa = function(a, b, c) {
            var d = c.x,
                e = c.y,
                f = c.z || 0,
                g,
                h = {};
            for (g = 0; 3 > g; g++)
                if (!b || 2 !== g || void 0 !== c.z) {
                    if (0 === g) {
                        var k = d;
                        var l = -1 !== "ew".indexOf(a.axis[g]) ? "x" : "y"
                    } else 1 === g ? (k = e, l = -1 !== "ns".indexOf(a.axis[g]) ? "y" : "x") : (k = f, l = "z");
                    switch (a.axis[g]) {
                        case "e":
                            h[l] = k;
                            break;
                        case "w":
                            h[l] = -k;
                            break;
                        case "n":
                            h[l] = k;
                            break;
                        case "s":
                            h[l] = -k;
                            break;
                        case "u":
                            void 0 !== c[l] && (h.z = k);
                            break;
                        case "d":
                            void 0 !== c[l] && (h.z = -k);
                            break;
                        default:
                            return null
                    }
                } return h
        },
        wa = function(a) {
            var b = {
                x: a[0],
                y: a[1]
            };
            2 < a.length && (b.z = a[2]);
            3 < a.length && (b.m = a[3]);
            return b
        },
        za = C("WGS84"),
        bb = {
            forward: Aa,
            inverse: function(a) {
                a = ia(Da(a.toUpperCase()));
                return a.lat && a.lon ? [a.lon, a.lat, a.lon, a.lat] : [a.left, a.bottom, a.right, a.top]
            },
            toPoint: Ca
        };
    I.fromMGRS = function(a) {
        return new I(Ca(a))
    };
    I.prototype.toMGRS = function(a) {
        return Aa([this.x, this.y], a)
    };
    var Fa = function(a) {
            var b = [];
            b[0] = 1 - a * (.25 + a * (.046875 + a * (.01953125 + .01068115234375 * a)));
            b[1] = a * (.75 - a * (.046875 + a * (.01953125 + .01068115234375 * a)));
            var c = a * a;
            b[2] = c * (.46875 - a * (.013020833333333334 + .007120768229166667 * a));
            c *= a;
            b[3] = c * (.3645833333333333 -
                .005696614583333333 * a);
            b[4] = c * a * .3076171875;
            return b
        },
        Z = function(a, b, c, d) {
            c *= b;
            b *= b;
            return d[0] * a - c * (d[1] + b * (d[2] + b * (d[3] + b * d[4])))
        },
        Ga = function(a, b, c) {
            for (var d = 1 / (1 - b), e = a, f = 20; f; --f) {
                var g = Math.sin(e),
                    h = 1 - b * g * g;
                h = (Z(e, g, Math.cos(e), c) - a) * h * Math.sqrt(h) * d;
                e -= h;
                if (1E-10 > Math.abs(h)) break
            }
            return e
        },
        cb = {
            init: function() {
                this.x0 = void 0 !== this.x0 ? this.x0 : 0;
                this.y0 = void 0 !== this.y0 ? this.y0 : 0;
                this.long0 = void 0 !== this.long0 ? this.long0 : 0;
                this.lat0 = void 0 !== this.lat0 ? this.lat0 : 0;
                this.es && (this.en = Fa(this.es),
                    this.ml0 = Z(this.lat0, Math.sin(this.lat0), Math.cos(this.lat0), this.en))
            },
            forward: function(a) {
                var b = a.y,
                    c = n(a.x - this.long0),
                    d = Math.sin(b),
                    e = Math.cos(b);
                if (this.es) {
                    var f = e * c,
                        g = Math.pow(f, 2),
                        h = this.ep2 * Math.pow(e, 2),
                        k = Math.pow(h, 2),
                        l = Math.pow(1E-10 < Math.abs(e) ? Math.tan(b) : 0, 2),
                        p = Math.pow(l, 2);
                    var r = 1 - this.es * Math.pow(d, 2);
                    f /= Math.sqrt(r);
                    b = Z(b, d, e, this.en);
                    r = this.a * this.k0 * f * (1 + g / 6 * (1 - l + h + g / 20 * (5 - 18 * l + p + 14 * h - 58 * l * h + g / 42 * (61 + 179 * p - p * l - 479 * l)))) + this.x0;
                    c = this.a * this.k0 * (b - this.ml0 + d * c * f / 2 * (1 + g / 12 * (5 -
                        l + 9 * h + 4 * k + g / 30 * (61 + p - 58 * l + 270 * h - 330 * l * h + g / 56 * (1385 + 543 * p - p * l - 3111 * l))))) + this.y0
                } else {
                    d = e * Math.sin(c);
                    if (1E-10 > Math.abs(Math.abs(d) - 1)) return 93;
                    r = .5 * this.a * this.k0 * Math.log((1 + d) / (1 - d)) + this.x0;
                    c = e * Math.cos(c) / Math.sqrt(1 - Math.pow(d, 2));
                    d = Math.abs(c);
                    if (1 <= d) {
                        if (1E-10 < d - 1) return 93;
                        c = 0
                    } else c = Math.acos(c);
                    0 > b && (c = -c);
                    c = this.a * this.k0 * (c - this.lat0) + this.y0
                }
                a.x = r;
                a.y = c;
                return a
            },
            inverse: function(a) {
                var b = 1 / this.a * (a.x - this.x0),
                    c = 1 / this.a * (a.y - this.y0);
                if (this.es) {
                    var d = this.ml0 + c / this.k0;
                    var e = Ga(d,
                        this.es, this.en);
                    if (Math.abs(e) < m) {
                        c = Math.cos(e);
                        var f = 1E-10 < Math.abs(c) ? Math.tan(e) : 0,
                            g = this.ep2 * Math.pow(c, 2),
                            h = Math.pow(g, 2),
                            k = Math.pow(f, 2),
                            l = Math.pow(k, 2);
                        d = 1 - this.es * Math.pow(Math.sin(e), 2);
                        b = b * Math.sqrt(d) / this.k0;
                        var p = Math.pow(b, 2);
                        d = e - d * f * p / (1 - this.es) * .5 * (1 - p / 12 * (5 + 3 * k - 9 * g * k + g - 4 * h - p / 30 * (61 + 90 * k - 252 * g * k + 45 * l + 46 * g - p / 56 * (1385 + 3633 * k + 4095 * l + 1574 * l * k))));
                        e = n(this.long0 + b * (1 - p / 6 * (1 + 2 * k + g - p / 20 * (5 + 28 * k + 24 * l + 8 * g * k + 6 * g - p / 42 * (61 + 662 * k + 1320 * l + 720 * l * k)))) / c)
                    } else d = m * (0 > c ? -1 : 1), e = 0
                } else d = Math.exp(b /
                    this.k0), e = .5 * (d - 1 / d), g = Math.cos(this.lat0 + c / this.k0), d = Math.sqrt((1 - Math.pow(g, 2)) / (1 + Math.pow(e, 2))), d = Math.asin(d), 0 > c && (d = -d), e = 0 === e && 0 === g ? 0 : n(Math.atan2(e, g) + this.long0);
                a.x = e;
                a.y = d;
                return a
            },
            names: ["Transverse_Mercator", "Transverse Mercator", "tmerc"]
        },
        Ha = function(a) {
            a = Math.exp(a);
            return (a - 1 / a) / 2
        },
        aa = function(a, b) {
            a = Math.abs(a);
            b = Math.abs(b);
            var c = Math.max(a, b);
            return c * Math.sqrt(1 + Math.pow(Math.min(a, b) / (c ? c : 1), 2))
        },
        ka = function(a, b) {
            for (var c = 2 * Math.cos(2 * b), d = a.length - 1, e = a[d], f = 0, g; 0 <= --d;) g = -f + c * e + a[d], f = e, e = g;
            return b + g * Math.sin(2 * b)
        },
        Ia = function(a, b, c) {
            var d = Math.sin(b);
            b = Math.cos(b);
            var e = Ha(c);
            c = Math.exp(c);
            c = (c + 1 / c) / 2;
            for (var f = 2 * b * c, g = -2 * d * e, h = a.length - 1, k = a[h], l = 0, p = 0, r = 0, y, z; 0 <= --h;) y = p, z = l, p = k, l = r, k = -y + f * p - g * l + a[h], r = -z + g * p + f * l;
            f = d * c;
            g = b * e;
            return [f * k - g * r, f * r + g * k]
        },
        ba = {
            init: function() {
                if (void 0 === this.es || 0 >= this.es) throw Error("incorrect elliptical usage");
                this.x0 = void 0 !== this.x0 ? this.x0 : 0;
                this.y0 = void 0 !== this.y0 ? this.y0 : 0;
                this.long0 = void 0 !== this.long0 ? this.long0 : 0;
                this.lat0 =
                    void 0 !== this.lat0 ? this.lat0 : 0;
                this.cgb = [];
                this.cbg = [];
                this.utg = [];
                this.gtu = [];
                var a = this.es / (1 + Math.sqrt(1 - this.es));
                a /= 2 - a;
                this.cgb[0] = a * (2 + a * (-2 / 3 + a * (-2 + a * (116 / 45 + a * (26 / 45 + -2854 / 675 * a)))));
                this.cbg[0] = a * (-2 + a * (2 / 3 + a * (4 / 3 + a * (-82 / 45 + a * (32 / 45 + 4642 / 4725 * a)))));
                var b = a * a;
                this.cgb[1] = b * (7 / 3 + a * (-1.6 + a * (-227 / 45 + a * (2704 / 315 + 2323 / 945 * a))));
                this.cbg[1] = b * (5 / 3 + a * (-16 / 15 + a * (-13 / 9 + a * (904 / 315 + -1522 / 945 * a))));
                b *= a;
                this.cgb[2] = b * (56 / 15 + a * (-136 / 35 + a * (-1262 / 105 + 73814 / 2835 * a)));
                this.cbg[2] = b * (-26 / 15 + a * (34 / 21 + a * (1.6 +
                    -12686 / 2835 * a)));
                b *= a;
                this.cgb[3] = b * (4279 / 630 + a * (-332 / 35 + -399572 / 14175 * a));
                this.cbg[3] = b * (1237 / 630 + a * (-2.4 + -24832 / 14175 * a));
                b *= a;
                this.cgb[4] = b * (4174 / 315 + -144838 / 6237 * a);
                this.cbg[4] = b * (-734 / 315 + 109598 / 31185 * a);
                b *= a;
                this.cgb[5] = 601676 / 22275 * b;
                this.cbg[5] = 444337 / 155925 * b;
                b = Math.pow(a, 2);
                this.Qn = this.k0 / (1 + a) * (1 + b * (.25 + b * (.015625 + b / 256)));
                this.utg[0] = a * (-.5 + a * (2 / 3 + a * (-37 / 96 + a * (1 / 360 + a * (81 / 512 + -96199 / 604800 * a)))));
                this.gtu[0] = a * (.5 + a * (-2 / 3 + a * (.3125 + a * (41 / 180 + a * (-127 / 288 + 7891 / 37800 * a)))));
                this.utg[1] = b *
                    (-1 / 48 + a * (-1 / 15 + a * (437 / 1440 + a * (-46 / 105 + .2890188388723545 * a))));
                this.gtu[1] = b * (13 / 48 + a * (-.6 + a * (557 / 1440 + a * (281 / 630 + -1.0248393063822752 * a))));
                b *= a;
                this.utg[2] = b * (-17 / 480 + a * (37 / 840 + a * (209 / 4480 + -5569 / 90720 * a)));
                this.gtu[2] = b * (61 / 240 + a * (-103 / 140 + a * (15061 / 26880 + 167603 / 181440 * a)));
                b *= a;
                this.utg[3] = b * (-4397 / 161280 + a * (11 / 504 + 830251 / 7257600 * a));
                this.gtu[3] = b * (49561 / 161280 + a * (-179 / 168 + .9096203979276896 * a));
                b *= a;
                this.utg[4] = b * (-4583 / 161280 + 108847 / 3991680 * a);
                this.gtu[4] = b * (34729 / 80640 + -1.713007555715889 * a);
                b *=
                    a;
                this.utg[5] = -.03233083094085698 * b;
                this.gtu[5] = .6650675310896665 * b;
                a = ka(this.cbg, this.lat0);
                b = -this.Qn;
                for (var c = this.gtu, d = 2 * a, e = 2 * Math.cos(d), f = c.length - 1, g = c[f], h = 0, k; 0 <= --f;) k = -h + e * g + c[f], h = g, g = k;
                this.Zb = b * (a + Math.sin(d) * k)
            },
            forward: function(a) {
                var b = n(a.x - this.long0),
                    c = a.y;
                c = ka(this.cbg, c);
                var d = Math.sin(c),
                    e = Math.cos(c),
                    f = Math.sin(b);
                b = Math.cos(b);
                c = Math.atan2(d, b * e);
                b = Math.atan2(f * e, aa(d, e * b));
                b = Math.tan(b);
                d = Math.abs(b);
                d *= 1 + d / (aa(1, d) + 1);
                e = 1 + d;
                f = e - 1;
                d = 0 === f ? d : d * Math.log(e) / f;
                b = 0 > b ? -d : d;
                d = Ia(this.gtu, 2 * c, 2 * b);
                c += d[0];
                b += d[1];
                2.623395162778 >= Math.abs(b) ? (b = this.a * this.Qn * b + this.x0, c = this.a * (this.Qn * c + this.Zb) + this.y0) : c = b = Infinity;
                a.x = b;
                a.y = c;
                return a
            },
            inverse: function(a) {
                var b = 1 / this.a * (a.x - this.x0),
                    c = 1 / this.a * (a.y - this.y0);
                c = (c - this.Zb) / this.Qn;
                b /= this.Qn;
                if (2.623395162778 >= Math.abs(b)) {
                    var d = Ia(this.utg, 2 * c, 2 * b);
                    c += d[0];
                    b += d[1];
                    b = Math.atan(Ha(b));
                    d = Math.cos(c);
                    var e = Math.sin(b);
                    b = Math.cos(b);
                    c = Math.atan2(Math.sin(c) * b, aa(e, b * d));
                    b = Math.atan2(e, b * d);
                    b = n(b + this.long0);
                    c = ka(this.cgb,
                        c)
                } else c = b = Infinity;
                a.x = b;
                a.y = c;
                return a
            },
            names: ["Extended_Transverse_Mercator", "Extended Transverse Mercator", "etmerc"]
        },
        db = {
            init: function() {
                var a = this.zone;
                void 0 === a && (a = Math.floor(30 * (n(this.long0) + Math.PI) / Math.PI) + 1, 0 > a ? a = 0 : 60 < a && (a = 60));
                if (void 0 === a) throw Error("unknown utm zone");
                this.lat0 = 0;
                this.long0 = .017453292519943295 * (6 * Math.abs(a) - 183);
                this.x0 = 5E5;
                this.y0 = this.utmSouth ? 1E7 : 0;
                this.k0 = .9996;
                ba.init.apply(this);
                this.forward = ba.forward;
                this.inverse = ba.inverse
            },
            names: ["Universal Transverse Mercator System",
                "utm"
            ],
            dependsOn: "etmerc"
        },
        la = function(a, b) {
            return Math.pow((1 - a) / (1 + a), b)
        },
        eb = function() {
            var a = Math.sin(this.lat0),
                b = Math.cos(this.lat0);
            b *= b;
            this.rc = Math.sqrt(1 - this.es) / (1 - this.es * a * a);
            this.C = Math.sqrt(1 + this.es * b * b / (1 - this.es));
            this.phic0 = Math.asin(a / this.C);
            this.ratexp = .5 * this.C * this.e;
            this.K = Math.tan(.5 * this.phic0 + t) / (Math.pow(Math.tan(.5 * this.lat0 + t), this.C) * la(this.e * a, this.ratexp))
        },
        fb = function(a) {
            var b = a.x,
                c = a.y;
            a.y = 2 * Math.atan(this.K * Math.pow(Math.tan(.5 * c + t), this.C) * la(this.e * Math.sin(c),
                this.ratexp)) - m;
            a.x = this.C * b;
            return a
        },
        gb = function(a) {
            for (var b = a.x / this.C, c = a.y, d = Math.pow(Math.tan(.5 * c + t) / this.K, 1 / this.C), e = 20; 0 < e; --e) {
                c = 2 * Math.atan(d * la(this.e * Math.sin(a.y), -.5 * this.e)) - m;
                if (1E-14 > Math.abs(c - a.y)) break;
                a.y = c
            }
            if (!e) return null;
            a.x = b;
            a.y = c;
            return a
        },
        hb = {
            init: function() {
                eb.apply(this);
                this.rc && (this.sinc0 = Math.sin(this.phic0), this.cosc0 = Math.cos(this.phic0), this.R2 = 2 * this.rc, this.title || (this.title = "Oblique Stereographic Alternative"))
            },
            forward: function(a) {
                a.x = n(a.x - this.long0);
                fb.apply(this, [a]);
                var b = Math.sin(a.y);
                var c = Math.cos(a.y);
                var d = Math.cos(a.x);
                var e = this.k0 * this.R2 / (1 + this.sinc0 * b + this.cosc0 * c * d);
                a.x = e * c * Math.sin(a.x);
                a.y = e * (this.cosc0 * b - this.sinc0 * c * d);
                a.x = this.a * a.x + this.x0;
                a.y = this.a * a.y + this.y0;
                return a
            },
            inverse: function(a) {
                var b;
                a.x = (a.x - this.x0) / this.a;
                a.y = (a.y - this.y0) / this.a;
                a.x /= this.k0;
                a.y /= this.k0;
                if (b = Math.sqrt(a.x * a.x + a.y * a.y)) {
                    var c = 2 * Math.atan2(b, this.R2);
                    var d = Math.sin(c);
                    var e = Math.cos(c);
                    c = Math.asin(e * this.sinc0 + a.y * d * this.cosc0 / b);
                    d = Math.atan2(a.x *
                        d, b * this.cosc0 * e - a.y * this.sinc0 * d)
                } else c = this.phic0, d = 0;
                a.x = d;
                a.y = c;
                gb.apply(this, [a]);
                a.x = n(a.x + this.long0);
                return a
            },
            names: "Stereographic_North_Pole;Oblique_Stereographic;Polar_Stereographic;sterea;Oblique Stereographic Alternative;Double_Stereographic".split(";")
        },
        ib = {
            init: function() {
                this.coslat0 = Math.cos(this.lat0);
                this.sinlat0 = Math.sin(this.lat0);
                this.sphere ? 1 === this.k0 && !isNaN(this.lat_ts) && 1E-10 >= Math.abs(this.coslat0) && (this.k0 = .5 * (1 + (0 > this.lat0 ? -1 : 1) * Math.sin(this.lat_ts))) : (1E-10 >= Math.abs(this.coslat0) &&
                    (this.con = 0 < this.lat0 ? 1 : -1), this.cons = Math.sqrt(Math.pow(1 + this.e, 1 + this.e) * Math.pow(1 - this.e, 1 - this.e)), 1 === this.k0 && !isNaN(this.lat_ts) && 1E-10 >= Math.abs(this.coslat0) && (this.k0 = .5 * this.cons * D(this.e, Math.sin(this.lat_ts), Math.cos(this.lat_ts)) / A(this.e, this.con * this.lat_ts, this.con * Math.sin(this.lat_ts))), this.ms1 = D(this.e, this.sinlat0, this.coslat0), this.X0 = 2 * Math.atan(this.ssfn_(this.lat0, this.sinlat0, this.e)) - m, this.cosX0 = Math.cos(this.X0), this.sinX0 = Math.sin(this.X0))
            },
            forward: function(a) {
                var b =
                    a.x,
                    c = a.y,
                    d = Math.sin(c),
                    e = Math.cos(c),
                    f = n(b - this.long0);
                if (1E-10 >= Math.abs(Math.abs(b - this.long0) - Math.PI) && 1E-10 >= Math.abs(c + this.lat0)) return a.x = NaN, a.y = NaN, a;
                if (this.sphere) b = 2 * this.k0 / (1 + this.sinlat0 * d + this.coslat0 * e * Math.cos(f)), a.x = this.a * b * e * Math.sin(f) + this.x0, a.y = this.a * b * (this.coslat0 * d - this.sinlat0 * e * Math.cos(f)) + this.y0;
                else {
                    var g = 2 * Math.atan(this.ssfn_(c, d, this.e)) - m;
                    e = Math.cos(g);
                    g = Math.sin(g);
                    if (1E-10 >= Math.abs(this.coslat0)) return d = A(this.e, c * this.con, this.con * d), d = 2 * this.a * this.k0 *
                        d / this.cons, a.x = this.x0 + d * Math.sin(b - this.long0), a.y = this.y0 - this.con * d * Math.cos(b - this.long0), a;
                    1E-10 > Math.abs(this.sinlat0) ? (b = 2 * this.a * this.k0 / (1 + e * Math.cos(f)), a.y = b * g) : (b = 2 * this.a * this.k0 * this.ms1 / (this.cosX0 * (1 + this.sinX0 * g + this.cosX0 * e * Math.cos(f))), a.y = b * (this.cosX0 * g - this.sinX0 * e * Math.cos(f)) + this.y0);
                    a.x = b * e * Math.sin(f) + this.x0
                }
                return a
            },
            inverse: function(a) {
                a.x -= this.x0;
                a.y -= this.y0;
                var b = Math.sqrt(a.x * a.x + a.y * a.y);
                if (this.sphere) {
                    var c = 2 * Math.atan(b / (2 * this.a * this.k0));
                    var d = this.long0;
                    var e = this.lat0;
                    if (1E-10 >= b) return a.x = d, a.y = e, a;
                    e = Math.asin(Math.cos(c) * this.sinlat0 + a.y * Math.sin(c) * this.coslat0 / b);
                    d = 1E-10 > Math.abs(this.coslat0) ? 0 < this.lat0 ? n(this.long0 + Math.atan2(a.x, -1 * a.y)) : n(this.long0 + Math.atan2(a.x, a.y)) : n(this.long0 + Math.atan2(a.x * Math.sin(c), b * this.coslat0 * Math.cos(c) - a.y * this.sinlat0 * Math.sin(c)));
                    a.x = d;
                    a.y = e;
                    return a
                }
                if (1E-10 >= Math.abs(this.coslat0)) {
                    if (1E-10 >= b) return e = this.lat0, d = this.long0, a.x = d, a.y = e, a;
                    a.x *= this.con;
                    a.y *= this.con;
                    d = b * this.cons / (2 * this.a * this.k0);
                    e = this.con * M(this.e, d);
                    d = this.con * n(this.con * this.long0 + Math.atan2(a.x, -1 * a.y))
                } else e = 2 * Math.atan(b * this.cosX0 / (2 * this.a * this.k0 * this.ms1)), d = this.long0, 1E-10 >= b ? c = this.X0 : (c = Math.asin(Math.cos(e) * this.sinX0 + a.y * Math.sin(e) * this.cosX0 / b), d = n(this.long0 + Math.atan2(a.x * Math.sin(e), b * this.cosX0 * Math.cos(e) - a.y * this.sinX0 * Math.sin(e)))), e = -1 * M(this.e, Math.tan(.5 * (m + c)));
                a.x = d;
                a.y = e;
                return a
            },
            names: ["stere", "Stereographic_South_Pole", "Polar Stereographic (variant B)"],
            ssfn_: function(a, b, c) {
                b *= c;
                return Math.tan(.5 *
                    (m + a)) * Math.pow((1 - b) / (1 + b), .5 * c)
            }
        },
        jb = {
            init: function() {
                var a = this.lat0;
                this.lambda0 = this.long0;
                var b = Math.sin(a),
                    c = this.a,
                    d = 1 / this.rf;
                d = 2 * d - Math.pow(d, 2);
                var e = this.e = Math.sqrt(d);
                this.R = this.k0 * c * Math.sqrt(1 - d) / (1 - d * Math.pow(b, 2));
                this.alpha = Math.sqrt(1 + d / (1 - d) * Math.pow(Math.cos(a), 4));
                this.b0 = Math.asin(b / this.alpha);
                this.K = Math.log(Math.tan(Math.PI / 4 + this.b0 / 2)) - this.alpha * Math.log(Math.tan(Math.PI / 4 + a / 2)) + this.alpha * e / 2 * Math.log((1 + e * b) / (1 - e * b))
            },
            forward: function(a) {
                var b = 2 * (Math.atan(Math.exp(-this.alpha *
                        (Math.log(Math.tan(Math.PI / 4 - a.y / 2)) + this.e / 2 * Math.log((1 + this.e * Math.sin(a.y)) / (1 - this.e * Math.sin(a.y)))) + this.K)) - Math.PI / 4),
                    c = this.alpha * (a.x - this.lambda0),
                    d = Math.atan(Math.sin(c) / (Math.sin(this.b0) * Math.tan(b) + Math.cos(this.b0) * Math.cos(c)));
                b = Math.asin(Math.cos(this.b0) * Math.sin(b) - Math.sin(this.b0) * Math.cos(b) * Math.cos(c));
                a.y = this.R / 2 * Math.log((1 + Math.sin(b)) / (1 - Math.sin(b))) + this.y0;
                a.x = this.R * d + this.x0;
                return a
            },
            inverse: function(a) {
                var b = (a.x - this.x0) / this.R,
                    c = 2 * (Math.atan(Math.exp((a.y -
                        this.y0) / this.R)) - Math.PI / 4),
                    d = Math.asin(Math.cos(this.b0) * Math.sin(c) + Math.sin(this.b0) * Math.cos(c) * Math.cos(b));
                b = this.lambda0 + Math.atan(Math.sin(b) / (Math.cos(this.b0) * Math.cos(b) - Math.sin(this.b0) * Math.tan(c))) / this.alpha;
                for (var e = d, f = -1E3, g = 0; 1E-7 < Math.abs(e - f);) {
                    if (20 < ++g) return;
                    c = 1 / this.alpha * (Math.log(Math.tan(Math.PI / 4 + d / 2)) - this.K) + this.e * Math.log(Math.tan(Math.PI / 4 + Math.asin(this.e * Math.sin(e)) / 2));
                    f = e;
                    e = 2 * Math.atan(Math.exp(c)) - Math.PI / 2
                }
                a.x = b;
                a.y = e;
                return a
            },
            names: ["somerc"]
        },
        kb = {
            init: function() {
                this.no_off =
                    this.no_off || !1;
                this.no_rot = this.no_rot || !1;
                isNaN(this.k0) && (this.k0 = 1);
                var a = Math.sin(this.lat0),
                    b = Math.cos(this.lat0),
                    c = this.e * a;
                this.bl = Math.sqrt(1 + this.es / (1 - this.es) * Math.pow(b, 4));
                this.al = this.a * this.bl * this.k0 * Math.sqrt(1 - this.es) / (1 - c * c);
                a = A(this.e, this.lat0, a);
                b = this.bl / b * Math.sqrt((1 - this.es) / (1 - c * c));
                1 > b * b && (b = 1);
                if (isNaN(this.longc)) {
                    c = A(this.e, this.lat1, Math.sin(this.lat1));
                    var d = A(this.e, this.lat2, Math.sin(this.lat2));
                    this.el = 0 <= this.lat0 ? (b + Math.sqrt(b * b - 1)) * Math.pow(a, this.bl) : (b -
                        Math.sqrt(b * b - 1)) * Math.pow(a, this.bl);
                    c = Math.pow(c, this.bl);
                    var e = Math.pow(d, this.bl);
                    d = this.el / c;
                    a = .5 * (d - 1 / d);
                    d = (this.el * this.el - e * c) / (this.el * this.el + e * c);
                    c = (e - c) / (e + c);
                    e = n(this.long1 - this.long2);
                    this.long0 = .5 * (this.long1 + this.long2) - Math.atan(d * Math.tan(.5 * this.bl * e) / c) / this.bl;
                    this.long0 = n(this.long0);
                    c = n(this.long1 - this.long0);
                    this.gamma0 = Math.atan(Math.sin(this.bl * c) / a);
                    this.alpha = Math.asin(b * Math.sin(this.gamma0))
                } else d = 0 <= this.lat0 ? b + Math.sqrt(b * b - 1) : b - Math.sqrt(b * b - 1), this.el = d * Math.pow(a,
                    this.bl), this.gamma0 = Math.asin(Math.sin(this.alpha) / b), this.long0 = this.longc - Math.asin(.5 * (d - 1 / d) * Math.tan(this.gamma0)) / this.bl;
                this.uc = this.no_off ? 0 : 0 <= this.lat0 ? this.al / this.bl * Math.atan2(Math.sqrt(b * b - 1), Math.cos(this.alpha)) : -1 * this.al / this.bl * Math.atan2(Math.sqrt(b * b - 1), Math.cos(this.alpha))
            },
            forward: function(a) {
                var b = a.y,
                    c = n(a.x - this.long0);
                if (1E-10 >= Math.abs(Math.abs(b) - m)) c = 0 < b ? -1 : 1, b = this.al / this.bl * Math.log(Math.tan(t + c * this.gamma0 * .5)), c = -1 * c * m * this.al / this.bl;
                else {
                    b = A(this.e, b, Math.sin(b));
                    b = this.el / Math.pow(b, this.bl);
                    var d = .5 * (b - 1 / b),
                        e = Math.sin(this.bl * c);
                    b = (d * Math.sin(this.gamma0) - e * Math.cos(this.gamma0)) / (.5 * (b + 1 / b));
                    b = 1E-10 >= Math.abs(Math.abs(b) - 1) ? Number.POSITIVE_INFINITY : .5 * this.al * Math.log((1 - b) / (1 + b)) / this.bl;
                    c = 1E-10 >= Math.abs(Math.cos(this.bl * c)) ? this.al * this.bl * c : this.al * Math.atan2(d * Math.cos(this.gamma0) + e * Math.sin(this.gamma0), Math.cos(this.bl * c)) / this.bl
                }
                this.no_rot ? (a.x = this.x0 + c, a.y = this.y0 + b) : (c -= this.uc, a.x = this.x0 + b * Math.cos(this.alpha) + c * Math.sin(this.alpha), a.y =
                    this.y0 + c * Math.cos(this.alpha) - b * Math.sin(this.alpha));
                return a
            },
            inverse: function(a) {
                if (this.no_rot) {
                    var b = a.y - this.y0;
                    var c = a.x - this.x0
                } else b = (a.x - this.x0) * Math.cos(this.alpha) - (a.y - this.y0) * Math.sin(this.alpha), c = (a.y - this.y0) * Math.cos(this.alpha) + (a.x - this.x0) * Math.sin(this.alpha), c += this.uc;
                var d = Math.exp(-1 * this.bl * b / this.al);
                b = .5 * (d - 1 / d);
                var e = Math.sin(this.bl * c / this.al);
                d = (e * Math.cos(this.gamma0) + b * Math.sin(this.gamma0)) / (.5 * (d + 1 / d));
                var f = Math.pow(this.el / Math.sqrt((1 + d) / (1 - d)), 1 / this.bl);
                1E-10 > Math.abs(d - 1) ? (a.x = this.long0, a.y = m) : 1E-10 > Math.abs(d + 1) ? (a.x = this.long0, a.y = -1 * m) : (a.y = M(this.e, f), a.x = n(this.long0 - Math.atan2(b * Math.cos(this.gamma0) - e * Math.sin(this.gamma0), Math.cos(this.bl * c / this.al)) / this.bl));
                return a
            },
            names: ["Hotine_Oblique_Mercator", "Hotine Oblique Mercator", "Hotine_Oblique_Mercator_Azimuth_Natural_Origin", "Hotine_Oblique_Mercator_Azimuth_Center", "omerc"]
        },
        lb = {
            init: function() {
                this.lat2 || (this.lat2 = this.lat1);
                this.k0 || (this.k0 = 1);
                this.x0 = this.x0 || 0;
                this.y0 = this.y0 || 0;
                if (!(1E-10 > Math.abs(this.lat1 + this.lat2))) {
                    var a = this.b / this.a;
                    this.e = Math.sqrt(1 - a * a);
                    a = Math.sin(this.lat1);
                    var b = D(this.e, a, Math.cos(this.lat1)),
                        c = A(this.e, this.lat1, a),
                        d = Math.sin(this.lat2),
                        e = D(this.e, d, Math.cos(this.lat2));
                    d = A(this.e, this.lat2, d);
                    var f = A(this.e, this.lat0, Math.sin(this.lat0));
                    this.ns = 1E-10 < Math.abs(this.lat1 - this.lat2) ? Math.log(b / e) / Math.log(c / d) : a;
                    isNaN(this.ns) && (this.ns = a);
                    this.f0 = b / (this.ns * Math.pow(c, this.ns));
                    this.rh = this.a * this.f0 * Math.pow(f, this.ns);
                    this.title || (this.title =
                        "Lambert Conformal Conic")
                }
            },
            forward: function(a) {
                var b = a.x,
                    c = a.y;
                1E-10 >= Math.abs(2 * Math.abs(c) - Math.PI) && (c = (0 > c ? -1 : 1) * (m - 2E-10));
                var d = Math.abs(Math.abs(c) - m);
                if (1E-10 < d) c = A(this.e, c, Math.sin(c)), c = this.a * this.f0 * Math.pow(c, this.ns);
                else {
                    d = c * this.ns;
                    if (0 >= d) return null;
                    c = 0
                }
                b = this.ns * n(b - this.long0);
                a.x = this.k0 * c * Math.sin(b) + this.x0;
                a.y = this.k0 * (this.rh - c * Math.cos(b)) + this.y0;
                return a
            },
            inverse: function(a) {
                var b = (a.x - this.x0) / this.k0,
                    c = this.rh - (a.y - this.y0) / this.k0;
                if (0 < this.ns) {
                    var d = Math.sqrt(b *
                        b + c * c);
                    var e = 1
                } else d = -Math.sqrt(b * b + c * c), e = -1;
                var f = 0;
                0 !== d && (f = Math.atan2(e * b, e * c));
                if (0 !== d || 0 < this.ns) {
                    if (e = 1 / this.ns, d = Math.pow(d / (this.a * this.f0), e), d = M(this.e, d), -9999 === d) return null
                } else d = -m;
                f = n(f / this.ns + this.long0);
                a.x = f;
                a.y = d;
                return a
            },
            names: ["Lambert Tangential Conformal Conic Projection", "Lambert_Conformal_Conic", "Lambert_Conformal_Conic_2SP", "lcc"]
        },
        mb = {
            init: function() {
                this.a = 6377397.155;
                this.es = .006674372230614;
                this.e = Math.sqrt(this.es);
                this.lat0 || (this.lat0 = .863937979737193);
                this.long0 ||
                    (this.long0 = .4334234309119251);
                this.k0 || (this.k0 = .9999);
                this.s45 = .785398163397448;
                this.s90 = 2 * this.s45;
                this.fi0 = this.lat0;
                this.e2 = this.es;
                this.e = Math.sqrt(this.e2);
                this.alfa = Math.sqrt(1 + this.e2 * Math.pow(Math.cos(this.fi0), 4) / (1 - this.e2));
                this.uq = 1.04216856380474;
                this.u0 = Math.asin(Math.sin(this.fi0) / this.alfa);
                this.g = Math.pow((1 + this.e * Math.sin(this.fi0)) / (1 - this.e * Math.sin(this.fi0)), this.alfa * this.e / 2);
                this.k = Math.tan(this.u0 / 2 + this.s45) / Math.pow(Math.tan(this.fi0 / 2 + this.s45), this.alfa) * this.g;
                this.k1 =
                    this.k0;
                this.n0 = this.a * Math.sqrt(1 - this.e2) / (1 - this.e2 * Math.pow(Math.sin(this.fi0), 2));
                this.s0 = 1.37008346281555;
                this.n = Math.sin(this.s0);
                this.ro0 = this.k1 * this.n0 / Math.tan(this.s0);
                this.ad = this.s90 - this.uq
            },
            forward: function(a) {
                var b = a.y;
                var c = n(a.x - this.long0);
                b = 2 * (Math.atan(this.k * Math.pow(Math.tan(b / 2 + this.s45), this.alfa) / Math.pow((1 + this.e * Math.sin(b)) / (1 - this.e * Math.sin(b)), this.alfa * this.e / 2)) - this.s45);
                var d = -c * this.alfa;
                c = Math.asin(Math.cos(this.ad) * Math.sin(b) + Math.sin(this.ad) * Math.cos(b) *
                    Math.cos(d));
                b = this.n * Math.asin(Math.cos(b) * Math.sin(d) / Math.cos(c));
                c = this.ro0 * Math.pow(Math.tan(this.s0 / 2 + this.s45), this.n) / Math.pow(Math.tan(c / 2 + this.s45), this.n);
                a.y = c * Math.cos(b);
                a.x = c * Math.sin(b);
                this.czech || (a.y *= -1, a.x *= -1);
                return a
            },
            inverse: function(a) {
                var b = a.x;
                a.x = a.y;
                a.y = b;
                this.czech || (a.y *= -1, a.x *= -1);
                b = Math.sqrt(a.x * a.x + a.y * a.y);
                var c = Math.atan2(a.y, a.x) / Math.sin(this.s0);
                var d = 2 * (Math.atan(Math.pow(this.ro0 / b, 1 / this.n) * Math.tan(this.s0 / 2 + this.s45)) - this.s45);
                b = Math.asin(Math.cos(this.ad) *
                    Math.sin(d) - Math.sin(this.ad) * Math.cos(d) * Math.cos(c));
                a.x = this.long0 - Math.asin(Math.cos(d) * Math.sin(c) / Math.cos(b)) / this.alfa;
                c = b;
                var e = d = 0;
                do a.y = 2 * (Math.atan(Math.pow(this.k, -1 / this.alfa) * Math.pow(Math.tan(b / 2 + this.s45), 1 / this.alfa) * Math.pow((1 + this.e * Math.sin(c)) / (1 - this.e * Math.sin(c)), this.e / 2)) - this.s45), 1E-10 > Math.abs(c - a.y) && (d = 1), c = a.y, e += 1; while (0 === d && 15 > e);
                return 15 <= e ? null : a
            },
            names: ["Krovak", "krovak"]
        },
        v = function(a, b, c, d, e) {
            return a * e - b * Math.sin(2 * e) + c * Math.sin(4 * e) - d * Math.sin(6 * e)
        },
        N = function(a) {
            return 1 - .25 * a * (1 + a / 16 * (3 + 1.25 * a))
        },
        O = function(a) {
            return .375 * a * (1 + .25 * a * (1 + .46875 * a))
        },
        P = function(a) {
            return .05859375 * a * a * (1 + .75 * a)
        },
        Q = function(a) {
            return 35 / 3072 * a * a * a
        },
        K = function(a, b, c) {
            b *= c;
            return a / Math.sqrt(1 - b * b)
        },
        L = function(a) {
            return Math.abs(a) < m ? a : a - (0 > a ? -1 : 1) * Math.PI
        },
        ca = function(a, b, c, d, e) {
            var f = a / b;
            for (var g = 0; 15 > g; g++) {
                var h = (a - (b * f - c * Math.sin(2 * f) + d * Math.sin(4 * f) - e * Math.sin(6 * f))) / (b - 2 * c * Math.cos(2 * f) + 4 * d * Math.cos(4 * f) - 6 * e * Math.cos(6 * f));
                f += h;
                if (1E-10 >= Math.abs(h)) return f
            }
            return NaN
        },
        nb = {
            init: function() {
                this.sphere || (this.e0 = N(this.es), this.e1 = O(this.es), this.e2 = P(this.es), this.e3 = Q(this.es), this.ml0 = this.a * v(this.e0, this.e1, this.e2, this.e3, this.lat0))
            },
            forward: function(a) {
                var b = a.x,
                    c = a.y;
                b = n(b - this.long0);
                if (this.sphere) {
                    var d = this.a * Math.asin(Math.cos(c) * Math.sin(b));
                    var e = this.a * (Math.atan2(Math.tan(c), Math.cos(b)) - this.lat0)
                } else {
                    e = Math.sin(c);
                    var f = Math.cos(c),
                        g = K(this.a, this.e, e),
                        h = Math.tan(c) * Math.tan(c);
                    d = b * Math.cos(c);
                    b = d * d;
                    var k = this.es * f * f / (1 - this.es);
                    c = this.a * v(this.e0,
                        this.e1, this.e2, this.e3, c);
                    d = g * d * (1 - b * h * (1 / 6 - (8 - h + 8 * k) * b / 120));
                    e = c - this.ml0 + g * e / f * b * (.5 + (5 - h + 6 * k) * b / 24)
                }
                a.x = d + this.x0;
                a.y = e + this.y0;
                return a
            },
            inverse: function(a) {
                a.x -= this.x0;
                a.y -= this.y0;
                var b = a.x / this.a,
                    c = a.y / this.a;
                if (this.sphere) {
                    var d = c + this.lat0;
                    c = Math.asin(Math.sin(d) * Math.cos(b));
                    d = Math.atan2(Math.tan(b), Math.cos(d))
                } else {
                    d = ca(this.ml0 / this.a + c, this.e0, this.e1, this.e2, this.e3);
                    if (1E-10 >= Math.abs(Math.abs(d) - m)) return a.x = this.long0, a.y = m, 0 > c && (a.y *= -1), a;
                    c = K(this.a, this.e, Math.sin(d));
                    var e =
                        Math.pow(Math.tan(d), 2);
                    b = b * this.a / c;
                    var f = b * b;
                    c = d - c * Math.tan(d) / (c * c * c / this.a / this.a * (1 - this.es)) * b * b * (.5 - (1 + 3 * e) * b * b / 24);
                    d = b * (1 - f * (e / 3 + (1 + 3 * e) * e * f / 15)) / Math.cos(d)
                }
                a.x = n(d + this.long0);
                a.y = L(c);
                return a
            },
            names: ["Cassini", "Cassini_Soldner", "cass"]
        },
        F = function(a, b) {
            if (1E-7 < a) {
                var c = a * b;
                return (1 - a * a) * (b / (1 - c * c) - .5 / a * Math.log((1 - c) / (1 + c)))
            }
            return 2 * b
        },
        ob = {
            init: function() {
                var a = Math.abs(this.lat0);
                this.mode = 1E-10 > Math.abs(a - m) ? 0 > this.lat0 ? this.S_POLE : this.N_POLE : 1E-10 > Math.abs(a) ? this.EQUIT : this.OBLIQ;
                if (0 < this.es) {
                    this.qp = F(this.e, 1);
                    this.mmf = .5 / (1 - this.es);
                    a = this.es;
                    var b = [];
                    b[0] = .3333333333333333 * a;
                    var c = a * a;
                    b[0] += .17222222222222222 * c;
                    b[1] = .06388888888888888 * c;
                    c *= a;
                    b[0] += .10257936507936508 * c;
                    b[1] += .0664021164021164 * c;
                    b[2] = .016415012942191543 * c;
                    this.apa = b;
                    switch (this.mode) {
                        case this.N_POLE:
                            this.dd = 1;
                            break;
                        case this.S_POLE:
                            this.dd = 1;
                            break;
                        case this.EQUIT:
                            this.rq = Math.sqrt(.5 * this.qp);
                            this.dd = 1 / this.rq;
                            this.xmf = 1;
                            this.ymf = .5 * this.qp;
                            break;
                        case this.OBLIQ:
                            this.rq = Math.sqrt(.5 * this.qp), a = Math.sin(this.lat0),
                                this.sinb1 = F(this.e, a) / this.qp, this.cosb1 = Math.sqrt(1 - this.sinb1 * this.sinb1), this.dd = Math.cos(this.lat0) / (Math.sqrt(1 - this.es * a * a) * this.rq * this.cosb1), this.ymf = (this.xmf = this.rq) / this.dd, this.xmf *= this.dd
                    }
                } else this.mode === this.OBLIQ && (this.sinph0 = Math.sin(this.lat0), this.cosph0 = Math.cos(this.lat0))
            },
            forward: function(a) {
                var b;
                var c = a.x;
                var d = a.y;
                c = n(c - this.long0);
                if (this.sphere) {
                    var e = Math.sin(d);
                    var f = Math.cos(d);
                    var g = Math.cos(c);
                    if (this.mode === this.OBLIQ || this.mode === this.EQUIT) {
                        var h = this.mode ===
                            this.EQUIT ? 1 + f * g : 1 + this.sinph0 * e + this.cosph0 * f * g;
                        if (1E-10 >= h) return null;
                        h = Math.sqrt(2 / h);
                        var k = h * f * Math.sin(c);
                        h *= this.mode === this.EQUIT ? e : this.cosph0 * e - this.sinph0 * f * g
                    } else if (this.mode === this.N_POLE || this.mode === this.S_POLE) {
                        this.mode === this.N_POLE && (g = -g);
                        if (1E-10 > Math.abs(d + this.lat0)) return null;
                        h = t - .5 * d;
                        h = 2 * (this.mode === this.S_POLE ? Math.cos(h) : Math.sin(h));
                        k = h * Math.sin(c);
                        h *= g
                    }
                } else {
                    var l = b = f = 0;
                    g = Math.cos(c);
                    c = Math.sin(c);
                    e = Math.sin(d);
                    e = F(this.e, e);
                    if (this.mode === this.OBLIQ || this.mode === this.EQUIT) f =
                        e / this.qp, b = Math.sqrt(1 - f * f);
                    switch (this.mode) {
                        case this.OBLIQ:
                            l = 1 + this.sinb1 * f + this.cosb1 * b * g;
                            break;
                        case this.EQUIT:
                            l = 1 + b * g;
                            break;
                        case this.N_POLE:
                            l = m + d;
                            e = this.qp - e;
                            break;
                        case this.S_POLE:
                            l = d - m, e = this.qp + e
                    }
                    if (1E-10 > Math.abs(l)) return null;
                    switch (this.mode) {
                        case this.OBLIQ:
                        case this.EQUIT:
                            l = Math.sqrt(2 / l);
                            h = this.mode === this.OBLIQ ? this.ymf * l * (this.cosb1 * f - this.sinb1 * b * g) : (l = Math.sqrt(2 / (1 + b * g))) * f * this.ymf;
                            k = this.xmf * l * b * c;
                            break;
                        case this.N_POLE:
                        case this.S_POLE:
                            0 <= e ? (k = (l = Math.sqrt(e)) * c, h = g * (this.mode ===
                                this.S_POLE ? l : -l)) : k = h = 0
                    }
                }
                a.x = this.a * k + this.x0;
                a.y = this.a * h + this.y0;
                return a
            },
            inverse: function(a) {
                a.x -= this.x0;
                a.y -= this.y0;
                var b = a.x / this.a,
                    c = a.y / this.a,
                    d;
                if (this.sphere) {
                    var e = d = 0;
                    var f = Math.sqrt(b * b + c * c);
                    var g = .5 * f;
                    if (1 < g) return null;
                    g = 2 * Math.asin(g);
                    if (this.mode === this.OBLIQ || this.mode === this.EQUIT) e = Math.sin(g), d = Math.cos(g);
                    switch (this.mode) {
                        case this.EQUIT:
                            g = 1E-10 >= Math.abs(f) ? 0 : Math.asin(c * e / f);
                            b *= e;
                            c = d * f;
                            break;
                        case this.OBLIQ:
                            g = 1E-10 >= Math.abs(f) ? this.lat0 : Math.asin(d * this.sinph0 + c * e * this.cosph0 /
                                f);
                            b *= e * this.cosph0;
                            c = (d - Math.sin(g) * this.sinph0) * f;
                            break;
                        case this.N_POLE:
                            c = -c;
                            g = m - g;
                            break;
                        case this.S_POLE:
                            g -= m
                    }
                    b = 0 !== c || this.mode !== this.EQUIT && this.mode !== this.OBLIQ ? Math.atan2(b, c) : 0
                } else {
                    g = 0;
                    if (this.mode === this.OBLIQ || this.mode === this.EQUIT) {
                        b /= this.dd;
                        c *= this.dd;
                        e = Math.sqrt(b * b + c * c);
                        if (1E-10 > e) return a.x = this.long0, a.y = this.lat0, a;
                        f = 2 * Math.asin(.5 * e / this.rq);
                        d = Math.cos(f);
                        b *= f = Math.sin(f);
                        this.mode === this.OBLIQ ? (g = d * this.sinb1 + c * f * this.cosb1 / e, c = e * this.cosb1 * d - c * this.sinb1 * f) : (g = c * f / e, c = e *
                            d)
                    } else if (this.mode === this.N_POLE || this.mode === this.S_POLE) {
                        this.mode === this.N_POLE && (c = -c);
                        g = b * b + c * c;
                        if (!g) return a.x = this.long0, a.y = this.lat0, a;
                        g = 1 - g / this.qp;
                        this.mode === this.S_POLE && (g = -g)
                    }
                    b = Math.atan2(b, c);
                    c = Math.asin(g);
                    g = this.apa;
                    d = c + c;
                    g = c + g[0] * Math.sin(d) + g[1] * Math.sin(d + d) + g[2] * Math.sin(d + d + d)
                }
                a.x = n(this.long0 + b);
                a.y = g;
                return a
            },
            names: ["Lambert Azimuthal Equal Area", "Lambert_Azimuthal_Equal_Area", "laea"],
            S_POLE: 1,
            N_POLE: 2,
            EQUIT: 3,
            OBLIQ: 4
        },
        G = function(a) {
            1 < Math.abs(a) && (a = 1 < a ? 1 : -1);
            return Math.asin(a)
        },
        pb = {
            init: function() {
                1E-10 > Math.abs(this.lat1 + this.lat2) || (this.temp = this.b / this.a, this.es = 1 - Math.pow(this.temp, 2), this.e3 = Math.sqrt(this.es), this.sin_po = Math.sin(this.lat1), this.cos_po = Math.cos(this.lat1), this.con = this.t1 = this.sin_po, this.ms1 = D(this.e3, this.sin_po, this.cos_po), this.qs1 = F(this.e3, this.sin_po, this.cos_po), this.sin_po = Math.sin(this.lat2), this.cos_po = Math.cos(this.lat2), this.t2 = this.sin_po, this.ms2 = D(this.e3, this.sin_po, this.cos_po), this.qs2 = F(this.e3, this.sin_po, this.cos_po), this.sin_po =
                    Math.sin(this.lat0), this.cos_po = Math.cos(this.lat0), this.t3 = this.sin_po, this.qs0 = F(this.e3, this.sin_po, this.cos_po), this.ns0 = 1E-10 < Math.abs(this.lat1 - this.lat2) ? (this.ms1 * this.ms1 - this.ms2 * this.ms2) / (this.qs2 - this.qs1) : this.con, this.c = this.ms1 * this.ms1 + this.ns0 * this.qs1, this.rh = this.a * Math.sqrt(this.c - this.ns0 * this.qs0) / this.ns0)
            },
            forward: function(a) {
                var b = a.x,
                    c = a.y;
                this.sin_phi = Math.sin(c);
                this.cos_phi = Math.cos(c);
                c = F(this.e3, this.sin_phi, this.cos_phi);
                c = this.a * Math.sqrt(this.c - this.ns0 * c) / this.ns0;
                b = this.ns0 * n(b - this.long0);
                var d = this.rh - c * Math.cos(b) + this.y0;
                a.x = c * Math.sin(b) + this.x0;
                a.y = d;
                return a
            },
            inverse: function(a) {
                a.x -= this.x0;
                a.y = this.rh - a.y + this.y0;
                if (0 <= this.ns0) {
                    var b = Math.sqrt(a.x * a.x + a.y * a.y);
                    var c = 1
                } else b = -Math.sqrt(a.x * a.x + a.y * a.y), c = -1;
                var d = 0;
                0 !== b && (d = Math.atan2(c * a.x, c * a.y));
                c = b * this.ns0 / this.a;
                this.sphere ? b = Math.asin((this.c - c * c) / (2 * this.ns0)) : (b = (this.c - c * c) / this.ns0, b = this.phi1z(this.e3, b));
                d = n(d / this.ns0 + this.long0);
                a.x = d;
                a.y = b;
                return a
            },
            names: ["Albers_Conic_Equal_Area",
                "Albers", "aea"
            ],
            phi1z: function(a, b) {
                var c = G(.5 * b);
                if (1E-10 > a) return c;
                for (var d = a * a, e = 1; 25 >= e; e++) {
                    var f = Math.sin(c);
                    var g = Math.cos(c);
                    var h = a * f;
                    var k = 1 - h * h;
                    f = .5 * k * k / g * (b / (1 - d) - f / k + .5 / a * Math.log((1 - h) / (1 + h)));
                    c += f;
                    if (1E-7 >= Math.abs(f)) return c
                }
                return null
            }
        },
        qb = {
            init: function() {
                this.sin_p14 = Math.sin(this.lat0);
                this.cos_p14 = Math.cos(this.lat0);
                this.infinity_dist = 1E3 * this.a;
                this.rc = 1
            },
            forward: function(a) {
                var b = a.y;
                var c = n(a.x - this.long0);
                var d = Math.sin(b);
                b = Math.cos(b);
                var e = Math.cos(c);
                var f = this.sin_p14 *
                    d + this.cos_p14 * b * e;
                0 < f || 1E-10 >= Math.abs(f) ? (c = this.x0 + 1 * this.a * b * Math.sin(c) / f, d = this.y0 + 1 * this.a * (this.cos_p14 * d - this.sin_p14 * b * e) / f) : (c = this.x0 + this.infinity_dist * b * Math.sin(c), d = this.y0 + this.infinity_dist * (this.cos_p14 * d - this.sin_p14 * b * e));
                a.x = c;
                a.y = d;
                return a
            },
            inverse: function(a) {
                var b;
                a.x = (a.x - this.x0) / this.a;
                a.y = (a.y - this.y0) / this.a;
                a.x /= this.k0;
                a.y /= this.k0;
                if (b = Math.sqrt(a.x * a.x + a.y * a.y)) {
                    var c = Math.atan2(b, this.rc);
                    var d = Math.sin(c);
                    var e = Math.cos(c);
                    c = G(e * this.sin_p14 + a.y * d * this.cos_p14 /
                        b);
                    b = Math.atan2(a.x * d, b * this.cos_p14 * e - a.y * this.sin_p14 * d);
                    b = n(this.long0 + b)
                } else c = this.phic0, b = 0;
                a.x = b;
                a.y = c;
                return a
            },
            names: ["gnom"]
        },
        rb = {
            init: function() {
                this.sphere || (this.k0 = D(this.e, Math.sin(this.lat_ts), Math.cos(this.lat_ts)))
            },
            forward: function(a) {
                var b = a.y;
                var c = n(a.x - this.long0);
                this.sphere ? (c = this.x0 + this.a * c * Math.cos(this.lat_ts), b = this.y0 + this.a * Math.sin(b) / Math.cos(this.lat_ts)) : (b = F(this.e, Math.sin(b)), c = this.x0 + this.a * this.k0 * c, b = this.y0 + this.a * b * .5 / this.k0);
                a.x = c;
                a.y = b;
                return a
            },
            inverse: function(a) {
                a.x -=
                    this.x0;
                a.y -= this.y0;
                if (this.sphere) {
                    var b = n(this.long0 + a.x / this.a / Math.cos(this.lat_ts));
                    var c = Math.asin(a.y / this.a * Math.cos(this.lat_ts))
                } else {
                    a: if (b = this.e, c = 2 * a.y * this.k0 / this.a, 1E-6 > Math.abs(Math.abs(c) - (1 - (1 - b * b) / (2 * b) * Math.log((1 - b) / (1 + b))))) c = 0 > c ? -1 * m : m;
                        else {
                            for (var d = Math.asin(.5 * c), e, f, g, h = 0; 30 > h; h++)
                                if (e = Math.sin(d), f = Math.cos(d), g = b * e, e = Math.pow(1 - g * g, 2) / (2 * f) * (c / (1 - b * b) - e / (1 - g * g) + .5 / b * Math.log((1 - g) / (1 + g))), d += e, 1E-10 >= Math.abs(e)) {
                                    c = d;
                                    break a
                                } c = NaN
                        }b = n(this.long0 + a.x / (this.a * this.k0))
                }
                a.x =
                    b;
                a.y = c;
                return a
            },
            names: ["cea"]
        },
        sb = {
            init: function() {
                this.x0 = this.x0 || 0;
                this.y0 = this.y0 || 0;
                this.lat0 = this.lat0 || 0;
                this.long0 = this.long0 || 0;
                this.lat_ts = this.lat_ts || 0;
                this.title = this.title || "Equidistant Cylindrical (Plate Carre)";
                this.rc = Math.cos(this.lat_ts)
            },
            forward: function(a) {
                var b = a.y,
                    c = n(a.x - this.long0);
                b = L(b - this.lat0);
                a.x = this.x0 + this.a * c * this.rc;
                a.y = this.y0 + this.a * b;
                return a
            },
            inverse: function(a) {
                var b = a.y;
                a.x = n(this.long0 + (a.x - this.x0) / (this.a * this.rc));
                a.y = L(this.lat0 + (b - this.y0) / this.a);
                return a
            },
            names: ["Equirectangular", "Equidistant_Cylindrical", "eqc"]
        },
        tb = {
            init: function() {
                this.temp = this.b / this.a;
                this.es = 1 - Math.pow(this.temp, 2);
                this.e = Math.sqrt(this.es);
                this.e0 = N(this.es);
                this.e1 = O(this.es);
                this.e2 = P(this.es);
                this.e3 = Q(this.es);
                this.ml0 = this.a * v(this.e0, this.e1, this.e2, this.e3, this.lat0)
            },
            forward: function(a) {
                var b = a.y;
                var c = n(a.x - this.long0);
                var d = c * Math.sin(b);
                if (this.sphere) 1E-10 >= Math.abs(b) ? (c *= this.a, b = -1 * this.a * this.lat0) : (c = this.a * Math.sin(d) / Math.tan(b), b = this.a * (L(b - this.lat0) +
                    (1 - Math.cos(d)) / Math.tan(b)));
                else if (1E-10 >= Math.abs(b)) c *= this.a, b = -1 * this.ml0;
                else {
                    var e = K(this.a, this.e, Math.sin(b)) / Math.tan(b);
                    c = e * Math.sin(d);
                    b = this.a * v(this.e0, this.e1, this.e2, this.e3, b) - this.ml0 + e * (1 - Math.cos(d))
                }
                a.x = c + this.x0;
                a.y = b + this.y0;
                return a
            },
            inverse: function(a) {
                var b = a.x - this.x0;
                var c = a.y - this.y0;
                if (this.sphere)
                    if (1E-10 >= Math.abs(c + this.a * this.lat0)) {
                        b = n(b / this.a + this.long0);
                        var d = 0
                    } else {
                        var e = this.lat0 + c / this.a;
                        var f = b * b / this.a / this.a + e * e;
                        var g = e;
                        for (c = 20; c; --c) {
                            var h = Math.tan(g);
                            h = -1 * (e * (g * h + 1) - g - .5 * (g * g + f) * h) / ((g - e) / h - 1);
                            g += h;
                            if (1E-10 >= Math.abs(h)) {
                                d = g;
                                break
                            }
                        }
                        b = n(this.long0 + Math.asin(b * Math.tan(g) / this.a) / Math.sin(d))
                    }
                else if (1E-10 >= Math.abs(c + this.ml0)) d = 0, b = n(this.long0 + b / this.a);
                else {
                    e = (this.ml0 + c) / this.a;
                    f = b * b / this.a / this.a + e * e;
                    g = e;
                    for (c = 20; c; --c) {
                        h = this.e * Math.sin(g);
                        h = Math.sqrt(1 - h * h) * Math.tan(g);
                        var k = this.a * v(this.e0, this.e1, this.e2, this.e3, g);
                        var l = this.e0 - 2 * this.e1 * Math.cos(2 * g) + 4 * this.e2 * Math.cos(4 * g) - 6 * this.e3 * Math.cos(6 * g);
                        k /= this.a;
                        h = (e * (h * k + 1) - k - .5 * h * (k * k +
                            f)) / (this.es * Math.sin(2 * g) * (k * k + f - 2 * e * k) / (4 * h) + (e - k) * (h * l - 2 / Math.sin(2 * g)) - l);
                        g -= h;
                        if (1E-10 >= Math.abs(h)) {
                            d = g;
                            break
                        }
                    }
                    h = Math.sqrt(1 - this.es * Math.pow(Math.sin(d), 2)) * Math.tan(d);
                    b = n(this.long0 + Math.asin(b * h / this.a) / Math.sin(d))
                }
                a.x = b;
                a.y = d;
                return a
            },
            names: ["Polyconic", "poly"]
        },
        ub = {
            init: function() {
                this.A = [];
                this.A[1] = .6399175073;
                this.A[2] = -.1358797613;
                this.A[3] = .063294409;
                this.A[4] = -.02526853;
                this.A[5] = .0117879;
                this.A[6] = -.0055161;
                this.A[7] = .0026906;
                this.A[8] = -.001333;
                this.A[9] = 6.7E-4;
                this.A[10] = -3.4E-4;
                this.B_re = [];
                this.B_im = [];
                this.B_re[1] = .7557853228;
                this.B_im[1] = 0;
                this.B_re[2] = .249204646;
                this.B_im[2] = .003371507;
                this.B_re[3] = -.001541739;
                this.B_im[3] = .04105856;
                this.B_re[4] = -.10162907;
                this.B_im[4] = .01727609;
                this.B_re[5] = -.26623489;
                this.B_im[5] = -.36249218;
                this.B_re[6] = -.6870983;
                this.B_im[6] = -1.1651967;
                this.C_re = [];
                this.C_im = [];
                this.C_re[1] = 1.3231270439;
                this.C_im[1] = 0;
                this.C_re[2] = -.577245789;
                this.C_im[2] = -.007809598;
                this.C_re[3] = .508307513;
                this.C_im[3] = -.112208952;
                this.C_re[4] = -.15094762;
                this.C_im[4] =
                    .18200602;
                this.C_re[5] = 1.01418179;
                this.C_im[5] = 1.64497696;
                this.C_re[6] = 1.9660549;
                this.C_im[6] = 2.5127645;
                this.D = [];
                this.D[1] = 1.5627014243;
                this.D[2] = .5185406398;
                this.D[3] = -.03333098;
                this.D[4] = -.1052906;
                this.D[5] = -.0368594;
                this.D[6] = .007317;
                this.D[7] = .0122;
                this.D[8] = .00394;
                this.D[9] = -.0013
            },
            forward: function(a) {
                var b, c = a.x - this.long0,
                    d = (a.y - this.lat0) / 4.84813681109536E-6 * 1E-5,
                    e = 1,
                    f = 0;
                for (b = 1; 10 >= b; b++) e *= d, f += this.A[b] * e;
                d = f;
                e = 1;
                var g = 0,
                    h = 0,
                    k = 0;
                for (b = 1; 6 >= b; b++) f = e * d - g * c, g = g * d + e * c, e = f, h = h + this.B_re[b] *
                    e - this.B_im[b] * g, k = k + this.B_im[b] * e + this.B_re[b] * g;
                a.x = k * this.a + this.x0;
                a.y = h * this.a + this.y0;
                return a
            },
            inverse: function(a) {
                var b, c = (a.y - this.y0) / this.a,
                    d = (a.x - this.x0) / this.a,
                    e = 1,
                    f = 0,
                    g = 0,
                    h = 0;
                for (b = 1; 6 >= b; b++) {
                    var k = e * c - f * d;
                    f = f * c + e * d;
                    e = k;
                    g = g + this.C_re[b] * e - this.C_im[b] * f;
                    h = h + this.C_im[b] * e + this.C_re[b] * f
                }
                for (e = 0; e < this.iterations; e++) {
                    var l = g,
                        p = h;
                    k = c;
                    f = d;
                    for (b = 2; 6 >= b; b++) {
                        var r = l * g - p * h;
                        p = p * g + l * h;
                        l = r;
                        k += (b - 1) * (this.B_re[b] * l - this.B_im[b] * p);
                        f += (b - 1) * (this.B_im[b] * l + this.B_re[b] * p)
                    }
                    l = 1;
                    p = 0;
                    var y = this.B_re[1],
                        z = this.B_im[1];
                    for (b = 2; 6 >= b; b++) r = l * g - p * h, p = p * g + l * h, l = r, y += b * (this.B_re[b] * l - this.B_im[b] * p), z += b * (this.B_im[b] * l + this.B_re[b] * p);
                    h = y * y + z * z;
                    g = (k * y + f * z) / h;
                    h = (f * y - k * z) / h
                }
                c = g;
                d = 1;
                g = 0;
                for (b = 1; 9 >= b; b++) d *= c, g += this.D[b] * d;
                b = this.lat0 + .484813681109536 * g;
                a.x = this.long0 + h;
                a.y = b;
                return a
            },
            names: ["New_Zealand_Map_Grid", "nzmg"]
        },
        vb = {
            init: function() {},
            forward: function(a) {
                var b = a.y,
                    c = n(a.x - this.long0);
                b = this.y0 + this.a * Math.log(Math.tan(Math.PI / 4 + b / 2.5)) * 1.25;
                a.x = this.x0 + this.a * c;
                a.y = b;
                return a
            },
            inverse: function(a) {
                a.x -=
                    this.x0;
                a.y -= this.y0;
                var b = n(this.long0 + a.x / this.a),
                    c = 2.5 * (Math.atan(Math.exp(.8 * a.y / this.a)) - Math.PI / 4);
                a.x = b;
                a.y = c;
                return a
            },
            names: ["Miller_Cylindrical", "mill"]
        },
        wb = {
            init: function() {
                this.sphere ? (this.n = 1, this.es = this.m = 0, this.C_y = Math.sqrt((this.m + 1) / this.n), this.C_x = this.C_y / (this.m + 1)) : this.en = Fa(this.es)
            },
            forward: function(a) {
                var b = a.x;
                var c = a.y;
                b = n(b - this.long0);
                if (this.sphere) {
                    if (this.m)
                        for (var d = this.n * Math.sin(c), e = 20; e; --e) {
                            var f = (this.m * c + Math.sin(c) - d) / (this.m + Math.cos(c));
                            c -= f;
                            if (1E-10 >
                                Math.abs(f)) break
                        } else c = 1 !== this.n ? Math.asin(this.n * Math.sin(c)) : c;
                    b = this.a * this.C_x * b * (this.m + Math.cos(c));
                    c *= this.a * this.C_y
                } else d = Math.sin(c), e = Math.cos(c), c = this.a * Z(c, d, e, this.en), b = this.a * b * e / Math.sqrt(1 - this.es * d * d);
                a.x = b;
                a.y = c;
                return a
            },
            inverse: function(a) {
                a.x -= this.x0;
                var b = a.x / this.a;
                a.y -= this.y0;
                var c = a.y / this.a;
                if (this.sphere) c /= this.C_y, b /= this.C_x * (this.m + Math.cos(c)), this.m ? c = G((this.m * c + Math.sin(c)) / this.n) : 1 !== this.n && (c = G(Math.sin(c) / this.n)), b = n(b + this.long0), c = L(c);
                else {
                    c = Ga(a.y /
                        this.a, this.es, this.en);
                    var d = Math.abs(c);
                    d < m ? (d = Math.sin(c), b = this.long0 + a.x * Math.sqrt(1 - this.es * d * d) / (this.a * Math.cos(c)), b = n(b)) : d - 1E-10 < m && (b = this.long0)
                }
                a.x = b;
                a.y = c;
                return a
            },
            names: ["Sinusoidal", "sinu"]
        },
        xb = {
            init: function() {},
            forward: function(a) {
                for (var b = a.y, c = n(a.x - this.long0), d = b, e = Math.PI * Math.sin(b);;) {
                    var f = -(d + Math.sin(d) - e) / (1 + Math.cos(d));
                    d += f;
                    if (1E-10 > Math.abs(f)) break
                }
                d /= 2;
                1E-10 > Math.PI / 2 - Math.abs(b) && (c = 0);
                b = 1.4142135623731 * this.a * Math.sin(d) + this.y0;
                a.x = .900316316158 * this.a * c * Math.cos(d) +
                    this.x0;
                a.y = b;
                return a
            },
            inverse: function(a) {
                a.x -= this.x0;
                a.y -= this.y0;
                var b = a.y / (1.4142135623731 * this.a);
                .999999999999 < Math.abs(b) && (b = .999999999999);
                b = Math.asin(b);
                var c = n(this.long0 + a.x / (.900316316158 * this.a * Math.cos(b)));
                c < -Math.PI && (c = -Math.PI);
                c > Math.PI && (c = Math.PI);
                b = (2 * b + Math.sin(2 * b)) / Math.PI;
                1 < Math.abs(b) && (b = 1);
                b = Math.asin(b);
                a.x = c;
                a.y = b;
                return a
            },
            names: ["Mollweide", "moll"]
        },
        yb = {
            init: function() {
                1E-10 > Math.abs(this.lat1 + this.lat2) || (this.lat2 = this.lat2 || this.lat1, this.temp = this.b / this.a,
                    this.es = 1 - Math.pow(this.temp, 2), this.e = Math.sqrt(this.es), this.e0 = N(this.es), this.e1 = O(this.es), this.e2 = P(this.es), this.e3 = Q(this.es), this.sinphi = Math.sin(this.lat1), this.cosphi = Math.cos(this.lat1), this.ms1 = D(this.e, this.sinphi, this.cosphi), this.ml1 = v(this.e0, this.e1, this.e2, this.e3, this.lat1), 1E-10 > Math.abs(this.lat1 - this.lat2) ? this.ns = this.sinphi : (this.sinphi = Math.sin(this.lat2), this.cosphi = Math.cos(this.lat2), this.ms2 = D(this.e, this.sinphi, this.cosphi), this.ml2 = v(this.e0, this.e1, this.e2, this.e3,
                        this.lat2), this.ns = (this.ms1 - this.ms2) / (this.ml2 - this.ml1)), this.g = this.ml1 + this.ms1 / this.ns, this.ml0 = v(this.e0, this.e1, this.e2, this.e3, this.lat0), this.rh = this.a * (this.g - this.ml0))
            },
            forward: function(a) {
                var b = a.x,
                    c = a.y;
                this.sphere ? c = this.a * (this.g - c) : (c = v(this.e0, this.e1, this.e2, this.e3, c), c = this.a * (this.g - c));
                b = this.ns * n(b - this.long0);
                var d = this.y0 + this.rh - c * Math.cos(b);
                a.x = this.x0 + c * Math.sin(b);
                a.y = d;
                return a
            },
            inverse: function(a) {
                a.x -= this.x0;
                a.y = this.rh - a.y + this.y0;
                if (0 <= this.ns) {
                    var b = Math.sqrt(a.x *
                        a.x + a.y * a.y);
                    var c = 1
                } else b = -Math.sqrt(a.x * a.x + a.y * a.y), c = -1;
                var d = 0;
                0 !== b && (d = Math.atan2(c * a.x, c * a.y));
                this.sphere ? (d = n(this.long0 + d / this.ns), b = L(this.g - b / this.a)) : (b = ca(this.g - b / this.a, this.e0, this.e1, this.e2, this.e3), d = n(this.long0 + d / this.ns));
                a.x = d;
                a.y = b;
                return a
            },
            names: ["Equidistant_Conic", "eqdc"]
        },
        zb = {
            init: function() {
                this.R = this.a
            },
            forward: function(a) {
                var b = a.y,
                    c = n(a.x - this.long0),
                    d = G(2 * Math.abs(b / Math.PI)),
                    e = .5 * Math.abs(Math.PI / c - c / Math.PI),
                    f = e * e,
                    g = Math.sin(d);
                d = Math.cos(d);
                d /= g + d - 1;
                g = d * (2 /
                    g - 1);
                var h = g * g,
                    k = Math.PI * this.R * (e * (d - h) + Math.sqrt(f * (d - h) * (d - h) - (h + f) * (d * d - h))) / (h + f);
                0 > c && (k = -k);
                c = this.x0 + k;
                d = f + d;
                k = Math.PI * this.R * (g * d - e * Math.sqrt((h + f) * (f + 1) - d * d)) / (h + f);
                b = 0 <= b ? this.y0 + k : this.y0 - k;
                a.x = c;
                a.y = b;
                return a
            },
            inverse: function(a) {
                a.x -= this.x0;
                a.y -= this.y0;
                var b = Math.PI * this.R;
                var c = a.x / b;
                var d = a.y / b;
                var e = c * c + d * d;
                b = -Math.abs(d) * (1 + e);
                var f = b - 2 * d * d + c * c;
                var g = -2 * b + 1 + 2 * d * d + e * e;
                var h = (b - f * f / 3 / g) / g;
                var k = 2 * Math.sqrt(-h / 3);
                b = 3 * (d * d / g + (2 * f * f * f / g / g / g - 9 * b * f / g / g) / 27) / h / k;
                1 < Math.abs(b) && (b = 0 <=
                    b ? 1 : -1);
                b = Math.acos(b) / 3;
                f = 0 <= a.y ? (-k * Math.cos(b + Math.PI / 3) - f / 3 / g) * Math.PI : -(-k * Math.cos(b + Math.PI / 3) - f / 3 / g) * Math.PI;
                c = 1E-10 > Math.abs(c) ? this.long0 : n(this.long0 + Math.PI * (e - 1 + Math.sqrt(1 + 2 * (c * c - d * d) + e * e)) / 2 / c);
                a.x = c;
                a.y = f;
                return a
            },
            names: ["Van_der_Grinten_I", "VanDerGrinten", "vandg"]
        },
        Ab = {
            init: function() {
                this.sin_p12 = Math.sin(this.lat0);
                this.cos_p12 = Math.cos(this.lat0)
            },
            forward: function(a) {
                var b = a.y,
                    c = Math.sin(a.y),
                    d = Math.cos(a.y),
                    e = n(a.x - this.long0);
                if (this.sphere) 1E-10 >= Math.abs(this.sin_p12 - 1) ? (a.x =
                    this.x0 + this.a * (m - b) * Math.sin(e), a.y = this.y0 - this.a * (m - b) * Math.cos(e)) : 1E-10 >= Math.abs(this.sin_p12 + 1) ? (a.x = this.x0 + this.a * (m + b) * Math.sin(e), a.y = this.y0 + this.a * (m + b) * Math.cos(e)) : (b = this.sin_p12 * c + this.cos_p12 * d * Math.cos(e), b = (b = Math.acos(b)) ? b / Math.sin(b) : 1, a.x = this.x0 + this.a * b * d * Math.sin(e), a.y = this.y0 + this.a * b * (this.cos_p12 * c - this.sin_p12 * d * Math.cos(e)));
                else {
                    var f = N(this.es);
                    var g = O(this.es);
                    var h = P(this.es);
                    var k = Q(this.es);
                    if (1E-10 >= Math.abs(this.sin_p12 - 1)) d = this.a * v(f, g, h, k, m), b = this.a * v(f,
                        g, h, k, b), a.x = this.x0 + (d - b) * Math.sin(e), a.y = this.y0 - (d - b) * Math.cos(e);
                    else if (1E-10 >= Math.abs(this.sin_p12 + 1)) d = this.a * v(f, g, h, k, m), b = this.a * v(f, g, h, k, b), a.x = this.x0 + (d + b) * Math.sin(e), a.y = this.y0 + (d + b) * Math.cos(e);
                    else {
                        f = c / d;
                        b = K(this.a, this.e, this.sin_p12);
                        c = K(this.a, this.e, c);
                        c = Math.atan((1 - this.es) * f + this.es * b * this.sin_p12 / (c * d));
                        d = Math.atan2(Math.sin(e), this.cos_p12 * Math.tan(c) - this.sin_p12 * Math.cos(e));
                        f = 0 === d ? Math.asin(this.cos_p12 * Math.sin(c) - this.sin_p12 * Math.cos(c)) : 1E-10 >= Math.abs(Math.abs(d) -
                            Math.PI) ? -Math.asin(this.cos_p12 * Math.sin(c) - this.sin_p12 * Math.cos(c)) : Math.asin(Math.sin(e) * Math.cos(c) / Math.sin(d));
                        e = this.e * this.sin_p12 / Math.sqrt(1 - this.es);
                        g = this.e * this.cos_p12 * Math.cos(d) / Math.sqrt(1 - this.es);
                        c = e * g;
                        g *= g;
                        h = f * f;
                        k = h * f;
                        var l = k * f;
                        b = b * f * (1 - h * g * (1 - g) / 6 + k / 8 * c * (1 - 2 * g) + l / 120 * (g * (4 - 7 * g) - 3 * e * e * (1 - 7 * g)) - l * f / 48 * c);
                        a.x = this.x0 + b * Math.sin(d);
                        a.y = this.y0 + b * Math.cos(d)
                    }
                }
                return a
            },
            inverse: function(a) {
                a.x -= this.x0;
                a.y -= this.y0;
                if (this.sphere) {
                    var b = Math.sqrt(a.x * a.x + a.y * a.y);
                    if (b > 2 * m * this.a) return;
                    var c = b / this.a;
                    var d = Math.sin(c);
                    var e = Math.cos(c);
                    c = this.long0;
                    if (1E-10 >= Math.abs(b)) var f = this.lat0;
                    else f = G(e * this.sin_p12 + a.y * d * this.cos_p12 / b), c = Math.abs(this.lat0) - m, c = 1E-10 >= Math.abs(c) ? 0 <= this.lat0 ? n(this.long0 + Math.atan2(a.x, -a.y)) : n(this.long0 - Math.atan2(-a.x, a.y)) : n(this.long0 + Math.atan2(a.x * d, b * this.cos_p12 * e - a.y * this.sin_p12 * d))
                } else if (c = N(this.es), d = O(this.es), e = P(this.es), f = Q(this.es), 1E-10 >= Math.abs(this.sin_p12 - 1)) {
                    var g = this.a * v(c, d, e, f, m);
                    b = Math.sqrt(a.x * a.x + a.y * a.y);
                    f = ca((g - b) /
                        this.a, c, d, e, f);
                    c = n(this.long0 + Math.atan2(a.x, -1 * a.y))
                } else 1E-10 >= Math.abs(this.sin_p12 + 1) ? (g = this.a * v(c, d, e, f, m), b = Math.sqrt(a.x * a.x + a.y * a.y), f = ca((b - g) / this.a, c, d, e, f), c = n(this.long0 + Math.atan2(a.x, a.y))) : (b = Math.sqrt(a.x * a.x + a.y * a.y), c = Math.atan2(a.x, a.y), f = K(this.a, this.e, this.sin_p12), d = Math.cos(c), e = this.e * this.cos_p12 * d, e = -e * e / (1 - this.es), g = 3 * this.es * (1 - e) * this.sin_p12 * this.cos_p12 * d / (1 - this.es), f = b / f, b = f - e * (1 + e) * Math.pow(f, 3) / 6 - g * (1 + 3 * e) * Math.pow(f, 4) / 24, e = 1 - e * b * b / 2 - f * b * b * b / 6, d = Math.asin(this.sin_p12 *
                    Math.cos(b) + this.cos_p12 * Math.sin(b) * d), c = n(this.long0 + Math.asin(Math.sin(c) * Math.sin(b) / Math.cos(d))), b = Math.sin(d), f = Math.atan2((b - this.es * e * this.sin_p12) * Math.tan(d), b * (1 - this.es)));
                a.x = c;
                a.y = f;
                return a
            },
            names: ["Azimuthal_Equidistant", "aeqd"]
        },
        Bb = {
            init: function() {
                this.sin_p14 = Math.sin(this.lat0);
                this.cos_p14 = Math.cos(this.lat0)
            },
            forward: function(a) {
                var b = a.y;
                var c = n(a.x - this.long0);
                var d = Math.sin(b);
                b = Math.cos(b);
                var e = Math.cos(c);
                var f = this.sin_p14 * d + this.cos_p14 * b * e;
                if (0 < f || 1E-10 >= Math.abs(f)) {
                    var g =
                        1 * this.a * b * Math.sin(c);
                    var h = this.y0 + 1 * this.a * (this.cos_p14 * d - this.sin_p14 * b * e)
                }
                a.x = g;
                a.y = h;
                return a
            },
            inverse: function(a) {
                a.x -= this.x0;
                a.y -= this.y0;
                var b = Math.sqrt(a.x * a.x + a.y * a.y);
                var c = G(b / this.a);
                var d = Math.sin(c);
                c = Math.cos(c);
                var e = this.long0;
                if (1E-10 >= Math.abs(b)) {
                    var f = this.lat0;
                    a.x = e;
                    a.y = f;
                    return a
                }
                f = G(c * this.sin_p14 + a.y * d * this.cos_p14 / b);
                if (1E-10 >= Math.abs(Math.abs(this.lat0) - m)) return e = 0 <= this.lat0 ? n(this.long0 + Math.atan2(a.x, -a.y)) : n(this.long0 - Math.atan2(-a.x, a.y)), a.x = e, a.y = f, a;
                e = n(this.long0 +
                    Math.atan2(a.x * d, b * this.cos_p14 * c - a.y * this.sin_p14 * d));
                a.x = e;
                a.y = f;
                return a
            },
            names: ["ortho"]
        },
        q = {
            AREA_0: 1,
            AREA_1: 2,
            AREA_2: 3,
            AREA_3: 4
        },
        Cb = {
            init: function() {
                this.x0 = this.x0 || 0;
                this.y0 = this.y0 || 0;
                this.lat0 = this.lat0 || 0;
                this.long0 = this.long0 || 0;
                this.lat_ts = this.lat_ts || 0;
                this.title = this.title || "Quadrilateralized Spherical Cube";
                this.face = this.lat0 >= m - t / 2 ? 5 : this.lat0 <= -(m - t / 2) ? 6 : Math.abs(this.long0) <= t ? 1 : Math.abs(this.long0) <= m + t ? 0 < this.long0 ? 2 : 4 : 3;
                0 !== this.es && (this.one_minus_f = 1 - (this.a - this.b) / this.a,
                    this.one_minus_f_squared = this.one_minus_f * this.one_minus_f)
            },
            forward: function(a) {
                var b = {
                    value: 0
                };
                a.x -= this.long0;
                var c = 0 !== this.es ? Math.atan(this.one_minus_f_squared * Math.tan(a.y)) : a.y;
                var d = a.x;
                if (5 === this.face) c = m - c, d >= t && d <= m + t ? (b.value = q.AREA_0, d -= m) : d > m + t || d <= -(m + t) ? (b.value = q.AREA_1, d = 0 < d ? d - 3.14159265359 : d + 3.14159265359) : d > -(m + t) && d <= -t ? (b.value = q.AREA_2, d += m) : b.value = q.AREA_3;
                else if (6 === this.face) c = m + c, d >= t && d <= m + t ? (b.value = q.AREA_0, d = -d + m) : d < t && d >= -t ? (b.value = q.AREA_1, d = -d) : d < -t && d >= -(m +
                    t) ? (b.value = q.AREA_2, d = -d - m) : (b.value = q.AREA_3, d = 0 < d ? -d + 3.14159265359 : -d - 3.14159265359);
                else {
                    2 === this.face ? d = J(d, +m) : 3 === this.face ? d = J(d, 3.14159265359) : 4 === this.face && (d = J(d, -m));
                    var e = Math.sin(c);
                    c = Math.cos(c);
                    var f = Math.sin(d);
                    d = c * Math.cos(d);
                    f *= c;
                    1 === this.face ? (c = Math.acos(d), d = X(c, e, f, b)) : 2 === this.face ? (c = Math.acos(f), d = X(c, e, -d, b)) : 3 === this.face ? (c = Math.acos(-d), d = X(c, e, -f, b)) : 4 === this.face ? (c = Math.acos(-f), d = X(c, e, d, b)) : (c = d = 0, b.value = q.AREA_0)
                }
                e = Math.atan(3.8197186342052367 * (d + Math.acos(Math.sin(d) *
                    Math.cos(t)) - m));
                c = Math.sqrt((1 - Math.cos(c)) / (Math.cos(e) * Math.cos(e)) / (1 - Math.cos(Math.atan(1 / Math.cos(d)))));
                b.value === q.AREA_1 ? e += m : b.value === q.AREA_2 ? e += 3.14159265359 : b.value === q.AREA_3 && (e += 1.5 * 3.14159265359);
                b = c * Math.cos(e);
                e = c * Math.sin(e);
                b = b * this.a + this.x0;
                e = e * this.a + this.y0;
                a.x = b;
                a.y = e;
                return a
            },
            inverse: function(a) {
                a.x = (a.x - this.x0) / this.a;
                a.y = (a.y - this.y0) / this.a;
                var b = Math.atan(Math.sqrt(a.x * a.x + a.y * a.y));
                var c = Math.atan2(a.y, a.x);
                if (0 <= a.x && a.x >= Math.abs(a.y)) var d = q.AREA_0;
                else 0 <= a.y &&
                    a.y >= Math.abs(a.x) ? (d = q.AREA_1, c -= m) : 0 > a.x && -a.x >= Math.abs(a.y) ? (d = q.AREA_2, c = 0 > c ? c + 3.14159265359 : c - 3.14159265359) : (d = q.AREA_3, c += m);
                var e = 3.14159265359 / 12 * Math.tan(c);
                var f = Math.atan(Math.sin(e) / (Math.cos(e) - 1 / Math.sqrt(2)));
                e = Math.cos(c);
                b = Math.tan(b);
                e = 1 - e * e * b * b * (1 - Math.cos(Math.atan(1 / Math.cos(f)))); - 1 > e ? e = -1 : 1 < e && (e = 1);
                5 === this.face ? (e = Math.acos(e), e = m - e, d = d === q.AREA_0 ? f + m : d === q.AREA_1 ? 0 > f ? f + 3.14159265359 : f - 3.14159265359 : d === q.AREA_2 ? f - m : f) : 6 === this.face ? (e = Math.acos(e), e -= m, d = d === q.AREA_0 ? -f +
                    m : d === q.AREA_1 ? -f : d === q.AREA_2 ? -f - m : 0 > f ? -f - 3.14159265359 : -f + 3.14159265359) : (b = e, e = b * b, c = 1 <= e ? 0 : Math.sqrt(1 - e) * Math.sin(f), e += c * c, f = 1 <= e ? 0 : Math.sqrt(1 - e), d === q.AREA_1 ? (e = f, f = -c, c = e) : d === q.AREA_2 ? (f = -f, c = -c) : d === q.AREA_3 && (e = f, f = c, c = -e), 2 === this.face ? (e = b, b = -f, f = e) : 3 === this.face ? (b = -b, f = -f) : 4 === this.face && (e = b, b = f, f = -e), e = Math.acos(-c) - m, d = Math.atan2(f, b), 2 === this.face ? d = J(d, -m) : 3 === this.face ? d = J(d, -3.14159265359) : 4 === this.face && (d = J(d, +m)));
                0 !== this.es && (f = 0 > e ? 1 : 0, e = Math.tan(e), e = this.b / Math.sqrt(e *
                    e + this.one_minus_f_squared), e = Math.atan(Math.sqrt(this.a * this.a - e * e) / (this.one_minus_f * e)), f && (e = -e));
                d += this.long0;
                a.x = d;
                a.y = e;
                return a
            },
            names: ["Quadrilateralized Spherical Cube", "Quadrilateralized_Spherical_Cube", "qsc"]
        },
        ma = [
            [1, 2.2199E-17, -7.15515E-5, 3.1103E-6],
            [.9986, -4.82243E-4, -2.4897E-5, -1.3309E-6],
            [.9954, -8.3103E-4, -4.48605E-5, -9.86701E-7],
            [.99, -.00135364, -5.9661E-5, 3.6777E-6],
            [.9822, -.00167442, -4.49547E-6, -5.72411E-6],
            [.973, -.00214868, -9.03571E-5, 1.8736E-8],
            [.96, -.00305085, -9.00761E-5, 1.64917E-6],
            [.9427, -.00382792, -6.53386E-5, -2.6154E-6],
            [.9216, -.00467746, -1.0457E-4, 4.81243E-6],
            [.8962, -.00536223, -3.23831E-5, -5.43432E-6],
            [.8679, -.00609363, -1.13898E-4, 3.32484E-6],
            [.835, -.00698325, -6.40253E-5, 9.34959E-7],
            [.7986, -.00755338, -5.00009E-5, 9.35324E-7],
            [.7597, -.00798324, -3.5971E-5, -2.27626E-6],
            [.7186, -.00851367, -7.01149E-5, -8.6303E-6],
            [.6732, -.00986209, -1.99569E-4, 1.91974E-5],
            [.6213, -.010418, 8.83923E-5, 6.24051E-6],
            [.5722, -.00906601, 1.82E-4, 6.24051E-6],
            [.5322, -.00677797, 2.75608E-4, 6.24051E-6]
        ],
        R = [
            [-5.20417E-18,
                .0124, 1.21431E-18, -8.45284E-11
            ],
            [.062, .0124, -1.26793E-9, 4.22642E-10],
            [.124, .0124, 5.07171E-9, -1.60604E-9],
            [.186, .0123999, -1.90189E-8, 6.00152E-9],
            [.248, .0124002, 7.10039E-8, -2.24E-8],
            [.31, .0123992, -2.64997E-7, 8.35986E-8],
            [.372, .0124029, 9.88983E-7, -3.11994E-7],
            [.434, .0123893, -3.69093E-6, -4.35621E-7],
            [.4958, .0123198, -1.02252E-5, -3.45523E-7],
            [.5571, .0121916, -1.54081E-5, -5.82288E-7],
            [.6176, .0119938, -2.41424E-5, -5.25327E-7],
            [.6769, .011713, -3.20223E-5, -5.16405E-7],
            [.7346, .0113541, -3.97684E-5, -6.09052E-7],
            [.7903, .0109107, -4.89042E-5, -1.04739E-6],
            [.8435, .0103431, -6.4615E-5, -1.40374E-9],
            [.8936, .00969686, -6.4636E-5, -8.547E-6],
            [.9394, .00840947, -1.92841E-4, -4.2106E-6],
            [.9761, .00616527, -2.56E-4, -4.2106E-6],
            [1, .00328947, -3.19159E-4, -4.2106E-6]
        ],
        da = function(a, b) {
            return a[0] + b * (a[1] + b * (a[2] + b * a[3]))
        },
        Db = {
            init: function() {
                this.x0 = this.x0 || 0;
                this.y0 = this.y0 || 0;
                this.long0 = this.long0 || 0;
                this.es = 0;
                this.title = this.title || "Robinson"
            },
            forward: function(a) {
                var b = n(a.x - this.long0),
                    c = Math.abs(a.y),
                    d = Math.floor(11.459155902616464 *
                        c);
                0 > d ? d = 0 : 18 <= d && (d = 17);
                c = 57.29577951308232 * (c - .08726646259971647 * d);
                b = {
                    x: da(ma[d], c) * b,
                    y: da(R[d], c)
                };
                0 > a.y && (b.y = -b.y);
                b.x = b.x * this.a * .8487 + this.x0;
                b.y = b.y * this.a * 1.3523 + this.y0;
                return b
            },
            inverse: function(a) {
                var b = {
                    x: (a.x - this.x0) / (.8487 * this.a),
                    y: Math.abs(a.y - this.y0) / (1.3523 * this.a)
                };
                if (1 <= b.y) b.x /= ma[18][0], b.y = 0 > a.y ? -m : m;
                else {
                    var c = Math.floor(18 * b.y);
                    for (0 > c ? c = 0 : 18 <= c && (c = 17);;)
                        if (R[c][0] > b.y) --c;
                        else if (R[c + 1][0] <= b.y) ++c;
                    else break;
                    var d = R[c],
                        e = 5 * (b.y - d[0]) / (R[c + 1][0] - d[0]);
                    e = Ua(function(f) {
                        return (da(d,
                            f) - b.y) / (d[1] + f * (2 * d[2] + 3 * f * d[3]))
                    }, e, 1E-10, 100);
                    b.x /= da(ma[c], e);
                    b.y = .017453292519943295 * (5 * c + e);
                    0 > a.y && (b.y = -b.y)
                }
                b.x = n(b.x + this.long0);
                return b
            },
            names: ["Robinson", "robin"]
        },
        Eb = {
            init: function() {
                this.name = "geocent"
            },
            forward: function(a) {
                return ta(a, this.es, this.a)
            },
            inverse: function(a) {
                return ua(a, this.es, this.a, this.b)
            },
            names: ["Geocentric", "geocentric", "geocent", "Geocent"]
        },
        S = {
            h: {
                def: 1E5,
                num: !0
            },
            azi: {
                def: 0,
                num: !0,
                degrees: !0
            },
            tilt: {
                def: 0,
                num: !0,
                degrees: !0
            },
            long0: {
                def: 0,
                num: !0
            },
            lat0: {
                def: 0,
                num: !0
            }
        },
        Fb = {
            init: function() {
                Object.keys(S).forEach(function(c) {
                    if ("undefined" === typeof this[c]) this[c] = S[c].def;
                    else {
                        if (S[c].num && isNaN(this[c])) throw Error("Invalid parameter value, must be numeric " + c + " = " + this[c]);
                        S[c].num && (this[c] = parseFloat(this[c]))
                    }
                    S[c].degrees && (this[c] *= .017453292519943295)
                }.bind(this));
                1E-10 > Math.abs(Math.abs(this.lat0) - m) ? this.mode = 0 > this.lat0 ? 1 : 0 : 1E-10 > Math.abs(this.lat0) ? this.mode = 2 : (this.mode = 3, this.sinph0 = Math.sin(this.lat0), this.cosph0 = Math.cos(this.lat0));
                this.pn1 = this.h /
                    this.a;
                if (0 >= this.pn1 || 1E10 < this.pn1) throw Error("Invalid height");
                this.p = 1 + this.pn1;
                this.rp = 1 / this.p;
                this.h1 = 1 / this.pn1;
                this.pfact = (this.p + 1) * this.h1;
                this.es = 0;
                var a = this.tilt,
                    b = this.azi;
                this.cg = Math.cos(b);
                this.sg = Math.sin(b);
                this.cw = Math.cos(a);
                this.sw = Math.sin(a)
            },
            forward: function(a) {
                a.x -= this.long0;
                var b = Math.sin(a.y),
                    c = Math.cos(a.y),
                    d = Math.cos(a.x);
                switch (this.mode) {
                    case 3:
                        var e = this.sinph0 * b + this.cosph0 * c * d;
                        break;
                    case 2:
                        e = c * d;
                        break;
                    case 1:
                        e = -b;
                        break;
                    case 0:
                        e = b
                }
                e = this.pn1 / (this.p - e);
                var f = e *
                    c * Math.sin(a.x);
                switch (this.mode) {
                    case 3:
                        e *= this.cosph0 * b - this.sinph0 * c * d;
                        break;
                    case 2:
                        e *= b;
                        break;
                    case 0:
                        e *= -(c * d);
                        break;
                    case 1:
                        e *= c * d
                }
                b = e * this.cg + f * this.sg;
                c = 1 / (b * this.sw * this.h1 + this.cw);
                f = (f * this.cg - e * this.sg) * this.cw * c;
                a.x = f * this.a;
                a.y = b * c * this.a;
                return a
            },
            inverse: function(a) {
                a.x /= this.a;
                a.y /= this.a;
                var b = a.y;
                var c = 1 / (this.pn1 - a.y * this.sw);
                var d = this.pn1 * a.x * c;
                c *= this.pn1 * a.y * this.cw;
                a.x = d * this.cg + c * this.sg;
                a.y = c * this.cg - d * this.sg;
                d = aa(a.x, a.y);
                if (1E-10 > Math.abs(d)) d = 0, b = a.y;
                else {
                    var e = 1 - d * d *
                        this.pfact;
                    e = (this.p - Math.sqrt(e)) / (this.pn1 / d + d / this.pn1);
                    c = Math.sqrt(1 - e * e);
                    switch (this.mode) {
                        case 3:
                            b = Math.asin(c * this.sinph0 + a.y * e * this.cosph0 / d);
                            a.y = (c - this.sinph0 * Math.sin(b)) * d;
                            a.x = a.x * e * this.cosph0;
                            break;
                        case 2:
                            b = Math.asin(a.y * e / d);
                            a.y = c * d;
                            a.x *= e;
                            break;
                        case 0:
                            b = Math.asin(c);
                            a.y = -a.y;
                            break;
                        case 1:
                            b = -Math.asin(c)
                    }
                    d = Math.atan2(a.x, a.y)
                }
                a.x = d + this.long0;
                a.y = b;
                return a
            },
            names: ["Tilted_Perspective", "tpers"]
        };
    x.defaultDatum = "WGS84";
    x.Proj = C;
    x.WGS84 = new x.Proj("WGS84");
    x.Point = I;
    x.toPoint = wa;
    x.defs =
        u;
    x.transform = W;
    x.mgrs = bb;
    x.version = "2.6.3";
    (function(a) {
        a.Proj.projections.add(cb);
        a.Proj.projections.add(ba);
        a.Proj.projections.add(db);
        a.Proj.projections.add(hb);
        a.Proj.projections.add(ib);
        a.Proj.projections.add(jb);
        a.Proj.projections.add(kb);
        a.Proj.projections.add(lb);
        a.Proj.projections.add(mb);
        a.Proj.projections.add(nb);
        a.Proj.projections.add(ob);
        a.Proj.projections.add(pb);
        a.Proj.projections.add(qb);
        a.Proj.projections.add(rb);
        a.Proj.projections.add(sb);
        a.Proj.projections.add(tb);
        a.Proj.projections.add(ub);
        a.Proj.projections.add(vb);
        a.Proj.projections.add(wb);
        a.Proj.projections.add(xb);
        a.Proj.projections.add(yb);
        a.Proj.projections.add(zb);
        a.Proj.projections.add(Ab);
        a.Proj.projections.add(Bb);
        a.Proj.projections.add(Cb);
        a.Proj.projections.add(Db);
        a.Proj.projections.add(Eb);
        a.Proj.projections.add(Fb)
    })(x);
    return x
});