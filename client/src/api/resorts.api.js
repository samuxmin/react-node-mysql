import axios from 'axios'

export const createResortRequest = async ( resort ) => 
    await axios.post('http://localhost:4000/api/resorts', resort)

export const getResortsRequest = async () =>
    await axios.get("http://localhost:4000/api/resorts")
