import 'package:flutter/material.dart';
import 'screen2.dart';

/*class Screen3 extends StatelessWidget {
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Screen 3'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.blue,
          ),
          onPressed: (){
            Navigator.pushNamed(context, '/');
          },
          child: Text('Go Back To Screen 1'),
        ),
      ),
    );
  }
}*/ //code for 1.2 to 1.5 (lab7)

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  late String selectedCandidate;
  @override
  void initState() {
    super.initState();
    selectedCandidate = 'Candidate A'; // Set to the desired default candidate
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vote for Candidate'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Choose a Candidate:'),
            SizedBox(height: 20),
            buildCandidateRadioButton('Candidate A'),
            buildCandidateRadioButton('Candidate B'),
            buildCandidateRadioButton('Candidate C'),
            buildCandidateRadioButton('Candidate D'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedCandidate != null) {
                  // Show a SnackBar to indicate successful vote
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Voted for $selectedCandidate'),
                    ),
                  );
                } else {
                  // Show a SnackBar if no candidate is selected
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please select a candidate'),
                    ),
                  );
                }
              },
              child: Text('Submit Vote'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back to First Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Screen2()),
                );
              },
              child: Text('Employee Details'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCandidateRadioButton(String candidate) {
    return RadioListTile(
      title: Text(candidate),
      value: candidate,
      groupValue: selectedCandidate,
      onChanged: (value) {
        setState(() {
          selectedCandidate = value!;
        });
      },
    );
  }
}
