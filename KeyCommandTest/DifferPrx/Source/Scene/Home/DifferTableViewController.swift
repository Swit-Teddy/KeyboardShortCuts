//
//  DifferTableViewController.swift
//  KeyCommandTest
//
//  Created by 이숭인 on 2022/01/21.
//

import UIKit
import Differ

class DifferTableViewController: UITableViewController {
    //MARK: - Properties
    var objects = [
        [
            "aa",
            "bb",
            "cc",
            "bb",
            "cc",
            "ddd",
            "kevin",
            "zoe",
            "teddy",
            "bb",
            "cc",
            "ddd",
            "kevin",
            "zoe",
            "teddy",
            "bb",
            "cc",
            "ddd",
            "kevin",
            "zoe",
            "teddy",
            "bb",
            "cc",
            "ddd",
            "kevin",
            "zoe",
            "teddy",
            "bb",
            "cc",
            "ddd",
            "kevin",
            "zoe",
            "teddy",
            "bb",
            "cc",
            "ddd",
            "kevin",
            "zoe",
            "teddy",
            "bb",
            "cc",
            "ddd",
            "kevin",
            "zoe",
            "teddy"
        ],
        [
            "bb",
            "cc",
            "ddd",
            "kevin",
            "zoe",
            "teddy",
            "bb",
            "cc",
            "ddd",
            "kevin",
            "zoe",
            "teddy",
            "bb",
            "cc",
            "ddd",
            "kevin",
            "zoe",
            "teddy",
            "bb",
            "cc",
            "ddd",
            "kevin",
            "zoe",
            "teddy"
        ]
    ]
    
    var currentObjects = 0 {
        didSet{
            tableView.animateRowChanges(
                oldData: objects[oldValue],
                newData: objects[currentObjects],
                deletionAnimation: .automatic,
                insertionAnimation: .automatic
            )
        }
    }
    
    //MARK: - UI Components
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "tableViewCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return objects[currentObjects].count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.currentObjects = self.currentObjects == 0 ? 1 : 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }

        cell.configure(title: objects[currentObjects][indexPath.row])

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
