Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234ABE77197
	for <ath12k@archiver.kernel.org>; Thu,  9 Jan 2025 18:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6fUGQgLlJS6LEL9AOOUpxIsT5RuD8FZlNiVYfm22PsE=; b=tRbKVkXtJ6+yrn
	RkmQtkqurpxmMLhtAkOiiHmrPZOsiZXVjpHmhGBlzM6TXnQZPjy6GMkcfzTk2ZCkHic+a25SpLjcV
	6gSLXkIFtu/j7TUzhFa8AcYYNbHsNB0BuWsRV0SPmK3DiEMWuTiOtxrMgvHFacH9eHH4LniBAVayF
	bXT7kbvvJkXhmPlBJYAuFA2YDlj1/qBqANHbAxSA6OEtj6AKv1iZaknp+S6Na8dKNKbdKARr9vOIx
	X63pr4t6TfiamdeGrve4B2gfgEyMoXq4VEoNK6izJF00MQey0zqJT41sx06Yaxnc2hlemPVCNrhK1
	7KwrOtDgzPPsIU6s5nDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxYY-0000000D1Ll-3cIj
	for ath12k@archiver.kernel.org;
	Thu, 09 Jan 2025 18:46:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxV7-0000000D0qs-2nJ1
	for ath12k@lists.infradead.org;
	Thu, 09 Jan 2025 18:43:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509Bcrle000581;
	Thu, 9 Jan 2025 18:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6fUGQgLlJS6LEL9AOOUpxI
	sT5RuD8FZlNiVYfm22PsE=; b=aHhys1znKW7kUPilbjR/baHgM2iT0b6Ieh7LR5
	x+tmOlcpqi7QO7eeOdQAwL1HeU+RMzQWtUVcQgVD2JzCecoRfgjYpiBvTa1mz8K5
	sEtcXAFzilTSsQPquo7gSqucoBlNzGClZ0z7jJFnisPTTRvi/eZHOLWfvI4z6EtG
	SODfmnmlr4diQ/Ttrh8hyctBp939+GAthsP1GnNumnXlVZzyyLgo8HZKijYye53A
	5dG2oTFDFo0ML2mOc9GoUovqXmMlf/YJoIvwpozkvYCn4VF8S136CsHpLlhQHehJ
	c4ezGI3DgNbW6XhbImswvgIIpIY3SOJYahmGot/JIp9yc6Kg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442drws1et-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 18:43:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509IhLm3018523
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 18:43:21 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 9 Jan 2025 10:43:19 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Subject: [PATCH 0/2] wifi: ath12k: handle
 ath12k_mac_ieee80211_sta_bw_to_wmi() for link sta
Date: Fri, 10 Jan 2025 00:13:11 +0530
Message-ID: <20250110-fix_link_sta_bandwidth_update-v1-0-61b6f3ef2ea3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL8YgGcC/x3MSQqEMBBA0atIrTsQIw7xKo2E0pRadBMliQOId
 ze4fIv/LwjkmQK02QWedg68uIT8k8Ewo5tIsE0GJVUpc6nFyKf5s/uZENH06OzBNs5mWy1GEsW
 Ig260knVVQXqsnlLw/r/dfT+gMXMEbwAAAA==
X-Change-ID: 20250109-fix_link_sta_bandwidth_update-3fac98920766
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eInbEW924o4WpgTt0lA3ANf5wbMQBMX8
X-Proofpoint-GUID: eInbEW924o4WpgTt0lA3ANf5wbMQBMX8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 impostorscore=0 adultscore=0 mlxscore=0 mlxlogscore=460 spamscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_104325_835369_5E169D84 
X-CRM114-Status: UNSURE (   8.53  )
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

Currently ath12k_mac_ieee80211_sta_bw_to_wmi() handles the bandwidth from
sta's deflink member. This works only for non-ML station. Now that MLO
support is there, extend this function to use link sta instead of deflink.

Patch 1 relocates ath12k_mac_ieee80211_sta_bw_to_wmi() so that it can be
called from a function used in Patch 2. No functionality change.

Patch 2 actually extends the ath12k_mac_ieee80211_sta_bw_to_wmi() to handle
link sta.

---
Aditya Kumar Singh (2):
      wifi: ath12k: relocate ath12k_mac_ieee80211_sta_bw_to_wmi()
      wifi: ath12k: handle ath12k_mac_ieee80211_sta_bw_to_wmi() for link sta

 drivers/net/wireless/ath/ath12k/mac.c | 79 +++++++++++++++++------------------
 1 file changed, 38 insertions(+), 41 deletions(-)
---
base-commit: dbe50a7420e22954c747e79e72df2750d795ea77
change-id: 20250109-fix_link_sta_bandwidth_update-3fac98920766


