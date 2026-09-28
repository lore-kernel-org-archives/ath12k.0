Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E532CA5FA5
	for <ath12k@archiver.kernel.org>; Mon, 28 Sep 2026 15:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7u9FRFVW3KTnKbu7qJYW4kd/AKeklPQypIZL2EecgFw=; b=I4AZVwIKvueS0GphrEI606iKjd
	sgU4ZY8VRohI0b4zrdbtOHxF5tIPJ8d/Z5Kk6EHYX61G5JyWB8iNaw4ZAp4SnckZoi2jHsLrZpUnT
	unrDm2Qow+dJzEnoR7Xa8Py0Yv4KjKkFha4uOVrf0CeWnK7JNES9T5I2DQRP5YuxYaAJQBy3odUgs
	HBivdGyLnTFyc2LeZr31UmjszuQw4bs8SRJRbFWQCimvYptKfwsJ2FgvlulYsaiX0DmYDAWZ6oia1
	hWx0ZtIloPutPPzHcJg9D3fdQdhiUd6n24EMQ9YGEDwgLBe/TJbfNLJNDYQfKzXAbDoM3y3K4/i7G
	78fySE0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDW2-00000000w75-2XWm;
	Mon, 28 Sep 2026 15:43:42 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDVz-00000000w5p-1e6X
	for ath12k@lists.infradead.org;
	Mon, 28 Sep 2026 15:43:40 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ff9621c5dso14851865e9.0
        for <ath12k@lists.infradead.org>; Mon, 28 Sep 2026 08:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790610217; x=1791215017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7u9FRFVW3KTnKbu7qJYW4kd/AKeklPQypIZL2EecgFw=;
        b=ZDp/sHdwHutLxyNJvuAGLuUo2sDoUVtdmfmqHWciDG+syO88rGk3uqOqI8x7m1vOLV
         8q5KHp72nSQxQJdoGT8GmdJ8fGA4Z1xHrDY0FW4RQl5wDShH/hIpMqR+AuonwKo5SewO
         YU+tovkxX+rVLzqnuYW09tsqTETzu5aFhS2jeyhVyiKOVcRp0SjDTMyqZu7DmwaZ8FGs
         w4ybrqtnRkMcpkK/UZJ7l/X+GcttKt9FysMmaDJj/bL2WpsESmO5N+DuC3pOZG6alUmH
         PNsXY0/gjqGIwT7xW5dBRJzH/g42r1Ol6DaZoVZGJK1jxQkjp7fzwaJHJjhPlszxyU7H
         a0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790610217; x=1791215017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7u9FRFVW3KTnKbu7qJYW4kd/AKeklPQypIZL2EecgFw=;
        b=fK8JoDD2VDIp4RO8sXHrOaebPzGEFept0OPA8d+mjDdQvEGBvJBSPyE98Tm5LmusWg
         9ak3bpN+mzzl7hnGEF2xmOotjDcPH/VnRMQUpGZgSbCV8WwtWwRYvqjoIYCygOUiAQbR
         4o1wGFJn31Oko7AmgcZzwdEQP8crvoxTKi13MbMwv+W92P9SS0QZcu3MQo3jn9QPF0rL
         1MTMkN1kVqP/WVjVGeExo5+otvyo7+eUws1Xc0sObC1449L4yOjc15X0PvCNVyskeS2h
         QcCf1+8Eq2ue0ubi8xv47imxivS8Qm4fM4ok8Bu/m1P0RMYeeXlHXuchMv9BkOrqcuss
         6Ikg==
X-Forwarded-Encrypted: i=1; AKwUvBz4HMS8YV/4C4lxI9NJnYUuc5gO84CtJjkcIoDOKJ0WZYFk8LyPY60C9wMCRZmon8d0IdvsWPg=@lists.infradead.org
X-Gm-Message-State: AFuF++n4ZWrRyENoelC3zpmmA3hNU/DulKIKAVIfbDV3xODex7ZLOIA1
	quB1a/+kX3blh6m7FBTBFoqfMffYuI1xUVdhZY8j8IYTYzo6XQ9ORj/9
