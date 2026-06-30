Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF58C43458
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 13:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aByZm7jR+8Ms3DdCpAHOVCxrhdh4rHnZilW7Sr7olMA=; b=Zdpq/MOV9jyKcm8ZMJXCC5nkNf
	2055zWAUyLmX5UueDYDLnnJbScAE1OTe48Vp935eFE/p/3FjA7Nh67ZmRqKa0kYdn08PRNXH9qdtT
	ZyfashKqqPA/e7oTwkNBNevDhknJZQumxy8/KcyN6d18i77MuyqWsA+6Glh+wgDwJiTGEhAO9d67j
	x1StO2rAuB8d6SldQUgo2PGbjTw5YhLmNoOmsTtIZvmd9vHQ1Kna7LXm3pZVfkUmaHDqkl9vQR124
	T/I2uG2ZAtoF7QuDXdizKPDdjBvtsCsRRuMg+akw7qtyz8xfT02jXZ5xDaNhukLeEvoPhh8wnxXsU
	6DPg4k5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYXh-0000000HANr-2Oll;
	Tue, 30 Jun 2026 13:30:25 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYXe-0000000HAMQ-3tB7
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 13:30:24 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-8eff5ce3b95so20528186d6.3
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 06:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782826222; x=1783431022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aByZm7jR+8Ms3DdCpAHOVCxrhdh4rHnZilW7Sr7olMA=;
        b=ep7Yrpa0yfCvYJi9IKDGNEGE4zmZ9SWjjcKTbVMCog0UPQxbSqjRa1yCH9mLQtllD0
         t1rLVPFCV9lzbWFAShq5x6N1DPmWRykMjP5czpQezKc+WVfCE/wIlvHpzjktcGgJEbhJ
         ehiv45eSnw7m3irkkeBcIj3sfukqH5lSTYyRBgLh1Wm3UUzaI8jjMFdapEXrK+udq62D
         /Swu4lqBrKfIeoWcjGIzLwzGgXz7hbNlNUObVAO7ExMB/wJ7l5ihk8meDuUCPA6chkfI
         F8WJtAz3vbqyahDvM4WtTir9fFicWhZnb4ETjZDxGVNuS2brSbGxb4h/mpsRdz074p93
         1Rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782826222; x=1783431022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aByZm7jR+8Ms3DdCpAHOVCxrhdh4rHnZilW7Sr7olMA=;
        b=CdUfc5G0PXWB2lyKiooKh5ug27nioxg7maJ4twboL0oPslAR9gn5R64VjdO4KbSXn2
         NGOu6oGLQJZGvgmTJY3eNihczH8K+0v+5iQaftxMKU8UEnF6YKC/7ca0fs5yVF+1P4Dn
         zQCmqzST6sEu8ONNmaa24psiT9m4cCjXjpQ/fOM7QhLi4Wx2zSqikywzjiW+tpl4qCrp
         LTLBrM0Hyfuo+TTDkQ3UgjbNvqx2wsucyKuQjKp9lJna45DkDZq/8IqeZF1/h6qe2FlU
         2wVBbYvoKjAC0Ro58elQEzTT1nV71KbYdZpt5KPpJO44/90gtacUaVeHcF+jLXaM9JPA
         zuGw==
X-Forwarded-Encrypted: i=1; AHgh+Rr9ZtBPbualtPBdMh7HVuk1BVlQx3colGfMfgaodZ7TafH+TUKNrDbJnGl/cPQ8DdeR572xPk0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyA2nwCPG/kCTik+jO7ZOvbpTRtzz78CQV34I6BpTWOyFgA5JYL
	PT8HMLVPo7GaHxUgRgmJDGZ3LNQoRYW8MBurbiuyvd4VLEDV0vxQisyh
X-Gm-Gg: AfdE7clez8l3vNPWupgcQYLfyjNaGSB1RZe3x/a0sDbuv5LbFfHMX/TrF41wCmxiQrs
	dcHVo5HvXHil+zgQOGwbcNATNaoiZppmQqS4fnz+b8toF7NBW2kGhdTn5+n2F21MeZ/ps8MD4RJ
	FutgjNr51DXcySIrC0qWBP7VyuV8VQr9rIMPmvCEX2bawbddwMQjiJ5uxINS68OrkwhyYAftqqF
	vIObRyWk/sQ5XoTiHwunH3eyePWFtZ8DVnMvQEkEydNyl7/T5xYkNw6FenRzHFwgJFqpqQwxsKd
	6cX7M9xT0Mf3M0/jb+A9YlSgQhAlzdkAcgcDOV6o9dOJQcAftPGDvqt/PIUrFyGBzJ5FDX2Wy7N
	WsEIDwXdngtwen6w15FArO7xA1os4Q+6j53K7lhdLJcXo4gWKh5YZC6DRwsgQ1sp9n4f2394YQo
	qXi0nYQd33NAff7K4qQzyYmflmZ0/xY96BbrpMUogDmI8Cug==
X-Received: by 2002:a05:6214:12cd:b0:8f0:b75:c4ae with SMTP id 6a1803df08f44-8f1b8e6ad8cmr36969156d6.9.1782826218110;
        Tue, 30 Jun 2026 06:30:18 -0700 (PDT)
Received: from dev.lan (c-75-67-38-46.hsd1.ma.comcast.net. [75.67.38.46])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-8f1a7b26b2csm23003536d6.45.2026.06.30.06.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:30:17 -0700 (PDT)
From: Andrew LaMarche <andrewjlamarche@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	Jeff Johnson <jjohnson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew LaMarche <andrewjlamarche@gmail.com>,
	Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 2/2] dt-bindings: wireless: ath12k: drop qcom,ath12k-calibration-variant
Date: Tue, 30 Jun 2026 13:30:01 +0000
Message-ID: <20260630133001.1426824-2-andrewjlamarche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
References: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_063023_013598_224F8F38 
X-CRM114-Status: UNSURE (   8.99  )
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

The ath12k-wsi binding documentation describes using the
generation-specific qcom,ath12k-calibration-variant binding as well as
the generation-agnostic qcom,calibration-variant binding to load
board-specific calibration data from the device tree. However, the
driver never implemented either of these.

Given that no devices currently supported use
qcom,ath12k-calibration-variant and the previous patch implements
qcom,calibration-variant, drop the generation-specific version from the
binding to prevent future confusion.

Signed-off-by: Andrew LaMarche <andrewjlamarche@gmail.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml  | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
index 589960144fe1..fa64c8aa56f5 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
@@ -58,13 +58,6 @@ properties:
       String to uniquely identify variant of the calibration data for designs
       with colliding bus and device ids
 
-  qcom,ath12k-calibration-variant:
-    $ref: /schemas/types.yaml#/definitions/string
-    deprecated: true
-    description:
-      String to uniquely identify variant of the calibration data for designs
-      with colliding bus and device ids
-
   qcom,wsi-controller:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-- 
2.43.0


