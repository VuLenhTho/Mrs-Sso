package com.vulenhtho.dto.response;

import com.vulenhtho.dto.DiscountDTO;
import com.vulenhtho.dto.request.ItemShowInCartDTO;
import com.vulenhtho.dto.request.PageHeaderDTO;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Getter
@Setter
public class ItemsForCartAndHeader {

    private List<ItemShowInCartDTO> itemShowInCartDTOS = new ArrayList<>();

    private Set<DiscountDTO> discountDTOS = new HashSet<>();

    private PageHeaderDTO headerDTO;
}
