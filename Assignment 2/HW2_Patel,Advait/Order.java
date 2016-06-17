
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class Order {

    String _id, username, fullname, creditcard, cvv, address1, address2, zipcode, date;
    int itemscount, orderid;
    double total;
    Collection<Order> orders;

    public synchronized Order getOrder(String id) {
        if (orders==null || orders.isEmpty()) {
            return null;
        } 
        return null;
    }
    

    public Order() {
        orders = new ArrayList();
    }

    public Collection getOrders() {
        return orders;
    }

    

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getCreditcard() {
        return creditcard;
    }

    public void setCreditcard(String creditcard) {
        this.creditcard = creditcard;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getDate() {
        return date;
    }

    public int getItemscount() {
        return itemscount;
    }

    public void setItemscount(int itemscount) {
        this.itemscount = itemscount;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    

    public String get_id() {
        return _id;
    }

}
