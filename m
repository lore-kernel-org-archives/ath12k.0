Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA68E606D81B
	for <ath12k@archiver.kernel.org>; Mon,  2 Nov 2026 20:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pylPWxgA;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vM9ZOfpF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sJefuJOTT+32ADCOSJyFHXhfGqO6ALajK8RP+bOVKgs=; b=pylPWxgAN6FjCS
	Z/G0y34/qvPcJwUADJ4amlIfT2/D0vXtQAVhSJcsNujTHaQV3Xz+I50+apxbrNyTBRYGcbu/ST+t2
	O5jkp7Fjml4cRNZqpMTS2kuzjLKWFghsRWtY6B62RlL1OYad/4K9FzrjqD0usx5RwadgSY1a9np68
	ibCHr/tn3yUEIe2tuf6cliIrdmpuGw2cayiEhZ3vkaw5YCI968IkQm6AALTSEROd0KVbg6Yj4KcZC
	p6VqsI/iwqfb4Kn8a72sXTV+NaR5TjIC/wTS7o37Ez4vLFkgc4UaI0hYig3zsNH0jiHONCejrykvs
	JCo7ULveWe0c5/erZqfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyFt-00000000GPs-0NrH;
	Mon, 02 Nov 2026 20:03:45 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyFq-00000000GOW-2qQj
	for ath12k@lists.infradead.org;
	Mon, 02 Nov 2026 20:03:44 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48c4649b35bso3273153f8f.3
        for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 12:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649821; x=1794254621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJefuJOTT+32ADCOSJyFHXhfGqO6ALajK8RP+bOVKgs=;
        b=vM9ZOfpFx+jEDZpQs9UEGG2N92Lg65bgFMvhi2sMF0zBPi5CnKJmwW3A4ONbyVsff3
         umFg1WffAzHNiITPiwECgKlW1gO1I39ZfIoA+7S8c8ZgQgIykcRBy1XB+Fx4nd6TlxpP
         RiXRotkmcQ3ebNptiS6ip4h0WCaI1Pmwn6gqY585CdsDoUgrJRdvYsh03pDEtEwh9Ssu
         FojIcLAbg29zsm+gDJhKHobQFv0/5tALUH964399jFJ8Rq0+zxrvXYD4MpAJ+L0/FBL+
         P25r22nyRd/jkoyyLGOwUI8K3a/Zc+qtJ6EZ1VgFrAFpchteGnwgEkB9nIUtOQBgOtrz
         Sf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649821; x=1794254621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJefuJOTT+32ADCOSJyFHXhfGqO6ALajK8RP+bOVKgs=;
        b=Ot6I4/fQv5kjp7JuELMm+UNVFpa2ojxSqLlwsPbWd9mbedeZWyieCHTmXwSf1Yp5Pj
         BscxuZtYcZj8c+6UWpzFEJz4q6fDOVhXK+XOIMUg0+OlCxpEzmGJuVZ6HuxcSaHrUWjC
         VGsb3pHe12QIq1yI6rAIo5MnriwoPaD9NW9Ql4svNFYEAzQe9mSlVSVDdUMAxm1zmVWm
         uhabXhU/YU/IzYA9hFBeE5oWtD9WSoTbwgFJj2ymEsPTKMFDjNkZB82nValEhzIOQUP9
         SQQZkcocw8rUQSgiSNIvs0XqeN6zpNSrt7Ds2sey4mjgBNU+9cE1SxipT3Bnsx9TsfeZ
         qibg==
X-Forwarded-Encrypted: i=1; AKwUvBwlCvgjtuuD6YC0dViigpBE7wfCbPCWU1FsGjxRVa+sh+IrAOVL6EzoYUv/gL9yZUKeBrgOVBs=@lists.infradead.org
X-Gm-Message-State: APuU4Z+xyYdVNnZUsfc978xonbGI6U3gI13niYJq7rbs71u8ckNbV4IX
	BjiopL5b+v4CDh0vISl22/yGNm7Am1eU3MaWvlFnhE+ZOXphz99pUEKg
