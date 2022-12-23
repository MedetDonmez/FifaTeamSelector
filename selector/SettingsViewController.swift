//
//  SettingsViewController.swift
//  selector
//
//  Created by fmss on 19.12.2022.
//

import UIKit
import CoreData


class SettingsViewController: UIViewController, UIColorPickerViewControllerDelegate,UITextFieldDelegate {
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var goButton: UIButton!
    var colors = [#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), #colorLiteral(red: 0.3255994916, green: 0.7100547552, blue: 0.9348809719, alpha: 1), #colorLiteral(red: 0, green: 0.9310292602, blue: 0.8295372128, alpha: 1), #colorLiteral(red: 0.7153585553, green: 0.6307420731, blue: 0.9355044961, alpha: 1), #colorLiteral(red: 0.1564418674, green: 0.6438430548, blue: 0.938908875, alpha: 1), #colorLiteral(red: 0.9355938435, green: 0.8070722818, blue: 0.3707980514, alpha: 1), #colorLiteral(red: 0.760209024, green: 0.9191901088, blue: 0.1548531353, alpha: 1), #colorLiteral(red: 0.7253844142, green: 0.5410823822, blue: 0.9392373562, alpha: 1), #colorLiteral(red: 0.9666156173, green: 0.5926267505, blue: 0.4015755653, alpha: 1), #colorLiteral(red: 0.9168447256, green: 0.4743626714, blue: 0.9386173487, alpha: 1), #colorLiteral(red: 0.3255994916, green: 0.7100547552, blue: 0.9348809719, alpha: 1)]
    var colorIndex = 0
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var itemArray = [Item]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        

        super.viewDidLoad()
//
        goButton.layer.cornerRadius = 8
        addButton.layer.cornerRadius = 8
        tableView.layer.cornerRadius = 8
        textField.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        loadItems()
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func goPressed(_ sender: Any) {
        if itemArray.count != 0 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SpinViewController") as! SpinViewController
            vc.wheelItems = self.itemArray
            
            self.navigationController?.pushViewController(vc, animated: true)
            
            
        }

    }
    
    @IBAction func addClicked(_ sender: UIButton) {

        let newItem = Item(context: context)
        newItem.title = textField.text
        self.itemArray.append(newItem)
        saveItems()
        tableView.reloadData()
        tableView.scrollToRow(at: IndexPath(row: tableView.numberOfRows(inSection: 0)-1, section: 0), at: .bottom, animated: true)
        textField.text = ""
        textField.resignFirstResponder()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            context.delete(itemArray[indexPath.row])
            itemArray.remove(at: indexPath.row)
            saveItems()
        }
    }
    
    func saveItems() {
        do {
           try context.save()
        } catch {
            print("Error")
        }
        self.tableView.reloadData()
    }
    
    func loadItems() {
        let request : NSFetchRequest<Item> = Item.fetchRequest()
        do {
        itemArray = try context.fetch(request)
        } catch {
            print("error")
    }
}
}

extension SettingsViewController: UITableViewDelegate {
}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        cell.backgroundColor = colors[indexPath.row%10]
        cell.layer.cornerRadius = 8
        return cell
    }
}

