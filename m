Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FFFFEE4F7
	for <ath12k@archiver.kernel.org>; Sat, 28 Feb 2026 20:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UakhJPU9os/s+Hl8WFLkDW7k8DEgnLbqBYDV9vq2Is4=; b=PfrVF1Ug4B1J4ByKh+Oy2VZaMI
	lohVQCgmcxCM7R9s67D5g5VcJZqMtCut2c8sDVZM0hDaLXoZb/zC4GLzhIUT9qLFkyxrRf76r35aP
	2eoKtq7a2s/jszPUEBxXyuqqjWgDKgj/nFgrsY4wI96Vn2pBarlk3FI9Qls6bwXvlFRG86nZ9FMzL
	1SadlH5i+ykZqH62n9+TlrPMpnEKNJM3cJeyqEfo5+JZvL3vsJRii74a+6Xw3/6OG+8Dwt1qZ6ypk
	r4WBOtkWSU7CNH7CeIHLf4dy0xucrO0SQHIdgYSANaR0FRovOXAGaYsX52ypeOQH3Cb8V3wVzTCNu
	nmI+v8ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwQdz-0000000AEqf-1GKr;
	Sat, 28 Feb 2026 20:10:31 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwQdx-0000000AEqA-0Wa6
	for ath12k@lists.infradead.org;
	Sat, 28 Feb 2026 20:10:30 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-56a8ebde349so2803153e0c.1
        for <ath12k@lists.infradead.org>; Sat, 28 Feb 2026 12:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772309427; x=1772914227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UakhJPU9os/s+Hl8WFLkDW7k8DEgnLbqBYDV9vq2Is4=;
        b=R0p1SgMghN6vLCS3AP+8pRwQrpc6/zIZ0kuHh7JzXoX8MUuyq0suHLUpjC64/xjzlD
         WvFC0JAgVnJso4+lXWDVxCG1OJJ1RVtH0nED1A4mVzBzsGNRclcfds8Cr+J8lohETzPp
         ntiKGjwB/uIyMLzJPRoC+X77UMlpb2B0i840rmAKfrpnHN3VZgxeaIUHnnxni1KSfF+O
         aWguWb7eo9XD7M1cpEKAblC3Qq4S9MEA5r7QFgWKDQKHk/2OrQywOzy4mkvFOTevsXZT
         OShSDFYWPxp+Fk/q/zh9HmnlMU8WmLP+jaxrPEVjA77CdNrpCRDY/hv0vXQ2iX+hjHqv
         XCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772309427; x=1772914227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UakhJPU9os/s+Hl8WFLkDW7k8DEgnLbqBYDV9vq2Is4=;
        b=Zsg6KX20X/prPMbGXad1fJAINIhrcDtC4gqA2k1r8kRRAf/WVqGPM92Vr6KdYKNr9J
         ornkosrUVdG3N0iJmibUnRMsLGVczIpsiDxUHekwxYqwu0HkWDIeZiARfpB7g1NhQKWd
         7m0TovWpgX3vrXHtV0JZlfu/wQ4Va+OiqWzyeLAWI6otQvV5HI/umQhOFWImC/lsZXy/
         SVJJNgluBl9qrkQZgGeYkOJq/jweJO+YDsk83nu3dcMGIrI4mPtKzr81caIdcj+uR0j/
         0taWv4I6Qe8vWf5JeAa7yfd4Ss0xALOxmNFimNfcrw83wSxzylxME5aPy4dWG4UjZAz5
         i6yg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ+1urIx06f5eNg5zHmyHzs6V5k6J+kK11FtkAKnBe/2Iak6othwaavU6fXb0LpWqWqFrOGXg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3Fdjn4lzehTbVd8EJaXlhWQkiMI1QFflbRkqlD7oUaV/idNyN
	NqrI6lG+A8VqaaySH5uQ5nUD+/ecyZHqWBOTXgloidBDDlqye9QkqmFg
