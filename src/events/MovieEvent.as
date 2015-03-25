package events {
	// Imports
	import flash.events.Event;
	
	import model.Movie;
	
	// Event class
	public class MovieEvent extends Event {
		public var movie:Movie;
		public static const EVENT_SHOW_MOVIE:String = "showMovie";
		public static const EVENT_REMOVE_MOVIE:String = "removeMovie";
		
		public function MovieEvent(type:String, movie:Movie) {
			super(type, false, false);
			this.movie = movie;
		}
	}
}