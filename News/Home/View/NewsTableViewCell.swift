//
//  NewsTableViewCell.swift
//  News
//
//  Created by Pasika Pongsawaluk on 13/3/2568 BE.
//

import UIKit

struct NewsTableViewCellViewModel {
    let imageUrl: String
    let name: String
    let description: String
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsNameLabel: UILabel!
    @IBOutlet weak var newsDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupNewsCell(viewModel: NewsTableViewCellViewModel){
        print("เข้ามาแล้ว")
        if let imageUrl = URL(string: viewModel.imageUrl) {
            newsImageView.load(url: imageUrl)
        }
        newsNameLabel.text = viewModel.name
        newsDescriptionLabel.text = viewModel.description
    }
}
