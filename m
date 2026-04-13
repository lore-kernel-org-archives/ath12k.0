Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11DBEBFD16
	for <ath12k@archiver.kernel.org>; Mon, 13 Apr 2026 08:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GHxu1HbYuLjw28rCxRqK7pnt91C7nOV05qM1NN7rF10=; b=OVnxhluYRU0+zOQwYbjHwvXEeT
	43HXZh6whHRX0ytNekltsF0JgBbTLhYBQadNeWF2OBoH5vIlMghK1/EapVr3aGkBT1tgcwzUhRgCt
	1jL8l0W2Emjqgkl+qTAN5IN5p1vyc/s31vnxs4QGYc20eB9NZNt0JAsThS4HrrB0YX6GftD7F3nxU
	LnfB9wcoN5owcJ7VXnYmg4UWixzODPBNO0ESw1nOviumXVQikJ1XZKbS3kV1kS7DxAnpdCTnDZAjJ
	dU274jWxnosCr+W+7C2Mfi11LeqhGOCrr/fSseUro3Sw86fCtEmQwS6fSv12tTIBguq/V/hIhqVfc
	HSkRh/Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCoD-0000000FHjh-1MhV;
	Mon, 13 Apr 2026 08:38:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCoC-0000000FHjR-1zU1
	for ath12k@bombadil.infradead.org;
	Mon, 13 Apr 2026 08:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GHxu1HbYuLjw28rCxRqK7pnt91C7nOV05qM1NN7rF10=; b=i1T18Hie2Y0qxPMTvdFcst8AMQ
	+A4Oz2AbGFQvGNYwyxCcKOgPmNqCbirApVi1SuKsBX8I7mfRpPiWN/HAditw03paiNy5Ts3sf6KNe
	H2n9juGO0aO0cRtdIEB7cpDIQANw1JYaWCvnS7PTcyKfwq34CZE08g1F0hP4zANvbVk70mT606+ws
	pGT3AOpbEIrqVfvsTyF17UtbwuADrpf14mYEd94r2wU7bjkTtm73Z8Hh77TqGZtwA+40FfTA1mxAW
	ReR8HAjZN843GySK21WtlOZoxdEAu2rTa//rmGt60l/oftLI5AV34hhC+miHC/oxU5dME+YnaGDkX
	TBfwPgsQ==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCo8-0000000GPU8-2k2s
	for ath12k@lists.infradead.org;
	Mon, 13 Apr 2026 08:38:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so38596875e9.0
        for <ath12k@lists.infradead.org>; Mon, 13 Apr 2026 01:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776069490; x=1776674290; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHxu1HbYuLjw28rCxRqK7pnt91C7nOV05qM1NN7rF10=;
        b=W9u36rnaokh9N8XprwEnpf8nYW32iWnv4MFLqPUNS9dQ9sCeorUCpzlcf9mTC4irTp
         Jv5HXNDwN8aUk2TG4UQdrR+9C2niQoeqPyRqhtCq/dtTb/P+DonPJ6gmx6YjZFtgCVRE
         4MNWGsLsgCy4GYRcDbBDQ1l6Yxk74DySFFXlfqGw6bLkPc4cfJEccUt7TdyqF0zq62qX
         MskRkl+itDDglO0ULglcIeWhK4iseWL0b2H2/6Qd9k4XFDzjwCZNHiCqX1ZEhpJ5As4f
         Zn87q4p8gx9OPCodEGk3iGnsVC51sz/4JvNnY+Rc/49U5z9Dgte8kiO/UnqVQp3T9JqT
         yoOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776069490; x=1776674290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GHxu1HbYuLjw28rCxRqK7pnt91C7nOV05qM1NN7rF10=;
        b=LREqqT0jdeIc5ffDJvsjPIKKQncfJt1vlDTLsIAoMqLP7vvLRbbua3AQSIb6quonQJ
         w5ocCiRGILOt2qjEKxRkcqw1kaUWjrkQvlLKno5h5dM9luhB8H7nqdoWGnyKzI6iJyhm
         X1W4/b60x2G2g5YJRlQJtd+2h1AZvU2Pc3RZkHRJl8e8BmlB4DhqpWbWSTOXGUkMjOYr
         RObM3f4b2lEnrbxkoE4Ik+ntuEq26gFYrLj80lvS4FL3CPhcgA9wQ4uzp/MCSFjriKUh
         IAfd7DBDmLrOPyETQ8dGGHF3VilIECx8lS0P0CsDZU/f8hKJLMcL63BMKdYMd28Eo9Fg
         Lpnw==
