Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D10FF8860
	for <ath12k@archiver.kernel.org>; Mon, 27 Apr 2026 12:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PT8XoelM4J68pOU5FLDggN7Sv+o3fXorq+LKl5X0tss=; b=aHGOqf00xai+6q+jwwZ9yuDd0E
	Tgl9AiBnGPDDC/RTdKCCisEjskzIivGzLN2MWY6dYDOEWvMZghMjn6RhGNeePyUHZCUZSSEFCrcSR
	efi4+Yf0vHTSEDZEivLuJJpbwG8iF3+zvmnbG8H3f9ttXtFnNqs8RhRJsB5j5ReImRaa+4Q+KzTMj
	hYYY6hWMkzP3a1RJbNIn9KFa2Xx5dwUyfSJA6btT2gvNQGvu0Vbc3XAn1gkR2AipzgJF0H3H0/IOK
	7GFCgHDFQFbeXctfkTa5fVQ7sfV/dU4+DDr/xlbhYsgUOcMPY+jzUNKgrdzwnXFe/9oSY9N0QLy+J
	dgnUCpTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLMf-0000000Gvyc-3m2q;
	Mon, 27 Apr 2026 12:47:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLMc-0000000GvyJ-405X
	for ath12k@lists.infradead.org;
	Mon, 27 Apr 2026 12:47:04 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TA6c2793106
	for <ath12k@lists.infradead.org>; Mon, 27 Apr 2026 12:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PT8XoelM4J68pOU5FLDggN7Sv+o3fXorq+LKl5X0tss=; b=jHzN6EhpOs/VDzFb
	4078ZcnZOZ0Wrvtb/GI1AmxYd8a2KVN9ceOqQNDdYj0Phw0jpqk7cssSROeXWbY0
	SUEdJgtXFlO4H/HPpWUh1BE4ZaF4zsJy7j26xd64mJqlULNudi5Qdy079/iYNHg4
	LRx7MyCEkuPy+dV2i5bBRkS/SHQAZDkAthaIVtf6Pgx+u9DUQWHyPSpnnYkWBOmE
	V7bQDu4U0wyWrzfZR2b0REIrbrE6LfMmvnUIPPZX9pc0LigMfcYxHd1DrtF36wa+
	cNHdnG+ft9V5VL7M6LXBrEGlaWa36gLhpkALw4BhhW1YQEZD02l1RkQtCbDUPxqp
	2AHKlg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsa4uv6ya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 Apr 2026 12:47:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f543bae3cso5485701b3a.1
        for <ath12k@lists.infradead.org>; Mon, 27 Apr 2026 05:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294021; x=1777898821; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PT8XoelM4J68pOU5FLDggN7Sv+o3fXorq+LKl5X0tss=;
        b=UUMfymrnH042PxvKUiT5RvgcMEYa15KIM1uiywgKcO5CiBWZlhhFadFQuBT/j4s2p1
         3sYtnLBBjrV5QytCYs5++pqTVS7gqTsq+Urc/WGeDMuPtQ1s3Mnx5+ozgCGzzt1ejB9m
         1b3oNsID7/M+Pvx5cYojUA0frffDucGjW4+qzWkYflLN/5pjvy37o3uVBVd6toG1weXZ
         +T14xrcE6frA5EMxITs352IOFw9NuF8pxvv6SnfjG5KtKDvTyMLas9Hr56HbzGa2Qlqg
         tY/U6BcBUiy11v7t+/SH3xBPBUDQJ1KZAQW2pE34AwFTakfUmZStbApSZZejX/yzu+fU
         gH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294021; x=1777898821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PT8XoelM4J68pOU5FLDggN7Sv+o3fXorq+LKl5X0tss=;
        b=debT5C0myn/yu4QWIPVTxRctfLTh+3krmUfSG8oMca5xznimQ8e3ojQSJzobA/DvIf
         iIHuJ8eezdZc/o6vOT27sAW8JuWdDtv3zp0AHg4gXsgZhu2ugR3FXEX6KWni+4lVxPZZ
         T/uN1SNAqoG5pZgUow0FVSvpK7nbn2+YZbG1Qi1OQFPDveKB/AqFzoCEU/ezRFALVhB8
         MPv6hEDvBMaFq6tt+uI9XLfpHdi5qv5EvPx1dzqESaJJKhs+HWddrra4Jm3NITH2l0Eg
         xqJphE6eOfWxr8zlNttVaHV/yZf5nHmAaQi1H+j0Gw7dLzPmtpZbh/NykaGDFxq9lQ2S
         gTxA==
X-Forwarded-Encrypted: i=1; AFNElJ9NxYoCvtZY0xscL5mo0cZQH75c15SNX0GviYZD0hLe08e/O1JvcIsMR5mpGQm5Srg0fl/Cxqg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzSLX9CA59LOZThVu3KHsVLxFRov8BuMC45hJxYbRZ9GSkZhZ+4
	/8/3cEkDL0D6GRAtXz81RHEc5KYC1pCZyaELft8W/1vtpfw08SfCpExwb6W3yOYMdWvlTP4taUG
	joGMwuhMPYAcS4KEut01dzd9OsJVe81bgB6rxJd+ejHEsWfZYYdenZFQWTy51OIdE
