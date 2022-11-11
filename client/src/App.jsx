import axios from "axios";
import { Route, Routes, useParams } from "react-router-dom";
import Navbar from "./components/Navbar";
import NotFound from "./pages/NotFound";
import ResortForm from "./pages/ResortForm";
import ResortPage from "./pages/ResortPage";

function Child(){
    let {resort} = useParams()
    console.log(resort)
    return <h1>{resort ? resort : "XDDD"}</h1>
}
export default function App() {
/*     let test = async () => {
        let result = await axios.get("localhost:4000/api/propertyes/resort/Playa Hermosa")
    }
    test() */
    return (
        <>  
            <Navbar/>
            <Routes>
                <Route path="/" element={<ResortPage/>}/>
                <Route path="/new" element={<ResortForm/>}/>
                <Route path="/propertyes/:resort" element={<Child />} />
                <Route path="*" element={<NotFound/>}/>
            </Routes>
        </>
    )
}
