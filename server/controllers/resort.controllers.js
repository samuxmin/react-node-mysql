import {pool} from "../db.js"
export const getResorts = async (req, res) =>{
    try {
        const [result] = await pool.query("SELECT * FROM resort")
        res.json(result)
    } catch (error) {
        res.status(500).json({message:error.message})
    }
}

export const getResort = async (req, res) =>{
    try {
        const [result] = await pool.query("SELECT * from resort where name = ?", [req.params.name])
        if(result.length === 0){
            return res.status(404).json({message: "Resort not found"})
        }
        res.json(result[0])
    } catch (error) {
        res.status(500).json({message:error.message})
    }
}

export const createResort = async (req, res) =>{
    try {
        const resort = req.body
        const [result] = await pool.query('INSERT INTO resort SET ?', resort)
        console.log(result)
        res.json(result)
    } catch (error) {
        res.status(500).json({message:error.message})
    }
}

export const updateResort = async (req, res) =>{
    try {
        let resort = req.body
        const [result] = await pool.query("UPDATE resort SET ? WHERE name = ?",[resort, req.params.name])
        res.status(200).json(result)
    } catch (error) {
        res.status(500).json({message:error.message})
    }
}

export const deleteResort = async (req, res) =>{
    try {
        const name = req.params.name
        const [result] = await pool.query("DELETE FROM resort WHERE name = ?",[name])
        console.log(result)
        if(result.affectedRows === 0){
            return res.status(404).json({message: "Resort not found"})
        }
        return res.sendStatus(204)
    } catch (error) {
        res.status(500).json({message:error.message})
    }
}