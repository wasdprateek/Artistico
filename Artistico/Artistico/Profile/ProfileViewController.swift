import UIKit

class DataModel {
    var numbers: [Int] = []
    
    init() {
        for item in 0...10 {
            numbers.append(item)
        }
    }
}

let dataModel = DataModel()

class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataModel.numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        return cell
    }
}

class ProfileViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var collectionViewDataSource = CollectionViewDataSource()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.tabBarItem.title = "Profile"
        self.tabBarItem.image = UIImage(systemName: "person")
        self.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = self
        setupNavigationBar()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 124, height: 124)
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(showOptions))
    }
    
    @IBAction func optionButtonPressed(_ sender: UIBarButtonItem) {
        showOptions()
    }
    
    @objc func showOptions() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        alertController.addAction(UIAlertAction(title: "Edit Profile", style: .default, handler: { _ in
            self.performSegue(withIdentifier: "editProfileSegue", sender: self)
        }))
        alertController.addAction(UIAlertAction(title: "Share Profile", style: .default, handler: { _ in
            let theDataToBeCopied = "Here are somethings about u, like how you can paint a masterpiece but struggle to draw a straight line on a whiteboard."

            let activityViewController = UIActivityViewController(activityItems: [theDataToBeCopied], applicationActivities: nil)
            self.present(activityViewController, animated: true, completion: nil)
        }))
        alertController.addAction(UIAlertAction(title: "Settings", style: .default, handler: { _ in
            self.performSegue(withIdentifier: "settingProfileSegue", sender: self)
        }))
        alertController.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { _ in
            let alert = UIAlertController(title: "⚠️ Sign Out Warning ⚠️", message: "This action may unleash doodle monsters from your sketchbook! 📒👾", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes, unleash them!", style: .destructive, handler: nil))
            alert.addAction(UIAlertAction(title: "No, keep them in!", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        self.present(alertController, animated: true, completion: nil)
    }
}
