//
//  Sensor.swift
//  TirePressureMonitoringSystem
//
//  Created by Fran_DEV on 20/09/14.
//  Copyright (c) 2014 Francisco Jose Belchi Martinez. All rights reserved.
//

import UIKit

public class Sensor {
    
    let offset : Double = 16

    public func popNextPressurePsiValue() -> Double {
        let pressureTelemetryValue = readPressureSample()
        return offset + pressureTelemetryValue
    }
    
    private func readPressureSample() -> Double {
        // Simulate info read from a real sensor in a real tire
        return Double(6 * arc4random() * arc4random())
    }
   
}
