Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C3C606A31A
	for <ath12k@archiver.kernel.org>; Sun, 25 Oct 2026 18:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s8VKjARC;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bZeRLdAg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6dNyV3fpMybpXNc3EAQIMokM6V/kPapL6dCc89nw+uc=; b=s8VKjARCxMX70oX6RXVkyIDYo3
	8yXQ58kliAsL8YIbsj5L4wSFhmwF5IfLYLv+mlJ9bcceuejaQT8JwodFX6WSEYouF3R8sauTyL6CV
	ELFeECWQIQH9KV//E6Hk1AVKgbuRBAz5xctmM2I7sTqcCmxMxtv6PZudY4h4rBCO6PnjYu6FHBZjh
	PhrrEyYTbKXiECrVk9nwULitRzsbeZhD6xCR7vjAdscsU3OoPcdYpUy7JICG4f5O7eSQwGinvWWhb
	XbkvB6rbmXay4ewpXSp3FFnMPlikXH5na9UEq6xUn+3ZaDgevO9vlcehQ+Oj+kAT8zufuADpyuX5J
	R/Hfcklw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL2pV-00000001HpC-1ZJ0;
	Sun, 25 Oct 2026 18:20:25 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL2pS-00000001Hor-3HMb
	for ath12k@lists.infradead.org;
	Sun, 25 Oct 2026 18:20:23 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-35f1f76ea84so3954838eec.1
        for <ath12k@lists.infradead.org>; Sun, 25 Oct 2026 11:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792952422; x=1793557222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6dNyV3fpMybpXNc3EAQIMokM6V/kPapL6dCc89nw+uc=;
        b=bZeRLdAgYcc72CU0hmHxMuRINxJA2IrAVDsRbSPWccjxmFTFVoHqcLwjZpcymt8dvY
         LDkIWnNompkrGWG7J3JpU+LIoqsEK/hBL4pp3eHhsBrkWPGJ5GqsouR7dA0kXjx78jiO
         WDbjTakpm4OioEtBUK5BQ5p5sxSlHjRGw7tNAK5kabfsrHE9+mf9WCPZUG0RraS8Savg
         KX+p+Ftpa1v1zpkOvOrL7S5+iJBsbzyjo6V3BejWEs70dxQ4n5wH1PepKNRTavzqnXXn
         Qze47lzs6jFzcktrBmB9Qfw4bZ7LeHbKSJnqdiwD29xXQuzKq3Wz5tANRBEgwmsFghmj
         bubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792952422; x=1793557222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6dNyV3fpMybpXNc3EAQIMokM6V/kPapL6dCc89nw+uc=;
        b=F372SMIRPe/20pBneHr4qwZSi5xETLO9KsdfRntO766aaYkVfOL5+4kDdNq1NckAqV
         gSMKcwLBCVGOP62SO5X22vJzL6TKdMa3BPSquEswQoTRcO2Yw69qMu5qf3af9qErzuDO
         b/qKpivXdtYmf5bgGloQIbuXkbLmZ9M8Vf0hPRxu/IQLigJVM8gd6BBd7NjXWNEXEhhf
         +/sg1Vw4Qqz0lFt4R7WsPDDwob2MfCLlrSy6N6b5z1/mVlvrGpuAhG7lpL+28RR2IIzN
         /V9QSs4+VIwzt4EgjBV1UuFT1B4nMayVqCK0JzFbcBfzJvNpI9x/yn9cC8U9L8zKO81m
         5D9w==
X-Gm-Message-State: AFq9FYLil7sNfJJp1j3tMWuOBnltbVGhTF22QKgEuz+UUosjaFpw/cHg
	EISnj86SK/P/zJtbJ3mbDKWm30+z/JF9/eaFdGYAJHaOdlfVL4LKv6KP9Qnhd7nMibo=
