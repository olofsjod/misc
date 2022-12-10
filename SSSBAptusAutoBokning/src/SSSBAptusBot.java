import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.TimeZone;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxBinary;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxOptions;

public class SSSBAptusBot {

	public static void main(String[] args) throws Exception {
        System.setProperty("webdriver.gecko.driver", "/Users/medik/geckodriver");

        FirefoxOptions options = new FirefoxOptions();
        options.setBinary("/Applications/Firefox.app/Contents/MacOS/firefox-bin");

        WebDriver driver = new FirefoxDriver();

        // Gå in i aptusportal
        driver.navigate().to("http://aptusportal.sssb.se");

        // Logga in
        // Användarnamn (och Lösenord):
        String usrpw1 = "apartment-number";
        driver.findElement(By.id("LoginPortal_UserName")).sendKeys("teststr");
        driver.findElement(By.id("LoginPortal_Password")).sendKeys(usrpw1);
        //driver.findElement(By.id("LoginPortal_LoginButton")).click();
        System.exit(0);
        // Öppna sidan med bokningar
        try {

            Thread.sleep(2000);
            driver.findElement(By.id("btnAptusPortal_Book")).click();
            driver.get("http://aptusportal.sssb.se/wwwashcalendar.aspx?panelId=11014&weekoffset=0&type=43484&group=45077&multiGroup=True");

            // Leta reda på alla tider
            String XPathExpr = "/html/body/table/tbody/tr/td/table/tbody/tr[@class='bgTableOddColor textTableOddColor' or @class='bgTableEvenColor textTableEvenColor']/td/table/tbody/tr/td";
            List<WebElement> welmts_all = driver.findElements(By.xpath(XPathExpr));

            // Ta reda på heltalet som representerar veckodagen
            Calendar cal = new GregorianCalendar();
            cal.setTimeZone(TimeZone.getTimeZone("Europe/Stockholm"));

            int dayOfInterest = cal.get(Calendar.DAY_OF_WEEK) - 2; // fixar så att Måndag blir 0 och Söndag blir 6
            if (dayOfInterest == -1) {
                dayOfInterest = 6;    // fixar så att söndag blir 6 och inte -1
            }

            // Denna loop lägger till alla WebElement i listan welmts_today som tillhör samma dag
            // om de är inte är helt irrelevanta
            List<WebElement> welmts_today = new ArrayList<WebElement>();

            int i = 0;
            for (WebElement we : welmts_all) {
                if (i == dayOfInterest) {
                    //System.out.println(we.getAttribute("innerHTML"));

                    List<WebElement> imgs = we.findElements(By.tagName("img"));
                    String someSymbolSrcStr = imgs.get(0).getAttribute("src");

                    // icon_no_not.gif är symbolen som representerar att tiden har paserat. Om någon av symbolerna för
                    // respektive tid är icon_no_not.gif, anta då att tiden har passerat.
                    if (!someSymbolSrcStr.equals("http://aptusportal.sssb.se/images/icon_no_not.gif"))
                        welmts_today.add(we);
                }
                //System.out.println(i);
                i = (i + 1) % 7;
            }


            // Ta reda på tiden nu
            int hour = cal.get(Calendar.HOUR_OF_DAY);
            int min = cal.get(Calendar.MINUTE);

            int intervalId_next;
            int intervalId_now;
            int intervalId;

            intervalId_now = (int) Math.floor((hour + min / 60) / 1.5);
            intervalId_next = (int) Math.ceil((hour + min / 60) / 1.5);

            // Hämtar timmen efter denna OM klockan är mer än 16 över
            if (min > 30) {
                intervalId = intervalId_next;
                System.out.println("Finding time for next hour...");
            } else {
                intervalId = intervalId_now;
                System.out.print("Finding time now...");
            }

            // Hämtar mängden element från den intressanta intervallet och hitta alla symboler
            WebElement now = welmts_today.get(intervalId);
            List<WebElement> imgs = now.findElements(By.tagName("img"));

            Boolean[] group_available = new Boolean[]{false, false, false, false};
            int[] group_id = new int[]{45076, 45077, 92986, 92987};

            // Denna loop bestämmer vilka grupper som är lediga genom att gå igenom alla symboler.
            int k = 0;
            for (WebElement we : imgs) {
                String src = we.getAttribute("src");

                // Om symbolen är ett plus tecken, anta då att gruppen är ledig
                if (src.equals("http://aptusportal.sssb.se/images/icon_plus.gif"))
                    group_available[k] = true;
                k++;
            }

            // Testkod som notifierar den första lediga grupp
            int q = 0;
            for (Boolean b : group_available) {
                q++;
                if (group_available[q - 1]) {
                    System.out.println("Grupp " + q + " är ledig");
                    // Anropa sedan http://aptusportal.sssb.se/wwwashcalendar.aspx?command=book&PanelId=11014&TypeId=43484&GroupId={45076,45077,92986,92987}&IntervalId={index}
                    //String url = "http://aptusportal.sssb.se/wwwashcalendar.aspx?command=book&PanelId=11014&TypeId=43484&GroupId="
                    //		+ group_id[q-1] + "&IntervalId=" + intervalId;
                    //driver.get(url);
                    //System.out.println(url);
                    break;
                }
            }
            Thread.sleep(2000);
            driver.quit();
        } catch (Exception e) {

        }
	}

}
