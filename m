Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F82CE7AA5
	for <ath12k@archiver.kernel.org>; Thu,  5 Sep 2024 23:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohFs8Y+LtGdv3tSl7PQMQM32Bz1Jv/x7UP5Zd/fbPt8=; b=mCFoE617zlSg7KTkeInJddXXBK
	5ai0WnT5xmpjh81cA3FTGSag80m7vrQpbRcBdR8Oep6Viof6SulxMtlWQ8warQdzpFbxxyNc0B1DN
	p5hyobJKPuTiyO4zf51uGoMkiXlbfe4C09dAajOTZqigZ/uNPtWPXrfIi1A7NyU6AXEu1Vo5L2FoN
	ADFr8pRBlnR8iaVtG4+vIz2DjoPwtMO2OetiCV6y6g1zm+t3jT0DfjJmi++AJQPK/i+4zrFjkSguL
	TlZCXmHDbXueCn1M6c/4qNbPvtnB1pF5NIg7/fj5EHB/YpGRbAClW6CindDXZq56wAi+0/91v5TYO
	mrqLTI8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smM4S-0000000A8K9-2Rpk
	for ath12k@archiver.kernel.org;
	Thu, 05 Sep 2024 23:39:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smM4P-0000000A8IM-1nAf
	for ath12k@lists.infradead.org;
	Thu, 05 Sep 2024 23:39:22 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485IUiiC024660;
	Thu, 5 Sep 2024 23:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ohFs8Y+LtGdv3tSl7PQMQM32Bz1Jv/x7UP5Zd/fbPt8=; b=NsCn6YVqg4CWu4YW
	7SgpHm3m47v1hkFxSdlrOJREdEcy/vzw57JnZcMt1jGMEv6wIj7rv834sLCG+91d
	MW8/eYZZOBB54pS0WP3xiUqy6myZ77PBQ3C2IK4s+Vl71dc0eFo/gCNam9tYT+FS
	1Wm2yf4civvBCh3QmIf6j0Iry0ik2xebSg2c+3qwpAVwPt45VIb1+evSG75+T2vS
	nYC2W2gI2kbUU9LDSO45nMRq6jPOgzjEWGQ9sviOS+wKjODH7OicTR8BIyLuMPsT
	TOx13Nty1ET/F+H3tPH0ZNRXAbtL1xQJwpM40N4ylplvdXcDWtxtzpVEcx5xz9YX
	KS8+Rg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fj038h1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 23:39:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485NdJgx018706
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 23:39:19 GMT
Received: from [10.111.181.108] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 16:39:19 -0700
Message-ID: <5f3f3e40-2329-45ea-ac6b-933436cb1b49@quicinc.com>
Date: Thu, 5 Sep 2024 16:39:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] wifi: ath12k: use correct WMI command to set
 country code for WCN7850
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240905023511.362-1-quic_kangyang@quicinc.com>
 <20240905023511.362-4-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240905023511.362-4-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cbPwafpkmRCc7i2XY6-rout__wiHTmOM
X-Proofpoint-ORIG-GUID: cbPwafpkmRCc7i2XY6-rout__wiHTmOM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_17,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409050177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_163921_520555_B9011CAD 
X-CRM114-Status: GOOD (  11.84  )
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

On 9/4/2024 7:35 PM, Kang Yang wrote:
> From: Wen Gong <quic_wgong@quicinc.com>
> 
> When userspace try to set country code by NL80211_REGDOM_SET_BY_USER
> hint(like iw reg set XX), it will pass new country code to ath12k.
> Then ath12k will set this new country code to firmware by
> WMI_SET_INIT_COUNTRY_CMDID. But for WCN7850, this WMI command won't
> take effect.
> 
> For AP based chips(QCN92xx), WMI_SET_INIT_COUNTRY_CMDID is the correct
> command. However, for STATION based chips(WCN7850), it need to use
> WMI_SET_CURRENT_COUNTRY_CMDID.
> 
> Add flag current_cc_support in hardware parameters. It is used to
> distinguish AP/STA platform. After that, the firmware will work
> normal and the regulatory feature works well for WCN7850.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



