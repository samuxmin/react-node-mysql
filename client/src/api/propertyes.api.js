import axios from 'axios'

export const createPropertyRequest = async ( property  ) => 
    await axios.post('http://localhost:4000/api/propertyes', property)

export const getPropertyesRequest = async () =>
    await axios.get("http://localhost:4000/api/propertyes")

export const getPropertyesByResortRequest = async (resort = "*") =>
    await axios.get("http://localhost:4000/api/propertyes/resort/"+resort)

export const getPropertyAccomodations = async (property) =>
    await axios.get(`http://localhost:4000/api/accomodations/${property}`)