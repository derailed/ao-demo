import { AowebPage } from './app.po';

describe('aoweb App', function() {
  let page: AowebPage;

  beforeEach(() => {
    page = new AowebPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
