//
//  ResultsViewController.swift
//  TheGoodPlaceApp
//
//  Created by Girls Who Code on 7/10/19.
//  Copyright © 2019 Girls Who Code. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var noCorrect: Int = 0
    var total: Int = 0
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Number of correct \(noCorrect) out of \(total)"
        var percentRight = (Double(noCorrect)/Double(total))*100
        if(percentRight > 50) {
            messageLabel.text = "You Passed!"
        }else if(percentRight < 40){
            messageLabel.text = "Not Bad"
        } else {
            messageLabel.text = "You Failed"
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
     //ResultsViewController = code for second page
    }
    */

}
