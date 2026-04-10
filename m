Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EA4F36B9A
	for <ath12k@archiver.kernel.org>; Fri, 10 Apr 2026 02:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8LFRB1+qa/rVpB3l/gPOxAnBKDyxBu7U/jEIYuF4X4g=; b=vVfkzHIDM7UlfpZdlYO++FNoDQ
	/px3cishnducB9ruFgOB3FDUXHSGaour0Eo80/Olb1PgVY6JIBxa9NSDzxhXATatovLJZfIPrRSMx
	tYqMiSFuMoUxYQnor4ViQWMVAil3+XHqIjEThVskqPZ5FK+vfnoGiMEX8lT16S+Zw9XeeF2Pye3Gx
	49QYDxSzxToUiK13i2nKIbwg/+1AZMzyBp0jJV8/dFvmCONnaG5XcLxFiBnV8yfXUZPD4SWAFPiro
	YgublS144ny+LHHhOaVLYt6Ee/e6TCL16U/qq7Irp2iwhvpJ4++z5EbZuZ6L9Da2Fdad4dB9IUgBe
	QmEFo4xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB1kC-0000000BTzL-26q5;
	Fri, 10 Apr 2026 02:37:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB1kA-0000000BTyv-0ePf
	for ath12k@lists.infradead.org;
	Fri, 10 Apr 2026 02:37:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639IUD39779768
	for <ath12k@lists.infradead.org>; Fri, 10 Apr 2026 02:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8LFRB1+qa/rVpB3l/gPOxAnBKDyxBu7U/jEIYuF4X4g=; b=K4RB1NEM3qIs43CE
	bJbTuiEtTzH4utVNQhvuZPQOuuJrGdpHzfGWGvhXr0gGCYseYMDaUGpCIRh24zd+
	tSNci5emHO7OUmyUAvYFpedWuW4WMSloMVccPu8qiheuy4Hby2rK4xYpvWAN55u9
	DQDb4y93ON0c7rNBRj/ur+dZXS/mG4Pc/aPvd58tfYHn1u0jMMks5pO3MOGQrkVX
	0PU26CcUBS3emO4Gra2F4qtJhZWxh4tCmucAyjSH5RcbCExnxfX4pVNZUjIZkRw7
	PfjegpBtH6WAipUZYPLIKqCrhz1mL+kPjzLavygBTtrTcgH5KEk4LE9c699g5XGR
	CcYXOA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec8htmve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 10 Apr 2026 02:37:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35dacc40f92so1778887a91.2
        for <ath12k@lists.infradead.org>; Thu, 09 Apr 2026 19:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775788632; x=1776393432; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8LFRB1+qa/rVpB3l/gPOxAnBKDyxBu7U/jEIYuF4X4g=;
        b=BLKs8eY2KzMwt/oIFwD0A7TAXRUlCNXfToicJ5rpAKd48vLBIfD/yd2xtJmCSeAFuq
         qif6ZClCsk5hMEDez4xWePq0BerTrUWKtzkMb73GEY4SvYhd4X0D1gfG6s8PgmGeXei0
         h326Mmn++tAZxcsd88gYvZqbqY2NcA2a8UQoXJaBlZwCxQTWURvmtprjicnjQZf7yBrQ
         /gaDuE7qErs2dHzNxcw7XoaxV9B7+uTtlc3MoGnzYHUaQGMMkQbqvu4AQbQ5b0Jsstjk
         EtkiGlge+makbpjhxLhFlJU6V5PoApfKBp/dZOAeCho25zAQYaAkuH35OU+kVBg3Kds1
         Wedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775788632; x=1776393432;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8LFRB1+qa/rVpB3l/gPOxAnBKDyxBu7U/jEIYuF4X4g=;
        b=Qyohf4OUbEqhFpvD1sZqADEb2ewPnNpyxG63ROD754MmKoXyQmttkxA1+r3cvlIZ8X
         8ZzY5BSQJKNnRWBrhaAdMOLqoVLtnrTJUhHMFR7KWiD1lDyhqfDzDV6kyBf68hU7uw2w
         VXSS58W0pnogwi4xVle3gHo8mCsCySqoGnXcMIymjVCADsCXXe7mforGgC8+UEtnut2X
         CDJeiofxgs36ZvBph9IMtb7pv+Rdab7EPvVm0LZjRSo6MWhmSWMnK8qhxoRE11EFQy94
         DhrY60/hxRq9DWeFb2HCxLz/zjPp5r56R7KxSq8Cpgy41Z5lYvLIyW/9a/0DmhjxX2GK
         /NKg==
