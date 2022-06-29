//
//  LogoutApi.swift
//  SampleLoginValidation
//
//  Created by Bhumika Patel on 29/06/22.
//

import Foundation

final class SessionManager: ObservableObject{
    enum CurrentState{
        case logout
    }
    
    @Published private(set) var currentState: CurrentState?
    
    func LogOut(){
        currentState = .logout  
    }
}