X-Gm-Gg: AYBFou3u2hr0C+WhRU12AnNzdwU6iNuNT3NwNSlweE8YWs8mDNW+SLcARfHyiHMrLaN
	e65v3uOZiQjUcltROFwbVlP4nuAa9sRZUWg62JqYMtUiP8J7U7KH92IJYZvpl1d9dzvIQ3GNo6P
	PB/EtAF8N6SNdSebEmV4tZ7qs6PhGz+V9pokNh3Eui08q8TSPNvPFKn/tWlWIpKhxtFWpfbcvOJ
	AAC3dHjrE8ba3oss7mM3sOVTBZzpMh1izBFxZe/NNBCtIb4IomsBRuDH8DtR5zyDgofucBGlpHq
	5VIU25bRuJ/5cKJT59emgH/1UprIpLDDqjk6Zq1cYsmx2ad357jbNsVs5VBX5y/sJU/8DXsdXAl
	UVccBns6amR+5Wjnqxze85+b0Pp7tjUesvGxIn3MLZfFp6fvTrhCgunC6ePfVa3dW2N23WFmd4j
	/kHOiO7Z+kJhE3/PtKDX4wvPlZOjSCIiUqbkrHp9Roucu8v6MhTnLYg0dyHv0YT0yiT3aYj7uvd
	+AtSOqQlCotBJAqr8PWyTYwsdNG+1i7xemTiXC6ekbCk7HGoR3aYHVGt0xwkbYbtLdbH7DDGEie
	4ouBaEV2p/Bqf3K+uU8IH7+Fc+O8Kb+51lhtrDFgu0wJI8t7CAqGBkVgbL7rN5uj4xc3sR8QRg0
	fFvGi+tztXRmS4g3Es+6lYDhTx2VX/HSbCzw7RtGGtcb1KVjmV8fjlZkCnSTgYsysksEhTBof19
	jGjFG5/h8p99o=
