Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5F4606A323
	for <ath12k@archiver.kernel.org>; Sat, 28 Nov 2026 17:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y6W/gumC;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=oJTVggdQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DMbvLhVt9/6Byoyb38QB8bC7RSl2nRVkt3CkxY9/jJY=; b=y6W/gumCtr1brc
	BareM0S4FykUVj16Ib5j29MFwquopGyUA6JZTJ8kPlp7pqX893igNbJ1SwUKhDAopUxki8i7iitYI
	P8EGMOU1h6xktSTMiATPDH0UgI+umeGqJCMNPN5bLeaG2vc152Kx/gyQ4pqMLgtmJGMh+ReNFM5kw
	AT9zYIZfVgZ1HIlWQPijO0EhB40znUGgPuxX+S2C+d6KXiAV56edQdiXrXDmnsKGp96pGVm5SpJPZ
	Xd6bz/XFMChjlVzTxsSXdlOfss+sc3SCx5KvAmYyiiWvVXFe/IJAHtEkniRqgT06vNBJmPv+1pRCP
	Nxe2ICR7r+3aaOl7VWlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXM88-0000000119I-3wfr;
	Sat, 28 Nov 2026 17:22:32 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXM83-000000010vK-0c0w
	for ath12k@lists.infradead.org;
	Sat, 28 Nov 2026 17:22:29 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c4395d31228so1555215166b.1
        for <ath12k@lists.infradead.org>; Sat, 28 Nov 2026 09:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795886545; x=1796491345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMbvLhVt9/6Byoyb38QB8bC7RSl2nRVkt3CkxY9/jJY=;
        b=oJTVggdQSzycktPYSaI0aN7LBW8b2LMCJGLvP8UIBtYW8pGnpxAwXnGlBI0zXbfixy
         nh/O2D5rDFcbSNlAXBHsK00ySA8ieverBJgtqyX6Cx6/zmlPswalV7DsxtwyVOnZP6c8
         3uPAb0D/k1KbZ517gKFnpdKy7StA2LwiyIMZ1IlLGvM9ioPYHDdwHlDiJJbXQ3w0MKnY
         kOqTqAdlUIpyBwAKqm9qBJ4jQts6rXbG+sH4cESy+MJsmvVPR1WU0ntlsBHrXL8LIcxC
         vx9ldgxREH3gVeMqbIZxjqNKCebk677MFXwlFIX5hltVugnJ+YPkDjp04q/ZGTQwNPQf
         gHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886545; x=1796491345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DMbvLhVt9/6Byoyb38QB8bC7RSl2nRVkt3CkxY9/jJY=;
        b=EJ168IZ+lSUkV8pSfKLfZ6rck4mNghxdbea25PxUwJdXztliVofz7vA+L72KuPJe7F
         xWkiOvy2K1rmYqWKRIHgl7dhalGJ0T2qJUxQZio1AAUJupJxBI5F5GA2grU37OUfaQPz
         dN/OmKrYd5pLo6IxXXPyzMDIsHcCgi/6Ub5Bx3zFL7PZUvOde3PFy9ghh/3zPgjD3cXA
         69OTg9mL3j3OxKhpi6UNOt50VZG33ucCOrvks8+WCK627dyjX7ZeUemSIEFRmjYiHB1w
         BYSWLCIIo/lbFVRreOCk0MdTKp/8GmWasEqwZPLqawgKMnG/j23mHfQFSNwLyQjJKunE
         TAGA==
X-Forwarded-Encrypted: i=1; AL+hErHvaWfXWwvVNMN2orwEx89YJg6OQEW1jJv6Qett/hhtfHYX9B9LDtYncGzLwtEJ7cnb4DnW75g=@lists.infradead.org
X-Gm-Message-State: APuU4Z+8grOTsv6V0dXWdYOAzh3pDJD4ufYnkh993oz1/q5tr0CeOJG1
	qpgESYMiuoZp1Ie/6suExpnrc9ZG+6PKHM98U9GpHQev6KQVvjVPscK1MjgnYLlmUA==
