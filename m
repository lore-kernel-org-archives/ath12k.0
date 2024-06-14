Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAD8C27C77
	for <ath12k@archiver.kernel.org>; Fri, 14 Jun 2024 17:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hHcGiX8UBCwxh//a18tmbSzvIIZ91QoZrb+Pr6rgKAk=; b=esDCiNem8s4Y3e8tlvjBRsE3I+
	9p9MAMPQEUnC5RMk+D4PceVnM9BkYcHlfMDkI/61ruhMLlznW87CfhGNHPjGRaJay+Ntwzef3vTWt
	Q+IKT7EZYgd/daweQsIdmDcGxtgfZYdRO94aFETD7FIOwtK1QyP5fuxjcwy9vUkbu139XEpZb5MJA
	d9ZPrUIPIxtv8+sOFqmms6fzB7KkeoObhb47KyYeRzr65iZrUEDrOQQbIQnd/gfwS+SAV1VCwSwHw
	p7dxOkEwTmm4jM8E0X76cxCiFTha3U1XthyWQp+mmIUMT/Qm7NI4c/34nIIGD1EBHmabSNyaigN6k
	vsQ++NgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIAmt-00000003e0y-249G
	for ath12k@archiver.kernel.org;
	Fri, 14 Jun 2024 17:32:31 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIAmp-00000003dzj-3eWp
	for ath12k@lists.infradead.org;
	Fri, 14 Jun 2024 17:32:29 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-35f090093d8so1945841f8f.0
        for <ath12k@lists.infradead.org>; Fri, 14 Jun 2024 10:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718386344; x=1718991144; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hHcGiX8UBCwxh//a18tmbSzvIIZ91QoZrb+Pr6rgKAk=;
        b=Ybj4rmLbtlJTBzcTmLpq3ydXjUQZuC2V3cEqwJxvvGWynybyheE+UeMPGH6dfhxN/Z
         TPoqCSMadt2Y1TEhnQ/AU5wxJaFFgTL8ihYDyVFax86WIAcy+2f2Q25DEcQWWXtkMVeW
         3+ZR7OW8oxKla0vxUz82XSscxoT5Cr56ydkKGaKLLQwnZxyVUn2170z5cLxRUhRR3WEC
         bkCPucVwvj6s8Qmr1EBho9Y5GUqiN/wIq2Sn6gG79l67uxlhZm+gRBXoeW2i5EYAHnlo
         jdyV0Cvz+qe15ayKf3BQ4X3qq4ydAQjYa4t7F72Q/e0ihrXpYSftkLNRrk7Z23LUNcBm
         ioeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718386344; x=1718991144;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hHcGiX8UBCwxh//a18tmbSzvIIZ91QoZrb+Pr6rgKAk=;
        b=BCn/7O2XP0V/2XCRM8WEGVQ0oHgu69sur/I5e9RVyVUZbL3jzUFLW9wcZ1RVHntC4A
         qV+8jZ7OXLMxvUo9IOlgO744s/LjtvLoDRWtUCx7d4KcixrmG6SH4STAUB7UH3gEoFMV
         coMi5lWkrXKySnxA1Jfk4Ro5AzFiYoD+mQaML7VHSq9yCZWCxFiqLHFRsCGFhQ/Z20E3
         /vOrDqfofepQLe7I8XZY0UmefqsF9iUZvf+dWxy03wTvy8Avu3bTT3wjCWw3/R2QT0Co
         qvblNPLCVShpVpxryy3x9IwFtQk7PlM8PxHEymX2q9WKJImLScJsuBUznJpjUybcOYiI
         BYYw==
X-Forwarded-Encrypted: i=1; AJvYcCW0zfFxfEFc5aomZPRQeONp+QiWFKctX/u/EYkMvjAMrCWtqiEOZ7yFb5ZYDkKbEEJt+HH2M/olmaVUHrFfdn6l9m4ti8o/cD5F6A==
X-Gm-Message-State: AOJu0Yx0pK8de2C9Bp6Vpiq2ikh9XCyWlhw5qX6NBD5k4lk6UZf0q4F7
	vz6/etoZHbE1qsGT3yjBrL2gEQhMH7l6Fhrng/KX5KRgyg7cGccLFgyPUHhH8x4=
X-Google-Smtp-Source: AGHT+IHsxqX+vfK6OLdZouSmAaBnwPbFYWG7SuDtV+LLd1ZQ2QpbCa6D9qdoNvt9IQdsKez/NQ86Ww==
X-Received: by 2002:a5d:6da6:0:b0:360:83cd:ea2d with SMTP id ffacd0b85a97d-36083cded29mr2374785f8f.24.1718386344226;
        Fri, 14 Jun 2024 10:32:24 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360751152d9sm5045341f8f.116.2024.06.14.10.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 10:32:23 -0700 (PDT)
Date: Fri, 14 Jun 2024 20:32:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] wifi: ath12k: fix potential NULL dereference
Message-ID: <4428a7ab-eb67-4f0e-992f-35577ea2b564@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_103227_950135_CC7394FD 
X-CRM114-Status: GOOD (  10.20  )
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

In this condition if "sband" is NULL then it leads to a NULL dereference
on the next line when it does "idx -= sband->n_channels;".

The condition can just be deleted, because if "sband" is NULL or the
"idx" is out of bounds, then the correct thing is to at this point is to
return -ENOENT.  There are no additional sbands available to try.

Fixes: 70e3be54bbdd ("wifi: ath12k: fix survey dump collection in 6 GHz")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/ath/ath12k/mac.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 509c02bffdae..e5456383dabd 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -8314,11 +8314,6 @@ static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
 
 	if (!sband)
 		sband = hw->wiphy->bands[NL80211_BAND_6GHZ];
-	if (!sband || idx >= sband->n_channels) {
-		idx -= sband->n_channels;
-		sband = NULL;
-	}
-
 	if (!sband || idx >= sband->n_channels)
 		return -ENOENT;
 
-- 
2.43.0


