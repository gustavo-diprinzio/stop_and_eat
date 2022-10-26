<?php
require('fpdf/fpdf.php');
include("registro_clientes/conexion.php");


class PDF extends FPDF{
// Cabecera de página
function Header(){
    // Arial bold 15
    $this->SetFont('Arial','B',20);
    // Movernos a la derecha
    $this->Cell(80);
    // Título
    $this->Cell(30,10,'Su Ticket',0,0,'C');
    // Salto de línea
    $this->Ln(20);

    $this->Cell(50, 10, 'id_ticket' , 1, 0, 'C', 0);
    $this->Cell(80, 10, 'Fecha', 1, 0, 'C', 0);
    $this->Cell(50, 10, 'id_pedido', 1, 1, 'C', 0);
    
}

// Pie de página
function Footer(){
    // Posición: a 1,5 cm del final
    $this->SetY(-15);
    // Arial italic 8
    $this->SetFont('Arial','I',8);
    // Número de página
    $this->Cell(0,10, utf8_decode('Pagina ').$this->PageNo().'/{nb}',0,0,'C');
}
}

    $consulta = mysqli_query($conexion, "SELECT id_ticket, fecha, id_pedido FROM ticket ORDER by id_ticket DESC LIMIT 1;");
    
    $pdf = new PDF();   
    $pdf->AliasNbPages();
    $pdf->AddPage();
    $pdf->SetFont('Arial', '', 16);

    while($row = $consulta->fetch_assoc()){
        $pdf->Cell(50, 10, $row['id_ticket'], 1, 0, 'C', 0);
        $pdf->Cell(80, 10, $row['fecha'], 1, 0, 'C', 0);
        $pdf->Cell(50, 10, $row['id_pedido'], 1, 1, 'C', 0);
    }
    $pdf->Output();
?>