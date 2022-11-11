import { useForm } from "../hooks/useForm.js"
import { createResortRequest } from "../api/resorts.api.js"
export default function ResortForm() {
    const initialValues = {
        name:"",
        location:"",
        description:""
    }
    const [values, handleChange, reset] = useForm(initialValues)
    const {name,location,description} = values
    let isSubmitting = false
  return (
        <div>
           <form onSubmit={
                async (e)=>{
                    isSubmitting = true
                    e.preventDefault()
                    try {
                        const response = await createResortRequest(values)
                    } catch (error) {
                        console.error(error.message)
                    }
                    isSubmitting = false
                    reset()
                }
           }>
                <label>Name</label>
                <input type="text" name="name" value={name} onChange={handleChange} />

                <label>Location</label>
                <input type="text" name="location" value={location} onChange={handleChange} />

                <label>Description</label>
                <input type="text" name="description" value={description} onChange={handleChange} />

                <button type="reset" onClick={reset}>Reset</button>
                <button className="submit" type="submit" disabled={isSubmitting}>Save resort</button>
            </form>
    </div>
    )
  
}
