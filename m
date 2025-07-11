Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3431C8303C
	for <ath12k@archiver.kernel.org>; Fri, 11 Jul 2025 10:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WRhs5SKtUrZ4bvXs7ueipxeY5Jhku5rft92ybHCVSDg=; b=WZ/2r61TjNmFX/8guYAQNNhxa/
	osObewzg2i6NErGsiAv8YPgxTbHYdRBD39lJ/I2I4noIEKUPfdnXcOcXwqRdOzY7+AmSTBdWIqVJL
	nuHNhkEelfZIR/bLD+pRM+bPap2T4cb7pJ47pr3yFfEeLyFlAkJRPJB6GAWfSYpi7kk5XLXfopcHk
	8e0CQQmwAPboPKKJkL+y8jXCFP0q3iJX1KJLAc+oCerWcMsAiLkskyN3NSWslxsrLu2cNaj02F1nV
	+QSt+utgXpVn6UhXWjR9hIEQk9UEbRAshzmhyJ79EBxGfS0X6sQJ2vrB5abYK4TMVkEnc5xhxlywK
	rkakJUeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaBQ1-0000000EXLS-1yqP;
	Fri, 11 Jul 2025 10:55:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAOB-0000000ENIi-0S95
	for ath12k@lists.infradead.org;
	Fri, 11 Jul 2025 09:49:56 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1XfLo008925
	for <ath12k@lists.infradead.org>; Fri, 11 Jul 2025 09:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WRhs5SKtUrZ4bvXs7ueipxeY5Jhku5rft92ybHCVSDg=; b=KK4lz0VjdOfaS56a
	Dzba0dZIE+UTgc8SiCcXewTv1jpOghxioMhN9laMKdzVbSGRrL0+G4wbleelaJpv
	NE5jlVa3P2wv5yuwCeHsRS6sLBIT1ZszN6QqbK7mdebpgpVeJfE8K1djnQaiYUo6
	AdIWu1Q/T95IIhfMweipUV2JZRfn5gfNn+CCM+qBEIyPlFHWJ0gICMJYX8p/6Jhn
	p5zZtS1hSdu502x//rZZc0xsimLgkWH1B9i157bqnoSnPSZeEta0b31Ja2D9y3rZ
	vUSscMM2QorgfB9OGr3pqGzY4pPfZs+dQ/06ZGxfB8BJaYFf1jRZf8K6S9uVTxUs
	H+1cXA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg849h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Jul 2025 09:49:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748f13ef248so1865489b3a.3
        for <ath12k@lists.infradead.org>; Fri, 11 Jul 2025 02:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752227393; x=1752832193;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WRhs5SKtUrZ4bvXs7ueipxeY5Jhku5rft92ybHCVSDg=;
        b=Z3rBY0itqTsl5tmKW3aalc2JVgzAeigEbEAhLX3Ugbx//J3VbVDDaxT2SNUDyew5hD
         PMk7cZHGa5YqTBSXDh6elEPHwpHFOKAqAMXS0AXkIFKi8i6uT0BUPuP/CZi8U76ELpTQ
         70uql9n1YqubkhQHpnRZrumA4edQO4iPSw3/a8kOVIWZDXZuTRRTtIpTdOci9lhUJjV6
         wiphuW2b/KtmRuTIqVRiCKFhqP16hAuyVQiZuoVlYESIElfX1afHsa3g7qcRsi6EQluv
         P9Eq9fcp9cUVrSJEv5XWnkOWn+/boGkBBHgkxHEov717yL/VRUdvopCo35vUttxlO0j5
         qj/A==
X-Forwarded-Encrypted: i=1; AJvYcCVEVW6X1z07jHp+7KBfNW9k14KzFbav2vGl86FqcsTOQp/aeJjfFAKVnp6XJ7k6O+ORiPigHCU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwMYIxHJbKiFVxXNQTGubhjX7NrxFeJh9PNhtGH+SV3UDAtuJbi
	J/wOg7qa6CF+cB92qOBZvww2MsxOs0pvi0Zh90JUk6gosUeyyIi2HC4JgS5nvuNj0aAcRFnctI7
	5cqJWzpHL94mqDgJkS2MGEkp35KGfQ8Ff4VOQhjISSnSLoEY8Lw+dKMmO4rpONWM6mcUsMEU5
