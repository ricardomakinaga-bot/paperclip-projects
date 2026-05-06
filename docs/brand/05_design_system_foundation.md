# Design System Foundation CVG

Fundacao de design system para transformar a identidade visual do Centro Veterinario Guarapiranga em tokens, componentes e padroes reutilizaveis. Este documento foi escrito para ser traduzido pelo CTO para Astro/Tailwind sem reinvencao de regras.

## Navegacao do Pacote

- Estrategia verbal, glossario e checklist executivo: [`01_brand_book_cvg.md`](./01_brand_book_cvg.md)
- Identidade visual, logo, paleta e imagem: [`02_visual_identity_guidelines.md`](./02_visual_identity_guidelines.md)
- IA, guardrails e automacoes: [`03_ai_brand_guidelines.md`](./03_ai_brand_guidelines.md)
- Social media, blog e campanhas: [`04_social_media_guidelines.md`](./04_social_media_guidelines.md)

Este arquivo e a ponte tecnica para site Astro/Tailwind, interfaces mobile, dashboards e futuras superficies SaaS. Ele nao redefine UX; traduz as regras aprovadas em tokens, componentes, estados e contratos de implementacao.

## Escopo

Este documento cobre:

- arquitetura de tokens;
- mapeamento inicial para Tailwind;
- componentes base e estados;
- padroes de interface para site, blog, mobile, dashboard e futuras interfaces SaaS;
- requisitos de acessibilidade;
- notas de implementacao e criterios de aceite.

Este documento nao cobre:

- codigo final;
- conteudo final de marketing;
- copy clinica final;
- definicao final de logo vetorial.

## Principios do Sistema

Lentes aplicadas: component reuse, visual consistency, accessibility-by-default, responsive constraints, cognitive load.

1. Um token antes de uma excecao.
2. Um componente antes de um bloco customizado.
3. Contraste e foco visivel por padrao.
4. Conteudo clinico deve priorizar leitura, nao impacto decorativo.
5. Componentes precisam funcionar em site publico e em interfaces operacionais futuras.
6. Estados devem ser previsiveis e nomeados semanticamente.

## Arquitetura de Tokens

### Cores primitivas

```js
const cvgColors = {
  blue: {
    100: "#E0F2FE",
    400: "#38BDF8",
    500: "#0EA5E9",
    600: "#0284C7"
  },
  navy: {
    900: "#0A1C8C"
  },
  slate: {
    50: "#F8FAFC",
    100: "#F1F5F9",
    200: "#E2E8F0",
    300: "#CBD5E1",
    500: "#64748B",
    700: "#334155",
    900: "#0F172A"
  },
  white: "#FFFFFF",
  success: {
    50: "#F0FDF4",
    600: "#15803D"
  },
  warning: {
    50: "#FFFBEB",
    600: "#B45309"
  },
  danger: {
    50: "#FEF2F2",
    600: "#DC2626"
  }
};
```

### Cores semanticas

```js
const semanticColors = {
  background: {
    page: "cvg.slate.50",
    surface: "cvg.white",
    subtle: "cvg.blue.100",
    inverse: "cvg.slate.900",
    brand: "cvg.navy.900"
  },
  text: {
    primary: "cvg.slate.900",
    secondary: "cvg.slate.700",
    muted: "cvg.slate.500",
    inverse: "cvg.white",
    link: "cvg.blue.600"
  },
  border: {
    default: "cvg.slate.200",
    strong: "cvg.slate.300",
    focus: "cvg.blue.600"
  },
  action: {
    primary: "cvg.blue.600",
    primaryHover: "cvg.navy.900",
    secondary: "cvg.white",
    disabled: "cvg.slate.200"
  },
  status: {
    info: "cvg.blue.600",
    success: "success.600",
    warning: "warning.600",
    danger: "danger.600"
  }
};
```

### Tipografia

