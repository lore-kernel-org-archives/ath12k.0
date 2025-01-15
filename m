Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CFDC02183
	for <ath12k@archiver.kernel.org>; Wed, 15 Jan 2025 04:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qYUPlkg1yhMFgrFw+6gYp94n/I7Glr5J2ikRbSFZDk=; b=WaLuA31hky94xL4zsVSjl4KyQP
	yK9XfpYNw6kSWWAug8ZObT08P+UJCrwdlyMF5Y6ghtklg7kNj2/riYUuy+V5CMYz9uqNo9o/7Oujy
	BnlaU0M6KQAnAB26YFEgbeRXY+uDe/pJud0uzpAf50oUCKy9EHutJ1KnnJRJWYxBGBjvIOjT2GuOb
	EDS8P5+VaNOahZirrHnqseB5Kk/aaFDlPnbWhlke0rBlUQAxopqpgOiJ0yn1pThdNAJHQPmvXw5n/
	uh5u+MEVd/xzehy4pnfHeITgLNpJI9C+9eBBF+A8XjLN0CmNIK3TwEHfyM8570OgLS0uaU/qEXDIq
	ydSEmK2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXvOd-0000000Adcp-1mDb
	for ath12k@archiver.kernel.org;
	Wed, 15 Jan 2025 04:52:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXvOa-0000000AdcB-3Jai
	for ath12k@lists.infradead.org;
	Wed, 15 Jan 2025 04:52:50 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ELMjF7004053;
	Wed, 15 Jan 2025 04:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8qYUPlkg1yhMFgrFw+6gYp94n/I7Glr5J2ikRbSFZDk=; b=Qm3Y1KqPQ+x28Sp7
	8S5H8+lPkb8fCnTkIPjZrE2XOcx0pYFUs7PXVWSa3qRxvjrRkqq61pw0JvvynOxf
	MFLHo2ZLoWeWBzZ6te5zHCD+mq+cNpXwydYiIcC+aiMSLuzK9BcLck5L0jAiB992
	MjDoq2rjYb94pwlTg5K5cdpfqvJeE4/aCfSE5968N2iLkTs2NhVnt27cjL4A512I
	AoejD0oXMkchOth0oNq3H/XdE6RqLLorWNIiM3m+FbBCQCU2usOZrrVJ0lWVRmY9
	sFCwtRDMcV8lSDTrGYg4TeuuK81jqXeO96WHvB8XPg5zSDy3Y4BwMM98slBdce9B
	/DsMbw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445ysr8tj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 04:52:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50F4qgj7005181
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 04:52:42 GMT
Received: from [10.152.202.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 Jan
 2025 20:52:40 -0800
Message-ID: <bf3b176e-b09e-43c8-8404-4f4477dd4370@quicinc.com>
Date: Wed, 15 Jan 2025 10:22:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: handle
 ath12k_mac_ieee80211_sta_bw_to_wmi() for link sta
To: Kalle Valo <kvalo@kernel.org>
CC: Jeff Johnson <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
        <ath12k@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250110-fix_link_sta_bandwidth_update-v1-0-61b6f3ef2ea3@quicinc.com>
 <20250110-fix_link_sta_bandwidth_update-v1-2-61b6f3ef2ea3@quicinc.com>
 <87v7uhnst7.fsf@kernel.org>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Content-Language: en-US
In-Reply-To: <87v7uhnst7.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SfeW9J_l-0Ogh57AyjQYis5WWEWrUHIT
X-Proofpoint-ORIG-GUID: SfeW9J_l-0Ogh57AyjQYis5WWEWrUHIT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_01,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015
 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501150032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_205248_956106_3BA8E0F8 
X-CRM114-Status: GOOD (  10.25  )
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

On 1/15/25 00:09, Kalle Valo wrote:
> Aditya Kumar Singh <quic_adisi@quicinc.com> writes:
> 
>> Currently ath12k_mac_ieee80211_sta_bw_to_wmi() handles the bandwidth from
>> sta's deflink member. This works only for non-ML station. Now that MLO
>> support is there, extend this function to use link sta instead of deflink.
>>
>> Additionally, in ath12k_mac_handle_link_sta_state(), the link sta structure
>> is not accessible, making it difficult to fetch the bandwidth there.
>> However, ath12k_mac_station_assoc() does reference the link sta structure.
>> Therefore, move the initial assignment of the arsta bandwidth member to
>> ath12k_mac_station_assoc().
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> 
> So how does this help in practice? Ie. what are the user visible
> symptoms this patch is fixing?
> 

For MLO station, any bandwidth change post initial association, the data 
will not go in the latest bandwidth of that link. Since to firmware, 
only deflink's bandwidth will always be configured.

For non-ML stations, no affect.

-- 
Aditya