X-Gm-Message-State: AOJu0YwuRRQfgViw3IdGCI/a4ZeSLL1qIDqGsEX7KugFsOkbuw8a6mzv
	ZstoqwWGRTdo1MP3i+OlJiduThYaq2YnaDJNyKMI3MFirbgV44y+MqcuXzuhkA==
X-Gm-Gg: AeBDievSUIATdx4dcZkNYof/Pre5j4vPH+9kew46zYQXZIwy0G17LIc6RwaxURDfMvi
	4AgT0doH6n/fMUdFVMu5KFmKdiYz7FKVZlKMfvTBJMq/SotCmiPK+3nI/cXBvyTJmTSm0kWf3/0
	i3KmGNUoLl4W2H+c854LPhuj91N9jqUBBrK2uMjE5+GODJXnh1spcmOxn4nATIxQy5EGUO+bm4J
	P80EORb60KDH49tHgzAjHjAym1J++vB7kBW0zdhBtGwNeLGkyNTOqE81bghdbxAl09UI1coVOvB
	6rZYFmwYKwVX3XsqHmb5d3/cUcHB7fB1z62Z7XRCEShASJC8MFIzJyGN/SbEn1XUAgQSsWYxMyC
	0EWI8+QIVNAy/hvVHfLqMuYQS9CRCzDuTXl1G+y3VLpKkiIaed4UJ70tc4lF7wF9LdLqMT6EG5l
	sazy7wYRxPqFJ+znio8d1LyfONLgqAxrWnbG/Hg03+4evzmPiL7FhQpkqV
X-Received: by 2002:a05:600c:c0da:b0:488:ab5b:d711 with SMTP id 5b1f17b1804b1-488d6864b6cmr134710975e9.23.1776069489680;
        Mon, 13 Apr 2026 01:38:09 -0700 (PDT)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67a46bdsm139406055e9.3.2026.04.13.01.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:38:09 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	maharaja.kennadyrajan@oss.qualcomm.com
Subject: [PATCH ath-next 1/1] wifi: ath12k: avoid deadlock in thermal read
Date: Mon, 13 Apr 2026 10:38:07 +0200
Message-ID: <20260413083807.1727905-2-nico.escande@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413083807.1727905-1-nico.escande@gmail.com>
References: <20260413083807.1727905-1-nico.escande@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_093813_725409_C83BCCEB 
X-CRM114-Status: GOOD (  12.47  )
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

When removing the pci device we can have a deadlock if we try to read the
thermal sensor at the same time.

This is due to the fact that when the wiphy gets unregistered (so while
the wiphy lock is held), we wait for all sysfs operation to complete. But
if a read of the thermal device has been started in the mean time, we need
to acquire the wiphy lock, which will lead to a deadlock.

As we already have a flag indicating that we are currently unregistering
the device in the hw group, lets check it first (before locking) so we can
bail out early and avoid the dealock.

Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 drivers/net/wireless/ath/ath12k/thermal.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/thermal.c b/drivers/net/wireless/ath/ath12k/thermal.c
index a764d2112a3c..700e7458ddff 100644
--- a/drivers/net/wireless/ath/ath12k/thermal.c
+++ b/drivers/net/wireless/ath/ath12k/thermal.c
@@ -17,9 +17,13 @@ static ssize_t ath12k_thermal_temp_show(struct device *dev,
 					char *buf)
 {
 	struct ath12k *ar = dev_get_drvdata(dev);
+	struct ath12k_hw_group *ag = ath12k_ab_to_ag(ar->ab);
 	unsigned long time_left;
 	int ret, temperature;
 
+	if (!test_bit(ATH12K_GROUP_FLAG_REGISTERED, &ag->flags))
+		return -ESHUTDOWN;
+
 	guard(wiphy)(ath12k_ar_to_hw(ar)->wiphy);
 
 	if (ar->ah->state != ATH12K_HW_STATE_ON)
-- 
2.53.0


