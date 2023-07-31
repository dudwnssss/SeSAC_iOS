//
//  ViewController.swift
//  Movie
//
//  Created by 임영준 on 2023/07/28.
//

import UIKit

class MovieTableViewController: UITableViewController {

    
    let movieInfo = MovieInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        tableView.rowHeight = 150
    }
    
    private func registerCell() {
        let nibName = UINib(nibName: "MovieCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "MovieCell")
    }

}

extension MovieTableViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieInfo.movie.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier) as? MovieCell else {
            print("wrong identifier")
            return UITableViewCell()
        }
        
        let row = movieInfo.movie[indexPath.row]
        cell.configureCell(row: row)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let swipe = UIContextualAction(style: .normal, title: "swipe") { action, view, completionHandler in
            print("swiped")
        }
        let test = UIContextualAction(style: .normal, title: "test") { action, view, completionHandler in
            print("tested")
        }
        return UISwipeActionsConfiguration(actions: [swipe, test])
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "delete") { action, view, completionHandler in
            print("deleted")
        }
        let flag = UIContextualAction(style: .normal, title: "flag") { action, view, completionHandler in
            print("flaged")
        }
        let test = UIContextualAction(style: .normal, title: "test") { action, view, completionHandler in
            print("tested")
        }
        return UISwipeActionsConfiguration(actions: [delete, flag, test])
    }
    
    
    
}
