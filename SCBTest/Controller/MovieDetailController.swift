//
//  MovieDetailController.swift
//  SCBTest
//
//  Created by Mani Megalai on 9/6/20.
//  Copyright © 2020 Mani Megalai. All rights reserved.
//

import UIKit

class MovieDetailController: UIViewController {
    
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblMovieHr: UILabel!
    @IBOutlet weak var lblMovieRate: UILabel!
    @IBOutlet weak var lblDynDesc: UILabel!
    @IBOutlet weak var lblDynScore: UILabel!
    @IBOutlet weak var lblDynRevie: UILabel!
    @IBOutlet weak var lblDynPopular: UILabel!
    @IBOutlet weak var lblDynDirector: UILabel!
    @IBOutlet weak var lblDynActor: UILabel!
    @IBOutlet weak var lblDynWriter: UILabel!
    var movieId = ""
    var url = ""
    private var movieDetail = [MovieDetail]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJson()
    }
    
    // Fetch Data
    
    func downloadJson() {
        guard let downloadURL = URL(string: self.url) else { return }
        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                return
            }
            do{
                let decoder = JSONDecoder()
                let downloadedActors = try decoder.decode(MovieDetail.self, from: data)
                DispatchQueue.main.async {
                    if let imageURL = URL(string: downloadedActors.Poster){
                        DispatchQueue.global().async {
                            let data = try? Data(contentsOf: imageURL)
                            if let data = data {
                                let image = UIImage(data: data)
                                DispatchQueue.main.async {
                                    self.imgMovie?.image = image
                                }
                            }
                        }
                    }
                    self.lblTitle.text = downloadedActors.Title
                    self.lblYear.text = downloadedActors.Year
                    self.lblMovieHr.text = downloadedActors.Runtime
                    self.lblMovieRate.text = downloadedActors.imdbRating
                    self.lblDynDesc.text = downloadedActors.Actors
                    self.lblDynScore.text = downloadedActors.Metascore
                    self.lblDynRevie.text = downloadedActors.imdbVotes
                    self.lblDynPopular.text = downloadedActors.Metascore
                    self.lblDynDirector.text = downloadedActors.Director
                    self.lblDynWriter.text = downloadedActors.Writer
                    self.lblDynActor.text = downloadedActors.Actors
                }
            } catch {
                print("something wrong after downloaded")
            }
        }.resume()
    }
}
