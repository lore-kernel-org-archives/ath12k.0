Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556D6606A88F
	for <ath12k@archiver.kernel.org>; Thu, 12 Nov 2026 09:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zZm2/9VK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YXedrKnp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+saM5MiugNdE2CGErf98jdTo3Oag6Z1ShvKqaDM+sxA=; b=zZm2/9VKob87YT
	bjx8LVwkxjT2rgyne0ivl+FNHGc+xdN88X81YlXiejU1oxRgWgZWbKEtLAkmiir0jl4E9xdI7mVox
	VfJIYn9gQGGS9Mt/rmX6/ydW7V8pwyWPjtf4swvBjln8nPzKF1L5O2mvUgCmKrD2HMQbx5ZFH/8IL
	2vKtD+egN5aoFNVgo5DXBjSf/iDJW1XK+wiBa5SIcwvAGI34ERXD8tizHZ+BCQ1LG+o9w96TS2dbx
	Kn/buTc+bPzIjZen+Z05fTssa/D97agkYAkIARLsi3o+azT7Ho3G/KtDR99chzUCx3V1f5BNSJJpG
	JrU6cKLuWHlTU15WjhHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRR55-00000009MqM-0Nj7;
	Thu, 12 Nov 2026 09:26:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRR53-00000009Mph-36rC
	for ath12k@lists.infradead.org;
	Thu, 12 Nov 2026 09:26:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1AB4B61389;
	Thu, 12 Nov 2026 09:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 502641F00A0C;
	Thu, 12 Nov 2026 09:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794475612;
	bh=+saM5MiugNdE2CGErf98jdTo3Oag6Z1ShvKqaDM+sxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YXedrKnpsd1GEYAgjnEwgQxTW4I/rR0GlaEICzeJCtUTeMT74+eAe0y40snTeCDZc
	 V2Z2IUWYxamT5sT1Nr07q2llqSe4nD3gaCDA1CV/YzzBI3TD+r8GSPQxkhDIOXy838
	 x9n0Z4ifJ4ZQ7WZ048ykThnq1jgatZ9chfbe/Z3Try2k1m1ZRI+ULlcObHj1CF8fjC
	 +WG4dxFgb/+/m1yhxQ6ChPStOPQCbaSZpKW9VnTdtIdGdVTUXmDrGnyQR0gtlDWipf
	 BaQtR4b83EM9IiRFcfylKuEzRstWOJ3cnJQWqa7cYSoaMMHCiY4YIrQCnvKru1982i
	 p8crz8BR3KUfA==
From: Arnd Bergmann <arnd@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] wifi: ath12k: add GENERIC_MSI_IRQ dependency
Date: Thu, 12 Nov 2026 10:26:31 +0100
Message-ID: <20261112092642.1144415-2-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112092642.1144415-1-arnd@kernel.org>
References: <20261112092642.1144415-1-arnd@kernel.org>
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

The platform_device_msi_init_and_alloc_irqs() interface can be disabled
based on the configuration, though it is usually enabled. Without it,
the driver now fails to build:

drivers/net/wireless/ath/ath12k/pcic.c: In function 'ath12k_pcic_config_irq':
drivers/net/wireless/ath/ath12k/pcic.c:387:15: error: implicit declaration of function 'platform_device_msi_init_and_alloc_irqs' [-Wimplicit-function-declaration]
  387 |         ret = platform_device_msi_init_and_alloc_irqs(&pdev->dev,
      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath12k/pcic.c:424:9: error: implicit declaration of function 'platform_device_msi_free_irqs_all' [-Wimplicit-function-declaration]
  424 |         platform_device_msi_free_irqs_all(&pdev->dev);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Add a Kconfig dependency for it.

Fixes: b9bc9ef941bd ("wifi: ath12k: Add platform MSI support for CE")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Note that this patch applied cleanly on top of another Kconfig
fix that I sent a while ago that is also still required,
see
https://lore.kernel.org/all/20260313094852.3716715-1-arnd@kernel.org/
---
 drivers/net/wireless/ath/ath12k/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/Kconfig b/drivers/net/wireless/ath/ath12k/Kconfig
index 4e8a301f2081..ed93ff36fbe2 100644
--- a/drivers/net/wireless/ath/ath12k/Kconfig
+++ b/drivers/net/wireless/ath/ath12k/Kconfig
@@ -18,6 +18,7 @@ config ATH12K_AHB
 	bool "Qualcomm ath12k AHB support"
 	depends on ATH12K && REMOTEPROC
 	depends on QCOM_RPROC_COMMON=y || ATH12K=m
+	depends on GENERIC_MSI_IRQ
 	select QCOM_MDT_LOADER
 	select QCOM_PAS
 	help
-- 
2.53.0


