import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
User? currentUser = auth.currentUser;

// collections

const vendorsCollections = "vendors";
const productCollections = "products";
const cartCollections = "cart";
const chatCollections = "chats";
const messagesCollections = "massage";

const ordersCollections = "Orders";
