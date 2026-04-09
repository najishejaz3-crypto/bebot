//
//  NhomePage.swift
//  bebot
//
//  Created by abdul karim on 09/04/26.
//

import SwiftUI

struct NhomePage: View {
    @State private var searchButton : String = ""
    @State private var selectedButton: String? = nil
    @State private var homeSelected = false
    @State private var inboxSelected = false
    @State private var activitySelected = false
    @State private var profileSelected = false
    
    
    var body: some View {
        VStack {
            
            ScrollView {
                
                HStack {
                    
                    ZStack(alignment: .leading) {
                        
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.leading, 10)
                        
                        TextField("Search", text: $searchButton)
                            .padding(.leading, 35)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 12)
                    .frame(width: 300, height: 55)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.gray, lineWidth: 0.5)
                    )
                    Image(systemName: "slider.horizontal.2.square")
                        .font(.largeTitle)
                        .frame(width: 60, height: 60)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.gray, lineWidth: 0.5)
                        )
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        Spacer().frame(width: 10)
                        HPill(text: "Real Estate")
                        HPill(text: "Apartment")
                        HPill(text: "House")
                        HPill(text: "Motels")
                        HPill(text: "Farmhouse")
                    }
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Image("placeholder")
                                .resizable()
                                .frame(width: 320, height: 250)
                            
                            Text("$440,000")
                                .font(.title)
                                .fontWeight(.medium)
                            
                            Text("123 Main St, Tulsa, OK 74136")
                                .foregroundColor(.gray)
                                .font(.callout)
                            
                        }
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Image("placeholder")
                                .resizable()
                                .frame(width: 320, height: 250)
                            
                            Text("$420,000")
                                .font(.title)
                                .fontWeight(.medium)
                            
                            Text("101 Willow St, Austin, TX 78701")
                                .foregroundColor(.gray)
                                .font(.callout)
                            
                        }
                    }
                }
                .padding()
                HStack {
                    ZStack(alignment: .bottomLeading) {
                        
                        Image("placeholder")
                            .resizable()
                            .frame(width: 170, height: 120)
                        
                        Text("New Listing")
                            .font(.title3)
                            .foregroundColor(.black)
                            .padding(.vertical, 40)
                            .padding(.horizontal, 30)
                    }
                    ZStack(alignment: .bottomLeading) {
                        
                        Image("placeholder")
                            .resizable()
                            .frame(width: 170, height: 120)
                        
                        Text("New Project")
                            .font(.title3)
                            .foregroundColor(.black)
                            .padding(.vertical, 40)
                            .padding(.horizontal, 30)
                    }
                }
                HStack {
                    ZStack(alignment: .bottomLeading) {
                        
                        Image("placeholder")
                            .resizable()
                            .frame(width: 170, height: 120)
                        
                        Text("Open House")
                            .font(.title3)
                            .foregroundColor(.black)
                            .padding(.vertical, 40)
                            .padding(.horizontal, 30)
                    }
                    ZStack(alignment: .bottomLeading) {
                        
                        Image("placeholder")
                            .resizable()
                            .frame(width: 170, height: 120)
                        
                        Text("Price Reduced")
                            .font(.title3)
                            .foregroundColor(.black)
                            .padding(.vertical, 40)
                            .padding(.horizontal, 30)
                    }
                }
            }
            HStack(spacing : 60) {
                Button {
                    homeSelected.toggle()
                } label: {
                    
                    VStack(spacing: 10) {
                        Image(systemName: "house")
                            .font(.title2)
                        
                        Text("Home")
                            .font(.caption)
                    }
                    .foregroundColor(homeSelected ? .black : .gray)
                }
                Button {
                    inboxSelected.toggle()
                } label: {
                    
                    VStack(spacing: 10) {
                        
                        Image(systemName: "envelope")
                            .font(.title2)
                        
                        Text("Inbox")
                            .font(.caption)
                    }
                    .foregroundColor(inboxSelected ? .black : .gray)
                }
                Button {
                    activitySelected.toggle()
                } label: {
                    
                    VStack(spacing: 10) {
                        
                        Image(systemName: "list.bullet.clipboard")
                            .font(.title2)
                        
                        Text("Activity")
                            .font(.caption)
                    }
                    .foregroundColor(activitySelected ? .black : .gray)
                }
                Button {
                    profileSelected.toggle()
                } label: {
                    
                    VStack(spacing: 10) {
                        Image(systemName: "person.crop.circle")
                            .font(.title2)
                        
                        Text("Profile")
                            .font(.caption)
                    }
                    .foregroundColor(profileSelected ? .black : .gray)
                }
            }
            
        }
    }
    
//MARK: Helpful Functions
    fileprivate func HPill(text:String) -> Button<some View> {
        return Button {
            selectedButton = text
        } label: {
            Text(text)
                .padding()
                .font(.callout)
                .frame(width: 115, height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color.gray, lineWidth: 0.5)
                )
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .fill(selectedButton == text ? Color.black : Color.white)
                )
                .foregroundColor(selectedButton == text ? .white : .gray)
        }
    }
    
}


#Preview {
    NhomePage()
}

