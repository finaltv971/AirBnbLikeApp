//
//  RechercheFiltre.swift
//  AirBnb
//
//  Created by Anthony Baucal on 27/09/2024.
//

import Foundation

@propertyWrapper
struct NbInvite{
    private var invite = 0
    var wrappedValue: Int{
        get { return invite }
        set { invite = max(newValue, 0) }
    }
}

@propertyWrapper
struct DatesSejour{
    private var sejour: DateInterval
    var wrappedValue: DateInterval{
        get { return sejour }
        set {
                let newEndDate = max(newValue.end, sejour.start)
                sejour = DateInterval(start: sejour.start, end: newEndDate)
            }
    }
    init(wrappedValue: DateInterval) {
        self.sejour = wrappedValue
    }
}
@propertyWrapper
struct Destination{
    private var destination: String
    var wrappedValue: String{
        get { return destination }
        set {
            destination = newValue.trimmingCharacters(in: .whitespaces)
        }
    }
    init(wrappedValue: String) {
        self.destination = wrappedValue
    }
}

struct RechercheFiltre {
    @Destination var destination: String
    @DatesSejour var dateSejour: DateInterval
    @NbInvite var invite : Int
    
    mutating func moins(){
        self.invite = self.invite-1
    }
    mutating func plus(){
        self.invite = self.invite + 1
    }
    mutating func reset(){
        print("reset")
        self.destination = ""
        self.invite = 0
        self.dateSejour = DateInterval(start: Date(), duration: 86400)
    }
}
