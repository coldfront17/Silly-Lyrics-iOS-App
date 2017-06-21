//
//  ViewController.swift
//  Silly Song
//
//  Created by Kris Tong on 6/21/17.
//  Copyright © 2017 Peedan Reality. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        lyricView.text! = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
    }
    
    
}

// Text field delegator
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}





// The stuff below should came from your playground,
// ie, the same stuff you did (Silly Song Prep)
let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "Bu Bu <FULL_NAME>"].joined(separator: "\n")


//I cannot figure out how to use the CharacterSet,
//so I did my own stuff
func shortNameFromName(name:String) -> String {
    var shortName = name
    shortName.remove(at: shortName.startIndex)
    return shortName.lowercased()
}


/*
 The original version of function shortName:
 
 func shortNameForName(_ name: String) -> String {
 let lowercaseName = name.lowercased()
 let vowelSet = CharacterSet(charactersIn: "aeiou")
 return vowelSet
 
 }
 
*/



func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    
    let shortName = shortNameFromName(name: fullName)
    
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName.capitalized)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return lyrics
    
}

