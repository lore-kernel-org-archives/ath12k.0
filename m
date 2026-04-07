Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94378FF511B
	for <ath12k@archiver.kernel.org>; Tue,  7 Apr 2026 16:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZ30nZnkzUWmAjcLPNF6a6T9pjqKEFiBBlMT7XZwp7w=; b=K92wpwRQbU2NzNqytzfEwFSrtS
	SLaFhf3MXq1L65KLk5gfjlI6sA5c37c3QBZ2AvQlCas3HRAESBVm/4igmZnrQ9OKdYqywfnUprqtI
	IyIxcMQFEhQN9Z6EuU54zSe/CZTbtxMpvlZNyzknLsWPmYC1ZdMYcZ35TjJwclbDOCJtyB14be8XM
	OnZOdR2O6yu6PZmc9gevOAmnbvE5/GacilkiLr6tN/mkp3R+aMPWwfl/rsUPwd92q30Sl0bwyW9iE
	tZ1TLJnVd9MQHfa0krNl2i80LVr9FQbS0dxo58w1pMLMtRp9xSU+oolQLTyF/3ojGYi6S+1YYdb0b
	LF/DuMxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA9Bo-00000006n0P-11OJ;
	Tue, 07 Apr 2026 16:22:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA9Bn-00000006n0I-0f7z
	for ath12k@bombadil.infradead.org;
	Tue, 07 Apr 2026 16:22:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aZ30nZnkzUWmAjcLPNF6a6T9pjqKEFiBBlMT7XZwp7w=; b=g/IJb6saIZcmiIyUYQ9TTjoj3G
	S9QCcgcppxvZBb2Z8kBVHXbWQnjbmar8T7bwGbdeO9+3FZUMeIr9kCnpdOuQSDQyc6Maa+jJXItE6
	XAhLautcTwzxUQFr9lLBEQVKrcBuoyo1QfBV/7Xfc5Czkh0Pv0ASCqqsCOtO/iNyFRL7vYBFATYaP
	wThD/hR0x5JhQq8E/KNOpZMb9SwWlNK/pbb0OWsDsN2vmZTsKL0595hm1fHynA/M3xANq9WOYZAhd
	XXT3J3Re0NL1qaKbXQ9ZDwSJ74LtReXZFwnKK+avFcyhFq+jiFVX6vud4+g8tAafvk6hDBsbWjcM1
	EqNbOLaQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA9Bj-00000008goa-39Vp
	for ath12k@lists.infradead.org;
	Tue, 07 Apr 2026 16:22:06 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637D36pa3402372
	for <ath12k@lists.infradead.org>; Tue, 7 Apr 2026 16:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aZ30nZnkzUWmAjcLPNF6a6T9pjqKEFiBBlMT7XZwp7w=; b=eIoZTLVoLPSr81cL
	+q44q76Z5BMyMlSlCQwEP1duZsFwM8VAC0Mb7n+h72ob+p65xFEZkR3CyTAKZVjp
	G/cZKD5IIqEGFEWUThJrpO0fjqVfPD+VaRO0Z/5ZCTaw7jLGO1zFAy4dKK75GeQ4
	oWvIAjg4tEjRbi+eGshrJGlStCcDo2jOHNlb15Yn51ajeCSC/lsDle84mjWZ+vtS
	tlRN+gnj4B2V2JNnjRdQODomiesbYAU2JRxZFqf0ApL6Gd/0GJg7Z3AJUrbka8Hj
	iF4NecsHQKCMYNGJYT2Ctz2aJT/4JTq8tT6M5GlKJQqeaI6K/NwOdTLsRxm6rVTG
	TPjOFg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrhuk2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 16:22:01 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76b0e04285so1875097a12.3
        for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 09:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775578921; x=1776183721; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aZ30nZnkzUWmAjcLPNF6a6T9pjqKEFiBBlMT7XZwp7w=;
        b=h0FymXpd93uJRIdFkxtXBIdZOD0o3viGj6AXEVTuEQ6+7VBJ3OBlvOHNnpic/Q4QmG
         mBthp873rKks6CyI2moH5RHpib5sThJFX6IB/aX2XqeuQR6pWtqCTK7/sEW0srCDbesW
         nVnhNf6L7vTCOLZjTwSRxqBT/BlS0bQGHQt5juN4dVDDOnq9WjsEIH1QapsfLmYIz04c
         J5qi5lifikl8Xywr1ubijsEkionSIhSMAbI/WqU729Wng5NItt6cRzQGNH/EU17zpNsp
         5aQJDZwLrfY/0nsUWVsKdWuvSkdkY1omNgLYkBtbSIIvNzEJZUl4PPoHEdOI87Khq5V4
         TL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578921; x=1776183721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZ30nZnkzUWmAjcLPNF6a6T9pjqKEFiBBlMT7XZwp7w=;
        b=pp1Kw2e+pC/27x1Q+2wUoOXvt6ucP5a9EyJhz/jjCADdBZF5H0sUHwi40Ha6Ztl96M
         yzRs/l2Q/Ep3lMoJOzNRMu8bS1dV3sk8z135L6LDo6uuV1rN7gsvVinkMON+vORnQjyp
         NelQfxd+xsPRbtTLjg84LO98UtEUMR344dZ80df5hUR3pwajZmu84q8CRYhmvR4jIt9T
         jcF0We/jUrArfGY93R2N5CmHaq5sT2Z2IfcDx2m9YrN1rdmdTjCgX/jV3VsXs+BrutS5
         1sgimE5Gtm12eS81eV+K+8RSEBbHBuaEVGOhz53nwh9fHcGBBmV0lfcUtm/DH0/n+bXl
         R5vw==
