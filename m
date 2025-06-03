Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94A2C61DB8
	for <ath12k@archiver.kernel.org>; Tue,  3 Jun 2025 10:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fa99oeqBEVDBB20FC594I9GHAUPXnM34rcWckS+ZDsU=; b=NkZXBh+g0cEPIeIWDEtuBa1oXZ
	VTIBKZrU5tvOIP7S6Pt4PegFUFTuEjJzRita+6l0e2n5wBtP+e0tOhby6Hs1x+0oOEMF+LjSKuitq
	DQmQPVpiBIUtcOMNab90EeUEHoXCXTzIcV8R3L0zU5pNuHLRW461CZGGmfiyo+zKPalmBHvl9CJ58
	l694CSr6ld0Lq7r0lwt1dUgZ7QOXsAnj5jBOWaeO3XH3pUADtehXVopgr1pFcxqlzgdK+gA1kGTwH
	YGU7aBqErVpJzU9ZfiRf9A53MjW+UNnvc/RRU064LvKdj4ds5zvq/v5RnE5M725d7JHbSdghzV7KH
	mzfRbXDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMPBV-0000000AhZi-12kI;
	Tue, 03 Jun 2025 10:47:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMOzs-0000000AgPA-1sXq
	for ath12k@lists.infradead.org;
	Tue, 03 Jun 2025 10:35:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JT4v027704
	for <ath12k@lists.infradead.org>; Tue, 3 Jun 2025 10:35:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Fa99oeqBEVDBB20FC594I9GHAUPXnM34rcW
	ckS+ZDsU=; b=ix/UjVx5y9Mi9CQpCTBHkeufX6PaaD9YkJs9tsfaYJVp67SCXph
	ZyWTSDSZV2pa1v/6hMqxg4Ms+xEUq0XdjrfXIrn90rlPGZf8QfZauyWpRYJD+Wfp
	1q4i88zqRHX5OrelePLxwmB/ff9g6uZrsPGIJ/KmOJLsovWioZ2DhMGTZWpJsSRA
	A87PDMggDgYRXkAOwdMZWD5sf23TsidSeRtSExZ+BRC7mezxZfjZq0EO6cGlolpH
	1HzYnvglE4hQhzzvXAc1iB5YlYGMjeY1/U5AUje/4kOWjeaf0HHRavsel7Prx8BF
	sSSaCMPJijAKKa0eW7bfjA9UPmYOmuCbEEg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t2919-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 03 Jun 2025 10:35:55 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b26e6b84a31so3289498a12.2
        for <ath12k@lists.infradead.org>; Tue, 03 Jun 2025 03:35:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748946954; x=1749551754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fa99oeqBEVDBB20FC594I9GHAUPXnM34rcWckS+ZDsU=;
        b=raC0n5pOPY7i9ncpHVOOl82SK54/fI6Abyy8pdAabDOX4d6wLhqg+b76/YA9XjrH3t
         X5BSJsMKDkLPNPAI/XKlyj19Ow2L4Hr2GzWtzUWH/DT10ril7dLCtOCUHpeEMQfIkk0F
         PUFBKwYBYGtqAYLj5VYo9gWnJU8oYswp8RqTjZfz3r1WQK5Cccj6dZRRXIc1ADgiy3gz
         fkYUHnwSlF+9ymOxSNKPn33dhQOtJcVvF//dFX6kjpqnisWtR00Gj8FGHPW+Ai9EblZP
         YlE1fEzvMBxGPNAdD+FCMJK2u5ifKg3zGU7QDRj0k0G8lqchBGP5+u4DzQcmNDikwazv
         55tw==
X-Gm-Message-State: AOJu0Yxt4ILDlEe6Y0a4VQE2DUwppXV4jRxuJlQSPp8LkXXUwLLkF2J8
	5hrWUA3T4yuC+A6DQogggkf2TJe6rtYliZ81mJKIthTbA7q5fqPMjE96Rl0RAFPgbQAmEfbSaXc
	DnR0mcu5IwBoUeHWeOq23bbYRpo6OLjqqLeCZcmUsohFrgAGNEdHqi+0uNrKznmyLX3lAJVLB
