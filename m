Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E291C369C7
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 04:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZKty+1TmGMUHk8zlC3xV8ybQycCQGSbmC50dSeZACmc=; b=WQyQlVl+QC+AfkbuH08Vm9vYmQ
	t7Wnm7Oa4KPHXXqzhfWPdKCo64OE0uhCbJJctkAfvevOId0PoHcEvdq8TA2ut4ODpNC+s9SpS8CCx
	onMAfmTdeIaiDfHwSjxfuA/+xqF0Q0ntw41QlWXgbpu1ZgXmLAkxQ+LjduhabHAA/PSkyhZSDu9o1
	sMlTOZWsXAmLTwzObcvxMsLrEyfVHPay+3NB9vpeI5vz0SCOTXt5l1BfcwVVBQrf1du2z5Z2sAEbD
	KiIWi9NcGPJXUxYbDo7y54709xMRfc8ArtANOUlYQnVXOClDWFOgcBfGYdnKMR5NX7B3kh/p2Ic5B
	W7n0rXJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5HJf-0000000Bii5-3NiV;
	Thu, 17 Apr 2025 04:57:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5HJd-0000000Bih5-093A
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 04:57:34 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GMnoeC020542;
	Thu, 17 Apr 2025 04:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZKty+1TmGMUHk8zlC3xV8y
	bQycCQGSbmC50dSeZACmc=; b=bHhtBp2ERfXfC8qdGeP3BzoiVtMpPVrQTzE0gm
	1qAGTS84cOKV6ptzCTLA/JtrzvxRqjVkjiy9gdHlh9bkQ2TUxOlcqRGTra++SVbc
	vdk4e7/p1YKAgjF9nT6p0qHENM30GBjSm7Kd4LdrBqp8W+LMCEIb9MNifJYalo4+
	mIIg3OsERu0dyQcESMQw3GCFDL2F068Lxhh9rfMN3ZiO5GrMTvg74Kc8MKZBKt2T
	1TSsf0xqyb2RnLwKp77eNJDaSkWXvYu8/QVp+AGbDTHH+mnaWnAeeJHgpHfiMcmn
	oRlDFbAps30tLTLMqnwZgOLaCAeFWRisPVVIg0+Fvhc7QPqQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wnpqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 04:57:30 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53H4vTs9015100
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 04:57:29 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Apr 2025 21:57:28 -0700
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sarika Sharma
	<quic_sarishar@quicinc.com>
Subject: [PATCH ath-next v5 0/6] ath12k: add support to fill link statistics of multi-link station
Date: Thu, 17 Apr 2025 10:27:03 +0530
Message-ID: <20250417045709.770219-1-quic_sarishar@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=68008a3a cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=kYzkSp3CTHGy5h0v6O0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: jQfTyoHgXPcG8EWraZx1apoUkW-zIY6y
X-Proofpoint-GUID: jQfTyoHgXPcG8EWraZx1apoUkW-zIY6y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=684 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_215733_255034_F0697AA8 
X-CRM114-Status: UNSURE (   7.58  )
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

Currently, station statistics are filled at deflink for both non-ML and
multi-link(ML) station.

Hence, add support to fill station statistics for the corresponding
link of station.

Depends-On: [wireless-next,v6,00/11] wifi: cfg80211/mac80211: add support
            to handle per link statistics of multi-link station
Link: https://patchwork.kernel.org/project/linux-wireless/cover/20250415042030.1246187-1-quic_sarishar@quicinc.com/

V5:
 - Removed mac80211 patch from this series and included in dependent series.

V4:
 - Removed driver patches.
 - Added branch tree tag.
 
V3:
 - Fix kernel test robot build error

v2:
 - Convert RFC patch to actual PATCH with each patch bisectable.
 - Add new patch to update bw for ofdma packets.
 - Add new patch to fetch tx_retry and tx_failed packets.

Sarika Sharma (6):
  wifi: ath12k: enable wiphy flag for MLO station statistics support
  wifi: ath12k: correctly fetch arsta for MLO
  wifi: ath12k: add link support for multi-link in arsta
  wifi: ath12k: add EHT support for TX rate
  wifi: ath12k: correctly update bw for ofdma packets
  wifi: ath12k: fetch tx_retry and tx_failed from
    htt_ppdu_stats_user_cmpltn_common_tlv

 drivers/net/wireless/ath/ath12k/core.h   |  2 +
 drivers/net/wireless/ath/ath12k/dp.h     |  2 +
 drivers/net/wireless/ath/ath12k/dp_mon.c | 23 ++++++++----
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 48 +++++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/mac.c    | 17 ++++++++-
 drivers/net/wireless/ath/ath12k/peer.h   | 28 +++++++++++++-
 6 files changed, 102 insertions(+), 18 deletions(-)


base-commit: b80c52642c1159c2596776b39b06eb1c2e36baff
-- 
2.34.1


