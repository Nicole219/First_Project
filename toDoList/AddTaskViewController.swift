//
//  AddTaskViewController.swift
//  toDoList
//
//  Created by Goodworkapps on 05.11.17.
//  Copyright © 2017 OurTeam. All rights reserved.
//

import UIKit

var noteImage :UIImage? = nil

class AddTaskViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var taskTextField: UITextField!
    @IBAction func saveButtonTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = Task(context: context)
        task.name = taskTextField.text!
        task.note = noteTextView.text!
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
       
        
        navigationController!.popViewController(animated: true)
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func addImageView(_ sender: Any) {
        
        let image = UIImagePickerController()
        image.delegate = self

        
        let action = UIAlertController(title: "Выберите фотографию", message: "", preferredStyle: .actionSheet)
        action.addAction(UIAlertAction(title: "Камера", style: .default, handler:{ (action:UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            image.sourceType = UIImagePickerControllerSourceType.camera
            self.present(image, animated: true, completion: nil)
            }
            else{
                print("Can't use camera")
            }
        }))
        action.addAction(UIAlertAction(title: "Галерея", style: .default, handler:{ (action:UIAlertAction) in
            image.sourceType = UIImagePickerControllerSourceType.photoLibrary
            self.present(image, animated: true, completion: nil)
        }))
        action.addAction(UIAlertAction(title: "Отменить", style: .default, handler:nil))
        
        self.present(action, animated: true, completion: nil)
        //image.allowsEditing = false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
            noteImage = image
        }
        else{
            print("error")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  

}
