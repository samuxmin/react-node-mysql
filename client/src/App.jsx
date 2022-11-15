import { Route, Routes } from "react-router-dom";
import Navbar from "./components/Navbar";
import NotFound from "./pages/NotFound";
import PropertyPage from "./pages/PropertyPage";
//import ResortForm from "./pages/ResortForm";
import ResortPage from "./pages/ResortPage";
import ResortPropertyes from "./pages/ResortPropertyes";
import AdminRoutes from "./routes/AdminRoutes";
import PublicRoutes from "./routes/PublicRoutes";

let admin = true

export default function App() {

    return (
        <>  
            <Navbar/>
            <Routes>
                <Route path="/admin" element={
                    <AdminRoutes  isAuth={admin} component={<>Soy admin</>}/>
                } />
                <Route path="/" element={<PublicRoutes />}>
                    <Route index element={<ResortPage/>}/>
                    <Route path="resorts" element={<ResortPage/>}/>
                    <Route path="propertyes" element={<PropertyPage />} />
                    <Route path="propertyes/:resort" element={<ResortPropertyes />} />
                    <Route path="*" element={<NotFound/>}/>
                </Route>
                

            </Routes>
        </>
    )
}
