Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49585C87FCF
	for <ath12k@archiver.kernel.org>; Thu,  7 Aug 2025 07:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SdrbuuxHkEeQigeY7KFKAwRwQZ1v06KXS3AqG305+AI=; b=26gbfPqfcfx0KMjhlVKw1IKZ6F
	+9nHiN9jvGcmxRNeTgDB1qh288WQolIGWfd0fjVSa8tS1qcoUxeA4h+W16CKQs+keo1MqyjTZz7L+
	qHYNIBtqeGcldyp0juqeiKPDrLVc69ujiOdtDsu4qQS+mR7CjQ5jysLlWB+TU5WWJWkwLG686l3lA
	sw3FkQAHeTPZGGmiASFeXVQ4HQuIPGXHdsdpbyg5qsmAmeKsH6UFRomY1JBIWaIaZwCFkYWoqEg4S
	wBTIlslrJV2f4rxu2smtCWnofyjCEkP+qMznhO6KxnErnvu1HkUuRzEuh7fkPOcaxeHyJJzI8E/aG
	GWTfJ7FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujvNx-0000000HVcl-06e6;
	Thu, 07 Aug 2025 07:50:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujvHa-0000000HUm7-2p14
	for ath12k@lists.infradead.org;
	Thu, 07 Aug 2025 07:43:28 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576NfXsO019899
	for <ath12k@lists.infradead.org>; Thu, 7 Aug 2025 07:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SdrbuuxHkEeQigeY7KFKAwRwQZ1v06KXS3A
	qG305+AI=; b=nBdaCbm5x8LI4sQsiTXL6sdEItOKhtIwIR4NWJd9vFS8SIpVBAM
	N+RzVIvi2W0ZmCoak2/+cJO/0KH4qzIviQZcXra7qc69fbVc0UvuiCCKqItUzlJQ
	lvH2/THLqc1P9DInQse5YBUs7Mwn/9M+ee90lRJf0VOkfeP+F5mY47BPHZNsR1u0
	m11Eu2vVsTZN8DvVRq4qAkIz7AP3hjqbalATTEHHqiQJnU98uVpT8pTkaR359kTF
	bKnwshfhDwMFwaFbPMHaraW6/UMZYEpWB2g9JXAqKgvnJqp2UTW+JQqVG4C/HkD4
	KzwjHLWvZkAqXuwWUzb0VxGNfJcqkgaqWGQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw1dgyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 07 Aug 2025 07:43:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23fe26e5a33so10905525ad.3
        for <ath12k@lists.infradead.org>; Thu, 07 Aug 2025 00:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754552604; x=1755157404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdrbuuxHkEeQigeY7KFKAwRwQZ1v06KXS3AqG305+AI=;
        b=Xm2qUBlxwfK5hpWeiKQxFxzDu+qv+3iXBir59FHRZb4eyn5ur3X1eVsmWV+v6h53qy
         X8dpYmxCGb9rvQfjRhraLrkdiuFcw9uGAVgU36inuMZ5nq4SuAgx0NraiQjI0IZo8Wdz
         q3JVveEaOQN2z6lfC56XUb0uWHyIKZUsSYnAYgNudZ0+GvaYBdc1l8au1g5UkT1WuDiG
         NaO9LK6b9gAVOJeVXAOXGO9JDsvNvBP52CqXdNQjeyXB+E6nKAk9bxFk9FKgN0Lw2U9X
         aKIMpYMOd7YMyNFnURVHvneAol1ec3KX3wndw3KzPchlnvIAHqyNNmhNt63MvJjxN3SR
         RPZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXu41wWpHftxSWbnP86yDf8zbCcEE4UBWBlVZ6LZaMJzbOFdnrzet1BT2hyhmgE2DHH81ERVuQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxgOIqdCraPdI3COBFMQt0GEx8NhFxYLXGeeojz2BE/NwQmFWJB
	dpaijW+NA3/gSqGWmHoX8TJb9lDjgOSS7zJRZ8c4k5V08NuJJam2VgO+kp0ew59WXZw819anZDD
	KnXSxBRJjNYh6RqigwVrtRK1x3as2w1p9XoctnVDox/1ZFtWEKj7W8TfrHvB+aqV2
