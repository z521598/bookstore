package cn.com.lsq.po;

import java.util.Date;

public class User {
    private Integer id;

    private String password;

    private String name;

    private String idcard;

    private String sex;

    private Date birthday;

    private String homephone;

    private String email;

    private String phonenumber;

    private String firstaddress;

    private String secondaddress;

    private String thirdaddress;

    private Boolean isvip;

    private Date registrationtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getHomephone() {
        return homephone;
    }

    public void setHomephone(String homephone) {
        this.homephone = homephone == null ? null : homephone.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber == null ? null : phonenumber.trim();
    }

    public String getFirstaddress() {
        return firstaddress;
    }

    public void setFirstaddress(String firstaddress) {
        this.firstaddress = firstaddress == null ? null : firstaddress.trim();
    }

    public String getSecondaddress() {
        return secondaddress;
    }

    public void setSecondaddress(String secondaddress) {
        this.secondaddress = secondaddress == null ? null : secondaddress.trim();
    }

    public String getThirdaddress() {
        return thirdaddress;
    }

    public void setThirdaddress(String thirdaddress) {
        this.thirdaddress = thirdaddress == null ? null : thirdaddress.trim();
    }

    public Boolean getIsvip() {
        return isvip;
    }

    public void setIsvip(Boolean isvip) {
        this.isvip = isvip;
    }

    public Date getRegistrationtime() {
        return registrationtime;
    }

    public void setRegistrationtime(Date registrationtime) {
        this.registrationtime = registrationtime;
    }
}