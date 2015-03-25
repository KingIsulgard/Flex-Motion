package model {
	[Bindable]
	public class Person {
		public var name:String;
		public var picture:String;
		public var actor:Actor;
		public var director:Director;
		public var writer:Writer;
		
		public function Person(name:String) {
			this.name = name;
		}
		
		public function compareTo(person:Person):Boolean {
			var equalsThis:Boolean = true;
			
			if(this.name != person.name)
				equalsThis = false;
			
			return equalsThis;
		}
	}
}