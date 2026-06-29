Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286D8C43602
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 09:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QRSODFNNb3O4IsBQSkX4j5L2lfEyxWjDjiEsVelPssA=; b=I19e2nQc0EuUAg10QD2VTRESet
	DGO+TsFYwbL7uQzx8qQ7PDq87g9BVMDwSFpa1O6FA0wwLP1UpRQ3EpRIcEQ5MKkSZOPj++l3SlhdR
	mzKLeRBnnNVLAHbWfWAQ+Gn4k7NXuUNgLMurZbxew8TWx2CHWctsvs837cBnAAlHOF8l8gP9hrbap
	FNKBbF+WMSKbArw9bpkRJWHwbwEGb3GlWUEsaVH/QbGQ6XPfB185XbVcOflXFmbd9/GKjwx4MefXy
	c8tmBKleEDee3lwmIHIEmxJg/0+WJJa1++8HqOV9BpqmZTHQpTXoTHtN0fBrKO3M/ZLYJetab7vky
	z4AXSU5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we82U-0000000E70B-3hk9;
	Mon, 29 Jun 2026 09:12:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we82S-0000000E6yw-3osy
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 09:12:26 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T7DnVB2188694
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 09:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QRSODFNNb3O4IsBQSkX4j5L2lfEyxWjDjiEsVelPssA=; b=ND+Te2udEV6f4ZNt
	Ubd4ex+xDsa+I8PTX34S3UGajzVGIMeqsphYuhlKy3oWEkKJvQ/iIJP0E9QirFkG
	6vlZrF4M9YMqyVCJ68X6Qbp2W/J4KVxM9Bry95W3yvE0AZowFmotxPLSq1qyS5r6
	NaUhSFBTzTAJ806XGQf32xRHRUSrmbF6jE3h+lNakgyj4CJRS6rwuvd3GmPa7sSU
	APPNM3AhlDSnz5x1PGRfPu0SITzByvCBDP68F/eNKQmXkYqa2SEdeZ3aokYddj0L
	a0eX7pt8qiqSk2NgBAKjvfGkFuLsfsI3CmIvjXOvMaBbKrjxoMJYCz/KtcdaOX+I
	jI+MKQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4trfwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 09:12:24 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139ca26403fso1224510c88.1
        for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 02:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724343; x=1783329143; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QRSODFNNb3O4IsBQSkX4j5L2lfEyxWjDjiEsVelPssA=;
        b=iUIQhQHAmsNGcoHXBkMVI4dLnxeZpwnaPqcGOOFd8/Ouu+zeDxHqhXYKHdAgemHMHL
         4xgQFv0ncEv9zTFgqZXC+tIvdljyebJwiSyFeCawYSMCiFRsD6DWg797/quNoaxIaEOd
         WP6Ja+HuSBwNPra+13UNPVEeuFWnHBdBk0SrMAELRB+JT0sm6JgdqzwhSoE5bbFT7EHT
         T7hz05IarhDPLzTUMp1zEQQ/0QypKVsBKvpRiSRh1vYwItYnyCK6tWu195pa3e1uUbjI
         10pk/1ooUKlJ4vw+evPKxAWdet+jTJ03mGR9RffHGaNRBUGncfyRMF0v5+PSHblbC6AV
         Cqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724343; x=1783329143;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRSODFNNb3O4IsBQSkX4j5L2lfEyxWjDjiEsVelPssA=;
        b=edUJG6PZd2Bdem2L2hllWbjMZfl+8Obxy+YgMABZz/H1Z6k0GutUTsDLc+cS2jI7Nn
         I42vbQptDgJB4UwaoTgM/UuyjY7+fjeWRu0ok8i4oIo8epp12RaWJ5o3W3ybKxGGiU2d
         vFNbvzTl4n8+Cgd4H1uD9u6EJQmKtmEcDQ5m54wB9T8Vx9blr4e5KGJ8sf2RM+1XPUoC
         3FvSOJDXYKzouRdpLzuCpZ+NtQktcCBpmB8rDTA5GfwTm4pDeA31JoWP0l2IiJeQDqkg
         mdCvZlDK0ouV4pcdy3mhbcoQSB1XC9VW6otuj7pv2fyMfjv0yfA2FL10M++NaCSr1W21
         CDoA==
X-Forwarded-Encrypted: i=1; AFNElJ8VEvEOcAMnWKa4P8Vhi3G3ya9vkryVsmUwuADpgVSWsBYGxjMf9AlGcpGFD72vYhuZogPu0aU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwHtZGM2A2r34o1YRckoh/UACkUvJyRmYNwqjF0e05dHhO2tX0g
	65u1Ouc9ALhUEJLcS1KgeE2BF8PdDAekaKwdOd1PxHWvlvO3ifqwhLhp6EzNbzVRf9sbcB+2Wnd
	6ADbdlWPplULtQcONc6wzZytj6nsYUzweUzBH7tHVK4U+tLPFhxueiNiG1xi6pVNu
