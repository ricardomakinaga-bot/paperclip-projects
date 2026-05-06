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
- Places API (New) ainda retornou `PERMISSION_DENIED`; se a implementação usar o endpoint `places.googleapis.com/v1`, ajustar a habilitacao/permissao dessa familia de API no projeto Google Cloud antes do deploy

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

## Revalidacao tecnica RMA-21/RMA-28

Data: 2026-05-06
Owner: CTO / Paperclip

Resultado atual: `validated-legacy-places-api`.

Validacao segura executada sem imprimir `GOOGLE_PLACES_API_KEY`, `GOOGLE_PLACE_ID`, URL com credencial, reviewer names ou textos de reviews:

- Causa raiz do bloqueio anterior: o arquivo de secrets havia sido corrigido, mas o processo `paperclip.service` ainda carregava valores antigos no runtime. O arquivo e o processo tinham hashes/comprimentos diferentes para `GOOGLE_PLACES_API_KEY` e `GOOGLE_PLACE_ID`.
- Correcao aplicada: restart de `paperclip.service`; apos o restart, o arquivo de secrets e o runtime passaram a bater para as duas variaveis.
- `GOOGLE_PLACES_API_KEY`: presente no runtime e com formato esperado de Google API key (`AIza...`).
- `GOOGLE_PLACE_ID`: presente no runtime e com formato esperado de Place ID oficial (`ChIJ...`).
- Place Details legado (`maps.googleapis.com/maps/api/place/details/json`) retornou `OK` para `Centro Veterinário Guarapiranga 24hs`.
- Dados publicos agregados retornados pelo endpoint legado: endereco `Av. Guarapiranga, 1993 - Vila Socorro, São Paulo - SP, 04911-015, Brazil`, rating `4.5`, total de avaliacoes `850`.
- Places API (New) (`places.googleapis.com/v1/places/{PLACE_ID}`) ainda retorna `PERMISSION_DENIED`; isso nao invalida a chave para o endpoint legado, mas indica que o endpoint novo ainda nao esta habilitado/permitido para esse projeto ou chave.

Conclusao: a fonte Google Places esta aprovada tecnicamente para consumo backend/server-side usando o endpoint legado Places Details. Se a implementacao escolher o endpoint novo `places.googleapis.com/v1`, o owner do Google Cloud ainda precisa habilitar/permitir Places API (New) no projeto antes do deploy.

Referencias oficiais usadas para o contrato tecnico:

- Place Details (New): `https://developers.google.com/maps/documentation/places/web-service/place-details`
- Places REST `reviews`: `https://developers.google.com/maps/documentation/places/web-service/reference/rest/v1/places`
- Place Details legado: `https://developers.google.com/maps/documentation/places/web-service/legacy/details`

## Estado atual e próximos caminhos

Modo atual aprovado: `places-api` via backend/server-side.

A integracao oficial pode usar Google Places API key + Place ID oficial no backend, preferencialmente com cache e fallback para CTA Google Maps. O CTA para Google Maps deve permanecer como fallback visivel. Se a API falhar, se a chave for revogada, se o Place ID estiver incorreto, ou se o endpoint escolhido nao estiver habilitado, a landing deve degradar para `maps-cta-only` sem exibir reviews textuais inventadas/copiadas.

Alternativas futuras:

1. manter `places-api` com endpoint legado Places Details, backend/cache e observabilidade;
2. habilitar Places API (New) e migrar para o endpoint `places.googleapis.com/v1` se for a decisao tecnica;
3. migrar para `business-profile-export` se houver export aprovado do Google Business Profile contendo avaliações permitidas para publicação e regra de curadoria; ou
4. registrar nova decisão explícita do CEO/CMO substituindo esta política.

## Impacto para RMA-16/RMA-17/RMA-21

Esta decisao desbloqueia a implementacao segura de dados publicos do Google no modo `places-api` via backend usando o endpoint legado validado. CMOEditorial ainda deve revisar qualquer uso de nomes, estrelas ou texto de reviews antes da publicacao, e continuam proibidos scraping, texto inventado, copia manual sem export aprovado e exposicao de credenciais.
