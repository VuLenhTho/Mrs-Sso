package com.vulenhtho.util;

import java.text.NumberFormat;
import java.util.Locale;

public class CommonUtils {

    public static String convertToVnCurrency(Long longPrice) {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);

        return currencyVN.format(longPrice);
    }
}
