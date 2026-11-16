Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B5A606A31C
	for <ath12k@archiver.kernel.org>; Mon, 16 Nov 2026 02:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FXcEx9GK;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aJbljKzU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=O8E59MHyWwiA+wcCL4U828xtteetfn3cJcwAEEyfPtQ=; b=FXcEx9GKkgPpN6IwhBxsSrH9tP
	gxKwyKrcbGkQmBveWxUWgsII982cvljr/XEJC2/6Xx8IP+nHZedqN472ICunaQlhQaD3LEvvEC+zZ
	PNj1hTeEtax6ZPkREiKV/bAypG8wPIxUPo7qXqAaKoCdnzlNWQujHFrUIieOoPQH+CjyQ9pxJwfA3
	oUzMP7eLJQZe06ORcSytJ+7p9BgrDRwJbwVkcBmNbhOiuiG7LUUXdLKH6kfrAw75WqSa5mnzkdajF
	yLMERj5o5v5YinNjbpQHtT1hyDQ1wYnwxf8d/9DjEHzFg/DjJTS1H6n2pS69ywvQxS07H6i8tv34z
	wjrw5QbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmBE-00000000v9e-134E;
	Mon, 16 Nov 2026 02:10:48 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmBA-00000000v8y-3iIK
	for ath12k@lists.infradead.org;
	Mon, 16 Nov 2026 02:10:46 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-53634b8328eso32313321cf.0
        for <ath12k@lists.infradead.org>; Sun, 15 Nov 2026 18:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794795043; x=1795399843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O8E59MHyWwiA+wcCL4U828xtteetfn3cJcwAEEyfPtQ=;
        b=aJbljKzUfahJ+SsvhU9toxM6rWaaw3qjtjA/dOqXOd+DAcU3FzQl5yAv6ao9uHpHFY
         tXY7eyKfskY2ZfjhsBPy77YETIEEadFavz6tQGeZspaM3YKArb+xeDUMLaQ1OfcUlRKK
         Yg4PWiTgMKh2apOlScCu86kJGSsv2lBYBe25GK7GNvEWuyQTg4AjjQGu1tpVfz/zit6N
         Z+czFb+IT8XJ94HBIwtYFgT+FjlfYk2VDOqdK7c+r5HMEPr7+zfOm6NCQH88h5/U09fH
         /cy/gHRubSAC5AusHgaiyic9ODDPOsULIJod9iA6Y1wJArYRwa22UZ5KoMqQACL0NTm1
         rPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794795043; x=1795399843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O8E59MHyWwiA+wcCL4U828xtteetfn3cJcwAEEyfPtQ=;
        b=jJou+lAOZkeq4lLD6HAbiMxFDMxPSFcZuVT9KEOpnoYR4J09yMhcRRyGuN4jCB+87w
         kMQeWXqhd2LAwNhhaaHNkSxno3r5sg7od2P5moyaqWXUBItDZvkAj7FHParOPXRdF0dl
         QD8NiL3+SoYHI+v8hU7u/Z29gDFenkhxIysw3W68aJJjlPLBIVZaXoMZG78YhjqYiC6N
         TlMjY2RwIOsvGl47Y6V0NeLLLhuLtzfTpvFrqir2IAmzAsMRH7BB+LyAaBVF2hisJU9M
         eLPETEGBS9WIw9xrXlEjVKk1uApl52Wfm1cKAxCztKhq+XDVVEBKGxdFQi/nJjhGTY4W
         lbaA==
X-Forwarded-Encrypted: i=1; AL+hErGk9EVSPo+p/gAless4rD8p2wyizlcx5AJSNTmT5/0XG4rg7qFw2f0q+Jv7Hlkafh+JUDtrJgI=@lists.infradead.org
X-Gm-Message-State: APuU4Z/j3nkkyYBc013nZAaLRLcdBzrZsVTNT7maqkbK0FMoPIGRtwcV
	q+FiwucB+OfBeifv3HE+gzuiUGsVvlaVb8DKLQ+RxOE+W0qZBZkT2meZ
