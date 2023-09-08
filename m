Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAA2EEB562
	for <ath12k@archiver.kernel.org>; Fri,  8 Sep 2023 18:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W8LJN1GIxvF1tLAjumrOQGdjmMWVHzfz14NEAYfoI1Y=; b=y4yIGyKPZCEfj5
	FZL9GkQ+byincjKmLMm/ko/IjoNuHhdOT9dAF1e7NrFpTMXPcxGXJYHUFHAMX/PcT3ObWjKVHUZ4Y
	sl6xxMRS6Xkzn0HrTVMAR8kc6OspZ6oWvNuYb+sz5sFroNTN4IxsIn5ekFwfijS5Oh9ExYZpTDFcE
	P2IIrOmIgKsDb4mrqSjdyf6l72KTHwC0wXY9B1h4eULzUtJXOYBck1HCUK+haOwxmelnEtwIxozeH
	f4gVHIvGeY10pm6Z+YvrX85kq3RUUvwy9vTePRpAKlR48ouuJfla3b91BMCXMoVmEzLXIXrq/xTcW
	dgcHXcD84aUzcoO+bvyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qefzp-00EEgC-0I
	for ath12k@archiver.kernel.org;
	Fri, 08 Sep 2023 18:14:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qefzl-00EEeg-1n
	for ath12k@lists.infradead.org;
	Fri, 08 Sep 2023 18:14:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CF41CB821BB;
	Fri,  8 Sep 2023 18:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A856C433CC;
	Fri,  8 Sep 2023 18:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694196855;
	bh=cRzf/7lzE8z+OoRzQWPsfDjCfODBX/3rPI/J+aHnQS0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dgTweesMiVS5ZGiUfaAVBJub9lg8kA0xSvVXCGgiKsf0WxfCrsYLPCWsY01lnMsNw
	 tL3Z9tlmdNuXo9v9l/eGbIQkDXY6GblZmB6/nWbScu/DCiw7/dFnGPDs4oSZryCzaO
	 75qdcUkY4Tjujq8ujjQLON80mFMAP0tH3mb9RVE2u3h6OUeEtlqwVhybmgruN2zLMR
	 ioVlViWEjgOIXFiLX0Wp5eAMRy+hKOCYqgZ09GE7XrmhWy3Xp5ULN9td5hx1Lc9f8O
	 VvjVB+LcW+tsswa6NS21Va4uRKM73WQx8A4hYZYkSaZJw6Lf+Mi6+ARDB5kDqvRgm9
	 JdIsyi0XIxwqg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wen Gong <quic_wgong@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	quic_jjohnson@quicinc.com,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 16/45] wifi: ath12k: Fix a NULL pointer dereference in ath12k_mac_op_hw_scan()
Date: Fri,  8 Sep 2023 14:12:57 -0400
Message-Id: <20230908181327.3459042-16-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908181327.3459042-1-sashal@kernel.org>
References: <20230908181327.3459042-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_111417_736393_AE3554A6 
X-CRM114-Status: GOOD (  11.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: Wen Gong <quic_wgong@quicinc.com>

[ Upstream commit 8ad314da54c6dd223a6b6cc85019160aa842f659 ]

In ath12k_mac_op_hw_scan(), the return value of kzalloc() is directly
used in memcpy(), which may lead to a NULL pointer dereference on
failure of kzalloc().

Fix this bug by adding a check of arg.extraie.ptr.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20230726092625.3350-1-quic_wgong@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/mac.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 1bb9802ef5696..af46b63bb15bc 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2755,9 +2755,12 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 	arg.scan_id = ATH12K_SCAN_ID;
 
 	if (req->ie_len) {
+		arg.extraie.ptr = kmemdup(req->ie, req->ie_len, GFP_KERNEL);
+		if (!arg.extraie.ptr) {
+			ret = -ENOMEM;
+			goto exit;
+		}
 		arg.extraie.len = req->ie_len;
-		arg.extraie.ptr = kzalloc(req->ie_len, GFP_KERNEL);
-		memcpy(arg.extraie.ptr, req->ie, req->ie_len);
 	}
 
 	if (req->n_ssids) {
-- 
2.40.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
