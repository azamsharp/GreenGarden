//
//  AboutUs.swift
//  AboutUs
//
//  Created by Mohammad Azam on 7/17/21.
//

import SwiftUI

struct AboutUs: View {
    
    let vegetable: VegetableViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text(vegetable.description)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Sowing")
                    .font(.headline)
            
            VStack(spacing: 10) {
                TwoColumnView(left: "Seed depth", right: vegetable.seedDepth)
                TwoColumnView(left: "Germination soil temperature", right: vegetable.growingSoilTemperature)
            }
            
            DescriptionView(heading: "Sowing", content: vegetable.sowingDescription)
                .padding()
                .background(Constants.Colors.lightGreyRowColor)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                .foregroundColor(.black)
            
            DescriptionView(heading: "Growing", content: vegetable.growingDescription)
                .padding()
                .background(Constants.Colors.lightBlueRowColor)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                .foregroundColor(.black)
            
            Spacer() 
            
        }.padding()
    }
}

struct AboutUs_Previews: PreviewProvider {
    static var previews: some View {
        AboutUs(vegetable: VegetableViewModel.default())
    }
}
