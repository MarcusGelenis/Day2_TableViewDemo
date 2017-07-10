//
//  TableViewDemoViewController.swift
//  Day2_TableViewDemo
//
//  Created by админ on 10.07.17.
//  Copyright © 2017 админ. All rights reserved.
//

import UIKit

class TableViewDemoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var strings = "The designated initializer. If you subclass UIViewController, you must call the super implementation of this method, even if you aren't using a NIB.  (As a convenience, the default init method will do this for you, and specify nil for both of this methods arguments.) In the specified NIB, the File's Owner proxy should".components(separatedBy: " ")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

}

extension TableViewDemoViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strings.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1. запросим прототип
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        //2. найдем модель для конкретного индекса
        let text = strings[indexPath.row]
        
        //3. настроим его в соответсвии с моделью
        cell.textLabel?.text = text
        cell.detailTextLabel?.text = "[\(indexPath.row)]"
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.detailTextLabel?.backgroundColor = UIColor.clear
        
        return cell
    }
}
