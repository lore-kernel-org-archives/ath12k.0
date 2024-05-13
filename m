Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AF5C25B78
	for <ath12k@archiver.kernel.org>; Mon, 13 May 2024 22:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CncJtGREnQ5RH02DMYVG0hBNh0DM1JsO3/kiLkVh2ug=; b=bxK7/pyCHJ9BWmQkW3lnbpFICw
	NPteO82wsQSoFpoej6xNO4Vuz00TOfQTimAYdmE6eMDz/Wdxb5nEun0Cpkx7HE9y7Gz2UhJCAtIIw
	imiGWNsWQefEGCMrsfZlAOXUUZXWRYzEamgLf+Qwyc6+TVDRN4NxZI/wiY2E3jZl2vR9c8vMj4LV+
	eOzSUB0GDATo5zNdJNvuUFj7+bC5TS3QMB3niorMIuVwnRYX22SyIUQKgpo4gMQwnjIa7Wcxk6i1G
	zvPaeY/0PdLvgKMFGHybKtd5PmnWVIy0IrdtYLarRq6SOMu+WzUfCJxb3+cdcpIgVjxBnzcqzy7S9
	CzW494aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6eYq-0000000EQvu-3hZl
	for ath12k@archiver.kernel.org;
	Mon, 13 May 2024 22:54:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6eYk-0000000EQv1-19jy
	for ath12k@lists.infradead.org;
	Mon, 13 May 2024 22:54:22 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DJ8VDL023872;
	Mon, 13 May 2024 22:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=CncJtGREnQ5RH02DMYVG0hBNh0DM1JsO3/kiLkVh2ug=; b=a9
	hkNjQvYC+bBr6Z03u5eVcZ9g9JwvesVDM9R0x+6kXJ4LnYHgkS6UsUa2V+4H6Q5b
	5ZZSIN3cxfQO50JKj8g28beqf1mqisEevv4f5yVGPZGRHa3i59Knm4ui52lqoxPs
	9AMTpYfDuNN39ewbS4+/Ep2yuUPB4eQ1aqYrNVpsowOauKIPGqRNSq1oAllYLC5M
	mjJX+lZR2B7vRM+ayk/55l8YXJEqYEUW2TZS630f1C+YtGSozfHEO3syKg4P4Zfv
	PzSSrAbJmmA0lQkAS7Dph71tR1YP3OinLLrvKa5XKny9koiJX8lsT0Dw+dd/SuIH
	Q5wphThe6upor4+7veJA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y2125cqe5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 22:54:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44DMsCqN012703
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 22:54:12 GMT
Received: from [10.110.0.4] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 May
 2024 15:54:12 -0700
Message-ID: <bdf21778-9e40-4586-b214-01169c6def62@quicinc.com>
Date: Mon, 13 May 2024 15:54:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] wifi: ath12k: MBSSID and EMA AP support
Content-Language: en-US
To: Aloka Dixit <quic_alokad@quicinc.com>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20240508202912.11902-1-quic_alokad@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240508202912.11902-1-quic_alokad@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 33pqYUE7iblcJHUndy-UZ1BbIeM5buYC
X-Proofpoint-ORIG-GUID: 33pqYUE7iblcJHUndy-UZ1BbIeM5buYC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_17,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405130156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_155418_471099_847F8911 
X-CRM114-Status: GOOD (  10.98  )
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

On 5/8/2024 1:29 PM, Aloka Dixit wrote:
> Add support for multiple BSSID (MBSSID) and enhanced multi-BSSID
> advertisements (EMA) features in AP mode. Set extended capabilities,
> WMI resource configurations to advertise the driver support to
> userspace and to firmware. Configure each MBSSID profile by sending
> BSSID index, total BSS count to firmware. Retrieve and propagate
> MBSSID/EMA beacon templates to firmware. Set the arvif security
> parameters for non-transmitting profiles.
> 
> v2: Rebased v1 patches, no functional change.
> 
> Aloka Dixit (9):
>   wifi: ath12k: advertise driver capabilities for MBSSID and EMA
>   wifi: ath12k: configure MBSSID params in vdev create/start
>   wifi: ath12k: rename MBSSID fields in wmi_vdev_up_cmd
>   wifi: ath12k: create a structure for WMI vdev up parameters
>   wifi: ath12k: configure MBSSID parameters in AP mode
>   wifi: ath12k: refactor arvif security parameter configuration
>   wifi: ath12k: add MBSSID beacon support
>   wifi: ath12k: add EMA beacon support
>   wifi: ath12k: skip sending vdev down for channel switch
> 
>  drivers/net/wireless/ath/ath12k/hw.h  |   1 +
>  drivers/net/wireless/ath/ath12k/mac.c | 324 +++++++++++++++++++++-----
>  drivers/net/wireless/ath/ath12k/wmi.c |  40 +++-
>  drivers/net/wireless/ath/ath12k/wmi.h |  46 +++-
>  4 files changed, 345 insertions(+), 66 deletions(-)
> 
> 
> base-commit: 1025c616ee13372f3803b158abb1d87ef368ae3d
entire series still LGTM :)

