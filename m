Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBAECD98E2
	for <ath12k@archiver.kernel.org>; Wed, 17 Jun 2026 04:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGtFzS5K7FSIjPV/USiU2uAPspsmavcgKmt4Zb4HTBI=; b=eDhtasiY3IpkWUEWMYW+e9e67p
	BT6RRhPfDz+wV/V61sLrudJSwEyiwYuQ4q595BKlQDBhPVYwBZopP/y78bB+SqYcuSHmkxWmXkr4a
	BCRq4cLEvDE7QM3Ek78laymclVq4baby+OSa2ucSCWGtxokcnfTTO4PEKcQlVBy0vieYf2l/zq1cN
	PwlijYueRILd37cCG/Z09YFmfpeIoPZ0uLcknBNSpGTYNi4lyLhDHylc1Xu1pWBy7gRmurqeJPA2V
	0JaTXf7Fk6laQox0csBgNxj7vrgLNeg6AmGTK2ZeHUCMFD8Uv2z9yrtjDLPwIGy4sN4cbpkKsZPxL
	wJvn9o5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZhYY-0000000GaQx-3oHy;
	Wed, 17 Jun 2026 04:07:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZhYV-0000000GaQE-3wB3
	for ath12k@lists.infradead.org;
	Wed, 17 Jun 2026 04:07:13 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GLTfsT605859
	for <ath12k@lists.infradead.org>; Wed, 17 Jun 2026 04:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bGtFzS5K7FSIjPV/USiU2uAPspsmavcgKmt4Zb4HTBI=; b=i0HbIFaUuuKWiuIS
	EAtVy9U/ebi603qhUifaU3YyTebHMUtrjjVaWfTvau4KV71ssiKrYlMBKdeio8nL
	Jtlr3He8JAo7nC492mtOK44srv+cumvl+viKcq/ySYyGTrZ5xlP4fwErazAZHaAI
	P0jIRfITcWSEoDTDDBjvIp3JceOpnjkjUxXgbbXuGptV+M52eObYJczZ1hoKEQ7z
	G+Wv72CZ82QR/eh/0QPejQtLBBCBqdqYRFpN6M3eE1vP0n3Qjc+7VeQSd7V0HPXG
	NqZ8KPhKoS1ZUcTLLq+c23nUKATh7RMvflp1jbn8uwSAvNxi19K2oIx44qOK59Rd
	RkBN2g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euees98pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 17 Jun 2026 04:07:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8424aac207eso5117511b3a.0
        for <ath12k@lists.infradead.org>; Tue, 16 Jun 2026 21:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781669229; x=1782274029; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bGtFzS5K7FSIjPV/USiU2uAPspsmavcgKmt4Zb4HTBI=;
        b=j5qhfXtFUtKjaSGVwXmiTZj4Edu9VMf9PtB8NUKTFGRYgV1AR0mZ4NfV52cDhGP3HD
         LYKWb787cCffpKW6E+hoRIj2dVCxCmq3Kc2G6NvAQ17oAw8ELhqsOH+zi+KZiDUU0giU
         QaYs1NtjPTdNIMZ3DGRnB0EatjeWL0dsncUW11Wt4RPYjD/olQmGAs0BBcKP4IsV/cCg
         OGCJpHCfNXJAJav/OFOeGmoyn/Yyt2I9l/acVi2svV8lFVufjF82tGyRUiiSlLyALiaW
         Ff6kTH5V8blHcoi4bdObCcewG8n77ElE0YxaCSzfBFEKHNnbotcLAUjxqc+ftacQ+NJP
         cj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781669229; x=1782274029;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bGtFzS5K7FSIjPV/USiU2uAPspsmavcgKmt4Zb4HTBI=;
        b=W73Nx81jfhbl4AP+VQvBPBLmpjmzXCSmcBmBB1xc+8ccTSB0fPGOZk2/bx6LRtnPHv
         4ZQR9OqfhKP8uJc4YhXS7mUSXBEh2wRXxoZgqsW59oqfHXrYMktVurKxBYBDX6d1X9aV
         zymTI55R4vyuD9CxsYDl0P/SX0InQ8nfwQy2Cr+A1eZdrVQcJMG2scwVOibxs+IEXh0X
         v0fh+yCN2vnYjVn9fbYIubHnpVrnBK4Q5mNrYnQIcJA47ESHReFLcIZXr0niM41g+Izq
         Tsluyy0WDFwNOfhscV+MrBbyQRkZ5EBySJElFvNKAANtaxO75p2jlTPjX5NXxplCsJjq
         EVPQ==
