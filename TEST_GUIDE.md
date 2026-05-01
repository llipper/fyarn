Para testar o Fyarn e ver o "motor de compilador" em ação, você pode seguir este roteiro de validação de integridade e incrementalismo.

Como o sistema é determinístico, o teste mais interessante é observar como ele reage ao cache e ao sistema de arquivos.

1. Teste de Execução Inicial (Cold Build)
No terminal, na raiz do projeto, execute:

powershell
dart bin/fyarn.dart add button
O que observar: O log deve indicar Incremental Build: Initial run e gerar os arquivos na pasta lib/ui/button.

2. Teste de Idempotência (Cache Hit)
Execute o mesmo comando novamente:

powershell
dart bin/fyarn.dart add button
O que observar: O log deve reportar 100% Cache Hit. O compilador percebe que nada mudou (mesmo hash, arquivo presente) e não faz nenhuma operação de escrita.

3. Teste de Integridade Física (Auto-healing)
Delete manualmente o arquivo gerado:

powershell
rm lib/ui/button/fyarn_button.dart
Agora execute o comando novamente:

powershell
dart bin/fyarn.dart add button
O que observar: O compilador detectará Physical file missing on disk (mesmo com o hash batendo no metadado) e forçará a reconstrução apenas desse arquivo.

4. Teste de Mudança de Conteúdo (Content-Addressable)
Altere qualquer coisa no template do botão (ex: em lib/templates/ui/button/fyarn_button.dart.tpl). Rode o comando novamente. O que observar: O log dirá Content hash mismatch. O compilador identificou a mudança no "código-fonte" do template e invalidou o cache.

Executando Testes Automatizados
Para rodar a suíte de testes unitários do Dart:

powershell
dart test
Este fluxo prova que o Fyarn não é um gerador burro; ele é um sistema de build consciente do estado real do seu projeto. 🧶