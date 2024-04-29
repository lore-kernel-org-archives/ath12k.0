Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB690C04FFE
	for <ath12k@archiver.kernel.org>; Mon, 29 Apr 2024 04:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5q2K8xBKQ9Jl844a5SugdurDoUavfSeIvZB8oGF/J+o=; b=2THKXOkn7zYJyGoWElVD6jbDdV
	uaFz0ElPwZ2gcBvf9wzDFeQlbC73a6b8i1SOLCi5oLF6klWDkWAoTvvFShnU8kvQMvuAP0lK5Mf0z
	6IgSE5pvaoZgwH4fKA6wDRyuhjrBx5TsMAe0fncftk2Z/Q0JvMBrWLwzl19pgWHTUHvG6+hmxyoSl
	uPgkbsX18tb55CKdzT1HyaYVll0DEncnLpeV+jznfYwpAlIQMknTAk8Ghe0OfWW5coJ5SzgaW75K+
	dhnsWmpa9Otff3IGpwKIGklKz+TllVCLTUnxhsLANb/G77IaxpuyGNskFHwApDPvaUwuq11uNpK0l
	YjANpYxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Ic3-00000001PeR-2EcW
	for ath12k@archiver.kernel.org;
	Mon, 29 Apr 2024 04:27:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Ic0-00000001Pdw-2LQu
	for ath12k@lists.infradead.org;
	Mon, 29 Apr 2024 04:27:34 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43T3QH11007150;
	Mon, 29 Apr 2024 04:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=qcppdkim1; bh=5q2K8xBKQ9Jl844a5Sug
	durDoUavfSeIvZB8oGF/J+o=; b=bE4ye/EO9ydx61Vdy7GpI9ikYekPtnZfh+A7
	noQ9Q+gedHUhdpe77VgWkjP3ejzikIc0pQbX5fzBouTmBZGza3ZKxb67lybnNYmE
	XjufMpQw26QB6uOVcf3MOHrhpYxXDuB70rkGz60n9mVca1+DTrs4q6muuibsL+eG
	LzeFUBeSHZLCds/dfpUlwLoPUuyubatW3SDkg9bQdFgbxQMw4hD8MkK27d6hRIu2
	Ln6ci6ByBiarmcvWKneB1SQhoNTHCKw0q++mlaxtjhOfwZJYIK2BlixchibEwlzM
	Xx1DDkCIfvhKItWmW2wcL5Cc3B4LfCU2cya25CFkdBc5/ouDFg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xrsk7an97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 04:27:30 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 43T4RQge001768;
	Mon, 29 Apr 2024 04:27:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3xrtekr37d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 04:27:26 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43T4RQ4w001763;
	Mon, 29 Apr 2024 04:27:26 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-hprem-blr.qualcomm.com [10.190.108.75])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 43T4RQZY001762
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 04:27:26 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 4146166)
	id 40A754114B; Mon, 29 Apr 2024 09:57:25 +0530 (+0530)
From: Harshitha Prem <quic_hprem@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Harshitha Prem <quic_hprem@quicinc.com>
Subject: [PATCH] cfg80211: Allow pre-CAC for self-managed wiphy
Date: Mon, 29 Apr 2024 09:57:23 +0530
Message-Id: <20240429042723.2847389-1-quic_hprem@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Owekhh_DmlNsuFF7cS65VjSlZdOhQrnt
X-Proofpoint-ORIG-GUID: Owekhh_DmlNsuFF7cS65VjSlZdOhQrnt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_01,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=603 bulkscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404290028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_212732_629390_7E0D8D1D 
X-CRM114-Status: GOOD (  12.08  )
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

Currently, to allow pre-CAC it requires both driver's regulatory domain
in wiphy and cfg80211 local regulatory domain to be same, along with the
region to be in ETSI.

But, for self-managed driver, some countries have mismatch between these
two regulatory domains and it would not allow for a pre-CAC. For example,
in ath12k driver (self-managed), country Sri Lanka (LK) is classified as
FCC domain as per cfg80211 local regulatory database but as per ath12k
driver it falls under ETSI domain then because of this mismatch, the
driver might not be able to do a pre-CAC.

Hence, add changes to allow pre-CAC based on wiphy's regulatory setting
if it is a self-managed wiphy.

Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
---
 net/wireless/reg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/wireless/reg.c b/net/wireless/reg.c
index 3cef0021a3db..e8cc38e37377 100644
--- a/net/wireless/reg.c
+++ b/net/wireless/reg.c
@@ -4214,7 +4214,8 @@ bool regulatory_pre_cac_allowed(struct wiphy *wiphy)
 		return pre_cac_allowed;
 	}
 
-	if (regd->dfs_region == wiphy_regd->dfs_region &&
+	if ((regd->dfs_region == wiphy_regd->dfs_region ||
+	     wiphy->regulatory_flags & REGULATORY_WIPHY_SELF_MANAGED) &&
 	    wiphy_regd->dfs_region == NL80211_DFS_ETSI)
 		pre_cac_allowed = true;
 
-- 
2.34.1


