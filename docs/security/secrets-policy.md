# Politica de segredos do repositorio

Este repositorio nao deve versionar, publicar, imprimir ou anexar segredos.

## Regra operacional

- Nunca commitar arquivos `.env`, chaves privadas, certificados, tokens, senhas, service accounts ou arquivos de credenciais.
- Nunca colar segredos em issues, comentarios, logs, screenshots, artefatos ou handoffs.
- Antes de commit, push ou publicacao, executar `scripts/check-secrets.sh`.
- Se qualquer segredo aparecer no workspace, parar o trabalho, nao commitar e pedir ao owner responsavel para remover o segredo e rotacionar a credencial.
- Exemplos de configuracao devem usar arquivos `*.example` e valores falsos, sem credenciais reais.

## Check obrigatorio

```bash
scripts/check-secrets.sh
```

O check reporta apenas arquivo, linha e regra violada. Ele nao imprime o valor suspeito.

## Escopo do guardrail

O repositorio tambem possui `.gitignore` para bloquear os tipos mais comuns de arquivos sensiveis: `.env`, chaves privadas, certificados, keystores, credenciais de registry, service accounts, tokens e diretorios comuns de secrets.

Ferramentas dedicadas como `gitleaks`, `detect-secrets`, `trufflehog` ou `git-secrets` devem ser preferidas quando estiverem disponiveis no ambiente. Enquanto elas nao estiverem instaladas, `scripts/check-secrets.sh` e o workflow `Secret check` sao o minimo obrigatorio.
