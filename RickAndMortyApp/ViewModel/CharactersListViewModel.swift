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
        let query = selectQuery()
        query.page = page
        Network.shared.apollo.fetch(query: query ) { result in
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
    
    
    func selectQuery() -> GetCharactersQuery
    {
        if characterFilterType == .none
        {
            return GetCharactersQuery()
        }
        else if characterFilterType == .morty
        {
            return GetCharactersQuery()
        }
        else
        {
            return GetCharactersQuery()
        }
    }
    
    
}