X-Forwarded-Encrypted: i=1; AJvYcCVMUSzUEug76Aap5tXUVswUu+4x15GFlULMLmJCb0HUU4oiTBAQcx/RCjsZdzExImc5o6XtFFM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8KBHHLXVvbRxbhlLwxHM37a1lQXNc9Pe5DofkBC0xQ/MTVIWg
	ip4K1CmBujLRtymjIOCMt1zQaF1Do1Dr7lZH/RYKgIAAAKPr9XZFi1cznQOmriCidrSbJwD1hTc
	YlvlEf9lPVbitb2CZLNGZzYq/H+CzbE6MVO40H4WYqxyhmHKM06bLpo3G7fr2e+at
X-Gm-Gg: AeBDietzWFWuixtawgoA07z2qeNUtq7UYVp1URJMr3G8D+zUn2ODdJGrLsk3YGlwjQH
	IRVSkHFI+drAiobG+MAWuPMB7AfpThOZGoiDS4TCm6xSDR81LQh/30n7TrHCmuNsYBhDQ2rruPk
	xlyx94CNx4LQOCQKbqTOZN6zc4Cg9ORD6XnPeGL2HGruvrPi8TonY98+CqSgK/bvsG/2WVmLd3g
	ooRUSHgMwzwh2vFysD+DgqM2ASEmzTkM2EpKRKJVxGh4ZBkyfRiPSW55N7ReGy8Aj5WyWJbiCkf
	LV6Aboby3VLPOHc/BoXAD5C1MuyoKqjDAOFDZW585tVt/x1Hi5vSwcGik5rAm1PPztIWcwifrN8
	uAvW70+Z0aSYS5OsrEon3hSbGOTZnBL/neQqNYKjnLyAQ/wtNUNug/HImJKQhtYE3ew==
X-Received: by 2002:a05:6a00:13a8:b0:82c:d5be:d28a with SMTP id d2e1a72fcca58-82d0db6ac92mr16146586b3a.31.1775578920681;
        Tue, 07 Apr 2026 09:22:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:13a8:b0:82c:d5be:d28a with SMTP id d2e1a72fcca58-82d0db6ac92mr16146545b3a.31.1775578919884;
        Tue, 07 Apr 2026 09:21:59 -0700 (PDT)
