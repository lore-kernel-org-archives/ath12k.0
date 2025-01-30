Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6126C0218A
	for <ath12k@archiver.kernel.org>; Thu, 30 Jan 2025 19:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3BhaqXgrMLyKfVblpg6Bsrl71b0YFcABEbF9BiIscYg=; b=PP+M6FyRP8tDTjOb6Te8fISCu2
	FJXTOt1QMbVVPUh6HQe7t2egGYBbNsGu5f39yNb7id8nVVslNF+aahQcAZnIt3hGNTsQtZ51Z6PM3
	+14NyZtNKAZJSZ7tQS0A6gXCD/e2h0lzn8tKYvRqhpI+EdXF0XkGlWVqOPp+bhDX5gUbVZGB425WL
	loPyOvAwDfz8VSCa/F5RPIZ4SZ5Bc8BrsZX88nLvaTAWXeM1QfXef8YukqBMq8t5lAaNLHrMidcr1
	G+/oGsBlj+XCOGPKVHIEwfnoe3okbrfIwJXokX/rPxCsW5Y8lTn/0SJ9Y+wvXovP20I0raQe27FbP
	U5k0uFlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdZsm-00000009T9G-2uEi
	for ath12k@archiver.kernel.org;
	Thu, 30 Jan 2025 19:07:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdZsk-00000009T8H-2Oh5
	for ath12k@lists.infradead.org;
	Thu, 30 Jan 2025 19:07:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UJ1X8a030813
	for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 19:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3BhaqXgrMLyKfVblpg6Bsrl71b0YFcABEbF9BiIscYg=; b=VvBdDwUyDlBcBHYi
	rjjkal7KVs9FjsoZefLoyuXHaGPybd+B296tdMJDFNcjkuJc8vowZKYkXZImESKu
	uY1HJ1PA2MBSFOoHWZ4U30Fqef9nTv/8MR2jEJKL1YyfW6o9Noni32IqnamdJh2n
	FoaUVXCvkQpnA7Wj6kYDNBkSwirXsnFhLU+B4LGEiD/k2LSaIdCm4kR7KBcXvE9j
	1L6DVFD1+O/y5rLPvw9EFs6KrTsKaEocS+zGaK9/432a08HPOgZfbALDkSKAvXwW
	jOKCgCloDrdc0CunM7ykFDmP718PyFrzHdygc9jQVjrFXxmfkVKK5j+mAYA9B16h
	zqg9Jw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gf7jg0n1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 19:07:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ef9dbeb848so2169072a91.0
        for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 11:07:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738264037; x=1738868837;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3BhaqXgrMLyKfVblpg6Bsrl71b0YFcABEbF9BiIscYg=;
        b=iw/Sy9XDA6aYVKz4UfECnX4JwHvrf/tb3Zf7MBYS9Q3JXkUshzm5+T/37KwtYi3hzI
         QUjMc7MtKvs9F4TS18Xm9uSfnLkQkH2xE4Xtj+97GuFagxzaSDuFJ3dxihvn7IjgK/pc
         hOAIm7EHsOWngA7EjFdjJ/U70rbJzzy+2CSC4z/dd+Q7I6jXWcR0RMn/Owo4/aSzS8FG
         GidsC+mZhLorh72BN02TN16ht3JE16E1KfOxUGQo3O/YBjPJFHFMrI1Pon8PLyXtAkpb
         Y8LEXJ44H9wJc7kR+4U+d4jClNRvPrASn4K/pM7ORtfIMQs02i0pknAZ4yV/gmC8qmxa
         4L4w==
X-Forwarded-Encrypted: i=1; AJvYcCWOgGz5MmWysGQgACjY9JaJhG9PqTCBW3tbLRqvJKzi2tVbkfcGipG5mZ+AVpiqh2+gHHiZk3g=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0WrpyDHd05t84k7ee5ZvM5rGt4M+dMVNwwbbynFkEBgl/jsBu
	CYqURl+tEuS2CPN958C4r/g2kbFW7qIf6UbDYt4IqyRKalGMZ9q0qutjdwMikzTIfTmhVUaodB4
	YRZC2NtfasJhhL7gOQj427pOwXS2SocSepUf5v7dy2VQx3TFi/yiLIB3XqaZ+
X-Gm-Gg: ASbGncvAArQ4nrtuCCFSvOxU1Hgdbt8NLmetQoJvfPnynOC7Jl7pw0fP7DQyuLgAjUl
	OsXpt0x6dlrn+jKkXL7hy1zMCgVX+FigeC3VFfEek122MYSSbGfgYL+FKBdDMOMCon52U+3CxAZ
	cc2/Ahhac3RVfdvIq3WAOhMXHacuuJUnmoKtlLxJc5KOg1VzG7B6e48WUVGNHL+ibwU5xypOQdT
	VW7wuaDwvrzbFs5odmRgID/jRmhhxG98ucEMifFWAIOO1cDP0l/LLAj7ZJ2xuKuTwwfIxZt1mhZ
	7ctL9+gA7C0pzQa7/7duqtDf3qFPSJpL9BSjaT4mYmH8q5XHMgmKmWz1v60bEPo6QBytBv7bhg=
	=
X-Received: by 2002:a05:6300:6713:b0:1e0:d766:8da1 with SMTP id adf61e73a8af0-1ed7a6e12f1mr13417015637.39.1738264036777;
        Thu, 30 Jan 2025 11:07:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHg96qvbgqQ2gmDdQfd6xQyLD7vfiaEvtI6JhWhTIDtpEzP/0JSK3SeWZjihVBwGXNWf3YRmA==
X-Received: by 2002:a05:6300:6713:b0:1e0:d766:8da1 with SMTP id adf61e73a8af0-1ed7a6e12f1mr13416970637.39.1738264036374;
        Thu, 30 Jan 2025 11:07:16 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebddbb165sm1701686a12.6.2025.01.30.11.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 11:07:16 -0800 (PST)
Message-ID: <b3637222-d79a-4019-8155-d14abbadd6f7@oss.qualcomm.com>
Date: Thu, 30 Jan 2025 11:07:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/13] dt-bindings: net: wireless: describe the ath12k
 AHB module
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250130043508.1885026-1-quic_rajkbhag@quicinc.com>
 <20250130043508.1885026-2-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250130043508.1885026-2-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lKobcbhduXFCyzkDGe8Am8TCr8yg3KIb
X-Proofpoint-GUID: lKobcbhduXFCyzkDGe8Am8TCr8yg3KIb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_09,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501300146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_110718_621418_18CB8931 
X-CRM114-Status: GOOD (  15.18  )
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

On 1/29/2025 8:34 PM, Raj Kumar Bhagat wrote:
> Add device-tree bindings for the ATH12K module found in the IPQ5332
> device.
> 
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> ---
>  .../net/wireless/qcom,ath12k-ahb.yaml         | 319 ++++++++++++++++++
>  1 file changed, 319 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
> new file mode 100644
> index 000000000000..bd953a028dc3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
> @@ -0,0 +1,319 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/wireless/qcom,ath12k-ahb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies ath12k wireless devices (AHB)
> +
> +maintainers:
> +  - Kalle Valo <kvalo@kernel.org>

sadly, you should remove Kalle since he resigned as a maintainer this week

> +  - Jeff Johnson <jjohnson@kernel.org>
> +


