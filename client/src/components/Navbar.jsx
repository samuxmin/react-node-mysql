import { Link } from "react-router-dom";

export default function Navbar() {
  return (
    <div>
        <h1>Real Estate</h1>
        <ul>
            <li>
                <Link to="/resorts">Resorts</Link>
            </li>
            {/*
              <li>
                  <Link to="/createresort">Create Resort</Link>
              </li>*/}
            <li>
                <Link to="/propertyes">See all propertyes</Link>
            </li>
        </ul>
    </div>
  )
}
