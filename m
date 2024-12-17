Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E549BE7716A
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 09:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EvYQPV1eSxceR826cSyjxUeQJF4vWLTTIlXUd5s874I=; b=B7476jAkvFXKVD3bj2Gczv73uJ
	NgKwHUB6o6OSiujSedFbwgcVbk5QcVc2veM6diswDl8Ozx0F7YjzYQ8z+DfUtr8tkm6WsiCQobSIK
	GwP8fpa1iUpYxPb5v1mirFw6+HFDjW+/SjgFL6zkqEz1W68fiZhUtiufEDdQgcmFLzJEco2gZkABV
	sSyQRSRRZqcKLgHWIsfIyJmmVPOVCeHMEm0/3ombNDJ/ueWk5O81NuSWJy707vMtElkAFH4Hw+9Pm
	wdze/B/FeqVt50JfRDYWIqxY14ZF9x7GWAW2VpLtKXV0lNSmOjMnPuARQeIDZqRkIcgMM/sLQxNec
	HiHfPhpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUJF-0000000D0yo-2vRN
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 09:56:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTus-0000000Cvk2-3wHy
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 09:31:00 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGMAgmI017465;
	Tue, 17 Dec 2024 09:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EvYQPV1eSxceR826cSyjxUeQJF4vWLTTIlXUd5s874I=; b=fsHLMwemTaHo16cp
	nEhX/gtfnv76eE/6ubtwYZLkSG3Zx+5rvL3HFRuh7R+2yz1d+W//dkJ4PIPhCCz3
	KtrJBDUk2/66HHwkQwr+yneMU8c26UxrlREvellVd61MNzGJ6U5KOQ9y9fRCnB7Q
	xYbXAWxlCuenJpDWOe96dqj9gw5+Jf8WtN5cGNAIp3kfefnKxM22VgVEk5OrnjGV
	ZKvKi1jVdpkg74OjOfNZOL+pttoSj7ehfwp6AxoLaNHnwEWISKvtOBPWp6ZsMKZ0
	EfMz+3g9VcoIaJ7nI9Y3JdOVEC9xtRegP9bw/GuAdfW8te69IkcQ9jdiJOeQW6DD
	CEobyw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jvs81eeq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:30:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH9Uras020383
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:30:53 GMT
Received: from [10.50.29.244] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Dec
 2024 01:30:51 -0800
Message-ID: <fda72aba-f878-426f-b410-a4cecf77d1c3@quicinc.com>
Date: Tue, 17 Dec 2024 15:00:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Add support for parsing 64-bit TLVs
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20241204071238.948885-1-quic_ppranees@quicinc.com>
 <87o71bmwoe.fsf@kernel.org>
Content-Language: en-US
From: Praneesh P <quic_ppranees@quicinc.com>
In-Reply-To: <87o71bmwoe.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _DwlLXnj9AB-HCaONxo3F3FF6tqG52Bl
X-Proofpoint-ORIG-GUID: _DwlLXnj9AB-HCaONxo3F3FF6tqG52Bl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=922 adultscore=0 malwarescore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_013059_092468_776415C7 
X-CRM114-Status: GOOD (  12.08  )
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



On 12/16/2024 9:45 PM, Kalle Valo wrote:
> P Praneesh <quic_ppranees@quicinc.com> writes:
> 
>> There is mismatch between the format of monitor destination TLVs received
>> and the expected format by the current implementation. The received TLVs
>> are in 64-bit format, while the implementation is designed to handle
>> 32-bit TLVs. This leads to incorrect parsing. Fix it by adding support
>> for parsing 64-bit TLVs.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> 
> What about WCN7850? The commit message mentions nothing about it so I
> can only assume that this breaks WCN7850.
> 
> Please remember that ath12k is not only a QCN9274 project. If I got 0.01
> EUR every time I say that...
> 
This change is common for WCN7850 and QCN9274. Sure, I will add WCN7850 
tested on tag in v2.

