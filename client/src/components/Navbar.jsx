import { Link } from "react-router-dom";

export default function Navbar() {
  return (
    <div>
        <h1>Real Estate</h1>
        <ul>
            <li>
                <Link to="/">Home</Link>
            </li>
            <li>
                <Link to="/new">New</Link>
            </li>
        </ul>
    </div>
  )
}
