function jugar(imagen,matrix,Xcol,Ycol,Xfil,Yfil,por,buque,submarino,lancha)
    figure,imshow(imagen);
    final=false;
    tocado=false;
    Ipos=[];
    Jpos=[];
    while final==false
        while length(Ipos)==0
            promp='Introduce fila: ';
            Ipos=input(promp);
        end
        while length(Jpos)==0
            promp='Introduce columna: ';
            Jpos=input(promp);
        end
        [matrix,es2]=makeCircles(imagen,Xcol,Ycol,Xfil,Yfil,matrix,Ipos,Jpos);
        if length(find(por(:,1)==Ipos & por(:,2)==Jpos)) & es2==false
            ind=find(por(:,1)==Ipos & por(:,2)==Jpos);
            por(ind,:)=[];
            tocado=true;
            if length(por(:,1)>0)
                disp('Tocado portaaviones.')
            else
                disp('Hundido portaaviones.');
            end
        end
        if length(find(buque(:,1)==Ipos & buque(:,2)==Jpos)) & es2==false
            ind=find(buque(:,1)==Ipos & buque(:,2)==Jpos);
            buque(ind,:)=[];
            tocado=true;
            if length(buque(:,1))>0
                disp('Tocado buque.')
            else
                disp('Hundido buque.');
            end
        end
        if length(find(submarino(:,1)==Ipos & submarino(:,2)==Jpos)) & es2==false
            ind=find(submarino(:,1)==Ipos & submarino(:,2)==Jpos);
            submarino(ind,:)=[];
            tocado=true;
            if length(submarino(:,1))>0
                disp('Tocado submarino.')
            else
                disp('Hundido submarino.');
            end
        end
        if length(find(lancha(1,1)==Ipos & lancha(1,2)==Jpos)) & es2==false
            lancha=[0,0];
            tocado=true;
            disp('Hundido lancha.');
        end
        if tocado==false & es2==false
           disp('Agua.'); 
        end
        tocado=false;
        if length(por(:,1))==0 & length(submarino(:,1))==0 & length(buque(:,1))==0 & lancha(1,1)==0
            disp('Juego acabado, todos los barcos hundidos.'); 
            final=true;
        end
        pause();
        Ipos=[];
        Jpos=[];
        clc;
    end
end