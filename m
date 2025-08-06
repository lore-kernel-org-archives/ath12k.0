Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FFCC87FDA
	for <ath12k@archiver.kernel.org>; Wed,  6 Aug 2025 17:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a2nLA9lQVj2kz9XUdrWfpoRam7BqcN0+aOZG4RexWvY=; b=oukHhbwvWm1qxA3+nBeIg4W6O4
	PlUWKDQIwsriXv1PMHU9FnQzhCg/UhyVPEZI/JEIfzRlNCi+kafogVxYkISy+5jSz2iHLRXTkMOl5
	EEi/K/i2dDevcHF0LRC29RV7nDfQXnInY89fQiJQhBM98gBmuT+8KYa7conqFkhT04SCQqHGDQCyy
	NmU4CH7iRXKVUYY4AitB7cgjfipfR4TFOcd0C5K88kML8nxVDEnTQFFauAis7lHjMofnnlWOXkx+R
	0dWmz7au560AYh5rhzYBT8C6gMZPEOqHMQYn5S/cxQvomXXJ2EFsGkuDeze2t4y3lqO7gZCtsf/3Q
	ZLoYHg1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uji0M-0000000FwPd-2i8q;
	Wed, 06 Aug 2025 17:32:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhu1-0000000FvQg-20Qb
	for ath12k@bombadil.infradead.org;
	Wed, 06 Aug 2025 17:26:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=a2nLA9lQVj2kz9XUdrWfpoRam7BqcN0+aOZG4RexWvY=; b=UBWffeuiBYKUf9B3ub2ba/5l3r
	NEEuDyriuWWZnbrlOoKgQ0to9qB1eCmhKXwgVZ+uhnPzUyokwkY9QNEMbmhl3Vjk+UKCj6FUOueq4
	sdxiN8FvASHdA+WYNKYpv/4VtxZaadJn5rUmpXJRM7x5AtI5FyHTcUsgr7WGleVzrYIVSkMcQ4MYj
	vrODpMzZaNEDUjpClpLVy3GPPELMawAsWUFpeaiDcjUu+p7tMrk/4L9upgk5mqGmlFvRb2ww2dN2D
	grde35krW555W70/e78omCaaNZ+zDis7lhszuP8jh0U2h+L/WO9N/fmOgmaoDT8385/qCvhP5fubY
	TfRuXoig==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhtx-0000000ELB0-2lu2
	for ath12k@lists.infradead.org;
	Wed, 06 Aug 2025 17:26:12 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5769eweX032544
	for <ath12k@lists.infradead.org>; Wed, 6 Aug 2025 17:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a2nLA9lQVj2
	kz9XUdrWfpoRam7BqcN0+aOZG4RexWvY=; b=Qj22OZV1ckWTmAiK4v0BfOcLzdK
	wEmkeiNfeHMVfOHV7L9IcoB0d/GfDhes/gNOeCK8OWSfV4V+x7ttd81qCVN4+f3b
	hFwdhMI8NK58aJFrk5tV1JXKvAd5g83D8U/rYn0fi0gIctcgDcZLYIXuW7N8R9Iy
	IYPKaVzOMc8ewXiVDyvmKTSgWFuyYOWMi7XBO9vhTZ77d87Prd5Opt9IG4a62eLT
	bORrr13fKvQNWI8aAAmeCM5mKsZCLAYQ6yZIc8fTbX1rddt/ZVtxGYzbUJhJ85MD
	vBKQVIDgJKqeOgYBOaFJZEgmLXzaNAoc3buRcmiIaRvhCNMz0V7T4wrhLIw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw2ukuq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 17:26:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76bb73b63d2so170274b3a.1
        for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 10:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754501163; x=1755105963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2nLA9lQVj2kz9XUdrWfpoRam7BqcN0+aOZG4RexWvY=;
        b=lLEo7y5zXvnZS0AnigPl8zKBjo92Dkgtc68OlkiJHQ4cdokjQbom1z8Eu7NGMTIKEi
         UEsjZ83rtkZ4DMRqBMLG/4rImS5u4lw/3gH96IIulNkYqEVeVB82ccbRfi6vYtWC5EvS
         epIeoNiFYEbSovJVXhyxZ+BKVUEBvoHMvyDLGvJ/30fxAJYpR4gsh6qe6oXOEe1IuUKj
         82xwAus8kimt3K0e3Ode10XqtG6GMK+imDIDS+DTK9ysYA/1ZSLRvcZ9CJ/J5sw4t/c4
         um2ewZzK/lTF4jZrwnCeLsaKLndaudouzufI28APjAmgnlkebUXqHlU9wjrsx1aTw42s
         I1tg==
