package events {
	// Imports
	import flash.events.Event;	
	import model.Category;
	
	// Event class
	public class GoToCategoryEvent extends Event {
		public var category:Category;
		public static const EVENT_GO_CATEGORY:String = "goCategory";
		
		public function GoToCategoryEvent(type:String, category:Category) {
			super(type, false, false);
			this.category = category;
		}
	}
}