// ********************** OFPHandler *********************************
// * Copyright © 4BitCrew, LLC - All Rights Reserved
// * Created on 8/29/23, for 
// * Matthew Elmore <matt@4bitCrew.com>
// * Unauthorized copying of this file is strictly prohibited
// ********************** OFPHandler *********************************


import Foundation

public struct OFPHandler {
    
    let ofp: OFP?
    
    let ofpIinitialSetup: OFPInitialSetupData?
    
    public init(ofpUrl: URL? = nil) {
        var ofpContents: String?
        if let ofpUrl {
            ofpContents = OFPHandler.getOFP(fltPlan: ofpUrl)
            ofpIinitialSetup = OFPHandler.getInitialSetupData(from: ofpUrl)
        } else {
            guard let url = Bundle.module_.url(forResource: "UAL0205", withExtension: "pdf") else { ofp = nil; ofpIinitialSetup = nil; return }
//            guard let url = Bundle.module_.url(forResource: "UAL0430", withExtension: "pdf") else { ofp = nil; ofpIinitialSetup = nil; return }
//            guard let url = Bundle.module_.url(forResource: "UAL1269", withExtension: "pdf") else { ofp = nil; ofpIinitialSetup = nil; return }
            ofpContents = OFPHandler.getOFP(fltPlan: url)
            ofpIinitialSetup = OFPHandler.getInitialSetupData(from: url)
            
            
//            let testPrint = PDFHandler.getAttributedPDFContents(from: url)?.string
//            print(ofpContents ?? "")
        }
        
        guard let ofpContents else { ofp = nil; return }
        
        let Header = OFPHandler.getSection01(ofpContents)
        let GeneralFlightInfo = OFPHandler.getSection02(ofpContents)
        let Released = OFPHandler.getSection03(ofpContents)
        let MEL = OFPHandler.getSection04(ofpContents)
        let DispatcherRemarks = OFPHandler.getSection05(ofpContents)
        let SystemInfo = OFPHandler.getSection06(ofpContents)
        let Routing = OFPHandler.getSection07(ofpContents)
        let FMSInitLoad = OFPHandler.getSection08(ofpContents)
        let FuelPlanning = OFPHandler.getSection09(ofpContents)
        
        self.ofp = OFP(Header: Header,
                       GeneralFlightInfo: GeneralFlightInfo,
                       Released: Released,
                       MEL: MEL,
                       DispatcherRemarks: DispatcherRemarks,
                       SystemInfo: SystemInfo,
                       Routing: Routing,
                       FMSInitLoad: FMSInitLoad,
                       FuelPlanning: FuelPlanning)
    }
    
    
    
    
    static func getInitialSetupData(from: URL?) -> OFPInitialSetupData? {
        var result: OFPInitialSetupData?
        guard let from else { return nil }
        guard let ofpContents = OFPHandler.getOFP(fltPlan: from) else { return nil }
        let callSign = ofpContents.getFirstMatch(for: "UAL[0-9]{3,4}")?.replacingOccurrences(of: "UAL", with: "")
        let dep = ofpContents.getFirstMatch(for: "[0-9]{2}[A-Z]{3}[0-9]{2} [A-Z]{4}/[A-Z]{3}")?.components(separatedBy: " ").last?.components(separatedBy: "/").last
        let arr = ofpContents.getFirstMatch(for: "[A-Z0-9]{4} [A-Z]{4}/[A-Z]{3} ON")?.split(" ")[1].split("/").last
        let busType = ofpContents.getFirstMatch(for: "N[0-9A-Z]{3,}/[0-9]{4} [A-Z0-9]{4}")?.split(" ").last
        
        let distIdlePerf = ofpContents.getFirstMatch(for: "[0-9]{3}.{0,}IDLE/PERF.{0,}\n")?.components(separatedBy: " ")
        let routeDist = distIdlePerf?[0]
        let idlePerf = distIdlePerf?[3].components(separatedBy: "/").last
        
        let costIndex = ofpContents.getFirstMatch(for: ".{1,}OPTD")?.components(separatedBy: " ").first
        
        let altTempTropo = ofpContents.getFirstMatch(for: "F[0-9]{3}.{0,}\\([MP][0-9]{2}\\).{0,}")?.components(separatedBy: " ")
        let altTemp = altTempTropo?.first
        let trop = altTempTropo?.last
        
        let weights = ofpContents.getFirstMatch(for: "LW\n[0-9]{6}\n[0-9]{6}\n[0-9]{6}\n")?.components(separatedBy: "\n")
        let zfw = weights?[1]
        let tow = weights?[2]
        let lw = weights?[3]
        
        let weightsLimits = ofpContents.getFirstMatch(for: "([0-9]{6}[AEFLMPSUT]\n){3}")?.components(separatedBy: "\n")
        let towLimit = weightsLimits?[1]
        print(weightsLimits)
        
        
        result = OFPInitialSetupData(callsign: callSign,
                                     dep: dep,
                                     arr: arr,
                                     busType: busType,
                                     routeDist: routeDist,
                                     idlePerf: idlePerf,
                                     costIndex: costIndex,
                                     altTemp: altTemp,
                                     trop: trop,
                                     zfw: zfw,
                                     tow: tow,
                                     towLimit: towLimit,
                                     lw: lw,
                                     flightTime: nil,
                                     alternate: nil,
                                     fuelAlternate: nil,
                                     fuelMinTO: nil,
                                     fuelPlanGate: nil,
                                     fuelREMF: nil,
                                     route: nil)
        
        return result
    }
    
    
    
    
    
    
    
