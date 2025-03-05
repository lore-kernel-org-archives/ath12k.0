Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFBBC19F32
	for <ath12k@archiver.kernel.org>; Wed,  5 Mar 2025 03:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2FlNvvc+UPvgI8WplwO9q5+i/W3XJWbbt9A601jsx2Q=; b=GoO0JCszdsxvG73xott1X5bMBi
	LLwKDZCzf2FobObbrTtKEnP0rnQoS/VcBPMlifD1zNU9OEz6W+CBkOqeLeRY1PN3qt31NwvU4DJir
	J9wpYR7PoG9vzggjfbQ/3H29zXu3T1YimlhabphjtxDOgVyWMZW4GUM6t8mAxjD7y5tqfxNI7jvHv
	Sh06v6U68+3TzAtO6iYmMv9AhdKteuaMEV4Dir0ydGXbxuIJP0usWWjVA1dAhz8Do9J9OCNwkIK/x
	cRitPeOZf3r04dwWsYwvwBPAuUEtfvUBX/Rr2K/FStPcfCdHl2RoSSZww2nuR+W60Jz35UsD6LlkA
	2t5f0+jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpfX5-00000006tdj-3Dbt
	for ath12k@archiver.kernel.org;
	Wed, 05 Mar 2025 03:34:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpfX2-00000006tcU-2JE6
	for ath12k@lists.infradead.org;
	Wed, 05 Mar 2025 03:34:54 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524NADQJ031419;
	Wed, 5 Mar 2025 03:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2FlNvvc+UPvgI8WplwO9q5+i/W3XJWbbt9A601jsx2Q=; b=BAYtkOSAbJes50qG
	vC6FaPoBOSF5PjDIhGEJwWAUyp1ctPDuOIUnR2+lagmE1WBv6wGKT8FCy2pXSjld
	ZX+fY56YkRX4HhEeaksi4Jqeux0GGhlRmFhILq+DXOodh7iCDZgAJmYO/YF/85/H
	ETSzLZtbajnkSGaX+9Iw5aQefEbUQ7zXy06/N9zmm+T1H5bqG0iKAB9lawYUNvum
	3YxcHVnv2uwhnJqvtA3HM56SneHUSG5SzPkHx+4WAfLhLJxHW8e6EZkU2eykvjSh
	2GgUEuDjiRID19lV0hMjqIkhnG8SJYGnUPAZBrUDHTTu0Hke0vpPWpFjcB73fhGI
	R5L2kw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t4101-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 03:34:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5253YogI027029
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 03:34:50 GMT
Received: from [10.152.194.132] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Mar 2025
 19:34:48 -0800
Message-ID: <82594386-c0fb-4a32-b61d-a6df16654454@quicinc.com>
Date: Wed, 5 Mar 2025 09:04:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] wifi: ath12k: Pass correct channel frequency
 parameters
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250304095315.3050325-1-quic_surapk@quicinc.com>
 <d6b45785-22f9-490b-96dc-8b448b700bb9@oss.qualcomm.com>
Content-Language: en-US
From: Suraj P Kizhakkethil <quic_surapk@quicinc.com>
In-Reply-To: <d6b45785-22f9-490b-96dc-8b448b700bb9@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bTPLbWJoPY6iXlcI3hPrcrrtRlqU9y-P
X-Authority-Analysis: v=2.4 cv=KfMosRYD c=1 sm=1 tr=0 ts=67c7c65a cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=FxUxUG0ajero_kj7pugA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: bTPLbWJoPY6iXlcI3hPrcrrtRlqU9y-P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_02,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_193452_631912_71090E0B 
X-CRM114-Status: GOOD (  13.39  )
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


On 04-Mar-25 10:42 PM, Jeff Johnson wrote:
> On 3/4/2025 1:53 AM, Suraj P Kizhakkethil wrote:
>> For higher bandwidths, the channel frequency parameters passed to
>> the firmware are incorrect. Pass correct values of channel
>> frequency parameters.
>>
>> v2:
>>   - Replaced arg->band_center_freq1 to local variable center_freq1,
>>     which is initialized to arg->band_center_freq1
>>   - Rebased on ToT
>>
>> Sriram R (1):
>>    wifi: ath12k: Pass correct values of center freq1 and center freq2 for
>>      320 MHz
>>
>> Suraj P Kizhakkethil (1):
>>    wifi: ath12k: Pass correct values of center freq1 and center freq2 for
>>      160 MHz
>>
>>   drivers/net/wireless/ath/ath12k/wmi.c | 24 +++++++++++++++++++++---
>>   1 file changed, 21 insertions(+), 3 deletions(-)
>>
>>
>> base-commit: 3148fc3cf193dbbd2e14eee59468a510a38bf604
> Some reminders:
> 1) per new guidance you should have added the destination tree name (ath-next)
> as a patch tag, i.e.: [PATCH ath-next v2 0/2]
> 2) since these were trivial changes you should have propagated the
> Reviewed-by: tags that were given for the v1 patches.
>
> No need to resend for this, but please keep in mind for future reference.
>
> /jeff

Sure Jeff,

I'll ensure to follow these guidance in the future

Thanks


