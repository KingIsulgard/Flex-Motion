package model {
	// Imports
	import mx.collections.*;
	
	[Bindable]
	public class MovieManager {
		// Basic fields
		private var _movies:ArrayCollection;
		private var _categories:ArrayCollection;
		
		// Extra filter options
		public var filteringCategory:Category;
		public var filteringString:String;
		
		public function MovieManager() {
			_movies = new ArrayCollection();
			_categories = new ArrayCollection();
			createCategories();
			generateRandomData();
		}
		
		public function get movies():ArrayCollection {
			return _movies;
		}
		
		public function get categories():ArrayCollection {
			return _categories;
		}
		
		public function createCategories():void {
			// Set standard categories
			_categories.addItem(new Category("Action"));
			_categories.addItem(new Category("Adventure"));
			_categories.addItem(new Category("Animation"));
			_categories.addItem(new Category("Biography"));
			_categories.addItem(new Category("Comedy"));
			_categories.addItem(new Category("Crime"));
			_categories.addItem(new Category("Documentary"));
			_categories.addItem(new Category("Drama"));
			_categories.addItem(new Category("Family"));
			_categories.addItem(new Category("Fantasy"));
			_categories.addItem(new Category("Film-Noir"));
			_categories.addItem(new Category("Game-Show"));
			_categories.addItem(new Category("History"));
			_categories.addItem(new Category("Horror"));
			_categories.addItem(new Category("Music"));
			_categories.addItem(new Category("Musical"));
			_categories.addItem(new Category("Mystery"));
			_categories.addItem(new Category("News"));
			_categories.addItem(new Category("Reality-TV"));
			_categories.addItem(new Category("Romance"));
			_categories.addItem(new Category("Sci-Fi"));
			_categories.addItem(new Category("Short"));
			_categories.addItem(new Category("Sport"));
			_categories.addItem(new Category("Talk-Show"));
			_categories.addItem(new Category("Thriller"));
			_categories.addItem(new Category("War"));
			_categories.addItem(new Category("Western"));		
		}
		
		private function generateRandomData():void {
			for each(var category:Category in _categories) {
				if(category.name != "War" && category.name != "Western") {
					var movie:Movie;
					switch(Math.round(Math.random() * 3)) {
						case 0: 
							movie = new Movie("Avatar");
							movie.addCategory(category);
							category.addMovie(movie);
							movies.addItem(movie);
							movie.description = "In the future, Jake, a paraplegic war veteran, is brought to another planet, Pandora, which is inhabited by the Na'vi, a humanoid race with their own language and culture. Those from Earth find themselves at odds with each other and the local culture.";
						break;
						case 1:
							movie = new Movie("Bruce Almighty");
							movie.addCategory(category);
							category.addMovie(movie);
							movies.addItem(movie);
							movie.cover = "assets/images/bruce_almighty.jpg";
							movie.description = "Bruce Nolan, a television reporter in Buffalo, N.Y., is discontented with almost everything in life despite his popularity and the love of his girlfriend Grace . At the end of the worst day of his life, Bruce angrily ridicules and rages against God and God responds. God appears in human form and, endowing Bruce with divine powers, challenges Bruce to take on the big job to see if he can do it any better. qmlfhjqsfjqsdf jqmlfj qsmfl jqsdmfkjqsdfjqsjqmlf jqf jqsf jqfmjqsmljsqmf lqjsdf lmsqjfdmqj mlqsjdf mqjf qdfj qmjdfjs";
						break;
						default: 
							movie = new Movie("1408");
							movie.addCategory(category);
							category.addMovie(movie);
							movies.addItem(movie);
							movie.cover = "assets/images/cover.jpg";
					}
				}
			}
		}
		
		public function filterUncategorized(movie:Movie):Boolean {
			return movie.categories.length == 0;
		}
		
		public function filterCategory(movie:Movie):Boolean {
			return movie.hasCategory(filteringCategory);
		}
		
		public function filterUnwatched(movie:Movie):Boolean {
			return movie.viewed == 0;
		}
		
		public function filterSearch(movie:Movie):Boolean {
			return movie.title.toLowerCase().search(filteringString.toLowerCase()) != -1;
		}
		
		public function get sortMovieByName():Sort {
			// Create the sort field
		    var dataSortField:SortField = new SortField();
			
			// Name of the field of the object on which you wish to sort the Collection
		    dataSortField.name = "title";
		    dataSortField.caseInsensitive = true;
		   
		    // Create the sort object
		    var dataSort:Sort = new Sort();
		    dataSort.fields = [dataSortField];
		 	
		 	// Set sort
		    return dataSort;
		}
		
		public function get sortMovieByViews():Sort {
			// Create the sort field
		    var dataSortField:SortField = new SortField();
			
			// Name of the field of the object on which you wish to sort the Collection
		    dataSortField.name = "viewed";
		    dataSortField.numeric = true;
		    dataSortField.descending = true;
		   
		    // Create the sort object
		    var dataSort:Sort = new Sort();
		    dataSort.fields = [dataSortField];
		 	
		 	// Set sort
		    return dataSort;
		}
		
		public function addMovie(movie:Movie):void {
			// Add movie
			_movies.addItem(movie);
			
			// Sort list
			_movies.refresh();
		}
		
		public function removeMovie(movie:Movie):void {
			// Remove movie
			_movies.removeItemAt(movies.getItemIndex(movie));
			
			// Refresh list
			_movies.refresh();
		}
		
		public function hasMovie(movie:Movie):Boolean {		
			for each(var tempMovie:Movie in _movies)
				if(tempMovie.compareTo(movie))
					return true;
			
			return false;
		}
		
		public function getEqualMovie(movie:Movie):Movie {
			for each(var tempMovie:Movie in _movies)
				if(tempMovie.compareTo(movie))
					return tempMovie;
			
			return movie;
		}
		
		public function getRandomMovie():Movie {
			// Create a random index
			var index:int = Math.random() * movies.length;
			
			// Get the item out of the array and return it
			return Movie(movies.getItemAt(index));
		}
	}	
}