//
//  ImagesTableViewCell.swift
//  RPL_Features_IOS_Native
//
//  Created by Agam Theos on 11/12/21.
//

import UIKit

final class ImagesTableViewCell: UITableViewCell {

    // MARK: - Static Properties
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    // MARK: - Properties
    
    private var dataTask: URLSessionDataTask?
    
    // MARK: -

    @IBOutlet private var titleLabel: UILabel!
    
    // MARK: -
    
    @IBOutlet private var thumbnailImageView: UIImageView!
//    @IBOutlet private var thumbnailImageView: UIImageView!
    
    // MARK: -
    
    @IBOutlet private var activityIndicatorView: UIActivityIndicatorView!

    // MARK: - Public API
    
    func configure(with title: String, url: URL?, session: URLSession) {
        // Configure Title Label
        titleLabel.text = title
        
        if let url = url {
            // Start Activity Indicator View
            activityIndicatorView.startAnimating()
            
            // Create Data Task
            let dataTask = session.dataTask(with: url) { [weak self] (data, _, _) in
                guard let data = data else {
                    return
                }
                
                // Initialize Image
                let image = UIImage(data: data)?.resizedImage(with: CGSize(width: 200.0, height: 200.0))
                
                DispatchQueue.main.async {
                    // Configure Thumbnail Image View
                    self?.thumbnailImageView.image = image
                }
            }
            
            // Resume Data Task
            dataTask.resume()
            
            self.dataTask = dataTask
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // Cancel Data Task
        dataTask?.cancel()
        
        // Discard Data Task
        dataTask = nil
        
        // Reset Thumnail Image View
        thumbnailImageView.image = nil
    }
    
}
