Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508C3C43458
	for <ath12k@archiver.kernel.org>; Wed,  1 Jul 2026 15:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b+NRBUp7hwQMTT79ULwyBxmmco53fwj7wXNTwiWQiWA=; b=H3Z3ffd+yhSbk6oKetzCcSIiS3
	LJCeEvvrjQzMIe2GP5LIjQa2agJBuS/LJnxz/P2oO0BtfKXEOH9obHqZ0IWzH6uplgxXCip1gC9QL
	f+P+Z0gPUOr2rk4rNAhWcGASxG+Y2llAl8YSnkP0wvWFVgjJ79kELIGGdOU7ixyTzE0ELZ6ynHTXL
	yyUG9eS4t2W1zdKx/GbyMatT5nCopgqiricgLwq+AEbs2X5BP9uecX2bTfembPJrEK42kqpGsMEHc
	7mvadZvkVfNEwUe6O9K+fX5LyT8AYrjNjHRDYCBk98uOZxkDrC1826THjfntM1ECpDYYMi2IbKQ73
	s2KAevyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wex5J-00000002QCS-0G6B;
	Wed, 01 Jul 2026 15:42:45 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wex5G-00000002QBe-3bAf
	for ath12k@lists.infradead.org;
	Wed, 01 Jul 2026 15:42:44 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-493a97fad2fso7053715e9.0
        for <ath12k@lists.infradead.org>; Wed, 01 Jul 2026 08:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782920561; x=1783525361; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b+NRBUp7hwQMTT79ULwyBxmmco53fwj7wXNTwiWQiWA=;
        b=ClyO9vnjwVKT6wgMobyhRjQUcl1cNqiOCJDQoGoTABCLhuJA9GeACEPpkdI8D/tX9D
         PUC3Xy4TuoDou/q/DHkTBomGVyqvVSdTXWikihHCztxPzj4v8fq3cudHyCYKb5IiQ3B4
         POUiW/g5xnSQJX3or8jjmjcwf1eZjEzTb1u6PZ+tBLrSkwwb3w4F8PU8AJzP2MHBxLMH
         Qwb/8uubPdYbQCr2XlreVdHsO0fvd8U4L4YFdf10AywxQbh4u8js5xLH6tjjsGAfDzUw
         Dmkh5ZNIr67KLZz//E62wEfsFc/NvYNdTaIUCUQzMUbH9ZsJtOSpww5kwb+Zbb8eqSjo
         yiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782920561; x=1783525361;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+NRBUp7hwQMTT79ULwyBxmmco53fwj7wXNTwiWQiWA=;
        b=C6XXb2io5NQyLTOiq++gCl/832PnPVJb7YycdQVBrKgo+lOm8E0HbnLx3DLe3hO9A3
         x2MuDu1jK2GxRnzV98s6NIl5IrjUCS4SRx/jC5upl9BLWOogIzWL4c4pJZSpiYCv7mmZ
         GoQSPy1SDHgHVEsmx5SqveQp44YQVLEIH0zWDUGq6gECbuuPpS6NSzHuSWQbVllr8Xv1
         o2KA7+apUzPLCfnvZ/65pM60+JRQsJulAo6wZWfIQQf8RwP1IJ6QY/Ilx+s6p6PvQwvV
         1oaqr4RzaUhqt+/IcnPz2gO84vgrbAHXB4PxdIHotJRcPwLDd0xE58OVfBZnxEPLgZYc
         qcTQ==
X-Forwarded-Encrypted: i=1; AFNElJ8b1whZhK1/yekIqbrGjdRnT+eX2HDgjpmzmB59qAR9Lq8Q1d5zNe1f3Z8PnHPw9q+QdeJtT9o=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywun/0A0F80PfHNqA8FmrJghibxWxLAu/kMrHV697BpRR/O9BoS
	cTtMTn/nOD+E8RuD9dJ228P0jLGkf5Y5rD+pUBjHzfJKt3LqudKt9Hr0EP61E0SY
