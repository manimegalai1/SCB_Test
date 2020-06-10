//
//  ViewController.swift
//  SCBTest
//
//  Created by Mani Megalai on 1/6/20.
//  Copyright © 2020 Mani Megalai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate,UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var searchMovie: UISearchBar!
    @IBOutlet weak var movieCollView: UICollectionView!
    private var movie = [MovieList]()
    var movieFilter = [MovieList]()
    var searchMov = [String]()
    final let url = URL(string: "http://www.omdbapi.com/?apikey=b9bd48a6&s=Marvel&type=movie")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieCollView.delegate = self
        movieCollView.dataSource = self
        downloadJson()
        setUpSearchBar()
    }
    
    private func setUpSearchBar() {
        searchMovie.delegate = self
    }
    
    // Fetch Data
    
    func downloadJson() {
        guard let downloadURL = url else { return }
        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                return
            }
            do{
                let decoder = JSONDecoder()
                let downloadedActors = try decoder.decode(Search.self, from: data)
                print(downloadedActors)
                self.movie = downloadedActors.Search
                self.movieFilter = downloadedActors.Search
                DispatchQueue.main.async {
                    self.movieCollView.reloadData()
                }
            } catch {
                print("something wrong after downloaded")
            }
        }.resume()
    }
    
    // UICollectionView Delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movieFilter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCollCell
        cell.lblTitle.text = self.movieFilter[indexPath.item].Title
        if let imageURL = URL(string: self.movieFilter[indexPath.item].Poster){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imgCollect?.image = image
                    }
                }
            }
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let vc = storyboard?.instantiateViewController(withIdentifier: "MovieDetailVc") as? MovieDetailController
        vc?.movieId = self.movieFilter[indexPath.item].imdbID
        vc?.url = "http://www.omdbapi.com/?apikey=b9bd48a6&i=\(self.movieFilter[indexPath.item].imdbID)"
        self.navigationController?.pushViewController(vc!, animated: true)
    }

    // UISearchBar Delegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
           guard !searchText.isEmpty else {
               self.movieFilter = movie
            self.movieCollView.reloadData()
               return
           }
           self.movieFilter = movie.filter({ movie -> Bool in
               movie.Title.lowercased().contains(searchText.lowercased())
           })
           self.movieCollView.reloadData()
       }
}

