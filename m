Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB54C87FCB
	for <ath12k@archiver.kernel.org>; Wed,  6 Aug 2025 17:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0kwO+XKJcICduSLZe6gBnukQxiZjQuG4QBPhp437sQ=; b=xGmT3Q0jg14jm+m9mgzSiFhjEi
	rlPB7sFj44AW7kKBJ0+OmIVVcstAlZPua9GmfK4IHsdFcQrnIdKZim8SQQ/cdzl/G5ydJyHQZpjW6
	IlJb17NTiQiL6j0KxDFqJjZEG7+ewFh08iZvM+R+CNDxwJnaXbvV7oZdlvHcauCjjUfSBMEiauRiW
	44WDFNfi8Cwl21fWPmrkdbBYSYwBGcWFOFfYVD8qQsMVoqG2ewF+lL+xFHb43Epkj0hyM1y0XKsAu
	CNBRtMkxjGhfl1EH7s35Es7LSq39rTFNGfl1ZqNRE6DrArOxYI/dqa/jXsdUuT7fzDH4R0HmX9Sya
	WaKDGrIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uji0M-0000000FwPN-0qhs;
	Wed, 06 Aug 2025 17:32:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhto-0000000FvOV-1yVA
	for ath12k@lists.infradead.org;
	Wed, 06 Aug 2025 17:26:01 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576Cnf7d025033
	for <ath12k@lists.infradead.org>; Wed, 6 Aug 2025 17:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J0kwO+XKJcI
	CduSLZe6gBnukQxiZjQuG4QBPhp437sQ=; b=fFeiiefY0RsI7pQ1xUM5u4gvUfC
	83C+d83g5mv7YxoOeChfwb8U6FcoCHJAajZKntZMZ/PEFXGNfIOvgTvFJgsI3vdp
	dflKyRh3LP9tA3V70uHXknA1qzw8Fsgw54FLafJmjFjOHgUP75PrM1STzDQF8/kY
	OZHTfvNtcJyd7gZ540hzsA6pOabNTPUMZjpSUQaQVIyXsQdIdWT1/woQMSVwhWre
	xsHW5Sy22MVuZYK2e4XdU0EIsSzISkDNHmw9YjvN7s78wC2mQDXqmAVvl9qbMQro
	U4dEAzfeQl2TDcxZSEJyjNQvNpj0gfVti2l3cWlI0Y/KtEyLCkdsnPLfWqA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvyunch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 17:25:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76bd757bbccso130121b3a.1
        for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 10:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754501158; x=1755105958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0kwO+XKJcICduSLZe6gBnukQxiZjQuG4QBPhp437sQ=;
        b=ONYU1cjUQlzE2i/L0qeQYWhmMSVPCkl4lV3qamhn/gA+Cw00Hpp0ci7HyZsFFovi+0
         9Sy+6xFxTc+z1X/iNf0jp1bT5lXFLEkjEFhQmY3dYU9Bqg8ujQn9tjU+hmzVUU1qGugP
         lIfBEvd4EclPYHrR5HkxizRRvGwmioKHruKj4fEIRTl9FqJKvdRrus7ut8CZvUAwvR/U
         IKLo5OPn3cmgsdI+X/KilR5pCouB8/ujoV40PjBve7G4d4QNiQjaRxXXRydoJ2g3XBZo
         jFn75kn4i6KUu7ENv9sCxmw1CSAZ/OBwF3kdWR05G1KYO4dtGwGbE2kgItoPe1Obe44r
         BUZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDbhC8KLipjBpYNTwvuuLdp/2W3Rrqa0u179aCkfjBfJWS1gbRg5zPHt/4FrmEClou3On9Qo8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzMbAh1S5OIZoivEQdL2gzOTUfdto42g1iy/MqFexxzWX37OAYL
	eqLbgNy2k10WeeWXGz3JxzgqI47L0bH0Iyg0z+Q0x6xVogejSERMgilaiaQgAQC/b1UZp4Pxn8q
	vW/fbXRu6ABQCcZKyjw1UKKS7NEqdsGEXme3dp6qY07QUGdTZ+77vjkJtpO3DIZ2f
