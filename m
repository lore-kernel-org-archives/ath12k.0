Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47E1EEAA59
	for <ath12k@archiver.kernel.org>; Thu, 14 Sep 2023 17:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CvFxnbW9eMnlYgiqJJMKoCZjzlpIrhkl92uzJkfbwqs=; b=rV55pC4gsFX80T
	gJPoic4vUUW0PavtbtlU5aBGHynXHPj5s07ulkqEUXzHhyn1wapdK8dfQ6hMkhAFukQ2ixzi7ZTk0
	a1+2BVfgpqvrL9MtPcfxU+01mb/pYmzLEU833npZHob8fbr/DAscELHesJU3wBaSW39atqq361JIS
	QMgjE6iptMEi0+XLnElmo3A+BHgBtSsQ/+nLdJNB51nXQGvd5HxyTfz+1oH1Kt+GmetrvTaQG1uo0
	vUbgi0SV904jR4Xmkmn1pHY6aJpCEOHFhM+84csqb+xX5/2VYlVywtlvzbB4vd4yYNLITO7cs2luv
	rGcFRaORit0RyxvbAeRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgpxL-008ybU-0k
	for ath12k@archiver.kernel.org;
	Thu, 14 Sep 2023 17:16:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgpxI-008yam-2O
	for ath12k@lists.infradead.org;
	Thu, 14 Sep 2023 17:16:42 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38EFEcCP011731;
	Thu, 14 Sep 2023 17:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=5/qkISIDGNfNLwBtLJGp0FO3+guaXihpsK5MAftO+r0=;
 b=jbs8hLPFK0fUuFHFo6aexndZBvt1vnUKS0WEIYuFDtEaNz13qHytBrgs6RhnWbdju0Ye
 MrCoPSvI43Y6zQXhV1IRqCtR+kIap9TvETDXWcUM++7uWu27yJShN8INRtFJZTB2n14r
 6ke0PgBXGqbvOs3vINLf8xizu6mCWMxG8lEwkEV3MKi/+ZPQ2uhkXRIk4XBY4XeQ0vyW
 FSg78B+fU2k4MbzavvJORC9aXVP2D6zZwEkWtWkChlLs+XSIwqvjGcdQsSHJOIqpkHui
 IEL5K6c4QHBm2r3lVQ5Xc0HWg7IFe2S/t2ACTY2b/FwiViCgBq/CS8jvXx361KYLjVvF DQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t3re32bjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 17:16:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38EHGaVi026875
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 17:16:36 GMT
Received: from [10.111.183.186] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 14 Sep
 2023 10:16:36 -0700
Message-ID: <706ae5a8-70bb-45c3-9757-849622af6b64@quicinc.com>
Date: Thu, 14 Sep 2023 10:16:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] wifi: ath12k: avoid firmware crash when reg set
 for WCN7850
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>
References: <20230914090746.23560-1-quic_wgong@quicinc.com>
 <20230914090746.23560-4-quic_wgong@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230914090746.23560-4-quic_wgong@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Z-9zWkx1XCtM4Bk-ftSQPvpKlTDLR1Ut
X-Proofpoint-ORIG-GUID: Z-9zWkx1XCtM4Bk-ftSQPvpKlTDLR1Ut
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_09,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309140149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_101640_892697_F6E6A5AE 
X-CRM114-Status: GOOD (  12.43  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 9/14/2023 2:07 AM, Wen Gong wrote:
> For the NL80211_REGDOM_SET_BY_USER hint from cfg80211, it set the new
> alpha2 code to ath12k, then ath12k send WMI_SET_INIT_COUNTRY_CMDID to
> firmware for all chips currently. When test with WCN7850 chips,
> this WMI CMD leads firmware crash.
> 
> For AP based chips(QCN92xx), WMI_SET_INIT_COUNTRY_CMDID is the correct
> command use. However, for STATION based chips(WCN7850), it need to use
> another WMI CMD, WMI_SET_CURRENT_COUNTRY_CMDID.
> 
> Add flag current_cc_support in hardware parameters. It is used to
> distinguish AP/STA platform. After that, the firmware will work
> normal and the regulatory feature works well for WCN7850.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
