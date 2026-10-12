Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B413BCA9ED1
	for <ath12k@archiver.kernel.org>; Mon, 12 Oct 2026 05:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zSZjEhlxbRcj3QUVbZ7iwR9kQWOUQNpT+xsX/Nm3vFA=; b=flOpTief88MYAZNERbE0OWzPrT
	4hutZZdym0DcfFPkerzj71JNMOcx+EVdXQWBYsh9V/2Fnh0HERpF+GExLrL6Fj2GtU9gLsBnJVOUP
	0wJBHdlkAL6yRRFeis3jQoFXfTWQMegiKi+VBIBeU103z+8/X59NFjvblbYU3q/4DsqnQHjJO0VkK
	mee9kuB5kEi7vYNj754q4PjwKGltJa0FkywOrYyNB414lZf895DE1vhsJ9/nRuhTqrBu9BAkfLDD2
	A1d7aMKrudibefx67RpsyIqSPc2c8qgG5z9hN3ZnEWcQpr6l1svYHbEiHA3J7OuolEnLtNRsJ2JDU
	Gd7oXAmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG8bp-00000009gG8-1DNf;
	Mon, 12 Oct 2026 05:30:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG8bl-00000009gEn-3EXu
	for ath12k@lists.infradead.org;
	Mon, 12 Oct 2026 05:29:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C565bT1002371
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 05:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zSZjEhlxbRcj3QUVbZ7iwR9kQWOUQNpT+xsX/Nm3vFA=; b=H1vQINFX3P8+fun8
	9jdru3hI4pQYT27qYUBkB4m9EFQo+eDE2tlE9b+S8MiorSDWSh9pBWcQDIjdZkyc
	IhWKKXMHB6mZMZLYeM5hpwL2KmMgiV/tH1X3XwOPlUl0eAWqIOrjCK0Ix8Zg7AbC
	EWpWzdsSXusMv+Aossir0oIDj+ckbv4dTMmFj9IHoAjv8fk2RpBhG00Aypms7/Nf
	4FFG1C9jz0RqzUKR+zPGhNRjEhh3Oc11d5Ehg/AyT9p1VFPaht621tj/Djf4KZJt
	xI5RCdm4fyTZiInQiAITkXQnPUHJtbQwu6h3Dk97FiqTL2PxV8j2v8PsgI5JPBeb
	0ItC+g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkga1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 05:29:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e86af936fdso14769935ad.3
        for <ath12k@lists.infradead.org>; Sun, 11 Oct 2026 22:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791782995; x=1792387795; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zSZjEhlxbRcj3QUVbZ7iwR9kQWOUQNpT+xsX/Nm3vFA=;
        b=EFbSXGHWn4lL4MJcblF4+QtFMfj7wRbypauBDEQazHMl9PAkWpRAcBLCgUSWbuojRR
         vGSm75b5Yho6mMHFn1v96jp+ze1CioEqMn0eCPTf2b+sE8pOgF5iM/DXocqt0xIUAIuj
         jvdPRUmIA3IYLsB3dUlwOPE67E9NY3WjIBRv6WmsTR+qthHopzoGwtqXXP4BVt5m1Mtc
         QhlLH00nXXVik8pgXKQdoWplCHsm7Hoad77wbWwqP0lW9wVaszqJ1ct8FYckKzVLlQ+N
         VsioccNI/rQUQHNgjvEcvVMXyMzy2PUurMVxvgCyfn5f64Hw4tVR5PGMdSxwLwI5+i50
         xU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791782995; x=1792387795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zSZjEhlxbRcj3QUVbZ7iwR9kQWOUQNpT+xsX/Nm3vFA=;
        b=LADrEFlQXUscWPEDlOXRGNjYYlHr4ngOOsy5qQ3ix73Mn5d/ZeILP8hEHlfh4LhWXS
         RaPVHLrRL+uALwFfJyyIdI2lUAagTHEWRgSqFJHQtcEqczBd3dt0058SaoKhz2eBG6iv
         0BJGAgCYd1h//4hJWiPGq+rp9159wXgdhd5iQ3SGDHcoHtBqzrNHdHej92Mu1Vn0IcIB
         oBj2qMz2PEaiASE5QafUWJToY8xy24Ew3h0MED4LUbL2Md8H0BQwl8LsLvfZt0f9UcoE
         LTjg1JAYDhEupe64FL8UwDOeadiev4H89Kl02WccebYmmj/c9DjskDUJha4OSYZYqwS9
         fOGg==
X-Forwarded-Encrypted: i=1; AKwUvBynWoLuOg95Lw8GEad/KInOSK8VxmXaZZgwJprwqzwSGUIuuNx7ElXQF1vTbyo4i2PEHpkaubw=@lists.infradead.org
X-Gm-Message-State: AFq9FYLNFF6wWj9M71C9kO415JOJd6ON0txP21wTTIygAqd8xB3tRoEz
	uA9b2RzxuA1bDDqVj9aTsPBS7fSsFSaJ9AfcPYbqDHCSuvBP3g/AR/pQ97BdanA5llmZumIaonY
	gdbDGkqa21bNyrVfghJAgcHNT5+IryGu9FBI9wvahQ6l3l2MCai8juQhdtgutvLiP
