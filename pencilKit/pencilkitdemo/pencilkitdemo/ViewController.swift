//
//  ViewController.swift
//  pencilkitdemo
//
//  Created by Acxiom Consulting on 06/09/21.
//

import UIKit
import PencilKit

class ViewController: UIViewController {
    @IBOutlet weak var canvasView: PKCanvasView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupCanvasView()
    }
    private func setupCanvasView(){
        let canvas = PKCanvasView(frame: view.frame)
        view.addSubview(canvas)
        canvas.tool = PKInkingTool(.pen, color: .black, width: 30)
        canvas.drawingPolicy = .anyInput
        
        if let window = UIApplication.shared.windows.first ,
            let toolPicker = PKToolPicker.shared(for: window) {
            toolPicker.setVisible(true, forFirstResponder: canvasView)
            toolPicker.frameObscured(in: canvasView)
            toolPicker.addObserver(canvasView)
            canvasView.becomeFirstResponder()
        }
    }

    @IBAction func clearBtnTapped(_ sender: Any) {
        canvasView.drawing = PKDrawing()
    }
    @IBAction func imageBtnTapped(_ sender: UIBarButtonItem) {
        let imageVC = self.storyboard?.instantiateViewController(identifier: "image") as! ImageView_ViewController
        let img = UIGraphicsImageRenderer(bounds: canvasView.bounds).image { (_) in
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
        imageVC.img = img
        self.navigationController?.pushViewController(imageVC, animated: true)
    }
}

