import '../models/author_model/author_model.dart';

class AuthorDataSource {
  static const List<AuthorModel> popularAuthors = [
    AuthorModel(
      authorName: 'Stephen King',
      authorImagePath:
          'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/authors/1362814142i/3389._UX200_CR0,0,200,200_.jpg',
    ),
    AuthorModel(
      authorName: 'J.K. Rowling',
      authorImagePath:
          'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/authors/1596216614i/1077326._UX200_CR0,0,200,200_.jpg',
    ),
    AuthorModel(
        authorName: 'Michelle Obama',
        authorImagePath:
            'https://www.shutterstock.com/image-photo/bangkok-jan-29-waxwork-michelle-260nw-371005931.jpg'),
    AuthorModel(
        authorName: 'Malcolm Gladwell',
        authorImagePath:
            'https://dev.speakersla.com/wp-content/uploads/2015/03/Malcolm-Gladwell.jpg'),
    AuthorModel(
        authorName: 'Brandon Sanderson',
        authorImagePath:
            'https://yt3.googleusercontent.com/nfuxYKdKi_Y6cVrE3uc8PT3unSqgcL3eekHvnQfSBbhry4P31-yNO7O2Qs-d82aIxZ9uHiqe5g=s900-c-k-c0x00ffffff-no-rj'),
    AuthorModel(
      authorName: 'Colleen Hoover',
      authorImagePath:
          'https://tse2.mm.bing.net/th?id=OIP.sSbSH7dsrRdHTVGuwgdwBwHaHY&pid=Api',
    ),
    AuthorModel(
      authorName: 'James Clear',
      authorImagePath:
          'https://tse2.mm.bing.net/th?id=OIP.s5YZ1W09nV9bYsuIgvWGLwHaHa&pid=Api',
    ),
    AuthorModel(
      authorName: 'Agatha Christie',
      authorImagePath:
          'https://tse2.mm.bing.net/th?id=OIP.wMNxHOxfMFowtOhbb3hfpgHaIn&pid=Api',
    ),
    AuthorModel(
        authorName: 'Dan Brown',
        authorImagePath: 'https://images4.penguinrandomhouse.com/author/3446'),
    AuthorModel(
        authorName: 'Margaret Atwood',
        authorImagePath:
            'https://naccnaca-biographies.s3.amazonaws.com/30651/2012_-_margaret_atwood_-_photo_by_jean_malek.jpg'),
  ];
}
