# Git Flows - Execicios

1 - Centralizado

Criar projeto com nome centralizado no Gitlab
Manter a visibilidade como privado
Marcar a opção de Iniciar com um arquivo README

Exercício:

Criar diretório git na pasta home do usuário vagrant
Criar diretório centralizado dentro da pasta git

`mkdir -p git/centralizado`

Clonar repositório centralizado em dois diretórios diferentes:
/home/vagrant/git/centralizado/alice
/home/vagrant/git/centralizado/bob

```
cd git/centralizado/
git clone http://192.168.157.100:8088/root/centralizado.git alice
git clone http://192.168.157.100:8088/root/centralizado.git bob
```

Acessar o diretório alice e verificar o status dos arquivos via git:
`git status`

Editar arquivo .git/config e inserir conteúdo abaixo:
[user]
    email = alice@target.trust
    name = Alice S.
[alias]
	hist=log -20 --pretty=format:"%C(yellow)%h%Creset\\ %C(green)%ar%C(cyan)%d\\ %Creset%s%C(yellow)\\ [%cn]" --graph --decorate --all

```
echo '
[user]
    email = alice@target.trust
    name = Alice S.
[alias]
    hist=log -20 --pretty=format:"%C(yellow)%h%Creset\\ %C(green)%ar%C(cyan)%d\\ %Creset%s%C(yellow)\\ [%cn]" --graph --decorate --all' >> .git/config
```

Criar um arquivo novo chamado alice.txt e inserir o conteúdo abaixo:
Este arquivo foi criado pela Alice, desenvolvedora de sistemas.

`echo "Este arquivo foi criado pela Alice, desenvolvedora de sistemas." > alice.txt`

Criar um segundo arquivo chamado comum.txt e inserir o conteúdo abaixo:
Este arquivo foi criado pela Alice, desenvolvedora de sistemas.

`echo "Este arquivo foi criado pela Alice, desenvolvedora de sistemas." > comum.txt`

Adicionar os arquivos no stage e comitar os arquivos no repositório local com o comentário "Primeira submissão":

```
git add .
git commit -m "Primeira submissão da Alice"
```

Validar se o commit está OK validando o status do respositório local:

`git status`

Verificar o histórico do projeto usando o comando criado usando a config do git que consta na pasta raíz do material:

`git hist`

Enviar as alterações para o repositório remoto:

`git push origin master`

Acessar projeto via gitlab e confirmar que tudo está de acordo.

Acessar o diretório bob e verificar o status dos arquivos via git:

`git status`

Editar arquivo .git/config e inserir conteúdo abaixo:
[user]
    email = bob@target.trust
    name = Bob A.
[alias]
	hist=log -20 --pretty=format:"%C(yellow)%h%Creset\\ %C(green)%ar%C(cyan)%d\\ %Creset%s%C(yellow)\\ [%cn]" --graph --decorate --all

```
echo '
[user]
    email = bob@target.trust
    name = Bob A.
[alias]
    hist=log -20 --pretty=format:"%C(yellow)%h%Creset\\ %C(green)%ar%C(cyan)%d\\ %Creset%s%C(yellow)\\ [%cn]" --graph --decorate --all' >> .git/config
```

Criar um arquivo novo chamado bob.txt e inserir o conteúdo abaixo:
Este arquivo foi criado pela Bob, desenvolvedor de sistemas.

`echo "Este arquivo foi criado pela Bob, desenvolvedor de sistemas." > bob.txt`

Criar um segundo arquivo chamado comum.txt e inserir o conteúdo abaixo:
Este arquivo foi criado pela Bob, desenvolvedor de sistemas.

`echo "Este arquivo foi criado pela Bob, desenvolvedor de sistemas." > comum.txt`

Adicionar os arquivos no stage e comitar os arquivos no repositório local com o comentário "Primeira submissão":

```
git add .
git commit -m "Primeira submissão do Bob"
```

Validar se o commit está OK validando o status do respositório local:

