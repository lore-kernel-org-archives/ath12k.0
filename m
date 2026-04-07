Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1D2FF5125
	for <ath12k@archiver.kernel.org>; Tue,  7 Apr 2026 16:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVFqvNNdVvKctQ9L5qqutBnT5udGV6zQ0WX7R1ghubQ=; b=4aVw+K2E926wyCXCeJp4Wr/Dr5
	IiTJHFkwWAOJWSRZvtyvbruEtuQPH1PUB2HXpwnyK+dij97o2WsfxhqDYYM+WszyOqgrme1QZqdik
	buOsYzfNF9/SO2ayB1eTtVHXBnhpoDGRoBWS1nPP1Je3s+MSNbEIAvR8jKzSkbZgV/ftbB8QWvxGt
	fEpO3ztOs8shUGW07iKrUfXneIv/q/N9Pvf9Jv2s9ykztfypMBGgUXZsflF06ldQLRSedxDZM2JwX
	Y6kw+ZBIVVrfhvYEHCDHhlr72BkQJjD0BIwvj5/93KZU0iya9cvd0yAkO1S5fhaT3+pGgRRZaBKDJ
	cunLTjMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA9CS-00000006n51-0JeF;
	Tue, 07 Apr 2026 16:22:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA9CP-00000006n4k-2Y2r
	for ath12k@bombadil.infradead.org;
	Tue, 07 Apr 2026 16:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pVFqvNNdVvKctQ9L5qqutBnT5udGV6zQ0WX7R1ghubQ=; b=Jqxa5u0ZcFy7zN1VvbHIBW6q+Y
	6C18pJdPPirba399hCZWDldyixkval2f2lpsKy0i5cLfJ8GL/NY+/r5ZBKE/TOnkU5MnBc/67hnu6
	RivS5XHgAJnkPVhRe8AWtRslh/qQdgTfjHRzstbOJJnaqbcM+DJxzqltRrUDVKF6uJxHDBpBSdJT3
	Sod/eabaaUbCgkKSJ9F5tDoY954Q5uv/7cT6Zf2E1vjCRGcufpTTvJ+EfGNZFWt7xhAU7t/AePYCf
	WXYFRBroO0YObvKMS/s9CM+lGnQCNwtZJ4SSeZ3nKSIeqYbJvntFez3/RrMiPHgoWmCsi1e06mt1z
	7HmY2GVQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA9CM-00000008gtR-2cHp
	for ath12k@lists.infradead.org;
	Tue, 07 Apr 2026 16:22:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637Cxe7b3815234
	for <ath12k@lists.infradead.org>; Tue, 7 Apr 2026 16:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pVFqvNNdVvKctQ9L5qqutBnT5udGV6zQ0WX7R1ghubQ=; b=O3SC89L8Ht9aX3xu
	ZzGAqfWGA+PVzi5JavzPUSBxxQDINmlY9UYFiYpgku2qpREcCXD/5NjWOMGA9SYk
	sBn16yWi7FrX7tXRtF0oSnqh0MrjHWblxYL8oaqFBlujb9lafBmNVL7c4+Ul2zgD
	r0wcB35EKQ9Prdick7KdGA/K8CEvqnOLqRprGMESZJFk66hQ/wabIS2PXobyJQ+b
	4RkLYBfWLb/eX9YdYujdrwekGyrOhML+yJergbfA1Ek7GDFTD+eM9Pjo/I9gSZWv
	CHrLbz/sL3Ut0+IX/KONE1qjLoKlwRc5d3fU+pXdH/rlzxBjW8QMOFQ8SVvQcocG
	ZslnJQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4um9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 16:22:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2523e0299so130471155ad.3
        for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 09:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775578959; x=1776183759; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pVFqvNNdVvKctQ9L5qqutBnT5udGV6zQ0WX7R1ghubQ=;
        b=jLGTyS2qlbwr8dl2oMpxjeyiqrA9+AjKadE79tbRFM46TV5QC7pt08lnZ71kv35NA0
         Kg0toeGSHbCbc1Tp8EfeIa+UEty7S+29M+KOhkq5nnHPpPWaegAyhE3Qr++373G24fN0
         UL59usWAY8ZC/szTlIUWElyr/S9sTf/n7HsT2uJ1xKWTfOK4NDdOGlcM9joeJxWcxFFt
         HX0uZxm9GpN/BOR8KSi+PlJnmB9M0oMQECoo14J8NoXtia/e4a3KexUSWN7raWy3bV0I
         hI0YMT/DyMFF7TNY/wfPfsfMxMki0yoR+8AWEYKWI3G6M0CDGanr1m0MkQQeJ56TY+VJ
         544Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578959; x=1776183759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pVFqvNNdVvKctQ9L5qqutBnT5udGV6zQ0WX7R1ghubQ=;
        b=QPDiYPbNaYy2d5SC4YYpZJ2Hc+8iZMoaVjFeZLQFLCIQGQEWEsJoXF2tF7z6nwID5j
         DMh+QfPthgrXGcIXxyp0g/I2G5al0JddHx2Kz7gpkIau5YFJ7ssKlfrZaUU/jeXMchDx
         RgINRhQ3u7V5GxpdYQZBxQjYr9S+OWtgsYnyaXzCC3BS7krmZYxPnIMHm4z2k1QyC2Q4
         bfEOlwqA5/rCm/pH7PijKFF95oP7C+I2lGYLZP+tj9NX77HIP1TBOd/0bskS9fivjhpl
         B6viQOLP5h3BsUNvASL472uMxngVBiq7ciPOOULmkpZYpfJqu5v5fMqXUTCAYYv4enyx
         aDwA==
