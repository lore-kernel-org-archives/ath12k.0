Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0586CCA464
	for <ath12k@archiver.kernel.org>; Fri, 16 Oct 2026 12:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q5zj2v/4C3FbTFOf3UZNW27yR4URj0zj3Unt3ZSOPsY=; b=Wdy4lNgnJbp3rN3yNvPncE7SoV
	QilzwKxQIH2ZZ7m6zR+kYqYcPP7ThCksq8qgUZlwfoKB21o9Y58U8mXBGpzjO+nhcASviLtnkaMwt
	FZNNp4+SP2HQykiM/iL9TlzhmMXCznrIwZkFFCyvy1OvmwFtI4OqSIj6iIFsWAG4bPHLGYH+j2iED
	Nh37JGLNItwyfNaVDSD5tEHGW6ydyFnAP0OitILX/RUiPqIZ//WgMMt+YkPKZHDh6vUYfaa+DqA5c
	HXdUsJf/MHw0ReSvrwer7lO/DYphon6N6zRWLBLHAnN10+5PoZfp2ozjV8dFjWc3nmsiETdPawa8H
	k4ynW9eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhKO-00000002x3O-2C88;
	Fri, 16 Oct 2026 12:46:28 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhKM-00000002x2w-0jX6
	for ath12k@lists.infradead.org;
	Fri, 16 Oct 2026 12:46:27 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so2055970a91.2
        for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 05:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792154785; x=1792759585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q5zj2v/4C3FbTFOf3UZNW27yR4URj0zj3Unt3ZSOPsY=;
        b=qqkDwKXxf1YdFEh92TejPxtYEuDLfDiVPq/clHpO417tfJoiSTVnNIjUvgdEMC043G
         +bHX0i27Md60IDO7xRy/G+XZB/RqV+iaTlxVr2EDd21yRvT7y/ZtiU4yq4QVRvmi8Au9
         8MSOPTTwUK85ZvUsOV3PdHbC/Eowoiy7Qh8d+ohngymvL9iNT2/5rMgjRlXsB+RI839z
         FR9BKoyU/iQaEZEOUfpv+1H7Qv9xL94lht022M5SFpfbjBcMx3zw+w+a0U+2iVg5lrn3
         RmVbVlEa0g6mYOKyDbCIJtJDx3iOhvUHreunPG8KgqXk3fFxU6HSoEsd2yEmSikMF+OZ
         Aq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154785; x=1792759585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q5zj2v/4C3FbTFOf3UZNW27yR4URj0zj3Unt3ZSOPsY=;
        b=FepEq/8/tS67b3/bWsNulY8cjVdzfGK18AypgB1HY7mqh33Pu0fhwodUpOEDjoaddv
         uVpnjJiUYYFG0aWefmlPI+NsrYqDXFu/2Yz9nCKC3J2MTRp0Q6HxXwO83JzVIWvrC8A9
         jZTJc88Z3FEZdar7y0aRqW1c3EBaQExFLLHEirZzy89ow6h/o2T7NgWdcn2LFrEM6VYI
         6470dMY80NBk3T1J9nWRjDrdROORDZHEkp2YXXgyuyeApEor5R2Y+/Ko1AdqdXTB5n2I
         x0dBpzc7t5gDtCXR0bgN0zbdMZ6hdwmbChx9j1TjUnwDPbF3DywJYhNQ0dRFpfIiMEOo
         Ss8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzJT+TOp3rr9YuIs0yHAl4lEW3CLU19J8YO3aNeEJXPFETN5zuHSdZA9AwZMheRIjWak/kBxcs=@lists.infradead.org
X-Gm-Message-State: AFq9FYLI1hedj2gLniD5esDoMmbQ1HJLg6sAg5QzV1T11a32T06ydExn
	E9Q2PXJ7J3UwrfbfSz6FSGg3QnUmHoJEnEGCi2W4yJojs2ULGVbHaBIM
X-Gm-Gg: AYBFou0Po479OotXktuUjr79I1nqD9rCDM7xtrVryWBA3Nt/t2Ged9zNSFLDsEOBrxR
	Ys7xNdSU6109p9tNKIWtSUBnbf1sTVNXQxO/j7qfKu5jl0UT/HRnAyvqgIb0/c/pNieGhRZ7Bse
	kCLFxA7cRaCcQoHyb2Jerl/+t3S6o1Getcv6Ti9WSR1Wb56Ur2kCnG6K7S5R7IpMfiXOjVEdU1O
	OWgcGC2sCEWs5jZrnYASPrxJfFznlznJQxwkf85RSSKJvhrIr/ONxkzuzgGyY9y/9GhFYXwT6MS
	pu2pMMo13JnWmXSj6lGvBXtwISZcITY5qsondEXzYJClzF9kc5tXzRbvo0lbGnkzD26J9fN95q5
	V4riyCZMqNPbvRE1xnbCTvY+NhcRfUqnTlTDTPEBMy6oHwGJPhCG3wgOW2Axunu1aLCzZvscE+1
	SHBlZa+suZZLtu6P+35LunrLoW2c4Dy8EFOmrfVjQrfJmN80BudSAJiDqzBkLjGh1iCPwJIlTy8
	+bMbn5tMh7RUQ==
X-Received: by 2002:a17:90b:384d:b0:3ac:97bc:4c7b with SMTP id 98e67ed59e1d1-3ac97bc59f6mr5804257a91.14.1792154784685;
        Fri, 16 Oct 2026 05:46:24 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc4991b8asm4073508a91.16.2026.10.16.05.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:46:24 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: jjohnson@kernel.org
Cc: kvalo@kernel.org,
	baochen.qiang@oss.qualcomm.com,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath12k: replenish the RX buffers reaped without a complete MSDU
Date: Fri, 16 Oct 2026 21:46:20 +0900
Message-ID: <20261016124620.76-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_054626_236894_308CE198 
X-CRM114-Status: GOOD (  11.34  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

ath12k_wifi7_dp_rx_process() returns early when none of the buffers
reaped from the REO destination ring ends an MSDU, for example when
they are all error pushes or continuation buffers whose last part has
not arrived yet. The reaped descriptors are then neither posted back
to the refill ring nor freed, and their skbs leak, so the refill ring
loses those buffers for good.

Replenish the reaped buffers before checking for complete MSDUs, and
free the incomplete ones.

Found by code review while debugging RX stalls on WCN7860.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
WCN7860 runs here with out-of-tree enablement patches. This path did
not trigger in about 105 minutes of TCP soak runs on it, so the fix
comes from reading the code.

 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index a32c804403e8..abd262d58a97 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -801,9 +801,6 @@ int ath12k_wifi7_dp_rx_process(struct ath12k_dp *dp, int ring_id,
 
 	spin_unlock_bh(&srng->lock);
 
-	if (!total_msdu_reaped)
-		goto exit;
-
 	for (device_id = 0; device_id < ATH12K_MAX_DEVICES; device_id++) {
 		if (!num_buffs_reaped[device_id])
 			continue;
@@ -816,6 +813,11 @@ int ath12k_wifi7_dp_rx_process(struct ath12k_dp *dp, int ring_id,
 					    num_buffs_reaped[device_id]);
 	}
 
+	if (!total_msdu_reaped) {
+		__skb_queue_purge(&msdu_list);
+		goto exit;
+	}
+
 	ath12k_wifi7_dp_rx_process_received_packets(dp, napi, &msdu_list,
 						    ring_id);
 

