Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A72E6F06E
	for <ath12k@archiver.kernel.org>; Fri,  1 Nov 2024 16:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7PYyh5Kj1ekYoVdSe6OMklmHajbeEZr4ogbiz+zR67g=; b=Ql2FJW+H0AUj7i78hClYbkaVxb
	bnJ+cUm4X1zDQketFZ60j9+RsuGhafIZFBxS7LSt/7+8/RBZ7UrAK4LuVurpfZXZI0LjvZ4EWFfA5
	2jrCXb2Yu15LL2ObpuoMKQyIyuADjbMHFrs8nw2fufFMD8PAQpcWOZuoLrv1bDYpJ9FfgR7Hqw8CA
	niPPkgjaCp9RSdoT74qafvwNonBjZK+50ujbLFcMxnV0a+ChNnaxIIpS4LKpUXb5HdYWT5ROy1d+5
	OSNN+BZDbpaB2XKgNL7BpT2/yVrAgLFIXg48ZqtrEZNK1pu3AJWzaWgW++8oxtASETP0m0GFJlK4p
	e7K8YEVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uk8-00000007imv-0DES
	for ath12k@archiver.kernel.org;
	Fri, 01 Nov 2024 16:43:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ue0-00000007hiJ-1oaa
	for ath12k@lists.infradead.org;
	Fri, 01 Nov 2024 16:37:05 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1BApjH023460;
	Fri, 1 Nov 2024 16:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7PYyh5Kj1ekYoVdSe6OMklmHajbeEZr4ogbiz+zR67g=; b=O99Q9ek2qCEeJiHv
	PjfFIi8pRWYNLmn5fi29EmMbJ5I7zgoaIj8tP8XGFSUYJ27IoI7Jzi3xJxvLQRhC
	f0M7vfEFbyXVEbeD2gNNOQ/3JxIgJiyDKROHmB2/YqJcHfKmlDlHv68cuLpu5dpO
	WvE9mSvyHdw1r0fHSbri7aOOwP4VgaqaYGAxleewZ/PGdb42gXP1hJdP60VwYYYL
	3Vzv80ienKkgZzwbtdUDzPy7BMdEqpD7RixGUZwX4CM/5Bk7Tc5VgMCk9xmpCbH0
	oUme1H4kLTjWmMAXSaMouzjoqWb1DuHBfd9+HZps46txtsxFuAX+qQtmfIPArIsm
	DgPXXA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42m1xcdx33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 16:37:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A1Gb1n9017928
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Nov 2024 16:37:01 GMT
Received: from [10.48.242.225] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 1 Nov 2024
 09:37:01 -0700
Message-ID: <2464068b-6fdf-4106-bb68-0d134ed066e7@quicinc.com>
Date: Fri, 1 Nov 2024 09:37:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] wifi: ath12k: introduce ath12k_hw_warn()
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241101151705.165987-1-kvalo@kernel.org>
 <20241101151705.165987-5-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241101151705.165987-5-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Nu4ehNkip8J_iKfgDzgjx7lHj_R5qPt-
X-Proofpoint-ORIG-GUID: Nu4ehNkip8J_iKfgDzgjx7lHj_R5qPt-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 suspectscore=0 phishscore=0 mlxlogscore=462 clxscore=1015
 priorityscore=1501 adultscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411010121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_093704_516609_B386DF25 
X-CRM114-Status: GOOD (  10.34  )
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

On 11/1/2024 8:17 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> In the following patch we need to use ath12k_warn() but don't easily have
> access to struct ath12k_base (ab) but do have access to struct ath12k_hw (ah).
> So add a new warning helper ath12_hw_warn() which takes the latter but the log
> output is still identical but uses the struct device pointer stored to struct
> ath12k_hw.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


