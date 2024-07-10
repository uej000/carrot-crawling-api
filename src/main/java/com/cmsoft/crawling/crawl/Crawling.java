package com.cmsoft.crawling.crawl;

import com.cmsoft.crawling.dto.CrawlDto;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import java.util.ArrayList;
import java.util.List;


public class Crawling {

    private final WebDriver driver;
    private WebElement element;
    private final String url;

    public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
    public static String WEB_DRIVER_PATH = "driver/chromedriver.exe";

    public Crawling() {
        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

        ChromeOptions options = new ChromeOptions();
        options.addArguments("--disable-popup-blocking");

        driver = new ChromeDriver(options);

        url = "https://www.daangn.com/fleamarket/";
    }

    public ArrayList<CrawlDto> crawl() {
        ArrayList<CrawlDto> dataList = new ArrayList<>();
        CrawlDto dto = null;

        driver.get(url);

        // 카드 항목들을 전부 가져옵니다.
        List<WebElement> cards = driver.findElements(By.className("card-top"));

        for (WebElement card : cards) {
            dto = new CrawlDto();

            element = card.findElement(By.className("card-title"));
            String title = element.getText();
            dto.setTitle(title);

            element = card.findElement(By.className("card-price"));
            String priceString = element.getText().replace("원", "").replace(",", "").trim();
            int price = Integer.parseInt(priceString);
            dto.setPrice(price);

            element = card.findElement(By.className("card-region-name"));
            String location = element.getText();
            dto.setLocation(location);

            element = card.findElement(By.className("card-counts"));
            String[] counts = element.getText().split("∙");
            int interest = Integer.parseInt(counts[0].replace("관심", "").trim());
            int chatCount = Integer.parseInt(counts[1].replace("채팅", "").trim());
            dto.setInterest(interest);
            dto.setChatCount(chatCount);

            dataList.add(dto);
            }
        return dataList;
        }

    }
