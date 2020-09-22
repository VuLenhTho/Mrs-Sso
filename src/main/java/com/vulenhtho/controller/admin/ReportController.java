package com.vulenhtho.controller.admin;

import com.vulenhtho.service.BillService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Calendar;

@Controller
@RequestMapping("/admin")
public class ReportController {

    private final BillService billService;

    public ReportController(BillService billService) {
        this.billService = billService;
    }

    @GetMapping("/reportByMonthAndYear")
    public ModelAndView getReportByMonthAndYear(@RequestParam(required = false) Integer month, @RequestParam(required = false) Integer year) {
        if (month == null || year == null) {
            Calendar calendar = Calendar.getInstance();
            year = calendar.get(Calendar.YEAR);
            month = calendar.get(Calendar.MONTH) + 1;
        }
        return billService.getReportByMonthAndYear(month, year);
    }

    @GetMapping("/reportByYear")
    public ModelAndView getReportByYear(@RequestParam(required = false) Integer year) {
        if (year == null) {
            Calendar calendar = Calendar.getInstance();
            year = calendar.get(Calendar.YEAR);
        }
        return billService.getReportByYear(year);
    }
}
