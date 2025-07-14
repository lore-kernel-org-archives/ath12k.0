Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B291C83F1A
	for <ath12k@archiver.kernel.org>; Mon, 14 Jul 2025 18:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/NHhBLuDbQC85igx5PNLL+bdPfiQETJROiq4RU4vuc=; b=D5tmDMrkGDswsfHJmAvcH+SUQl
	JopIF2pXoKP5rwaSqKIum7qpmFLRY4WRKpcvrnKcOyeJlCkeIIxXtCYL9aT6C65PbjAm9/N1gqsuJ
	QNB62pfitwwnNc1VlMiJog46eGPhvtDyqV6v1qL0mIao845cLRGf+TaGkl6AhqQyNLkVpDo2ZjBRN
	/t69FG4dk88+afm5JzTTiWFP9obXHST2RfnxUz7QTXXJ9SfyEDCzwbi3Rqj01ifpW/Jq18e8R/gFA
	2eWYZXYqZRHuLaoRRnL8FRDg57F8NXGvjBgZ6C/45uDiZtUvd6+WaGob1Nq8fKW15WS+Hd8A9ftkT
	RJP5O0Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOFw-000000034ep-3wMS;
	Mon, 14 Jul 2025 18:50:28 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubN6U-00000002yZ8-2qm3
	for ath12k@lists.infradead.org;
	Mon, 14 Jul 2025 17:36:39 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-455b00339c8so21957955e9.3
        for <ath12k@lists.infradead.org>; Mon, 14 Jul 2025 10:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752514597; x=1753119397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/NHhBLuDbQC85igx5PNLL+bdPfiQETJROiq4RU4vuc=;
        b=JijHJwvZzS2Cru2tefAohO/ygsrKTg8ABZka/M7aRY+xZhh+yxVe4LYfcHzVBLiDM9
         J3OBfr0L6kGGrmftVQ73PyopAxIZRWqMCTBMWgD7/XGhfNzKFcgBuo9Wuyd32d+PdNxF
         Yg2FcFR84A8epQNaYbg+St3mRixNN+y/soOsOfv7rqqGl/Acotg2WBMhP9MaIBAggNvG
         KWQUv9pkpVn9E/pWwZzx212bzu028QltcMM6RkVa5UuOtACUq5PYHl76BB3sizQxeWw/
         xmRQTY9sIQCTmk0Y0N44bR1o6JmtTbcLYboJvaoVjKmCNtGxexJum4LZ9G8G5Kio5MF1
         JsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752514597; x=1753119397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/NHhBLuDbQC85igx5PNLL+bdPfiQETJROiq4RU4vuc=;
        b=dLil31KghUC90T32qCVifbSLz8WKRPLrDvye2v6D4ZsiXK7xK57Cavx43Ey33elk3f
         7SZW67AtNxJHIqNy1JFEbM7UEwAnJ4DRPMaA/GC1IeIQs1Rp8Zyb6NPYK5wTuWX6n5/X
         y2aAObmdMVs1Xdne1RN8MDLZn/Cz/hEPj2PHAqhiNZPwgl8GshQOLefkvdElmYJbXFyf
         6yblfDxwIt9U9T7QKgDMmX5OT0dQ1EmNk2rBbj50hlu15/qKKcR+E7cADJ3BDc7++PV4
         Gt9nyBrt9t8Q2hT1QEShBWMDWYEl61OyhXLWp3blc33oWrkVrdK85TIsGApZgCabFJt8
         B0Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVy1E9Qc0pzje+andFTqX1lhh0VUSRyOqBYaRGfCqUEQ2Wz9aaSYBYrR2zIQeeqtiBa4SzEqnY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqgb2lB6CucV0z9w6LsmPv5yeL/XLYcR/Ukbs0o5Kx94dyXs66
	5WC3qwBISovEg/1332RvlqqIlEBIKJUCxxq/CmWn+2zkYBe+pnsfq/xPRNPc78s2smU=
X-Gm-Gg: ASbGncukxrBywDwPxN7/Ym9XCG9v/dLIUFs54+IlkIo1eJGb0zqzoNvsY8XibIFhHja
	x9nbD/zEqA21IQKeQVyeFwwKn+4O2ibrB0lHQY/b5RUhWQWAhzFpbcQxrEfFbLV4IUPIOMO3npL
	3SadMWPsEvXKAJ6vouCXJmiX2XPoMX1HO96QF/MVlJA0NHC5pgM05h6ZPjcCWSMpDWa123SCZff
	m9vOXM2OV0gfGSjdAYrojE/rMbrrEtlhJ7kI2aBFwk9pZJGAq0Mc3YPZR1JPBqgj29C0cwwvU21
	RlPRP7LdFgFOAo4Zg9EJFNtMFr99sPWgkHC6/Y2Ee1ZMar/V9fN1VboWiY22HckQsLiH5NlfaWB
	yhSkhHr4sQJQ0T9HHYbgROIFiV0FD0EZ1GBubc0Uu8KwHdQ==
X-Google-Smtp-Source: AGHT+IHuJn8kD3q+6JLMG915sldZVVMLWRV6lbHRgVZd2dkQuekCTh7DL4CuETxuZNDsUcz9P/VGZQ==
X-Received: by 2002:adf:9d8e:0:b0:3a4:dfc2:bb60 with SMTP id ffacd0b85a97d-3b5f189df70mr10700130f8f.26.1752514596667;
        Mon, 14 Jul 2025 10:36:36 -0700 (PDT)
Received: from alarm (92.40.201.95.threembb.co.uk. [92.40.201.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d872sm13152531f8f.60.2025.07.14.10.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 10:36:36 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Dale Whinham <daleyo@gmail.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/9 RFC] wifi: ath12k: Add support for disabling rfkill via devicetree
Date: Mon, 14 Jul 2025 18:35:44 +0100
Message-ID: <20250714173554.14223-9-daleyo@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714173554.14223-1-daleyo@gmail.com>
References: <20250714173554.14223-1-daleyo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_103638_716594_59786CCD 
X-CRM114-Status: GOOD (  13.52  )
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

Some devices (e.g. Microsoft Surface Pro 11) indicate that the rfkill
feature should be disabled by means of an ACPI bitflag.

If ACPI is not being used (i.e. booting using a devicetree) then this
property will not be read and therefore rfkill may be enabled and
the ath12k will be hard-blocked with no way to disable it.

Add a devicetree property that allows us to disable the rfkill feature.

Tested-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 0b2dec081c6e..42a1d384457b 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -43,6 +43,9 @@ static int ath12k_core_rfkill_config(struct ath12k_base *ab)
 	if (ath12k_acpi_get_disable_rfkill(ab))
 		return 0;
 
+	if (of_property_read_bool(ab->dev->of_node, "disable-rfkill"))
+		return 0;
+
 	for (i = 0; i < ab->num_radios; i++) {
 		ar = ab->pdevs[i].ar;
 
-- 
2.50.1


