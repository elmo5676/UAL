// ********************** GeneralFlightInfo *********************************
// * Copyright © 4BitCrew, LLC - All Rights Reserved
// * Created on 8/29/23, for 
// * Matthew Elmore <matt@4bitCrew.com>
// * Unauthorized copying of this file is strictly prohibited
// ********************** GeneralFlightInfo *********************************


import Foundation

public struct GeneralFlightInfo: Section {
    //Flight Number and Date (Local)
    let flightNumber: String?
    let dateLocal: String?
    //Departure Date (UTC) Scheduled departure date.
    let departureDateUTC: String?
    //Departure Airport Identification (ICAO/IATA)
    let departureAirportIdICAO: String?
    let departureAirportIdIATA: String?
    //Scheduled Time of Departure (UTC/Local)
    let scheduledTimeOfDepartureUTC: String?
    let scheduledTimeOfDepartureLocal: String?
    //Scheduled Takeoff Time (UTC/Local)
    let scheduledTakeOffTimeUTC: String?
    let scheduledTakeOffTimeLocal: String?
    //UA Aircraft Identification Registration Number/Nose Number
    let aircraftRegistrationID: String?
    let noseNumber: String?
    //ATC Aircraft Identification ATC identification of model
    let aircraftModel: String?
    //Arrival Airport Identification (ICAO/IATA)
    let arrivalAirportIdICAO: String?
    let arrivalAirportIdIATA: String?
    //Scheduled Landing Time (UTC/Local)
    let scheduledLandingTimeUTC: String?
    let scheduledLandingTimeLocal: String?
    //Scheduled Time of Arrival (UTC/Local)
    let scheduledArrivalTimeUTC: String?
    let scheduledArrivalTimeLocal: String?
    //Upper Air Prog Valid Time Range Identifies valid time range for winds used in forecast. Format is DDHHMM.
    let upperAirProgValidStartTime: String?
    let upperAirProgValidEndTime: String?
    //Planned Time Enroute / Calculated On-time Status Derived from calculated Time of Arrival versus Scheduled Time of Arrival.
    let plannedTimeEnroute: String?
    let calulatedOnTimeStatus: String?
    //Variant Number Several variants may be calculated for a flight to identify the optimum solution.
    let variantNumber: String?
    //Routing Number Corresponding Company route identification number:
    //• 101-199 = FAA ATC preferred route
    //• 200-299 = UAL Cost Optimized NRP route
    //• 500-599 = ATC SWAP route
    //• $XX = Coded Departure Routes (normally not filed)
    //• Z1-Z99 = Dispatcher-created routing
    let routingNumber: String?
    //Release Number
    let releaseNumber: String?
}

