package com.mywork.controller;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mywork.domain.NewsVO;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	Document doc;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("메인페이지 실행");
		String[] news = { "arr1", "arr2" };
		try {
			doc = Jsoup.connect("https://sports.media.daum.net/sports").get();
			Elements div = doc.select("div.view_news").eq(0);
			Elements ul = div.select("ul");
			for (int i = 0; i < ul.size(); i++) {
				ArrayList<NewsVO> arr = new ArrayList<>();
				Elements li = ul.get(i).select("li");
				for (int j = 0; j < li.size(); j++) {
					NewsVO vo = new NewsVO();
					if (j == 0) {
						String href = li.get(j).select("a.link_thumb").attr("abs:href");
						String title = li.get(j).select("a.link_tit").text();
						String desc = li.get(j).select("a.link_desc").text();
						Document img_doc = Jsoup.connect(href).get();
						String img = img_doc.select("img[class=thumb_g_article]").attr("abs:src");
						vo.setImg(img);
						vo.setHref(href);
						vo.setTitle(title);
						vo.setDesc(desc);
					} else {
						String href = li.get(j).select("a.link_news").attr("abs:href");
						String title = li.get(j).select("a.link_news").text();
						vo.setHref(href);
						vo.setTitle(title);
					}
					arr.add(vo);
				}
				model.addAttribute(news[i], arr);
			}
			ArrayList<NewsVO> arr = new ArrayList<>();
			doc = Jsoup.connect("https://sports.media.daum.net/sports/worldsoccer/").get();
			div = doc.select("div.news_major");
			ul = div.select("ul.list_news");
			Elements li = ul.select("li");
			for (int i = 0; i < li.size(); i++) {
				NewsVO vo = new NewsVO();
				String title = li.get(i).select("a.link_txt").text();
				String href = li.get(i).select("a.link_txt").attr("abs:href");
				if(i%10==0) {
					Document img_doc = Jsoup.connect(href).get();
					String img = img_doc.select("img[class=thumb_g_article]").attr("abs:src");
					vo.setImg(img);
				}
				vo.setHref(href);
				vo.setTitle(title);
				arr.add(vo);
			}
			model.addAttribute("arr3", arr);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "home";
	}

}
