Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE2CC369A2
	for <ath12k@archiver.kernel.org>; Thu, 10 Apr 2025 17:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y9ckJ5dfd0gLEO4J9dWqs05uCPbUjSjr2AMEvPSWIg4=; b=caQ/oR3L4OMR86VfpQYcr1HFyk
	MU9Gy1KXd7o5b26r9eONXuzalP8RSbNR3zlHL4uMvoQ8iJmkdT4XXnK+x1UsOkR383S4gxPfm4Zf7
	ND5vstsSQNRENQy1/RCBTyzVWeTQPW0mRzXNRDC5hQ/+c2vLlZ4KXkpRKXSCp618kv159QXk8y9ae
	2hLZUXl8kdNDAj648O5tkx2MzUBGW/vNzf6wMkazBUZVgXSTq8aa1DJLdSns4W8s9IAqfB9cuH5OK
	taaBYBMlCelTEkKoDo+/isr28+TdZ52WE28ZbcmFj8NMdfS2v6zy8jCb1S1mo+/yI3eaclyDmNzYT
	WXgQSObg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vWC-0000000BLc2-3gm2
	for ath12k@archiver.kernel.org;
	Thu, 10 Apr 2025 17:16:48 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ujN-0000000BBhO-3zq8
	for ath12k@lists.infradead.org;
	Thu, 10 Apr 2025 16:26:23 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so9609625e9.1
        for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 09:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744302380; x=1744907180; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y9ckJ5dfd0gLEO4J9dWqs05uCPbUjSjr2AMEvPSWIg4=;
        b=pZwBfeQNb7awLFuLo0ZLvhSNfMdA3nTL0xfxp1fLGiP7ix51vK1rPhsOSGpfY+1khF
         +6MZipkvtLMUGKHFO79LydsblxhGwCd9dEtPmqSTsd4pfrHMeDc2qkVAHgjYRO4u5mME
         qMQ3E6PSupbotwkg3YYsaP/HSoGtohi8DTF5s6xi8SnXhpzboTwPYglqQjPo1mDLHwdz
         yOcC4gRvFoTZ2b49JBCakoFlRFpwHF4mkfcYLfsV2sa3/CZrFuqkBn2ZGG25uNF5jf/a
         aH6c2Vn0VtXM5WcBHPeLI9dlJVM13spsk31UxRsGGYU4Ej8CXLJyylXqOLM+fI2WjHrr
         NZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302380; x=1744907180;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9ckJ5dfd0gLEO4J9dWqs05uCPbUjSjr2AMEvPSWIg4=;
        b=LImgizMxWzPorKXlrPe6QaBhIYIKlJr4skMrHn/XQxXCF63+G2WDWdM3+zXLCcmPSy
         dlJRXydpuHI7nX1yggBt05QgGObW0NW1QWLC7pdcx7yNVbHDeT8opVHaF4Za/elNumOw
         o60L+mjI5UAz0vIr3h9Q2fw86IFWmiwwHoTRqA9bc+U7aYRZCXaO6k17BONpNKLVDQJg
         UADYvwZjde41+mWAZBL1qKUtNSaKEDkcqE58BJBX0bZzPN+AvWITk6rZixqNASbCIz8M
         M7a3Bv1TtKaHPbC33W8ZyKkN6NmqlRfIHY2X+gZ1YnkO2OZEkbYxjPaPvXOOQWKfL8BP
         6oYA==
X-Forwarded-Encrypted: i=1; AJvYcCUx2PMi0bCK9KwubRVmWWWseHw8doEfU4aqbwoG4HMclhMA1bLuYVhntPwjd9DDikB1p1qlsEQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdAJ5a50cObegsj6IyFUytpIbm880mBERytREV5x1oA6LtC+hw
	mLMu+iVNejNYx/NZECAw+YEE5PlBKx8TNL1bvKH8qfKnFKUtLf4ycMVQ7J6/738=
X-Gm-Gg: ASbGncuXlB/8Cs2teHewOwgCCBsECJsJgCkk1NFzv5EIYIBDu7GVK0veLiPhAGHGYqU
	csW4pL/92fODnHVmI/ttPj4hgWt/2w6mvJVc2Z0oqiImEAGGM0fWXqYhc+z+2aBTo3HGeCXOR5v
	aSea7Ba5RWzyrsp17eZftwKPtFQdm/Z/Ml1UfV+2QCjnWuXy6hnTG1B+eeEKYMVZt1+RjuDQYhm
	jcfPF3QWrfl2oyzCfoE4BP/QukCeyzZgUZEe76l5NwJKiFaEBMElcYR8uxSJyXDba/wjQITB/5l
	/gBsM/XtEp4yUZJfsXr0tyNqKZtF773zm/HhwztYxgL5u6c1frmfpA/y
X-Google-Smtp-Source: AGHT+IE1nYH0HBU/WHO1w0aQZJhBOQ2ARrY9ROHGDPijYcKFnQf4Jd5ojzOvEeX3hT9ouKniOfxAnQ==
X-Received: by 2002:a05:600c:190c:b0:439:9e13:2dd7 with SMTP id 5b1f17b1804b1-43f2d798f17mr40725835e9.2.1744302379796;
        Thu, 10 Apr 2025 09:26:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39d89389ed6sm5196989f8f.41.2025.04.10.09.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:26:19 -0700 (PDT)
Date: Thu, 10 Apr 2025 19:26:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Balamurugan S <quic_bselvara@quicinc.com>,
	P Praneesh <quic_ppranees@quicinc.com>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] wifi: ath12k: Fix a couple NULL vs IS_ERR() bugs
Message-ID: <937abc74-9648-4c05-a2c3-8db408b3ed9e@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_092621_994582_79C92877 
X-CRM114-Status: GOOD (  10.78  )
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

The devm_memremap() function returns error pointers on error and the
ioremap() function returns NULL on error.  The error checking here got
those flipped around.

Fixes: c01d5cc9b9fe ("wifi: ath12k: Power up userPD")
Fixes: 6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index a9d9943a73f4..636dfe237a79 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -360,10 +360,10 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 	mem_phys = rmem->base;
 	mem_size = rmem->size;
 	mem_region = devm_memremap(dev, mem_phys, mem_size, MEMREMAP_WC);
-	if (!mem_region) {
+	if (IS_ERR(mem_region)) {
 		ath12k_err(ab, "unable to map memory region: %pa+%pa\n",
 			   &rmem->base, &rmem->size);
-		return -ENOMEM;
+		return PTR_ERR(mem_region);
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "%s/%s/%s%d%s", ATH12K_FW_DIR,
@@ -929,7 +929,7 @@ static int ath12k_ahb_resource_init(struct ath12k_base *ab)
 		 * for accessing them.
 		 */
 		ab->mem_ce = ioremap(ce_remap->base, ce_remap->size);
-		if (IS_ERR(ab->mem_ce)) {
+		if (!ab->mem_ce) {
 			dev_err(&pdev->dev, "ce ioremap error\n");
 			ret = -ENOMEM;
 			goto err_mem_unmap;
-- 
2.47.2


