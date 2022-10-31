//
//  ContentView.swift
//  Instafilter
//
//  Created by Eric Tolson on 10/29/22.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var filterRadius = 0.5
    @State private var filterScale = 0.5

    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var processedImage: UIImage?

    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()

    @State private var showingFilterSheet = false
    @State private var saved = false

    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    ZStack {
                        Rectangle()
                            .fill(.secondary)
                        
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                        
                        image?
                            .resizable()
                            .scaledToFit()
                    }
                    .onTapGesture {
                        showingImagePicker = true
                    }
                    
                    HStack {
                        Text("Intensity")
                            .foregroundColor(.white)
                        Slider(value: $filterIntensity)
                            .onChange(of: filterIntensity) { _ in applyProcessing() }
                    }
                    .padding(.vertical)
                    
                    HStack {
                        Text("Radius")
                            .foregroundColor(.white)
                        Slider(value: $filterRadius)
                            .onChange(of: filterRadius) { _ in applyProcessing() }
                    }
                    .padding(.vertical)
                    
                    HStack {
                        Text("Scale")
                            .foregroundColor(.white)
                        Slider(value: $filterScale)
                            .onChange(of: filterScale) { _ in applyProcessing() }
                    }
                    .padding(.vertical)
                    
                    
                    HStack {
                        Button("Change Filter") {
                            showingFilterSheet = true
                        }
                        .foregroundColor(.white)
                        
                        Spacer()
                        
                        Button("Save", action: save)
                            .disabled(showSave() == false)
                            .foregroundColor(.white)
                    }
                }
                .alert("Image saved!", isPresented: $saved) {
                    Button("Continue") {
                        image = nil
                    }
                }
                .padding([.horizontal, .bottom])
                .navigationTitle("Instafilter")
                .onChange(of: inputImage) { _ in loadImage() }
                .sheet(isPresented: $showingImagePicker) {
                    ImagePicker(image: $inputImage)
                }
                .confirmationDialog("Select a filter", isPresented: $showingFilterSheet) {
                    Button("Crystallize") { setFilter(CIFilter.crystallize()) }
                    Button("Edges") { setFilter(CIFilter.edges()) }
                    Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
                    Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                    Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                    Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
                    Button("Vignette") { setFilter(CIFilter.vignette()) }
                    Button("Vibrance") { setFilter(CIFilter.vibrance()) }
                    Button("Cancel", role: .cancel) { }
                }
            }
        }
    }
    func reset() {
        filterIntensity = 0.5
        filterScale = 0.5
        filterRadius = 0.5
        image = nil
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }


        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
        
    }

    func save() {
        guard let processedImage = processedImage else { return }

        let imageSaver = ImageSaver()

        imageSaver.successHandler = {
            print("Success!")
            saved = true
        }

        imageSaver.errorHandler = {
            print("Oops! \($0.localizedDescription)")
        }

        imageSaver.writeToPhotoAlbum(image: processedImage)
        
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys

        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterRadius * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterScale * 10, forKey: kCIInputScaleKey) }
        if inputKeys.contains(kCIInputAmountKey) { currentFilter.setValue(filterIntensity * 200, forKey: kCIInputAmountKey) }

        guard let outputImage = currentFilter.outputImage else { return }

        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }

    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
    
    func showSave() -> Bool {
        if filterIntensity != 0.5 {
            return true
        } else if filterRadius != 0.5 {
            return true
        } else if filterScale != 0.5 {
            return true
        }
        else {
            return false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
