//
//  LocationDetailsView.swift
//  MapKitApp
//
//  Created by Natalia on 1/23/25.
//

import SwiftUI
import MapKit

struct LocationDetailsView: View {
    
    @EnvironmentObject private var viewModel : LocationViewModel
    let location: Location
    
    var body: some View {
        ScrollView {
            VStack {
                imageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
  
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(alignment: .topLeading) {
            backButton
        }
    }
}

struct LocationsDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailsView(location: LocationService.locations.first!)
                    .environmentObject(LocationViewModel())
            }
        }

        extension LocationDetailsView {
            
            private var imageSection: some View {
                TabView {
                    ForEach(location.imageNames, id: \.self) {
                        Image($0)
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width)
                            .clipped()
                    }
                }
                .frame(height: 500)
                .tabViewStyle(PageTabViewStyle())
            }
            
            private var titleSection: some View {
                VStack(alignment: .leading, spacing: 8) {
                    Text(location.name)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text(location.cityName)
                        .font(.title3)
                        .foregroundColor(.secondary)
                }
            }
            
            private var descriptionSection: some View {
                VStack(alignment: .leading, spacing: 16) {
                    Text(location.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    if let url = URL(string: location.link) {
                        Link("Read more on Wikipedia", destination: url)
                                            .font(.headline)
                                            .tint(.blue)

                                    }
                                }
                            }
                            
                            private var mapLayer: some View {
                                Map(position: .constant(MapCameraPosition.region(MKCoordinateRegion(
                                    center: location.coordinates,
                                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
                                )))
                                    .allowsHitTesting(false)
                                    .aspectRatio(1, contentMode: .fit)
                                    .cornerRadius(30)
                            }
                            
                            private var backButton: some View {
                                Button {
                                    viewModel.sheetLocation = nil
                                } label: {
                                    Image(systemName: "xmark")
                                        .font(.headline)
                                        .padding(16)
                                        .foregroundColor(.primary)
                                        .background(.thickMaterial)
                                        .cornerRadius(10)
                                        .shadow(radius: 4)
                                        .padding()
                                }
                            }
                        }
