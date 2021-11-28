package bostonBakedBeans;

import java.io.Serializable;
import java.io.*;
import java.net.URL;
import java.sql.*;
import oracle.jdbc.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserList implements Serializable {
	private int userID;
	private String lastName;
	private String firstName;
	private String email;
	private String user;
	private String pass;
	private String card;
	
	public UserList()
	{
		userID=0;
		lastName = "";
		firstName = "";
		email = "";
		user = "";
		pass = "";
		card = "";
	}
	
	public int getID()
	{
		return userID;
	}
	
	public void setID(int userID)
	{
		this.userID=userID;
	}
	
	public String getLastName()
	{
		return lastName;
	}
	
	public void setLastName(String lastName)
	{
		this.lastName = lastName;
	}
	
	public String getFirstName()
	{
		return firstName;
	}
	
	public void setFirstName(String firstName)
	{
		this.firstName = firstName;
	}
	
	public String getEmail()
	{
		return email;
	}
	
	public void setEmail(String email)
	{
		this.email = email;
	}
	
	public String getUser()
	{
		return user;
	}
	
	public void setUser(String user)
	{
		this.user = user;
	}
	
	public String getPass()
	{
		return pass;
	}
	
	public void setPass(String pass)
	{
		this.pass = pass;
	}
	
	public String getCard()
	{
		return card;
	}
	
	public void setCard(String card)
	{
		this.card = card;
	}
	
	public static void update(UserList request, Connection con)
	{
		try
		{
			PreparedStatement tc = con.prepareStatement("INSERT INTO TRAIN_CUSTOMER VALUES(?,?,?,?,?,?)");
			tc.setString(1, request.getLastName());
			tc.setString(2, request.getFirstName());
			tc.setString(3, request.getEmail());
			tc.setString(4, request.getUser());
			tc.setString(5, request.getPass());
			tc.setString(6, request.getCard());
			tc.execute();
			tc.close();		
			
			Statement stmtInsert = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
										  ResultSet.CONCUR_UPDATABLE);
		
		}
		catch(Exception ex)
		{
		}
	}
	
	public ResultSet res(Connection con)
	{
		ResultSet cust = null;
		try
		{
			Statement select = con.createStatement();
			cust = select.executeQuery("SELECT * FROM TRAIN_CUSTOMER");
			return cust;
		}
		catch(Exception ex)
		{
			return cust;
		}
	}
}
	