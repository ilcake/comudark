package good.love.music.controller;

import java.io.ByteArrayInputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import good.love.music.comu.MyNewGrammar;
import good.love.music.service.URLGenerator;
import good.love.music.vo.MusicSource;

/**
 * Handles requests for the CoMu.
 */
@Controller
public class CodeController {

	@Autowired
	URLGenerator generator;

	@RequestMapping(value = "/compile", method = RequestMethod.POST)
	public @ResponseBody String compile(String source) {
		System.out.println(source);
		MyNewGrammar grammar = new MyNewGrammar(new ByteArrayInputStream(source.getBytes(StandardCharsets.UTF_8)));
		grammar.setURLGenerator(generator);
		String result = grammar.getResult();
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/getList", method = RequestMethod.POST)
	public Map<String, ArrayList<MusicSource>> getList() {
		return generator.getList();
	}
}
