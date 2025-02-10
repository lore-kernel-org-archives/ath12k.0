Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8CFC02198
	for <ath12k@archiver.kernel.org>; Mon, 10 Feb 2025 04:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U5/LwMtOeJ6224+d5XpyHm/ckyi9zP3Rw8TDDPRJNIU=; b=jCRCuVGe+USO0rUiNVvTbBbV1E
	5sZBaK0FI/gn4c1Tzfq11i9jrH5NO0Wukwd5Poz9WVbx8ewN2zV2ZVQ/McMgb137Xyslz8Fjw8ABM
	PME6YzJabzkiEBAEYL5PQjUlyqnczDofhPnrPwuuACncccNaH57VgXX5BpaygEbnWRk/Tibl3VGZf
	4Mi0sZN8j5g9N+/BghRGhfHPuGQeIT9ckZS18PscXDVk+tP7lKmB3fOwdUJqHBV0uBZZCv7nd7RoK
	FyPpcK5jnsQxYx7TQenEDRgTNDzijWT9ZljeVy7iBByOi5l9EV4eOOS6b093oX5otoioCnlPdn+p+
	8wv33n/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thLXm-0000000GB38-2ovE
	for ath12k@archiver.kernel.org;
	Mon, 10 Feb 2025 04:37:14 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thLXj-0000000GB1q-3zxR
	for ath12k@lists.infradead.org;
	Mon, 10 Feb 2025 04:37:13 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4YrsHJ1GFhz9ssM;
	Mon, 10 Feb 2025 05:37:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=MBO0001; t=1739162220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=U5/LwMtOeJ6224+d5XpyHm/ckyi9zP3Rw8TDDPRJNIU=;
	b=TTeoTgHkMOicZho9YKX2bN0b4sqymlcc9wOBBvMZUJUGIKzyeTfyxCA5zHH9/08HRO+VbW
	KnelvbFEI9gt44MN9vkNu1R8mh3C7tUoKtD5uTMerpuikZDhqIQhHrklOlHkvFBfvN8W3a
	FJ3pMjqvIQcHbFhf1uYcvivO7pf0WTYJqd/DNpN8tYfF412JjkOX18zA69iAOFBESjoktm
	oH8DKF3hSFc+JaRZNVxxJOBrR1aC8HM7vu3tjbEWD+EsMWjUr4ldBJy1TgeUSfPVklevJV
	ENjBUmpTakExrVN0ZK6K0zWDObYHnUlDo+YvT2zOLzErVYmMmYeB3r9JrUdriQ==
From: Ethan Carter Edwards <ethan@ethancedwards.com>
Date: Sun, 09 Feb 2025 23:36:50 -0500
Subject: [PATCH] wifi: ath12k: Fix uninitialized variable and remove goto
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-ath12k-uninit-v1-1-afc8005847be@ethancedwards.com>
X-B4-Tracking: v=1; b=H4sIAGGCqWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwNL3cSSDEOjbN3SvMy8zBJdQwtTM4O0FEvDZANzJaCegqLUtMwKsHn
 RsbW1ALKQzXJfAAAA
X-Change-ID: 20250209-ath12k-uninit-18560fd91c07
To: Kalle Valo <kvalo@kernel.org>, 
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, 
 Harshitha Prem <quic_hprem@quicinc.com>, 
 Kalle Valo <quic_kvalo@quicinc.com>, 
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Ethan Carter Edwards <ethan@ethancedwards.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580;
 i=ethan@ethancedwards.com; h=from:subject:message-id;
 bh=98YvdDd8MACN2jIjR7PjcggzsLEldn9tlL9QS0Lp7q8=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0o0bkp2QXk4ekFKWGJEOXFoNThlVGp6e
 GhQcXlVeHBLOXN5bWk5eVBQVDZlSnBWZG16bG5yVHp0MjlQcS9VCmNMbWMxblB6S0tzZ05kUGZV
 NTUwbExJd2lIRXh5SW9wc3Z6UFVVNTdxRGxEWWVkZmx5YVlPYXhNSUVNWXVEZ0YKWUNJemZCbit
 lMzRURno2c3MyV3hEeTlEWDRiKzNManZKeGNHYjN4ZXcvcC8xYysvdGZ6Smlvd01CMzFsK202TA
 pQUHA3Ty8zRzlNU29YWWRyVHN4ZGtWMGFuN2xqUXUvRGVtVXROZ0NnbGs2bgo9TnJHdgotLS0tL
 UVORCBQR1AgTUVTU0FHRS0tLS0tCg==
X-Developer-Key: i=ethan@ethancedwards.com; a=openpgp;
 fpr=2E51F61839D1FA947A7300C234C04305D581DBFE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_203712_262171_BACAB50C 
X-CRM114-Status: GOOD (  10.37  )
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

There is a possibility for an uninitialized *ret* variable to be
returned in some code paths.

This moves *ret* inside the conditional and explicitly returns 0 without
an error. Also removes goto that returned *ret*.

Addresses-Coverity-ID: 1642337 ("Uninitialized scalar variable")
Fixes: b716a10d99a28 ("wifi: ath12k: enable MLO setup and teardown from core")
Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 0606116d6b9c491b6ede401b2e1aedfb619339a8..ae75cdad3bd6b6eb80a35fee94c18d365d123cbd 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -908,7 +908,6 @@ int ath12k_mac_mlo_ready(struct ath12k_hw_group *ag)
 {
 	struct ath12k_hw *ah;
 	struct ath12k *ar;
-	int ret;
 	int i, j;
 
 	for (i = 0; i < ag->num_hw; i++) {
@@ -918,14 +917,13 @@ int ath12k_mac_mlo_ready(struct ath12k_hw_group *ag)
 
 		for_each_ar(ah, ar, j) {
 			ar = &ah->radio[j];
-			ret = __ath12k_mac_mlo_ready(ar);
+			int ret = __ath12k_mac_mlo_ready(ar);
 			if (ret)
-				goto out;
+				return ret;
 		}
 	}
 
-out:
-	return ret;
+	return 0;
 }
 
 static int ath12k_core_mlo_setup(struct ath12k_hw_group *ag)

---
base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
change-id: 20250209-ath12k-uninit-18560fd91c07

Best regards,
-- 
Ethan Carter Edwards <ethan@ethancedwards.com>


