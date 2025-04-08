Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E432BC369A4
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 10:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9q/mQRpAXTG6b+vSXiWGlXFvCcYRkc3YzeAyGrH6mlM=; b=VH9rDJ+kXY4CAOvDeTtZgNO281
	irHzyNvYjUZ8WxJugTC9QUEbmEHu2PwXRvMClMBaX9UU8SpAGYNfS73OUplbfgDnuEI+8IWIW+OXM
	pL6SuAWES52ZSD5Z+ShVTadBe4n5lY2geVojkAP4QAIYkV/+5oYtMV0imp0YcRnyjX8tPTxLnqcfY
	HIXvnscOaQnun3h9ZgZjwqZ5/FGB5dxiwd+ERJu3avwCHaTYqYjNUvpuV51DGo+DFw9r46owpi9yo
	Ixkkkqhpz1DXICf2/zuBq2aK1NEP42r2J5MqFYu1fGK5wh/2WTb3NsoBbjwUUlnZJ9xZW9NScUnId
	90eVmsjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26Tz-00000003jAh-27xM
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 10:47:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25fn-00000003XG8-2NKZ
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 09:55:16 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GOpc010522;
	Tue, 8 Apr 2025 09:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9q/mQRpAXTG6b+vSXiWGlXFvCcYRkc3YzeAyGrH6mlM=; b=nnHgqKForz5O8nMd
	rd45LlBRHqJFEriGiTfZmXZt/vFZvJwPvKBvQWIIpTsz9/Bfdp+Ezr8qTpQTUz3E
	tHBAfbTHNTigFgVXuk18X3NfigNHwqJ1L92FjnxjSLJlc16CJ54yWzHsBi5o3PvJ
	MKld2zKp1QM47H5IZ01CnkEvkxFYyTyVMzc3lo9GsAyyBHHKjhhhmeiZu8PkykgK
	7uY5bSlNrTIde5miB+F5ElMXTRqOSIgrI1OD3RnWEgc035kXdSly8U3emBQTqnju
	O6VjoVESMNfOf3waK8pqC75Ixlj6uVGtsznUIewhxEKmhbTmvfjPoHj6gJzdaJXi
	watE/g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1f7yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 09:55:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5389tBiq020775
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 09:55:11 GMT
Received: from [10.216.15.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 02:55:07 -0700
Message-ID: <7261d150-4b03-c42a-7abd-44bb3b0cb61e@quicinc.com>
Date: Tue, 8 Apr 2025 15:25:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v4 6/9] wifi: ath12k: fix
 ath12k_core_pre_reconfigure_recovery() with grouping
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Johannes Berg
	<johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        "Karthikeyan
 Periyasamy" <quic_periyasa@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>, Harshitha Prem <quic_hprem@quicinc.com>
CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20250408-fix_reboot_issues_with_hw_grouping-v4-0-95e7bf048595@oss.qualcomm.com>
 <20250408-fix_reboot_issues_with_hw_grouping-v4-6-95e7bf048595@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20250408-fix_reboot_issues_with_hw_grouping-v4-6-95e7bf048595@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2aGXptnFEwcnLTALlaxzCUI3Cq7V4TXq
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f4f280 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=QF_tM0vuxDyYx1FaEDQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 2aGXptnFEwcnLTALlaxzCUI3Cq7V4TXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=866 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_025515_741025_44FD21AE 
X-CRM114-Status: GOOD (  10.20  )
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



On 4/8/2025 11:36 AM, Aditya Kumar Singh wrote:
> Currently, ath12k_core_pre_reconfigure_recovery() reconfigures all radios
> within the same group. During grouping and driver going for a recovery,
> this function is called as many times as there are devices in the group.
> Consequently, it performs the same reconfiguration multiple times, which
> is unnecessary.
> 
> To prevent this, add a check to continue if the action has already been
> taken.
> 
> To simplify the management of various flags, the reason for hardware queues
> being stopped is used as a check instead of introducing a new flag.
> 
> While at it, also add missing wiphy locks. Wiphy lock is required since
> ath12k_mac_drain_tx() which is called by
> ath12k_core_pre_reconfigure_recovery() needs this lock to be held by the
> caller.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

