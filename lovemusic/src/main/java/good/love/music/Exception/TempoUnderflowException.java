package good.love.music.Exception;

public class TempoUnderflowException extends Exception {
	@Override
	public String getMessage() {
		return "The tempo you submit has been violated by underfolw.\nTempo must be over zero.";
	}
}