X-Gm-Gg: AfdE7cm3YFd/fM0No+Sot8pemyoe3zTQyPu++AMjRI6x1fld8ILfMGtzbVjkzkZ4t6Y
	fzCXo38KcC0Ru94TQPRV+AfyV7HN38fG6819JaHvTXJ29D8aIqFRThVN/rSWBRabVwRGwHiNqLM
	3qIFo6u5OwZi0YdFxt0uxrpa7QfLE8ZVN+E2PGtFxud/Qh8hlRduLbgfTe/bsvdlfDlzxHUf3ox
	YbvW5gM2mQTR87Te9MPG+zC/aSMekjbgYa0FK1WmNdLab6SmwLNO5bZO+gs8jsluMHh8JrLRNiW
	5vBsp4d+qyautnRiPfb/1n8kJxb7j22OtJJQWEOa3q4JaXNfdCahpQ91FCJCYOhyXbSRuh+7kJT
	WcW2sdPsc9X0G3E8k3xfTkkB5efpR0Td3IQZP2OOPCKBWOhDNbRQ=
X-Received: by 2002:a05:7022:fa1:b0:137:977e:628a with SMTP id a92af1059eb24-139dbac2e17mr12991145c88.24.1782724343299;
        Mon, 29 Jun 2026 02:12:23 -0700 (PDT)
X-Received: by 2002:a05:7022:fa1:b0:137:977e:628a with SMTP id a92af1059eb24-139dbac2e17mr12991131c88.24.1782724342765;
        Mon, 29 Jun 2026 02:12:22 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d91006afsm55172406c88.12.2026.06.29.02.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:12:22 -0700 (PDT)
Message-ID: <d50eb3f7-fe8d-440b-9ba3-8baf4ab62e3a@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 14:42:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Advertise multicast Ethernet
 encapsulation offload support
To: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260623100501.2100119-1-tamizh.raja@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260623100501.2100119-1-tamizh.raja@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MyBTYWx0ZWRfX0kE4Fe1Wh9cb
 pPGQHUMibTLWuOyhoNTzDFsbXSnrC96H8z9epxSrIkrvp7LX2jvJLoPW56/ARKzxyp1TAS5Z1/C
 G74XOgAW3YfKocK7g8pkbdSEal0Gj96i06K55CMs0mB/G8wOaSNiXEsZm+GzniV8Kr5StxhoHOV
 aV9udrdGyEZykIvS9hBxyU0Tw8GzylJHGB09dUnzVSl7ReK63CtIyeduqDGVxMEwUnmsftlhfD+
 aHs9yfufLLOBCv/CXMvNh2kqbiTTqnH6WUbqtP/UPHVVLvf5Hb5j2rKEnsVSVowgU1LcQW5aO1w
 eeJLqBXrHly06oCmxcY0mEo18PPY8hVcrFgZjaKbgVzqS0tGGjOvpx14/CTs1ZE7L7Zpzo1bHNo
 Zyd/66+v+4+8RuAnGuBxxCSJpKDqWupNdXTFW9pnFmVZhxXsMiKQI94UfhQzVFTqSaM04R0BpE2
 FymBWK7BmKWeZgGPZnA==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a4236f8 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ON_mxGkP88hWkZQB5WAA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MyBTYWx0ZWRfX8j0DGyrWxdcw
 3NoxLvJoNaK/w1+6hLMfBqOMDDJuLjYBTW9Gp6x2Qe9LK0W5U+F35BhTA1pygk83oSVnp7+p4d7
 vtG8Z/NaR/KV+LD4D9Mpb36YM+n3BMo=
X-Proofpoint-ORIG-GUID: 1Im_6DnoiuNkJayxZzE1yN_fcxl6LHwI
X-Proofpoint-GUID: 1Im_6DnoiuNkJayxZzE1yN_fcxl6LHwI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_021224_968051_D83238D9 
X-CRM114-Status: GOOD (  11.12  )
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

On 6/23/2026 3:35 PM, Tamizh Chelvam Raja wrote:
> Advertise IEEE80211_OFFLOAD_ENCAP_MCAST to inform mac80211 that
> multicast frame encapsulation is handled in hardware. This allows
> mac80211 to pass Ethernet-formatted multicast frames directly to
> the driver.
> 
> In ath12k_wifi7_mac_op_tx(), refine the logic that selects the MLO
> multicast replication path. Add a sta pointer check so that only unicast
> Hardware-encap frames use the direct transmit path, while multicast
> Hardware-encap frames fall through to the MLO replication loop and are
> transmitted on each active link.
> 
> In the MLO replication loop, use skb_clone() for Hardware-encap frames.
> These frames are already in Ethernet format and do not require
> 802.11 link address rewriting by ath12k_mlo_mcast_update_tx_link_address().
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>


