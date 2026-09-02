Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323FDC61DD6
	for <ath12k@archiver.kernel.org>; Wed,  2 Sep 2026 06:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tgWNP6qLVbMN69vs1xIE4IuqaLsloF7xQyx07Wr7XwM=; b=iwmV9U60r+VkO3Lppl/p2BJY8c
	LgQUASeXIyrfgwE0dWEs97eGEdJUfkUq5P0W2um7BXgkZLbietjLhekV56/N3y6rBxpQ1IjmN0JMX
	ujx5+di+TwJ8cOCcVswFGbMyotHYkgBybGBTt55LqwaZSJBuINRagFLnlR13HRtUqVrTvG5N4vwHX
	o5Go74MYtz2BRsW83tNJbKudiLYXvwLl7IZcVPVy8Z85CcDMguGj6YfDy38/lRL/l4XRbz3bLPr6V
	4gajVbq6nIUdTqi5AIksTV7JWTBJTQop+VWXCdE1tvxQ2/z3lW4y+cOPbrFW6Tp6npRFzZnY5N5FH
	dld7Cp+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1e72-0000000Dq0S-3NuH;
	Wed, 02 Sep 2026 06:06:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1e70-0000000Dq03-37pO
	for ath12k@lists.infradead.org;
	Wed, 02 Sep 2026 06:06:19 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6825YSni631207
	for <ath12k@lists.infradead.org>; Wed, 2 Sep 2026 06:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tgWNP6qLVbMN69vs1xIE4IuqaLsloF7xQyx07Wr7XwM=; b=WPrwD9WT8KqaRfXh
	a7gZ029rnmuc8CabOA2bkbDvCPIQPou8RP9S4zEDayHAhSAqvFucoev/UN/xy+74
	Z6VELw5w2R5QjRSGH3Pq1jOhOA3bGxmQRLIBljKXHa60DG2Qf8MdCJIcApK2VHDr
	QyDEFm1nf92+60ky7CfRf2BwnFbmlwxB9v5jdTjKRHZms+rCFYgAgesBxabtBVTL
	UOAYGa4Ea64FaeD+Es2z09VL4S/gQeSj9DV4yXvbB5idFuDiagSw9JioFj40q+qw
	0n5iCwBICQly1ALZzDV9hagHvNFcF7LR3vG5ClwfV0yJ21NTIWsbi75sFIp2ZnwP
	9eaN4w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge37j2cmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 02 Sep 2026 06:06:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so935156a91.1
        for <ath12k@lists.infradead.org>; Tue, 01 Sep 2026 23:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788329177; x=1788933977; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tgWNP6qLVbMN69vs1xIE4IuqaLsloF7xQyx07Wr7XwM=;
        b=TzoE0ghzZu2aNtWZ3AkGyvsbx8zZT+fRzQNVMuBlTJ6n+/kpkId5aUy7zqv8add+7Q
         2Ea1mUnyt32cfAT1RvyJn4LXFRgfyg/z15iI6FiBLkUEmc9K6mZD6DVK2BVX4aQ9v8TB
         AMB/hgftfsKIrv1rOdQDAyTK1ZD/xLHKH57YgOcVMrLXHkTbWX6c72E3OeutA790i592
         j4KnbjtStDOfT1eydr29FamNlPFmXbPOBAqbqLZ+A9twwvsvQhhQCwn+TJOOwdZRDaCF
         +hA3YdM5+Q7BC19+byn0Z/amhxLgrQmNFsFOgz54GnEmOcqcf4aKfLKkMzASU6de5uPE
         HvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788329177; x=1788933977;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tgWNP6qLVbMN69vs1xIE4IuqaLsloF7xQyx07Wr7XwM=;
        b=XWnoVOybDw7P4zkR5zjnb1xMXQEv1uuJ2JcVuHrrrRzY6XqAAnoXfcfAgdxj1VYjEN
         AHIKo95bavsN6diDjXRqRY9/ZYRsuveBofLtvVlimHbbPkhibHZaUNTVkZxHZcO5xURJ
         GynkMGNMo+TRRq76X97d2ReBuXM07HWbUrFGmsqmPGfPYdZGgh3JNP+CZo4zhLAWHTWJ
         XyKyU6FHIZe/rADuKtNn32FzzTzZLkkqanAss9n/i/WdoySriJFTmg6We4nsvXNqp8R5
         7n6bT6/DkT1FRIAriYB1rFfuw3SbTC4Ahgcs/ev30I7m2iZSdrea+gTUUtBm0sWvjWM6
         VaQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwR970udGYwWSNU7zxK9A3iysHTPmWdyixV3vJLjM7wdw/iUYYZbSP97bcK9VvmXcZnKsjk070=@lists.infradead.org
X-Gm-Message-State: AFuF++mKSMHTAbKgfxDcd9oMoAP/y8JD2XruTingUlaAt8k6oVfNcbem
	9DOthhAbpvzsCGBcCnwKtZnO36OD2IGVQNapaGIvFQFegdcmfcT4Sfc/F4yQD3+DWKBEPdjilZT
	LYGMSOoCOP9zFUNFhUbsPhu3W5XOWk+cMyxjAT6w/nV6oRH5bl5xd9FsqAQd5lzEz
