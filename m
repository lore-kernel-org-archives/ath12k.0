Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03AC8105F781
	for <ath12k@archiver.kernel.org>; Fri, 13 Mar 2026 09:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/No9QtC83IHSnYWDWOrX26tjqH1KJcBWtIxYtDp/hdI=; b=AEc7t3LYTfcHWhvXMvtuNtXECs
	gV1MwZebpGOFY+nBhuoM/AgI9vqQ1xvMyJxzbZmB1JgkZO7jdpBruRqyzsSgBTMO5nx+2KY3/c+xu
	qWMbecyZQpm6mf1itnhkjAOqrgkmQfhdQ6S0BFkmsrbDghfNXZct0Tr/Z+TgdoMieYb9iopl96YG1
	UNtWU9US0AZGpVHN/hrzpfsWcD4dW6qhNZMDEG9jOUqUgF6yc5G5ecQg/jtO6HMBxsV/HyCLWar8G
	Q20t9STPtc5lMQC8lNWwTcno9MI9WMib4sqYyHeaQu5M0pTlr7WGZWifsLIHDKDwjPeDufjQuHGYF
	G4WRJrPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0z8g-0000000HQIT-2gTv;
	Fri, 13 Mar 2026 09:49:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0z8e-0000000HQHL-1DL0
	for ath12k@lists.infradead.org;
	Fri, 13 Mar 2026 09:49:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DD4A43B0C;
	Fri, 13 Mar 2026 09:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B5B2C19421;
	Fri, 13 Mar 2026 09:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773395338;
	bh=N36s9TyRo50kU5WTBNeXzMxWJFN3vHg2opY5lTeBvaw=;
	h=From:To:Cc:Subject:Date:From;
	b=YR7y1eBRsx4vs2saHXaASI+RfcDzQyWZD9EgofeJNlX0+qqhuakoUXhTDIqkc0G+n
	 bGqhlR4UWnUYxYrtnIMp3wQLZsXduU5WWc5h88cn7T7tiquW8+eZiotuQTSU47ns+4
	 U8wqoJnZ7dDOm2gSlzD8+QRJV5T3hMoOsFxUmXg7KuL97nQGMsDCUJq4oPSnkxqFWZ
	 /GAfvRrWinbqRSLWIgLr23nJhBSucwFOdeMepaAgieZdC0DwpQ+RWiign9ikEDcqRT
	 par1Qiajl8pLyFki0hbKzlM7pN70FJPii59Tyn5OiXaqRo+iOWnL7G5osYhTy051oo
	 RJpYfyuLlwDVQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	P Praneesh <quic_ppranees@quicinc.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Balamurugan S <quic_bselvara@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath12k: fix QCOM_RPROC_COMMON dependency
Date: Fri, 13 Mar 2026 10:48:43 +0100
Message-Id: <20260313094852.3716715-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_024900_348962_2A9109C8 
X-CRM114-Status: GOOD (  12.06  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

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

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/ath/ath12k/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/Kconfig b/drivers/net/wireless/ath/ath12k/Kconfig
index 1ea1af1b8f6c..ed18e0624e03 100644
--- a/drivers/net/wireless/ath/ath12k/Kconfig
+++ b/drivers/net/wireless/ath/ath12k/Kconfig
@@ -18,6 +18,7 @@ config ATH12K
 config ATH12K_AHB
 	bool "QTI ath12k AHB support"
 	depends on ATH12K && REMOTEPROC
+	depends on QCOM_RPROC_COMMON=y || ATH12K=m
 	select QCOM_MDT_LOADER
 	select QCOM_SCM
 	help
-- 
2.39.5


