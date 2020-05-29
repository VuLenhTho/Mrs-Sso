package com.vulenhtho.controller.admin;

import com.vulenhtho.dto.response.BillFilterResponse;
import com.vulenhtho.service.BillService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin")
public class BillController {

    private BillService billService;

    public BillController(BillService billService) {
        this.billService = billService;
    }

    @GetMapping("/bills")
    public ModelAndView getListBill(@RequestParam(defaultValue = "1", required = false) Integer page
            , @RequestParam(defaultValue = "5", required = false) Integer size
            , @RequestParam(defaultValue = "all", required = false) String status
            , @RequestParam(defaultValue = "all", required = false) String paymentMethod
            , @RequestParam(defaultValue = "all", required = false) String sort
            , @RequestParam(required = false) String search) {
        BillFilterResponse billFilterResponse = new BillFilterResponse(sort, status, search, paymentMethod, page, size);
        return billService.getListBill(billFilterResponse);
    }

    @GetMapping("/bills/deletes")
    public ModelAndView deletes(HttpServletRequest request) {

        String result = billService.deletes(request);

        ModelAndView modelAndView = getListBill(1, 5, "all", "all"
                , "all", null);
        modelAndView.addObject("result", result);

        return modelAndView;
    }

    @GetMapping("/bill/{id}")
    public ModelAndView getBillDetail(@PathVariable Long id) {
        return billService.update(id);
    }

    @GetMapping("/bill/update")
    public ModelAndView updateBill(HttpServletRequest request) {
        return null;
    }
}
