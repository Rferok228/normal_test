-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 07 2026 г., 20:34
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.0.30

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `clinical_data_all`
--

INSERT INTO `clinical_data_all` (`id`, `patient_id`, `measurement_type`, `measurement_value`, `unit`, `measured_at`, `source`, `notes`) VALUES
(1, 1, 'systolic_pressure', 138.00, 'mmHg', '2026-10-20 08:00:00', 'device', 'Систолическое давление'),
(2, 1, 'diastolic_pressure', 88.00, 'mmHg', '2026-10-20 08:00:00', 'device', 'Диастолическое давление'),
(3, 1, 'heart_rate', 78.00, 'bpm', '2026-10-20 08:00:00', 'device', 'Пульс'),
(4, 1, 'temperature', 36.60, 'C', '2026-10-20 08:05:00', 'manual', 'Температура'),
(5, 1, 'systolic_pressure', 132.00, 'mmHg', '2026-10-21 08:00:00', 'device', 'Систолическое давление'),
(6, 1, 'diastolic_pressure', 84.00, 'mmHg', '2026-10-21 08:00:00', 'device', 'Диастолическое давление'),
(7, 1, 'heart_rate', 74.00, 'bpm', '2026-10-21 08:00:00', 'device', 'Пульс'),
(8, 2, 'systolic_pressure', 118.00, 'mmHg', '2026-10-21 09:00:00', 'device', 'Систолическое давление'),
(9, 2, 'diastolic_pressure', 76.00, 'mmHg', '2026-10-21 09:00:00', 'device', 'Диастолическое давление'),
(10, 2, 'heart_rate', 72.00, 'bpm', '2026-10-21 09:00:00', 'device', 'Пульс'),
(11, 3, 'systolic_pressure', 145.00, 'mmHg', '2026-10-22 08:30:00', 'device', 'Систолическое давление'),
(12, 3, 'diastolic_pressure', 92.00, 'mmHg', '2026-10-22 08:30:00', 'device', 'Диастолическое давление'),
(13, 3, 'heart_rate', 86.00, 'bpm', '2026-10-22 08:30:00', 'device', 'Пульс'),
(14, 1, 'systolic_pressure', 138.00, 'mmHg', '0000-00-00 00:00:00', 'manual', 'Измерение дома'),
(15, 1, 'systolic_pressure', 138.00, 'mmHg', '0000-00-00 00:00:00', 'manual', 'Измерение дома'),
(16, 1, 'systolic_pressure', 138.00, 'mmHg', '0000-00-00 00:00:00', 'manual', 'Измерение дома'),
(17, 1, 'systolic_pressure', 138.00, 'mmHg', '0000-00-00 00:00:00', 'manual', 'Измерение дома');

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

--
-- Дамп данных таблицы `clinical_data_diagnozy`
--

INSERT INTO `clinical_data_diagnozy` (`id`, `consultation_id`, `diagnosis_name`, `icd_code`, `diagnosed_at`, `notes`, `status`) VALUES
(1, 1, 'Артериальная гипертензия', 'I10', '2026-10-20', 'Требуется наблюдение.', 'active'),
(2, 2, 'Общее профилактическое обследование', NULL, '2026-10-21', 'Жалобы уточнены на консультации.', 'active');

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

--
-- Дамп данных таблицы `consultations`
--

INSERT INTO `consultations` (`id`, `patient_id`, `doctor_id`, `scheduled_at`, `status`, `consultation_notes`, `created_at`) VALUES
(1, 1, 1, '2026-10-20 10:00:00', 'completed', 'Плановый контроль артериального давления.', '2026-10-28 05:51:56'),
(2, 2, 2, '2026-10-21 11:30:00', 'completed', 'Общий осмотр и обсуждение самочувствия.', '2026-10-28 05:51:56'),
(3, 3, 1, '2026-10-29 14:00:00', 'planned', 'Повторный контроль показателей.', '2026-10-28 05:51:56'),
(4, 1, 1, '2026-10-23 10:00:00', 'completed', 'Демо-приём: контроль состояния пациента 1', '2026-10-29 16:30:10'),
(5, 2, 2, '2026-10-24 11:00:00', 'completed', 'Демо-приём: контроль состояния пациента 2', '2026-10-29 16:30:10'),
(6, 3, 3, '2026-10-25 12:00:00', 'completed', 'Демо-приём: контроль состояния пациента 3', '2026-10-29 16:30:10'),
(11, 1, 1, '2026-11-12 12:00:00', 'cancelled', 'Консультация отменена по просьбе пациента', '2026-11-06 17:26:12');

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

