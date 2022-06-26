import Foundation
import UIKit
import Apollo

class CharactersListViewModel
{
    var characterFilterType : CharacterFilterType = .none
    var page : Int = 1
    var updateHandler: () -> Void = {}
    
    private(set) var characterViewModels = [CharacterViewModel]()
    
    func addCharacterViewModel(_ vm: CharacterViewModel) {self.characterViewModels.append(vm)}
    
    func numberOfRows(_ section: Int) -> Int {return self.characterViewModels.count}
    
    func modelAt(_ index: Int, tableView : UITableView) -> CharacterViewModel {
        if index > self.characterViewModels.count - 5
        {
            self.page += 1
            getInitialCharacters() {print("refresh"); tableView.reloadData()}
        }
        return self.characterViewModels[index]
        
    }
    
    func getInitialCharacters(completion: @escaping () -> Void)
    {
        Network.shared.apollo.fetch(query: createQuery()) { result in
          switch result
          {
              case .success(let graphQLResult):
                  print("Success! Result: \(graphQLResult)")
                if let newCharacters = graphQLResult.data?.characters?.results
                  {
                      for newCharacter in newCharacters
                      {
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
    
    
    func createQuery() -> GetCharactersQuery
    {
        let query = GetCharactersQuery()
        query.page = page
        query.name = characterFilterType.rawValue
        return query
    }
    
    func reset(tableView : UITableView)
    {
        characterViewModels.removeAll()
        page = 1
        getInitialCharacters {tableView.reloadData()}
        
    }
    
    
}

