package com.vulenhtho.dto;

import com.vulenhtho.dto.enumeration.BillStatus;
import com.vulenhtho.dto.enumeration.PaymentMethod;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ShortInfoBillDTO {

    private Long id;

    private String receiver;

    private String phone;

    private String createdDate;

    private Long finalPayMoney;

    private String vnFinalPayMoney;

    private PaymentMethod paymentMethod;

    private BillStatus status;
}
