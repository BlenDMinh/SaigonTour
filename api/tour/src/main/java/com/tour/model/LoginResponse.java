package com.tour.model;

import com.tour.entity.Permission;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class LoginResponse {
    private String token;
    private CustomerModel user;
    private Permission permission;

    public static LoginResponse empty() {
        return new LoginResponse("", null, null);
    }

    public boolean isEmpty() {
        return token.isBlank() || token.isEmpty();
    }
}