X-Forwarded-Encrypted: i=1; AJvYcCXA/iiTCwHQxhf+RXXCuxrotEZuizee2V54GdXLcUGG/C4XuxvGKRRqn+oZLrflnY+6Npw8W6A=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx4P51aNQUhMeihp+KOJzXUqAasNjch6ERM5LLjMU7OYv/OhsM
	2FENfFoLkicW9ZgN8v6cFLtI9cilHw40OLjJzddVabnxyZb+OZ5HSvffu/vD5hemQ6CGd+a+RS7
	qojEYNTT5/DXjZBz/uTLryijYdc8ehkUfYj4++uvhbH5+wGLdBcMGSDi0n4O+d/Aq
X-Gm-Gg: AeBDieu1802j8rzoFSnXj5YKhVQ3VkwuL5c7VvwM9fcZjeI3wRV9x0RLcmQQeaGcxLP
	JcDsxLQrzAXpsmAsg8SbvQhyilinhm12t5clsCoE47Ib15rIK/xkcWUi4DfKUYBSNY2bQRRcpH0
	PoBuLwMq3QCbE7AX6u08l0WSHVf2jQWMR8c4ovErvsh2sbrOSpeI4VELEau8vCg50aV1+4T2wzg
	/CKZaGDq5IJGJF1TnIPGeUrFfoVSd8bYIXfEYLYbLuEDPVAHqztsbgdCOnv3cN+Nmw79FWBWNHy
	qoZphC2hDlDqU+zoj+/0xB9+Da5lB2pL3glRdudLFI/wdtDt39cBcgS7Vxm9bi8cZDqI7ukravO
	CLhCCESinr/+Qe0wZ9jrhXoyC7V69PeQhrzC9w9FLlf193lSf5UX3Lu0hkoRFZ2TQJw==
X-Received: by 2002:a17:902:c409:b0:2b2:4f43:b498 with SMTP id d9443c01a7336-2b2817361bdmr198081455ad.13.1775578959148;
        Tue, 07 Apr 2026 09:22:39 -0700 (PDT)
X-Received: by 2002:a17:902:c409:b0:2b2:4f43:b498 with SMTP id d9443c01a7336-2b2817361bdmr198080935ad.13.1775578958289;
        Tue, 07 Apr 2026 09:22:38 -0700 (PDT)
