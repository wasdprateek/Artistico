//
//  ChallengesViewController.swift
//  Artistico
//
//  Created by Batch-2 on 16/05/24.
//

import UIKit

class ChallengesViewController: UIViewController {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.tabBarItem.title = "Challenges"
        self.tabBarItem.image = UIImage(systemName: "trophy")
        self.tabBarItem.selectedImage = UIImage(systemName: "trophy.fill")
    }
    
    @IBOutlet var contentView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.layer.cornerRadius = 14
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 0)
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowRadius = 3
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
