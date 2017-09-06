package cn.com.lsq.po;

public class Express {
    private Integer id;

    private String name;

    private Double startingprice;

    private Double increasingprice;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Double getStartingprice() {
        return startingprice;
    }

    public void setStartingprice(Double startingprice) {
        this.startingprice = startingprice;
    }

    public Double getIncreasingprice() {
        return increasingprice;
    }

    public void setIncreasingprice(Double increasingprice) {
        this.increasingprice = increasingprice;
    }
}