Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BEFC5B572
	for <ath12k@archiver.kernel.org>; Mon, 17 Aug 2026 03:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ah5XRtJBg7LK0+vYDvxEA4jBId1EvWjW8wVD87FaXzc=; b=LHmqKLeHm0NNyMfyFH18iQmcOz
	Ir/IC9eeOcR55W3eIhgKh2mR25iZw93RG7JOfrF6ZErKVxdug+GiuiH+RbwjEgD1roLIDZNPM6XC7
	MqNDQJGaPVf2YcMfjdRgCul1hnblV4lUQXCAnys1rTKQHnItfoW8DEkTv3JrAsUasG29uL6eR4euI
	b5Ke+9/z0J/okg5XfBuS2LRprX0douEAPNp7Ft0GbbAwqLk/icLQpoxHADoNtkpkTPLFnA9xezp4U
	DbqVUMaM1CYxNkRl/gre4nz0GS7+TNR1NQMi0n9gv6P5oJHqby5rRanBsqeTLlGnvEFzr6+VOuGRl
	jiz6wgIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvoFK-00000005NYi-4C55;
	Mon, 17 Aug 2026 03:42:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvoFI-00000005NYN-2ywv
	for ath12k@lists.infradead.org;
	Mon, 17 Aug 2026 03:42:45 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLDbqk1386986
	for <ath12k@lists.infradead.org>; Mon, 17 Aug 2026 03:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ah5XRtJBg7LK0+vYDvxEA4jBId1EvWjW8wVD87FaXzc=; b=BFj6od1Qp4xwLMji
	BXkRrpGUMs3JwbP0RXYrzhn5xa5B/jOOzo24FFChgsNSsgu6ICqjg8ySn0ptQ9Gp
	0QE8QDBgzqZeLKVasiOomRF09+XLP/9cKKSV0DHyELQfpyW5LJf6GepCfs5aUxhf
	IX46wTeJjWgItkhIFu/rAPHEaM7pbqXNnqn/LssIvMXCGNqv8DhTVGb2wd295Jg0
	XZDTUulcwS7QyRQA3glNMmHmboZ41BvXenNTHXzUwyXLn+A5G1hODHvTbp9IMDRF
	H0TIX1/0bCmUsIDryuIX7/zVMsqL5th3kJ0akI6FaBu6XF9ChVdBGCsZqG7DOGfn
	1c5TuQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3mx4rpdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 17 Aug 2026 03:42:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf6acd760cso34226005ad.3
        for <ath12k@lists.infradead.org>; Sun, 16 Aug 2026 20:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786938163; x=1787542963; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ah5XRtJBg7LK0+vYDvxEA4jBId1EvWjW8wVD87FaXzc=;
        b=d1FAuVrRO0SKStnytUhzqMJ99qlEvgHtqtkYVy7FEmNhKuAEZ7XprH5aGpEh1IiQVZ
         NGWTcOus5vvdJBo2HLCcwZmoP77bnr8eSF9YyGlMIFmrFyEC0TJ019M+E95y69TCsEg2
         j8sBFzYwn64hin6GhRZT+VD18mFHVn5oSRK6tsIlGoU8bKgHYJGg24+ldP/WHDdSCloZ
         r2Tew0sqOQw4rbt0MCFcHy4eUQlMHVjNGzJFPFjkgYQrc6+7XguTWvDpWwIJjwBFgEQc
         VbCzNCexyZZUWACnjLqHXheVxnBO0D84IyfJ+TpFUnfHMZx8RLy2zSUnmOD8PhO5AW9g
         gO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786938163; x=1787542963;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ah5XRtJBg7LK0+vYDvxEA4jBId1EvWjW8wVD87FaXzc=;
        b=EHsWHiaPhT8oCP9az8L5PBIWsIrLAb73nYa1MqTIPnnnZQBwgRN6A+BD8taKZXI3Fp
         VZ5zBoQhd+YkIkG9knNKG4g1wvhpnYfl5yDAb/ktllskcLq+LpZPVm6BlKbSMoxf8UmT
         rPhJ5qIVa04Gsv0g+c0YlGqE7duYDtcLG0jyvMGxKoK4OhKPVjwohXuytg6ngAN5dvTd
         +gKGj5J3deOa7AXZlTnu9w1vdGpeaH23g00Uo1uu7WbEttKWpRNj2udMTWnGLoYF1brb
         97AKfdHzIFl9FT+wOyFi+rSwStN9KyYlBErswkMDBGrm5qkWC2Y+05PEdRgI40PO3/us
         KEJg==
X-Forwarded-Encrypted: i=1; AHgh+RoIWU2ZwU3nkcQTeCEnqNTAqkZfH8uEWPfENiLfxf9Ub6t+6UWGzeuMYDsC7qZ7Bpx0PIwAoQg=@lists.infradead.org
X-Gm-Message-State: AOJu0YypcASQBqK74RrjgwuIrr66Q3LMwoIslymRyIj5Cukr3HdKxvhW
	v0BPfw1548m3PXYV4vZ5++M+ak46jAp86cvSE/E99k46+H1asBfSHv3JWrEp5qcoqGYdc6Pqa/b
	Isz6gGGyYsjOQGESPMHZcR4eX5AKl0sNVBjfT9Ikw729a88YURh/0fNwyziSYQVsL
