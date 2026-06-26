Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38D1CDE00E
	for <ath12k@archiver.kernel.org>; Fri, 26 Jun 2026 08:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wEk9Abs3/XOpIYJhgdbBcRXlivAQuIKLBNXKIsmmw0c=; b=Mzw8V0uO5dly0JVDtrk5r8sk16
	+JS977jezUxqUo2/mo2Vx46nmzgReyWZUQRBw3J5V+EbU/dwYFaapM4QWtptwq4IvYk6ys71PNGPd
	jNkAC18vVA1RLoeURV9nHMF8uU6yQJ7piyyMloZ9dRqZ2kz49f7hmtjt57nMLsUb6CvwOu14ylQYM
	ktz/0gRAlL5jxN8NyTpUpZEb50TzqFDnKGrhlkI5fpzMivtKTIz2NldYc5hHYk/M2Sen0X4y5i9Zu
	kZH5Dp4hU2rNEJDpRwIsISd4bfL6H2pyEehv9V18YX0Q+ELUBNXTZQ1Ap65XELQDNR1wEADVRSEhm
	N+4O6UQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2J9-0000000Av3A-26TS;
	Fri, 26 Jun 2026 08:53:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2J6-0000000Av1c-38OF
	for ath12k@lists.infradead.org;
	Fri, 26 Jun 2026 08:53:05 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6WHT3632372
	for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 08:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wEk9Abs3/XO
	pIYJhgdbBcRXlivAQuIKLBNXKIsmmw0c=; b=jfnFxxnqndJv39hL1yf7q/0d5w4
	MpSGG4sDBIWh7IqlLWU+XCnsLtsDNFORvhRtCOvsUb7LnJ9HFkNiNB0dAWCcH+8M
	rbjqCSql5caomZu0NDp1uv7mB2xPUHTbaB55FV3b9DrYFsi92oN9C7/W8bIWE8GH
	fCdtkpqMf6p2innM6OCaBSEC3BdyugelK9AotgLj2xng9gYkmmRKk0J9cc/ufUv5
	rKZb8qChYd7zIA7hsVgKh2CPYVA3VqgLEXDY1MUQVKoMjip5Y3r/q3QpyKhzKs42
	I6YaySYWY/rSGBWt+IQgaUKkhQWsWuqkT8YL443JgM7uxqjubbEXMyEUD/g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1asktrhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 08:53:03 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30ca81e05bfso4204eec.1
        for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 01:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782463983; x=1783068783; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEk9Abs3/XOpIYJhgdbBcRXlivAQuIKLBNXKIsmmw0c=;
        b=FmCbV0l/ULfSWNTzhYjKlI4hxvRSjalGMVTukyzGOX3VhlHZfBfSJHY/IvsyAAZoD8
         ktUeU85WUSxoX/EmXa5K7drzeTvIOXsC7LAjGCyTevrVhn7IPD62lu0oy+gI8L/5hi4c
         1hEHDDTIeaDy6C9Q2V4gEzHtU27pmkaLvk4hH3gn0NPCbA1XE7nLI6yNw6R1Z45EnHoJ
         UbPkcjPO7HiUYq37YazpudlD4BHf0GSdaSgWR8aJ1s1KELrePLncvB1GOgr+/FunsSYZ
         Df/eVsAVfica9oEDAGuzEZndtHRzoBfzloQsRt7iVm5WWkGqgvXrxtso8Egf6a6iIR4N
         M+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782463983; x=1783068783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wEk9Abs3/XOpIYJhgdbBcRXlivAQuIKLBNXKIsmmw0c=;
        b=hMxqQYAx3yz/upqFTnCajtyrIgHhtWotK+rNfwH5UZXBcLtwZ91QdhfGxr30r2tber
         TaqXsEGt4ycfSjKoBfW94Rz5T7wrdjDehaRQD/20sNkUoz8gAsBVM5fpfb7uCGWqABVM
         0JklJ/vbzCbJqS6QbEMYHH4N0aEld5WP3AzlpTllD88gUX1EfjUcdsf+OVbD8M6gCcJA
         sJ6tIjgl/rkjU9pWw2NLcwJ5yb0VRx/9mKQt5WJHqWDmhj6I+mgFAUSAs7Z1oF/ff9iP
         iTUnGz/zfhyKX7zhig+HefbmUgXWTFtUKOP7WD3TWJ/LfUhHdDWucDz/yY54958qbUch
         0oQA==
X-Gm-Message-State: AOJu0YzMsFTcAZ75eNLONOwIhotHNRcy5zDN3FFeNYyVXTt+ASAb+aZh
	wy9aHwPTu2su1qZ7xntdLKCuIROfN8l0va5DaSTR5S/tQpkx7A54LuRHX/JeNcGCFwOkx8AHvOw
	Ugw0LCV9LWu8mLGM9UFOCDrF8uJRq2b8tnU5QDAjr+u1wctbkMHqjuDkTe9V1mgwZuGY4NCQ=
