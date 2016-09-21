//
//  DataService.swift
//  RecordScanner
//
//  Created by Avery Bryce Dews on 9/21/16.
//  Copyright © 2016 ABD. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataService {
    
    static let dataService = DataService()
    
    private(set) var ALBUM_FROM_DISCOGS = ""
    private(set) var YEAR_FROM_DISCOGS = ""
    private(set) var LABEL_FROM_DISCOGS = ""
    private(set) var FORMAT_FROM_DISCOGS = ""
    private(set) var COUNTRY_FROM_DISCOGS = ""
    
    static func searchAPI(codeNumber: String) {
        
        // The URL we will use to get out album data from Discogs
        
        let discogsURL = "\(DISCOGS_AUTH_URL)\(codeNumber)&?barcode&key=\(DISCOGS_KEY)&secret=\(DISCOGS_SECRET)"
        
        Alamofire.request(.GET, discogsURL)
            .responseJSON { response in
                
                var json = JSON(response.result.value!)
                
                let albumArtistTitle = "\(json["results"][0]["title"])"
                let albumYear = "\(json["results"][0]["year"])"
                let albumLabel = "\(json["results"][0]["label"][0])"
                let format = "\(json["results"][0]["format"][0])"
                let country = "\(json["results"][0]["country"])"
                
                self.dataService.ALBUM_FROM_DISCOGS = albumArtistTitle
                self.dataService.YEAR_FROM_DISCOGS = albumYear
                self.dataService.LABEL_FROM_DISCOGS = albumLabel
                self.dataService.FORMAT_FROM_DISCOGS = format
                self.dataService.COUNTRY_FROM_DISCOGS = country
                
                // Post a notification to let AlbumDetailsViewController know we have some data.
                
                NSNotificationCenter.defaultCenter().postNotificationName("AlbumNotification", object: nil)
        }
    }
}