X-Gm-Gg: AfdE7cmSS3KEp5YWxL5KRuLJ3UvmUQ6HIZX2sbTUrrczUdwxm9/D42wko9HoiDiSVZS
	6u1oWjoPO+zWS3HhO+4f46b+bhEI0+6fnTIX4m1f2vD+HZNN3iQPImuN3F1ungc6H/0zzmlCRbK
	ypiZR3f0ePE7lmOHhRBBI9ip6efgb3K85jgwZJtm4rJI3USIVldIpsd+H0fCy/WohJqV19b8vbH
	yvrhP4AzUrvXUiXEN9nLJFMLzpcVa5atnOeoIwkgwpOe3E3SUeYmdB+3MR0Pr+l/J6EiT0PrR8s
	KIKai7Wc9KzhbrVjfD5WFuzxPu95uZ1VX3W1aAuT/OKMZLzK6xAuOtIKJhKg00vMiGxEc85XJ5W
	U9goHv1WIXoBERl+yFhx/Ef3KuAlWSIzxV2dKWFAJ8MkpbTbg21F9VtjSmWHPExwQIGrEKu3TMR
	aytSzA3xH5/ogkf105kKRvQ8DhG2VVuLwgRe/eyYQyyi7Jpz2/Ci+qLefCQtTy08L0j40ZIxCTx
	YaUH6J1MKO+JjC2
X-Received: by 2002:a05:600c:212:b0:493:bb2e:11a5 with SMTP id 5b1f17b1804b1-493c3cd99c9mr13791975e9.15.1782920560613;
        Wed, 01 Jul 2026 08:42:40 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4bfdd5sm148048465e9.1.2026.07.01.08.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 08:42:40 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Wed, 01 Jul 2026 17:42:24 +0200
Subject: [PATCH] dt-bindings: wireless: ath12k: allow calibration variant
 for WCN7850
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-ath12k-calibration-variant-v1-1-d3eddaabf026@toradex.com>
X-B4-Tracking: v=1; b=H4sIAF81RWoC/x3MQQqEMAxA0atI1hNoC1qZq8gsYk01KB1Jiwji3
 S0uH3z+BZlVOMO3uUD5kCz/VGE/DYSF0swoUzU44zrjjUUqi3UrBtpkVCo1x4NUKBUcfd+a6GO
 cfIA62JWjnO98+N33A+ON1apsAAAA
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Andrew LaMarche <andrewjlamarche@gmail.com>, linux-wireless@vger.kernel.org, 
 devicetree@vger.kernel.org, ath12k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_084242_917040_19ADF578 
X-CRM114-Status: GOOD (  10.89  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

qcom,calibration-variant selects board-specific calibration data for
systems where the bus and device IDs are not unique.

This is not specific to WSI-capable QCN9274 devices. The WSI binding
already allows the property, so allow it in the WCN7850 PCI binding too.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Document qcom,calibration-variant in the WCN7850 PCI binding. The
generic property is already documented for ath12k WSI devices in
qcom,ath12k-wsi.yaml, and selecting board-specific calibration data is
not specific to WSI-capable QCN9274 designs.

This complements Andrew LaMarche's ath12k driver series, which adds
driver support for reading qcom,calibration-variant from the device tree
and drops the deprecated qcom,ath12k-calibration-variant from the WSI
binding:

https://lore.kernel.org/ath12k/20260630133001.1426824-1-andrewjlamarche@gmail.com/T/#t

That series makes the generic property effective in the driver while
this patch closes the schema gap for WCN7850 devices.
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
index dc68dd59988f..cf3e1fd99c12 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
@@ -54,6 +54,12 @@ properties:
   vddpcie1p8-supply:
     description: VDD_PCIE_1P8 supply regulator handle
 
+  qcom,calibration-variant:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      String to uniquely identify variant of the calibration data for designs
+      with colliding bus and device ids
+
 required:
   - compatible
   - reg

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260701-ath12k-calibration-variant-b7850f7ffd7c

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>


