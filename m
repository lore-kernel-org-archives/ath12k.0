Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABBB60A2601
	for <ath12k@archiver.kernel.org>; Tue, 10 Nov 2026 00:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OjgOG32f;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kXjCYL9d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mprZ/SxCZQp3vJ9FoySHalmt9PXMmx4H4EuLDGy6ZJc=; b=OjgOG32fPbbjQ7
	jnCStw6LhrlEv8h773vGDkbJWvWHJGWytawTFJomQeB4042rE2UvbUffNVLZGY1d2h3IaISwCKhM1
	kI02A9DKCKrBW2iDKBYuA1pOa71wnluQNXdGRDWcN01P5mHU+hyLBFHIGLN5Yz+O9+yQqmlma+EFy
	aAFM5ChW9w/59q3zjpqyX0SkdO5cfxUA/LkJrtdj1EKla2Q5FO4FGTIe/jZ/2gaS9XR+yhPIUHIYj
	X4foNknWQsMgJpEiOOa0mZ0XXvGDrMqr87hWx9TgBpJawi92tG0+86VIp4T0gcQSAJBYzNeLUFi63
	I0g8X7b7Vl0ZLIcFJj2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZcL-000000020TE-3kiY;
	Tue, 10 Nov 2026 00:21:41 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZcE-000000020RH-2MYq
	for ath12k@lists.infradead.org;
	Tue, 10 Nov 2026 00:21:37 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso9964165e9.1
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 16:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794270092; x=1794874892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mprZ/SxCZQp3vJ9FoySHalmt9PXMmx4H4EuLDGy6ZJc=;
        b=kXjCYL9d8t3XUkZQw6s7KFfQPRLibJPMLlkF2WasYJId+8iY8lNPEKXuNAOY6QOyIZ
         qZZpvdt8zWYkjH3N1waWL1id0VEEybFkHNS5o359xXpiYp1BS0p5Xbjlucqe4vDMb74b
         paxLIQ4eKnhW2FyGZj+pYs5wkm7A02x/GLotu1p4NCbEqx1qqijSc+1zGBq5xta5tpKe
         diQ/8BkLEckPyejumz21JTGMdwUe13YiDemi/jCDLlPSHIWeXoZ8DCuXInxMl7a+n9kW
         vxParZ3LMEccGoodeX/LknsyppgbqKOzsrz7dPPLWFC6t0gtm2gGQSOgwMCy65IzZqGd
         e4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794270093; x=1794874893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mprZ/SxCZQp3vJ9FoySHalmt9PXMmx4H4EuLDGy6ZJc=;
        b=IyG9wHRF/c2LRha78kjr6lpWxlxpPZivglBeth3Bd2XhfrK05QGxCe85MbBnOXC+X/
         vw5eg9qeD6qGzIZQfnvyfXOMldH0YCY8pbi5FFCxTt51yog9bSmqdeRk2e5zYhk8OqC/
         qLJtoaiqnCdsRTVEdr+fQ/yx80gKfW25/RBOVu7zpnAKoE8smjriBiYGbOK137QHlNpU
         C1OXmOffidP7flKlQurqItoQ9NGHttmUnJwuWhpPZYYFFO3LX2EnGNf+lpq6myV5D7c2
         t76tj4ioiQC+DSVA0wgnq+wO4+90PJzVVJavIlpXaJKkRmt+DY5CbUNiG3mu+Yf7xpx2
         VZAg==
X-Forwarded-Encrypted: i=1; AL+hErHICN3d3fXr6NMUXX4j9NYwHGA8F6aknBOnV6cn1hJi3MzXCezr1XVpLl32Q8k/2KL7ogEGhys=@lists.infradead.org
X-Gm-Message-State: APuU4Z/RqYZfZCePlMEGs4NYqVfWolY4U4r4dfN3NN/80vIyc8wEo+U8
	Hk/6LsJMm+GyuGgsi6xwlXO2w/85ClG5GuXDxb42RJjUmwMlSfm0VIwy
