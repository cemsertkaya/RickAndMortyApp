import Foundation
import UIKit
import Apollo

class CharactersListViewModel
{
    var updateHandler: () -> Void = {}
    private(set) var characterViewModels = [CharacterViewModel]()
    
    func addCharacterViewModel(_ vm: CharacterViewModel) {
        self.characterViewModels.append(vm)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return self.characterViewModels.count
    }
    
    func modelAt(_ index: Int) -> CharacterViewModel {
        return self.characterViewModels[index]
    }
    
   
    
    
     func getAllCharacters(completion: @escaping () -> Void)
    {
        
        
        Network.shared.apollo.fetch(query: GetCharactersQuery()) { result in
          switch result
            {
              case .success(let graphQLResult):
                  print("Success! Result: \(graphQLResult)")
                if let newCharacters = graphQLResult.data?.characters?.results
                  {
                      for newCharacter in newCharacters
                      {
                          //Refactor !!
                          let vm = CharacterViewModel(name: (newCharacter?.name)!, location: (newCharacter?.location?.name)!, imageLink: (newCharacter?.image)!, id: (newCharacter?.id)!)
                          self.characterViewModels.append(vm)
                          
                      }
                      completion()
                     
                  }
              case .failure(let error):
                print("Failure! Error: \(error)")
                completion()
              }
        }
    }
}

