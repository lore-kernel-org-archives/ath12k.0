Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30318606A6A8
	for <ath12k@archiver.kernel.org>; Sun, 22 Nov 2026 21:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=44ehPcA0;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=iNMcBNGG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RhXLVgSRZBr+TZ8HYB6abPUQ+n+l05u+js/LeXBMczM=; b=44ehPcA0yESOFy
	i6mINZl9zSyGizn+p8hLPVb5s0B620YA3jcmxwLUnXIJfolXFsoEffI7zRZ1R8IHFcqdEZG/Fl7kp
	p7sD1Kx23qvehDfJ/xQ2AS1LL2EMt5MnqaYoWYtHvQ0LaRfipHX56zuVqCZH/mKVFRB7TIuTrwGUI
	aR+YdEko5G1zh9hfi8kd8K1VRrwX/McM2PVWlbY7R5qUWIVTfVK2GSIGxAmgle2aMNu2NjUdU5TPs
	9FkIKehcUOEYVM+J7reABnVY1tU+L270E0jX3QURqPVtRgn4qD5i+Rd/8PVQO81OB+SZxpKSsJYvU
	xpuX/Pws0cpNp38xg7jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEkf-00000001kpq-3lUo;
	Sun, 22 Nov 2026 21:05:33 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEkd-00000001kk9-3Rdr
	for ath12k@lists.infradead.org;
	Sun, 22 Nov 2026 21:05:33 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c516a160d24so87629966b.2
        for <ath12k@lists.infradead.org>; Sun, 22 Nov 2026 13:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381530; x=1795986330; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RhXLVgSRZBr+TZ8HYB6abPUQ+n+l05u+js/LeXBMczM=;
        b=iNMcBNGG+NkT7CJbw6bMiqOTYptNsjuVh+SAeAfg/0P+ynoWAy/J58mQ7ljeQtwzBP
         OVrsbNA5U3RlLQjeoHIXkZkCgRuBlkAq+Ozp0JbObZgo03l9OnUK8IfQ25H9uM/BZTic
         FPgiHsxGNIP9r7n+9blkDUjBuotjBFWhjzjo8qgREnqbIWJb5iHAzr63fVdsjmYAf4ha
         WzPTQMwy+GSaQRqrq7BKxunuNg8Zr9XgUStIL3Qwj3FwQRdT80krefRntEmB3hNRSmjA
         EQ5j5av/qTdFCtiqFNKxzWRBujb6EDM3fELjV//poSWqy0eOtN+6XTGSqTU2TIJRSdJc
         ZbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381530; x=1795986330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RhXLVgSRZBr+TZ8HYB6abPUQ+n+l05u+js/LeXBMczM=;
        b=12yxj5gpxaJ4TspHNlDoFDQ3iYu5iTQIFznMZLFBbI1ZK30IICD7+B1baVQfxTWQWg
         PTnqvlhWmv9eqYu9DoKsmR9w2guBT9kiCAqBD1hGk/zhu3aECoHyL9MCZEPXQfz8KN6r
         GOUC0vfQGT+O84Nuq27cJlvZ5u/LBLXyKqjRZYLjZat05yw7k906Ba1jJQ/XGexp3pI3
         Nkc/cnxniFEqy7x0VD1PmYSsbTKv3eMD86hb4NxsZWpEbJ/qMd1s42F+pabfMcT4x5C9
         dyWMnADelU2N2Rdy/CeqKinjBpat4YSVTup5VRDNXe1F7IRIe28HTqW9O0GPsKUNj/Wo
         WKMQ==
X-Forwarded-Encrypted: i=1; AL+hErH/2GzXlYvC36dNmSQ/98krGWMhlINR0uQOUcx6GxhsWy8Nngg52wG9mKi0TXqeyDtFE9PPaE4=@lists.infradead.org
X-Gm-Message-State: APuU4Z/F7Gf/7zGe8PHyfSgctL5MQmj2P9oQUq6zgpVrqjzixB9DHqRH
	h0OL2ePw0j67V+Q5w60/wbVi3koagHLagcJQHwoxWrIzT+TRHn58S/HrXUmXrAw74Q==
