# Flicks

## Log
### V0
Wed Oct 12: Finished following the [4 Flicks tutorial videos](https://www.youtube.com/watch?v=T8KbTOEhQC4&list=PLrT2tZ9JRrf742tAoln7wjPsCm8dmuYyv). Basic MoviesViewController, which is a UIViewController that implements UITableViewDataSource and UITableViewDelegatetable for a table view. Calls the movie API on viewDidLoad and stores array of movies as local var. Create a custom view MovieCell, a UITableViewCell, to show custom movie poster, title, and overview. Set up the cell as reusable with the Reuse Identifier in the Attributes (scale icon) tab. So far, using Storyboard and IBOutlets to hook up views to view controller logic. Lots of 3rd party libraries available through cocoa pods--installed AFNetworking to use UIImageView.setImageWith(_ url: URL).
![V0](https://raw.githubusercontent.com/carinaboo/flicks/master/Demo/FlicksV0.gif)