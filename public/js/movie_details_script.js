// Function to confirm booking
function confirmBooking() {
    // Get the selected timing
    var timing = document.querySelector('input[name="timing"]:checked');
    if (!timing) {
        alert("Please select a timing.");
        return;
    }
    var selectedTiming = timing.value;

    // Get the selected number of tickets
    var ticketCount = document.getElementById("ticket-count").value;

    // Perform any necessary actions here, such as submitting the booking request to a server, etc.

    // For demonstration purposes, just alert the user with the selected timing and ticket count
    alert("You have selected " + selectedTiming + " for " + ticketCount + " ticket(s).");
}

// Function to handle seat selection
document.addEventListener("DOMContentLoaded", function() {
    var seats = document.querySelectorAll(".seat.available");

    seats.forEach(function(seat) {
        seat.addEventListener("click", function() {
            if (!this.classList.contains("selected")) {
                // Allow selecting only if the seat is not already selected
                this.classList.toggle("selected");
            }
        });
    });
});

document.addEventListener("DOMContentLoaded", function () {
    // Fetch booked seat information from the server
    fetch("/booked-seats")
        .then(response => response.json())
        .then(bookedSeats => {
            // Generate the seat map dynamically
            const seatGrid = document.querySelector(".seat-grid");

            // Define the total number of seats
            const totalSeats = 50; // Change this to the actual total number of seats

            // Generate seats dynamically
            for (let i = 1; i <= totalSeats; i++) {
                const seat = document.createElement("div");
                seat.className = "seat";
                seat.textContent = i;

                // Check if the current seat is booked
                if (bookedSeats.includes(i)) {
                    seat.classList.add("booked");
                } else {
                    seat.classList.add("available");
                    seat.addEventListener("click", toggleSeatSelection);
                }

                seatGrid.appendChild(seat);
            }
        })
        .catch(error => console.error("Error fetching booked seats:", error));
});

// Function to toggle seat selection
function toggleSeatSelection() {
    if (!this.classList.contains("selected")) {
        this.classList.add("selected"); // Mark the seat as selected
    } else {
        this.classList.remove("selected"); // Deselect the seat
    }
}


// Function to update ticket count based on selected seats
function updateTicketCount() {
    // Get all selected seats
    var selectedSeats = document.querySelectorAll(".seat.selected");
    // Get the number of tickets input element
    var ticketCountInput = document.getElementById("ticket-count");
    // Update the value of the number of tickets input to match the number of selected seats
    ticketCountInput.value = selectedSeats.length;
}

// Function to confirm booking
function confirmBooking() {
    // Get the selected timing
    var timing = document.querySelector('input[name="timing"]:checked');
    if (!timing) {
        alert("Please select a timing.");
        return;
    }
    var selectedTiming = timing.value;

    // Get the selected number of tickets
    var ticketCount = document.getElementById("ticket-count").value;

    // Perform any necessary actions here, such as submitting the booking request to a server, etc.

    // For demonstration purposes, just alert the user with the selected timing and ticket count
    alert("You have selected " + selectedTiming + " for " + ticketCount + " ticket(s).");
}

document.addEventListener("DOMContentLoaded", function() {
    // Get the seat grid containers for each section
    var silverSeatsGrid = document.querySelector(".silver-seats");
    var goldSeatsGrid = document.querySelector(".gold-seats");
    var platinumSeatsGrid = document.querySelector(".platinum-seats");

    // Create seats for each section
    createSeats(silverSeatsGrid, 51);
    createSeats(goldSeatsGrid, 34);
    createSeats(platinumSeatsGrid, 34);
});

// Function to create seats dynamically
function createSeats(seatGrid, numSeats) {
    // Generate seats dynamically
    for (var i = 1; i <= numSeats; i++) {
        var seat = document.createElement("div");
        seat.className = "seat available";
        seat.dataset.seat = i;
        seat.textContent = i;
        seat.addEventListener("click", function() {
            this.classList.toggle("selected");
            updateTicketCount();
        });
        seatGrid.appendChild(seat);
    }
}
ticketCountInput.addEventListener('input', () => {
// Get the number of tickets input element
const ticketCountInput = document.getElementById('ticket-count');

// Get all seat elements
const seats = document.querySelectorAll('.seat');

// Add event listener to the ticket count input
    // Get the selected number of tickets
    const ticketCount = parseInt(ticketCountInput.value);

    // Reset all seats to available state
    seats.forEach(seat => {
        seat.classList.remove('selected');
    });

    // Loop through the seats and mark the selected number of seats
    for (let i = 0; i < ticketCount; i++) {
        if (seats[i]) {
            seats[i].classList.add('selected');
        }
    }

    // Check if the number of selected seats matches the number of tickets
    const selectedSeatsCount = document.querySelectorAll('.seat.selected').length;
    if (selectedSeatsCount !== ticketCount) {
        console.log("Incorrect input. The number of selected seats does not match the number of tickets.");
        // You can add further handling here, such as displaying an error message.
    }
});
// Get the confirm booking button
const confirmBookingButton = document.getElementById('confirm-booking');

