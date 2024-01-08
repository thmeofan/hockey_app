
class VideoModel {
  final String id;
  final String title;
  final String videoUrl;

  VideoModel({required this.id, required this.title, required this.videoUrl});

  String get videoId {
    Uri uri = Uri.parse(videoUrl);
    if (uri.host == 'youtu.be') {
      return uri.pathSegments.last;
    } else if (uri.host == 'www.youtube.com' || uri.host == 'youtube.com') {
      return uri.queryParameters['v']!;
    }
    throw Exception('Invalid YouTube URL');
  }
}

final List<VideoModel> videos = [
  VideoModel(
    id: '1',
    title: 'The 2024 NHL Season Is Getting Ugly',
    videoUrl: 'https://youtu.be/r9IQ1f3TIjs',
  ),
  VideoModel(
    id: '2',
    title: 'When You Realize The NHL Can’t Stop You',
    videoUrl: 'https://youtu.be/9wqUO5WZf-w',
  ),
  VideoModel(
    id: '3',
    title: 'When A \'Lucky\' Bounce Created Hockey History',
    videoUrl: 'https://youtu.be/OBgopamt4H4',
  ),
  VideoModel(
    id: '4',
    title: 'This Should’ve Never Happened in The NHL.',
    videoUrl: 'https://youtu.be/zOmRMBrDY3Q',
  ),
  VideoModel(
    id: '5',
    title: 'How To Ruin An NHL Superstar',
    videoUrl: 'https://youtu.be/roPv-zxssoA',
  ),
  VideoModel(
    id: '6',
    title: 'When A Hockey Game Sparked A Riot',
    videoUrl: 'https://youtu.be/GgsGmMeZs-k',
  ),
  VideoModel(
    id: '7',
    title: 'NHL Dirtiest Hits Of All Time',
    videoUrl: 'https://youtu.be/5fA_Enl2FCc',
  ),
  VideoModel(
    id: '8',
    title: '20 WILDEST Moments In NHL History',
    videoUrl: 'https://youtu.be/ce8fsmb4yXU',
  ),
  VideoModel(
    id: '9',
    title: 'NHL: Game Misconducts',
    videoUrl: 'https://youtu.be/g2Lt2cGpM0A',
  ),
  VideoModel(
    id: '10',
    title: 'NHL: Goalies Getting Hit Part 7',
    videoUrl: 'https://youtu.be/4nKhKkw9TC8',
  ),
];
