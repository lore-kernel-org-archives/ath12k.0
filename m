Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8874FF8867
	for <ath12k@archiver.kernel.org>; Wed, 29 Apr 2026 07:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rpnLGvqaOGowhqbh0BhtKXXRxHvBmmvOGqR1wADwXo8=; b=egzo6s8IuzFKEBAVKLPPNEeG4H
	FQpXAqA0tu3RX6c6KaPtDL1qEYA0Kq0kUwyC1MKGUyhTxUmgsAG6X11KZM35nPcFKODuwRqLeBBKk
	Xo2mSDkMSxvhE9VPKnHmNN3Icn5Nq+b5x95/3DJeNsDf6C3E51+LKpHHZt+xwgBOO9y87BNpSR6C1
	4cU1H/5vJj/59K7dn3g0kd3Qz6hlpEuFr/slRWraRH1kGaY40GZqW3T6BHgAibew9x/1eJmX80sCJ
	hA2GBp5qAGleSmIdW11WmIRZ2ABUUVL0XV1wdBPIgSEmjaCeutq9FWvJa8sWvVslIi9Iwf/5EfTaH
	7iSycEBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHytw-000000035mj-0x6a;
	Wed, 29 Apr 2026 07:00:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyto-000000035dl-3rdK
	for ath12k@bombadil.infradead.org;
	Wed, 29 Apr 2026 06:59:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rpnLGvqaOGowhqbh0BhtKXXRxHvBmmvOGqR1wADwXo8=; b=lKwavZ0caTwaV2xtINVRVeupSj
	UbtV9J/U+oF7Vnl4ioRKFSeQLWM6K0XUuEPoU7Co24OjhOOyNdEOX0eduNpjJemRfsar6b0bbarBP
	loROMJ+PIQWzUM0K2rX375ppgzwsCT43HD+sywE81SJ5nmorL4NFBzqtGLxNvOd9tZcJhEXYEPHf1
	PvIr6T/okXCPRqwn7ooDEWdZm/yfWC50iXEmMMn3gF73sgOy1C704/mrkjEdjKcBLb3elSEyJtINA
	51YISw0VMOTgPuumm89msJ6LFSXCWJIuJARiJWHdKQ0HrMC//3v0HhEkqCsKvStn5XXxPyAHELhei
	Iw5fgyfg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyth-00000004i55-2gOm
	for ath12k@lists.infradead.org;
	Wed, 29 Apr 2026 06:59:54 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T6F2nP1282806
	for <ath12k@lists.infradead.org>; Wed, 29 Apr 2026 06:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rpnLGvqaOGowhqbh0BhtKXXR
	xHvBmmvOGqR1wADwXo8=; b=g438JSkanjOpVQqT4BPx3R6bpd1VJbbmWFD6dKOd
	jFfFB+w7o2BFIQkM8DUi3dk+eLi2MmG2yFu2mvJoaVjZRpuKpKC8SOHGN1T4k6HZ
	eH9ZrtpUlQslZMlhYlYVUFi72Xrodhf1bXWVnE64mFiuiPhsLVRgk76DPLSLdQOe
	3wpSPbqj+929j7SchNlWiT/Mvmx2f3w9te7+sxffPyvR3SZ4QpMR9dvdKxnbHoHd
	r/5cgF5H5psWIcz6rpRnrZ7KiVHDlYy0AVG7IKRCWWDzx4ABdZYlug/nS7Nc/tDD
	/Al6A+BepM0Qxu+178Yh7cY8Ecg/Vm71wutdCwmhxrioxQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj8058w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Apr 2026 06:59:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b7aba0af02so60398505ad.2
        for <ath12k@lists.infradead.org>; Tue, 28 Apr 2026 23:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777445983; x=1778050783; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rpnLGvqaOGowhqbh0BhtKXXRxHvBmmvOGqR1wADwXo8=;
        b=WGyjRCz062FTWyFVZ6E3hQnEnuXFf6q0nkIOxLOTk9hbnZ6HCi1gwbh0OFIUblqvFh
         PolhJB7bI98AcFNcy3wRSA0YSEcH1Mu6S+hFmxhm3bA3WE0nMAUVWOis7q3qchAM3gI4
         vb/MG4WBOyvg02scIDG+fGgOmsZv7o9iH7QsUPWXvLIargUwog3f1fOyRLUKOQUsrEdU
         6yn62r5aoLr/FgHSuEmO9YaE1zKm2Vz+Nu3TQ8adV1qZ8uLzp2S5H05qzeaUNV09G+BP
         AtxMF/RWkTe5A7SXEkhguU4hdFk2YOz+U+w7UeUDatAPs2xXDvvn7ia8iLYFv6823Dkm
         IGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445983; x=1778050783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rpnLGvqaOGowhqbh0BhtKXXRxHvBmmvOGqR1wADwXo8=;
        b=UbYWuaVvsGVDXGEx+bA5QRpsi4mZrmKL01+6ZstFBuaRK/nJ8rwpGUxOWEUxJZdGjS
         XwH7S6ejCUUu84QpvO3YPZ5d0PRok9CGzARci2BNRZ6FKC7ILGqPpmMMeb+4nrqVP58J
         /c28RKEynDi5TZcLQtobobJMeHSQMiljKHQShK8AVaKk79qjYdPuWZgjY0xSQ6IBF09h
         ezWSfE1QNgNjiH5XvghrnG7R9S6pXeScWDfKvXB8U1JHmiyUw5+pwXMnJv4cvSG79EAj
         J0jcjzrPz3iwV/i7Csv1R23gbIyM+Gu4IyVDntsWyX8wleiigVNNErUP8qwVwF3zOhsX
         k+rQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7cdPkdtlTzbW15XTwpesHhtpacr4YXz7AO6z8q2aBisKYLgxqI1romX0QSG6FDHhNaCYnikQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzIlqSrP5eZRnPzIj9Yr5FZJxecTOIAmIQehwNhCGcwLgPxvu8F
	1Jk9OqA0qAYZekfiVEPRhac+X16DnlVKyOohgaQRkKEOykqvI4OwO1gtT4w2wfFE3Dw41Nw+lq7
	Icoja/lNpwlVBi+TOy/hpxvOZsPhmHE9HPqK3OjSpLwKBfAJmBgP0YIE9gxUo7Mio
