Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28079C3DA6D
	for <ath12k@archiver.kernel.org>; Fri, 23 May 2025 03:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OfeUh3XK3R9ZHXa3B1r4fWEB94jyHEkaJCKDeK6h0gA=; b=Devpq3ugUQ/1Dl
	j3d8WiWzUl42xXwRAwgEDZkdcFQ2eKmwNw42sntZT7q6Dk7OSB4uvDsZWxhJOOC2hyn2zTEqIO/cO
	3Ble8YKNjyyzKNa+SMf6gRGRGtysYBOCrv/R5RsrCCgBTGQp9KfpTPbih1lVBCD5Szb/CBhgiAo0I
	Zh9iaahF0Y8TusPEZOcFQ/lGaA0J04j21e0sFbWy5HP4lRcL8w3anlhVYiQuKGJvPOVOa34qNOCoP
	1PxpX7fC+YJpg5NveCaj/C1ntG51tkGvkY4EuDOnOYFxVkFuJEZgucA4pmdqRQwyDs+6Fwos3zzZ3
	X/Kz+vWJ+ZZbV7onFHVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIJPS-00000002rCo-3ISV;
	Fri, 23 May 2025 03:49:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIJPP-00000002rBC-0lWq
	for ath12k@lists.infradead.org;
	Fri, 23 May 2025 03:49:25 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MHWmt4000836;
	Fri, 23 May 2025 03:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OfeUh3XK3R9ZHXa3B1r4fW
	EB94jyHEkaJCKDeK6h0gA=; b=J+8sT9vXjL60AADivQxwsGF6Nyb8s1q4hTevEY
	qp+w0EEKlNOw4c2HE88FYhAZB/p/ptnedOdlQrZsDr/wb3ZcKwCP7V15t3UffY3e
	AGwhz1Csa8IO8iBAY7TEaZjfQ2/ulo5a+OgWjEcCZ8z1g8rzR6ipcpjb5kvcGNki
	h9Ay3M1Jy1zWKngpjnO2cAYjh5Y8NBdeEigxRZdoTPqwfgSjv99a1xJNnCUVsS6P
	xuXQl3f4NtNMCQUwJs0TvWfC+SZgIZR4w6IS8WVIaR6OXo/P/1rkocUr9lhepu2x
	Im8LVeFYdvKif6W1LIjurC3QiMvcJUczgcwMks7oGSrtKkUQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf70bqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 03:49:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54N3nIcd016066
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 03:49:18 GMT
Received: from [127.0.1.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 22 May
 2025 20:49:16 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: install pairwise key first
Date: Fri, 23 May 2025 11:49:00 +0800
Message-ID: <20250523-ath12k-unicast-key-first-v1-0-f53c3880e6d8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACzwL2gC/4WNQQ6CMBBFr0Jm7Zh2oCKuvIdhgWWQCbFoWwiEc
 HcbLuDu/7z89zcI7IUD3LINPM8SZHSp6FMGtm/ci1Ha1IEUGVUQYRN7TQNOTmwTIg68Yic+pcp
 yce3KqnxqA2n+8dzJcqgfkFboeIlQJ9JLiKNfj885P/h//ZyjQqVbqvhCrTH6/p3EirNnO76h3
 vf9B/9vYkvMAAAA
X-Change-ID: 20250422-ath12k-unicast-key-first-9ce48f797b15
To: Jeff Johnson <jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xjZU0ygqEljs5k0EB-YfKlfYi-pvRECH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDAzMyBTYWx0ZWRfX+IB2gTbEz8ir
 u0cthQh1ri0G/y2c4Q2sSP5JCvuj5paSRtu37kt5gp6BCUGvDmbIv2qBWHfH9UArNxDeA4U8Mx1
 /zMWOs4r7oKuMou08R2iqLi8JVPTYh8dejClhQjC7V6ShwClqdwLILJhUacgnmEkTHlhoMe1LFh
 LhvJxdT/fDuslTY19eukuS9ygbPn5RgJzvz+IiBUL99KxdvtnXz63m0QsVIEYuyEvAg9EvaZuat
 8DP1v2taZOOkRRo9SA+l03spyW33tt03HoY2hIcnDLItkwwn70v3/YP4HPw/vSwcP6n3neMsmhp
 EoGyI+PmrKuR58Xkb99Jm+JAHBdbPlaA5OMHZMKMSbtPLWpa3j0pTr0AQNSLjeWhkeDd5V3jhJ3
 I22EuBqyyUBI6QbW1cCXlyXThHRbvRq+XRjZwWqAsRP1Ce/kdPVff1PUBLB/UiHon+xhRP4L
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682ff03f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=UqCG9HQmAAAA:8 a=COk6AnOGAAAA:8 a=IPQRWuV9YlEYq9QDH4wA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: xjZU0ygqEljs5k0EB-YfKlfYi-pvRECH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=724
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_204923_356587_7A7A4310 
X-CRM114-Status: UNSURE (   6.76  )
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

We got report that WCN7850 is not working with IWD [1][2]. Debug
shows the reason is that IWD installs group key before pairwise
key, which goes against WCN7850's firmware.

Reorder key install to workaround this.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=218733
[2] https://lore.kernel.org/all/AS8P190MB12051DDBD84CD88E71C40AD7873F2@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
---
Baochen Qiang (2):
      wifi: ath12k: avoid bit operation on key flags
      wifi: ath12k: install pairwise key first

 drivers/net/wireless/ath/ath12k/core.h |  4 ++
 drivers/net/wireless/ath/ath12k/mac.c  | 80 ++++++++++++++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/wmi.h  |  1 +
 3 files changed, 76 insertions(+), 9 deletions(-)
---
base-commit: 3d933084a072fd5fb5da54c06a017abc0412c86f
change-id: 20250422-ath12k-unicast-key-first-9ce48f797b15

Best regards,
-- 
Baochen Qiang <quic_bqiang@quicinc.com>