    static func getOFP(fltPlan: URL) -> String? {
        let OFPStr = PDFHandler.getPdfContentsAsString(from: fltPlan) ?? "NONE"
//        let OFPStr = PDFHandler.getAttributedPDFContents(from: fltPlan)?.string ?? "NONE"
        let OFPStart = "OPERATIONAL FLIGHTPLAN"
        let firstPageOfOFP = PDFHandler.getFirstPageWith(string: OFPStart, from: fltPlan)
        guard let numPagesOfOFP = OFPStr.listMatches(for: "\(OFPStart) PG 1/[0-9]")[0].last else { fatalError() }
        let numPages = Int(String(numPagesOfOFP))
        let pages = PDFHandler.getPdfPages(pdf: fltPlan, start: firstPageOfOFP, numOfPages: numPages)
        return pages
    }

    static func getSection01(_ from: String) -> Header {
        let callSign = from.getFirstMatch(for: "UAL[0-9]{4}")
        let numberOfPages = String((from.getFirstMatch(for: "OPERATIONAL FLIGHTPLAN PG 1/[0-9]{1}")?.last)!)
        let date = from.getFirstMatch(for: "PRTD [0-9A-Z]{7}")?.components(separatedBy: " ").last
        return Header(callSign: callSign, numberOfPages: numberOfPages, date: date)
    }

    static func getSection02(_ from: String) -> GeneralFlightInfo {
        let flightNumber = from.getFirstMatch(for: "UAL[0-9]{4}")
        let dateLocal = from.getFirstMatch(for: "UAL[0-9]{4}-[0-9]{1,2}")?.components(separatedBy: "-").last
        let departureDateUTC = from.getFirstMatch(for: "UAL[0-9]{4}-[0-9]{1,2} [0-9]{2}[A-Z]{3}[0-9]{2}")?.components(separatedBy: " ").last
        let departureAirport = from.getFirstMatch(for: "[0-9]{2}[A-Z]{3}[0-9]{2} [A-Z]{4}/[A-Z]{3}")?.components(separatedBy: " ").last?.components(separatedBy: "/")
        let departureAirportIdICAO = departureAirport?.first
        let departureAirportIdIATA = departureAirport?.last
        
        let depTime = from.getFirstMatch(for: "OUT .{0,} OFF")?.components(separatedBy: " ")[1].components(separatedBy: "/")
        let scheduledTimeOfDepartureUTC = depTime?.first
        let scheduledTimeOfDepartureLocal = depTime?.last
        
        let scheduledTakeOffTime = from.getFirstMatch(for: "OFF [0-9]{4}Z/[0-9]{4}L")?.components(separatedBy: " ").last?.components(separatedBy: "/")
        let scheduledTakeOffTimeUTC = scheduledTakeOffTime?.first
        let scheduledTakeOffTimeLocal = scheduledTakeOffTime?.last
        
        let acId = from.getFirstMatch(for: "N[0-9A-Z]{3,}/[0-9]{4}")?.components(separatedBy: "/")
        let aircraftRegistrationID = acId?.first
        let noseNumber = acId?.last
        
        let aircraftModel = from.getFirstMatch(for: "N[0-9A-Z]{3,}/[0-9]{4} [A-Z0-9]{4}")?.split(" ").last
        
        let arrivalAirport = from.getFirstMatch(for: "[A-Z0-9]{4} [A-Z]{4}/[A-Z]{3} ON")?.split(" ")[1].split("/")
        let arrivalAirportIdICAO = arrivalAirport?.first
        let arrivalAirportIdIATA = arrivalAirport?.last
        
        let scheduledLandingTime = from.getFirstMatch(for: "ON [0-9]{4}Z/[0-9]{4}L")?.split(" ").last?.split("/")
        let scheduledLandingTimeUTC = scheduledLandingTime?.first
        let scheduledLandingTimeLocal = scheduledLandingTime?.last
        
        let scheduledArrivalTime = from.getFirstMatch(for: "IN [0-9]{4}Z/[0-9]{4}L")?.split(" ").last?.split("/")
        let scheduledArrivalTimeUTC = scheduledArrivalTime?.first
        let scheduledArrivalTimeLocal = scheduledArrivalTime?.last
        
        let upperAirProgValidTime = from.getFirstMatch(for: "[0-9]{6} [0-9]{6}")?.split(" ")
        let upperAirProgValidStartTime = upperAirProgValidTime?.first
        let upperAirProgValidEndTime = upperAirProgValidTime?.last
        
        let plannedTimes = from.getFirstMatch(for: "[0-9]{2}:[0-9]{2}/[0-9]{2}:[0-9]{2}[E,L]")?.split("/")
        let plannedTimeEnroute = plannedTimes?.first
        let calulatedOnTimeStatus = plannedTimes?.last
        let variantNumber = from.getFirstMatch(for: "VRNT [0-9]{1,2}")?.split(" ").last
        let routingNumber = from.getFirstMatch(for: "RTG .{3,6} RLSE")?.split(" ")[1]
        let releaseNumber = from.getFirstMatch(for: "RLSE [0-9]{1,2}")?.split(" ").last
        
        return GeneralFlightInfo(flightNumber: flightNumber, dateLocal: dateLocal, departureDateUTC: departureDateUTC, departureAirportIdICAO: departureAirportIdICAO, departureAirportIdIATA: departureAirportIdIATA, scheduledTimeOfDepartureUTC: scheduledTimeOfDepartureUTC, scheduledTimeOfDepartureLocal: scheduledTimeOfDepartureLocal, scheduledTakeOffTimeUTC: scheduledTakeOffTimeUTC, scheduledTakeOffTimeLocal: scheduledTakeOffTimeLocal, aircraftRegistrationID: aircraftRegistrationID, noseNumber: noseNumber, aircraftModel: aircraftModel, arrivalAirportIdICAO: arrivalAirportIdICAO, arrivalAirportIdIATA: arrivalAirportIdIATA, scheduledLandingTimeUTC: scheduledLandingTimeUTC, scheduledLandingTimeLocal: scheduledLandingTimeLocal, scheduledArrivalTimeUTC: scheduledArrivalTimeUTC, scheduledArrivalTimeLocal: scheduledArrivalTimeLocal, upperAirProgValidStartTime: upperAirProgValidStartTime, upperAirProgValidEndTime: upperAirProgValidEndTime, plannedTimeEnroute: plannedTimeEnroute, calulatedOnTimeStatus: calulatedOnTimeStatus, variantNumber: variantNumber, routingNumber: routingNumber, releaseNumber: releaseNumber)
    }

