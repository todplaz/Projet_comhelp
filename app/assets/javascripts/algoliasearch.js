const searchClient = algoliasearch('XRDT1NI3ZK','fbf1725475ec1845c71f24b6ee7fdf89');

const search = instantsearch({
  indexName: 'Post_development',
  searchClient,
  urlSync: true,
  searchFunction(helper) {
    const container = document.querySelector('#hits');
    container.style.display = helper.state.query === '' ? 'none' : '';
    helper.search();
  }
});

search.addWidgets([
  instantsearch.widgets.searchBox({
    container: '#searchbox',
    placeholder: 'Entrez un mot-clé'
  }),
  instantsearch.widgets.hits({
    container: '#hits',
    templates: {
      empty: '<div class="text-center">Aucun résultat trouvé pour votre recherche : <span class="font-weight-bold">{{ query }}</span></div>',
      item: 
        `
          <div class="card mx-auto my-4 shadow" style="width: 25rem;">
          <div class="title my-3 text-center font-weight-bold">{{{_highlightResult.title.value}}}</div>
          <div class="description text-center m-3">{{{_highlightResult.description.value}}}</div>
          </div>
      `
    },
  })
]);

search.start();