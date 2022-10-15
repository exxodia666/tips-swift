//
//  AsyncImageView.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 14.10.2022.
//

import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    @State private var image: UIImage = UIImage()
    //    @State private var isLoading: Bool = true
    
    init(withURL url: String) {
        //        if url.isEmpty {
        //            print("URL")
        //            print(url)
        //            isLoading = false
        //        }
        self.imageLoader = ImageLoader(urlString: url)
    }
    
    var body: some View {
        VStack {
            //            if(isLoading) {
            //                ProgressView()
            //            }
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 24)
                .onReceive(imageLoader.didChange) { data in
                    self.image = UIImage(data: data) ?? UIImage()
                    //                    self.isLoading = false
                }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(withURL: "https://sportshub.cbsistatic.com/i/2022/09/19/11772ac0-4dd4-467e-b531-09170c7a9bc4/chainsaw-man-anime.png")
    }
}
