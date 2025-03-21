Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AABC36002
	for <ath12k@archiver.kernel.org>; Fri, 21 Mar 2025 10:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wohi0atRJyGxd3ZMz+5DEGmp/UcLqgSt0+cwzpEAn7Q=; b=5BGm5SHz3kN7NVWYSxn7O/nH4e
	HW8wk7F6ZXulA1Iwb4seeSxGFJTngH3QmlYxqUkqAPlf1ZsaZSPIHft/TT4QsGN3uVSntC3FfpY/4
	jmGfEiQtIFeAZlgn1vX6OA3m3S/MvFXmqDzbVG/IGA/B+ABrvpwQsgxtu1VWpqpzYG5e7jivnUIJ+
	zu8aKy5OsByTTAhr7MceMV4WBuD97a4rvnG+xiYF+yRxj7FxOPIORZYlPNBT2KBfH1PhSAw212t60
	cL35h7Qo8d8vg1r1ou8kZNEnPsp15qLhxmQwqF4fVo9faig7lOWPZQxstjI6F5Ta2dNCjuiWhM/RT
	4hJHxLhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZlC-0000000EXv5-3J57
	for ath12k@archiver.kernel.org;
	Fri, 21 Mar 2025 10:37:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZIF-0000000ETnl-39Nd
	for ath12k@lists.infradead.org;
	Fri, 21 Mar 2025 10:08:00 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L8k5KD014152;
	Fri, 21 Mar 2025 10:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wohi0atRJyGxd3ZMz+5DEGmp/UcLqgSt0+cwzpEAn7Q=; b=LhlkLEaeYTL0lYbX
	OeJ0IIyA3TpDzoGu6JdBSEp0PgMN44rbc6EFIldxsYRSl4gwyopG7W9+N8uQCyGn
	htBBfvZZaDnQysgrvXSx36AeTfbdeUrMB/5pbp7ALpTdpyBF/BQNhLNYMOImYruU
	6gJnqDOgatxboTIRyROnDIoZLvDbKIa5mROtGfzuxNhitWd2bNRb2YqiDRvMNGvW
	7tTfFMrxM7REW3VzjT2dg+SYQyk3oWQBuCjFYmri6fDs/rP7Ryr1+lOGoNYUXieE
	cktD0/ROrJeqCdcfhudcH4TA1CoBber6d/3KuAYTupJXKJULnIrajREzN3W+MhFk
	HP35KA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h4p1097v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 10:07:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52LA7tV3022850
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 10:07:55 GMT
Received: from [10.152.207.135] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Mar
 2025 03:07:52 -0700
Message-ID: <10fd0006-8428-4bc6-9578-2a05dc1382e0@quicinc.com>
Date: Fri, 21 Mar 2025 15:37:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v11 00/13] wifi: ath12k: add Ath12k AHB driver
 support for IPQ5332
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <ath12k@lists.infradead.org>, Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250317204639.1864742-1-quic_rajkbhag@quicinc.com>
 <20250318-splendid-sceptical-gazelle-8abbef@krzk-bin>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <20250318-splendid-sceptical-gazelle-8abbef@krzk-bin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6M9rfQf7dbn492hdifADri3wc56cF0kc
X-Proofpoint-ORIG-GUID: 6M9rfQf7dbn492hdifADri3wc56cF0kc
X-Authority-Analysis: v=2.4 cv=NZjm13D4 c=1 sm=1 tr=0 ts=67dd3a7c cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=bsUYDfnVGbR25cQxC6AA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_04,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_030759_797023_716206E1 
X-CRM114-Status: GOOD (  19.69  )
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

On 3/18/2025 1:30 PM, Krzysztof Kozlowski wrote:
> On Tue, Mar 18, 2025 at 02:16:26AM +0530, Raj Kumar Bhagat wrote:
>> Currently, Ath12k driver only supports WiFi devices that are based on
>> PCI bus. New Ath12k device IPQ5332 is based on AHB bus. Hence, add
>> Ath12k AHB support for IPQ5332.
>>
>> IPQ5332 is IEEE802.11be 2 GHz 2x2 Wifi device. To bring-up IPQ5332
>> device:
>> - Add hardware parameters for IPQ5332.
>> - CE register address space in IPQ5332 is separate from WCSS register
>>   space. Hence, add logic to remap CE register address.
>> - Add support for fixed QMI firmware memory for IPQ5332.
>> - Support userPD handling for WCSS secure PIL driver to enable ath12k
>>   AHB support.
>>
>> NOTE:
>> The working upstream DTS changes for this series have been posted as a
>> separate series.
>> [PATCH v2] arm64: dts: qcom: add wifi node for IPQ5332 based RDP441
>>
>> v11:
>> - Updated Kconfig for ATH12k AHB.
>> - Replaced the API devm_ioremap_wc() with devm_memremap to fix ath12k-check
>>   warning: "warning: cast removes address space '__iomem' of expression"
>> - Rebased on latest ToT.
>> - Removed tag "Reviewed-by: Vasanthakumar Thiagarajan", in the updated
>>   patch [11/13] wifi: ath12k: Power up userPD
> 
> 
> This is v11 and still sent in a way it messes with toolset:
> 
>   b4 diff -C 20250317204639.1864742-2-quic_rajkbhag@quicinc.com
>   Grabbing thread from lore.kernel.org/all/20250317204639.1864742-2-quic_rajkbhag@quicinc.com/t.mbox.gz
>   Checking for older revisions
>     Added from v10: 14 patches
>   ---
>   Analyzing 135 messages in the thread
>   Preparing fake-am for v11: dt-bindings: net: wireless: describe the ath12k AHB module for IPQ5332
>   ERROR: Could not fake-am version v11
>   ---
>   Could not create fake-am range for upper series v11
> 
> Can you fix your process so the tools will be happy? Please read
> carefully your internal guideline go/upstream before posting next
> version.
> 

It may be because, I did not use b4 tool for this.
Will send the next version with b4 tool.

