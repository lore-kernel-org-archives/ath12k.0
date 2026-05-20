Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1286BCD4F3D
	for <ath12k@archiver.kernel.org>; Wed, 20 May 2026 16:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yDLA1uFh89hUYoc7hHwlt/GqNAgX4/LhiZU83C8g2Wg=; b=pan6BfpnqvDYOkj97amJUejQq2
	xsoZ6w6T/+qXXzP5ZcmEDXKGGLYeHb+JQyI2PvdrwgHtG2DU098yzpJHrVRMk65iHOPlUBjseuZ0M
	usUoDXMwMsM62b+HvgVj6yxsj1MPbIaZUQz7uaxgvY11aB7NM7Fc74eJpfDXbQXZKnCM1Y0k/d5+K
	/Y1TtH+Syuw6l2Zb4nQ8wemxB323fGXI7kL+CJ+Dpe503mmdangOaveKdZE0TpEQzGy8bnQqdLL3D
	2832lZ2J/9/TnAEMzjATPMCOUbux7NnRXkVplwbBcai0EKZdzi2MrgQJ/dMKfHc25aZKRWIyHKbbr
	offjDvbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjlJ-00000005Ac8-38w5;
	Wed, 20 May 2026 16:27:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjlH-00000005AbY-1TOe
	for ath12k@lists.infradead.org;
	Wed, 20 May 2026 16:27:12 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCe3W7316534
	for <ath12k@lists.infradead.org>; Wed, 20 May 2026 16:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yDLA1uFh89hUYoc7hHwlt/GqNAgX4/LhiZU83C8g2Wg=; b=GdR1oXdMGPiV/UyL
	GmRgMOjQyNdBFz98dduco6c3ld9VmhYxkarRT5XKZzJBXClsklr1Jc9bipbMHYQJ
	1hg4r/TkKvCKcumPRS+F8P034HDgXtCAr29x5188qAkjmUarQdRb2mgF6cK8fjRp
	VjLJ5q1jQA+/NMV/LgjZchOg9W5iNThMNTHR/XqWhkoe2wA6rqdZyWC1cQT2Ym2O
	GrgeQ1VwB1zro+46xv1NiyhQcknwiRrwZZYBuNHms1032nqKX9dKJrNI1ZcadK04
	VWBvWAFHJvmt+KvIE5zXRGrhrwRY5aborInFFJmgFtBMbJnBmP9tU8nSxSOxe3Ou
	Pl8SkQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9d5qry1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 20 May 2026 16:27:10 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2efc342ef15so6550351eec.1
        for <ath12k@lists.infradead.org>; Wed, 20 May 2026 09:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779294429; x=1779899229; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yDLA1uFh89hUYoc7hHwlt/GqNAgX4/LhiZU83C8g2Wg=;
        b=Hfks2Dip9PvSG9B2tBxWoDX3uIx0wWrb7BVVPu2Ev0QEppuqyFq9dnhdFuGhqlwUv5
         RFO2BVGsARKF+70lEhpvpA1xohblpoDxZzZrhDfD8WBVo04t5ClsALiaqOGMf2pUWnvr
         xUsV2DAySCwDHj6isYbp1/dLyetKqQNr8DkYA4ADfa3gjo3SxMMPwoFUKNRa00Y6TkFm
         2PO+3qCO/5gTUlstauziyoPamr+kDQ8Ngg+zr9syaM1HcXwq55R4kfH2GQKaf1f6iTtm
         Bcv7T44vPkqlPLip9XNaWT40lOba20twz+ihNsqf6mTkYGcwns6XxDdAk0DPsFg9LHaX
         unCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779294429; x=1779899229;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yDLA1uFh89hUYoc7hHwlt/GqNAgX4/LhiZU83C8g2Wg=;
        b=IH9+E69kLNbTenmGJLusSCLFs8ZI6vbC3qMYschv2FdmwoZfV9Y6iswpdF/qnpq1Pa
         cxV0pPFehlBbLUEyOywrArOQBi892nLBOJP7ZpgPfYzMqhBMWVdf3bLBa0U7jDR3KX7I
         DJw9bcUrEzCYfuqwRlhV89rrpmaJ8DFxyn435Ry+v/DHvGR0R8wVacZs5XuJkBnRz5gF
         sjaULIME0bJJfQA4fM2EsvyxNhIIBMEgckQ9VPJzUNqkRtohNDdJjcCuDb5fafWQ21Gd
         Qfy1EC3qCox/mLF2Rc1Akxj7vEykPbDpN4GJoOHFMD3Zj/6YLbB9TMWLsOCaPUb8z7FZ
         u5qg==
