Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FAFE77173
	for <ath12k@archiver.kernel.org>; Fri,  6 Dec 2024 12:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QrDABpUIa8XNiUd2yRie5JLoWvXscChzPwT5Xcajj3I=; b=SkOlWHI6KAXXSOr2RtSwznFiz9
	Mjx1wcurQ+FxDMADWOHYmYLekDyDqECA4KTCuSGXNPS/ABgqUE+O9dslIOiMt8FaCq39oXveeodLk
	km8OXbrPIAZxskkiMKHbDxeJYuXDNudbiZLqMKGCyv942P2qx9q+GHGZ9U8kPO/Eit8LMtEMqTSub
	jEbCib0t4B/71XsRBm913XIYpbQgbWJa9VilQ4Q15/EzN1yhxy3/Fou7nY40JM+h03FtpGk4q3jcI
	vHEeOHwcD8ILZE1CdLoXPF5BBjKSfm6NVsVCLLusogjLfymnWT3cBVCwGwdYt+L7mxgkVBH3svGiX
	As4ctiYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXoz-00000001d6n-2IgX
	for ath12k@archiver.kernel.org;
	Fri, 06 Dec 2024 12:52:37 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXox-00000001d5q-0zaS
	for ath12k@lists.infradead.org;
	Fri, 06 Dec 2024 12:52:36 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-385e87b25f0so1879862f8f.0
        for <ath12k@lists.infradead.org>; Fri, 06 Dec 2024 04:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733489553; x=1734094353; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QrDABpUIa8XNiUd2yRie5JLoWvXscChzPwT5Xcajj3I=;
        b=Jk+tvJ7cXNHn1fy/g8W+9vQ2oynfrg3DK6iBqhupmibg5oiHjxW/dnXcYq/Mljoe13
         Oatq8BsmvBKzumA3/yQFuTTP5Wf9QDtl6RRg/uiHM7k0CV54kfZf0q9dMpbuEDXkSSuw
         zvwvyXEnLW65FdJQZi/6B8RmHoU2wqsnAOiGmgjhSbFciBrbgwhl/2Rfq5GTtgx6BhDy
         6i1eUHBP39Ld/Dak60BZMSjTo4j28YcKogk/OHPrRtk6yOZnoj4KibjrTbA+Eijwgtfj
         4GmNUlTJ+ISJauBgZO5/Ctd+W962+P3TtQA6yJ+zlVbgn1bVuQ0ECX2vSBCj1pbPDJWV
         jh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733489553; x=1734094353;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QrDABpUIa8XNiUd2yRie5JLoWvXscChzPwT5Xcajj3I=;
        b=sZvqGEit/mFYGdJIGT3w4QFUBs2GpF0aGfVW0X7ON1xdtr1PxWzFv/kOKipqfilcfU
         FfYAQ8un/cBxc3ZbZqKkMAvFI+Ocr+W9TE0J89msDONuFKm++RLCdUXs2eTmWyA4DzHm
         FZyhxgNmIBhxjLqCubQLlshNd2fSwpV4c3LcGC2fguS76Xl2rkNJZAWzC0ZiIRr+dcXP
         60vUsMSP/g5MOfN0sBnTE1dCKYNaQzsdEME8gW7C3n1oOQABhOoo5bN1Q4KmzNVucu+P
         FMAiZlzrMbFY7I5VE80tMQWf/NH6f7R3pxXFqSZN3ruptVcc2GX0Kli6vJ1s2SADTsNY
         GkFA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ+1AzHpD+nKGvxJqPH3K9zehA3e+tgvzcAaadsigEhDqQFECObIthJ7M4Apel0b/B/YmBWys=@lists.infradead.org
X-Gm-Message-State: AOJu0YxA52sgN+b+jzQkFIxQc9E7Ztwah3Tcy3wp+0/cnNE51FIw/pDU
	NvRk8Lanqfxw4iukisVA40+Cka1DNZbLy5fevMEh/Rr3hwa+Ha/1xOnNgK109eQ8txcZANYbq6M
	s
X-Gm-Gg: ASbGncuF8nxbfF5xsv/ScMZ5w111JOyM5LJE2nYtUI4habHK1/NugnWhCdFKI+lLdyi
	+oPMG/ApPRp3PKiTWzNjT3cTuYKN1SVk0ImmSSN69jKsRKBZFMfDK1Drdn/sy2lkDHtmNAB1aRR
	VDKYuKuTN4mhUCMbruEJVi2pL+vwWKqiPxc0doC8BMEML+vDnjxF4obTnDUcbfEvfThlg9tiz8R
	8qAmtSV4fgTsIywXui5g4xFvD90CAOZACJcnZlVsxGwX/ECmo4XMdU=
X-Google-Smtp-Source: AGHT+IHm8JzdfN+FTAHMT8Z6wMEGsSN1pUfe5dL+iyuyKffu7U5Grq3ElPDgSbj9GKe3ItmO5v0RPw==
X-Received: by 2002:a5d:588a:0:b0:385:f9ed:1637 with SMTP id ffacd0b85a97d-3861bf98719mr4466825f8f.28.1733489553444;
        Fri, 06 Dec 2024 04:52:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da1134b9sm55104575e9.33.2024.12.06.04.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 04:52:32 -0800 (PST)
Date: Fri, 6 Dec 2024 15:52:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sriram R <quic_srirrama@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	Rameshkumar Sundaram <quic_ramess@quicinc.com>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] wifi: ath12k: Off by one in
 ath12k_wmi_process_csa_switch_count_event()
Message-ID: <755becb1-819b-484d-8fac-9a2db53ced1b@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_045235_326528_60159D9D 
X-CRM114-Status: GOOD (  10.51  )
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

The ahvif->vif->link_conf[] array has IEEE80211_MLD_MAX_NUM_LINKS elements
so this should be >= instead of > to avoid an out of bounds access.

Fixes: 3952657848c0 ("wifi: ath12k: Use mac80211 vif's link_conf instead of bss_conf")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 402ae477da61..46c5027e4f1c 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6873,7 +6873,7 @@ ath12k_wmi_process_csa_switch_count_event(struct ath12k_base *ab,
 		}
 		ahvif = arvif->ahvif;
 
-		if (arvif->link_id > IEEE80211_MLD_MAX_NUM_LINKS) {
+		if (arvif->link_id >= IEEE80211_MLD_MAX_NUM_LINKS) {
 			ath12k_warn(ab, "Invalid CSA switch count even link id: %d\n",
 				    arvif->link_id);
 			continue;
-- 
2.45.2


