# Visual Identity Guidelines CVG

Diretrizes operacionais para identidade visual do Centro Veterinario Guarapiranga. Este documento traduz a estrategia verbal em regras visuais reutilizaveis para web, social, impressos, documentos institucionais, sinalizacao leve, interfaces digitais e materiais futuros.

## Navegacao do Pacote

- Estrategia verbal e checklist executivo: [`01_brand_book_cvg.md`](./01_brand_book_cvg.md)
- Regras de IA e automacoes: [`03_ai_brand_guidelines.md`](./03_ai_brand_guidelines.md)
- Social media, blog e campanhas: [`04_social_media_guidelines.md`](./04_social_media_guidelines.md)
- Tokens e componentes tecnicos: [`05_design_system_foundation.md`](./05_design_system_foundation.md)

Este arquivo define a decisao visual. Implementacoes em codigo devem usar os tokens e componentes de [`05_design_system_foundation.md`](./05_design_system_foundation.md) sem redesenhar paleta, tipografia, espacamento, raio ou hierarquia.

## Escopo

Este documento cobre:

- sistema de assinatura visual e regras de uso de logo;
- paleta oficial, intencao de uso e criterios de acessibilidade;
- tipografia institucional e escala de aplicacao;
- principios de layout, imagem, iconografia e elementos graficos;
- regras por canal: site, blog, social, thumbnails, banners, mobile e materiais impressos;
- handoff para CTO e criterios de aceite.

Este documento nao cobre:

- claims finais, promessas clinicas, textos comerciais ou SEO final, que pertencem ao CMO;
- implementacao tecnica em Astro/Tailwind, que deve ser consolidada pelo CTO;
- validacao regulatoria de termos como "hospital", "estrutura completa" ou especialidades, que deve passar pela direcao tecnica.

## Fontes e Assuncoes

Base estrategica: [`01_brand_book_cvg.md`](./01_brand_book_cvg.md).

Fontes publicas verificadas em 2026-05-06:

- Site oficial: https://www.cevetguarapiranga.com.br/
- Linktree publico: https://linktr.ee/cevetguarapiranga
- Perfil Petlove publico citado no brand book; acesso direto durante esta etapa retornou protecao Cloudflare, entao nao foi usado para decisoes visuais novas.

Observacoes da presenca visual atual:

- O site oficial usa Tailwind via CDN e a fonte Outfit em pesos 300 a 800.
- A cor principal publica do site e um azul claro/clinico em torno de `#0EA5E9`, com apoio em `#0284C7`, `#38BDF8`, `#E0F2FE`, brancos e slates.
- O Linktree publico usa fundo azul escuro em torno de `#0A1C8C` e botoes arredondados, reforcando azul como territorio reconhecivel.
- O site atual mistura cards muito arredondados, sombras fortes, blobs decorativos, textos grandes dentro de cards e claims que precisam de revisao de CMO/direcao tecnica. A nova regra visual preserva a direcao azul e a fonte, mas reduz ruido visual e aumenta consistencia clinica.
- O ativo de logo publico parece depender de imagem raster/avatar; para uso enterprise, o CTO ou designer de marca precisa obter ou reconstruir arquivo vetorial mestre antes de producao final.

Assuncoes marcadas:

- A assinatura primaria deve usar "Centro Veterinario Guarapiranga"; "CVG" e reservado para usos compactos, internos, sociais e sistemas digitais.
- Azul permanece como cor principal por consistencia publica e associacao com confianca clinica.
- A identidade deve parecer premium e hospitalar, mas local e humana. Evitar luxo ostentatorio, infantilizacao pet shop e estetica medica fria demais.

## Principio Visual Central

Lentes aplicadas: visual consistency, clinical clarity, trust signals, hierarchy, Gestalt proximity, cognitive load.

O CVG deve parecer um centro veterinario 24h organizado, claro e acolhedor. A linguagem visual precisa dar seguranca ao tutor em momentos de ansiedade: hierarquia limpa, contraste bom, espaco suficiente, chamadas diretas e imagens respeitosas de cuidado real.

Regra de decisao:

- Se uma escolha aumenta clareza clinica, legibilidade e confianca, ela e preferivel.
- Se uma escolha parece promocional, infantil, sensacionalista ou futurista demais, ela deve ser evitada.
- Se uma escolha depende de claim medico nao verificado, ela deve ser substituida por linguagem visual neutra e encaminhada ao CMO/direcao tecnica.

