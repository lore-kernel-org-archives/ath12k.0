Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE566FE51ED
	for <ath12k@archiver.kernel.org>; Fri, 24 Apr 2026 08:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eoyg8FMw0CwqCK8I4nG4squLxWdTJlKOwqwgr4RUV68=; b=HU7A3dwU9TKFGZa/ByOTiWLl6o
	PmmeQlpc+nHKMuie9gEo3ZhCyizhW16IVg2vPJmYRSy78wDScW9k9ynRxb7xZ196KZZLiAcaerwCx
	45qYSVWmN11zalyuFeNpqgu861KUmBjWlr2imbzoz7/TjGxC7/zT5B+Uodz5pvMtcP/Kzv+FDuXXS
	RfJO/gBzCF4ldt1yKAvfMEFTv410jBhzJz7MIWXxWO47XAPyIu77nM5SYKPTncWCEChmaRfL4yDX4
	+vhREHj8iwROc6hS9PllatN+diqp4xrUZJNW4EAgRuteueX4bFdgyc6HZo9ndIM0kByHn/rQbXI2C
	coX0yryg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCNw-0000000CuT3-1uVJ;
	Fri, 24 Apr 2026 08:59:40 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCNu-0000000CuSh-1Bsu
	for ath12k@lists.infradead.org;
	Fri, 24 Apr 2026 08:59:39 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so40947465e9.0
        for <ath12k@lists.infradead.org>; Fri, 24 Apr 2026 01:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777021176; x=1777625976; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eoyg8FMw0CwqCK8I4nG4squLxWdTJlKOwqwgr4RUV68=;
        b=b1wxT1a0zBwZV3RNd91j4Ks/Q/7GoJLHTGX08209+kbsYId7mzMtm2bZFFwyTP7F5o
         Rqipbm87D8hYpZoZhne2fEZdk210U1G72csQtt3gzRHDq17jsq6VnsAKq5PjgYeIacab
         fANvD1utvRmo7coL5o0+Uyp4YoIGoFgQ4b+m5w5S0QMALJ8sNOvnwIXvQkbxeTgRHzi4
         brpr5sRpT+7182qIWqgLmTKssPppoW/qqiztLuVOOLx1yaftA/G0sRat79FG7NdNFWSn
         9HgXB2fUd9N5oX9Crs8HidygTZdfl747Y7wdmDucREWdHEWJMQ0oUJJfMTqr2GOcNcjR
         rXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777021176; x=1777625976;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eoyg8FMw0CwqCK8I4nG4squLxWdTJlKOwqwgr4RUV68=;
        b=phBnTCp+BDFk/SybcPUQXa3+HOtjLQYaVACoecTSab3ovH/ukpjt5J7hecqgbTGF7A
         9WewZlKPOMU6eAx+H084QAFsv5T902Rwl5FU78MeLTiqfmRguk7AxFAoLnEacfR5sz+q
         yLz7pBbyiFg33jcyWMhmvl1XTSRPEKs5W/HUo8x6M4Q1Tp+Nq0cN3+7o2J6oM47NLQhA
         EUosqr/30CpWbxeZFILLe3aK3n4H+UcMg/fr66Xe9rgCM4+gizsNNPuGtJpJuh8afX5Q
         QHgVMRX40MAzxu2Tboov1z/Cwy/xStbCEaQ98NPVM8I3vJcFfZUmoSwLkZ4Ivv3enain
         4RGg==
X-Forwarded-Encrypted: i=1; AFNElJ/QYXfa4pIybT94RY7eGzP/Cwdshync0Nu4Y0xW/solpt2Y+UhPuGdyLpay9oxUBSThfLojhfA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+B2RlC8M+/zd3/xcI2rmMA/nAImYVESddYtckpoX573JFH7tw
	J+ztE/iEVpf65lsL+R23zC+YLtxXLM1T49w4kBsUyJiE3zNtsWexqCNF
X-Gm-Gg: AeBDiesh6g1PR4sHVUCKT1JYvTYtRP6HxvsDk7bhTWOEp/Kkarvqq8NSO2jYwgKwbJM
	bK7M3EN9aYxmxnHKE8Dv8r2+zVi1/7nZqzhui7XgW29baUBqfCh5Mp9mBX/o81cEwaFzYjRMoKK
	NOig6YExdkydGBwSyqBQsjrWmhxcMzM25LVslSXzPILBsxDyNb32MszE2XqcnjbTgCY+lwxNKPk
	r2/vewOWOhabkXL00HotU+NNyDB0txzUZESu2dJRqD46Hl2LOspS9y1wNQhIjLk+jfzwfOnxsRa
	hx5eJbfQa54SeL1CsaKm+EN7cKxgYMwP7pEzv0E7phN6o1M2Jfj6vaBZleCY+evLfDLHOt5SMOi
	MXLIwUwrReeiGGGHjnC37VckuhOQ9JRYoUF9UAzy17nxURNWkbWeTUEawlJDepnIqvkY/iIl6d8
	IWQcSKTxUpompyEwwXx9q1a2MZJC07qg==
