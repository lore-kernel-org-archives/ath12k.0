Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F3FC021B2
	for <ath12k@archiver.kernel.org>; Tue, 25 Feb 2025 18:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PY156n79dtgyG547BmE7z4tz9qFqyESVtay+ztcM35s=; b=bnWJPS/RFpTyJJG4xFiG9I7Vto
	LC6o/vF8sjVarNFDMVVWOZBkP68X5TfUNC4E4M0205AgDRbUZTiD+MdJVKWYDby6Xu9GCIhaV50dD
	z+d+Eltda5u1exg3tsPgy0EsBrRSFQiKRtF4n6JoWt8pj9Rv5lbXexybVRP12EqeiLxQusxW34N6z
	6ScS6W02ejte/TfWpICTSo1bc5k1JZYGN9rnr6eZPdHhahVSyyYTqv0UgbF1ZccdptqqYAurNPpgN
	Hh+AAK7xbjrzo7in8YAZqM6OxGa4SmXyySWjOtERLdo3vrG1rgMemnTCebpI+LZPvRtKn4x/151/j
	htOy23dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzj4-00000000wyp-0kKv
	for ath12k@archiver.kernel.org;
	Tue, 25 Feb 2025 18:32:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyr1-00000000gQv-3qcW
	for ath12k@lists.infradead.org;
	Tue, 25 Feb 2025 17:36:25 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8ADuH004752
	for <ath12k@lists.infradead.org>; Tue, 25 Feb 2025 17:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PY156n79dtgyG547BmE7z4tz9qFqyESVtay+ztcM35s=; b=muXSm/zoLUrDUdLv
	RVO8vy97Q8kxT7j7yu/Oxf/RbYbUb5J1UoUQ11baEgXCYj052Z0KU+zvs7U+1Kpm
	04TpRDaSKV263B1BELeKYZCxqpe2fxnPGXQCAhNoWJjzhyKPVFGy9AJziBvCS7aC
	WiuWqCmaB8mMyU5BGEgoSNq+SZjEO+/0ESiRrW1+q2aAq/7Id1/UZ2lImxej0G+B
	LMNEHYwZe5Ar5NiP2wrGXh8KMomYG5vDdzl/EfqU5IByni+t9jFQKstNcwPhNTzr
	NreLpEicJ6hHm+FO5IRCixq49uGX6+Dh8bf1AMh7rVTzvddCzJ7YFYpj3++v8sdc
	q226Bw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 450m3ddq4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 25 Feb 2025 17:36:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-220cad2206eso127618385ad.0
        for <ath12k@lists.infradead.org>; Tue, 25 Feb 2025 09:36:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740504982; x=1741109782;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PY156n79dtgyG547BmE7z4tz9qFqyESVtay+ztcM35s=;
        b=D5k1YN6heg5UoTi+zg1iNFUP9LSPc7SqYZA8dBz+50A3hag7Kf2SM6m7H5LExzxbmO
         EvmVkK6nOlWPa0LOVyO9g79PQLDHWqKNn7GzvHSWA+H0HoSjXMN2QJSCULEo8/qXsAwW
         Q97N7HAg+9fYPgbe06KSZaEeu/4MPwmKqUU3ZSZ1E6PxW7CvCFzFi365PMCfHuVzT1YM
         RAMtddkTc+7H39r1LvYQrrxO362Eoce6SlHvchONvSqo7zLv3WpfD9JnVEXhZ4U8+0O3
         6iZD7KT3j+VlSk4pbLtq23Ew/+o6Bjm+P9GZa4gFSNbEC+UH5zkCTdW5PChTljkLcGDh
         KzVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuY8gx6kDg6ImBhXpzlO+O/wqKtZhbNem6ZXCAT19X3aBNpEb3yIm2PzXz7RtLH5Z3V/ba6hI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxBQ4UnjyD079vrNtoDxo6TutbAyaU57VfXQ5yUIMKD8ejevyaL
	09GE2DgGbRTS0gaHtDVI9QUJvwWhQwpiuOBYrfxpgLw2EpZBOqrh83QyVJLe2/eZ0OEIJ/f/ve/
	8Bsv55N5Xmg+G61XcrM7NhT6ZGsW33xh2xsamUx5TkxSPRJjaE6pbnysWleDm