--
-- Дамп данных таблицы `doctors`
--

INSERT INTO `doctors` (`id`, `first_name`, `last_name`, `login`, `password_hash`, `phone`, `specialization`) VALUES
(1, 'Анна', 'Иванова', 'doctor_ivanova', 'test_hash_1', '+79990000001', 'Кардиолог'),
(2, 'Павел', 'Смирнов', 'doctor_smirnov', 'test_hash_2', '+79990000002', 'Терапевт'),
(3, 'Елена', 'Петрова', 'doctor_petrova', 'test_hash_3', '+79990000003', 'Эндокринолог');

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

--
-- Дамп данных таблицы `instrumental_issledovaniy`
--

INSERT INTO `instrumental_issledovaniy` (`id`, `patient_id`, `study_name`, `performed_at`, `conclusion`, `file_uri`) VALUES
(1, 1, 'ЭКГ', '2026-10-20 10:30:00', 'Тестовое заключение ЭКГ.', NULL),
(2, 2, 'УЗИ органов брюшной полости', '2026-10-21 12:00:00', 'Тестовое заключение УЗИ.', NULL),
(3, 3, 'ЭКГ', '2026-10-22 09:00:00', 'Требуется оценка врачом.', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `pacienty`
--

INSERT INTO `pacienty` (`id`, `first_name`, `last_name`, `login`, `password_hash`, `phone`, `passport`, `snils`, `weight_kg`, `height_cm`, `birth_date`, `blood_group`, `rhesus_factor`, `created_at`) VALUES
(1, 'Иван', 'Соколов', 'patient_sokolov', 'test_hash_4', '+79991110001', 'TEST000001', '111-111-111 01', 82.50, 178.00, '1985-04-12', 'A(II)', '+', '2026-10-28 05:51:56'),
(2, 'Мария', 'Кузнецова', 'patient_kuznetsova', 'test_hash_5', '+79991110002', 'TEST000002', '111-111-111 02', 64.20, 165.00, '1992-09-21', 'O(I)', '-', '2026-10-28 05:51:56'),
(3, 'Алексей', 'Морозов', 'patient_morozov', 'test_hash_6', '+79991110003', 'TEST000003', '111-111-111 03', 91.00, 182.00, '1976-02-08', 'B(III)', '+', '2026-10-28 05:51:56');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `prescriptions`
--

INSERT INTO `prescriptions` (`id`, `treatment_plan_id`, `medication_name`, `dosage`, `frequency`, `start_date`, `end_date`, `status`, `instructions`) VALUES
(1, 1, 'Тестовый препарат А', '1000 мг', '1 раз в день', '2026-10-20', '2026-11-20', 'active', 'Демонстрационное назначение. Не использовать для лечения.'),
(2, 2, 'Тестовый препарат Б', '1 таблетка', 'По назначению врача', '2026-10-21', '2026-11-21', 'active', 'Демонстрационное назначение. Не использовать для лечения.'),
(3, 4, 'Демо-препарат А', 'Тестовая дозировка', 'Тестовый режим приёма', '2026-10-23', '2026-11-02', 'active', 'Тестовые данные, не использовать для лечения'),
(4, 5, 'Демо-препарат А', 'Тестовая дозировка', 'Тестовый режим приёма', '2026-10-23', '2026-11-02', 'active', 'Тестовые данные, не использовать для лечения'),
(5, 6, 'Демо-препарат А', 'Тестовая дозировка', 'Тестовый режим приёма', '2026-10-23', '2026-11-02', 'active', 'Тестовые данные, не использовать для лечения'),
(6, 4, 'Демо-препарат Б', 'Тестовая дозировка', 'Тестовый режим приёма', '2026-10-23', '2026-11-02', 'active', 'Тестовые данные, не использовать для лечения'),
(7, 5, 'Демо-препарат Б', 'Тестовая дозировка', 'Тестовый режим приёма', '2026-10-23', '2026-11-02', 'active', 'Тестовые данные, не использовать для лечения'),
(8, 6, 'Демо-препарат Б', 'Тестовая дозировка', 'Тестовый режим приёма', '2026-10-23', '2026-11-02', 'active', 'Тестовые данные, не использовать для лечения'),
(14, 1, 'Парацетамол', '500 мг', '2 раза в день', '2026-11-07', '2026-11-14', 'active', 'Принимать после еды');

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

--
-- Дамп данных таблицы `reports`
--

INSERT INTO `reports` (`id`, `consultation_id`, `report_type`, `title`, `content`, `created_at`) VALUES
(1, 1, 'conclusion', 'Заключение по консультации', 'Тестовый отчёт: показатели пациента сохранены.', '2026-10-28 05:51:56'),
(2, 2, 'status_report', 'Отчёт о состоянии пациента', 'Тестовый отчёт: данные внесены для проверки API.', '2026-10-28 05:51:56');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `treatment_plans`
--

INSERT INTO `treatment_plans` (`id`, `consultation_id`, `plan_description`, `start_date`, `end_date`, `status`, `created_at`) VALUES
(1, 1, 'Контроль давления и соблюдение рекомендаций врача.', '2026-10-20', '2026-11-20', 'active', '2026-10-28 05:51:56'),
(2, 2, 'Наблюдение за самочувствием.', '2026-10-21', '2026-11-21', 'active', '2026-10-28 05:51:56'),
(3, 3, 'Повторная оценка состояния пациента.', '2026-10-29', '2026-11-29', 'active', '2026-10-28 05:51:56'),
(4, 4, 'Демонстрационный план наблюдения', '2026-10-23', '2026-11-23', 'active', '2026-10-29 16:30:10'),
(5, 5, 'Демонстрационный план наблюдения', '2026-10-23', '2026-11-23', 'active', '2026-10-29 16:30:10'),
(6, 6, 'Демонстрационный план наблюдения', '2026-10-23', '2026-11-23', 'active', '2026-10-29 16:30:10');

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
-- Дамп данных таблицы `treatment_records`
--

INSERT INTO `treatment_records` (`id`, `prescription_id`, `scheduled_at`, `performed_at`, `status`, `notes`, `created_at`) VALUES
(1, 1, '2026-10-21 09:00:00', '2026-10-21 09:05:00', 'performed', 'Тестовая запись о выполнении.', '2026-10-28 05:51:56'),
(2, 1, '2026-10-22 09:00:00', NULL, 'missed', 'Тестовая пропущенная запись.', '2026-10-28 05:51:56'),
(3, 2, '2026-10-22 10:00:00', NULL, 'not_confirmed', 'Ожидается подтверждение.', '2026-10-28 05:51:56'),
(4, 3, '2026-10-23 00:00:00', '2026-10-23 00:00:00', 'performed', 'Демонстрационная запись для проверки API', '2026-10-29 16:30:10'),
(5, 4, '2026-10-23 00:00:00', '2026-10-23 00:00:00', 'performed', 'Демонстрационная запись для проверки API', '2026-10-29 16:30:10'),
(6, 5, '2026-10-23 00:00:00', '2026-10-23 00:00:00', 'performed', 'Демонстрационная запись для проверки API', '2026-10-29 16:30:10'),
(7, 6, '2026-10-23 00:00:00', '2026-10-23 00:00:00', 'performed', 'Демонстрационная запись для проверки API', '2026-10-29 16:30:10'),
(8, 7, '2026-10-23 00:00:00', '2026-10-23 00:00:00', 'performed', 'Демонстрационная запись для проверки API', '2026-10-29 16:30:10'),
(9, 8, '2026-10-23 00:00:00', '2026-10-23 00:00:00', 'performed', 'Демонстрационная запись для проверки API', '2026-10-29 16:30:10'),
(10, 3, '2026-10-24 00:00:00', '2026-10-24 00:00:00', 'performed', 'Демонстрационная запись для проверки API', '2026-10-29 16:30:10'),
(11, 4, '2026-10-24 00:00:00', '2026-10-24 00:00:00', 'performed', 'Демонстрационная запись для проверки API', '2026-10-29 16:30:10'),
(12, 5, '2026-10-24 00:00:00', '2026-10-24 00:00:00', 'performed', 'Демонстрационная запись для проверки API', '2026-10-29 16:30:10'),
(13, 6, '2026-10-24 00:00:00', '2026-10-24 00:00:00', 'performed', 'Демонстрационная запись для проверки API', '2026-10-29 16:30:10'),
(14, 7, '2026-10-24 00:00:00', '2026-10-24 00:00:00', 'performed', 'Демонстрационная запись для проверки API', '2026-10-29 16:30:10'),
(15, 8, '2026-10-24 00:00:00', '2026-10-24 00:00:00', 'performed', 'Демонстрационная запись для проверки API', '2026-10-29 16:30:10'),
(16, 3, '2026-10-25 00:00:00', NULL, 'missed', 'Демонстрационная запись для проверки API', '2026-10-29 16:30:10'),
(17, 4, '2026-10-25 00:00:00', NULL, 'missed', 'Демонстрационная запись для проверки API', '2026-10-29 16:30:10'),
(18, 5, '2026-10-25 00:00:00', NULL, 'missed', 'Демонстрационная запись для проверки API', '2026-10-29 16:30:10'),
(19, 6, '2026-10-25 00:00:00', NULL, 'missed', 'Демонстрационная запись для проверки API', '2026-10-29 16:30:10'),
(20, 7, '2026-10-25 00:00:00', NULL, 'missed', 'Демонстрационная запись для проверки API', '2026-10-29 16:30:10'),
(21, 8, '2026-10-25 00:00:00', NULL, 'missed', 'Демонстрационная запись для проверки API', '2026-10-29 16:30:10'),
(22, 3, '2026-10-26 00:00:00', NULL, 'not_confirmed', 'Демонстрационная запись для проверки API', '2026-10-29 16:30:10'),
(23, 4, '2026-10-26 00:00:00', NULL, 'not_confirmed', 'Демонстрационная запись для проверки API', '2026-10-29 16:30:10'),
(24, 5, '2026-10-26 00:00:00', NULL, 'not_confirmed', 'Демонстрационная запись для проверки API', '2026-10-29 16:30:10'),
(25, 6, '2026-10-26 00:00:00', NULL, 'not_confirmed', 'Демонстрационная запись для проверки API', '2026-10-29 16:30:10'),
(26, 7, '2026-10-26 00:00:00', NULL, 'not_confirmed', 'Демонстрационная запись для проверки API', '2026-10-29 16:30:10'),
(27, 8, '2026-10-26 00:00:00', NULL, 'not_confirmed', 'Демонстрационная запись для проверки API', '2026-10-29 16:30:10');

-- --------------------------------------------------------

--
-- Структура таблицы `wellbeing_diary`
--

CREATE TABLE `wellbeing_diary` (
  `id` int(11) NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `wellbeing` int(11) DEFAULT NULL,
  `symptoms` text DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `wellbeing_diary`
--

INSERT INTO `wellbeing_diary` (`id`, `patient_id`, `date`, `wellbeing`, `symptoms`, `comment`) VALUES
(3, 2, '2026-11-06 10:30:00', 8, 'Головная боль', 'Небольшая усталость после работы'),
(4, 2, '2026-11-06 11:00:00', 9, NULL, NULL),
(5, 2, '2026-11-06 12:00:00', NULL, 'Тошнота и головокружение', NULL),
(6, 2, '2026-11-06 13:00:00', NULL, NULL, 'Сегодня чувствую себя хорошо');

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
-- Индексы таблицы `wellbeing_diary`
--
ALTER TABLE `wellbeing_diary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `clinical_data_all`
--
ALTER TABLE `clinical_data_all`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `clinical_data_diagnozy`
--
ALTER TABLE `clinical_data_diagnozy`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `consultations`
--
ALTER TABLE `consultations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `instrumental_issledovaniy`
--
ALTER TABLE `instrumental_issledovaniy`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `pacienty`
--
ALTER TABLE `pacienty`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `treatment_plans`
--
ALTER TABLE `treatment_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `treatment_records`
--
ALTER TABLE `treatment_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `wellbeing_diary`
--
ALTER TABLE `wellbeing_diary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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

--
-- Ограничения внешнего ключа таблицы `wellbeing_diary`
--
ALTER TABLE `wellbeing_diary`
  ADD CONSTRAINT `wellbeing_diary_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `pacienty` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
