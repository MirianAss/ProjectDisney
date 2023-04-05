//
//  ListFilmsViewController.swift
//  ProjectDisney
//
//  Created by Mirian Santana on 03/04/23.
//

import UIKit

class ListFilmsViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imageFilms: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var filmsDisney: Datum?
    var arrayFilms: Datum?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupName()
        setupImage()
        setupTableView()
    }
    
    func setupName() {
        lblName.text = filmsDisney?.name ?? ""
    }
    
    func setupImage() {
        let urlImage = URL(string: filmsDisney?.imageURL ?? "")
        imageFilms.sd_setImage(with: urlImage)
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FilmsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    @IBAction func btNextPage(_ sender: Any) {
    }
}

extension ListFilmsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayFilms?.films?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FilmsTableViewCell {
            
//            cell.setupCell(filmsCell: self.arrayFilms?[indexPath.row])
            
            return cell
        }
        return UITableViewCell()
    }
}
