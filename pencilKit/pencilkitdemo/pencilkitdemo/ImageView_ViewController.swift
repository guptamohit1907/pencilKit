//
//  ImageView_ViewController.swift
//  pencilkitdemo
//
//  Created by Acxiom Consulting on 06/09/21.
//

import UIKit

class ImageView_ViewController: UIViewController {

    
    @IBOutlet weak var imgView: UIImageView!
    var img = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imgView.image = img
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

