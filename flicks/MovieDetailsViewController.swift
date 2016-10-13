//
//  MovieDetailsViewController.swift
//  flicks
//
//  Created by Carina Boo on 10/12/16.
//  Copyright © 2016 Carina Boo. All rights reserved.
//

import UIKit
import AFNetworking

class MovieDetailsViewController: UIViewController {

  @IBOutlet weak var moviePosterImageView: UIImageView!
  @IBOutlet weak var movieTitleLabel: UILabel!
  @IBOutlet weak var movieOverviewLabel: UILabel!
  @IBOutlet weak var movieRatingLabel: UILabel!
  @IBOutlet weak var movieReleaseDateLabel: UILabel!

  var moviePosterURL: URL!
  var movieTitle: String!
  var movieOverview: String!
  var movieRating: Float!
  var movieReleaseDate: String!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    moviePosterImageView.setImageWith(moviePosterURL)
    movieTitleLabel.text = movieTitle
    movieOverviewLabel.text = movieOverview
    movieOverviewLabel.sizeToFit()
    movieRatingLabel.text = String(movieRating)
    movieReleaseDateLabel.text = movieReleaseDate
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destinationViewController.
      // Pass the selected object to the new view controller.
  }
  */

}
