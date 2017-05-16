//
//  ViewController.swift
//  MemeMe
//
//  Created by Razlik, Yasin(AWF) on 05/04/17.
//  Copyright © 2017 Razlik, Yasin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var topText: UITextField!
    @IBOutlet weak var bottomText: UITextField!
    @IBOutlet weak var memeImage: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

    override func viewDidLoad() {
        super.viewDidLoad()
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        topText.font = UIFont.boldSystemFont(ofSize: 30.0)
        bottomText.font = UIFont.boldSystemFont(ofSize: 30.0)
        topText.delegate = self
        bottomText.delegate = self
        shareButton.isEnabled = false
    }

    @IBAction func pickAnImageFromCamera(_ sender: UIBarButtonItem) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = UIImagePickerControllerSourceType.camera
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func pickAnImageFromAlbum(_ sender: UIBarButtonItem) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func shareMeme(_ sender: Any) {
        share()
    }
    
    @IBAction func cancel(_ sender: Any) {
        
    }
    
    func share() {
        let image: Meme = getMeme()
        
        let activity = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        
        self.present(activity, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("imagePickerController")
        
        if let image = info["UIImagePickerControllerOriginalImage"] as! UIImage? {
            memeImage.image = image
            shareButton.isEnabled = true
        } else {
            shareButton.isEnabled = false
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("imagePickerControllerDidCancel")
        dismiss(animated: true, completion: nil)
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if(textField.text?.characters.count == 0) {
            textField.text = "TOP"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        topText.resignFirstResponder()
        bottomText.resignFirstResponder()
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        topText.resignFirstResponder()
        bottomText.resignFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    
    func keyboardWillShow(_ notification:Notification) {
        
        if(bottomText.isFirstResponder) {
            view.frame.origin.y = 0 - getKeyboardHeight(notification)
        }
    }

    func keyboardWillHide(_ notification:Notification) {
        
        view.frame.origin.y = 0
    }

    
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }
    
    func subscribeToKeyboardNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
    }
    
    func generateMemedImage() -> UIImage {
    
        self.toolBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = true
        
        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        self.toolBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
        
        return memedImage
    }
    
    func getMeme() -> Meme {
        return Meme(topText: topText.text!, bottomText: bottomText.text!, originalImage: memeImage.image!, memedImage: generateMemedImage())
    }
}

