import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order

    @State private var confirmationMessage = ""
    @State private var alertTitle = ""
    @State private var showingConfirmation = false

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"),
                           scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)

                Text("Your total cost is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)

                Button("Place Order") {
                    print("Button clicked") // Debugging statement
                    Task {
                        await placeOrder()
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .alert(alertTitle, isPresented: $showingConfirmation) {
            Button("OK") { }
        } message: {
            Text(confirmationMessage)
        }
    }

    func placeOrder() async {
        print("Place order started") // Debugging statement

        // Simulate an API call or replace with actual API URL if needed
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Encoding failed") // Debugging statement
            alertTitle = "Error"
            confirmationMessage = "Failed to encode order."
            showingConfirmation = true
            return
        }

        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"

        do {
            // Simulate uploading data via URLSession
            let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
            print("Data uploaded successfully") // Debugging statement
            print("Response: \(response)") // Debugging response

            // Check if response is valid
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 {
                // Decoding the data
                let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
                print("Order decoded successfully") // Debugging statement

                // Update UI state
                DispatchQueue.main.async {
                    alertTitle = "Thank you!"
                    confirmationMessage = "Your order for \(decodedOrder.quantity) x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
                    showingConfirmation = true
                }
            } else {
                // Handle invalid server response (non-201 status)
                print("Invalid server response: \(String(describing: response))") // Debugging statement
                DispatchQueue.main.async {
                    alertTitle = "Error"
                    confirmationMessage = "Failed to place order."
                    showingConfirmation = true
                }
            }
        } catch {
            print("Request failed: \(error.localizedDescription)") // Debugging statement
            DispatchQueue.main.async {
                alertTitle = "Error"
                confirmationMessage = "Check out failed: \(error.localizedDescription)"
                showingConfirmation = true
            }
        }
    }
}
