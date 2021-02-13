# Innovating at Home with Emerging Robotics Technologies

*[Read this story on Medium](https://medium.com/swlh/robotics-technologies-26cbe49cb866) or [on my blog](https://colegaw.in/blog/8ff11861-4c7e-4ba1-9b6b-f2ed32303a23)*

While stuck indoors during these past few months, I have had a lot more time on my hands, something which presumably is very common around the world.

If you, like me, are experiencing newfound free time, there’s never been a better time to improve your repertoire as a programmer, builder, and innovator by working with new technologies and homemade robotics.

> The best way to gain knowledge is through experience—this is especially true when it comes to programming and building.

By providing some emerging and innovative concepts in the field of robotics and computing, I hope to offer a way that you can become an innovator with simple homemade robotics projects.

I’ll also share how I used each of these concepts to create a project of my own that demonstrates the real-world applications of these technologies.

# First thing: hardware

Many developers focus only on honing in on their programming skills, and not the real-world applications of such programming. However, especially in the field of robotics, it is advantageous for developers to have valuable knowledge on the uses of tangible products, and to have experience working with not only software but hardware as well.

## Using a Raspberry Pi 4 as a server

The Raspberry Pi is not a new nor “emerging” technology — the first RPi was released in 2012, and it has established itself as an essential part of many hobby or homemade computer projects.

Despite this, Raspberry Pis are proving themselves to be very efficient microcomputers, and Raspberry Pi clusters are becoming more and more popular among developers and early-stage startups. Raspberry Pis are no longer just for hobbyists and low-resource projects. The Raspberry Pi 4 was recently released and featured a faster processor, 4k mini-HDMI ports, and USB-C power supply.

You can treat a Raspberry Pi as your personal in-house server. If you give it power and don’t turn it off, a Raspberry Pi can be a very effective solution for always-on projects. By simply running your server-side application on your Raspberry Pi, you can have a complete backend that runs inside in-house, which can be a very cost-effective solution.

## Controlling robotics components with an Arduino

Like Raspberry Pi, the Arduino has become a necessity in almost all robotics projects. Arduino is a programmable microcomputer that allows its user to control various sensors and moving pieces. Its versatility and user-friendliness make the Arduino one-of-a-kind. Arduinos are used by engineers of all skill levels, from beginners to experienced builders.

Configuring and programming the Arduino is a great way to gain experience controlling robotics components. You can build anything from small projects to full-scale robots and machines. You can program the Arduino using the Arduino IDE, but the Arduino also [supports the Firmata protocol](https://www.arduino.cc/en/reference/firmata). The Arduino IDE only supports the Arduino programming language, but if you opt-in to using Firmata, you have more languages to choose from, including Javascript.

## Bluetooth on Arduino with HC-05 module

When Bluetooth was introduced to mass markets in the late ’90s and early 2000s, it revolutionized the way people used their devices. With Bluetooth, users are able to wirelessly connect and interact with their devices. This functionality is available on Arduino with the HC-05 module.

With Bluetooth on Arduino, you can wirelessly control your robot from a controller, a computer, or even a smartphone. This opens up many possibilities for creative projects with Arduino.

# Next: software

Software is often overlooked in robotics. Many teams tend to focus solely on the hardware aspect of the robot all the while treating software with less priority.

> In fact, software should be of utmost priority to engineers, because lackluster programming can lead to a lackluster final result.

## Program microcomputers in Javascript with Johnny-Five

When you think of programming languages for robotics, Javascript probably doesn’t immediately come to mind. Despite being ranked consistently in the top 5 most used programming languages, Javascript isn’t often used to control low-level machines or robotics.

Johnny-Five is a complete paradigm shift for the world of robotics. It gives developers the ability to program microcomputers like Arduinos in Javascript.

> “Any application that can be written in JavaScript, will eventually be written in JavaScript.”— Jeff Atwood

You can now program your robotics programs in Javascript, a language many developers are most comfortable with. This means that you are able to use the millions of available Node.js packages inside of your robotics programs, which will hopefully lead to many creative robotics projects that are programmed with Javascript!

## Kotlin, the language of tomorrow

Kotlin is a language based on the JVM that compiles to Java or Javascript (as well as native binaries with Kotlin/Native.) Since the release of v1.0 in 2016, Kotlin has become increasingly popular, with users ranging from single-person development teams to large hundred-person teams. After the introduction of Kotlin on Android, it has been called the [“future of Android App Development.”](https://dzone.com/articles/why-kotlin-is-the-future-of-android-app-developmen) However, Kotlin can be used for much more than Android development.

Ktor is a web framework for Kotlin that is [“easy to use, fun and asynchronous”](https://ktor.io/) — from experience I can confirm that is very true. Kotlin has an innovative modern syntax that allows programmers to be more expressive and efficient with their code. Using Ktor, you can write a fully functional backend server in minimal time.

Kotlin also introduces a concept known as “coroutines” which is a unique, cutting-edge take on asynchronous programming. At a very (very) high level, coroutines allow a program to perform multiple tasks at once, and coroutines give developers a pragmatic way to manage those tasks. With these things in mind, you should consider using Kotlin for your next proof-of-concept and/or server-side application.

# Putting it all together

## Planning and ideation

After diving deeper into these exciting technologies in the world of robotics, I challenged myself to create my own unique project. The project I chose was a robot built with an Arduino that would be controlled by my smartphone. I decided that I would set up an application flow that would work as follows:

[https://user-content.gitlab-static.net/142fbaa1ee236abef0637e814d2f7e20a681711f/68747470733a2f2f6d69726f2e6d656469756d2e636f6d2f6d61782f323436322f312a695a395359465555305668794c6a7038536950316b772e706e67](https://user-content.gitlab-static.net/142fbaa1ee236abef0637e814d2f7e20a681711f/68747470733a2f2f6d69726f2e6d656469756d2e636f6d2f6d61782f323436322f312a695a395359465555305668794c6a7038536950316b772e706e67)

This was what I determined would be the most effective way of accomplishing the final product I wanted.

> Remember, software should not be a low priority in your project.

## Robot hardware

I built the robot using some spare metal parts, a breadboard, a battery case, the HC-05 module, two motors, and of course an Arduino. I was very pleased with the final result.

[https://user-content.gitlab-static.net/b862e09bc5293fadf8bddf72f5430102d9c2170a/68747470733a2f2f6d69726f2e6d656469756d2e636f6d2f6d61782f383036342f312a4b496e496c4a796b396a564855676163725f784b53412e6a706567](https://user-content.gitlab-static.net/b862e09bc5293fadf8bddf72f5430102d9c2170a/68747470733a2f2f6d69726f2e6d656469756d2e636f6d2f6d61782f383036342f312a4b496e496c4a796b396a564855676163725f784b53412e6a706567)

Featuring a 3d printed mascot.

[https://user-content.gitlab-static.net/10bb29eb12e4f1cdfca67d59a9aea382547ee203/68747470733a2f2f6d69726f2e6d656469756d2e636f6d2f6d61782f383036342f312a4871536e7645464f613754714d636d566a4634476e772e6a706567](https://user-content.gitlab-static.net/10bb29eb12e4f1cdfca67d59a9aea382547ee203/68747470733a2f2f6d69726f2e6d656469756d2e636f6d2f6d61782f383036342f312a4871536e7645464f613754714d636d566a4634476e772e6a706567)

## Front-end app

[https://user-content.gitlab-static.net/aff8ca2fbf8a377c35fa8047ab1723e027267266/68747470733a2f2f6d69726f2e6d656469756d2e636f6d2f6d61782f313732382f312a636433685a314f444b6e6a5574495f776976764879412e706e67](https://user-content.gitlab-static.net/aff8ca2fbf8a377c35fa8047ab1723e027267266/68747470733a2f2f6d69726f2e6d656469756d2e636f6d2f6d61782f313732382f312a636433685a314f444b6e6a5574495f776976764879412e706e67)

For the front-end app that would control the robot, I wanted to use the phone’s gyroscope to control the robot. This would mean that when you tilt the phone, the robot would move in that direction. It’s a little gimmicky, but in the end, it was very fun to play around with.

I chose to write the app in Flutter so that it would work cross-platform.

The app works by first connecting to the Raspberry Pi server and establishes a connection via WebSockets. Then, it begins to listen to updates from the phone’s gyroscope. Every 250 milliseconds, the app checks for an update, and if it detects one, it will send the updated data back to the RPi server.

I am working on the ability to program routines for the robot to do. This could be anything from a square, to a couple of spins, to a choreographed dance!

# Final thoughts

To be an innovator is to do something your own way, and to not be afraid to try new things. What better way to become an innovator than by gaining new skills in the field of robotics?

I hope that by reading about these concepts and technologies for robotics, you are excited to learn more and that you start to build your own projects. The best way to gain knowledge is through experience; this is especially true when it comes to programming and building. These are only a couple of new technologies in the world of programming and robotics. If you are interested in more of these ideas, I implore you to look into the exciting new innovations made in real-world robotics. These new ideas and technologies are going to change our world.

> “If you want something new, you have to stop doing something old.” — Peter F. Drucker

*This article was written in collaboration with members of FTC Robotics team #10415. Go Warbots!*