X-Gm-Gg: AYBFou3ifOp7d+P/fYAon0+uvBdeMTywTH5+3LFCbU29doK4nust5LNDHpQv11cTQC7
	RT5z/qQ7BHdzaOm3xxX/nNOrcV8C0JrOA5RIyg9cck4bpaxuzeM3t4C2mWPBNPLQ1bSuNKa4Oy1
	ilGGjYxpSscqHF3LSzpm7WII8BcY4EBYpQ+BO4fqidM7/Va64N6ZY0xfiHs8gOlUHRypwBOtFGG
	bckhZfgAeiQwPLXItmkOA2FSbt3gRlylZLMMmo1QDcNVeE8NyPWDS0e14WaYG5qMEELHw7WyTfE
	CdsQqLYUxcyowR/Q6Ish+rBd+apLRTV0kaogMhhrBVsj/i+6Upavwqx8zjdDSCT6tC6c0/Z2Oke
	pY0IkkwCwD/KQEkeEnLJsJGbSASXWIUp1v7f13YiuUIxSlyZptG7jxAv1X0xiZCwBNarJXsbTNu
	u95RMFBzX68YaDcjSzYJlbNCeJlm5LXKNCqclZEw8eUbIOy0HW7ytzLf0Dk9nnJ19DPQqFpUsyx
	PROumtshBaJJ7jUomQ3zbeHayEuO4vQLlVaM4wsirguPARbsBm722ZrBMalWoJKaeIDJMpplhPj
	RDLpVMJqvUmmCmg/woNQeFPkQ11Z26OYtur3iAlXXPZnpj2R7jgvQgMmgNrJ9bw00o42qQny4vA
	=
X-Received: by 2002:a05:622a:14ce:b0:55d:30f5:34f6 with SMTP id d75a77b69052e-55d30f560f8mr60276151cf.37.1794795043056;
        Sun, 15 Nov 2026 18:10:43 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d34a139f6sm22083541cf.22.2026.11.15.18.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 18:10:42 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Praneesh P <praneesh.p@oss.qualcomm.com>,
	Jiale Yao <yaojiale02@163.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: hold txmgmt_idr_lock while freeing pending mgmt frames
Date: Sun, 15 Nov 2026 21:10:37 -0500
Message-ID: <20261116021037.538128-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_181044_927812_BB58D97B 
X-CRM114-Status: UNSURE (   8.15  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

ath12k_mac_vif_txmgmt_cleanup() and ath12k_mac_tx_mgmt_pending_free()
walk ar->txmgmt_idr without txmgmt_idr_lock. A WMI management TX
completion can meanwhile remove an entry and pass its skb to mac80211,
which frees it. ath12k_mac_vif_txmgmt_cleanup() then reads skb_cb->vif
from the freed skb, and both walks can read an IDR node that was freed
after an RCU grace period.

Hold txmgmt_idr_lock over both walks and make ath12k_mac_tx_mgmt_free()
expect it to be held.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Suggested-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.
Compile-tested only, with x86_64_defconfig plus ATH12K and W=1.

 drivers/net/wireless/ath/ath12k/mac.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index eee3f38375ae..bffb2edd0531 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -9220,10 +9220,9 @@ static void ath12k_mac_tx_mgmt_free(struct ath12k *ar, int buf_id)
 	struct sk_buff *msdu;
 	struct ieee80211_tx_info *info;
 
-	spin_lock_bh(&ar->txmgmt_idr_lock);
-	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
-	spin_unlock_bh(&ar->txmgmt_idr_lock);
+	lockdep_assert_held(&ar->txmgmt_idr_lock);
 
+	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
 	if (!msdu)
 		return;
 
@@ -9241,8 +9240,10 @@ void ath12k_mac_tx_mgmt_pending_free(struct ath12k *ar)
 	struct sk_buff *msdu;
 	int buf_id;
 
+	spin_lock_bh(&ar->txmgmt_idr_lock);
 	idr_for_each_entry(&ar->txmgmt_idr, msdu, buf_id)
 		ath12k_mac_tx_mgmt_free(ar, buf_id);
+	spin_unlock_bh(&ar->txmgmt_idr_lock);
 }
 
 static void ath12k_mac_vif_txmgmt_cleanup(struct ath12k *ar,
@@ -9252,11 +9253,13 @@ static void ath12k_mac_vif_txmgmt_cleanup(struct ath12k *ar,
 	struct sk_buff *skb;
 	int buf_id;
 
+	spin_lock_bh(&ar->txmgmt_idr_lock);
 	idr_for_each_entry(&ar->txmgmt_idr, skb, buf_id) {
 		skb_cb = ATH12K_SKB_CB(skb);
 		if (skb_cb->vif == vif)
 			ath12k_mac_tx_mgmt_free(ar, buf_id);
 	}
+	spin_unlock_bh(&ar->txmgmt_idr_lock);
 }
 
 static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_link_vif *arvif,

base-commit: 1be6c8d3027d4a421dc46b93a89a196c61945614
-- 
2.43.0


