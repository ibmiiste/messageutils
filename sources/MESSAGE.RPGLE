**FREE

ctl-opt nomain;

/copy message_h

//--------------------------------------------------
// Nom de la procédure: throwMessage
// Objectif: Envoyé un message à la file de message du programme
// Retourne:
// Paramètre: id => Identificateur du message
// Paramètre: file => Nom du fichier qualifié qui contient le message
// Paramètre: data => Les données du message
// Paramètre: length => Longueur des données du message
// Paramètre: type => Type du message
// Paramètre: callStack => La pile d'appel
// Paramètre: callStackCtr => Le nombre de ligne de la pile d'appel
// Paramètre: key => La clé du message
// Paramètre: errorForAPI => La structure d'erreur pour l'API
// --------------------------------------------------   
DCL-PROC throwMessage EXPORT;

    DCL-PI *n;
        id char(7) const;
        dataIn varchar(3000) const options(*Omit:*NoPass);
        gfileIn char(10) const options(*NoPass);
        libIn char(10) const options(*NoPass);
    END-PI;

    select;
        when %parms() = %parmnum(libIn);
            msg_send(id:dataIn:'*ESCAPE':gfileIn:libIn:2);
        when %parms() = %parmnum(gfileIn);
            msg_send(id:dataIn:'*ESCAPE':gfileIn:*blanks:2);
        when %parms() = %parmnum(dataIn) and %addr(dataIn) <> *Null;
            if %subst(id:1:3) = 'BAS';
                msg_send(id:dataIn:'*ESCAPE':'BASMSG':*blanks:2);
            else;
                msg_send(id:dataIn:'*ESCAPE':'QCPFMSG':*blanks:2);
            endif;
        other;
            if %subst(id:1:3) = 'BAS';
                msg_send(id:*omit:'*ESCAPE':'BASMSG':*blanks:2);
            else;
                msg_send(id:*omit:'*ESCAPE':'QCPFMSG':*blanks:2);
            endif;
    endsl;

END-PROC;   
