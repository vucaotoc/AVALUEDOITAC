/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DATA;

import java.io.IOException;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

/**
 *
 * @author nguyenvu
 */
public class Main {

    public static void main(String args[]) throws IOException {

        OkHttpClient client = new OkHttpClient.Builder().build();

        Request rq = new Request.Builder()
                .url("https://remaps.vn/api/clients/search?apiKey=PRF7pz2wj8i3rltJSqaSmz2qrvDMcpcc1gECtCvJZvRJ8HG8glzIrJv1KpN4I0ou&lat=10.814222&lng=106.686602")
                .method("GET", null)
                .build();

        try (Response rp = client.newCall(rq).execute()) {
            if (rp.isSuccessful()) {
                String response = rp.body().string();
                // xử lý phản hồi từ máy chủ
                System.out.println(rp.body().string());
            } else {
                System.out.println("Không tìm thấy");
            }
        } catch (IOException e) {
            // xử lý lỗi IO
            e.printStackTrace();
        }

    }

}