```js
const typography = {
  fontFamily: {
    sans: ['"Outfit"', "ui-sans-serif", "system-ui", "sans-serif"]
  },
  fontWeight: {
    regular: 400,
    medium: 500,
    semibold: 600,
    bold: 700,
    extrabold: 800
  },
  fontSize: {
    "display-lg": ["56px", { lineHeight: "1.05", fontWeight: "700" }],
    "display-md": ["44px", { lineHeight: "1.1", fontWeight: "700" }],
    "heading-lg": ["32px", { lineHeight: "1.2", fontWeight: "700" }],
    "heading-md": ["24px", { lineHeight: "1.25", fontWeight: "700" }],
    "heading-sm": ["20px", { lineHeight: "1.3", fontWeight: "600" }],
    "body-lg": ["18px", { lineHeight: "1.6", fontWeight: "400" }],
    "body-md": ["16px", { lineHeight: "1.6", fontWeight: "400" }],
    "body-sm": ["14px", { lineHeight: "1.5", fontWeight: "400" }],
    caption: ["12px", { lineHeight: "1.4", fontWeight: "500" }]
  }
};
```

### Espacamento

```js
const spacing = {
  0: "0",
  1: "4px",
  2: "8px",
  3: "12px",
  4: "16px",
  6: "24px",
  8: "32px",
  12: "48px",
  16: "64px",
  24: "96px"
};
```

### Raio

```js
const radius = {
  none: "0",
  sm: "4px",
  md: "8px",
  lg: "12px",
  full: "9999px"
};
```

Regras:

- `md` para botoes, inputs e cards.
- `lg` para modais e paineis temporarios.
- `full` apenas para avatar, indicador circular, switch ou badge pequeno.

### Sombra

```js
const shadow = {
  none: "none",
  sm: "0 1px 2px rgba(15, 23, 42, 0.06)",
  md: "0 8px 24px rgba(15, 23, 42, 0.08)",
  overlay: "0 24px 56px rgba(15, 23, 42, 0.18)"
};
```

### Breakpoints

```js
const screens = {
  sm: "640px",
  md: "768px",
  lg: "1024px",
  xl: "1280px"
};
```

## Tailwind Mapping

Exemplo de extensao inicial:

```js
export default {
  theme: {
    extend: {
      colors: {
        cvg: {
          blue: {
            100: "#E0F2FE",
            400: "#38BDF8",
            500: "#0EA5E9",
            600: "#0284C7"
          },
          navy: {
            900: "#0A1C8C"
          },
          slate: {
            50: "#F8FAFC",
            100: "#F1F5F9",
            200: "#E2E8F0",
            300: "#CBD5E1",
            500: "#64748B",
            700: "#334155",
            900: "#0F172A"
          }
        }
      },
      fontFamily: {
        sans: ['"Outfit"', "ui-sans-serif", "system-ui", "sans-serif"]
      },
      borderRadius: {
        cvg: "8px",
        "cvg-lg": "12px"
      },
      boxShadow: {
        "cvg-sm": "0 1px 2px rgba(15, 23, 42, 0.06)",
        "cvg-md": "0 8px 24px rgba(15, 23, 42, 0.08)",
        "cvg-overlay": "0 24px 56px rgba(15, 23, 42, 0.18)"
      }
    }
  }
};
```

## Estrategia de Implementacao Astro/Tailwind

Recomendacao CTO:

- Declarar tokens primitivos em `tailwind.config.*` para uso utilitario.
- Espelhar cores, tipografia, radius e shadows criticos em CSS variables quando componentes precisarem de theming ou consumo fora do Tailwind.
- Carregar Outfit com `font-display: swap`; se Google Fonts for usado, manter fallback do stack definido.
- Manter conteudo institucional em colecoes Astro, arquivos JSON/TS ou CMS estruturado, evitando copy fixa espalhada em componentes.
- Criar componentes base antes de montar paginas: Button, Link, Card, Input, Badge, Alert, Header, Footer, ServiceCard, BlogCard, CTASection e ContactBar.
- Usar imagens com dimensoes estaveis, `alt` correto e `loading` apropriado; fotos criticas do hero devem ter recorte validado em mobile e desktop.
- Validar contraste e foco em componentes antes de montar templates.

### CSS variables recomendadas

