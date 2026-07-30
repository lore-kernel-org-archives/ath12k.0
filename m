Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FEEC54FCD
	for <ath12k@archiver.kernel.org>; Thu, 30 Jul 2026 01:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9l214qgUdXGA8WVoj0GqLP3Zunwqu6mDgURnXJ+2pGg=; b=JoYXws9t6kO08HQLxMnrlyxa2h
	LW/IYoZvvxsSoMXyvZBuqsBlDBuAM1G57QcL5hiRIG3CGXGS+dhQsDFFI/Y8Dsul2aX1Ha7BMx+kO
	fznXfkvkF/8XGgSmxCCDaHwK1M9thwf+ABXJaUrOrFPc395dWsf830cySpF8Ug+snomeGjA8aWpVV
	8YQhmq21Gway4rsn9oYCeb9sgU0SKE+3GSbXcUOyywjyfKK5AxSz64G+h/r2B7c5FoRBwznMjrZfm
	DGsnGv/CriuDH5BDdoan7AZUCEU6Dchbfh+RHQ7iTaIYDWdFVQQitgAauJYSf9YRZmLf1iT48E1Bc
	2YLbT9Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFD4-00000009D7R-2GD6;
	Thu, 30 Jul 2026 01:05:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFD1-00000009D6W-2Du4
	for ath12k@lists.infradead.org;
	Thu, 30 Jul 2026 01:05:16 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U0upMn3709646
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 01:05:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9l214qgUdXGA8WVoj0GqLP3Zunwqu6mDgUR
	nXJ+2pGg=; b=d1FIvwSljNDkAA0Zi0H1WrJhwO8nsALs8ZRiv6YLp2/WC0XZrok
	YMJiscQU8K9k3yltq8dBGdZt+dUsnmp/wsSWt2NT9YenUxpBmIrzXtPhr4QMOwD/
	SbOI5FKE2KPjt33qDN1KU+pKmxH6BrUSybSK4JlLkrKDfl2gL7Pci5gsIJXJTJ9e
	TH1Dd4IzVNH2fvVygBZWBSh+hokN6HxWnHtGYhiT53b0d/ji2cijqYrDfr+rKCps
	Zdxw97tjPdO0JFO2Cuh5yjmGvWvYZQ0G9q7fecRGvKeXj9YFQx9vRorfymTG9Kgw
	7tI3R8/ptKj96ATVeecwE4HolYI7XpGLZ8w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqvh380qb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 01:05:12 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84a67b16217so2717430b3a.3
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 18:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785373512; x=1785978312; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9l214qgUdXGA8WVoj0GqLP3Zunwqu6mDgURnXJ+2pGg=;
        b=UjnnBLHf1wUCGcRrZxG+XBBZeK4Pf6p/E/pqQGfsIb1Q6u9N+nrXhXoLBRW7UOyg/f
         gX4VJskou+cH90racHFWIeV1Wg8d1hrXRHsqBeRl25XT5+HaiHThIowSERZv2NIDXUL0
         IR8Ht3KEFsGYgW6RLyX9XxMllNt/rMdb/eVIK8jbyVeV21FdZ51DJHFe8ON5b9xcQCam
         Nsv012P6mVmB5NgWchjCIm+3+BIHdwQ5xb6jfm5ZIwE41EXUZKKytzvbPqt0QNzzbD4v
         HfNRdyJLRxcy6fycFEBq4atfRczF1c2GP0TN9f6wzvpPCGKkaDy/HqanWwRVWgej4HSS
         ROqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785373512; x=1785978312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9l214qgUdXGA8WVoj0GqLP3Zunwqu6mDgURnXJ+2pGg=;
        b=nyvZhQJjcvV0xe5xoaOAqdX2LR/pGEmNluVXK94YnUAGXEX4NtV1MZPQAKDeKRBofs
         2gFVa/Hn7CSujNuUgvcNBxIrcwY6jHnXh7OgtKfT4GglPe6lv3m6Ah/FTXdbu3CguzNY
         cKBY6EwDl9PQ04EoUC/ZSMdeAY7MXpRtCp3q4Fuzf4yHg3NnFyJI+NfutBS0aqyW3p+Q
         VYK65aEkSPIAP7QM8NIY/oj6Md0/JfDSVLNQ3COQCjR/GqPedWkftGiTpLegB665riE8
         lpytWDbLXEyIOh6/EE0E82zkek0IlnbKPCJlS4UXGBPUVd/JzxQoLCL/85AwcJqMSnS5
         woqQ==
X-Gm-Message-State: AOJu0Ywtn2PaGrSuo4CNWxwfirUVOS977jk0THnXY729yZWs2qhHVvxz
	ZN+sgwUsRmmSyvA2UcNqBrpx8+Lt4HAiG+vATtkAAxVfOxkoddxt/OO0fivfp/3ib3AjdFPmPT6
	ZodNpwbefznegVZSPE7pCy4FMRRjlKZbJpvp/G+WYGafxv1o6NLX3kwkTaHQrC+N/dTUAI8zB4r
	M=
