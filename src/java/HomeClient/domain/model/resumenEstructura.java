/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HomeClient.domain.model;

import java.util.List;

/**
 *
 * @author User
 */
public class resumenEstructura {
    private String type;
    private String name;
    List data;

    public resumenEstructura() {
    }

    public resumenEstructura(String type, String name, List data) {
        this.type = type;
        this.name = name;
        this.data = data;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List getData() {
        return data;
    }

    public void setData(List data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return new StringBuilder("{type: ").append(type)
                .append(", name: ").append(name)
                .append(", data: ").append(data)
                .append("}").toString();
    }
}