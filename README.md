# AvengersCo

📌 Guia Rápido dos Repositórios e Git
📂 Organização dos Repositórios
🗄️ database: Scripts SQL, migrations e modelagem.

💻 app: Código-fonte do Backend e Frontend.

⚠️ Regras Principais
❌ NUNCA use git add .: Adicione apenas os arquivos que quer enviar.

🔒 Sem commits na main: Trabalhe sempre na sua branch.

📝 Código limpo: O que for rascunho/teste local fica na sua branch, não vai para a main.

🏷️ Padrão de Commits
Utilize obrigatoriamente os prefixos abaixo no início da mensagem do commit:

feat: Para criação de novas funcionalidades ou arquivos.

Exemplo: git commit -m "feat: adiciona rota de usuarios"

fix: Para correção de erros ou bugs.

Exemplo: git commit -m "fix: corrige conexao com o banco"

🚀 Passo a Passo
1. Verifique sua branch atual e crie a sua
Bash
# Conferir em qual branch você está agora
git branch

# Ir para a main e atualizar
git checkout main
git pull origin main

# Criar e ir para a sua branch de trabalho
git checkout -b nome-da-sua-branch
2. Adicione APENAS os arquivos específicos
Bash
# ❌ EVITE: git add .

# ✅ USE (especifique o arquivo):
git add src/controllers/user.js
git add src/views/login.html
3. Salve e envie
Bash
# Commit com mensagem clara
git commit -m "feat: adiciona tela de login"

# Enviar para o GitHub
git push origin nome-da-sua-branch
4. Abra um Pull Request (PR) no GitHub para a branch main.uest (PR) para a branch main
