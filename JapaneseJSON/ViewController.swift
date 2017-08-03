//
//  ViewController.swift
//  JapaneseJSON
//
//  Created by Theo King on 10/07/2017.
//  Copyright © 2017 Theo King. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let word = "cake"
        let url = URL(string: "http://jisho.org/api/v1/search/words?keyword=" + word)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil
            {
                print("Error")
            }
            else
            {
                
                if let content = data
                {
                    do
                    {
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        //print (myJson)
                        if let jData = myJson["data"] as? [Any]
                        {
                            if let japanese = jData[0] as? NSDictionary
                            {
                                print(japanese["japanese"])
                            }
                            
                        }
                    }
                    catch
                    {
                    }
                }
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

