//
//  FAQ.swift
//  Expandable
//
//  Created by Cristian Bermudez Martinez on 21/3/24.
//

import Foundation

struct FAQ {
  var title: String
  var answer: String
}

let faqs = [
  FAQ(title: "What does the annual subscription include?", answer: "Our annual subscription contains more than 150 online courses organized into programming, mathematics, video games, AI or development routes, among others, to get you started in any of our fields. Courses are organized by difficulty, contain instructor support, monthly live access, 24/7 access throughout the month, and regular updates and new versions. Plus, you save the value of 3 months of subscription compared to the monthly subscription."),
  FAQ(title: "In what format are the classes?", answer: "The classes are on video. With a variable duration of between 2 and 30 minutes, and with the possibility of watching the videos as many times as you need"),
  FAQ(title: "Will I have a certificate from the course?", answer: "Yes. Upon completion of the course you will obtain a unique signed digital certificate of the course endorsed by Accredible with blockchain technology that certifies your participation and use of the course."),
  FAQ(title: "Can I take the course from a smartphone or a tablet?", answer: "You can access the course content from any desktop computer and from any mobile device."),
  FAQ(title: "What payment methods can I use?", answer: "Payments are made through the secure Stripe gateway, which accepts payment by card (credit or debit), or through Paypal. You can pay with any currency, since the platform automatically converts to euros. Exceptionally, payment by cryptocurrency will be accepted for annual subscriptions. To opt for this payment method, contact us."),
  FAQ(title: "If I have any questions during the course, who will answer them?", answer: "With basic access to the course, our team will answer all your questions in the same class where you write them. By subscribing to the route or the platform, you will also have access to an exclusive community of students, with some live shows on a monthly basis."),
  FAQ(title: "Do I need an internet connection to access the courses?", answer: "The courses are completely online, so you will need to have an Internet connection to take them."),
  FAQ(title: "I have subscribed. How can I access the courses?", answer: "Once you have signed up for the subscription, you can access it by logging in with your username and password and accessing the 'My courses' option that you will find in your profile."),
  FAQ(title: "Do I have to renew my subscription annually?", answer: "No, by default the subscription will try to renew automatically when the period indicated in the payment is completed. If the card has expired or payment cannot be made, access to the platform will be terminated.")
]
