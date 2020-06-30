DELIMITER $$

    CREATE FUNCTION transformaEmIntervalo( hora_entrega TIME ) 
    RETURNS varchar(20)

    BEGIN
        DECLARE hora varchar(20);
        
        IF (hora_entrega < '20:00:00') THEN
        SET hora = 'Inicio';
        

        ELSEIF (hora_entrega>='20:00:00' AND hora_entrega<'22:00:00') THEN
        SET hora = 'Pico';

        ELSE
        SET hora = 'Fim';
        END IF;

        RETURN hora;
    END;
$$


SELECT transformaEmIntervalo(pedidos_full.hora_pedido) from pedidos_full