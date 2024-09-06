Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BABCE7AAF
	for <ath12k@archiver.kernel.org>; Fri,  6 Sep 2024 03:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iwne81xt79bWpfeziUDLALeeBi/rhK2eaFI5cHM8CJg=; b=2bn904bD8DvK/10HaTMsxOoFF1
	WDMIcHlwgKnBwmZMRJvVHJFU/84Mhsb2zzcosU2dHo97tcPCqgxUzLis2IKm/RpZruxbJdO5sm8AS
	j2r8P3Idd9bCeXc+w65ao9bteW9G8TawLELLUlWoVZ5xP9qdyFXrXYPha7rvbEiWRuulgpS7PySO6
	3liuvTkdC6vYuUssv3Vf0abJHWnS+8fHBqh8RSOUanDZ9HPc1+eQRf+myI9C0VXTarJIH2ydPvpnR
	74c/1sZdgcK1k7mKMXfqrbgJtIiUsOkhEmffysXbNUTFghZtgViad7bTsVmibOptzC/yH90mszNBJ
	+qIC5gwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smPnH-0000000AXmx-137S
	for ath12k@archiver.kernel.org;
	Fri, 06 Sep 2024 03:37:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smPnE-0000000AXmT-11tE
	for ath12k@lists.infradead.org;
	Fri, 06 Sep 2024 03:37:53 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485IQ3hW021768;
	Fri, 6 Sep 2024 03:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iwne81xt79bWpfeziUDLALeeBi/rhK2eaFI5cHM8CJg=; b=e5vpdx7D9rEtoygH
	h2eDqjsnEQ/+JfUzsDZuTgvz/+YB8zIzTxR0Jhu0yuL07/3RVyDdTB1pTrFhhSQK
	tX3Ea58hV3ma/4Tqs1AajZkYZ/KQKB6i2b0vS8UntnR922Uw/r0ebexSOdeAnIPf
	g6QC/H2yZcCDRcVdPnJXOP7DApDIynb2EV+XmyTdWAZO7J2ewvxeWibuXA4fmfGv
	yJB+FktzBXeijD0Mp8h0Fr1HdM34Jd03wXB1NP5qhbGC94UAKVrrtFsO2raQQsD7
	E4y4nHGmujNsTbLHU9+eEotqWddPAJIWNVKDFIsxjambUNAzX1LE2IGwZVGFe5WX
	oLrcDA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwu0xwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 03:37:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4863bnix022497
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Sep 2024 03:37:49 GMT
Received: from [10.50.0.244] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 20:37:43 -0700
Message-ID: <5f849c51-4ef7-8bcb-dbfb-eb08602f0011@quicinc.com>
Date: Fri, 6 Sep 2024 09:07:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Weird layout of struct hal_rx_desc_qcn9274
To: Nicolas Escande <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
References: <D3XL7VMHE62Y.3JJPEKV07MJAS@gmail.com>
 <D3YDFV83HICP.3605AE2L7PIE9@gmail.com>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <D3YDFV83HICP.3605AE2L7PIE9@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jR0veE214l_OrBHXvBYDIS0vEXpqtus0
X-Proofpoint-ORIG-GUID: jR0veE214l_OrBHXvBYDIS0vEXpqtus0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_17,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=822 adultscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409060025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_203752_314167_F82EB9D0 
X-CRM114-Status: GOOD (  19.32  )
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



On 9/5/2024 6:36 PM, Nicolas Escande wrote:
> On 2024-09-05 4:53, Karthikeyan Periyasamy wrote:
> 
> [...]
> 
>>>
>>> So it seems without the quadword registration, even though qcn9274 & wcn7850
>>> appears to have similar layout, the __le64 msdu_end_tag is present in the struct
>>> hal_rx_desc_wcn7850 but not in struct hal_rx_desc_qcn9274. That seems weird.
>>> Would this mean that firmware always sends 8bytes of msdu_end_tag in wcn7850 but
>>> not on qcn9274 ?
>>>
>>
>> yes, qcn9274 not packed with __le64 tag.
>> wcn7850 expect the __le64 tag packed in the msdu_end and mpdu_start.
> 
> So in the full form, we just do not have the _le64 tag on qcn9274 but not in
> wcn7850, right ?
> 

Yes

>>
>>
>>> It seems unlikely as when using the compact layout on qcn9274 (the default now)
>>> we use QCN9274_MSDU_END_WMASK with QCN9274_MSDU_END_SELECT_MSDU_END_TAG (bit(0))
>>> which seems to indicate that this 8bytes tag is part of the optional data that
>>> we can select (or not) to be received from the firmware.
>>>
>>> Am I missing something ? Did that even worked before switching to compact layout
>>> for qcn9274 ?
>>
>> Yes, tag tlv is configurable in the compact word subscription mode.
>> Before compact mode, qcn9274 full mode is worked without any issue.
>>
> 
> So that means that setting all bits in the tlv subscription mode *is not* the
> same as not using the subscription and receiving the full desciptor. Setting all
> bits will get you the __le64 tag, but not using the registration at all will not
> get it right ?
> 

yes

>>>
>>> And if it's not working as intended, what's the layout style we actually want to
>>> use for struct hal_rx_desc_XXX, do we want the __le64 msdu_end_tag inside the
>>> struct hal_rx_desc_XXX or inside the struct rx_msdu_end_XXX ?
>>>
>>
>> Either way, __le64 msdu_end_tag is part of the msdu_end because
>> ath12k_hw_wcn7850_rx_desc_get_msdu_end_offset() tells the
>> offsetof(struct hal_rx_desc_wcn7850, msdu_end_tag) not the
>> offsetof(struct rx_msdu_end_wcn7850 msdu_end) in the
>> ath12k_dp_rxdma_ring_sel_config_wcn7850() configuration.
>>
> Yep I saw this part, for me it accentuates the fact that the msdu_end_tag is not
> something that can subscribed out of in wcn7850, as it is out of the struct,
> but can in qcn9274.

Not sure about the subscription in wcn7850
-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

