

import { Route, Routes } from "react-router-dom";
import Navbar from "./components/Navbar";

import AdminRoutes from "./routes/AdminRoutes";
import PublicRoutes from "./routes/PublicRoutes";
import {authContext} from "./context/authContext.js"

export default function App() {

    return (
        <authContext.Provider value={"false"}>  
            <Navbar/>
            <Routes>
                <Route path="/admin/*" element={
                    <AdminRoutes  />
                } />
                <Route path="*" element={<PublicRoutes />} />
                

            </Routes>
        </authContext.Provider>
    )
}
