//
//  AddTaskViewController.swift
//  toDoList
//
//  Created by Goodworkapps on 05.11.17.
//  Copyright © 2017 OurTeam. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var taskTextField: UITextField!
    @IBAction func saveButtonTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = Task(context: context)
        task.name = taskTextField.text!
        task.note = noteTextView.text!
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        /*if (taskTextField.text?.isEmpty)!{
            AlertController.showAlert(self, title: "Ошибка", messege: "Пожалуйста, заполните все необходимые поля")
            return
        }*/
        
        navigationController!.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  

}
