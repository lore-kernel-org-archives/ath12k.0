Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413FAC27C78
	for <ath12k@archiver.kernel.org>; Tue, 11 Jun 2024 20:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YA66go1OLv9lBRcUBZWz6pC4YMCi3WcWl5KdoPejptw=; b=4liRfZNEUXmBdz7osHgjneRhC1
	2QlHOuJv3kgCAPJx4WT6APL4uNYIMiGUyC8s6s5OT9K4SOww/43UwT3K8Tly1v5/d+kdO2xR8isJD
	uShym7w64Rie8ptb8sr71mvbslfYkorkkHV8pokG7BoHoqq6xJ5ZhV6ANqBUw+9J+3CZeXNayVeCJ
	Eltos0NzRzMiBYMtb4UJEYryBzjeg6ODWhBrshJIgdVQhKEBgl0gpz6LrFhIiI3Zkt2Z4JarlDIea
	I9dXpoPT7jSQqxDC83SbMHuISQmze5TOC/AruAWy5RPKNx1tghD4AKI0qOjTftK/M1WSvbfI5Rb9d
	qWvWlFZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH7r4-0000000A8Ve-3X0y
	for ath12k@archiver.kernel.org;
	Tue, 11 Jun 2024 20:12:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH7r1-0000000A8UG-039u
	for ath12k@lists.infradead.org;
	Tue, 11 Jun 2024 20:12:29 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BF2UqQ006245;
	Tue, 11 Jun 2024 20:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YA66go1OLv9lBRcUBZWz6pC4YMCi3WcWl5KdoPejptw=; b=d30kiRpB8DS8uuAx
	CGsf8GGsnTciSqltIHG5S9CSaPmF65/jVD7m3eVCzu6uIZPrSCuQX5/3YKduhrGA
	4oC9vUfAUkvg60u//2R4jkTVQJb/dEYq8+MM/Oh4gOGPR8T1XqRo/7NULs1QhA8A
	rFs0/llYiH0ftr5Q5/jwssCTCw+OxRN888fqyYqtbBk0IRtK2RmhW4xFaMS+hEKf
	xrY5ov/NXIVdUrUZWYaCptqQA7UHHWxUQHOFJGkqfvTypTVp0D6upPpJqlpif2KQ
	7lNVSj6RrgK1PSTapQp1vmpcQ8xxYCwQo+HDAgPxu4ubyIMVMrr/s/GAa/Rd2cQp
	bFOkRw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymcnmyadf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 20:12:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45BKCPT3017682
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 20:12:25 GMT
Received: from [10.48.243.20] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 13:12:24 -0700
Message-ID: <8733cbe4-19cf-47d0-b95a-914f999117f5@quicinc.com>
Date: Tue, 11 Jun 2024 13:12:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: fix uninitialize symbol error on
 ath12k_peer_assoc_h_he()
Content-Language: en-US
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240611031017.297927-1-quic_aarasahu@quicinc.com>
 <20240611031017.297927-3-quic_aarasahu@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240611031017.297927-3-quic_aarasahu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gJn_0yLTU8J3vGVd0Sd9JrDNHGAcEbqA
X-Proofpoint-ORIG-GUID: gJn_0yLTU8J3vGVd0Sd9JrDNHGAcEbqA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_09,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_131227_204442_DD76A8CE 
X-CRM114-Status: UNSURE (   7.95  )
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

On 6/10/2024 8:10 PM, Aaradhana Sahu wrote:
> Smatch throws following errors
> 
> drivers/net/wireless/ath/ath12k/mac.c:1922 ath12k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_80'.
> drivers/net/wireless/ath/ath12k/mac.c:1922 ath12k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_160'.
> drivers/net/wireless/ath/ath12k/mac.c:1924 ath12k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_80'.
> 
> In ath12k_peer_assoc_h_he() rx_mcs_80 and rx_mcs_160 variables
> remain uninitialized in the following conditions:
> 1. Whenever the value of mcs_80 become equal to
>    IEEE80211_HE_MCS_NOT_SUPPORTED then rx_mcs_80 remains uninitialized.
> 2. Whenever phy capability is not supported 160 channel width and
>    value of mcs_160 become equal to IEEE80211_HE_MCS_NOT_SUPPORTED
>    then rx_mcs_160 remains uninitialized.
> 
> Initialize these variables during declaration.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


