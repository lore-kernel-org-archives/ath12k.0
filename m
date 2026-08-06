Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD91C56208
	for <ath12k@archiver.kernel.org>; Thu,  6 Aug 2026 10:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vk2aJqzmseVOnxCV3HG/O3mxaCuN6ou9ie+hVVr7VQI=; b=xU7n85u6Af/S4Kkw3C44HG8AGg
	EE/YE0V40si4xp2J9VpR3QRGfrJKD6In4Z8DOhowHWI5u0DgHQEhttdthry/xEhQd/MstSzXaOd9h
	bBSuN51tjRcWm2Az9rCvB4V0ffmvHpQmomLD3QhRtWt+iOsvABE8Md4+8DCFOIE8NqNc1IEwJWRkT
	6vmpAfOvglrKZ12ePUpfP16mCICLCR36fn31puS9c6JtCb/iQQAE+FRFvcUHU8xAbbWI1Aa587iSw
	JfugjjtxHL6OUhdPIIsWiovsuoltr0xcv4JwKrJ5d4jbvvehlirVBR1aqWMuSWp17iZFlR7r51AoU
	/qINiZkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrv12-00000005VYb-14kv;
	Thu, 06 Aug 2026 10:07:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrv0v-00000005VQb-1rfZ
	for ath12k@lists.infradead.org;
	Thu, 06 Aug 2026 10:07:54 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ndhW1308839
	for <ath12k@lists.infradead.org>; Thu, 6 Aug 2026 10:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Vk2aJqzmseV
	OnxCV3HG/O3mxaCuN6ou9ie+hVVr7VQI=; b=OA9KiumhcOefbW/AQRZDTP2vSmI
	t1084NzpDz9PAofPhrDB+U3XcB6fHacmIgFhieQ9USlmZpoPYdCcL+1bUp5XS/r2
	HyZELVa11cMx4JuGUl301ooYT5Ub0p7i1DZfp5LAafgoKE20a4RT8E071WhCu5R+
	Xkw+9+KClsawWbHsG1HtiVKzbvGCGSvLdkShrI3x8OTr9mU6gOSX2PPWtEY1ADTj
	oEWwbz9fYZtKeuTEliyeZcG0GSWfUAlz71/MmKos0UCLESqKoZxkbgp3xZ0cNAST
	Nrv23j5gtiFstUCmKuZQJPWxM5FTNbQsg0+sGUH8RN9ievMsmzCHNmWQLbQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvp728k08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 10:07:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfbf3e4a63so51740875ad.0
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 03:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786010867; x=1786615667; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vk2aJqzmseVOnxCV3HG/O3mxaCuN6ou9ie+hVVr7VQI=;
        b=KCRdb5VyEnsRezOVR5WlkroqSVjxixMQ8s/sexL8/FDjmYgakncWBvqFjB8bN+62qt
         tvfSeLw/TPjMc1kb/grqb/ydOFoIPNoxlWPj3Jz18OyDvYEs47zrwi8My0HHn6FXCOCu
         gnfEjL6yO3LTtCk/9Ez9tbsaNeXKD1rcaiOGrrpUrI7H+qMrjyfdhDFZwEwn0wAp9HHe
         0mnPg53kKWg+HCATUa//dpuy5G02GlLcs7GWwK1sT2TmordJm77CKvvqAynbw2Es4JiM
         QoHREeQXjacHFIwzDoCdJBcVsa8cbMIwg5j5wmdl6IX4oEO2CjqMmW5mET6ELXvptvNd
         MrbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786010867; x=1786615667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vk2aJqzmseVOnxCV3HG/O3mxaCuN6ou9ie+hVVr7VQI=;
        b=bu/vvRsq/1tAje/92WISlWPfUrEMmFXBP7/T2/pMQoyOnHVQ5X3VylmnMc1a8s8Baa
         /o+NDUrqyJyS0oWJkbMN7iyOtS+/9d860YQSqfxnfYbsYFXlYN/gS8bkEKSQdVXvHMqI
         Wk7u5XvR39dKSM98TOZ+93/sBrNIqmJGnzWrOIof74+i3G5RrSrLQE7vR9vby6CYcVWR
         lSLvVGIcZGbvrWcrfuAfB23pr63kGFVlpSGQLN123mSP6osIDe92noiQt0I3Py1wGMbv
         K3yPZ+IkmdPOty/PDTdFDEMl5Qu0W7Q740oT+cbVsztPQufoKjcHPbBc1TbgBddcDatY
         6EMA==
X-Gm-Message-State: AOJu0Yw4aHiJJ9fF3XXSq6oLPyFKQuW7T0OWMD/mnrzZ/ceD5lbW/Mn2
	AUemRpSv9jGjsHq6vrA3ryrNNrG3KS6a9VRwWJ7UV5ZNxAsvyur95CrevRRSn1MTtLpFmZRxANX
	oedRT5PF/bTo15WGQ9+QBwLuNUfGHk/IZ3ZQGTKbwDxJdMAY+DGOEEZr+bed7at685FpAZvpX
