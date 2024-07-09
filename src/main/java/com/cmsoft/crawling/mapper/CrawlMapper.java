package com.cmsoft.crawling.repository;

import com.cmsoft.crawling.dto.CrawlDto;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
@Mapper
public interface CrawlRepository {
    void insertData(CrawlDto crawlDto);
    List<CrawlDto> getCrawlList();
}
