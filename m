Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E0860A260A
	for <ath12k@archiver.kernel.org>; Sat, 28 Nov 2026 16:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lRnA+usw;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=vOMwdNK3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=868a/UVmwsNaRJvxrCK8lfineTN1iwqIJ4228Iylmqk=; b=lRnA+uswUDNGqd
	4fa0AY+laSoY170ZwKtii8D7onwmIKCOncPzQnp/4lO6o63qmBknFswF18Zp5rWgj9zuzO+qqgYWk
	P8vFjIiPPTmWg1u+3CHt3LhOrsw5C1me90Et7kjrKCtCIg8jS4H7e35mvV46abbhQkbcG/K+W6Hjd
	ohP1nDBX084BmSvhKIjBVojAsFZ7YdAuFVPM8zjKKT1Sol0lRE0Nt5UCeNAy1Oa+3A64+qaih91h/
	7fRCqjrom92NIojQjhyjTLCQ+4J7WI0eUOJLPyXoDenSopBJSpD7HCKN40HHKH3H8UTaFV5cO7vxE
	MWkkCn+l7w6KGdeyzo+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKts-00000000wYR-3d25;
	Sat, 28 Nov 2026 16:03:44 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKtn-00000000wL1-2Oj8
	for ath12k@lists.infradead.org;
	Sat, 28 Nov 2026 16:03:41 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c51a02ad3acso663684966b.1
        for <ath12k@lists.infradead.org>; Sat, 28 Nov 2026 08:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795881818; x=1796486618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=868a/UVmwsNaRJvxrCK8lfineTN1iwqIJ4228Iylmqk=;
        b=vOMwdNK3RSKMbuvXiLGLh5ICBRRhN+qPZV5G2slfZiqiLwferJ2ykta9f7uhlHHwe2
         lOTrLVa8UryyUJJBUMtRaclzmBRwKRQfvrsY/5AZet5XxFk+q3Wd9lsjbsIB7x88bPFJ
         4FybTmuTdif1ZaoCVC9gpbZ0xxNySaP+iR/IMOct+wl2aZ9/oFR/cnzhqlaUVLs0TUxt
         l7wJtzqtrCxv1xqvPFrAxu9SnpkMSbyldqAhmWXa7mT4ICBGC1ccCA/Su6VscI5vfoNi
         XbdCH64gtnugfvuxIe4sYqaEWuBf/HGQ7oAkDUeo9fOXyfabbzHzl80uEQEUMF8wPy/S
         +7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881818; x=1796486618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=868a/UVmwsNaRJvxrCK8lfineTN1iwqIJ4228Iylmqk=;
        b=DGZRg5z63CVJ2v7SldWSL9HZDUD3lz2G0KhFnRPEzaOkZpBdF3S+PIKTiqf/aQ7bqi
         tjEunM4yNXTh2FjbKdfeZ/FifZkPIHKuDO6Hmy1n30aWTKN5Ln2UZXHEf19ag+pnqclW
         VXXk3EpSd0RARalyegahZKUbvzMwX2b5AAg7vb36WgWENX0BI6+n40VgtMR+xXw/NhLb
         CtNlIpcovHAxRWQ0seIvVNTV3ce74wN9xTFQWHwnRO1SGTZaljWZ/IOR+Ee0LU8HwZeu
         +j9ecb6y+sSZxh8PS6+5uAPlyo8KpONxizkeXIwUXSUN4DEBtCFIsiIYOAJ0LiNghzAv
         Bfmw==
X-Forwarded-Encrypted: i=1; AL+hErFxiOOnutZgk095EB/aXOwROE7Tj5FrXyYKf5zHpgq7mhTatP9a4bcjFpeiTeXaV1z1ltd+rew=@lists.infradead.org
X-Gm-Message-State: APuU4Z/pBkOkyEXBLr3Nl/R4EaGy5dVSRwNnyLp3+Q9EhIwomGpDdoGn
	2z5o25jfL87wAVQzpdJ4KL2IRcogg1EAa6OLtXDttjP7TKa77T/CP2iznUoMcM93vA==
