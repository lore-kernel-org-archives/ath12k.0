Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFB9C021B2
	for <ath12k@archiver.kernel.org>; Tue, 25 Feb 2025 09:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pUUlyd7n/V07DcfsSYjPFFab+d4+yvvoCEwUK+Z2ilg=; b=rYpGLi7QoWQXGD
	mhZoiXqvDdycohbaqs3AYjcgvCDRBr9evSTryTIL6snI91AHEH3+FmP98pSev9m16aqxk7YP3csa6
	LLPmeI0xj1inrVRLWmC8NB2E+7HVmeH7txkBQ0vcBGg5sJ7NHbxrtqSwDVuE3Ge0/nJ71lo8z0c5l
	OrRzZMiaLKqZgjI8RkUv1TR35doCfSImHlmB9rX0MK3QrOA0M610hgzH5rjj65kUArQXPMGGlfZsA
	UwNcZMuIESWzVsOTPXfG+NxRKPyX3M4xixui93G0E3cJDciR+w84JrQRSKPCcn9olwiKrTIFHd/Zq
	w/UMzyGx3NEDpjcmoghA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrNj-0000000GcKy-03yx
	for ath12k@archiver.kernel.org;
	Tue, 25 Feb 2025 09:37:39 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqsq-0000000GVd5-3YtG
	for ath12k@lists.infradead.org;
	Tue, 25 Feb 2025 09:05:46 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-abb9c8c4e59so90314566b.1
        for <ath12k@lists.infradead.org>; Tue, 25 Feb 2025 01:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740474343; x=1741079143; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pUUlyd7n/V07DcfsSYjPFFab+d4+yvvoCEwUK+Z2ilg=;
        b=RFWSFgaaLEBpcX3B9soFJB1hIEI5nACLUHOevOrnkVOchYLskJ28voM/eHZx1aWmSe
         DenisYtrmtrDF51Od2qGLMJd4RxQy4Jv2hdpqLa/2ZiMFo5x9qGPr+VK8d+h17YqGWbi
         7vg/67cHHqVqTHJivRRyrLcKeXGfoAoPstQK3kyO39q+eByvMMzspqSfcwbOF7NjKuIg
         5DisZDhX3TkHuClTqTwHSUwxQIzIFhiQJarnGPTZz85/qUNqE7vz8oKd3hkkfiJLV9f6
         N6ahlcw503hRpCu+aabMGbk7G9IvSNxHrfbBQsCn9paBxNg33dnonkiImSxlLYK4rfgs
         d1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740474343; x=1741079143;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUUlyd7n/V07DcfsSYjPFFab+d4+yvvoCEwUK+Z2ilg=;
        b=GmtQZLyLAIsSwSXZMQOZqZg7hTA/k01uLVD0u07c5NWZ+Gcb4jttCw17cLnvGdub5s
         hrl+giVyobKAGMvRvHv7aPStZeNMkyVHtJZRxFvL+OGyAnKLiYHwKIzcrt8TZvYqW1VL
         1RmTEPFtBPqO2d2/vJNDqBAFgoLp5F5t2ol2N7wnxpehLgey5pFt5A6aKpRTXQtlu6+w
         TFLyee0F1fDdsnLUvAxKoM2CK2OG1EiWwuMICWD3WM+cIdexED4KRSIUNNo6FxIyAOlL
         Vc3mp7TVp6hXR6rwmx/Ugcz7wBJugjcey9rzP+MQ2Axw0itKsYlUQYFMiyw6xRGfKnT1
         uYEg==
X-Forwarded-Encrypted: i=1; AJvYcCWKD5ahm7KBkaWgfm1Blazt2xv96bc4hYmsCIFw9UvZ4+zK7w8rTtjQgwqIojb08EF1NJ5qRCM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzpaiqD4tAwwnRikx76MFbRQqOiUs+z1oXKtD73gPsOcYl4ppRf
	FPerVRwzcFu0c9SILZeTQC9+j7ohvTxIc5CHt0ao5F5/M5p/h7pr4QlwgNzbsFLg2dd87YL1bFO
	gd8c=
X-Gm-Gg: ASbGnctf+SGnWvdHDRNA2JWWzCd+AO0zvcyoLvbU5E7k80k8nCrC5+s+zRURE34rpL6
	9JCJOhf6NU5sq1LK61b+Hhf5pt3XSqma3YNZo7k2AmURkb8Rb86yvnLBBgCVLh3uAz0l6ditiUF
	ERd9YeDMq/Th0fk23iYDtJg7BdVd+sFXFkera75MwulYLyQR124TiHTxbEyLQ9K2JvFuxAlqzVH
	BWkSn9CftemhPF33jqBiw+45fkj1Z2tLYUnKOC+l3tRx4U64CUZeD8nDY2yz9Kwv3biO0aJSHUc
	zi7amdMFw12XxKRiJs3+pUqjX4DLKz7BepM/86Y0p/wqdZRq6pJ6vjyZB2oOAMy1g6FeKgKrJe8
	5
