/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package model;

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
public class EstudianteTest {
    
    public EstudianteTest() {
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

    
    @Test
    public void testEsDniValido() {
        System.out.println("esDniValido");
        String dni = "123456789";
        Estudiante instance = new Estudiante();
        boolean expResult = true;
        boolean result = instance.esDniValido(dni);
        if(expResult != result)
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of esApPaternoValido method, of class Estudiante.
     */
    @Test
    public void testEsApPaternoValido() {
        System.out.println("esApPaternoValido");
        String apPaterno = "Gonzales 2 Gómez";
        Estudiante instance = new Estudiante();
        boolean expResult = false;
        boolean result = instance.esApPaternoValido(apPaterno);
        if(expResult != result)
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of esApMaternoValido method, of class Estudiante.
     */
    @Test
    public void testEsApMaternoValido() {
        System.out.println("esApMaternoValido");
        String apMaterno = "Gonzales 2 Gómez";
        Estudiante instance = new Estudiante();
        boolean expResult = false;
        boolean result = instance.esApMaternoValido(apMaterno);
        if(expResult != result)
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of esNombresValido method, of class Estudiante.
     */
    @Test
    public void testEsNombresValido() {
        System.out.println("esNombresValido");
        String nombres = "Fernando Sebastián";
        Estudiante instance = new Estudiante();
        boolean expResult = true;
        boolean result = instance.esNombresValido(nombres);
        if(expResult != result)
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    
    
}