X-Gm-Gg: ASbGncvLA63X9/g9ODsHVsoNeCE3AKOWNG3F8G4lFHeuSXTB/X8g4VMjnYAuQYbuJvX
	JPv8jjui1wLYs6zL7dnsynqqQs2UN8708cTKoQkpSNA6tv18LJ+j+LsvWPANrVCqqJ6dm3xKKTd
	KGHKuLKh9vnATyepZx9KwQK8NyTdUusfIEwNq4p2DoeRSRO4hku33uzRyq/LS/3YgH8mtU8oWqv
	ISzeI5mTY9zBd6CsWShN/PeC84MOHfK8XolsdGBa6z4YLpXKgbWLICVBbd+7UftIbLRwU0MMFE5
	E2u9aKHluF5gOI3O2FfRIlIKrRB94azspLNn8510dtg8zCVduVM3QC5wkGVoNpZxqMM=
X-Received: by 2002:a17:902:d2c2:b0:242:9bca:863f with SMTP id d9443c01a7336-2429f5bbc5fmr72030745ad.57.1754552604159;
        Thu, 07 Aug 2025 00:43:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHANSCJfj5IWevcX9I21BsXg/+4n+zB41jVKkCMdFHRNuqkAEqf/i9yKeqzmpgMCnYVJaYulg==
X-Received: by 2002:a17:902:d2c2:b0:242:9bca:863f with SMTP id d9443c01a7336-2429f5bbc5fmr72030435ad.57.1754552603705;
        Thu, 07 Aug 2025 00:43:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef678dsm178166395ad.39.2025.08.07.00.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 00:43:23 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [Patch v3 1/3] soc: qcom: mdt_loader: Remove unused parameter
Date: Thu,  7 Aug 2025 13:13:09 +0530
Message-ID: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX6dDjawdTqAQ5
 2OM0LqnUkJV/txN7CVXVI2JHcOIX0Um4IBF1+kzUOwCTnowxSu4PhOaF2CToPnBGs5vGWiNRGbX
 H93EsaX6ugm6Hsn7yahf0nMkBFdl48Ej1NnrpCaytNaXQV8NmX51k8hiwEzmPyCwzTu9GJRIJ4K
 MffSVAJTqbYTOugG/PzoRaPpv5+yAuP3+UqPECQByVjb3On93fSA/G9fHdXnq+INtxCz3XsyZfI
 iPnTKV4zfsrj5PTvqiGdcmYJVgEe4oxzSCzlchG0jzazNBm3U7NBuRc4CQdE7Uv7D23WUeX1vta
 2Gk0OYNbHBTi8hKIc4VCQw9VmWEYAl14j4xk1s001n4wKSInUl8Rj7kSidSWNYiLSOREU8jG160
 HaNGUBX+
X-Authority-Analysis: v=2.4 cv=Ha4UTjE8 c=1 sm=1 tr=0 ts=6894591d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qLU0tmo_xPokh9XVZMUA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: NTmbdsoM7grLMx8l7NkIiZrm37o8gO5q
X-Proofpoint-GUID: NTmbdsoM7grLMx8l7NkIiZrm37o8gO5q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_004326_829457_1A6C803E 
X-CRM114-Status: GOOD (  12.04  )
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
Changes in v3: https://lore.kernel.org/lkml/20250806172531.1865088-2-mukesh.ojha@oss.qualcomm.com/
 - Because of the drop of 1/4 in earlier version this becomes first
   patch.

- Changes in v2:
 - Added R-b tag and its order in the series.

 drivers/soc/qcom/mdt_loader.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 0ca268bdf1f8..dfd15d189087 100644
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


