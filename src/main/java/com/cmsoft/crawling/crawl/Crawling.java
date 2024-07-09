package com.cmsoft.crawling.crawl;

import com.cmsoft.crawling.dto.CrawlDto;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import java.util.ArrayList;
import static java.lang.Integer.parseInt;


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
        int a = 0;


        while (true) {
            a++;
            driver.get(url);

            element = driver.findElement(By.xpath("/html/body/main/section[2]/div[1]/article[5]/a/div[2]/h2"));
            String title = element.getAttribute("title");

            element = driver.findElement(By.xpath("/html/body/main/section[2]/div[1]/article[5]/a/div[2]/div[1]"));
            String priceString = element.getAttribute("price");
            int price = Integer.parseInt(priceString);

            element = driver.findElement(By.xpath("/html/body/main/section[2]/div[1]/article[5]/a/div[2]/div[2]"));
            String location = element.getAttribute("location");

            element = driver.findElement(By.xpath("/html/body/main/section[2]/div[1]/article[5]/a/div[2]/div[3]/span[1]"));
            String interestString = element.getAttribute("interest");
            int interest = Integer.parseInt(interestString);

            element = driver.findElement(By.xpath("/html/body/main/section[2]/div[1]/article[5]/a/div[2]/div[3]/span[2]"));
            String chatCountString = element.getAttribute("chat-count");
            int chatCount = Integer.parseInt(chatCountString);

            dto = new CrawlDto();
            dto.setTitle(title);
            System.out.println(title);
            dto.setLocation(location);
            dto.setChatCount(chatCount);
            dto.setPrice(price);
            dto.setInterest(interest);

            dataList.add(dto);
            if(a >= 10) {
                break;
            }
        }
        return dataList;
    }
}
