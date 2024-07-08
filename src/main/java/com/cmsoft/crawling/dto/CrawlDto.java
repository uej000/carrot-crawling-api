package com.cmsoft.crawling.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CrawlDto {
    private String title;
    private int price;
    private String location;
    private int interest;
    private int chatCount;
}
