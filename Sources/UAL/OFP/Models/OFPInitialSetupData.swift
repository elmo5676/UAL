// ********************** OFPInitialSetupData *********************************
// * Copyright © 4BitCrew, LLC - All Rights Reserved
// * Created on 8/30/23, for 
// * Matthew Elmore <matt@4bitCrew.com>
// * Unauthorized copying of this file is strictly prohibited
// ********************** OFPInitialSetupData *********************************


import SwiftUI

public class OFPInitialSetupData: ObservableObject {
    
    public static var shared = OFPInitialSetupData()
    
//    public init(callsign: String? = nil, dep: String? = nil, arr: String? = nil, busType: String? = nil, routeDist: String? = nil, idlePerf: String? = nil, costIndex: String? = nil, altTemp: String? = nil, trop: String? = nil, zfw: String? = nil, tow: String? = nil, towLimit: String? = nil, lw: String? = nil, flightTime: String? = nil, alternate: String? = nil, fuelAlternate: String? = nil, fuelMinTO: String? = nil, fuelPlanGate: String? = nil, fuelREMF: String? = nil, route: String? = nil) {
//        self.callsign = callsign
//        self.dep = dep
//        self.arr = arr
//        self.busType = busType
//        self.routeDist = routeDist
//        self.idlePerf = idlePerf
//        self.costIndex = costIndex
//        self.altTemp = altTemp
//        self.trop = trop
//        self.zfw = zfw
//        self.tow = tow
//        self.towLimit = towLimit
//        self.lw = lw
//        self.flightTime = flightTime
//        self.alternate = alternate
//        self.fuelAlternate = fuelAlternate
//        self.fuelMinTO = fuelMinTO
//        self.fuelPlanGate = fuelPlanGate
//        self.fuelREMF = fuelREMF
//        self.route = route
//    }
    
    
    @Published var callsign: String? = nil
    @Published var dep: String? = nil
    @Published var arr: String? = nil
    @Published var busType: String? = nil
    @Published var routeDist: String? = nil
    @Published var idlePerf: String? = nil
    @Published var costIndex: String? = nil
    @Published var altTemp: String? = nil
    @Published var trop: String? = nil
    @Published var zfw: String? = nil
    @Published var tow: String? = nil
    @Published var towLimit: String? = nil
    @Published var lw: String? = nil
    @Published var flightTime: String? = nil
    @Published var alternate: String? = nil
    @Published var fuelAlternate: String? = nil
    @Published var fuelMinTO: String? = nil
    @Published var fuelPlanGate: String? = nil
    @Published var fuelREMF: String? = nil
    
    
    @Published var route: String?
//    let <#here#>: String?
//    let <#here#>: String?
//    let <#here#>: String?
//    let <#here#>: String?
//    let <#here#>: String?
//    let <#here#>: String?
//    let <#here#>: String?
//    let <#here#>: String?
//    let <#here#>: String?
//    let <#here#>: String?
//    let <#here#>: String?
//    let <#here#>: String?
//    let <#here#>: String?
//    let <#here#>: String?
//    let <#here#>: String?
//    let <#here#>: String?
//    let <#here#>: String?
//    let <#here#>: String?
//    let <#here#>: String?
//    let <#here#>: String?
	
}

