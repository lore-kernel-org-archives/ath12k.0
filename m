Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B851606A33B
	for <ath12k@archiver.kernel.org>; Tue, 10 Nov 2026 00:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u+RD7HT6;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tO5W6hv6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DN0p4HjtDRTBAnIlfbTGxKJKdhItG28gAVHDNaAhgTs=; b=u+RD7HT6YI+d0v
	b06pv56sWRz7Tjh1QHgUVE+jjEOBomSUOanrEEEgojDYzDc12tcoXvo4DgAaXccdNzz4KRDHa4jAh
	fnj9sFoCkGi5zRhgHmDrwFFuz7iBNMzFSx7TjbE/HVUVqJ+drYHDZW7b/ErH8jIwCkyGOWXYStJs9
	jzYRyubW2RTeqQQatjsnNxMxSxaMXE7XtB9QQARTnUgJq63urGFHlu/iugcizs3N98O8+acWAUvQF
	CkaHfjKGvYmrnKoi70KGwDbwx3pSEaMl5YNqFz5s+IidScRmEwUc54J68a0VRdKD/ij9mi0ohN4NU
	ujh0KlnkET01zMjWOoew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZcM-000000020U1-0HHp;
	Tue, 10 Nov 2026 00:21:42 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZcF-000000020Ra-1fKW
	for ath12k@lists.infradead.org;
	Tue, 10 Nov 2026 00:21:38 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so14353355e9.3
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 16:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794270093; x=1794874893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DN0p4HjtDRTBAnIlfbTGxKJKdhItG28gAVHDNaAhgTs=;
        b=tO5W6hv6uAcO9fpqaxk+UFt+sc43bnQQoTENPXm3D8lycEbPzDoRSQn/JiOEPcXBZh
         VyqGp8NI9FZLM3wt2gEeuPOUnwl/EtBUdarjEkXcEnVCudJsXDsc5RHmPqfWav4qbO0N
         g1AsRWLsOGtpTsaN43Xqr3PUoWvDr66dP7xGIJLt1+X3J9kuCSkVS18/cnGWrUOpv2wy
         8Tbo80DI4V2qngGYSpV9r97z+IxviomgIfHZLL0g6l9gmWTsuGzjQNcNR4gKjdeAeQx9
         uWQGKfspv+tZ/yUfWeuzAFa/PqLQt7/U8/39GkwExBu33Pq9oHHdqQhHTy9HZJPBVnWQ
         AzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794270093; x=1794874893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DN0p4HjtDRTBAnIlfbTGxKJKdhItG28gAVHDNaAhgTs=;
        b=gYNjBKJ4eTfvj/S3r8tL8UL8U5mex1+Iuaet4+tGdANUaA1UzgLw84/WvP+W3y5uUj
         wuhq5wDs/HZlinbbMl02ehrNGEsgBAOpTow8MEaUAO1xclYuwfQydvgJHYQBu1IUP3Ok
         gXvDlkacobZSE2sXfIyidN8lJAONH30frcUBcThYJnI9QcjhlCWTuM7UBuWh56T7/hOo
         1XxQJ8p8PhAAMjCbDNjUMrFQR/9u+le0qB/yfEsLlGmOHI4pYM5gxL58zi/VmZVGhs0y
         5cIv2NZm5L/ksQ7H3Kb1CbvPATfVCReotU0oJTzhLDFKwFFrRvD/LWJQA+JceyCUdou2
         hssQ==
X-Forwarded-Encrypted: i=1; AL+hErHnACYtI6Bm8p6+fmZZC6+2+0XPFsPyclxOEmB2MFDt8GzQ6zkGaJc8ioPeGaSlgYPA3+ZwwFc=@lists.infradead.org
X-Gm-Message-State: APuU4Z+xNVofdO2PcExmh1UvuIgmZeiRMxQrUNbYfKhx+fbm//G/BAez
	OMu99ztm5Tstn5UToFn0WPS7aubwPD4gRUNcA+FoQDWxdqvqSzICvPop
