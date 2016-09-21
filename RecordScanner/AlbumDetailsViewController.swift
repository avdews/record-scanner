//
//  AlbumDetailsViewController.swift
//  RecordScanner
//
//  Created by Avery Bryce Dews on 9/21/16.
//  Copyright © 2016 ABD. All rights reserved.
//

import UIKit

class AlbumDetailsViewController: UIViewController {
    
    @IBOutlet weak var artistAlbumLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var albumFormat: UILabel!
    @IBOutlet weak var albumCountry: UILabel!
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        artistAlbumLabel.text = "Press scan to start!"
        yearLabel.text = ""
        albumLabel.text = ""
        albumFormat.text = ""
        albumCountry.text = ""
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AlbumDetailsViewController.setLabels(_:)), name: "AlbumNotification", object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setLabels(notification: NSNotification){
        
        // Use the data from DataService.swift to initialize the Album.
        
        let albumInfo = Album(artistAlbum: DataService.dataService.ALBUM_FROM_DISCOGS, albumYear: DataService.dataService.YEAR_FROM_DISCOGS, recordLabel: DataService.dataService.LABEL_FROM_DISCOGS, format: DataService.dataService.FORMAT_FROM_DISCOGS, country: DataService.dataService.COUNTRY_FROM_DISCOGS)
        
        artistAlbumLabel.text = "\(albumInfo.album)"
        yearLabel.text = "\(albumInfo.year)"
        albumLabel.text = "\(albumInfo.recordLabel)"
        albumFormat.text = "\(albumInfo.format)"
        albumCountry.text = "\(albumInfo.country)"
    }
}