X-Gm-Gg: AR+sD11BRjkcLigyI5GWJjHdVHkIEzU2h09fFsEK2GxKT7rIeqfrXKq1jrO3Zt0/2kT
	Z+EM5JLdwtC6fy71O/NCV5JNS3BjLiyDkmpYFBr/lqi1zso0qY4/WTAj2cjNJN9mj9v8OshK15b
	Jpp5wLl3zCbn8SlWCO/7XQSg0cLPA6iNLcdGtq7f/C78eADE3o3qBNrgbWHTsXCOtOd+fazZ6o0
	g3CP1dLh2MQx81mPLuWaTGxinKXohvrdyWYd4ZwWBeOX7OQFyL6Um1m1IRn33pec31UW6QNjFRW
	lXBndqm87anGmlmc2x+nF274f/MmVayvOOiSfpGSQmeF7DO2rzdqCycTxFZGcu7uA6Uj3m2vSmI
	/MjvwevB4xSBnODZg2TrgwUoSmiQ0fWP4K5OQGTHmcqy1wrCh3StX
X-Received: by 2002:a17:902:d58e:b0:2c7:1200:bd7e with SMTP id d9443c01a7336-2d0ca9838ebmr175036725ad.18.1786010867478;
        Thu, 06 Aug 2026 03:07:47 -0700 (PDT)
X-Received: by 2002:a17:902:d58e:b0:2c7:1200:bd7e with SMTP id d9443c01a7336-2d0ca9838ebmr175036105ad.18.1786010867008;
        Thu, 06 Aug 2026 03:07:47 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0b6fbf2c6sm24027115ad.34.2026.08.06.03.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:07:46 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next 7/8] wifi: ath12k: fix 1-based ring index in REO Rx Received debugfs output
Date: Thu,  6 Aug 2026 15:37:01 +0530
Message-Id: <20260806100702.3479326-8-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806100702.3479326-1-pardeep.kaur@oss.qualcomm.com>
References: <20260806100702.3479326-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: sngy-cCGDlIBBHkq1Vn21HC24RsZ6LFo
X-Authority-Analysis: v=2.4 cv=JYCMa0KV c=1 sm=1 tr=0 ts=6a745cf4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=qz0A3ntWxt9h8-tH59wA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3OSBTYWx0ZWRfXzT27Kba297ND
 9sDzCXTAHNjt8qeHtjY2Ubd8LPbaHWAYagsi+W5p70lmuNlkxqR2EEYY5f6AbiiXZdTneOzNbce
 A/WpOHRib5GGj+0ybvZpQw/DTEBVd97wrvdqG9VMas2bbugMs2j9psmvJU3yXW3PiW8u0GTx48P
 MGMRQwita/Azp2BaMP67VlopciSLbxZ9k5odQLbm7j29Jn5eu4ipF1GCXhEK4XEJIb9ctuCrK8c
 3bKrraoZxibf0mUpKjtwi/niWabSftDBQbfySKMAEfxcY8vgrQkxGobbjMjiLk1Qp3dNlyJ047w
 UnAjJ8EhTncl/r9exK2elj1UtRYvyYFi2gWC0WYNXimQCsWaDVXdLPvE+Rq8fj1/R7HK0LJTuB3
 AiRgzqYpYxfRHYq/9B6iKFdmvs3b9uvONanhVL1Y9U1AqcywhN1LVtEg620VThkoNWu7VxX8ycQ
 jmvzPyav5+spYa0zICw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3OSBTYWx0ZWRfX3LgD0L1rFD0i
 QARm3yHdahCe3nwQWuHGEiF0/qS+naGG3AYClvBbJPlJW7jLjR0cF5NXu002V218GGLH3GGtMSX
 6pvTJYb69umE66EFh0gGzhqciJjxZaY=
X-Proofpoint-GUID: sngy-cCGDlIBBHkq1Vn21HC24RsZ6LFo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_030749_606110_9099D403 
X-CRM114-Status: GOOD (  13.98  )
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

From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>

The REO Rx Received section in device_dp_stats debugfs uses a 1-based
ring index ("Ring1:", "Ring2:", ...) which is inconsistent with the rest
of ath12k where rings are indexed from 0. Fix it to use 0-based indexing
and lowercase "ring%d:" to match the style used by all other ring counters
in the same function.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Fixes: 84873d542e95 ("wifi: ath12k: print device dp stats in debugfs")
Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 216a1af22898..d4ea21aac21e 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1215,7 +1215,7 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 	len += scnprintf(buf + len, size - len, "\nREO Rx Received:\n");
 
 	for (i = 0; i < DP_REO_DST_RING_MAX; i++) {
-		len += scnprintf(buf + len, size - len, "Ring%d:", i + 1);
+		len += scnprintf(buf + len, size - len, "ring%d:", i);
 
 		for (j = 0; j < ab->ag->num_devices; j++) {
 			len += scnprintf(buf + len, size - len,
-- 
2.34.1


