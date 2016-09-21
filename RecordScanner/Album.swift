//
//  Album.swift
//  RecordScanner
//
//  Created by Avery Bryce Dews on 9/21/16.
//  Copyright © 2016 ABD. All rights reserved.
//

import Foundation

class Album {
    
    private(set) var album: String!
    private(set) var year: String!
    private(set) var recordLabel: String!
    private(set) var format: String!
    private(set) var country: String!
    
    init(artistAlbum: String, albumYear: String, recordLabel: String, format: String, country: String) {
        
        // Add a little extra text to the album information.
        
        self.album = "Album: \n\(artistAlbum)"
        self.year = "Released in: \(albumYear)"
        self.recordLabel = "Record Label: \(recordLabel)"
        self.format = "Format: \(format)"
        self.country = "Country: \(country)"
    }
}

