package com.vulenhtho.dto;

import com.vulenhtho.dto.request.PageHeaderDTO;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class ItemsForCartAndHeader {

    private List<ItemShowInCartDTO> itemShowInCartDTOS = new ArrayList<>();

    private PageHeaderDTO headerDTO;
}
