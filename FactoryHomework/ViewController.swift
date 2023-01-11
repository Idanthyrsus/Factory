//
//  ViewController.swift
//  FactoryHomework
//
//  Created by Alexander Korchak on 31.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let urlSession: NetworkLayer = UrlSessionLayer()
    var charactersArray: [CartoonCharacter] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var character: CartoonCharacter? = nil
    private var index: Int = 0
    private var builder: CharactersFactory = CharacterCreator()
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.delegate = self
        table.dataSource = self
        table.register(CustomTableCell.self, forCellReuseIdentifier: CustomTableCell.cellId)
        table.backgroundColor = .white
        table.layer.cornerRadius = 10
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 40))
        button.tintColor = .blue
        button.layer.cornerRadius = 12
        button.backgroundColor = .orange
        button.setTitle("Replace Characters", for: .normal)
        button.addTarget(self, action: #selector(reload), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
        view.addSubview(confirmButton)
        
        builder.getCharacter(characterType: .rickAndMorty, requestType: .api) { [weak self] result in
            self?.charactersArray = result
        }
    }
    
    @objc func reload() {
        builder.getCharacter(characterType: .simpsons, requestType: .api) {[weak self] result in
            self?.charactersArray = result
        }
    }
    
    private func setupTableView() {
        self.view.addSubview(tableView)
       
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 36),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        charactersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableCell.cellId, for: indexPath) as? CustomTableCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            return cell
        }
        
        if let characterName = charactersArray[indexPath.row].name {
            cell.nameLabel.text = "Name: \(characterName)"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
}
