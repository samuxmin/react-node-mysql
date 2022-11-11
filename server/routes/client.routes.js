import { Router } from "express";
import {
    getClients,
    getClient,
    createClient,
    deleteClient,
    updateClient,
} from "../controllers/client.controllers.js"
const router = Router()

router.get("/api/clients", getClients)
router.get("/api/clients/:code", getClient)
router.post("/api/clients", createClient)
router.put("/api/clients/:code", updateClient)
router.delete("/api/clients/:code", deleteClient)

export default router