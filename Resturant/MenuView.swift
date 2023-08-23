//
//  MenuView.swift
//  Restaurant
//
//  Created by Admin on 8/16/23.
//

import SwiftUI

struct MenuView: View {
    
    @State var itemsArr :[MenuItem] = [MenuItem]()
    var dataService = DataService()
    
    var body: some View {
        
        List(itemsArr){
            item in
            MenuListRow(item: item)
        }
        .listStyle(.plain)
        .onAppear{
            itemsArr = dataService.getData()
            
        }
        
    }
    
    struct MenuView_Previews: PreviewProvider {
        static var previews: some View {
            MenuView()
        }
    }
}