X-Gm-Gg: ATEYQzzCITwxPjXhGbsiUvTpurlBXVK7SBDI0W6GKL2e0uFesh7LruGH2MLaoU2sGD3
	PXAhJg+r7Ra2Tw9Jq+uUIcI5Usr+Elv63TrjpF/lGSLv9d+xPfWfXih+adUJOUPW5AZMxIEQ8yW
	8ibnyBBTv2wZDXkhH983ZDmGJK5I6l9iAtA5VGRa2Ti6qOtUQsAdD6mOkfUiioBA8bIB2cl4PI4
	LKoat1BhZtNLefrweRETO7yH1ScnBRAn6cuRoJei+tEG8F9hgBKve+LtMVFZZ7qCqoAFuEUlYg4
	3Ygi3LB9g3vQDbfRhLHzLD9qwaWwVMySi2CIApWg+oYepjfPCp/wp6R1Lv/9P+teSY1A1dr/lko
	P9Tel5UltqGicGIE4WX7ssNyw8OKQi+c8iExBybQ8KmfR0fLbDol2kQuVm5QobfDFG51nBoe3GJ
	dsG3/s6geNcpATJLCNzs5d7YotoHhJzvQ=
X-Received: by 2002:a05:6102:2909:b0:5fd:a537:a775 with SMTP id ada2fe7eead31-5ff325ad924mr4230919137.38.1772309427413;
        Sat, 28 Feb 2026 12:10:27 -0800 (PST)
Received: from cochinote.. ([190.13.119.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1e7afde2sm9112744137.1.2026.02.28.12.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 12:10:27 -0800 (PST)
From: Luis <lxluxo23@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: jjohnson@kernel.org,
	ath12k@lists.infradead.org,
	Luis <lxluxo23@gmail.com>
Subject: [PATCH] wifi: ath12k: allow user regulatory hints when firmware reports world domain
Date: Sat, 28 Feb 2026 17:10:23 -0300
Message-ID: <20260228201023.116947-1-lxluxo23@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_121029_194228_FD04F645 
X-CRM114-Status: GOOD (  11.52  )
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

Some WCN7850 firmware versions (e.g. WLAN.HMT.1.1.c5-00284.1) report
alpha2 "00" (world domain) during initialization instead of a valid
country code. When ath12k applies this via regulatory_set_wiphy_regd(),
cfg80211 marks all 5 GHz channels as no-IR, which prevents active
scanning and makes 5 GHz networks completely invisible to userspace.

Without CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS, the reg_notifier
unconditionally rejects user hints, leaving no way to recover from
the broken world domain without reverting to an older firmware.

Fix this by allowing user hints when the current regulatory domain is
"00". If the firmware has not provided a valid country code, accepting
a user hint via iw reg set lets the driver send a WMI set-country
command to the firmware. The firmware then responds with a proper
WMI_REG_CHAN_LIST_CC event, restoring 5 GHz channel availability.

Once the firmware acknowledges a valid country code, ath12k_regdom_changes()
returns true for "00" and subsequent user hints are blocked again,
preserving the original security intent of the CONFIG guard.

Tested on WCN7850 hw2.0 (ath12k_pci) with linux-firmware
20240318.git3b128b60-0ubuntu2.25 under Ubuntu 24.04 / kernel 6.17.

Signed-off-by: Luis <lxluxo23@gmail.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/net/wireless/ath/ath12k/reg.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index 7898f6981..0c52d559d 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -87,9 +87,20 @@ ath12k_reg_notifier(struct wiphy *wiphy, struct regulatory_request *request)
 	}
 
 	if (!IS_ENABLED(CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS)) {
-		ath12k_dbg(ar->ab, ATH12K_DBG_REG,
-			   "Country Setting is not allowed\n");
-		return;
+		/* Allow user hints when firmware reports world domain ("00").
+		 * Some firmware versions default to alpha2 "00" on init, which
+		 * causes cfg80211 to mark all 5 GHz channels as no-IR, blocking
+		 * active scanning and making 5 GHz networks invisible. When the
+		 * firmware has not provided a valid country code, accept a user
+		 * hint so the correct regulatory domain can be applied.
+		 * Once the firmware responds with a valid country, subsequent
+		 * user hints are blocked again as usual.
+		 */
+		if (ath12k_regdom_changes(hw, "00")) {
+			ath12k_dbg(ar->ab, ATH12K_DBG_REG,
+				   "Country Setting is not allowed\n");
+			return;
+		}
 	}
 
 	if (!ath12k_regdom_changes(hw, request->alpha2)) {
-- 
2.43.0