X-Gm-Gg: AfdE7cndxDSUlFvQ4RvoXQbQAx8awtDptvDfWfAghJD1PD2ceaJfmgZ7y6Ds6c37LI5
	bLjWA2DxqI9Hz1gMb+UbD+NRVEQ1S1wzfO+OzJlTVYQYFcJxNnjI/JPgrbSnty2GwVb+Tbqfffb
	9VArE1Nzv+qhmn3c0NPDnTG3QYmIZbxXGh51w/RQ39DeVrY9Avi+r9qbfwwiWTISlyycOfuCT1U
	CrltHuLpTG1EV/y50DC2zOTKwjIBv3bxjWfG+uAXUzxDL5lXk4M7uJyvrNQWrgml5riefE6IBKD
	i7GnPyhu/TkIF5RCWNy6a5Ggy4mwPhicqEFJc5QqsC66EMTbK7F/ONS+GfhI/d2EPzmMY0Dl2kg
	9RHkuLb89xHG9bT13qOGoNeYAOqXHt9I59TB23OhsBGFDFkeFpIRJlGjGGQckAwxcs8QJCCJ7+0
	L4Pm0dcqqjDN8tNwzYMoo3qsQliEaOVjyrkIiA
X-Received: by 2002:a05:7300:7246:b0:304:630d:e4ec with SMTP id 5a478bee46e88-30c84dc428cmr6642209eec.28.1782463982767;
        Fri, 26 Jun 2026 01:53:02 -0700 (PDT)
X-Received: by 2002:a05:7300:7246:b0:304:630d:e4ec with SMTP id 5a478bee46e88-30c84dc428cmr6642178eec.28.1782463982219;
        Fri, 26 Jun 2026 01:53:02 -0700 (PDT)
Received: from hu-ssramya-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7ca8b918sm17384044eec.28.2026.06.26.01.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:53:01 -0700 (PDT)
From: Sreeramya Soratkal <sreeramya.soratkal@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, sreeramya.soratkal@oss.qualcomm.com
Subject: [PATCH ath-next v2 2/3] wifi: ath12k: Add timestamp to dp stats display
Date: Fri, 26 Jun 2026 14:22:52 +0530
Message-Id: <20260626085253.3927269-3-sreeramya.soratkal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626085253.3927269-1-sreeramya.soratkal@oss.qualcomm.com>
References: <20260626085253.3927269-1-sreeramya.soratkal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA3MCBTYWx0ZWRfX363eSzQnb8of
 tDYSTPDqTJzjHu60eiUdg76tj7sA/xSHYCY6iAAhWycDXpPLJ/87YweU6Fx9pkzSpq5CPE47U8W
 zHaRLJKMrwiWEo8kHcSezgWQmVtxG48=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA3MCBTYWx0ZWRfX1rfAofKzrDyO
 P0HTmkaiuoSnb82en9iEtXpNpc/zeFv12f9hdclfGzJ97EPdxq7xdfl2IIGbR0H1M/s3bowkMvw
 tJdS7dM37CVlHAgM4BtLwx6nqQc7r72g990QMh4dXKML1nD65cym8ym1WVMwFTNENJumjIt01tZ
 tAP0aKw12x73MlIYTZM3brVtgvwV9Y0VzsP7mXcVYb+AnBG+mO3SBhNOYgL0GGjo2pYDU3D5rze
 JRM/R6aQzfCWQVCcQ+QLjDxHfMpJ7iBFOMSg7s86Dvs4qTopvnLjBN+Oq+vdbl+GAH3vzu8fEmA
 v9odkpjei/YQHLk8TK+GagCrmi+UxmFH6hCjIQE/LW96PU+nlADp7vcW2fSF9nrN6nOPiL/Lg/h
 ODJjQ/Z6ZOh1+lwl5+S3+5NWEeMyVTV5gHuEjZGBkKM61luMVVieyrp7ByJaxXpU1R96uHP9S3I
 j2+5dJnBJixglCwqVrg==
X-Proofpoint-GUID: 8jCuVo25tqBdknQT6Jc4tXGRjqpV3U5R
X-Proofpoint-ORIG-GUID: 8jCuVo25tqBdknQT6Jc4tXGRjqpV3U5R
X-Authority-Analysis: v=2.4 cv=AMxnnMPh c=1 sm=1 tr=0 ts=6a3e3def cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=MF4ojy0fPj4DSkZxZrwA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_015304_903882_1A4F7736 
X-CRM114-Status: GOOD (  11.73  )
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

In MLO configurations the device_dp_stats debugfs file is read
separately for each ath12k device.  Without a timestamp it is impossible
to know whether two snapshots were taken at the same moment, making
counter comparisons across devices unreliable.

Prepend a ktime-based millisecond timestamp to the output header so the
reader can confirm when the snapshot was taken.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sreeramya Soratkal <sreeramya.soratkal@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index bab9d96d6acc..57c213111259 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1082,6 +1082,9 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 	if (!buf)
 		return -ENOMEM;
 
+	len += scnprintf(buf + len, size - len,
+			 "DEVICE DP STATS (timestamp: %lldms):\n\n",
+			 ktime_to_ms(ktime_get()));
 	len += scnprintf(buf + len, size - len, "DEVICE RX STATS:\n\n");
 	len += scnprintf(buf + len, size - len, "err ring pkts: %u\n",
 			 device_stats->err_ring_pkts);
-- 
2.34.1


