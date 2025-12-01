Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B741CD111A8
	for <ath12k@archiver.kernel.org>; Mon,  1 Dec 2025 01:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vBWJ3jPxPdxJcqHzl2HAKyWXdjwinH4jPFuqseBeF4=; b=uDRcA7azp8SlgOYgioxMF0Ib4g
	ci14aid3yb3hxC/A/20glGsSOF5p4Yw+ufhm7y1ZyF8sfa23OUcdqdVrTMQRcjafvkmpFjtkDqpTQ
	hke9Os3U/H2Bmko26dKKyibSLz6h110UpBPWmNsCDMaFyhrJl0FkdvtKmx165VuPSZfZhgtZk/F7Y
	ab45LqNVfOspJMTHI3Qpz3kogR7PbwVHDJ8g9rMEiFq5RnS7qiRENqjiawnrBrwrRnvnrbFK+b70x
	KZIedciKy7YAi9zmo8vB/FBYwBm8AylG+InJ8k67BpGoKH1mzEknxH7Jpus6XutNtq0HQpavADcR4
	IrMrTiPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPsWK-00000002juU-1iSP;
	Mon, 01 Dec 2025 01:16:04 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPsWG-00000002jtO-2EmF
	for ath12k@lists.infradead.org;
	Mon, 01 Dec 2025 01:16:03 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-477632b0621so21286245e9.2
        for <ath12k@lists.infradead.org>; Sun, 30 Nov 2025 17:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764551759; x=1765156559; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vBWJ3jPxPdxJcqHzl2HAKyWXdjwinH4jPFuqseBeF4=;
        b=FavBhWVta/QokjqnmrYjQ8xn9oqDGOWVdFGm29tJLccYthpRY0cwIrx3tKP+J04L5L
         ooRre2g0mZdhWVUEQ6ylFClL9NmmDn508x+nGlGM8taqawOuAR3s9SxJMgGdTdK729ID
         mWP3HKsGKAKvFAzuoQ7aFZ6DQ8y/fZ/C73eLZwJ+zrRcueQoYReRNKYFz98ur5VaSHUp
         0QJSQMo2EuhfphahYn/1ehuZQfyaAVkdg7oAoVV8+HUA6spCzhpadxqV1I0rnHhE26U3
         3R5bVUapyL8iM4Xr8/htZcRas6o5WjBLM0xxF7/0h4y462/IUAtaYNsgOiJXmm7fFXdy
         c74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764551759; x=1765156559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/vBWJ3jPxPdxJcqHzl2HAKyWXdjwinH4jPFuqseBeF4=;
        b=w6HR6oKHt/UyX8WU1Mb4KfWUZJvW3bYWmXhaihiHQFqnTeoX0xPsvNG2rWYRhzybWU
         KmS65jfNCEvWi+7/hjhiwGHN/NVpr6986bpWgVa9VMMPL+Z4n6Q/TOCTq+sxcahs8tWM
         UpdMFfeK9i/19FEdtmft19wtE6Ty6bS6/DeGLvXN7PtpgtiTfeN2dincxJFH/XkuLXrX
         EElvjAyiD1qfJtL+y2kkgoJ1wd2F3zjEHPQrdZuWNWecxYnNFOMjklk1tACwGM2CzmZ8
         kFRzAY7l3H3KN7UEP7OVOzPKRFcX4aHl48k+IpJwf8Y0kEVXqKtpyiUUx8HzyfQXlFuk
         rPQg==
X-Forwarded-Encrypted: i=1; AJvYcCWORSWrZQ2Nhjke5hZ47YpA+citkGrBj29x/FaCcUjnZHrTaYH90rImXmmJNKFoVLKh4FEiVnQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwiXknblGxlIrlKY9L2uWf7VfSzAaZF+o1ssXwO8rtpalCrEUke
	i1+EArpQo4lwFllqDCHAUojy/8uUqJhJX/qIKtO+Ry8AWeZaoJ4pHfQ0
X-Gm-Gg: ASbGnctVckSBe3xbZu3+WZrJuT/xpZqGQ+Twi5WZm47uXZ03Ze2tYbJ+2P2CV0XOyil
	7xsvHvbQpGt48N2fzNc/01ECY6S6679oa+b31njjcTSDGTdE7P6aTIdrKK+gP4aR4i/r+ooyfWA
	VdDK/PE+vQ/elOdVaa1DSiBCmm3xMtHlO3YHaQHoCQIIjMIqekA1i89+uKFgkZEf/cqvyASqaPz
	iIbHGZ4O/VvGbCZv1dZg52FkXWa2ZWYZixApNX5m+eDrtM07ulVOEu1vm7m6/47Vy51Ll2sx84F
	K9QYFZ9hq/+qS3DrQje7MvqU5xmCMWgsjFelKIQXdsOxGfepY6iBsmszHU1j2LoGrf1rYO4Ef/u
	V4mhIv9SpAKp9lCIYTdy+1LSjGc9UhjMhmC0tH1Zz4S+3dANaC0RQPIuGyR0xsqI908r5zVdaCs
	eXJbENSoH0bxpvqAG9WTFaB+0+gTCkR6wL/WBrUNomqmKa/ah6n/tIzQ==
X-Google-Smtp-Source: AGHT+IHPudKEEX4VAjuHNzkSbk45c8iSpRbQfuQpSIb3ohjq0wxflc5C6EoWRIJcTjRDZbjpyIxAHA==
X-Received: by 2002:a05:600c:8b35:b0:475:d8b3:a9d5 with SMTP id 5b1f17b1804b1-477c10d6fdamr360907655e9.10.1764551758470;
        Sun, 30 Nov 2025 17:15:58 -0800 (PST)
Received: from alarm (92.40.200.0.threembb.co.uk. [92.40.200.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479110b6da9sm216152305e9.0.2025.11.30.17.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 17:15:58 -0800 (PST)
From: Dale Whinham <daleyo@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Dale Whinham <daleyo@gmail.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] dt-bindings: wireless: ath12k: Add disable-rfkill property
Date: Mon,  1 Dec 2025 01:14:47 +0000
Message-ID: <20251201011457.17422-7-daleyo@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251201011457.17422-1-daleyo@gmail.com>
References: <20251201011457.17422-1-daleyo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_171602_204772_8CBE1F9A 
X-CRM114-Status: UNSURE (   8.34  )
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

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

rfkill should be disabled according to the Surface Pro 11's DSDT.

https://lore.kernel.org/all/20250113074810.29729-3-quic_lingbok@quicinc.com/
has added support to read the ACPI bitflag when ACPI is supported.

Document the disable-rfkill property to expose one specific feature
(DISABLE_RFKILL_BIT) for devices described with a DT, so that the
feature can be disabled.

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath12k.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
index dc68dd59988f..be44b1495ecc 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
@@ -54,6 +54,9 @@ properties:
   vddpcie1p8-supply:
     description: VDD_PCIE_1P8 supply regulator handle
 
+  disable-rfkill:
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.52.0


