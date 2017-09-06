package cn.com.lsq.po;

import java.util.Date;
import java.util.List;

public class Order extends Express{
    private Integer id;

    private Integer userId;

    private String ordernumber;

    private Date createtime;

    private String address;

    private Date deliverytime;

    private Date paytime;

    private Date receivingtime;

    private String trackingnumber;

    private String expressId;

    private Double expenses;

    private Double totalcost;

    private String note;

    private String state;
    
    private String ename;
    
    public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	private List<Orderdetail> orderdetaillist;
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getOrdernumber() {
        return ordernumber;
    }

    public void setOrdernumber(String ordernumber) {
        this.ordernumber = ordernumber == null ? null : ordernumber.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Date getDeliverytime() {
        return deliverytime;
    }

    public void setDeliverytime(Date deliverytime) {
        this.deliverytime = deliverytime;
    }

    public Date getPaytime() {
        return paytime;
    }

    public void setPaytime(Date paytime) {
        this.paytime = paytime;
    }

    public Date getReceivingtime() {
        return receivingtime;
    }

    public void setReceivingtime(Date receivingtime) {
        this.receivingtime = receivingtime;
    }

    public String getTrackingnumber() {
        return trackingnumber;
    }

    public void setTrackingnumber(String trackingnumber) {
        this.trackingnumber = trackingnumber == null ? null : trackingnumber.trim();
    }

    public String getExpressId() {
        return expressId;
    }

    public void setExpressId(String expressId) {
        this.expressId = expressId == null ? null : expressId.trim();
    }

    public Double getExpenses() {
        return expenses;
    }

    public void setExpenses(Double expenses) {
        this.expenses = expenses;
    }

    public Double getTotalcost() {
        return totalcost;
    }

    public void setTotalcost(Double totalcost) {
        this.totalcost = totalcost;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

	public List<Orderdetail> getOrderdetaillist() {
		return orderdetaillist;
	}

	public void setOrderdetaillist(List<Orderdetail> orderdetaillist) {
		this.orderdetaillist = orderdetaillist;
	}
    
}