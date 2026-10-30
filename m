Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4EA606A32F
	for <ath12k@archiver.kernel.org>; Fri, 30 Oct 2026 22:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qaOJCk6n;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wQS/UYoj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Pye18a12Mt0GkSw7sJj+cBOXoMwNJjFwpHtVV9nHTBQ=; b=qaOJCk6nec26Kf
	L2HGWkUlIM28sHFzvyPnP2mCCpQ9NDbRXWx0AxlIzeA+xteXmcJw1TfcOfqBppScDeVA80APvsxlZ
	F1jlMj/EwcfEp4TzzERU0wcuTpdTE3rthwCGVBBllooAE+9xXKrYBciwirRsKxi/SaVfxfMiEnfL9
	OwmfRbhx+dmLV1TH6JD8LkxW4f7432tuEyesRtFCqEBk50vOWoGNkzIN+82b81Kpm/52yHLXY1At4
	Yhnlk7029I7kQOUiirZ2GY/KUEV6IW6ckCNMRn/dO5RhlZxFVvNUd8b0Cr4RGvcgTs9kJNl4lZICq
	llEDKcjz07yUypNgycnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMumC-0000000Cf5I-30Mu;
	Fri, 30 Oct 2026 22:08:44 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMumB-0000000Cf3U-0Qbf
	for ath12k@lists.infradead.org;
	Fri, 30 Oct 2026 22:08:44 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a210470b49so9575005e9.2
        for <ath12k@lists.infradead.org>; Fri, 30 Oct 2026 15:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793398121; x=1794002921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pye18a12Mt0GkSw7sJj+cBOXoMwNJjFwpHtVV9nHTBQ=;
        b=wQS/UYojXDzgA/qF54SoF7vS1EBYI2JL2dCAuPh+tUi4hoFM0pS6o/F2qK7JGhUWqh
         c2wmrU4OY6syg0Ckzs2M3E8zUL5KNgmNTK396zj9U48c3KnCNVgdbeFTHX8/nGKjHtJU
         fQEY4zhPcFKZxaq5fbp+HVzCnKGCOeiHkMtIp/Q+KOySnHCRqr9/CXXtlPkuK7LYutPN
         cjLCC+oJ6AgHOS6/cRxJ3t1147KBKpcajDRGkv/IB/rDOqBoJainhLhz7FGb+jyBCFfz
         IYzKcaz2yb6EUbMhuBPZPki11gvZ7VdMOvXtw6/s7TIqCLTU3qrRIlob54WlWZhW/xlL
         STCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793398121; x=1794002921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pye18a12Mt0GkSw7sJj+cBOXoMwNJjFwpHtVV9nHTBQ=;
        b=YYViY9cWSBW/mjR5T+mh8k2G5WaryLSUHjR/iK1DjE210EJpnxLtrFAStNm3G7Sx9c
         +LarCBcvlbrRez9JCHf718aIi3zz6yYgkHZ3N0H30nbSvF7fbcjTcjGEGINeKcxB5ux9
         7q9idi+MN3QToZV/QPZaVsk+BfH396ZjkmXBHZ3Qr4FVYTQKZKpQ5zlHeyDFyJADRDZh
         8NfpUmqaDMRzQVyiIWJIKrUXw64C5xQZOioNWxAk3sRWbVdHuuHM//lb9TmT+6TAIDh8
         1lHDf5nXP7VendSsk/ZRbk8cKrWlI+MCC55fDxx8C9c6HoFW4nhqwF/R+2l8LOt/x7lm
         7z3w==
X-Forwarded-Encrypted: i=1; AKwUvBxGLKl48gh7gHbJSfkIFhqx+j8MCJxW+0K7GOQVXrTCuLV8Vs8MM7N69abH5JAs7dXmCKn9p+U=@lists.infradead.org
X-Gm-Message-State: AFq9FYIlH6zi6Z6mxIbdBAfqnxl5GhS0l2Kdrp2//gx6renbzS1NMyDc
	EmvVa5RuDvHw/1zvPUC6ko00qHu8qvsz5T7kKzHKc76QuK1Dnq34XV22
