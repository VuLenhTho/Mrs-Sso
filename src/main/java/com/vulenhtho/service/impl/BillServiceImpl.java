package com.vulenhtho.service.impl;

import com.vulenhtho.config.APIConstant;
import com.vulenhtho.config.Constant;
import com.vulenhtho.dto.BillDTO;
import com.vulenhtho.dto.enumeration.BillStatus;
import com.vulenhtho.dto.enumeration.PaymentMethod;
import com.vulenhtho.dto.request.PageBillsRequest;
import com.vulenhtho.dto.request.ReportByMonthAndYearDTO;
import com.vulenhtho.dto.response.BillFilterResponse;
import com.vulenhtho.service.BillService;
import com.vulenhtho.service.SecurityService;
import com.vulenhtho.util.CommonUtils;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class BillServiceImpl implements BillService {

    private final RestTemplate restTemplate;

    private final SecurityService securityService;


    public BillServiceImpl(RestTemplate restTemplate, SecurityService securityService) {
        this.restTemplate = restTemplate;
        this.securityService = securityService;
    }

    @Override
    public ModelAndView update(Long id) {
        ModelAndView modelAndView = new ModelAndView("/admin/bill/bill-update");
        BillDTO bill = restTemplate.exchange(APIConstant.ADMIN_URI + "/bill?id=" + id.toString(),
                HttpMethod.GET,
                new HttpEntity<BillDTO>(securityService.getHeadersWithToken()), BillDTO.class).getBody();

        bill.setVnFinalPayMoney(CommonUtils.convertToVnCurrency(bill.getFinalPayMoney()));
        String createdDate = bill.getCreatedDate().substring(0, 10) + " " + bill.getCreatedDate().substring(11, 19);
        String modifiedDate = bill.getLastModifiedDate().substring(0, 10) + " " + bill.getLastModifiedDate().substring(11, 19);
        bill.setCreatedDate(createdDate);
        bill.setLastModifiedDate(modifiedDate);
        bill.setVnStatus(mapBillStatus(bill.getStatus()));
        bill.getItemDTOS().forEach(itemDTO -> {
            itemDTO.setVnPrice(CommonUtils.convertToVnCurrency(itemDTO.getPrice()));
            itemDTO.setVnTotalPrice(CommonUtils.convertToVnCurrency(itemDTO.getPrice() * itemDTO.getQuantity()));
        });
        modelAndView.addObject("bill", bill);
        if (PaymentMethod.PAY_BY_TRANSFER.equals(bill.getPaymentMethod()) && bill.getPaymentInfo() != null) {
            List<String> paymentInfo = Arrays.stream(bill.getPaymentInfo().split(",")).collect(Collectors.toList());
            modelAndView.addObject("accName", paymentInfo.get(0));
            modelAndView.addObject("accNumber", paymentInfo.get(1));
        }
        modelAndView.addObject("token", securityService.getToken());
        return modelAndView;
    }


    @Override
    public String deletes(HttpServletRequest request) {
        String idString = request.getParameter("billIds");
        if (StringUtils.isEmpty(idString)) {
            return Constant.CRUD_RESULT.NOT_FOUND;
        }
        List<Long> billIds = Arrays.stream(idString.split(",")).map(Long::parseLong).collect(Collectors.toList());
        ResponseEntity<String> deletes = restTemplate.exchange(APIConstant.ADMIN_URI + "/bills", HttpMethod.DELETE
                , new HttpEntity<>(billIds, securityService.getHeadersWithToken()), new ParameterizedTypeReference<String>() {
                });
        if (HttpStatus.OK.equals(deletes.getStatusCode())) {
            return Constant.CRUD_RESULT.SUCCESS;
        } else {
            return Constant.CRUD_RESULT.ERROR;
        }
    }

    @Override
    public ModelAndView getListBill(BillFilterResponse billFilterResponse) {
        ModelAndView mav = new ModelAndView("admin/bill/bill-list");
        String url = APIConstant.ADMIN_URI + "/bills?page=" + (billFilterResponse.getPage() - 1) + "&size=" + billFilterResponse.getSize();

        if (!"all".equals(billFilterResponse.getPaymentMethod())) {
            url += "&paymentMethod=" + billFilterResponse.getPaymentMethod();
        }
        if (!"all".equals(billFilterResponse.getStatus())) {
            url += "&status=" + billFilterResponse.getStatus();
        }
        if (!"all".equals(billFilterResponse.getSort())) {
            url += "&sort=" + billFilterResponse.getSort();
        }

        if (!StringUtils.isEmpty(billFilterResponse.getSearch())) url += "&search=" + billFilterResponse.getSearch();

        PageBillsRequest bills = restTemplate.exchange(url,
                HttpMethod.GET,
                new HttpEntity<PageBillsRequest>(securityService.getHeadersWithToken()), PageBillsRequest.class).getBody();

        bills.getBillDTOS().forEach(bill -> {
            bill.setVnFinalPayMoney(CommonUtils.convertToVnCurrency(bill.getFinalPayMoney()));
            bill.setCreatedDate(bill.getCreatedDate().substring(0, 10));
        });

        mav.addObject("data", bills);
        mav.addObject("filter", billFilterResponse);
        return mav;
    }

    private String mapBillStatus(BillStatus statusCode) {
        switch (statusCode) {
            case INIT:
                return "Đơn mới";
            case CHECKING:
                return "Đang kiểm tra";
            case CONFIRMED:
                return "Đã xác nhận";
            case RETURNED:
                return "Bị trả lại";
            case SHIPPING:
                return "Đang vận chuyển";
            case FINISH:
                return "Hoàn thành";

            default:
                return null;
        }
    }

    @Override
    public ModelAndView getReport(Integer month, Integer year) {
        ModelAndView modelAndView = new ModelAndView("/admin/report/report");
        ReportByMonthAndYearDTO reportByMonthAndYearDTO = restTemplate.exchange(APIConstant.ADMIN_URI + "/bill/reportByMonthAndYear?month=" + month + "&year=" + year,
                HttpMethod.GET, new HttpEntity<ReportByMonthAndYearDTO>(securityService.getHeadersWithToken()), ReportByMonthAndYearDTO.class).getBody();

        reportByMonthAndYearDTO.setVnImportMoney(CommonUtils.convertToVnCurrency(reportByMonthAndYearDTO.getImportMoney()));
        reportByMonthAndYearDTO.setVnInterestMoney(CommonUtils.convertToVnCurrency(reportByMonthAndYearDTO.getInterestMoney()));
        reportByMonthAndYearDTO.setVnMoneyFromSale(CommonUtils.convertToVnCurrency(reportByMonthAndYearDTO.getMoneyFromSale()));
        modelAndView.addObject("reportData", reportByMonthAndYearDTO);

        return modelAndView;
    }
}
