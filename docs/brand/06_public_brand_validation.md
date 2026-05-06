# Public Brand Validation CVG

Validacao tecnica de compatibilidade entre o pacote de marca CVG e os canais publicos acessiveis em 2026-05-06.

## Escopo

Este documento responde a solicitacao reaberta em RMA-5:

- visitar materiais publicos do Centro Veterinario Guarapiranga;
- verificar compatibilidade com o brand book consolidado;
- apontar lacunas sem inventar padrao novo;
- separar validacao executavel de implementacao bloqueada por falta de UX.

Este documento nao substitui auditoria visual completa de feed Instagram/Facebook quando essas plataformas exigirem autenticacao, consentimento, screenshot fornecido pelo time ou ferramenta de browser configurada.

## Fontes Visitadas

| Canal | Fonte | Status de acesso | Uso na validacao |
| --- | --- | --- | --- |
| Site oficial | https://www.cevetguarapiranga.com.br/ | Acessivel via web/search em 2026-05-06 | Conteudo institucional, servicos, campanhas, blog, contato e FAQ |
| Linktree | https://linktr.ee/cevetguarapiranga | Acessivel via web/search em 2026-05-06 | Nomes sociais, links para WhatsApp/Facebook/Instagram/TikTok/YouTube/SAC |
| Instagram | Linktree aponta `@CEVETGUARAPIRANGA` | Perfil direto nao ficou acessivel pelo runtime sem autenticacao/raspagem da plataforma | Validado apenas como presenca/link, nao como feed visual |
| Facebook | Linktree aponta pagina "Facebook Centro Veterinario Guarapiranga" | Pagina direta nao ficou acessivel pelo runtime sem autenticacao/raspagem da plataforma | Validado apenas como presenca/link, nao como feed visual |
| Petlove | https://saude.petlove.com.br/rede-credenciada/sp/sao-paulo/centro-veterinario-guarapiranga | Acessivel via search result recente | Reforco de dados publicos: clinica 24h, endereco, contatos, avaliacao e recomendacao, com necessidade de verificacao antes de campanha |

## Limitacao Tecnica

Foi tentado usar Playwright para screenshot do site oficial. O CLI esta disponivel via `npx`, mas o browser Chromium nao esta instalado no workspace em `/root/.cache/ms-playwright/...`. Portanto:

- validacao textual e de fontes publicas foi feita;
- validacao visual pixel-level nao foi concluida neste heartbeat;
- para auditoria visual completa, configurar browser Playwright no workspace ou fornecer screenshots atuais de site, Instagram e Facebook.

## Resultado Geral

Veredito: parcialmente compativel.

O material publico atual confirma a direcao central do brand book:

- nome institucional "Centro Veterinario Guarapiranga";
- uso social "Cevet Guarapiranga";
- servicos integrados: banho e tosa, especialidades, internacoes, cirurgias, exames, clinica, consultas, laboratorio, vacinas e check-up;
- atendimento 24h para caes e gatos;
- endereco na Avenida Guarapiranga, 1993;
- tom de cuidado, acolhimento e conveniencia.

O material publico atual ainda nao esta totalmente compativel com o pacote consolidado porque contem claims e padroes de copy que os documentos finais tratam como risco ou revisao obrigatoria.

## Compatibilidades Encontradas

### Identidade e posicionamento

- O site e Linktree usam "Centro Veterinario Guarapiranga", "Cevet Guarapiranga" e servicos coerentes com o glossario do brand book.
- A promessa de atendimento 24h para caes e gatos esta alinhada ao posicionamento local e hospitalar.
- A estrutura de servicos comunicada sustenta a proposta de cuidado integrado: clinica, exames, cirurgia, internacao, vacinas, banho e tosa.
- O uso de WhatsApp e contato direto e coerente com a regra de proximo passo claro e conversao sem pressao.

### Conteudo e SEO

- O site cobre intencoes de busca previstas: consultas, laboratorio, cirurgia, internacao, vacinacao, check-up, blog e contato.
- A FAQ confirma limites importantes: atendimento 24h, caes e gatos, protocolo vacinal definido por veterinario e confirmacao de convenio pelo contato.
- Blog e videos reforcam conteudo educativo, que e um pilar do pacote de marca.

### Prova social

- Avaliacoes publicas e Petlove sustentam reputacao positiva, mas numeros e depoimentos devem permanecer com data de verificacao e revisao antes de uso em campanha.

## Incompatibilidades e Riscos

### Claims clinicos fortes no site

