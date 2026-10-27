-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Окт 27 2026 г., 17:46
-- Версия сервера: 10.4.28-MariaDB
-- Версия PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `medical_championship`
--

-- --------------------------------------------------------

--
-- Структура таблицы `clinical_data_all`
--

CREATE TABLE `clinical_data_all` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `measurement_type` varchar(100) NOT NULL,
  `measurement_value` decimal(10,2) NOT NULL,
  `unit` varchar(30) NOT NULL,
  `measured_at` datetime NOT NULL,
  `source` enum('manual','device','laboratory') NOT NULL DEFAULT 'manual',
  `notes` text DEFAULT NULL
) ;

--
-- Дамп данных таблицы `clinical_data_all`
--

INSERT INTO `clinical_data_all` (`id`, `patient_id`, `measurement_type`, `measurement_value`, `unit`, `measured_at`, `source`, `notes`) VALUES
(1, 1, 'Давление', 100.00, 'мм рт.ст.', '2026-10-27 10:28:25', 'manual', NULL),
(2, 1, 'Давление', 110.00, 'мм рт.ст.', '2026-10-27 10:28:40', 'manual', NULL),
(3, 1, 'Давление', 140.00, 'мм рт.ст.', '2026-10-27 10:28:55', 'manual', NULL),
(4, 1, 'Сахар', 5.00, 'ммоль\\л', '2026-10-27 10:29:09', 'manual', NULL),
(5, 1, 'Сахар', 5.20, 'ммоль\\л', '2026-10-27 10:30:06', 'manual', NULL),
(6, 1, 'Сахар', 5.40, 'ммоль\\л', '2026-10-27 10:30:24', 'manual', NULL),
(7, 1, 'Пульс', 120.00, 'уд. в мин.', '2026-10-27 10:30:50', 'manual', NULL),
(8, 1, 'Пульс', 110.00, 'уд. в мин.', '2026-10-27 10:31:46', 'manual', NULL),
(9, 1, 'Пульс', 90.00, 'уд. в мин.', '2026-10-27 10:32:00', 'manual', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `clinical_data_diagnozy`
--

CREATE TABLE `clinical_data_diagnozy` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `consultation_id` bigint(20) UNSIGNED NOT NULL,
  `diagnosis_name` varchar(255) NOT NULL,
  `icd_code` varchar(20) DEFAULT NULL,
  `diagnosed_at` date NOT NULL,
  `notes` text DEFAULT NULL,
  `status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `consultations`
--

CREATE TABLE `consultations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `scheduled_at` datetime NOT NULL,
  `status` enum('planned','completed','cancelled','no_show') NOT NULL DEFAULT 'planned',
  `consultation_notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `doctors`
--

CREATE TABLE `doctors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `login` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `specialization` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `instrumental_issledovaniy`
--

CREATE TABLE `instrumental_issledovaniy` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `study_name` varchar(200) NOT NULL,
  `performed_at` datetime NOT NULL,
  `conclusion` text DEFAULT NULL,
  `file_uri` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `pacienty`
--

CREATE TABLE `pacienty` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `login` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `passport` varchar(30) DEFAULT NULL,
  `snils` varchar(14) DEFAULT NULL,
  `weight_kg` decimal(5,2) DEFAULT NULL,
  `height_cm` decimal(5,2) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `blood_group` enum('O(I)','A(II)','B(III)','AB(IV)') DEFAULT NULL,
  `rhesus_factor` enum('+','-') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ;

--
-- Дамп данных таблицы `pacienty`
--

INSERT INTO `pacienty` (`id`, `first_name`, `last_name`, `login`, `password_hash`, `phone`, `passport`, `snils`, `weight_kg`, `height_cm`, `birth_date`, `blood_group`, `rhesus_factor`, `created_at`) VALUES
(1, 'Иван', 'Иванов', 'qwerty', '2$hsdihfig1y72t1263g21uh3giuy12g3', '89128746526', '9272', '18293891', 85.00, 185.00, '2007-10-03', 'O(I)', '+', '2026-10-27 09:21:46');

-- --------------------------------------------------------

--
-- Структура таблицы `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `treatment_plan_id` bigint(20) UNSIGNED NOT NULL,
  `medication_name` varchar(255) NOT NULL,
  `dosage` varchar(100) NOT NULL,
  `frequency` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('active','completed','cancelled') NOT NULL DEFAULT 'active',
  `instructions` text DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Структура таблицы `reports`
--

CREATE TABLE `reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `consultation_id` bigint(20) UNSIGNED NOT NULL,
  `report_type` enum('epicrisis','discharge','conclusion','referral','status_report') NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `treatment_plans`
--

CREATE TABLE `treatment_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `consultation_id` bigint(20) UNSIGNED NOT NULL,
  `plan_description` text NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('active','completed','cancelled') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ;

-- --------------------------------------------------------

--
-- Структура таблицы `treatment_records`
--

CREATE TABLE `treatment_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `prescription_id` bigint(20) UNSIGNED NOT NULL,
  `scheduled_at` datetime DEFAULT NULL,
  `performed_at` datetime DEFAULT NULL,
  `status` enum('performed','missed','postponed','not_confirmed') NOT NULL DEFAULT 'not_confirmed',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `clinical_data_all`
--
ALTER TABLE `clinical_data_all`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_measurements_patient_date` (`patient_id`,`measured_at`),
  ADD KEY `idx_measurements_type_date` (`measurement_type`,`measured_at`);

--
-- Индексы таблицы `clinical_data_diagnozy`
--
ALTER TABLE `clinical_data_diagnozy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_diagnoses_consultation` (`consultation_id`),
  ADD KEY `idx_diagnoses_icd` (`icd_code`);

--
-- Индексы таблицы `consultations`
--
ALTER TABLE `consultations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_consultations_patient_date` (`patient_id`,`scheduled_at`),
  ADD KEY `idx_consultations_doctor_date` (`doctor_id`,`scheduled_at`);

--
-- Индексы таблицы `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Индексы таблицы `instrumental_issledovaniy`
--
ALTER TABLE `instrumental_issledovaniy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_instrumental_patient_date` (`patient_id`,`performed_at`);

--
-- Индексы таблицы `pacienty`
--
ALTER TABLE `pacienty`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `passport` (`passport`),
  ADD UNIQUE KEY `snils` (`snils`);

--
-- Индексы таблицы `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_prescriptions_plan` (`treatment_plan_id`),
  ADD KEY `idx_prescriptions_dates` (`start_date`,`end_date`);

--
-- Индексы таблицы `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_reports_consultation` (`consultation_id`);

--
-- Индексы таблицы `treatment_plans`
--
ALTER TABLE `treatment_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_plans_consultation` (`consultation_id`);

--
-- Индексы таблицы `treatment_records`
--
ALTER TABLE `treatment_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_treatment_records_prescription_time` (`prescription_id`,`scheduled_at`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `clinical_data_all`
--
ALTER TABLE `clinical_data_all`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `clinical_data_diagnozy`
--
ALTER TABLE `clinical_data_diagnozy`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `consultations`
--
ALTER TABLE `consultations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `instrumental_issledovaniy`
--
ALTER TABLE `instrumental_issledovaniy`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `pacienty`
--
ALTER TABLE `pacienty`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `treatment_plans`
--
ALTER TABLE `treatment_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `treatment_records`
--
ALTER TABLE `treatment_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `clinical_data_all`
--
ALTER TABLE `clinical_data_all`
  ADD CONSTRAINT `clinical_data_all_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `pacienty` (`id`);

--
-- Ограничения внешнего ключа таблицы `clinical_data_diagnozy`
--
ALTER TABLE `clinical_data_diagnozy`
  ADD CONSTRAINT `clinical_data_diagnozy_ibfk_1` FOREIGN KEY (`consultation_id`) REFERENCES `consultations` (`id`);

--
-- Ограничения внешнего ключа таблицы `consultations`
--
ALTER TABLE `consultations`
  ADD CONSTRAINT `consultations_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `pacienty` (`id`),
  ADD CONSTRAINT `consultations_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`);

--
-- Ограничения внешнего ключа таблицы `instrumental_issledovaniy`
--
ALTER TABLE `instrumental_issledovaniy`
  ADD CONSTRAINT `instrumental_issledovaniy_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `pacienty` (`id`);

--
-- Ограничения внешнего ключа таблицы `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`treatment_plan_id`) REFERENCES `treatment_plans` (`id`);

--
-- Ограничения внешнего ключа таблицы `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`consultation_id`) REFERENCES `consultations` (`id`);

--
-- Ограничения внешнего ключа таблицы `treatment_plans`
--
ALTER TABLE `treatment_plans`
  ADD CONSTRAINT `treatment_plans_ibfk_1` FOREIGN KEY (`consultation_id`) REFERENCES `consultations` (`id`);

--
-- Ограничения внешнего ключа таблицы `treatment_records`
--
ALTER TABLE `treatment_records`
  ADD CONSTRAINT `treatment_records_ibfk_1` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
