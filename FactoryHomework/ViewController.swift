//
//  ViewController.swift
//  FactoryHomework
//
//  Created by Alexander Korchak on 31.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let urlSession: NetworkLayer = UrlSessionLayer()
    var rickArray: [CartoonCharacter] = []
    var simpsonsArray: [CartoonCharacter] = []
    var charactersArray: [CartoonCharacter] = []
    
    private let set = [
        CharacterType.rickAndMorty,
        CharacterType.simpsons
    ]
    
    private var character: CartoonCharacter? = nil
    private var index: Int = 0
    private var builder: CharactersFactory = CharacterCreator()
    
//    private lazy var characterLabel: UILabel = {
//        let label = UILabel()
//        label.backgroundColor = .green
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    
    
    private lazy var table: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.delegate = self
        table.dataSource = self
        table.register(CustomTableCell.self, forCellReuseIdentifier: CustomTableCell.cellId)
        table.backgroundColor = .white
        table.layer.cornerRadius = 10
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 150, y: 120, width: 50, height: 40))
        button.tintColor = .blue
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(reload), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       // setLabel()
        setupTableView()
        
        view.addSubview(button)
        
        displayCharacter()
        
        urlSession.getAllRickAndMortyCharacters { [weak self] result in
            DispatchQueue.main.async {
                do {
                    self?.charactersArray = try result.get()
                    self?.displayCharacter()
                } catch {
                    print(error.localizedDescription)
                }
                self?.table.reloadData()
            }
           
        }
        
        urlSession.getAllSimpsonsCharacters { [weak self] result in
            DispatchQueue.main.async {
                do {
                    self?.charactersArray = try result.get()
                    self?.displayCharacter()
                } catch {
                    print(error.localizedDescription)
                }
               // self?.table.reloadData()
            }
        }
    }
    
    @objc func reload() {
        self.table.reloadData()
    }
    
    func displayCharacter() {
        let currentCharacter = set[index]
        character = builder.getCharacters(characterType: currentCharacter)
      //  character?.extractCharacters(from: charactersArray, applyTo: characterLabel)
        character?.apply(array: charactersArray, to: &rickArray)
    }

    
    private func setupTableView() {
        self.view.addSubview(table)
       
        NSLayoutConstraint.activate([
            
            table.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 36),
            table.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            table.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            table.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        ])
    }
    
//    func setLabel() {
//        view.addSubview(characterLabel)
//
//        NSLayoutConstraint.activate([
//
//            characterLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100),
//            characterLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
//            characterLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40),
//            characterLabel.heightAnchor.constraint(equalToConstant: 40)
//        ])
//    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rickArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableCell.cellId, for: indexPath) as? CustomTableCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            return cell
        }
        
        if let characterName = rickArray[indexPath.row].name {
          //  cell.genusLabel.text = "Genus: \(fruitGenus)"
            cell.nameLabel.text = "Name: \(characterName)"
          //  cell.caloriesLabel.text = "Calories: \(String(fruitNutritions))"
           // cell.sugarLabel.text = "Sugar: \(String(fruitSugar))"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
}
