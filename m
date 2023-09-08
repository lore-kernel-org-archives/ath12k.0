Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A28EEB566
	for <ath12k@archiver.kernel.org>; Fri,  8 Sep 2023 18:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N3wmOIM5OFNhxpiTwK0gKS3bPgfGD5Nt9swi/LVQM/c=; b=y6DXbl8Gb9hI0R
	COXLB57SGPZEE0NARbRs0jQH39In3bqKPb9izF/nqy2dJ1vsglrDezk84op2gF1hsNqTIn4ldWxmq
	ZbTaQAdknTqBbIYCHxWOV1b9eQ6yFL/pdAGDoRX2oZvicDfsxVcBG9BAfLBz7+kYS5X/nhi8U2Cko
	VYrV9TlgzfPEzYoaPoxVLTh6yVnMaUsLtjaTEr2H/V+DhQ/2lnyH3OFc4+Am7Nh/CsHIlzl03mcOu
	kcM+G+7W9ZygdbVZ1yV9mwu5Z5HpZB8Gta9IuIO6i2DGOyQ8QnhOtXgkHn4BycALWbsxbQZaYlb1r
	NHVKv149cEYnf0QEohdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeg0p-00EF9H-0R
	for ath12k@archiver.kernel.org;
	Fri, 08 Sep 2023 18:15:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeg0m-00EF7X-0o
	for ath12k@lists.infradead.org;
	Fri, 08 Sep 2023 18:15:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BF386614A1;
	Fri,  8 Sep 2023 18:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9CFC4AF71;
	Fri,  8 Sep 2023 18:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694196919;
	bh=fgJvrhA5A3Tj86ogQKw8SdFO9Ll2VqiaH0pnRYkvACk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hmaiftdRNhqNRTu9hPfiF7rqrDXvjppq2pcHnytsSjHLbrf8kxekSzzzTn8mguzkx
	 g/aTgwXcRIMFDjX5eKEmZo02vl2abwAgEGM9E+F+U8+rvyyQv97LxKAVZI6h2KFWlO
	 8EVHJ8Mi0lcrvlql2bTF7Ft3M5ITk32Pw/20GyuLMtlteVTegi+jUGkABdtrEfmhnN
	 Ynb9hw6jyHOe4rmYm8+oCttqxAjVgfkAUnVihVWOlmt/hoC3U2bZclw71s9r0WuYcc
	 gaxZfPAIxD3GZElboBdMy9Slk7ps2S/vHFV8anVN0dMHA60ywK17N+aJoh43Fwhjek
	 tcrQ/MUk1KxTw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wen Gong <quic_wgong@quicinc.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 42/45] wifi: ath12k: add check max message length while scanning with extraie
Date: Fri,  8 Sep 2023 14:13:23 -0400
Message-Id: <20230908181327.3459042-42-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908181327.3459042-1-sashal@kernel.org>
References: <20230908181327.3459042-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_111520_366209_84065FE9 
X-CRM114-Status: GOOD (  10.68  )
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

[ Upstream commit 2f5124e86ae74b7ba24c9ae2644107b750cbf38f ]

Currently the extraie length is directly used to allocate skb buffer. When
the length of skb is greater than the max message length which firmware
supports, error will happen in firmware side.

Hence add check for the skb length and drop extraie when overflow and
print a message.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20230809081657.13858-1-quic_wgong@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 4f378f06e946e..eebc5a65ce3b4 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -2162,12 +2162,6 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
 	if (arg->num_bssid)
 		len += sizeof(*bssid) * arg->num_bssid;
 
-	len += TLV_HDR_SIZE;
-	if (arg->extraie.len)
-		extraie_len_with_pad =
-			roundup(arg->extraie.len, sizeof(u32));
-	len += extraie_len_with_pad;
-
 	if (arg->num_hint_bssid)
 		len += TLV_HDR_SIZE +
 		       arg->num_hint_bssid * sizeof(*hint_bssid);
@@ -2176,6 +2170,18 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
 		len += TLV_HDR_SIZE +
 		       arg->num_hint_s_ssid * sizeof(*s_ssid);
 
+	len += TLV_HDR_SIZE;
+	if (arg->extraie.len)
+		extraie_len_with_pad =
+			roundup(arg->extraie.len, sizeof(u32));
+	if (extraie_len_with_pad <= (wmi->wmi_ab->max_msg_len[ar->pdev_idx] - len)) {
+		len += extraie_len_with_pad;
+	} else {
+		ath12k_warn(ar->ab, "discard large size %d bytes extraie for scan start\n",
+			    arg->extraie.len);
+		extraie_len_with_pad = 0;
+	}
+
 	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, len);
 	if (!skb)
 		return -ENOMEM;
@@ -2265,7 +2271,7 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
 	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_BYTE, len);
 	ptr += TLV_HDR_SIZE;
 
-	if (arg->extraie.len)
+	if (extraie_len_with_pad)
 		memcpy(ptr, arg->extraie.ptr,
 		       arg->extraie.len);
 
-- 
2.40.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
