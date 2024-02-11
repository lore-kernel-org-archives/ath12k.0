Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380B3C4829B
	for <ath12k@archiver.kernel.org>; Sun, 11 Feb 2024 15:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ereKpYdLrSaaOEa5xs7M1T2/tfEfvgSZWOY7DvZi9OI=; b=3eXixCRs5m5whLflitO+a9YsfC
	lYlSg+/UJGnSejjFhgOMksDSW37GdRxx1Nh3KXCKI3/9HuRl2Jghf9R9UDnpVcP0/NjFu21rbiqp1
	QBFnkvlJlWfcOpN1LDQolk7ZZ+TOZoTHNknb148OqOVvvQK9mauNUH1eo4MfDRAGd16p01e66EoZH
	DJ6zu/+7Vt/TZdCPgIjDein2+GIFSeAFVrYnncvZXkr9QZaCrinYhxcbOe5iFd0C5CRQah8Rm+HEH
	wtGeteABVQJ0Sq0Zedqqkoqi9z6HnAq6BaTUnMhQLeB1ODcjADq62vgVhBiFg+zZBOl8fGTC6Lm/I
	MNcjFjSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZBU6-00000002tzd-3rq4
	for ath12k@archiver.kernel.org;
	Sun, 11 Feb 2024 15:11:10 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZBU3-00000002tyF-2rZ4
	for ath12k@lists.infradead.org;
	Sun, 11 Feb 2024 15:11:08 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40f02b8d176so20560555e9.1
        for <ath12k@lists.infradead.org>; Sun, 11 Feb 2024 07:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707664266; x=1708269066; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ereKpYdLrSaaOEa5xs7M1T2/tfEfvgSZWOY7DvZi9OI=;
        b=gyxc7DNWNim0g0A/4paVzQcm5u7MqACM/Sm3CAG72ZRa1Be6NHjnJpXU0rssc7e6Z0
         RKi4hj2nJMU4hNXk2lXd4wzzEqnkqufri5e8U4FZuItErsQG4wy/rfQ1VqDdTbzB8wg+
         Q6iMYEff5USYfikgMCrPypaLaJI3OO7Kbc+6zmaZH71Xi5XUaZ+qFS62vyvoXDTbNsIl
         RErbQhXv7D48x8W2Nx11D8RxTg0eEN9KoPdlq1X066cCCs9/S0ugdjT2B2/dbdZ/BG37
         iWXxa35vD1OuDoux9iOl78WL3BPskROjMzd/Sbn5Scdk+cSDWFZ4HcnlnwZRY+AmBwG5
         lWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707664266; x=1708269066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ereKpYdLrSaaOEa5xs7M1T2/tfEfvgSZWOY7DvZi9OI=;
        b=cMuPrpq7pEzhqGd9fmmSYRfXVXXd2z+xNi9d5UutroOGrN5dIDN0mZEEIdoSHTdcof
         AYsBn9jHMTLzxNQ/1BQ6ZpwxSo/KmSIG0oUO4qszZw/xlGA8f2s8x4+jWPW0FckkZ0Vu
         8HApXbLw/Gl89rsNPPViMEbHeKoZvS4Uz+4VsPHOTwl0EFSdriyEKOt0DcHPTV/I3UIq
         hRsBC/NwhdiWME54lxbpzbPpEnlpSBgMlmvgPcQU8GeBAiexS0OVt4fJbwHsRN1KQ8Pu
         qUcw6IK3J8DV4brVBF5uQvfI8Wda50QBgK3RH60p/9mvkBbxH9cmaJt9ey/bxgMYN74a
         yyeA==
X-Gm-Message-State: AOJu0YyisBvx2+elvc5Ownk8I+NqSCeIinWEnRBkgi2abmEg0pKpwJOZ
	Tk8fso83RaGGQvICEKEtBhlrsQIaKfieJ66QOMcIAHqmIaLvnkPtvB0+SS4R
X-Google-Smtp-Source: AGHT+IG4ENqfTMl/QDlO2wMczjF5TosO6T+Na4EuQRiiRB1auNm5e64Gu/ZjATk92+xSlqaBztqibQ==
X-Received: by 2002:a05:600c:4ed0:b0:410:c127:62fe with SMTP id g16-20020a05600c4ed000b00410c12762femr1176907wmq.1.1707664265701;
        Sun, 11 Feb 2024 07:11:05 -0800 (PST)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id bi11-20020a05600c3d8b00b00410d41f1d96sm384272wmb.34.2024.02.11.07.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 07:11:04 -0800 (PST)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath12k: remove the unused scan_events from ath12k_wmi_scan_req_arg
Date: Sun, 11 Feb 2024 16:11:04 +0100
Message-ID: <20240211151104.1951418-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_071107_741894_949C74BB 
X-CRM114-Status: UNSURE (   7.77  )
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

As done for ath11k, lets keep on cleaning up struct ath12k_wmi_scan_req_arg by
removing the unused scan_events. Also remove the underlying union & struct
construct as it isn't needed anymore. No functionnal changes.

Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 drivers/net/wireless/ath/ath12k/wmi.h | 31 +++++++++++----------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 892f21f95ee5..103462feb935 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -3281,24 +3281,19 @@ struct ath12k_wmi_scan_req_arg {
 	u32 vdev_id;
 	u32 pdev_id;
 	enum wmi_scan_priority scan_priority;
-	union {
-		struct {
-			u32 scan_ev_started:1,
-			    scan_ev_completed:1,
-			    scan_ev_bss_chan:1,
-			    scan_ev_foreign_chan:1,
-			    scan_ev_dequeued:1,
-			    scan_ev_preempted:1,
-			    scan_ev_start_failed:1,
-			    scan_ev_restarted:1,
-			    scan_ev_foreign_chn_exit:1,
-			    scan_ev_invalid:1,
-			    scan_ev_gpio_timeout:1,
-			    scan_ev_suspended:1,
-			    scan_ev_resumed:1;
-		};
-		u32 scan_events;
-	};
+	u32 scan_ev_started:1,
+	    scan_ev_completed:1,
+	    scan_ev_bss_chan:1,
+	    scan_ev_foreign_chan:1,
+	    scan_ev_dequeued:1,
+	    scan_ev_preempted:1,
+	    scan_ev_start_failed:1,
+	    scan_ev_restarted:1,
+	    scan_ev_foreign_chn_exit:1,
+	    scan_ev_invalid:1,
+	    scan_ev_gpio_timeout:1,
+	    scan_ev_suspended:1,
+	    scan_ev_resumed:1;
 	u32 dwell_time_active;
 	u32 dwell_time_active_2g;
 	u32 dwell_time_passive;
-- 
2.43.0