X-Gm-Gg: AYBFou2MNxxA8RsPoxN55Tj/yP9S+7ptu2HHSLczOaCUMpNO0IeabI+G4XPK5rbRWLw
	4za3DadDBBd2q/WH67pZ2nPSDlSwg7THo3SOLFKrjQPiHOuHMhhhFkpDq10ZY7BXa6zgRZ5KD53
	7X/QX9E1IxVVqCzUnU/nsFslRdwdsfubzKxw1LOJfU2xf1O2CUW0D181IAG657+OIQIfzAFSx1b
	Jr7ydlu6DRR5g+bFsT5WTtkoXc6dtZpiMYbhxmKQdccuBdm0kPB5fApbU05TFzG0iTpayvwQJ0i
	YyoSxqJcthvGwafj5TZggoIWyMQy2IxHU6XjBnwk4FA0TVOk2UgMZQ/qw8whWEurhFBPTXJfJnj
	zKn90cmyWRiGrTiA733ANJsqippnhMBhFmfarK57FB3bjbQdhYOWoslp084bcgRXiEim1zjvNq5
	6LFBfuHN1IiXIpqj4Q/NBF0YUA/VWOLuSQJC0VffkcQUZztR9UVRqxd/fB4X0QE1GtFjxEiYW9t
	/4gDYgOlgslEi08ZZI2n17RIouyaJTLBErW7yxpCCprXkCB+XXuhYmijO1oWhpO0pVRZQaLE8/0
	EoM/W/g4JOUgKx5VM+SaQg==
X-Received: by 2002:a05:693c:8642:20b0:35e:9c54:d41b with SMTP id 5a478bee46e88-369e85004b7mr9067107eec.21.1792952421588;
        Sun, 25 Oct 2026 11:20:21 -0700 (PDT)
Received: from ZephyrLabServer.internal ([165.162.64.148])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d93663sm21226162eec.13.2026.10.25.11.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:20:21 -0700 (PDT)
From: John Macias <dencity7@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>
Subject: [RFC PATCH v2] wifi: ath12k: service all RX rings in an interrupt group
Date: Sun, 25 Oct 2026 11:19:55 -0700
Message-ID: <20261025181955.2089498-1-dencity7@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_112022_847953_9151D865 
X-CRM114-Status: GOOD (  19.46  )
X-Spam-Score: 1.5 (+)
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

ath12k_wifi7_dp_service_srng() services only the highest REO destination
ring selected by ring_mask->rx[grp_id]. If a group selects more than one
ring, the other rings in that group are never reaped, and the flows
hashed to them stall.

Every in-tree ring mask selects one REO ring per group today, so this is
latent upstream. It is hit by the QCN6432 ring mask from the vendor's
downstream tree, which puts REO rings 2 and 3 in one group. On a
GL-BE3600 using that mask, 7 of 16 single-flow TCP downloads stalled or
failed, and ring 2 reaped no packets at all.

Walking every ring with the full budget is not enough: under load the
first ring can use the whole budget on every poll and starve the others.
With that approach ring 2 reaped under 1% of ring 3's packets, and the
flows on it ran at 0.2-4.4 Mb/s while the others ran at 100-360 Mb/s.

Instead, give each ring in the group an equal share of the budget first,
then hand any budget left over back to the rings in a second pass. A
group with a single ring still gets the whole budget in one pass, so
current hardware behaves as before.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Assisted-by: LLM
Signed-off-by: John Macias <dencity7@gmail.com>
---
Changes in v2:
- Share the budget between the rings of a group. v1 walked the rings
  with the full budget, which starved the lower ring under load (see
  below).
- Rebased on ath-next.
- Added a Tested-on tag, full name in the sign-off and an Assisted-by
  tag, as Jeff asked.
- Link to v1: https://lore.kernel.org/ath12k/CA+KzPsr13czsH=k_UWJqj48C4Vsb-diQ-tiCh7W4XW31E8WzHg@mail.gmail.com/

