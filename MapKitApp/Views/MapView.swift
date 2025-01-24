//
//  LocationView.swift
//  MapKitApp
//
//  Created by Natalia on 1/23/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @EnvironmentObject private var vm : LocationViewModel
    
    var body: some View {
        ZStack{
            mapLayer
            VStack(spacing: 0) {
                header
                    .padding()
                Spacer()
                locationPreviewStack
            }
        }.sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
            LocationDetailsView(location: location)
        }
    }
}

extension MapView{
    
    private var header: some View{
        VStack{
            Button(action: vm.toggleLocationsList) {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .foregroundColor(.primary)
                    .fontWeight(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading){
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                            .padding()
                    }
            }
            if vm.showLocationsList{
                LocationListView()
            }
            
        }.background(.thickMaterial)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
        /*private var mapLayer: some View{
        Map(coordinateRegion: $vm.mapRegion,
            annotationItems: vm.locations,
            annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        }).ignoresSafeArea()
    }*/
    
    var mapLayer: some View {
        Map(position: $vm.cameraPosition).ignoresSafeArea()
    }
    
    private var locationPreviewStack: some View{
        ZStack{
            ForEach(vm.locations) { location in
                if vm.mapLocation == location{
                    LocationPreviewView(location: location)
                }
            }
            .shadow(color: .black.opacity(0.3), radius: 20)
            .padding()
            .transition(.asymmetric(
                insertion: .move(edge: .trailing),
                removal: .move(edge: .leading)))
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .environmentObject(LocationViewModel())
    }
}
