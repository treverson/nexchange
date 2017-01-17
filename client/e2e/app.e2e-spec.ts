import { NexchangePage } from './app.po';

describe('nexchange App', function() {
  let page: NexchangePage;

  beforeEach(() => {
    page = new NexchangePage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