## Territorio Visual

### Atributos

- Clinico: limpo, preciso, organizado, com contraste suficiente.
- Humano: imagens com equipe, tutor e pet em contexto respeitoso, sem dramatizacao.
- Moderno: grids, tipografia consistente, componentes digitais claros e iconografia simples.
- Local premium: percepcao de estrutura e confianca sem parecer franquia impessoal ou luxo distante.
- Calmo: uso de cor e movimento sem urgencia falsa.

### Evitar

- Excesso de patinhas, ossinhos, coracoes e mascotes caricatos.
- Gradientes agressivos, blobs decorativos, bokeh, neon, roxo dominante ou visual de startup generica.
- Cards com raio muito grande em todos os elementos; usar card apenas onde houver item, modal ou modulo real.
- Fontes manuscritas, serifas ornamentais ou pesos muito finos em textos clinicos.
- Vermelho como cor promocional ou decorativa; reservar para alerta e erro.
- Imagens de sangue, procedimento invasivo, animal em sofrimento ou tutor chorando.

## Logo e Assinatura

Lentes aplicadas: visual consistency, trust signals, responsive constraints.

### Arquitetura de assinatura

1. Assinatura primaria horizontal:
   - Simbolo/monograma ou emblema a esquerda.
   - Nome por extenso: "Centro Veterinario Guarapiranga".
   - Uso: site, papelaria, fachada secundaria, apresentacoes, documentos, proposta institucional.

2. Assinatura compacta:
   - "CVG" ou simbolo isolado.
   - Uso: avatar, favicon, app icon, selo pequeno, social thumbnails, dashboards, mobile nav.

3. Assinatura social:
   - "Cevet Guarapiranga" pode aparecer quando a superficie ja usa esse nome publicamente.
   - Nao misturar "Centro Veterinario Guarapiranga", "CVG" e "Cevet" com igual peso na mesma peca.

### Arquivo mestre necessario

Antes de qualquer rollout final, criar ou localizar:

- `logo-cvg-primary.svg`
- `logo-cvg-primary-white.svg`
- `logo-cvg-mark.svg`
- `logo-cvg-mark-white.svg`
- `logo-cvg-horizontal.png` em 2x e 3x para canais que nao aceitam SVG
- `favicon.svg`, `favicon-32.png`, `apple-touch-icon.png`

Se o arquivo mestre nao existir, reconstruir em vetor a partir do ativo aprovado, sem redesenhar o conceito sem aprovacao do CEO.

### Area de protecao

Definir `x` como a altura da letra maiuscula do nome ou, no simbolo isolado, 25% da altura do simbolo.

- Assinatura primaria: manter no minimo `1x` livre em todos os lados.
- Assinatura compacta: manter no minimo `0.75x` livre em todos os lados.
- Em cards sociais, thumbnails e avatares, nunca encostar logo em borda, foto ou selo.

### Tamanhos minimos

- Web desktop, assinatura horizontal: altura minima de 32 px.
- Web mobile, assinatura horizontal: altura minima de 28 px, com texto legivel; se nao couber, usar marca compacta + nome em texto HTML.
- Avatar/social: simbolo ou monograma minimo de 96 x 96 px no arquivo exportado.
- Impressos: assinatura horizontal minima de 28 mm de largura.
- Favicon: usar apenas marca compacta, sem texto.

### Fundos permitidos

- Preferencial: fundo branco, off-white ou azul claro.
- Fundo escuro: usar versao branca em azul escuro `#0A1C8C` ou slate profundo `#0F172A`.
- Sobre foto: usar apenas quando houver overlay solido ou gradiente linear com contraste AA; nao aplicar logo direto sobre imagem complexa.

### Usos incorretos

- Nao distorcer proporcao.
- Nao aplicar sombra pesada, glow, contorno, degradado ou textura no logo.
- Nao mudar a cor do logo fora da paleta aprovada.
- Nao colocar logo dentro de card arredondado sem necessidade funcional.
- Nao usar foto/avatar raster pequeno como logo em materiais impressos.
- Nao combinar logo com selos, avaliacoes ou claims sem margem e hierarquia clara.

