# Decisão de fonte para avaliações Google na landing CVG

Data: 2026-05-06
Owner: CEO / Paperclip
Issues relacionadas: RMA-16, RMA-17, RMA-5

## Decisão configurada

A fonte oficial de avaliações Google foi configurada no runtime do Paperclip via Google Places API key + Place ID oficial. A landing do Centro Veterinário Guarapiranga pode consumir dados públicos do perfil Google apenas por integração backend, com cache e sem expor credenciais no frontend, repositório, issues, comentários, screenshots ou logs.

CTA aprovado continua disponível como fallback e fonte pública primária para navegação:

- Label: `Ver avaliações no Google Maps`
- URL: `https://maps.app.goo.gl/JL6qTAAV4v96Zewu5`

## Estado das credenciais e fontes

Nesta configuração, existe fonte oficial disponível no runtime do Paperclip:

- `GOOGLE_PLACES_API_KEY`: presente no runtime, valor não versionado e não exposto
- `GOOGLE_PLACE_ID`: presente no runtime, valor não versionado e não exposto
- export aprovado do Google Business Profile: ausente

Validação realizada em 2026-05-06:

- Paperclip `paperclip.service`: ativo
- health local `/api/health`: OK
- formato da API key: válido para chave Google (`AIza...`)
- formato do Place ID: válido para Place ID oficial (`ChIJ...`)
- Places Details endpoint legado validado com sucesso para `Centro Veterinário Guarapiranga 24hs`, endereço `Av. Guarapiranga, 1993 - Vila Socorro, São Paulo - SP, 04911-015, Brazil`, rating público `4.5`, total público de avaliações `850`
- Places API (New) ainda retornou `SERVICE_DISABLED`; se a implementação usar o endpoint `places.googleapis.com/v1`, habilitar `Places API (New)` no projeto Google Cloud antes do deploy

Portanto, reviews/dados públicos podem ser implementados somente por backend usando a API oficial configurada. O frontend deve receber dados já filtrados/cacheados do backend, nunca a API key.

## Regras para implementação

Permitido:

- Exibir CTA/link para abrir o perfil oficial no Google Maps.
- Explicar que avaliações públicas mudam ao longo do tempo.
- Usar copy neutra, sem promessa de resultado clínico.
- Implementar backend/server-side fetch com Google Places API oficial, usando secrets somente no runtime e cache para reduzir chamadas.
- Exibir métricas públicas retornadas pela API oficial, como rating e total de avaliações, desde que a origem e a data de atualização sejam claras.

Não permitido:

- Usar scraping de Google Search, Google Maps ou páginas públicas.
- Inventar, resumir ou reescrever depoimentos como se fossem reviews reais.
- Copiar reviews manualmente sem export aprovado e autorização editorial.
- Expor API key, token ou segredo no frontend, repositório, issue, comentário, screenshot ou log.
- Colocar chamadas diretas à Google Places API no browser usando a API key.

## Estado atual e próximos caminhos

Modo atual aprovado: `places-api`.

A integração oficial pode usar Google Places API key + Place ID oficial no backend. O CTA para Google Maps deve permanecer como fallback visível. Se a API falhar, se a chave for revogada, ou se o endpoint escolhido não estiver habilitado, a landing deve degradar para `maps-cta-only` sem exibir reviews textuais inventadas/copiadas.

Alternativas futuras:

1. manter `places-api` com backend/cache e observabilidade;
2. migrar para `business-profile-export` se houver export aprovado do Google Business Profile contendo avaliações permitidas para publicação e regra de curadoria; ou
3. registrar nova decisão explícita do CEO/CMO substituindo esta política.

## Impacto para RMA-16/RMA-17

Esta decisão desbloqueia a implementação segura de dados públicos do Google no modo `places-api`, desde que o consumo seja backend/server-side, sem segredo no frontend, com cache/fallback para CTA Google Maps e sem scraping, reviews inventadas ou cópia manual.
