//
//  MainMenuViewController.swift
//  Etlas
//
//  Created by Hadir on 09/05/2023.
//

import UIKit

class MainMenuViewController: UIViewController {

    //IBOutlets
      @IBOutlet weak var backView: UIView!
      @IBOutlet weak var contentView: UIView!
      @IBOutlet weak var closeButton: UIButton!
      @IBAction func closePressed(_ sender: UIButton) {
          hide()
      }
      
      init() {
          super.init(nibName: "MainMenuViewController", bundle: nil)
          self.modalPresentationStyle = .overFullScreen
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
      
      override func viewDidLoad() {
          super.viewDidLoad()
          configView()
      }
      
      private func configView() {
          self.view.backgroundColor = .clear
          self.backView.backgroundColor = .black.withAlphaComponent(0.6)
          self.backView.alpha = 0
          self.contentView.alpha = 0
          self.contentView.layer.cornerRadius = 30
      }
      
      func appear(sender: ViewController) {
          sender.present(self, animated: false) {
              self.show()
          }
      }
      
      private func show() {
          UIView.animate(withDuration: 1, delay: 0.1) {
              self.backView.alpha = 1
              self.contentView.alpha = 1
          }
      }
      
      func hide() {
          UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut) {
              self.backView.alpha = 0
              self.contentView.alpha = 0
          } completion: { _ in
              self.dismiss(animated: false)
              self.removeFromParent()
          }
      }


    
}
