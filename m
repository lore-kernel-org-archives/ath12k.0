Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CF5C54E58
	for <ath12k@archiver.kernel.org>; Mon, 18 Mar 2024 19:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hikxRftzh6GNm+bqTIeTyiWHxa0KRhs5wIeNI//gcgE=; b=RY3BBWR7QFN31OPCAEVbQPgkSx
	JmAR1EMBDuch7de9aLmbGemKllBXxyD5a8WQkwK4Sodx7Ks78drFVJbT9tP6ebUhZiTJxxv3n/Jhy
	n1rQIDfk9V6JKLdbM3jmajIIL+W+0DAwQ5I/3MKa7DeFFlALVYMu0d7axOSScEB5R/di7xurICjEK
	GQ5A5KPnTL9GS/SBInCnj0dffSK/MPwNtkD0AynA5nkQ95Yi8YTztfdeowKe0qluZxQXyxzjbSbG8
	DU7oXaGRtLECtMylhF9B8Sle2+84pawuOpaAH41JutQDUIXD6ehx6WbdCxYo+JUXwzhzIr7BvXoAv
	8p5Sw8Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmIb9-00000009qLC-3neP
	for ath12k@archiver.kernel.org;
	Mon, 18 Mar 2024 19:24:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmIb6-00000009qKJ-0vGp
	for ath12k@lists.infradead.org;
	Mon, 18 Mar 2024 19:24:38 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42IHf0Gx012537;
	Mon, 18 Mar 2024 19:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=hikxRftzh6GNm+bqTIeTyiWHxa0KRhs5wIeNI//gcgE=; b=e4
	himAw+9h0hm+H8HaVt8rfxWt1ro0/WDW7vvg1UKwNWhIjj4lIQmTEUI8uxw4+W6l
	f0+cEBi40wO6ED66Qg5RqvwVrHGq9XzSOEu5q2Gv1RcwDFbCmCms9uhtGn8Q4uXM
	lkxKQwiw/td69+wDflOSEnAqcGUuFFqXUojzCL3AYMQRcjEvjsaXrBO8ymyFoFDA
	8l/OTMXpapcTkmZ3rzGlQhHRjrtPB+GdRIE9TOenLzqHcfKlX59R3m5Chqnmzcer
	iO7FEUVKfupO9tn+qIK6FNZxfQLkGWk/UjE0hkeGwVNtD04STppC/J9Jx1WM7PWD
	pnb9UKsd9Z5lgya70idQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wxt7d06qm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 19:24:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42IJOV8j007935
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 19:24:31 GMT
Received: from [10.111.166.62] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 18 Mar
 2024 12:24:30 -0700
Message-ID: <771eee21-038f-a237-9b03-df04f235a740@quicinc.com>
Date: Mon, 18 Mar 2024 12:24:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: use correct flag field for 320 MHz
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240314204651.11075-1-quic_alokad@quicinc.com>
 <87sf0nczca.fsf@kernel.org> <878r2fctng.fsf@kernel.org>
 <4940b6cf-a68d-4799-ccf3-f90dcc105e3e@quicinc.com>
 <87v85jbcji.fsf@kernel.org>
Content-Language: en-US
From: Aloka Dixit <quic_alokad@quicinc.com>
In-Reply-To: <87v85jbcji.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3JvOaMXViK3jq6SB2H9aXQdYQ29acW7m
X-Proofpoint-GUID: 3JvOaMXViK3jq6SB2H9aXQdYQ29acW7m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-18_12,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 spamscore=0 impostorscore=0 mlxlogscore=642 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403180146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_122436_424091_D88440E7 
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

On 3/18/2024 11:49 AM, Kalle Valo wrote:
> Aloka Dixit <quic_alokad@quicinc.com> writes:
> 
>> On 3/18/2024 10:54 AM, Kalle Valo wrote:
>>> Kalle Valo <kvalo@kernel.org> writes:
>>>
>>>> Aloka Dixit <quic_alokad@quicinc.com> writes:
>>>>
>>>>> WMI_PEER_EXT_320MHZ (0x2) is defined as an extended flag, replace
>>>>> peer_flags by peer_flags_ext while sending peer data.
>>>>>
>>>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>>>>
>>>>> Fixes: 6734cf9b4cc7 ("wifi: ath12k: peer assoc for 320 MHz")
>>>>> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
>>>>
>>>> What does this fix from user's point of view? Does it mean that 320 MHz
>>>> chanels were broken before and this commit fixes that? I can ammend the
>>>> commit message.
>>> And what about WCN7850? Does it work the same?
>>
>> 320 MHz association was broken. It was a re-basing error while sending
>> the original patch because the correct field was added during testing,
>> still used that way internally too. I have not tested WCN7850 on this
>> patch but yes will require the same field. Current code was setting
>> QOS bit instead of 320MHz.
> 
> Thanks, does this look ok:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=c4ade6bdf3d1a2d9d05606a85431f154559d5a80
> 

Perfect, thanks!

