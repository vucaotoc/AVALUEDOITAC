const N_DEC_WGS84 = 8;
const N_DEC_VN2000 = 3;
const N_DEC_H = 3;
const EPSG_WGS84 = "EPSG:4326";
const EPSG_VN2000_DEFS = {
    VN2000_LAI_CHAU: "+proj=tmerc +lat_0=0 +lon_0=103.000 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_DIEN_BIEN: "+proj=tmerc +lat_0=0 +lon_0=103.000 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_SON_LA: "+proj=tmerc +lat_0=0 +lon_0=104.000 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_LAO_CAI: "+proj=tmerc +lat_0=0 +lon_0=104.750 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_YEN_BAI: "+proj=tmerc +lat_0=0 +lon_0=104.750 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_HA_GIANG: "+proj=tmerc +lat_0=0 +lon_0=105.500 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_TUYEN_QUANG: "+proj=tmerc +lat_0=0 +lon_0=106.000 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_PHU_THO: "+proj=tmerc +lat_0=0 +lon_0=104.750 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_VINH_PHUC: "+proj=tmerc +lat_0=0 +lon_0=105.000 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_CAO_BANG: "+proj=tmerc +lat_0=0 +lon_0=105.750 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_LANG_SON: "+proj=tmerc +lat_0=0 +lon_0=107.250 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_BAC_CAN: "+proj=tmerc +lat_0=0 +lon_0=106.500 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_THAI_NGUYEN: "+proj=tmerc +lat_0=0 +lon_0=106.500 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_BAC_GIANG: "+proj=tmerc +lat_0=0 +lon_0=107.000 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_BAC_NINH: "+proj=tmerc +lat_0=0 +lon_0=105.500 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_QUANG_NINH: "+proj=tmerc +lat_0=0 +lon_0=107.750 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_HAI_PHONG: "+proj=tmerc +lat_0=0 +lon_0=105.750 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_HAI_DUONG: "+proj=tmerc +lat_0=0 +lon_0=105.500 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_HUNG_YEN: "+proj=tmerc +lat_0=0 +lon_0=105.500 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_HA_NOI: "+proj=tmerc +lat_0=0 +lon_0=105.000 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_HOA_BINH: "+proj=tmerc +lat_0=0 +lon_0=106.000 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_HA_NAM: "+proj=tmerc +lat_0=0 +lon_0=105.000 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_NAM_DINH: "+proj=tmerc +lat_0=0 +lon_0=105.500 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_THAI_BINH: "+proj=tmerc +lat_0=0 +lon_0=105.500 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_NINH_BINH: "+proj=tmerc +lat_0=0 +lon_0=105.000 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_THANH_HOA: "+proj=tmerc +lat_0=0 +lon_0=105.000 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_NGHE_AN: "+proj=tmerc +lat_0=0 +lon_0=104.750 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_HA_TINH: "+proj=tmerc +lat_0=0 +lon_0=105.500 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_QUANG_BINH: "+proj=tmerc +lat_0=0 +lon_0=106.000 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_QUANG_TRI: "+proj=tmerc +lat_0=0 +lon_0=106.250 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_THUA_THIEN_HUE: "+proj=tmerc +lat_0=0 +lon_0=107.000 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_DA_NANG: "+proj=tmerc +lat_0=0 +lon_0=107.750 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_QUANG_NAM: "+proj=tmerc +lat_0=0 +lon_0=107.750 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_QUANG_NGAI: "+proj=tmerc +lat_0=0 +lon_0=108.000 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_BINH_DINH: "+proj=tmerc +lat_0=0 +lon_0=108.250 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_KON_TUM: "+proj=tmerc +lat_0=0 +lon_0=107.500 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_GIA_LAI: "+proj=tmerc +lat_0=0 +lon_0=108.500 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_DAK_LAK: "+proj=tmerc +lat_0=0 +lon_0=108.500 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_DAK_NONG: "+proj=tmerc +lat_0=0 +lon_0=108.500 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_PHU_YEN: "+proj=tmerc +lat_0=0 +lon_0=108.500 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_KHANH_HOA: "+proj=tmerc +lat_0=0 +lon_0=108.250 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_NINH_THUAN: "+proj=tmerc +lat_0=0 +lon_0=108.250 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_BINH_THUAN: "+proj=tmerc +lat_0=0 +lon_0=108.500 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_LAM_DONG: "+proj=tmerc +lat_0=0 +lon_0=107.750 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_BINH_DUONG: "+proj=tmerc +lat_0=0 +lon_0=105.750 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_BINH_PHUOC: "+proj=tmerc +lat_0=0 +lon_0=106.250 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_DONG_NAI: "+proj=tmerc +lat_0=0 +lon_0=107.750 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_BA_RIA_VUNG_TAU: "+proj=tmerc +lat_0=0 +lon_0=107.750 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_TAY_NINH: "+proj=tmerc +lat_0=0 +lon_0=105.500 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_LONG_AN: "+proj=tmerc +lat_0=0 +lon_0=105.750 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_TIEN_GIANG: "+proj=tmerc +lat_0=0 +lon_0=105.750 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_BEN_TRE: "+proj=tmerc +lat_0=0 +lon_0=105.750 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_DONG_THAP: "+proj=tmerc +lat_0=0 +lon_0=105.000 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_VINH_LONG: "+proj=tmerc +lat_0=0 +lon_0=105.500 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_TRA_VINH: "+proj=tmerc +lat_0=0 +lon_0=105.500 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_AN_GIANG: "+proj=tmerc +lat_0=0 +lon_0=104.750 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_KIEN_GIANG: "+proj=tmerc +lat_0=0 +lon_0=104.500 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_CAN_THO: "+proj=tmerc +lat_0=0 +lon_0=105.000 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_HAU_GIANG: "+proj=tmerc +lat_0=0 +lon_0=105.000 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_SOC_TRANG: "+proj=tmerc +lat_0=0 +lon_0=105.500 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_BAC_LIEU: "+proj=tmerc +lat_0=0 +lon_0=105.000 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_CA_MAU: "+proj=tmerc +lat_0=0 +lon_0=104.500 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
    VN2000_TP_HCM: "+proj=tmerc +lat_0=0 +lon_0=105.750 +k=0.9999 +x_0=500000 +y_0=0 +ellps=WGS84 +towgs84=-191.90441429,-39.30318279,-111.45032835,-0.00928836,0.01975479,-0.00427372,0.252906278 +units=m +no_defs",
}
function validate(x, y, h, province) {
    if (isNaN(x) || isNaN(y) || isNaN(h)) {
        console.error("Input error!");
        return false;
    }
    if (!province || !Object.keys(EPSG_VN2000_DEFS).includes(province)) {
        console.error("Province invalid! Please call `list_province()` to show all");
        return false;
    }
    return true;
}

