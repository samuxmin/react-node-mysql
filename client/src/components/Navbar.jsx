import { Link } from "react-router-dom";
import './navbar.css'

export default function Navbar() {
  return (
    <div className="navbar">
        <ul>
          <li>
            <Link to="/"><h1>Real Estate</h1></Link>
          </li>
            <li className="page-link">
                <Link to="/resorts">Resorts</Link>
            </li>
            {/*
              <li>
                  <Link to="/createresort">Create Resort</Link>
              </li>*/}
            <li className="page-link">
                <Link to="/propertyes">All propertyes</Link>
            </li>
        </ul>
    </div>
  )
}
