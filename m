Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B358C02193
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 18:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TBb3WhhZsyJmOUbdvqrsUvKr5s3I0/Y5zHg7+kMPgLk=; b=f/XwVRlc6E3j2n8UkmecKNur1H
	Rg0Nrv9AldA7AbuGTsD45qRN9s6CyICaSuSgMHN+Xj0WD6c9+TsTgztrILHp7SyrzjKyZJaDgWw3h
	LPkp+aStxAo2kP1AcAiHpbI0O2zGag0WEEzboy94ytDUQ6rMEVOS9mN1uWLNfRnrH/vu25ZL9h3Lj
	+0cqPDGB8tNp6blGhHNj/aaHNU1wcg5o0e4+eeVc0fTqHPbheQmkUulg+3AJ0Nqm1RJVXxJ2l2UPR
	BnwrxA5TTSEVMcYKlmZ8RDPTdZN2ad6OEqMYTOi3N/CmWFAfD9sInJtZewPu3QWr3+SVuufwZ1syd
	3O6Szssg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf0oX-0000000GCoY-3KGx
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 18:04:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf0oU-0000000GCmp-0iW2;
	Mon, 03 Feb 2025 18:04:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A0925C67B0;
	Mon,  3 Feb 2025 18:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF163C4CED2;
	Mon,  3 Feb 2025 18:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738605888;
	bh=uyU+cyi8HOtY8ILi4qFyRpji6zcStOmr4W2XE7K2sbs=;
	h=From:To:Cc:Subject:Date:From;
	b=umpApImARvSABFTR6sL+J2VYowWUn7ZPrhYKySJ3e+oQ8bnVMYMmQ5Ax4frhhYqNk
	 0YJg3hiYqNHEpsQCobNTL0k68x1+3VLb9/KeR1O0qi2wdv4QA9P5dXCeckTKf8+uqg
	 IMXaZxjv/E9fiDWuFLiEF2KgSc8ZhzkcNkGvszVfhyTVjE2Etg173pO+0gGIrBfi7r
	 TByVSJKOOm+v8cDniJgjWC8cUUPpZSnDV6V5cW5YHUQUbmWRhQ4lleYiWEOn8R+SYA
	 C4V5EhxJHFwIqoATaHunW0rad+NqiUaKXAaI8jE1SnhzIaT6ooiTpBxX1Ein4bazJP
	 f8jJ5W5n+6V9A==
From: Kalle Valo <kvalo@kernel.org>
To: ath10k@lists.infradead.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH wireless 1/2] MAINTAINERS: wifi: ath: remove Kalle
Date: Mon,  3 Feb 2025 20:04:44 +0200
Message-Id: <20250203180445.1429640-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_100450_306003_652BACDC 
X-CRM114-Status: UNSURE (   7.77  )
X-CRM114-Notice: Please train this message.
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

I'm stepping down as ath10k, ath11k and ath12k maintainer so remove me from
MAINTAINERS file and Device Tree bindings. Jeff continues as the maintainer.

As my quicinc.com email will not work anymore so add an entry to .mailmap file
to direct the mail to my kernel.org address.

Signed-off-by: Kalle Valo <kvalo@kernel.org>
---
 .mailmap                                                      | 1 +
 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml         | 1 -
 .../devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml     | 1 -
 .../devicetree/bindings/net/wireless/qcom,ath11k.yaml         | 1 -
 .../devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml     | 1 -
 .../devicetree/bindings/net/wireless/qcom,ath12k.yaml         | 1 -
 MAINTAINERS                                                   | 4 ----
 7 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/.mailmap b/.mailmap
index 42e42cabb36d..68d36bf46dcb 100644
--- a/.mailmap
+++ b/.mailmap
@@ -370,6 +370,7 @@ Juha Yrjola <juha.yrjola@solidboot.com>
 Julien Thierry <julien.thierry.kdev@gmail.com> <julien.thierry@arm.com>
 Iskren Chernev <me@iskren.info> <iskren.chernev@gmail.com>
 Kalle Valo <kvalo@kernel.org> <kvalo@codeaurora.org>
