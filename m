Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD9BE77173
	for <ath12k@archiver.kernel.org>; Fri,  6 Dec 2024 11:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lLeIj9ZC2mS5g76o4o6f2hDmvee13oLz6cpCNvUnj8=; b=NYliclesAIXmfvqQvQ+UyXk//a
	q4tj4zI6zm94emXUishkMM1+jS83ZhLHKUCSa3ZzOpzhVzTaGVWiXLNh0d2e3JSXyt5/9nQh+nmXr
	nWGJH8tZDo4q4OJnKTGQuauOWTs+KP8vElA63qQ59kp15yNj7s4GoQJowDAMy0MCxAnRXeA2S5g6i
	3hYIkWkhR+DEwk9+wfElgiLJWnxeygeQUhnxSfFrImQRCZeMUhkzYOnuVi7Jg+QTBmX+oQQbZ1iwZ
	vLsywlVkAOm8A3Immbw7PAcvIqPEBhr2VwJasC9PSxkMG5ITJbzUjHXGFQv0h0/tknqwP39v3K+3f
	GOxIczeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWBY-00000001Ouv-33zY
	for ath12k@archiver.kernel.org;
	Fri, 06 Dec 2024 11:07:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWBV-00000001Otj-48Ut
	for ath12k@lists.infradead.org;
	Fri, 06 Dec 2024 11:07:47 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B66kkrY016877;
	Fri, 6 Dec 2024 11:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1lLeIj9ZC2mS5g76o4o6f2hDmvee13oLz6cpCNvUnj8=; b=dy5rMnjIK+eVLGV0
	DRi3yvvhbGzm0GRgSVNXASuBB53vAacRbiImSrU42xFRiiUFtfYHMStJTfKZOtYi
	I3aT7wmNdWEbwwjQJtzlFWjSRKQBBBRSsk8HSO6NSHmugQdN64FRgGV9ZM6u+hto
	qpn3a67NQRov7lkdT+/bdsTOc0uoNwPYeQy9AMRlOrFyVcnbJ26cglVDDiLodQ5Y
	FoDoR5tItjU1LATal8Umo6pjqIWmmnNhP4rVTeibkSlsiqNeTY6F8D7AUqZK2wVr
	u9J226wOmU2KmpcUh4qlB9eXqCs4zoDEwSU8HIkFfeSVnnwJFkaegft8JrGLt2JC
	GfpkbA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbnmkbv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 11:07:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B6B7f2x031107
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 11:07:41 GMT
Received: from [10.151.41.184] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Dec 2024
 03:07:36 -0800
Message-ID: <0b2f8734-f502-42d7-bdc5-b0d382d2aa70@quicinc.com>
Date: Fri, 6 Dec 2024 16:37:33 +0530
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
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <ou5kgedz5aga4dtda6k23uhybcjy7mfwie74p6q3qyn5bdajz7@ftejp7lqrise>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eOj5rPgQ7y1SBrL_GUqGg7AwhE9HK2UZ
X-Proofpoint-GUID: eOj5rPgQ7y1SBrL_GUqGg7AwhE9HK2UZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_030746_148987_49CC30C7 
X-CRM114-Status: GOOD (  13.72  )
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

On 10/16/2024 12:27 PM, Krzysztof Kozlowski wrote:
> On Tue, Oct 15, 2024 at 11:56:15PM +0530, Raj Kumar Bhagat wrote:
>> Currently, Ath12k driver only supports WiFi devices that are based on
>> PCI bus. New Ath12k device IPQ5332 is based on AHB bus. Hence, add
>> Ath12k AHB support for IPQ5332.
>>
>> IPQ5332 is IEEE802.11be 2 GHz 2x2 Wifi device. To bring-up IPQ5332
>> device:
>> - Add hardware parameters for IPQ5332.
>> - CE and CMEM register address space in IPQ5332 is separate from WCSS
>>   register space. Hence, add logic to remap CE and CMEM register
>>   address.
>> - Add support for fixed QMI firmware memory for IPQ5332.
>> - Support userPD handling for WCSS secure PIL driver to enable ath12k
>>   AHB support.
>>
>> Depends-On: [PATCH V7 0/5] remove unnecessary q6 clocks
>> Depends-On: [PATCH V2 0/4] Add new driver for WCSS secure PIL loading
>> Link: https://lore.kernel.org/all/20240820055618.267554-1-quic_gokulsri@quicinc.com/
>> Link: https://lore.kernel.org/all/20240829134021.1452711-1-quic_gokulsri@quicinc.com/
> 
> These are series targetting other subsystems. I do not understand why
> you created such dependency. It does not look needed and for sure is not
> good: nothing here can be tested, nothing can be applied.

To validate this series, the dependencies mentioned above were necessary, which
is why they were included.

Currently, the "[PATCH V7 0/5] remove unnecessary q6 clocks" has been merged,
so this dependency will not be required in the next version.

The "[PATCH V2 0/4] Add new driver for WCSS secure PIL loading" series is still
under review and is required for validation.

However, this series can still be applied and compiled without these dependencies.
Please let us know if we should remove the dependency in the next version.

