package good.love.music.Exception;

public class InstrumentNotFoundException extends Exception {
	@Override
	public String getMessage() {
		return "The instrument you submit has been violated by not found exception.\nWatch our document.";
	}
}
