package com.vulenhtho.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ReportByMonthAndYearDTO {

    private Integer year;

    private Integer month;

    private Long importMoney;

    private Long interestMoney;

    private Long moneyFromSale;

    private String vnImportMoney;

    private String vnInterestMoney;

    private String vnMoneyFromSale;

    private List<ProductInfoToReportDTO> bestsellerProduct = new ArrayList<>();

    private List<ProductInfoToReportDTO> badSellerProduct = new ArrayList<>();

}
