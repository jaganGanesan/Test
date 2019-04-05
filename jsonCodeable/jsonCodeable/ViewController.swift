//
//  ViewController.swift
//  jsonCodeable
//
//  Created by PIXI IMAC 01 on 05/04/2019.
//  Copyright © 2019 Pixi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.testData()
    }

    func testData () -> Void
    {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {return}
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let dataResponse = data,
            error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                return }
        do{
            //here dataResponse received from a network request
            
            var modelArray = [RootClass]() //Initialising Model Array

            let jsonDecoder = JSONDecoder()
            let model = try jsonDecoder.decode([RootClass].self, from: dataResponse)
            print(" model Id= \(String(describing: model.count))")
            for dic in model
            {
                modelArray.append(dic)
            }
            print(modelArray.count)
            print(modelArray[0].title)
 
         } catch let parsingError {
            print("Error", parsingError)
        }
    }
    task.resume()
    }

}



