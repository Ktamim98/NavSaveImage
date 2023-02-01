//
//  DetailViewController.swift
//  project1
//
//  Created by Tamim Khan on 26/1/23.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    var selectedPictureNumber : Int?
    var totalPictures : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImage
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedImage{
            imageView.image = UIImage(named: imageToLoad)
        }

        self.title = "Picture \(selectedPictureNumber!) of \(totalPictures!)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    @objc func shareTapped(){
        
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else{
            print("no image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
   
    
   
}