O site usa ou agrega expressoes que o brand book recomenda revisar:

- "garantir a saude e o bem-estar";
- "diagnostico preciso";
- "diagnosticos rapidos, precisos e confiaveis";
- "tratamento imediato";
- "recuperacao rapida";
- "resultados confiaveis";
- "equipe altamente qualificada";
- "tecnologia avancada";
- "estrutura moderna";
- "setor cirurgico completo e seguro".

Acao recomendada: CMO + direcao tecnica devem revisar essas expressoes antes de reaproveitamento em landing pages, campanhas, SEO ou automacoes.

### Depoimentos com promessa indireta

O site exibe depoimentos com linguagem como "ele esta bem e com saude", "podem confiar sem medo", "a melhor clinica", "voces sao os melhores", "diagnostico foi muito bem feito", "deu tudo certo".

Risco: depoimentos podem ser interpretados como prova de resultado medico ou superioridade absoluta.

Acao recomendada: manter prova social apenas com curadoria, contexto, fonte atualizada e sem transformar depoimento em claim de cura, seguranca ou superioridade.

### Campanhas promocionais

O site comunica campanhas especiais e promocoes de saude. Isso e permitido, mas o brand book restringe urgencia falsa, medo, culpa, "ultimas vagas", "so hoje" e desconto como gatilho de decisao medica.

Acao recomendada: toda campanha deve conter publico, objetivo, validade, CTA e revisao clinica quando envolver vacina, check-up, cirurgia, exames, medicacao ou sintomas.

### Consistencia editorial

Foram identificados pontos de texto que devem ser revisados antes de publicacao final:

- acentuacao e grafia inconsistentes, como "Saude", "Óla", "Clinica";
- alternancia entre linguagem institucional e textos SEO longos dentro de cards;
- excesso de promessa em descricoes de servico;
- hero atual mais generico do que a proposta final de "hospitalidade clinica".

Acao recomendada: CMO deve revisar copy publica antes do CTO reaproveitar conteudo em componentes.

## Compatibilidade com o Design System

Com base no conteudo acessivel, a direcao publica de marca e compativel com:

- azul como territorio principal;
- comunicacao local Guarapiranga/Zona Sul;
- CTAs diretos para WhatsApp, blog e contato;
- foco em servicos e atendimento 24h;
- futuras interfaces Astro/Tailwind orientadas por tokens.

Ainda precisa validacao visual completa para:

- proporcao real de azul/neutros;
- uso de verde ou cores semanticas;
- raio, sombra e cards;
- legibilidade mobile;
- contraste AA;
- imagens reais, consentimento e ausencia de procedimentos sensiveis;
- consistencia de templates Instagram/Facebook.

## Decisao sobre Landing Page

A solicitacao de criar uma landing page nao atende ao filtro CTO neste momento.

Faltam:

- UX definida pela UXDesigner para a landing page especifica;
- rota ou destino do arquivo/pagina;
- estrutura de secoes aprovada;
- comportamento responsivo;
- assets/imagens aprovados;
- criterio de aceite visual;
- confirmacao se a pagina e institucional interna, publica, campanha ou pagina do brand book.

Conteudo base disponivel:

- missao, visao e valores em [`01_brand_book_cvg.md`](./01_brand_book_cvg.md);
- paleta, tipografia e imagem em [`02_visual_identity_guidelines.md`](./02_visual_identity_guidelines.md);
- tokens e componentes em [`05_design_system_foundation.md`](./05_design_system_foundation.md).

Proxima acao correta: criar uma task "BLOCKED - NEEDS SPEC" para UXDesigner definir a landing page. Depois da especificacao aprovada, CTO implementa sem inventar layout.

## Checklist para Desbloquear Implementacao

UXDesigner deve entregar:

- objetivo da landing page;
- rota/nome do arquivo;
- wireframe ou estrutura textual de secoes;
- ordem e prioridade dos blocos;
- comportamento mobile/desktop;
- CTAs permitidos;
- uso ou ausencia de imagens;
- estados responsivos e acessibilidade minima;
- criterios de aceite.

CMO deve confirmar:

- copy final de missao, visao e valores;
- ajustes nos claims publicos identificados como risco;
- uso de depoimentos, numeros ou prova social na pagina.

CEO deve decidir:

- se a landing page e publica, interna ou material de apresentacao;
- se deve usar "Centro Veterinario Guarapiranga", "CVG" ou "Cevet Guarapiranga" no titulo principal;
- se o uso de termos hospitalares precisa de validacao formal da direcao tecnica antes de publicacao.
