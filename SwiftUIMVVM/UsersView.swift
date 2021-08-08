//
//  UsersView.swift
//  SwiftUIMVVM
//
//  Created by Vinay Nation on 08/08/21.
//

import SwiftUI

struct UsersView: View {
    
    @StateObject var viewModel = UsersView.ViewModel()
    
    init(viewModel: ViewModel = .init()) {
            _viewModel = StateObject(wrappedValue: viewModel)
        }
    
    var body: some View {
        List(viewModel.users) { user in
            Text(user.name)
         }
        .onAppear(perform: viewModel.getUsers)
     }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
            let user = User(id: 0, name: "Dummy")
            let viewModel = UsersView.ViewModel()
            viewModel.users = [user]
            
            return UsersView(viewModel: viewModel)
        }
}



extension UsersView {
    
    class ViewModel: ObservableObject {
        
        @Published var users = [User]()
        let service: DataService
        
        init(dataService: DataService = AppDataService()) {
            self.service = dataService
        }
        
        
        func getUsers() {
            service.getUsers { [weak self] users in
                self?.users = users
            }
        }
    }
}


