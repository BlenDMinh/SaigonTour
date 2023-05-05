package com.tour.service;

import com.tour.model.CustomerModel;
import com.tour.model.LoginRequest;
import com.tour.model.LoginResponse;

public interface AuthenticationService {
    /*
     * Dang ky:
     * Nhan dau vao la 1 CustomerModel va 1 chuoi mat khau
     * Ham se ma hoa mat khau. Sau do chuyen CustomerModel thanh Entity va cap nhat mat khau da ma khoa
     * vao LoginDetail cua Entity.
     * Cuoi cung ham se luu Entity vao database
     */
    void registerCustomer(CustomerModel customer, String password);

    /*
     * Dang nhap:
     * Nhan dau vao la 1 LoginRequest, LoginRequest co the chua 1 trong 2 kieu:
     * - {phoneNumber, password}: Luot dang nhap moi:
     *      Neu phoneNumber va password khop voi Database, tao ra mot phien dang nhap LoginSession moi
     *      va mot chuoi token, sau do tra lai mot LoginResponse bao gom token, Entity Customer da dang nhap,
     *      va quyen han su dung Permission cua Customer.
     * 
     * - {token}: Dang nhap bang token (dang nhap vao phien dang nhap co san):
     *      Client gui token lam LoginRequest, yeu cau ham tra ve thong tin Customer da
     *      dang nhap truoc do thong qua LoginResponse
     */
    LoginResponse login(LoginRequest request);

    /*
     * Ham nhan userId lam tham so
     * Xoa di nhung LoginSession cua Customer co userId truyen vao
     */
    void logout(Integer userId);

    /*
     * Doi mat khau cua Customer co userId truyen vao
     */
    void changePassword(Integer userId, String password);
}