Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E92CEE49AC
	for <ath12k@archiver.kernel.org>; Tue, 22 Aug 2023 11:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y/wfy7BtBX9rPAm5qmrQ1CaEhMILWfnZv7OG2d0hvvo=; b=tZiUKS+KagYvU3
	cD/PJ9HPlnel6WquQHGZZ9nAky9RgiH/Stxf242/QPuwQ/h4I44wzh3Z7CzIIbWza0urfq5HyuAcZ
	hMJ6fQPzCLPc8/e4tfEkXch966xdWYnLQJYn+kbdNwzAgKOmjTEkvfMq/uBOtnKuKnXH57mDILkNP
	oGtHLaBGPntU27MFAHXrRCV0eS/P450WxiRW7C1F3VtJjQkx8osEOrzS+mRxYxC9Ze8LwIGrnvJpL
	kmPCHBaDqdomqozdqH0t7rT1sEW5+vAW76num4vMRWBRXtifpPwzcdR9LOI7h3KH5clglSm6ufNQe
	DpCahVZxzrcFlUKtsU3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYPgQ-00FpjL-0L
	for ath12k@archiver.kernel.org;
	Tue, 22 Aug 2023 11:36:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYPgP-00Fpit-14
	for ath12k@bombadil.infradead.org;
	Tue, 22 Aug 2023 11:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KpVLcmhr5AtSywAFUscShxgiLen1Dkl75O/ELmbJb1U=; b=Wo4Qff90JmdWuKr1urZ1PxhFWI
	fjSNyG2T1MyGg8a+FOHfRS1ZbEPlGvv3Txwj91dmlGurj+oex5JTJSKInYCAE7RLOErXVrfiShIKU
	O/dS1M7p+wsSHHYM8dioDOwWgZsruMD3oKpqMY1DLqlqcJdFatQcwExeW94ImT5kMWZoEcIHnoFK4
	IoVxh4EP112VPJ9yhd6uXjyPut6y531RoZiV0E0+fnX84ZEmMlg3F6mDzNAQKQV5971VaiSQiKnYP
	VttnbkHQoE5yCoV0CNxg1k5zRoN3yZPShx64iytQW7oTNrx/HCNfVz2BCCTbpP2cIw9vkWlacsi//
	atrOKOAA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYPgK-002hfO-2k
	for ath12k@lists.infradead.org;
	Tue, 22 Aug 2023 11:36:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9529D63430;
	Tue, 22 Aug 2023 11:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE3BC433CB;
	Tue, 22 Aug 2023 11:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692704172;
	bh=m1o0jXed7BnewlHKG+1vCqtrmwRS0IPm7ZfcZTswWms=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IrdYlZZaWqM3fQQ0NJZafwAu1OL695GbZndRx3hQf5zRk7iEndCWn4NvUZNMeiyxB
	 pv7g/X3WcItoae5jC4aG1ydhvIm4MHngcMdkbYNei/4rydcfm01ef2uPpTWKBWI/b7
	 jtsV2C/WsPOBDvE/vRooAtVx3WfBIjTewkF6Q/ENDXipbzdcwiXHMoZGX5X6gGOiuS
	 kEbdKGW1PhUN4X6iEwDujtXmH0EA488QHaoreoVM4chme3YuAatq1rtn4I6XK6bl5K
	 O7n+oCm/S32gLduTZ2o9O9w9/mL5hwh91MWehm0EvbbUN647voxBgJIgXy+sPqVX2F
	 Ypjx9gBGtnWRg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wen Gong <quic_wgong@quicinc.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	quic_jjohnson@quicinc.com,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH AUTOSEL 6.4 06/11] wifi: ath12k: Fix buffer overflow when scanning with extraie
Date: Tue, 22 Aug 2023 07:35:48 -0400
Message-Id: <20230822113553.3551206-6-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230822113553.3551206-1-sashal@kernel.org>
References: <20230822113553.3551206-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_123621_184350_1BE90215 
X-CRM114-Status: GOOD (  15.59  )
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

[ Upstream commit 06f2ab86a5b6ed55f013258de4be9319841853ea ]

If cfg80211 is providing extraie's for a scanning process then ath12k will
copy that over to the firmware. The extraie.len is a 32 bit value in struct
element_info and describes the amount of bytes for the vendor information
elements.

The problem is the allocation of the buffer. It has to align the TLV
sections by 4 bytes. But the code was using an u8 to store the newly
calculated length of this section (with alignment). And the new
calculated length was then used to allocate the skbuff. But the actual
code to copy in the data is using the extraie.len and not the calculated
"aligned" length.

The length of extraie with IEEE80211_HW_SINGLE_SCAN_ON_ALL_BANDS enabled
was 264 bytes during tests with a wifi card. But it only allocated 8
bytes (264 bytes % 256) for it. As consequence, the code to memcpy the
extraie into the skb was then just overwriting data after skb->end. Things
like shinfo were therefore corrupted. This could usually be seen by a crash
in skb_zcopy_clear which tried to call a ubuf_info callback (using a bogus
address).

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
Link: https://lore.kernel.org/r/20230809081241.32765-1-quic_wgong@quicinc.com
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 7ae0bb78b2b53..1e65e35b5f3a6 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -2144,8 +2144,7 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
 	struct wmi_tlv *tlv;
 	void *ptr;
 	int i, ret, len;
-	u32 *tmp_ptr;
-	u8 extraie_len_with_pad = 0;
+	u32 *tmp_ptr, extraie_len_with_pad = 0;
 	struct ath12k_wmi_hint_short_ssid_arg *s_ssid = NULL;
 	struct ath12k_wmi_hint_bssid_arg *hint_bssid = NULL;
 
-- 
2.40.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
