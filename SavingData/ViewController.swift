//
//  ViewController.swift
//  SavingData
//
//  Created by Наталья Синицына on 08.07.2018.
//  Copyright © 2018 Наталья Синицына. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mysteryDataURL = URL(fileURLWithPath: "mystery", relativeTo: FileManager.documentDirectoryURL)
        print("\(mysteryDataURL.path)")
        
        let stringURL = FileManager.documentDirectoryURL.appendingPathComponent("string").appendingPathExtension("txt")
        
        print("\(stringURL.path)")
        
        
        //Challege - create string and save it to DocumentDirectory
        let challengeString: String = "Cats cats cats"
        let challengeStringURL: URL = URL(fileURLWithPath: challengeString, relativeTo: FileManager.documentDirectoryURL).appendingPathExtension("txt")
        
        print("challengeStringURL.lastPathComponent \(challengeStringURL.lastPathComponent)")
        
        
        //Saving data - challenge
        let challengeStringData = challengeString.data(using: .utf8)!
        try! challengeStringData.write(to: challengeStringURL, options: .atomic)
        let savedChallengeString = try! String(contentsOf: challengeStringURL)
        
        //Images
        Bundle.main.urls(forResourcesWithExtension: "jpeg", subdirectory: "Scenes")
        
        //let sceneURL = Bundle.main.urls(forResourcesWithExtension: "jpeg", subdirectory: "Scenes")![1]
        //print("Scene lastPathComponent \(sceneURL.lastPathComponent)")
        
        try! FileManager.copyJPEGSubdirectoriesToDocumentDirectory(subdirectoryNames: "Scenes")
        print("FileManager.documentDirectoryURL \(FileManager.documentDirectoryURL)")
        
        //Retreive img from file directory
        print("Image retreived \(FileManager.getJPEGFromDocumentDirectory(subdirectoryName: "Scenes", imageName: "images-4"))")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

