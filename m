Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF93606A326
	for <ath12k@archiver.kernel.org>; Fri,  6 Nov 2026 18:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w4h0AUg0;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P8K5NNlF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zu8BSyMr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=v4xi9zjLk/JnFBwNsX03J7ooArpolpgt1TZbGipdHrs=; b=w4h0AUg0VVdDAO
	j1Xjfx9MdHL/s2HRr/Uh7IYNASIZFx6MpxWWQXw8kxQxlJmL+UBgRYmlLTrivoqsJBufVVdALCMCF
	fdHGgqlXPHxE4iHpWDj8IbtWudWW/CjkTWUEN/fFaPeRjaJFG4+Yg+uZSrl2kICAh2+01rZoQYvWR
	xA5HXHGXeNU5wlA+O09ytsADnYZ///XY4y8fYkNzemsO8php0F98uY65IuEcBicosbFMeAq950JMu
	LBMv/4gWTRlc/K0QK6OUSetDGkDNoA8iloHQaXx3+wCbGKz4VYdJ9lAb6rBdKGRufhf+RAg7sdJ8q
	5BEraInelZze+3FdtwrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOmw-0000000DPLi-1Kbl;
	Fri, 06 Nov 2026 18:35:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOmq-0000000DPKu-1iY9
	for ath12k@lists.infradead.org;
	Fri, 06 Nov 2026 18:35:44 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6IRrrQ1512867
	for <ath12k@lists.infradead.org>; Fri, 6 Nov 2026 18:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v4xi9zjLk/JnFBwNsX03J7ooArpolpgt1TZbGipdHrs=; b=P8K5NNlFrrqItXqT
	n2b3FmqBmj6ylC9Gr3Gt8NTQwaMlnX7fCC8bp8Sj1yOXonXgIE2PF5WlAVOv7HmW
	IWG+C6zqEbbpHE7BjV39imBno+jh0rixVHexhC14kUiB689iu0y34vNW1rVWjCkA
	UNsrHgBbRmgu+ocu+pnBymNw5w5+vBFbiR1ofhh18TNlu4rxRLJE/e8t+FBBtoMR
	itEx4AAupsvsEfART7q93Bkaz8Cl6P/AsVtFgiqtsYGoNMt/dO9J9PTn3rm0U1pd
	TjzZXvgOBsCzneB0bYvRci4+84zcfSd8gjJbW3Qa5imgOegHSihi2QV5wefEbeVm
	Bt1eyA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsm6m8143-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Nov 2026 18:35:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f26e6abe9so1640425eec.0
        for <ath12k@lists.infradead.org>; Fri, 06 Nov 2026 10:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793990139; x=1794594939; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v4xi9zjLk/JnFBwNsX03J7ooArpolpgt1TZbGipdHrs=;
        b=Zu8BSyMrIp+vf1u5Cf/EcC2ydj3n/xD3A00HDSIq/q1yNY/4C7W80B8NMvY7yleCnk
         uwTG0OmouOkAnelt6QdaUyvXpje9CEX/SJb4AjSI+bo64irAsCPCMXJezI0f2ExeqL01
         kDtNLLClsFLRZpb/9vrVhDw8g5V5AQ37YYvvVMEkLZkxPR1n4JKHwmrXFvJuNrBnLg5n
         vWeg4wzU8b8XO0Aeo3vdu1+BdVcdW+e/UIwXV0CaPg7rr+2OhY9A9ZY9g5RbfVgwwG/v
         +Wh9rWPTkEbf74dYtbPO16HH8ivhUITI28dCWK1BpB2YeS6OKfKnmV7qVMS1i0FmoOsN
         Ix2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990139; x=1794594939;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v4xi9zjLk/JnFBwNsX03J7ooArpolpgt1TZbGipdHrs=;
        b=smBvzzmp7ccH6ZnZzQtFpr8MaISh6Obdr6uLcTDUO2ffxlEp7E1oFTiCtud9u3IX3u
         NgBQqCUlKlFkEhMbpdgVEA3hofnogcyquIep7Gf0l6OzKexoODCclua8hhqIffn7/ZaE
         yggwvD+zyrHU/OOucVbwKHflosgHrz7pECkuNfBEQIr54zC7eHnl8WxvJp+HqmtQvKFp
         slzjWuitqZZqWIo7K0jX6pfEXNFa4bZgzKWBTjRTazBgySnzTibwyseOSiLtAPwKkgjb
         EWBNVJsPNRAWVL6gxyS5thHqM5vPsAg+xvKdrFVCchjk5qbt4OdEbuo7JV5J8iAtGJrc
         L2+A==
X-Forwarded-Encrypted: i=1; AL+hErF9Prbk0zM75ZB9DNs+IX264sH25lTB9zSDRsww6PKAtu5CLfZW6nELXpxJboRWVTDu1Nputog=@lists.infradead.org
X-Gm-Message-State: APuU4Z/sS8p9+c587Nn1b0XvoUYcGPiAeNdvL1iMy5KcNkEOlXdt9OJ/
	WjarxdWO5UO2RUD5d3zAUg0wQGtb6Dg4Wh9xQlPKz1tA4mGkp5gARbDy13l5vUoe5N/Ab9KJChl
	UvjGxePNn4gQTCKwMkLRzr8oHLQ+TCAA7udaPyuLm48k/cHgDgprstsA8sLfKpkmL
