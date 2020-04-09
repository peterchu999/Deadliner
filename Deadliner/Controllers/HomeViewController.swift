////
////  HomeViewController.swift
////  Deadliner
////
////  Created by Muhammad Nobel Shidqi on 07/04/20.
////  Copyright © 2020 Muhammad Nobel Shidqi. All rights reserved.
////
//
//import UIKit
//
//class HomeViewController: UIViewController {
//
//    @IBOutlet weak var addCategoryButton: UIButton!
//    @IBOutlet weak var collectionView: UICollectionView!
//    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var interfaceSwitch: UISwitch!
//    @IBOutlet weak var categoryTextField: UITextField!
//    @IBOutlet weak var categorySearchBar: UISearchBar!
//    
//    var db = DBManager()
//    let userDefault = UserDefaults.standard
//    var categories: [Category] = []
//    var selectedColor: UIColor!
//    
//    let colorPickerData: [UIColor] = [
//        #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1),#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1),#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1),#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1),#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1),#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1),#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1),#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1),#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1),
//         #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1),#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1),#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1),#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1),#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1),#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1),#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1),#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1),#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1),
//    ]
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setUIComponents()
//        if let results = db.fetchData(for: .category) as? [Category] {
//            self.categories = results
//        }
//        
//        
//    }
//    
//    
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(resignComponent))
//        tapGesture.cancelsTouchesInView = false
//        self.view.addGestureRecognizer(tapGesture)
//        
//    }
//    
//
//    @IBAction func switchUserInterfaceStyle(_ sender: UISwitch) {
//        switch sender.isOn {
//            case true:
//                overrideUserInterfaceStyle = .dark
//                userDefault.set(true, forKey: "darkMode")
//            case false:
//                overrideUserInterfaceStyle = .light
//                userDefault.set(false, forKey: "darkMode")
//        }
//        setNavbar()
//    }
//    
//    @IBAction func addNewCategory(_ sender: UIButton) {
//        categoryTextField.endEditing(true)
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "GoToActivitiesVC" {
//            let destination = segue.destination as! ActivitiesViewController
//            let selectedIndex = tableView.indexPathForSelectedRow!.row
//            destination.selectedCategory = categories[selectedIndex]
//        }
//    }
//    
//    @objc func resignComponent() {
//        categorySearchBar.resignFirstResponder()
//        categoryTextField.resignFirstResponder()
//    }
//    
//}
//
//// MARK: - Components & UI
//extension HomeViewController {
//    func setUIComponents() {
//        setNavbar()
//        interfaceSwitch.isOn = traitCollection.userInterfaceStyle == .dark ? true : false
//        addCategoryButton.layer.cornerRadius = 4
//        selectedColor = colorPickerData.first
//    }
//    
//    func setNavbar() {
//        let navbar = navigationController?.navigationBar
//        if self.traitCollection.userInterfaceStyle == .dark {
//            navbar?.largeTitleTextAttributes = [
//                NSAttributedString.Key.foregroundColor : UIColor.white
//            ]
//            interfaceSwitch.thumbTintColor = UIColor.white
//        } else {
//            navbar?.largeTitleTextAttributes = [
//                NSAttributedString.Key.foregroundColor : UIColor.black
//            ]
//            interfaceSwitch.thumbTintColor = UIColor.black
//        }
//    }
//}
//
//// MARK: - Search Bar Delegate
//extension HomeViewController: UISearchBarDelegate {
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        if let categoryTitle = searchBar.text, !categoryTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
//            let predicate = NSPredicate(format: "title CONTAINS[cd] %@", categoryTitle)
//            if let results = db.fetchData(for: .category, withPredicate: predicate) as? [Category] {
//                self.categories = results
//                tableView.reloadData()
//            }
//        }
//        searchBar.endEditing(true)
//    }
//    
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//        searchBar.resignFirstResponder()
//    }
//    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchText == "" {
//            if let results = db.fetchData(for: .category) as? [Category] {
//                self.categories = results
//                tableView.reloadData()
//            }
//        }
//    }
//}
//
//// MARK: - TextField Delegate
//extension HomeViewController: UITextFieldDelegate {
//    func addNewCategory() {
//        if let categoryTitle = categoryTextField.text, !categoryTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
//            let newCategory = Category(context: db.context)
//            newCategory.title = categoryTitle
//            newCategory.themeColor = selectedColor
//            db.save()
//            categories.append(newCategory)
//            tableView.reloadData()
//        }
//    }
//    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.endEditing(true)
//        return true
//    }
//    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        addNewCategory()
//        categoryTextField.text = ""
//        textField.resignFirstResponder()
//    }
//}
//
//// MARK: - Color Collection View Datasource & Delegate
//extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return colorPickerData.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath) as! ColorCollectionCell
//        cell.baseView.backgroundColor = colorPickerData[indexPath.row]
//        cell.indicatorBar.isHidden = (indexPath.row == 0) ? false : true
//        cell.indicatorBar.backgroundColor = cell.baseView.backgroundColor
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.height - 8, height: collectionView.frame.height)
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        for cell in collectionView.visibleCells {
//            let colorCell = cell as! ColorCollectionCell
//            colorCell.indicatorBar.isHidden = true
//        }
//        let cell = collectionView.cellForItem(at: indexPath) as! ColorCollectionCell
//        cell.indicatorBar.isHidden = !cell.indicatorBar.isHidden
//        selectedColor = cell.baseView.backgroundColor
//    }
//}
//
//
//// MARK: - Category Table View Datasource & Delegate
//extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return categories.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTCell", for: indexPath) as! CustomTableViewCell
//        let bgColor = categories[indexPath.row].themeColor as! UIColor
//        cell.baseView.backgroundColor = bgColor
//        cell.titleLabel.text = categories[indexPath.row].title
//        cell.activitiesCountLabel.text = String(4)
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let division = CGFloat(6)
//        return CGFloat(tableView.frame.height / division)
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "GoToActivitiesVC", sender: self)
//    }
//}
