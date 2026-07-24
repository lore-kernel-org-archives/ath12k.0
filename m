Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6FFC531FC
	for <ath12k@archiver.kernel.org>; Fri, 24 Jul 2026 08:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGyLS84ejhioARWgv/P3/vaYmUketyVVUtz32vhbnB8=; b=XL+2En4PaX9NR9jbdW+TjFr7Xr
	fuGx+p9DC+aW0vQsQTfrDwX79Rm/QgdoT3cef2mr2PZyYeasZzxTIXs3wNZ+D+uRy/BGUa9tBkId/
	UljqR9+g7q+oQh/z1Bamw1YW/4HYFoKN4CkQQGQh8AcE9zs9ZiVt7iwkz9C6mqCC6MxGNzpoEr4fx
	pgA+V1UHSmBAzNcpXOKhGBKTgIklF64IIJiDV0RT7cDgqUVv6XjgUoTFHArs2I4z+prVLufwwmp0c
	5DpUco7K0exlCeDSLQSBfs3fSvwmvm1xsM22Kq7Rx8Nt2aLAOwHDWyYGkDplsj3tkEZCt+WGqBFcO
	Wb0qCP5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBjb-0000000FtKm-2Rzn;
	Fri, 24 Jul 2026 08:58:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBjZ-0000000FtKT-01aZ
	for ath12k@lists.infradead.org;
	Fri, 24 Jul 2026 08:58:22 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O5xgor1892613
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 08:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bGyLS84ejhioARWgv/P3/vaYmUketyVVUtz32vhbnB8=; b=TxQbhnMpUqsVpjRG
	mFvUcf6XaYBElmCrd/oDLhOCcs/PW9oRJS44lOPTQLpXPSl+2PWldttIGYyUV7Xp
	3emNnbLc27/VZPLMG7Ls6PXbDF5Eoi57/fSCWVWY22hIe+Atyq5sxknussYDtBWJ
	ZeOxCr7Bn4xlDDwS7zqcTV0iQHltBGZBOMwS5oSWx7M0Kfp3fRq6UmJkVjWuO/Eu
	sMBA4/j/8VBiz7bq6OfCS67HboOQLo0QBpDOQNmdqBBqzsfmFLU2Zfno+MziIHLj
	lH+36YXi9QF4E/yPCW9/1Y+9SymmeXpHVVYdVbLkfx2IfdFZl1d58bqzwqq8VEQR
	u2UeVA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm2cx8ndy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 08:58:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cce14a21faso3696635ad.0
        for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 01:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784883500; x=1785488300; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bGyLS84ejhioARWgv/P3/vaYmUketyVVUtz32vhbnB8=;
        b=SfU7YVxOPucWNGzXg0FpLbokEp47mjg9qTJXUTO3q8f7B0kmQ3gw2SKhooirv1mwAc
         dY/gxgmGRPZ0kcsCoLhKkJPF2uwDeLiAj3HjAd+R2rtuW7+zIhboC5XgU3uZ5tQj6Ko6
         IjWB1TgwmuOpUHRbtNZR5WLN+Aph1u++t0Lw8dRU0mrrCc73PulBb9t8RWzIyJlCeYAp
         LqMs81ptGUdSY9Cy0wAKq/hZFz+HseA+CxlOZPIDxjL/g6YKI/vk2TjOY11o5oqv35V6
         /BIQt3PzsNt95Rh+dbJAgDeHUsDMh0qsylBs2kN9vDVSv525mq/Jl0CSxW/V5QiIUuI2
         FtTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883500; x=1785488300;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGyLS84ejhioARWgv/P3/vaYmUketyVVUtz32vhbnB8=;
        b=B1FpFXkFdsLDybc+K9QLYzNHqiaxt0G1wf7NBVpUFvpVUPF8nnZoFgkpB9NfvE4nnb
         CEm6yN8pFr84gAhuhcvjYxuqUORUIhDPCFylTN+jOwWjZnnyZ4bdEOyCT3yHANf8sl+p
         bm+oe5pXUOS+VKyFOwmZnMnjU82STWWghrZEFgCFcFOZIOpOYiM80BRj6jE4+gu/mOqr
         Lzz0/yY9SyKJM/j6n1ETLzzbnnysSFYb6IwZh16g0s8LWESEONChg3FlReZuc3+rEvQE
         nLKyispt/rLmF/h7STL7v+tX6qM2huG7/dwEvxa6ghVPmLSjlncchM14jFXt4+lI/KW3
         FxNA==
X-Forwarded-Encrypted: i=1; AHgh+RqHtfOMIn6Bg4npDGXmLoqPJqp5H6e/f5GoP6oDDu97FO3T6r1dBPH7lMiBHxoSU+90UNKFwkg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzIEugL29l1ZOEyEisTkCNerv8wyner2NRTNww2i6EPvn2Pq4wI
	qr2779dV/xpCrjzHXrXOdbDCLVyJ2/f7tykB7hdHJUA/2UR7EN2mXCN96vHYdcCjJAgiQhmmCZ0
	5QOlh0MN0VDzzUW0Lpm3fckZQzBbiDzRGMI/LrNFB2v6i6821sZ7OJvD5kgS+g4e0
