Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D05C25B77
	for <ath12k@archiver.kernel.org>; Thu, 16 May 2024 02:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qs+JeCy9wW1EoDcZfzFyM0509IjCC53cLa2OzcW8YNk=; b=33emoydJonyxtbGvsXnqoUkqFo
	1jemCPGHrtlWGDr/7i9Lqb5cQM2WdqBSnCXdY57Qxnz3jTGTD/L3Hk1a0jSBeIOIksYKMqI84P/Kv
	E5rcYmuaiJIVw9h2UvyLUqbmuSJPnuebIJadsbtitvqSH1NT0DyBGUrSUFPSuPZMpBFW+1qZhAO15
	Z2PI2mW9yCBKGxjljEVZZxEUX4/QdA9zA+4zpBHIDJ0sg2yBPvzUjTO0oOjUN1Y5YLFtD6vxBugVf
	qAbZLvVfzMdOFHim2OxQ28c2fwCzrDR4lfuDKo5KRvh44tAAoPDibSIDfSdOeQosMvxWltwrYjNVc
	SrCpf5gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7QiD-00000003SAe-39U1
	for ath12k@archiver.kernel.org;
	Thu, 16 May 2024 02:19:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7QiA-00000003S7A-2qps
	for ath12k@lists.infradead.org;
	Thu, 16 May 2024 02:19:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44FMom36027349;
	Thu, 16 May 2024 02:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Qs+JeCy9wW1EoDcZfzFyM0509IjCC53cLa2OzcW8YNk=; b=oD
	9xn1p+O7A7e/w/hqW6zfH//3l9A6LaNy19DxB2vTK0cGHyJcuYU1YRilX6S//8pG
	SEt2NiA9lwfSoFRuME4lYjvDN4p7OKX8GPQIE4cxVsLw9eO/UN0PUDXXVhRtPS4D
	agvZxbc89BY72GAffJZX0P57Ak9SpnGFMM1V+FRvaK/dB0fbLi28e5pDtGMqySwY
	ftCfVIe8gkUoWGS0xyLHGzegy1C+JZTotwL+phcSROJA6T9FuBeY/fBLk1uLRcpX
	EMrn+WZIQh9Klwnml1x2Re8LzAdeeoG//81rJ7qpOoS5AX7XB2SVsA8UBeO/fflI
	0dazlFoyWr6GUSbeUcCA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y42kvw22a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 02:19:08 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44G2J7uQ024910
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 02:19:07 GMT
Received: from lingbok-Birman-PHX.lan (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 May 2024 19:19:06 -0700
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH 1/2] wifi: mac80211: fix the issue that checks the size of Spatial Reuse IE data
Date: Thu, 16 May 2024 10:18:53 +0800
Message-ID: <20240516021854.5682-2-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240516021854.5682-1-quic_lingbok@quicinc.com>
References: <20240516021854.5682-1-quic_lingbok@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yxSSQSgglY9JtltViEUGLmKd8AbDhEAT
X-Proofpoint-ORIG-GUID: yxSSQSgglY9JtltViEUGLmKd8AbDhEAT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_01,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_191914_907540_DE805617 
X-CRM114-Status: GOOD (  14.42  )
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

Currently, the way to check the size of Spatial Reuse IE data in the
ieee80211_parse_extension_element() is incorrect.

This is because the len variable in the ieee80211_parse_extension_element()
function is equal to the size of Spatial Reuse IE data minus one and the
value of returned by the ieee80211_he_spr_size() function is equal to
the length of Spatial Reuse IE data. So the result of the
len >= ieee80211_he_spr_size(data) statement always false.

To address this issue and make it consistent with the logic used elsewhere
with ieee80211_he_oper_size(), change the
"len >= ieee80211_he_spr_size(data)" to
“len >= ieee80211_he_spr_size(data) - 1”.

Fixes: 9d0480a7c05b ("wifi: mac80211: move element parsing to a new file")
Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
---
 net/mac80211/parse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/parse.c b/net/mac80211/parse.c
index 55e5497f8978..055a60e90979 100644
--- a/net/mac80211/parse.c
+++ b/net/mac80211/parse.c
@@ -111,7 +111,7 @@ ieee80211_parse_extension_element(u32 *crc,
 		if (params->mode < IEEE80211_CONN_MODE_HE)
 			break;
 		if (len >= sizeof(*elems->he_spr) &&
-		    len >= ieee80211_he_spr_size(data))
+		    len >= ieee80211_he_spr_size(data) - 1)
 			elems->he_spr = data;
 		break;
 	case WLAN_EID_EXT_HE_6GHZ_CAPA:
-- 
2.34.1


