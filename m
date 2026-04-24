Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0894FED3D9
	for <ath12k@archiver.kernel.org>; Fri, 24 Apr 2026 14:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8FYF8oZhNqSuTK+FyZ824o92INSUjfpo9VA3IN58oI=; b=XInzyFMZfC8MXzvsJUyFPxM0Qm
	nHjKUuTktC5cmfSyF+Tzv7UKz/tHO07uBpoQk4neTFDGS1d23/Ab23Zc4L7GcaNZ5laCKEP3+Npwr
	oEu+Wc6RDqdd7FCTg4smosfsKCf0Qw6CkwPnSXED2cc033OB5QfRrueSWjYCHKQI6aG6WCGoFtIIH
	SJa3NDwRFLkmPtVgQm4wrCaI4Har3kWHinPPRv210f7uojatS2qWFrAJ9uLmhkgZwr2a0x531xKUT
	rV9nM9/DQYspnmrUQYvqZIymJ5ppdKXZKKUTWZme2HkvLa/IDOhndAX1tfvSDZxa6cK2jBYmnwQ0h
	q/zEkkOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGHpM-0000000DLMB-0j1D;
	Fri, 24 Apr 2026 14:48:20 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGHpJ-0000000DLLW-30Td
	for ath12k@lists.infradead.org;
	Fri, 24 Apr 2026 14:48:18 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-488d2079582so92734825e9.2
        for <ath12k@lists.infradead.org>; Fri, 24 Apr 2026 07:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777042095; x=1777646895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8FYF8oZhNqSuTK+FyZ824o92INSUjfpo9VA3IN58oI=;
        b=TsO1foSdeEWqAf1eoCC0J71d9pnN2dZefA+/HmnVC6KMr3/JR8rMWtfarflpaZ/rlW
         q8wRHlsJNdmP/Ql11bVvbSaeGELNEhOpL4YC0GcD2oTuasL+1tSpIlEIwKeai/1CN+0F
         nNjSBsbwPOWMZ3DXSOT/wSArQaf1LoXj0u6ldiI7o/2pfOQfcqREJmxLbgnjf9p/nnzz
         rj5hyb2u4MviNzKjHc1tEZ7F8xtMdNd5JoHRM7G6zporQkV3iZZ15po7Z8hp1MryTiqP
         ETl/UfJP0lvgyjZLmWpyNK8DyOTe64wUUdL5XGSISY/eeIA4hYuCvbS3LISDhKdPidU9
         s1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777042095; x=1777646895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v8FYF8oZhNqSuTK+FyZ824o92INSUjfpo9VA3IN58oI=;
        b=JmXGMYFRS0SRBey81IooWvOy5Do5W38XFIwi1hnsWt6fRKlk1PmVXwPpy/bauh/bxL
         cZMwDn3b7zSLtyhRc6WevY+3StJVoJmxsLGEEW2b2ZjLitpttCR0De5/zk1soVC3IO2s
         SEWEuStj1SL47E8AqtfSsfOGcirY8Z6eeelz0Wk+femPKxXmRvON8ti4TDdLRShORJW4
         cqazaO/xOWz6BDp6veTzU8n/GytMd1Ia26pZiYuSJ+ApiKt4nfAl356CTPq1YvRfoaw3
         MUXcdxRJ8CVbVs8UqXaDYSthvxsZ+YlDcjxVAX0D3QVZ66FSpAW7CmRrq81pQbCIFMoZ
         t3oA==
X-Gm-Message-State: AOJu0YwiPlSFaWgx0vzm/QvP5Tubrh/Zq8cLylXBOUcndosSDU+/MA8q
	9G50GvHpMOhQR0ZPvjbNnNhECPRbXy6c4nfYreDFnpebw1sJTiypzYptnIXdmw==
X-Gm-Gg: AeBDietksTWDkxoG5jYI2W10B3VUKdhvXYEYev+R1dAuuK+W+kgs6BnjMzZNaAHlB7s
	LNy2FMMDQewg5OWynICsCtVy7qEW74Sx87BHlxUJXMba/4/TjNwyPrR13ifbCrh7STyA40K/uDY
	+o7yUtmmIa0Q7HomAvnqWU5NG+LyX+5d1O+B+wuhsvzJiiA95M5B2dCRShncJ1WYCs5oEFrygJE
	/xefe6S9k8NkyGwGWkJwr/flfuE9MZ+g6rN8hbxLYEr5AWganKwF+fL3v4H4bDZ2/2DIn2hkYp9
	dIDfPDSqc8wwtZCnanE7+ysq4uX8xOijw78MR7ClLyPpL5Y2lWSvsEoMzW7KlQQTCdACyiihfv5
	E0ITUUIPqMmrUtlOAPiyl0uFL9/1xJT9E0325IyrHG1iCVs5l2KQzQpF9uYj/Jh9eQyxd2X0dAN
	h6cIE95pwmhQlrUNSYUHeUJ+ZGPSL3pZHAJ9CQYCJHobm72k9I5PFupv0VLVo5d7mtc6Y=
X-Received: by 2002:a05:600c:3483:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-488fb7787d7mr439337615e9.15.1777042095095;
        Fri, 24 Apr 2026 07:48:15 -0700 (PDT)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48919f54572sm157605825e9.26.2026.04.24.07.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 07:48:14 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 1/2] wifi: ath11k: fix error path leaks in some WMI WOW calls
Date: Fri, 24 Apr 2026 16:48:12 +0200
Message-ID: <20260424144813.1708214-2-nico.escande@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424144813.1708214-1-nico.escande@gmail.com>
References: <20260424144813.1708214-1-nico.escande@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_074817_776155_723A2D8F 
X-CRM114-Status: UNSURE (   9.78  )
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

Fix two instances where we used to directly return the result of
ath11k_wmi_cmd_send(...). Because we did not check the return value, we
also did not free the skb in the error path.

Fixes: 79802b13a492 ("ath11k: implement WoW enable and wakeup commands")
Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 40747fba3b0c..024c2aad9fb4 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -9332,6 +9332,7 @@ int ath11k_wmi_wow_host_wakeup_ind(struct ath11k *ar)
 	struct wmi_wow_host_wakeup_ind *cmd;
 	struct sk_buff *skb;
 	size_t len;
+	int ret;
 
 	len = sizeof(*cmd);
 	skb = ath11k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
@@ -9345,14 +9346,20 @@ int ath11k_wmi_wow_host_wakeup_ind(struct ath11k *ar)
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "tlv wow host wakeup ind\n");
 
-	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_HOSTWAKEUP_FROM_SLEEP_CMDID);
+	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_HOSTWAKEUP_FROM_SLEEP_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_WOW_HOSTWAKEUP_FROM_SLEEP_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath11k_wmi_wow_enable(struct ath11k *ar)
 {
 	struct wmi_wow_enable_cmd *cmd;
 	struct sk_buff *skb;
-	int len;
+	int ret, len;
 
 	len = sizeof(*cmd);
 	skb = ath11k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
@@ -9367,7 +9374,13 @@ int ath11k_wmi_wow_enable(struct ath11k *ar)
 	cmd->pause_iface_config = WOW_IFACE_PAUSE_ENABLED;
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "tlv wow enable\n");
 
-	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_ENABLE_CMDID);
+	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_ENABLE_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_WOW_ENABLE_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath11k_wmi_scan_prob_req_oui(struct ath11k *ar,
-- 
2.53.0


