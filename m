Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE41AC71136
	for <ath12k@archiver.kernel.org>; Thu, 12 Jun 2025 02:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2Ti9jWP13gHxXgYiLxvPYYX73Cvo+ynbHIVu9ujckXQ=; b=SVZNgvfdYf3/cV
	05KGxQNsaS4/RdBfuV93rP+oGn6vIOMgJxxPquIHLkNNL7qZKb1g9eRqaTzs2ITDRzpFXwlS65tQi
	IMFX4YzDRuL9zXum3CJ2BTIeekXqSzdKCLjmYWDkSBYGp3ZvRhes8vVLM/mkWgnRkQi8NHnopJcg3
	2czfKu+mkTpWf5B+yjpQyRgCytwgHlHrULfBjZNuUhLlDH3zF/NJE4twTArR0rJSai2zx1mEPAdMA
	FahhNOxeGpDZAYf6vY26+VaVh0RMNUepK1qD2Kc+j348rqPuPopyhRY2nUw9W9iqEFi3oOQN7dOcF
	I33E3FmJmVjvTZYgzWvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPY0Q-0000000C14G-2cuc;
	Thu, 12 Jun 2025 02:49:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPWnV-0000000Bsih-4887
	for ath12k@lists.infradead.org;
	Thu, 12 Jun 2025 01:32:07 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BJ0tYL027235;
	Thu, 12 Jun 2025 01:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2Ti9jWP13gHxXgYiLxvPYY
	X73Cvo+ynbHIVu9ujckXQ=; b=Mus47qp7abMP+BhBVit+nZniqHgqj3MvBT8iYb
	IVyqct93Xcj9howebVQDajQGhVog+f9gDfdKVBWz/wCgWTiq28GXA5B+ahZEG7nN
	KTdQH7ylnYPys5200l4Pq0aexuWPVjZ7+NJ0MLEIcPoKq0Sg74m/E1BNE1Min++O
	Bw+mpR5qxAvwuvxlRJBJKVspiWOe9eTk2AWXYvzHfkJeBdf93MNHELKlrhflKJWo
	Ti9gCce6EiI6plftcOeHIEfRtVIqWRY8aEho/ZZI3ZhFP/RzJllNDmsYmoxZTHqQ
	hqcPoGDoONahwudpI8GNsVAyeA4riZIVafj4OU55XRdr1pHg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrhdtc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 01:32:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55C1W1H7016131
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 01:32:01 GMT
Received: from [127.0.1.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Jun
 2025 18:31:59 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
Subject: [PATCH ath-current 0/4] wifi: ath12k: fixes to firmware stats
Date: Thu, 12 Jun 2025 09:31:48 +0800
Message-ID: <20250612-ath12k-fw-fixes-v1-0-12f594f3b857@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAQuSmgC/4WPy07DMBBFfyXymqlsJ5k8hFD/A7Fw0gmxIA71O
 AFU5d9x3C7KArEZaV733HsRTN4Siza7CE+rZTu72KiHTPSjca8E9hR7oaUuJSoFJoxKv8HwCYP
 9IoaamirHSioslYhfH57SIj49i3gM/eI9uSBerktP5yVSwu1iImaTKG32eIXI5g7CwQSG0+wIV
 gUKdJejLrBEbKrjzHw4L+a9n6fpEMvTbqAzTLBPbGizOwNwU6+Tk9FymP13yr2qZOXPiBEswdR
 505RDgQPiMUboret3ZlJb9T8KOiooGrArsKpLKX8rbNv2A0F7rmGJAQAA
X-Change-ID: 20250611-ath12k-fw-fixes-8e9736701651
To: Jeff Johnson <jjohnson@kernel.org>,
        Ramya Gnanasekar
	<ramya.gnanasekar@oss.qualcomm.com>,
        Aditya Kumar Singh
	<aditya.kumar.singh@oss.qualcomm.com>
CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>, g
	<gregoire.s93@live.fr>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=684a2e12 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=UqCG9HQmAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=WBYhJntNMX0R2oXoKHEA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: g-ebaOzTeTPWBEfcLr4SfgQAm7Idwn3_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDAxMCBTYWx0ZWRfX1vpGH1aTzm56
 arIPKGN0H6TBTOG+NwDGKR9v38EzX/bxip/GMEEc4YrpVQkhpmEdyzmaQR859xAlAMBuWzQTMOa
 RSdcqT+HohrHSXyH78JMQEtE/TCrZmAsK4uX+QcXPEuq0QglA0YtmtBc5zEFi/Nk/dZxfhrqScV
 dcWeniFxXTecIjm3pm+BI8IFxRA0VxMsWKi6v/GZLW+iN7gDgidMwMIgbAPoCvEdEP/hex3QVOC
 kPXkjjucDODz8mYvC4nZ3ofUbMhJ2dL/l8bZ+IWfdOwg0S5fqUNwHDsoR8Sy6CMWtWjMDmYiLlE
 6FsRTtGx4d+kwpVHMH2A+i10o9SwAoFjkK1F5qXkHFBkpan81xxhL4XZp/wf/5EAKmRUpOVgCMG
 F0R4a72ZGspn6wHr1GJTKPDljoQDhlRNiYDv7/PWcQUtGQHCI7FmCIqfSzxOMEorii8da/n4
X-Proofpoint-GUID: g-ebaOzTeTPWBEfcLr4SfgQAm7Idwn3_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_01,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=532
 mlxscore=0 clxscore=1011 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_183206_159931_4178FC7D 
X-CRM114-Status: UNSURE (   8.49  )
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

We get report [1] that CPU is running in hot loop while requesting
firmware stats, fix it in patch [2/4]. While at it, fix documentation
on back-to-back firmware stats events in patch [1/4], and fix potential
failures due to static variables in patch [3/4]. patch [4/4] fix the
failure when there is no vdev started.

[1] https://lore.kernel.org/ath12k/AS8P190MB120575BBB25FCE697CD7D4988763A@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM/

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
Baochen Qiang (4):
      wifi: ath12k: fix documentation on firmware stats
      wifi: ath12k: avoid burning CPU while waiting for firmware stats
      wifi: ath12k: don't use static variables in ath12k_wmi_fw_stats_process()
      wifi: ath12k: don't wait when there is no vdev started

 drivers/net/wireless/ath/ath12k/core.c |  4 +++-
 drivers/net/wireless/ath/ath12k/core.h |  4 +++-
 drivers/net/wireless/ath/ath12k/mac.c  | 30 +++++++++---------------------
 drivers/net/wireless/ath/ath12k/wmi.c  | 27 ++++++++++++++-------------
 4 files changed, 29 insertions(+), 36 deletions(-)
---
base-commit: 4e89e05afa9fff6e68ec25ba1f21e711d91dcfeb
change-id: 20250611-ath12k-fw-fixes-8e9736701651
prerequisite-message-id: <20250609-ath12k-fw-stats-done-v1-1-2b3624656697@oss.qualcomm.com>
prerequisite-patch-id: 4b16b879aa24110d163279b32576789fa7383913

Best regards,
-- 
Baochen Qiang <quic_bqiang@quicinc.com>