```css
:root {
  --cvg-blue-600: #0284C7;
  --cvg-blue-500: #0EA5E9;
  --cvg-blue-100: #E0F2FE;
  --cvg-navy-900: #0A1C8C;
  --cvg-slate-900: #0F172A;
  --cvg-slate-700: #334155;
  --cvg-slate-500: #64748B;
  --cvg-slate-200: #E2E8F0;
  --cvg-slate-50: #F8FAFC;
  --cvg-radius-md: 8px;
  --cvg-radius-lg: 12px;
  --cvg-shadow-sm: 0 1px 2px rgba(15, 23, 42, 0.06);
  --cvg-shadow-md: 0 8px 24px rgba(15, 23, 42, 0.08);
}
```

### Contrato de dados recomendado

```ts
type CvgReviewState = {
  clinicallySensitive: boolean;
  requiresHumanReview: boolean;
  reviewedBy?: string;
  reviewedAt?: string;
};

type CvgSourceState = {
  source: "internal" | "official-site" | "public-profile" | "manual";
  verifiedAt: string;
};

type CvgService = CvgReviewState & {
  title: string;
  description: string;
  href: string;
  category: "consulta" | "24h" | "exames" | "internacao" | "cirurgia" | "vacinas" | "banho-e-tosa";
  imageSrc?: string;
  icon?: string;
};

type CvgContact = CvgSourceState & {
  address: string;
  whatsapp: string;
  phone?: string;
  mapsUrl: string;
  hoursLabel: string;
};

type CvgGoogleReviewsPolicy = {
  mode: "maps-cta-only" | "places-api" | "business-profile-export";
  mapsUrl: string;
  placeId?: string;
  verifiedAt: string;
  approvedBy: "CEO" | "CMOEditorial" | "DirecaoTecnica";
  notes: string;
};
```

Campos clinicamente sensiveis devem bloquear publicacao automatica ate revisao humana ou veterinaria, conforme [`03_ai_brand_guidelines.md`](./03_ai_brand_guidelines.md).

### Politica atual para avaliacoes Google

A politica vigente esta documentada em [`07_google_reviews_source_decision.md`](./07_google_reviews_source_decision.md): modo atual `places-api`, com `GOOGLE_PLACES_API_KEY` e `GOOGLE_PLACE_ID` presentes apenas no runtime do Paperclip e nao versionados. O consumo deve ser backend/server-side, com cache e fallback para CTA/link do Google Maps. Continuam proibidos scraping, reviews inventadas, copia manual sem export aprovado e qualquer exposicao de API key no frontend, repositorio, issues, comentarios, screenshots ou logs.

## Componentes Base

### Button

Lentes aplicadas: Fitts's Law, WCAG POUR, visual consistency.

Variantes:

- `primary`: fundo `cvg-blue-600`, texto branco, hover `cvg-navy-900`.
- `secondary`: fundo branco, texto slate-900, borda slate-200, hover slate-50.
- `ghost`: fundo transparente, texto blue-600, hover blue-100.
- `danger`: uso restrito para erro/alerta operacional, fundo danger-600.

Tamanhos:

- `sm`: altura 36 px, padding horizontal 12 px, texto 14 px.
- `md`: altura 44 px, padding horizontal 16 px, texto 16 px.
- `lg`: altura 52 px, padding horizontal 24 px, texto 18 px.

Estados obrigatorios:

- hover;
- active;
- focus-visible com outline 2 px `cvg-blue-600` e offset 2 px;
- disabled com opacidade reduzida, sem remover label;
- loading com spinner ou texto "Carregando" acessivel.

Regras:

- CTA clinico deve ter verbo claro: "Falar com a equipe", "Agendar consulta", "Como chegar".
- Icone a esquerda quando reforcar acao: WhatsApp, telefone, mapa, calendario.
- Nao usar botao apenas por cor em card inteiro; links de cards precisam ter foco visivel.

### Link

Variantes:

- `inline`: azul-600, underline em hover/focus.
- `nav`: slate-700, semibold, active azul-600.
- `standalone`: texto + icone de seta quando direciona para outro fluxo.

Regras:

