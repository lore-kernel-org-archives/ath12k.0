Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BF7E65D0B
	for <ath12k@archiver.kernel.org>; Fri, 22 Nov 2024 00:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23YJlfXw2yR0sfaMFWwz+1N3i2Ct9ZR8Rywhr8GvEpI=; b=XwEswxLU2gUCDcqVsv4b4v/RwI
	sl31pHHxd3CJWgAJER6MRORlJiEkjGmVyMOLlUjLigzO5KyqMY95mVqWIg1+tfasN072wq2Xy8u/0
	ny/RvsVH75iE+OiIn64lTnRdxsVnWEzHlXvDfAwIu3vcnty4jte1sZ38GWY/pKMyeSgMvhZeLJhvA
	HlvXWzqNOdQiDOqUfCOmvhbpeKnACKR/tuXa7Mtv2hVDjqwdGaympat8zm7Enj6TIA9Y64t6e4gaL
	dJkIC51upwFOBl6PLHrGJHzILio/VmK8VCppovTcz/TeGB45P5TIwKaMw2EaQ1WB56tK7a4jrzK90
	f6RQ4PLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEHWa-00000001Ege-462r
	for ath12k@archiver.kernel.org;
	Fri, 22 Nov 2024 00:27:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEHWW-00000001EgG-3CEj
	for ath12k@lists.infradead.org;
	Fri, 22 Nov 2024 00:27:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALBM5VM004520;
	Fri, 22 Nov 2024 00:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	23YJlfXw2yR0sfaMFWwz+1N3i2Ct9ZR8Rywhr8GvEpI=; b=AN8BZG6iAVEntKY7
	T3m/3YGPu5h0jUZ1rAy6rhCp/X+uT1zpwMfd7GE3MWOLnHUQNe+BVd8V1apPkm/J
	mPQzkUjAD+7Pew8HvU+G6CpY+t2UjqzJX3P0iEnWEH3lvlXHvWm8RRwspGZjYWcU
	vDGY8vytDfO+73VGiAhamDROyMFxwv5f5hovjDgaGTnWNhu9DU02rVTZ55wWQqby
	XlkIll7Bvs8gBnRzSpq0u05OVkiIWIkRBPqqj38RsLrGbQCqegLOh8w2JsPymN6e
	uFjEzT2vZ2dNJl+kBv73RA5rHXYn3Rqsi3ZS5e4joIqRinFKtDveDsldLs6wbImI
	hHi2JA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ea759wn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 00:27:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM0Rh7F024872
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 00:27:43 GMT
Received: from [10.111.176.168] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 16:27:43 -0800
Message-ID: <84214119-96d9-4873-a655-bd2f6f649bb6@quicinc.com>
Date: Thu, 21 Nov 2024 16:27:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] wifi: ath12k: Use mac80211 sta's link_sta instead of
 deflink
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241121155806.1862733-1-kvalo@kernel.org>
 <20241121155806.1862733-9-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241121155806.1862733-9-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Vp3qouG9719r7-7ANFAKNK1DNYkFYP0A
X-Proofpoint-ORIG-GUID: Vp3qouG9719r7-7ANFAKNK1DNYkFYP0A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=567
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_162748_816174_CDD358A8 
X-CRM114-Status: UNSURE (   8.20  )
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

On 11/21/2024 7:58 AM, Kalle Valo wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> Currently mac80211's struct ieee80211_sta deflink is used to fetch any sta
> related configurations in driver. With MLO multiple link sta's (struct
> ieee80211_link_sta) are affiliated to an ML sta and corresponding link configs
> are present in sta->link[]. Fetch link sta of corresponding link from ML sta
> and use the same for configurations.
> 
> Add ath12k_get_link_sta() helper to fetch ieee80211_link_sta from arsta. But as

nit: Add ath12k_mac_get_link_sta() ...

> ath12k_mac_op_sta_rc_update() is called in atomic context the helper cannot be
> used and instead rcu_dereference() has to be called directly.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Co-developed-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


