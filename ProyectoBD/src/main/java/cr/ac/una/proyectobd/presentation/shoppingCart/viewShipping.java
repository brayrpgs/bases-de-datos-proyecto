/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JInternalFrame.java to edit this template
 */
package cr.ac.una.proyectobd.presentation.shoppingCart;

/**
 *
 * @author Carlos Orellana
 */
public class viewShipping extends javax.swing.JInternalFrame {

    /**
     * Creates new form viewShipping
     */
    public viewShipping() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jTFFechaEnvio = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jTFFechaLlegada = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        jTFPrecioEnvio2 = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        JCBXProveedores = new javax.swing.JComboBox<>();
        jCBXProvincia = new javax.swing.JComboBox<>();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jTFFechaLlegada1 = new javax.swing.JTextField();
        jBtnEliminarShipment = new javax.swing.JButton();
        jBtnCrearShipment1 = new javax.swing.JButton();
        jBtnActualizarShipment1 = new javax.swing.JButton();
        jScrollBar1 = new javax.swing.JScrollBar();

        setClosable(true);
        setIconifiable(true);
        setMaximizable(true);
        setResizable(true);
        setTitle("Gestion de Envios ");
        setToolTipText("");
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setText("Calle");
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(720, 20, 40, -1));

        jTFFechaEnvio.setText("Es la de hoy");
        getContentPane().add(jTFFechaEnvio, new org.netbeans.lib.awtextra.AbsoluteConstraints(310, 50, 90, -1));

        jLabel2.setText("Proveedor");
        getContentPane().add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 20, -1, -1));

        jLabel3.setText("Precio");
        getContentPane().add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(210, 20, -1, -1));
        getContentPane().add(jTFFechaLlegada, new org.netbeans.lib.awtextra.AbsoluteConstraints(700, 50, 110, 20));

        jLabel4.setText("Fecha Envio ");
        getContentPane().add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(320, 20, -1, -1));

        jTFPrecioEnvio2.setText("Se carga por proveedor");
        getContentPane().add(jTFPrecioEnvio2, new org.netbeans.lib.awtextra.AbsoluteConstraints(190, 50, 90, -1));

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null}
            },
            new String [] {
                "Proveedor", "Precio", "Fecha_Envio", "Fecha_Llegada", "Direccion"
            }
        ));
        jScrollPane1.setViewportView(jTable1);

        getContentPane().add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 120, 560, 210));

        JCBXProveedores.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "arrayProveedoresUtils" }));
        getContentPane().add(JCBXProveedores, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 50, -1, -1));

        jCBXProvincia.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "San Jose", "Alajuela", "Cartago", "Heredia", "Guanacaste", "Puntarenas", "Limón" }));
        getContentPane().add(jCBXProvincia, new org.netbeans.lib.awtextra.AbsoluteConstraints(570, 50, -1, -1));

        jLabel5.setText("Fecha Llegada");
        getContentPane().add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(450, 20, -1, -1));

        jLabel6.setText("Provincia");
        getContentPane().add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(590, 20, 60, -1));

        jTFFechaLlegada1.setText("se carga por proveedor");
        getContentPane().add(jTFFechaLlegada1, new org.netbeans.lib.awtextra.AbsoluteConstraints(430, 50, 110, 20));

        jBtnEliminarShipment.setText("Eliminar");
        getContentPane().add(jBtnEliminarShipment, new org.netbeans.lib.awtextra.AbsoluteConstraints(690, 250, 90, -1));

        jBtnCrearShipment1.setText("Agregar");
        getContentPane().add(jBtnCrearShipment1, new org.netbeans.lib.awtextra.AbsoluteConstraints(690, 130, 90, -1));

        jBtnActualizarShipment1.setText("Actualizar");
        getContentPane().add(jBtnActualizarShipment1, new org.netbeans.lib.awtextra.AbsoluteConstraints(690, 190, 90, -1));
        getContentPane().add(jScrollBar1, new org.netbeans.lib.awtextra.AbsoluteConstraints(840, 0, -1, 420));

        pack();
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JComboBox<String> JCBXProveedores;
    private javax.swing.JButton jBtnActualizarShipment1;
    private javax.swing.JButton jBtnCrearShipment1;
    private javax.swing.JButton jBtnEliminarShipment;
    private javax.swing.JComboBox<String> jCBXProvincia;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JScrollBar jScrollBar1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextField jTFFechaEnvio;
    private javax.swing.JTextField jTFFechaLlegada;
    private javax.swing.JTextField jTFFechaLlegada1;
    private javax.swing.JTextField jTFPrecioEnvio2;
    private javax.swing.JTable jTable1;
    // End of variables declaration//GEN-END:variables
}
