package com.vulenhtho.dto;

import com.vulenhtho.dto.enumeration.BillStatus;
import com.vulenhtho.dto.enumeration.PaymentMethod;
import lombok.Getter;
import lombok.Setter;

import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
public class BillDTO {

    private Long id;

    private String receiver;

    private String phone;

    private String address;

    private Long shippingCosts;

    private Long finalPayMoney;

    private String vnFinalPayMoney;

    private Long totalImportMoney;

    private Long totalMoney;

    private PaymentMethod paymentMethod;

    private String paymentInfo;

    private String note;

    private BillStatus status;

    private String vnStatus;

    private Long userId;

    private String createdBy;

    private String createdDate;

    private String lastModifiedBy;

    private String lastModifiedDate;

    private Set<ItemDTO> itemDTOS = new HashSet<>();
}
