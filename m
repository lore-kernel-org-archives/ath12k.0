Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBAAC3ABB6
	for <ath12k@archiver.kernel.org>; Tue,  6 May 2025 02:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fg6D5hxxS0+OBHaps5hi3jlSLVPRyaAw7YdlJM3uwZQ=; b=RISnq8tISZc76UJw2uAlY0K9g+
	dQVeVPJrKrx8sz3czyWqzfqqU9Tl11RklvSpwfJz86+y/ogUumJ8heEr1k3JxkH5EULLtlOKGiGdQ
	Ue3unQ5/pRTpqZ6CbG+ci1+x+v7LnTFIL9jYVncSl+3ky4qzFeBffSxu7Ym+2iIGnvnhaPzcqb34O
	nWspIq++GIpIQjDeUp0zOAvJEQD+IK14KY6Q+QJz2OISv4zkzLYam4YdKjd52yZHHDQr8JOKfNpW4
	ixh690QmrE2xfDFE4bOCQ/h3VFakz+7Xr3L0VSuWPA07YSk0RgRxp8EfsU0uildk3mZUhXR5y83WB
	1reVtGjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC7rL-00000009hhE-3Xc6;
	Tue, 06 May 2025 02:16:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4ib-00000008uD8-0b19
	for ath12k@lists.infradead.org;
	Mon, 05 May 2025 22:55:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D2F65C5546;
	Mon,  5 May 2025 22:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23A2BC4CEF1;
	Mon,  5 May 2025 22:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485724;
	bh=AacAX110S5z2tG92wMAN89b1mrxBDeQr+V5y2E7kQ7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GkMVA4g31jvFTM7h3iqHWumElU3hWDwYODlMfHww3esDOoG8yYLHlMhzbL/xjvIyl
	 8W2lh/12eG8f1u6lz+e9mKYUjvUymZv8ZMXAd8NYuEC3s0W+p90Sn81B2IRwLVIlgJ
	 tc+35pdILDYtaNu5UMLcN1ZY67fM47BHvK20OEPiIkq1GwAIdwpjIiV66PFqgUJcdh
	 TUGLu7WTMEP4fsxbs/OI8tvYLQFVlh/2xsL8liqUGuMppvhS4BWuaFrA+JPE8MBVpK
	 dSYD2tnHym8vxq0V8yLi1DLHIbju5rogl179/fV50ohH4DMJpfEnPZLcNQQXwzsA3/
	 viXSOhgX7XBBw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Avula Sri Charan <quic_asrichar@quicinc.com>,
	Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>,
	Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 445/486] wifi: ath12k: Avoid napi_sync() before napi_enable()
Date: Mon,  5 May 2025 18:38:41 -0400
Message-Id: <20250505223922.2682012-445-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_155525_298095_6C7917A2 
X-CRM114-Status: GOOD (  12.53  )
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

From: Avula Sri Charan <quic_asrichar@quicinc.com>

[ Upstream commit 268c73d470a5790a492a2fc2ded084b909d144f3 ]

In case of MHI error a reset work will be queued which will try
napi_disable() after napi_synchronize().

As the napi will be only enabled after qmi_firmware_ready event,
trying napi_synchronize() before napi_enable() will result in
indefinite sleep in case of a firmware crash in QMI init sequence.

To avoid this, introduce napi_enabled flag to check if napi is enabled
or not before calling napi_synchronize().

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Avula Sri Charan <quic_asrichar@quicinc.com>
Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Link: https://patch.msgid.link/20250124090058.3194299-1-quic_tamizhr@quicinc.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/core.h |  1 +
 drivers/net/wireless/ath/ath12k/pci.c  | 13 ++++++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 7f2e9a9b40977..3faf3430effb9 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -148,6 +148,7 @@ struct ath12k_ext_irq_grp {
 	u32 num_irq;
 	u32 grp_id;
 	u64 timestamp;
+	bool napi_enabled;
 	struct napi_struct napi;
 	struct net_device *napi_ndev;
 };
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 2ff866e1d7d5b..45d537066345a 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -481,8 +481,11 @@ static void __ath12k_pci_ext_irq_disable(struct ath12k_base *ab)
 
 		ath12k_pci_ext_grp_disable(irq_grp);
 
-		napi_synchronize(&irq_grp->napi);
-		napi_disable(&irq_grp->napi);
+		if (irq_grp->napi_enabled) {
+			napi_synchronize(&irq_grp->napi);
+			napi_disable(&irq_grp->napi);
+			irq_grp->napi_enabled = false;
+		}
 	}
 }
 
@@ -1112,7 +1115,11 @@ void ath12k_pci_ext_irq_enable(struct ath12k_base *ab)
 	for (i = 0; i < ATH12K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath12k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
-		napi_enable(&irq_grp->napi);
+		if (!irq_grp->napi_enabled) {
+			napi_enable(&irq_grp->napi);
+			irq_grp->napi_enabled = true;
+		}
+
 		ath12k_pci_ext_grp_enable(irq_grp);
 	}
 
-- 
2.39.5


