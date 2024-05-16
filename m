Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC8AC25B74
	for <ath12k@archiver.kernel.org>; Thu, 16 May 2024 16:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HAN1AL839BHTJVG7+AVaXzPFUi9mygxX7kbh3GSihLY=; b=1c1rGsqFQcf2X5nl3Y9x3zAcKH
	Pl9CMMror634tVDO0E2GOKys5zyLvNpeKT3CuFMpeSR5atZiZHY5pk1J/IBolXjf9pNtvuiiz0TTu
	FzCfEMDho2p6785fbMXZublJJmg7t8Euc9ykXXoFl5l1vhCymbUNirX2IlFHwWWcmlkNrLUk24ubl
	VStyraDB1AQ/MsGqASCRFcmes+1xd0WQC3CeDcHce2aPww6ext+zDL10aGcZYmzQ4QTSRM9bfLbxY
	OV5Vg+1NPF1mpYM2NRLZE1m45yjraCeGv51xJjVJ+QxBoKA9/9bIza+LetR8IZW6wt5cohnAoFADz
	i4kU5o5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7eQA-00000005ahO-1ten
	for ath12k@archiver.kernel.org;
	Thu, 16 May 2024 16:57:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7eQ7-00000005agM-39CP
	for ath12k@lists.infradead.org;
	Thu, 16 May 2024 16:57:33 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44G8aVBk007510;
	Thu, 16 May 2024 16:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=HAN1AL839BHTJVG7+AVaXzPFUi9mygxX7kbh3GSihLY=; b=p3
	46a+R0gXILb6Rhr7QedvfrWHgMPXGZ2rnHcsK0+8VGnVx5o3Oq8uoYz58E5g6xmS
	nqG3HR7vP2+zASiElRCC7rQypclxyZUkTqJDBSgJgIRfM8p0i7MpXAIHj0lDqug+
	sNi9+EWsKgbuJ8Ru+Xj/q9GzCpEMcP652kDz65At9asf9HwQJpUa9E6myeq1B3h5
	CXtEhlEC8WCPoLYVpnFNSbKELwvfhbXXa3NIsym7LpvBATlq53tKejsunrplnfeu
	gbimhBNo7Flg4q5JLh6qUJ6jEcoFznPMCtmkB6mngRS5SevFKPEdk/E9toy71SeH
	i/oEfa1pHGED/Cz3oztw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y47f466bx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 16:57:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GGvQnu032657
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 16:57:26 GMT
Received: from [10.110.4.82] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 16 May
 2024 09:57:25 -0700
Message-ID: <e122dacd-c8a3-4295-9df5-c1c5a03c051b@quicinc.com>
Date: Thu, 16 May 2024 09:57:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix the issue that calculation of ack
 signal strength
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20240511030917.65811-1-quic_lingbok@quicinc.com>
 <41dd47b4-a1cc-48f5-a91a-1d64150d8c98@quicinc.com>
 <87jzjthhph.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <87jzjthhph.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: o0kdifgD9IyVV3Qg90vVTXc4SxV4Yxp3
X-Proofpoint-ORIG-GUID: o0kdifgD9IyVV3Qg90vVTXc4SxV4Yxp3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_095731_966606_56138940 
X-CRM114-Status: UNSURE (   9.30  )
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

On 5/16/2024 8:58 AM, Kalle Valo wrote:
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
> 
>> On 5/10/2024 8:09 PM, Lingbo Kong wrote:
>>
>> Your subject doesn't quite make sense.
>>
>> Perhaps something like: fix ack signal strength calculation
>>
>>> Currently, the calculation of ack signal strength is incorrect.
>>>
>>> This is because before calculating the ack signal strength, ath12k need
>>> to determine whether the hardware and firmware support db2dbm, if the
>>
>> please split this run-on sentence, s/, if/. If/
>>
>>> hardware and firmware support db2dbm, do not need to add noise floor,
>>> otherwise, need to add noise floor.
>>>
>>> Besides, the value of ack_rssi passed by firmware to ath12k should be a
>>> signed number, so change its type to s8.
>>>
>>> This patch affects QCN9274 and WCN7850 because they have the same issue.
>>>
>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>>
>>> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
>>
>> Code LGTM & Kalle can fix my comments in pending so don't respin unless there
>> are additional comments.
> 
> Fixed Jeff's comments. I also removed both db2dbm variables, I felt that
> they were not necessary. Please check:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=c7b6d4df1ac8427ac758f35b7c1aa641fa8df75f
> 
LGTM, thanks!

