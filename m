Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BB1C3DA64
	for <ath12k@archiver.kernel.org>; Wed, 31 Jul 2024 13:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWJ19l1mlFKnkTHIRrqeIeKHgb6EHtD5b4grRM6IlYg=; b=qRoY7vYuTq48L5bbl19hGwo3zV
	ooPawbp/KrgFT+ldX+ry8rEMIeQtLGNL0/AZeXVuU7mNHWat9/kARX86s6wwVL+mcCC/VG9z2xJJE
	RsGI6i11CMjEvg76US6drK8dbV13UQaaeEvLVkWNY69tP/gwrk5nNCQwtPJSclWrWGN02l7GaDmqU
	qrkbbMOSjtAmdqGxRb8h+kk6nloh+zSxUs1LK9UMRUC7PocCp9RrXVgvC6OI/2wga+9eaoCkeN6F+
	3w61pSxqTqsFnDCTOGA7FZv6w92RmUxibd9+7wR7z33cmGDbE5TLokNzh9q6IGgz62/I8QIsnCdhz
	OvXkywmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ9nz-00000001Noy-47IW
	for ath12k@archiver.kernel.org;
	Wed, 31 Jul 2024 13:55:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ9nu-00000001NnU-2n8B
	for ath12k@lists.infradead.org;
	Wed, 31 Jul 2024 13:55:47 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46V76t7G029965;
	Wed, 31 Jul 2024 13:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YWJ19l1mlFKnkTHIRrqeIeKHgb6EHtD5b4grRM6IlYg=; b=HI+YjFAyDN5vEw70
	0VtVT2kL4P+QNBglpRZ2FOlt5zbmaYGkD7ZPFsx76hL6vnBVk9wnKFPOx2KchLyt
	h5hlk4q7+53xszgFGYLZ2BCpOakqTJ5Dq8E1+8VTyvdhgVKXDSOi/XBFoE3oir2j
	xdpgyJXhw+chj3yqbnQRGcWzxBsKEspAlVmDzCrmBrHaeSkCevGwWRzrtjBvmO1A
	MDAHxtSXotrYPzOZHNzsjo7CR2sph6u/ajC4j42Dx6CaJ4LGQn2TIrnxUmmHiI6f
	hYJIs+YNP2wwRYAvLz9XXK6gNW86UgIi2hb7CDjv+uEG6svp4ARORUtiK0gBxW0b
	dZ0W3g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40pq525hym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 13:55:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46VDthIH004146
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 13:55:43 GMT
Received: from [10.111.177.34] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 31 Jul
 2024 06:55:43 -0700
Message-ID: <3de102b4-81c9-48f8-bef5-b2d6df1ce225@quicinc.com>
Date: Wed, 31 Jul 2024 06:55:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] wifi: ath12k: fix struct hal_rx_ppdu_start
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: kangyang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20240725120035.493-1-quic_kangyang@quicinc.com>
 <20240725120035.493-5-quic_kangyang@quicinc.com>
 <aa2b6791-9d18-479b-a80d-722b99592cb8@quicinc.com>
 <87y15hkdyf.fsf@kernel.org> <87plqtkdr2.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <87plqtkdr2.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _o0w2VwO7exbMJv6-O9PATqg4-v7zMNi
X-Proofpoint-ORIG-GUID: _o0w2VwO7exbMJv6-O9PATqg4-v7zMNi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_08,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=374
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_065546_749830_5B80F2D5 
X-CRM114-Status: UNSURE (   8.42  )
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

On 7/31/2024 4:22 AM, Kalle Valo wrote:
> Kalle Valo <kvalo@kernel.org> writes:
> 
>> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>>
>>> On 7/25/2024 5:00 AM, kangyang wrote:
>>>> From: Kang Yang <quic_kangyang@quicinc.com>
>>>>
>>>> Current struct hal_rx_ppdu_start in hal_rx.h is not matched with
>>>> hardware descriptor definition.
>>>>
>>>> So update this structure and related code.
>>>>
>>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>>>
>>>> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
>>>
>>>
>>
>> Jeff, your reply was empty.
> 
> Actually I saw several empty replies in this patchset.
> 
Please add the following to every patch in the series if it isn't present:
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


