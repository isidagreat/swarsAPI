//
//  MovieeTableViewController.swift
//  StarWarsEncyclopedia
//
//  Created by Isidro Arzate on 7/10/18.
//  Copyright © 2018 Isidro Arzate. All rights reserved.
//

import UIKit

class MovieeTableViewController: UITableViewController {

    var movies = [NSDictionary]()
    override func viewDidLoad() {
        super.viewDidLoad()
        StarWarsModel.getAllFilms(completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
            data, response, error in
            do {
                // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] as? NSArray {
                        for movie in results {
                            let movieDict = movie as! NSDictionary
                            self.movies.append(movieDict)
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
        performSegue(withIdentifier: "MovieViewerSegue", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let goingTo = segue.destination as! MovieViewerViewController
        //            let addItemTableViewController = navigationController.topViewController as! PeopleViewerViewController
        
        let indexPath = sender as! NSIndexPath
        let item = movies[indexPath.row]
        print ("THisss is the Movie",item)
        if item["title"] != nil {
            print(item)
            goingTo.newtitle = "Title: " + (item["title"] as! String)
            goingTo.rDate = "Release Date: " + (item["release_date"] as! String)
            goingTo.director = "Director: " + (item["director"] as! String)
            goingTo.OPC = "Opening Crawl: " + (item["opening_crawl"] as! String)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the count of people in our data array
        print(movies.count)
        return movies.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a generic cell
        let cell = UITableViewCell()
        // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = ((movies[indexPath.row]["title"]) as! String)
        // return the cell so that it can be rendered
        
        return cell
    }

}