`git status`

Verificar o histórico do projeto usando o comando criado usando a config do git que consta na pasta raíz do material:

`git hist`

Enviar as alterações para o repositório remoto:

`git push origin master`

Um erro irá ocorrer devido a não estarmos com o nosso diretório local atualizado em relação ao repositório remoto.
Temos que atualizar a base local com o que temos no repositório remoto mas cuidando para não haver perdas nem sobreposições.
Baixar a versão atual do repositório usando a opção --rebase para organizar os commits e poder resolver os conflitos:

`git pull --rebase origin master`

Novamente temos um erro que nos indica que temos um conflito a ser resolvido no arquivo comum.txt alterado pelos dois desenvolvedores:
First, rewinding head to replay your work on top of it...
Applying: Primeira submissão do Bob
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Auto-merging comum.txt
CONFLICT (add/add): Merge conflict in comum.txt
error: Failed to merge in the changes.
Patch failed at 0001 Primeira submissão do Bob
Use 'git am --show-current-patch' to see the failed patch

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

Temos que resolver o conflito ou remover o arquivo do nosso commit para poder ter um commit limpo para o repositório central.

Acessar projeto via gitlab e confirmar que tudo está de acordo.
O comando abaixo mostar de forma bastante completa o patch que não pode ser aplicado no arquivo:

`git am --show-current-patch`

Para seguirmos adiante iremos alterar o arquivo comum.txt para conter o seguinte conteúdo:

```
echo "Este arquivo foi criado pela Alice, desenvolvedora de sistemas.
Este arquivo foi alterado pelo Bob, desenvolvedor de sistemas." > comum.txt
```

Após esta alteração iremos executar os comandos abaixo para finalizar o rebase:

```
git add .
git rebase --continue
```

Com os conflitos resolvidos visualize o histórico do projeto com o comando abaixo:

`git hist`

Se estiver tudo ok e os commits de Alice e Bob aparecerem na sequência e o comando de status mostra que está tudo OK é hora de enviar para o repositório central:

`git push`

Acessar projeto via gitlab e confirmar que tudo está de acordo.

2 - Feature branch
Criar un novo projeto chamado featurebranch
Manter a visibilidade como privado
Marcar iniciar com um arquivo README

Exercício:

Criar diretório git na pasta home do usuário vagrant
Criar diretório featurebranch dentro da pasta git

`mkdir -p git/featurebranch`

Clonar repositório featurebranch em dois diretórios diferentes:
/home/vagrant/git/featurebranch/alice
/home/vagrant/git/featurebranch/bob

```
cd git/featurebranch/
git clone http://192.168.157.100:8088/root/featurebranch.git alice
git clone http://192.168.157.100:8088/root/featurebranch.git bob
```

Acessar o diretório alice e verificar o status dos arquivos via git:

`git status`

Editar arquivo .git/config e inserir conteúdo abaixo:
[user]
    email = alice@target.trust
    name = Alice S.
[alias]
	hist=log -20 --pretty=format:"%C(yellow)%h%Creset\\ %C(green)%ar%C(cyan)%d\\ %Creset%s%C(yellow)\\ [%cn]" --graph --decorate --all

```
echo '
[user]
    email = alice@target.trust
    name = Alice S.
[alias]
    hist=log -20 --pretty=format:"%C(yellow)%h%Creset\\ %C(green)%ar%C(cyan)%d\\ %Creset%s%C(yellow)\\ [%cn]" --graph --decorate --all' >> .git/config
```

Para iniciar um novo trabalho Alice precisa criar um novo branch:

`git checkout -b alice-feature master`

Criar um arquivo chamado alice.txt com o conteúdo abaixo:
Nova funcionalidade criada pela Alice.

`echo "Nova funcionalidade criada pela Alice." > alice.txt`

Adicionar o arquivo na área de stage e fazer um commit no repositório local:

```
git add .
git commit -m "Alice-feature: Nova funcionalidade"
```

