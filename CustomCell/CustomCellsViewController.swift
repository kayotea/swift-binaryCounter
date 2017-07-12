//
//  ViewController.swift
//  CustomCell
//
//  Created by Placoderm on 7/12/17.
//  Copyright © 2017 Placoderm. All rights reserved.
//

import UIKit

class CustomCellsViewController: UITableViewController {

    var nums = [Int]()
    var total = 0
    @IBOutlet weak var totalBottomBar: UILabel!
    @IBAction func addButtonPressed(_ sender: UIButton) {
        let buttonPosition: CGPoint = sender.convert(CGPoint.zero, to: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at: buttonPosition)
        
        if let index_path = indexPath {
            total += nums[index_path.row]
        }
        totalBottomBar.text = "Total: \(total)"
    }
    @IBAction func subtractButtonPressed(_ sender: UIButton) {
        let buttonPosition: CGPoint = sender.convert(CGPoint.zero, to: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at: buttonPosition)
        
        if let index_path = indexPath {
            total -= nums[index_path.row]
        }
        totalBottomBar.text = "Total: \(total)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for i in 0...15 {
            nums.append(Int(pow(Double(10),Double(i))))
        }
        print (nums)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustCell") as! CustCell
        cell.cellLabel.text = "\(nums[indexPath.row])"
        // return cell so that Table View knows what to draw in each row
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nums.count
    }


}
