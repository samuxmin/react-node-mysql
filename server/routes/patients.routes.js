import { Router } from "express";
import {
    getPatients,
    getPatient,
    createPatient,
    deletePatient,
    updatePatient,
} from "../controllers/patients.controllers.js"
const router = Router()

router.get("/api/pacientes", getPatients)
router.get("/api/pacientes/:ci", getPatient)
router.post("/api/pacientes", createPatient)
router.put("/api/pacientes/:ci", updatePatient)
router.delete("/api/pacientes/:ci", deletePatient)

export default router