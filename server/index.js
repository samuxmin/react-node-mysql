import express from "express"
import cors from 'cors'
import {PORT} from "./config.js"
import indexRoutes from "./routes/index.routes.js"
import patientRoutes from "./routes/patients.routes.js"

const app = express()
app.listen(PORT)
console.log("Ecuchando el puerto ", PORT)

app.use(cors({
    origin: "http://localhost:5173"
}))
app.use(express.json())

app.use(indexRoutes)
app.use(patientRoutes)