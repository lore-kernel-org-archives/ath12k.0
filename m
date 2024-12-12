Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1360E7717F
	for <ath12k@archiver.kernel.org>; Thu, 12 Dec 2024 09:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVyEqOENryfNsOyXSSwXK5bRPyH6O9hMNHtCfIiGicA=; b=us3cGHFDRPooixLR3CKsGGMlew
	M5XlT2Dcn8gdrx7mAwtC92vwOyfmmfHZ7UHJR9QHCtx7DS+EYjaYWa02lE/0OLjoi55u+/bMAiven
	qBNID+t+bg5Gxw0PSqHt0tCTls4/isajjCvTrgTakHM264Ar8/J7rKAC3+DLbTlRYa7hk2xR+3AD3
	9o6sZITmXaswt/mlzv1SxZGZaGQlJENM/CSudXJ7Tz3mgWc0y88CllZJ0T2Vy/YaUU14HGh98QXYE
	psQyiszV67Bk36vULY7CXRuzHm1vY+VKbrVOMejamN3tGSgBNKJ4is7pcKFUIoa/ld2prlM+voFve
	3ohcudQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfhz-0000000HXMn-206k
	for ath12k@archiver.kernel.org;
	Thu, 12 Dec 2024 09:42:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfXJ-0000000HVNE-1p0g
	for ath12k@lists.infradead.org;
	Thu, 12 Dec 2024 09:31:10 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC2rRTV000455;
	Thu, 12 Dec 2024 09:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VVyEqOENryfNsOyXSSwXK5bRPyH6O9hMNHtCfIiGicA=; b=mDAysNBzHzcAOphz
	kPYbVKB+jVa/w5cZ7z7SHNr10RqMcH4itlHBv//6cSLA8MPCp6p2wnYxtb9/TkkF
	4o/tVzFdXCdgPxHzKtD8m6h+kTjmE16hhyyQFWYD/n6HAKdAvWQjqGpBL50KKGZn
	Wds2cihkgEHX7HwCmI2Y5fj+t5c6jyj1+1c1UWDJ2AouFv+C7Ekr1ZFaPEQuokKI
	BpdEa7MRSzD+OAerPiNMs9G3iX2aRZO1F+55C3dTwGDKengUteIbsJGBrGVUlHyM
	1RRL/W+pXrveUe3smsEnq192pyPr0i8I4ICX1aNhrbja44E528n4eJ5AgSSvYzpH
	qV8hzQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes0vm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 09:31:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC9V47R020168
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 09:31:04 GMT
Received: from [10.50.0.236] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 01:31:03 -0800
Message-ID: <3696af43-bb2e-868a-e301-6e612134a142@quicinc.com>
Date: Thu, 12 Dec 2024 15:01:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/4] wifi: ath12k: Refactor the ath12k_hw get helper
 function argument
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20241212004906.3087425-1-quic_periyasa@quicinc.com>
 <20241212004906.3087425-3-quic_periyasa@quicinc.com>
 <874j39qr5h.fsf@kernel.org>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <874j39qr5h.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nmXdAXVY4EIfsSZeVQYWXlHAQjCr3IsU
X-Proofpoint-ORIG-GUID: nmXdAXVY4EIfsSZeVQYWXlHAQjCr3IsU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=670 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_013109_587425_02BD23BE 
X-CRM114-Status: UNSURE (   9.79  )
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



On 12/12/2024 1:17 PM, Kalle Valo wrote:
> Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:
> 
>> Currently, ath12k_hw is placed inside the ath12k_hw_group. However, the
>> ath12k_hw get helper function takes the device handle and the index as
>> parameters. Here, the index parameter is specific to the group handle.
>> Therefore, change this helper function argument from the device handle
>> to the group handle.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> 
> Why?
> 

It just remove the dependency of device handle (ab) for using the helper 
function ath12k_*_to_ah(). Now the caller can directly use 
ath12k_hw_group (ag) instead of forcing to use the device handle from ag.

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