X-Gm-Gg: AeBDievjNAVMv9ZiYikeOfu87SdJxNT2WmTBMC2+erQZIDdQDpABnTGtnV43a09umzU
	ppw3HS/DclntDlD0hokNXdGjvTpiiL7gL+FNgSX/rI88vOetdXuUkifrEIAAdTM4AOSs1OKG+Si
	tVJc6ZZ0PxqYSnZ5/rUS9gRMviTgiIAxGW1EAN7Qku8FIAqBwUjLBld1xfF/J7XAl3UN7dO5AqY
	FWnV7Hs0HXOqFZKZp4nb3oBqNVli95ASejX7WPUKuNFJgE26KFE4meE1T8eCE/M1AppxjeqWERX
	5xJPnaKh3HeTcvAIK4g99+PYIojXcoyZFHWtO2uQSwCkZQjh3o0zXnenEvPoSFZuJKG1axS9sdn
	SnpkXcwgzvYi5Puw185eUxVd82mYHKj5EVAvegvd4LL9TeBZbrHO0GR2W64lq27kPX70P+4PaDg
	cgERCyXaBHG4ck96imPsHwI+pQU4Mwd78Od9yHNAnqugI=
X-Received: by 2002:a05:6a00:2d8f:b0:81e:1b77:9e61 with SMTP id d2e1a72fcca58-82f8b599b71mr35197667b3a.25.1777294020901;
        Mon, 27 Apr 2026 05:47:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d8f:b0:81e:1b77:9e61 with SMTP id d2e1a72fcca58-82f8b599b71mr35197647b3a.25.1777294020408;
        Mon, 27 Apr 2026 05:47:00 -0700 (PDT)
Received: from ?IPV6:2401:4900:25e2:c02c:2171:a04a:44ce:a6ff? ([2401:4900:25e2:c02c:2171:a04a:44ce:a6ff])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe6439sm32472002b3a.41.2026.04.27.05.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 05:47:00 -0700 (PDT)
Message-ID: <3eb126d3-22ef-4a5c-b1fd-11db304979b3@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 18:16:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath] wifi: ath12k: fix leak in some ath12k_wmi_xxx()
 functions
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260422163258.3013872-1-nico.escande@gmail.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260422163258.3013872-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jeN2xLVmmqG_5K4GP-xof0_5Z_WIgkQS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfXzepN5O1KeCUM
 IwGXp0snX3Nhs6663YkmQJ5qQQftu4+vNb0FZm0Lja3+MRrq7OZygVZERM4GF7Wzqn2bDuq9DB0
 INiMbkKbqtTiUQzbLeQ73Pxf6Rq++yvKsP7m7U8/qtw2AptEzM5RVdJ3qygdHOQf+b7wrEfWdih
 FhknOZIA/alm7o9rDPpo/CtbjXhgQoUaoanL7uI2oR5EZineQRWgsIQB6xdxF3Mat1uNZ1o49pW
 LbTtmxDSU7789vTSBnluaRidYCFLD12Tmg9QZDlRHzNGkXtfP7A0cMEjryOvGuFvm2Z4XKIHGdF
 oOp6WPeLnLNanavGCX0A5Bazz3FIsyL+KqhFlZLY+wUMJhY8L8hiamDQ3WLQ/yK2Uacp08jAFiH
 dWt3Yg6hAUCgXln6lBBt1VWlwc2vmTUlKCv6W2Ak9UDTJIIcEEyodR5CKWAK85CQQYePPNz07XS
 awfwLOaqwVhw6zb0vbQ==
X-Proofpoint-ORIG-GUID: jeN2xLVmmqG_5K4GP-xof0_5Z_WIgkQS
X-Authority-Analysis: v=2.4 cv=J/GaKgnS c=1 sm=1 tr=0 ts=69ef5ac6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=lfbKPbqkovPu9Dadm-kA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_054703_058913_C5FB57F6 
X-CRM114-Status: UNSURE (   9.13  )
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



On 4/22/2026 10:02 PM, Nicolas Escande wrote:
> Some wmi functions were using plain 'return ath12k_wmi_cmd_send(...)'
> without explicitly handling the error code. This leads to leaking the skb
> in case of error.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 66a9448b1b89 ("wifi: ath12k: implement hardware data filter")
> Fixes: 593174170919 ("wifi: ath12k: implement WoW enable and wakeup commands")
> Fixes: 4a3c212eee0e ("wifi: ath12k: add basic WoW functionalities")
> Fixes: 16f474d6d49d ("wifi: ath12k: add WoW net-detect functionality")
> Fixes: 1666108c74c4 ("wifi: ath12k: support ARP and NS offload")
> Fixes: aab4ae566fa1 ("wifi: ath12k: support GTK rekey offload")
> Fixes: 7af01e569529 ("wifi: ath12k: handle keepalive during WoWLAN suspend and resume")
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---
>   drivers/net/wireless/ath/ath12k/wmi.c | 103 ++++++++++++++++++++++----

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

