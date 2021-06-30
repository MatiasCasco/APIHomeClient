/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Consumir.Resteasy;

import javax.ws.rs.ClientErrorException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.WebTarget;

/**
 * Jersey REST client generated for REST resource:MateriaRestService
 * [/materiaApi]<br>
 * USAGE:
 * <pre>
 *        RestMateria client = new RestMateria();
 *        Object response = client.XXX(...);
 *        // do whatever with response
 *        client.close();
 * </pre>
 *
 * @author HP
 */
public class RestMateria {
    private WebTarget webTarget;
    private Client client;
    private static final String BASE_URI = "http://localhost:8084/homeApi/rest";

    public RestMateria() {
        client = javax.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI).path("materiaApi");
    }

    public void removeMateria(String id) throws ClientErrorException {
        webTarget.path(java.text.MessageFormat.format("materia/{0}", new Object[]{id})).request().delete();
    }

    public <T> T getMateria(Class<T> responseType, String idMateria) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("materia/{0}", new Object[]{idMateria}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getMateriaInCursos(Class<T> responseType, String NameMateria) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("materias/{0}", new Object[]{NameMateria}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getMateriasReto(Class<T> responseType, String NameCurso) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("retos/{0}", new Object[]{NameCurso}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getMaterias(Class<T> responseType) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path("materias");
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public void updateMateria(Object requestEntity) throws ClientErrorException {
        webTarget.path("materia").request(javax.ws.rs.core.MediaType.APPLICATION_JSON).put(javax.ws.rs.client.Entity.entity(requestEntity, javax.ws.rs.core.MediaType.APPLICATION_JSON));
    }

    public <T> T getMateriaCurso(Class<T> responseType, String cursoN, String materiaN) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("cursoN/{0}/materiaN/{1}", new Object[]{cursoN, materiaN}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getMateriasTest(Class<T> responseType, String NameCurso) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("test/{0}", new Object[]{NameCurso}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getMateriasProfesor(Class<T> responseType, String idProfesor) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("materiasProf/{0}", new Object[]{idProfesor}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getMateriasCurso(Class<T> responseType, String NameCurso) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("materiasNameCurso/{0}", new Object[]{NameCurso}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getGraficaContenidoM(Class<T> responseType, String NameCurso) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("grafica/{0}", new Object[]{NameCurso}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T addMateria(Object requestEntity, Class<T> responseType) throws ClientErrorException {
        return webTarget.path("materia").request(javax.ws.rs.core.MediaType.APPLICATION_JSON).post(javax.ws.rs.client.Entity.entity(requestEntity, javax.ws.rs.core.MediaType.APPLICATION_JSON), responseType);
    }

    public <T> T getGraficaContenidoMXid(Class<T> responseType, String idCurso) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("grafica/idCurso/{0}", new Object[]{idCurso}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getMateriasForIdCurso(Class<T> responseType, String idCurso) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("materiasForCurso/{0}", new Object[]{idCurso}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public void close() {
        client.close();
    }
    
}
