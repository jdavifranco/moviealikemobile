// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get helloWorld => 'Ola Mundo!';

  @override
  String get chooseYourMovie => 'Escolha seu filme';

  @override
  String get discoverYourNext => 'Descubra sua próxima';

  @override
  String get experience => 'experiência';

  @override
  String get cinematic => 'cinematográfica';

  @override
  String get findRecommendations => 'Encontre recomendações de filmes e séries baseadas nos seus gostos.';

  @override
  String get home => 'Início';

  @override
  String get movies => 'filmes';

  @override
  String get movie => 'filme';

  @override
  String get series => 'series';

  @override
  String get serie => 'serie';

  @override
  String get popular => 'Populares';

  @override
  String get mostPopular => 'Mais Populares';

  @override
  String get upcoming => 'Em breve';

  @override
  String selectAMovie(String searchType) {
    return 'Selecione um $searchType que você gostou e nossa IA encontrará obras semelhantes com base no seu gosto.';
  }

  @override
  String searchForAMovie(String searchType) {
    return 'Procure um $searchType que você gostou!';
  }

  @override
  String searchResults(String query) {
    return 'Resultados da pesquisa por \"$query\"';
  }

  @override
  String get loadingRecommendations => 'Carregando recomendações';

  @override
  String get yourChoice => 'Sua escolha';

  @override
  String get themes => 'Temas:';

  @override
  String get whyWatch => 'Por que assistir:';

  @override
  String get whereToWatch => 'Onde assistir:';

  @override
  String get settings => 'Configurações';

  @override
  String get about => 'Sobre';

  @override
  String get termsOfService => 'Termos de Serviço';

  @override
  String get privacyPolicy => 'Política de Privacidade';

  @override
  String get openSourceLicenses => 'Licenças de Código Aberto';

  @override
  String get credits => 'Créditos';

  @override
  String get adsDisclosure => 'Divulgação de Anúncios';

  @override
  String get version => 'Versão';

  @override
  String get appInfo => 'Informações do Aplicativo';

  @override
  String get legalPolicies => 'Termos e Políticas';

  @override
  String get tmdbAttribution => 'Este produto utiliza a API do TMDB, mas não é endossado ou certificado pelo TMDB.';

  @override
  String get close => 'Fechar';

  @override
  String get errorLaunchingUrl => 'Falha ao abrir o link. Por favor, tente novamente mais tarde.';

  @override
  String get back => 'Voltar';

  @override
  String get favorite => 'Favoritar';

  @override
  String get unfavorite => 'Desfavoritar';

  @override
  String get overview => 'Visão Geral';

  @override
  String get castAndCrew => 'Elenco e Equipe';

  @override
  String get recommendations => 'Recomendações';

  @override
  String get gallery => 'Galeria';

  @override
  String get play => 'Assistir';

  @override
  String get download => 'Baixar';

  @override
  String get externalLink => 'Link Externo';

  @override
  String get minutes => 'minutos';

  @override
  String get unknownGenre => 'Gênero desconhecido';

  @override
  String get loading => 'Carregando...';

  @override
  String get errorLoadingImage => 'Erro ao carregar imagem';

  @override
  String get noOverviewAvailable => 'Nenhuma visão geral disponível.';

  @override
  String get noCastMembersAvailable => 'Nenhum membro do elenco disponível.';

  @override
  String get noRecommendationsAvailable => 'Nenhuma recomendação disponível.';

  @override
  String get appDescription =>
      'Bem-vindo ao Movie Alike! Este aplicativo foi criado para ajudar você a descobrir filmes semelhantes aos seus favoritos. Usamos algoritmos avançados para sugerir recomendações personalizadas com base no filme selecionado. Navegue por uma vasta coleção de filmes e séries, encontre novos favoritos e compartilhe suas descobertas com amigos. Aproveite sua experiência cinematográfica!';

  @override
  String get adsDisclosureDescription =>
      'Este aplicativo exibe anúncios para apoiar seu desenvolvimento. Ao usar este aplicativo, você concorda com a exibição de anúncios.';

  @override
  String get seeMore => 'Ver mais';

  @override
  String get searchHint => 'Pesquise um título...';

  @override
  String get search => 'Buscar';

  @override
  String get errorMessage => 'Ops! Algo deu errado. Por favor, tente novamente mais tarde.';

  @override
  String get tryAgain => 'Tentar novamente';

  @override
  String get noResults => 'Nenhum resultado encontrado.';

  @override
  String get noResultsDescription =>
      'Não encontramos nenhum resultado para sua pesquisa. Por favor, tente novamente com uma palavra-chave diferente.';

  @override
  String get availableOn => 'Disponível em';

  @override
  String get genres => 'Gêneros';

  @override
  String get productionCountries => 'Países de Produção';

  @override
  String get productionCompanies => 'Empresas de Produção';

  @override
  String get trailersAndVideos => 'Trailers e Vídeos';

  @override
  String get watchlist => 'Watchlist';

  @override
  String get searchMovies => 'Buscar filmes';

  @override
  String get addMovieToWatchlist => 'Adicionar filme à sua lista';

  @override
  String get yourWatchlistIsEmpty => 'Sua lista de filmes está vazia.';

  @override
  String get loginRequired => 'Login necessário';

  @override
  String get loginRequiredMessage => 'Você precisa fazer login para acessar esta função.';

  @override
  String get highlyRecommended => 'Altamente recomendado';

  @override
  String get similar => 'Similar';

  @override
  String get related => 'Relacionado';

  @override
  String get trailer => 'Trailer';

  @override
  String get premium => 'Premium';

  @override
  String get errorNoInternet => 'Sem Conexão com a Internet';

  @override
  String get errorNoInternetMessage => 'Por favor, verifique sua conexão com a internet e tente novamente.';

  @override
  String get errorTimeout => 'Tempo Limite Excedido';

  @override
  String get errorTimeoutMessage => 'A solicitação demorou muito. Por favor, verifique sua conexão e tente novamente.';

  @override
  String get errorServer => 'Erro do Servidor';

  @override
  String get errorServerMessage =>
      'Nossos servidores estão temporariamente indisponíveis. Por favor, tente mais tarde.';

  @override
  String get errorNotFound => 'Não Encontrado';

  @override
  String get errorNotFoundMessage => 'O conteúdo solicitado não foi encontrado.';

  @override
  String get errorAuthentication => 'Erro de Autenticação';

  @override
  String get errorAuthenticationMessage => 'A autenticação falhou. Por favor, tente novamente.';

  @override
  String get errorAuthorization => 'Acesso Negado';

  @override
  String get errorAuthorizationMessage => 'Você não tem permissão para acessar este recurso.';

  @override
  String get errorValidation => 'Dados Inválidos';

  @override
  String get errorValidationMessage => 'Por favor, verifique sua entrada e tente novamente.';

  @override
  String get errorUnknown => 'Erro Inesperado';

  @override
  String get errorUnknownMessage => 'Algo deu errado. Por favor, tente novamente.';

  @override
  String get errorGenericTitle => 'Ops! Algo deu errado';

  @override
  String get errorGenericMessage => 'Ocorreu um erro inesperado. Por favor, tente mais tarde.';

  @override
  String get noDescriptionAvailable => 'Nenhuma descrição disponível para esta empresa.';

  @override
  String get websiteAvailable => 'Website disponível';

  @override
  String get seeLess => 'Ver menos';

  @override
  String get biography => 'Biografia';

  @override
  String moviesWithPerson(String person) {
    return 'Filmes com $person';
  }

  @override
  String moviesFromCompany(String company) {
    return 'Filmes de $company';
  }

  @override
  String moviesDirectedBy(String person) {
    return 'Filmes dirigidos por $person';
  }

  @override
  String moviesProducedBy(String company) {
    return 'Filmes produzidos por $company';
  }

  @override
  String get thisPerson => 'esta pessoa';

  @override
  String get thisCompany => 'esta empresa';

  @override
  String get details => 'Detalhes';

  @override
  String get noMoviesFound => 'Nenhum filme encontrado';
}
