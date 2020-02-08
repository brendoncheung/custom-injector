//
//  ViewController.swift
//  DI_demo
//
//  Created by Wing Sun Cheung on 1/29/20.
//  Copyright © 2020 Wing Sun Cheung. All rights reserved.
//

import UIKit
import RealmSwift

protocol ItemViewControllerPresenter: class {
    func showItems(items: Results<Item>)
}

class ItemViewController: BaseViewController, ItemViewControllerPresenter {
    
    private let CELL_IDENTIFIER = "cell"
    
    // to be injected, therefore cant be private
    var interactor: ItemViewControllerInteractor!
    
    @IBOutlet weak var itemTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        injector.inject(ItemViewController: self)
        
        configureInteractor()
        configureNavigationController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        interactor?.onStart()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        interactor.onStop()
    }
    
    private func configureInteractor() {
        interactor?.bindPresenter(presenter: self)
    }
    
    // MARK: - Callbacks from presenter
    
    func showItems(items: Results<Item>) {
        itemTableView.reloadData()
    }
}

extension ItemViewController {
    
    private func configureNavigationController() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        title = "Todo List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    }

    @objc private func addButtonTapped() {
        
        let alert = UIAlertController(title: "Add an item", message: "", preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (action) in
            let titleTF = alert.textFields![0] as UITextField
            let detailTF = alert.textFields![1] as UITextField
            
            guard let title = titleTF.text, let detail = detailTF.text else {
                return
            }
            self.interactor?.addItem(item: Item(title: title, detail: detail))
        }
        
        alert.addTextField { (textfield) in
            textfield.placeholder = "enter a title"
        }
        
        alert.addTextField { (textfield) in
            textfield.placeholder = "enter a detail"
        }
        
        alert.addAction(addAction)
        
        present(alert, animated: true, completion: nil)
    }
}

extension ItemViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER)!
        
        let item = interactor.getItemAt(position: indexPath.row)
        
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.detail
        
        return cell

    }
    
    
    
    
}

