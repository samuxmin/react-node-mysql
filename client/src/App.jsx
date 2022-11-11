import { Route, Routes } from "react-router-dom";
import Navbar from "./components/Navbar";
import NotFound from "./pages/NotFound";
import PropertyPage from "./pages/PropertyPage";
//import ResortForm from "./pages/ResortForm";
import ResortPage from "./pages/ResortPage";
import ResortPropertyes from "./pages/ResortPropertyes";


export default function App() {

    return (
        <>  
            <Navbar/>
            <Routes>
                <Route path="/resorts" element={<ResortPage/>}/>
               {/* <Route path="/createresort" element={<ResortForm/>}/>*/}
                <Route path="/propertyes" element={<PropertyPage />} />
                <Route path="/propertyes/:resort" element={<ResortPropertyes />} />
                <Route path="*" element={<NotFound/>}/>
            </Routes>
        </>
    )
}
