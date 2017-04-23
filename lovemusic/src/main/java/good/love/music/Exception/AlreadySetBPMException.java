package good.love.music.Exception;

public class AlreadySetBPMException extends Exception {
	@Override
	public String getMessage() {
		return "The bpm you submit has been violated by already set exception.\nUnable to reset bpm because the loop type is already declared.";
	}
}
