import axios from 'axios'

export const createPatientRequest = async ( patient ) => 
    await axios.post('http://localhost:4000/api/pacientes', patient)
