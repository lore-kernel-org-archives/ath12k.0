Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308BCE77173
	for <ath12k@archiver.kernel.org>; Sun,  8 Dec 2024 13:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kSY3DabKpvKQm1e3Iv1xKNvSWSQ2t4BSi/1v6tcaeG4=; b=hNf1wrBJIoDPd13ll4VhEHU0sC
	Hg0a2MTMAMDb2BgrgmXsE7dFIGJGBMnYbh+34jdvm25tE2OTQPNIxQhMDBOlo2G9idCa5KSUERXWS
	QZ0rAwnzZZEzQYP8nUsEpK0u4kwGCBYbRYJAfmgPFrCn3qKgV0we59r9pZzFRTqW+xyKm3CdaPYX7
	tvGdSUWYCRRMg63oDvFcrqoEhkzTyWpixBihIgPdZHOr59AO7/ODZhm1k+kTsS+wLYTZe23WmR+ZJ
	d0DDlyZRGYWAsamhNCqAR1tn6jUnUo0sFUZumtLEubSGP/3sayGRfo8jr2NTXrVryfWWh+WsYX32a
	xQ/CgUxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKHfp-00000005LKL-3E94
	for ath12k@archiver.kernel.org;
	Sun, 08 Dec 2024 13:50:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKHfn-00000005LJl-2ToM
	for ath12k@lists.infradead.org;
	Sun, 08 Dec 2024 13:50:13 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B8BcCQj025532;
	Sun, 8 Dec 2024 13:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kSY3DabKpvKQm1e3Iv1xKNvSWSQ2t4BSi/1v6tcaeG4=; b=QJMLWZNUDdKw6K2a
	6zhlWdHX7MeZ4nHCluBQWzMG/AQUr/gJaeeiGjibg52gq1qZHscaRlJ8YmxC2wNt
	rINLgY02GEqFSUoryHfYuRPnIxsTIYOK0vQcnUNB3m3fkGxPO6Y3bwT+SgBlrhMp
	mD+UGDj8Oh3GVJfmhu2XHvIIgEDrNeo5yT+hCwNw6lB4vehRJKb6wXbXei1K87sf
	Ztoh+MbYNO7Hrn3iQaE2iUNZbCWbN17OmWnyM6ytK6S9fQZ18RU4clSxjgdu5SJH
	PcWYA+dfRymvvu/7fJLTNbInI5d2qsOyORjTRMjrvXBSJb0iktI3W9c7zDDuFD7h
	O1pfEw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cfhka59n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Dec 2024 13:50:00 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B8Dnx2F012911
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 8 Dec 2024 13:49:59 GMT
Received: from [10.216.28.219] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 8 Dec 2024
 05:49:55 -0800
Message-ID: <ef4d978d-f530-4988-8da9-9b32a5f16c21@quicinc.com>
Date: Sun, 8 Dec 2024 19:15:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/22] wifi: ath12k: add Ath12k AHB driver support for
 IPQ5332
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        Kalle Valo
	<kvalo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jeff Johnson
	<jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <ou5kgedz5aga4dtda6k23uhybcjy7mfwie74p6q3qyn5bdajz7@ftejp7lqrise>
 <0b2f8734-f502-42d7-bdc5-b0d382d2aa70@quicinc.com>
 <cda109c9-a1e2-42cb-b830-6764c6eef519@kernel.org>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <cda109c9-a1e2-42cb-b830-6764c6eef519@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 83HwiWuzEg6npDPjLJZef7u1Beekarbe
X-Proofpoint-GUID: 83HwiWuzEg6npDPjLJZef7u1Beekarbe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412080115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_055011_675260_71E155B3 
X-CRM114-Status: GOOD (  11.88  )
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

On 12/6/2024 6:25 PM, Krzysztof Kozlowski wrote:
> On 06/12/2024 12:07, Raj Kumar Bhagat wrote:
>> On 10/16/2024 12:27 PM, Krzysztof Kozlowski wrote:
>>> On Tue, Oct 15, 2024 at 11:56:15PM +0530, Raj Kumar Bhagat wrote:
>>>> Currently, Ath12k driver only supports WiFi devices that are based on
>>>> PCI bus. New Ath12k device IPQ5332 is based on AHB bus. Hence, add
>>>> Ath12k AHB support for IPQ5332.
>>>>
>>>> IPQ5332 is IEEE802.11be 2 GHz 2x2 Wifi device. To bring-up IPQ5332
>>>> device:
>>>> - Add hardware parameters for IPQ5332.
>>>> - CE and CMEM register address space in IPQ5332 is separate from WCSS
>>>>   register space. Hence, add logic to remap CE and CMEM register
>>>>   address.
>>>> - Add support for fixed QMI firmware memory for IPQ5332.
>>>> - Support userPD handling for WCSS secure PIL driver to enable ath12k
>>>>   AHB support.
>>>>
>>>> Depends-On: [PATCH V7 0/5] remove unnecessary q6 clocks
>>>> Depends-On: [PATCH V2 0/4] Add new driver for WCSS secure PIL loading
>>>> Link: https://lore.kernel.org/all/20240820055618.267554-1-quic_gokulsri@quicinc.com/
>>>> Link: https://lore.kernel.org/all/20240829134021.1452711-1-quic_gokulsri@quicinc.com/
>>>
>>> These are series targetting other subsystems. I do not understand why
>>> you created such dependency. It does not look needed and for sure is not
>>> good: nothing here can be tested, nothing can be applied.
>>
>> To validate this series, the dependencies mentioned above were necessary, which
>> is why they were included.
> 
> What does it mean "validate"? You are supposed to describe how upstream
> can consume this.
> 

"validate" here means building an image, bring-up DUT in AP, STA or Mesh mode,
associate Station and run bi-directional data traffic.