X-Forwarded-Encrypted: i=1; AJvYcCX+ajyHX5eh0DuAO/0YbG0cGSZMwGN9rtFdDXx17QGEwKRBNfG24yNBYTN9sHpp8hDaXMFSfTM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa8X9ZHoppwa7HWBH6PrAoZhEdZ7Rgm4AK88DybKyTQXEkIJ14
	YfyTapWHpDw9goLDQm5WhN3u/c/ZnBig7cFWPtnV5ha2+tpndy6y2BR2RaMGis6lRetnxB1bjXk
	CEqNmkjjHhr/BAY2Bu9qx8HRK82tZ+91zX4QEL8hySgojRp+JwwkTXgrdGUkmdUoF
X-Gm-Gg: ASbGncurkX58VcwR0Y6O+TLUix5GOe18tdslaGyY/jKCzm83NmjRE8+MjMSc9hx4dh9
	+jg4YHNqZut3sY1hFkgpaCZ9wHCbmZneii36j5svOMG3TxzQGfROdYfci+oBvk/B8NhrVKc1sl4
	yq+lNZBbsj9UWQidX8yYZ/lgGLMftCNx6c/J/MECmEylscHLj6AqjR4sTB9P3hdnsGiVpjrLxJ7
	cy91zWRHsZNAIZqodj4z945Sk/AntO8aMjX63ylzn5oXWt4x9LWF7oBY8OdWoDS3ykfTnM8kTj6
	bozYqXQq/bj3swKinPr6mfny9ctBUPwChy+DYctp1lYWnhyi3FEp+l0o0sSmfqCcdqs=
X-Received: by 2002:a05:6a00:1916:b0:736:54c9:df2c with SMTP id d2e1a72fcca58-76c2a81ddd9mr4509552b3a.15.1754501163300;
        Wed, 06 Aug 2025 10:26:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGV4H02pbHydqJ6/iNLS7z5YUQ/NCi194v0TPITRvqzx9kg2EFriRJw8sUmEqDtQaoxOhNfAg==
X-Received: by 2002:a05:6a00:1916:b0:736:54c9:df2c with SMTP id d2e1a72fcca58-76c2a81ddd9mr4509523b3a.15.1754501162795;
        Wed, 06 Aug 2025 10:26:02 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f417sm15866210b3a.44.2025.08.06.10.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 10:26:02 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 3/4] soc: qcom: mdt_loader: Remove pas id parameter
Date: Wed,  6 Aug 2025 22:55:30 +0530
Message-ID: <20250806172531.1865088-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
References: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vbz3PEp9 c=1 sm=1 tr=0 ts=6893902c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=8m4FMoEBHb0BRpTWb9cA:9 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Fb68DKte585zlrNUrn2pHrIJC-KPgy6p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX3Nz/QKWatEec
 8mxRpnCGVipSsxj6dbTzQucWnKrzEL8Ifuom0trq05r6EhBomHUp7WGeAKeVmL6SbgcXfCw26AD
 w7to9L6TgzeafQMLjZgmFEgWop8/5L44yzUhqDzvSahZXuXISxYqTuTUltPYH06xsQRh3Cpv69e
 FjBioPzvrN5smacgXnU6ChtcKICrp5NTEzLml7IOohUtGAwRgBTJ64anrbdmZHCR3D+4GNU2L8g
 ERh6pWlGZl7eSkYXJ78+p9fJTaW3mBi3yRT3yGqGdxq2rFaetYb3s+Vw3biAOXLwQ8tWK2Z5szi
 gYzsmPTHb6pN2qR3aBrxd3+XlhNKO+Iey0Z4F99Rj6M3x1sc1Hn1uDQK0Q57fvBR6AFUyEXWzFp
 WFk6EtfP
X-Proofpoint-GUID: Fb68DKte585zlrNUrn2pHrIJC-KPgy6p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_182610_060466_84E53670 
X-CRM114-Status: GOOD (  19.71  )
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

pas id is not used in qcom_mdt_load_no_init() and it should not
be used as it is non-PAS specific function and has no relation
to PAS specific mechanism.

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/ath12k/ahb.c
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
 -  Added Acked-b and R-b tag and its order in the series.

 drivers/media/platform/qcom/venus/firmware.c |  4 ++--
 drivers/net/wireless/ath/ath12k/ahb.c        |  2 +-
 drivers/remoteproc/qcom_q6v5_adsp.c          |  2 +-
 drivers/remoteproc/qcom_q6v5_pas.c           |  7 +++----
 drivers/remoteproc/qcom_q6v5_wcss.c          |  2 +-
 drivers/soc/qcom/mdt_loader.c                | 12 +++++-------
 include/linux/soc/qcom/mdt_loader.h          |  7 +++----
 7 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 66a18830e66d..862d0718f694 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -136,8 +136,8 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
 		ret = qcom_mdt_load(dev, mdt, fwname, VENUS_PAS_ID,
 				    mem_va, *mem_phys, *mem_size, NULL);
 	else
-		ret = qcom_mdt_load_no_init(dev, mdt, fwname, VENUS_PAS_ID,
-					    mem_va, *mem_phys, *mem_size, NULL);
+		ret = qcom_mdt_load_no_init(dev, mdt, fwname, mem_va,
+					    *mem_phys, *mem_size, NULL);
 
 	memunmap(mem_va);
 err_release_fw:
diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 3b983f4e3268..b30527c402f6 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -414,7 +414,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 		goto err_fw2;
 	}
 
-	ret = qcom_mdt_load_no_init(dev, fw2, fw2_name, pasid, mem_region, mem_phys,
+	ret = qcom_mdt_load_no_init(dev, fw2, fw2_name, mem_region, mem_phys,
 				    mem_size, &mem_phys);
 	if (ret) {
 		ath12k_err(ab, "Failed to load MDT segments: %d\n", ret);
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 94af77baa7a1..e98b7e03162c 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -317,7 +317,7 @@ static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 	struct qcom_adsp *adsp = rproc->priv;
 	int ret;
 
-	ret = qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware, 0,
+	ret = qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware,
 				    adsp->mem_region, adsp->mem_phys,
 				    adsp->mem_size, &adsp->mem_reloc);
 	if (ret)
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 02e29171cbbe..55a7da801183 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -242,9 +242,8 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 			goto release_dtb_firmware;
 
 		ret = qcom_mdt_load_no_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
-					    pas->dtb_pas_id, pas->dtb_mem_region,
-					    pas->dtb_mem_phys, pas->dtb_mem_size,
-					    &pas->dtb_mem_reloc);
+					    pas->dtb_mem_region, pas->dtb_mem_phys,
+					    pas->dtb_mem_size, &pas->dtb_mem_reloc);
 		if (ret)
 			goto release_dtb_metadata;
 	}
@@ -307,7 +306,7 @@ static int qcom_pas_start(struct rproc *rproc)
 	if (ret)
 		goto disable_px_supply;
 
-	ret = qcom_mdt_load_no_init(pas->dev, pas->firmware, rproc->firmware, pas->pas_id,
+	ret = qcom_mdt_load_no_init(pas->dev, pas->firmware, rproc->firmware,
 				    pas->mem_region, pas->mem_phys, pas->mem_size,
 				    &pas->mem_reloc);
 	if (ret)
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 93648734a2f2..07c88623f597 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -757,7 +757,7 @@ static int q6v5_wcss_load(struct rproc *rproc, const struct firmware *fw)
 	int ret;
 
 	ret = qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware,
-				    0, wcss->mem_region, wcss->mem_phys,
+				    wcss->mem_region, wcss->mem_phys,
 				    wcss->mem_size, &wcss->mem_reloc);
 	if (ret)
 		return ret;
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 63af3e97c93b..145bd1374f07 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -331,7 +331,7 @@ static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_na
 }
 
 static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
-			   const char *fw_name, int pas_id, void *mem_region,
+			   const char *fw_name, void *mem_region,
 			   phys_addr_t mem_phys, size_t mem_size,
 			   phys_addr_t *reloc_base)
 {
@@ -353,7 +353,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	if (!mdt_header_valid(fw))
 		return -EINVAL;
 
-	is_split = qcom_mdt_bins_are_split(fw, fw_name);
+	is_split = qcom_mdt_bins_are_split(fw);
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
@@ -458,7 +458,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	if (ret)
 		return ret;
 
-	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
+	return __qcom_mdt_load(dev, fw, firmware, mem_region, mem_phys,
 			       mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load);
@@ -468,7 +468,6 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
  * @dev:	device handle to associate resources with
  * @fw:		firmware object for the mdt file
  * @firmware:	name of the firmware, for construction of segment file names
- * @pas_id:	PAS identifier
  * @mem_region:	allocated memory region to load firmware into
  * @mem_phys:	physical address of allocated memory region
  * @mem_size:	size of the allocated memory region
@@ -477,11 +476,10 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
  * Returns 0 on success, negative errno otherwise.
  */
 int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
-			  const char *firmware, int pas_id,
-			  void *mem_region, phys_addr_t mem_phys,
+			  const char *firmware, void *mem_region, phys_addr_t mem_phys,
 			  size_t mem_size, phys_addr_t *reloc_base)
 {
-	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
+	return __qcom_mdt_load(dev, fw, firmware, mem_region, mem_phys,
 			       mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 9e8e60421192..8ea8230579a2 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -24,7 +24,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  phys_addr_t *reloc_base);
 
 int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
-			  const char *fw_name, int pas_id, void *mem_region,
+			  const char *fw_name, void *mem_region,
 			  phys_addr_t mem_phys, size_t mem_size,
 			  phys_addr_t *reloc_base);
 void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len,
@@ -54,9 +54,8 @@ static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 
 static inline int qcom_mdt_load_no_init(struct device *dev,
 					const struct firmware *fw,
-					const char *fw_name, int pas_id,
-					void *mem_region, phys_addr_t mem_phys,
-					size_t mem_size,
+					const char *fw_name, void *mem_region,
+					phys_addr_t mem_phys, size_t mem_size,
 					phys_addr_t *reloc_base)
 {
 	return -ENODEV;
-- 
2.50.1


