//
//  FileManager.swift
//  SavingData
//
//  Created by Наталья Синицына on 08.07.2018.
//  Copyright © 2018 Наталья Синицына. All rights reserved.
//

import Foundation
import UIKit

public extension FileManager {
    
    static var documentDirectoryURL: URL {
        return try! FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false)
    }
    
    //Save images to file directory
    static func copyJPEGSubdirectoriesToDocumentDirectory(subdirectoryNames: String...) {
        for subdirectoryName in subdirectoryNames {
            let documentSubdirectoryURL = URL(fileURLWithPath: subdirectoryName, relativeTo: FileManager.documentDirectoryURL)
            
            //create a folder
            try? FileManager.default.createDirectory(at: documentSubdirectoryURL, withIntermediateDirectories: false)
            //put images in folder
            guard let jpegURLs = Bundle.main.urls(forResourcesWithExtension: "jpeg", subdirectory: subdirectoryName)
                else {continue}
            
            for jpegURL in jpegURLs {
                let data = try! Data(contentsOf: jpegURL)
                try! data.write(to: documentSubdirectoryURL.appendingPathComponent(jpegURL.lastPathComponent), options: .atomic)
            }
        }
    }
    
    //Retreive img from file directory
    static func getJPEGFromDocumentDirectory(subdirectoryName: String, imageName: String) -> UIImage? {
        return UIImage(contentsOfFile: FileManager.documentDirectoryURL.appendingPathComponent(subdirectoryName).appendingPathComponent(imageName).appendingPathExtension("jpeg").path)
    }
    
    
}
