//
//  ListDisneyViewController.swift
//  ProjectDisney
//
//  Created by Mirian Santana on 30/03/23.
//

import UIKit

class ListDisneyViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrayDisney: Disney?
    let request = Request()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        myRequest()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DisneyTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    func myRequest() {
        request.delegate = self
        request.requestDisney { arrayDeDisney in
            
        }
    }
}

extension ListDisneyViewController: RequestDelegate {
    func finishProtocol(arrayDeDisney: Disney?) {
        self.arrayDisney = arrayDeDisney
        self.tableView.reloadData()
    }
}

extension ListDisneyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayDisney?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DisneyTableViewCell {
            
            cell.setupDisney(datum: self.arrayDisney?.data?[indexPath.row])
            
            return cell
        }
        return UITableViewCell()
    }
}

extension ListDisneyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let screen = self.storyboard?.instantiateViewController(withIdentifier: "listFilms") as? ListFilmsViewController {
            screen.filmsDisney = self.arrayDisney?.data?[indexPath.row]
            self.navigationController?.pushViewController(screen, animated: true)
        }
    }
}