X-Gm-Gg: AZFdTZfcFuwTpJ02aAo10ZYN3Su8E5TQUczVr70Jno+fuMm/7bIoKzUTmqx7KaMejkh
	wr8jeLa07vyBprZfqxKmxQPjOAUzWeN/ljpQoyoDmw1PoAx9ZTN2XGlAR8iTTFDA8lrATzvjYM+
	Z+PvZ4lx9RpidMvctueXrrZFvpoKTDujj64O2TBjSoNDZP5vSXHrsLokjGgHGgikJzkeo7r4P3K
	gfmfThgSxEnqD6LvEwbmobhhd112OcG0Nbtzo1PfxJFGHKqoB4qJ3BUPVPZNO6kkNiYZ1bx4JcB
	SDslKLi5K/k32RRvGGdl8kr2T+rWOK/OWt2BF6NE7iHlV2tAerSkvcZcZUvzQhwm+7Wv+XaNABs
	cFv8tJPWU2sY7t+NNzS+r2X2jSqrmxvhkraajpNZ0CkM8aH6KPAzwup+fyGKIETRK2ZdW2END9t
	PYqZnz2SzidXK5ufghJPpTt45zhExCtd7gc0Dw5EhlSi0kHRD1Dm/1SYMUc5L6bWDqU4EC0Gpab
	R790Au6HFOsP6IMrxcBXuew80ErElfcDQcRX7el5zAYqpV16pNvWCUYzq8B+1A4l7oGlzAH+CHF
	ibCqkCW+HnciqTWDkbQiSRiNNBGi6MWuicII0Zi2srF0nofkZyaCTjusxn0tAUIny/qde23hyfy
	ou3ry6ieH3zw3zZjlU0w3a3a5kU7BW/TjAH/i5+tKHaJCCG4vX5ZPqkduzsb0c6GAkhw5ekSR6N
	tpOFGWCokqgW0grDfQBKpYDCjf9II3n6js+ITtR+VtAxWiAE5+yDRET8JRShIuwAIZSMXHP7JZP
	nj9GuNUe9LCVqoBmSy0EgPcb/Wk6UhHjTTUXMPP5HqbWnph28qp7GEPJ4eax6VsZsyjK9uqPoUC
	BT6Axy1o2Gg7IQ==
X-Received: by 2002:a17:906:9c03:b0:c46:2987:2169 with SMTP id a640c23a62f3a-c513a84c864mr1823750566b.24.1795886545446;
        Sat, 28 Nov 2026 09:22:25 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm981388866b.80.2026.11.28.09.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:22:25 -0800 (PST)
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
Subject: [PATCH ath-next v2 6/6] wifi: ath12k: clear RX_FLAG_8023 of the receive status for each MSDU
Date: Sat, 28 Nov 2026 18:22:20 +0100
Message-ID: <20261128172220.922376-7-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128172220.922376-1-julius@bairaktaris.de>
References: <20261128172220.922376-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_092227_258671_58609492 
X-CRM114-Status: GOOD (  10.41  )
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

Since commit c4aa897fe234 ("wifi: ath12k: Handle DP_RX_DECAP_TYPE_8023
type in Rx path"), ath12k_dp_rx_h_undecap() sets RX_FLAG_8023 in the
receive status that ath12k_wifi7_dp_rx_process_received_packets()
keeps for all MSDUs of a REO reap. Before, ath12k_dp_rx_deliver_msdu()
set it in the copy it hands to mac80211. Nothing clears it, so every
MSDU after the first one delivered as 802.3 reaches mac80211 with
RX_FLAG_8023, including those that carry an 802.11 header:
ath12k_dp_rx_h_undecap() rebuilds one for EAPOL frames, for decrypted
group-addressed frames and for frames from a 3-address peer with both
DS bits set, and native Wi-Fi decap delivers one.

mac80211 hands such a frame to __ieee80211_rx_handle_8023(), which
drops it when the station has no fast-RX state, as before its 4-way
handshake completes, and otherwise handles it as an Ethernet frame
whose addresses and EtherType are bytes of the 802.11 header. An EAPOL
frame that follows a data frame of any station in the same reap is lost
this way, and so is a decrypted group-addressed frame.

Clear RX_FLAG_8023 with the other per-MPDU flags in
ath12k_wifi7_dp_rx_h_mpdu(), before ath12k_dp_rx_h_undecap() sets it.

Found by an LLM review (Claude) of the code.

Fixes: c4aa897fe234 ("wifi: ath12k: Handle DP_RX_DECAP_TYPE_8023 type in Rx path")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2: discovery line reworded.

 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index e37353445749..b74ffcd94a87 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -417,7 +417,8 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 			     RX_FLAG_MMIC_STRIPPED |
 			     RX_FLAG_MIC_STRIPPED |
 			     RX_FLAG_ICV_STRIPPED |
-			     RX_FLAG_PN_VALIDATED);
+			     RX_FLAG_PN_VALIDATED |
+			     RX_FLAG_8023);
 
 	if (err_bitmap & HAL_RX_MPDU_ERR_FCS)
 		rx_status->flag |= RX_FLAG_FAILED_FCS_CRC;
-- 
2.53.0


