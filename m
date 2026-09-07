Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7B2C79F99
	for <ath12k@archiver.kernel.org>; Mon,  7 Sep 2026 14:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vQtLGaBEb+xd41WLDmqvQf+F9Q3EMz9NEqhORQulUCo=; b=lFsNFjnG8Ts2tsLgqxbQeVwqCV
	DmYWrc2lGbZvFYgwIm38jPds6VflVMJYkW9ow5nr/GgdLchsFmay8XT9i8ifLUvCybRXa9FsrOaK0
	ON6wPGloWAgqidvS61/X33/66GaAcNWB0GPTlojPsycWUGxNWdoYhtr3ZV+vP+T/8QoEY43GW3h7d
	qys3LWsyCeh4fRaT/Yff5EaKzOYyFEdb0a5IbNnmBBbFQnTNdvSfJEp3OWdyMV6wkiKaE6yvZmkRA
	/Rnr7hrem2BeVYM0ttdofNlubv2yoZWcc8nc0+AK2cGF8iuc9JU+9V860p2O7rOEIxjSHicmtGYlc
	L7Rx5HNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3aA6-000000071tr-17O4;
	Mon, 07 Sep 2026 14:17:30 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3aA3-000000071tE-3grC
	for ath12k@lists.infradead.org;
	Mon, 07 Sep 2026 14:17:29 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so42924955e9.2
        for <ath12k@lists.infradead.org>; Mon, 07 Sep 2026 07:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788790646; x=1789395446; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vQtLGaBEb+xd41WLDmqvQf+F9Q3EMz9NEqhORQulUCo=;
        b=WuYACql7G764CxdKPlT7wS6Zzgari9700Sk6+Meui5X06RTOocwO/qhrWJeQzuqna/
         GatpEF2jlQTDjUjfzKvTmi8ndy37MXC76ARpa3y2P6w17gR9X6cPi/j183MJmFqKeFPI
         5PIy3ncbrltUL9L9RsoPheyvlblP/8NgB2RQAnTjrCAWiy/V8PdfcViAKl6d9Qv/P5+a
         emo+cs2m6w3iyJXBeC+a/kqddZSkr0qrG985T6GeqTDj9PP+df0ipo2TbYLLHbFzRYHY
         6M4we+ARL+4IX9vuBMCkcdS+bXWx4ZOSqD3NIdjX/KQaXeM620W/czv7+/+PY95zNL4V
         52Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788790646; x=1789395446;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vQtLGaBEb+xd41WLDmqvQf+F9Q3EMz9NEqhORQulUCo=;
        b=RdKSn23u+WXZGmE49zEQ8aA7CD5GhjpbFIaNKlRHORT3TsmBLgfhmFscO6JQDI7NbN
         Mbi8WujqaXVC0EENLlj9NEBfzw1oxKgvqVN6Ix80GRUb2K4/kF/f4A5J3kmofh4QMg84
         uABO3RQqnjRTaGNPDAcXUjlkMr4zVtXirpS/eq4Q15AOX4WE1Oh32RnULiXajOZEpjKN
         srAzCl9PjWlPHytD8BOtWmN5mbmUJh/vy9jSJUXi/MuZsAMVktK/AWRsmmwZ5QGF9OHh
         YpPMeFmyQ+wTGQ50IcqDQ7waI5Q0qp8Sid+44SvGyFMj1JfGZSPmilSMG15x1mkAjnCH
         v1TQ==
X-Forwarded-Encrypted: i=1; AKwUvBzV1sgTLeXyRfoTMEQGk7W187PRdnLrwb//5spjwXr23axV9ZLKtehBa0WCx7HVVGaspzI8uQ4=@lists.infradead.org
X-Gm-Message-State: AFuF++msB8FCv1PhD8PLsBPISGB8yBU7jjUzlJuvHsgFX/C+RU12TfYI
	vmm1xrcPUC+smEZmA/IX+FaDK8mMyxiymolI4pLOnQcwg/xVamE4a7yN