X-Gm-Gg: AZFdTZenu3jGC3ZM2GB/Gh2g8soFnOakvgLu3eQaOnp5/6LFABStOqssSb3T588F7Du
	NO/qfRgjIdpzLX64k3YyDi3DwSoqK/uDtybZCku4uX6nsjKFJvnJwDiFlAcKgTMOEYjVAj2QM5r
	RyxMsJ0AS7658QiUIBvYo5IdQWV4Jm76rr8IFXaAntb8wGIQM20WRpx7HRfC2VvAmexkDZHDYL0
	gf8K+BbIJuC7UOd5PkwKUAJQmo9R/XlG1edaKB9XVZOn1CQMzmWdSX3Mu4bSwkCAbxX/X5XYQyV
	SbUP6l9Ut2Ai80A39cakqbPAuup8M0R44zuh48ttPK/ALDNboj2Rgd4CwW0pjuD17OqgTbDIEWu
	rWPeS/aycxmpuCeHSd3ucS0O9rHlmV5X/mksFeNWHt8MLzPfuLbewsE9/xAWAUScwrz8TRPnIiN
	rOE5DuiOFSnP0u1/JinNeAntE2t1WISx+tp2f4FlUJR9096r2V3mdtgfnE4d45qpB24mADmpdPX
	q8oXMpigOLdvLQ45gVxQGXsqTCiQil0xXEEPbEXH+CRI042Dm6zFrc13+yH4xBv7GMF3DxcEYQ4
	5ijjeWk/GrMu23Qis0mAFMU9kqdWkS0T/mN90KSibtEsCZv8fhyDNrImuC3ezs/DlpO9817f1TN
	yPorBPts/p4mp8nPQka7BWeLZtNj/ShQPjgut9HuKbakPHIz4AN/DcEQPW2VeEaMlw97p5x83Ay
	7gpwCTO86bR+D1nEz5266T7UWRvt9IsZ1uKMVDqBPKBFaQ3b+Yeehh2dYMM2R7RqmUHqJUBF8aF
	q5hGrNG7DXMP68q5yyah1VM+I1wlXGYH2PuRmMIW8b8bLiztOEAibzjpUgmgXKv+4m56NxvdVUA
	dHd1ztgiJBZ0yg==
X-Received: by 2002:a17:906:5d9:b0:c41:4964:90b6 with SMTP id a640c23a62f3a-c513aab025emr1766181066b.36.1795881817868;
        Sat, 28 Nov 2026 08:03:37 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm990389566b.84.2026.11.28.08.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:03:37 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 6/7] wifi: ath11k: pass the TID of a received 802.3 frame to mac80211