X-Gm-Gg: AYBFou16/VKDXAjGVFcB5ssOBh1f8TD99PKwMHSmOE0V5evZEKe/imtoJCFbjgAntmO
	P4NiOkv/S2CIiFyk80bb4w56rSScz/MMB8bM6Wu4YoGpW5ZCjN951fGEjlYlp0FMOrelocAUWdE
	Ws+W0iT+ItJ95Y0qFpxIvvyoat5ijjMfKiRuoQJxELpS6imZKej3z1PCIZ/DSN+DiBzoJ741xmY
	5JacWyWtgtDer9FZoWPzS/dqJxLJDzMS1PsR5Gmu8A1TovflpZ/Gs6e/qt6De/jMxKZRyN/7Saf
	I99/+5pvTxkk5zctoKCQFeucQDoj93v3y8ytgjJEuZ4/at461eDtcL1rpfaL2FTGNMRYMELjweZ
	9/4vJ2kWCQcQp8ePgkSyGAXNMsXetDJmzmaH16+i28tU/bWtx94L+7PLlP+ngJp2Kz+pNkFzeXW
	W+0EwupaprSbSDzqlovin2jcbtmbsuvtZv5YmT9YtkSWD2LhktCNPDp+k9vgLdehli8zaYkq0N5
	uiOIS0t7GsRqQqHJEt12tEFjuz3Fp+gG2eINmYc2VH4R2K9bEzr7PwskMqI0hoR1FzXFpdSWoK/
	7KOLZULzeXX2SZ5Ta88ViVI3DXgD1z1bSYzGchdgtaPa+I8/cczYAhDykXgiXma9sSEl0i2SRID
	4GP7Z0HRX++iiYhag+QKuwBfvhtPRI/j3yS/NFs0bvwRVWwgD4YU/jKcu3wRCm5/NlcFytzN6Yv
	vdRGgHIZsisxrqgovHlJW3WT8=
X-Received: by 2002:a05:600c:1d8c:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4ba02358712mr12177855e9.32.1794270093423;
        Mon, 09 Nov 2026 16:21:33 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (141-136-138-190.dsl.iskon.hr. [141.136.138.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea9eesm40106255e9.11.2026.11.09.16.21.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 16:21:33 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: [PATCH ath-next v3 2/2] wifi: ath12k: skip unknown direct buffer ring module IDs
Date: Tue, 10 Nov 2026 01:21:21 +0100
Message-ID: <20261110002121.90167-3-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110002121.90167-1-gsustek@gmail.com>
References: <20261110002121.90167-1-gsustek@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_162137_137524_9A34E96D 
X-CRM114-Status: GOOD (  18.96  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QCN9274 firmware WLAN.WBE.1.6-01243 advertises direct buffer rings for
module IDs 2 (CV upload) and 3 (Wi-Fi radar). ath12k_wmi_dma_ring_caps()
treats any ID at or above WMI_DIRECT_BUF_MAX as fatal:

  ath12k_wifi7_pci 0000:06:00.0: Invalid module id 2
  ath12k_wifi7_pci 0000:06:00.0: failed to parse tlv -22

It frees the capabilities stored so far and aborts the parse of the
service ready ext event; initialisation continues only because the
service ready ext2 event completes it.

An unknown ID is not an error: the firmware uses a ring only after the
host configures it, and the host does that only for a feature it
implements. Skip such entries with a warning, as for an unsupported
memory type in ath12k_qmi_alloc_target_mem_chunk(). Store the accepted
entries contiguously and set num_db_cap to the stored count, so that a
skipped entry cannot read as a zero-sized spectral ring.

Based on Nazar Mokrynskyi's version, with the separate count that Jeff
Johnson suggested in its review.

Link: https://lore.kernel.org/linux-wireless/20260505172415.566328-3-nazar@mokrynskyi.com/
Suggested-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Signed-off-by: Goran Sustek <gsustek@gmail.com>
---
v3: warning instead of a debug message for a skipped entry
v2: commit message and comment reworded

 drivers/net/wireless/ath/ath12k/wmi.c | 43 +++++++++++++++++----------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index f41138a7c68e..9720bed21631 100644
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
+		 * configures it, so skipping the entry is safe. Warn, as
+		 * for an unsupported memory type, so the gap is visible.
+		 */
+		if (module_id >= WMI_DIRECT_BUF_MAX) {
+			ath12k_warn(ab, "dma ring caps for module id %u not supported, skipping\n",
+				    module_id);
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