X-Gm-Gg: AYBFou1XZTP5eKefhPkRYoMZCu12Hswgshul0ICD84ZXiQhHp3AUOpGF2CYRoBiqXLQ
	Gxe6e3aB9uEllHkWn1XsVfQSMLEVuMHMUCW77nnJ1B2ueHilkdt/q5y+dmIGaIqKMNkg+rvYV8S
	bPXx3t+mkhDCw2ihk3w0JK28/fKxwlJ0Msg/kSSkenThzQ4jrBNrI6ZUlo/vtzu5U3fy18bvfW5
	J7opOX7fc04fdT4+XcQaWiWZXTO/nU7eiEgzs58JmRt3M+PukwalBiDGbBp8QJyFtxaEOgCnN1l
	xJGCLd/4DXJS54NCF80Hfz/M0rexsPnw0Utwju8bZ9Kf0ERhQG1iE6p5LIEES8GYDqieOUxzacm
	ZqVnKP5cN4CyMq8/ZFSX9gaX1rSWxCwJevA==
X-Received: by 2002:a17:903:2309:b0:2df:3b0c:a6a5 with SMTP id d9443c01a7336-2e8427f7723mr67059865ad.9.1791782994658;
        Sun, 11 Oct 2026 22:29:54 -0700 (PDT)
X-Received: by 2002:a17:903:2309:b0:2df:3b0c:a6a5 with SMTP id d9443c01a7336-2e8427f7723mr67059825ad.9.1791782994200;
        Sun, 11 Oct 2026 22:29:54 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e171bsm38699445ad.73.2026.10.11.22.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 22:29:53 -0700 (PDT)
Message-ID: <fb81a042-82b5-4565-9a5c-1a3c038a0d14@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:59:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 01/17] dt-bindings: net: wireless: Add QCN6432
 device tree binding documentation
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
 <20261008-mpp_bringup-v1-1-2c5797b5e4ac@oss.qualcomm.com>
 <20261009-brainy-alpaca-of-focus-31fbbd@quoll>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <20261009-brainy-alpaca-of-focus-31fbbd@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyMSBTYWx0ZWRfX5tSLFLc38BLr
 nsqpLHV743SBA4Sa7e3felX8LEdcRGvzWh27tLQ9OCa9TJDZHBsyCRxaMLG5hn1Iv/MM/A4uUuL
 AAyQHNXfSP9XKlXOibDlHMOWKwCbb9qfksLdn279lX49yx0u50v1z+wc5v1LkLHeRyHahm1hd7S
 ytcqWccrL0YxL1ivWLmEoT46LrrB1nfGlLDJq1+GUo3I0eoV7gHyvck34+YieCso31kcWqMzCf3
 vVklQliJD7Prhfj0An8YK9weXj4jUlWYWZam0HX1mRzmdPtUrWDngdNFQHeNVTpS9JysU+BMSlp
 /dO2pRybz/LU4H6t8XZegbeZdHCgYa3y2Wsb5sxbY9lRovHivlNj/LuXcbUWL7YeqFkN54ocUz8
 U9J7m9XY//W9GdmIBnTniQs4iKGji7kzxLH5MsNIjf7ODErSVPZiTbRBz/CR8IVDGOWcp+rZ4n7
 0h5riK/ge6priliPxUA==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6acc7053 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=WLwc7mworHJoPNN1NUUA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyMSBTYWx0ZWRfXyvCrrVLUv1pS
 SMqtNGg8/pPykEhpIZR79kWdbb0YOUTm4yGuT1Idir4555SFk2R7WRXf5Ko96f/8UlTajM8ACX/
 cTTREik2lKNljUAPMd8+VDWf2pjO/74=
X-Proofpoint-ORIG-GUID: JBeSEjArfuwSqlbLMQzv6wJ44XPnT8VQ
X-Proofpoint-GUID: JBeSEjArfuwSqlbLMQzv6wJ44XPnT8VQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_222957_933891_4E9C2C1D 
X-CRM114-Status: GOOD (  19.11  )
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



On 10/9/2026 4:00 PM, Krzysztof Kozlowski wrote:
> On Thu, Oct 08, 2026 at 03:53:57PM +0530, Aaradhana Sahu wrote:
>> Add Devicetree binding documentation for the Qualcomm QCN6432 IEEE 802.11be
>> wireless device.
>>
>> QCN6432 is attached to the WCSS Q6 subsystem and is represented as an AHB
>> platform device, even though the Wi-Fi hardware interfaces over PCIe.
>> Document the compatible string and the resources, including the Q6 remote
>> processor phandle, MSI interrupts, SMEM states and memory regions.
>>
>> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
>> ---
>>  .../bindings/net/wireless/qcom,qcn6432-wifi.yaml   | 149 +++++++++++++++++++++
>>  1 file changed, 149 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432-wifi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432-wifi.yaml
>> new file mode 100644
>> index 000000000000..97d8885333fa
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432-wifi.yaml
>> @@ -0,0 +1,149 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/wireless/qcom,qcn6432-wifi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Technologies QCN6432 wireless device
>> +
>> +maintainers:
>> +  - Jeff Johnson <jjohnson@kernel.org>
>> +
>> +description: |
> 
> Do not need '|' unless you need to preserve formatting.
> 

Thanks for the review. I'll remove the unnecessary | from the description.

>> +  Qualcomm Technologies QCN6432 is an IEEE 802.11be Wi-Fi device
>> +  associated with the WCSS Q6 subsystem. The device is represented
>> +  as a platform device and uses MSI interrupts for its Copy Engine
>> +  (CE) and Data Path (DP) rings.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,qcn6432-wifi
> 
> Is there qcn6432-something-else as well? Neither commit msg nor
> description explain that.
> 
> Best regards,
> Krzysztof
> 

QCN6432 is a Wi-Fi device supported by the ath12k driver, and there are no
other variants requiring a separate compatible string.
Hence, qcom,qcn6432-wifi is used to identify this device.


