-- CreateTable
CREATE TABLE `Enterprise` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `cnpj` VARCHAR(191) NOT NULL,
    `area` VARCHAR(191) NOT NULL,
    `blocked` BOOLEAN NOT NULL,
    `phoneNumber` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Client` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `phoneNumber` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RelClientEnterprise` (
    `idClient` BIGINT NOT NULL,
    `idEnterprise` BIGINT NOT NULL,

    PRIMARY KEY (`idClient`, `idEnterprise`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MessageSendClient` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `content` VARCHAR(191) NOT NULL,
    `datetime` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `stage` BIGINT NOT NULL,
    `idClient` BIGINT NOT NULL,
    `idEnterprise` BIGINT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MessageSendEnterprise` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `content` VARCHAR(191) NOT NULL,
    `datetime` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `stage` BIGINT NOT NULL,
    `idClient` BIGINT NOT NULL,
    `idEnterprise` BIGINT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `RelClientEnterprise` ADD CONSTRAINT `RelClientEnterprise_idEnterprise_fkey` FOREIGN KEY (`idEnterprise`) REFERENCES `Enterprise`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RelClientEnterprise` ADD CONSTRAINT `RelClientEnterprise_idClient_fkey` FOREIGN KEY (`idClient`) REFERENCES `Client`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MessageSendClient` ADD CONSTRAINT `MessageSendClient_idEnterprise_fkey` FOREIGN KEY (`idEnterprise`) REFERENCES `Enterprise`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MessageSendClient` ADD CONSTRAINT `MessageSendClient_idClient_fkey` FOREIGN KEY (`idClient`) REFERENCES `Client`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MessageSendEnterprise` ADD CONSTRAINT `MessageSendEnterprise_idEnterprise_fkey` FOREIGN KEY (`idEnterprise`) REFERENCES `Enterprise`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MessageSendEnterprise` ADD CONSTRAINT `MessageSendEnterprise_idClient_fkey` FOREIGN KEY (`idClient`) REFERENCES `Client`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