X-Gm-Gg: AYBFou1LvOI206Ag0smBuzZbBq5qMitVPJO1aL6lUSD+SrmNu7GJ2aEXVin0taD+yn+
	FDsURGzOlDOQrzBH1aolBTuSHPA5GfHXjeSN/mrf7v1BXsGFbZfK4uOHP14la+Hbc1CmBkY7aOo
	R9dQBZURCMl8WCbzYmwNKw3rZAGF29wLT+wJXFxu5o46BK2LGulhoNfai2mhpkhcNg55Nk5NUEA
	xuGmFdZALc3TT9ty9uwmKtgPQB7McPQTGCPQ2EYjOT/k0/O9QFlxe48UrtEfBysdZJhYbNnNbFW
	0DvhvrPye6iS7yoaGl/UbKiTd0m/NqDRibHMfnn0cTwgssk19CZDqRieGkbixBuZ23vWJ+9H2Bx
	fV3ChLD5ltMRK3YvP6BonPSQm6FZAcys94CjcvnhKg7o+iDseOELc/CZNZ/YeieQ307IQYnpD33
	j6I0imkBzcEG7ow9edOwNV7d7urseMWCByMz5PA6U9f0UXblsihRA+VuNDbjo2VkF/+OBLJ2ye1
	fyc1nboPGBtMS4OSvSLt1r+/Qrg9OglvQMoohY5/5HvT1d1aJVFTiYw2R1tm5/0RS0mFST/Fnv9
	6nf+jw9LXcG/RYncLwg1uOrTkxU7BAlG20sxf9UF9jId7peGLpkH0bpk8itPuj4qyRiPti8wOhj
	X4vRkeCuN6BjpRoTpDgbMzJS2b3Pc8DIqWhPaOSomK5skaahMZlvK/qvPUA==
X-Received: by 2002:a05:600c:3b1a:b0:4a8:b8b4:6226 with SMTP id 5b1f17b1804b1-4ac18c73d17mr79226395e9.28.1793398120539;
        Fri, 30 Oct 2026 15:08:40 -0700 (PDT)
Received: from u1804.home.lan (152-43.dsl.iskon.hr. [89.164.152.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm56230305e9.0.2026.10.30.15.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:08:40 -0700 (PDT)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next 2/3] wifi: ath12k: skip unknown direct buffer ring module IDs
Date: Fri, 30 Oct 2026 23:08:23 +0100
Message-ID: <20261030220824.915760-3-gsustek@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030220824.915760-1-gsustek@gmail.com>
References: <20261030220824.915760-1-gsustek@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_150843_179554_F1358FEB 
X-CRM114-Status: GOOD (  15.85  )
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

Newer firmware may advertise direct buffer rings for modules the
driver does not know. QCN9274 firmware WLAN.WBE.1.6-01243 lists
module 2, and ath12k_wmi_dma_ring_caps() treats it as fatal:

  ath12k_wifi7_pci 0000:06:00.0: Invalid module id 2
  ath12k_wifi7_pci 0000:06:00.0: failed to parse tlv -22

It frees the capabilities stored so far and aborts the parse of the
rest of the service ready ext event. Initialisation continues only
because the service ready ext2 event completes it.

Skip unknown module IDs with a debug message instead; the driver only
sets up rings for the modules it implements. Store the accepted
entries contiguously and set num_db_cap to the number actually stored:
ath12k_wmi_alloc_dbring_caps() zero-fills the array, so a hole left at
the index of a skipped entry would read as a spectral ring with zero
sizes.

Tested as part of the series.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Signed-off-by: Goran Sustek <gsustek@gmail.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c |   43 +++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index d5160af60e00..4d4f8e9caf07 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -4938,8 +4938,8 @@ static int ath12k_wmi_dma_ring_caps(struct ath12k_base *ab,
 	struct ath12k_wmi_dma_ring_caps_parse *dma_caps_parse = data;
 	struct ath12k_wmi_dma_ring_caps_params *dma_caps;
 	struct ath12k_dbring_cap *dir_buff_caps;
+	u32 i, n = 0, module_id;
 	int ret;
-	u32 i;
 
 	dma_caps_parse->n_dma_ring_caps = 0;
 	dma_caps = (struct ath12k_wmi_dma_ring_caps_params *)ptr;
@@ -4965,26 +4965,39 @@ static int ath12k_wmi_dma_ring_caps(struct ath12k_base *ab,
 
 	dir_buff_caps = ab->db_caps;
 	for (i = 0; i < dma_caps_parse->n_dma_ring_caps; i++) {
-		if (le32_to_cpu(dma_caps[i].module_id) >= WMI_DIRECT_BUF_MAX) {
-			ath12k_warn(ab, "Invalid module id %d\n",
-				    le32_to_cpu(dma_caps[i].module_id));
-			ret = -EINVAL;
-			goto free_dir_buff;
+		module_id = le32_to_cpu(dma_caps[i].module_id);
+
+		/* Newer firmware may advertise rings for modules this driver
+		 * does not know yet. Skip them; the driver only sets up rings
+		 * for the modules it implements.
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
2.47.0

