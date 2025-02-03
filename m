Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2117C02192
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 10:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6x8BAunRvsjNsAkzeigQzLsRnDaLSX8GrXI9PQGXuhg=; b=plH0k7mWvGlHH0jkAf4Z4zDpLK
	7W7DrXZhMmlxABe7UsRtsWY3swOubkRL+RSLR+8Un3yW0dhCCOIj/Ryz+q1RETlotopVNLstZwJBL
	sJEhdO4dHpLPtGerWnUlx9BoS5/xPOrBg0y0vdflHcq8hVyeJpfDa2Sdhu4pYwy+033hAUOaRvoy3
	ET52890mx7RDXfpzTl1adjRO6VoOjS+07uhM5YV6CwIQwpQNhM+Uil6XhPp5QeYZDap1vyxbeohai
	2S4EmKUQVKlQOkqKSVxj5nk/nrk0tQyPke7cSA6HApn7FgqBylNwWRPU3rEx6Rcfhu1Kb2QmZcy3L
	9e389AWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tettA-0000000F976-2Khk
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 10:41:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tetgS-0000000F7LQ-17Li
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 10:28:05 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 512MxSs3005964;
	Mon, 3 Feb 2025 10:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6x8BAunRvsjNsAkzeigQzLsRnDaLSX8GrXI9PQGXuhg=; b=Z0P5jlApR87jwpR/
	JvpCtZD7NT2qguc941qD803+UVnSrfXctufSmGm8x13X7zgaI/rZ8cWzP8O4mxbA
	uKOxqHFKxkr4HpkYQUiFreeky8l5CUPn/zArMikRVdFKHRlEjJ7FpFbSicJ7GbGO
	hPgUjgsCwXy/nx407+1IbFM4Vp4LA+VenmnR2WyqqnWWAWsWmMbEzxg+fAWLoplT
	/PGymaWRqQkY1AIFSEbzO9zJJd1DlezglgW4wv/Z/qsdEGwUwmQ8pi9epp++SKxx
	rl/R81q8P0mjCNVtOm+FaKUXAJShHeidqHAhtiPbcP15SAo3W6y/IiC80m4hYgdD
	0o5qow==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jd429bh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 10:27:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 513ARwNC024654
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Feb 2025 10:27:58 GMT
Received: from [10.216.42.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Feb 2025
 02:27:55 -0800
Message-ID: <b4276ac3-42a5-4a9f-83b1-875721d483d9@quicinc.com>
Date: Mon, 3 Feb 2025 15:57:52 +0530
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
 <a3c7b0e6-a440-4452-83a2-eb95de0de9bc@quicinc.com>
 <7b57f8c8-7d0b-46f8-8364-a13860ab530e@kernel.org>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <7b57f8c8-7d0b-46f8-8364-a13860ab530e@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yJcKrWY2_aG_p9Gq0oZ-j5LSCDEeeCKR
X-Proofpoint-ORIG-GUID: yJcKrWY2_aG_p9Gq0oZ-j5LSCDEeeCKR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_022804_429652_4A0D0299 
X-CRM114-Status: GOOD (  11.71  )
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

On 2/3/2025 3:35 PM, Krzysztof Kozlowski wrote:
> On 03/02/2025 09:43, Raj Kumar Bhagat wrote:
>> On 1/30/2025 2:10 PM, Krzysztof Kozlowski wrote:
>>> On 30/01/2025 09:28, Krzysztof Kozlowski wrote:
>>>> On Thu, Jan 30, 2025 at 10:04:56AM +0530, Raj Kumar Bhagat wrote:
>>>>> Add device-tree bindings for the ATH12K module found in the IPQ5332
>>>>> device.
>>>>>
>>>>> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
>>>>> ---
>>>>>  .../net/wireless/qcom,ath12k-ahb.yaml         | 319 ++++++++++++++++++
>>>>>  1 file changed, 319 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..bd953a028dc3
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
>>>>
>>>> Filename should match compatible. This binding does not look like
>>>> supporting more devices, so there is no much benefit calling it by generic name.
>>>
>>>
>>> I saw now your other patchset, so you have here two devices, but I still
>>> do not understand why this cannot follow standard naming practice like
>>> most bindings supporting one or more devices. Like every review we give.
>>>
>>
>> Sure, we can rename the filename to match the compatibles - "qcom,ipq5x-wifi.yaml".
> 
> No:
> 
>>>> Filename should match compatible.
> 
> 

Ok, will rename to - "qcom,ipq5332-wifi.yaml"

