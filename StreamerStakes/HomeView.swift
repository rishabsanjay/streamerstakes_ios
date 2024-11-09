//
//  HomeView.swift
//  StreamerStakes
//

import SwiftUI

struct HomeView: View {
    @State private var showCardPaymentView = false // State variable to control navigation to CardPaymentView
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Top Bar with StreamerStakes and Buy Token Section
                HStack {
                    Text("StreamerStakes")
                        .font(.title2)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    HStack(spacing: 10) {
                        // Coin Icon and Token Count
                        HStack(spacing: 5) {
                            ZStack {
                                Circle() // Custom circle icon with "S"
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.yellow)
                                
                                Text("S") // Replacing "B" with "S"
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.black)
                            }
                            
                            Text("5") // Token count (replace with dynamic value if needed)
                                .foregroundColor(.white)
                        }
                        
                        // Plus Button to open CardPaymentView
                        Button(action: {
                            showCardPaymentView = true
                        }) {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                        }
                        .sheet(isPresented: $showCardPaymentView) {
                            CardPaymentView()
                        }
                        
                        // Notification Bell Icon
                        Image(systemName: "bell")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                    }
                    .padding(8)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(15)
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
}