Verifique o status do projeto usando o git hist:

`git hist`

Veja que o segundo commit mostra HEAD -> alice-feature com o comentário do commit da Alice.

A Alice ainda não terminou a sua funcionalidade mas terminou o expediente então ela precisa enviar o código para o repositório central:

`git push -u origin alice-feature`

Ao efetuar o push da nova feature da Alice uma mensagem é retornada pelo gitlab infomrando como gerar um pull request para nova branch enviada pela Alice para que sesja possível efetuar um merge com a master e integrar o código ao branch único do projeto.

remote: 
remote: To create a merge request for alice-feature, visit:
remote:   http://1b70aeeefab2/root/featurebranch/merge_requests/new?merge_request%5Bsource_branch%5D=alice-feature
remote: 
To http://192.168.157.100:8088/root/featurebranch.git
 * [new branch]      alice-feature -> alice-feature
Branch 'alice-feature' set up to track remote branch 'alice-feature' from 'origin'.

Outra informação também é a criação da branch da Alice no repositório central. Visualizar o processo de criação do pull request acessando a url gerda pelo gitlab bem como ir na pasta do projeto featurebranch para validar os branches existentes.

Crie o merge request que será usado posteriormente para efetuar o merge com a master. Preencher o form conforme segue:
Título: Alice-feature: Nova funcionalidade
Description: Nova funcionalidade
Assignee: Root
Milestone: Manter como está
Labels: Manter como está
Manter Source e Target Branch como está
Marcar "Delete source branch when merge request is accepted."

Submeter merge request.

Na página do projeto -> Details, verifique o número de branches e verifique o branch alice-feature

Durante o review da feature da Alice algumas mudanças foram solicitadas e o conteúdo do arquivo deve ser modificado conforme segue:
Nova funcionalidade incrível criada pela Alice.

`echo "Nova funcionalidade incrível criada pela Alice." > alice.txt`

Relaizar commit do arquivo alterado usando a flag -a para garantir que ele está no commit local:

`git commit -am "Alice-feature: Nova funcionalidade incrível"`

Use o histórico para validar se está tudo de acordo:

`git hist`

Efetuar o push da alteração para o repositório central:

`git push`

Ao enviar a versão atualizada o gitlab retorna com o link do merge request para validação do mesmo.
remote: 
remote: View merge request for alice-feature:
remote:   http://1b70aeeefab2/root/featurebranch/merge_requests/1
remote: 
To http://192.168.157.100:8088/root/featurebranch.git
   3eeb114..36ae2fe  alice-feature -> alice-feature

Enquanto a Alice estava desenvolvendo sua funcionalidade incrível Bob também desenvolveu uma nova feature e ela foi aceita e integrada ao branch master, porém a Alice ainda está desenvolvendo a funcionalidade dela.

Acessar o diretório bob e verificar o status dos arquivos via git:

`git status`

Editar arquivo .git/config e inserir conteúdo abaixo:
[user]
    email = bob@target.trust
    name = Bob A.
[alias]
	hist=log -20 --pretty=format:"%C(yellow)%h%Creset\\ %C(green)%ar%C(cyan)%d\\ %Creset%s%C(yellow)\\ [%cn]" --graph --decorate --all

```
echo '
[user]
    email = bob@target.trust
    name = Bob A.
[alias]
    hist=log -20 --pretty=format:"%C(yellow)%h%Creset\\ %C(green)%ar%C(cyan)%d\\ %Creset%s%C(yellow)\\ [%cn]" --graph --decorate --all' >> .git/config
```

Para iniciar um novo trabalho Bob precisa criar um novo branch:

`git checkout -b bob-feature master`

Criar um arquivo chamado bob.txt com o conteúdo abaixo:
Nova funcionalidade muito massa criada pelo Bob.

`echo "Nova funcionalidade muito massa criada pelo Bob." > bob.txt`

Adicionar o arquivo na área de stage e fazer um commit no repositório local:

