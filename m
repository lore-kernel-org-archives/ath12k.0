Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EAAEB8FA5
	for <ath12k@archiver.kernel.org>; Wed,  6 Sep 2023 11:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8Ne5pdI6bIsSSHJqZpZrAy5uw5kyywI/i+xrdAXhnJA=; b=Gp6UulB0GUIZUv
	AkcwqL2jxMksfWd76s019wO2fim+rnD7ABJ5sFoNaB1ROdh8snwRnublrOs4WXt8oQRs42D88sdY6
	N3U/MN8OfQyCvbOxTnd1E2aNeoEaWNmokN6SrAbuU8wfHBt0gpGUcwFAdBOpsZf3cXczEaFBvzjg0
	hRGNhzOpP+iBsZn/Ilm5ognIETBkXpmfXATlI1t1eRJyxLNhb18yMxvNOXptZ8Imu/uX/BT0wyEu+
	qe9vwEdurPwflse7W8ilRNiiRcrkOI2kd/gQBvZvPdOItRF0CDZyz5PH6kc3DcndeqsVk6WkQT1bm
	dknqs7Kgi0L8GOHA8olg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdqyv-008x43-3C
	for ath12k@archiver.kernel.org;
	Wed, 06 Sep 2023 11:46:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpsS-008CTu-0m
	for ath12k@lists.infradead.org;
	Wed, 06 Sep 2023 10:35:18 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3867J85I006022;
	Wed, 6 Sep 2023 10:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=6x6AGspnHuDuxZLjKxPbmmN6vd+DuLBpY9FOhXhZ28s=;
 b=aZU6rK1v8IbJHsh2Lfn7CT++sLyNLuoUrEt9Zkll+JX7xwfhquH/KpfD6RNCHNvtINge
 2W+3GeWtfjkKgpMK3UA9iuwNXXgb5dKv3iYQ0x40vD13kL2EB4i3JKTOttV1gM/pEzGB
 1qGmYSc0E2Wq74b8NCHU3jaGKI4dp/O66TpaUjTRuAt7ScL9fsqtSYBwuLHNWJj7LbyC
 r/0w1MABejSdGAIT6QLJAOzqNf/aACb0OiP3tWguMbjBmBJHCVvcJ+IdrRq0sS8kemJD
 RaBbi2quDBNv65d1VuoCDcyn2oGQlf8C8f2ekYIVuzUVCqFk/PnzaWYqr9uTUPB6GwWe zQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sxfrkh609-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Sep 2023 10:35:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 386AZDqj029305
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Sep 2023 10:35:13 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 6 Sep 2023 03:35:12 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH 0/3] wifi: mac80211: change to match driver to support MLO connection
Date: Wed, 6 Sep 2023 06:34:55 -0400
Message-ID: <20230906103458.24092-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2O8OCoCjQtzVvvSxYAthHARFxcvJ3jr8
X-Proofpoint-ORIG-GUID: 2O8OCoCjQtzVvvSxYAthHARFxcvJ3jr8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_03,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 mlxlogscore=858 mlxscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309060089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_033516_400268_CBB9648E 
X-CRM114-Status: GOOD (  13.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Currently mac80211 use its default settings, it does not meet requirement
of some driver such as ath12k. So extend its interface to driver for MLO 
connection.

The default settings in mac80211 are:
1. all link address are random for station
2. active link is only for primary link for station.

primary link: the link used by the latest exchange of successful
(Re)Association Request/Response frames.

Wen Gong (3):
  wifi: mac80211: add support to allow driver to generate local link
    address for station
  wifi: mac80211: add support to allow driver to set active link while
    connection for station
  wifi: mac80211: update link RX NSS by ieee80211_sta_set_rx_nss() in
    ieee80211_assoc_config_link()

 include/net/mac80211.h    | 17 +++++++++++++
 net/mac80211/driver-ops.h | 42 ++++++++++++++++++++++++++++++++
 net/mac80211/link.c       |  8 +++++++
 net/mac80211/mlme.c       | 26 +++++++++++++++-----
 net/mac80211/trace.h      | 50 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 137 insertions(+), 6 deletions(-)


base-commit: 3f257461ab0ab19806bae2bfde4c3cd88dbf050e
-- 
2.40.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
