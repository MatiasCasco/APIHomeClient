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
 * Jersey REST client generated for REST resource:CuestionarioRestService
 * [/cuestionarioApi]<br>
 * USAGE:
 * <pre>
 *        RestCuestionario client = new RestCuestionario();
 *        Object response = client.XXX(...);
 *        // do whatever with response
 *        client.close();
 * </pre>
 *
 * @author User
 */
public class RestCuestionario {
    private WebTarget webTarget;
    private Client client;
    private static final String BASE_URI = "http://localhost:8084/homeApi/rest";

    public RestCuestionario() {
        client = javax.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI).path("cuestionarioApi");
    }

    public <T> T addCuestionario(Object requestEntity, Class<T> responseType) throws ClientErrorException {
        return webTarget.path("cuestionario").request(javax.ws.rs.core.MediaType.APPLICATION_JSON).post(javax.ws.rs.client.Entity.entity(requestEntity, javax.ws.rs.core.MediaType.APPLICATION_JSON), responseType);
    }

    public void updateCuestionario(Object requestEntity) throws ClientErrorException {
        webTarget.path("cuestionario").request(javax.ws.rs.core.MediaType.APPLICATION_JSON).put(javax.ws.rs.client.Entity.entity(requestEntity, javax.ws.rs.core.MediaType.APPLICATION_JSON));
    }

    public void removeCuestionario(String id) throws ClientErrorException {
        webTarget.path(java.text.MessageFormat.format("cuestionario/{0}", new Object[]{id})).request().delete();
    }

    public <T> T getCuestionarios(Class<T> responseType) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path("cuestionarios");
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getCuestionariosOfCurso(Class<T> responseType, String curso) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("cuestionariosOFCurso/{0}", new Object[]{curso}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getCuestionariosOFmateria(Class<T> responseType, String materia) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("cuestionariosOFmateria/{0}", new Object[]{materia}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getCuestionario(Class<T> responseType, String id) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("cuestionario/{0}", new Object[]{id}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getCuestionariosOfCursoAndMateria(Class<T> responseType, String cursoName, String materiaName) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("cursoName/{0}/materiaName/{1}", new Object[]{cursoName, materiaName}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public void close() {
        client.close();
    }
    
}