// Add event listener to the confirm booking button
confirmBookingButton.addEventListener('click', () => {
    // Get the selected number of tickets
    const ticketCountInput = document.getElementById('ticket-count');
    const ticketCount = parseInt(ticketCountInput.value);
    
    // Calculate the total amount to be paid (assuming ticket price is $10)
    const ticketPrice = 10;
    const totalAmount = ticketCount * ticketPrice;

    // Update the purchase details section with ticket count and amount
    const ticketCountInfo = document.getElementById('ticket-count-info');
    const amountInfo = document.getElementById('amount-info');
    ticketCountInfo.textContent = `Number of Tickets: ${ticketCount}`;
    amountInfo.textContent = `Total Amount: $${totalAmount}`;

    // Show the purchase details section
    const purchaseDetails = document.getElementById('purchase-details');
    purchaseDetails.style.display = 'block';
});
document.addEventListener('DOMContentLoaded', function () {
    const confirmBookingButton = document.getElementById('confirm-booking');
    const ticketCountInput = document.getElementById('ticket-count');
    const timingInputs = document.querySelectorAll('input[name="timing"]');
    const seats = document.querySelectorAll('.seat');
    const purchaseDetails = document.getElementById('purchase-details');

    confirmBookingButton.addEventListener('click', function () {
        // Get the selected timing
        let selectedTiming;
        timingInputs.forEach(function (input) {
            if (input.checked) {
                selectedTiming = input.value;
            }
        });

        // Get the selected number of tickets
        const ticketCount = parseInt(ticketCountInput.value);

        // Get the number of selected seats
        const selectedSeatsCount = document.querySelectorAll('.seat.selected').length;

        // Check if the number of selected seats matches the number of tickets
        if (selectedSeatsCount !== ticketCount) {
            alert("Please select the correct number of seats.");
            return;
        }

        // Calculate the total amount to be paid (assuming ticket price is $10)
        const ticketPrice = 10;
        const totalAmount = ticketCount * ticketPrice;

        // Update the purchase details section with ticket count, timing, and amount
        const ticketCountInfo = document.getElementById('ticket-count-info');
        const timingInfo = document.getElementById('timing-info');
        const amountInfo = document.getElementById('amount-info');
        ticketCountInfo.textContent = `Number of Tickets: ${ticketCount}`;
        timingInfo.textContent = `Timing: ${selectedTiming}`;
        amountInfo.textContent = `Total Amount: $${totalAmount}`;

        // Show the purchase details section
        purchaseDetails.style.display = 'block';
    });

    // Add event listeners to timing inputs to ensure only one can be selected
    timingInputs.forEach(function (input) {
        input.addEventListener('change', function () {
            timingInputs.forEach(function (input) {
                input.checked = false;
            });
            this.checked = true;
        });
    });

    // Add event listener to the seat map
    seats.forEach(function (seat) {
        seat.addEventListener('click', function () {
            if (this.classList.contains('selected')) {
                this.classList.remove('selected');
            } else {
                this.classList.add('selected');
            }
        });
    });
});

document.addEventListener('DOMContentLoaded', function () {
    const confirmBookingButton = document.getElementById('confirm-booking');
    const ticketCountInput = document.getElementById('ticket-count');
    const timingInputs = document.querySelectorAll('input[name="timing"]');
    const seats = document.querySelectorAll('.seat');
    const purchaseDetails = document.getElementById('purchase-details');

    confirmBookingButton.addEventListener('click', function () {
        // Get the selected timing
        let selectedTiming;
        timingInputs.forEach(function (input) {
            if (input.checked) {
                selectedTiming = input.value;
            }
        });

        // Get the selected number of tickets
        const ticketCount = parseInt(ticketCountInput.value);

        // Get the number of selected seats
        const selectedSeatsCount = document.querySelectorAll('.seat.selected').length;

        // Check if the number of selected seats matches the number of tickets
        if (selectedSeatsCount !== ticketCount) {
            alert("Please select the correct number of seats.");
            return;
        }

        // Calculate the total amount to be paid (assuming ticket price is $10)
        const ticketPrice = 10;
        const totalAmount = ticketCount * ticketPrice;

        // Update the purchase details section with ticket count, timing, and amount
        const ticketCountInfo = document.getElementById('ticket-count-info');
        const timingInfo = document.getElementById('timing-info');
        const amountInfo = document.getElementById('amount-info');
        ticketCountInfo.textContent = `Number of Tickets: ${ticketCount}`;
        timingInfo.textContent = `Timing: ${selectedTiming}`;
        amountInfo.textContent = `Total Amount: $${totalAmount}`;

        // Show the purchase details section
        purchaseDetails.style.display = 'block';
    });

    // Add event listeners to timing inputs to ensure only one can be selected
    timingInputs.forEach(function (input) {
        input.addEventListener('change', function () {
            timingInputs.forEach(function (input) {
                input.checked = false;
            });
            this.checked = true;
        });
    });

    // Add event listener to the seat map
    seats.forEach(function (seat) {
        seat.addEventListener('click', function () {
            if (this.classList.contains('selected')) {
                this.classList.remove('selected');
            } else {
                this.classList.add('selected');
            }
        });
    });
});
