//
//  GalleryView.swift
//  Restaurant
//
//  Created by Chris Ching on 2023-04-11.
//

import SwiftUI

struct GalleryView: View {
    
    @State var imageName : String = ""
    @State var isVisible = false
    @State var photoData = [String]()
    var dataService = DataService()
    
    var body: some View {
        
        VStack (alignment: .leading) {
            Text("Gallery")
                .font(.largeTitle)
                .bold()
            
            GeometryReader { proxy in
                ScrollView (showsIndicators: false) {
                    LazyVGrid(columns: [GridItem(spacing: 10),
                                        GridItem(spacing: 10),
                                        GridItem(spacing: 10)],
                              spacing: 10) {
                        ForEach(photoData, id: \.self) { p in
                            
                            Image(p)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: (proxy.size.width-20)/3)
                                .clipped()
                                .onTapGesture {
                                    imageName = p
                                    print(imageName)
                                    isVisible = true
                                }
                        }
                    }
                }
            }
            
           
        }
        .padding(.horizontal)
        .onAppear {
            photoData = dataService.getPhotos()
        }
        .sheet(isPresented: $isVisible){
            PhotoView(imageName: $imageName, sheetVisible: $isVisible)
        }
        
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
