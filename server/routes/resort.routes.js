import { Router } from "express";
import {
    getResorts,
    getResort,
    createResort,
    deleteResort,
    updateResort,
} from "../controllers/resort.controllers.js"
const router = Router()

router.get("/api/resorts", getResorts)
router.get("/api/resorts/:name", getResort)
router.post("/api/resorts", createResort)
router.put("/api/resorts/:name", updateResort)
router.delete("/api/resorts/:name", deleteResort)

export default router