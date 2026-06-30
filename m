Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784AFC43458
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 01:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aByZm7jR+8Ms3DdCpAHOVCxrhdh4rHnZilW7Sr7olMA=; b=OfHPHY4OxXQC6sarFgwQLzj422
	UgHq5BWbeHsH/UQi1JWNkjUVApkf9Wk1ihZ0BYfeuaWR+H3RnJULU/M3VmpCNbd5ly0mCW8Z7snql
	US0GzBmcQwbrxGz/3vJTGMKVfCEalIxs30BLgzqvVMSX6PhoZ4OlvZ7fEKBsHfItdTlJZ2NEVzPVR
	n8VNIBVZS96qS+herIKz5t/xcsBPWroCnirk5oFBVxbyeSAiz9u12ssB5tUH/VmbMxt7XzmTuQD49
	xx5Gk4GReH7QzYbpW8ZXJU3cuG8E0nMcVBmM3ImgZau3QNUXSmQNk6jYHgiv0lWGG0w2d0miBBVd+
	rpTPXrCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weN3W-0000000Fdrh-3ZuI;
	Tue, 30 Jun 2026 01:14:30 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weN3U-0000000Fdqt-2CUh
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 01:14:29 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-51c15bf5000so516341cf.3
        for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 18:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782782067; x=1783386867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aByZm7jR+8Ms3DdCpAHOVCxrhdh4rHnZilW7Sr7olMA=;
        b=XujyNNd4b00cHpU8ZMbicc+BvmuYqQ1dsOmO/O1KoCsQyW9qvgi1gEqd+v65FF6vLm
         NQZ/jzao80BJgvT9thPWt2Ecd7np5OoY142tE1v/kH3Penia8MoSuHnmIM0X2NUin6qz
         nkPt3UDv+eFaLaUCmb57+3HxW/nbbFiNMb5QVGnHukfAlgcrlLnhLyHZyyDKIOq5QaQg
         jDp+rywWdrd6LbofmeGwryegDH2v0Pvnb7hXITxVQn6rh2+EiGe2sC3QT3Qer6scxdgo
         FNTNY17ycHko4GT2Klm7NIeGyWfioRqfNXREUUSdZpuVTxtvcEQJkdCRTZ4lwoDVTvc+
         Kriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782782067; x=1783386867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aByZm7jR+8Ms3DdCpAHOVCxrhdh4rHnZilW7Sr7olMA=;
        b=bKq/6OXZYcfSWVJiEzFUMV8MMxCKKr7us3eAo1qjumjIu0sMuhgX7OXYcNoVpnRLoN
         nJL5hTesWOCTLArDfynQoK7jQBzUfNF6FI0RAXwJor5Pl4L3TyyBG5YYBj4r5bnuiShG
         R2KO4ZThQ6qEEHkq5OFWcTv8gy1sDiWSxzmWIjl8TsVILP6+dIkb1kTVVPa4lUjhStlV
         BiPp7zX4IUUkCKR/tYPHW99sk0CnVhT7o/C+jjlFQCNqydOM/2eNbJ17Tv50sfrHa8mI
         ZgSmyr+laP8YCGQFLalizmDuwpDxuKJlL+LoUJYmo37J/+ZaWkt/3h9TJGRpvuEcq0Tx
         ci/g==
X-Forwarded-Encrypted: i=1; AFNElJ+E2BNhsMmSUEeRLqVyu/1ShOykfUx+aAdETX0D4rj2RnU/kdso+hb1LFpZGeK1be7GMF/iWRk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzsaDGNSloijFOVcQbupyQv79SezEc5aBVHQGPmAYb+mPjkhoN6
	Uj0m8ABup3+yZf364uDHzoTONda4qrmdz1SZTueZYWgs9IwZyNf/EPD6
X-Gm-Gg: AfdE7clOAjxh1noPKjn0/X2RlGbULJGUsx2XX8G3RD8MY+7ORoPCXb8oQPEzhXn9lq0
	gsNjgTYIhM4boWRYkXNx8VLXOmiYSgJrBtTtmWHjqeVfqBd35HwTb8ejYaWZ0YsTf7rhtzRSKSr
	oy2Qwuy40fqovqSJeRJRqaIzRdQxRAosV8TcEFhMrvR8oMxN47ZFlrY7ju5fUt9gvr27ADoUtlA
	yLa0JeNETgYSLQ1sLzReTYsbpmcJ6NQDuAlbvK0IZ45MP+Bany44tVE7Qf6iw5niescXrtVfbH4
	SBlJpWbOUAMw8t50htfmshnJQr7kLJ5TIUe0qO1TS+Vyi5rIRjQJLZW5StDCthwcVHA8y56+GJ+
	I025dpIdAdn83Oh1CsF67/M1xKS34cPDQnJy8zJA4wFgvd5tts8WEYVq0p6ipvGmKovP5qnsJZG
	euLqTqsaOTO++4HwByAxxNqGls08ebIZdXqM2+77x6N0X5yA==
X-Received: by 2002:ac8:7dc3:0:b0:51a:8c97:9383 with SMTP id d75a77b69052e-51c108ed505mr23903811cf.58.1782782067209;
        Mon, 29 Jun 2026 18:14:27 -0700 (PDT)
Received: from dev.lan (c-75-67-38-46.hsd1.ma.comcast.net. [75.67.38.46])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-51c1099aca4sm7719801cf.17.2026.06.29.18.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 18:14:26 -0700 (PDT)
From: Andrew LaMarche <andrewjlamarche@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew LaMarche <andrewjlamarche@gmail.com>,
	Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 2/2] dt-bindings: wireless: ath12k: drop qcom,ath12k-calibration-variant
Date: Tue, 30 Jun 2026 01:14:13 +0000
Message-ID: <20260630011413.1424654-2-andrewjlamarche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630011413.1424654-1-andrewjlamarche@gmail.com>
References: <20260630011413.1424654-1-andrewjlamarche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_181428_573826_15CC0D88 
X-CRM114-Status: UNSURE (   8.86  )
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


