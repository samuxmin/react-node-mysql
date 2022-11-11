import { Router } from "express";
import { pool } from "../db.js";

const r = Router()
r.get("/ping", async (req,res) => {
    const result = await pool.query("SELECT * from resort")
    console.log(result[0])
    res.send(result[0])
})

export default r