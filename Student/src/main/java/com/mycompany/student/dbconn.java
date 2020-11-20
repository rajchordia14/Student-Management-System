/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.student;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author aashita
 */
public class dbconn {
    public static void main(String args[])
    {
        Connection con;
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudentManage","root","12345678");
            System.out.println("Connection Established");
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
}
