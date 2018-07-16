//
//  MovieViewerViewController.swift
//  StarWarsEncyclopedia
//
//  Created by Isidro Arzate on 7/11/18.
//  Copyright © 2018 Isidro Arzate. All rights reserved.
//

import UIKit

class MovieViewerViewController: UIViewController {
    
    @IBOutlet weak var OPCLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    var newtitle: String?
    var OPC: String?
    var rDate: String?
    var director: String?
    
    @IBAction func gobackButtonPress(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OPCLabel.text = OPC
        titleLabel.text =  newtitle
        releaseDateLabel.text = rDate
        directorLabel.text = director
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