X-Forwarded-Encrypted: i=1; AFNElJ80EGBqEVjlCaQFCDcL5/HhiRCsFdwahY2xygTVY+XAQu9Hyq/YT+981QSi6L0ggb6S1Lo/yBQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyN8IrjXT1X6kQDuWG3OM+UrmtKbONWBJMY7b2h1bW/WT5+iSjI
	qGsY2gkkEa7X1CbORdCC4Qm5bnP3ETBBCL8gvsDdp8d3TvQ/1y2TI//Zrzb5pmMVIbhNb1WkUWc
	Nhu40FSbUek1wgZLUGCOtBmf+5Y6qz5zTNWk3hAMMT+deKROTdV0oeznRx4jTn0nT
X-Gm-Gg: Acq92OERkKFLYzyEE81z51N6mLdSIYx+yaCBnM76mp33sXGWFyFVol32eZ+WELQ0lWU
	SsuPNfxAXECrofMIKcFjiN2aN7M+8DQxeoyo3n6gt2mtmHsqFbsbdJrlpDVm207GX654cH0+JYX
	ZBtQinvn175xHyWNRgykevHP1IxNToZ/GASXykW14BPmd2AyQ1BQkvfcJrpc8/KR0s+8P8NNQqM
	quuxXTRl+m1x3DO6JWQaN50LIbcKHkLeAW/RjbqkPx/DEf3XUOFBuGITxgD8RzoaeT1UW6KGOZK
	iOEcxG5wHo158e6i9i1sBTiE/gng80r3TfdAsG38XOE6vxaRtcdbf77eYf+dru4gLzYUvj4o8lx
	VYc0AVQyX+KzDW/8KL6B7mF73ucaSTeRiDnLDgT08omlSJXaeGaA=
X-Received: by 2002:a05:6a00:2d21:b0:842:380a:1ee8 with SMTP id d2e1a72fcca58-84524464424mr2010150b3a.17.1781669228872;
        Tue, 16 Jun 2026 21:07:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d21:b0:842:380a:1ee8 with SMTP id d2e1a72fcca58-84524464424mr2010118b3a.17.1781669228408;
        Tue, 16 Jun 2026 21:07:08 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afd50f7sm14044351b3a.35.2026.06.16.21.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 21:07:07 -0700 (PDT)
Message-ID: <07b84480-6cb3-4746-88d0-fdf99ccc18be@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 09:37:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: expand UserPD ID mask to support
 up to 8 PDs
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260604031551.4178754-1-aaradhana.sahu@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260604031551.4178754-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDAzNCBTYWx0ZWRfX73RuItymkNYf
 ekbxRaZjFiQgYucwnzykWEZCUeJs3J6HP7cYTAnv/VPDlia9cFp7TWrugcgn/fouZ1e5Zrxfodd
 zVxR+73DUaZOsDYr9EUxBDqQRSp+lLw=
X-Proofpoint-ORIG-GUID: BbBiPxqnOll-AfB1H9WktQ9Rqy92lXQ8
X-Authority-Analysis: v=2.4 cv=R6oz39RX c=1 sm=1 tr=0 ts=6a321d6d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=qcwypVmIGuKwP8SevUEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: BbBiPxqnOll-AfB1H9WktQ9Rqy92lXQ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDAzNCBTYWx0ZWRfX0eHgJuVVLx+f
 y94L/pv68dt7tB2sn4fzWiwgBIFMWtbByzUbO+plhamcrIRI1vmBdNfj/ESuutZbSHQEsgKXc/x
 fZJmazpvIpjidpKQBEtRETi3gaqLCntIBe2EzQc+ysAjNdPHZg/32IO0xOProEkT9zzkEfObSE6
 mJjBKc88xFWFFqEtWnmrZlhodCOXRRqwmwLe8sQKO8frzECPjb4G727MR5/RWaPOYnvDjmVvR1J
 g6btidhx543nxu/kkZyJImqE8wHIK40XR39GPzeOF6pI4DIYSAAnCgrZTmxrSXKoQ1QZ5B8iNoS
 WH3Aq31f1SdFt59ZuNL2ocXxYc7I4U3QYwZjDNBnOSQ2jDRRqqwMrrud+1iJtBQiUCJ0jTYFu8I
 iUZfPPi0T+LFW2QOklx+tCa8Tr/smVzg0+DJp5gpADuLMYBj0tMS9AiljDe2GuRemFMkourHWYA
 qRQCU+j4VeooOxtyG0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_210712_140087_23FCC7AC 
X-CRM114-Status: UNSURE (   8.82  )
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

On 6/4/2026 8:45 AM, Aaradhana Sahu wrote:
> Currently ATH12K_USERPD_ID_MASK uses GENMASK(9, 8), which defines a
> 2-bit field and limits supported UserPD IDs to values 0-3.
> 
> Future IPQ5332 multi-PD platform variants support more than three
> UserPDs. Expand ATH12K_USERPD_ID_MASK to GENMASK(10, 8), increasing
> the field width to 3 bits and allowing UserPD IDs from 0-7.
> 
> ATH12K_USERPD_ID_MASK is currently used only while constructing the
> ath12k AHB PAS ID, so this change does not affect existing platforms.
> 
> Also remove the unused ATH12K_MAX_UPDS definition.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

