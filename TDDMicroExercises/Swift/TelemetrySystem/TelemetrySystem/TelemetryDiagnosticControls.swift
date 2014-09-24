//
//  TelemetryDiagnosticControls.swift
//  TelemetrySystem
//
//  Created by fjeblchi on 23/09/14.
//  Copyright (c) 2014 Francisco Jose Belchi Martinez. All rights reserved.
//

public enum TelemetryDiagnosticTransmisionResponse {
    case Success
    case Error(String)
}

public class TelemetryDiagnosticControls {
    
    private let diagnosticChannelConnectionString = "*111#"
    
    private let _telemetryClient : TelemetryClient
    private var _diagnosticInfo : String = ""
    
    public init() {
        _telemetryClient = TelemetryClient()
    }
    
    public func diagnosticInfo() -> String {
        return self._diagnosticInfo
    }
    
    public func setDiagnosticInfo(diagnosticInfo : String) {
        self._diagnosticInfo = diagnosticInfo
    }
    
    public func checkTransmission() -> TelemetryDiagnosticTransmisionResponse {
        self._diagnosticInfo = ""
        
        self._telemetryClient.disconnect()
        
        var retryLeft = 3
        while self._telemetryClient.onlineStatus() == false && retryLeft > 0 {
            self._telemetryClient.connect(diagnosticChannelConnectionString)
            retryLeft--
        }
        
        if(self._telemetryClient.onlineStatus() == false) {
            return .Error("Unable to connect.")
        }
        
        self._telemetryClient.send(TelemetryClient.diagnosticMessage)
        self._diagnosticInfo = self._telemetryClient.receive()
        
        return .Success
    }
   
}
