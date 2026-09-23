#!/usr/bin/env bash

mapfile -t quotes <<'QUOTES'
"Stay hungry, stay foolish." — Steve Jobs
"First, solve the problem. Then, write the code." — John Johnson
"Simplicity is prerequisite for reliability." — Edsger W. Dijkstra
"Programs must be written for people to read." — Harold Abelson
"Make it work, make it right, make it fast." — Kent Beck
"The best error message is the one that never shows up." — Thomas Fuchs
"Discipline is choosing between what you want now and what you want most." — Abraham Lincoln
"Small progress every day adds up to big results."
"Consistency beats intensity when intensity is unsustainable."
"Don’t watch the clock; do what it does. Keep going." — Sam Levenson
"Happiness is like being cool: the harder you try, the less it is going to happen. So stop trying. Start living."
"When you choose what to watch or read, you are choosing your future thoughts and perspectives. Consume what you’d like to become."
"Action relieves anxiety. Working on a problem reduces the fear of it."
"Your capacity for excellence is inversely proportional to the number of your commitments."
"Focus on the seeds, not the trees. What seeds are you planting today?"
"I have no special talent. I am only passionately curious." — Albert Einstein
"Focus requires subtraction."
“The cheapest, fastest, and most reliable components of a computer system are those that aren't there.” — Gordon Bell
“The purpose of abstraction is not to be vague, but to create a new semantic level in which one can be absolutely precise.” — Edsger W. Dijkstra
“Computer science is no more about computers than astronomy is about telescopes.” — Michael R. Fellows
“Programs must be written for people to read, and only incidentally for machines to execute.” — Harold Abelson & Gerald Jay Sussman
“What I cannot create, I do not understand.” — Richard Feynman
"If you can believe in GODS you never saw then it shouldn't be hard for you to believe in the person you see everyday in the mirror." — Abhishek Raj
“The key to performance is elegance, not battalions of special cases.” — Jon Bentley
“The purpose of computing is insight, not numbers.” — Richard Hamming
“Any sufficiently advanced compiler is indistinguishable from an optimizing theorem prover.” — Adapted from Arthur C. Clarke's formulation
“There are only two hard things in Computer Science: cache invalidation and naming things.” — Phil Karlton
“All problems in computer science can be solved by another level of indirection.” — David Wheeler
“…except for the problem of too many layers of indirection.”
"The real problem is not whether machines think but whether men think." — B. F. Skinner
"A language that doesn't affect the way you think about programming is not worth knowing." — Alan J. Perlis
"The competent programmer is fully aware of the strictly limited size of his own skull." — Edsger W. Dijkstra
"Program testing can be used to show the presence of bugs, but never to show their absence!" — Edsger W. Dijkstra
"Beware of bugs in the above code; I have only proved it correct, not tried it." — Donald Knuth
"What you see is what you get."
"The limits of my language mean the limits of my world." — Ludwig Wittgenstein
“An ISA is a contract: software assumes its semantics; hardware assumes software will obey them.”
“An operating system is an illusion carefully maintained by mechanisms.”
“Processes are abstractions of execution; virtual memory is an abstraction of storage; the kernel is where those abstractions meet physical reality.”
“Every convenient abstraction in an operating system is paid for somewhere—in memory, latency, synchronization, or complexity.”
“Concurrency does not make programs faster by magic; it exposes the structure of work to the machine.”
“A distributed system is one in which the failure of a computer you didn't even know existed can render your own computer unusable.” — Leslie Lamport
“Time, clocks, and the ordering of events in a distributed system.” — Leslie Lamport
“Security is not a product, but a process.” — Bruce Schneier
“The only truly secure system is one that is powered off, cast in a block of concrete and sealed in a lead-lined room with armed guards.” — Gene Spafford
“Security is a chain; the attacker only needs one weak link.”
“A security boundary is only as strong as the assumptions crossing it.”
“Every privilege is an assumption about who is allowed to cause which state transition.”
“Computer science is a branch of mathematics in which we prove theorems about computations.”
“An algorithm is a mathematical object before it is a program.”
“Correctness is not an emergent property of working code.”
“Complexity is not merely how long a program takes; it is the structure of the resources required by computation.”
“An invariant is a piece of truth that survives execution.”
“The machine has no abstractions. It has state transitions.”
“Every program is ultimately a transformation of machine state.”
“Software is the art of constructing reliable abstractions over unreliable physical processes.”
“A compiler translates semantics into mechanisms.”
“Optimization is the disciplined exploitation of invariants.”
“Correctness is an invariant maintained across representations.”
“The higher the abstraction, the more important it becomes to know what lies beneath it.”
“Hardware executes states; software organizes them into meaning.”
“A cache is a bet about the future. A branch predictor is a bet about control flow.”
“Virtual memory is not memory; it is a carefully engineered illusion of memory.”
“Concurrency is the study of possible histories.”
“Distributed computing is what happens when you try to maintain a single idea of reality across machines that cannot share a clock.”
“Every abstraction hides complexity; every performance problem eventually asks you to uncover it.”
“The kernel is where software stops pretending that hardware is simple.”
“A compiler is not a translator between languages. It is a translator between models of computation.”
“Understand the mathematics. Understand the abstraction. Understand the implementation. Understand the machine.”
“Reason from first principles. Descend the abstraction stack.”
“Until you make the unconscious conscious, it will direct your life and you will call it fate.” — Carl Jung
“Knowing yourself is the beginning of all wisdom.” — Aristotle
“The greatest discovery of my generation is that a human being can alter his life by altering his attitudes.” — William James
“We cannot solve problems with the same thinking we used when we created them.” — often attributed to Albert Einstein; attribution is disputed.
“He who knows others is wise; he who knows himself is enlightened.” — Lao Tzu
“People are just as happy as they make up their minds to be.” — Abraham Lincoln
“Man is not a rational animal; he is a rationalizing animal.” — commonly attributed to Robert Heinlein; attribution is uncertain.
“The most important thing is to be able at any moment to sacrifice what we are for what we could become.” — Charles Du Bos
“When we are no longer able to change a situation, we are challenged to change ourselves.” — Viktor Frankl
“He who has a why to live can bear almost any how.” — Friedrich Nietzsche
“What does not kill me makes me stronger.” — Friedrich Nietzsche
“In the midst of winter, I found there was, within me, an invincible summer.” — Albert Camus
“The wound is the place where the Light enters you.” — often attributed to Rumi
“Between stimulus and response there is a space. In that space is our power to choose our response.” — commonly attributed to Viktor Frankl
“We are what we repeatedly do. Excellence, then, is not an act, but a habit.” — Will Durant, summarizing Aristotle
“The chains of habit are too weak to be felt until they are too strong to be broken.” — Samuel Johnson
“Nothing is particularly hard if you divide it into small jobs.” — Henry Ford
“Do not wait for the perfect moment. Take the moment and make it perfect.” — often attributed to Zoey Sayward; attribution varies.
“People will do anything, no matter how absurd, in order to avoid facing their own soul.” — Carl Jung
“One does not become enlightened by imagining figures of light, but by making the darkness conscious.” — Carl Jung
“Loneliness does not come from having no people around you, but from being unable to communicate the things that seem important to you.” — Carl Jung
“The privilege of a lifetime is to become who you truly are.” — often attributed to Carl Jung; wording/source is disputed.
“Until you make the unconscious conscious, it will direct your life and you will call it fate.” — Carl Jung
“Know thyself.” — Ancient Greek maxim
“Amor fati. (Love of fate.)” — Nietzsche
“Become who you are.” — Nietzsche
“The unexamined life is not worth living.” — Socrates, as recorded by Plato
“Nothing to excess.” — Ancient Greek maxim
“What you seek is seeking you.” — often attributed to Rumi
“We suffer more often in imagination than in reality.” — Seneca
“Free software is a matter of liberty, not price.” — Richard Stallman
“When software is free, users can control the program, not the other way around.” — Richard Stallman, paraphrased
“The freedom to run the program, for any purpose.” — Richard Stallman, on the Free Software Definition
“The freedom to study how the program works, and change it so it does your computing as you wish.” — Richard Stallman
“The freedom to redistribute copies so you can help your neighbor.” — Richard Stallman
“The freedom to distribute copies of your modified versions to others.” — Richard Stallman
“Given enough eyeballs, all bugs are shallow.” — Eric S. Raymond
“Talk is cheap. Show me the code.” — Linus Torvalds
“Bad programmers worry about the code. Good programmers worry about data structures and their relationships.” — Linus Torvalds
“If you think your users are idiots, only idiots will use it.” — Linus Torvalds
“I'm a big believer that the Linux kernel should be small and simple.” — Linus Torvalds
"And keep it simple, stupid!"
"Hackers should be free to do whatever they want.” — Linus Torvalds, broadly reflecting hacker culture rather than a precise canonical quotation.
“Information wants to be free.” — commonly attributed to Stewart Brand
“The best way to predict the future is to invent it.” — Alan Kay
“Simple things should be simple, complex things should be possible.” — Alan Kay
“The computer revolution hasn't happened yet.” — Alan Kay
“Write programs that do one thing and do it well.” — Unix philosophy, commonly associated with Doug McIlroy
“Write programs to work together.” — Unix philosophy
“Write programs to handle text streams, because that is a universal interface.” — Unix philosophy
“Everything is a file.” — perhaps the most important Unix principle.
“If you cannot inspect it, you do not fully own it.”
“Open source is not merely access to code; it is access to the mechanism.”
“Read the source. Change the source. Build the source. Understand the system.”
“Don't ask what the software allows you to do. Ask what the source allows you to change.”
“The ultimate abstraction is the one you are still free to dismantle.”
“Freedom in software begins where the source becomes readable.”
“A binary tells you what the machine was given. Source tells you why.”
“The best documentation for a system is sometimes the system itself.”
“Don't merely run the software. Understand it well enough to rebuild it.”
“Become who you are.” — Friedrich Nietzsche
“The privilege of a lifetime is to become who you truly are.” — commonly attributed to Carl Jung; attribution is uncertain
“What you are, you are by accident of birth; what you become, you are by yourself.” — commonly attributed to Ralph Waldo Emerson; attribution is uncertain
“Life can only be understood backwards; but it must be lived forwards.” — Søren Kierkegaard
“No man ever steps in the same river twice, for it’s not the same river and he’s not the same man.” — commonly attributed to Heraclitus; the wording is a later paraphrase.
“The journey is the reward.” — often attributed to Steve Jobs; attribution is disputed.
“Success is the sum of small efforts, repeated day in and day out.” — commonly attributed to Robert Collier; wording varies.
“Excellence is not an act, but a habit.” — Will Durant, summarizing Aristotle
“Great things are done by a series of small things brought together.” — Vincent van Gogh
“We must all suffer one of two things: the pain of discipline or the pain of regret.” — commonly attributed to Jim Rohn
“He who conquers himself is the mightiest warrior.” — commonly attributed to Confucius; attribution is uncertain
“First say to yourself what you would be; and then do what you have to do.” — Epictetus
“If you are going through hell, keep going.” — commonly attributed to Winston Churchill; attribution is disputed.
“Our greatest glory is not in never falling, but in rising every time we fall.” — commonly attributed to Confucius; attribution is uncertain.ake quote.sh output the quote and attribution separately
“Fall seven times, stand up eight.” — Japanese proverb
“Failure is simply the opportunity to begin again, this time more intelligently.” — commonly attributed to Henry Ford
“It does not matter how slowly you go as long as you do not stop.” — commonly attributed to Confucius; attribution is uncertain.
“He who has a why to live can bear almost any how.” — Friedrich Nietzsche
“When we are no longer able to change a situation, we are challenged to change ourselves.” — Viktor Frankl
“In the midst of winter, I found there was, within me, an invincible summer.” — Albert Camus
“The wound is the place where the Light enters you.” — commonly attributed to Rumi
“It is not that we have a short time to live, but that we waste a lot of it.” — Seneca
“You could leave life right now. Let that determine what you do and say and think.”
“Become who you are.” — Friedrich Nietzsche
“The privilege of a lifetime is to become who you truly are.” — commonly attributed to Carl Jung; attribution is uncertain
“What you are, you are by accident of birth; what you become, you are by yourself.” — commonly attributed to Ralph Waldo Emerson; attribution is uncertain
“Life can only be understood backwards; but it must be lived forwards.” — Søren Kierkegaard
“No man ever steps in the same river twice, for it’s not the same river and he’s not the same man.” — commonly attributed to Heraclitus; the wording is a later paraphrase.
“The journey is the reward.” — often attributed to Steve Jobs; attribution is disputed.
“Success is the sum of small efforts, repeated day in and day out.” — commonly attributed to Robert Collier; wording varies.
“Excellence is not an act, but a habit.” — Will Durant, summarizing Aristotle
“Great things are done by a series of small things brought together.” — Vincent van Gogh
“We must all suffer one of two things: the pain of discipline or the pain of regret.” — commonly attributed to Jim Rohn
“He who conquers himself is the mightiest warrior.” — commonly attributed to Confucius; attribution is uncertain
“First say to yourself what you would be; and then do what you have to do.” — Epictetus
“If you are going through hell, keep going.” — commonly attributed to Winston Churchill; attribution is disputed.
“Our greatest glory is not in never falling, but in rising every time we fall.” — commonly attributed to Confucius; attribution is uncertain.
“Fall seven times, stand up eight.” — Japanese proverb
“Failure is simply the opportunity to begin again, this time more intelligently.” — commonly attributed to Henry Ford
“It does not matter how slowly you go as long as you do not stop.” — commonly attributed to Confucius; attribution is uncertain.
“He who has a why to live can bear almost any how.” — Friedrich Nietzsche
“When we are no longer able to change a situation, we are challenged to change ourselves.” — Viktor Frankl
“In the midst of winter, I found there was, within me, an invincible summer.” — Albert Camus
“The wound is the place where the Light enters you.” — commonly attributed to Rumi
“It is not that we have a short time to live, but that we waste a lot of it.” — Seneca
“You could leave life right now. Let that determine what you do and say and think.” — Marcus Aurelius
“The trouble is, you think you have time.” — commonly attributed to Buddha; attribution is uncertain.
“Do not act as if you had ten thousand years to live.” — Marcus Aurelius
“Life can only be understood backwards; but it must be lived forwards.” — Kierkegaard
“He who has a why to live can bear almost any how.” — Nietzsche
“Until you make the unconscious conscious, it will direct your life and you will call it fate.” — Jung
“The unexamined life is not worth living.” — Socrates, as recorded by Plato
“One must imagine Sisyphus happy.” — Albert Camus
“What matters is not to live, but to live well.” — Socrates, as recorded by Plato
“No mud, no lotus.” — Thích Nhất Hạnh
“Do not optimize the appearance of your life. Optimize the process that produces it.”
“Your life is the accumulated output of your repeated decisions.”
“You do not discover who you are. You construct who you become.”
“A life is not changed by a single decision, but by the decisions that become a process.”
“The person you become is the consequence of what you repeatedly tolerate, practice, and pursue.”
“Do not measure your life only by where you are. Measure it by the direction in which you are moving.”
“The goal is not to arrive unchanged. The goal is to become capable of arriving somewhere worth reaching.”
“A complex life, like a complex system, is not built in a single operation. It emerges from simple processes executed consistently over time.”— Marcus Aurelius
“The trouble is, you think you have time.” — commonly attributed to Buddha; attribution is uncertain.
“Do not act as if you had ten thousand years to live.” — Marcus Aurelius
“Life can only be understood backwards; but it must be lived forwards.” — Kierkegaard
“He who has a why to live can bear almost any how.” — Nietzsche
“Until you make the unconscious conscious, it will direct your life and you will call it fate.” — Jung
“The unexamined life is not worth living.” — Socrates, as recorded by Plato
“One must imagine Sisyphus happy.” — Albert Camus
“What matters is not to live, but to live well.” — Socrates, as recorded by Plato
“No mud, no lotus.” — Thích Nhất Hạnh
“Do not optimize the appearance of your life. Optimize the process that produces it.”
“Your life is the accumulated output of your repeated decisions.”
“You do not discover who you are. You construct who you become.”
“A life is not changed by a single decision, but by the decisions that become a process.”
“The person you become is the consequence of what you repeatedly tolerate, practice, and pursue.”
“Do not measure your life only by where you are. Measure it by the direction in which you are moving.”
“The goal is not to arrive unchanged. The goal is to become capable of arriving somewhere worth reaching.”
“A complex life, like a complex system, is not built in a single operation. It emerges from simple processes executed consistently over time.”
<<<<<<< HEAD
“Much of our behavior is a result of our environment.” — Richard Thaler
“Losses loom larger than gains.” — Amos Tversky & Daniel Kahneman
“People have a tendency to discount the future.”
“A commitment device is a means with which to lock oneself into a course of action that one might not otherwise pursue.” — Thomas Schelling
“The abundance of choice can lead to anxiety, indecision, and dissatisfaction.” — idea associated with Barry Schwartz's The Paradox of Choice
“People make estimates by starting from an initial value that is adjusted to yield the final answer.” — Daniel Kahneman & Amos Tversky
“The sunk-cost effect is the greater tendency to continue an endeavor once an investment in money, effort, or time has been made.” — Arkes & Blumer
“People use mental accounting to organize, evaluate, and keep track of financial activities.” — Richard Thaler
“The present is disproportionately important.”
[Social Proof] “The actions of others are often a source of information about what is appropriate.”
“If I were designing my life from zero today, would I choose this arrangement?”
"Nudge"
"There is no honest and true work, carried along with constant and sincere purpose that ever really fails." — William George Jordan
QUOTES

count=${#quotes[@]}
if (( count == 0 )); then
  exit 1
fi

# index=$((RANDOM % count))
# printf '%s\n' "${quotes[index]}"

quote="${quotes[$((RANDOM % count))]}"
wrapped=$(printf '%s\n' "$quote" | fold -s -w 80)
printf '%s\n' "$wrapped"