X-Forwarded-Encrypted: i=1; AFNElJ/axG149Ds5MWBY8zFfULpReYsV6IIp+xV/887mv8SiaqRUSfGDlTK25n5KLEQXVC+oImd23i0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzIbI35cjHaTiiS+cQH3KH4V6vX980olGNvzwP33foXp7OpWkK
	qhk39wQ8O/1Ud+StTiLIDNzLUAZxyNP4QuUqnRLz9NIyoN3fDJeW88/MQdMPgnEH0Crjehf0KOe
	EpfSBN0iqQiBEV2GHX+67ix1tlZbYY06I2uSqQA9MbohQGdwCLLt9e1PVsQIwmPS4
X-Gm-Gg: Acq92OGGt/XkMwJxV1UZeksZQJqpM31c42h0WYS9dJvZq7EijeGCwgEMZ44Zzdm9wjg
	OT/IzxYk5YCDiVQGYLUKemXK8gQdMICZdAMW/d12+CrgwMQS6L+ANHI4HdMgRnb/simJLU74XOu
	ZPvtG3NqgSxZxcRNGFBXH7zoz6QjI57VdYNQPW+0xBXm/26S/0w9aYMUBsN3yHQMOiha3E1hwY6
	RBv/SNm0T6qm2XXhz9ddNTXGKqMb4vdL9iY5RwLDWGJ3iiXquZEwxkvjhAAD0L4pN/5ZFdzKIRJ
	NBi3z/74xCKHP+jEd1FbiY6p3MA7ZcePE4mOY/EORckC5zlWSkdg2WCvmiC8Jr67jos2dP9u8kP
	nleep2RzGrRNme/sxzYgilqtyfyeP0Mb+d6eVXl5JUZNYxf3mt7GvVPAOqh6ExNCYmi3npUkjfI
	UslsqOFg==
X-Received: by 2002:a05:7301:fa0b:b0:2cf:3de7:22ad with SMTP id 5a478bee46e88-303986a6856mr10450885eec.27.1779294429127;
        Wed, 20 May 2026 09:27:09 -0700 (PDT)
X-Received: by 2002:a05:7301:fa0b:b0:2cf:3de7:22ad with SMTP id 5a478bee46e88-303986a6856mr10450814eec.27.1779294428468;
        Wed, 20 May 2026 09:27:08 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e3c0sm24600310eec.3.2026.05.20.09.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 09:27:07 -0700 (PDT)
Message-ID: <bc3eb187-d0a4-40ce-b72c-1724b33e28ea@oss.qualcomm.com>
Date: Wed, 20 May 2026 09:27:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/16] firmware: qcom: Add OP-TEE PAS service support
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260518072856.22790-1-sumit.garg@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260518072856.22790-1-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE2MCBTYWx0ZWRfXzyVOtuTFvBzo
 vKmwQM2fGTUyIDY0lHbnmeyaATSUWkKycXx9NVteD7h0ihRrxwd6lp4ielH+vz1Z7DSk788MhhT
 TGodl0fJxzixLxmyVU9RJhJr2taiJbo91XI6hNdt9uCNVl0/gb/S8NYQYi51AaUBSw/MI5LXK/0
 kIaIeYHsFu+vqGt8wgLHl5rAKnZOzTcXBbI/LaDq2DkBiu2W9kGrHlJP66Izv2lnCu8m/EjW9Q4
 LkcCqKlTXFeSID1hesD44/DiTYVKMBswIVu54U1Vj3WXmqRbRTW9wyG5/92c7R8mDt/b135PCGT
 O+ADHhSnHOwUwCtpd4Ddah6u35xOiP6gjM0EXocldV5Py8FZdN9PulATC4iiSFtLFiZLuJvnFQz
 J7U/DQLPW+gzSjxbZ2ec+UA45L172aZ/XHRcJ92JmSAy6ZmO9ot8JPFLKXSnDnRtp49OihMk7Yo
 2w7GuV65xO3N80pka8A==
