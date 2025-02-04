Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19015C02193
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 17:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrKlYNONBm1r5bugr0RbvCDOyfxt2kBDOYEM2pahFGQ=; b=BJ+SU/JSiGceSHf2Ue4wJMTXra
	kMQRF6qOkm2YXSudxCoOmlzPSKy04AK0F+u3VYvlVq0FRYH4BneTJzdrKm+d/En0/eYwJQSNPrRA7
	S6MPB7Gcxt7OskXMPtRR3cPr154/Z5b9mRYjvv93P/TLJ5sclFy8C+Zxv8wMTHaSdHmmlwT5CX3M0
	8XDVmxawYCJQMYqRzMXJ8dLjUI/rKeLjEwVCOzwA++Y0g/Vq2QyoLGGV7/g9vNnxLNaiW8FcI5fxo
	e3LL2GGgQITfeRZNGB2OnMl6bVJiet7tL8iEsarOWyVmAcEO3PQx9xBVHe3mvHX4N3CJUE+aSOfkz
	HzyZP53w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMMa-000000012Dd-37Zc
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 17:05:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMMX-000000012CM-1AES
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 17:05:28 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514BYgP8010444
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 17:05:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WrKlYNONBm1r5bugr0RbvCDOyfxt2kBDOYEM2pahFGQ=; b=my25fFqzDZynRTF8
	ZtTiLNJPyBxvtgiqAsyOKWNfPCjzCIv/IX07UbjuhJ/snfG/5buEQwT1CBhE3Jcf
	9R74YKkfk0JeX3e91tdHUGLcJ15zsAvyxDKm+3DcVESp/3Lk1QgQ/BYjM/bgnDkC
	WuI0DX9yTygNeAH18B6GyOtKYabAW07LL0/Y5WlfRh7ScLBuAglCtOkg7SQEh1oW
	9NbhfDMByfutDseivc9BXZzT6+fQLv5hZV8239EL3Ca1OgosqIrb2cKrtPi5k2cu
	pq2kU83PZ7krmU3pwNunafkSMAaO+CH2EQBq0+1TFC68ojyu2L1NgTRGwil5ijVf
	QPByUw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kj4ygsra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 17:05:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2167141e00eso136283005ad.2
        for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 09:05:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738688724; x=1739293524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WrKlYNONBm1r5bugr0RbvCDOyfxt2kBDOYEM2pahFGQ=;
        b=w7/bxsbq8o9BXEVtsznc2+mSRwyaTw+JQ7jkmSq6OeaK9FzB0/tMPkrwmtMhuRrJOf
         9yYjsMTQgiGsYjurXnPk0tDHdkzaIuKxMb+yH943kc22elvMAWoJSERTVv6ktDFUHrQ9
         OdbXMV+zSwGiedq2FqH5YojJHN8KOT1mNSeAktVpIoDd3KFXQ46bQUJSXTYo8CAK9dIE
         30VC6V4DscPMg5QCSy2jMRFCKwedpURkTNP2d7NhM+DJbRrt76H1LHmPX+qr+GgZsMZY
         g458GI8gXRR0Rh70q7x7CIRBx0kT2sYcBqGugdpQZ1+VBKdDCdKtYFn8knDNFi2pyhmC
         6bMA==
X-Forwarded-Encrypted: i=1; AJvYcCXGurEkXpXNqoXFQ0mH+Vf+QH1SMkNQ1YFHSx3Wyr3BM9mKl8fEY+uCYPXY2Vzz/L8PcrXLKeg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQS3Bbpvr/f10xMnaMSBokTKR+sQS/K7hsB7pbq1dU0+KxkITd
	pMg3g31Ens8dbtY9xlbI7d79Iy1pZjebpAX1Aet4NKbfONeLPK82rECzA+AhTBAHRzcDBhNwbUc
	IO5tZtPaHzRwfysWBrtqm0B6IHM+Ud4fnKlFsNzsKdItwoLAVXp/yizAFzrp4fFXopmaT
