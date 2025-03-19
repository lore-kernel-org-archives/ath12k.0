Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FFDC35FFF
	for <ath12k@archiver.kernel.org>; Wed, 19 Mar 2025 11:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqT8pRpxQ7BIjrQnHq7b0zNLT3HX21aTlRPxvTISfdo=; b=DJLT1W5qyYxZjxg8U2ELXYIIBG
	hLWRK2SPo0biryMIC/Q3vGnCzzR52o9sw0qX5BpDZEjw11Ol0nnO1keWuj5KNOP1VePLNDaOedUpE
	kD2jIqe3CwamEfzaS91xiTVdVHMNJZP0aMOgtjIquvx26pDXbJ2FQlWotAIA71DM5fm4Bg/Nc388h
	DYR544ljuEi8zMzdPbnuNPq3ZgWCPLTh5HzXf6DaGbymGXS51/cti6fc1R0GyEyYaPgFJKQWqsCOo
	6JQiMHjHcTHiPWJ4Vi3CMCR+0gMgZS3sa6oQZmPbQxGsH4Kpd3tOOtVntBc8ED/64djBMAkAbXtlV
	iT7d9yNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1turI9-00000008l1m-2yMd
	for ath12k@archiver.kernel.org;
	Wed, 19 Mar 2025 11:08:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1turGv-00000008kjI-3QnU
	for ath12k@lists.infradead.org;
	Wed, 19 Mar 2025 11:07:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4lmMa009848;
	Wed, 19 Mar 2025 11:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jqT8pRpxQ7BIjrQnHq7b0zNLT3HX21aTlRPxvTISfdo=; b=jiLy5P5WKilhHEdG
	jW8nUFQ770aWPF2LoakOJx8vnvwuh0imU+qGDOBCarui4Cm7F9hakTB+ropClpaK
	tVxYDnvjgQS7xMT2NedSQTHU+XeHA3g9gZr/e5iTXgIpUpePOfz5KNqveT/6oEik
	bKYqNSX6U7T5gfWt5Fxix1VBc+tIRGCbUBRPL+sIOuH6/rwtQeo3J+ij63KNN044
	2718Ruo6eoGcL3lTIL6Vl2btywvB5KDCGXlUUdgk8xsAyhao7C5Ur1bADUW31deW
	Fl8URaXrKaNWmBhRM7VdZ8w0JdAyn6VP7mgWBIQeYKMBJGCsJkJ1FVM7uuj9TLF4
	mfJEXg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fdvxj78w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 11:07:39 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52JB7c73027330
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 11:07:38 GMT
Received: from [10.152.206.29] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Mar
 2025 04:07:36 -0700
Message-ID: <59fdc784-1efc-4474-8b47-88866419cabf@quicinc.com>
Date: Wed, 19 Mar 2025 16:37:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix incorrect rates sent to
 firmware
To: Ping-Ke Shih <pkshih@realtek.com>,
        "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "Pradeep Kumar Chitrapu" <quic_pradeepc@quicinc.com>
References: <20250318085013.1296262-1-quic_rdevanat@quicinc.com>
 <02b93d7699504cac89f46b1aa43c3c1c@realtek.com>
Content-Language: en-US
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
In-Reply-To: <02b93d7699504cac89f46b1aa43c3c1c@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=SKhCVPvH c=1 sm=1 tr=0 ts=67daa57b cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=xVl7SRJMKo_yyIKq5cgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: fhJ582xcrMCpwHgnFZkwLi2f1SM3d3hS
X-Proofpoint-GUID: fhJ582xcrMCpwHgnFZkwLi2f1SM3d3hS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1011 bulkscore=0 mlxscore=0 suspectscore=0 phishscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503190077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_040741_982626_626ECB23 
X-CRM114-Status: GOOD (  11.00  )
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



On 3/19/2025 7:43 AM, Ping-Ke Shih wrote:
> 
>> @@ -3450,7 +3450,9 @@ static void ath12k_recalculate_mgmt_rate(struct ath12k *ar,
>>         }
>>
>>         sband = hw->wiphy->bands[def->chan->band];
>> -       basic_rate_idx = ffs(bss_conf->basic_rates) - 1;
>> +       basic_rate_idx = ffs(bss_conf->basic_rates);
>> +       if (basic_rate_idx)
>> +               basic_rate_idx -= 1;
> 
> Using __ffs() might be more readable, like
> 
>     u8 basic_rate_idx = 0;
> 
>     ...
> 
>     if (bss_conf->basic_rates)
>          basic_rate_idx = __ffs(bss_conf->basic_rates);
> 
> 
> 
Thanks for the suggestion. I'll change this in my next version.



