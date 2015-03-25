package model {
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class Writer {
		// Information of actor
		public var person:Person;
		public var movies:ArrayCollection = new ArrayCollection();
		
		public function Writer(person:Person) {
			this.person = person;
		}
		
		public function addMovie(movie:Movie):void {
			movies.addItem(movie);
		}
		
		public function removeMovie(movie:Movie):void {
			movies.removeItemAt(movies.getItemIndex(movie));
		}
		
		private function hasMovie(movie:Movie):Boolean {		
			for each(var tempMovie:Movie in movies)
				if(tempMovie.compareTo(movie))
					return true;
			
			return false;
		}
		
		public function compareTo(writer:Writer):Boolean {
			var equalsThis:Boolean = true;
			
			if(!this.person.compareTo(writer.person))
				equalsThis = false;
				
			return equalsThis;
		}
		
		public function get writerName():String {
			return this.person.name;
		}
		
		public function set writerName(name:String):void {
			this.person.name = name;
		}
		
		public function get personPicture():String {
			return this.person.picture;
		}
		
		public function set personPicture(picture:String):void {
			this.person.picture = picture;
		}
	}
}