X-Gm-Gg: AeBDieuh4Qx8V9GrPw7HVyHuEhA8QMhn0DButc+9DnGApnBTeu6LVb//IgGAjfmAKU5
	Y1e3EF6w0u110RCPXK/t6lArVWKZBpkq9/5XxxL1xA3jCwgR3BpbOF75NdwuF623hf2Gj27ew/5
	LzW6BvfaRLTJxtTq88QsHuXdNx2FW+l/owFfsmlgo0ieubtvbVScemAGQi80Qm5GIUNTBD5Wlzx
	qFHUd02v/r/kMK+r764YtQ7iD2R15VlDK3bA8oh8bRtX+YyIbtx765uvuS4Z0xces3IwBcozxI1
	Pnai96EAE5zvvbf5ZZzgGlBop1SgYMvW1X0gWVzpibJxOqch1+H/qEPi+fHpZKXLLe1lkUgpV8d
	K4/xQmHSIpKcFa+wFqW8Ycu5ybpKBZf6j2uTF1tG9pNCL0I4C02/aCGkXGbY=
X-Received: by 2002:a17:903:984:b0:2b2:ec31:25b0 with SMTP id d9443c01a7336-2b98741da0dmr24709195ad.29.1777445983174;
        Tue, 28 Apr 2026 23:59:43 -0700 (PDT)
X-Received: by 2002:a17:903:984:b0:2b2:ec31:25b0 with SMTP id d9443c01a7336-2b98741da0dmr24708625ad.29.1777445982436;
        Tue, 28 Apr 2026 23:59:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988971938sm11669805ad.71.2026.04.28.23.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:59:42 -0700 (PDT)
