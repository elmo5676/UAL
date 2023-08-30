// ********************** DIFRIPSItem *********************************
// * Copyright © 4BitCrew, LLC - All Rights Reserved
// * Created on 8/29/23, for 
// * Matthew Elmore <matt@4bitCrew.com>
// * Unauthorized copying of this file is strictly prohibited
// ********************** DIFRIPSItem *********************************


import Foundation

public struct DIFRIPSItem: Identifiable, Hashable {
    public let id = UUID()
    public let key: String
    public let value: String
}
