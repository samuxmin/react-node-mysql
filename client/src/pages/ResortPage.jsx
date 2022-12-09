import { useState } from "react"
import { useEffect } from "react"
import { getResortsRequest } from "../api/resorts.api"
import Resort from "../components/Resort"

export default function ResortPage() {
  const [resorts, setResorts] = useState([])
  useEffect(()=>{
    document.title = "Resorts"
    async function getResorts (){
      let {data} = await getResortsRequest()
      setResorts(data)
    }
    getResorts()
  
  },[])
  return (
  <>
    <h1>Resorts</h1>
    {resorts.map(resort => (
      <Resort key={resort.name} {...resort} />
    ))}
  </>
  )
}
