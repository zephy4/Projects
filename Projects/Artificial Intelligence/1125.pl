% Define symptoms for each medical condition
symptom(myocardial_infarction, [chest_pain, shortness_of_breath, nausea, sweating, fatigue]).
symptom(congestive_heart_failure, [shortness_of_breath, edema, fatigue, cough]).
symptom(pulmonary_edema, [shortness_of_breath, wheezing, pink_frothy_sputum, anxiety]).
symptom(left_ventricular_failure, [shortness_of_breath, fatigue, dizziness, weakness]).
symptom(rheumatic_fever, [fever, joint_pain, rash, inflammation]).
symptom(hypertrophic_cardiomyopathy, [shortness_of_breath, chest_pain, dizziness, fainting]).
symptom(atrial_fibrillation, [irregular_heartbeat, palpitations, fatigue, dizziness]).
symptom(endocarditis, [fever, chills, fatigue, weight_loss, joint_pain]).

% Predicate to ask for symptoms
ask_symptoms([]).
ask_symptoms([Symptom|Rest]) :-
    format('Do you have ~w? (yes/no): ', [Symptom]),
    read(Response),
    (Response = yes ; Response = y),
    ask_symptoms(Rest).

% Predicate to check if a person has all symptoms for a particular condition
has_symptoms(Condition, Symptoms) :-
    symptom(Condition, Symptoms),
    ask_symptoms(Symptoms).

% Predicate to diagnose a condition based on symptoms
diagnose_condition(Condition) :-
    symptom(Condition, Symptoms),
    writeln('Please answer the following questions with yes/no:'),
    has_symptoms(Condition, Symptoms),
    writeln('--------------------------------------------------'),
    writeln('Based on the symptoms provided, you may have:'),
    writeln(Condition),
    writeln('Please consult a healthcare professional for further evaluation and treatment.').

% Entry point of the program
start_diagnosis :-
    writeln('Welcome to the medical condition diagnosis system.'),
    writeln('--------------------------------------------------'),
    (   diagnose_condition(myocardial_infarction)
    ;   diagnose_condition(congestive_heart_failure)
    ;   diagnose_condition(pulmonary_edema)
    ;   diagnose_condition(left_ventricular_failure)
    ;   diagnose_condition(rheumatic_fever)
    ;   diagnose_condition(hypertrophic_cardiomyopathy)
    ;   diagnose_condition(atrial_fibrillation)
    ;   diagnose_condition(endocarditis)
    ),
    writeln('--------------------------------------------------'),
    writeln('Thank you for using the system.').
