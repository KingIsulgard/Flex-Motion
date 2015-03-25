package model {
	// Imports
	import mx.collections.*;
	
	[Bindable]
	public class Movie {
		// Movie information
		public var title:String;
		public var description:String;
		public var cover:String;
		public var categories:ArrayCollection = new ArrayCollection();
		public var directors:ArrayCollection = new ArrayCollection();
		public var writers:ArrayCollection = new ArrayCollection();
		public var roles:ArrayCollection = new ArrayCollection();
		public var keywords:ArrayCollection = new ArrayCollection();
		
		// File information
		public var viewed:int = 0;
		public var source:String;
		
		public function Movie(title:String) {
			// Set title
			this.title = title;
			
			// Set no cover
			cover = "assets/images/nocover.gif";
			
			// Set sort function on categories
			sortCategories();
		}
		
		public function get viewsString():String {
			if(viewed)
				return "You have seen this movie " + viewed.toString() + " times";
			else
				return "You haven't seen this movie yet";
		}
		
		public function addCategory(category:Category):void {
			if(!hasCategory(category))	// Add if not yet in list
				categories.addItem(category);
			
			// Resort
			categories.refresh();
		}
		
		public function removeCategory(category:Category):void {
			categories.removeItemAt(categories.getItemIndex(category));
		}
		
		public function hasCategory(category:Category):Boolean {		
			for each(var tempCategory:Category in categories)
				if(tempCategory.compareTo(category))
					return true;
			
			return false;
		}
		
		public function get categoryList():String {
			categories.list
			var isFirst:Boolean = true;
			var resultString:String = "";
			
			for each(var tempCategory:Category in categories) {
				if(!isFirst)
					resultString += ", ";
				else
					isFirst = false;
					
				resultString += "<a href='event:" + tempCategory.name + "'><u>" + tempCategory.name + "</u></a>";
			}
			
			if(resultString == "")
				resultString = "No categories specified yet.";
				
			return resultString;
		}
		
		public function get shortDescription():String {			
			if(description.length > 450)
				return description.substr(0, 420) + "... <a><u>Read more</u></a>";
			else if(description.length == 0)
				return "This movie has no description yet.";
			else
				return description;
		}
		
		public function get sourceText():String {			
			if(source == null)
				return "No movie file has been specified yet";
			else
				return source;
		}
		
		public function addDirector(director:Director):void {
			directors.addItem(director);
		}
		
		public function removeDirector(director:Director):void {
			directors.removeItemAt(directors.getItemIndex(director));
		}
		
		public function hasDirector(director:Director):Boolean {		
			for each(var tempDirector:Director in directors)
				if(tempDirector.compareTo(director))
					return true;
			
			return false;
		}
		
		public function addWriter(writer:Writer):void {
			writers.addItem(writer);
		}
		
		public function removeWriter(writer:Writer):void {
			writers.removeItemAt(writers.getItemIndex(writer));
		}
		
		public function hasWriter(writer:Writer):Boolean {		
			for each(var tempWriter:Writer in writers)
				if(tempWriter.compareTo(writer))
					return true;
			
			return false;
		}
		
		public function addRole(role:Role):void {
			roles.addItem(role);
		}
		
		public function removeRole(role:Role):void {
			roles.removeItemAt(roles.getItemIndex(role));
		}
		
		public function hasRole(role:Role):Boolean {		
			for each(var tempRole:Role in roles)
				if(tempRole.compareTo(role))
					return true;
			
			return false;
		}
		
		public function addKeyword(keyword:String):void {
			keywords.addItem(keyword);
		}
		
		public function removeKeyword(keyword:String):void {
			keywords.removeItemAt(keywords.getItemIndex(keyword));
		}
		
		public function compareTo(movie:Movie):Boolean {
			var equalsThis:Boolean = true;
			
			if(this.title != movie.title)
				equalsThis = false;
			
			if(this.description != movie.description)
				equalsThis = false;
			
			return equalsThis;
		}
		
		private function sortCategories():void {
			// Create the sort field
		    var dataSortField:SortField = new SortField();
		    
		    // Name of the field of the object on which you wish to sort the Collection
		    dataSortField.name = "name";
		    dataSortField.caseInsensitive = true;
		    
		     // Create the sort object
		    var dataSort:Sort = new Sort();
		    dataSort.fields = [dataSortField];
		 	
		 	// Set sort
		    categories.sort = dataSort;
		}
	}
}