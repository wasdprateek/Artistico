//
//  ConnectViewController.swift
//  Artistico
//
//  Created by Batch-2 on 16/05/24.
//

import UIKit

class ConnectViewController: UIViewController {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.tabBarItem.title = "Connect"
        self.tabBarItem.image = UIImage(systemName: "person.3")
        self.tabBarItem.selectedImage = UIImage(systemName: "person.3.fill")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
