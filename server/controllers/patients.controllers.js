import {pool} from "../db.js"
export const getPatients = async (req, res) =>{
    try {
        const [result] = await pool.query("SELECT * FROM paciente")
        res.json(result)    
    } catch (error) {
        res.status(500).json({message:error.message})
    }
}

export const getPatient = async (req, res) =>{
    try {
        const [result] = await pool.query("SELECT * from paciente where CI = ?", [req.params.ci])
        if(result.length === 0){
            return res.status(404).json({message: "Patient not found"})
        }
        res.json(result[0])
    } catch (error) {
        res.status(500).json({message:error.message})
    }
}

export const createPatient = async (req, res) =>{
    try {
        const paciente = req.body
        const [result] = await pool.query('INSERT INTO paciente SET ?', paciente)
        console.log(result)
        res.json(result)
    } catch (error) {
        res.status(500).json({message:error.message})
    }
}

export const updatePatient = async (req, res) =>{
    try {
        let paciente = req.body
        const [result] = await pool.query("UPDATE paciente SET ? WHERE ci = ?",[paciente, req.params.ci])
        res.send("actualizar paciente no implementado")
    } catch (error) {
        res.status(500).json({message:error.message})
    }
}

export const deletePatient = async (req, res) =>{
    try {
        const ci = req.params.ci
        const [result] = await pool.query("DELETE FROM paciente WHERE ci = ?",[req.params.ci])
        console.log(result)
        if(result.affectedRows === 0){
            return res.status(404).json({message: "Patient not found"})
        }
        return res.sendStatus(204)
    } catch (error) {
        res.status(500).json({message:error.message})
    }
}