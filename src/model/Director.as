package model {
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class Director {
		// Information of actor
		public var person:Person;
		public var movies:ArrayCollection = new ArrayCollection();
		
		public function Director(person:Person) {
			this.person = person;
		}
		
		public function addMovie(movie:Movie):void {
			movies.addItem(movie);
		}
		
		public function removeMovie(movie:Movie):void {
			movies.removeItemAt(movies.getItemIndex(movie));
		}
		
		public function compareTo(director:Director):Boolean {
			var equalsThis:Boolean = true;
			
			if(!this.person.compareTo(director.person))
				equalsThis = false;
			
			return equalsThis;
		}
		
		public function get directorName():String {
			return this.person.name;
		}
		
		public function set directorName(name:String):void {
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