/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Telegram;

import org.telegram.telegrambots.bots.TelegramLongPollingBot;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.Update;
import org.telegram.telegrambots.meta.exceptions.TelegramApiException;

public class AVLBot extends TelegramLongPollingBot {

    @Override
    public void onUpdateReceived(Update update) {
        // We check if the update has a message and the message has text
        if (update.hasMessage() && update.getMessage().hasText()) {
            SendMessage message = new SendMessage(); // Create a SendMessage object with mandatory fields
            message.setChatId(update.getMessage().getChatId().toString());
            message.setText(update.getMessage().getChatId().toString());
            System.out.println("telegram: " + update.getMessage().getChatId().toString() + " " + update.getMessage().getText());
            try {
                execute(message); // Call method to send the message
            } catch (TelegramApiException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public String getBotUsername() {
        // TODO
        //return "AVL VU BOT";
        return "KESO";
    }

    @Override
    public String getBotToken() {
        // TODO
        //return "6350529617:AAFI4hEVeE3-Lw1qBOwsNbwHDRoquaG5KQ4"; // avl vu 
        return "1980399670:AAF1TF6JSzHkARap5CpkIg468USwSWgelow";
    }

    public void guiTinNhan(String chatid, String mess) {
        // We check if the update has a message and the message has text        
        SendMessage message = new SendMessage(); // Create a SendMessage object with mandatory fields
        message.enableHtml(true);
        message.setChatId(chatid);
        message.setText(mess);
        try {
            execute(message); // Call method to send the message
        } catch (TelegramApiException e) {
            e.printStackTrace();
        }
    }

    public void Telegram_Tinnhan_doitac(HoSo.objHoSo objhs, String message, String chatid) {
        if (chatid.trim().length() > 0) {
            String mess = "[DOITAC]\n";
            mess += "[" + objhs.getMahs() + "] - [" + objhs.getDoitac() + "] - [" + objhs.getCbthuchien() + "]\n";
            mess += "Tin nhắn: <b>" + message + "</b>.\n";
            guiTinNhan(chatid.trim(), mess);
        }
    }

    public void Telegram_sendError(String message) {

        String mess = "" + message;
        //System.out.println(chatid);
        guiTinNhan("5799700530", message);

    }
}
