Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7BFC36002
	for <ath12k@archiver.kernel.org>; Tue, 25 Mar 2025 02:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gx/bcLzLApCrdO46UIL2ys5ZobL4CJdbfiEVJVfa6F4=; b=g4iLE7b03Vhvk7H5wYh1UiMRtn
	wwU+PEnCtSPUZiL7mykwGlkVNRUxlgLBQqm9V/Lls4BUJW8jHIe9kEy2J49yB5AGXMo4Uc9xOU7ek
	wkMUEIqR1EUYrkIyemN9iMmuW23IV/zG1JBQQsJDXwKEsd29od7zKe1IhJOaBzmW6CKuFJbWYF4iR
	GQendvL8JXLzlBU0faihM17wSh1BNLLoITpmPg/JKw6davOTmMejzZdGU8+EB2cvIdRMQHxeE/V4p
	mRWjuP2muFUG5gL7s42xivbWFyUUruG/GC5LqSGKZIsNylWMLXg4t46sVQ3SuW5oXlCqju9Ktc3p2
	LN0bNTwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twu7p-00000004h5p-0bmb
	for ath12k@archiver.kernel.org;
	Tue, 25 Mar 2025 02:34:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twu7m-00000004h5E-2mJT
	for ath12k@lists.infradead.org;
	Tue, 25 Mar 2025 02:34:44 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52OJ8BCZ025888
	for <ath12k@lists.infradead.org>; Tue, 25 Mar 2025 02:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gx/bcLzLApCrdO46UIL2ys5ZobL4CJdbfiEVJVfa6F4=; b=RhG+Vl8EVG3inXdk
	0yEfwdwx3X8LlqrB1zyFv+37Ym4ZIZ2U2jhbi8T5v0Yw8jHyVhcx0WEWTfuHT++G
	US+7baehmnLospdL89Xi6FDyQaNOp8qy/akvqSEl3TgpuiEnpByXY/c3kEaYMAqS
	bcI00W24jDadXE5TxEHe/BiM5sUGSViZtK96NCZXtwKMhdqXe+I8gEfe4VKpHHK6
	23pW8eC0uQJ8YFJmqOFM0tPDCmFhU2SSBftjHsccQ0v+C7hGA2qK27P/ZP+Vf4Zh
	+MMP71sHZuGLrjcQ8u2XtvjCcXHIVj9/NbMKNFIlIGWdQlNObUzZrn6pHyo92+OI
	LlFeeg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hjjnpep3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 25 Mar 2025 02:34:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff798e8c90so7934788a91.1
        for <ath12k@lists.infradead.org>; Mon, 24 Mar 2025 19:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742870080; x=1743474880;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gx/bcLzLApCrdO46UIL2ys5ZobL4CJdbfiEVJVfa6F4=;
        b=RNdxelwUflFp5XjcC3josaDxOke3WwMkaEroez+IoHhY5vroOevZEEo9sqhAx2KZHh
         vnmc/CgLN0HQpppfP52B1p9cMT3hYkPxHamqN/nnIku3WHd3S3NpLC4813F4QBgmme2s
         u9gs5gcSs9Ryr/kEBtUsbdN3VqDYZK3kKfWr9IO1NvqQAaiIdZNoRmBzSgW+YftVAG0U
         dMJh6QacyMIl+wFmMmHIeudmWeJTIMWGv4vUcWMy7CsOLGB1HjuEvwLj5wDdBuYDH2wT
         2hhyKfhE+idFRRKzBDT8giLTcuPyDlcBugXobf2YyTzsPzYi8vj1i4USUzzgXjYwhNnS
         Y4pA==
X-Forwarded-Encrypted: i=1; AJvYcCWT9Z6S/JzyW7pDHCydSPQ8sNh4GHLFxjPyobmIYimRkvzq/mcUnXtPlRZGVV7Hijr4iVjxZV0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw81QFnHn9VuyKOG4FSDsv9ZLMDJrEcSLDxmegi2iCUZAbvRvmx
	MMSxovhNBqd78fq15fz7SJPDomju3FXncVzEtTGWQ867HLCfufmdB5LSRHbMYHqNptf8pGQQvbk
	EreovgzNz54uPXtphY8d75nTQ2d4pOzahLeU1WR+JHJ1/qTVh73or3zTpeokE
X-Gm-Gg: ASbGncsVoaYUy97+C3Eve/eujP91vNwm/Rk2AhXGjnHC+CNeVfsCH6kR2VjqC/CRnUv
	F3S6MD15SIFFmK20MPb1dd7CMEawUpcEgEzmZ2Ap5K1coWGOJdX5tkpyDwlocnmIoi8McYZwG+p
	aflkxin5ODXZaSUaenx0ZH5lEAwD5MKXTNoMlnFEjjc1vQlNTHn2WPMWJysWLw+vgkNnJGVdpSo
	v/R4NeEEBhku05fKC/IngJGbunoJDCOihv68nxhLnidolRHX/ghuAvc5ic/tk83YmfKiDmzWe5y
	h4xZ3ivRU0fkq/rg8x6h0CsHHnKjC9JZxIVXvcpohMsQtbT4TLdeihu07e0jfIA=
X-Received: by 2002:a05:6a20:430d:b0:1f5:8d8f:27aa with SMTP id adf61e73a8af0-1fe42f08eb7mr23764444637.8.1742870080245;
        Mon, 24 Mar 2025 19:34:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAAi+oaCdrO1YOyjbRYM3m591RUcKPjvpOZnwOZMak4jHmmX1G35XNMN+4j8+y0CsAIx8bLw==
X-Received: by 2002:a05:6a20:430d:b0:1f5:8d8f:27aa with SMTP id adf61e73a8af0-1fe42f08eb7mr23764415637.8.1742870079856;
        Mon, 24 Mar 2025 19:34:39 -0700 (PDT)
Received: from [192.168.225.142] ([157.48.120.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390611c7e5sm9157000b3a.99.2025.03.24.19.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 19:34:39 -0700 (PDT)
Message-ID: <807477b7-aea9-d4f6-6d69-3b5eae272867@oss.qualcomm.com>
Date: Tue, 25 Mar 2025 08:04:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v12 08/13] wifi: ath12k: add AHB driver support
 for IPQ5332
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Balamurugan S <quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>
References: <20250321-ath12k-ahb-v12-0-bb389ed76ae5@quicinc.com>
 <20250321-ath12k-ahb-v12-8-bb389ed76ae5@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250321-ath12k-ahb-v12-8-bb389ed76ae5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fNc53Yae c=1 sm=1 tr=0 ts=67e21641 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=XdtSFjId9hQakZAf7T/01w==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=cKnEvPqYOVkaVG8RjQYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: lDLQD3Pg44VOxihUDrVRxoKdpU_ThX-W
X-Proofpoint-GUID: lDLQD3Pg44VOxihUDrVRxoKdpU_ThX-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_01,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxlogscore=786 priorityscore=1501 mlxscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_193442_837708_7C29E15A 
X-CRM114-Status: UNSURE (   7.36  )
X-CRM114-Notice: Please train this message.
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



On 3/21/2025 4:22 PM, Raj Kumar Bhagat wrote:
> From: Balamurugan S <quic_bselvara@quicinc.com>
> 
> Add Initial Ath12k AHB driver support for IPQ5332. IPQ5332 is AHB
> based IEEE802.11be 2 GHz 2x2 WiFi device.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
> Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Co-developed-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