X-Gm-Gg: AR+sD12DLtm8Y01OsRyQlYhxUlwnj7C2QixHJJuaylJ2AhL+Z9CVsDSvreSbuWszxp4
	ybHUzd96uzXb/8Nx4+rxvtEbgDNc4M2HrdiFgnSbvWo0/ZAV0tbdGT4+pY25YoH3Ttoi8dYR4wu
	cRn4EYSA5AsbEeb0MM+FD1RoU6ByA8ZJ5vUKY5to022uz1Ak5clkaMpyvMZeeVk1cSU+xixFz6k
	GwTcEr2ko9M/rAUERFsIJunlr5RvbuY3lPP3sR2ZLIGqYJS43UrqIUfq4VOy0eYhTWxX1FGLON8
	XZQi8gRp2WuMpBpPnvPMI94/J76O1N9CMojsOggStsKnTjafuXkduCB1qcQt0cDegIeFKkh1yoP
	tkbMJGmOWehR52HsJCLwbnqo+Fw5+2GHXWzgD7MJlDBBvciHVstS6Z4y4uaM=
X-Received: by 2002:a05:6a00:600d:b0:84e:915:d7e0 with SMTP id d2e1a72fcca58-84ebc3e1323mr546601b3a.44.1785373511906;
        Wed, 29 Jul 2026 18:05:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:600d:b0:84e:915:d7e0 with SMTP id d2e1a72fcca58-84ebc3e1323mr546568b3a.44.1785373511513;
        Wed, 29 Jul 2026 18:05:11 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e9fe23120sm2168563b3a.11.2026.07.29.18.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 18:05:11 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-current 0/3] wifi: ath11k: fix QRTR readiness related WLAN initialization failures
Date: Thu, 30 Jul 2026 09:05:02 +0800
Message-Id: <20260730010505.143458-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAwMyBTYWx0ZWRfX+m4NAphOyyNc
 F30mJPXo8hJdXqtwhpxpmXOCxf2QlQBDdTpkTMdgkwxpTZdh/FVLbjFfwhkgNb2M/REQU8Acb3f
 IFJZSoT3Ob8SahcijGToB4AdRojX36E=
X-Proofpoint-ORIG-GUID: jp-LB05cZpWxEekQW-9ypdBbYMziAnfM
X-Proofpoint-GUID: jp-LB05cZpWxEekQW-9ypdBbYMziAnfM
X-Authority-Analysis: v=2.4 cv=batbluPB c=1 sm=1 tr=0 ts=6a6aa348 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=Hy-6OMvPWsRTGNkc5tYA:9
 a=zZCYzV9kfG8A:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAwMyBTYWx0ZWRfX1JuQzF++HV+6
 syaoykpx2JvFvTOLsFa7ZUAkx55iyuE9QSxXe/C3/axp/Ye18zeRag09W2GeymbdYzA/CqKyAM5
 0PwUXn7qEqhIakZM2tha5ZcpGRUV9myKbNoUmKEw0GQ9FoL3ULh3foQB5nRbESLl/kEhHhgA6mn
 KVA3YsBibpXGbgytboNIkkvaBeAoTEUDulIObCmJecaPMh615doc17AQZNFSa7bgCrYuCpPjapJ
 a3rse2lNQGIY9sbYAfkK8zGuCPfA0k7thIUSkmOfKY29pX15y3HgeRO2h+Dgw4u7UD31Txp/7zk
 wHmWXMnBoQ3443nmojhejhF7j2r63t7K6cgG7UYt9XzHjKdV2tEzvcS5TsmHj23B7p9Spq4AgPA
 AAqMXkNwt3uyWfwFg2eyIegsV8Igy0wIB0YTRt954WECMN5/IMASegnESADcPXkgd4I0SS8Yqc7
 zRrbMZ1s8DdK8eZqqDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_180515_694328_D471AC5C 
X-CRM114-Status: UNSURE (   8.26  )
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

On WCN6750 platforms, QRTR SMD may not be available when ath11k starts
during boot. If QMI messages never arrive, WLAN initialization can stall,
leaving firmware running but no wireless interface created.

It also hardens the cleanup path to avoid crashes when deinitializing
partially initialized devices after QMI setup failures.

---
Miaoqing Pan (3):
  wifi: ath11k: fix sporadic WLAN initialization failures
  wifi: ath11k: fix NULL dereference in ahb remove when QMI init
    incomplete
  wifi: ath11k: unregister PM notifier on QMI init failure path

 drivers/net/wireless/ath/ath11k/Kconfig | 3 +++
 drivers/net/wireless/ath/ath11k/ahb.c   | 8 ++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)


base-commit: 6776197cc88d0d397084bc47bca7e983017cecc2
-- 
2.34.1