X-Gm-Gg: AYBFou0xTB26tuhs2Y4OO04zPVBtwaqyuGxaqSlB7+BLJ2FkR6YxBrE4cPwe7KctOWL
	Ka1M3X5NzWsTR0ch/U8Z1LA38SM0ZFPU3XmeTwENO1VoQyeUgbTEF0tfMuZ1obBKL1V+MVQ5QJW
	oaNjyfgUneKzkwsUopOkz2H3PxIBvXiVyFoVpzZe7uQvls81aiQM2yJTdAyMeVwqn6zFv6Ro8Sb
	HPrbdDjBNIEnxBrBgQhl28gP50bk/lOIroMrv2G7DL21SQasOrG5VnLbhLOOnsnsHA4gh9mKnK3
	0A1BaJ0Dn6KZB46zZITih67xaS+28lbI1FJAZjbeDmfzLJc0EST3y3EflIGqkA8rMfrLp/prLCt
	MWX66vWeWoZWVQ7dSIAUgsB0WLt1jagC8FHpxBe8yyNM8CKJY+R/ragEJg86uv5waoWsQoURLNq
	xnttDVzs0VHcKk/3VMGbn7RjiBqdAyVQ9jAQPXaBOQBI5y/WX0SK37y5/Q5N9jwbAue9YrhhwwS
	eqhjrd1+p8f/uIWyZ7/26uEORs/aQCXjL1rGB+FlQy5XVaIZtLb77UMD7TtWLT2tmy69AK1cg==
X-Received: by 2002:a05:600c:1c29:b0:49d:15f8:2bdb with SMTP id 5b1f17b1804b1-49d15f82becmr22689355e9.7.1788790645027;
        Mon, 07 Sep 2026 07:17:25 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbe5b252sm270473075e9.3.2026.09.07.07.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 07:17:24 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 07 Sep 2026 16:17:20 +0200
Subject: [PATCH v2] dt-bindings: wireless: ath12k: allow calibration
 variant for WCN7850
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-ath12k-calibration-variant-v2-1-1a9d6c47dade@toradex.com>
X-B4-Tracking: v=1; b=H4sIAG/HnmoC/42NQQ7CIBBFr9LM2jGAUYwr72G6GGCwE7U1QEhN0
 7uLPYHL9/P/+wtkTsIZLt0CiatkmcYGZteBH2i8M0poDEaZk7JKI5VBmwd6eopLVFodKyWhsaC
 z56OKNsZgPTTBO3GUeZPf+saD5DKlz/ZV9S/9S1s1agwHDoHIxTa4NgsFnvd+ekG/rusX6bvm0
 8YAAAA=
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
X-CRM114-CacheID: sfid-20260907_071727_939375_049149CB 
X-CRM114-Status: GOOD (  10.83  )
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

qcom,calibration-variant is the generic Qualcomm Wi-Fi DT property for
selecting board-specific calibration data when the device identity alone
is ambiguous.

Commit 06cca100ad08 ("wifi: ath12k: support calibration-variant from
device tree") implemented support for this property in the ath12k
driver.

WCN7850 can be used in systems where the PCI device ID and machine
compatible are identical across product variants, or across regions with
different regulations. For regulatory changes, the hardware description
does not change, but the vendor-provided calibration data can differ. In
that case neither the PCI identity nor the machine compatible can
identify the required data, so DT needs an explicit calibration variant.

The ath10k, ath11k and ath12k WSI bindings already allow this generic
property for the same class of board-data selection. Allow it for
WCN7850 PCIe devices as well.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Changes in v2:
- Rebased
- Updated commit message
- Link to v1: https://lore.kernel.org/r/20260701-ath12k-calibration-variant-v1-1-d3eddaabf026@toradex.com
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
base-commit: 1d8e73163ef933624341075f576e2f36ef9133f7
change-id: 20260701-ath12k-calibration-variant-b7850f7ffd7c

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>


