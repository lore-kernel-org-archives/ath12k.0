Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99356C531D0
	for <ath12k@archiver.kernel.org>; Thu, 30 Jul 2026 06:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sSTld8JbLzNx3/RvownXYUl3LcclfnTNfSM0xsQdSb8=; b=a+uzcRin5I+LeV
	EKeVsFKmWvNjwgwvq0zd8AMG584amBOx7jL4eposXomdI3fO5ufeKbDX69/qCTi5Hotjn+gCL1w/c
	6NP+oyBaPf4DqQ6HBcR58wqQ4HYvBTkceOW3bUnC67G2TeFCFsBq6DCP2UDFYHWpZf+bovqRAQwzr
	Tggc8x+NrqrivC+w64gALgV1PXaAm/v6Iz8A7VVAjZJUpN/zJ+jO/aRh8RXqjgSB7cJZMyOKECSxQ
	DQS70QT+bNgxRSxnEy23zOhCfqjDWXDbjxPEbW0qGuiDx2ShMYuyZhbj7WnGL/Ugv0JS9pYs1kfIi
	lBudHNwxt9sRTZWjdWDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpK73-00000009bCZ-1Odz;
	Thu, 30 Jul 2026 06:19:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpK6y-00000009bBa-2C6q
	for ath12k@lists.infradead.org;
	Thu, 30 Jul 2026 06:19:24 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U5AX543537049
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 06:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sSTld8JbLzNx3/RvownXYU
	l3LcclfnTNfSM0xsQdSb8=; b=WOTu5pLOcAA1lvOVE0elAa48o51Z4ay+VgzgpC
	BbkgVE9cSTM0L6T0VQcH/IewvehaunYnENioEMlk9cVunNYY6dWIgSGvj07dpagD
	QdMJGEAAEfT/UGP+k34gGqlmcl1h+pawpp2PgCUl7nQKjbgEk4jQgEdKxEG56DEI
	ViIQQQQ0SX6AGMbjVX02RQXTopSTs9QQ7ql9A0Sf0dBEC7q8tIYk4CqkirfbTA9d
	obMEBWq7mS8B4vJgOMOgRrQlaBKdagoUacVzQWDps8YnwSO1PjLmERKk6tWZdF8P
	ZSerQEUu9tolIQpSVFvsTvIyQSKVVBeXq5xBUeDtpUMaCIdg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr07yg86v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 06:19:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so3129405a91.2
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 23:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785392281; x=1785997081; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sSTld8JbLzNx3/RvownXYUl3LcclfnTNfSM0xsQdSb8=;
        b=DiVDmDsKxoOaEKTYATmiS9VwU2M6PsZuCjPMtYP7zO2MNKnrB+43eHLeDASqm/aFNP
         cXxzZWVUUpy/QkkMcPw6cKGU64OwuS+ep+hkyD9qh83s4jgLrJ+pc24mMUnXuywidG2U
         1qLtSBHwriUcRhKcAs22PXHYrpH3FNAw9sIwMSFOUJDMJDLvlqDBEUczEWtYLDG1Kq7O
         Vb/AANONx/FwPRcR5ZS9MS/7fbiOoU4etqz4RC7tiuMi0x7HRCoX5n5/aQDhWno4cwnn
         2WyYqfmiJXm7tFOvN/+g4aYVAZMrHgy2P77ANMRWeXV9nhD5W7TGHeb/97ZOb7ZZXjoC
         PDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785392281; x=1785997081;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sSTld8JbLzNx3/RvownXYUl3LcclfnTNfSM0xsQdSb8=;
        b=N6fJCqZg+DI9Jal9bYpb/soD60mV5zGS7YOyh51FXR8vxPZ06dOaKdiRGbCopweSol
         bAWRdCxJn15z0g8mT+UhrWuvwX1NQ6Iwp+gZtNQEBJi38GTV+r8szjsNXFjJ2U1FNyRn
         E/rHytxkSGxiHbkgNa3L3BmoRmcJf5P4ozcwXY7m1ex3HzDZjd2hoxEPbR+XL2bNHjp1
         gBDgzYOSD1AGBGkhh8Lw+I+E8Kw/IwYKqU/r9bZU/+4IT095H6FW/zDbI2xuLnJJqNca
         glsb2kewDV+uYjbawg9Biejy2MqtPnPRQ6TsHOuGydaHIgI0yuMUcidbZLuNN5Pi7hHF
         IuyA==
X-Forwarded-Encrypted: i=1; AHgh+RqKspsEhMNUkjTZe0f6XeYEwOJVFuWdbcbVnfJ0+Bvcokt67DcQFFetn1dT/7m2cBHNq7xlKjg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8xLROqqdW1WBlmGwPTn+7e5mVWO2TRa+/d46DuW8deeV/cXHn
	pwtPxAP29J3cmYMBGTB0GTdS3vVGuW18D2WnG6do8Z5npKrRaPNmeS62rGFNmrKsnkoujQd16sM
	p3TIFZdXugCiIq1/pMZXZi/gmxh+hGkn/wuq3NvGUwtpqmJFyFPfGquzLi1B6mb0X