- Links em texto longo devem ser sublinhados no hover e no foco.
- Links externos devem indicar destino quando o contexto nao for obvio.

### Card

Lentes aplicadas: Gestalt proximity, component reuse.

Anatomia:

- Container com fundo branco, borda slate-200, raio 8 px.
- Imagem opcional com aspect ratio fixo.
- Titulo curto.
- Descricao de ate 2 ou 3 linhas em cards compactos.
- Acao clara no rodape quando aplicavel.

Variantes:

- `service-card`: servico, imagem ou icone, descricao curta, CTA.
- `blog-card`: categoria, titulo, resumo, data, imagem.
- `info-card`: fato institucional ou orientacao.
- `metric-card`: dashboard, valor, contexto, tendencia.

Regras:

- Nao colocar texto longo SEO dentro de card.
- Card clicavel deve ter area interativa unica e foco visivel.
- Evitar sombra pesada; borda e espacamento sustentam hierarquia.

### Badge

Usos:

- informacao curta: "24h", "Caes e gatos", "Guarapiranga";
- status operacional: "Aberto", "Pendente", "Atualizado";
- categoria editorial.

Regras:

- Texto 12 a 14 px, semibold.
- Altura minima 24 px.
- Nao usar badge para claim nao verificado como "mais completo" ou "melhor".

### Alert / Notice

Lentes aplicadas: clinical clarity, WCAG POUR.

Variantes:

- `info`: fundo blue-100, borda blue-400, texto slate-900.
- `warning`: fundo warning-50, borda warning-600.
- `danger`: fundo danger-50, borda danger-600.
- `success`: fundo success-50, borda success-600.

Regras:

- Sempre incluir titulo curto e texto explicativo.
- Nunca depender apenas de cor; incluir icone e label.
- Alertas clinicos nao devem usar linguagem alarmista.

### Input

Anatomia:

- Label persistente.
- Campo com altura minima 44 px.
- Ajuda opcional.
- Erro abaixo do campo.

Estados:

- default;
- hover;
- focus-visible;
- disabled;
- error;
- success opcional.

Regras:

- Placeholder nao substitui label.
- Mensagem de erro deve dizer como corrigir.
- Telefone/WhatsApp devem ter mascaras ou hints quando implementadas.

### Header

Desktop:

- Logo a esquerda.
- Navegacao curta.
- CTA principal a direita.
- Altura 72 a 80 px.

Mobile:

- Marca compacta ou wordmark reduzido.
- Botao menu com nome acessivel.
- CTA persistente pode aparecer como barra inferior quando fizer sentido.

Regras:

- Header fixo nao deve ocupar altura excessiva em mobile.
- Estado ativo da navegacao precisa ser visivel.

### Footer

Conteudo minimo:

- Nome institucional.
- Endereco.
- Horario/atendimento 24h quando validado.
- Canais de contato.
- Links de servicos, blog, privacidade.
- Aviso de conteudo educativo quando houver blog.

Regras:

- Fundo navy ou slate-900 com texto branco/slate-200.
- Contraste AA.
- Nao esconder telefone/endereco em texto pequeno demais.

### ServiceCard

Campos recomendados:

```ts
type ServiceCard = {
  title: string;
  description: string;
  href: string;
  imageSrc?: string;
  icon?: string;
  clinicallySensitive?: boolean;
};
```

Regras:

- `description` deve ser curta e revisada pelo CMO quando mencionar resultados, diagnostico, cirurgia, internacao ou protocolo.
- `clinicallySensitive` pode acionar aviso ou revisao editorial no CMS.

### BlogCard

Campos recomendados:

```ts
type BlogCard = {
  title: string;
  excerpt: string;
  category: "prevencao" | "24h" | "estrutura" | "banho-e-tosa" | "educacao";
  href: string;
  imageSrc?: string;
  reviewedAt?: string;
};
```

Regras:

- Mostrar data de revisao em conteudos clinicamente sensiveis.
- Evitar thumbnails sensacionalistas.

### CTASection

Variantes:

- `contact`: falar com equipe.
- `appointment`: agendar consulta.
- `location`: como chegar.
- `content`: conhecer blog/servicos.

