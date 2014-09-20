//
//  TurnNumberSequence.swift
//  TurnTicketDispenser
//
//  Created by fjbelchi on 20/09/14.
//  Copyright (c) 2014 Francisco Jose Belchi Martinez. All rights reserved.
//

public class TurnNumberSequence {
   
    private struct Static {
        static var turnNumber = 0
    }
    
    public class func getNextTurnNumber() -> Int {
        return Static.turnNumber++
    }
    
}