Received: from [192.168.11.106] ([124.123.81.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c3d439sm19025087b3a.35.2026.04.07.09.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 09:21:59 -0700 (PDT)
Message-ID: <ffce1c33-d8e3-412c-b681-a980b405aa42@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 21:51:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v5 3/6] wifi: ath12k: add ath12k_hw_version_map
 entry for IPQ5424
To: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
 <20260407-ath12k-ipq5424-v5-3-8e96aa660ec4@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260407-ath12k-ipq5424-v5-3-8e96aa660ec4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE0NyBTYWx0ZWRfXzHJcYjMJ9S/e
 1yuewbtShuq6egqj5dYrlfV7hKI2n7AYKsLZbtevtB6wOUXl1qMWYzoCQjtN1LuZxyZCsMYo3hI
 ffNIVChJ8FGVW292Kh5LPpcFFd7+RJWf+9CUH1QN21udUHeoBM1JFpOgLlJhnn1owvdVOtozCpy
 MZf4enQUtWSH7EfFZTMp3CpWSCg5YyiPyQ85jqc2VX8zII1dGQdxdhh/RPv7C1WNzUwcbChEHG9
 Am0eJW1wJG71dYG/MOVynvXjaK4MGigYkNPkrr72Dg27OEjDNeFze8NVtn8R4hpN+QakHxnuVe+
 MKMmHehWVTtdfUxCDDHRV+E8dUuAW5lvkZFJcCyHABI8g0oDIFFDe0p/cJy/3DGmMNva1mpeSFo
 9APo807YFNJyC6/ypgLSwTFfIZKg35bGM0eYC/XqdeGe4/4vYuxAVX3GQGZXbelqdQX9FV7FvbB
 PJ29DomOcGeBurjSvYg==
X-Proofpoint-GUID: 0mLH8dtPfTaD3nMTxZ75Rd2envtfk4c4
X-Authority-Analysis: v=2.4 cv=XPUAjwhE c=1 sm=1 tr=0 ts=69d52f29 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=R7zuFBDiW8lgADV909h7jA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=AiuA0lUDFxK_Uw9U_U0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 0mLH8dtPfTaD3nMTxZ75Rd2envtfk4c4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_172204_328436_565D68AF 
X-CRM114-Status: GOOD (  15.66  )
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



On 4/7/2026 10:56 AM, Raj Kumar Bhagat wrote:
> Add a new ath12k_hw_version_map entry for the AHB based WiFi 7 device
> IPQ5424.
> 
> Reuse most of the ath12k_hw_version_map fields such as hal_ops,
> hal_desc_sz, tcl_to_wbm_rbm_map, and hal_params from IPQ5332. The
> register addresses differ on IPQ5424, hence set hw_regs temporarily
> to NULL and populated it in a subsequent patch.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/wifi7/hal.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.c b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
> index bd1753ca0db6..c2cc99a83f09 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hal.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
> @@ -50,6 +50,13 @@ static const struct ath12k_hw_version_map ath12k_wifi7_hw_ver_map[] = {
>   		.hal_params = &ath12k_hw_hal_params_wcn7850,
>   		.hw_regs = &qcc2072_regs,
>   	},
> +	[ATH12K_HW_IPQ5424_HW10] = {
> +		.hal_ops = &hal_qcn9274_ops,
> +		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9274_compact),
> +		.tcl_to_wbm_rbm_map = ath12k_hal_tcl_to_wbm_rbm_map_qcn9274,
> +		.hal_params = &ath12k_hw_hal_params_ipq5332,
> +		.hw_regs = NULL,
> +	},
>   };
>   
>   int ath12k_wifi7_hal_init(struct ath12k_base *ab)
> 

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