X-Gm-Gg: ASbGncsjTNC47vN0aNk4Gf0M3vcYEjomE9Z8B9qcBnDMG0uuQbfCePsN3vOflcPP4oe
	+YqxskUUFwhuBkiKN6qsjGLursSekzue4mnbX7KwmZac4hZQKTgfJbNgun1vyUf1xCZBWp3wHRH
	BfvroraFk0X0vTaETJ15sFTmoVaTFKqiOahKh0780ODmtnknmKXuhhljCzatt99I+76WYk5tOqw
	xBz1QbHTHlMU/1pWoQ9y81y4CjybdAnRrn8MgyDcRXCKPh/T15GVLVTHT3PPCN2+qcO+ufXx+b5
	YMVs9ATLDKeIDCXjLTjHWOARtHH0FZe1VA+aemNfLyh9D+PTL/SSSGKYBLs5LZlh0W8Nu2w=
X-Received: by 2002:a17:902:f68c:b0:21b:d2b6:ca7f with SMTP id d9443c01a7336-22307e6b767mr73470605ad.32.1740504981990;
        Tue, 25 Feb 2025 09:36:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFw8TV2N1DWUVbvHR3m0t6e0ifAA4ibMwsVXoLdv9Y7Qb3v7ZoTUZ06wLZmqsF37ryqtGQ7PQ==
X-Received: by 2002:a17:902:f68c:b0:21b:d2b6:ca7f with SMTP id d9443c01a7336-22307e6b767mr73470115ad.32.1740504981602;
        Tue, 25 Feb 2025 09:36:21 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0ad990sm17124675ad.215.2025.02.25.09.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 09:36:21 -0800 (PST)
Message-ID: <71019e23-f339-4485-8599-c4e40ad979a9@oss.qualcomm.com>
Date: Tue, 25 Feb 2025 09:36:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-slim7x: Drop incorrect
 qcom,ath12k-calibration-variant
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org
References: <20250225093051.58406-1-krzysztof.kozlowski@linaro.org>
 <sfhcmlz3x254fdowufeeuh4uiwxfgkphm4ch4laceivbrs3zir@qvqk6jxi6zhf>
 <7b54e965-3395-4349-8ae7-51a28c759235@linaro.org>
 <kce6gzso22fp3ze2wp43fvy4tv6yqkaijm72kh5qk34jwijk2l@3ifaiz5tgjvl>
 <d93789c6-61d9-4761-98f5-aa3dbec14d82@linaro.org>
 <21ad3381-4d65-4c68-892d-9f485bf13735@oss.qualcomm.com>
 <c55f615e-6831-4470-9ea2-73fe605b8a5f@linaro.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c55f615e-6831-4470-9ea2-73fe605b8a5f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NFsmshI4BNYvwSkDcbcqrowk_FU1i-mM
X-Proofpoint-ORIG-GUID: NFsmshI4BNYvwSkDcbcqrowk_FU1i-mM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_05,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_093623_970134_F2DA865F 
X-CRM114-Status: GOOD (  20.12  )
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

On 2/25/2025 9:07 AM, Krzysztof Kozlowski wrote:
> On 25/02/2025 17:44, Jeff Johnson wrote:
>>>>>
>>>>> But nothing parses such string as 'qcom,ath12k-calibration-variant' (see
>>>>> git grep), so how would driver use it?
>>>>
>>>> That's what I'm asking: is the property redundant or is it correct and
>>>> it is a driver that needs to be fixed?
>>>
>>> I assume driver will need something like that property, but that's not a
>>> reason to accept incorrect one in DTS. One cannot add properties to DTS
>>> without bindings, so bypassing bindings review, and then claim "but my
>>> driver needs them". Send proper patches for driver first which will get
>>> a review.
>>
>> We definitely need a calibration variant entry.
>> I've pinged the development team to get the driver patch.
> 
> 
> The patches were on the lists but were not accepted. Therefore DTS
> property cannot get into the kernel. I am sorry, but this is not somehow
> fluid or flexible that internal team can squeeze something into the kernel.

I see bindings and DTS patches but no driver patch, even in my internal queue.

> 
> Also post factum reasoning is not correct, because this would open the
> gate to bypass any sort of review. Just squeeze your stuff into the DTS
> and then you can bypass all DT maintainers :/
> 
> All properties must be documented and bindings must be accepted *before*
> DTS patch is applied.

There is no intention to bypass DT maintainers. We are just trying to upstream
a large amount of downstream code, and in the process some pieces are coming
out of order. And there is also confusion if binding, driver, and DTS changes
should be in one series or three separate series.

We are moving towards an upstream-first model, but we still have to address
the existing technical debt.

/jeff

