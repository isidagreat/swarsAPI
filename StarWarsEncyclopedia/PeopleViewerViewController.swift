//
//  PeopleViewerViewController.swift
//  StarWarsEncyclopedia
//
//  Created by Isidro Arzate on 7/11/18.
//  Copyright © 2018 Isidro Arzate. All rights reserved.
//

import UIKit

class PeopleViewerViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLable: UILabel!
    @IBOutlet weak var bYearLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    
    var Name: String?
    var gender: String?
    var year: String?
    var mass: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = Name
        genderLable.text = gender
        bYearLabel.text = year
        massLabel.text = mass
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func exitViewButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
