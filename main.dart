import 'package:flutter/material.dart';

void main() {
  runApp(const MuscleRexApp());
}

class MuscleRexApp extends StatelessWidget {
  const MuscleRexApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/costas': (context) => ExerciseListScreen(group: 'costas'),
        '/biceps': (context) => ExerciseListScreen(group: 'biceps'),
        '/antebraco': (context) => ExerciseListScreen(group: 'antebraco'),
        '/peito': (context) => ExerciseListScreen(group: 'peito'),
        '/triceps': (context) => ExerciseListScreen(group: 'triceps'),
        '/ombro': (context) => ExerciseListScreen(group: 'ombro'),
        '/perna': (context) => ExerciseListScreen(group: 'perna'),
        '/gluteo': (context) => ExerciseListScreen(group: 'gluteo'),
        '/panturrilha': (context) => ExerciseListScreen(group: 'panturrilha'),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/exerciseDetails') {
          final args = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (context) => ExerciseDetailsScreen(
              exerciseName: args['name']!,
            ),
          );
        }
        return null;
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'MuscleRex',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // Profile Picture
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
          ),
          const SizedBox(height: 10),
          // Today Title
          const Text(
            'Today',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // Main Icon Section
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.green[200],
            child: const Icon(
              Icons.fitness_center,
              size: 60,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          // Pull Text
          const Text(
            'Pull',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          // Muscle Groups
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _muscleGroup('assets/back.png', 'Costas', context, '/costas'),
              _muscleGroup('assets/biceps.png', 'Bíceps', context, '/biceps'),
              _muscleGroup('assets/forearm.png', 'Antebraço', context, '/antebraco'),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Push',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          // Push Muscle Groups
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _muscleGroup('assets/chest.png', 'Peito', context, '/peito'),
              _muscleGroup('assets/triceps.png', 'Tríceps', context, '/triceps'),
              _muscleGroup('assets/shoulder.png', 'Ombro', context, '/ombro'),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Legs',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          // Legs Muscle Groups
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _muscleGroup('assets/legs.png', 'Perna', context, '/perna'),
              _muscleGroup('assets/glute.png', 'Glúteo', context, '/gluteo'),
              _muscleGroup('assets/calf.png', 'Panturrilha', context, '/panturrilha'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _muscleGroup(String assetPath, String label, BuildContext context, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.green[200],
            child: Image.asset(
              assetPath,
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class ExerciseListScreen extends StatelessWidget {
  final String group;

  ExerciseListScreen({Key? key, required this.group}) : super(key: key);

  final Map<String, List<Map<String, String>>> exercises = {
    'biceps': [
      {'name': 'Rosca Martelo', 'icon': 'assets/exercicio.png'},
      {'name': 'Rosca Direta', 'icon': 'assets/exercicio.png'},
      {'name': 'Rosca Alternada', 'icon': 'assets/exercicio.png'},
    ],
    'costas': [
      {'name': 'Puxada Frontal', 'icon': 'assets/exercicio.png'},
      {'name': 'Remada Unilateral', 'icon': 'assets/exercicio.png'},
      {'name': 'Puxada Costas', 'icon': 'assets/exercicio.png'},
    ],
    'antebraco': [
      {'name': 'Rosca Inversa', 'icon': 'assets/exercicio.png'},
      {'name': 'Rosca Punho', 'icon': 'assets/exercicio.png'},
    ],
    'peito': [
      {'name': 'Supino Reto', 'icon': 'assets/exercicio.png'},
      {'name': 'Supino Inclinado', 'icon': 'assets/exercicio.png'},
      {'name': 'Crossover', 'icon': 'assets/exercicio.png'},
    ],
    'triceps': [
      {'name': 'Tríceps Testa', 'icon': 'assets/exercicio.png'},
      {'name': 'Mergulho', 'icon': 'assets/exercicio.png'},
      {'name': 'Tríceps Pulley', 'icon': 'assets/exercicio.png'},
    ],
    'ombro': [
      {'name': 'Desenvolvimento', 'icon': 'assets/exercicio.png'},
      {'name': 'Elevação Lateral', 'icon': 'assets/exercicio.png'},
      {'name': 'Arnold Press', 'icon': 'assets/exercicio.png'},
    ],
    'perna': [
      {'name': 'Agachamento', 'icon': 'assets/exercicio.png'},
      {'name': 'Leg Press', 'icon': 'assets/exercicio.png'},
      {'name': 'Avanço', 'icon': 'assets/exercicio.png'},
    ],
    'gluteo': [
      {'name': 'Glúteo 4 apoios', 'icon': 'assets/exercicio.png'},
      {'name': 'Elevação de Quadril', 'icon': 'assets/exercicio.png'},
    ],
    'panturrilha': [
      {'name': 'Panturrilha Sentado', 'icon': 'assets/exercicio.png'},
      {'name': 'Panturrilha em Pé', 'icon': 'assets/exercicio.png'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final exercisesList = exercises[group] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('$group Exercícios'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: exercisesList.length,
        itemBuilder: (context, index) {
          final exercise = exercisesList[index];
          return ListTile(
            leading: Image.asset(
              exercise['icon']!,
              width: 40,
              height: 40,
            ),
            title: Text(exercise['name']!),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/exerciseDetails',
                arguments: {'name': exercise['name']!},
              );
            },
          );
        },
      ),
    );
  }
}

class ExerciseDetailsScreen extends StatelessWidget {
  final String exerciseName;

  const ExerciseDetailsScreen({Key? key, required this.exerciseName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          exerciseName,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                'Detalhes do Exercício',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 4, // For 4 series
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('${index + 1}ª série', style: const TextStyle(fontSize: 18)),
                      _buildInputField('Repetições'),
                      _buildInputField('Peso'),
                      _buildInputField('Descanso'),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String hint) {
    return SizedBox(
      width: 80,
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey[300],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
      ),
    );
  }
}