X-Gm-Gg: AR+sD13sMRxdd2OFuVml7r+6MbymunbVf2niujuibAPL5lo2cQR66WycnXSmphlyS+9
	XFLDxfaJ+ellZaZLNWC3XKJ9Nh3BN3gRAWwg+l9ugNoQfraM6tojxBmF4UP8eAcIWwUoewLUN47
	WH3Yoyh7rd2NGTC7poo/zaWE6h8R6rIkxwDUBq1dCy3J80oDJGrfCzojo+UYJragqz2Q9AdOz7V
	H5LfTBiQkQnRINnai0izniY6MdYn1hwSSsMOcrSVGJj5NPbXJCL+WIOvxgByyzHqDpu5mscRfPg
	6x+PeH0K5xXibxBdNWAzUUXwrJ7/o+BYLgZvTMnAeaTBP6g1AIDN/p6MTdy6r9vRaUQKo8UysSs
	3BHEYxASRkwEuqWKV1eQnWMr5Ie/bXYm+Ck1yBI6N58sBpLRNyUWpnw==
X-Received: by 2002:a17:90b:39ae:b0:38e:7268:220d with SMTP id 98e67ed59e1d1-38f9bea6293mr1025280a91.20.1785392281112;
        Wed, 29 Jul 2026 23:18:01 -0700 (PDT)
X-Received: by 2002:a17:90b:39ae:b0:38e:7268:220d with SMTP id 98e67ed59e1d1-38f9bea6293mr1025260a91.20.1785392280649;
        Wed, 29 Jul 2026 23:18:00 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9b928f09sm457254a91.2.2026.07.29.23.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 23:18:00 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-next 0/3] wifi: ath12k: align QMI memory to 64 KB
 boundary
Date: Thu, 30 Jul 2026 14:17:39 +0800
Message-Id: <20260730-ath12k-align-qmi-memory-v1-0-0fef98dda614@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAITsamoC/43NQW7DIBAF0KtErDsRDGBQV71H1QWBIUYNdmMcK
 1Hkuxd55UVpuxnp6+u/ebJCU6LCXg9PNtGSShqHGsTLgfneDWeCFGpmyLHjRnBwcy/wE9wlnQe
 45gSZ8jg9wBlvTeiwo6hYXX9NFNN9k99ZHcFA95l91KZPZa6L7eUitv5PfREgIHA0KmC03vC3s
 ZTj9eYufsz5WM9GL7jnZJtD4GDiiQvXRa4VNjj5T05WjmNQXp60RCsanNpx+AunKic1GktBShV
 Vg9N7zrY5XblILmhlIhrSP3Drun4Df12q+gsCAAA=
X-Change-ID: 20260710-ath12k-align-qmi-memory-a7c87d626ef4
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=MJJQXsZl c=1 sm=1 tr=0 ts=6a6aece7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=YCfBL7qkbQnd2ZjRc3sA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: n9vFh9nOGJiMPgpEVQPRVKoqAzeWiCKm
X-Proofpoint-GUID: n9vFh9nOGJiMPgpEVQPRVKoqAzeWiCKm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA0MiBTYWx0ZWRfX7uypJGcLeSVz
 Lwg4XSrkAECVdk9i5condsqosADkMHPgTCE9SVKR240BtW+Qh8pustN2qlny7yeMSnapXc6us8w
 VMJnlHIyfQI0H04x4k2zQl3HVy3CwxWXpp3OlPbux+V0rAtiDLLMjTb6vZxyU6meQlvCgESp2Tv
 i0kOHtjd/e/MkEBuktvbuFuzOLJSHZHpNUYzbOYzheOpSgNQJAoSWdL6F0BvfQL5kF8rs7pvIVy
 DFbLn2MTt6OosZZkN2T0nPtJNxEQHHHWlZlLPzlUCuV7qOIW6wf2QnI/3x7x/X6xtieh/ZfaShs
 8T1R7LOknMxmPW3+8funy5q60FCDOZ3a510KTmjqxdor2TMtoF54Xil7NZOcR7BLnbO+CW5FpFx
 hUKeKtod2o36VxGG1xJrOB3oKmwpLNJYBMC2xvLmu0yPHq1MiMlsXbJ6Doz/cC39VViN0TiHrEC
 HsfSukOOna0wwBuzmPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA0MiBTYWx0ZWRfX4MyhOKzfdRoG
 WIVtpf4Eq/JmRYf/WUWfcP2TGIeHuZmx854JB39Gl2VwX8aPrILSk+u7FQhqSNrFP9wHmmN5SDU
 I5xO4pDkevVEb9tryY4t1Kjhsjwwbjc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_01,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_231920_571536_5A697D90 
X-CRM114-Status: UNSURE (   7.99  )
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

Firmware requests the QMI memory to be 64 KB aligned, or crash
may happen. Fix it by manually aligning to that boundary.

---
Baochen Qiang (3):
      wifi: ath12k: use per-device max QMI chunk size
      wifi: ath12k: clear chunk paddr and size in ath12k_qmi_free_target_mem_chunk()
      wifi: ath12k: align QMI target memory to 64 KB

 drivers/net/wireless/ath/ath12k/hw.h       |   1 +
 drivers/net/wireless/ath/ath12k/qmi.c      | 102 +++++++++++++++++++++--------
 drivers/net/wireless/ath/ath12k/qmi.h      |   4 ++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c |   7 ++
 4 files changed, 87 insertions(+), 27 deletions(-)
---
base-commit: 4fa10e991f77b4c929d1959900a6ed422b9e2ac5
change-id: 20260710-ath12k-align-qmi-memory-a7c87d626ef4

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


