Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B6DCCF9E0
	for <ath12k@archiver.kernel.org>; Tue, 28 Oct 2025 17:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iBmB4qbptLfyTLiupE29rEaJ57aI2ZRJhbVvsp8ICt4=; b=eAYYOu7siI1+zktAPBWnvTKJwf
	7l94273Rs8mGHrknk4VahdHLuYQE54dHeqpX0epp9Ug55RqG9iQySErYHENutff/4bpy9+PQATtPu
	5NTfoFEBrYcjKIvOtL+hPB9G+Do0LHssqRUCzk3MmQTSUVS+bGhmv8vUuuMhBAMfjR7n5+Ej5ATrF
	sdPo4Na8nobbKAUg28fBHrjHjBb0EFuV8qUck/LUfjgz9NCIKjwzunc6KLoWQtjAR+h+ZMRHJCRTf
	7zaR+PXHdcGM56Drpt98zeP6CX3Hh0wnv8b6bAlZsOLRpEMFROJWV6Pxn1wBFy2I8xWXDhSnhiz1u
	WSEVT2Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDn8N-0000000GNGp-1IAN;
	Tue, 28 Oct 2025 17:05:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDn8M-0000000GNGN-2pcz
	for ath12k@bombadil.infradead.org;
	Tue, 28 Oct 2025 17:05:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=iBmB4qbptLfyTLiupE29rEaJ57aI2ZRJhbVvsp8ICt4=; b=o831IzE7EJx+Ka/yJBLXk2B9mj
	6ENhAlI/iZChjpSvMPykK7bgxyu4M1SJWi5Cg51DiqocWCN+swrpCQXwtQrVjnlPF1atVt3bn8sOe
	N/NefACSSe7X2GInPhMmuIB7e3g01ZQXPEFhG87wiGgBD48V+XejWq02x79KaHLTEgTv6p4TfxoRT
	l6c50RsfJ9AP7ZreijNUqG4PRe1swauB0Oc7/XQiBQzTaZHh+1DtO1VOYGs0Bwuq6x0kINTrp6sqk
	b3+vs0XJb0GOpZirx3Kg0lUz2yOGnxtyx29BG2Sh7B7EdmEg/BvZTzsOlnvu17WEHFMnSFAsm1e63
	j3FNjsmA==;
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmGZ-00000004sdl-3UJs
	for ath12k@lists.infradead.org;
	Tue, 28 Oct 2025 16:09:49 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7a435a3fc57so2462467b3a.1
        for <ath12k@lists.infradead.org>; Tue, 28 Oct 2025 10:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20230601.gappssmtp.com; s=20230601; t=1761671117; x=1762275917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iBmB4qbptLfyTLiupE29rEaJ57aI2ZRJhbVvsp8ICt4=;
        b=J/Wwx8ZpXmvERyScav4Uu/gnC3SPAdeG8oNfSsmkMRpCPLwO66dDjTs3IVusJ/d87y
         UJhp5iCLAarUZRnY+OQopWPhj5t2SFe//KM7daIXo9K15KvO0Jd1X6od98VIHTAHvf7p
         XMGHV96Zbf1QB1dWSp9fAw25sufxdgaIRts85cw21wKOWcb54Xm4864WPGs7ocPBOxgP
         uSO4+ygLqu72iBJi/yujmHoUcKPEnSQZsrBSPH5Elu9aLLWN1bfKLCsoTHMjgZ60+WvA
         Ty9HlGYuQBYlDwV1IWWRJDNpdYAO10cqZIunsAZjOfbrdZjLfWmf5P1qMf1TrzW8WTEL
         U6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761671117; x=1762275917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iBmB4qbptLfyTLiupE29rEaJ57aI2ZRJhbVvsp8ICt4=;
        b=bx42xcPO++QAvqXRHak7xcPQqPyDt+OVtoqproMB+t0QAiHXqP6GIMClSKQDzhLKjl
         DSVRlJbTrNOr2VjIzLqZulMz/w0H1XuuHCKTcl6Ij62k43T2LL8rgE3fym0oI0713aAc
         zfIJU6hUFoUeCRDZNB/ssaGYXPMLNdKg1ToJD8H30OrxYeI9WAI0yguO2fqJSBRbnuKJ
         WIB3NhfZ08hxy5M2cn/9Kwa+zjdVcmkgczDCEp5olcYBcjVnAAQkmPRxj17LQaQpWiI7
         bK2qrjdca88nWUfjRLgrr9YfAt0dWP556Ghn+sOM1VvaH9QHubba83ZW+OCLyR3m5IcP
         skoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbeYs66CpBPELwolpWNkVYZp3R4XKlCZ25wvkLyeIS+YGEnX+RbG34lFdVn6tQyvMY2QFLGfQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzlkmbdWTSoQ3IiYasHgJs+HCscZnF0NQWT0hEp3Ys136yBFWXq
	a69zeqI9FVL098oLw61pCoHp/bfstzUq2VipKPueamUBPHX6c1HuXu2R1wDZ8QTjui8=
