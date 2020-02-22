//
//  ViewController.swift
//  Codable+JsonProject
//
//  Created by Abdalla on 2/22/20.
//  Copyright © 2020 edu.data. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var items: [User] = []
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        getData()
    }
    
    func getData(){
        
      NetworkManager().getDataFromServer(path: "lang/ar", callback:{ data in
          do{
              let jsonDecoder = JSONDecoder()
              let jsonData = try jsonDecoder.decode([User].self, from: data)
              self.items = jsonData
              
              DispatchQueue.main.sync {
                  self.tableview.reloadData()
              }
          }catch{
              print(error)
          }
      })
    }
   
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
          
          let item = items[indexPath.row]
          cell.labelTitle.text = item.name

          //cell.lblName.text = language.name
          //cell.lblTopLevelDomain.text = language.topLevelDomain?[0]
          //cell.lblTranslations.text = language.translations.fa
          //cell.lblLanguages.text = language.languages[0].name
          //cell.imageFlag.kf.setImage(with: URL(string: language.flag!))
          //cell.imageFlag.kf.setImage(with: URL(string: "https://media.linkonlineworld.com/img/original/2018/12/3/2018_12_3_23_49_15_569.jpg"))
          return cell
      }
      
      func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 180
      }
      
      func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          if editingStyle == .delete{
              items.remove(at: indexPath.row)
              tableview.deleteRows(at: [indexPath], with: .bottom)
          }
      }
      
      //func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         // performSegue(withIdentifier: "show", sender: items[indexPath.row])
    //  }
      
     /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if let sc = segue.destination as? ViewController2{
             sc.convert = sender as? LanguagesModel
      }*/

}