X-Gm-Gg: AR+sD11EHH00aTFyuVVUacDpCnorHQnY7UmbkhlGtVTZSmRBUybiQOyTrgplHXRLtmT
	alK2GbowtPwpivx9Amhy/ipUq8iATzwqsO0W8gJjXmcPEjc4ldrAKPEWPEpzjiTFDKQRIwfljbh
	QKgEjC3y+/Op9Qc0211f9o8KulUh/L3k82AVrrCrYGvRhEMoRMZsB01CvmrBOGVALleGMsSdBRK
	nA4+KVVR/dmD+wGoD9ivlCGCfug17+B+sfPAbTWRttHS3TIPGU9fHMk6m+GvQ3c5edtjjBM0NA7
	KAJeTu+nlZZGgJ9xXF/HAXuUHkEUIWitU4/H8FNZDwb4CpXUFE+a2PmI7zTCa5LFv4aBWPnmYiJ
	4Kmz/2B4rbPj2EwJBbXYb33E2BMFBx9iUWA+R75AH
X-Received: by 2002:a17:903:2306:b0:2c9:994c:9a5 with SMTP id d9443c01a7336-2cfa9588d7emr72917155ad.30.1784883499727;
        Fri, 24 Jul 2026 01:58:19 -0700 (PDT)
X-Received: by 2002:a17:903:2306:b0:2c9:994c:9a5 with SMTP id d9443c01a7336-2cfa9588d7emr72916955ad.30.1784883499326;
        Fri, 24 Jul 2026 01:58:19 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df09ac0sm25150652eec.16.2026.07.24.01.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 01:58:18 -0700 (PDT)
Message-ID: <a995ba1a-1b16-4a83-af2d-51ee25adf6ff@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 14:28:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: skip MLO multicast links during
 crash recovery in Tx path
To: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260723054653.2794550-1-pavankumar.nandeshwar@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260723054653.2794550-1-pavankumar.nandeshwar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jxNDv5wVvlHQ5UR_YJZT0qs7wEeeo4eF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA4MSBTYWx0ZWRfXyrK7i6HDK9MS
 5iothINZaZJBQvjwUzpt1hLr0CK2PvYqeEy6RM8unHonkjn7UOfxtOsmxAPnHn8nuRhKz9ugGzJ
 qeT6fmi/RJX+Gu404Jo+KgBcqXXHH/SPUAEoKUO4O4BcIF8qAsQf4i3zJZERuQ/9yzaycCI3tQr
 NHG5mlrxJzWEMMl7rHDvlT2GV06ayAEk5+lXqSsMnSaUQlrdNwMBgWKQ3ipnopYUd2Me+KdyiHj
 RMeu1I0I570Nkzi3cN3zrv+vQ2xOONcnOAkIXBuffT9VPPIQWRYRWgrk8PJcWpVULvSL0KcioGw
 Zj7uGgLZ28mZFRhY9C5G5JqDz85YkEzRmSwTlVdJwUO+6hC7k/fy7WqTzRDYj4h/j7QCBDC64I2
 pVoq/CaUhMx7c+zEL+IzHgvXqnTqncdTRgwf8EuTw89ak2kyD/3deLUjRYIUUPuou7+JrrBlphS
 CrnKTy/UGoLApIU+51A==
X-Authority-Analysis: v=2.4 cv=X51i7mTe c=1 sm=1 tr=0 ts=6a63292c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=_N75d0clQG27oq7jPmMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: jxNDv5wVvlHQ5UR_YJZT0qs7wEeeo4eF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA4MSBTYWx0ZWRfX/lnmLXZZSA1C
 B8YyzGtNHjNZanYeco919COCbhWyJa7Dli5PT6NRl7sbWngHCFxH8ZKmXUNqbyKBfeTJbuki/Wj
 8G965bRQhQbGdM/MnyGr5CmL6fBp9t4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_015821_084806_8E232740 
X-CRM114-Status: UNSURE (   9.86  )
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

On 7/23/2026 11:16 AM, Pavankumar Nandeshwar wrote:
> In ath12k_wifi7_mac_op_tx(), the MLO multicast broadcast path iterates
> over all active links and copies the original skb for transmission on
> each link. When firmware crash recovery is underway (ATH12K_FLAG_CRASH_FLUSH
> set), the per-link copy is allocated and partially processed before
> ath12k_wifi7_dp_tx() eventually rejects it with -ESHUTDOWN.
> 
> This wastes GFP_ATOMIC memory and produces spurious "failed to transmit
> frame" warnings for every active MLO link during the recovery window.
> The unicast and non-MLO paths are unaffected: they call ath12k_wifi7_dp_tx()
> directly, which already guards against the flag at its entry.
> 
> Skip any link whose associated ath12k_base has ATH12K_FLAG_CRASH_FLUSH set
> before performing the skb_copy(), matching the behaviour of
> ath12k_wifi7_dp_tx() but avoiding the unnecessary allocation entirely.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Signed-off-by: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

