import { Route, Routes } from "react-router-dom";
import Navbar from "./components/Navbar";
import NotFound from "./pages/NotFound";
import PatientForm from "./pages/PatientForm";
import PatientPage from "./pages/PatientPage";

export default function App() {
    return (
        <>  
            <Navbar/>
            <Routes>
                <Route path="/" element={<PatientPage/>}/>
                <Route path="/new" element={<PatientForm/>}/>
                <Route path="*" element={<NotFound/>}/>
            </Routes>
        </>
    )
}