X-Gm-Gg: AYBFou3dKgWJ4I1ZtPFCWFwMil+3Jy2dMryhG0G+9tiKX9jGwafN1aKdVD8VUujlFKx
	nA8loGVYjwKIrOMPkoTReKJP9e+w97iQEdPgQBEERKbD6a9dFTnuBXUkO9S1RJWEEp1DyUzYUHT
	D5nwEGhCZZDeUoCl7ABYhkWraxUPSwgK9C8VSsvl7fU/dvJnOBwaGqzeA9A91mL2Nff91pM62JE
	J0EgkRDvb3aLywAIqMlrgzVO0Vh82oC0jAfXrpSDaGIMmsXAhZhBjyh5zyZulic04JejSHoJZR4
	YZ7bbjodeNk6urntFgHbFCMlx1kUs66LqNBYWrrEPtWlYCBulock04wEV2EFiW2CMbN5zOO2mjp
	WtOJWkM72vx8wqwgM1DfFZ/mxTutZ6tiQ418IZOQI6moiihi+d67qkCbbW0GcF/L7eD5wUSTsKX
	3A9xXDJakA4SiDPms=
X-Received: by 2002:a05:7301:fd0a:b0:36a:31b2:8643 with SMTP id 5a478bee46e88-36f774f5c3fmr4397674eec.38.1793990139030;
        Fri, 06 Nov 2026 10:35:39 -0800 (PST)
X-Received: by 2002:a05:7301:fd0a:b0:36a:31b2:8643 with SMTP id 5a478bee46e88-36f774f5c3fmr4397636eec.38.1793990138362;
        Fri, 06 Nov 2026 10:35:38 -0800 (PST)
