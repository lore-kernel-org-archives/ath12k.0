Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D44C282EC
	for <ath12k@archiver.kernel.org>; Tue, 18 Mar 2025 04:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1ZqIRlo/bjZwLlSypjNHtK2fYpTyQL7/nn4I11gbjo=; b=ys2SagpOf2z2GpyC3fthH2NIwL
	9byUbUq9nMLbGMKdK7pzHHOlgF5WfYfKr1629mBPvFIbwridt49dbz5LpruXKafP+/xe3o8RA3ww+
	PvdcViyJVqtELWHyvRUd186sbQ/cKlTIunXGx7T4qXpWsX3lReG0pLAxZnNbnVweEYl20t+GD26f9
	HL8LB8H8H0ekPl17Vrean9nhmZzQzPowIzayJ0R7Awy9WAfOcl0UnvZnK5PgfuQ7W+08e5XlRM3h/
	1gSeVEwhGnzmApd11zR05ZMVO6cbgKw70Cu2+39p5hNoy0xRFNlA8Zk65sxpyYkqK4MTaBgcoA368
	Kbo7Ehzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuOEd-00000004bX2-0h9d
	for ath12k@archiver.kernel.org;
	Tue, 18 Mar 2025 04:07:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuO9C-00000004ase-1ni1
	for ath12k@bombadil.infradead.org;
	Tue, 18 Mar 2025 04:01:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=g1ZqIRlo/bjZwLlSypjNHtK2fYpTyQL7/nn4I11gbjo=; b=U2t1rTxZSlR9R1eo0UOf/PP891
	aZfFT6ZPBc2yOF/Eii/oiESE4R1UvjTmdLWSRa3AeFxMRvlrnFrcXXa/ZCNOes8X6mSqP11F0bBAk
	nWStdBlDC9blfkVvccEgtor6Z40sXmTyD51QnCsXGMmyViuIUQF4BMGcOqb2Jr1lZ/CWbnA49tLqF
	TALm11T+aSP9/miymxJg+FVI4wF+lhYGKJ8s3WK7hvJH710HIR2j/SF6SfezogJyWIaPujaGuqv8g
	4dhlHVhCnmZ4DHonp8dWuhM/JSF/lVbr51TePbR2DLDRSnLnHlF4eujaTmrTCpaZ6GwPii3nMAIw8
	ryXWbUJg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuO99-00000003ebJ-1B9m
	for ath12k@lists.infradead.org;
	Tue, 18 Mar 2025 04:01:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HKGaJW005608
	for <ath12k@lists.infradead.org>; Tue, 18 Mar 2025 04:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g1ZqIRlo/bjZwLlSypjNHtK2fYpTyQL7/nn4I11gbjo=; b=MQSK13NHPEK8SDpE
	xAKEdG4uPGbskufICjioOU0KUOOfBLo6CT29Iv84drktTJsv6TUBFxubRdBveUCG
	PBr2Fg3Pq2tlkrSMhppVgWFfDYj+qdezRDRTQPMNX2POsKFq67+Yk2z9p31OqEwR
	bM9Ul/Xu8n+cmk4BVCCV9vqbV7UFjDdjJSyUEx8cfOyJbuMviym11TWzNyTYn1l3
	p5NhQ4Nr1g4FR8x32TsLw+duu/AZtGE7X/N+70OxvQTmtnF+P/lpBC6PgiFoIdTw
	rU9qHDhPYXxpHrAWdESUntodTnXz6odjya7gpEU/W3zqQJprhYzKamB9pglRayw6
	9aCBQA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45etmbrxer-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 18 Mar 2025 04:01:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff799be8f5so4368758a91.1
        for <ath12k@lists.infradead.org>; Mon, 17 Mar 2025 21:01:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742270496; x=1742875296;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g1ZqIRlo/bjZwLlSypjNHtK2fYpTyQL7/nn4I11gbjo=;
        b=uu9O7VXxi+YN8Ronb0n0uDxTMB0jhXuXeGPidTlKuUIl57aTJhubFchfZc0wveQiTH
         9asTnXyG+6J2eIJP8fhoyTWN7V/S6nUuOyxq5b62znULBz+3ppRDNJ+naTJ+8uA7eDxd
         UdjL10c4lVozk+isdWk/hMAgWX+MWa6NKmeUTTiWm4y94TNzJEjxea/GafIbEzK7oUvI
         RfwPQto2qmct01SJEXBrOeYA+ec3o1pO2yzk8JvJEv1dxUGBPg2GnD/jTPFGtOi1PlHM
         fJFgby7drE62wfMsbuyAuJPPDBXOQVPGXSgwx2zJNKVBN7CQkGozHovps27XSDsnN8NK
         A+mw==
