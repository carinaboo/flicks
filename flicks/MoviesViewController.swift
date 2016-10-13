//
//  MoviesViewController.swift
//  flicks
//
//  Created by Carina Boo on 10/11/16.
//  Copyright © 2016 Carina Boo. All rights reserved.
//

import UIKit
import AFNetworking

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet var tableView: UITableView!
  
  var movies: [NSDictionary]?
  
  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.dataSource = self;
    tableView.delegate = self;
    
    let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
    let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)")
    let request = URLRequest(
      url: url!,
      cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData,
      timeoutInterval: 10)
    
    let session = URLSession(
      configuration: URLSessionConfiguration.default,
      delegate: nil,
      delegateQueue: OperationQueue.main
    )
    
    let task: URLSessionDataTask = session.dataTask(with: request, completionHandler: { (dataOrNil, response, error) in
      if let data = dataOrNil {
        if let responseDictionary = try! JSONSerialization.jsonObject(
          with: data, options:[]) as? NSDictionary {
          print("response: \(responseDictionary)")
          
          self.movies = responseDictionary["results"] as? [NSDictionary]
          self.tableView.reloadData()
        }
      }
    })
    task.resume()

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

// MARK: - UITableViewDataSource
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let movies = movies {
      return movies.count
    } else {
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
    
    let movie = movies![(indexPath as NSIndexPath).row]
    let title = movie["title"] as! String
    let overview = movie["overview"] as! String
    let imageURL = posterImageURL(for: movie)

    cell.titleLabel.text = title
    cell.overviewLabel.text = overview
    cell.posterView.setImageWith(imageURL)
    
    print("row \((indexPath as NSIndexPath).row)")
    return cell
  }
  
// MARK: UITableViewDelegate

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }

// MARK: Segue
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if (segue.identifier == "MovieCellToMovieDetails") {
      let movieDetailsVC = segue.destination as! MovieDetailsViewController
      let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)
      let movie = self.movies![(indexPath?.row)!]
      let imageURL = posterImageURL(for: movie)
      movieDetailsVC.moviePosterURL = imageURL
      movieDetailsVC.movieTitle = movie["title"] as! String
      movieDetailsVC.movieOverview = movie["overview"] as! String
      movieDetailsVC.movieRating = movie["vote_average"] as! Float
      movieDetailsVC.movieReleaseDate = movie["release_date"] as! String
    }
  }

// MARK: Private
  
  func posterImageURL(for movie: NSDictionary) -> URL {
    var imageURL: URL
    if let path = movie["poster_path"] as? String {
      let baseUrl = "http://image.tmdb.org/t/p/w500"
      imageURL = URL(string: baseUrl + path)!
    } else {
      imageURL = URL(string: "http://healthflexhhs.com/wp-content/uploads/2014/12/tomatoes-vine.jpg")!
    }
    return imageURL
  }
  
}