    static func getSection03(_ from: String) -> Released {
        let releasedDestination = ""
        let dispatchSector = ""
        let dispatchersName = ""
        let dispatchersPhoneNumber = ""
        let dispatchReleaseBasis = ""
        
        return Released(releasedDestination: "",
                         dispatchSector: "",
                         dispatchersName: "",
                         dispatchersPhoneNumber: "",
                         dispatchReleaseBasis: "")
    }

    static func getSection04(_ from: String) -> MEL {
        return MEL(melItemInfo: "")
    }

    static func getSection05(_ from: String) -> DispatcherRemarks {
        return DispatcherRemarks(dispatcherRemarks: "")
    }

    static func getSection06(_ from: String) -> SystemInfo {
        return SystemInfo(systemInfo: "")
    }

    static func getSection07(_ from: String) -> Routing {
        let routingParams = ""
        let distance = from.getFirstMatch(for: "DIST [0-9]{0,}")?.split(" ").last
        let averageWindComponent = from.getFirstMatch(for: "WC [TH][0-9]{0,3}")?.split(" ").last
        let performanceFactor = from.getFirstMatch(for: "PERF .{0,} FECO")?.split(" ")[1]
        let feco = from.getFirstMatch(for: "FECO.{0,}CI")?.replacingOccurrences(of: "FECO ", with: "").replacingOccurrences(of: " CI", with: "")
        let costIndex = from.getFirstMatch(for: "CI [0-9]{0,3}")?.split(" ").last
        let ciModeStr = from.getFirstMatch(for: "CI [0-9]{0,3} [A-Z]{4}")?.split(" ").last ?? ""
        let costIndexMode = Routing.CostIndexMode.init(rawValue: ciModeStr)
        let flightLevel = from.getFirstMatch(for: "\(ciModeStr) F[0-9]{3}")?.split(" ").last
        
        
        return Routing(routingParams: routingParams,
                         distance: distance,
                         averageWindComponent: averageWindComponent,
                         performanceFactor: performanceFactor,
                         feco: feco,
                         costIndex: costIndex,
                         costIndexMode: costIndexMode,
                         flightLevel: flightLevel)
    }

    static func getSection08(_ from: String) -> FMSInitLoad {
        return FMSInitLoad(departureAirport: "",
                         arrivalAirport: "",
                         airportReferencePoint: "",
                         initCruisingAlt: "",
                         staticAirTemp: "",
                         tempDev: "",
                         tropoPause: "",
                         TOC: "",
                         zeroFuelWeight: "",
                         takeOffWeight: "",
                         landingWeight: "",
                         takeOffWeightParameters: "",
                         landingWeightParameters: "")
    }

    static func getSection09(_ from: String) -> FuelPlanning {
        return FuelPlanning(minFuelReserve: "",
                         reserveFuelRequirement: "",
                         alternateMostFuelCritical: "",
                         alternateLeastFuelCritical: "",
                         add: "",
                         contingencyFuel: "",
                         unusableFuel: "",
                         minimumTakeOffFuel: "",
                         extraFuel: "",
                         acf: "",
                         plannedTakeOffFuel: "",
                         taxi: "",
                         plannedGate: "",
                         remf: "")
    }
	
}

