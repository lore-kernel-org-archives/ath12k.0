Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521C1CA0EC0
	for <ath12k@archiver.kernel.org>; Wed,  6 Aug 2025 17:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5V4MfdEEJjFqpxnuJxY+w9W+JqTRsjaxsk3+BJSZB8s=; b=d21DjaQYrdrIRfcdjYA6Emn5Pl
	YBHXFCOxWy+gwRwJYYPjSnJl4ygUrjLANysGLWiyWc68uyOtNJ77xVlZ9j5bX/DwC3GxDuTqcwNeV
	8MtEjJpVkgSjGbzOikJXqeLkF28zOup/nuwFEof4vZvuhGZOVbl2IFs1uo0Jt3sf/RmqnzQ9oCVQQ
	1hdAzfk3iihDU2LIABUOXbF9jOw3GpkJTRJLFWxGUz5BGqxAT5j4OH3d09GJBMs9OrQ1C3sGbUaxe
	WoSbfY+bEU+D+GTjAFss91e38jJXZ4lb5FYLtURoJQBn5gdeeFxpgXyhYy8F7xjBzQSc3kEmqdxLJ
	sLdAfy/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uji0N-0000000FwQ2-0Gbt;
	Wed, 06 Aug 2025 17:32:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhu3-0000000FvR9-0XA2
	for ath12k@bombadil.infradead.org;
	Wed, 06 Aug 2025 17:26:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5V4MfdEEJjFqpxnuJxY+w9W+JqTRsjaxsk3+BJSZB8s=; b=nocDY9hjscGzpIvGb8N4y+p5Zk
	9KVB1TiQtbFvmH5w/uX6EejxCBnZ/5/VDYBHdG3GCcMusT13ZKDIHU5OqjJR957P/qOEgVQlXZ8mD
	EWTLEZSTgD+gIBkcPq8DiLIpuO2xc2/kEUYCH2B/A8kUiahPpyxoc04ovY2RR0q4XNK/NWApP4k8m
	dgEgsLzCAnsBWk1xXwZS+YjDJy+zlOp+5Gr1Ujvrn+gnliXAvcBlFKcWZIUKdFu45HXMCcJBs5v7T
	XxlYuC1b01nvPLcw6MQIOTZAx8n/7tlyrUJ4bja+sWa60Yagh7/edAWJBIDqzFiF4OaqY36U3MpSm
	4usBXICw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhtz-0000000ELB5-2upX
	for ath12k@lists.infradead.org;
	Wed, 06 Aug 2025 17:26:14 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576ESBJJ004973
	for <ath12k@lists.infradead.org>; Wed, 6 Aug 2025 17:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5V4MfdEEJjF
	qpxnuJxY+w9W+JqTRsjaxsk3+BJSZB8s=; b=a1ETTCVE3M5VttGfMhCLvribLSA
	V4YlRLkXvHdLKyegh+w89ShSkseZsFeEU3LABX5s/QN+a5Gr5l9xBneU8bCPju24
	3L23tP2zJUvKmYeqraXw3oBhtCpPf3rm3LRZtwY1FkHHKQtu6cyRjj3atDddp3EQ
	zm1IIko37h2pG/INl1SpHLGs29wu7NgosGTwYSU0AVGiuSO5H+Ux1Dc3MFr9Gwt9
	B5FGrcZc+1WxNsOeA4PnhUXLPGNSHjGAlkswAm5cueZziRrEh/QHb6EB2Z6o/4yh
	rRrJkhkD5+sSN7CcxrerbMd4onb5CxSMJtOe3Bn20Qye74m7zuJylCDNgqA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c8u20hvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 17:26:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76bfab12672so333429b3a.0
        for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 10:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754501168; x=1755105968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5V4MfdEEJjFqpxnuJxY+w9W+JqTRsjaxsk3+BJSZB8s=;
        b=u8GDhQnDZ9qJJ/8r04+nXxlWFYsZ6/d3DqPVWnbb9K4KTez/lR7h2yFNx+wZRm3Im7
         B+qS8f8F0YdRG2p6qnfppmycp2cHZHxklhjOHeMi4wW+0QBknCoK895G8FAX/2XB7FTL
         TjFW6vQxJ947KsB1b4jcJbbfKkDYjdvnjps6FZ0C/MwdcA9yTjogRhEkOT3/JdhKyzm8
         YuhKj9NhmQo/MySbEMgeboM4gtcstZqlnBTRIS8Xd4Q03fhU6heulgr4EJR9WZd3Ytl7
         +UanP7VLA8aII1fx6a33SoRNIQVsjkSr43QNjKkPoe82jVUfoW7Au1tipRDvwp57eDrp
         1ihw==
