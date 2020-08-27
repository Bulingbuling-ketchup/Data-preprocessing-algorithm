
%% Health condition sample generation
clear all
clc
figname={'K001','K002','K003','K004','K005','K006'}
for jk = 1:length(figname)

    for i = 1:20;
        filename=strcat('E:\Paderborn_dataset\H\',figname(jk),'\N15_M07_F10_',figname(jk),'_',num2str(i),'.mat');
        filename=filename{1};
        load (filename);
        eval(['a = N15_M07_F10_',char(figname(jk)),'_',num2str(i),'.Y(7).Data;']);

        % outlier elimination
        aa=mean(a);
        sig=std(a);
        m=zeros(1,length(a));
        k=1;
        for t=1:length(a)
            m(t)=abs(a(t)-aa);
            if m(t)>=3*sig
                c(t)=aa;
                num(k)=a(t);
                k=k+1;
            else
                c(t)=a(t);
            end
        end

        eval(['a',num2str(i),'=c;']);

    end

    mkdir('Load4(150710)\Health\',figname{jk});
num_samples = 50;
for j = 1:1000
    i=ceil(j/50)
    eval(['resampleing = floor(((length(a',num2str(i),')-4096)/(num_samples-1+20)));']);
    eval( ['Fault_data(j,:) = a',num2str(i),'(1,1+(j-(i-1)*50-1)*resampleing:(j-(i-1)*50-1)*resampleing+4096);'] );
end
    seed = randperm(num_samples*20);
    Fault_random = Fault_data(seed,:);
    for i=1:num_samples*20
        mat=reshape(Fault_random(i,:),[64,64]);
        d=mapminmax(mat,0,1);
        imwrite(d,['Load4(150710)\Health\',figname{jk},'\Pdb_H_',figname{jk},'_L4_',num2str(i),'.jpg']);

    end
end
%% InnerRace fault condition sample generation
clear all
clc
figname={'KI01','KI03','KI04','KI05','KI07','KI08','KI14','KI16','KI17','KI18','KI21'}
for jk = 1:length(figname)

    for i = 1:20;
        filename=strcat('E:\Paderborn_dataset\IR\',figname(jk),'\N15_M07_F10_',figname(jk),'_',num2str(i),'.mat');
        filename=filename{1};
        load (filename);
        eval(['a = N15_M07_F10_',char(figname(jk)),'_',num2str(i),'.Y(7).Data;']);

        % outlier elimination
        aa=mean(a);
        sig=std(a);
        m=zeros(1,length(a));
        k=1;
        for t=1:length(a)
            m(t)=abs(a(t)-aa);
            if m(t)>=3*sig
                c(t)=aa;
                num(k)=a(t);
                k=k+1;
            else
                c(t)=a(t);
            end
        end

        eval(['a',num2str(i),'=c;']);

    end

    mkdir('Load4(150710)\InnerRace\',figname{jk});
num_samples = 50;
for j = 1:1000
    i=ceil(j/50)
    eval(['resampleing = floor(((length(a',num2str(i),')-4096)/(num_samples-1+20)));']);
    eval( ['Fault_data(j,:) = a',num2str(i),'(1,1+(j-(i-1)*50-1)*resampleing:(j-(i-1)*50-1)*resampleing+4096);'] );
end
    seed = randperm(num_samples*20);
    Fault_random = Fault_data(seed,:);
    for i=1:num_samples*20
        mat=reshape(Fault_random(i,:),[64,64]);
        d=mapminmax(mat,0,1);
        imwrite(d,['Load4(150710)\InnerRace\',figname{jk},'\Pdb_IR_',figname{jk},'_L4_',num2str(i),'.jpg']);

    end
end

%% OuterRace fault condition sample generation
clear all
clc
figname={'KA01','KA03','KA04','KA05','KA06','KA07','KA08','KA09','KA15','KA16','KA22','KA30'}
for jk = 1:length(figname)

    for i = 1:20;
        filename=strcat('E:\Paderborn_dataset\dataset\OR\',figname(jk),'\N15_M07_F10_',figname(jk),'_',num2str(i),'.mat');
        filename=filename{1};
        load (filename);
        eval(['a = N15_M07_F10_',char(figname(jk)),'_',num2str(i),'.Y(7).Data;']);

        % outlier elimination
        aa=mean(a);
        sig=std(a);
        m=zeros(1,length(a));
        k=1;
        for t=1:length(a)
            m(t)=abs(a(t)-aa);
            if m(t)>=3*sig
                c(t)=aa;
                num(k)=a(t);
                k=k+1;
            else
                c(t)=a(t);
            end
        end

        eval(['a',num2str(i),'=c;']);

    end

    mkdir('Load4(150710)\OuterRace\',figname{jk});
num_samples = 50;
for j = 1:1000
    i=ceil(j/50)
    eval(['resampleing = floor(((length(a',num2str(i),')-4096)/(num_samples-1+20)));']);
    eval( ['Fault_data(j,:) = a',num2str(i),'(1,1+(j-(i-1)*50-1)*resampleing:(j-(i-1)*50-1)*resampleing+4096);'] );
end
    seed = randperm(num_samples*20);
    Fault_random = Fault_data(seed,:);
    for i=1:num_samples*20
        mat=reshape(Fault_random(i,:),[64,64]);
        d=mapminmax(mat,0,1);
        imwrite(d,['Load4(150710)\OuterRace\',figname{jk},'\Pdb_OR_',figname{jk},'_L4_',num2str(i),'.jpg']);

    end
end







