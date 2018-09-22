package com.wei.q.domain;

public class User1 {
    public String username;
    public String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User1{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
