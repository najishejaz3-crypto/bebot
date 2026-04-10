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
                
                headerView()
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
                        
                        mainListingItem(imageName: "placeholder", price: "$50000", title: "123 Avenu parkstreet")
                        mainListingItem(imageName: "placeholder", price: "$40000", title: "56 park street")
                    }
                }
                .padding()
                HStack {
                    listingView(imageName: "placeholder", text: "New Listing")
                    listingView(imageName: "placeholder", text: "New Project")
                }
                HStack {
                    listingView(imageName: "placeholder", text: "Open House")
                    listingView(imageName: "placeholder", text: "Price Reduced")
                   
                }
                HStack {
                    listingView(imageName: "placeholder", text: "Open House")
                    listingView(imageName: "placeholder", text: "Price Reduced")
                   
                }
            }
            HStack(spacing : 60) {
                buttonView(systemImage: "house", text: "Home")
                buttonView(systemImage: "envelope", text: "Inbox")
                buttonView(systemImage: "list.bullet.clipboard", text: "Activity")
                buttonView(systemImage: "person.crop.circle", text: "Profile")
               
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
    
    fileprivate func mainListingItem(imageName: String, price:String, title:String) -> VStack<TupleView<(some View, Text, Text)>> {
        return VStack(alignment: .leading, spacing: 8) {
            
            Image(imageName)
                .resizable()
                .frame(width: 320, height: 250)
            
            Text(price)
                .font(.title)
                .fontWeight(.medium)
            
            Text(title)
                .foregroundColor(.gray)
                .font(.callout)
            
        }
    }
    fileprivate func listingView(imageName: String, text: String) -> ZStack<TupleView<(some View, some View)>> {
        return ZStack(alignment: .bottomLeading) {
            
            Image(imageName)
                .resizable()
                .frame(width: 170, height: 120)
            
            Text(text)
                .font(.title3)
                .foregroundColor(.black)
                .padding(.vertical, 40)
                .padding(.horizontal, 30)
        }
    }
    fileprivate func buttonView(systemImage: String, text: String) -> Button<some View> {
        return Button {
            homeSelected.toggle()
        } label: {
            
            VStack(spacing: 10) {
                Image(systemName: systemImage)
                    .font(.title2)
                
                Text(text)
                    .font(.caption)
            }
            .foregroundColor(homeSelected ? .black : .gray)
        }
    }
    
    fileprivate func headerView() -> HStack<TupleView<(some View, some View)>> {
        return HStack {
            
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
    }
    
}


#Preview {
    NhomePage()
}

