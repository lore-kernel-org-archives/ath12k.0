Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAF6CCF9E9
	for <ath12k@archiver.kernel.org>; Sun, 26 Oct 2025 18:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=07ocjkdEJGZGwyrHZf6N4TSK9zFMgHbhsQL06B+flvk=; b=SL9hqJ2HCXqbMULh2/H01ZG2sx
	hkIvIZ5I7+Oh6pnx69U0TvjApUFx2Yx1HCpSU++M3/B87gH6vHWhhzze4P+i6+dQdAfTIzLxAn4V+
	dzEiBF9opCNZ7/Zyqfal9s/RnXE0SyL9QMTB/pZpBD9avpuDBuoFnLvrsRdxNETw6UbFdPqL4Syp+
	VRc9G9t5l7P6BvFWe2i6e15ZiEOMKJK2pETp9ZTmdD/ojtRza3hHrJfnNGGjAyxr/DmnSowQDRPDS
	xkNXa1QeMSYh6i6rVJnjSTDzEVwm7wgdm9dl6lixqRifyi4wwDpG8J8pHCDRVMnqmnI6RWgQPg3bL
	+wAmdMNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD5Ol-0000000Ccjt-3DjA;
	Sun, 26 Oct 2025 18:23:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD5Oi-0000000CcjX-42Wo
	for ath12k@lists.infradead.org;
	Sun, 26 Oct 2025 18:23:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59QFQoGh108695
	for <ath12k@lists.infradead.org>; Sun, 26 Oct 2025 18:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=07ocjkdEJGZGwyrHZf6N4TSK9zFMgHbhsQL
	06B+flvk=; b=e3WtgWwG1uwoQhVIig+AHuWLRog7Vj3nHQSPairlQG73tmvrzzJ
	QnXbCMxoicBz0LbA28VatHJCyjMyTYjugxXUPFEM36MwChshBHa9Qw3CrKKaAWkx
	PrS56BHe9s46wcXM/cDuVhI0EJEdwEgBHCLCkPmgKsu/H/4XZXKJTrtnTsdUOC3k
	mmA1jrEG1x+7t3UjrUS5CEq+y+WayoWAJ2ASBvVMy2S809bV+IjJYvHDMwvBShvl
	kCQSCEaMjKgHPIS4UmZJjFcnVhqN/QTsrCu3s1bMUa3pV6h6oKHUjVBVtOQrt7+i
	o7Zm1qrYaneBTjoLgMN1R1FxWaIW7Z9bT4A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0pmqjcnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 26 Oct 2025 18:23:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2909daa65f2so56694545ad.0
        for <ath12k@lists.infradead.org>; Sun, 26 Oct 2025 11:23:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761502998; x=1762107798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=07ocjkdEJGZGwyrHZf6N4TSK9zFMgHbhsQL06B+flvk=;
        b=WDe//NRH1b5Pcjt6GX1mv+U7NfsDIZr6VHnzhBswtQpV2OKaFadWzI3+LcMbKSSqKk
         vlA64FI1pbp3yE6bKcOsvEF/Iz8VDSCQFX0ZNk5HZg+CbLKRfFUDIpzlql8iOFZqVgA8
         sr7f7lvJ9oxqLeVLV9WbExOGA4M5phq63HgnAvgLKlUYQUDVrnFiUI/ysAES3RD+A85t
         oixJn/AHcPsEKEKxZvkh48WDDeU+GKk7hse9Kd/YK26G6IDIhBdKQppNlnhsPoBRLWK6
         cSDOfLkYojy5BJgqnkcgf1yJxx33xccJ4arR5eCZl8QnlfrDIGqv00OlW3tQ5R+zuUZN
         2RyQ==
X-Gm-Message-State: AOJu0YzI3yxtcNmZwIaMu7RzfHw/mAtIOk7VJ4Vzzs642b6WzNjV1EBo
	LDXOIvJcEElhfwuTs+j74sS89/TdTsI1Di1DMPyIxke5tSq2NoSLeG1vR4I2frxzKSkGQHGs5vb
	4CRcsYOviV3uNIXp0FKARQKTROdxwIAH2O/i94aYB63jNA+1R5YlqPuJ8Si0FMM17QsyBIvA7
