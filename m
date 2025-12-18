Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D469D68BC9
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 01:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JmwHcVmezRhrnG8yMV9bsbnLk3k9piD14PfETaftqNE=; b=OXZ1+OFS/ySBrGzLUgXvNNGX9m
	jX2PnSNEGqPcQZSDoFOZ3/1Jlx1pojgP3wRVFelEWSXbUgeiijHS3J7+CG6k2mZMmmqHUO4ifNpJw
	UyRiXk2Ym13C0nxFiXuKte6YQB+APDOAuZuwIsAAVjvMfN5XIEmI9+YBYayV4012Cv7ULuNUuuB4v
	fSeLiAYOU8f3KGIDdXyD9mxCdnTSZpUweVAYA92CXhJ8Xwx2RQRh1asGn+4O/lcc3EvmLnUmI6PNQ
	ycxr9rP5VJmpjb8HlOnlc6LQKoDcP+EK6cwr3MUug+D0+msCZ0ECa+4b/N2qOcbjZKpzNVDlmaM7u
	xdvNIGSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3Em-00000007g0J-2ttM;
	Thu, 18 Dec 2025 01:55:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3Ej-00000007fwG-3BZh
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 01:55:27 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YUPd174246
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JmwHcVmezRhrnG8yMV9bsbnLk3k9piD14PfETaftqNE=; b=JwwB1kjImNqM4xRW
	byCvvK5WmnG51xm86sHLF/2VgGaGZbSYZcPu1vcM8xwgeurEkJ59LTfdQ1fL6efj
	WtU3wn7jF6Fvq4a/SPViYWFGpXE+QDLcYoZgdKRbE7hShfov2snVm6gYVhzEax8z
	10iFKM45YviZPY8vZtDjYVzDXD/EgSZIIPiM88TnAyybR6dhwhdmKtOiCQ6ojM4H
	pnH/1u+VwY9Er0MREJ5NsP4BQiL+LMfwufU0WUVNyxTuvYWIIi/Rd8LJP7qbVbN+
	nklMThzN4NuXsseE6DRqdnze9qa1G+c7bE1TWTnd3AMmyix7UMKuVIzOO/Y4/eZd
	SwEJWA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b43nmrqr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f13989cd3so4023575ad.1
        for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 17:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766022924; x=1766627724; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JmwHcVmezRhrnG8yMV9bsbnLk3k9piD14PfETaftqNE=;
        b=BSvMGOm93MbCiB5I37eNgcpDIciDNCCrjweo8+EmtFx4deL0gjClwaiuXVyCSR6y4B
         kPi2EOfo9BGO5CNCu2Nv9f2caoiCHd61Fx3wCFZcd97uw33+AIF6hbaNLQa8LnKPWQNL
         apSPpiCkH59s07xMF49BeO4/wJpE/EL2QcnbpK04o+F1srCalUllXMk2iLdvnH8b+O4S
         Kx9ORqDereX1BeaTWezRZI8YKyl9H48c1Iqxh+5nxaiEuo5iFhRlR6FQ9rl04ECyCI2X
         A9j8ML5ZXkmdRaxsdLB4iVy4uaCHG5EtTph6903bLMrIPZK26QiemJraBwn7x5Gvxh6T
         JzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766022924; x=1766627724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JmwHcVmezRhrnG8yMV9bsbnLk3k9piD14PfETaftqNE=;
        b=CkeusDQ7+KQgn8ivcNVdIWp1vktAf7NVprFdG1ZakUzGR6OClWYqbPFmNfb2IV+5FZ
         lo3amiZsFpSCY6hE0ZR1QoCuMtZn8flwS6VJBVsd9r+FSCEceoGz3FPOEk6z1mnWJALU
         XHWDvXK+CllBV7jFmhQeDWndHZIx2393ajgRJaflCHejwLzDK6ESVe1yKzgU+cr2XLgd
         zj6epmDuvnTpMkqw1uMOP3kVWwAIJkzjOqpHqOHQAcJdPMzpbcQcVXnl2Gae4YRpLH42
         TbXfliN1XCOAeqqmsYsJPcoFg4+3v3jeEZZtAVkoNo5pkiAclAFTwO86HQEHV29WHhit
         5eOA==
X-Forwarded-Encrypted: i=1; AJvYcCXzTbVqTxkB5EZAdieSiUaeN9UEvXMSjOQhinsxOZBx3ovNxch/erVLWghcleSceJUs5Fe/MTs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgyw5e8Pqgu8WmffkHZ/5QNSjbBd8ZnlFB0wFS0bL9cQTRifMW
	MN4YND419DDFgLxwqEKQDIhtTMKMaEFZBRixCP1QtWt5LhW41AxTTHOyycipq3XplWsjKEYsI1n
	D17JJt3DpHIIlxV4hUC0bzPHfdUclajLrMKWFyRxRy4PrHgI27hhOnox5l6GZ7i9ca+w56A5roW
	Q=
