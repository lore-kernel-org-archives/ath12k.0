Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32657606E172
	for <ath12k@archiver.kernel.org>; Tue, 24 Nov 2026 17:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0CDCuZRE;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=On0RbNge;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XIENyuOK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3C06+AGRplNn4HpuEEq4N+vB6T6r5jTxGaKPsMTS1cI=; b=0CDCuZRE30wZpk
	6zBg/GgsqSWpEq0fHlEX4+D6IcSr1WA2/t3XC07agr080HvPHZk4OShSFJwJ/+NTeJSQEUhncX+G9
	sXjsNOA2+UdTC+XPclQeaHy15/PMzmJ74Mk7GtOYdpCGrm3PiPdJyqgm6E2dS7oRAZNF9MZOtpiEs
	7cNtIHcuAH7uLu7bL4Ngut+e60V0ku90DwsnMpq8adk11KeaCk34AFvDRXfKm1YBO83NmGXe0JOuP
	W4T+76LLNHV1pOwg1PWMdpeaVRXS/1o16hJVvAwxFvLKo+LC8BuNevIlh1cuD8Z0ZrVFRwmKb/ApK
	Fq8z/mnFnsz+ro1A3z5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu3L-00000007IAT-3vM4;
	Tue, 24 Nov 2026 17:11:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu2n-00000007Hzq-0l8j
	for ath12k@lists.infradead.org;
	Tue, 24 Nov 2026 17:11:02 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL6U01696908
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 17:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3C06+AGRplNn4HpuEEq4N+vB6T6r5jTxGaKPsMTS1cI=; b=On0RbNgecIE+Z6ZA
	UevaVQVEqEWIaEY9S/3PLJ46Z9LcW+1gf/bfmdaRWe/Ilx/XTrwEEqpfOO1ST/E2
	3jITyDrQkrWVXoSF9MEY3CxphB5sH1PbqrP8UlNjOYs0+KsZuIPLlrWJQ49U3r06
	SExIAvKnAlHLn1DMtInny6jyMjrhkpAOe2coFxsSgbuUCN359crdKLEicH3X0tU9
	fZMsLcHjPasu/h168BdK9q//DjwFm1CIJvPMk9fmiaKRcDEUDjDIBLjS6V4MZrMD
	hAtjcroeagok/FN9zShwSjT0Wdv9xzPBX7mYkHNSqwKtdwQY9oF9458JQQXA1LMk
	lYZwfw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b80167c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 17:10:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f04004edf1so31966705ad.3
        for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 09:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795540258; x=1796145058; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3C06+AGRplNn4HpuEEq4N+vB6T6r5jTxGaKPsMTS1cI=;
        b=XIENyuOKsoY+THeCqp6Sqrd1BGUza8KsJm8nzqYHVPC5gfPVVseDcmkH31ZfNosO0Y
         jEXwnfsviH8DBdVVaC6yYaiGhNPCfzmVhMuu5msFQDDDBg7YHRwFCbWwMQsO3yzjX8qC
         SzmYA8eW5HIsJJMlWA6jXjGr8tCnpVTZIME6+mmpyCCy6veQVyeQS39Yi7rmHGG32/oG
         flrCfaQ5rKbu6lAxvkU1MCbIcTejlKoWUg+KuATTnS23Xv2j7gzyQ6Es3rlqJeDMJwvf
         nsdtLao6k52O/zNTjh1DHCKPq0tC0ZhIABNGHhf5CQHMBDHubecVb9Hol79cV+pTJA5E
         nzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540258; x=1796145058;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3C06+AGRplNn4HpuEEq4N+vB6T6r5jTxGaKPsMTS1cI=;
        b=NM3HxCsQ9Gzu2hEFdyFXLm4qj05Vrsblk0ypr7XolkexVUi8Mn21et+1ru41Qu96As
         E3pzfSiqjA0BZ4gTlFRoWFhMww1tBu7xTpZCn5FR3bsmTQDG4haDlKxNGn7kewH7UdBu
         nsGJPX8swykGqkb+U9aaP3eqB8ejdKkqszH/4LWVD+Ega/vBq8TqceXmAKTlWAOJqwMA
         pborto1aZvRNtf1+RrDYsoSU3rfcUgVYGnYpZwxG/XvOjoxJUA+H8ZY9VVI4lBcy2Xil
         szBfUkubFZaIf99bvpGAn8MY+Bm2MTRy+tH1rJ7NURQaCxD/wigglNmlRBtgsLQBsrG3
         hpfg==
