import express from "express";
import bodyParser from "body-parser";
import pg from "pg";

const app = express();
const port = 3000;

const db = new pg.Client({
  user: "postgres",
  host: "localhost",
  database: "movies",
  password: "alfez@3786",
  port: 5432,
});

db.connect();
console.log("Server connected.")

app.set('view engine', 'ejs');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

app.get("/", (req, res) => {
  res.render("home.ejs");
});

app.get("/login", (req, res) => {
  res.render("login.ejs");
});

app.get("/register", (req, res) => {
  res.render("register.ejs");
});

app.get("/moviedetails1", (req,res) => {
  res.render("moviedetails1.ejs");
});

app.get("/moviedetails2", (req,res) => {
  res.render("moviedetails2.ejs");
});

app.get("/moviedetails3", (req,res) => {
  res.render("moviedetails3.ejs");
});

app.get("/addmovies",(req,res)=>{
  res.render("addmovies.ejs");
});

app.get("/admin",(req,res)=>{
  res.render("admin.ejs");
});

app.get("/addtheater", (req,res)=>{
  res.render("addtheater.ejs");
});

app.get("/showtimedetail", (req,res)=>{
  res.render("showtimedetail.ejs");
});

app.get("/booking", async (req,res)=>{
  res.render("booking.ejs");
});


app.post("/booking", async(req,res)=>{
  const showid = req.body.show_id;
  const userid = req.body.user_id;
  const bookingtime = req.body.booking_time;
  const numtickets = req.body.num_tickets;

  const result  = await db.query("INSERT INTO bookings (show_id,user_id,booking_time,num_tickets) VALUES ($1,$2,$3,$4)",
  [showid,userid,bookingtime,numtickets]);

  console.log(result);
  res.send("Data successfully added");

});

app.post("/admin", async (req,res)=>{
  const username = req.body.username;
  const password = req.body.password;

  try {
    const result = await db.query("SELECT * FROM admin WHERE username = $1", [
      username,
    ]);
    if (result.rows.length > 0) {
      const user = result.rows[0];
      const storedPassword = user.password;

      if (password === storedPassword) {
        res.render("home2.ejs");
      } else {
        res.send("Incorrect Password");
      }
    } else {
      res.send("Admin not found");
    }
  } catch (err) {
    console.log(err);
  }
});

app.post("/addmovies",async (req,res)=>{
  const title = req.body.title;
  const description = req.body.description;
  const poster_url = req.body.poster_url;

  const result = await db.query("INSERT INTO movies (title,description,poster_url) VALUES ($1,$2,$3)",[title,description,poster_url]);

  console.log(result);
  res.send("Data successfully added");
});

app.post("/addtheater", async (req,res)=>{
  const Name = req.body.name;
  const Location = req.body.location;
  const Capacity = req.body.capacity;
  
  const result = await db.query("INSERT INTO theaters (name,location,capacity) VALUES ($1,$2,$3)",
  [Name,Location,Capacity]);

  console.log(result);
  res.send("Data successfully added.");
});

app.post("/showtimedetail", async (req,res)=>{
  const movieid = req.body.movie_id;
  const theaterid = req.body.theater_id;
  const showtime = req.body.show_time;
  const availableseats = req.body.available_seats;

  const result = await db.query("INSERT INTO shows (movie_id,theater_id,show_time,available_seats) VALUES ($1,$2,$3,$4)",[movieid,theaterid,showtime,availableseats]);

  console.log(result);
  res.send("Data successfully added.");
});

app.post("/register", async (req, res) => {
  const username = req.body.username;
  const email = req.body.email;
  const password = req.body.password;

  const result = await db.query(
    "INSERT INTO users (username,email,password) VALUES ($1,$2,$3)",
    [username,email,password]
  );

  console.log(result);
  res.send("User registered Successfully.");
});

app.post("/login", async (req, res) => {
  const email = req.body.email;
  const password = req.body.password;

  try {
    const result = await db.query("SELECT * FROM users WHERE email = $1", [
      email,
    ]);
    if (result.rows.length > 0) {
      const user = result.rows[0];
      const storedPassword = user.password;

      if (password === storedPassword) {
        res.render("bookings.ejs");
      } else {
        res.send("Incorrect Password");
      }
    } else {
      res.send("User not found");
    }
  } catch (err) {
    console.log(err);
  }
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
