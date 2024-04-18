Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020DEC4345F
	for <ath12k@archiver.kernel.org>; Thu, 18 Apr 2024 16:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ho1oha7NlPnVlvezMpGKsopg4GK7/gE9u/PyjelWSaE=; b=mLReIq8lGefgx5OdMDXYv3ri7s
	qa4wFvT+iHjftnTE6VoIitGAywXXxae3CsoSQlQI5D4gzRSHMkJyVSgGVRL8O4DSSEZAsxaeJEj5b
	IFlblTCNDb9DeS1pl51FkURITV5Sij22bh3IPK7qeFMuE6ZMXrGMayJYrNeYxe29wrkYcPS3Ksequ
	xzxuWoT+qKLW2TSMZlBZJ5k1XnUu+5Ei0gELAG4fP9VQqy8gLPL7ex9eDZvnR9quscnAAHksC5S+S
	C/lURkX/cWRywKYaeiXFrMF+PwWMDv7UDsbq6Uj7FW4iovQi2Rl871RjWiGA/4Go7bWR9Aay0C4e7
	7i/ZRJ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxUUs-00000002zhm-2n3L
	for ath12k@archiver.kernel.org;
	Thu, 18 Apr 2024 16:20:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxUUp-00000002zgq-08hu
	for ath12k@lists.infradead.org;
	Thu, 18 Apr 2024 16:20:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7077361821
	for <ath12k@lists.infradead.org>; Thu, 18 Apr 2024 16:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE90C113CC;
	Thu, 18 Apr 2024 16:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713457222;
	bh=L/q/SEyMvrP7DvPROUW2dF6DzmVYdZULYChsgCNQMBg=;
	h=From:To:Cc:Subject:Date:From;
	b=UVnsRrlNsqRHfWDScviRGPsLpVSihu5HcfJgZvVzJC36U9gwdvpmzly5fxNJFt5Og
	 7AoOHE1Kef+6ctGV1LDFmFRV+PU1DD0VjlKaG04gY93k7Fw9gIec7tW+4nZGwbrbTw
	 GK3WjroIDq/Wvz6gJ/FmOEKCOUABzlCGq8eUf3Ie44I65ShWwH4K5tOb2XBmG4EKrD
	 ZGHXphc0+engD3oHNslPG3BNo2pODHYTfoEtakkhJaSp3nTcHsy8EBk6AhLRu4d4Q4
	 +ka4MhLADNkeG11yHosL4hjZOr6uS+rl14sVecp2DcBO0dhGIwQB5lRiocL5lBW5OT
	 04gpeKG6Ob3Gg==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v8 0/4] wifi: ath12k: ACPI support
Date: Thu, 18 Apr 2024 19:20:15 +0300
Message-Id: <20240418162019.1246749-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_092023_189288_AFEE2256 
X-CRM114-Status: GOOD (  10.60  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

Through reading ACPI tables, implement Time-Average-SAR(TAS), BIOS SAR,
configuration of CCA threshold and band edge channel power functionalities.
This is enabled only on WCN7850.

TODO:

* test with ACPI support in hardware (I don't have such hardware), especially
  suspend and hibernation

v8:

* rebase to ath-202404181528
* rewrite commit messages
* cleanup and improvements all over to match the ath12k style, including
  error handling, naming and so on
* locate new place to call ath12k_acpi_[start|stop]()
* move wmi functions up in wmi.c file
* consolidate WMI functions using WMI_PDEV_SET_BIOS_INTERFACE_CMDID into ath12k_wmi_set_bios_cmd()
* ath12k_acpi_stop(): don't call acpi_remove_notify_handler() if we never installed the handler

v7: https://patchwork.kernel.org/project/linux-wireless/cover/20231013114434.81648-1-quic_lingbok@quicinc.com/

* adjust the length of line
* add cpu_to_le32()

v6:

* remove code that is not called

v5:

* rebase to the latest tag

v4:

* revise commit log using imperative voice
* delete guid_is_null()

v3:

* remove unnecessary cpu_to_le32()
* adjust the order of the macros
* apply jeff's advice

v2:

* put <linux/acpi.h> in the include guard

Lingbo Kong (4):
  wifi: ath12k: ACPI TAS support
  wifi: ath12k: ACPI SAR support
  wifi: ath12k: ACPI CCA threshold support
  wifi: ath12k: ACPI band edge channel power support

 drivers/net/wireless/ath/ath12k/Makefile |   1 +
 drivers/net/wireless/ath/ath12k/acpi.c   | 394 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/acpi.h   |  76 +++++
 drivers/net/wireless/ath/ath12k/core.c   |   7 +
 drivers/net/wireless/ath/ath12k/core.h   |  18 ++
 drivers/net/wireless/ath/ath12k/hw.c     |  10 +
 drivers/net/wireless/ath/ath12k/hw.h     |   3 +
 drivers/net/wireless/ath/ath12k/wmi.c    | 143 ++++++++
 drivers/net/wireless/ath/ath12k/wmi.h    |  41 +++
 9 files changed, 693 insertions(+)
 create mode 100644 drivers/net/wireless/ath/ath12k/acpi.c
 create mode 100644 drivers/net/wireless/ath/ath12k/acpi.h


base-commit: c416602943dd36fbd13af7496430723935c867a3
-- 
2.39.2


