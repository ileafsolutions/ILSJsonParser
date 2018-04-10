//
//  ViewController.swift
//  JsonParser
//
//  Created by Vivek iLeaf on 3/26/18.
//  Copyright © 2018 Vivek iLeaf. All rights reserved.
//

import UIKit
import ILSJsonParser

class ViewController: UIViewController
{
    var parser:ILSJsonParser?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getdatawithtoken(servicename:"https://jsonplaceholder.typicode.com/todos"
            ) { (status, result, error) in
                
                //if it is dictionary
                print(self.parser?.parsedDictionary ?? "No Dictionary")
                //if it is Array
                print(self.parser?.parsedArray ?? "No Array")
                //if it is String
                print(self.parser?.parsedString ?? "No String")
                //if it is NSNumber
                print(self.parser?.parsedNumber ?? "No Number")
                //if it is Boolean
                print(self.parser?.parsedBool ?? "No Boolean")
                
                print(self.parser?.parsedError ?? "No Error")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func getdatawithtoken(servicename : String,completion:@escaping(Bool?,AnyObject?,NSError?)->Void)
    {
        let session = URLSession.shared
        let request = NSMutableURLRequest(url: NSURL(string: servicename)! as URL)
        request.timeoutInterval = 60.0 // TimeoutInterval in Second
        request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData

       
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            if error == nil
            {
                let result : AnyObject?
                do
                {
                    
                    self.parser = ILSJsonParser(parsedData: data!)[0]["title"]
                    
                   
                    result = try JSONSerialization.jsonObject(with: data!, options: []) as AnyObject
                    
                    completion(true, result, nil)
                }
                catch let catchError as NSError
                {
                    completion(true, nil, catchError)
                }
            }
            else
            {
                completion(false, nil, error as NSError?)
            }
        })
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

