// ********************** Routing *********************************
// * Copyright © 4BitCrew, LLC - All Rights Reserved
// * Created on 8/29/23, for 
// * Matthew Elmore <matt@4bitCrew.com>
// * Unauthorized copying of this file is strictly prohibited
// ********************** Routing *********************************


import Foundation

public struct Routing: Section {
    let routingParams: String?
    let distance: String?
    let averageWindComponent: String?
    let performanceFactor: String?
    let feco: String?
    let costIndex: String?
    let costIndexMode: CostIndexMode?
    let flightLevel: String?
    
    public enum CostIndexMode: String {
        //The least cost profile
        case econ = "ECON"
        //The least time profile (e.g., CI 999)
        case mint = "MINT"
        //The least fuel burn profile (e.g., for max payload, normally CI 0)
        case minf = "MINF"
        //Optimized cost index considering delay costs (e.g., optimized CI to reduce block time)
        case optd = "OPTD"
        //Dispatcher manually inputted CI
        case user = "USER"
    }
}

