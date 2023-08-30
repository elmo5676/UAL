// ********************** OFPView *********************************
// * Copyright © 4BitCrew, LLC - All Rights Reserved
// * Created on 8/29/23, for 
// * Matthew Elmore <matt@4bitCrew.com>
// * Unauthorized copying of this file is strictly prohibited
// ********************** OFPView *********************************


import SwiftUI
import UIKit

public struct OFPView: View {
    
    let isd: OFPInitialSetupData?
    
    public init() {
        let ofpHandler = OFPHandler()
        isd = ofpHandler.ofpIinitialSetup
    }
    
    func ofpValue(_ title: String, _ value: String?) -> some View {
        HStack {
            Text(title)
            Spacer()
            Text(value ?? "UNK")
        }.padding(.horizontal)
    }
    
    @State var filePickerIsPresented = false
    
    public var body: some View {
        VStack {
            Group {
                ofpValue("Call Sign", isd?.callsign)
                ofpValue("DEP/ARR", "\(isd?.dep ?? "")/\(isd?.arr ?? "")")
                ofpValue("AC Type", isd?.busType)
                ofpValue("FP Dist", isd?.routeDist)
                ofpValue("Idle/Perf", isd?.idlePerf)
                ofpValue("CI", isd?.costIndex)
                ofpValue("ALT / TEMP", isd?.altTemp)
                ofpValue("TROP", isd?.trop)
                ofpValue("ZFW", isd?.zfw)
                ofpValue("TOW", isd?.tow)
            }
            Group {
                ofpValue("TOW L", isd?.towLimit)
                ofpValue("LW", isd?.lw)
                ofpValue("Flight Time", isd?.flightTime)
                ofpValue("Alternate", isd?.alternate)
                ofpValue("Alt Fuel", isd?.fuelAlternate)
                ofpValue("Min TO", isd?.fuelMinTO)
                ofpValue("Plan Gate", isd?.fuelPlanGate)
                ofpValue("REMF", isd?.fuelREMF)
            }
        }.fileImporter(isPresented: $filePickerIsPresented,
                       allowedContentTypes: [.pdf, .text]) { result in
            switch result {
            case .success(let fileUrl):
                print(fileUrl)
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
}

struct OFPView_Previews: PreviewProvider {
    static var previews: some View {
        OFPView()
    }
}

