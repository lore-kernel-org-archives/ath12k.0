Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21024606A31C
	for <ath12k@archiver.kernel.org>; Thu, 12 Nov 2026 09:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FlE+JBZ4;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L/EPgnFn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fkjnmb8ggLb/84Ga++hOlK7lEjrv+JCNa/KKXlrq3oQ=; b=FlE+JBZ4/iv2whlO9JqeqlGhZx
	e9FZX7TZzf+P8SLZINT1tr870CnfZ28WEzi9GeBrreRSE08xxsRnt4YMRwIMoIiwAshTez/tgsJBD
	d3LrbJ0oFNWOGrB5ZZpAazaoDBL+NrFzPdvJF01OoiC8bmvxGvvTUVrd3qGWmy0CAbUuVAUKbFuuN
	d1R0vZIGFOzR+pTQBG4XdZsEV8OuSDQMXewUHOknSh1rdXT8IU1nczP2GNSn8/m2cpQOpZ91lowUa
	jntep2Mb5eftgk92dpBGMeGCQ9Aeug4YfCMUYRUL5uQCecMJ1I758MtCqjtHfUcmEGVYPAp9K4fnd
	Kqv2Lz1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRR4y-00000009Mnu-43fB;
	Thu, 12 Nov 2026 09:26:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRR4x-00000009Mne-0dZN
	for ath12k@lists.infradead.org;
	Thu, 12 Nov 2026 09:26:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CB48A46AFE;
	Thu, 12 Nov 2026 09:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E79AD1F00A06;
	Thu, 12 Nov 2026 09:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794475606;
	bh=fkjnmb8ggLb/84Ga++hOlK7lEjrv+JCNa/KKXlrq3oQ=;
	h=From:To:Cc:Subject:Date;
	b=L/EPgnFnLTt737bs87LmLJNK7LSDwmsvC+C++AVwbCrxQ/Tbv0UUoWyu6wWzRY4CI
	 j/pNDCbH016zGGqgq5BFhJswaDBN7XgHqecpPwbGS7Ua0WRYoMGqqexWpPC5cjSRlN
	 SU7DT9o1zCM+WXWMZ/t0Y0xAD7zjwwwkJ7/EvdUqz6prJQxMO29vZ8xVNoO+zioGt3
	 DUvLokKfBZGR5iqOz0RlAi+PMsmOBs6QjP+R4/KdvVqniS5y3zpk/LCsOdg4IJoLcq
	 xiVoM8fLUQ+3Y4yGpsS5mxNacvSVJ4/Y0vnC8xF7SFEH44m56wRuhlYHoLfG6Zdbm0
	 r1yfiJ0Cgw3TQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] [RESEND] wifi: ath12k: fix QCOM_RPROC_COMMON dependency
Date: Thu, 12 Nov 2026 10:26:30 +0100
Message-ID: <20261112092642.1144415-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arnd Bergmann <arnd@arndb.de>

The AHB driver depends on the remoteproc interface, which could
be in a loadable module when ath12k itself is built-in:

arm-linux-gnueabi-ld: drivers/net/wireless/ath/ath12k/ahb.o: in function `ath12k_ahb_probe':
ahb.c:(.text+0xb2c): undefined reference to `qcom_register_ssr_notifier'
arm-linux-gnueabi-ld: ahb.c:(.text+0x1000): undefined reference to `qcom_unregister_ssr_notifier'
arm-linux-gnueabi-ld: drivers/net/wireless/ath/ath12k/ahb.o: in function `ath12k_ahb_remove':
ahb.c:(.text+0x1146): undefined reference to `qcom_unregister_ssr_notifier'

Add a dependency to only allow the AHB portion to be enabled if either
remoteproc support is built-in or ath12k is itself a loadable module.

A better way to fix this would be to make the driver more modular and
ensure the AHB and PCI components are built into separate loadable modules
like it is done for the ATH10K driver, but that is a much larger rework
that someone else can do in the future.

Link: https://lore.kernel.org/all/20260313094852.3716715-1-arnd@kernel.org/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/ath/ath12k/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/Kconfig b/drivers/net/wireless/ath/ath12k/Kconfig
index 0d5d1c55bfc1..4e8a301f2081 100644
--- a/drivers/net/wireless/ath/ath12k/Kconfig
+++ b/drivers/net/wireless/ath/ath12k/Kconfig
@@ -17,6 +17,7 @@ config ATH12K
 config ATH12K_AHB
 	bool "Qualcomm ath12k AHB support"
 	depends on ATH12K && REMOTEPROC
+	depends on QCOM_RPROC_COMMON=y || ATH12K=m
 	select QCOM_MDT_LOADER
 	select QCOM_PAS
 	help
-- 
2.53.0


