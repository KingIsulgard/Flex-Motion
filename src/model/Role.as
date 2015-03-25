package model {
	[Bindable]
	public class Role {
		// Information of role
		public var name:String;
		public var actor:Actor;
		public var movie:Movie;
		
		public function Role(name:String, actor:Actor, movie:Movie) {
			this.name = name;
			this.actor = actor;
			this.movie = movie;
		}
		
		public function compareTo(role:Role):Boolean {
			var equalsThis:Boolean = true;
			
			if(this.name != role.name)
				equalsThis = false;
			
			if(!this.movie.compareTo(role.movie))
				equalsThis = false;
			
			return equalsThis;
		}
		
		public function get actorName():String {
			return this.actor.person.name;
		}
		
		public function set actorName(name:String):void {
			this.actor.person.name = name;
		}
		
		public function get personPicture():String {
			return this.actor.personPicture;
		}
		
		public function set personPicture(picture:String):void {
			this.actor.personPicture = picture;
		}
	}
}