Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B698E606A69C
	for <ath12k@archiver.kernel.org>; Sat, 28 Nov 2026 16:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vuSpS6Sx;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=cbC/L0zd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=l0KqIf20BL/9VhpTuh3BbPHRdDbiuv9sbaK8NTXw8wk=; b=vuSpS6SxPRDEtC
	JjeqysCdzLNiBT0z7nbbzvBIC293poTYKr+3yZNf/2uYa/jLo572Wy+hGwjUfuLAgaW0ZaxoceyZP
	Nq0mKdxnsbBJniHW2dR3on8N8mYsw0hj3rjz4otsFdQXdwLip+OwtQicPMJVZr80Ijomvh+YmajyV
	gSFfh3igVWhduVb/+Q6t3h7zaUdczbZwhAMcouFJ22Wa8DGMN2RSN1mQkkh/j5ASu7QOyAhs4hsnQ
	P6R0GXY278Bl+HKSmVJPQOfzZIAFZwiapoWrxaVX+a6/lzmu0muD9xeTjLzmEC4WIRWS40kQJ0Ec5
	8zefiThnsvCPZYo/oKLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKtt-00000000wZv-1ldB;
	Sat, 28 Nov 2026 16:03:45 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKto-00000000wM8-1dOl
	for ath12k@lists.infradead.org;
	Sat, 28 Nov 2026 16:03:42 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c506a231b88so1198078666b.3
        for <ath12k@lists.infradead.org>; Sat, 28 Nov 2026 08:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795881819; x=1796486619; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0KqIf20BL/9VhpTuh3BbPHRdDbiuv9sbaK8NTXw8wk=;
        b=cbC/L0zdiUP4gIJCifURAtjic1bGv1zW06+C3FX3EAdOS/x9bk1fDrrjQ8VqoawwQ6
         q2d+yjQS3MozF3eIiUiGdihSzU3U+RjmCdFYEmSZc2G35UqxvEMISfwKXofDbTdbToHB
         1zKyx9H/nH0/vWLajCzwkNq2sSaEYXzQiOyfqqd9p4vW7VW6xJIcGNjZzmo3n0oF7Xsv
         Xa4Mn92u+jyMgf/tLV4xNaRmb7SgXmdu4b1zCG5IgZoKw2/d3bhvRh3FE0x8XVkugzxZ
         +HXh7bpcCIbhJ6DqIak5Cs1IBU1af30/0i3KZuTOVEeC3SwdbXgsvRQkCcZxWPFngi6E
         LUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881819; x=1796486619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l0KqIf20BL/9VhpTuh3BbPHRdDbiuv9sbaK8NTXw8wk=;
        b=ueMG6GgRfx+OHvZy5y7RB9CERqi4AR8dBAPWV0+jp6mXwg9QzcN6ZDeSfvdZvTl0ji
         ghCes/9wq0ro41T/iHCbV5sEAPfUQ8QtP9kV/4VDTenRmC+/eYQwCZEMzO6EEYzwOA3y
         xWYAD8B1oqXP0vOEIYe66sjIPqmPccxnFJDRLkmPjZNPq0zbjy3p8d/tN1yvy9JKMEtA
         WD0db5ASiMTRA+lOaKFufXuKbWoGkOH3cRkCU/UOPYlg5dy3aeJvodLkr6NjbM/D+l7m
         jOuqg2qeCNv3CD1+0kpHqzUBuCUneSnLFdn7Qhn/WTcs3ks94FEoD7msDlybNtCo9XSJ
         BUYQ==
X-Forwarded-Encrypted: i=1; AL+hErHpuS9kP4mBqKP9WCYSJt/afQJV29whL73urDYEkWQ0/ZzJ2/PfY7dyLw//U9KbVERsC9wImqs=@lists.infradead.org
X-Gm-Message-State: APuU4Z/V9khwegbwPz+bNR6JE2OoN/XAn8pp3p7P66htcDVvMt61f+0/
	XNZ5XbCB5dEq0famdaBNIR5SUsQh2tmNzsghJhCcweGV/0b9kuVIWcJvuV2m9IiOJA==