X-Received: by 2002:a5d:5f56:0:b0:48e:60ed:b017 with SMTP id ffacd0b85a97d-48e6e302ab0mr23631665f8f.20.1793649820578;
        Mon, 02 Nov 2026 12:03:40 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (158-199.dsl.iskon.hr. [89.164.158.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm21191574f8f.47.2026.11.02.12.03.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 12:03:40 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: [PATCH ath-next v2 2/2] wifi: ath12k: skip unknown direct buffer ring module IDs
Date: Mon,  2 Nov 2026 21:02:35 +0100
Message-ID: <20261102200235.48973-3-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102200235.48973-1-gsustek@gmail.com>
References: <20261102200235.48973-1-gsustek@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_120342_760836_AAA9C875 
X-CRM114-Status: GOOD (  17.54  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QCN9274 firmware WLAN.WBE.1.6-01243 advertises direct buffer rings for
module IDs 2 (CV upload) and 3 (Wi-Fi radar), one entry per radio.
ath12k_wmi_dma_ring_caps() treats any ID at or above
WMI_DIRECT_BUF_MAX as fatal:

  ath12k_wifi7_pci 0000:06:00.0: Invalid module id 2
  ath12k_wifi7_pci 0000:06:00.0: failed to parse tlv -22

It frees the capabilities stored so far and aborts the parse of the
rest of the service ready ext event. Initialisation continues only
because the service ready ext2 event completes it.

An unknown ID is not an error. The firmware uses a direct buffer ring
only after the host configures it with WMI_PDEV_DMA_RING_CFG_REQ_CMDID,
and the host does that only for a feature it implements. Skip unknown
module IDs with a debug message instead.

Store the accepted entries contiguously and set num_db_cap to the
number actually stored. ath12k_wmi_alloc_dbring_caps() zero-fills the
array, so a skipped entry left in place would read as a spectral ring
with zero sizes. No code reads db_caps today, but a future spectral
user would.

This follows Nazar Mokrynskyi's earlier version, with the separate
count of stored entries that Jeff Johnson suggested in its review.

Link: https://lore.kernel.org/linux-wireless/20260505172415.566328-3-nazar@mokrynskyi.com/
Suggested-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Signed-off-by: Goran Sustek <gsustek@gmail.com>
---
v2: commit message reworded (firmware behaviour, credits); code
    comment corrected.

 drivers/net/wireless/ath/ath12k/wmi.c | 43 +++++++++++++++++----------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index f41138a7c68e..c5ff5b4d9141 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -4988,8 +4988,8 @@ static int ath12k_wmi_dma_ring_caps(struct ath12k_base *ab,
 	struct ath12k_wmi_dma_ring_caps_parse *dma_caps_parse = data;
 	struct ath12k_wmi_dma_ring_caps_params *dma_caps;
 	struct ath12k_dbring_cap *dir_buff_caps;
+	u32 i, n = 0, module_id;
 	int ret;
-	u32 i;
 
 	dma_caps_parse->n_dma_ring_caps = 0;
 	dma_caps = (struct ath12k_wmi_dma_ring_caps_params *)ptr;
@@ -5015,26 +5015,39 @@ static int ath12k_wmi_dma_ring_caps(struct ath12k_base *ab,
 
 	dir_buff_caps = ab->db_caps;
 	for (i = 0; i < dma_caps_parse->n_dma_ring_caps; i++) {
-		if (le32_to_cpu(dma_caps[i].module_id) >= WMI_DIRECT_BUF_MAX) {
-			ath12k_warn(ab, "Invalid module id %d\n",
-				    le32_to_cpu(dma_caps[i].module_id));
-			ret = -EINVAL;
-			goto free_dir_buff;
+		module_id = le32_to_cpu(dma_caps[i].module_id);
+
+		/* Firmware may advertise rings for modules this driver
+		 * does not implement. It uses a ring only after the host
+		 * configures it, so skipping the entry is safe.
+		 */
+		if (module_id >= WMI_DIRECT_BUF_MAX) {
+			ath12k_dbg(ab, ATH12K_DBG_WMI,
+				   "skipping dma ring caps of unknown module id %u\n",
+				   module_id);
+			continue;
 		}
 
-		dir_buff_caps[i].id = le32_to_cpu(dma_caps[i].module_id);
-		dir_buff_caps[i].pdev_id =
+		dir_buff_caps[n].id = module_id;
+		dir_buff_caps[n].pdev_id =
 			DP_HW2SW_MACID(le32_to_cpu(dma_caps[i].pdev_id));
-		dir_buff_caps[i].min_elem = le32_to_cpu(dma_caps[i].min_elem);
-		dir_buff_caps[i].min_buf_sz = le32_to_cpu(dma_caps[i].min_buf_sz);
-		dir_buff_caps[i].min_buf_align = le32_to_cpu(dma_caps[i].min_buf_align);
+		dir_buff_caps[n].min_elem = le32_to_cpu(dma_caps[i].min_elem);
+		dir_buff_caps[n].min_buf_sz = le32_to_cpu(dma_caps[i].min_buf_sz);
+		dir_buff_caps[n].min_buf_align = le32_to_cpu(dma_caps[i].min_buf_align);
+		n++;
 	}
 
-	return 0;
+	if (!n) {
+		ath12k_wmi_free_dbring_caps(ab);
+		return 0;
+	}
 
-free_dir_buff:
-	ath12k_wmi_free_dbring_caps(ab);
-	return ret;
+	/* count only the entries stored, so no zeroed entry looks like
+	 * a spectral ring
+	 */
+	ab->num_db_cap = n;
+
+	return 0;
 }
 
 static void
-- 
2.56.0


