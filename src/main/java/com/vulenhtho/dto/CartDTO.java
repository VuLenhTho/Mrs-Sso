package com.vulenhtho.dto;

import com.vulenhtho.dto.enumeration.PaymentType;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class CartDTO {

    private String receiver;

    private String phone;

    private String address;

    @Enumerated(EnumType.STRING)
    private PaymentType paymentType;

    private Long discountMoney;

    private Long totalMoney;

    private Long finalMoney;

    private List<ItemDTO> itemList = new ArrayList<>();

    private List<Long> discountIds = new ArrayList<>();
}