Received: from [192.168.11.106] ([124.123.81.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af31sm172747805ad.52.2026.04.07.09.22.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 09:22:37 -0700 (PDT)
Message-ID: <be871892-cb95-4316-bdf4-4609f1c46d0b@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 21:52:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v5 4/6] wifi: ath12k: add ath12k_hw_regs for
 IPQ5424
To: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
 <20260407-ath12k-ipq5424-v5-4-8e96aa660ec4@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260407-ath12k-ipq5424-v5-4-8e96aa660ec4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d52f50 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=R7zuFBDiW8lgADV909h7jA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=PSaGKYAotCzfqHVnBd8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: VV4AiPngkxD34s2yr0iyAZ1N8KyaxHrD
X-Proofpoint-ORIG-GUID: VV4AiPngkxD34s2yr0iyAZ1N8KyaxHrD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE0NyBTYWx0ZWRfXyPD8zf1oyPZG
 D8dSIx1Hz+pOsuaOY9rzIOKe3kThTo+D4mDKbjgGVc1pq6zRcq56OBdRmx7vs61dwkBzH3p9XhS
 Ww7lcJ9z/1SHgaQddwxUsWsULJoSFKDOYLpLgI/8hgYTsx/vxLaHbb/ukOLejTWu2gOvCiETIQy
 JRSW67KL+tQxQHO3RUKHOA3uqBoMjoMVhREtaAJkh1XIZDhWbqKELeR+RJANP+Pku0ST66pgj0o
 FsJMWbigetdz/KhcRRrJniB1xaA1lmjHjxcMyFz/IufzkxvVr/S85yFXeQPTMdqLEdP2GDKGKks
 yrXTe3rkcDz9xrtA6SesNCf6EaO7TsYyo2sy+eqeaYSSMiuXiUkIoo0JeR2MY9JnIBADaeKQIE4
 EffPtrO8MO+fHAq9RLZQ+8A9tbVu3MQ6eE5qvBF9aqbhCqfuufH7MU+UljtCuCvgGVbzrO9Hy0s
 ZF9nwehSFe2vDfgtM2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_172243_060950_4D7BA944 
X-CRM114-Status: GOOD (  17.03  )
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
> From: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
> 
> Add register addresses (ath12k_hw_regs) for ath12k AHB based
> WiFi 7 device IPQ5424.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/wifi7/hal.c        |  2 +-
>   drivers/net/wireless/ath/ath12k/wifi7/hal.h        |  3 +
>   .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    | 88 ++++++++++++++++++++++
>   .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |  1 +
>   4 files changed, 93 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.c b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
> index c2cc99a83f09..a0a1902fb491 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hal.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
> @@ -55,7 +55,7 @@ static const struct ath12k_hw_version_map ath12k_wifi7_hw_ver_map[] = {
>   		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9274_compact),
>   		.tcl_to_wbm_rbm_map = ath12k_hal_tcl_to_wbm_rbm_map_qcn9274,
>   		.hal_params = &ath12k_hw_hal_params_ipq5332,
> -		.hw_regs = NULL,
> +		.hw_regs = &ipq5424_regs,
>   	},
>   };
>   
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.h b/drivers/net/wireless/ath/ath12k/wifi7/hal.h
> index 9337225a5253..3d9386198893 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hal.h
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.h
> @@ -364,6 +364,9 @@
>   #define HAL_IPQ5332_CE_WFSS_REG_BASE	0x740000
>   #define HAL_IPQ5332_CE_SIZE		0x100000
>   
> +#define HAL_IPQ5424_CE_WFSS_REG_BASE	0x200000
> +#define HAL_IPQ5424_CE_SIZE		0x100000
> +
>   #define HAL_RX_MAX_BA_WINDOW	256
>   
>   #define HAL_DEFAULT_BE_BK_VI_REO_TIMEOUT_USEC	(100 * 1000)
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
> index 41c918eb1767..ba9ce1e718e8 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
> @@ -484,6 +484,94 @@ const struct ath12k_hw_regs ipq5332_regs = {
>   		HAL_IPQ5332_CE_WFSS_REG_BASE,
>   };
>   
> +const struct ath12k_hw_regs ipq5424_regs = {
> +	/* SW2TCL(x) R0 ring configuration address */
> +	.tcl1_ring_id = 0x00000918,
> +	.tcl1_ring_misc = 0x00000920,
> +	.tcl1_ring_tp_addr_lsb = 0x0000092c,
> +	.tcl1_ring_tp_addr_msb = 0x00000930,
> +	.tcl1_ring_consumer_int_setup_ix0 = 0x00000940,
> +	.tcl1_ring_consumer_int_setup_ix1 = 0x00000944,
> +	.tcl1_ring_msi1_base_lsb = 0x00000958,
> +	.tcl1_ring_msi1_base_msb = 0x0000095c,
> +	.tcl1_ring_base_lsb = 0x00000910,
> +	.tcl1_ring_base_msb = 0x00000914,
> +	.tcl1_ring_msi1_data = 0x00000960,
> +	.tcl2_ring_base_lsb = 0x00000988,
> +	.tcl_ring_base_lsb = 0x00000b68,
> +
> +	/* TCL STATUS ring address */
> +	.tcl_status_ring_base_lsb = 0x00000d48,
> +
> +	/* REO DEST ring address */
> +	.reo2_ring_base = 0x00000578,
> +	.reo1_misc_ctrl_addr = 0x00000b9c,
> +	.reo1_sw_cookie_cfg0 = 0x0000006c,
> +	.reo1_sw_cookie_cfg1 = 0x00000070,
> +	.reo1_qdesc_lut_base0 = 0x00000074,
> +	.reo1_qdesc_lut_base1 = 0x00000078,
> +	.reo1_ring_base_lsb = 0x00000500,
> +	.reo1_ring_base_msb = 0x00000504,
> +	.reo1_ring_id = 0x00000508,
> +	.reo1_ring_misc = 0x00000510,
> +	.reo1_ring_hp_addr_lsb = 0x00000514,
> +	.reo1_ring_hp_addr_msb = 0x00000518,
> +	.reo1_ring_producer_int_setup = 0x00000524,
> +	.reo1_ring_msi1_base_lsb = 0x00000548,
> +	.reo1_ring_msi1_base_msb = 0x0000054C,
> +	.reo1_ring_msi1_data = 0x00000550,
> +	.reo1_aging_thres_ix0 = 0x00000B28,
> +	.reo1_aging_thres_ix1 = 0x00000B2C,
> +	.reo1_aging_thres_ix2 = 0x00000B30,
> +	.reo1_aging_thres_ix3 = 0x00000B34,
> +
> +	/* REO Exception ring address */
> +	.reo2_sw0_ring_base = 0x000008c0,
> +
> +	/* REO Reinject ring address */
> +	.sw2reo_ring_base = 0x00000320,
> +	.sw2reo1_ring_base = 0x00000398,
> +
> +	/* REO cmd ring address */
> +	.reo_cmd_ring_base = 0x000002A8,
> +
> +	/* REO status ring address */
> +	.reo_status_ring_base = 0x00000aa0,
> +
> +	/* WBM idle link ring address */
> +	.wbm_idle_ring_base_lsb = 0x00000d3c,
> +	.wbm_idle_ring_misc_addr = 0x00000d4c,
> +	.wbm_r0_idle_list_cntl_addr = 0x00000240,
> +	.wbm_r0_idle_list_size_addr = 0x00000244,
> +	.wbm_scattered_ring_base_lsb = 0x00000250,
> +	.wbm_scattered_ring_base_msb = 0x00000254,
> +	.wbm_scattered_desc_head_info_ix0 = 0x00000260,
> +	.wbm_scattered_desc_head_info_ix1	= 0x00000264,
> +	.wbm_scattered_desc_tail_info_ix0 = 0x00000270,
> +	.wbm_scattered_desc_tail_info_ix1 = 0x00000274,
> +	.wbm_scattered_desc_ptr_hp_addr = 0x0000027c,
> +
> +	/* SW2WBM release ring address */
> +	.wbm_sw_release_ring_base_lsb = 0x0000037c,
> +
> +	/* WBM2SW release ring address */
> +	.wbm0_release_ring_base_lsb = 0x00000e08,
> +	.wbm1_release_ring_base_lsb = 0x00000e80,
> +
> +	/* PPE release ring address */
> +	.ppe_rel_ring_base = 0x0000046c,
> +
> +	/* CE address */
> +	.umac_ce0_src_reg_base = 0x00200000 -
> +		HAL_IPQ5424_CE_WFSS_REG_BASE,
> +	.umac_ce0_dest_reg_base = 0x00201000 -
> +		HAL_IPQ5424_CE_WFSS_REG_BASE,
> +	.umac_ce1_src_reg_base = 0x00202000 -
> +		HAL_IPQ5424_CE_WFSS_REG_BASE,
> +	.umac_ce1_dest_reg_base = 0x00203000 -
> +		HAL_IPQ5424_CE_WFSS_REG_BASE,
> +};
> +
>   static inline
>   bool ath12k_hal_rx_desc_get_first_msdu_qcn9274(struct hal_rx_desc *desc)
>   {
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
> index 08c0a0469474..03cf3792d523 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
> @@ -17,6 +17,7 @@ extern const struct hal_ops hal_qcn9274_ops;
>   extern const struct ath12k_hw_regs qcn9274_v1_regs;
>   extern const struct ath12k_hw_regs qcn9274_v2_regs;
>   extern const struct ath12k_hw_regs ipq5332_regs;
> +extern const struct ath12k_hw_regs ipq5424_regs;
>   extern const struct ath12k_hal_tcl_to_wbm_rbm_map
>   ath12k_hal_tcl_to_wbm_rbm_map_qcn9274[DP_TCL_NUM_RING_MAX];
>   extern const struct ath12k_hw_hal_params ath12k_hw_hal_params_qcn9274;
> 


Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>