Regras:

- Uma acao primaria por secao.
- Acao secundaria discreta se necessaria.
- Nao usar urgencia falsa em campanhas preventivas.

### ContactBar

Uso:

- Mobile bottom bar ou desktop sticky leve para telefone/WhatsApp/mapa.

Regras:

- Maximo 3 acoes.
- Alvos de toque 44 x 44 px.
- Labels visiveis ou `aria-label` quando apenas icone.
- Nao cobrir formulario ou conteudo critico.

## Padroes de Pagina

### Home

Estrutura recomendada:

1. Header.
2. Hero com nome, proposta clara, localidade, CTA.
3. Servicos principais.
4. Orientacao 24h e sinais para procurar atendimento, sem alarmismo.
5. Estrutura/cuidado integrado.
6. Blog ou educacao.
7. Localizacao e contato.
8. Footer.

Regras:

- Hero deve evitar split exagerado com cards decorativos.
- Texto do hero deve caber em mobile sem sobrepor imagem ou CTA.
- A primeira dobra deve dar informacao suficiente para o tutor agir.

### Servicos

Estrutura:

- Intro curta.
- Lista de servicos com filtros simples se houver muitos.
- Pagina individual de servico para temas sensiveis.
- CTA de contato.

Regras:

- Claims de cirurgia, laboratorio, internacao e diagnostico precisam de revisao.
- Evitar paragrafos SEO longos em cards.

### Blog

Estrutura:

- Titulo.
- Categorias/filtros.
- Lista de artigos.
- Card de aviso educativo.

Artigo:

- H1 claro.
- Resposta curta.
- Sumario.
- H2 escaneaveis.
- Aviso clinico.
- CTA tranquilo.

### Contato

Estrutura:

- Telefone/WhatsApp.
- Endereco.
- Mapa.
- Horario/24h validado.
- Como chegar.
- Informacoes para atendimento.

Regras:

- Informacoes de contato devem ser texto HTML.
- Botoes de mapa/WhatsApp precisam ter destino validado.

### Dashboard/SaaS futuro

Estrutura:

- App shell com sidebar.
- Topbar com busca ou contexto.
- Conteudo em grid.
- Tabelas e filtros.
- Modais apenas para tarefas focadas.

Regras:

- Nao replicar visual promocional do site no dashboard.
- Estados operacionais precisam de labels textuais.
- Densidade deve favorecer repeticao de uso e leitura rapida.

## Acessibilidade Padrao

Lentes aplicadas: WCAG POUR, accessibility-by-default.

### Checklist minimo por componente

- Nome acessivel.
- Foco visivel.
- Contraste AA.
- Estado disabled distinguivel sem sumir.
- Tamanho de toque adequado.
- Sem dependencia exclusiva de cor.
- Funciona em teclado.
- Respeita `prefers-reduced-motion` quando animado.

### Regras de conteudo

- Headings em ordem semantica.
- Texto alternativo para imagem informativa.
- Imagem decorativa com alt vazio.
- Avisos clinicos escritos como informacao, nao como medo.
- Videos com legenda ou alternativa textual quando contiverem informacao.

## Estados e Movimento

### Estados globais

- Default.
- Hover.
- Active.
- Focus-visible.
- Disabled.
- Loading.
- Empty.
- Error.
- Success.

### Movimento

- Transicoes de 120 a 200 ms para hover/focus.
- Evitar animacoes flutuantes infinitas em site institucional.
- Carrossel nao deve autoplay sem controle quando houver texto importante.
- Respeitar `prefers-reduced-motion`.

## Conteudo Estruturado

Recomendacao para CTO:

- Separar conteudo de servicos em arquivo ou CMS estruturado.
- Cada servico deve ter campos curtos para card e campos longos para pagina.
- Marcar campos que exigem revisao CMO/direcao tecnica.
- Centralizar endereco, telefone, WhatsApp, horarios e links sociais.

Exemplo:

```ts
type CvgContact = {
  address: string;
  whatsapp: string;
  phone?: string;
  mapsUrl: string;
  hoursLabel: string;
  updatedAt: string;
};
```

