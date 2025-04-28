Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF27C36005
	for <ath12k@archiver.kernel.org>; Mon, 28 Apr 2025 09:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d67onAX9c4awf1/a8IEW61luHpsAi1oNRIptFcc2HEI=; b=xrciTurhnG5Ty7ODENwXjs0P3j
	ZBZxf+AH5BM8gZHkEHtt0xhcdtdCA5FabjogQo9YDCNdEn/0Dc1nuENWycZB99rue3/SYqOSOpsyn
	u0G7fWtv2VI4x0vIG6ejN3kD7XoCD09chPI0rAp6zsINkVfVISvpfG+fR4xI44Zdh2uDPsFv4yTC8
	4TVsD3KH6ixJSYKh6e3cw60DFiefyJBSlemQtQrZ1e5cWC9QCQc26K30b6dlv7n2aInEO2l4Tez7G
	onFu0NmboETw/CWXq25S9fLpPz6udSeXXxyp7m1UtBJwupZ+5QzezzYoGUEIdbiSZlBOmtxeM2EFy
	sxjpah1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9L6V-00000005iO9-3zAH;
	Mon, 28 Apr 2025 09:48:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9L6T-00000005iMe-3AHj
	for ath12k@lists.infradead.org;
	Mon, 28 Apr 2025 09:48:47 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S9bfKP032165;
	Mon, 28 Apr 2025 09:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d67onAX9c4awf1/a8IEW61luHpsAi1oNRIptFcc2HEI=; b=lwvspUo6Ep1lU3ph
	aVTByYKL+pUAUS0k4nmpglK7xsV0SVAhroJbk0aJmnLPBX7nyJM3yrPoc8nmsGL6
	rtTF2MjJ47SQmOnvlcXUmnLf9k5SGX0xVDdozKy4tgZi4aDF1Zd+MLHXHa1xfypj
	Ni8aGUEm8YgqFJeRnu0I3kgoR1bADuC1jWmKHVyLXXQoNx4zgnqSn5bGJ4M2pXcd
	oQCI3UeOiomcandphtmq3xR70YYEFDEPJ0tzeXwrMkUeDLVTbwnygGv7mSSFSYtM
	vtuF7BuQojRYKBXJy3UncoosRGka5PJdvAWpbBgqK+qvJo5yW8wFSTD4xhh/iOYv
	EyZ6vA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pevfr2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:48:35 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S9mSjv000349
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:48:28 GMT
Received: from [10.231.217.95] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Apr
 2025 02:48:25 -0700
Message-ID: <bfd1be89-cb03-4426-ad7e-93b6774a68a7@quicinc.com>
Date: Mon, 28 Apr 2025 17:48:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND ath-next 1/2] dt-bindings: net: wireless: ath12k:
 describe firmware-name property
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <jjohnson@kernel.org>, <johannes@sipsolutions.net>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250424005703.2479907-1-quic_miaoqing@quicinc.com>
 <20250424005703.2479907-2-quic_miaoqing@quicinc.com>
 <20250428-ruddy-bold-macaw-9ffd28@kuoka>
Content-Language: en-US
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
In-Reply-To: <20250428-ruddy-bold-macaw-9ffd28@kuoka>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iizN8q7klUWm_jnELEQp3vutnC4_buQ1
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=680f4ef4 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=P-IC7800AAAA:8
 a=RzOMtiUZCBSADgEBmXIA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: iizN8q7klUWm_jnELEQp3vutnC4_buQ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA4MSBTYWx0ZWRfXxYZCwZgmcNWW w9qhOnnYK5jj3YwHiTYUPRTnfc6jIDxG4b/kKVBHh5TpVicj3tF0L91v+frhxDVdTT/uHf71O30 5/nlIybwesgA7fRXySFEcnK2B4YlG8WV9Un3Y222yLuGNxQGXZud2yLByjv/7T/KQuFVf/DF8RJ
 PuTRwqkLxkRpuoGK2ce7Sm9GmNFKF17GYj2PLA7fucLJD4QY6tcsdb3ZZ+SNji5MVMnDUdASxs1 pA/7Z5Qoj6c/U1glal73cceGh7sy2CMLUivA/waTIjamG0Atm+rpQLTUo23aLYx4MF/2eectEyf Wase5GBiuyk8gLpul12A77ORqXealFQ0XeMRkQVcS5SAPzzwftuCOPlNecdLFdUYl9pqSSp1l9n
 kS2GfCV89KkoQEG3XvgCnZJbDMV2EyIVVdrReG/+IV18Gb+v7gGs86dUW75lveKqu4jswFZ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_024845_807794_DA8E69E1 
X-CRM114-Status: GOOD (  23.07  )
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



On 4/28/2025 4:25 PM, Krzysztof Kozlowski wrote:
> On Thu, Apr 24, 2025 at 08:57:02AM GMT, Miaoqing Pan wrote:
>> Introduce 'firmware-name' property to allow end-users and/or integrators
>> to decide which usecase-specific firmware to run on the WCN7850 platform.
>> This is necessary due to resource limitations such as memory capacity and
>> CPU capability, or performance and power optimization for different
>> application scenarios.
>>
>> Two firmwares are supported: 'WCN7850/hw2.0' and 'WCN7850/hw2.0/ncm825'.
>> The former is the default firmware, suitable for most WiFi 7 STA
>> functions. The latter adds support for commercial-quality SAP and
>> optimizes power consumption for IoT applications.
>>
>> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
>> ---
>>   .../devicetree/bindings/net/wireless/qcom,ath12k.yaml       | 6 ++++++
>>   1 file changed, 6 insertions(+)
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 

I don't find any tags on previous version: 
https://patchwork.kernel.org/project/linux-wireless/patch/20250423054152.2471568-2-quic_miaoqing@quicinc.com/.

Do you mean I should add 'Reviewed-by: Krzysztof Kozlowski 
<krzk@kernel.org>' ?


> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
> 
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
> 
> Best regards,
> Krzysztof
> 




