//
//  PeopleTableViewController.swift
//  StarWarsEncyclopedia
//
//  Created by Isidro Arzate on 7/10/18.
//  Copyright © 2018 Isidro Arzate. All rights reserved.
//

import UIKit


class PeopleTableViewController: UITableViewController {
    // Hardcoded data for now
    var people = [NSDictionary]()
    override func viewDidLoad() {
        super.viewDidLoad()
        StarWarsModel.getAllPeople(completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
            data, response, error in
            do {
                // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] as? NSArray {
                        for person in results {
                            let personDict = person as! NSDictionary
                            self.people.append(personDict)
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Something went wrong")
            }
        })
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected")
        print(indexPath)
        performSegue(withIdentifier: "peopleViewerSegue", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let goingTo = segue.destination as! PeopleViewerViewController
//            let addItemTableViewController = navigationController.topViewController as! PeopleViewerViewController
            
            let indexPath = sender as! NSIndexPath
        let item = people[indexPath.row]
        if item["name"] != nil {
            print(item)
            goingTo.Name = "Name: " + (item["name"] as! String)
            goingTo.mass = "Mass: " + (item["mass"] as! String)
            goingTo.gender = "Gender: " + (item["gender"] as! String)
            goingTo.year = "Birthday: " + (item["birth_year"] as! String)
        }
        

        

    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // if we return - sections we won't have any sections to put our rows in
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the count of people in our data array
        print(people.count)
        return people.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a generic cell
        let cell = UITableViewCell()
        // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = ((people[indexPath.row]["name"]) as! String)
        // return the cell so that it can be rendered

        return cell
    }
}
