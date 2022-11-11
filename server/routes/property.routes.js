import { Router } from "express";
import {
    getPropertyes,
    getProperty,
    createProperty,
    deleteProperty,
    updateProperty,
} from "../controllers/property.controllers.js"
const router = Router()

router.get("/api/propertyes", getPropertyes)
router.get("/api/propertyes/resort/:resort", getPropertyes)
router.get("/api/propertyes/:code", getProperty)
router.post("/api/propertyes", createProperty)
router.put("/api/propertyes/:code", updateProperty)
router.delete("/api/propertyes/:code", deleteProperty)

export default router                                                