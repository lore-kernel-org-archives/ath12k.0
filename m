Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC69CF65E2
	for <ath12k@archiver.kernel.org>; Mon, 26 Jan 2026 11:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SXjJjt/6dVBULRmQetw7Sw/hK8UIoQyy1iJNMtHwAMc=; b=jVPffq7m8JvsCdRMbe3XhIleas
	tX8hMVM1Cr8mDAzrWGY5CeDkpjWHbvNl3ALkwAOlo11ZnFkdBdxivCFYNlJ7z7H+FawfZraa2bN8f
	mB5IRmVvQNeXsysyyvYrls+YWJHy+BHUZjR7phtWyROUKSgj31h4PePp5mZaVq64TZJcxyobKEz+M
	62aOgr8Yr+uOHc01VLGgpAR6RQvoZNLH69TM4SEw2NlOyrxqBTjnG29pVBQRkRzEBBI9OsyBMOVjx
	X5BJA84x7ha6MRsSYig9ekd+CSPB+fhwlFSuzIaX68lk66sRKk2xfOd0TmUh8GAaxJnJzg/WRtlp6
	ImuDBWeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKsP-0000000CPxn-2Q0S;
	Mon, 26 Jan 2026 11:35:25 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKsM-0000000CPxQ-1eMQ
	for ath12k@lists.infradead.org;
	Mon, 26 Jan 2026 11:35:23 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-47ee07570deso33781595e9.1
        for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 03:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1769427320; x=1770032120; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXjJjt/6dVBULRmQetw7Sw/hK8UIoQyy1iJNMtHwAMc=;
        b=sMHAqTvu4zhS9zDkPiUvlVyRoQle9+VqrYepNKiN/dTiewbhGQz6joUzUUoZjSQo/h
         vfKDvtXgxEekGkNxAt7qMvbIO6c5Hn3FPqbahnqKZaEersd/5lSbVWt0VEZ+YNj8jS3R
         Fx2HqXaNmVryXyOdkeeHkOFR47bhmAb2yH7PAbZnxgL/yUm/J5AinkRt4WioKA70TwhQ
         +yNFC99dgklRUX1IhwPuiPtPK3AYtcLk3dmcG2Khq9bzcHf0W9i8TvHvMVZKWKpliR9V
         4rUVkmgk7ZLQyDVbMLimuxaBN1Rs4CZbm6EJLK82J805sXdVMKGmRgf+da+LZa+vaycX
         FDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769427320; x=1770032120;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SXjJjt/6dVBULRmQetw7Sw/hK8UIoQyy1iJNMtHwAMc=;
        b=E2VgEB5rc9/SyrHbk2lgVw75elhuy0AGzOOrmznpEaN94igwFGCqRQz+WSsJB25QyY
         3LNqBW8Qe0bD3CPwj48loE1pgD1SOgvpaz9/84wTUtto1CR/Edut+q69aXIZ1tTUUsCu
         RDGn8Qv3erQ2B4Uf9Z0khEBkMHe8PlzdSe3JnJp2qS4G5SXqlFiR9SVzPL1UuINArWiS
         mN6a3l6w98NO+bQlGr5TAITc8qugMRhJaTjcAh9ux6UU8G2v/NH1hC+poMLOv/gIuaiB
         uOmrtdU2gs/VfNFfp/T9QYrjCKekAO8VkfyobCmw/fNXibDX904+evyh8G87bbBNE8l9
         /GNg==
X-Gm-Message-State: AOJu0YyN33HtZgx/Nx8vwjnapGiGUfE1CkDNR2b6mmUiF7kALOwC/ABN
	dAy2Wn7e40RzBVgeRsfvPqrDR+d21W6mTWA0st6vaxOFHERM+uc5qkZckuPIl0x4/6zGNuvPNKD
	RFLpHacI=
X-Gm-Gg: AZuq6aLZKs4OXFHVn4p2qgl1F27fAlXisYMol4mgio+DNRkMlUwtoKhXXNE1chdmJFl
	K0gD1lE5yvn0t6XsBhlYy8LJIEtfUyA0Nyljj4E0+XvNuz81JSyAwmxztmeWm4ixTcxZU30JxB9
	2RyUr+d28aBiJPi19u9ZHNUFS/d2E+wNSZtPOuvvIjzC9cjo8NCk6JR+UWvrII4lWTTTyFMhKyf
	xW+4xXwyDTyfjjFNw90evZoESGMMvZkHT2zeVNoig/WyMGJ+dwRR7pPZWkhLE5E9YEY4gHLKpjX
	ALxEXeD5xKCxBk8DCEXtOETgi6uzv9crmc41/oOlv5WrRIXbMdsbe2OKTfK8jJw2HzxKA3/Ue8L
	W1M+L2yBiHDdZuo2hV+IZiZRsItW5OxS9IF42QUIQako+NgbDVh7tl69cmfdRg9PlsKUwQe8lmJ
	sl+lVQbOpgBESl33Ddm+fCOdp4t8r2vSZdO0FsGErtnQ==
X-Received: by 2002:a05:600c:3b8e:b0:47e:e807:a05a with SMTP id 5b1f17b1804b1-4805d064497mr76579485e9.33.1769427319654;
        Mon, 26 Jan 2026 03:35:19 -0800 (PST)
Received: from [192.168.108.101] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470472f1sm379056065e9.7.2026.01.26.03.35.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 03:35:19 -0800 (PST)
Message-ID: <2633095a-9555-45bf-b143-ad2bdaa1ab01@freebox.fr>
Date: Mon, 26 Jan 2026 12:35:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: ath12k@lists.infradead.org, Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
From: Pablo MARTIN-GOMEZ <pmartin-gomez@freebox.fr>
Subject: [PATCH ath-current] wifi: ath12k: fix wrong TID passed when stopping
 AMPDU session
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_033522_717721_34C79201 
X-CRM114-Status: GOOD (  11.43  )
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

When handling a DELBA request, ath12k_dp_rx_ampdu_stop() calls
ath12k_peer_rx_tid_reo_update() to tear down the BA session for the
specified TID. However, it currently passes peer->rx_tid instead of the
entry corresponding to params->tid.

Since peer->rx_tid is an array, this decays to a pointer to the first
element, effectively operating on TID 0 regardless of the TID in the
DELBA request. As a result, the BA session for TID 0 is stopped while
the intended TID remains active.

This leads to incorrect BA session state and may significantly reduce
RX throughput, as traffic that should use aggregation falls back to a
BA window size of 1 on TID 0.

Fix this by passing the correct TID entry:
   &peer->rx_tid[params->tid]

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Pablo Martin-Gomez <pmartin-gomez@freebox.fr>
---
  drivers/net/wireless/ath/ath12k/dp_rx.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c 
b/drivers/net/wireless/ath/ath12k/dp_rx.c
index d28d8ffec0f8..f2327c82953b 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1289,7 +1289,7 @@ int ath12k_dp_rx_ampdu_stop(struct ath12k *ar,
          return 0;
      }

-    ret = ath12k_peer_rx_tid_reo_update(ar, peer, peer->rx_tid, 1, 0, 
false);
+    ret = ath12k_peer_rx_tid_reo_update(ar, peer, 
&peer->rx_tid[params->tid], 1, 0, false);
      spin_unlock_bh(&ab->base_lock);
      if (ret) {
          ath12k_warn(ab, "failed to update reo for rx tid %d: %d\n",
-- 
2.43.0


