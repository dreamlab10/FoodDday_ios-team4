//
//  AddProductViewController.swift
//  FoodD-day
//
//  Created by Coolkid Nd on 2021/07/31.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase
import Photos


class AddProductViewController : UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
    
    let storage = Storage.storage()
    var storageRef:StorageReference!
    var imagePicker:UIImagePickerController!
    var file_name:String!
    var ref: DatabaseReference!

    
    
    @IBOutlet weak var addedPhoto: UIImageView!
    // 사진 추가
    @IBAction func addPhoto(_ sender: UIButton) {
        
    let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
    let action_cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        actionSheet.addAction(action_cancel)
        
    // 갤러리 버튼 추가
    let action_gallery = UIAlertAction(title: "Gallery", style: .default) { (action)
        in print("push gallery button")
            switch PHPhotoLibrary.authorizationStatus() {
            case .authorized:
                print("접근 가능")
                self.showGallery()
            case .notDetermined:
                print("권한 요청한 적 없음")
                PHPhotoLibrary.requestAuthorization(for: .readWrite) { (status) in
                    }
            default:
                print("권한이 없어요. 추가해주세요.")
                let alertVC = UIAlertController(title: "권한 필요", message: "사진첩 접근 권한이 필요합니다. 설정 화면에서 설정해주세요.", preferredStyle: .alert)
                let action_settings = UIAlertAction(title: "Go Setting", style: .default) {
                    (action) in
                    print("go settings")
                    if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(appSettings, options: [:], completionHandler: nil)
                    }
                }
                let action_cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                    
                alertVC.addAction(action_settings)
                alertVC.addAction(action_cancel)
                self.present(alertVC, animated: true, completion: nil)
            }
        }
        actionSheet.addAction(action_gallery)
            
        present(actionSheet, animated: true, completion: nil)
        
}
    
    @IBAction func add(_ sender: UIButton) {
        print("upload btn pressed")
        guard let image = addedPhoto.image else{
            print("이미지 없음")
            let alertVC = UIAlertController(title: "알림", message: "이미지를 선택하고 업로드 기능을 실행하세요.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertVC.addAction(okAction)
            self.present(alertVC, animated: true, completion: nil)
            return
        }
        print("이미지 있음")
        if let data = image.pngData() {
            print("1")
            let imageRef = storageRef.child("images/\(file_name!).png")
            print("2")
            let metadata = StorageMetadata()
            metadata.contentType = "image/png"
            let uploadTask = imageRef.putData(data, metadata: nil) { (metadata, error) in
                print("3")
                if let error = error {
                    debugPrint(error)
                }
                
                guard let metadata = metadata else {
                    return
              }

              imageRef.downloadURL { (url, error) in
                guard let downloadURL = url else {
                  // Uh-oh, an error occurred!
                  return
                }
                guard let key = self.ref.child("users/food/images").childByAutoId().key else { return }
                                    
                self.ref.child("users/food/images/\(key)").setValue(["image_url": downloadURL.absoluteString])
                print(downloadURL, "upload complete")
        
              }
            }
        }
    }
    
    @IBOutlet weak var maintypeTextField: UITextField!
    @IBOutlet weak var productTextField: UITextField!
    @IBOutlet weak var placeTextField: UITextField!
    @IBOutlet weak var tagTextField: UITextField!
    @IBOutlet weak var memoTextField: UITextField!
    @IBOutlet weak var productCountTextField: UITextField!
    
    
    let mainmenu = ["채소","과일","육류","유제품","조미료","수산물","과자/제과","음료","면류","인스턴트","기타"]
    let place = ["냉장고","냉동실","실온"]
    let productcount = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"]
    
    let maintypePicker = UIPickerView()
    let placePicker = UIPickerView()
    let productcountPicker = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        maintypeTextField.inputView = maintypePicker
        maintypePicker.delegate = self
        
        placeTextField.inputView = placePicker
        placePicker.delegate = self
        
        productCountTextField.inputView = productcountPicker
        productcountPicker.delegate = self
        
        maintypePicker.dataSource = self
        placePicker.dataSource = self
        productcountPicker.dataSource = self
        
        maintypeTextField.tintColor = .clear
        placeTextField.tintColor = .clear
        productCountTextField.tintColor = .clear
        
        dismissPickerView()
        
        // 파이어베이스스토리지 - 사진업로드
        storageRef = storage.reference()
        
        // 실시간 데이터
        ref = Database.database().reference()
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       
        if pickerView == maintypePicker{
        return mainmenu.count
        }else if pickerView == placePicker{
        return place.count
        }
        else if pickerView == productcountPicker{
        return productcount.count
        }
        else{
        return 0
        }
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
        if pickerView == maintypePicker{
        return mainmenu[row]
        }
        else if pickerView == placePicker{
        return place[row]
        }
        else if pickerView == productcountPicker{
        return productcount[row]
        }
        else {
            return " "
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == maintypePicker{
        maintypeTextField.text = mainmenu[row]
        }
        else if pickerView == placePicker{
            placeTextField.text = place[row]
        }
        else if pickerView == productcountPicker{
            productCountTextField.text = productcount[row]
        }
    }
    
    func dismissPickerView() {
            let toolBar = UIToolbar()
            toolBar.sizeToFit()
            let button = UIBarButtonItem(title: "선택", style: .plain, target: self, action: #selector(self.action))
            toolBar.setItems([button], animated: true)
            toolBar.isUserInteractionEnabled = true
            maintypeTextField.inputAccessoryView = toolBar
            placeTextField.inputAccessoryView = toolBar
            productCountTextField.inputAccessoryView = toolBar

        }
    
    @objc func action() {
       
        self.view.endEditing(true)
         }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // save to db
        guard let mainView = segue.destination as? MainViewController else {
            return
        }
        mainView.reloadTableViewData()
        //detailView.recievedTitle = productTextField.text
        
        //detailView.recievedTag = tagTextField.text
        
        
    }
    
    
    
    }
    

    
extension UITextField {
    
    
    func setDatePicker(target: Any, selector: Selector) {
        let SCwidth = self.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: SCwidth, height: 216))
        datePicker.datePickerMode = .date
        self.inputView = datePicker
        
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: SCwidth, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel))
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
        toolBar.setItems([cancel, flexible, barButton], animated: false)
        self.inputAccessoryView = toolBar
        
    }
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
    
    
}


// 이미지 갤러리에서 선택
extension AddProductViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func showGallery() {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            return
        }
        
        if let url = info[.imageURL] as? URL {
            file_name = (url.lastPathComponent as NSString).deletingPathExtension
            print(file_name, "filename")
        }
        addedPhoto.image = selectedImage
    }
}






