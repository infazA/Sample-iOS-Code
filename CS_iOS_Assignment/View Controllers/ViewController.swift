//
//  ViewController.swift
//  CS_iOS_Assignment
//
//  Copyright © 2019 Backbase. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    
    var viewModel: MovieViewModelProtocol?
    var nowPlayingMoviesArr: [Any] = []
    var popularMoviesArr: [Any] = []
    
    let movieService = MovieService()
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = MovieViewModel()
        self.bindUI()
        self.UIChanges()
        self.viewModel?.getNowPlayingMovies()
        self.viewModel?.getPopularMovies()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    private func UIChanges(){
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func bindUI() {
        self.viewModel?.isLoaderHidden.bind({ [weak self] in
            self?.shouldHideLoader(isHidden: $0)
        })
        self.viewModel?.alertMessage.bind({ [weak self] in
            self?.showAlertWith(message: $0)
        })
        self.viewModel?.successResponse.bind({ [weak self] in
            if let response = $0 {
                print(response)
                self?.nowPlayingMoviesArr = response.results!
                self?.moviesTableView.reloadData()
            }
        })
        self.viewModel?.successPopularMovieResponse.bind({ [weak self] in
            if let response = $0 {
                print(response)
                self?.popularMoviesArr = response.results!
                self?.moviesTableView.reloadData()
            }
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //Section 1 -> Show Horizontal Movie images (Now Playing)
        //Section 2 -> Show Vetical Movie images (Popular)
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return nowPlayingMoviesArr.count > 0 ? 1 : 0
        }else{
            return self.popularMoviesArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell:MovieHoriCell = tableView.dequeueReusableCell(withIdentifier: "MovieHoriCell",
                                                               for: indexPath) as! MovieHoriCell
            cell.configure(movieObjs: nowPlayingMoviesArr as! [MovieModel.MovieListModel])
            return cell
        }else{
            let cell:MovieCell = tableView.dequeueReusableCell(withIdentifier: "MovieCell",
                                                               for: indexPath) as! MovieCell
            cell.configure(movieObj: popularMoviesArr[indexPath.row] as! MovieModel.MovieListModel)
            return cell
        }
       
    }
}

extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let headerView : SectionHeaderView = SectionHeaderView.instanceFromNib(index: 0) as! SectionHeaderView
        if section == 0 {
            headerView.configure(sectionTitle: "Playing Now")
            return headerView
        }
        headerView.configure(sectionTitle: "Most Popular")
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 180
        }else{
            return 100
        }
    }
}
