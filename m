Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F94C02193
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 08:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KFPGyBP8cFud5VuycCONVstDIPld15I4GQjTCSxAiM=; b=dxTfINIj1Gfk3Dbrspw0YzDu9D
	MBi5JTyrL3FbycqbQCplFfAbKf0OrG+zyp6Ewql3EI3P0nwymfpWTWXawsdhHlrl8YLXMfr66iuP0
	xHtd0VAAC1p7OMWZgrHefs38+Ayox4VG5FKkA/qz1lDG42u+1ik1KyDKi++A1agr+5Pa2+K0sc2v/
	TX/u5TSHGGd4CN+Viagi3BswoaB+U/yhQEyVr0oUD7tAepxtutyBoJ21VPlYLCLGWRyweSZr54uvy
	3tBTghO2Qx94bAKORNGU+W8otf59Jj10XZOGQq0QDJ3BPcXm76E843iXcVhhhuji1kHgVH9aqVMOf
	m3TlBhzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tes35-0000000EsyV-2P9g
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 08:43:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tes33-0000000Esxx-2ENC
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 08:43:18 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5135kj5x006360;
	Mon, 3 Feb 2025 08:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0KFPGyBP8cFud5VuycCONVstDIPld15I4GQjTCSxAiM=; b=moU2QYT4a/pEO839
	qWSTwy7IR3/Ztry758QifN065S8qqKp5pSdoFbxOWqNUEgYGzxaApeFO21taw+qO
	xg2XCL12xdamXvsJ+gf6em/JMGmsZjI4ioy0LnxpkJROCAyrpg+jLF4pI9Hb/elr
	scRfvd8uiRMDBGCU8eHcoV9r1zwkN8jc1faim6AR4k441wMcgyprprer+wVytWDM
	4/JGewvP4LRwirm2jbo0JuHzJGqUtNaniqToCbphZHCDdQVOzJHx81a7+MMv585n
	rK/zr3R6zMTToin39wNSS2DZmU4U7j13aRAK6fT2Ik9n3ULk8TJF9w16fwEGzVl6
	9HCbbg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jqxw0c8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:43:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5138hCWu017000
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Feb 2025 08:43:12 GMT
Received: from [10.216.42.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Feb 2025
 00:43:09 -0800
Message-ID: <a3c7b0e6-a440-4452-83a2-eb95de0de9bc@quicinc.com>
Date: Mon, 3 Feb 2025 14:13:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/13] dt-bindings: net: wireless: describe the ath12k
 AHB module
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        Kalle Valo
	<kvalo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jeff Johnson
	<jjohnson@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250130043508.1885026-1-quic_rajkbhag@quicinc.com>
 <20250130043508.1885026-2-quic_rajkbhag@quicinc.com>
 <20250130-cunning-quail-of-opportunity-76d0ad@krzk-bin>
 <104e6b6f-3c1e-4a00-8822-aa6fb4562411@kernel.org>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <104e6b6f-3c1e-4a00-8822-aa6fb4562411@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Lj1rFYiMu8IQ3m0ApuY4ljvBmZW9USKk
X-Proofpoint-GUID: Lj1rFYiMu8IQ3m0ApuY4ljvBmZW9USKk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_004317_687097_231878F4 
X-CRM114-Status: GOOD (  13.66  )
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

On 1/30/2025 2:10 PM, Krzysztof Kozlowski wrote:
> On 30/01/2025 09:28, Krzysztof Kozlowski wrote:
>> On Thu, Jan 30, 2025 at 10:04:56AM +0530, Raj Kumar Bhagat wrote:
>>> Add device-tree bindings for the ATH12K module found in the IPQ5332
>>> device.
>>>
>>> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
>>> ---
>>>  .../net/wireless/qcom,ath12k-ahb.yaml         | 319 ++++++++++++++++++
>>>  1 file changed, 319 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
>>> new file mode 100644
>>> index 000000000000..bd953a028dc3
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
>>
>> Filename should match compatible. This binding does not look like
>> supporting more devices, so there is no much benefit calling it by generic name.
> 
> 
> I saw now your other patchset, so you have here two devices, but I still
> do not understand why this cannot follow standard naming practice like
> most bindings supporting one or more devices. Like every review we give.
> 

Sure, we can rename the filename to match the compatibles - "qcom,ipq5x-wifi.yaml".

