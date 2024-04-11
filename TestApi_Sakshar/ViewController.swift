//
//  ViewController.swift
//  TestApi_Sakshar
//
//  Created by Akash Singh on 02/03/24.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    @IBOutlet weak var tblView: UITableView!
    var obj = [ListData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.dataSource = self
        tblView.delegate = self
        hitApi()
    }
    
    func hitApi() {
        URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos")!) { data,response,error in
            if error == nil {
                if let data = data {
                    do {
                        let jsondata = try JSONDecoder().decode([ListData].self,from: data)
                        self.obj = jsondata
                        DispatchQueue.main.async {
                            self.tblView.reloadData()
                        }
                    }
                    catch let error {
                        print(error.localizedDescription)
                    }
                }
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return obj.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailCell
        if let text = (obj[indexPath.row].id) {
            cell.LblId.text = "\(text)"
        }
        if let textnew = (obj[indexPath.row].title) {
            cell.lblDetail.text = "\(textnew)"
        }
        
        return cell
    }

}

