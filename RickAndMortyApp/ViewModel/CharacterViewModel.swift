//
//  CharacterViewModel.swift
//  RickAndMortyApp
//
//  Created by Cem Sertkaya on 24.06.2022.
//

import Foundation

struct CharacterViewModel
{
    var name : String
    var location : String
    var imageLink : String
    var id : String
    
    init(name : String, location : String , imageLink : String, id : String)
    {
        self.name = name
        self.location = location
        self.imageLink = imageLink
        self.id = id
    }
    
    
}