X-Gm-Gg: ASbGnctbs2xcz0gkHJbhqKmyWP6EE87TWY/EvYvlf4+WdfgGRpEmjYV4Kbkc8Ij5FDj
	BHivi24gQvhWZQBC3VAlB/EGuscEnrCxDtbZJZLFn7yS9HaGofIMCh991N255DkEWkWfpyA0x1W
	+GiCq6LoknPFIAk+w7zxZrQt9aQ61VJiS9np/bsfYVIlIaSsnVUG7hG6pzJjmoVPmIn9Z1PhmcG
	cMh9WMp4VZNXUc2Rd1wI3nIoev2Kk7lDq9LE/tYwPFWZs5+l4fdlibgWzwI8WThn4kCRi5u1MZ/
	9MBvoHNl5+QEzK0U6h8VsRWagGpnhWeEKrZZOSVkdba7BUwJGLiUYxIYreYWq6COaDQ=
X-Received: by 2002:a05:6a21:3282:b0:240:66:bfbf with SMTP id adf61e73a8af0-24033169926mr4584779637.32.1754501158238;
        Wed, 06 Aug 2025 10:25:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWT5d2tLsPvTIuVLyXkccfQ0kLVQTUDC6+FpAxVXSC8J88CHJa3SlQ4HRxGVe5A5eMdXLUqg==
X-Received: by 2002:a05:6a21:3282:b0:240:66:bfbf with SMTP id adf61e73a8af0-24033169926mr4584732637.32.1754501157738;
        Wed, 06 Aug 2025 10:25:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f417sm15866210b3a.44.2025.08.06.10.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 10:25:57 -0700 (PDT)
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/4] soc: qcom: mdt_loader: Remove unused parameter
Date: Wed,  6 Aug 2025 22:55:29 +0530
Message-ID: <20250806172531.1865088-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
References: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1clRCVAJ9MAPRz-vXYMkKGwoKqlw2emd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXzV2hmQXsDAMb
 mtZ0f6CFkai2PBGVk2c4Ti8Y80f2hHLY5WnLU3P4d7aSWB7tnJBBR+uLRh4Ce9tlYGaZ7STUIW0
 iXISYFb2bnESUdqITUL5Ts94id5L4HNqEPNjmhmwplVCvxGdu0AXnqzCYs9Tonre1VqsKgtcqRu
 AQJlLDPey6Tl6tylQUbFNI5moGmZb1QDosfx8XeAQGlfHws0JrxVnqVu62b79mPLukTff0Rfv6Y
 5CCb0UADHDvQd+FI9KE4P3YUekf18yn+eUiHpHIGGBFYbIpZfTkFOK3O335eb3tW9ZMm+e2wR48
 0FzreDVf58lq61TjRuPpN5UXPDIdMQAi6cDjrHe3nCw+iW3prcpvvvq9mY/BPNKjjFURUzJi3PN
 jn2XWZRo
X-Proofpoint-ORIG-GUID: 1clRCVAJ9MAPRz-vXYMkKGwoKqlw2emd
X-Authority-Analysis: v=2.4 cv=NsLRc9dJ c=1 sm=1 tr=0 ts=68939027 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=qLU0tmo_xPokh9XVZMUA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_102600_623329_E1AC7D9B 
X-CRM114-Status: GOOD (  12.67  )
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

commit f4e526ff7e38e ("soc: qcom: mdt_loader: Extract PAS
 operations") move pas specific code from __qcom_mdt_load()
to a separate function qcom_mdt_pas_init() after which the
pas_init variable became unused in __qcom_mdt_load().

Remove pas_init argument from __qcom_mdt_load().

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
 - Added R-b tag and its order in the series.

 drivers/soc/qcom/mdt_loader.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 2a14ba9b0fb6..63af3e97c93b 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -333,7 +333,7 @@ static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_na
 static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 			   const char *fw_name, int pas_id, void *mem_region,
 			   phys_addr_t mem_phys, size_t mem_size,
-			   phys_addr_t *reloc_base, bool pas_init)
+			   phys_addr_t *reloc_base)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
@@ -459,7 +459,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		return ret;
 
 	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
-			       mem_size, reloc_base, true);
+			       mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load);
 
@@ -482,7 +482,7 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 			  size_t mem_size, phys_addr_t *reloc_base)
 {
 	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
-			       mem_size, reloc_base, false);
+			       mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
 
-- 
2.50.1