X-Received: by 2002:a05:600c:a105:b0:486:fb69:4960 with SMTP id 5b1f17b1804b1-488fb7786e4mr333909925e9.19.1777021175566;
        Fri, 24 Apr 2026 01:59:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb74c7a2sm180838455e9.1.2026.04.24.01.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 01:59:35 -0700 (PDT)
Date: Fri, 24 Apr 2026 11:59:31 +0300
From: Dan Carpenter <error27@gmail.com>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: Add support for reading variant from ACPI
 to download board data file
Message-ID: <aesw8xC4txXCTlw-@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_015938_342664_8A9DDB55 
X-CRM114-Status: UNSURE (   6.02  )
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

Hello Lingbo Kong,

Commit 0a43c3a520e9 ("wifi: ath12k: Add support for reading variant
from ACPI to download board data file") from Jan 13, 2025
(linux-next), leads to the following Smatch static checker warning:

	drivers/net/wireless/ath/ath12k/acpi.c:395 ath12k_acpi_start()
	warn: set error code if 'ab->acpi.bdf_string[0] == 0'

drivers/net/wireless/ath/ath12k/acpi.c
    351 int ath12k_acpi_start(struct ath12k_base *ab)
    352 {
    353         acpi_status status;
    354         int ret;
    355 
    356         ab->acpi.acpi_tas_enable = false;
    357         ab->acpi.acpi_disable_11be = false;
    358         ab->acpi.acpi_disable_rfkill = false;
    359         ab->acpi.acpi_bios_sar_enable = false;
    360         ab->acpi.acpi_cca_enable = false;
    361         ab->acpi.acpi_band_edge_enable = false;
    362         ab->acpi.acpi_enable_bdf = false;
    363         ab->acpi.bdf_string[0] = '\0';
    364 
    365         if (!ab->hw_params->acpi_guid)
    366                 /* not supported with this hardware */
    367                 return 0;
    368 
    369         ret = ath12k_acpi_dsm_get_data(ab, ATH12K_ACPI_DSM_FUNC_SUPPORT_FUNCS);
    370         if (ret) {
    371                 ath12k_dbg(ab, ATH12K_DBG_BOOT, "failed to get ACPI DSM data: %d\n", ret);
    372                 return ret;
    373         }
    374 
    375         if (ATH12K_ACPI_FUNC_BIT_VALID(ab->acpi, ATH12K_ACPI_FUNC_BIT_DISABLE_FLAG)) {
    376                 ret = ath12k_acpi_dsm_get_data(ab, ATH12K_ACPI_DSM_FUNC_DISABLE_FLAG);
    377                 if (ret) {
    378                         ath12k_warn(ab, "failed to get ACPI DISABLE FLAG: %d\n", ret);
    379                         return ret;
    380                 }
    381 
    382                 if (ATH12K_ACPI_CHEK_BIT_VALID(ab->acpi,
    383                                                ATH12K_ACPI_DSM_DISABLE_11BE_BIT))
    384                         ab->acpi.acpi_disable_11be = true;
    385 
    386                 if (!ATH12K_ACPI_CHEK_BIT_VALID(ab->acpi,
    387                                                 ATH12K_ACPI_DSM_DISABLE_RFKILL_BIT))
    388                         ab->acpi.acpi_disable_rfkill = true;
    389         }
    390 
    391         if (ATH12K_ACPI_FUNC_BIT_VALID(ab->acpi, ATH12K_ACPI_FUNC_BIT_BDF_EXT)) {
    392                 ret = ath12k_acpi_dsm_get_data(ab, ATH12K_ACPI_DSM_FUNC_BDF_EXT);
    393                 if (ret || ab->acpi.bdf_string[0] == '\0') {
                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Should we set the error code for an empty string?

    394                         ath12k_warn(ab, "failed to get ACPI BDF EXT: %d\n", ret);
--> 395                         return ret;
    396                 }
    397 
    398                 ab->acpi.acpi_enable_bdf = true;
    399         }
    400 
    401         if (ATH12K_ACPI_FUNC_BIT_VALID(ab->acpi, ATH12K_ACPI_FUNC_BIT_TAS_CFG)) {
    402                 ret = ath12k_acpi_dsm_get_data(ab, ATH12K_ACPI_DSM_FUNC_TAS_CFG);
    403                 if (ret) {
    404                         ath12k_warn(ab, "failed to get ACPI TAS config table: %d\n", ret);

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter

