package good.love.music.controller;

import java.io.ByteArrayInputStream;
import java.nio.charset.StandardCharsets;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import good.love.music.comu.MyNewGrammar;
import good.love.music.service.URLGenerator;

@Controller
public class CodeController {

	@Autowired
	URLGenerator generator;

	@RequestMapping(value = "/compile", method = RequestMethod.POST)
	public @ResponseBody String compile(String source, HttpServletRequest request) {
		MyNewGrammar grammar = new MyNewGrammar(new ByteArrayInputStream(source.getBytes(StandardCharsets.UTF_8)));
		grammar.setURLGenerator(generator);
		String result = grammar.getResult();
		return result;
	}

}