function converter(x, y, h, from, to) {
    const proj4Src = new proj4.Proj(from);
    const proj4Dest = new proj4.Proj(to);

    const toMerterSrc = proj4Src.to_meter || 1;
    const toMeterDest = proj4Dest.to_meter || 1;
    const xVal = x / toMerterSrc;
    const yVal = y / toMerterSrc;
    const hVal = h / toMerterSrc;

    const pj = new proj4.toPoint([xVal, yVal, hVal]);
    const result = proj4(proj4Src, proj4Dest).forward(pj);
    result.x *= toMeterDest;
    result.y *= toMeterDest;
    result.z *= toMeterDest;

    return result;
}

function list_province() {
    return Object.keys(EPSG_VN2000_DEFS);
}
function vn2000_to_wgs84(dx, dy, h, province) {
    if (!validate(dx, dy, h, province))
        return;
    //console.log('dx: ' + dx + ' dy:' + dy + ' h:' + h + ' pro:' + province);
    // init defs
    proj4.defs(province, EPSG_VN2000_DEFS[province].trim());

    const {x, y, z} = converter(parseFloat(dx), parseFloat(dy), h, province, EPSG_WGS84);

    return {
        x: x.toFixed(N_DEC_WGS84),
        y: y.toFixed(N_DEC_WGS84),
        h: z.toFixed(N_DEC_H)
    }
}
function wgs84_to_vn2000(dx, dy, h, province) {
    if (!validate(dx, dy, h, province))
        return;
    //console.log('dx: ' + dx + ' dy:' + dy + ' h:' + h + ' pro:' + province);
    // init defs
    proj4.defs(province, EPSG_VN2000_DEFS[province].trim());

    const {x, y, z} = converter(parseFloat(dx), parseFloat(dy), h, EPSG_WGS84, province);

    return {
        x: x.toFixed(N_DEC_VN2000),
        y: y.toFixed(N_DEC_VN2000),
        h: z.toFixed(N_DEC_VN2000)
    }
}