Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E064D6D226
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 14:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYqTnOT91m4ng7A1+8x7fNdWtleqwYmaPl3PlqN+ezw=; b=PTMRwNTgSeOrmdLCj1uz7D0OYb
	+ziVvxKHfC34In9Rm/8Ttk0j+ZMi2AM1sDk87+UVe0krm6VNDj0PaoUbLbTK21fEtRcdVQC4usDM2
	kxw/pmGjDfMoH+iE1hl1jKhUdkSi8oR4D8iJrhfPvckFVmPQ6Fp5Dp17CMrV5YdzMzXFpROD/poRZ
	YwkYDTrLiNPBW6oDlwLdPOR6Xji33xdoOavtJNXPvTGUtnAuas2+ioCGavl4yZ01GKppN9jktHVnp
	2WTl0V5VWJz3ci2V4AePnEsIoR4bDemQsmvpzX4VyQbP+CECCoviiYzyT3mAg9gcrBGG4goL12yK2
	E12cuWdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWEn4-00000008bIA-076c;
	Thu, 18 Dec 2025 14:15:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWEn1-00000008bHn-19jV
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 14:15:36 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI8wXJD167607
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 14:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uYqTnOT91m4ng7A1+8x7fNdWtleqwYmaPl3PlqN+ezw=; b=hDwRztqxKISaGMoK
	Gf/dG1ZiXry4Ut02D7xPZxZliCA5o2rPP6mrOrfgywuAbbdGterfOx1VngHkTpAe
	5uf1hoAodELF4k4ZDZQZMTB0eXdpY3kAsX8ETVwJH25vrMuMfNB0fVJLZs9RUkRb
	FJAk4K+mVSQhMO5hdG5dvfEHcWHSAEWXKQO6nSQjHJDNFovy2hGh72VdrQTBtF6Q
	Hn4R3vRKxqSi2Y1T8T+uwGPQGioDrRibn6jO/pp4PHtggIcVKAoYEYaQlnP4VBJY
	gV4emCWXWVUGkIQslXi5A/dzgq8vEkAVLK3udcGNwZ+43P3NJelxm/4QE5EeKeQw
	xRTxhQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b45w52hv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 14:15:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee409f1880so1469561cf.1
        for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 06:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766067333; x=1766672133; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uYqTnOT91m4ng7A1+8x7fNdWtleqwYmaPl3PlqN+ezw=;
        b=KfnTLHJsPYCQXrGvk57Y22fJoQYF6rqR4RLk6Bc9b30eXfx/goNxELILNU2nFhWz6X
         ocoZ08WvZvFgRjVMWNhDkSCuoGpaNILXmU6HSAnaP7DTpBDlborE5hji6Ovo6/VKjBS+
         lo77vr9KF1HWVevbDH07kEp6ndnfBa/tBHdY6bfP9zJZsVTry07eTpgMM/Jn6Op7VUOv
         v68oNGh2jikCHUVXVcNX6En/Ojk9nLH/ZSBFjlKBxEBXfj1JAiDqyfyutk8R1bOAS7GY
         0mcw11A0E2yPU46aWvRFddGT/2zBv95gIIXtvrlWvcCnYwY9toNTgSJQXSTnjE2oijro
         Q7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766067333; x=1766672133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uYqTnOT91m4ng7A1+8x7fNdWtleqwYmaPl3PlqN+ezw=;
        b=g5u7hIlMvnGgg+KEWfSGx6OPJJt3NGyQ8z+wyXFu1wuTWpqL++LTABXIy7BSQqg8lz
         HvfFnSPkDfr7zrxo3nobtbs93DljRmMHQfxs6Hu98eeB7D4nZsfCIFdurzJyKDeTzK/8
         uYPc2BzSe5WsNAdkV7gtivm29YePlDRo7bsGtJYR03BhSGbwqcOWEnlVBOZNvAJ+Jm1L
         vGm4ChvStXwnceI/O4xAZA3dnpb7PZPrUYArohzH3ahfa+x/cc8HCLwkUSYfT8JO73fA
         vuSw4LwbJFwipn8HfWue1ei1Tb+v1R6Nagn33+UPDZsBW3nuGkubkpqXdPyPZ8Yp69OA
         fLsw==
X-Forwarded-Encrypted: i=1; AJvYcCUfb7s3DPxtIAF6N3HtLcK8VHIyb50gHi5bxTXT5nohmoTfjHNzKtBa76NdUpHccOB1e20Mers=@lists.infradead.org
X-Gm-Message-State: AOJu0YwrEEA/d/4b8I39RZRAt2tAdNMBhWh5aKaROIYHqLCUFTqDPWZc
	YYK/Q71lEgK4pridmXNGo4QPWZoFmohlIwhU0uxXf4xjg7xeNhVa0jV00BEkevcEGOwj5+tkyoz
	9U/4p27ISfAvHItHK1XsBkag9eTRjee1vLJjbnyNXiqxedtSC9gRkNQZZINpMpvDm
