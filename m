Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26867E7717D
	for <ath12k@archiver.kernel.org>; Mon,  9 Dec 2024 18:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oX4FSDA3E9kExYbpKzq8GK26fvdPYBxSbNE7s9q8gFI=; b=m/ofmJRG0yTZn4v66TFp0WofY6
	XGF8/yZD60tzTJqpT/WuqxbKOy5N4HU+wVQT0SU8oO0cW/P8B+52ZdjiKUfkVXYW34Qq09JzK4HsX
	GUlP9Sl2PBdx4/9U9cqt6uyjDRdX+l+cRCQFdRTUlRO1+vUN0y64x2q/g8EptDv78siwdn86ZBVRn
	mhBheX6zIIexio+7srkjw3YmDurtGk8XbcKpczZRgK0E/j/oFOWe7hF+8DP60TQqCPLO2+DAmgNbz
	2h+GZJlLQZvJUcpZP1k9AqIrL2HicVOL5iiPJjQY4vowYsPS5PrDSNqOpj0MVr4c2lE9byjTEbE9I
	8ngzk1fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKitq-00000008wAT-3ZNG
	for ath12k@archiver.kernel.org;
	Mon, 09 Dec 2024 18:54:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKito-00000008w7J-04MU
	for ath12k@lists.infradead.org;
	Mon, 09 Dec 2024 18:54:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD9B75C5FF6
	for <ath12k@lists.infradead.org>; Mon,  9 Dec 2024 18:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27216C4CEE2;
	Mon,  9 Dec 2024 18:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733770466;
	bh=Z/R7g7fEQlRtz94pv6c2LJlmem3SXt6N/CdFdM0AE0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E/qGUdZlMc7iEuwB4NtW/KrLc+79XO6nhPqm3EElwRPY/bve7KKljiNcLzQPD4L9T
	 cN9dswY5vR0qN2qlNpc4D1TthuCtazUDSCdyLmDpAzqKeO2TBU0fZiq1Wy8C6YZJ+c
	 En8TtEKQtqtYFGv4RnpPNSnZWBiV9P2ATIA24tRsS2J8hzEElYGTXwOPDECCV6QeDJ
	 1VBp/T773JkN/7DVALF3hWwQ91HDKU5xOMQlRvpdo4RhW+Qu7jL1gr26IXZKlOJzSU
	 3eUYkMoZX0dfD9mjYc9DbjcsWPLkO7uUF4gOZxrNp4LC2fEsNEX2fSoZKXolsXfk4n
	 jSvo2SqJ8SkzQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 3/9] wifi: ath12k: add helper function to init partner cmem configuration
Date: Mon,  9 Dec 2024 20:54:15 +0200
Message-Id: <20241209185421.376381-4-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241209185421.376381-1-kvalo@kernel.org>
References: <20241209185421.376381-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_105428_143070_591D94BC 
X-CRM114-Status: GOOD (  13.78  )
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

From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

In the Inter Multi-Link Operation, the primary device is expected to receive
the partner device buffer. Therefore, each device initializes the partner
device buffer in their cmem configuration. So add a helper function to
initialize the partner device buffer in their cmem configuration.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  5 ++++-
 drivers/net/wireless/ath/ath12k/dp.c   | 13 +++++++++++++
 drivers/net/wireless/ath/ath12k/dp.h   |  1 +
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index af642b466ea0..ff79cb910523 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -930,7 +930,7 @@ int ath12k_mac_mlo_ready(struct ath12k_hw_group *ag)
 
 static int ath12k_core_mlo_setup(struct ath12k_hw_group *ag)
 {
-	int ret;
+	int ret, i;
 
 	if (!ag->mlo_capable || ag->num_devices == 1)
 		return 0;
@@ -939,6 +939,9 @@ static int ath12k_core_mlo_setup(struct ath12k_hw_group *ag)
 	if (ret)
 		return ret;
 
+	for (i = 0; i < ag->num_devices; i++)
+		ath12k_dp_partner_cc_init(ag->ab[i]);
+
 	ret = ath12k_mac_mlo_ready(ag);
 	if (ret)
 		goto err_mlo_teardown;
diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 9a7df54bf570..9e5a4e75f2f6 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1522,6 +1522,19 @@ static int ath12k_dp_cmem_init(struct ath12k_base *ab,
 	return 0;
 }
 
+void ath12k_dp_partner_cc_init(struct ath12k_base *ab)
+{
+	struct ath12k_hw_group *ag = ab->ag;
+	int i;
+
+	for (i = 0; i < ag->num_devices; i++) {
+		if (ag->ab[i] == ab)
+			continue;
+
+		ath12k_dp_cmem_init(ab, &ag->ab[i]->dp, ATH12K_DP_RX_DESC);
+	}
+}
+
 static int ath12k_dp_cc_init(struct ath12k_base *ab)
 {
 	struct ath12k_dp *dp = &ab->dp;
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index d3f3d39a1cd0..7700828375e3 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -1806,6 +1806,7 @@ void ath12k_dp_vdev_tx_attach(struct ath12k *ar, struct ath12k_link_vif *arvif);
 void ath12k_dp_free(struct ath12k_base *ab);
 int ath12k_dp_alloc(struct ath12k_base *ab);
 void ath12k_dp_cc_config(struct ath12k_base *ab);
+void ath12k_dp_partner_cc_init(struct ath12k_base *ab);
 int ath12k_dp_pdev_alloc(struct ath12k_base *ab);
 void ath12k_dp_pdev_pre_alloc(struct ath12k *ar);
 void ath12k_dp_pdev_free(struct ath12k_base *ab);
-- 
2.39.5


