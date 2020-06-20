//
//  ChatManager.swift
//  WeatherBot
//
//  Created by Anoop tomar on 3/2/18.
//  Copyright © 2018 Devtechie. All rights reserved.
//

import Foundation
class ChatManager {
    
    static func sayHello() -> String {
        return "Hi my name is WeatherBot. What is your name?"
    }
    
    static func getResponse(inputString: String, completion: @escaping (String) -> Void) {
        var nameEntityType = false
        
        let tagger = NSLinguisticTagger(tagSchemes: [.nameType], options: 0)
        tagger.string = inputString
        let options: NSLinguisticTagger.Options = [NSLinguisticTagger.Options.omitWhitespace, .omitPunctuation, .omitOther, .joinNames]
        let range = NSRange(inputString.startIndex..., in: inputString)
        tagger.enumerateTags(in: range, unit: NSLinguisticTaggerUnit.word, scheme: NSLinguisticTagScheme.nameType, options: options) { (tag, tokenRange, _) in
            guard let tag = tag else {return}
            
            if [NSLinguisticTag.personalName, .organizationName, .placeName].contains(tag) {
                
                nameEntityType = true
                
                let token = Range(tokenRange, in: inputString)
                
                if tag == .placeName {
                    
                    let city = String(inputString[token!])
                    WeatherManager.instance.loadWeatherFromCityWithCompletion(city: city, completion: { (weather) in
                        completion("Weather in \(city) is \(weather.text!) and \(weather.temp!) °F")
                    })
                    
                } else if tag == .personalName {
                    let name = String(inputString[token!])
                    completion("Hi \(name), ask me about weather of your city.")
                } else if tag == .organizationName {
                    let orgName = String(inputString[token!])
                    completion("Sorry I don't know much about \(orgName) but you can ask me about weather of your city.")
                }
                
            }
        }
        if nameEntityType == false {
            completion("I'm sorry, my responses are limited. You must ask the right questions.")
        }
    }
}
