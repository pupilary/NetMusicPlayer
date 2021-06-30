//
//  HomeView.swift
//  NetMusicPlayer
//
//  Created by TAKESI NANASE on 2021/6/29.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var bannerStore: BannerStore = BannerStore()
    
    @State private var selection = 1
    @State private var columns = Array(repeating: GridItem(.flexible(), spacing: 15.0), count: 2)
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                HStack {
                    SearchView()
                }
               // .padding(.horizontal)
                // Carousel List...
                TabView(selection: $selection) {
                    ForEach(bannerStore.banners.indices, id: \.self) { index in
                        Image(bannerStore.banners[index].url)
                            .resizable()
                            .frame(height: self.selection == index ? 230.0 : 180.0)
                            .cornerRadius(15.0)
                            .padding(.horizontal)
                            // for identifying current index...
                            .tag(index)
                    }
                }
                .frame(height: 230.0)
                .padding(.top, 25.0)
                .tabViewStyle(PageTabViewStyle())
                .animation(.easeOut)
                // 推荐歌单
                HStack {
                    Text("推荐歌单")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer(minLength: 0)
                    Button(action: {
                        
                    }) {
                        Text("更多")
                    }
                }
                .padding([.top, .horizontal])
                .foregroundColor(.black)
                // adding custom Grid...
                HStack {
                    Text("Popular")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        // reducing to row...
                        withAnimation(.easeOut) {
                            if self.columns.count == 2 {
                                self.columns.removeLast()
                            } else {
                                self.columns.append(GridItem(.flexible(), spacing: 15.0))
                            }
                        }
                    }) {
                        Image(systemName: self.columns.count == 2 ? "rectangle.grid.1x2" : "square.grid.2x2")
                            .font(.system(size: 24.0))
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 25.0)
                LazyVGrid(columns: columns, spacing: 25.0) {
                    ForEach(1...10, id: \.self) { index in
                        // GridView...
                        GridView(index: index, columns: $columns)
                    }
                }
                .padding([.horizontal, .top])
                
            }
            .padding(.vertical)
        }
        .background(
            Color.black.opacity(0.06)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct SearchView: View {
    
    @State private var keyword: String = ""
    
    var body: some View {
        TextField("Search", text: $keyword)
            .padding(.vertical, 10.0)
            .padding(.horizontal)
            .background(Color.black.opacity(0.07))
            .cornerRadius(10.0)
            .padding(.horizontal)
    }
}

struct CourseCardView: View {
    var body: some View {
        Text("")
    }
}

private struct GridView: View {
    
    var index: Int
    @Binding var columns: [GridItem]
    @Namespace var namespacing
    
    var body: some View {
        VStack {
            if columns.count == 2 {
                VStack(spacing: 15.0) {
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                        Image("Images/2022-bmw-m5-cs-\(index)")
                            .resizable()
                            .frame(height: 250.0)
                            .cornerRadius(15.0)
                        Button(action: {
                            
                        }) {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                                .padding(.all, 10.0)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                    }
                    .matchedGeometryEffect(id: "image", in: namespacing)
                    Text("Music\(index)")
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .matchedGeometryEffect(id: "title", in: namespacing)
                    Button(action: {
                        
                    }) {
                        Text("Buy Now")
                            .foregroundColor(.white)
                            .padding(.vertical, 10.0)
                            .padding(.horizontal, 25.0)
                            .background(Color.red)
                            .cornerRadius(10.0)
                    }
                    .matchedGeometryEffect(id: "buy", in: namespacing)
                }
            }
            else {
                // Row View...
                // add animation...
                HStack(spacing: 15.0) {
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                        Image("Images/album")
                            .resizable()
                            .frame(width: (UIScreen.main.bounds.width - 45.0) / 2, height: 250.0)
                            .cornerRadius(15.0)
                        Button(action: {
                            
                        }) {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                                .padding(.all, 10.0)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                    }
                    .matchedGeometryEffect(id: "image", in: namespacing)
                    VStack(alignment: .leading, spacing: 10.0) {
                        Text("Music\(index)")
                            .fontWeight(.bold)
                            .matchedGeometryEffect(id: "title", in: namespacing)
                        // Rating Bar...
                        HStack(spacing: 10.0) {
                            ForEach(1...5, id: \.self) { rating in
                                Image(systemName: "star.fill")
                                    .foregroundColor(index >= rating ? .yellow : .gray)
                            }
                            Spacer(minLength: 0)
                        }
                        Button(action: {
                            
                        }) {
                            Text("Buy Now")
                                .foregroundColor(.white)
                                .padding(.vertical, 10.0)
                                .padding(.horizontal, 25.0)
                                .background(Color.red)
                                .cornerRadius(10.0)
                        }
                        .padding(.top, 10.0)
                        .matchedGeometryEffect(id: "buy", in: namespacing)
                    }
                }
                .padding(.trailing)
                .background(Color.white)
                .cornerRadius(15.0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
