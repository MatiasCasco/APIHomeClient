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
 * Jersey REST client generated for REST resource:PuntuacionRestService
 * [puntajeApi]<br>
 * USAGE:
 * <pre>
 *        RestPuntuaciones client = new RestPuntuaciones();
 *        Object response = client.XXX(...);
 *        // do whatever with response
 *        client.close();
 * </pre>
 *
 * @author HP
 */
public class RestPuntuaciones {
    private WebTarget webTarget;
    private Client client;
    private static final String BASE_URI = "http://localhost:8084/homeApi/rest";

    public RestPuntuaciones() {
        client = javax.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI).path("puntajeApi");
    }

    public <T> T getRankingGlobal(Class<T> responseType, String nameCurso, String nameMateria) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("rankingGlobal/curso/{0}/materia/{1}", new Object[]{nameCurso, nameMateria}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getResueltos(Class<T> responseType, String idAlumno) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("resueltos/{0}", new Object[]{idAlumno}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getPuntuacionesCuestionario(Class<T> responseType, String idCuestionario) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("puntuaciones/{0}", new Object[]{idCuestionario}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getRanking(Class<T> responseType, String idCuestionario) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("ranking/{0}", new Object[]{idCuestionario}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getRankingGlobalById(Class<T> responseType, String idCurso, String idMateria) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("rankingGlobal/idcurso/{0}/idmateria/{1}", new Object[]{idCurso, idMateria}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public void close() {
        client.close();
    }
    
}
