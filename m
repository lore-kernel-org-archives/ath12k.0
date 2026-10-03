Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D740CA5FE3
	for <ath12k@archiver.kernel.org>; Sat,  3 Oct 2026 09:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGUcNzjtQXTGJm0X6jZGQPUmM1QBqOgA+Fbqqq48w68=; b=LHAb0aCwxLQKU6Cv4SEihNDePw
	53YhITwLsgfEDOIihewykzkJTEtE2EO4DhlL4fHZ1d7ET4vsDyW9bgNZhQ+qismlaGMtB2yvmwkGw
	4vzpXJehp6wK/Ff6161IGgZ0tB/cJ/Ky+0Or2x+FNSS4FAg8rEvbCf3Be7JcVKSj/ABigK5sa5vxM
	DwmPMzgV65oBT8VghhKBIzo7MOL8yoD+vNyeyY2Pj88aHY9zmKgX+Jaw67A5PPX3hfnJPe6piDfKW
	Vzpx7wxenlEBjrTSrc7ZO7Ra+VVq382CWWK5NV62/taGf5Z4hk+n8UwOLFM9esEvW7WCh8nHhy1jQ
	rkN0UJcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvq8-0000000DF9x-1Byi;
	Sat, 03 Oct 2026 09:15:32 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvq6-0000000DF9A-09tZ
	for ath12k@lists.infradead.org;
	Sat, 03 Oct 2026 09:15:31 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-48b042e00f7so95253f8f.0
        for <ath12k@lists.infradead.org>; Sat, 03 Oct 2026 02:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791018928; x=1791623728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KGUcNzjtQXTGJm0X6jZGQPUmM1QBqOgA+Fbqqq48w68=;
        b=EW5rZwOJni6phTjTBMt/IKSEi0GFqK6LcT+VYqob4IZirf0B1C/SzRR5IuQYWoF0/e
         AY44wMJ49yBfZ7FtSK/zNSVnBDpmjbZl2Q2aY8JvCYLmCRNyo4fyZf+XPF4AHXCgBuhi
         KBBh11CwReHf5In8IzskF6rZ8BwBhUzJsxAWPqCerbss9HGh67NxEsJNSl2JduC77mW2
         ZtzJdGsN5rV/D9+d245KnrRwXrISH6eClYpZlhzTUVf+QooNG3oM0S2fRzb9nTZvKq+z
         E6YXFf9w+FaCd+I3zhrGjwicO/Prpq/9wiI61Bgp5yW0RYBABsBOG6yfJmnC5E4G1W6q
         mzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018928; x=1791623728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KGUcNzjtQXTGJm0X6jZGQPUmM1QBqOgA+Fbqqq48w68=;
        b=w4Q+FiWsGQRijbE35DWd4RlQaiPPfZfZlqnD6Su1mKe1TrNUoVJRPhJKtlWLk7YMox
         AP6VuvrNmAsmTts5w7nVnqof/Iku84D/nCeUWDm7Tu3GOSf87XprYkewjkm9G3ubNneb
         Lha3+cvc28ZccgHp376NBUzuARYPVP9K0ens8+MeQ+tSwd9gYih08X90D8jtUJKAhDuh
         80sN4oQQK6o3++VVrZ3wSNiL3ZLtGiDlV5OAsiGbPWtDQD0pFK+9NIl+qDn96piQFK0d
         CU1kbTCulxycDjW38C3KeIWzM6ZPvYh2CY/+naBzb3X0e2YcwgCTS4D6MLHTsPCf9Z7g
         cb9g==
X-Forwarded-Encrypted: i=1; AKwUvBx3KsWMYITZXrJ69j+t68JN1P1pLBvnAa0zYBfq8H+Eyl0TPHgmtFDqpiE8dCXUGGGlqZK2kqk=@lists.infradead.org
X-Gm-Message-State: AFq9FYLmZfDW9+FY3o7cXhpzQonIBPPify9GcVOVYDH6MnSIYpTZQ4Dx
	3z1GVIhPKVOgfPJ0cWSdagre855Ma2W7iWsX/8SMMdHtUlTyvWH2P0Hz
X-Gm-Gg: AYBFou0FybBMd7tRgNCYHlvhg/WSJ1DF8RUYpXPXY0dgWEUW1S/JJYvAlKlbqPHZW4w
	zwyAASjXWCo+S/vr4DT+3ZNDSMnYFQTcKlKAKH510i3NaN2faCTUbRWXdCU6vnM0B9jiE3xj8VC
	Or0iQ9vZa/oM4iUbCnAiUCfBerFwosbAil/stYNjsMhClM6qyqNlzEuu8X3czpydxOkUs5Dl5ZA
	QmQhyp8ESHFlZk2gpYiCSnFxz2rfqX93pQE6CaQZjmqqhZZA+acPDq41nC8Hj4Za2D5UTmttpde
	UmIa7scxEtcgPedTP/6qdftQcP9x8IaKuwmazEoku9cVeZCCyiItO1IV+LlGIt7De/Wmejjqmlt
	jUJT8EHPVSpbcgH+B8rk3FlPquhTpLKKa2XZTqVaL2hrCqa/0/YA8AVkH8UO/GRXrymnOrfPgov
	Aylo0AnNAj3VImBxU3pw9iKyrXuVGg5GUW/8h+Ixek/pyU7+CJHYPoFNGOGyXi5YxTC6Il3nN+J
	BTsH/AYGTM=
X-Received: by 2002:a05:6000:26c8:b0:487:35c:6513 with SMTP id ffacd0b85a97d-48b12720148mr9951532f8f.42.1791018928132;
        Sat, 03 Oct 2026 02:15:28 -0700 (PDT)
Received: from FranzSP11.fritz.box ([31.31.60.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253dc9sm11336161f8f.3.2026.10.03.02.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:15:27 -0700 (PDT)
From: Franz <franzelfranzel@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Abel Vesa <abelvesa@kernel.org>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 2/3] wifi: ath12k: honour disable-rfkill from the device tree
Date: Sat,  3 Oct 2026 11:15:08 +0200
Message-ID: <20261003091509.4822-3-franzelfranzel@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003091509.4822-1-franzelfranzel@gmail.com>
References: <20261003091509.4822-1-franzelfranzel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_021530_093897_70039C42 
X-CRM114-Status: GOOD (  11.71  )
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

ath12k_core_rfkill_config() skips the hardware rfkill setup only when
ACPI says so. DT-based boards have no equivalent. On the Microsoft
Surface Pro 11 (X1E80100), the WCN7850 rfkill input reads as "radio
off", so the interface is hard-blocked:

  iwd: Error bringing interface 4 up: Operation not possible due to RF-kill

Also skip the setup when the device's DT node has "disable-rfkill". The
PCI core attaches the node to the pci_dev, so ab->dev->of_node sees it.

Tested on a Surface Pro 11 with next-20260929 and the matching DT
change: the interface comes up and connects (5 GHz, 160 MHz).

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Franz <franzelfranzel@gmail.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 0c72948f3..8cac84917 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -83,6 +83,9 @@ static int ath12k_core_rfkill_config(struct ath12k_base *ab)
 	if (ath12k_acpi_get_disable_rfkill(ab))
 		return 0;
 
+	if (of_property_read_bool(ab->dev->of_node, "disable-rfkill"))
+		return 0;
+
 	for (i = 0; i < ab->num_radios; i++) {
 		ar = ab->pdevs[i].ar;
 
-- 
2.56.0


