Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E20EEB567
	for <ath12k@archiver.kernel.org>; Fri,  8 Sep 2023 18:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x4gXqGRjKgdr+7vtVtkJdlkbQuicsgf9Tr2UnIu4n1s=; b=uqzvPtzR9chIZJ
	F95A1E+MNK4FCdUNOa5TxwXzZldtEL87wFxs1tQmURcRCIJlanMJ95AE/Kvb/Yg2g2RbRZ3vVOyp+
	Iz1g6/KNQpmBdEl2mfrh6rAXGWOyIqYdcLAgywI0CSnXP8DvfsbOEwce0F6I+nbhrpzB7bFBKR14k
	zRSWviBrydhKCmv/KTjW42VSfDWo421DQ17UxfKQ4uoDvap8+XhV7cS8ynlsWErQFc4gRvv6nCp9A
	kT1Y1K3Cuq2RLLa0WyPkAQHKXyc5ToqyFv0dUrN5TOyehd840TwiUAxzwWIuH8/pm2jPX3CVa3J8e
	M9VwOhPOKt1nErIWyZLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeg2y-00EG7E-2z
	for ath12k@archiver.kernel.org;
	Fri, 08 Sep 2023 18:17:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeg2v-00EG50-28
	for ath12k@lists.infradead.org;
	Fri, 08 Sep 2023 18:17:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id E5B8BCE1C49;
	Fri,  8 Sep 2023 18:17:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283AFC433BB;
	Fri,  8 Sep 2023 18:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694197050;
	bh=TT8QA3sHXmMs7mhUHh3fHuPlrwyc1j5L7ZAZXwAf6VM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aO/O1BYutDKTVWnFrXa5/BVc0Z9p9ev+T9r/Ms8MXzm/ZJMdfxscgyGKYS/g9dQeT
	 lNtfCpbI/x7ek3vJuxm6opcvNy5hptVvKzetLXcfX99AUxZss1aY7/5LYIgM/YySBS
	 +TtjsEKejwH81xxdgJF+2COaxFyVcGFjrlNRVcL/iO+w0+NRQIdq1RGgwNsuLTCcO2
	 JlQ8FlYtxmgVfLt4cDE0qjtJ20ktR3hb/heBexTsCm1y097AuSvmDyZV2IFv/zr9Iz
	 yNw8t/skSAXRJrZPmeJshB900ZIAu9kPwuiUfKJRqwfwuUfQtV5feftfHUTUPRibC5
	 Xb1qBj/UnByVw==
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
Subject: [PATCH AUTOSEL 6.4 38/41] wifi: ath12k: add check max message length while scanning with extraie
Date: Fri,  8 Sep 2023 14:15:52 -0400
Message-Id: <20230908181555.3459640-38-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908181555.3459640-1-sashal@kernel.org>
References: <20230908181555.3459640-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_111734_067372_BD625E88 
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
index cef01148fc163..6ae09779a68cc 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -2163,12 +2163,6 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
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
@@ -2177,6 +2171,18 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
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
@@ -2266,7 +2272,7 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
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
