//
//  ImagesTableViewController.swift
//  RPL_Features_IOS_Native
//
//  Created by Agam Theos on 11/12/21.
//

import UIKit

final class ImagesViewController: UITableViewController {

    // MARK: - Types
    
    private struct Image {
    
        // MARK: - Properties
        
        let title: String
        
        // MARK: -
        
        let url: URL?
        
    }
    
    // MARK: - Properties
    
    private lazy var dataSource: [Image] = [
        Image(title: "Bakso Urat",
              url: URL(string: "https://2.bp.blogspot.com/-1EUn5gRNVVU/XGzx4Wn2AfI/AAAAAAABJCA/Qg3gawxYQ_4eM8YDD_PqN-rOPu_1zWF2gCLcBGAs/s1600/Screenshot_29.png")),
        Image(title: "Sate Ayam",
              url: URL(string: "https://img-global.cpcdn.com/recipes/905aed6a034da2ba/751x532cq70/sate-ayam-foto-resep-utama.jpg")),
        Image(title: "Sop Kaki",
              url: URL(string: "https://www.jawaban.com/assets/uploads/lori_mora/images/main/150923163843.jpeg")),
        Image(title: "Batagor",
              url: URL(string: "https://cdn0-production-images-kly.akamaized.net/yBZNNuMsf3H6Foc0Fed0Jh9pAXA=/640x480/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/1364565/original/091028300_1475593576-batagor.jpg")),
        Image(title: "Siomay",
              url: URL(string: "https://salimahfood.com/wp-content/uploads/2018/11/siomay-goreng-batagor.jpg")),
        Image(title: "Bebek Goreng",
              url: URL(string: "https://cdns.klimg.com/merdeka.com/i/w/news/2020/02/06/1145762/540x270/trik-memasak-bebek-goreng-yang-tak-alot-walau-tanpa-dipresto.jpg")),
        Image(title: "Kebab Turki",
              url: URL(string: "https://www.pegipegi.com/travel/wp-content/uploads/2018/02/16939691_1017047255095807_8340308885518579400_n-450x270.jpg")),
        Image(title: "Martabak Telor",
              url: URL(string: "https://awsimages.detik.net.id/community/media/visual/2016/04/15/5e8e53b0-3899-477b-b34a-87e48774175c_169.jpg?w=700&q=90")),
        Image(title: "Nasi Goreng",
              url: URL(string: "https://scm-assets.constant.co/scm/unilever/e9dc924f238fa6cc29465942875fe8f0/c5b644d4-7bd0-4021-b3d1-085021fa1b97.jpg")),
        Image(title: "Indomie Goreng",
              url: URL(string: "https://img-global.cpcdn.com/recipes/85582b9c08bc3268/680x482cq70/indomie-goreng-kw-rasa-mirip-banget-foto-resep-utama.jpg")),
        Image(title: "Pempek Palembang",
              url: URL(string: "https://thumbs.dreamstime.com/b/traditional-food-indonesia-made-fish-tapioca-called-pempek-served-rustic-wooden-table-rich-sweet-special-182928296.jpg")),
        Image(title: "Es Teler",
              url: URL(string: "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2020/04/29/297073082.jpg")),
        Image(title: "Ayam Goreng Crispy",
              url: URL(string: "https://img.qraved.co/v2/image/data/ayam-goreng-crispy-1571200896616.jpeg")),
        Image(title: "Gurame Bakar",
              url: URL(string: "https://cdns.klimg.com/merdeka.com/i/w/news/2020/02/13/1147492/540x270/7-cara-membuat-ikan-bakar-menggiurkan-dengan-mudah-dan-praktis.jpg")),
        Image(title: "Pizza Bolognase",
              url: URL(string: "https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395__480.jpg")),
        Image(title: "Pangsit Rebus",
              url: URL(string: "https://p4.wallpaperbetter.com/wallpaper/422/198/550/greens-plate-dumplings-red-pepper-wallpaper-preview.jpg")),
        Image(title: "Es Krim",
              url: URL(string: "https://akcdn.detik.net.id/api/wm/2020/03/11/f0877cea-c0fd-47e1-a955-5e647a008010_169.jpeg")),
        Image(title: "Es Duren",
              url: URL(string: "https://cdns.klimg.com/dream.co.id/resources//news/2018/05/07/83692/paging/47013/es-durian-paling-enak-di-medan-yhu4.jpg"))
    ]

    // MARK: -
    
    private lazy var session: URLSession = {
        // Set In-Memory Cache to 512 MB
        URLCache.shared.memoryCapacity = 512 * 1024 * 1024
        
        // Create URL Session Configuration
        let configuration = URLSessionConfiguration.default
        
        // Define Request Cache Policy
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        
        return URLSession(configuration: configuration)
    }()
    
    // MARK: - Table View Data Source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ImagesTableViewCell.reuseIdentifier, for: indexPath) as? ImagesTableViewCell else {
            fatalError("Unable to Dequeue Image Table View Cell")
        }
        
        // Fetch Image
        let image = dataSource[indexPath.row]

        // Configure Cell
        cell.configure(with: image.title, url: image.url, session: session)

        return cell
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }

}