X-Authority-Analysis: v=2.4 cv=QshuG1yd c=1 sm=1 tr=0 ts=6a0de0de cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rrczaL3BcTaDGf8zvC4A:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 4WNzTDnhoox_PQvgaX10dMhTHalJiElY
X-Proofpoint-ORIG-GUID: 4WNzTDnhoox_PQvgaX10dMhTHalJiElY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_092711_520477_E1EC825A 
X-CRM114-Status: GOOD (  35.43  )
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

On 5/18/2026 12:28 AM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Qcom platforms has the legacy of using non-standard SCM calls
> splintered over the various kernel drivers. These SCM calls aren't
> compliant with the standard SMC calling conventions which is a
> prerequisite to enable migration to the FF-A specifications from Arm.
> 
> OP-TEE as an alternative trusted OS to Qualcomm TEE (QTEE) can't
> support these non-standard SCM calls. And even for newer architectures
> using S-EL2 with Hafnium support, QTEE won't be able to support SCM
> calls either with FF-A requirements coming in. And with both OP-TEE
> and QTEE drivers well integrated in the TEE subsystem, it makes further
> sense to reuse the TEE bus client drivers infrastructure.
> 
> The added benefit of TEE bus infrastructure is that there is support
> for discoverable/enumerable services. With that client drivers don't
> have to manually invoke a special SCM call to know the service status.
> 
> So enable the generic Peripheral Authentication Service (PAS) provided
> by the firmware. It acts as the common layer with different TZ
> backends plugged in whether it's an SCM implementation or a proper
> TEE bus based PAS service implementation.
> 
> The TEE PAS service ABI is designed to be extensible with additional API
> as PTA_QCOM_PAS_CAPABILITIES. This allows to accommodate any future
> extensions of the PAS service needed while still maintaining backwards
> compatibility.
> 
> Currently OP-TEE support is being added to provide the backend PAS
> service implementation which can be found as part of this PR [1].
> This implementation has been tested on Kodiak/RB3Gen2 board with lemans
> EVK board being the next target. In addition to that WIN/IPQ targets
> planning to use OP-TEE will use this service too. Surely the backwards
> compatibility is maintained and tested for SCM backend.
> 
> Note that kernel PAS service support while running in EL2 is at parity
> among OP-TEE vs QTEE. Especially the media (venus/iris) support depends
> on proper IOMMU support being worked out on the PAS client end.
> 
> Patch summary:
> - Patch #1: adds Kodiak EL2 overlay since boot stack with TF-A/OP-TEE
>   only allow UEFI and Linux to boot in EL2.
> - Patch #2: adds generic PAS service.
> - Patch #3: migrates SCM backend to generic PAS service.
> - Patch #4: adds TEE/OP-TEE backend for generic PAS service.
> - Patch #5-#14: migrates all client drivers to generic PAS service.
> - Patch #15: drops legacy PAS SCM exported APIs.
> 
> The patch-set is based on v7.1-rc4 tag and can be found in git tree here
> [2].
> 
> Merge strategy:
> 
> It is expected due to APIs dependency, the entire patch-set to go via
> the Qcom tree. All other subsystem maintainers, it will be great if I
> can get acks for the corresponding subsystem patches.
> 
> [1] https://github.com/OP-TEE/optee_os/pull/7721 (already merged)
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/sumit.garg/linux.git/log/?h=qcom-pas-v6
> 
> ---
> Changes in v6:
> - Rebased to v7.1-rc4 tag.
> - Patch #14: fixed ret error print.
> - Add Kconfig descriptions for PAS symbols such that they are visible
>   in menuconfig to update.
> 
> Changes in v5:
> - Incorporated misc. comments from Mukesh.
> - Split up patch #11 into 2 to add an independent commit for passing
>   proper PAS ID to set_remote_state API.
> - Picked up tags.
> 
> Changes in v4:
> - Incorporate misc. comments on patch #4.
> - Picked up an ack for patch #10.
> - Clarify in cover letter about state of media support.
> 
> Changes in v3:
> - Incorporated some style and misc. comments for patch #2, #3 and #4.
> - Add QCOM_PAS Kconfig dependency for various subsystems.
> - Switch from pseudo TA to proper TA invoke commands.
> 
> Changes in v2:
> - Fixed kernel doc warnings.
> - Polish commit message and comments for patch #2.
> - Pass proper PAS ID in set_remote_state API for media firmware drivers.
> - Added Maintainer entry and dropped MODULE_AUTHOR.
> 
> Mukesh Ojha (1):
>   arm64: dts: qcom: kodiak: Add EL2 overlay
> 
> Sumit Garg (15):
>   firmware: qcom: Add a generic PAS service
>   firmware: qcom_scm: Migrate to generic PAS service
>   firmware: qcom: Add a PAS TEE service
>   remoteproc: qcom_q6v5_pas: Switch over to generic PAS TZ APIs
>   remoteproc: qcom_q6v5_mss: Switch to generic PAS TZ APIs
>   soc: qcom: mdtloader: Switch to generic PAS TZ APIs
>   remoteproc: qcom_wcnss: Switch to generic PAS TZ APIs
>   remoteproc: qcom: Select QCOM_PAS generic service
>   drm/msm: Switch to generic PAS TZ APIs
>   media: qcom: Switch to generic PAS TZ APIs
>   media: qcom: Pass proper PAS ID to set_remote_state API
>   net: ipa: Switch to generic PAS TZ APIs
>   wifi: ath12k: Switch to generic PAS TZ APIs
>   firmware: qcom_scm: Remove SCM PAS wrappers
>   MAINTAINERS: Add maintainer entry for Qualcomm PAS TZ service
> 
>  MAINTAINERS                                   |   9 +
>  arch/arm64/boot/dts/qcom/Makefile             |   2 +
>  arch/arm64/boot/dts/qcom/kodiak-el2.dtso      |  35 ++
>  drivers/firmware/qcom/Kconfig                 |  21 +-
>  drivers/firmware/qcom/Makefile                |   2 +
>  drivers/firmware/qcom/qcom_pas.c              | 291 +++++++++++
>  drivers/firmware/qcom/qcom_pas.h              |  50 ++
>  drivers/firmware/qcom/qcom_pas_tee.c          | 476 ++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.c              | 302 ++++-------
>  drivers/gpu/drm/msm/Kconfig                   |   1 +
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   4 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  11 +-
>  drivers/media/platform/qcom/iris/Kconfig      |  25 +-
>  .../media/platform/qcom/iris/iris_firmware.c  |   9 +-
>  drivers/media/platform/qcom/venus/Kconfig     |   1 +
>  drivers/media/platform/qcom/venus/firmware.c  |  11 +-
>  drivers/net/ipa/Kconfig                       |   2 +-
>  drivers/net/ipa/ipa_main.c                    |  13 +-
>  drivers/net/wireless/ath/ath12k/Kconfig       |   2 +-
>  drivers/net/wireless/ath/ath12k/ahb.c         |  10 +-
>  drivers/remoteproc/Kconfig                    |   4 +-
>  drivers/remoteproc/qcom_q6v5_mss.c            |   5 +-
>  drivers/remoteproc/qcom_q6v5_pas.c            |  51 +-
>  drivers/remoteproc/qcom_wcnss.c               |  12 +-
>  drivers/soc/qcom/mdt_loader.c                 |  12 +-
>  include/linux/firmware/qcom/qcom_pas.h        |  43 ++
>  include/linux/firmware/qcom/qcom_scm.h        |  29 --
>  include/linux/soc/qcom/mdt_loader.h           |   6 +-
>  28 files changed, 1119 insertions(+), 320 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso
>  create mode 100644 drivers/firmware/qcom/qcom_pas.c
>  create mode 100644 drivers/firmware/qcom/qcom_pas.h
>  create mode 100644 drivers/firmware/qcom/qcom_pas_tee.c
>  create mode 100644 include/linux/firmware/qcom/qcom_pas.h
> 

