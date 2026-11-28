Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3546606A33A
	for <ath12k@archiver.kernel.org>; Sat, 28 Nov 2026 17:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AzqCS45q;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Od++zzPQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z5Vrk1NamYvHsdPTKlCxcj9SSbrY8eS2EY9Q9H61SH0=; b=AzqCS45quLPMy4
	ePzcbEaz8Yb+VM2BEAm2c3KELE652JKuR+v4jLUfZOeGUtRbS0jieUZyEuLY8njhsdvXnuMdbxkyY
	xkwYGSxFf0ekWX9qS4Tr9XlmyUWSI3cIPfc6c+DXzIFRPLVL0IJNmdKsd9BIpUQj0Bel3ZZ7L9HSL
	YmdwVfeGWnG46fXWU6z1hdSIi7n1qA85E9EL/NwY4hUZ0e9zsHemAaQ1Dy5xcbu0/ym5prv/sZAPM
	z9oyT7pswG5e9K0wwQIT5sbC+NGXGYFjIAAFfKRAptobHKmMugLWywP1TbGZg5TG2BcqQLMBtlc9X
	xISW/loEGN58YwrGvufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXM85-0000000112C-1dCt;
	Sat, 28 Nov 2026 17:22:29 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXM81-000000010uL-22ys
	for ath12k@lists.infradead.org;
	Sat, 28 Nov 2026 17:22:28 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c4d21051042so531728966b.0
        for <ath12k@lists.infradead.org>; Sat, 28 Nov 2026 09:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795886543; x=1796491343; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5Vrk1NamYvHsdPTKlCxcj9SSbrY8eS2EY9Q9H61SH0=;
        b=Od++zzPQcG5+vE4fyKGP+LjHJ29oW8mzr9b93vmYw5xGZG8mCZPInxqx756rTJUT/5
         f/2kP7KtUaedqp0WlOVhObVsGdb7Uxo9+4E9yMrd5s24b08cqoGXldvJSvpQ2gchJTRu
         wJ0Pcm3MuLrSpL53vC8KN2iRZyTyAxUPSmgqQHwlI4L+vCr82oTN9z7HqB3xfnJU2VAM
         Gzm+Z57DxTM1s4lFazA+yTNYbxWHZdd0hos4N4EnQsMhNnuaU+79AQRHvEfH2rqdJOs1
         3yZBoTZkeG/BTcuir1f/m/y9FhIQQM8JBmvzEm8+7qJ4BhlsHZbnZwc5qeZFh2Xxfh/Z
         G84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886543; x=1796491343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5Vrk1NamYvHsdPTKlCxcj9SSbrY8eS2EY9Q9H61SH0=;
        b=kmykbefjjBPN7z77QDzHDysik0ubk3dvp17s1Dc6sfeVvb5UCOvhL6I8UMfH95zOV7
         JLc2V9KrtfzjupKln2SL5M2+Y4yj1mvGN1tXVuOZy8XipzF2Yg/4x3AmvkcPCCDhtUBh
         3YAOFVsyt6xadze2+OasVRKCfIYTifrvHZZtkxtFRQS76OVU2EqfPLEw3yugQm5NUWBX
         25WlQN1EQqaVq0fHOSSd3Stn/ko+gzfnW0DjTtB2yjlwkzP+RIiqsGAfsJ9c0OFuSd+A
         ahaOZEvwhVO1tW4ZlqZuaWnzFv43I8SXZI8ipTMX0Hi1IsRjqZz5Mp55D3jSxQtHo4rq
         jY8w==
X-Forwarded-Encrypted: i=1; AL+hErE+wYs8KCGcOMLwuZFVViEsrGCihcV5butNMdlZi/zIjydF3eoVdu/YEjVeAnCG60fqQm2YD+s=@lists.infradead.org
X-Gm-Message-State: APuU4Z+3agjEo4dwNQu2zmJYsMIMOWwQ60Q3dxNWN4Z8yyAbBHRzt0fm
	80UQbTOX6Ba5jgQJxEi3GlJPbnFnDmrNDkJwL6058WQveFbjJYlfXwEsqAqFjS2lWQ==
X-Gm-Gg: AZFdTZfYR6Jq1P0S2fVk6S6MWknZDbkxq+GL81FQvu1djGu547+68s+tZvs4OlDYIqA
	hI/m7AifNgwZWUbQvKEWULGn6sMUaClej50zO8xKJCB8zhF2wKM6m/H7Q9vGA1l6wOFuCeE5EPY
	VCY1hDY+z2pAr3eZtkk6cZpbZ7QbcU2HzCBdzd8ES8Fve7zhv6yhHuvX8hq8z0uQLYA1A8YRxgL
	3dHmqbkYWGgOVF2bo0elbxeQUJ8GgGG9XlEEh9pMl1jlc9fGxoMfkCEKLVfvkxh6yy7CLYwCnIX
	3WyxoOd9SGAItzusnsimFJcvXvAnYI8toMzkFyXgmpy9k+q0B1d7omieNqm3SDciYwKLhXjwrzM
	hMmhvypm7vOHnOgztW837RiVTzpoMKkejhLSExkfUWGIrYfpa8uHOr7+EN87FHkTOOlW1nRgBMH
	ciw9khi3eQI1y8PALsR8RDbSzOx8tN0LzSbRQUIgLcGWM8uYDh+S+YRM4L3KosRJCIyC3QA0v1W
	SlXbVwrPTqJ9i+W11GHOtbnzuXPq4K1a74WKCHFOCavnSN0BjEebZHA4xjkv/Yf/l+QVVJp3rUn
	V7ntRdbrrXN+yOyd7oBMf7VMpUeE5m6BG4ZzIdsO6TcQbeEI5BfBHEWmqiLQDSdl++rHfl7NRIE
	Rl3E7cglq4F0AGm4Jdk+bMC2GwsMUEpeno4oRYSp4KJp1G7FL1+jyK83Iklg/GpP1DDXE5xiVRh
	DY1mEglSFKQPJ3ZMzpP+ujDJ1LJd9YWUluSP7nlpjRW/e8XQZ4uVYxvLZCsSxgDKFKn6rdFftZu
	S3ZCA4SLWi++Lc7G28itSlF3P2RBSxI+VED+ledJDfMi8hLlVGWrWsEDtEPUXRddeolKepe75fq
	hK5Hu2LShoSyQQ==
X-Received: by 2002:a17:907:2d13:b0:c50:ca93:19a0 with SMTP id a640c23a62f3a-c513aab9bcemr2391973566b.40.1795886543561;
        Sat, 28 Nov 2026 09:22:23 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm981388866b.80.2026.11.28.09.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:22:23 -0800 (PST)
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
Subject: [PATCH ath-next v2 4/6] wifi: ath11k: clear the crypto flags of the receive status for each MSDU
Date: Sat, 28 Nov 2026 18:22:18 +0100
Message-ID: <20261128172220.922376-5-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128172220.922376-1-julius@bairaktaris.de>
References: <20261128172220.922376-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_092226_136109_76C59364 
X-CRM114-Status: GOOD (  12.64  )
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

Found by an LLM review (Claude) of the code.

Fixes: 2167fa606c0f ("ath11k: Add support for RX decapsulation offload")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2: discovery line reworded.

 drivers/net/wireless/ath/ath11k/dp_rx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 516856c531a9..9f6872f2c8e1 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2376,7 +2376,10 @@ static int ath11k_dp_rx_h_mpdu(struct ath11k *ar,
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


