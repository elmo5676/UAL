// ********************** FMSInitLoad *********************************
// * Copyright © 4BitCrew, LLC - All Rights Reserved
// * Created on 8/29/23, for 
// * Matthew Elmore <matt@4bitCrew.com>
// * Unauthorized copying of this file is strictly prohibited
// ********************** FMSInitLoad *********************************


import Foundation

public struct FMSInitLoad: Section {
    let departureAirport: String?
    let arrivalAirport: String?
    let airportReferencePoint: String?
    let initCruisingAlt: String?
    let staticAirTemp: String?
    let tempDev: String?
    let tropoPause: String?
    let TOC: String?
    let zeroFuelWeight: String?
    let takeOffWeight: String?
    let landingWeight: String?
    let takeOffWeightParameters: String?
    let landingWeightParameters: String?
}

