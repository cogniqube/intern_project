import 'package:flutter/material.dart';
import 'package:intern_project/pages/profile/service_info.dart'; 

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
         backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
 Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) =>  ServiceInformationScreen()), // Replace with your LoginScreen widget
              );
          }
        ),
        title: const Text('Terms and conditions'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Article(
                title: 'Article 1 (Purpose)',
                content:
                    'Thank you for using the service provided by OneQ Co., Ltd. (hereinafter referred to as "Company"). The company is a company that makes it more convenient for you to use various Internet and mobile services. These terms and conditions stipulate basic matters such as rights, obligations and responsibilities, conditions and procedures required to use the service, so please take a little time to read them carefully.',
              ),
              Article(
                title: 'Article 1 (Purpose)',
                content:
                    'Thank you for using the service provided by OneQ Co., Ltd. (hereinafter referred to as "Company"). The company is a company that makes it more convenient for you to use various Internet and mobile services. These terms and conditions stipulate basic matters such as rights, obligations and responsibilities, conditions and procedures required to use the service, so please take a little time to read them carefully.',
              ),
              Article(
                title: 'Article 1 (Purpose)',
                content:
                    'Thank you for using the service provided by OneQ Co., Ltd. (hereinafter referred to as "Company"). The company is a company that makes it more convenient for you to use various Internet and mobile services. These terms and conditions stipulate basic matters such as rights, obligations and responsibilities, conditions and procedures required to use the service, so please take a little time to read them carefully.',
              ),
              Article(
                title: 'Article 1 (Purpose)',
                content:
                    'Thank you for using the service provided by OneQ Co., Ltd. (hereinafter referred to as "Company"). The company is a company that makes it more convenient for you to use various Internet and mobile services. These terms and conditions stipulate basic matters such as rights, obligations and responsibilities, conditions and procedures required to use the service, so please take a little time to read them carefully.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Article extends StatelessWidget {
  final String title;
  final String content;

  const Article({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(content),
        ],
      ),
    );
  }
}