X-Gm-Gg: ASbGncvpSj6Vhv8YddlhN33sjaCxqk/atdHXa4R/BW4j1XhOOQblOkFyG07DuByQ1/u
	7A6dlC6VNaWdb6H9ZV2nrgRjpQbb9j4cG5r9HyHcdWRNNwK5OqJFqW1cCsjfyW9f2XeBjyZDZY1
	qpMhdukjEiKZu5rdVjG9NEfjc4M0WEzDi7pjobM7dWmTzPgxrrzGbhCBeyL9H5od4ywr0XEVAfS
	AI7tgV4zq3LeMHXZRL7u2uzQZfca/hvSZmKTAOPQcsqoNbnYyRU+HI2FbjfSyp1U96jpKHCYipR
	5N5XyOQSC3YkbFXbnHPevz4a4xwZbeR3RP0b7oJXqDlcdOWekOYqn/z5HJ5l2kOISgR/MDFa1vr
	UnVRcJ7lA6qE=
X-Received: by 2002:a05:6a20:d489:b0:223:dc82:95db with SMTP id adf61e73a8af0-23136e6fa2fmr4153808637.32.1752227393321;
        Fri, 11 Jul 2025 02:49:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbH10SxfEWLFK0mnaKiBGnmC1/dgQa3l2D9Fk2Qac+/Eu/udUsVIFryyXJheRx0nLhChgAtQ==
X-Received: by 2002:a05:6a20:d489:b0:223:dc82:95db with SMTP id adf61e73a8af0-23136e6fa2fmr4153773637.32.1752227392882;
        Fri, 11 Jul 2025 02:49:52 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.107.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd7134sm5381734b3a.19.2025.07.11.02.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 02:49:52 -0700 (PDT)
Message-ID: <9f4e3b2d-5665-2c5c-2dbd-7b923d4a6b21@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 15:19:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] wifi: ath12k: Add support to enqueue management frame
 at MLD level
Content-Language: en-US
To: Roopni Devanathan <quic_rdevanat@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Sriram R <quic_srirrama@quicinc.com>
References: <20250711091704.3704379-1-quic_rdevanat@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250711091704.3704379-1-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=6870de42 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=46pNLmHVIUaJrpSFID5ybA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=gs4PZpNABTKqZCAykd0A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Qk9xt6OlW5bcflHDVv6zf_wOa6RxK-zo
X-Proofpoint-GUID: Qk9xt6OlW5bcflHDVv6zf_wOa6RxK-zo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA2OSBTYWx0ZWRfX/5lWomEwP0KQ
 l6+ouvu1TxW6wHXN+GwIVbkx0kp6cxMu+KkmlsPviQpu6L5QLPKoWTWlS5s2p1uNollbHhxlWfO
 tL/0HI3fscHlYayE7Eqa5RuetvB+lnSKMPZe9abZJDhyENV6Thc8CTayC+RSOShclfzVBQQRR73
 Jib4ZeeXpkeB9eUu9cJaUSkit4O5LAz3u4oZUniRxx8SVHf4kWFQxDS6gOYderbHIrWJFbJ50UR
 YTJ9HQC2xBAXpbnbaQWI3k4161KLH2uaQAEae9/qxX1vX9AGkLt1ejiTKlfq9bIoOGw1tt52ofi
 fJGv6C1PUVw3U649JjkvCCKrlEnPdiBx+ZXWiN7Gx9fSjcLVBvu8QQ2OjilRFKn052ZuZmf1GIa
 3glnv2apOYeVYecp08NZTXJ0H9r/UOo6T3W4ZntG/FCEJdNLml2Vp3+tM80t5FPreEYHR9eK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=850 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_024955_161153_270AA372 
X-CRM114-Status: GOOD (  15.47  )
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



On 7/11/2025 2:47 PM, Roopni Devanathan wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> A multi-link client can use any link for transmissions. It can decide to
> put one link in power save mode for longer periods while listening on the
> other links as per MLD listen interval. Unicast management frames sent to
> that link station might get dropped if that link station is in power save
> mode or inactive. In such cases, firmware can take decision on which link
> to use.
> 
> Allow the firmware to decide on which link management frame should be
> sent on, by filling the hardware link with maximum value of u32, so that
> the firmware will not have a specific link to transmit data on and so
> the management frames will be link agnostic. For QCN devices, all action
> frames are marked as link agnostic. For WCN devices, if the device is
> configured as an AP, then all frames other than probe response frames,
> authentication frames, association response frames, re-association response
> frames and ADDBA response frames are marked as link agnostic and if the
> device is configured as a station, then all frames other than probe request
> frames, authentication frames, de-authentication frames and ADDBA response
> frames are marked as link agnostic.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Co-developed-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

