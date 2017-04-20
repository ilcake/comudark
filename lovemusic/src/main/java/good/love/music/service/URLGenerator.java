package good.love.music.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sound.sampled.UnsupportedAudioFileException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import good.love.music.Exception.SoundFileNotFoundException;
import good.love.music.vo.MusicSource;

@Service
public class URLGenerator {

	@Autowired
	ServletContext servletContext;

	private Map<String, MusicSource> map;
	private String dirName = "";

	private Map<String, ArrayList<MusicSource>> list;

	@PostConstruct
	public void init() {
		map = new HashMap<>();
		list = new HashMap<>();
		subDirList(servletContext.getRealPath("/resources/musicSources/"));
	}

	public void subDirList(String source) {
		File dir = new File(source);
		File[] fileList = dir.listFiles();
		try {
			for (int i = 0; i < fileList.length; i++) {
				File file = fileList[i];
				if (file.isFile()) {
					String fileName = deleteExtension(file.getName());
					MusicSource nfl = new MusicSource(file);
					map.put((dirName + fileName).toLowerCase(), nfl);
					list.get(dirName).add(nfl);
					System.out.println("the Key=" + (dirName + fileName).toLowerCase());
				} else if (file.isDirectory()) {
					dirName = file.getName();
					ArrayList<MusicSource> neList = new ArrayList<>();
					list.put(dirName, neList);
					subDirList(file.getCanonicalPath().toString());
				}
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} catch (UnsupportedAudioFileException e) {
			System.out.println(e.getMessage());
		}
	}

	private String deleteExtension(String fileName) {
		return fileName.substring(0, fileName.indexOf("."));
	}

	public double getBPM(String key) throws SoundFileNotFoundException {
		MusicSource musicSource = map.get(key);
		if (musicSource == null)
			throw new SoundFileNotFoundException();
		return musicSource.getBpm();
	}

	public String getFilePath(String key) throws SoundFileNotFoundException {
		System.out.println("요청 키 ==" + key);
		MusicSource musicSource = map.get(key);
		if (musicSource == null) {
			throw new SoundFileNotFoundException();
		}
		System.out.println("요청 키 ==" + key + "  // 받은 주소 ==" + musicSource.getFilePath());
		return musicSource.getFilePath();
	}

	public Map<String, MusicSource> getMap() {
		return map;
	}

	public void setMap(Map<String, MusicSource> map) {
		this.map = map;
	}

	public Map<String, ArrayList<MusicSource>> getList() {
		return list;
	}

	public void setList(Map<String, ArrayList<MusicSource>> list) {
		this.list = list;
	}

}