+Kalle Valo <kvalo@kernel.org> <quic_kvalo@quicinc.com>
 Kalyan Thota <quic_kalyant@quicinc.com> <kalyan_t@codeaurora.org>
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com> <periyasa@codeaurora.org>
 Kathiravan T <quic_kathirav@quicinc.com> <kathirav@codeaurora.org>
diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index 070c4c9b8643..aace072e2d52 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -7,7 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Technologies ath10k wireless devices
 
 maintainers:
-  - Kalle Valo <kvalo@kernel.org>
   - Jeff Johnson <jjohnson@kernel.org>
 
 description:
diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
index a71fdf05bc1e..a4425cf196ab 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
@@ -8,7 +8,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Technologies ath11k wireless devices (PCIe)
 
 maintainers:
-  - Kalle Valo <kvalo@kernel.org>
   - Jeff Johnson <jjohnson@kernel.org>
 
 description: |
diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index ff5763dc66a8..a69ffb7b3cb8 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -8,7 +8,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Technologies ath11k wireless devices
 
 maintainers:
-  - Kalle Valo <kvalo@kernel.org>
   - Jeff Johnson <jjohnson@kernel.org>
 
 description: |
diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
index cbfb559f6b69..318f305405e3 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
@@ -9,7 +9,6 @@ title: Qualcomm Technologies ath12k wireless devices (PCIe) with WSI interface
 
 maintainers:
   - Jeff Johnson <jjohnson@kernel.org>
-  - Kalle Valo <kvalo@kernel.org>
 
 description: |
   Qualcomm Technologies IEEE 802.11be PCIe devices with WSI interface.
diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
index 1b5884015b15..9e557cb838c7 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
@@ -9,7 +9,6 @@ title: Qualcomm Technologies ath12k wireless devices (PCIe)
 
 maintainers:
   - Jeff Johnson <quic_jjohnson@quicinc.com>
-  - Kalle Valo <kvalo@kernel.org>
 
 description:
   Qualcomm Technologies IEEE 802.11be PCIe devices.
diff --git a/MAINTAINERS b/MAINTAINERS
index 5bcc78c0be70..2048c75c3c42 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3631,7 +3631,6 @@ F:	Documentation/devicetree/bindings/phy/phy-ath79-usb.txt
 F:	drivers/phy/qualcomm/phy-ath79-usb.c
 
 ATHEROS ATH GENERIC UTILITIES
-M:	Kalle Valo <kvalo@kernel.org>
 M:	Jeff Johnson <jjohnson@kernel.org>
 L:	linux-wireless@vger.kernel.org
 S:	Supported
@@ -19192,7 +19191,6 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/tuners/qt1010*
 
 QUALCOMM ATH12K WIRELESS DRIVER
-M:	Kalle Valo <kvalo@kernel.org>
 M:	Jeff Johnson <jjohnson@kernel.org>
 L:	ath12k@lists.infradead.org
 S:	Supported
@@ -19202,7 +19200,6 @@ F:	drivers/net/wireless/ath/ath12k/
 N:	ath12k
 
 QUALCOMM ATHEROS ATH10K WIRELESS DRIVER
-M:	Kalle Valo <kvalo@kernel.org>
 M:	Jeff Johnson <jjohnson@kernel.org>
 L:	ath10k@lists.infradead.org
 S:	Supported
@@ -19212,7 +19209,6 @@ F:	drivers/net/wireless/ath/ath10k/
 N:	ath10k
 
 QUALCOMM ATHEROS ATH11K WIRELESS DRIVER
-M:	Kalle Valo <kvalo@kernel.org>
 M:	Jeff Johnson <jjohnson@kernel.org>
 L:	ath11k@lists.infradead.org
 S:	Supported

base-commit: 3319569bf9d8b4d8c5aaf0d410b620210c4bb317
-- 
2.39.5


