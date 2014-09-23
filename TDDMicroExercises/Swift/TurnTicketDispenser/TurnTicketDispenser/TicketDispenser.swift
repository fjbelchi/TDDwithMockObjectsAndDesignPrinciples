//
//  TurnTicketDispenser.swift
//  TurnTicketDispenser
//
//  Created by fjbelchi on 20/09/14.
//  Copyright (c) 2014 Francisco Jose Belchi Martinez. All rights reserved.
//

public class TicketDispenser {
   
    public func getTurnTicket() -> TurnTicket {
        let newTurnNumber = TurnNumberSequence.getNextTurnNumber()
        return TurnTicket(turnNumber: newTurnNumber)
    }
}
