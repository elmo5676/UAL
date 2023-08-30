// ********************** MEL *********************************
// * Copyright © 4BitCrew, LLC - All Rights Reserved
// * Created on 8/29/23, for 
// * Matthew Elmore <matt@4bitCrew.com>
// * Unauthorized copying of this file is strictly prohibited
// ********************** MEL *********************************


import Foundation

public struct MEL: Section {
    //MEL ITEM INFO - In addition to MEL items, this block may also contain information about Company placards that impose flight planning restrictions (e.g. performance penalties for permanently installed equipmen that cannot be programmed into SABRE) that are not MELs and are not displayed on the DIL or Log History. Dashes(--) indicate no dispatch item restrictions were considered.
    let melItemInfo: String?
}