Received: from [192.168.0.3] ([49.205.82.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm10347444eec.10.2026.11.06.10.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 10:35:37 -0800 (PST)
Message-ID: <1ad8a442-278b-4db3-97c7-82e0a77b201b@oss.qualcomm.com>
Date: Sat, 7 Nov 2026 00:05:31 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3 00/17] wifi: ath12k: Add support for QCN6432
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3NCBTYWx0ZWRfX9D3f5aNnCz58
 lNrc+SYnLbTHGsNEAZB7mdjSt0XJTEJH4anKo27GIJ0KlYrjTfNOcgzoAuHfxPYc/LF0qRZojPM
 b61q1rYICFH4UFvE3eqIHJV3NrZDygE=
X-Proofpoint-GUID: 6VlLmkJNMdolPRwaydLsQ_bhEHrxieNI
X-Authority-Analysis: v=2.4 cv=S7NMU4sP c=1 sm=1 tr=0 ts=6aee1dfb cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Yi4Dc0+RdECwe4ym5Eh06w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Jrv9ZmiOdEm1SHuq7XcA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3NCBTYWx0ZWRfXxlKjXy5QbnIQ
 IKmY4qZ3ktMudWp7lwUpz/zuKC1TwSGExKz8b4VADSO2OW6HsgXsyK2XZL8PCJ2bLEPYMDz1fTO
 HjS1L0YR9fbWA8ltd5WJcT7caGFZoMtVz4Rmw8rcV/wJfWfJUppUw5UrQTSL26XSYT+rXcma/BY
 xUKj0WuLwrCNAuQe7ae9YLiP02GqLgqFkB8E56yc6JQ43mhVkCzmX3aTThxe4xLPjl8ulBYMHST
 rUxnO1W9WG6oKaHdf9Qq2000fk5Xm3AzzdtblCUf7gQTChvO2s63hldg1pcr4iMUgpZl00zwu4W
 +7EjuVpqpEn4LweO/xpYy8JFf+pR3Hy3Qd6eX4ac9ULIdNqOnBsaIuceWVqZLfqOlTi5xlKVaab
 o9dm2y++TD/5uvqRfsyNTWDnTVZnzcdPgJStoV9i4JPeBlo/lCf8th+HcAda51zNxXn8YehJjo3
 fVM/2xw0V3VxjZXT0Gg==
X-Proofpoint-ORIG-GUID: 6VlLmkJNMdolPRwaydLsQ_bhEHrxieNI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_103540_474201_198B58B0 
X-CRM114-Status: GOOD (  21.28  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 23-10-2026 12:31, Aaradhana Sahu wrote:
> QCN6432 is a PCIe-based device attached to the WCSS Q6 processor. It is
> registered as a platform device (AHB), and remoteproc APIs are used to
> boot and shut down the device, similar to other AHB-based devices such
> as IPQ5332.
> 
> However, PCI APIs are used for device setup and register access. Since
> QCN6432 requires both AHB and PCI APIs for its operation, a hybrid
> AHB/PCI approach is implemented.
> 
> Overview:
>    - Patch [1/17] adds DT binding documentation for QCN6432.
>    - Patch [2/17] refactors PCI operations and MSI config structure to
>      support different MSI configurations.
>    - Patches [3,4,5/17] add hardware parameters, ring mask, and registers
>      for QCN6432.
>    - Patch [6/17] moves multi MSI vector flag to ath12k_dev_flags.
>    - Patches [7,8/17] add hybrid_bus_type and HIF operations support for
>      QCN6432.
>    - Patch [9/17] adds support for unified data-region memory allocation.
>    - Patch [10/17] moves MSI config to pcic for better abstraction.
>    - Patches [11,12/17] enable MSI interrupt support for CE and DP rings
>      specific to QCN6432.
>    - Patch [13/17] uses CMEM write for PPT on hybrid bus devices.
>    - Patch [14/17] stores and uses per CE DP MSI data for QCN6432.
>    - Patch [15/17] derives QMI service instance ID per protection domain.
>    - Patch [16/17] add userpd ID mapping per device.
>    - Patch [17/17] adds support for QCN6432 in the driver.
> 
> Changes in v3:
> - patch 1/17: Update the commit subject and change the file name.
> - patch 3/17: Initialize qmi_max_chunk_size for QCN6432.
> - Link to v2: https://patch.msgid.link/20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com
> 
> Changes in v2:
> - patch 1/17: Update the compatible string from qcom,qcn6432-wifi to qcom,qcn6432 and remove the | character.
> - patch 11/17 and patch 12/17: Fix resource leaks on probe error paths.
> - patch 16/17: Move the NULL check before the loop.
> - Link to v1: https://lore.kernel.org/linux-wireless/20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com/
> 
> ---
> Aaradhana Sahu (10):
>        dt-bindings: net: wireless: Add QCN6432
>        wifi: ath12k: Refactor PCI operations and MSI config structure
>        wifi: ath12k: move multi MSI vector flag to ath12k_dev_flags
>        wifi: ath12k: Add hybrid_bus_type in ath12k_hw_params
>        wifi: ath12k: add support for unified data-region memory allocation
>        wifi: ath12k: move MSI config to pci.c
>        wifi: ath12k: Add platform MSI support for CE
>        wifi: ath12k: use CMEM write for PPT on hybrid bus devices
>        wifi: ath12k: Resolve userPD ID per device
>        wifi: ath12k: Add QCN6432 AHB support
> 
> Sowmiya Sree Elavalagan (7):
>        wifi: ath12k: Add hardware parameter for QCN6432
>        wifi: ath12k: Add hardware ring mask for QCN6432
>        wifi: ath12k: add hardware registers for QCN6432
>        wifi: ath12k: Add hif operation support for QCN6432
>        wifi: ath12k: Enable MSI interrupt support for DP interrupt
>        wifi: ath12k: store and use MSI data per CE and DP interrupt group for QCN6432
>        wifi: ath12k: Derive QMI service instance ID per protection domain
>   
>   .../bindings/net/wireless/qcom,qcn6432.yaml        | 149 +++++++
>   drivers/net/wireless/ath/ath12k/Makefile           |   2 +-
>   drivers/net/wireless/ath/ath12k/ahb.c              |  54 ++-
>   drivers/net/wireless/ath/ath12k/ahb.h              |  10 +-
>   drivers/net/wireless/ath/ath12k/ce.c               |   7 +-
>   drivers/net/wireless/ath/ath12k/ce.h               |   6 +
>   drivers/net/wireless/ath/ath12k/core.c             |  10 +-
>   drivers/net/wireless/ath/ath12k/core.h             |  24 ++
>   drivers/net/wireless/ath/ath12k/dp.c               |  39 +-
>   drivers/net/wireless/ath/ath12k/dp.h               |   2 +-
>   drivers/net/wireless/ath/ath12k/hif.h              |  30 ++
>   drivers/net/wireless/ath/ath12k/hw.h               |   8 +-
>   drivers/net/wireless/ath/ath12k/mhi.c              |   4 +-
>   drivers/net/wireless/ath/ath12k/pci.c              | 111 +++---
>   drivers/net/wireless/ath/ath12k/pci.h              |  21 +-
>   drivers/net/wireless/ath/ath12k/pcic.c             | 435 +++++++++++++++++++++
>   drivers/net/wireless/ath/ath12k/pcic.h             |  24 ++
>   drivers/net/wireless/ath/ath12k/qmi.c              |  83 +++-
>   drivers/net/wireless/ath/ath12k/qmi.h              |   1 +
>   drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  45 ++-
>   drivers/net/wireless/ath/ath12k/wifi7/hal.c        |   7 +
>   .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  85 ++++
>   .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |   1 +
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 143 +++++++
>   drivers/net/wireless/ath/ath12k/wifi7/pci.c        |  22 +-
>   25 files changed, 1214 insertions(+), 109 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