X-Forwarded-Encrypted: i=1; AJvYcCXS59Gfz4Mt7qgzJLjP9hSk2VyJJt0jnMrIkIKfDwzGilylQuQpdNLaLBFJSeOwJK28ZJjMUJ4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzoZMOyssI3tVPzJj0OzKGuGHeMQqpx05UOJ++YXg9Hjwrx4tal
	7d0ZnG/YiIPaxEUKc7W201NXDYc7CjOQQPlNuojtH8itvI8H3MvkGPr6SnlLekj+HKsJdER6jVk
	RaTwDkfjfHxE5lQjA5jpOzp8brnCY9+O1OVWlIBGW3Q76G6y4zeZcdr2wSyMHZZJ2
X-Gm-Gg: AeBDiet1cbgQ+CBBkHJzYXIiDJDA74v1pT5gqS2vu/HkBvEBOPtludANYkC0FMqVcXT
	/mDRWZLyOjdenxlMcJ9Pcm8den8O2XH69OZrxv6wH16UKyNdhTpRiu884O9PyoLDozEuBP2sHxD
	JtdbMhDUb3HCuuCNGNYDxRMA4JjetPDANiDAPnDZx6GSPS7VP+rTtRnuEu/0sh72LkE5+/zUJNx
	gxxmFOC5nVn5xhXncyuVlkDHJobZTdUuCt8GRafKmCSRZuvSxpGhM3UuYoqxydlMFnYtatAHinU
	kXP3M/SAfIiiwapRhcJ8mZDbIlKe2ZEASeXQvTg8iHRL1cNd89pKq8dzau1+pRntWgLKseF72wb
	HM71J5ImSc0zdyIRvTVtT7C2NYCse7F4fynvVBjoizZR9LJCmLM0nTD/CpabAp87T9NE4RGEo3g
	RaF+wURMl7yZsjQ6rW8UE=
X-Received: by 2002:a17:90b:350b:b0:35d:a2d3:5c44 with SMTP id 98e67ed59e1d1-35e428581f9mr1352690a91.28.1775788632407;
        Thu, 09 Apr 2026 19:37:12 -0700 (PDT)
X-Received: by 2002:a17:90b:350b:b0:35d:a2d3:5c44 with SMTP id 98e67ed59e1d1-35e428581f9mr1352672a91.28.1775788631925;
        Thu, 09 Apr 2026 19:37:11 -0700 (PDT)
Received: from [10.133.33.204] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e42e0abaesm292036a91.3.2026.04.09.19.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 19:37:11 -0700 (PDT)
Message-ID: <5562f00b-8d84-4b7d-8a2a-95f805a44025@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 10:37:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/5] wifi: ath12k: thermal throttling and cooling
 device support
