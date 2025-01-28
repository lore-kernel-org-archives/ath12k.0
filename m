Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF6EC02191
	for <ath12k@archiver.kernel.org>; Tue, 28 Jan 2025 09:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xezB8n6Rfd+/Rmbbwa/0KA+P+sdz/ttAlpqai6xIpfM=; b=Ydp6OHb5fPs9jQlNrMYCDJ0h3q
	49JOM7KF3hSoDhxlBZ3tgUBD8VPk5bTC7Zp4MlFmV1UWsRbEkDnRggznxOvmvKyYnjFmX3kVZl+aR
	Vq0w5pfaNNqT6CjZvraXGU41vnfWdwZuv59FLVU5xXFpuyS+O1Ok4sRV21HvBEotOUCkjrS/byse6
	Vl7IOfxQEjIiDxkU6m27dvDysMsf8EzJnyBJijpdOtsOjMUKCTrL7QW4s+vFsF3QB/NczeMTPfsuD
	J8BurCGcR8sBCVsGahquCGgq7Anxi11lBfgK3NZ3oIryghsLky7ftEOChlEXou3w/ftrfr1WRYb08
	FU9ABOeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tchi4-00000004Uot-3zPV
	for ath12k@archiver.kernel.org;
	Tue, 28 Jan 2025 09:16:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tchi1-00000004UmQ-1PqI
	for ath12k@lists.infradead.org;
	Tue, 28 Jan 2025 09:16:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50RNmNrK006090;
	Tue, 28 Jan 2025 09:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xezB8n6Rfd+/Rmbbwa/0KA+P+sdz/ttAlpqai6xIpfM=; b=EGpKASGH6QYI1yQm
	ZbM2r5HKW3YfyTSHiDzCC83yiwfVFmlXf00W8ieh78k/v2g5zPNXzEdhpFQb7uwB
	/oZ4bq/xDONFWI4Bbd14ZcfIPVoTnB1itSDM3NE0el4KRrWlIQvtTBQy8cNdYvge
	ArggHuoqGEbsU0wb7gfctRkCwloKlfomkHf3qzKz4IQ9qFS7WHhNi9E1lH29VFpQ
	yBB5gxGxAFVBRVPgnzRUc3+TQr9IKkz6vz15bRxEyvt6UUyeYBQ3ekAd66rTBH3z
	CbjwIR+vmqEaPpJcCOBKJ3TGvMREAh2+W/FcYi/Mydj9VdVMYrWpLcrF1V2patw4
	qb/EuQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ed5g9v7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 09:16:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50S9GYlm021541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 09:16:34 GMT
Received: from [10.151.40.239] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 Jan
 2025 01:16:30 -0800
Message-ID: <af926bd7-730c-4465-a206-4168bb93d01a@quicinc.com>
Date: Tue, 28 Jan 2025 14:46:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/13] wifi: ath12k: add Ath12k AHB driver support for
 IPQ5332
To: Krzysztof Kozlowski <krzk@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20241210074159.2637933-1-quic_rajkbhag@quicinc.com>
 <fd338dd5-db11-4439-835d-b6641f3feb78@kernel.org>
 <001ae2e4-bba8-4b76-a4b6-eda8533c5fc5@kernel.org>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <001ae2e4-bba8-4b76-a4b6-eda8533c5fc5@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zay7V2AeBkp-PpnWsfpemkreFXgINVju
X-Proofpoint-ORIG-GUID: zay7V2AeBkp-PpnWsfpemkreFXgINVju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_03,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=976 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501280071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_011637_391631_AECDA62C 
X-CRM114-Status: GOOD (  17.44  )
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

On 12/10/2024 8:42 PM, Krzysztof Kozlowski wrote:
> On 10/12/2024 16:08, Krzysztof Kozlowski wrote:
>> On 10/12/2024 08:41, Raj Kumar Bhagat wrote:
>>> Currently, Ath12k driver only supports WiFi devices that are based on
>>> PCI bus. New Ath12k device IPQ5332 is based on AHB bus. Hence, add
>>> Ath12k AHB support for IPQ5332.
>>>
>>> IPQ5332 is IEEE802.11be 2 GHz 2x2 Wifi device. To bring-up IPQ5332
>>> device:
>>> - Add hardware parameters for IPQ5332.
>>> - CE register address space in IPQ5332 is separate from WCSS register
>>>   space. Hence, add logic to remap CE register address.
>>> - Add support for fixed QMI firmware memory for IPQ5332.
>>> - Support userPD handling for WCSS secure PIL driver to enable ath12k
>>>   AHB support.
>>>
>>> v4:
>>> - Missed to include some review list in v3. Hence sending v4 with
>>>   all review list as per - scripts/get_maintainers.pl
>>>
>> The amount of undocumented ABI you add here, points to the problem that
>> either your drivers don't work or your drivers would never work with
>> upstream. Why? Because either you would have wrong DTS or drivers not
>> matching DTS, thus not working.
>>
>> Please point us to your upstream DTS implementing (and working 100%)
>> this ABI, so we can review that you do not sneak more broken or
>> undocumented things. I will NAK also future submissions without above,
>> because I believe you usptream something which will not work.
> 
> 
> I dug a bit and I found your earlier v2:
> https://lore.kernel.org/all/20241015182637.955753-3-quic_rajkbhag@quicinc.com/
> 
> which confirms:
> 1. DTS not following coding style, so not possible to accept
> 2. Driver relying on that exact DTS, so not really working.
> 
> Please post in separate series updated DTS, after fixing all the issues
> pointed out by DTS coding style.
> 

To fix all the issues in DTS (including undocumented ABIs) we did changes in
dt-binding as well.

The dt-binding and working DTS are now posted as separate series -
https://lore.kernel.org/lkml/20250128091012.2574478-1-quic_rajkbhag@quicinc.com/