## Paleta Oficial

Lentes aplicadas: accessibility-by-default, WCAG POUR, clinical clarity, visual consistency.

### Cores de marca

| Token | Hex | Papel | Uso recomendado |
| --- | --- | --- | --- |
| `cvg-blue-600` | `#0284C7` | Primaria digital | CTAs, links, estados ativos, destaques controlados |
| `cvg-blue-500` | `#0EA5E9` | Primaria publica atual | Elementos de marca, icones, superficies leves, hover em fundos claros |
| `cvg-blue-400` | `#38BDF8` | Acento | Ilustracoes, graficos, detalhes, bordas ativas |
| `cvg-blue-100` | `#E0F2FE` | Fundo leve | Secoes suaves, badges, estados informativos |
| `cvg-navy-900` | `#0A1C8C` | Autoridade | Header escuro, rodape, capas institucionais, contraste com branco |
| `cvg-slate-900` | `#0F172A` | Texto principal | Titulos, navegacao, texto forte |
| `cvg-slate-700` | `#334155` | Texto secundario | Paragrafos e descricoes |
| `cvg-slate-500` | `#64748B` | Texto auxiliar | Metadados, placeholders, labels secundarios |
| `cvg-slate-200` | `#E2E8F0` | Borda | Separadores, grids, inputs |
| `cvg-slate-50` | `#F8FAFC` | Fundo | Fundo de pagina, areas administrativas |
| `cvg-white` | `#FFFFFF` | Base | Superficie principal |

### Cores semanticas

| Token | Hex | Uso | Regra |
| --- | --- | --- | --- |
| `success-600` | `#15803D` | Confirmacao operacional | Nao usar para promessa clinica de sucesso |
| `warning-600` | `#B45309` | Aviso e pendencia | Usar com texto claro, sem alarmismo |
| `danger-600` | `#DC2626` | Erro, urgencia real, alerta critico | Uso restrito; nao usar como cor promocional |
| `info-600` | `#0284C7` | Informacao | Pode compartilhar azul primario |

### Proporcao de cor

- 70% neutros claros e branco.
- 20% azul clinico.
- 8% navy/surface escura para autoridade e contraste.
- 2% semanticas de alerta/sucesso.

Essa proporcao evita um visual monocromatico e mantem calma. Azul deve guiar a identidade, nao cobrir todas as superficies.

### Contraste e acessibilidade

- Texto normal deve cumprir WCAG AA: contraste minimo 4.5:1.
- Texto grande e icones essenciais devem cumprir no minimo 3:1.
- `#0EA5E9` sobre branco nao deve ser usado para texto pequeno; preferir `#0284C7` ou `#0A1C8C`.
- Texto branco sobre `#0EA5E9` deve ser reservado para botoes com peso semibold e tamanho suficiente; para textos pequenos, usar `#0284C7` ou navy.
- Nunca usar cor como unico indicador de status; combinar com texto, icone ou borda.

### Aplicacao por canal

- Site: fundos brancos/slate-50; azul em CTAs, links e elementos de servico; navy em rodape e areas de confianca.
- Blog: tipografia escaneavel, links em azul-600, caixas de aviso em azul-100 ou warning claro.
- Social: capas com alto contraste; no maximo uma cor de apoio alem de azul/neutro por peca.
- Impressos: evitar fundos azul-500 chapados em grandes areas; usar navy ou branco com acentos.
- Dashboard/SaaS: reduzir saturacao; usar azul para acao e estado ativo, nao para todos os cards.

## Tipografia

Lentes aplicadas: hierarchy, clinical clarity, accessibility-by-default.

### Familia principal

Outfit e a fonte institucional recomendada porque ja aparece no site publico e oferece pesos suficientes para identidade, UI e social.

Stack:

```css
font-family: "Outfit", ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
```

### Regras de peso

- 800: uso raro em capas e posts sociais; evitar em textos longos.
- 700: H1, H2, chamadas de campanha.
- 600: botoes, nav, subtitulos, labels importantes.
- 500: chips, tabs, cards e destaques.
- 400: texto corrido.
- 300: evitar em interfaces e materiais clinicos; pode falhar em legibilidade.

### Escala digital recomendada