To: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260331142446.2951809-1-maharaja.kennadyrajan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260331142446.2951809-1-maharaja.kennadyrajan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PMM/P/qC c=1 sm=1 tr=0 ts=69d86259 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ZeLpQyFM_iFLYNy5nMIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: EAI7Og9yxcuz5i-THkQ0NkFSF8kRawdq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAyMiBTYWx0ZWRfX7adHV8FzBzw1
 vdDWOifOzKy+pAad4E1wRzi5kxEDf66gCJeZAVTgloV463tiYIE9UgUYOP0P42KVkZYChP9ldnr
 RGYpJhn6kGM6O6X/fLCGYyn1xCpncX74JZM6UFgpvWLlPm45d1WITjg0rtYGuHNGWMP6BCvOw7F
 zQZakwc1FOipxj8PVP97l+riM4hKXk+PyQkaVasHpkZfua93SEruG+SgSzy9dqBCyM42wquJh/G
 gCWaI7nW3QKCgI+LI6hR1qSuLp8QWEJa0GR1D9dRRFEpv4t0rK7a8JRoijrpC7zCcCsoMrPPltg
 ytEExfyxrENEUIf2qHvRI8W2Ac/H+5nhL7JjY0oY6eA4FfZ5lrPHzjbuUYKZ4AnutwOk0DAR2Lz
 i7x+gf2LSVr2amWlZwInhC4EgcdQW4dHrg5Jx2QYwqEBc7ustf3ac6BB4eBcnl5ntN2dM2KtkS5
 PB2mdDbaxCfUNyP/BBg==
X-Proofpoint-GUID: EAI7Og9yxcuz5i-THkQ0NkFSF8kRawdq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_193714_204513_C463C0FC 
X-CRM114-Status: GOOD (  12.84  )
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



On 3/31/2026 10:24 PM, Maharaja Kennadyrajan wrote:
> Patch 1 handles the firmware stats event so we can track the current
> temperature and throttle level per pdev without spamming logs.
> 
> Patch 2 enables thermal throttling at bring-up and programs default level
> tables to firmware via WMI_THERM_THROT_SET_CONF_CMDID; the driver picks
> IPA/XFEM defaults based on the firmware WMI service bitmap, supports 4 or 5
> levels as advertised, and only fills optional fields (pout reduction,
> tx chain mask) when the corresponding WMI service bits are present.
> 
> Patch 3 refactors per-radio thermal hwmon cleanup to reduce code duplication and
> ensure consistent cleanup across thermal register and unregister paths.
> 
> Patch 4 reorders the group teardown logic symmetric for safe thermal sysfs cleanup.
> 
> Patch 5 exposes a thermal cooling device per radio so the kernel thermal
> framework or userspace can set the TX duty-cycle off percentage; writes
> are validated against the throttling state range and host state is kept in
> sync with successful firmware updates.
> 
> Examples:
> echo 40 > /sys/devices/pci0000:00/0000:00:1d.1/0000:58:00.0/ieee80211/phyX/cooling_device/cur_stat
> cat /sys/devices/pci0000:00/0000:00:1d.1/0000:58:00.0/ieee80211/phyX/cooling_device/cur_state
> cat /sys/devices/pci0000:00/0000:00:1d.1/0000:58:00.0/ieee80211/phyX/cooling_device/max_state
> 
> Maharaja Kennadyrajan (5):
>   wifi: ath12k: handle thermal throttle stats WMI event
>   wifi: ath12k: configure firmware thermal throttling via WMI
>   wifi: ath12k: refactor per-radio thermal hwmon setup and cleanup
>   wifi: ath12k: reorder group start/stop for safe thermal sysfs cleanup
>   wifi: ath12k: add thermal cooling device support
> 
>  drivers/net/wireless/ath/ath12k/core.c    |  50 +++--
>  drivers/net/wireless/ath/ath12k/mac.c     |   9 +
>  drivers/net/wireless/ath/ath12k/thermal.c | 252 ++++++++++++++++++----
>  drivers/net/wireless/ath/ath12k/thermal.h |  35 +++
>  drivers/net/wireless/ath/ath12k/wmi.c     | 107 +++++++++
>  drivers/net/wireless/ath/ath12k/wmi.h     |  50 +++++
>  6 files changed, 446 insertions(+), 57 deletions(-)
> 
> 
> base-commit: dbd94b9831bc52a1efb7ff3de841ffc3457428ce

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