In my automation I do bisection builds and it fails when I bisect.

At "remoteproc: qcom_q6v5_mss: Switch to generic PAS TZ APIs":

../drivers/remoteproc/qcom_q6v5_pas.c: In function 'qcom_pas_load':
../drivers/remoteproc/qcom_q6v5_pas.c:244:44: error: passing argument 1 of 'qcom_mdt_pas_load' from incompatible pointer type [-Wincompatible-pointer-types]
  244 |                 ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
      |                                         ~~~^~~~~~~~~~~~~
      |                                            |
      |                                            struct qcom_pas_context *
In file included from ../drivers/remoteproc/qcom_q6v5_pas.c:27:
../include/linux/soc/qcom/mdt_loader.h:23:52: note: expected 'struct qcom_scm_pas_context *' but argument is of type 'struct qcom_pas_context *'
   23 | int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
../drivers/remoteproc/qcom_q6v5_pas.c: In function 'qcom_pas_start':
../drivers/remoteproc/qcom_q6v5_pas.c:322:36: error: passing argument 1 of 'qcom_mdt_pas_load' from incompatible pointer type [-Wincompatible-pointer-types]
  322 |         ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
      |                                 ~~~^~~~~~~~~
      |                                    |
      |                                    struct qcom_pas_context *
../include/linux/soc/qcom/mdt_loader.h:23:52: note: expected 'struct qcom_scm_pas_context *' but argument is of type 'struct qcom_pas_context *'
   23 | int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
