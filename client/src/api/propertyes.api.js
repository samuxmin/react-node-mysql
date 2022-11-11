import axios from 'axios'

export const createPropertyRequest = async ( resort ) => 
    await axios.post('http://localhost:4000/api/resorts', resort)

export const getPropertyesRequest = async () =>
    await axios.get("http://localhost:4000/api/resorts")