| Token | Tamanho | Linha | Uso |
| --- | --- | --- | --- |
| `display-lg` | 56 px | 1.05 | Hero desktop, capas especiais |
| `display-md` | 44 px | 1.1 | H1 desktop |
| `heading-lg` | 32 px | 1.2 | H2 |
| `heading-md` | 24 px | 1.25 | H3, titulo de card importante |
| `heading-sm` | 20 px | 1.3 | Titulo de modulo |
| `body-lg` | 18 px | 1.6 | Introducoes |
| `body-md` | 16 px | 1.6 | Texto padrao |
| `body-sm` | 14 px | 1.5 | Metadados, labels |
| `caption` | 12 px | 1.4 | Rodapes e notas |

### Regras responsivas

- Nao escalar fonte por `vw`.
- H1 mobile: 34 a 40 px, linha 1.1 a 1.15.
- Corpo mobile: minimo 16 px em conteudo clinico e formularios.
- Limitar largura de texto corrido a 64-72 caracteres.
- Nunca colocar paragrafos longos dentro de cards pequenos ou slides com pouco espaco.

## Layout e Hierarquia

Lentes aplicadas: Gestalt proximity, hierarchy, cognitive load, responsive constraints.

### Grid

- Site: container maximo de 1180 a 1280 px, margens laterais de 24 px desktop e 16 px mobile.
- Conteudo editorial: max-width de 720 a 800 px para leitura.
- Cards de servico: 2 colunas tablet, 3 ou 4 desktop apenas quando conteudo for curto.
- Dashboards: grid de 12 colunas desktop, 4 colunas tablet, 1 coluna mobile.

### Espacamento

Base de 4 px:

- 4, 8, 12, 16, 24, 32, 48, 64, 96.
- Componentes compactos: 8/12/16.
- Secoes institucionais: 48/64/96.
- Social media: usar margem interna minima de 64 px em arte 1080 x 1080.

### Raio e sombra

- Botoes: 8 px.
- Inputs: 8 px.
- Cards: 8 px.
- Modais: 12 px.
- Avatares e fotos circulares: apenas quando o formato pedir.
- Evitar `rounded-full` para CTAs longos; usar 8 px ou 10 px para parecer mais institucional.
- Sombras devem ser sutis; preferir borda `#E2E8F0` e sombra leve. Sombra pesada so para menus, overlays e modais.

### Hierarquia de superficie

1. Pagina: fundo branco ou `cvg-slate-50`.
2. Secao: faixa full-width sem card externo.
3. Card: item repetido, servico, artigo, depoimento, alerta ou modulo de dashboard.
4. Modal/overlay: tarefa temporaria.

Nao colocar cards dentro de cards. Nao transformar toda secao em card flutuante.

## Iconografia

Lentes aplicadas: component reuse, visual consistency, cognitive load.

### Estilo

- Linha simples, 1.75 a 2 px de stroke.
- Cantos arredondados moderados.
- Preenchimento apenas para estados ativos ou pictogramas pequenos.
- Preferir biblioteca consistente, como Lucide, Heroicons ou equivalente ja adotado pelo CTO.

### Uso

- Botoes de ferramenta e acoes digitais devem usar icone quando o simbolo for familiar: telefone, WhatsApp, mapa, calendario, busca, fechar, voltar, menu.
- Cards de servico podem usar icone + titulo, mas nao substituir imagem real quando o tutor precisa avaliar estrutura.
- Icones clinicos devem ser genericos e nao representar procedimento invasivo.

### Evitar

- Misturar familias de icones.
- Icones 3D, emoji, sticker ou clipart.
- Patinhas como marcador em toda lista.
- Icone sozinho sem label quando a acao nao for universalmente conhecida.

## Imagens e Direcao Fotografica

Lentes aplicadas: trust signals, clinical clarity, human warmth, accessibility-by-default.

### Imagens ideais

- Equipe atendendo tutor com postura calma e profissional.
- Caes e gatos em situacao tranquila, sem contencao dramatica.
- Ambientes limpos, organizados, iluminados e reais.
- Detalhes de cuidado: recepcao, preparacao de sala, banho e tosa seguro, laboratorio sem prometer diagnostico.
- Fotos com consentimento e sem exposicao sensivel.

### Tratamento

