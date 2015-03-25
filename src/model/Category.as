package model {
	import mx.collections.*;
	
	[Bindable]
	public class Category {
		// Category information
		public var name:String;
		public var movies:ArrayCollection = new ArrayCollection();
		
		public function Category(name:String) {
			// Set name
			this.name = name;
			
			// Set sort
			sortMovies();
		}
		
		public function addMovie(movie:Movie):void {
			if(!hasMovie(movie))	// Add if not in category
				movies.addItem(movie);
			
			// Resort list
			movies.refresh();
		}
		
		public function removeMovie(movie:Movie):void {
			movies.removeItemAt(movies.getItemIndex(movie));
		}
		
		public function hasMovie(movie:Movie):Boolean {		
			for each(var tempMovie:Movie in movies)
				if(tempMovie.compareTo(movie))
					return true;
			
			return false;
		}
		
		public function compareTo(category:Category):Boolean {
			var equalsThis:Boolean = true;
			
			if(this.name != category.name)
				equalsThis = false;
			
			return equalsThis;
		}
		
		public function sortMovies():void {
			// Create the sort field
		    var dataSortField:SortField = new SortField();
		    
		    // Name of the field of the object on which you wish to sort the Collection
		    dataSortField.name = "title";
		    dataSortField.caseInsensitive = true;
		    
		     // Create the sort object
		    var dataSort:Sort = new Sort();
		    dataSort.fields = [dataSortField];
		 	
		 	// Set sort
		    movies.sort = dataSort;
		}
	}
}