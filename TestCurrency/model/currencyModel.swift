import Foundation

struct ExampleJson2KtSwift: Codable {

  var time       : Time?   = Time()
  var disclaimer : String? = nil
  var chartName  : String? = nil
  var bpi        : Bpi?    = Bpi()

  enum CodingKeys: String, CodingKey {

    case time       = "time"
    case disclaimer = "disclaimer"
    case chartName  = "chartName"
    case bpi        = "bpi"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    time       = try values.decodeIfPresent(Time.self   , forKey: .time       )
    disclaimer = try values.decodeIfPresent(String.self , forKey: .disclaimer )
    chartName  = try values.decodeIfPresent(String.self , forKey: .chartName  )
    bpi        = try values.decodeIfPresent(Bpi.self    , forKey: .bpi        )
 
  }

  init() {

  }

}
