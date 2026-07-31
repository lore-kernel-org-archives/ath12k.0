Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2811FC5516D
	for <ath12k@archiver.kernel.org>; Fri, 31 Jul 2026 10:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2CdYWIKWcB88Y3bsnqJ87C77pIUShmn0LngEmE9aK4=; b=WIb4O8ZcXGacE8RWRu22+2+IXq
	TxjhjhhVbfZV8FOs9TqYCSI9/r47TLRNgevsYCo/P+4PGoluAUenzdiU3sG9f5QiJPirIguX8rYXy
	iWNodve9xaJqn09QpU5SEgEBz/T+3Wt5qN1muhIKa1e4yTYhFpLZY7Ww29iiqsdHe5QydjH+K8vhZ
	pMJKfEeIs3J1XFvqsXspK8RkP6bo5WI1ijA0a+qg9pZSUVLeEYFxfTyml15mxpEXHTd+6DjUZwvJB
	RPtRo5aG6IJPfe2KZe8eXFyDROzOqC0z0Nn+2pezfPberSQBvS8BnEzS/E4f8IRWBn+xMJ97rmR4/
	pOdfk9Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkeh-0000000CLJg-3WHV;
	Fri, 31 Jul 2026 10:39:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkef-0000000CLGB-2iXN
	for ath12k@lists.infradead.org;
	Fri, 31 Jul 2026 10:39:54 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VAbY2m3946961
	for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 10:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N2CdYWIKWcB88Y3bsnqJ87C77pIUShmn0LngEmE9aK4=; b=hFmR2MMCt92O3QZn
	q2f8jOwrOBf3gkjXuCOaG2YCX+st7Wv6aEHuHXD0t797IDDeeyhken7I/jYVJR9M
	YRQ1xWSpyewsqTdi9uvjaTKAMrKmC3z3O/FI4WDIiUpjk4UcdHh4NtJvDYWcx+Ms
	Eh+2y//OFG4bPibDKaLQNj+1j9EHqqBDqDLUdCIQhvp1svNS1BD8bLz8N0AAiJCE
	t892DTjy5t3f+mrzMsS2sZ3ymRF7yxG391q4T4HyJ53/Bq2sjsjRVXfUpQiG2/BM
	LGMjMx4SuMIYcGPJAp017Q+1D7zdTmcnHDi4DWVHMmV8DznQnLg5HrBna10fWHMW
	kpLFOQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frt490099-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 10:39:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee894b3d8so15092855ad.2
        for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 03:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785494383; x=1786099183; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N2CdYWIKWcB88Y3bsnqJ87C77pIUShmn0LngEmE9aK4=;
        b=JjYBmFw0OxQfKiH46r1/HEA6dx1EcdBAwKk35KUMpLofM6ee+BT1sPtC/t2W3KU6FU
         zOCiHvJgzyAPi172/3gBnHnxecIyO7HJ437RvJe5D7poE03mAlfRJt9qpZx78ZFhfK0C
         HDKVPQIdv2rnM2QEPxD3YgLk7HbXj7nsLgoMhhBp3DH8MIm1Fw0908uGYo1Kco8Uuo77
         hwTx+Wy7T7b+qVGxgV7gfoXNQnXhtNkMmcqWJyGr4Ac2hsOH6eEsc3lvyPJO+N8ttsX8
         dcQPJMuMdd0F+AOvIOaZRm+KEQ8qbfeSTi6qN2VHYB4Qm7PgbeYDMsUBnb0AiwFoCuUn
         tkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785494383; x=1786099183;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2CdYWIKWcB88Y3bsnqJ87C77pIUShmn0LngEmE9aK4=;
        b=EphDYx7+OHdpH9uIOnjeNmtiay3QEjdoCwD0DuoZ+BFhZV7RuSlApz4Cp8xV4J6I7D
         xXnjXsE3NWd7dBb/FXIjEcWwT5v9XXLEXts4h+Q/ubpkMBUWRy7f3JsXHXW1FAfG747T
         e0+hsQmvDqOtvf+ADbDf3EgmI2s6o5kFyzl2AAOOfZUtrmZfkkD48jqHfqqZNZtaUPyl
         3Bc1Ub/Qp00jdPEIcQBflWAqxiIpspjfRvvaHsTYryQ7q85cepsMJCJzX426P1V1PpYz
         nwZ5dQ5csYWzZqxZmG1D4Aeq4GIns7Jd9TXAPOvmeIzf9Nz6zjKZulCk+DsXnOtHY+n5
         lq3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpuoyUoE6PPAoLVOSQyFEEKkuDwqmPGfbrdVDeenhAC/GP4+1j7HPDOEnIhfaqXea2/IwxyOuM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOjQ69N9pEpYXhf0b0CLUPv4JdKyLTtvKuTh9dW70apm2ZbXp1
	2IIV/GTybyFcXFyOceU3nz0qoXVSCJ+vMULnG0/EKgFbWscaW7xZEd4k2n4jK5/qu2pLQ0BAm7+
	V0KwComhipBEhdHLAm5hUlm9miCgSgf7NFDIVtF1auJ0t5H0pGNYVLJEwwenowZQk
