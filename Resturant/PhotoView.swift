//
//  PhotoView.swift
//  Restaurant
//
//  Created by Admin on 8/22/23.
//

import SwiftUI

struct PhotoView: View {
    
    @Binding var imageName : String
    @Binding var sheetVisible : Bool
    
    var body: some View {
        
        ZStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            .padding()
            
            VStack {
                HStack {
                    Spacer()
                    Button{
                        sheetVisible = false
                    }label: {
                        Image(systemName: "x.circle")
                            .foregroundColor(.black)
                            .scaleEffect(2)
                }
                    .padding()
                }
                Spacer()
            }
        }
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView(imageName: Binding.constant("gallery1"), sheetVisible: Binding.constant(true))
    }
}
