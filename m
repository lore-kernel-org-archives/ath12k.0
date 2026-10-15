Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C6FCCA464
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 20:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Lo8K72+x+3BIcLLPGxgUbde81XtXZI0ot8cn4aPlxc=; b=Zb4h+01m1pU+/rmLPsskADfdlm
	u2acbIJs3Guwe3XNIxOJmFM566mS6p7Vevv3TwuGsCwS/WyaMSNMR/nmSSFzopFOjOyyRMgMzI/hJ
	KmQjWq/LdcxX3ZV62apLu4NE1aO11LFt37kcqY9Nc5EqkBR+KleixMTH3GAtXIynQ0ucyFmqinHzj
	JC5C0+OJwi7s58d1hPhrx9BNU+aVzW8JMQHsrem+AwmygmsEQTkOmjxrtvRUiZNYNJIyxZClIV2FC
	bfTkv5s2MFPGFg0aK9RzY5r7nWstUj6ATa7OsfvOalSwlonFG1IdiWYJySgr7zBCuCXi24USdjnuZ
	WgfXH+7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHSUE-00000001OAl-1MJG;
	Thu, 15 Oct 2026 20:55:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHSUD-00000001O9a-0FH4;
	Thu, 15 Oct 2026 20:55:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7248E4479E;
	Thu, 15 Oct 2026 20:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51017C2BCFF;
	Thu, 15 Oct 2026 20:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792097736;
	bh=8TFgXrqm00gTUkYWKQDkyq2nEt87hZ1bR+nt+jFn4KY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XCuEMW7yHvNa50Pc6fIRq4R8fcDklDEWseu5tr0BYxA0IbOwzi6ITi6byt/65aEZY
	 0ZLGI3dMg/qPwXPn4C8/vU19Wo1FMJeLNk0RcrGWhGMTDLLpfZvt101yv361ucNbpI
	 zRPwxthqgmCDRv/FO+pBLamGCP9y+0EAk75J5lMOClITzjwy66uwtOGgGykY7L1gSY
	 VmgZcTbSDCX+KclTo0XSyR5YWN1PndmspkIylE0+ABa50gIBJXFM4fPtPdruv/9ifg
	 s+1oKs02FbeBweIV4REWCqOXZAS8mV/+Sai1Qb18HcDfaJzYiPJeHKGbsObrjqHITd
	 wG3XocqFBC3sg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F05CCA464;
	Thu, 15 Oct 2026 20:55:36 +0000 (UTC)
From: John Macias via B4 Relay <devnull+dencity7.gmail.com@kernel.org>
Date: Thu, 15 Oct 2026 13:55:25 -0700
Subject: [PATCH RFC ath-next 2/2] wifi: ath12k: bound READY MAC address
 array reads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-rdy-mac-array-bounds-v1-2-5de276b752a3@gmail.com>
References: <20261015-rdy-mac-array-bounds-v1-0-5de276b752a3@gmail.com>
In-Reply-To: <20261015-rdy-mac-array-bounds-v1-0-5de276b752a3@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, ath12k@lists.infradead.org, 
 John Macias <dencity7@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792097735; l=1848;
 i=dencity7@gmail.com; s=20261015; h=from:subject:message-id;
 bh=Q7bR+qmBnYByCGbR1Dt5w8wYWTuypEv1iCd0orMgbPU=;
 b=ep45ZWSDL6ranuUgrWsBGU9OMaYKx7UAoVEQdVgNNlPaBcT+MtrLTsK4H+er3Zk+QobJQE5tK
 eD+x4sEMsHBCGHkLiKnE5Bhwd282SAFQnUWslyydsc4jEQWSLCDKlfz
X-Developer-Key: i=dencity7@gmail.com; a=ed25519;
 pk=z7cMHA0B6NULvJzsST/bbOOegMB6xCo9+/ytQure7B8=
X-Endpoint-Received: by B4 Relay for dencity7@gmail.com/20261015 with
 auth_id=1198
X-Original-From: John Macias <dencity7@gmail.com>
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
Reply-To: dencity7@gmail.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: John Macias <dencity7@gmail.com>

ath12k_wmi_rdy_parse() has the same pattern as ath11k: after checking
that the READY fixed record advertises at least num_radios extra MAC
addresses, it copies one address per radio from the
WMI_TAG_ARRAY_FIXED_STRUCT TLV without checking that the TLV actually
holds num_radios entries.

With two radios and an array shorter than two 8-byte entries, the second
ether_addr_copy() reads past the end of the TLV value.

Check the array length against num_radios before copying. When it is too
short, warn and leave pdevs_macaddr_valid unset, so the driver keeps its
default per-radio addresses instead of failing READY processing.

A userspace harness that includes the unmodified parser reports a 6-byte
heap-buffer-overflow read under AddressSanitizer for 8- and 12-byte
arrays with two radios, and the fixed parser passes. Compile tested only
(ath-next, W=1).

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Assisted-by: LLM
Signed-off-by: John Macias <dencity7@gmail.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 75b259990c..ef070ace08 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -7099,6 +7099,12 @@ static int ath12k_wmi_rdy_parse(struct ath12k_base *ab, u16 tag, u16 len,
 		if (!(ab->num_radios > 1 && num_mac_addr >= ab->num_radios))
 			break;
 
+		if (len < ab->num_radios * sizeof(*addr_list)) {
+			ath12k_warn(ab, "ready event mac address array too short: %u bytes for %d radios\n",
+				    len, ab->num_radios);
+			break;
+		}
+
 		for (i = 0; i < ab->num_radios; i++) {
 			pdev = &ab->pdevs[i];
 			ether_addr_copy(pdev->mac_addr, addr_list[i].addr);

-- 
2.47.3



