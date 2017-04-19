package good.love.music.vo;

import java.io.File;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.UnsupportedAudioFileException;

public class MusicSource {
	private File file;
	private String filePath;
	private double bpm;
	private String motherName;
	private String insName;
	private String fileName;

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public double getBpm() {
		return bpm;
	}

	public void setBpm(double bpm) {
		this.bpm = bpm;
	}

	public MusicSource(File file) throws IOException, UnsupportedAudioFileException {
		this.file = file;
		// 패턴 추출 정규표현식
		Pattern pattern = Pattern.compile("(\\w*\\\\\\w*\\\\\\w*.wav)");
		Matcher matcher;
		if (file.exists()) {
			matcher = pattern.matcher(file.getCanonicalPath());
			if (matcher.find()) {
				this.filePath = "resources/musicSources/" + matcher.group(1).replace('\\', '/');
				AudioInputStream stream = AudioSystem.getAudioInputStream(file);
				AudioFormat format = stream.getFormat();
				this.bpm = (file.length() / format.getSampleRate() / (format.getSampleSizeInBits() / 8.0)
						/ format.getChannels()) - 0.05;
				stream.close();

				String[] subFilePath = filePath.split("\\/");
				if (subFilePath.length > 4) {
					System.out.println("subFilePath== " + subFilePath[2]);
					System.out.println("subFilePath== " + subFilePath[3]);
					System.out.println("subFilePath== " + subFilePath[4].split("\\.")[0]);
					this.motherName = subFilePath[2];
					this.insName = subFilePath[3];
					this.fileName = subFilePath[4].split("\\.")[0];
				}
			}
		}

	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getInsName() {
		return insName;
	}

	public void setInsName(String insName) {
		this.insName = insName;
	}

	public String getMotherName() {
		return motherName;
	}

	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}

}
