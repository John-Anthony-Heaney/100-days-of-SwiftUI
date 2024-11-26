import SwiftUI

struct AddressView: View {
    @StateObject private var order = Order.loadFromUserDefault() // Load the order with saved data

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }

            Section {
                NavigationLink("Check out") {
                    CheckoutView(order: order)
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .onDisappear {
            // Save order data when leaving the AddressView
            order.saveToUserDefault()
        }
    }
}

#Preview {
    AddressView()
}
