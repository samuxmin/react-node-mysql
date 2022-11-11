import {pool} from "../db.js"
export const getClients = async (req, res) =>{
    try {
        const [result] = await pool.query("SELECT * FROM client")
        res.json(result)
    } catch (error) {
        res.status(500).json({message:error.message})
    }
}

export const getClient = async (req, res) =>{
    try {
        const [result] = await pool.query("SELECT * from client where client_code = ?", [req.params.code])
        if(result.length === 0){
            return res.status(404).json({message: "Client not found"})
        }
        res.json(result[0])
    } catch (error) {
        res.status(500).json({message:error.message})
    }
}

export const createClient = async (req, res) =>{
    try {
        const client = req.body
        const [result] = await pool.query('INSERT INTO resort SET ?', client)
        console.log(result)
        res.json(result)
    } catch (error) {
        res.status(500).json({message:error.message})
    }
}

export const updateClient = async (req, res) =>{
    try {
        let client = req.body
        const [result] = await pool.query("UPDATE client SET ? WHERE client_code = ?",[client, req.params.code])
        res.status(200).json(result)
    } catch (error) {
        res.status(500).json({message:error.message})
    }
}

export const deleteClient = async (req, res) =>{
    try {
        const [result] = await pool.query("DELETE FROM client WHERE client_code = ?",[req.params.code])
        console.log(result)
        if(result.affectedRows === 0){
            return res.status(404).json({message: "Client not found"})
        }
        return res.sendStatus(204)
    } catch (error) {
        res.status(500).json({message:error.message})
    }
}