```
git add .
git commit -m "Bob-feature: Nova funcionalidade muito massa"
```

O Bob finalizou seu trabalho e deve enviar para o repositório central seu código e gerar um merge request para que seja integrado ao branch master do projeto:

`git push -u origin bob-feature`

Manter o título, adicionar a descrição, selecionar o root como assignee e marcar a opção de delete branch quando o merge request for aceito.

Aceitar o merge request via interface do gitlab.

Validar a branch master na página do projeto -> Details.

Voltando ao caso da Alice: O merge request dela será aceito sem ressalvas ou teremos que resolver conflitos?

Como houveram commits na branch master antes da aprovação do request dela, ela terá que primeiro integrar esses commits para depois ser possível efetuar a integração da nova funcionalidade da Alice.

Acesse o dirtório da Alice.

Atualizando o branch da Alice para conseguir efetuar a inegração do seu código na master também:
1-Volte para o master branch: `git checkout master`
2-Valide com o comando `git branch`
3-Efetue um pull do repositório: `git pull`
4-verifique o histórico com o `git hist`
5-Integre a master branch com a alice-feature: `git pull origin alice-feature`
6-Envie o código para o repositório central: `git push`

Desta forma o processo de integração do commit da Alice foi integrado a master. Valide as alterações no código do repositório da Alice usando o `git hist` e também valide os merge requests via gitlab. O projeto final deve conter os arquivos de feature da Alice e do Bob.

3 - Gitflow
Criar um novo projeto chamado gitflow
Manter a visibilidade como privado
Marcar a opção de iniciar com um arquivo README

Exercício:

Criar diretório git na pasta home do usuário vagrant

`mkdir git`

Clonar repositório gitflow
/home/vagrant/git/gitflow

```
cd git/
git clone http://192.168.157.100:8088/root/gitflow.git
```

Acessar o diretório gitflow e verificar o status dos arquivos via git:

`git status`

Editar arquivo .git/config e inserir conteúdo abaixo:
[user]
    email = alice@target.trust
    name = Alice S.
[alias]
	hist=log -20 --pretty=format:"%C(yellow)%h%Creset\\ %C(green)%ar%C(cyan)%d\\ %Creset%s%C(yellow)\\ [%cn]" --graph --decorate --all

```
echo '
[user]
    email = alice@target.trust
    name = Alice S.
[alias]
    hist=log -20 --pretty=format:"%C(yellow)%h%Creset\\ %C(green)%ar%C(cyan)%d\\ %Creset%s%C(yellow)\\ [%cn]" --graph --decorate --all' >> .git/config
```

Fluxo simplificado de como utilizar o git-flow:
1-Fazer checkout do master: `git checkout master`
2-Criar uma branch develop: `git checkout -b develop`
3-Fazer push da branch develop para o repositório central:`git push -u origin develop`
4-Executar o git flow init para configurar o repositório: `git flow init`

Criar uma feature branch baseada na branch de develop:

```
git checkout develop
git flow feature start feature_branch
```

Crie um arquivo com o conteúdo abaixo na feature_branch:
Super ultra mega bacana feature.

`echo "Super ultra mega bacana feature." > feature.txt`

Efetue commit do arquivo, efetue commit no repo local e envie para o repo remoto:

```
git add .
git commit -m "GitFlow: New feature"
git push -u origin feature/feature_branch"
```

Finalize a feature `git flow feature finish feature_branch`

Para enviar a versão atualizada da branch develop efetuar um `git push`.

Criando uma release branch para lançamento de uma nova versão:

```
git flow release start 0.1.0
git hist
git branch
```

Após as adições de funcionalidades necessárias a release deve ser encerrada e integrada a master e a develop:
`git flow release finish '0.1.0'`

Verificar o repo local com o `git hist`.

Enviar para o repositório central com `git push`. Mudar para a branch master e efetuar o push também:

```
git checkout master
git push
```