X-Gm-Gg: ASbGncumM1ELnlXucopNy3lHs9yxR8Ou+6CIGnayU1uyF+SWn6w0SEJwPFhP6pker1G
	g7+TfChu0ig9r09Sjqe2rZhOsxbB9+PbA61ldLNbltMUIWhxBHnV0Kzi7wcX8JNcbBFbY/oLInB
	E/j0Xfw0cTpFOyuZ+x30JBApBkrzwpJIGDeDqnJN6cURjYMknGvS/tA6V+hIOeVHCGNjHHnkzWX
	VHneF/ebsvSsgEuIimPRJr737+zetoc9J6EfYpQdyUE8/a/yMncpzT2H0n0eSQ3Y2cryr4RNbGm
	ynwaLpE6UOJCS4IqqsUo44YYLlHzCisKnRbx7yWar2voSvsnnMqXfkCVg1dL6xczTHYmx48slxY
	oGn6iJhRfdhgwDAUWyV8/ndXhwV+/Qg==
X-Received: by 2002:a05:6a20:9152:b0:1e1:9662:a6f2 with SMTP id adf61e73a8af0-1ed7a6e0b73mr38361973637.35.1738688723422;
        Tue, 04 Feb 2025 09:05:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTnmMsoLQ66Rol4cur40Q4wmBOZ7g7tduU57E52w28CdMb1zHUBV1eaCLvbB3xc7hYjBqb7g==
X-Received: by 2002:a05:6a20:9152:b0:1e1:9662:a6f2 with SMTP id adf61e73a8af0-1ed7a6e0b73mr38361931637.35.1738688723004;
        Tue, 04 Feb 2025 09:05:23 -0800 (PST)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cddbbsm10772788b3a.125.2025.02.04.09.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:05:22 -0800 (PST)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 04 Feb 2025 22:35:08 +0530
Subject: [PATCH v2 2/8] wifi: ath12k: introduce ath12k_generic_dbg()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-unlink_link_arvif_from_chanctx-v2-2-764fb5973c1a@oss.qualcomm.com>
References: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: l00uURlA9EQB-R7HdH6z-lLl6ijiMPIu
X-Proofpoint-GUID: l00uURlA9EQB-R7HdH6z-lLl6ijiMPIu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_090525_328254_3EB72405 
X-CRM114-Status: GOOD (  15.32  )
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

There might be instances where ath12k_dbg() is needed, but access to
struct ath12k_base (ab) is not readily available. To address this, add
support to print the debug message using printk() when ab is not present.

To avoid the need to explicitly pass NULL each time, introduce a new macro
ath12k_generic_dbg() which resolves to ath12k_dbg() with ab set to NULL.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debug.c | 5 ++++-
 drivers/net/wireless/ath/ath12k/debug.h | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/debug.c b/drivers/net/wireless/ath/ath12k/debug.c
index fd9796b5ad3b9feea5c7e78e8a88d361049e08df..5ce100cd9a9d16f7fcc2dc0a5522b341ebbff8a3 100644
--- a/drivers/net/wireless/ath/ath12k/debug.c
+++ b/drivers/net/wireless/ath/ath12k/debug.c
@@ -63,7 +63,10 @@ void __ath12k_dbg(struct ath12k_base *ab, enum ath12k_debug_mask mask,
 	vaf.fmt = fmt;
 	vaf.va = &args;
 
-	dev_printk(KERN_DEBUG, ab->dev, "%pV", &vaf);
+	if (likely(ab))
+		dev_printk(KERN_DEBUG, ab->dev, "%pV", &vaf);
+	else
+		printk(KERN_DEBUG "ath12k: %pV", &vaf);
 
 	/* TODO: trace log */
 
diff --git a/drivers/net/wireless/ath/ath12k/debug.h b/drivers/net/wireless/ath/ath12k/debug.h
index ba0e4da3bb761a49fb81e3efcb61557df8ad1942..48916e4e1f6014055bbd56d5c71ef9182c78f3b6 100644
--- a/drivers/net/wireless/ath/ath12k/debug.h
+++ b/drivers/net/wireless/ath/ath12k/debug.h
@@ -69,4 +69,7 @@ do {								\
 		__ath12k_dbg(ab, mask, fmt, ##__VA_ARGS__);	\
 } while (0)
 
+#define ath12k_generic_dbg(dbg_mask, fmt, ...)			\
+	ath12k_dbg(NULL, dbg_mask, fmt, ##__VA_ARGS__)
+
 #endif /* _ATH12K_DEBUG_H_ */

-- 
2.34.1