X-Gm-Gg: ASbGnctEOYSxc/b2z1vjbmfVHGBCv96q0ndHqzGQvng+JH+fVcciEUy4fe8TAqu+npQ
	GsObqqUpDFl2ufX8nieOnHhz/pVsRS9PoBvZW6V22/AlzCr4qixZUap50ZK8vystulwRglBfmZl
	YZaclDqEznVkM7CEshoGthEctCiEzaCiiYOxTP/zMReaKUQWf2ltvUpytPKuoJB1R7A4jYVcFO5
	qBFLouQB8dtKfhcbv/vV4RxP9a8Uu0vkqNy0GS8NJ5Pq7RfR2BERDc2Via15t3GFaE04u0xH8XQ
	pf2yv4VAuen4UnHVOn1vLBawVCCUbGlnFzcaUEyVRbKwg7VbrFmtN7VlCw/3jDlPomyKVlpS3Bi
	m5yDwyRoMQu8I7X8jY5W1EttNDfn3I/Prldf8j0k+qglhRvgDIGNIvQA+l3Flw698+q1ztxBbBk
	2/AZf9ymJeLV+xfPuq2S17aKxkUmc=
X-Received: by 2002:a17:903:4b04:b0:271:9b0e:54ca with SMTP id d9443c01a7336-29489db2210mr112152565ad.13.1761502997757;
        Sun, 26 Oct 2025 11:23:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhUW87NKvc/BI4PtFg7arwb1oOCYao85sOx7mz7awGO7NbfJuOxAMvDWdGtVV/3Jzseu4CdQ==
X-Received: by 2002:a17:903:4b04:b0:271:9b0e:54ca with SMTP id d9443c01a7336-29489db2210mr112152385ad.13.1761502997312;
        Sun, 26 Oct 2025 11:23:17 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e429d9sm55208655ad.100.2025.10.26.11.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 11:23:16 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: handle vdev create errors and ensure limit checks
Date: Sun, 26 Oct 2025 23:52:52 +0530
Message-Id: <20251026182254.1399650-1-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tHXZfoCnhuFOxYPv3Dai0HSkirooaSJM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI2MDE3NiBTYWx0ZWRfXwwgt+f9+Z7bZ
 xagt0hXXNTIWxiCh20dtkFzqRSl+ZSLM2vKjYd5KrUaotjTwY0MQ32YDXpJOBpztN860sThPv27
 od2CQo1Mm6AcZ+A7rcyDJZv46ikEN8gWcBQndVxBTalnjhr5CmF6isHGWutoWFyw2Xchr/zGceC
 29n+J+vHz7ek8VuHkq0i1Ez5Jk9toipi9Gt3c1o+1HdeJ8PtvckXRmxpsRSKLy9LhbO5A+QaL5F
 kfH+eX1ZJVTwOyWgTbu9vaLC0EgU42nQV7R3HMHf7Zp3nBXwtGUeYGO6CoobigI/0OhZei4wviM
 Oi+Rz1a+rYoOIHaATTSJVpjRrxQ+0+7k9GrQOr+pXi5O6g5evBnlp8lHHggy6FSoSG3mq7iVVYw
 SuwYpKashWQEBQ4T4k4jNaQa/FHmGg==
X-Authority-Analysis: v=2.4 cv=Vf76/Vp9 c=1 sm=1 tr=0 ts=68fe6716 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=ORCT1FrbHtTs6jEYeXUA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: tHXZfoCnhuFOxYPv3Dai0HSkirooaSJM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-26_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510260176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_112321_143026_E1E44F31 
X-CRM114-Status: UNSURE (   6.75  )
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

Centralize the vdev limit check in ath12k_mac_vdev_create() to prevent
exceeding firmware constraints and triggering asserts. Ensure stale arvif
is unassigned when scan vdev creation fails during scan and
remain-on-channel operations. Return accurate error codes to
improve error handling and cleanup.

Rameshkumar Sundaram (2):
  wifi: ath12k: enforce vdev limit in ath12k_mac_vdev_create()
  wifi: ath12k: unassign arvif on scan vdev create failure

 drivers/net/wireless/ath/ath12k/mac.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)


base-commit: d5d9da878287cb30199defc6941b695f33f9236b
-- 
2.34.1


