import Foundation
class Weather {
    var temp: String?
    var text: String?
    
    static func weatherFromJSON(weatherObject: NSDictionary) -> Weather {
        let weatherResult = ((((weatherObject["query"] as! NSDictionary)["results"] as! NSDictionary)["channel"] as! NSDictionary)["item"] as! NSDictionary)["condition"] as! NSDictionary
        let weather = Weather()
        weather.temp = (weatherResult["temp"] as? String)
        weather.text = (weatherResult["text"] as? String)
        return weather
    }
}