X-Gm-Gg: AY/fxX5BgwFvqfcyVihV4UZIuS7GwO6I8GDmln1TP5OlaZZ9NJA9j1p9ZSJ0iNSQ7ua
	Ult5GWa0IRwUudvk3lFAIxbUiV/La/XhXpxyP7SstgZTb810RqNARsR3an3UodZAD1kmkXAHELi
	Uy4uam8djYzqp6z6lQmbLRKPU9uuOtk7F9RamsqEUvJchqaieegoxOSVqEc4Yte7fRzWTP0vngz
	OFHfpGr+cvRgOZVRu5MImeOdmGgd7PYRdmLfrgpABNaOyWN5sGzW2l/mGguN8dPMc6l6zE62RLL
	TN/Nc6jyvTN2/CNPqOpvoCJZ2LKjeITEwgA98+RZT0D4LcZzWyg/iQVWYYVzQRdSB0U6nk/HCor
	ilhqmJ7Qk91STQtp8L0zQcpmT1jrPk1TwMX/Zbwb6KClWHRYpOepB+pJSo4qx6CI=
X-Received: by 2002:a17:902:d4cd:b0:2a0:b02b:210c with SMTP id d9443c01a7336-2a0b02b22ecmr136966295ad.1.1766022924388;
        Wed, 17 Dec 2025 17:55:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCHPh2SMBA4kvY2/T6PZDaUUoqMSefKTvhbtsXw6jwvEBIHpKJw+LaKR8K/czXCyST0j7v4w==
X-Received: by 2002:a17:902:d4cd:b0:2a0:b02b:210c with SMTP id d9443c01a7336-2a0b02b22ecmr136966125ad.1.1766022923937;
        Wed, 17 Dec 2025 17:55:23 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d087c812sm6548175ad.15.2025.12.17.17.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:55:23 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 09:54:24 +0800
Subject: [PATCH ath-next 10/19] wifi: ath12k: support LPASS_SHARED target
 memory type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-ath12k-support-qcc2072-v1-10-87928cf8e547@oss.qualcomm.com>
References: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
In-Reply-To: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: Jz9h-5FuHdpHz9GTY2XQfOM2GgAp8Yuf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAxMyBTYWx0ZWRfXwM0u0nZr2Sf8
 hTgG+dS9+MzM1TgalUVr0xj5gl92McFB7D27oRiCo14j9HVC42+0Fp8BLYEbIDcTUrT5BYYhE+T
 csbHS8wp3yJK2aFMKC1LlMQcb8iT974Ny/hv/CuEBvDBN15ix8IkxtsXq81q9uUfpis3fUsJG9x
 tWrL+CUsWvyNItmDz41Rg8nANVNA/R811iIEhpYG8+R0I8/71l5CI7JMHPnhI8GpKvhUZ9NOStR
 dcEf8NjfnM/rFDbZRcxN38JIRwRFRhssdbd1vG8P9Qjugdphv82MhY7d9L2J4U5BemxcGF6fJGR
 hhxC5X/eZ7YkIfrTk0BDnFDj3Q2Am7YPEkMcJTLyXMy4nBNfXtE5FA3cK2Cym692+M5IInAodn3
 lqYjkoc6cct57qdECxIemomdxQc+iw==
X-Proofpoint-ORIG-GUID: Jz9h-5FuHdpHz9GTY2XQfOM2GgAp8Yuf
X-Authority-Analysis: v=2.4 cv=A6Zh/qWG c=1 sm=1 tr=0 ts=69435f0d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=aY7nMJUTrloBAr6TJikA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_175525_848228_942884A4 
X-CRM114-Status: GOOD (  10.99  )
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

QCC2072 requires a new type of QMI target memory named LPASS_SHARED_V01,
add support for it.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0-01560-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 1 +
 drivers/net/wireless/ath/ath12k/qmi.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index b7c48b6706df..4966697f4e62 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2609,6 +2609,7 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
 		case M3_DUMP_REGION_TYPE:
 		case PAGEABLE_MEM_REGION_TYPE:
 		case CALDB_MEM_REGION_TYPE:
+		case LPASS_SHARED_V01_REGION_TYPE:
 			ret = ath12k_qmi_alloc_chunk(ab, chunk);
 			if (ret)
 				goto err;
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 7a88268aa1e9..050dcaca1cb7 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -178,6 +178,7 @@ enum ath12k_qmi_target_mem {
 	CALDB_MEM_REGION_TYPE = 0x4,
 	MLO_GLOBAL_MEM_REGION_TYPE = 0x8,
 	PAGEABLE_MEM_REGION_TYPE = 0x9,
+	LPASS_SHARED_V01_REGION_TYPE = 0xb,
 };
 
 enum qmi_wlanfw_host_build_type {

-- 
2.25.1


