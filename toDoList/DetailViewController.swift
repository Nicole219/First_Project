//
//  DetailViewController.swift
//  toDoList
//
//  Created by Goodworkapps on 01.12.17.
//  Copyright © 2017 OurTeam. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var taskNameDetail: UITextField!
    
    @IBOutlet weak var noteDetail: UITextView!
    
    @IBOutlet weak var imageDetail: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let task = tasks[currentTaskIndex]
        taskNameDetail.text = task.name!
        noteDetail.text = task.note!
        if noteImage != nil{
            imageDetail.image = noteImage
        }
    
    }

   /* override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let task = tasks[currentTaskIndex]
        if taskNameDetail.text != task.name!{
            
        }
    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    

}
