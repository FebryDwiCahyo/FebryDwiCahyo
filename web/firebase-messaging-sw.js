importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-messaging-compat.js");

firebase.initializeApp({
    apiKey: 'AIzaSyAQFkapAt8Qa661aZ0RRp4pnMVejuBwd-Y',
    appId: '1:995047399971:web:d3644bb3cb1007dc4c8796',
    messagingSenderId: '995047399971',
    projectId: 'reparin-mobile-9ad64',
    authDomain: 'reparin-mobile-9ad64.firebaseapp.com',
    storageBucket: 'reparin-mobile-9ad64.appspot.com',
    measurementId: 'G-8NNSN4ZVPZ',
});
// Necessary to receive background messages:
const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((m) => {
  console.log("onBackgroundMessage", m);
});