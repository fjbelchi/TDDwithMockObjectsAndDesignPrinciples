//
//  Alarm.swift
//  TirePressureMonitoringSystem
//
//  Created by fjbelchi on 20/09/14.
//  Copyright (c) 2014 Francisco Jose Belchi Martinez. All rights reserved.
//

public class Alarm {
    
    private let lowPressureThreshold : Double = 17
    private let highPressureThreshold : Double = 21
    
    private let sensor = Sensor()
    
    private var alarmOn = false
    
    public func check() {
        let psiPressureValue = sensor.popNextPressurePsiValue()
        if psiPressureValue < lowPressureThreshold || highPressureThreshold < psiPressureValue {
            self.alarmOn = true
        }
    }
    
    public func isAlarmOn() -> Bool {
        return alarmOn
    }
   
}