X-Forwarded-Encrypted: i=1; AL+hErGHsL7INFVbSRFn1nIROTPy4pAmiZQoowDjX1zQuLSJw6xElaDgmsD41YVkerzaw07cwvQJuxY=@lists.infradead.org
X-Gm-Message-State: APuU4Z+WejkUKGzHICmeUkC8uW4yS7wTGWtMOxgMstekq7R1Ra03xrtz
	j0TNnBOZ2BqlSOsI4XtOip/u6Z7ZS+jx7bwltDntq0Swved7QYPdrxEilQuw4NWLDJAmt2Koi4i
	JvS197/s+GCorv89u9mgaC1H44egNG17HoBN0ljFEujksk1zMECLVqHp8yWZ3oEo9
X-Gm-Gg: AZFdTZcJDOBK4QcY5kPmivGA1jib03YtlIljsogZwZUeBGkQQtVvqbt+q5/LlsV7Ojz
	u73ePK3lKE39qd8yzMkMAeo+z9vO8VNYkxCfxHMGh26hYerWo58ea6alnNo/ni5GLDOTzo/85FL
	4ltROSqnYn95AZabnCLSrOtRYqJvqA46voNwyayTrlflAIqxLtKrBE8WYaV2qyJgS5/v7Ho910I
	ngsQQqeEpgqHoDVadBVVm3pdB6imSeuPJqK5Ca6vVyK47Zsn6UdLEftv19uhQcKjI6unJgg8Ltx
	lbZ71cMrG6IkIP6XHxS5ls5sdkm/7anH1GkQq8uPPHCuCFiQzRW5xgSt8O9JnfPbM/F7X53U1RK
	ilrtEfrMfg6gx0fn5zlCuLU6KcX5AZ9XIoHROf2ixt34TwkNtP/Tmb1H3lQ8qaMgB/T+43v1X94
	+o717cJFqe9S8IBPpnKw==
X-Received: by 2002:a17:902:e80b:b0:2e9:9a19:c43 with SMTP id d9443c01a7336-2f03f118277mr150323185ad.15.1795540258192;
        Tue, 24 Nov 2026 09:10:58 -0800 (PST)
X-Received: by 2002:a17:902:e80b:b0:2e9:9a19:c43 with SMTP id d9443c01a7336-2f03f118277mr150322945ad.15.1795540257698;
        Tue, 24 Nov 2026 09:10:57 -0800 (PST)
