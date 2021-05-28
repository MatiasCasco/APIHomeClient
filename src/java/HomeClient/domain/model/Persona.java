package HomeClient.domain.model;

/**
 *
 * @author Mauricio Machuca
 */
public class Persona {
    private int id;
    private String loginName;
    private String nombre;
    private String  apellido;
    private String email;
    private int rol;
    private String descripcion;
    private String password;
    private Integer idCurso;

    public String getNombreCurso() {
        return NombreCurso;
    }

    public void setNombreCurso(String NombreCurso) {
        this.NombreCurso = NombreCurso;
    }
    private String NombreCurso;

    /**
     *
     */
   
     public Persona(Integer id, String nombre) {
         this.id=id;
         this.nombre=nombre;
        
    }

    public Persona() {
          this.id=1;
         this.nombre="";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public Persona(String nombre, String apellido, String email, int rol, String descripcion, String password, Integer id, String loginName) {
        this.id=id;
        this.loginName= loginName;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.rol = rol;
        this.descripcion = descripcion;
        this.password = password;
    }

    public Persona(String nombre, String apellido, String email, int rol, String descripcion, String password, Integer id, String loginName,Integer idCurso) {
        this.id=id;
        this.loginName= loginName;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.rol = rol;
        this.descripcion = descripcion;
        this.password = password;
        this.idCurso = idCurso;
    }

  

   
            
 
      
   
   
//////Getters

    public String getApellido() {
        return apellido;
    }

    public String getEmail() {
        return email;
    }

    public int getRol() {
        return rol;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getPassword() {
        return password;
    }

    public String getNombre() {
        return nombre;
    }

    public Integer getIdCurso() {
        return idCurso;
    }


    
    
    
    
///setters

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setRol(int rol) {
        this.rol = rol;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setIdCurso(Integer idCurso) {
        this.idCurso = idCurso;
    }

  
   
  

    
    
    

   
    

    /**
     * Overridden toString() method that return String presentation of the
     * Object
     *
     * @return
     */
    @Override
    public String toString() {
       

        return new StringBuilder("{id: ").append(id)
                .append(", nombre: ").append(nombre)
                .append(", apellido: ").append(apellido)
                .append(", email: ").append(email)
                .append(", rol: ").append(rol)
                .append(", descripcion: ").append(descripcion)
                .append(", passwd: ").append(password)
                .append(", loginName: ").append(loginName)
                .append(",idCurso").append(idCurso).append("}").toString();
    }
}
