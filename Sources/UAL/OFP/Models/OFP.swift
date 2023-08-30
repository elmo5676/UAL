// ********************** OFP *********************************
// * Copyright © 4BitCrew, LLC - All Rights Reserved
// * Created on 8/29/23, for 
// * Matthew Elmore <matt@4bitCrew.com>
// * Unauthorized copying of this file is strictly prohibited
// ********************** OFP *********************************


import Foundation

protocol Section {}

public struct OFP {
    let Header: Header?
    let GeneralFlightInfo: GeneralFlightInfo?
    let Released: Released?
    let MEL: MEL?
    let DispatcherRemarks: DispatcherRemarks?
    let SystemInfo: SystemInfo?
    let Routing: Routing?
    let FMSInitLoad: FMSInitLoad?
    let FuelPlanning: FuelPlanning?
    
    public init(Header: Header? = nil,
                GeneralFlightInfo: GeneralFlightInfo? = nil,
                Released: Released? = nil,
                MEL: MEL? = nil,
                DispatcherRemarks: DispatcherRemarks? = nil,
                SystemInfo: SystemInfo? = nil,
                Routing: Routing? = nil,
                FMSInitLoad: FMSInitLoad? = nil,
                FuelPlanning: FuelPlanning? = nil) {
        
        self.Header = Header
        self.GeneralFlightInfo = GeneralFlightInfo
        self.Released = Released
        self.MEL = MEL
        self.DispatcherRemarks = DispatcherRemarks
        self.SystemInfo = SystemInfo
        self.Routing = Routing
        self.FMSInitLoad = FMSInitLoad
        self.FuelPlanning = FuelPlanning
    }
}
