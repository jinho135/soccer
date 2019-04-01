package com.mywork.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mywork.domain.BoardDTO;
import com.mywork.domain.CompetitionsVO;
import com.mywork.domain.ListDTO;
import com.mywork.domain.YoutubeVO;
import com.mywork.service.BoardService;

@Controller
@RequestMapping("/*")
public class MenuController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	Document doc;

	@Inject
	private BoardService service;

	@GetMapping("/daily")
	public String Daily(Model model, String date) {
		logger.info("일일 경기일정");
		ArrayList<String> arr = new ArrayList<>();
		String addurl = "";
		if (date != null && date != "") {
			addurl = "matches/" + date.replaceAll("-", "/").trim();
		}
		try {
			doc = Jsoup.connect("https://kr.soccerway.com/" + addurl).get();

			Elements table = doc.select("table.matches");
			Elements groups = table.select("tr.expanded");
			for (int i = 0; i < groups.size(); i++) {
				String group = "";
				if (!groups.get(i).select("h3").isEmpty()) {
					group += "<br/><<< " + groups.get(i).select("h3").text() + " >>>";
				}
				if (!groups.get(i).select("td.team-a").isEmpty()) {
					group += "▶ " + groups.get(i).select("td.team-a").text() + " | ";
				}
				if (!groups.get(i).select("td.score").isEmpty()) {
					group += groups.get(i).select("td.score").text();
				}
				if (!groups.get(i).select("td.status").isEmpty()) {
					String time = groups.get(i).select("td.status").text();
					// 경기시각 시차 환산
					int hour = Integer.parseInt(time.substring(0, 2));
					hour = (hour >= 16) ? hour - 16 : hour + 8;
					String fixhour = (hour < 10) ? "0" + String.valueOf(hour) : String.valueOf(hour);
					String fixtime = fixhour + time.substring(2);
					group += fixtime;
				}
				if (!groups.get(i).select("td.team-b").isEmpty()) {
					group += " | " + groups.get(i).select("td.team-b").text();
				}
				arr.add(group);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("arr", arr);
		return "/pages/daily";
	}

	@GetMapping("/competitions")
	public String Competitions(Model model) {
		logger.info("시즌 경기일정");
		ArrayList<ArrayList<CompetitionsVO>> arr = new ArrayList<>();
		String category[] = { "/england/premier-league", "/italy/serie-a", "/spain/primera-division",
				"/germany/bundesliga" };
		// 카테고리 네번
		for (int i = 0; i < category.length; i++) {
			ArrayList<CompetitionsVO> matches = new ArrayList<>();
			String url = "https://kr.soccerway.com/national" + category[i] + "/20182019/regular-season/matches/";
			try {
				doc = Jsoup.connect(url).get();
				Elements tbody = doc.select("tbody").eq(0);
				Elements tr = tbody.select("tr");
				String date = "";
				// 경기 수 만큼
				for (int j = 0; j < tr.size(); j++) {
					CompetitionsVO vo = new CompetitionsVO();
					String fixdate = "";
					// 하루에 경기 여러번 있을시 공백처리
					if (!date.equals(tr.get(j).select("td.date").text())) {
						// 외국식 날짜표기법을 한국식으로 변경
						date = tr.get(j).select("td.date").text();
						fixdate = "20" + date.substring(6) + date.substring(2, 6) + date.substring(0, 2);
					}
					String team1 = tr.get(j).select("td.team-a").text();
					String team2 = tr.get(j).select("td.team-b").text();
					String score_time = "";
					if (!tr.get(j).select("td.score").isEmpty()) {
						score_time = tr.get(j).select("td.score").text();
					} else {
						String time = tr.get(j).select("td.status").text();
						// 경기시각 시차 환산
						int hour = Integer.parseInt(time.substring(0, 2));
						hour = (hour >= 16) ? hour - 16 : hour + 8;
						String fixhour = (hour < 10) ? "0" + String.valueOf(hour) : String.valueOf(hour);
						String fixtime = fixhour + time.substring(2);
						score_time += fixtime;
					}
					vo.setDate(fixdate);
					vo.setTeam1(team1);
					vo.setTeam2(team2);
					vo.setScore_time(score_time);
					matches.add(vo);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			arr.add(matches);
		}
		model.addAttribute("arr", arr);
		return "/pages/competitions";
	}

	@GetMapping("/board")
	public String Board(Model model, String field, String word, String pageNum) {
		logger.info("게시판 list");
		field = field == null ? "" : field.trim();
		word = word == null ? "" : word.trim();
		pageNum = pageNum == null ? "1" : pageNum.trim();

		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 10;
		int startRow = ((currentPage - 1) * pageSize) + 1;
		int endRow = currentPage * pageSize;

		ListDTO dto = new ListDTO();
		dto.setField(field);
		dto.setWord(word);
		dto.setStartRow(startRow);
		dto.setEndRow(endRow);

		List<BoardDTO> lists = service.boardList(dto);
		int total = service.getTotal(dto);

		int totpage = total / pageSize + (total % pageSize == 0 ? 0 : 1);
		int blockpage = 5;
		int startpage = ((currentPage - 1) / blockpage) * blockpage + 1;
		int endpage = startpage + blockpage - 1;

		if (endpage > totpage)
			endpage = totpage;

		model.addAttribute("boardlist", lists);
		model.addAttribute("field", field);
		model.addAttribute("word", word);
		model.addAttribute("totpage", totpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("blockpage", blockpage);

		return "/pages/board";
	}

	@GetMapping("/videos")
	public String Chat(Model model, String teamname, String pageToken) {
		logger.info("동영상");
		teamname = teamname == null ? "Tottenham Hotspur" : teamname;
		String channelId = "";
		if (teamname.equals("Tottenham Hotspur")) {
			channelId = "UCEg25rdRZXg32iwai6N6l0w";
		} else if (teamname.equals("Manchester United")) {
			channelId = "UC6yW44UGJJBvYTlfC7CRg2Q";
		} else if (teamname.equals("Manchester City")) {
			channelId = "UCkzCjdRMrW2vXLx8mvPVLdQ";
		} else if (teamname.equals("Arsenal")) {
			channelId = "UCpryVRk_VDudG8SHXgWcG0w";
		} else if (teamname.equals("Liverpool")) {
			channelId = "UC9LQwHZoucFT94I2h6JOcjw";
		} else if (teamname.equals("Chelsea")) {
			channelId = "UCU2PacFf99vhb3hNiYDmxww";
		} else if (teamname.equals("Real Madrid")) {
			channelId = "UCWV3obpZVGgJ3j9FVhEjF2Q";
		} else if (teamname.equals("Barcelona")) {
			channelId = "UC14UlmYlSNiQCBe9Eookf_A";
		} else if (teamname.equals("Atlético Madrid")) {
			channelId = "UCuzKFwdh7z2GHcIOX_tXgxA";
		} else if (teamname.equals("Valencia")) {
			channelId = "UCgvyo5x49J8ht5H9imKfxMQ";
		} else if (teamname.equals("Juventus")) {
			channelId = "UCLzKhsxrExAC6yAdtZ-BOWw";
		} else if (teamname.equals("AC Milan")) {
			channelId = "UCKcx1uK38H4AOkmfv4ywlrg";
		} else if (teamname.equals("Inter Milan")) {
			channelId = "UCvXzEblUa0cfny4HAJ_ZOWw";
		} else if (teamname.equals("Roma")) {
			channelId = "UCLttSYJ6kPtlcurY96kXkQw";
		} else if (teamname.equals("Bayern München")) {
			channelId = "UCZkcxFIsqW5htimoUQKA0iA";
		} else if (teamname.equals("Borussia Dortmund")) {
			channelId = "UCK8rTVgp3-MebXkmeJcQb1Q";
		}

		HttpURLConnection connection;
		String protocol = "GET";
		BufferedReader bReader;
		String json_str = "";

		HashMap<String, Object> hm = new HashMap<>();
		hm.put("channelId", channelId);
		hm.put("part", "snippet");
		hm.put("key", "AIzaSyDWCck1VPdEuIvGDU7DSzk0xCcCWybQnz4");
		hm.put("maxResults", 12);
		hm.put("regionCode", "KR");
		hm.put("order", "date");
		hm.put("type", "video");
		if (pageToken != null) {
			hm.put("pageToken", pageToken);
		}
		String add_url = "";

		Iterator<String> keys = hm.keySet().iterator();
		while (keys.hasNext()) {
			String map_key = keys.next();
			add_url += map_key + "=" + hm.get(map_key) + "&";
		}
		add_url = add_url.substring(0, add_url.length() - 1);
		try {
			URL url = new URL("https://www.googleapis.com/youtube/v3/search?" + add_url);
			connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod(protocol);
			bReader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));

			int a;
			while ((a = bReader.read()) != -1) {
				json_str += ((char) a);
			}

			Object obj = JSONValue.parse(json_str);
			JSONObject object = (JSONObject) obj;
			JSONArray items = (JSONArray) object.get("items");

			ArrayList<YoutubeVO> arr = new ArrayList<>();
			for (int i = 0; i < items.size(); i++) {
				YoutubeVO vo = new YoutubeVO();
				Object jobj = items.get(i);

				Object id = ((JSONObject) jobj).get("id");
				String href = "https://www.youtube.com/embed/" + ((JSONObject) id).get("videoId").toString();

				Object snippet = ((JSONObject) jobj).get("snippet");
				String title = ((JSONObject) snippet).get("title").toString();
				Object thumbnails = ((JSONObject) snippet).get("thumbnails");
				Object high = ((JSONObject) thumbnails).get("high");
				String img_src = ((JSONObject) high).get("url").toString();

				vo.setTitle(title);
				vo.setHref(href);
				vo.setImg_src(img_src);
				arr.add(vo);
			}
			model.addAttribute("arr", arr);
			String nextPageToken = ((JSONObject) obj).get("nextPageToken") == null ? ""
					: ((JSONObject) obj).get("nextPageToken").toString();
			String prevPageToken = ((JSONObject) obj).get("prevPageToken") == null ? ""
					: ((JSONObject) obj).get("prevPageToken").toString();
			model.addAttribute("teamname", teamname);
			model.addAttribute("prevPageToken", prevPageToken);
			model.addAttribute("nextPageToken", nextPageToken);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/pages/videos";
	}

}
