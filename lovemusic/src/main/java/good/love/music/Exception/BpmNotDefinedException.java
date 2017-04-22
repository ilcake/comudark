package good.love.music.Exception;

public class BpmNotDefinedException extends Exception {
	@Override
	public String getMessage() {
		return "The bpm you submit has been violated by not defined exception.\nBpm must be defined before the notes are called. \nOr, the loop type calls must be first.";
	}
}