make[5]: *** [../scripts/Makefile.build:289: drivers/remoteproc/qcom_q6v5_pas.o] Error 1


At "remoteproc: qcom_q6v5_pas: Switch over to generic PAS TZ APIs":

../drivers/remoteproc/qcom_q6v5_pas.c: In function 'qcom_pas_load':
../drivers/remoteproc/qcom_q6v5_pas.c:244:44: error: passing argument 1 of 'qcom_mdt_pas_load' from incompatible pointer type [-Wincompatible-pointer-types]
  244 |                 ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
      |                                         ~~~^~~~~~~~~~~~~
      |                                            |
      |                                            struct qcom_pas_context *
In file included from ../drivers/remoteproc/qcom_q6v5_pas.c:27:
../include/linux/soc/qcom/mdt_loader.h:23:52: note: expected 'struct qcom_scm_pas_context *' but argument is of type 'struct qcom_pas_context *'
   23 | int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
../drivers/remoteproc/qcom_q6v5_pas.c: In function 'qcom_pas_start':
../drivers/remoteproc/qcom_q6v5_pas.c:322:36: error: passing argument 1 of 'qcom_mdt_pas_load' from incompatible pointer type [-Wincompatible-pointer-types]
  322 |         ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
      |                                 ~~~^~~~~~~~~
      |                                    |
      |                                    struct qcom_pas_context *
../include/linux/soc/qcom/mdt_loader.h:23:52: note: expected 'struct qcom_scm_pas_context *' but argument is of type 'struct qcom_pas_context *'
   23 | int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
make[5]: *** [../scripts/Makefile.build:289: drivers/remoteproc/qcom_q6v5_pas.o] Error 1


This is because the 5/16 patch depends upon changes in the 7/16 patch.

/jeff

