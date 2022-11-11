import {pool} from "../db.js"
export const getPropertyes = async (req, res) =>{
    try {
        if(req.params.resort){
            const [result] = await pool.query("SELECT * from property where resort_name = ? order by price desc", [req.params.resort])
            res.json(result)
        }else{
            const [result] = await pool.query("SELECT * FROM property order by resort_name, price desc")
            res.json(result)
        }
        
    } catch (error) {
        res.status(500).json({message:error.message})
    }
}

export const getProperty = async (req, res) =>{
    try {
        const [result] = await pool.query("SELECT * from property where property_code = ?", [req.params.code])
        if(result.length === 0){
            return res.status(404).json({message: "Property not found"})
        }
        res.json(result[0])
    } catch (error) {
        res.status(500).json({message:error.message})
    }
}

export const createProperty = async (req, res) =>{
    try {
        const property = req.body
        const [result] = await pool.query('INSERT INTO property SET ?', property)
        console.log(result)
        res.json(result)
    } catch (error) {
        res.status(500).json({message:error.message})
    }
}

export const updateProperty = async (req, res) =>{
    try {
        let property = req.body
        const [result] = await pool.query("UPDATE property SET ? WHERE property_code = ?",[property, req.params.code])
        res.status(200).json(result)
    } catch (error) {
        res.status(500).json({message:error.message})
    }
}

export const deleteProperty = async (req, res) =>{
    try {
        const [result] = await pool.query("DELETE FROM property WHERE property_code = ?",[req.params.code])
        console.log(result)
        if(result.affectedRows === 0){
            return res.status(404).json({message: "Property not found"})
        }
        return res.sendStatus(204)
    } catch (error) {
        res.status(500).json({message:error.message})
    }
}

export const getPropertyFromResort = async (req, res) => {
    try {
        const [result] = await pool.query("SELECT * from property where resort_name = ?", [req.params.resort])
        res.json(result[0])
    } catch (error) {
        res.status(500).json({message:error.message})
    }
}