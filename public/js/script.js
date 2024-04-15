// Function to handle seat selection

document.getElementById("Button").addEventListener("click", function() {
    window.location.href = "/login.html";
});

function toggleSeat(seat) {
    if (seat.classList.contains('selected')) {
      seat.classList.remove('selected');
    } else {
      seat.classList.add('selected');
    }
  }
  
  // Example of sending seat data to backend on booking
  function bookSeats() {
    const selectedSeats = document.querySelectorAll('.seat.selected');
    const seatNumbers = Array.from(selectedSeats).map(seat => seat.dataset.seatNumber);
    
    // Send selected seat numbers to backend for booking
    console.log('Selected seats:', seatNumbers);
  }

  