package model {
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class Actor {
		// Information of actor
		public var person:Person;
		public var roles:ArrayCollection = new ArrayCollection();
		
		public function Actor(person:Person) {
			this.person = person;
		}
		
		public function addRole(role:Role):void {
			roles.addItem(role);
		}
		
		public function removeRole(role:Role):void {
			roles.removeItemAt(roles.getItemIndex(role));
		}
		
		public function compareTo(actor:Actor):Boolean {
			var equalsThis:Boolean = true;
			
			if(!this.person.compareTo(actor.person))
				equalsThis = false;
			
			return equalsThis;
		}
		
		public function get personPicture():String {
			return this.person.picture;
		}
		
		public function set personPicture(picture:String):void {
			this.person.picture = picture;
		}
	}
}