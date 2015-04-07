function [  ] = PlotStickman( q,qpto,qptopto,sq,ghost )
% Faz plot do stickman

clf;                                             % Força o aparecimento de gráficos pendentes e apaga a frame anterior 
hold on;
axis([-1.0 2.5 -0.1 2.1]);                                % Computa a tela de trabalho e determina-a como quadrada
line([-1.0 2.5],[-0.04 -0.04],'Color','k','LineWidth',3);

screen_size = get(0, 'ScreenSize');
set(figure(1), 'Position', [15 50 (screen_size(3)-25) (screen_size(4)-135)] );

x=zeros(26,1);
y=zeros(26,1);

        for k=1:26
            x(k,1)=q(k*2-1);
            y(k,1)=q(k*2);
        end

        xpto=zeros(26,1);
    ypto=zeros(26,1);
        for k=1:26
            xpto(k,1)=qpto(k*2-1);
            ypto(k,1)=qpto(k*2);
        end
           xptopto=zeros(26,1);
    yptopto=zeros(26,1);
        for k=1:26
            xptopto(k,1)=qptopto(k*2-1);
            yptopto(k,1)=qptopto(k*2);
        end
       
      if ghost==1  
        xq=zeros(26,1);
 yq=zeros(26,1);
        for k=1:26
            xq(k,1)=sq(k*2-1)*10^-3;
            yq(k,1)=sq(k*2)*10^-3;
        end
         plot(xq,yq,'o','MarkerEdgeColor',[0 1 0],'MarkerFaceColor',[0 0.8 0],'MarkerSize',5);
         
      end
 
        plot(x,y,'o','MarkerEdgeColor',[0 0 1],'MarkerFaceColor',[0 0 0.8],'MarkerSize',5)  % Apresenta na tela de trabalho os pontos 

       
        
        line([q(1) q(5)], [q(2) q(6)],'Color','k');          % Pescoço
        line([q(7) q(17)], [q(8) q(18)],'Color','k');        % Braço esquerdo
        line([q(19) q(21)], [q(20) q(22)],'Color','k');      % Antebraço esquerdo
        line([q(3) q(11)], [q(4) q(12)],'Color','k');        % Braço direito
        line([q(13) q(15)], [q(14) q(16)],'Color','k');      % Antebraço direito
        line([q(9) q(25)], [q(10) q(26)],'Color','k');       % Tronco
        line([q(23) q(29)], [q(24) q(30)],'Color','k');      % Coxa direita
        line([q(31) q(33)], [q(32) q(34)],'Color','k');      % Perna direita
        line([q(27) q(41)], [q(28) q(42)],'Color','k');      % Coxa esquerda
        line([q(43) q(45)], [q(44) q(46)],'Color','k');      % Perna esquerda
        line([q(35) q(37)], [q(36) q(38)],'Color','k');      % Calcanhar direito
        line([q(37) q(39)], [q(38) q(40)],'Color','k');      % Planta do pé direito
        line([q(39) q(35)], [q(40) q(36)],'Color','k');      % Peito do pé direito
        line([q(47) q(49)], [q(48) q(50)],'Color','k');      % Calcanhar esquerdo
        line([q(49) q(51)], [q(50) q(52)],'Color','k');      % Planta do pé esquerdo
        line([q(51) q(47)], [q(52) q(48)],'Color','k');      % Peito do pé esquerdo
        
        if ghost ==1
        line([xq(1) xq(3)], [yq(1) yq(3)],'Color','g');          % Pescoço
        line([xq(4) xq(9)], [yq(4) yq(9)],'Color','g');        % Braço esquerdo
        line([xq(10) xq(11)], [yq(10) yq(11)],'Color','g');      % Antebraço esquerdo
        line([xq(2) xq(6)], [yq(2) yq(6)],'Color','g');        % Braço direito
        line([xq(7) xq(8)], [yq(7) yq(8)],'Color','g');      % Antebraço direito
        line([xq(5) xq(13)], [yq(5) yq(13)],'Color','g');       % Tronco
        line([xq(12) xq(15)], [yq(12) yq(15)],'Color','g');      % Coxa direita
        line([xq(16) xq(17)], [yq(16) yq(17)],'Color','g');      % Perna direita
        line([xq(14) xq(21)], [yq(14) yq(21)],'Color','g');      % Coxa esquerda
        line([xq(22) xq(23)], [yq(22) yq(23)],'Color','g');      % Perna esquerda
        line([xq(18) xq(19)], [yq(18) yq(19)],'Color','g');      % Calcanhar direito
        line([xq(19) xq(20)], [yq(19) yq(20)],'Color','g');      % Planta do pé direito
        line([xq(20) xq(18)], [yq(20) yq(18)],'Color','g');      % Peito do pé direito
        line([xq(24) xq(25)], [yq(24) yq(25)],'Color','g');      % Calcanhar esquerdo
        line([xq(25) xq(26)], [yq(25) yq(26)],'Color','g');      % Planta do pé esquerdo
        line([xq(26) xq(24)], [yq(26) yq(24)],'Color','g');      % Peito do pé esquerdo
        end
        
         

%         mov = getframe;
%         writeVideo(vidobj,mov);

        title('Positions Gait Cycle');
        xlabel('x (meters)');
        ylabel('y (meters)');
        hold off;
        drawnow;
        %Dimensiona a janela para fullscreen        

 
end



