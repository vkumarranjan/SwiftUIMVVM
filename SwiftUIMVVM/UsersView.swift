//
//  UsersView.swift
//  SwiftUIMVVM
//
//  Created by Vinay Nation on 08/08/21.
//

import SwiftUI

struct UsersView: View {
    
    @StateObject var viewModel = UsersView.ViewModel()
    
    var body: some View {
        List(viewModel.users) { user in
            Text(user.name)
         }
        .onAppear(perform: viewModel.gerusers)
     }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}



extension UsersView {
    
    class ViewModel: ObservableObject {
        @Published var users = [User]()
        
        let service = AppDataService()
        
        func gerusers() {
            service.getUsers { [weak self] users in
                self?.users = users
            }
        }
    }
}


class AppDataService {
    
    func getUsers(completion: @escaping ([User]) -> Void) {
        
        completion([
            User(id: 1, name: "Vinay"),
            User(id: 2, name: "Radha"),
            User(id: 3, name: "Dimpi")
        ])
        
    }
}