X-Gm-Gg: AZFdTZezrSMyPXNcRJbUmsGMt5C7FiIzXEgrmAW0/RqXc/wt4Lf/gTaAUHg8hECdReN
	5Z+csNkekftoPL8Eng1Q3xX2QDadusgNgFVwvRnTmNp3XfcOa7Sfj5LS615MuuRoNtatSJmucjg
	uV6R3nEHH3qgZh4I/7W7VOCSeAvI4UdV96QtbMUaZjL7T4kkYXMN0f0n36kw8+jqHQCOJMSqBWu
	FDKxC1XdMb5waQU021bnIVCy53umW5a0kcYHJ8bnBQrF2/e3ssAAoaO7KTAU8fGnLFEFVtYVKmG
	TQtViHDocM1rCWIV8a+mMSEr0YTv5+2Qr4TaWKI/qRVOHkYAVpecumxWtjam7Qj82z2yIwvcqHA
	VkUQGdgfZlE59rAHgI63ZGDHZF7bLlQOvmxXeD8Ncf6jW2zgz3hztXA7cAcPCwnLM3aLqlfQ+a4
	VI9SCpOie7Sa2LuitWoj7poHIjI2cSCWHDuLL2HXETbUDiJE1m94YyuS8hI3Cmp6xtiq2dRzYI6
	6/I1Cbla4MIgStE5DW2DY/X8eT1PFc/lOHtr+gNBO95XhCgpT3Wm3384TlYty/YCNrcvw5VGVT7
	UYCbVWYRF6+/bIVMWQBCQC9HAdvDDs/oDzvmmxgCVsBIKnDjoFJLxd/PpnFkxHLy+91vI6vodrA
	kSqDIyx59QGyfG3SgP9PJ6iK2vllub9toP2I6Qj97sh6Hg9ofuA/0FcMrgby8KsSwKwlwGDI26h
	sNBCqiUnVL9pgZlmIWKBPWRKzSC0dRcRd/4tfHsMihpFvOWYrekO7WFS1Dkla6GkWttwauKRd10
	K0Cxzejamz/R8mOnMvyfO7xvmhGCzcdKjG9vr2pXRra1hoK7Rz8UJb5zRqK9AZmY0xA0wXoOzBU
	f4wWjsGWaequp2iD73cV5cGcu60uBVpk2y8VGS+l2gEZj24xWNLYqmMqt483B/rPdgAsPZFYxQ=
	=
X-Received: by 2002:a17:906:af85:b0:c3f:dce3:20c5 with SMTP id a640c23a62f3a-c513ac496d8mr571307066b.44.1795381530146;
        Sun, 22 Nov 2026 13:05:30 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d300ad8e04c1718a6e78.dip0.t-ipconnect.de. [2003:f2:4713:d300:ad8e:4c1:718a:6e78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm339935766b.57.2026.11.22.13.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:05:29 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	John Crispin <john@phrozen.org>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
	Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Jouni Malinen <quic_jouni@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>
Subject: [PATCH ath-next 4/6] wifi: ath11k: clear the crypto flags of the receive status for each MSDU
Date: Sun, 22 Nov 2026 22:05:23 +0100
Message-ID: <20261122210525.2076058-5-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122210525.2076058-1-julius@bairaktaris.de>
References: <20261122210525.2076058-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_130531_930918_11A301E5 
X-CRM114-Status: GOOD (  12.68  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath11k_dp_rx_process_received_packets() keeps one ieee80211_rx_status
for all MSDUs of a radio that a REO reap returns, and
ath11k_dp_rx_h_mpdu() fills it for each of them. It clears
RX_FLAG_DECRYPTED, RX_FLAG_IV_STRIPPED and RX_FLAG_MMIC_STRIPPED of the
MSDU before, but not the other flags it sets for a decrypted MSDU:
RX_FLAG_MIC_STRIPPED and RX_FLAG_ICV_STRIPPED for a group-addressed
one, RX_FLAG_PN_VALIDATED for a unicast one.

A decrypted group-addressed MSDU that follows a decrypted unicast MSDU
of the same radio in one reap would therefore reach mac80211 with
RX_FLAG_PN_VALIDATED, although the hardware checks the PN of unicast
frames only. ieee80211_crypto_ccmp_decrypt() and
ieee80211_crypto_gcmp_decrypt() then skip the replay check of the
group key.

On IPQ8074 hw2.0 with WLAN.HK.2.12-01460 this is not reachable: the
firmware releases group-addressed MSDUs through the REO error path,
with error code DESC_ADDR_ZERO, and ath11k_dp_rx_wbm_err() gives each
of them a receive status of its own, so no reap carries the flags of a
unicast MSDU into a group-addressed one. An ath11k station under
unicast load received 29011 group-addressed MSDUs there, and none of
them entered ath11k_dp_rx_h_mpdu() with RX_FLAG_PN_VALIDATED already
set. If a chip or firmware delivers group-addressed MSDUs through the
REO destination ring, a radio in range that recorded a group-addressed
data frame of the network could send it again, without any key, while
the receiver gets unicast data, and the station or mesh point would
accept the copy.

Clear the three flags with the other per-MPDU flags.

Found by reading the code with an AI review tool.

Fixes: 2167fa606c0f ("ath11k: Add support for RX decapsulation offload")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index f8c08b8b6b08..6fdcd2aed7dc 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2338,7 +2338,10 @@ static int ath11k_dp_rx_h_mpdu(struct ath11k *ar,
 			     RX_FLAG_MMIC_ERROR |
 			     RX_FLAG_DECRYPTED |
 			     RX_FLAG_IV_STRIPPED |
-			     RX_FLAG_MMIC_STRIPPED);
+			     RX_FLAG_MMIC_STRIPPED |
+			     RX_FLAG_MIC_STRIPPED |
+			     RX_FLAG_ICV_STRIPPED |
+			     RX_FLAG_PN_VALIDATED);
 
 	if (err_bitmap & DP_RX_MPDU_ERR_FCS)
 		rx_status->flag |= RX_FLAG_FAILED_FCS_CRC;
-- 
2.53.0