Date: Sat, 28 Nov 2026 17:03:34 +0100
Message-ID: <20261128160335.1815537-7-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128160335.1815537-1-julius@bairaktaris.de>
References: <20261128160335.1815537-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_080339_668408_BC47716C 
X-CRM114-Status: GOOD (  15.63  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath11k_dp_rx_deliver_msdu() delivers frames with Ethernet decap as
RX_FLAG_8023, and mac80211 counted all of them on TID 0. Pass the TID
the driver keeps in rxcb->tid. Copying the rx status into skb->cb
overwrites rxcb, so read it before that.

On the REO path rxcb->tid is the REO queue number, which is
HAL_DESC_REO_NON_QOS_TID for a frame without QoS control. The null
queue descriptor path takes it from the 4-bit TID field of MPDU_START;
set HAL_DESC_REO_NON_QOS_TID there as well when the MPDU has no QoS
control, so mac80211 counts such a frame as non-QoS on both paths.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- Read rxcb->tid before *rx_status = *status overwrites it. Found by
  the hosted Sashiko review of v1.
- Report a frame without QoS control on the null queue descriptor path
  as HAL_DESC_REO_NON_QOS_TID. Found by an LLM review (Claude).

 drivers/net/wireless/ath/ath11k/dp_rx.c | 14 +++++++++++++-
 drivers/net/wireless/ath/ath11k/hw.c    | 25 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h    |  1 +
 3 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a5..6d09b4c10b6d 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -70,6 +70,12 @@ static inline bool ath11k_dp_rx_h_mpdu_start_fc_valid(struct ath11k_base *ab,
 	return ab->hw_params.hw_ops->rx_desc_get_mpdu_fc_valid(desc);
 }
 
+static inline bool ath11k_dp_rx_h_mpdu_start_qos_ctrl_valid(struct ath11k_base *ab,
+							    struct hal_rx_desc *desc)
+{
+	return ab->hw_params.hw_ops->rx_desc_get_mpdu_qos_ctrl_valid(desc);
+}
+
 static inline bool ath11k_dp_rx_h_mpdu_start_more_frags(struct ath11k_base *ab,
 							struct sk_buff *skb)
 {
@@ -2446,6 +2452,7 @@ static void ath11k_dp_rx_deliver_msdu(struct ath11k *ar, struct napi_struct *nap
 	u8 decap = DP_RX_DECAP_TYPE_RAW;
 	bool is_mcbc = rxcb->is_mcbc;
 	bool is_eapol = rxcb->is_eapol;
+	u8 tid = rxcb->tid;
 
 	if (status->encoding == RX_ENC_HE &&
 	    !(status->flag & RX_FLAG_RADIOTAP_HE) &&
@@ -2493,6 +2500,7 @@ static void ath11k_dp_rx_deliver_msdu(struct ath11k *ar, struct napi_struct *nap
 
 	rx_status = IEEE80211_SKB_RXCB(msdu);
 	*rx_status = *status;
+	rx_status->tid = min_t(u8, tid, IEEE80211_NUM_TIDS);
 
 	/* TODO: trace rx packet */
 
@@ -4001,7 +4009,11 @@ static int ath11k_dp_rx_h_null_q_desc(struct ath11k *ar, struct sk_buff *msdu,
 
 	ath11k_dp_rx_h_mpdu(ar, msdu, desc, status);
 
-	rxcb->tid = ath11k_dp_rx_h_mpdu_start_tid(ar->ab, desc);
+	/* the REO queue number, as on the REO path */
+	if (ath11k_dp_rx_h_mpdu_start_qos_ctrl_valid(ar->ab, desc))
+		rxcb->tid = ath11k_dp_rx_h_mpdu_start_tid(ar->ab, desc);
+	else
+		rxcb->tid = HAL_DESC_REO_NON_QOS_TID;
 
 	/* Please note that caller will having the access to msdu and completing
 	 * rx with mac80211. Need not worry about cleaning up amsdu_list.
diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index 93f9a03c48dc..20d0cd9687bc 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -296,6 +296,12 @@ static bool ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid(struct hal_rx_desc *desc
 			   __le32_to_cpu(desc->u.ipq8074.mpdu_start.info1));
 }
 
+static bool ath11k_hw_ipq8074_rx_desc_get_mpdu_qos_ctrl_valid(struct hal_rx_desc *desc)
+{
+	return !!FIELD_GET(RX_MPDU_START_INFO1_MPDU_QOS_CTRL_VALID,
+			   __le32_to_cpu(desc->u.ipq8074.mpdu_start.info1));
+}
+
 static u16 ath11k_hw_ipq8074_rx_desc_get_mpdu_start_seq_no(struct hal_rx_desc *desc)
 {
 	return FIELD_GET(RX_MPDU_START_INFO1_MPDU_SEQ_NUM,
@@ -473,6 +479,12 @@ static bool ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid(struct hal_rx_desc *desc
 			   __le32_to_cpu(desc->u.qcn9074.mpdu_start.info11));
 }
 
+static bool ath11k_hw_qcn9074_rx_desc_get_mpdu_qos_ctrl_valid(struct hal_rx_desc *desc)
+{
+	return !!FIELD_GET(RX_MPDU_START_INFO11_MPDU_QOS_CTRL_VALID,
+			   __le32_to_cpu(desc->u.qcn9074.mpdu_start.info11));
+}
+
 static u16 ath11k_hw_qcn9074_rx_desc_get_mpdu_start_seq_no(struct hal_rx_desc *desc)
 {
 	return FIELD_GET(RX_MPDU_START_INFO11_MPDU_SEQ_NUM,
@@ -644,6 +656,12 @@ static bool ath11k_hw_wcn6855_rx_desc_get_mpdu_fc_valid(struct hal_rx_desc *desc
 			   __le32_to_cpu(desc->u.wcn6855.mpdu_start.info1));
 }
 
+static bool ath11k_hw_wcn6855_rx_desc_get_mpdu_qos_ctrl_valid(struct hal_rx_desc *desc)
+{
+	return !!FIELD_GET(RX_MPDU_START_INFO1_MPDU_QOS_CTRL_VALID,
+			   __le32_to_cpu(desc->u.wcn6855.mpdu_start.info1));
+}
+
 static u16 ath11k_hw_wcn6855_rx_desc_get_mpdu_start_seq_no(struct hal_rx_desc *desc)
 {
 	return FIELD_GET(RX_MPDU_START_INFO1_MPDU_SEQ_NUM,
@@ -917,6 +935,7 @@ const struct ath11k_hw_ops ipq8074_ops = {
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
+	.rx_desc_get_mpdu_qos_ctrl_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_qos_ctrl_valid,
 	.rx_desc_get_mpdu_start_seq_no = ath11k_hw_ipq8074_rx_desc_get_mpdu_start_seq_no,
 	.rx_desc_get_msdu_len = ath11k_hw_ipq8074_rx_desc_get_msdu_len,
 	.rx_desc_get_msdu_sgi = ath11k_hw_ipq8074_rx_desc_get_msdu_sgi,
@@ -957,6 +976,7 @@ const struct ath11k_hw_ops ipq6018_ops = {
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
+	.rx_desc_get_mpdu_qos_ctrl_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_qos_ctrl_valid,
 	.rx_desc_get_mpdu_start_seq_no = ath11k_hw_ipq8074_rx_desc_get_mpdu_start_seq_no,
 	.rx_desc_get_msdu_len = ath11k_hw_ipq8074_rx_desc_get_msdu_len,
 	.rx_desc_get_msdu_sgi = ath11k_hw_ipq8074_rx_desc_get_msdu_sgi,
@@ -997,6 +1017,7 @@ const struct ath11k_hw_ops qca6390_ops = {
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
+	.rx_desc_get_mpdu_qos_ctrl_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_qos_ctrl_valid,
 	.rx_desc_get_mpdu_start_seq_no = ath11k_hw_ipq8074_rx_desc_get_mpdu_start_seq_no,
 	.rx_desc_get_msdu_len = ath11k_hw_ipq8074_rx_desc_get_msdu_len,
 	.rx_desc_get_msdu_sgi = ath11k_hw_ipq8074_rx_desc_get_msdu_sgi,
@@ -1037,6 +1058,7 @@ const struct ath11k_hw_ops qcn9074_ops = {
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
+	.rx_desc_get_mpdu_qos_ctrl_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_qos_ctrl_valid,
 	.rx_desc_get_mpdu_start_seq_no = ath11k_hw_qcn9074_rx_desc_get_mpdu_start_seq_no,
 	.rx_desc_get_msdu_len = ath11k_hw_qcn9074_rx_desc_get_msdu_len,
 	.rx_desc_get_msdu_sgi = ath11k_hw_qcn9074_rx_desc_get_msdu_sgi,
@@ -1077,6 +1099,7 @@ const struct ath11k_hw_ops wcn6855_ops = {
 	.rx_desc_get_ldpc_support = ath11k_hw_wcn6855_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_wcn6855_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_wcn6855_rx_desc_get_mpdu_fc_valid,
+	.rx_desc_get_mpdu_qos_ctrl_valid = ath11k_hw_wcn6855_rx_desc_get_mpdu_qos_ctrl_valid,
 	.rx_desc_get_mpdu_start_seq_no = ath11k_hw_wcn6855_rx_desc_get_mpdu_start_seq_no,
 	.rx_desc_get_msdu_len = ath11k_hw_wcn6855_rx_desc_get_msdu_len,
 	.rx_desc_get_msdu_sgi = ath11k_hw_wcn6855_rx_desc_get_msdu_sgi,
@@ -1117,6 +1140,7 @@ const struct ath11k_hw_ops wcn6750_ops = {
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
+	.rx_desc_get_mpdu_qos_ctrl_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_qos_ctrl_valid,
 	.rx_desc_get_mpdu_start_seq_no = ath11k_hw_qcn9074_rx_desc_get_mpdu_start_seq_no,
 	.rx_desc_get_msdu_len = ath11k_hw_qcn9074_rx_desc_get_msdu_len,
 	.rx_desc_get_msdu_sgi = ath11k_hw_qcn9074_rx_desc_get_msdu_sgi,
@@ -1158,6 +1182,7 @@ const struct ath11k_hw_ops ipq5018_ops = {
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
+	.rx_desc_get_mpdu_qos_ctrl_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_qos_ctrl_valid,
 	.rx_desc_get_mpdu_start_seq_no = ath11k_hw_qcn9074_rx_desc_get_mpdu_start_seq_no,
 	.rx_desc_get_msdu_len = ath11k_hw_qcn9074_rx_desc_get_msdu_len,
 	.rx_desc_get_msdu_sgi = ath11k_hw_qcn9074_rx_desc_get_msdu_sgi,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 4996536fbd14..3bd99d347fba 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -252,6 +252,7 @@ struct ath11k_hw_ops {
 	bool (*rx_desc_get_ldpc_support)(struct hal_rx_desc *desc);
 	bool (*rx_desc_get_mpdu_seq_ctl_vld)(struct hal_rx_desc *desc);
 	bool (*rx_desc_get_mpdu_fc_valid)(struct hal_rx_desc *desc);
+	bool (*rx_desc_get_mpdu_qos_ctrl_valid)(struct hal_rx_desc *desc);
 	u16 (*rx_desc_get_mpdu_start_seq_no)(struct hal_rx_desc *desc);
 	u16 (*rx_desc_get_msdu_len)(struct hal_rx_desc *desc);
 	u8 (*rx_desc_get_msdu_sgi)(struct hal_rx_desc *desc);
-- 
2.53.0


