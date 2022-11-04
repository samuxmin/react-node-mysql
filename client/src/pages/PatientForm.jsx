import { useForm } from "../hooks/useForm.js"
import { createPatientRequest } from "../api/patients.api.js"
export default function PatientForm() {
    const initialValues = {
        ci:"",
        register: "",
        bedNum: "",
        name: "",
        direction:"",
        birth: "",
        sex:""
    }
    const [values, handleChange, reset] = useForm(initialValues)
    const {ci,register,bedNum,name,direction,birth,sex} = values
    let isSubmitting = false
  return (
        <div>
           <form onSubmit={
                async (e)=>{
                    isSubmitting = true
                    e.preventDefault()
                    try {
                        const response = await createPatientRequest({
                            ci,
                            registro:register,
                            nroCama:bedNum,
                            nombre:name,
                            direccion:direction,
                            fechaNac:birth,
                            sexo:sex
                        })
                    } catch (error) {
                        console.error(error.message)
                    }
                    isSubmitting = false
                    reset()
                }
           }>
                <label>CI</label>
                <input type="number" name="ci" value={ci} onChange={handleChange} />

                <label>Register number</label>
                <input type="number" name="register" value={register} onChange={handleChange} />

                <label>Bed number</label>
                <input type="number" name="bedNum" value={bedNum} onChange={handleChange} />

                <label>Name</label>
                <input type="text" name="name" value={name} onChange={handleChange} />

                <label>Direction</label>
                <input type="text" name="direction" value={direction} onChange={handleChange} />

                <label>Birth date</label>
                <input type="date" name="birth" value={birth} onChange={handleChange} />

                <label>Sex</label>
                <input type="radio" name="sex" value="M" onChange={handleChange} />Male
                <input type="radio" name="sex" value="F" onChange={handleChange} />Female

                <button type="reset" onClick={reset}>Reset</button>
                <button className="submit" type="submit" disabled={isSubmitting}>Save patient</button>
            </form>
    </div>
    )
  
}
