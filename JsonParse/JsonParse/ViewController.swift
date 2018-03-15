//
//  ViewController.swift
//  JsonParse
//
//  Created by Prajwal kc on 2/20/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//
  
import UIKit

struct Country : Decodable{
    let name : String
    let region : String
    let capital : String
}
class ViewController: UIViewController , UITableViewDataSource,UITableViewDelegate {
      var countries : [Country] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    @IBOutlet weak var myTableView: UITableView!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JsonDC", for: indexPath) as! JsonDataTableViewCell
      
        
        

        cell.labelCountry.text = countries[indexPath.row].name
            cell.labelRegion.text = countries[indexPath.row].region
            cell.labelCapital.text = countries[indexPath.row].capital

        
    return cell
    }
    
     public  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let message = "Country" + countries[indexPath.row].name + "\n" + " Region :" + countries[indexPath.row].region + "\n" + " Capital :" + countries[indexPath.row].capital
        let alertAction = UIAlertAction.init(title: "ok", style: .default){
            (action) in
                
            
        }
        let alert = UIAlertController.init(title: "Information of "+self.countries[indexPath.row].name, message: message, preferredStyle: .alert)
        alert.addAction(alertAction)
        self.present(alert, animated: true)
        
    }
    
    func jsonCall(){
        
        let url = URL.init(string: "https://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!)
        {(data,response,error) in do{
            self.countries = try JSONDecoder().decode([Country].self, from: data!)
            for country in self.countries{
                print(country.name)
            }
          self.myTableView.reloadData()
        }
            
        catch
        {
            print(error)
            }
            
            }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        jsonCall()
        
       
}
}
