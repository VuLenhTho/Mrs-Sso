package com.vulenhtho.service;

import com.vulenhtho.dto.response.BillFilterResponse;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

public interface BillService {

    ModelAndView getListBill(BillFilterResponse billFilterResponse);

    ModelAndView update(Long id);

    String deletes(HttpServletRequest request);

    ModelAndView getReportByMonthAndYear(Integer month, Integer year);

    ModelAndView getReportByYear(Integer year);

}