## Do / Dont

### Do

- Usar branco, slate e azul com proporcao calma.
- Usar Outfit com escala consistente.
- Usar botoes claros e foco visivel.
- Usar imagens reais e respeitosas.
- Reduzir texto em cards.
- Criar componentes reutilizaveis.
- Validar contraste.

### Dont

- Usar blobs decorativos como linguagem principal.
- Usar claims clinicos fortes como decoracao.
- Transformar cada secao em card.
- Usar azul claro para texto pequeno em fundo branco.
- Usar vermelho para chamar atencao comercial.
- Misturar muitas familias de icones.
- Criar componentes sem estado de teclado.

## Handoff para CTO

Implementar ou validar:

- Tailwind config com tokens acima.
- Componentes base com variantes e estados.
- Fonte Outfit com fallback e carregamento adequado.
- Pipeline de imagens com dimensoes estaveis e alt text.
- Lint ou teste de contraste nos componentes principais, se viavel.
- Dados estruturados para contato e servicos.
- Substituicao gradual de textos longos em cards por excerpts revisados.
- Repositorio de assets com logo vetorial e exports.
- Documentacao de uso dos componentes para proximos agentes.

Pontos que precisam de decisao tecnica:

- Se o projeto final usara Astro content collections, CMS leve ou arquivos JSON/TS.
- Onde os tokens vivem: Tailwind config, CSS variables ou ambos.
- Biblioteca de icones padrao.
- Politica de componentes client-side para menus, carrossel e formularios.

## Matriz de Compatibilidade Tecnica

| Superficie | Padrao aprovado | Verificacao minima |
| --- | --- | --- |
| Site Astro | Componentes semanticos, conteudo estruturado, tokens Tailwind | Build/render sem erro; headings em ordem; CTA e contato visiveis em mobile |
| Blog | Content collection/CMS com aviso clinico e data de revisao | Artigo sensivel mostra aviso e `reviewedAt` |
| Landing mobile/WhatsApp | ContactBar com ate 3 acoes e toque 44 x 44 px | Barra nao cobre formulario, mapa ou aviso |
| Dashboard/SaaS | App shell denso, estados textuais, pouco decorativo | Tabelas/filtros navegaveis por teclado e status com label |
| Social templates | Arquivos editaveis, margem segura, contraste AA | Export 1080 x 1080 legivel e com logo protegido |
| Impressos | Logo vetorial, cores aprovadas, pouco azul chapado | PDF/export usa SVG ou asset em alta resolucao |

## Checklist de QA Tecnico

Antes de fechar uma implementacao derivada deste design system:

- Todos os componentes interativos tem nome acessivel e foco visivel.
- Texto normal cumpre contraste 4.5:1; texto grande e icones essenciais cumprem 3:1.
- Botoes e inputs tem altura minima de 44 px nos fluxos principais.
- Tipografia nao usa `vw`; textos cabem em mobile sem sobrepor CTA, imagem ou card.
- Links, botoes, badges e status nao dependem apenas de cor.
- Imagens informativas tem `alt`; imagens decorativas tem alt vazio.
- `prefers-reduced-motion` e respeitado em animacoes/carrosseis.
- Conteudo de servico sensivel carrega flags de revisao.
- Dados de contato, horario, convenios e avaliacoes tem fonte e data de verificacao.
- Nenhuma UI usa verde como cor dominante; verde aparece apenas como sucesso operacional.

## Criterios de Aceite

- Tokens cobrem cor, tipografia, espacamento, raio, sombra e breakpoints.
- Tokens sao traduziveis para Tailwind.
- Componentes base tem variantes, estados e regras de acessibilidade.
- Padroes de pagina cobrem site, blog, contato, servicos, mobile e SaaS futuro.
- Handoff para CTO explicita implementacao, validacoes e decisoes tecnicas pendentes.
- Sistema preserva autoridade clinica, acolhimento, modernidade e confianca sem depender de decoracao ou claims nao validados.
- Inclui estrategia de implementacao Astro/Tailwind, contrato de dados, matriz de compatibilidade e checklist de QA tecnico.
