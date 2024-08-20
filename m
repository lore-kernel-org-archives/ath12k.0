Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382E7C3DA4A
	for <ath12k@archiver.kernel.org>; Tue, 20 Aug 2024 02:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CAwl2Q6dPuzwSLzJMu7Kre3AsJKvtgjXk8WbjF+xdBA=; b=0akdJbCanwoHIEaOOUWRY4QSEt
	IOhhRvIaXaRpRziS7RykZLoF1+h1/1HIcarZwHWRg9UYjtf5M2bV1eVd2aSt1ELVQJ00BtX39jnDq
	5PM6g7ASv4Af6IgNCxS5JyVJiTf0UZBx5NMtVT4Fs0USQS9lwI/H5E1AZU+YJ1zN+m2HpS3UrY9eb
	gV20lOK8mxnE9+ZBuRI+AITn9YZF8IQWlbowVoPmuqZat4wsvgQZo4Fzn727ZA1N8TSYgK1gsouBN
	uJwm3Pco+2foyEVGyo1r+hs2VuxKaYnpRKC8V7U4wWcAmsB3q0ezWLQNhwwanGjIER8c96uhDB+6v
	LSNOk2Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgEMx-00000003WTh-4205
	for ath12k@archiver.kernel.org;
	Tue, 20 Aug 2024 02:13:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgEMv-00000003WT6-3VbQ
	for ath12k@lists.infradead.org;
	Tue, 20 Aug 2024 02:13:11 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JN1ZLd025154;
	Tue, 20 Aug 2024 02:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CAwl2Q6dPuzwSLzJMu7Kre3AsJKvtgjXk8WbjF+xdBA=; b=eo+ckkkwlVy96Tbp
	xFW30q/vRiOLZ7+q4sGNZlLwHMdvHJjmn61i4YeTqA1PaoHXFbDcfa2aIcCbqmaZ
	9sE/FmkZRivnFFXSSm9s7sPi5fEWkBnqmB+JbELhG+v/Q3P9LkwWpK26/REqoWy9
	Xg++7vIRiXW0/uCPuzZ9WxBkKJCXqMIdcqaU5qKBF3iF7wmA/99DH9ZCluu55Smv
	9JJZ90JN64RTnJII2aGBR7Pm7ymzeCXfZHmn3sByJ1sLEekI05H7vuwp/1L8CYqQ
	TevpV28NdV0M9Ab2payZCROfi1/v4JG6BIAFCEJzFeJY+mg/WPJDPO2mX9FPC5Ic
	+qMwcg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412m32p0q4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 02:13:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47K2D4MW032303
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 02:13:04 GMT
Received: from [10.110.44.119] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 19 Aug
 2024 19:13:03 -0700
Message-ID: <7d2761d9-3bb9-4e77-9292-b64a32a4c5a5@quicinc.com>
Date: Tue, 20 Aug 2024 10:13:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: WCN7851 and QCN9274 monitor mode not working
To: Florian Schmidt <florian.schmidt@ellisys.com>,
        <ath12k@lists.infradead.org>
References: <a92fb3ec6dabea4445a8a4d3fe136b1d@mail.infomaniak.com>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <a92fb3ec6dabea4445a8a4d3fe136b1d@mail.infomaniak.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: W28ynm_h14Q4XETNUQVaBmaaiE7T3tUv
X-Proofpoint-ORIG-GUID: W28ynm_h14Q4XETNUQVaBmaaiE7T3tUv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 mlxlogscore=990
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408200015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_191309_902719_9DFDD432 
X-CRM114-Status: GOOD (  15.16  )
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



On 8/19/2024 5:14 PM, Florian Schmidt wrote:
> Hi,
> 
> I am trying to use ath12k in monitor mode with cards WCN7851 and QCN9274 without success.
> 
> When switching the interface to monitor, iw always fail with the following response:
> command failed: Operation not supported (-95)
> 
> But ''iw phy show’’ reports that the interface support monitor mode.

This flag is set by mac80211 in ieee80211_register_hw():

/* mac80211 always supports monitor */
hw->wiphy->interface_modes |= BIT(NL80211_IFTYPE_MONITOR);

Our upstream code currently doesn't support it yet.

> 
> I tried with many kernels, using todays firmware from the ath12k-firmware repository, the 6.10.5 kernel and the ath-pending kernel and always get the same result.
> 
> Is there any way to get monitor mode to work on Qualcom WiFi 7 chips?

No, we haven't upstream related patch-set yet.

Indeed we have some patch-sets under review now.

Not sure when we can upstream all of them.


> 
> Thank you.
> 


