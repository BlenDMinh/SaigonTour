package com.tour.service.util;

import java.time.Instant;
import java.util.Date;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Component;

@Component
public class PasswordUtil {
    static final Integer ROUND = 4;

    public String getHashedPassword(String password) {
        String salt = BCrypt.gensalt(PasswordUtil.ROUND);
        String hashedPassword = BCrypt.hashpw(password, salt);
        return hashedPassword;
    }

    public boolean checkPassword(String password, String hash) {
        return BCrypt.checkpw(password, hash);
    }

    public String getToken(String prefix) {
        String salt = BCrypt.gensalt(PasswordUtil.ROUND);
        return BCrypt.hashpw(prefix + Date.from(Instant.now()), salt);
    }
}