- Luz natural ou branca suave.
- Edicao limpa, sem saturacao excessiva.
- Recortes com respiro; nao cortar rosto de tutor/equipe ou pet de forma desconfortavel.
- Overlays escuros so quando forem necessarios para legibilidade.
- Usar texto sobre imagem apenas com contraste validado.

### Proibido

- Animal em sofrimento, sangue, cirurgia aberta, feridas ou procedimentos invasivos.
- Antes/depois clinico.
- Imagens geradas por IA que parecam foto real do CVG sem aviso.
- Equipamentos, salas, certificacoes ou profissionais inventados.
- Banco de imagem com aparencia de hospital humano ou luxo artificial.

## Elementos Graficos

Lentes aplicadas: visual consistency, clinical clarity.

### Permitidos

- Linhas finas, divisores e blocos de informacao.
- Pictogramas consistentes de servicos.
- Padroes discretos derivados de grid, cruz veterinaria abstrata, ondas da Guarapiranga ou contornos organicos suaves.
- Badges informativos: "24h", "Caes e gatos", "Guarapiranga", "Atendimento veterinario".

### Regras

- Padroes nunca devem competir com texto.
- Badges devem ser informativos, nao promocionais.
- Cruz/elementos medicos devem ser usados com cuidado para nao sugerir emergencia humana.
- Ondas ou referencias locais devem ser sutis, sem transformar a marca em turismo/lazer.

## Padroes por Canal

### Site institucional

- Primeiro viewport deve comunicar nome, atendimento veterinario 24h para caes e gatos, localidade e CTA principal.
- Hero deve usar imagem real ou institucional relevante; se nao houver imagem boa, usar layout tipografico limpo com bloco de confianca, nao blobs decorativos.
- CTA principal: azul-600, label claro, minimo 44 px de altura.
- CTA secundario: fundo branco com borda slate-200 ou link textual forte.
- Secoes devem seguir ordem: hero, servicos, estrutura/confianca, orientacao 24h, localizacao, conteudo/blog, contato.
- Servicos clinicamente sensiveis precisam de texto responsavel revisado pelo CMO.

### Blog

- Leitura acima de impacto visual.
- Artigos devem ter sumario, H2 claros, caixa de aviso clinico e CTA tranquilo.
- Imagem de capa deve indicar tema sem sensacionalismo.
- Links e estados de foco devem ser visiveis.

### Social media

- Carrossel 1080 x 1080:
  - margem segura de 64 px;
  - maximo 12 palavras no slide 1;
  - maximo 45 palavras por slide explicativo;
  - logo compacto ou wordmark pequeno no rodape;
  - contraste AA para texto principal.
- Reels:
  - area segura para legenda e UI nativa;
  - capa com 1 ideia clara;
  - nao depender apenas de audio.
- Stories:
  - botoes e CTAs longe das bordas nativas;
  - enquetes nao devem simular diagnostico.

### Thumbnails e banners

- Usar uma pergunta clara ou servico.
- Evitar mais de uma linha de subtitulo.
- Foto deve sustentar o tema.
- Reservar area fixa para logo ou assinatura.

### Mobile e WhatsApp landing

Lentes aplicadas: Fitts's Law, responsive constraints, information scent.

- Botoes principais com altura minima de 44 px.
- Telefone/WhatsApp/mapa sempre acessiveis sem esconder conteudo clinico.
- Evitar banners que empurrem informacao critica para baixo.
- Formularios com labels persistentes; placeholders nao substituem label.
- Mensagens de erro claras, proximas ao campo e sem cor como unico sinal.

### Dashboards e futuras interfaces SaaS

- Densidade maior, menos decoracao.
- Sidebar/nav clara com estados ativos.
- Cards de metricas com titulo, valor, contexto e tendencia; nao usar cor forte em todo card.
- Tabelas devem ter zebra leve ou divisores, foco de teclado e filtros claros.
- Status clinicos/operacionais devem usar label textual + cor.

## Acessibilidade

Lentes aplicadas: WCAG POUR, accessibility-by-default.

### Perceptivel

- Contraste minimo AA para texto.
- Texto alternativo em imagens informativas.
- Legendas em video quando houver informacao falada.
- Evitar texto incorporado em imagem quando o mesmo conteudo precisa ser lido por buscadores ou leitores de tela.

### Operavel