This is still an RFC because I have no WCN hardware, so the WCN side is
untested. Since every in-tree mask has one ring per group, the change
should be a no-op there, but I would be grateful if someone with a
WCN7850 could test it and reply with a Tested-on tag.

Testing. Both radios ran OpenWrt (Linux 6.18, backports 7.2), and only
the ath12k_wifi7 module was swapped between runs. Rebuilding the
unmodified sources reproduced the installed modules byte for byte, so
each test module differed only in this handler. The QCN9274 build also
carries an unrelated local REO fix, as installed. The QCN6432 is a
GL-BE3600 using the downstream QCN6432 support (not upstream yet), as a
5 GHz client of a GL-BE9300 with QCN9274. iperf3 over that link:

                              before    v1           v2
  16 single TCP flows done     9/16     16/16        16/16
  slowest of 8 TCP streams     stall    0.2-4.4      70-83 Mb/s
  ring 2 vs ring 3 packets     0 vs -   3k-8k vs     about equal
                                        0.7M-1M
  QCN9274 RX, 8 TCP streams    1012     1048         1034-1042 Mb/s
  UDP loss, 8 x 50 Mb/s        -        <= 0.02%     0.00%

No warnings or errors appeared in the kernel log on either side. The
QCN9274 groups are single-ring, so that tag shows no regression rather
than the fix itself. The hardware runs used a variant that differs only
in cosmetics (left-- was inside max(), and the comment sat inside the
loop). The patch as sent builds without warnings with W=1 on x86_64.

This work was assisted by an LLM (Claude), which helped analyse the
handler, write the test scripts and draft this patch. I reviewed the
change and the test results, and take responsibility for them.

 drivers/net/wireless/ath/ath12k/wifi7/dp.c | 31 +++++++++++++++++-----
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp.c b/drivers/net/wireless/ath/ath12k/wifi7/dp.c
index 397da016b..67a347362 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp.c
@@ -27,6 +27,7 @@ static int ath12k_wifi7_dp_service_srng(struct ath12k_dp *dp,
 	int tot_work_done = 0;
 	enum dp_monitor_mode monitor_mode;
 	u8 ring_mask;
+	int rx_rings, pass, quota;
 
 	if (dp->hw_params->ring_mask->tx[grp_id]) {
 		i = fls(dp->hw_params->ring_mask->tx[grp_id]) - 1;
@@ -50,13 +51,29 @@ static int ath12k_wifi7_dp_service_srng(struct ath12k_dp *dp,
 			goto done;
 	}
 
-	if (dp->hw_params->ring_mask->rx[grp_id]) {
-		i = fls(dp->hw_params->ring_mask->rx[grp_id]) - 1;
-		work_done = ath12k_wifi7_dp_rx_process(dp, i, napi, budget);
-		budget -= work_done;
-		tot_work_done += work_done;
-		if (budget <= 0)
-			goto done;
+	/* A group may select more than one REO ring. Give each ring an equal
+	 * share of the budget first, so a busy ring cannot starve the others,
+	 * then hand any budget left over back to the rings in a second pass.
+	 */
+	ring_mask = dp->hw_params->ring_mask->rx[grp_id];
+	rx_rings = hweight8(ring_mask);
+	for (pass = 0; ring_mask && pass < 2; pass++) {
+		u8 mask = ring_mask;
+		int left = rx_rings;
+
+		while (mask) {
+			i = fls(mask) - 1;
+			mask &= ~BIT(i);
+			quota = pass ? budget : max(budget / left, 1);
+			left--;
+			work_done = ath12k_wifi7_dp_rx_process(dp, i, napi, quota);
+			budget -= work_done;
+			tot_work_done += work_done;
+			if (budget <= 0)
+				goto done;
+		}
+		if (rx_rings == 1)
+			break;
 	}
 
 	if (dp->hw_params->ring_mask->rx_mon_status[grp_id]) {

base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.47.3


