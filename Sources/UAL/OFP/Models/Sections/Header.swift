// ********************** Header *********************************
// * Copyright © 4BitCrew, LLC - All Rights Reserved
// * Created on 8/29/23, for 
// * Matthew Elmore <matt@4bitCrew.com>
// * Unauthorized copying of this file is strictly prohibited
// ********************** Header *********************************


import Foundation

public struct Header: Section {
    //Page Header ATC call sign.
    let callSign: String?
    //Page Number Title and page number/total number of pages.
    let numberOfPages: String?
    //Print Record Date and UTC. All pages have the same print time to help identify pages that belong together.
    let date: String?
}