Received: from [192.168.0.3] ([49.204.135.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f14a432sm72737855ad.75.2026.11.24.09.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 09:10:57 -0800 (PST)
Message-ID: <9e1403bc-9069-4024-b4c2-c62c2f0d5100@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:40:51 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 00/14] wifi: ath12k: add initial Wi-Fi 8
 support for QCN9575
To: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
References: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NyBTYWx0ZWRfXw/U2QzPNQviO
 qys0d4Lw00qf0aAkjgO0zpVi33q6biOsqH/z1CpF40NIk+24k9KjGJoyignw4c59GFGA9Z5yqeM
 I+sMQ4462AB5IJwa74/dVYfzjQVwHI1zvjyQV+U2jHeRNTfSu1Y11o0p+fFkHrxj0G+eZosk8x0
 Gj982u0/k8I4YTtJQfA1rDa+cnIBiBxy8j36inibu7O8SettcTLvbYkoCMt5uSE7z9Cb52Dln5x
 Dg4DRzcLRKGrzjtS6b73hq5AlKwZyOpLVYsCekiEw80h2Eav8rhiv5CsYSddQq5psRaRj3r7xgo
 3XeDhzOax8lC2zGNeeTXt5kJPFe+Fr4gVWx+M2rl1xq0PI/z8fTsWq/mjb+aRgteAwvUjUhMneN
 fsHynaTlJNkjn7GPlXtucbmNMx8ZFILHKBQKOVHwU97Y+TIb8HvZqIyAx2Iz/aEj3FbxvVquMvd
 i0qoNd/bQ+kZcLiXzeg==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b05c523 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ag5bUDVj9uQYXS0Rj44fbA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=stkexhm8AAAA:8 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=JfrnYn6hAAAA:8 a=BwtDmdOm_RcmM6cCN5sA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=FO4_E8m0qiDe52t0p3_H:22 a=pIW3pCRaVxJDc-hWtpF8:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: KMVAzG3_BScGfjZSUy9OH1zYs_UE3CG2
X-Proofpoint-GUID: KMVAzG3_BScGfjZSUy9OH1zYs_UE3CG2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NyBTYWx0ZWRfX0xNX8dDEoVyw
 sNOV5XwXnlDkTDL8EucB95dgHVwBf/qk/KLYhwKLs/TvN0QB9C3dW+EkkPdE//Y9mTHz/sFdZvW
 Sgq4RToLNOWYlpOabGwNyAOn1ejPn0U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_091101_410522_2DA05054 
X-CRM114-Status: GOOD (  28.55  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 24-11-2026 22:13, Madhavan Ganesan wrote:
> QCN9575 is a Wi-Fi 8 (802.11bn) PCIe target that represents a new
> hardware family distinct from the existing Wi-Fi 7 devices (QCN9274,
> IPQ5424). It supports 2.4 GHz, 5 GHz, and 6 GHz bands across upto two
> radios.
> 
> This series adds the initial bring-up scaffolding needed to register
> QCN9575 with the ath12k driver. No protocol-level 802.11bn features are
> enabled yet; the goal is to establish a functional base with the new
> ATH12K_DEVICE_FAMILY_WIFI8 family tag and a dedicated wifi8/ subdirectory
> that follow-up series can build on.
> 
> Patch 1 moves the PCI window register constants from pci.c into
> per-device structures, so Wi-Fi 7 and Wi-Fi 8 can each define
> independent window layouts instead of sharing one fixed set of
> constants.
> 
> Patches 2 and 3 extend the shared QMI layer: a larger WLAN config
> message to describe the CE and service pipe count QCN9575 requires,
> and support for downloading an extended firmware binary.
> 
> Patches 4 through 12 introduce the wifi8/ subdirectory with its own
> Makefile, followed by the hardware scaffolding: hw_params, HAL
> register table, HAL ops and descriptors, unified firmware image
> support, MHI channel/event config, CE and service pipe map, WMI
> resource config, and hw ops.
> 
> The final two patches integrate QCN9575 into the driver: a mac80211
> ops skeleton is added and hooked in, and the series closes with the
> Wi-Fi 8 PCI driver scaffolding. QCN9575's device ID is intentionally
> left out of the PCI id table in this series, so the module builds and
> links cleanly but no physical device can match and probe; the id
> table entry lands in the follow-up CP/DP series once the device is
> actually functional.
> 
> Each patch compiles and links cleanly on its own; where follow-up
> patches fill in callbacks, stubs are used to keep the tree
> bisect-safe.
> 
> This series has been boot-validated on internal firmware version
> WLAN.WBO.1.0-01410-QCAHKSWPL_SILICONZ-1 together with the remaining
> Wi-Fi 8 enablement patches (CP, DP setup, MAC datapath) that complete
> device bring-up; those patches will be posted as a follow-up series.
> 
> In addition, each ath12k driver patch contains Tested-on: tags for
> existing platforms where it was verified that there are no
> regressions.
> 
> ---
> Changes in v4:
> - Dropped patch "dt-bindings: net: wireless: add ath12k wifi device
>    QCN9575" per Krzysztof's review comment.
> - Link to v3: https://patch.msgid.link/20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com
> 
> Changes in v3:
> - Replaced u32_replace_bits() with a plain AND/OR in "refactor PCI window selection to per-device layout" to fix a build failure.
> - Link to v2: https://patch.msgid.link/20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com
> 
> Changes in v2:
> - Addressed sashiko's review comments in patch "refactor PCI window selection to per-device layout"
> - Link to v1: https://patch.msgid.link/20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com
> 
> To: Johannes Berg <johannes@sipsolutions.net>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Jeff Johnson <jjohnson@kernel.org>
> To: Nathan Chancellor <nathan@kernel.org>
> To: Nick Desaulniers <ndesaulniers@google.com>
> To: Bill Wendling <morbo@google.com>
> To: Justin Stitt <justinstitt@google.com>
> Cc: linux-wireless@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: ath12k@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: llvm@lists.linux.dev
>   
> ---
> Madhavan Ganesan (14):
>        wifi: ath12k: refactor PCI window selection to per-device layout
>        wifi: ath12k: add extended QMI WLAN cfg for CE and service pipes
>        wifi: ath12k: add QMI support for extended firmware binary download
>        wifi: ath12k: add Wi-Fi 8 directory and base module scaffolding
>        wifi: ath12k: add initial Wi-Fi 8 hw params and init helper for QCN9575
>        wifi: ath12k: add Wi-Fi 8 HAL register table and hal init hook for QCN9575
>        wifi: ath12k: add Wi-Fi 8 HAL ops and descriptor definitions for QCN9575
>        wifi: ath12k: add unified firmware image support for QCN9575
>        wifi: ath12k: add Wi-Fi 8 MHI config for QCN9575
>        wifi: ath12k: add Wi-Fi 8 CE config and service pipe map for QCN9575
>        wifi: ath12k: add Wi-Fi 8 WMI init for QCN9575
>        wifi: ath12k: add Wi-Fi 8 hw ops for QCN9575
>        wifi: ath12k: add and hook Wi-Fi 8 mac80211 ops skeleton for QCN9575
>        wifi: ath12k: add Wi-Fi 8 PCI driver scaffolding for QCN9575
>   
>   drivers/net/wireless/ath/ath12k/Makefile           |   1 +
>   drivers/net/wireless/ath/ath12k/ahb.h              |   6 +
>   drivers/net/wireless/ath/ath12k/core.h             |   4 +
>   drivers/net/wireless/ath/ath12k/fw.c               |   8 +
>   drivers/net/wireless/ath/ath12k/fw.h               |   1 +
>   drivers/net/wireless/ath/ath12k/hal.h              |  10 +
>   drivers/net/wireless/ath/ath12k/htc.c              |  18 +-
>   drivers/net/wireless/ath/ath12k/htc.h              |   8 +
>   drivers/net/wireless/ath/ath12k/hw.h               |   5 +
>   drivers/net/wireless/ath/ath12k/mhi.c              |   4 +-
>   drivers/net/wireless/ath/ath12k/pci.c              |  46 +-
>   drivers/net/wireless/ath/ath12k/pci.h              |  11 +-
>   drivers/net/wireless/ath/ath12k/pcic.c             |  27 +-
>   drivers/net/wireless/ath/ath12k/qmi.c              | 484 ++++++++++++++++++++-
>   drivers/net/wireless/ath/ath12k/qmi.h              |  73 +++-
>   drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |   6 +
>   drivers/net/wireless/ath/ath12k/wifi7/hal.h        |   9 -
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c         |  14 +
>   drivers/net/wireless/ath/ath12k/wifi7/pci.c        |   4 +
>   drivers/net/wireless/ath/ath12k/wifi7/pci.h        |   8 +
>   drivers/net/wireless/ath/ath12k/wifi8/Makefile     |  10 +
>   drivers/net/wireless/ath/ath12k/wifi8/ce.c         | 404 +++++++++++++++++
>   drivers/net/wireless/ath/ath12k/wifi8/ce.h         |  13 +
>   drivers/net/wireless/ath/ath12k/wifi8/core.c       |  31 ++
>   drivers/net/wireless/ath/ath12k/wifi8/hal.c        | 434 ++++++++++++++++++
>   drivers/net/wireless/ath/ath12k/wifi8/hal.h        | 171 ++++++++
>   drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h   |  88 ++++
>   .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.c    | 124 ++++++
>   .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.h    |  15 +
>   drivers/net/wireless/ath/ath12k/wifi8/hw.c         | 250 +++++++++++
>   drivers/net/wireless/ath/ath12k/wifi8/hw.h         |  14 +
>   drivers/net/wireless/ath/ath12k/wifi8/mhi.c        |  70 +++
>   drivers/net/wireless/ath/ath12k/wifi8/mhi.h        |  10 +
>   drivers/net/wireless/ath/ath12k/wifi8/pci.c        | 105 +++++
>   drivers/net/wireless/ath/ath12k/wifi8/pci.h        |  11 +
>   drivers/net/wireless/ath/ath12k/wifi8/wmi.c        |  57 +++
>   drivers/net/wireless/ath/ath12k/wifi8/wmi.h        |  13 +
>   37 files changed, 2510 insertions(+), 57 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