X-Gm-Gg: AR+sD10e2EBE7VqmtPJ3OIUNqgg1Ry9cz2n1pz7wGmRFopaU+ir9gAki/7qjytmm8IH
	o/AG0pmpMB9+8+INNx5/gOWS2d/88nvvDfpDQ7GRSmWvIDNF3wkfTCkKBBOjMxDjkIr/u9MT/tI
	LFUef6YAlbr9l8b0DwMXB2Z3msflUV2XlmnES3WC2U//cMB9VHT3j9SsafCejHa7wXQdnNbcnXA
	geyYKXto2ssa1wEv4L2N41YqCvfMf0HAJrgL21/QOHF5DLxPlahHECjFdy770DYcGcfY78YeDQv
	WpPplmQ54OOn8uQNX/WQhMrofTafTxEz1uPFL9Yq9M4L3ssNmUoc4lpfiB/vNd9uqoOVlqqxnpv
	fuk6oylJWlAI4r1oUD8xhXfevw/S3UqiSyeoW9iH+L723Kes+7vZuBuIOZsh3FbxEuWwRhKw6zA
	==
X-Received: by 2002:a17:902:c407:b0:2ca:e3f:6a4a with SMTP id d9443c01a7336-2d3b0fb28fbmr253232355ad.21.1786938163227;
        Sun, 16 Aug 2026 20:42:43 -0700 (PDT)
X-Received: by 2002:a17:902:c407:b0:2ca:e3f:6a4a with SMTP id d9443c01a7336-2d3b0fb28fbmr253231965ad.21.1786938162752;
        Sun, 16 Aug 2026 20:42:42 -0700 (PDT)
Received: from [10.133.33.152] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aeb2a565sm28725775ad.39.2026.08.16.20.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2026 20:42:42 -0700 (PDT)
Message-ID: <a8343f57-d956-4e07-b260-a54107bf0f1a@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 11:42:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix DMA unwind for ext MSDU descriptor
 retry
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        P Praneesh <praneesh.p@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260813-ext-msdu-fix-v1-1-c5e80ccd061a@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260813-ext-msdu-fix-v1-1-c5e80ccd061a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gK1mn9X4hqr0Oc7qInaIfJ1tKIz_osbf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAyNiBTYWx0ZWRfX6PhHJjqvRd5F
 EiSnywBmuh1RxlC1SrKDpvhTAY5hgqAwNmFjIMf7kiX9dYwTx6ni1RrdALYEdEFf4OR4bgZpA14
 RJooiDhLa7qGh2x+fcJK6j0HJGN933s=
X-Proofpoint-GUID: gK1mn9X4hqr0Oc7qInaIfJ1tKIz_osbf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAyNiBTYWx0ZWRfX7q/3z7/iYCwc
 NmHHzt7Rk6SGM1eLe28gaxh7OO9J3aYQzpbvi8VIknDrnhUBzAisYbAWin42pvz+gRf3xaOF3f4
 7p6TPxOg9xIc5v/uvik82t+5EIQxa2ecdF1Cqxb9/807yyk+YLp+f3iWgd1wJdzl25+qdbXpZgg
 g3vy6mf3g+o9iznxZLoHKn85cUQrjpHubUSa4P6avmHwcM9V9pEffTPiDLEINuzdEM5Q+7g3uik
 Jht6FVxpyDycE6khyiZqm5ER8P1JQbEP+M5SJYT81QBh/tjaAnmtXVHtVWYa+IVD+FH4oBgPnhn
 CcMdIV7U+s1YzYkfCh3tSr1rnMmcayvmMNWYXZzeF9kTgXlmN898kYf9K1ULpEq6lEKRCxqUJKz
 TIKwBLE4hPR0wtnkfka7b+URh1mluiplPBI75g+nPv//FlkLF3sKX5FygyRC5PiSznXpTknwpJ5
 R86NN7OlLXM7fn0Ctdw==
X-Authority-Analysis: v=2.4 cv=Y6XIdBeN c=1 sm=1 tr=0 ts=6a828333 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=h9Ag4oUkknsjeQ28DOYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_204244_882487_036B0867 
X-CRM114-Status: GOOD (  14.30  )
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



On 8/14/2026 1:39 AM, Rameshkumar Sundaram wrote:
> ath12k_wifi7_dp_tx() maps the original MSDU into ti.paddr and
> stores the address in skb_cb->paddr. When an extended MSDU descriptor
> is used, the function later maps the ext descriptor and overwrites
> ti.paddr and ti.data_len with the ext-desc DMA address and length.
> 
> If TCL ring allocation then fails, the error path first unmaps the
> ext-desc DMA address from skb_cb->paddr_ext_desc. It then falls through
> to fail_unmap_dma, which uses ti.paddr/ti.data_len for the original
> MSDU unmap. At that point ti.paddr still refers to the ext-desc
> mapping, so the ext descriptor is unmapped twice and the original MSDU
> mapping is left mapped.
> 
> Fix the original MSDU unwind to use skb_cb->paddr and skb->len instead
> of ti.paddr/ti.data_len. The ti fields cannot be used after the ext
> descriptor is mapped because they are intentionally reused for the
> buffer submitted to TCL. Also clear skb_cb->paddr_ext_desc after the
> ext-desc unmap so a TCL ring retry cannot observe stale ext-desc DMA
> state from the previous attempt.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 37a068fc9dc4 ("wifi: ath12k: Handle error cases during extended skb allocation")
> Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

