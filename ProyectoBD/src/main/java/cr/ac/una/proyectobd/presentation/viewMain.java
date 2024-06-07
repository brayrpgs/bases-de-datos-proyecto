/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package cr.ac.una.proyectobd.presentation;

import cr.ac.una.proyectobd.utilities.initializerViews;

/**
 *
 * @author Daniel Briones
 */
public class viewMain extends javax.swing.JFrame {

    /**
     * Creates new form viewMain
     */
    public viewMain() {
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

        jMenuItem1 = new javax.swing.JMenuItem();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu1 = new javax.swing.JMenu();
        menuIClient = new javax.swing.JMenu();
        miNewClient = new javax.swing.JMenuItem();
        miUpdateClient = new javax.swing.JMenuItem();
        miGetClient = new javax.swing.JMenuItem();
        jMenuItem3 = new javax.swing.JMenuItem();
        jSeparator1 = new javax.swing.JPopupMenu.Separator();
        muIPayment = new javax.swing.JMenu();
        jSeparator2 = new javax.swing.JPopupMenu.Separator();
        muIProduct = new javax.swing.JMenu();
        miNewProduct = new javax.swing.JMenuItem();
        miGetProduct = new javax.swing.JMenuItem();
        miUpdateProduct = new javax.swing.JMenuItem();
        miDeleteProduct = new javax.swing.JMenuItem();
        jSeparator3 = new javax.swing.JPopupMenu.Separator();
        miExit = new javax.swing.JMenuItem();
        miMyAccount = new javax.swing.JMenu();
        miLogOut = new javax.swing.JMenuItem();
        miHelp = new javax.swing.JMenu();

        jMenuItem1.setText("jMenuItem1");

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Principal");

        jMenu1.setText("Archivo");

        menuIClient.setText("Cliente");

        miNewClient.setText("Nuevo cliente");
        miNewClient.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                miNewClientActionPerformed(evt);
            }
        });
        menuIClient.add(miNewClient);

        miUpdateClient.setText("Actualizar cliente");
        miUpdateClient.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                miUpdateClientActionPerformed(evt);
            }
        });
        menuIClient.add(miUpdateClient);

        miGetClient.setText("Listar clientes");
        menuIClient.add(miGetClient);

        jMenuItem3.setText("Eliminar cliente");
        menuIClient.add(jMenuItem3);

        jMenu1.add(menuIClient);
        jMenu1.add(jSeparator1);

        muIPayment.setText("Pagos");
        jMenu1.add(muIPayment);
        jMenu1.add(jSeparator2);

        muIProduct.setText("Productos");

        miNewProduct.setText("Registrar producto");
        miNewProduct.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                miNewProductActionPerformed(evt);
            }
        });
        muIProduct.add(miNewProduct);

        miGetProduct.setText("Listar productos");
        miGetProduct.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                miGetProductActionPerformed(evt);
            }
        });
        muIProduct.add(miGetProduct);

        miUpdateProduct.setText("Actualizar producto");
        miUpdateProduct.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                miUpdateProductActionPerformed(evt);
            }
        });
        muIProduct.add(miUpdateProduct);

        miDeleteProduct.setText("Eliminar producto");
        miDeleteProduct.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                miDeleteProductActionPerformed(evt);
            }
        });
        muIProduct.add(miDeleteProduct);

        jMenu1.add(muIProduct);
        jMenu1.add(jSeparator3);

        miExit.setText("Salir");
        miExit.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                miExitActionPerformed(evt);
            }
        });
        jMenu1.add(miExit);

        jMenuBar1.add(jMenu1);

        miMyAccount.setText("Mi cuenta");

        miLogOut.setText("Cerrar sesión");
        miLogOut.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                miLogOutActionPerformed(evt);
            }
        });
        miMyAccount.add(miLogOut);

        jMenuBar1.add(miMyAccount);

        miHelp.setText("Ayuda");
        jMenuBar1.add(miHelp);

        setJMenuBar(jMenuBar1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 400, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 279, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void miNewClientActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_miNewClientActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_miNewClientActionPerformed

    private void miUpdateClientActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_miUpdateClientActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_miUpdateClientActionPerformed

    private void miGetProductActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_miGetProductActionPerformed
        initializerViews.createViewListProduct();
    }//GEN-LAST:event_miGetProductActionPerformed

    private void miExitActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_miExitActionPerformed
        dispose();
        System.exit(0);
    }//GEN-LAST:event_miExitActionPerformed

    private void miNewProductActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_miNewProductActionPerformed
        initializerViews.createViewRegisterProduct();
    }//GEN-LAST:event_miNewProductActionPerformed

    private void miLogOutActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_miLogOutActionPerformed
        dispose();
        initializerViews.createViewLogin();
    }//GEN-LAST:event_miLogOutActionPerformed

    private void miUpdateProductActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_miUpdateProductActionPerformed
        initializerViews.createViewUpdateProduct(null);
    }//GEN-LAST:event_miUpdateProductActionPerformed

    private void miDeleteProductActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_miDeleteProductActionPerformed
       initializerViews.createViewDeleteProduct();
    }//GEN-LAST:event_miDeleteProductActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JMenuItem jMenuItem3;
    private javax.swing.JPopupMenu.Separator jSeparator1;
    private javax.swing.JPopupMenu.Separator jSeparator2;
    private javax.swing.JPopupMenu.Separator jSeparator3;
    private javax.swing.JMenu menuIClient;
    private javax.swing.JMenuItem miDeleteProduct;
    private javax.swing.JMenuItem miExit;
    private javax.swing.JMenuItem miGetClient;
    private javax.swing.JMenuItem miGetProduct;
    private javax.swing.JMenu miHelp;
    private javax.swing.JMenuItem miLogOut;
    private javax.swing.JMenu miMyAccount;
    private javax.swing.JMenuItem miNewClient;
    private javax.swing.JMenuItem miNewProduct;
    private javax.swing.JMenuItem miUpdateClient;
    private javax.swing.JMenuItem miUpdateProduct;
    private javax.swing.JMenu muIPayment;
    private javax.swing.JMenu muIProduct;
    // End of variables declaration//GEN-END:variables
}