- Foco visivel em links, botoes, inputs e menus.
- Alvos de toque de no minimo 44 x 44 px.
- Menus e modais operaveis por teclado.
- Movimento reduzido quando usuario preferir `prefers-reduced-motion`.

### Compreensivel

- Labels objetivos.
- Estados de erro escritos em linguagem simples.
- CTAs previsiveis: "Falar com a equipe", "Agendar consulta", "Como chegar".
- Nao usar urgencia visual para pressionar decisao nao emergencial.

### Robusto

- Usar texto HTML sempre que possivel.
- Manter estrutura semantica de headings.
- Componentes com nomes acessiveis.
- Tokens semanticamente nomeados para permitir troca futura sem quebrar UI.

## Handoff para CTO

Validar e consolidar tecnicamente:

- Fonte Outfit via pacote ou Google Fonts com `font-display: swap`.
- Tokens de cor, tipografia, spacing, radius, shadow e breakpoint em Tailwind.
- Versoes SVG/PNG finais do logo antes de deploy.
- Contraste automatico ou testes em componentes criticos.
- Componentes base: Button, Link, Card, Input, Badge, Alert, Header, Footer, ServiceCard, BlogCard, CTASection, InfoNotice, ContactBar.
- Estados: default, hover, active, focus-visible, disabled, loading, error, success.
- Preferir conteudo estruturado para servicos e CTAs; evitar texto hardcoded espalhado.
- Revisar claims atuais do site com CMO/direcao tecnica antes de reaproveitar textos existentes.

## Compatibilidade Tecnica por Canal

| Canal | Requisito visual | Restricao tecnica |
| --- | --- | --- |
| Astro/site institucional | HTML semantico, imagens reais, CTAs claros, secoes full-width | Evitar textos clinicos como imagem; centralizar dados de contato e servicos |
| Tailwind | Tokens de cor, tipo, spacing, radius e shadow conforme [`05_design_system_foundation.md`](./05_design_system_foundation.md) | Nao usar classes ad hoc fora da escala sem justificativa documentada |
| Instagram/carrossel | Margem segura, contraste AA, logo discreto, ate 45 palavras por slide explicativo | Exportar em 1080 x 1080 e manter arquivo editavel |
| Impressos | Logo vetorial, contraste alto, pouco fundo chapado azul-500 | Nao imprimir raster pequeno como assinatura final |
| Mobile/WhatsApp landing | Toque minimo 44 x 44 px, CTA acessivel, conteudo sem sobreposicao | Header/barra fixa nao pode cobrir formulario, mapa ou aviso clinico |
| Dashboard/SaaS | Densidade maior, menos decoracao, estados com label textual | Azul indica acao/ativo; status nao depende apenas de cor |

## Validacao Visual CTO

Antes de aprovar uma implementacao, verificar:

- Paleta usa azul/neutros conforme proporcao definida; verde nao domina a UI e fica restrito a sucesso operacional.
- Texto pequeno nao usa `#0EA5E9` sobre branco; links e CTAs preferem `#0284C7` ou navy quando contraste exigir.
- Botoes, inputs e cards usam raio de 8 px; modais usam 12 px; `rounded-full` aparece apenas em avatars, switches ou badges pequenos.
- Secoes de pagina nao viraram cards flutuantes; cards sao usados para itens, modais ou modulos reais.
- Logo tem area de protecao, contraste e tamanho minimo respeitados.
- Imagens nao mostram sofrimento, procedimento invasivo, estrutura inventada ou paciente identificavel sem consentimento.
- Estados de foco, hover, disabled, loading, error e success estao visiveis e consistentes.

## Criterios de Aceite

- Logo tem regras de assinatura, protecao, tamanho minimo, fundos e usos incorretos.
- Paleta define tokens, intencao, proporcao e restricoes de contraste.
- Tipografia define familia, pesos, escala e limites responsivos.
- Layout, imagem, icones e elementos graficos sao aplicaveis em web, print, social, mobile e SaaS.
- Acessibilidade cobre WCAG POUR e decisoes praticas de contraste, foco, toque, semantica e movimento.
- Handoff para CTO lista tokens, componentes, estados e validacoes tecnicas.
- Decisoes preservam confianca medica, acolhimento humano, modernidade, tecnologia discreta e autoridade clinica.
- Compatibilidade por canal e validacao CTO deixam claro como aplicar as regras sem criar novo design.