Date: Wed, 29 Apr 2026 12:29:26 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v4 00/15] firmware: qcom: Add OP-TEE PAS service support
Message-ID: <20260429065926.5iliebd3d2j6bong@hu-mojha-hyd.qualcomm.com>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427095603.1157963-1-sumit.garg@kernel.org>
X-Proofpoint-ORIG-GUID: 6Mo_ADHtBv9Dr5sdymlSwL51pTOz7eQ6
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f1ac60 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IpgJVh4PXWExouJfQAQA:9
 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 6Mo_ADHtBv9Dr5sdymlSwL51pTOz7eQ6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA2NyBTYWx0ZWRfXwWvL7jxFIGbM
 glAvPv6tHKB3xQx6c1LFzf0xCRlSDv/a40WN4q58sFsY6q0ZBjSuzPAEYKugtQLcLqOTqRBHDIM
 OUDlAs/GM1a8+mxGHniRsFlL00qtSbzWPyAY+qc0Gh4f756ML8mslJw9XPe+iTPcJZZ/hk/WQuK
 P+DvqwMgIjndY4f5XSJZrDQSyaGxe0jEXfT6meuJffp/ZBNXJyXl2v6wIM8Kej9B7N4/1/m6QZj
 b6Yd2gMbXLbOBDue06nmcNN77Ryz584E4ciHGTugE3ozxZ4vGqRWgyjslvXT0WqUz/P5d/iQbgT
 hLKeHZXY8PkDXkkZFgI5U6S0ses0JJ3stIMCuyzQRoI6c6Ikf0hq50XRATxk7nhSzixMwnqhGFa
 XSPR3pTtUPHX2bVkISz3LZcSHq2rU2ZWdQzb9jwATuwzeGk/AG1fAv1fOWXmyQ/Rz8pV3euC0Gm
 lCQd2c3/GeVf0YOycbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_075952_269094_5298EE91 
X-CRM114-Status: GOOD (  33.91  )
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

On Mon, Apr 27, 2026 at 03:25:48PM +0530, Sumit Garg wrote:
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
> - Patch #5-#13: migrates all client drivers to generic PAS service.
> - Patch #14: drops legacy PAS SCM exported APIs.


Gave it a try to test the series on Lemans with Gunyah as well as KVM
hypervisor and all the remote processor are coming up successfully.

Feel free to carry 

Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans

for the Series.


> The patch-set is based on v7.1-rc1 tag and can be found in git tree here
> [2].
> 
> Merge strategy:
> 
> It is expected due to APIs dependency, the entire patch-set to go via
> the Qcom tree. All other subsystem maintainers, it will be great if I
> can get acks for the corresponding subsystem patches.
> 
> [1] https://github.com/OP-TEE/optee_os/pull/7721
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/sumit.garg/linux.git/log/?h=qcom-pas-v4
> 
> ---
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
> Sumit Garg (14):
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
>   net: ipa: Switch to generic PAS TZ APIs
>   wifi: ath12k: Switch to generic PAS TZ APIs
>   firmware: qcom_scm: Remove SCM PAS wrappers
>   MAINTAINERS: Add maintainer entry for Qualcomm PAS TZ service
> 
>  MAINTAINERS                                   |   9 +
>  arch/arm64/boot/dts/qcom/Makefile             |   2 +
>  arch/arm64/boot/dts/qcom/kodiak-el2.dtso      |  35 ++
>  drivers/firmware/qcom/Kconfig                 |  19 +
>  drivers/firmware/qcom/Makefile                |   2 +
>  drivers/firmware/qcom/qcom_pas.c              | 288 +++++++++++
>  drivers/firmware/qcom/qcom_pas.h              |  50 ++
>  drivers/firmware/qcom/qcom_pas_tee.c          | 479 ++++++++++++++++++
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
>  drivers/net/wireless/ath/ath12k/ahb.c         |   8 +-
>  drivers/remoteproc/Kconfig                    |   1 +
>  drivers/remoteproc/qcom_q6v5_mss.c            |   5 +-
>  drivers/remoteproc/qcom_q6v5_pas.c            |  51 +-
>  drivers/remoteproc/qcom_wcnss.c               |  12 +-
>  drivers/soc/qcom/mdt_loader.c                 |  12 +-
>  include/linux/firmware/qcom/qcom_pas.h        |  43 ++
>  include/linux/firmware/qcom/qcom_scm.h        |  29 --
>  include/linux/soc/qcom/mdt_loader.h           |   6 +-
>  28 files changed, 1115 insertions(+), 317 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso
>  create mode 100644 drivers/firmware/qcom/qcom_pas.c
>  create mode 100644 drivers/firmware/qcom/qcom_pas.h
>  create mode 100644 drivers/firmware/qcom/qcom_pas_tee.c
>  create mode 100644 include/linux/firmware/qcom/qcom_pas.h
> 
> -- 
> 2.51.0
> 

-- 
-Mukesh Ojha

