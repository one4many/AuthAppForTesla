//
//  HomeView.swift
//  AuthAppForTesla
//
//  Created by Nila on 21.02.21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var model: AuthViewModel
    
    let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
    
    var body: some View {
        
        VStack {
            HomeViewHeader(model: model)
            ScrollView {
            VStack {
                HomeViewToken(title: "Refresh Token (Recommended)", description: "A refresh token allows for continuous interaction with your Tesla Account and is usually what is requested by other apps and third-party services. This is used to generate new access tokens.", token: model.tokenV3?.refresh_token) {
                    model.donateRefreshTokenInteraction()
                }
                Divider()
                HomeViewToken(title: "Access Token", description: "An access token allows for temporary access to your Tesla Account and typically expires after several hours.", token: model.tokenV3?.access_token) {
                    model.donateAccessTokenInteraction()
                }
                .opacity(0.5)
//                Divider()
//                HomeViewToken(title: "Owners Access Token", description: "An owners access token allows for temporary access to your vehicles and solar products and typically expires after fourty five days.", token: model.tokenV2?.access_token) {
//                    model.donateOwnersAccessTokenInteraction()
//                }
            }
            .padding(.vertical, 15)
            HomeViewRefreshToken(model: model)
            }
//            Spacer()
            Text("v. \(version) build \(build)")
                .font(.system(size: 12, weight: .regular, design: .default))
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom).padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(model: AuthViewModel())
    }
}
