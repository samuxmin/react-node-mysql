import React from 'react'
import { Link } from "react-router-dom";

export default function Resort({name, description, location}) {
  return (
    <div>        
        <h2>{name}</h2>
        <p>{description}</p>
        <p>Located in: {location}</p>
        <Link to={`/propertyes/${name}`}>See propertyes</Link>
    </div>
  )
}
