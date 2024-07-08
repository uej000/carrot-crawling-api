package com.cmsoft.crawling.repository;

import com.cmsoft.crawling.dto.CrawlDto;
import org.springframework.stereotype.Repository;

import java.util.List;
@Mapper
@Repository
public interface CrawlRepository {
    void insertData(CrawlDto crawlDto);
    List<CrawlDto> getCrawlList();
}
