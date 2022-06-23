//
//  Network.swift
//  RickAndMortyApp
//
//  Created by Cem Sertkaya on 23.06.2022.
//



import Foundation
import Apollo

class Network
{
  static let shared = Network()

  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
}