X-Gm-Gg: AY/fxX7TvgJVl2DRV5F7RhT9JZXiKIuFahZWJFACzERYJQKxwqo4w+VUipXJbk09E7d
	e6LLrIlQcm+qao6nPW0ydht8s0qCWmAvzDnmioIxAA94kn72XtfDYWRJPv6iOW8az76N4S7mcxG
	21wDlaHsbv3vzlun1xfhgj1NB2aX5w28ofxK+teiqPppuGihf6abYIVVTWZ7ei+NFv56ryDMG23
	S6hz2VjpFyiBVt6lxp8JXi0XcLk6OSMWJYPFy5C7OiFa/fuRpuJPEqbQB/lqrb8ePAoiDxjUbsa
	VuEyfStBfzaylW63O0f4jFgqO4eq2G3DB/0vtetzog4fgkV632Re5Cid4AcfLlZ17s6MrRMEHcH
	cAxmppD3BnPijOlOWRSNhsVwgsWP+W5NEJAk0eV+EtzmtyAM7GH179k9WfnVL0eG1WQ==
X-Received: by 2002:a05:622a:1b90:b0:4f1:96c5:b592 with SMTP id d75a77b69052e-4f361189f54mr21475691cf.10.1766067332129;
        Thu, 18 Dec 2025 06:15:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbKcPhLTi95myOrrgVwOR7cxMWFybCHxSy+FkHP4hhMqvQyasR8A0JUNadn/IEP58AaOumew==
X-Received: by 2002:a05:622a:1b90:b0:4f1:96c5:b592 with SMTP id d75a77b69052e-4f361189f54mr21474891cf.10.1766067331395;
        Thu, 18 Dec 2025 06:15:31 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80230d0e11sm241715966b.16.2025.12.18.06.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 06:15:30 -0800 (PST)
Message-ID: <438a352e-5174-4361-b6e5-6ff5fe1ce0c0@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 15:15:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: arm: qcom: Document Microsoft Surface
 Pro 11
To: jerome.debretagne@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, ath12k@lists.infradead.org,
        Dale Whinham <daleyo@gmail.com>
References: <20251218-surface-sp11-for-next-v3-0-875afc7bd3b7@gmail.com>
 <20251218-surface-sp11-for-next-v3-1-875afc7bd3b7@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251218-surface-sp11-for-next-v3-1-875afc7bd3b7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mMH4pafRoVX_74QSNFZDKo1eUIlhL_Lu
X-Authority-Analysis: v=2.4 cv=eKceTXp1 c=1 sm=1 tr=0 ts=69440c86 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=Os-eGSRfLiUiT30J7OMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: mMH4pafRoVX_74QSNFZDKo1eUIlhL_Lu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDExOCBTYWx0ZWRfX5i5UKZKdeZNI
 fRhQpGkgpy9tt57h2WhCI3K62+j7/K092sJsEdrH3DkB9X1DJS6FogMPjyCm4pCilJHZOlYjXtb
 u5+1XVwEv5DVtJvR6W7UDLPoAbxUKIwKWplC/hG+cw1cnco6omR4Dch02ERoLYTxL0CTMLmonjH
 sY2fT58+tiRQFMJ8tdSupOn6U8htHBwdf6AwRYjz+EQpLp30ivCL2DQcJdmS3zk0Hj55tK7tGnI
 PUO+ctHIqYr3nb6hIlSR2RvP7I28LDGqxGapeD9fq/mQYc28vJbOEJaHGCXFJCzSUBw0z5fb9y/
 cdGyns6NoGdNlRUzDH4xe5/MRcvp7JKEi+F//JSytrmzv+kFUAiMFsOFrlctZBrqmQokdMc0LCt
 ZJxleYdCAstu9IkUh+uz874mEVLoeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_061535_320444_E081AA0F 
X-CRM114-Status: GOOD (  17.11  )
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

On 12/18/25 12:56 AM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Add the compatibles for the Qualcomm-based Microsoft Surface Pro 11,
> using its Denali codename.
> 
> The LCD models are using the Qualcomm Snapdragon X1 Plus (X1P64100),
> the OLED ones are using the Qualcomm Snapdragon X1 Elite (X1E80100).
> 
> Due to the difference in how the built-in panel is being handled
> between the OLED variant and LCD one, it is required to have two
> separate DTBs, so document the compatible string for both variants.
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index d84bd3bca2010508a8225b9549d8c634efa06531..7c99bc0d3aae3dc6e9c08fef0a535e114a3297a8 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1067,6 +1067,14 @@ properties:
>            - const: qcom,x1e78100
>            - const: qcom,x1e80100
>  
> +      - items:
> +          - enum:
> +              - microsoft,denali-lcd
> +              - microsoft,denali-oled
> +          - const: microsoft,denali
> +          - const: qcom,x1p64100
> +          - const: qcom,x1e80100

As the bot pointed out, this is valid, but not what you want:

This expects

"microsoft,denali-(lcd/oled)", "microsoft,denali", "qcom,x1p64100",
"qcom,x1e80100"

whereas you're looking for 2 entries:

- items:
	const: microsoft,denali-lcd
	const: microsoft,denali
	const: qcom,x1p64100
	const: qcom,x1e80100

- items:
	const: microsoft,denali-oled
	const: microsoft,denali
	const: qcom,x1e80100

Konrad

