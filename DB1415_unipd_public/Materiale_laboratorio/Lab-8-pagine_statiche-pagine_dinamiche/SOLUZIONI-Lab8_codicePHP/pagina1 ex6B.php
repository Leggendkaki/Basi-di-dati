<?php
    require("library.php");
    
    page_start("Esercitazione di Basi di Dati - Selezione");
    
    
    /* Si connette e seleziona il database (da cambiare con il proprio login) */
    $dbname="acompagn-ES";
    $conn=dbConnect($dbname);
    
    echo<<<END
    <form action="pagina1_ex6B.php" method="get">
    <fieldset style="width:16em;">
    <input type="text" name="age" />
    <input type="submit" value="Vai!" />
    </fieldset>
    </form>
    END;
    
    if (isset($_REQUEST["age"])){
        /* esegue la query che seleziona tutte le persone ... */
        $fuck=$_REQUEST["age"];
        $query="SELECT * FROM Persone WHERE Eta=\"$fuck\"";
        $result=mysql_query($query, $conn)
        or die("Query fallita!" . mysql_error());
        
        /* e le visualizza in una tabella, dove il primo campo e` un radio
         button di una form */
        
        /* inizia la form */
        echo<<<END
        <form action="pagina2_ex6A.php" method="get">
        <fieldset style="width:16em;">
        END;
        $table_head =  array(".", "Id","Nome","Reddito","Eta","Sesso");
        table_start($table_head);
        
        while ($row = mysql_fetch_row($result)) {
            $radio[0]="<input type=\"checkbox\" name=\"Id[]\" value=\"$row[0]\" />";
            table_row(array_merge($radio,$row));
        }
        
        table_end();
        
        echo<<<END
        <br />
        <input type="submit" value="Vai!" />
        </fieldset>
        </form>
        END;
    }
    page_end();
    ?>