X-Gm-Gg: AYBFou0P7BnidxiM6fECL3Uf7gM/BTwjA3QPctbTrTBWF7LfSNA+LoqtnhpPv7h1oUe
	sU/4B7mKS08OYmL3T8JGw4+iTuh1ajTCaVrDTV4NztCBDrctB09QLvNRGpDKtIa2I68etQ/RrQh
	1eQrmIPhVMU0DrjvPvgzi913VUgTzzj9YIZOUUiymcPK/koGDMto8XllqaipL2s9NdfpBVkv33l
	Fo2ugeUqNLzOcO8oU6rvZT8m1qWxhdz3D6n+UVow+8RrZN0TfOUw5Ivfh3s9NVuL+cDpEKtDB6g
	HTxA0ec1BgGEV1M58kMAowXYGxGNLFz078rzMAV3VA/bTYM9EihmSIFhedUxCU9sbnEN0k4Sapo
	ZdLZUrYqFXEBILOcoe0zNWKQdX6Vm+iuzk+3H1EHRcM8GF1w+Rk4gOC3KYpT3VH3SsadjuI8=
X-Received: by 2002:a17:90b:52c8:b0:398:9be9:ab8f with SMTP id 98e67ed59e1d1-39aee125891mr3382141a91.20.1788329177132;
        Tue, 01 Sep 2026 23:06:17 -0700 (PDT)
X-Received: by 2002:a17:90b:52c8:b0:398:9be9:ab8f with SMTP id 98e67ed59e1d1-39aee125891mr3382082a91.20.1788329176573;
        Tue, 01 Sep 2026 23:06:16 -0700 (PDT)
Received: from [10.133.33.22] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990baaeec3sm9846860a91.0.2026.09.01.23.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 23:06:16 -0700 (PDT)
Message-ID: <0ed9ddbe-4591-4653-8ec0-06301599c89b@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 14:06:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: preserve PPDU state across monitor
 status buffers
To: Kang Yang <kang.yang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260828065534.1537-1-kang.yang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260828065534.1537-1-kang.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: U7jTVczUDcXxRrEy5Yx7AkSJCa_IvhJm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA1MSBTYWx0ZWRfX0F+9P+l6Ugq8
 yVJaq/Yj2sL6P+6XMZDxZodrfwReqFK4r2X4Wsdd5/PAHVdnmb4syqNpvJUD9Fxi4Cgs6XMPFha
 BSsz0kBH6Utac33gZ8qoWY/uza/+2PM=
X-Proofpoint-ORIG-GUID: U7jTVczUDcXxRrEy5Yx7AkSJCa_IvhJm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA1MSBTYWx0ZWRfXwEBHX/2x1NS1
 C3ulf3em98KuVlqdwcdmy29bLZ530TzOadQDs2qz+u6tRu6PvMaKBXAxMzbcjzeaPJMq71Co7oo
 yPJHXXmLOdgbUVBNeYA+kMkTBOxIY6yLNtTs8aeaIvBOCxe0CACSJV5dVrKZ8c101W5sfACMoh1
 zFGcn607rwGZA6g9Kunp1kfYiI4rFbycSWyXm+cQTMWhoqsq10bDpZY+QyCwruGH/MtRi4izsTi
 mH1nzO6Et8SssMZqyaxHJtInCg+2JJFTXpl+VE+odyKUA1XM3aa8yoarQk1b+MhITWBEj/T/e7n
 2a9uYpurFwYc4+oD1SD5CcjdzV+nKd0a0SeJN935kJlCQAfe670qw2uvRvdWhx0N3O+zcoN9jK+
 nCnyeBbHVvMslcjwwH10pvkXk6PFrP218FjEJNacz6N8ev487TanGwaOwBs5le/VaBExc86sHYy
 thU97RHVY3vq+KhJyIQ==
X-Authority-Analysis: v=2.4 cv=PKg/P/qC c=1 sm=1 tr=0 ts=6a97bcd9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=YJL9QbDTW_f5VMqXTPAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_230618_920708_FC8BD42F 
X-CRM114-Status: GOOD (  12.92  )
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



On 8/28/2026 2:55 PM, Kang Yang wrote:
> A monitor PPDU may span multiple status buffers. However,
> __ath12k_wifi7_dp_mon_process_ring() clears mon_ppdu_info before
> processing every buffer.
> 
> As a result, continuation buffers lose PPDU state collected from
> earlier buffers, including ppdu_id and PHY metadata.
> 
> This can cause monitor RX processing to fail when
> ath12k_wifi7_dp_rx_mon_dest_process() observes a PPDU ID mismatch
> between status and destination rings, preventing MSDUs from being
> delivered. It can also produce incomplete EHT metadata that triggers
> warnings from mac80211:
> 	Rate marked as an EHT rate but data is invalid: MCS:0, NSS:0
> 
> ath12k_wifi7_dp_mon_srng_process() already tracks status TLV
> continuations via ppdu_continuation. Apply the same logic here and
> only reinitialize mon_ppdu_info when starting a new PPDU.
> 
> mon_ppdu_info persists across ar->monitor_started transitions. If
> monitor mode stops while a PPDU is mid-continuation, ppdu_continuation
> stays set and could leak into the next monitor session. Reset it
> when monitor mode starts.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 78d3d907d0f1 ("wifi: ath12k: add support to reap and process monitor status ring")
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

