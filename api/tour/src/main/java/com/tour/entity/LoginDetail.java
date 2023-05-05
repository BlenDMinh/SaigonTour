package com.tour.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class LoginDetail {
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer _loginDetailId;

    private Integer userId;

    private String password;
    
    @Enumerated(EnumType.ORDINAL)
    private Permission permission;
}