X-Google-Smtp-Source: AGHT+IGeX5QyzoBAu4IpQoqciAgBU5d16IJe/4mHV6mquagEmf3K6CXUzjJ3IjzzzFJVhCmX/1OpWw==
X-Received: by 2002:a17:906:4fd0:b0:aae:e684:cc75 with SMTP id a640c23a62f3a-abc09e5e43emr589617266b.13.1740474342685;
        Tue, 25 Feb 2025 01:05:42 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2054d58sm106681566b.148.2025.02.25.01.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:05:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/5] wifi: ath10k/ath11k/ath12k: Strip device prefix from
 calibration properties
Date: Tue, 25 Feb 2025 10:05:31 +0100
Message-Id: <20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANuHvWcC/x2NQQqDQAwAvyI5N7ANbCF+pfQQ19gG6tpmRQXx7
 y4e5zAzOxR10wJts4PrYsWmXOF+ayB9JL8Vra8MFCgGoogdrjYY/tM0YpKvdS5zdXARN8kzMkk
 g5qjMD6iVn+tg23V4vo7jBHe5XeRxAAAA
X-Change-ID: 20250225-b-wifi-qcom-calibration-variant-92a02995e996
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1744;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=YEERJeZoPF997TVwE+PlqQLy35gdriCa6KvLbtYzMiM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnvYfd8TmILlw+MFwINOy/nLQUmg2zl8km+Ln7c
 J3+lOtybQCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ72H3QAKCRDBN2bmhouD
 1zsnD/44e3cUCbRaHwvp+ij8S6BrUfCtAMxyq3lq23DWCpFKr+HPO8RmeoZqRn/0w7dPIkv9Y9s
 ywZHeRGxqbGMzGv5zUzMzY04LiLnD1IhQpp6LPojhMARGGu4tDCdegip8Ut8LbEbQezpcMferxi
 z7eZVy73tmFcV/SFF1nhsRPnRPTaETfiWCiy93zDtQKJtcJd2O1OrLZsY0zohJz3nuY3jj3f0CD
 Bf3RvMIyuw6SZDEY2NsnT2ax67OpG8KWIXW3vKqxwNqolqYU7LLnXvmoK8BMls/FJ5YKcYCR3BO
 zotiCPXpnaIYJfe/kkYNdF7Bq8kZ1qFMrFVOMN+YRd+MB1iYt6n/WeY16EusBHJulhCdvkkTCVe
 D29D30MSi7QTx/dSphQ5W/xyvqtKu21tHN4Xo0fCOuhitHEsxZ49QvNuvTcUpJ09+UeG0duKJLB
 bIDX7T8qwfUtU/HoJ2+dVjWFugek1Z4YTuPYEiFI/yNn58rUWmWmtX9p3Df1YSKMa8+QWHyggTi
 lDWC18zd4lzUlLQW/ERgTR7PreqjqopNrkgnPY71ylb4k9YhJaSXy1sorvI+enukYvIe25iMFDV
 xW55Ao+KZwoQ7pwiG1ZMgpmslqXlK5rrZLH39Es5y27stOf4FRovJvA3BAqWnOjxdG7KCK7Ash/
 1duSTx28oN/UydQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_010544_926978_9B8F3DED 
X-CRM114-Status: UNSURE (   6.40  )
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

Devicetree properties describing exactly the same thing should be
reusable between device bindings.  All Qualcomm Atheros WiFi chips needs
certain calibration data, so properties should not be prefixed with
device family (ath10k).

Deprecate qcom,ath10k-calibration-variant and alike, so we gradually
switch to a common property.  This will also allow moving these
properties to common schema, if desired.

Why? Because people add qcom,ath12k-calibration-data and probably they
will add qcom,ath13k-calibration-data, qcom,ath14k-calibration-data and
so on.

I will fix DTS in separate series.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      dt-bindings: wireless: ath10k: Strip ath10k prefix from calibration properties
      dt-bindings: wireless: ath11k: Strip ath11k prefix from calibration property
      dt-bindings: wireless: ath12k: Strip ath12k prefix from calibration property
      wifi: ath10k: Deprecate qcom,ath10k-calibration-variant properties
      wifi: ath11k: Deprecate qcom,ath11k-calibration-variant properties

 .../bindings/net/wireless/qcom,ath10k.yaml         | 25 ++++++++++++++++++++--
 .../bindings/net/wireless/qcom,ath11k-pci.yaml     |  9 +++++++-
 .../bindings/net/wireless/qcom,ath11k.yaml         |  7 ++++++
 .../bindings/net/wireless/qcom,ath12k-wsi.yaml     | 13 ++++++++---
 drivers/net/wireless/ath/ath10k/core.c             | 13 ++++++++---
 drivers/net/wireless/ath/ath11k/core.c             |  5 ++++-
 6 files changed, 62 insertions(+), 10 deletions(-)
---
base-commit: 8936cec5cb6e27649b86fabf383d7ce4113bba49
change-id: 20250225-b-wifi-qcom-calibration-variant-92a02995e996

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