X-Gm-Gg: AR+sD11/Hm55Hooc9YtD09lBYt3D6USRlHJJiaDZN1+yE/gDjFDG9Vh9qJtVMtEnKeg
	ZRLUUb8M+yuOWP0AfQqnv2uqZ0gRdmmVwi2kZbOO/3KPWdujCZCp+I3UFWQj8eVuP/2awfXAxvC
	OF3G5T+qsdgQhXlz1SneSZQHzUXhN462qxnqLrQ5jHYTnCPbkCee0ihrymqiV2MdEzNZyemuwKz
	cotLgw1qX+S9R0FPF4euSvkLYVpV2vY2nO4W5nriSIBgXsqP39EcavcKD+B9eAMleiwXm/AeSzx
	U6ZlAljjoF7k08qDO1drolelQXFLOe/hsuZqs7Jp9sfNkbEfU/R2bI2vp4ZmTtEz/+7TFXJr9r0
	nSpvjaaNVyeoQ/WpGzykU0cwnYstI
X-Received: by 2002:a17:903:1b48:b0:2cf:82e6:a5 with SMTP id d9443c01a7336-2d046da2c52mr15477495ad.13.1785494383447;
        Fri, 31 Jul 2026 03:39:43 -0700 (PDT)
X-Received: by 2002:a17:903:1b48:b0:2cf:82e6:a5 with SMTP id d9443c01a7336-2d046da2c52mr15477275ad.13.1785494382973;
        Fri, 31 Jul 2026 03:39:42 -0700 (PDT)
Received: from [10.152.194.17] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045016sm7903298eec.19.2026.07.31.03.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 03:39:42 -0700 (PDT)
Message-ID: <11254acb-eeab-4c1b-b940-8fc25a1d5e25@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:09:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: fix encrypted EAPOL TX in encap
 offload mode
To: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260729171732.668367-1-reshma.rajkumar@oss.qualcomm.com>
Content-Language: en-US
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
In-Reply-To: <20260729171732.668367-1-reshma.rajkumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oQO3SwevcdExENZhibKb0yolAKn4052g
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA3OSBTYWx0ZWRfX1R7bDumZRqHS
 rc9rMHT0tVLNvPf9lh6UngHXoYIakNWamKpOBUAidAb6gNDa+vsPtp1ebem72KMAkhtWSag3+ua
 +yB8Q25SkJU95egUwCP/tEdTyqiyQuY=
X-Authority-Analysis: v=2.4 cv=Zpbd7d7G c=1 sm=1 tr=0 ts=6a6c7b70 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XimLFvTEBuXuzLDNtLAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA3OSBTYWx0ZWRfX2AV+UoaHqbcL
 +5WbmwlnGzd3sjG8Punh+havHhfADpzaSD2KAwC1PkWeu1Z1k90wLpQqC0lOuBuKBumeEZnvV+1
 LnOllpNB7FcawW1UgylUcEVExOOn4JxQ1BivPbqSZUq6hJkRPSfZRaIci28Hx5ntgSMDwGaXZEH
 TJTbpKTjlo/Jj0YZ4Xl2rNA3GGhET4PaMWVWcU3uPZPDp5b7B4eg90eN6Ly5jX2qQywVGMt5uZK
 gHZgGuQuRyMVX3z2p2K4wBcxkbOFzzQTgzKPF7yCEy5ikEoKZfPQQXSsnCH7nBStczJgLcdYFqO
 Z3ZXpxSHCdgsFdoyKwYJ/t39/xfa5EL8cpDnEUNWZQ85KLGmIgEkHtZiRnjj7qCjQpMyvItaUDf
 SNhz3u5zi0ZFKjZcD9um1pzs7k/tdnKehNnu9U+y2xrJxLMStP4+KYLHMoFYLedsAiN4l0UJ86l
 mtb1cXPGdMDUZ17r3pA==
X-Proofpoint-ORIG-GUID: oQO3SwevcdExENZhibKb0yolAKn4052g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_033953_701498_5A696992 
X-CRM114-Status: GOOD (  12.43  )
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



On 7/29/2026 10:47 PM, Reshma Immaculate Rajkumar wrote:
> When a vif operates with IEEE80211_OFFLOAD_ENCAP_ENABLED,
> mac80211 delivers EAPOL frames to ath12k in native-WiFi format.
> 
> Unencrypted EAPOL frames used during the initial 4-way
> handshake are already handled through the existing
> is_diff_encap path. However, EAPOL frames transmitted during
> GTK rekeying carry ATH12K_SKB_CIPHER_SET and continue through
> the normal native-WiFi transmit path.
> 
> Firmware encryption requires RAW frames with cipher-specific IV and ICV
> fields correctly provisioned in the skb. Passing encrypted EAPOL frames
> in native-WiFi format results in incorrect IV provisioning, leading to
> an invalid ICV and frame drop.
> 
> Fix this by detecting the EAPOL frames that need HW encryption and
> converting them to firmware-encrypted RAW frames before transmission.
> Reserve IV space after the MAC header, append ICV space at the tail,
> select the appropriate firmware encryption type and request
> firmware-side encryption.
> 
> Introduce ath12k_dp_tx_crypto_iv_len() and ath12k_dp_tx_crypto_icv_len()
> helpers in the TX path to obtain cipher-specific IV and ICV lengths.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01270-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d29591d5b52e ("wifi: ath12k: Advertise encapsulation/decapsulation offload support to mac80211")
> Signed-off-by: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>
> ---

Reviewed-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>