X-Gm-Gg: AZFdTZdy1yB+AhOqPNxdp3Nz/OXrjAfK108t1LQT6/Pxwp3NQX8Di/ogPqEUjgpbFKk
	Dzxka72r+bmMGLTQRxIdHoOV6m3J7VoBMQlTETRO0OMM3m+FjBsheDfj7SanBkYrh5Estu2T5s0
	ZF1wWGJNTEWwJ0uKAYDHFukWnAcOKwqkj9pKcG5+bxgFO1heIjBgtluoWpZ7Zs27gOdexFeQ57d
	2depGVHML5IImys6eyk3o3QFxrRqLE5TmgVpTDF25//d+a+zyPpSYdtuFQExPmiXgvwztiHLUpP
	FO43shRmGgC61UJW6/AgTjIERS3C8bcnxPMmPcwckWCpo1532CBw3PW2mFCw1LpBdr4eVBpJcnT
	VXE4iPy8gLVE0ycHij+Y9IetVyXkImmu4fYShDRl0WjL8bThbgnfhZC3ZmxfUmQPiXOQW2J8KTB
	5UrGcR/EJw1J6gRqWVGp3EKd3LOaSGtRopMNgX6baM7SffipWmsAoGEDFw12Citjot2EEVCsqYB
	9gbvJaOoqG6pZLMQvXm+3bH1kLGYuKeGdIijAjeHanII8WaCoAnfBFAnERtFZQ8KPg6mYrCnvip
	8KWCMIXF0Xi1w9SLIY5VxDkV4fnUqLVk0Zp1ToSLUvcbVESol9OTLtAYfZey8wg1O49XXw3oAnL
	MiZYp2SMWcEGEUUn6EO3OWxQU8EeY+st7Y+Fb+iN+zYyu8lO1JOkQRh2x0xwPPVs8TQrfDuKQMH
	4C7vlGXiDOMQDAwfNNSxu6d6Wz3jO0LMu2X1MIsyyq/HnHzl+ndHNg+YChx9EzH9kgmk1e8hOYS
	GXVcE5adBscV/IWKggEv0LQHgg2wRXzsaud/wV2RGKtW6L+32i6tZLsOm8uttd/VDCXX23vpUUe
	i2XaPg2X5184mQ==
X-Received: by 2002:a17:907:fd15:b0:c40:33d:f06f with SMTP id a640c23a62f3a-c513aaad90bmr2317289066b.39.1795881818727;
        Sat, 28 Nov 2026 08:03:38 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm990389566b.84.2026.11.28.08.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:03:38 -0800 (PST)
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
Subject: [PATCH wireless-next v2 7/7] wifi: ath12k: pass the TID of a received 802.3 frame to mac80211
Date: Sat, 28 Nov 2026 17:03:35 +0100
Message-ID: <20261128160335.1815537-8-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128160335.1815537-1-julius@bairaktaris.de>
References: <20261128160335.1815537-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_080340_636007_D9D5E05D 
X-CRM114-Status: GOOD (  10.54  )
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

ath12k_dp_rx_deliver_msdu() delivers frames with Ethernet decap as
RX_FLAG_8023, and mac80211 counted all of them on TID 0. Pass the TID
from the rx descriptor data of the MSDU, or IEEE80211_NUM_TIDS when the
MPDU has no QoS control. The TID field has 4 bits, so add the QoS
control valid bit of MPDU_START to struct hal_rx_desc_data.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- Take the TID from rx_info instead of rxcb->tid, which
  *rx_status = *status overwrote before v1 read it. Found by the
  hosted Sashiko review of v1.
- Pass IEEE80211_NUM_TIDS for a frame without QoS control. Found by an
  LLM review (Claude).

 drivers/net/wireless/ath/ath12k/dp_rx.c             | 2 ++
 drivers/net/wireless/ath/ath12k/hal.h               | 1 +
 drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c | 8 ++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c | 9 +++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c | 9 +++++++++
 5 files changed, 29 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 52838ade1b1d..cfa539df09d2 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1409,6 +1409,8 @@ void ath12k_dp_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev, struct napi_struc
 
 	rx_status = IEEE80211_SKB_RXCB(msdu);
 	*rx_status = *status;
+	rx_status->tid = rx_info->qos_ctrl_valid ? rx_info->tid :
+						    IEEE80211_NUM_TIDS;
 
 	/* TODO: trace rx packet */
 
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 343e1636b4cc..0c61a08f4374 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -739,6 +739,7 @@ struct hal_rx_desc_data {
 	    is_mcbc:1,
 	    seq_ctl_valid:1,
 	    fc_valid:1,
+	    qos_ctrl_valid:1,
 	    is_to_ds:1,
 	    is_from_ds:1;
 	u16 msdu_len;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
index bad2b60409d9..3f0dfeedcb31 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
@@ -260,6 +260,12 @@ static bool ath12k_hal_rx_desc_get_mpdu_fc_valid_qcc2072(struct hal_rx_desc *des
 			       RX_MPDU_START_INFO4_MPDU_FCTRL_VALID);
 }
 
