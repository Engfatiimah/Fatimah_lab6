# Little Explorer 🚀

A fun chatbot app for kids (ages 6–10) to learn about planets and space.
Ask about any planet, and it answers **as the planet itself** — in simple,
playful English with fun science comparisons.

Built with **Flutter** and the **Gemini API** (Interactions API).

## Who is it for?

Curious kids (6–10) who love science — especially those learning English.
Also great for parents who want safe, educational screen time.

## Why it helps

Instead of reading a paragraph about Mars, **Mars itself talks to the child** —
answers are short, fun, and always end with a question that keeps curiosity alive.

The chatbot doesn't treat each message separately — every answer is built on
top of the previous question, so the conversation flows like a real dialogue.

## Features

- 🪐 Planets talk in first person ("I am Mars! I'm red because...")
- 🧠 Context-aware answers — each reply builds on the previous question, so follow-ups like "why?" or "how big is that?" work naturally (powered by `previous_interaction_id`)
- 💬 Kid-friendly answers: short, simple, and always ending with a fun question
- ⌨️ Typing indicator while Space Buddy is thinking
- 🌌 Space-themed dark UI

## Tech

- Flutter + Dart
- [dash_chat_2](https://pub.dev/packages/dash_chat_2) for the chat UI
- Gemini Interactions API (`previous_interaction_id` for conversation memory)

## Screenshots



<img width="250"  alt="Simulator Screenshot - iPhone 17 - 2026-09-07 at 16 46 54" src="https://github.com/user-attachments/assets/608983ee-71d3-42fe-9543-50ea13a49432" />
  <img width="250" alt="Chat with a planet" src="https://github.com/user-attachments/assets/054374e8-5711-4953-bb70-bb7914e2cd5d" />
 