X-Gm-Gg: ASbGncvqwVbIfzceMOqiWIoeQhKa8iBVJGDOv4pgyMvADwBxpEou+DbVsio+YerOarT
	e5C2XwudXfakrRBOygBJ35ZGYq58km/x31itX9NGAq5eHhkF7nIuhFNnlbMKTHwyG4n4exnv33a
	kRfs1IrH8jWSc93zYRTgN5YrI9E1lhUqlFOwQHkICUGlPUPVIiWtsi0eV+CDBA3GrDO49B2D2m3
	eP00AU8kPWmY1A8Q88SHlTA0x0hp/cO9qFnHBGZdWBwbLIkcok0wP2oY0xuxBvQIP6P6vOXyMuf
	KO4OQF5JIsiC0I9M4y7VZFJKBTSpK98bR4YE6MY+2yFy5W7F1+XBhbJDSaEIBZsu2Ega7/yuUTs
	VgVLr/rbcnw4tTw0MN7Xn0X+dFjgAOP8FZfQKH/1ds1I+6JPjYX1Ix/8mBdBRJUgIVEopTr+vQd
	GQbAahxpjb9bQU
X-Google-Smtp-Source: AGHT+IHjvH8tEuZg+gXvi6IM/+7or2ktCuzjFSHVpKfrsaF2EYXSWsRTQJnVaoBW4TL1kdx24muqFQ==
X-Received: by 2002:a05:6a20:258f:b0:334:89c6:cdeb with SMTP id adf61e73a8af0-344d441fa42mr5353099637.56.1761671117283;
        Tue, 28 Oct 2025 10:05:17 -0700 (PDT)
Received: from localhost.localdomain ([49.37.217.46])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7a414068addsm12508862b3a.44.2025.10.28.10.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 10:05:16 -0700 (PDT)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: jjohnson@kernel.org
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath12k: fix potential memory leak in ath12k_wow_arp_ns_offload()
Date: Tue, 28 Oct 2025 22:34:55 +0530
Message-ID: <20251028170457.134608-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_160947_937022_88008847 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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

When the call to ath12k_wmi_arp_ns_offload() fails, the temporary memory
allocation for offload is not freed before returning. Fix that by
freeing offload in the error path.

Fixes: 1666108c74c4 ("wifi: ath12k: support ARP and NS offload")
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
Compile tested only. Issue found using static analysis.

 drivers/net/wireless/ath/ath12k/wow.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/wow.c b/drivers/net/wireless/ath/ath12k/wow.c
index dce9bd0bcaef..e8481626f194 100644
--- a/drivers/net/wireless/ath/ath12k/wow.c
+++ b/drivers/net/wireless/ath/ath12k/wow.c
@@ -758,6 +758,7 @@ static int ath12k_wow_arp_ns_offload(struct ath12k *ar, bool enable)
 		if (ret) {
 			ath12k_warn(ar->ab, "failed to set arp ns offload vdev %i: enable %d, ret %d\n",
 				    arvif->vdev_id, enable, ret);
+			kfree(offload);
 			return ret;
 		}
 	}
-- 
2.43.0


