package com.cmsoft.crawling.service;

import com.cmsoft.crawling.crawl.Crawling;
import com.cmsoft.crawling.dto.CrawlDto;
import com.cmsoft.crawling.mapper.CrawlMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@Configuration
public class CrawlService {

        private final CrawlMapper crawlMapper;

        @Autowired
        public CrawlService(CrawlMapper crawlMapper) {
                this.crawlMapper = crawlMapper;
        }

        public List<CrawlDto> getCrawlList() {
                List<CrawlDto> crawlDtoList;
                crawlDtoList = crawlMapper.getCrawlList();
                return crawlDtoList;
        }

        public void insertData(List<CrawlDto> crawlDtoList) {
                for (CrawlDto crawlDto : crawlDtoList) {
                        crawlMapper.insertData(crawlDto);
                }
        }

        public ArrayList<CrawlDto> crawling() {
                Crawling crawler = new Crawling();
                return crawler.crawl();
        }


}
