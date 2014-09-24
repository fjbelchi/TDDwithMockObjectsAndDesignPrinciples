//
//  TelemetryClient.swift
//  TelemetrySystem
//
//  Created by fjbelchi on 23/09/14.
//  Copyright (c) 2014 Francisco Jose Belchi Martinez. All rights reserved.
//

public enum TelemetryClientResponse {
    case Success
    case Error(String)
}

public class TelemetryClient {
   
    /**
     * The comunication with the server is simulated in this implementation.
     * Because the focus of the excercise is on the other class
     */
    
    class var diagnosticMessage: String {
        return "AT#UD"
    }
    
    private var _onlineStatus : Bool = false
    private var _diagnosticMessageJustSent : Bool = false
    
    public func onlineStatus() -> Bool {
        return self._onlineStatus
    }
    
    public func connect(telemetryServerConnectionString : String) {
        
        let success : Bool = (arc4random_uniform(10) <= 2)
        self._onlineStatus = success
    }
    
    public func disconnect() {
        self._onlineStatus = false
    }
    
    public func send(message : String) -> TelemetryClientResponse {
        if(message.isEmpty) {
            return .Error("IllegalArgument");
        }
        
        // The simulation of Send() actually just remember if the last message sent was a diagnostic message.
        // This information will be used to simulate the Receive(). Indeed there is no real server listening.
        if (message == TelemetryClient.diagnosticMessage) {
            self._diagnosticMessageJustSent = true;
        } else {
            self._diagnosticMessageJustSent = false;
        }
        
        return .Success
    }
    
    public func receive() -> String {
      
        var message : String = ""
        
        if (self._diagnosticMessageJustSent) {
            // Simulate the reception of the diagnostic message
            message = "LAST TX rate................ 100 MBPS\r\n"
                + "HIGHEST TX rate............. 100 MBPS\r\n"
                + "LAST RX rate................ 100 MBPS\r\n"
                + "HIGHEST RX rate............. 100 MBPS\r\n"
                + "BIT RATE.................... 100000000\r\n"
                + "WORD LEN.................... 16\r\n"
                + "WORD/FRAME.................. 511\r\n"
                + "BITS/FRAME.................. 8192\r\n"
                + "MODULATION TYPE............. PCM/FM\r\n"
                + "TX Digital Los.............. 0.75\r\n"
                + "RX Digital Los.............. 0.10\r\n"
                + "BEP Test.................... -5\r\n"
                + "Local Rtrn Count............ 00\r\n"
                + "Remote Rtrn Count........... 00";
            
            self._diagnosticMessageJustSent = false;
            
        } else {
            // Simulate the reception of a response message returning a random message.
            var message = "";
            let messageLength = arc4random_uniform(50) + 60;
            for var i = messageLength; i > 0; --i {
                message += String(arc4random_uniform(40) + 86);
            }
        }
        
        return message
    }
    
}
