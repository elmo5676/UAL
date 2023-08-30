// ********************** Released *********************************
// * Copyright © 4BitCrew, LLC - All Rights Reserved
// * Created on 8/29/23, for 
// * Matthew Elmore <matt@4bitCrew.com>
// * Unauthorized copying of this file is strictly prohibited
// ********************** Released *********************************


import Foundation

public struct Released: Section {
    //Released Destination The airport to which the flight is initially released. This is the final destination unless B044 Planned Redispatch is utilized; in which case, it will be the intermediate destination.
    let releasedDestination: String?
    //Dispatch Sector and Dispatcher's Name and Phone Number
    let dispatchSector: String?
    let dispatchersName: String?
    let dispatchersPhoneNumber: String?
    //Dispatch Release Basis Specific OpSpecs or FARs used to release flight. Options include:
    //• A012 PART 121 DOM OPS TO CERTAIN ARPTS OUTSIDE 48 CONTIG STATES
    //• A013 162NM or 100NM EXEMPTION
    //• B043 SPECIAL FUEL RESERVES IN INTERNATIONAL OPERATIONS
    //• B044 PLANNED REDISPATCH OR RERELEASE EN ROUTE
    //• B055 NORTH POLAR OPERATIONS
    //• B343 FUEL RESERVES FOR FLAG AND SUPPLEMENTAL OPERATIONS
    //• 8653 EXEMPTION TO 121.619 FOR DOM DEST ALTN AIRPORT REQUIREMENTS
    //• C067 SPECIAL AUTHS, PROVISIONS, AND LIMITS FOR CERTAIN AIRPORTS
    //• FAR121.191A1 ENRT LIMIT METHOD 1 ANTI-ICE OFF
    //• FAR121.191A1 ENRT LIMIT: METHOD 1 ENGINE ANTI-ICE ON
    //• FAR121.191A1 ENRT LIMIT: METHOD 1 ENGINE AND WING ANTI-ICE ON
    //• FAR121.191A2 ENRT LIMIT: METHOD 2 ANTI-ICE OFF
    //• FAR121.191A2 ENRT LIMIT: METHOD 2 ENGINE ANTI-ICE ON
    //• FAR121.191A2 ENRT LIMIT: METHOD 2 ENGINE AND WING ANTI-ICE ON
    //• FAR121.193 ENRT LIMIT: TWO ENG INOP ANTI-ICE OFF
    //• FAR121.193 ENRT LIMIT: TWO ENG INOP ENGINE ANTI-ICE ON
    //• FAR121.193 ENRT LIMIT: TWO ENG INOP ENG AND WING ANTI-ICE ON
    //• 121.329 SUPPLEMENTAL OXYGEN FOR SUSTENANCE
    //• 121.333 SUPPLEMENTAL OXYGEN FOR EMERGENCY DESCENT AND FIRSTAID
    //• Note: The word emergency is purposely shortened to fit the ACARS message limit.
    let dispatchReleaseBasis: String?
}