X-Gm-Gg: ASbGncv/2wdJQ2FSKONBbECSXneiIs9DwaGOYU3aywdfsYpdd7DM9FYw6umCOcmrFoS
	bgoK3OiGKhaE/aSb0dQJTRHGL0dBd2f7zdJIpblR8/rS2PBE38AGXyGSyg9K8mOqtPhOIeK/Mrc
	oamXfDUg019vpqYTfbFftbXCtPgAlK2EprAmfPtFoAoIXGOfIyjO4WSbTgoY6SLcztTZpZ7QoOa
	OWesR8bOLyJxRn03ZEJTwyxQTdv+vnkAQAs/3o99sPnPUm5mn9IiQ3TeOGnWZ+SNc5WZSJ9EkuU
	1rhf/8q+nxS2q0T7zL8RuxkIMBOz3HsjSxI1oykuRRdF1EYc/Q/5oji/GfhQh3c8cKQ1t0XgV0B
	OILr4JqxrjQcMlEYjt/7EMVcFWn99h7jSmI1NzsRi
X-Received: by 2002:a05:6300:8e04:b0:21d:fd1:9be with SMTP id adf61e73a8af0-21d0fd10cbfmr1564520637.12.1748946954288;
        Tue, 03 Jun 2025 03:35:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+NtkerCpzTqcy+q3F3VHXlKBglNwScvJ2CaLnNLZQEAIJIkcg0ytkp7YMd5eBjDiq4w6HpA==
X-Received: by 2002:a05:6300:8e04:b0:21d:fd1:9be with SMTP id adf61e73a8af0-21d0fd10cbfmr1564500637.12.1748946953911;
        Tue, 03 Jun 2025 03:35:53 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f038898f6sm1112149a12.52.2025.06.03.03.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 03:35:53 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, P Praneesh <praneesh.p@oss.qualcomm.com>
Subject: [PATCH ath-next v3] wifi: ath12k: Fix double budget decrement while reaping monitor ring
Date: Tue,  3 Jun 2025 16:05:42 +0530
Message-Id: <20250603103542.1164713-1-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eJQTjGp1 c=1 sm=1 tr=0 ts=683ed00b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=PAAuEJLs8KcRaXcz7g4A:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: Mhi7lF0mXp0CzwtQQegAdui3rU5yJ7A6
X-Proofpoint-GUID: Mhi7lF0mXp0CzwtQQegAdui3rU5yJ7A6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA5MiBTYWx0ZWRfX88ymYH1EVzDk
 /btRk5F0BGEvi09LDR4w/bJjJWV6fqI8+hVRp3q9UDx/hYo/p/9oM38JZhg70fuaV7qn4kzflBK
 Jm/mypa+mmMCbLmQsb7oq0JgvOKrTkpvmLqw13Sro0yTjjw7qz3tLc+hHoqal0e1TwAJVC5bcb8
 Hy1WeFhoK2kUzbn1HNfPyJ9zicG//ZjRK0OfidlmkX+hVfr+RzUU9ooyifo/ev5v8kYydGqIScZ
 nfJQHDMI0G7YKDG5dYtfOuxLU34fCzId6Ueq9A0JDkWzZoT8vh2qsjKPR0pWc9tyLrYdT369etn
 QUZaq+AQpflFDfMx4A5haLIkVUXywaH7/LkDencEyBHZZHgnO+t/yCkpF4HmM2xj+6tq81SO9yF
 aS4S6WnGdu9/a38ydjO1ZwI9kfZ9SIs9Db2vctVIs3vpEB6z2dgKbTPWSUpKqwvb8jk976nx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_033556_490249_C1D4DD97 
X-CRM114-Status: GOOD (  11.83  )
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

Currently, the budget for monitor ring is reduced during each ring entry
reaping and again when the end reason is HAL_MON_END_OF_PPDU, leading to
inefficient budget use. The below mentioned commit intended to decrement
the budget only for HAL_MON_END_OF_PPDU but did not remove the other
decrement. Fix this by eliminating the budget decrement for each ring entry
reaping, ensuring the driver always reaps one full PPDU worth of entries
from the monitor destination ring.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: 394a3fa7c538 ("wifi: ath12k: Optimize NAPI budget by adjusting PPDU processing")
Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
---
v3:
	- Subject updated to include 'ath-next' as the target branch.
v2:
	- Corrected version log.
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 28cadc4167f7..91f4e3aff74c 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -3761,7 +3761,6 @@ int ath12k_dp_mon_srng_process(struct ath12k *ar, int *budget,
 	ath12k_hal_srng_access_begin(ab, srng);
 
 	while (likely(*budget)) {
-		*budget -= 1;
 		mon_dst_desc = ath12k_hal_srng_dst_peek(ab, srng);
 		if (unlikely(!mon_dst_desc))
 			break;

base-commit: ea15e046263b19e91ffd827645ae5dfa44ebd044
-- 
2.34.1


