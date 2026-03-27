import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoLocalPage extends StatefulWidget {
  final String caminhoVideo;

  const VideoLocalPage({super.key, required this.caminhoVideo});

  @override
  State<VideoLocalPage> createState() => _VideoLocalPageState();
}

class _VideoLocalPageState extends State<VideoLocalPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.caminhoVideo)
      ..initialize().then((_) {
        setState(() {}); // Atualiza a tela quando o vídeo carregar
        _controller.play(); // Começa a tocar automaticamente
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // Libera a memória ao sair da tela
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    VideoPlayer(_controller),
                    VideoProgressIndicator(_controller, allowScrubbing: true),
                  ],
                ),
              )
            : const CircularProgressIndicator(color: Color(0xFF0083B0)),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0083B0),
        onPressed: () {
          setState(() {
            _controller.value.isPlaying ? _controller.pause() : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}