X-Forwarded-Encrypted: i=1; AJvYcCW4xC/UHxzbyfLjfrr95M9kgrrwhxsAqBj7lUANc8oXma34sdliS9U9jYfKTs/cOOu9SC+hUes=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTzCuQ51g9ICTTLMVIz+HuMk9Bhv70/6seyKMvQs7cBfZbp2D5
	Rd38cgbaAE6o/Z+qer/dIR2M0YZOI7xkuD4m4aAGVgpx8abjajp3K2pn78zqJIHeOX8ufefw9an
	cSRN2ppRzdjRieZ5ajzI1BxCsn165yccn4glaJPf+zkpY5P+qJ8yI6QiUSx9w93TI
X-Gm-Gg: ASbGncsDtzF6pWqb7IBmyltwmPJg/Nlmzr7ofyFpt84E8vasugguaWozUZIN71YEYl+
	lDJMUs47WMcYrY1ChW1lCWtx47cqKL391Pb7s9DC3Ed7tFKnCwt3ihXqQw9XpvPGeF7E/0xf1v9
	/Taz6euD+6OCF1qMPj1Yf3/J80fTXSSJtYMblaVV8ys5kmSldEzfVkKPaYIJyUPMQM3hPcUTvMy
	IwjEWrOVOia/xQgMOXBH+/tCAk8G49tM1W/totkDMrL3nfvJRQpI5e1duaMo84/tG1z6cc7rhQP
	zch0HNAZYLckXdiZWqUG2OXlNS4s5VT3F7frd2iQIJADEKEcqiATF+qRFjUDI0u76JA=
X-Received: by 2002:a05:6a00:8d2:b0:76b:2c12:334c with SMTP id d2e1a72fcca58-76c2b06edb7mr4844974b3a.23.1754501168288;
        Wed, 06 Aug 2025 10:26:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJeF+hA3Sf4UAVGOsX40s2DjOot938v+1PjGjJpA2MdTWEdlqDKL/EvOlgI7sVXx1RVnBAQQ==
X-Received: by 2002:a05:6a00:8d2:b0:76b:2c12:334c with SMTP id d2e1a72fcca58-76c2b06edb7mr4844944b3a.23.1754501167795;
        Wed, 06 Aug 2025 10:26:07 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f417sm15866210b3a.44.2025.08.06.10.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 10:26:07 -0700 (PDT)
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
Subject: [PATCH v2 4/4] soc: qcom: mdt_loader: Remove unused parameter
Date: Wed,  6 Aug 2025 22:55:31 +0530
Message-ID: <20250806172531.1865088-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
References: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: o4FMCPJMRgSRbpGCBMl5snZ11--dXqZC
X-Authority-Analysis: v=2.4 cv=Q/TS452a c=1 sm=1 tr=0 ts=68939031 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=QQi8RNdjS96tJPzaHcwA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: o4FMCPJMRgSRbpGCBMl5snZ11--dXqZC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA5MCBTYWx0ZWRfX+t4nvbALHZxB
 kAdPO17XNLksWBWrexuo9I9XuMjwubq3zFbJ/aFKGyzNviWqCPLm4qE/D9yoRk0iPpQmtCaQ/gt
 M2PnrsmT3m8F83WdAwNIbiXZlBOlS5OdtvaLH1S4VEGJaohHi+wTo4rPy7Mu95vOc46rfZD/wM9
 31J/Z6frxM7AEWbZCMOGgNpEAi1gP9AApQ4u9GVWSOAdg7tzHXawP/yQYd/UBSiWomPzCYi03Hd
 FHVLUaE5RL+Zwgq8hNjhG85X82qeS7gFmsgf++rinepbeeuV+UAnIQqwuGCbz2HQ9ESx623oylO
 ML3VEO0ueGrtZmJKS8zslEq/OZV+24FP7aJwjLX5bbQrkZpW+p21FHtFwr6KLCNC28cb+jW4zcG
 /p00fnmA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_182612_177970_B5420266 
X-CRM114-Status: GOOD (  13.22  )
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

fw_name in qcom_mdt_bins_are_split() seems unused now, it may have
used in the past for logging it but due to code refactor this parameter
is unused now.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
 - made this as separate patch.

 drivers/soc/qcom/mdt_loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 145bd1374f07..8210fb3dd51a 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -302,7 +302,7 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_pas_init);
 
-static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_name)
+static bool qcom_mdt_bins_are_split(const struct firmware *fw)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_hdr *ehdr;
-- 
2.50.1


