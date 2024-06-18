/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package model;

import java.sql.Connection;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author levin
 */
public class ApoderadoTest {
    
    public ApoderadoTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }


    /**
     * Test of esDniValido method, of class Apoderado.
     */
    @Test
    public void testEsDniValido() {
        System.out.println("esDniValido");
        String dni = "1234567";
        Apoderado instance = new Apoderado();
        boolean expResult = false;
        boolean result = instance.esDniValido(dni);
        if(expResult != result)
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of esApPaternoValido method, of class Apoderado.
     */
    @Test
    public void testEsApPaternoValido() {
        System.out.println("esApPaternoValido");
        String apPaterno = "Romero Hurtado2";
        Apoderado instance = new Apoderado();
        boolean expResult = false;
        boolean result = instance.esApPaternoValido(apPaterno);
        if(expResult != result)
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of esApMaternoValido method, of class Apoderado.
     */
    @Test
    public void testEsApMaternoValido() {
        System.out.println("esApMaternoValido");
        String apMaterno = "Romero Hurtado2";
        Apoderado instance = new Apoderado();
        boolean expResult = false;
        boolean result = instance.esApMaternoValido(apMaterno);
        if(expResult != result)
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of esNombresValido method, of class Apoderado.
     */
    @Test
    public void testEsNombresValido() {
        System.out.println("esNombresValido");
        String nombres = "Coco Hipólito";
        Apoderado instance = new Apoderado();
        boolean expResult = true;
        boolean result = instance.esNombresValido(nombres);
        if(expResult != result)
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    
    
}
