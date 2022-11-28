//  Models.swift
//  Challenge5 Handle JSON with Good UI
//  Created by Ahmed Shaban on 20/08/2022.

// This is first real commit try using git in sourceTree, auth by classic personal access token that has full credentials, the token is used instead of password to auth. over https
import Foundation

struct Result: Codable {
    let data: [Person]
}

struct Person: Codable {
    let firstName: String
    let lastName: String
    let gender: String
    let age: String
    let address: Address
    let phoneNumbers: [PhoneNumber]
}
struct Address: Codable {
    let streetAddress: String
    let city: String
    let state: String
    let postalCode: String
}
struct PhoneNumber: Codable {
    let type: String
    let number: String
}