X-Forwarded-Encrypted: i=1; AJvYcCVxrt4gotNnAb7gmovV+OMHN6KoBykCJLIrhHALwcpOntlrFW7PkLJD1xEadPfQi2b1Gh1HwNI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5+e+DFqxMEzGeKSXKreeNJQC2mBM+4bcdedVTyr+0NCmokT/7
	I9pt63NWI0l8kgp5oAB99g47pdIlQO2uoyWUFLPOvTKUtmd99JUjoPupGpSfF82hJ6/9ri55XWd
	wcgWG55igO+H4cx6F57C5vZurQwcyKYTBVHaniUk3SkD/3LefypUjWgjOZ6Q0
X-Gm-Gg: ASbGnctcduZLA0agxzs6reOINNta6TDb+fqblIxwNdkiIXmOULfd7KMcflxG+a1XB/6
	M8GaiV+POU56ucTObMQmqk9379g6XBXL7X6Ursv8yxxYkhPomePEuoqrBfoWjiLkWcjZrOFskbA
	hV92cinjhDE5/uiPlV0rSpTYCyPojg+iPAjj2DqHFNYUo10KjYTWWxxxlFGxxh5wp8XUytY3U2h
	OEnpqGXMPcVtupF39/I2nRscE82eSL4wcpJ1Nii4JUoi2hvk5Rw6RPYaHx9q1c/QlNx+fGex6US
	pD3lx6sZCriPgxk1i/nFEed8fLVd4MowpWoHFXOD7pYxVCEqpY6R2PIgAg==
X-Received: by 2002:a17:90b:3dc3:b0:2ee:db8a:2a01 with SMTP id 98e67ed59e1d1-301a5bc0dbamr1228605a91.30.1742270496509;
        Mon, 17 Mar 2025 21:01:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9Edi3sDHHeZNXLncEXae5cC0YitCoPLeBGh6ElwofYcdSRsUatQjnw3qn2xTmbSGT+0Iy0Q==
X-Received: by 2002:a17:90b:3dc3:b0:2ee:db8a:2a01 with SMTP id 98e67ed59e1d1-301a5bc0dbamr1228565a91.30.1742270496046;
        Mon, 17 Mar 2025 21:01:36 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3015364ec9csm7864720a91.45.2025.03.17.21.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 21:01:35 -0700 (PDT)
Message-ID: <37a33341-a83f-6349-6bff-23b082aa46ad@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 09:31:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v11 11/13] wifi: ath12k: Power up userPD
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
References: <20250317204639.1864742-1-quic_rajkbhag@quicinc.com>
 <20250317204639.1864742-12-quic_rajkbhag@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250317204639.1864742-12-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oakEFVA28ToyLh7VgPGjvoWFgnLk6N2A
X-Proofpoint-GUID: oakEFVA28ToyLh7VgPGjvoWFgnLk6N2A
X-Authority-Analysis: v=2.4 cv=aMLwqa9m c=1 sm=1 tr=0 ts=67d8f021 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=WCMLO9bd9HEky8F4BQ4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_02,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=733 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_040143_630156_C5B51F7F 
X-CRM114-Status: UNSURE (   9.72  )
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



On 3/18/2025 2:16 AM, Raj Kumar Bhagat wrote:
> From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> 
> UserPD firmware image is loaded and booted by ath12k driver. Get the userPD
> memory region from DTS and load the firmware for userPD from pre-defined
> path into io-remapped address of this region. Authenticate this image
> using pasid which is a peripheral ID. Set the spawn bit to instruct Q6
> to spawn userPD thread. Wait for userPD to spawn which is indicated by
> spawn interrupt. Ready interrupt is triggered once the userPD is powered
> up completely.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

