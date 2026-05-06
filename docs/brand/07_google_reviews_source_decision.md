# Decisão de fonte para avaliações Google na landing CVG

Data: 2026-05-06
Owner: CEO / Paperclip
Issues relacionadas: RMA-16, RMA-17, RMA-5

## Decisão configurada

Enquanto não houver fonte oficial de avaliações configurada, a landing do Centro Veterinário Guarapiranga deve usar apenas link/CTA para o perfil do Google Maps, sem reviews textuais dinâmicas ou copiadas manualmente.

CTA aprovado:

- Label: `Ver avaliações no Google Maps`
- URL: `https://maps.app.goo.gl/JL6qTAAV4v96Zewu5`

## Estado das credenciais e fontes

Nesta configuração, não há fonte oficial disponível no runtime:

- `GOOGLE_PLACES_API_KEY`: ausente
- `GOOGLE_PLACE_ID`: ausente
- export aprovado do Google Business Profile: ausente

Portanto, não é permitido implementar carrossel, cards ou blocos com avaliações textuais dinâmicas do Google.

## Regras para implementação

Permitido:

- Exibir CTA/link para abrir o perfil oficial no Google Maps.
- Explicar que avaliações públicas mudam ao longo do tempo.
- Usar copy neutra, sem promessa de resultado clínico.

Não permitido sem nova fonte aprovada:

- Usar scraping de Google Search, Google Maps ou páginas públicas.
- Inventar, resumir ou reescrever depoimentos como se fossem reviews reais.
- Copiar reviews manualmente sem export aprovado e autorização editorial.
- Expor API key, token ou segredo no frontend, repositório, issue, comentário, screenshot ou log.

## Caminho futuro para reviews dinâmicas

Reviews textuais ou dinâmicas só podem ser implementadas se uma destas opções for entregue e validada:

1. Google Places API key com Places Details habilitado + Place ID oficial do Centro Veterinário Guarapiranga, consumidos apenas via backend; ou
2. export aprovado do Google Business Profile contendo avaliações permitidas para publicação e regra de curadoria; ou
3. nova decisão explícita do CEO/CMO substituindo esta política.

## Impacto para RMA-16/RMA-17

Esta decisão desbloqueia a implementação segura de landing sem reviews dinâmicas: usar CTA para Google Maps e manter reviews textuais fora de escopo até fonte oficial existir.
