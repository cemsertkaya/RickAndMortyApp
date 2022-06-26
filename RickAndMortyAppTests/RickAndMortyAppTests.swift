//
//  RickAndMortyAppTests.swift
//  RickAndMortyAppTests
//
//  Created by Cem Sertkaya on 23.06.2022.
//

import XCTest
@testable import RickAndMortyApp
@testable import Apollo

class RickAndMortyAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    

    func testFetchCharacter() throws
    {
        
        let query = GetCharactersQuery()
        query.page = 0
        query.name = .none
        
        Network.shared.apollo.fetch(query: query) { result in
          switch result
          {
              case .success(let graphQLResult):
                  print("Success! Result: \(graphQLResult)")
                  if let newCharacters = graphQLResult.data?.characters?.results
                  {
                      var list = [CharacterViewModel]()
                      for newCharacter in newCharacters
                      {
                          let vm = CharacterViewModel(name: (newCharacter?.name)!, location: (newCharacter?.location?.name)!, imageLink: (newCharacter?.image)!, id: (newCharacter?.id)!)
                          list.append(vm)
                      }
                      XCTAssertEqual(list.count, 20)
                  }
              case .failure(let error):
                print("Failure! Error: \(error)")
                
            }
        }
    }
    
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
