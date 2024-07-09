package com.cmsoft.crawling.mapper;

import com.cmsoft.crawling.dto.CrawlDto;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
@Mapper
public interface CrawlMapper {
    void insertData(CrawlDto crawlDto);
    List<CrawlDto> getCrawlList();
}