X-Gm-Gg: AYBFou3URYQ1NYE1YjpVeyN0Mlh2n5rCB0juzpny8El+t0/w5liSBCXghnbnVRZ8u93
	RgpjGxuTa7VjQgY3vG0Y0TwRgfFXxsopHyRN+b1NGXD37ImRgBr41ldtjS+vyL7VKZarA6dIE7h
	tPckP973SPi7ct+XJFFGqT/AqXorH6tt+t8VdXVRzLnb5YbBsoM9gUvIxuhreUt2exfl+ELPUBJ
	XrB88SxyPvwzaKLUzO2YO02wWgqiZ+4LJwLsgtBf/8oTZc996wMtoh8xAB38+dmtG7VQ6CaftUG
	Qk05HopLqqsKRAggsk+0Mih2bzkuZDZK4grMwyn608PbTtckPsAQQay8VPgbKrrofz5lJcyV8ia
	80TaF24KTk6UdJYgb7K6JW2Ks4IQ9P7uLjHZvtb2AJvqWxncmeGSujdcz6jU5cW8JVy5wz+Jmzz
	xE7ugl9MCGnTL5se6RxPt01sQX52xAJebxDt0ix7NmrbU3knCTwGntFL1EWEZUxG+jXAEk1aNCC
	HBb/3tTFk7TJjJeTZfijoGe6dz/AMZQDcRbNbvhRnuzocm3HS80vRKRsWKDpzmVxYK883mzEeiB
	S31kGSqyX4OWdndd/YRhDbL002XPyhTMi2RKpu6gTy7bgwaq601N4P0W+JtG6yIKsu39vm+4qBi
	C3ha4sNForD5XVLfOt30jlQHTGQOnhEoRCJ80B+ODNTKehA4dyHo8SO7I/Lp7vGTIx7QsczKznB
	Qpb4KubXvEKXhHs1Mc2gJCnBs=
X-Received: by 2002:a05:600c:6094:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4ba023456famr12261025e9.13.1794270092555;
        Mon, 09 Nov 2026 16:21:32 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (141-136-138-190.dsl.iskon.hr. [141.136.138.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea9eesm40106255e9.11.2026.11.09.16.21.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 16:21:31 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: [PATCH ath-next v3 1/2] wifi: ath12k: report size 0 for unsupported target memory types
Date: Tue, 10 Nov 2026 01:21:20 +0100
Message-ID: <20261110002121.90167-2-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110002121.90167-1-gsustek@gmail.com>
References: <20261110002121.90167-1-gsustek@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_162134_619383_8F91D33D 
X-CRM114-Status: GOOD (  11.13  )
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

For a target memory segment of an unsupported type,
ath12k_qmi_alloc_target_mem_chunk() warns, clears the DMA address in
chunk->paddr and keeps the requested size. The response then carries
address 0 with a non-zero size for that segment.

QCN9274 firmware WLAN.WBE.1.6-01243 requests such a segment at every
boot: type 0xa (QMI_WLFW_AFC_MEM_V01), 8 KiB for an Automated Frequency
Coordination response, which ath12k does not support:

  ath12k_wifi7_pci 0000:06:00.0: memory type 10 not supported

The firmware treats a non-zero size as a provided region and maps the
given address. Nothing visible follows with this firmware: memory ready,
firmware ready and all radios come up with or without this change. The
response is still wrong, since it claims a region the host did not
provide.

Clear the size as well, so that an unsupported type is answered with
address 0 and size 0, which the firmware treats as not provided. The
warning is unchanged.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Signed-off-by: Goran Sustek <gsustek@gmail.com>
---
v3: size cleared in the default case, no AFC case; warning kept;
    message reworded (Rameshkumar Sundaram)
v2: no allocation, size 0 (Rameshkumar Sundaram)

 drivers/net/wireless/ath/ath12k/qmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 52a925fc44ee..4aaee5870ae9 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2792,6 +2792,7 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
 				    chunk->type);
 			chunk->paddr = 0;
 			chunk->v.addr = NULL;
+			chunk->size = 0;
 			break;
 		}
 	}
-- 
2.56.0