+static bool ath12k_hal_rx_desc_get_mpdu_qos_ctrl_valid_qcc2072(struct hal_rx_desc *desc)
+{
+	return !!le32_get_bits(desc->u.qcc2072.mpdu_start.info4,
+			       RX_MPDU_START_INFO4_MPDU_QOS_CTRL_VALID);
+}
+
 static u16 ath12k_hal_rx_desc_get_mpdu_start_seq_no_qcc2072(struct hal_rx_desc *desc)
 {
 	return le32_get_bits(desc->u.qcc2072.mpdu_start.info4,
@@ -403,6 +409,8 @@ static void ath12k_hal_extract_rx_desc_data_qcc2072(struct hal_rx_desc_data *rx_
 	rx_desc_data->seq_ctl_valid =
 				ath12k_hal_rx_desc_get_mpdu_seq_ctl_vld_qcc2072(rx_desc);
 	rx_desc_data->fc_valid = ath12k_hal_rx_desc_get_mpdu_fc_valid_qcc2072(rx_desc);
+	rx_desc_data->qos_ctrl_valid =
+		ath12k_hal_rx_desc_get_mpdu_qos_ctrl_valid_qcc2072(rx_desc);
 	rx_desc_data->seq_no = ath12k_hal_rx_desc_get_mpdu_start_seq_no_qcc2072(rx_desc);
 	rx_desc_data->msdu_len = ath12k_hal_rx_desc_get_msdu_len_qcc2072(ldesc);
 	rx_desc_data->sgi = ath12k_hal_rx_desc_get_msdu_sgi_qcc2072(ldesc);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
index 0f85ae69b5e0..060e5ea1f7fd 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
@@ -722,6 +722,13 @@ bool ath12k_hal_rx_desc_get_mpdu_fc_valid_qcn9274(struct hal_rx_desc *desc)
 			       RX_MPDU_START_INFO4_MPDU_FCTRL_VALID);
 }
 
+static inline
+bool ath12k_hal_rx_desc_get_mpdu_qos_ctrl_valid_qcn9274(struct hal_rx_desc *desc)
+{
+	return !!le32_get_bits(desc->u.qcn9274_compact.mpdu_start.info4,
+			       RX_MPDU_START_INFO4_MPDU_QOS_CTRL_VALID);
+}
+
 static inline
 u16 ath12k_hal_rx_desc_get_mpdu_start_seq_no_qcn9274(struct hal_rx_desc *desc)
 {
@@ -1024,6 +1031,8 @@ void ath12k_hal_extract_rx_desc_data_qcn9274(struct hal_rx_desc_data *rx_desc_da
 	rx_desc_data->seq_ctl_valid =
 		ath12k_hal_rx_desc_get_mpdu_seq_ctl_vld_qcn9274(rx_desc);
 	rx_desc_data->fc_valid = ath12k_hal_rx_desc_get_mpdu_fc_valid_qcn9274(rx_desc);
+	rx_desc_data->qos_ctrl_valid =
+		ath12k_hal_rx_desc_get_mpdu_qos_ctrl_valid_qcn9274(rx_desc);
 	rx_desc_data->is_from_ds = ath12k_wifi7_hal_rx_h_from_ds_qcn9274(ldesc);
 	rx_desc_data->is_to_ds = ath12k_wifi7_hal_rx_h_to_ds_qcn9274(ldesc);
 	rx_desc_data->seq_no = ath12k_hal_rx_desc_get_mpdu_start_seq_no_qcn9274(rx_desc);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
index 2d66d71d1b9b..3751bf8589ba 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
@@ -340,6 +340,13 @@ bool ath12k_hal_rx_desc_get_mpdu_fc_valid_wcn7850(struct hal_rx_desc *desc)
 			       RX_MPDU_START_INFO4_MPDU_FCTRL_VALID);
 }
 
+static inline
+bool ath12k_hal_rx_desc_get_mpdu_qos_ctrl_valid_wcn7850(struct hal_rx_desc *desc)
+{
+	return !!le32_get_bits(desc->u.wcn7850.mpdu_start.info4,
+			       RX_MPDU_START_INFO4_MPDU_QOS_CTRL_VALID);
+}
+
 static inline
 u16 ath12k_hal_rx_desc_get_mpdu_start_seq_no_wcn7850(struct hal_rx_desc *desc)
 {
@@ -620,6 +627,8 @@ void ath12k_hal_extract_rx_desc_data_wcn7850(struct hal_rx_desc_data *rx_desc_da
 	rx_desc_data->seq_ctl_valid =
 		ath12k_hal_rx_desc_get_mpdu_seq_ctl_vld_wcn7850(rx_desc);
 	rx_desc_data->fc_valid = ath12k_hal_rx_desc_get_mpdu_fc_valid_wcn7850(rx_desc);
+	rx_desc_data->qos_ctrl_valid =
+		ath12k_hal_rx_desc_get_mpdu_qos_ctrl_valid_wcn7850(rx_desc);
 	rx_desc_data->seq_no = ath12k_hal_rx_desc_get_mpdu_start_seq_no_wcn7850(rx_desc);
 	rx_desc_data->msdu_len = ath12k_hal_rx_desc_get_msdu_len_wcn7850(ldesc);
 	rx_desc_data->sgi = ath12k_hal_rx_desc_get_msdu_sgi_wcn7850(ldesc);
-- 
2.53.0


