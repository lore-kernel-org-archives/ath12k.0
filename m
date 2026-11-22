Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D01606A320
	for <ath12k@archiver.kernel.org>; Sun, 22 Nov 2026 21:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eZ/iL9Yl;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=BLZGL2V0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZrC17kLP85VhrLnJZWnSDitIpYddK+4irtfGQwA3Jes=; b=eZ/iL9Yl1R5x6D
	4mfWpEsoMGuvi6cWhgA1km7cP4YZNRPvLVwzCNGKl2H/gZvXL8n0gsMbH2wQWxMyehmttOOLo1wM/
	G8QSoqDP6S84Ri8ZlaU4wpaF8UpxZ2QCDxtv/xibGgLySj/0s9g4KVoYdIap8FUIbZQ4IvFmMwF0H
	rIVysn1rhYuJOJBXS8WNWrinkTMiabVkktn3CbwPbIz8Kd+hBbMT2oBbg2O8WAMsXzOGm8+ssoOdV
	+Ap0Mppsnt0uX2wvcZanTRJWAN2OW+PnV7iWGm4Amu1mQhwihT/ya4NaWtr+l6WUyQS9+w/H2sbSJ
	esvvVGsFCb5uYVFcEE4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEkn-00000001l1H-09fa;
	Sun, 22 Nov 2026 21:05:41 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEkh-00000001kqV-26Gi
	for ath12k@lists.infradead.org;
	Sun, 22 Nov 2026 21:05:39 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c4d28f75d62so440923766b.0
        for <ath12k@lists.infradead.org>; Sun, 22 Nov 2026 13:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381533; x=1795986333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrC17kLP85VhrLnJZWnSDitIpYddK+4irtfGQwA3Jes=;
        b=BLZGL2V0VmqkhSgJyhn/D8yZhPJ55zX1XVGYJTnLKvgj8orhBvoCnKGPxIdl5l17+t
         YP2PPNXAqQOhmAZhGiqCIeGyubHs4eNqiIn5s3XI71q0fgx5HDGYoZ1cvQtPQWAq0tq1
         jHyFwM7uk+8jyRpbuJ3jl1i0N4NUufEph3+HQsMA1K1q8DUTg4TF/JiNmjV0FtpxepTS
         GtNL0/ghAeIJsVQMnSt87+Nb7PlJBQ0eoB6PiamEG8eX4LaoZDQZ4gmo9KgfvUECnmnt
         Iwts97Nv42j7m64vC1h8eXLJzOr8YKV3YGfQOGzPr4r9TJxg9ZxL6AFCUT8QQBOnZfJH
         scSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381533; x=1795986333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrC17kLP85VhrLnJZWnSDitIpYddK+4irtfGQwA3Jes=;
        b=IpZl3w5/Y2PhzOwPNi8q/SbM+rUdcSIkn1+pnWIHkQJZy1DqBfiUMJwVSbjPibWwLq
         m5lQ7dvDzHSoAvhUiA4Xa0wwB86tXt9rgV0KDMsINunvYI9NBCd5k1TemoAGqgLh6JhC
         FwUbDEF0XW+vXbLYMpcOtEDze6KGbUwvcMCgQapdtAsijohdxhkNmz7NlyKLdoozk1Hi
         3LPiEDpqdxUY1jcCtTDp/NVGUoCPagqDT4SWVV5i052b2d9OpcvtDeo2KSkXZsruKAjj
         NUzu7AGQwdjPb2IuB5fIPPiBeHlVIOdr8DlcholnZNOCCmoGYBMvonW3szpgqgLZkOUq
         tczA==
X-Forwarded-Encrypted: i=1; AL+hErEsXsQCKSVwS7ttlfFUexqNfW8CvF8h7weqCDeFihm+vz2xCaViru6aH18FbzqoIchddTUHfEQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z8mh8YSfAMVmovBk8HQCGalQ/sNwPhf6t1bdPAECoQ7PsqmEC68
	cpk4imChImeteykHdr3hPmf1xFioxo8gjEMnBR0OaZ1Z2IsmNDIXScxiE/OikY2ifw==
X-Gm-Gg: AZFdTZeRWxOo9pjrqbb9o2gAWZq+kB1C19pTAafv3wTojGbsEZZfHAr49DO+uTS/ApX
	DM5h2aPSEyfwgStAvtDqZhixo3tIT+m/oMDcj2/SO4iUKQY2590Loa+RY8E/UWrYsDRG5CeMLWz
	ih77SLXDXPrSgPsm01PcXC/k2xy0jASX+6IuPUnaNIexLGN+aLQK1FNqUbIUNCKlUWtIr1mdOzd
	dAn+C6tGNPc8+SaiRkB3fY/N9W0xQqgoWJ1N89Jaj5McCaNR2MVbGlsExOhf1q9Gy8lFwz0hWZB
	yYhYERPSaeKzh8YKcRYfFFwhoG4RLIwEmp4cEbGofJu41l5y34irjHzcSOd3VkISxYLH5m1Flx5
	AYHFrXmnlFOVpSSk3y/fOX7yz5eiYjR5oeNNlT5kn7aL6AU8/JKRuIqsQeo3NEVSAXtRi9a1NgQ
	AFrDwwqzugFbKWfcGFfPOn0MwYISqKVdz1fe2FmEtTdxeY9GipPIAJpaWKfCm7k3Qku6uPhzzPo
	ke8zDHmMss/BsmtfNPGAEOeP/4a3kzObt9JAM/IadLZUxAzgNRYniDKn1w/sVar/FORNKUhS8Cn
	w5MGNmVdSW1fUMlooEpkDtZVPKpwgvnJzpJDX2kW4Nq162gpsYDknos0Pr49xXysXK3hPaKmKVA
	OA8a882urL/nqr8PMF4IehOfJrNTiDdCENCSfBZWJlpXmgkHH14nw5fVL36p1DuoHOgPcOpZcsh
	7jbv3suSZPHdm1odvuWvfLjP5+9hSYxUBTkmYzUbLUGEZi7DMhTbEE11RQNOuMPhBX+cNG6N2Bc
	ltBGZQpm5nK6TI45058Myqx83nRBe+Qh2m1DOqNrtW3ZneENIkwOQihS+7pXPSyHpnQC9dlLnim
	vjQmt6EaOc4IX8+W1Rp4GxHNT3ZO2QpbQfTIAhv4LyKHv3gbFBGsqSUiBkJBm4IWUNN2j091gsg
	=
X-Received: by 2002:a17:907:6e89:b0:c51:59c8:a4ec with SMTP id a640c23a62f3a-c5159c8dc3bmr396957066b.1.1795381533567;
        Sun, 22 Nov 2026 13:05:33 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d300ad8e04c1718a6e78.dip0.t-ipconnect.de. [2003:f2:4713:d300:ad8e:4c1:718a:6e78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm339935766b.57.2026.11.22.13.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:05:33 -0800 (PST)
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
Subject: [PATCH ath-next 6/6] wifi: ath12k: clear RX_FLAG_8023 of the receive status for each MSDU
Date: Sun, 22 Nov 2026 22:05:25 +0100
Message-ID: <20261122210525.2076058-7-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122210525.2076058-1-julius@bairaktaris.de>
References: <20261122210525.2076058-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_130537_356560_B062F4B1 
X-CRM114-Status: GOOD (  10.55  )
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

Found by reading the code with an AI review tool.

Fixes: c4aa897fe234 ("wifi: ath12k: Handle DP_RX_DECAP_TYPE_8023 type in Rx path")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index fac60041d3ec..1d52eab418a1 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -414,7 +414,8 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
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


