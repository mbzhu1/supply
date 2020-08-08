//
//  DonationDetail.swift
//  supply
//
//  Created by Michael Zhu on 8/8/20.
//  Copyright © 2020 Michael Zhu. All rights reserved.
//

import SwiftUI

struct DonationDetail: View {
    var donation: Donation
    
    var body: some View {
        VStack {
            MapView(coordinate: donation.locationCoordinate)
            .edgesIgnoringSafeArea(.top)
            .frame(height: 300)
            
            CircleImage(image: donation.image)
                           .offset(x: 0, y: -130)
                           .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                
                Text(donation.name)
                    .font(.title)
                HStack(alignment: .bottom) {
                    Text("is donating")
                    Text("\(donation.quantity) " + donation.item)
                        .font(.headline)
                    Spacer()
                    
                }
                .padding(5)
                .padding(.bottom, 10)
                Text(donation.city + ", " + donation.state)
                    .font(.subheadline)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tristique orci ac sem sodales, ut vehicula tellus auctor. Duis ac lobortis orci, sed iaculis diam. Integer id dapibus arcu, in pulvinar dui. ")
            }
            .padding()
            
            Spacer()
        
        }
    }
}

struct DonationDetail_Previews: PreviewProvider {
    static var previews: some View {
        DonationDetail(donation: donationData[0])
    }
}
