Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C78C369AB
	for <ath12k@archiver.kernel.org>; Fri, 11 Apr 2025 07:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQMWegePLQiS8NqXwuv0T8SS9vuQL5A7QhIATb43Z3A=; b=XU7K9xnmlVe5V+P5PMpUZi+i4P
	QLhiF1lRLp5Qk4UfbgSWpsCnFT83YZ/h/QJ2EEDAAOfYJrShLatHjdiVepbH+EfjEXDDQFHRWfYFg
	XOtTBQOikNYNEy/pdJtTtGuFNdVnzY3UvzLDmoHaHFLKGcKElzu2LvFxCOa1odH+CQyGeBZFIuTZJ
	FX2+/7b4jxvS7BJ3dR0dfN3fs1pFmUpSBWB09WJwqmCAwBSmK4C8gghhgThCQV18/vEuAD2Sjdu3q
	L7lWYoTL8sg25aUmfgh/UrBsKjHmsY1HelkU3CcDy2dzgjlIzzki2O0isQc6motaVJRzM50uJirvL
	Be+UC0VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38qF-0000000Crz3-2fvf
	for ath12k@archiver.kernel.org;
	Fri, 11 Apr 2025 07:30:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38Ko-0000000CnoY-23Ma
	for ath12k@lists.infradead.org;
	Fri, 11 Apr 2025 06:57:55 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53ALUDuY022952;
	Fri, 11 Apr 2025 06:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aQMWegePLQiS8NqXwuv0T8SS9vuQL5A7QhIATb43Z3A=; b=LFJfoWyKRUqsR3Ni
	b0Q9NAsRc6CHEehpkxLA3OK34t8EHg8QOVGhBy93kABaNjNg5ZGE5hPk0+v1+NRs
	jQTdyLWb/KNghRj/N1q2rDN25FvaUYMB3TJu+92QEy5cnPeHoRP61utVCZuEd1aW
	x2O4TKTg6zOG4RN+6auHLZooO+Mcqwlj4NwBuL3Cd7SKsbtvILY3M8OR7n5xSNGe
	KxqZgsViMSKkUtk3ZCecqVgmoVO8kw8dKllmNQ/Hd6lBJkKthIbgo49dyPzUUMMA
	IMHVXOc4y+xV5Q3b82wgHHpvPmSC+6Msj0xa0+4npnM/XIrAJtiR7X8eGoXp5bNo
	/TRuQg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb9kpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 06:57:53 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53B6vrmH032274
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 06:57:53 GMT
Received: from [10.50.62.95] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 10 Apr
 2025 23:57:51 -0700
Message-ID: <a47a67e4-5756-459d-b49c-6e517b37e492@quicinc.com>
Date: Fri, 11 Apr 2025 12:27:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 2/2] wifi: ath12k: correctly handle mcast
 packets for clients
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250411061523.859387-1-quic_sarishar@quicinc.com>
 <20250411061523.859387-3-quic_sarishar@quicinc.com>
 <24179c31-f351-2ed9-2699-d98615742d4b@oss.qualcomm.com>
Content-Language: en-US
From: Sarika Sharma <quic_sarishar@quicinc.com>
In-Reply-To: <24179c31-f351-2ed9-2699-d98615742d4b@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: M1N4wQBjRvhba2WnziIJxoqSV8ClcBrb
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f8bd71 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=wQAdryeFk3HcVtR1vyAA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: M1N4wQBjRvhba2WnziIJxoqSV8ClcBrb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=593 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_235754_538672_A6F57D58 
X-CRM114-Status: UNSURE (   8.08  )
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

On 4/11/2025 11:55 AM, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 4/11/2025 11:45 AM, Sarika Sharma wrote:
>> Currently, RX is_mcbc bit is set for packest send from client as
>> destination address (DA) is multicast/broadcast address, but packets
>> are actually unicast as receiver address (RA) is not multicast address.
>> Hence, packets are not handled properly due to this is_mcbc bit.
>>
>> Therefore, reset the is_mcbc bit if interface type is AP.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
> 
> Should there be a fixes tag?

This patch independently does not fix any known issue, this is required 
because of patch 1 in the series. Due to 1st patch some existing issue 
is exposed, to address that 2nd patch is required.

