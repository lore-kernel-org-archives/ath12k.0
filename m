Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79350CA5FE3
	for <ath12k@archiver.kernel.org>; Sat,  3 Oct 2026 09:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1xzpCaloDfGqbRqjVRILlsh6zNRsWeHOx+x+KXRywfI=; b=CU7sNRNaZk+2fWsl87A6pRdT7e
	BSBzBAfGIxxJpgMv/Syl8bLE7zhjiEjo+OYeIe7xTfzugl7bBQbi9gVi08wPIk5dF0weVFW0z9ZJA
	g9l/OplYo8LwjLb6DtJSEgkdY8atiRyYddWfUEM8vwqRnNROcWkd9REuEriJJmafmAcuiH+kMQVt4
	5ZxEIugd5l9x05hygwL+y3a7manxD3YiwHn5jRmDDa06Ik5rG7TdbTZybsrvsnpgggHPk6piDOg8b
	hw8I6YKCRFYmqiw2hicef+dQJuVluXE6kts8NdEiy+jJJkn03G4sLT2cdVnwcGIpI4UeYYs0nMGUg
	qlCi6N8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvq3-0000000DF8b-0rs8;
	Sat, 03 Oct 2026 09:15:27 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvq0-0000000DF7b-47xX
	for ath12k@lists.infradead.org;
	Sat, 03 Oct 2026 09:15:26 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48b00a0ac65so97470f8f.0
        for <ath12k@lists.infradead.org>; Sat, 03 Oct 2026 02:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791018923; x=1791623723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1xzpCaloDfGqbRqjVRILlsh6zNRsWeHOx+x+KXRywfI=;
        b=qVNkAK31f/gMOla3xPC90y6pxzdDUNqq5HJWfX5wf1Hebyn/2YYCNKLvJPieecpbAF
         QbLiKWaGtY2jju8brU9UZvZrKQd/7tiHLDR8+RV368ghQoZskIzvR1rnWVmN1E1F/NiK
         4omwyKMcyZhZB/q9wiOhge24PfKx4jeWXZ3D8wyopK5XRdqktsuLl6K6qWg7lPB3UCDS
         wD/zL0iErTnqOdkOadgbJngMfifqYHKWp49pBQmq7XEoX/IVPaR8MylV2gltAPu3KExQ
         FP6o7e7Wka/J7pKJX76+lbcGJ922UL3MS3QsR2VM83vI/W+sIp98UvccQhrriblQRN08
         j63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018923; x=1791623723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1xzpCaloDfGqbRqjVRILlsh6zNRsWeHOx+x+KXRywfI=;
        b=mrdXlCrfk4fc2YVEQEZ1BpnEWLQN+vxLO9hM1QJE+0tgpNteDHaxTXfkulUIH2iQPt
         MVuJLCh2PfELlGiu1osYsbnBQ9E6jJqHENPCQV8VCUZPxDGGKA2UUsyXj0SLuQXwEiK0
         5TEwx6kXsvwZ9Q53xoalLCOryLUzoTLUa6ih+iMNAjA+DLqDe/IdR3LdFLmM87Cu4UhP
         EfNPIjussXUiHOm3UUTutJBkHXd3acBZlJFl+0DYjCNXCEzfsWvxDj3bBCQz3DoeCPbd
         FCPit7SJqB4lRZo+2MXLBTHWbQ6eB2J/ooRbdRX3d/3DLwCcFCzdMk7z6jNLrmLH26KU
         FxtQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6uYh+JAZFjX8nfvWZIg43OeVxQ5zuErfyAJJKIwwPOmDc1Jh8EyMsWn3pUfrQR51gWgBmr7E=@lists.infradead.org
X-Gm-Message-State: AFq9FYKKZ0NYXDhLGMSeWRLd2WbNAmyjp4cccbHokjrgF2Wlmb9quscQ
	J0KjG1lqX6xpoEQ35e8E424mV42Um9qv/Q6VV1BHNuh/l7AdbylnnzT8
X-Gm-Gg: AYBFou2ANWbyyjM5BPFZBGDmmItwHUUYxDsdpSk5SA/MusFvfygMLpWU4t2jMUCAaW8
	hHcoTRBeiE8AtKF9aN29zmVeBl9IPURO2W+gPBWHukaq55jSpAVTV55JG1dqnRAldgQbvZX3+Ju
	crHJgLUBSGrGLuY5hoNOHj/qqya2iXql1ZQm+9tls9FAgYpb0WC49yQXo3PpYQtuT2IM+eePA5l
	Y5LVUBA03q/0EbCpvI9nNtSd0xVXzFJLYRC4GbulnuV9D5cu5cfZ7hQeCJOnKkDrhp1Ego+OiGU
	VGEo+BMUMGbeDDhnR0ETyII7ADSGW7g4Ei9Rq2w1K6wjTvkxhoIgSrQgV/TQLkL2/REnEEQ2dEE
	hoxXjNklGpWgutXSySFmVGCydeLmbmbDPXBKdgOUD9b9PvC9cRmhnM0mW0qTJo0/sAQLozB9V2+
	89O0hmFnSuCLHXKBqsBa3WOUrSkSq2kKnfffjuWZsmb4yV9jFghClFX0eyGd6aTPiIkV/Shppiu
	OvIXJUI2L8=
X-Received: by 2002:adf:e19d:0:b0:48b:11ee:de66 with SMTP id ffacd0b85a97d-48b1274c63amr9409397f8f.34.1791018922988;
        Sat, 03 Oct 2026 02:15:22 -0700 (PDT)
Received: from FranzSP11.fritz.box ([31.31.60.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253dc9sm11336161f8f.3.2026.10.03.02.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:15:22 -0700 (PDT)
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
Subject: [PATCH RFC 1/3] dt-bindings: net: wireless: qcom,ath12k: add disable-rfkill
Date: Sat,  3 Oct 2026 11:15:07 +0200
Message-ID: <20261003091509.4822-2-franzelfranzel@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003091509.4822-1-franzelfranzel@gmail.com>
References: <20261003091509.4822-1-franzelfranzel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_021525_044806_B4ACFF37 
X-CRM114-Status: UNSURE (   8.88  )
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

Some boards do not wire the WCN7850 hardware rfkill input, or wire it so
that it always reads as "radio off". On the Microsoft Surface Pro 11
(X1E80100), ath12k enables hardware rfkill handling and the interface
ends up hard-blocked for good.

ACPI platforms can already turn this off through a firmware setting
that ath12k reads (ath12k_acpi_get_disable_rfkill()). Add a boolean
property so that DT-based boards can describe the same thing.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Franz <franzelfranzel@gmail.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath12k.yaml      | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
index dc68dd599..d56050e77 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
@@ -27,6 +27,13 @@ properties:
       If present, a board or platform specific string used to lookup
       usecase-specific firmware files for the device.
 
+  disable-rfkill:
+    type: boolean
+    description:
+      The device's hardware rfkill input is not usable on this board (for
+      example, it is not wired and reads as "radio off"). The driver must
+      not enable hardware rfkill handling.
+
   vddaon-supply:
     description: VDD_AON supply regulator handle
 
-- 
2.56.0


