// ********************** FuelPlanning *********************************
// * Copyright © 4BitCrew, LLC - All Rights Reserved
// * Created on 8/29/23, for 
// * Matthew Elmore <matt@4bitCrew.com>
// * Unauthorized copying of this file is strictly prohibited
// ********************** FuelPlanning *********************************


import Foundation

public struct FuelPlanning: Section {
    let minFuelReserve: String?
    let reserveFuelRequirement: String?
    let alternateMostFuelCritical: String?
    let alternateLeastFuelCritical: String?
    let add: String?
    let contingencyFuel: String?
    let unusableFuel: String?
    let minimumTakeOffFuel: String?
    let extraFuel: String?
    let acf: String?
    let plannedTakeOffFuel: String?
    let taxi: String?
    let plannedGate: String?
    let remf: String?
}