X-Gm-Gg: AYBFou3Zuxrt5igwrfcpc6pflZlG+trBwSIdrmQPIiVSNs/Jk9efdJIZtESXY+PPr7f
	oWfqafRH0dynnHUENANbNqCBlsFm8GVqbw+Pi1Dj0gy4W8NqcJCB+FAgny0xgPCIw6Oo0maBjMf
	VyZnZJfLUEJkc/HiGnsGfMi8ssREoDIEStmuylVHlkrQXFyxPyGdzw9yoSbQMFHy8whZFWbpn1h
	0IW0bJ7YfDB9KEbKDLgYl/Nkhp5UYDMpcb1rqvaFb/DNaqUdVRJ2GpATGS+tzYkGUdhogUY1pKP
	OPJ4LXp8iljmExzLDamABByRU66Elzeb35bjsUvuAuQl5Pl3mRLIlzmL0jVOvPLBYYRuzpiMqPL
	/IAXVa93mZwPpluMl4hRYe6EyT9RA5L9ULAdZixqLVYHnmX8eAZgfKdBfq0qkuhVXownzbrdiXi
	Oj4v6QqAjlmONlYZX9wA67YGcPMI8vx6vgFeahNIz5RuJYrGty7MwSP54i88+YyV9BMT26qaLsD
	nhW1X2DDTzCGQ==
X-Received: by 2002:a05:600c:8b6e:b0:49c:fc6e:8cbb with SMTP id 5b1f17b1804b1-49fe66f9fe3mr237154055e9.31.1790610216934;
        Mon, 28 Sep 2026 08:43:36 -0700 (PDT)
Received: from mac.net ([2001:861:8b92:2c50:ca1:5b1b:d140:af71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0062de83dsm48611855e9.4.2026.09.28.08.43.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 08:43:36 -0700 (PDT)
From: Benoit Masson <benoitm@perenite.com>
X-Google-Original-From: Benoit Masson <yahoo@perenite.com>
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	stable@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>
Subject: [PATCH] wifi: ath12k: assign device id from the WSI index
Date: Mon, 28 Sep 2026 17:43:35 +0200
Message-ID: <20260928154335.85628-1-yahoo@perenite.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <3cd93e83-6103-457a-8879-bef8521bef9e@oss.qualcomm.com>
References: <3cd93e83-6103-457a-8879-bef8521bef9e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_084339_466919_BD1B829C 
X-CRM114-Status: GOOD (  12.18  )
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

Devices of a hardware group are added to ag->ab[] in PCI probe
completion order (ab->device_id = ag->num_probed++). The wiphy radio
array is built from ag->ab[] and the wiphy device is taken from its
first entry, so the wiphy path and the radio index to band mapping
change on every boot.

Store each ab in ag->ab[] at its wsi_info.index, which is derived from
the device tree WSI ring. The group order is then deterministic.
ag->num_probed remains the group device counter. The unassign path is
unchanged, it already indexes ag->ab[] by ab->device_id.

Verified on TP-Link Archer BE800 (three single-band radios in one
group): the wiphy path and the radio index to band mapping are
identical across cold boots.

Fixes: 6f245ea0ec6c ("wifi: ath12k: introduce device group abstraction")
Cc: stable@vger.kernel.org # 6.14+
Signed-off-by: Benoit Masson <yahoo@perenite.com>
---
Changes in v2:
- Set ab->device_id from wsi_info.index in ath12k_core_hw_group_assign()
  instead of reordering pdev_map[] in ath12k_mac_allocate(), as suggested
  by Rameshkumar. mac.c is no longer modified.
---
 drivers/net/wireless/ath/ath12k/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 262a204..f43319f 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -2029,7 +2029,8 @@ exit:
 		goto invalid_group;
 	}
 
-	ab->device_id = ag->num_probed++;
+	ag->num_probed++;
+	ab->device_id = wsi->index;
 	ag->ab[ab->device_id] = ab;
 	ab->ag = ag;
 
-- 
2.54.0 (Apple Git-157)


