# Flicks

## User Stories

### Required
* [x] User can view a list of movies currently playing in theaters from The Movie Database. Poster images must be loaded asynchronously.
* [x] User can view movie details by tapping on a cell.
* [x] User sees loading state while waiting for movies API. You can use one of the 3rd party libraries listed on CocoaControls.
* [x] User sees an error message when there's a networking error. You may not use UIAlertController or a 3rd party library to display the error. See this screenshot for what the error message should look like.
* [x] User can pull to refresh the movie list.

### Optional
* [ ] Add a tab bar for Now Playing or Top Rated movies. (high)
* [ ] Implement a UISegmentedControl to switch between a list view and a grid view. (high)
* [ ] Add a search bar. (med)
* [ ] All images fade in as they are loading. (low)
* [ ] For the large poster, load the low-res image first and switch to high-res when complete. (low)
* [ ] Customize the highlight and selection effect of the cell. (low)
* [ ] Customize the navigation bar. (low)

## Log

### V1

Th Oct 13: Finished the required user stories (early because I'm visiting my parents this weekend ^_^). Having issues with inner workings of positioning network error--the table shifts all it's cells down to make room for the network error label even when it's hidden. I manually set the tableView.contentInset. tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) seem to be not based on parent container view...it positions differently on load than after a pull to refresh.

![V0](https://raw.githubusercontent.com/carinaboo/flicks/master/Demo/FlicksV1.gif)

### V0

Wed Oct 12: Finished following the [4 Flicks tutorial videos](https://www.youtube.com/watch?v=T8KbTOEhQC4&list=PLrT2tZ9JRrf742tAoln7wjPsCm8dmuYyv). Basic MoviesViewController, which is a UIViewController that implements UITableViewDataSource and UITableViewDelegatetable for a table view. Calls the movie API on viewDidLoad and stores array of movies as local var. Create a custom view MovieCell, a UITableViewCell, to show custom movie poster, title, and overview. Set up the cell as reusable with the Reuse Identifier in the Attributes (scale icon) tab. So far, using Storyboard and IBOutlets to hook up views to view controller logic. Lots of 3rd party libraries available through cocoa pods--installed AFNetworking to use UIImageView.setImageWith(_ url: URL).

![V0](https://raw.githubusercontent.com/carinaboo/flicks/master/Demo/FlicksV0.gif)