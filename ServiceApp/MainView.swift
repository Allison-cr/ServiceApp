//
//  ContentView.swift
//  ServiceApp
//
//  Created by Alexander Suprun on 27.03.2024.
//

import SwiftUI
import Kingfisher
import SafariServices

struct MainView: View {
    @ObservedObject var serviceLoader = LoadManager()
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Text("Сервисы")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .bold))
                List(serviceLoader.services) { service in
                    ZStack {
                        Button(action: {
                            self.openURL(service.link)
                        }) {
                            HStack {
                                KFImage(URL(string: service.iconURL))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 64, height: 64)
                                    .padding()
                                VStack(alignment: .leading) {
                                    Text(service.name)
                                        .font(.headline)
                                    Text(service.description)
                                        .font(.subheadline)
                                }
                                .foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .listRowBackground(Color.black)
                }
                .listStyle(PlainListStyle())
            }
        }
    }
    
    func openURL(_ url: URL) {
           UIApplication.shared.open(url)
    }
}

#Preview {
    MainView()
}
