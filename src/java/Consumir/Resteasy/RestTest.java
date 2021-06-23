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
 * Jersey REST client generated for REST resource:TestRestService [testApi]<br>
 * USAGE:
 * <pre>
 *        RestTest client = new RestTest();
 *        Object response = client.XXX(...);
 *        // do whatever with response
 *        client.close();
 * </pre>
 *
 * @author HP
 */
public class RestTest {
    private WebTarget webTarget;
    private Client client;
    private static final String BASE_URI = "http://localhost:8084/homeApi/rest";

    public RestTest() {
        client = javax.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI).path("testApi");
    }

    public String addCuestionario(String Cuestionario, String Alumno, String Puntaje) throws ClientErrorException {
        return webTarget.path(java.text.MessageFormat.format("cuestionario/{0}/alumno/{1}/puntos/{2}", new Object[]{Cuestionario, Alumno, Puntaje})).request().post(null, String.class);
    }

    public void updatePuntaje(String idPregunta, String idAlumno, String Puntaje) throws ClientErrorException {
        webTarget.path(java.text.MessageFormat.format("pregunta/{0}/alumno/{1}/puntos/{2}", new Object[]{idPregunta, idAlumno, Puntaje})).request().put(null);
    }

    public <T> T getWebTest(Class<T> responseType, String Cuestionario) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("webtest/{0}", new Object[]{Cuestionario}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public String addPregunta(String Pregunta, String Alumno, String Puntaje) throws ClientErrorException {
        return webTarget.path(java.text.MessageFormat.format("pregunta/{0}/alumno/{1}/puntos/{2}", new Object[]{Pregunta, Alumno, Puntaje})).request().post(null, String.class);
    }

    public <T> T getTestRecover(Class<T> responseType, String Cuestionario, String Alumno) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("test/{0}/alumno/{1}", new Object[]{Cuestionario, Alumno}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public String addRtaMarcadas(String Alumno, String Rta) throws ClientErrorException {
        return webTarget.path(java.text.MessageFormat.format("alumno/{0}/rta/{1}", new Object[]{Alumno, Rta})).request().post(null, String.class);
    }

    public <T> T getTest(Class<T> responseType, String Cuestionario) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("test/{0}", new Object[]{Cuestionario}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public void close() {
        client.close();
    }
    
}
