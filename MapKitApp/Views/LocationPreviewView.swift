//
//  LocationPreviewView.swift
//  MapKitApp
//
//  Created by Natalia on 1/23/25.
//

import SwiftUI
import MapKit

struct LocationPreviewView: View {
    @EnvironmentObject private var vm: LocationViewModel

    let location : Location
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16){
                ImageSection
                TextSection
            }
            
            VStack(spacing: 8){
                learnMoreButton
                nextButton
            }
        } .padding(20)
            .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
            )
            .cornerRadius(10)
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            LocationPreviewView(location : LocationService.locations.first!)
        }
        .environmentObject(LocationViewModel())
    }
}

extension LocationPreviewView{
    
    private var ImageSection: some View{
        ZStack {
            if let imageNames = location.imageNames.first{
                Image(imageNames)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }.padding(6)
            .background(.white)
            .cornerRadius(10)
        
    }
    
    private var TextSection : some View{
        VStack{
            Text(location.name)
                .font(.title2)
                .bold()
            Text(location.cityName)
                .font(.subheadline)
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton : some View{
        Button {
            vm.sheetLocation = location
        } label: {
            Text("Learn More")
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton : some View{
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.bordered)
    }
}
